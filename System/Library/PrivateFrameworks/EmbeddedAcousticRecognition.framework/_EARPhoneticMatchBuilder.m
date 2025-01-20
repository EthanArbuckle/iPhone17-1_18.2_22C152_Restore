@interface _EARPhoneticMatchBuilder
+ (BOOL)writePlaceholderFstToPath:(id)a3;
+ (BOOL)writePlaceholderSymbolsToPath:(id)a3;
- (BOOL)buildAlignedLFst;
- (BOOL)buildGFsts;
- (BOOL)buildLFst;
- (BOOL)combineFsts;
- (BOOL)composeLGFsts;
- (BOOL)supportPhoneticMatchBuilding;
- (BOOL)writeAlignedLFstToPath:(id)a3;
- (BOOL)writeGFstsToDirectory:(id)a3;
- (BOOL)writeISymsToPath:(id)a3 asText:(BOOL)a4;
- (BOOL)writeIndividualLGFstsToDirectory:(id)a3;
- (BOOL)writeLFstToPath:(id)a3;
- (BOOL)writeLGFstToPath:(id)a3;
- (BOOL)writeMetadataToPath:(id)a3;
- (BOOL)writeOSymsToPath:(id)a3 asText:(BOOL)a4 quasarise:(BOOL)a5;
- (_EARPhoneticMatchBuilder)initWithModelRoot:(id)a3 jsonConfigFile:(id)a4 dataFeeds:(id)a5;
- (_EARPhoneticMatchBuilder)initWithModelRoot:(id)a3 jsonConfigFile:(id)a4 dataFeedsFile:(id)a5;
- (_EARPhoneticMatchBuilder)initWithNcsRoot:(id)a3 jsonConfigFile:(id)a4 dataFeeds:(id)a5;
- (_EARPhoneticMatchBuilder)initWithNcsRoot:(id)a3 jsonConfigFile:(id)a4 dataFeedsFile:(id)a5;
- (id).cxx_construct;
- (id)lFstName;
- (id)lgFstName;
- (id)osymsName;
- (shared_ptr<quasar::PMBuilder>)pmBuilder;
- (shared_ptr<quasar::TextTokenizer>)tokenizer;
- (void)buildGFsts;
- (void)reset;
@end

@implementation _EARPhoneticMatchBuilder

- (_EARPhoneticMatchBuilder)initWithModelRoot:(id)a3 jsonConfigFile:(id)a4 dataFeeds:(id)a5
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v27 = a3;
  id v25 = a4;
  id v28 = a5;
  v32.receiver = self;
  v32.super_class = (Class)_EARPhoneticMatchBuilder;
  v8 = [(_EARPhoneticMatchBuilder *)&v32 init];
  v26 = v8;
  if (!v8) {
    goto LABEL_31;
  }
  +[_EARQuasarTokenizer tokenizerWithModelRoot:v27];
  v24 = (uint64_t *)(v8 + 8);
  std::shared_ptr<quasar::TextTokenizer>::operator=[abi:ne180100]<quasar::TextTokenizer,std::default_delete<quasar::TextTokenizer>,void>((void *)v8 + 1, (uint64_t *)buf);
  v9 = *(void **)buf;
  *(void *)buf = 0;
  if (v9) {
    (*(void (**)(void *))(*(void *)v9 + 8))(v9);
  }
  id v10 = v28;
  unint64_t v30 = 0;
  unint64_t v31 = 0;
  uint64_t v29 = 0;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v33 objects:v48 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v34 != v13) {
          objc_enumerationMutation(v11);
        }
        id v15 = *(id *)(*((void *)&v33 + 1) + 8 * i);
        objc_msgSend(v15, "dataFeed", v24);
        quasar::DataFeed::DataFeed((quasar::DataFeed *)buf, v37);
        if (v38) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v38);
        }

        unint64_t v16 = v30;
        if (v30 >= v31)
        {
          uint64_t v17 = std::vector<quasar::DataFeed>::__push_back_slow_path<quasar::DataFeed>(&v29, (uint64_t)buf);
        }
        else
        {
          std::allocator<quasar::DataFeed>::construct[abi:ne180100]<quasar::DataFeed,quasar::DataFeed>((uint64_t)&v31, v30, (uint64_t)buf);
          uint64_t v17 = v16 + 160;
        }
        unint64_t v30 = v17;
        std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<quasar::PMRegexEnumerator>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<quasar::PMRegexEnumerator>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<quasar::PMRegexEnumerator>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<quasar::PMRegexEnumerator>>>>::~__hash_table((uint64_t)&v47);
        if (v46 < 0) {
          operator delete(__p);
        }
        v37 = (quasar::DataFeed *)&v44;
        std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v37);
        if (v43 < 0) {
          operator delete(v42);
        }
        v37 = (quasar::DataFeed *)buf;
        std::vector<quasar::DataFeedItem>::__destroy_vector::operator()[abi:ne180100]((void ***)&v37);
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v33 objects:v48 count:16];
    }
    while (v12);
  }

  if (v25)
  {
    v8 = v26;
    objc_msgSend(v25, "ear_toString");
  }
  else
  {
    *(void *)buf = 0;
    uint64_t v40 = 0;
    uint64_t v41 = 0;
    v8 = v26;
  }
  std::allocate_shared[abi:ne180100]<quasar::PMBuilder,std::allocator<quasar::PMBuilder>,std::string,std::shared_ptr<quasar::TextTokenizer> &,std::vector<quasar::DataFeed> &,void>((uint64_t)buf, v24, (uint64_t)&v29, v48);
  long long v18 = v48[0];
  v48[0] = 0uLL;
  v19 = (std::__shared_weak_count *)*((void *)v8 + 4);
  *(_OWORD *)(v8 + 24) = v18;
  if (v19)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v19);
    if (*((void *)&v48[0] + 1)) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v48[0] + 1));
    }
  }
  if (SHIBYTE(v41) < 0) {
    operator delete(*(void **)buf);
  }
  v20 = (quasar::PMBuilder *)*((void *)v8 + 3);
  if (v20 && (quasar::PMBuilder::getSupportPhoneticMatchBuilding(v20) & 1) != 0)
  {
    *(void *)buf = &v29;
    std::vector<quasar::DataFeed>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
LABEL_31:
    v21 = v8;
    goto LABEL_35;
  }
  v22 = EarPmLogger();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B1A86000, v22, OS_LOG_TYPE_DEFAULT, "Phonetic-match building is not supported", buf, 2u);
  }

  *(void *)buf = &v29;
  std::vector<quasar::DataFeed>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
  v21 = 0;
LABEL_35:

  return v21;
}

- (_EARPhoneticMatchBuilder)initWithModelRoot:(id)a3 jsonConfigFile:(id)a4 dataFeedsFile:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v22.receiver = self;
  v22.super_class = (Class)_EARPhoneticMatchBuilder;
  id v11 = [(_EARPhoneticMatchBuilder *)&v22 init];
  if (!v11)
  {
LABEL_18:
    unint64_t v16 = v11;
    goto LABEL_22;
  }
  +[_EARQuasarTokenizer tokenizerWithModelRoot:v8];
  std::shared_ptr<quasar::TextTokenizer>::operator=[abi:ne180100]<quasar::TextTokenizer,std::default_delete<quasar::TextTokenizer>,void>((void *)v11 + 1, (uint64_t *)buf);
  uint64_t v12 = *(void **)buf;
  *(void *)buf = 0;
  if (v12) {
    (*(void (**)(void *))(*(void *)v12 + 8))(v12);
  }
  if (!v9)
  {
    *(void *)buf = 0;
    uint64_t v24 = 0;
    uint64_t v25 = 0;
    if (v10) {
      goto LABEL_6;
    }
LABEL_8:
    __p[0] = 0;
    __p[1] = 0;
    uint64_t v20 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v9, "ear_toString");
  if (!v10) {
    goto LABEL_8;
  }
LABEL_6:
  objc_msgSend(v10, "ear_toString");
LABEL_9:
  std::allocate_shared[abi:ne180100]<quasar::PMBuilder,std::allocator<quasar::PMBuilder>,std::string,std::shared_ptr<quasar::TextTokenizer> &,std::string,void>((uint64_t)buf, (uint64_t *)v11 + 1, (uint64_t)__p, &v21);
  long long v13 = v21;
  long long v21 = 0uLL;
  v14 = (std::__shared_weak_count *)*((void *)v11 + 4);
  *(_OWORD *)(v11 + 24) = v13;
  if (v14)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v14);
    if (*((void *)&v21 + 1)) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v21 + 1));
    }
  }
  if (SHIBYTE(v20) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v25) < 0) {
    operator delete(*(void **)buf);
  }
  id v15 = (quasar::PMBuilder *)*((void *)v11 + 3);
  if (v15 && (quasar::PMBuilder::getSupportPhoneticMatchBuilding(v15) & 1) != 0) {
    goto LABEL_18;
  }
  uint64_t v17 = EarPmLogger();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B1A86000, v17, OS_LOG_TYPE_DEFAULT, "Phonetic-match building is not supported", buf, 2u);
  }

  unint64_t v16 = 0;
LABEL_22:

  return v16;
}

- (_EARPhoneticMatchBuilder)initWithNcsRoot:(id)a3 jsonConfigFile:(id)a4 dataFeeds:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [a3 stringByDeletingLastPathComponent];
  id v11 = [(_EARPhoneticMatchBuilder *)self initWithModelRoot:v10 jsonConfigFile:v8 dataFeeds:v9];

  return v11;
}

- (_EARPhoneticMatchBuilder)initWithNcsRoot:(id)a3 jsonConfigFile:(id)a4 dataFeedsFile:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [a3 stringByDeletingLastPathComponent];
  id v11 = [(_EARPhoneticMatchBuilder *)self initWithModelRoot:v10 jsonConfigFile:v8 dataFeedsFile:v9];

  return v11;
}

- (BOOL)supportPhoneticMatchBuilding
{
  return quasar::PMBuilder::getSupportPhoneticMatchBuilding((quasar::PMBuilder *)self->_pmBuilder.__ptr_);
}

- (BOOL)buildGFsts
{
  return quasar::PMBuilder::buildGFsts((quasar::PMBuilder *)self->_pmBuilder.__ptr_);
}

- (BOOL)buildLFst
{
  return quasar::PMBuilder::buildLFst((quasar::PMBuilder *)self->_pmBuilder.__ptr_);
}

- (BOOL)buildAlignedLFst
{
  return quasar::PMBuilder::buildAlignedLFst((quasar::PMBuilder *)self->_pmBuilder.__ptr_);
}

- (BOOL)composeLGFsts
{
  return quasar::PMBuilder::composeLGFsts((quasar::PMBuilder *)self->_pmBuilder.__ptr_);
}

- (BOOL)combineFsts
{
  return quasar::PMBuilder::combineFsts((quasar::PMBuilder *)self->_pmBuilder.__ptr_);
}

- (void)reset
{
}

- (BOOL)writeAlignedLFstToPath:(id)a3
{
  __p[3] = *(void **)MEMORY[0x1E4F143B8];
  id v4 = a3;
  ptr = self->_pmBuilder.__ptr_;
  if (v4) {
    objc_msgSend(v4, "ear_toString");
  }
  else {
    memset(__p, 0, 24);
  }
  quasar::PMBuilder::writeAlignedLFst((uint64_t)ptr, (uint64_t)__p);
}

- (BOOL)writeLGFstToPath:(id)a3
{
  __p[3] = *(void **)MEMORY[0x1E4F143B8];
  id v4 = a3;
  ptr = self->_pmBuilder.__ptr_;
  if (v4) {
    objc_msgSend(v4, "ear_toString");
  }
  else {
    memset(__p, 0, 24);
  }
  quasar::PMBuilder::writeLGFst((uint64_t)ptr, (uint64_t)__p);
}

- (BOOL)writeOSymsToPath:(id)a3 asText:(BOOL)a4 quasarise:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  v16[19] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = v8;
  if (v6)
  {
    quasar::PMBuilder::getOsyms((uint64_t)self->_pmBuilder.__ptr_, v5, __p);
    if (v9)
    {
      objc_msgSend(v9, "ear_toString");
    }
    else
    {
      long long v13 = 0;
      uint64_t v14 = 0;
      uint64_t v15 = 0;
    }
    fst::SymbolTable::WriteText((uint64_t)__p, (uint64_t)&v13);
    if (SHIBYTE(v15) < 0) {
      operator delete(v13);
    }
    fst::SymbolTable::~SymbolTable((fst::SymbolTable *)__p);
  }
  else
  {
    if (v8)
    {
      objc_msgSend(v8, "ear_toString");
    }
    else
    {
      __p[0] = 0;
      __p[1] = 0;
      uint64_t v12 = 0;
    }
    std::ofstream::basic_ofstream((uint64_t *)&v13);
    if (SHIBYTE(v12) < 0) {
      operator delete(__p[0]);
    }
    quasar::PMBuilder::getOsyms((uint64_t)self->_pmBuilder.__ptr_, v5, __p);
    quasar::PMBuilder::writeSymsQuasarMap((uint64_t)__p);
    fst::SymbolTable::~SymbolTable((fst::SymbolTable *)__p);
    long long v13 = (void *)*MEMORY[0x1E4FBA400];
    *(void **)((char *)&v13 + *((void *)v13 - 3)) = *(void **)(MEMORY[0x1E4FBA400] + 24);
    MEMORY[0x1B3EA7CF0](&v14);
    std::ostream::~ostream();
    MEMORY[0x1B3EA8520](v16);
  }

  return 1;
}

- (BOOL)writeISymsToPath:(id)a3 asText:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  ptr = self->_pmBuilder.__ptr_;
  if (v4)
  {
    uint64_t MultiChainMultiAudioBuffer = quasar::SpeechRequestData::getMultiChainMultiAudioBuffer((quasar::SpeechRequestData *)ptr);
    if (v6)
    {
      objc_msgSend(v6, "ear_toString");
    }
    else
    {
      __p = 0;
      uint64_t v12 = 0;
      uint64_t v13 = 0;
    }
    fst::SymbolTable::WriteText(MultiChainMultiAudioBuffer, (uint64_t)&__p);
  }
  else
  {
    uint64_t v9 = quasar::SpeechRequestData::getMultiChainMultiAudioBuffer((quasar::SpeechRequestData *)ptr);
    if (v6)
    {
      objc_msgSend(v6, "ear_toString");
    }
    else
    {
      __p = 0;
      uint64_t v12 = 0;
      uint64_t v13 = 0;
    }
    fst::SymbolTable::Write(v9, (uint64_t)&__p);
  }
  if (SHIBYTE(v13) < 0) {
    operator delete(__p);
  }

  return 1;
}

- (BOOL)writeGFstsToDirectory:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  SectionNames = (long long **)quasar::PMBuilder::getSectionNames((quasar::PMBuilder *)self->_pmBuilder.__ptr_);
  id v6 = EARHelpers::NSArrayOfStringFromVectorOfString(SectionNames);
  quasar::Bitmap::~Bitmap((quasar::Bitmap *)self->_pmBuilder.__ptr_);
  uint64_t v8 = *v7;
  uint64_t v9 = v7[1];
  if (*v7 != v9)
  {
    uint64_t v10 = 0;
    uint64_t v11 = *v7;
    do
    {
      uint64_t v12 = NSString;
      uint64_t v13 = [v6 objectAtIndexedSubscript:v10];
      uint64_t v14 = [v12 stringWithFormat:@"%@.G.fst", v13];

      uint64_t v15 = [v4 stringByAppendingPathComponent:v14];
      unint64_t v16 = v15;
      if (v15)
      {
        objc_msgSend(v15, "ear_toString");
      }
      else
      {
        __p[0] = 0;
        __p[1] = 0;
        uint64_t v19 = 0;
      }
      (*(void (**)(uint64_t, void **))(*(void *)v11 + 104))(v11, __p);
      if (SHIBYTE(v19) < 0) {
        operator delete(__p[0]);
      }

      ++v10;
      v11 += 16;
      v8 += 16;
    }
    while (v11 != v9);
  }

  return 1;
}

- (BOOL)writeLFstToPath:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t TagSequence = quasar::CommandTagging::getTagSequence((quasar::CommandTagging *)self->_pmBuilder.__ptr_);
  if (v4)
  {
    objc_msgSend(v4, "ear_toString");
  }
  else
  {
    __p[0] = 0;
    __p[1] = 0;
    uint64_t v8 = 0;
  }
  (*(void (**)(uint64_t, void **))(*(void *)TagSequence + 104))(TagSequence, __p);
  if (SHIBYTE(v8) < 0) {
    operator delete(__p[0]);
  }

  return 1;
}

- (BOOL)writeIndividualLGFstsToDirectory:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  SectionNames = (long long **)quasar::PMBuilder::getSectionNames((quasar::PMBuilder *)self->_pmBuilder.__ptr_);
  id v6 = EARHelpers::NSArrayOfStringFromVectorOfString(SectionNames);
  IndividualLGFsts = (uint64_t *)quasar::PMBuilder::getIndividualLGFsts((quasar::PMBuilder *)self->_pmBuilder.__ptr_);
  uint64_t v8 = *IndividualLGFsts;
  uint64_t v9 = IndividualLGFsts[1];
  if (*IndividualLGFsts != v9)
  {
    uint64_t v10 = 0;
    uint64_t v11 = *IndividualLGFsts;
    do
    {
      uint64_t v12 = NSString;
      uint64_t v13 = [v6 objectAtIndexedSubscript:v10];
      uint64_t v14 = [v12 stringWithFormat:@"%@.LG.fst", v13];

      uint64_t v15 = [v4 stringByAppendingPathComponent:v14];
      unint64_t v16 = v15;
      if (v15)
      {
        objc_msgSend(v15, "ear_toString");
      }
      else
      {
        __p[0] = 0;
        __p[1] = 0;
        uint64_t v19 = 0;
      }
      (*(void (**)(uint64_t, void **))(*(void *)v11 + 104))(v11, __p);
      if (SHIBYTE(v19) < 0) {
        operator delete(__p[0]);
      }

      ++v10;
      v11 += 16;
      v8 += 16;
    }
    while (v11 != v9);
  }

  return 1;
}

- (BOOL)writeMetadataToPath:(id)a3
{
  id v4 = a3;
  ptr = self->_pmBuilder.__ptr_;
  if (v4) {
    objc_msgSend(v4, "ear_toString");
  }
  quasar::PMBuilder::writeMetadata((uint64_t)ptr);
}

+ (BOOL)writePlaceholderFstToPath:(id)a3
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  fst::VectorFst<fst::ArcTpl<fst::TropicalWeightTpl<float>,int>,fst::VectorState<fst::ArcTpl<fst::TropicalWeightTpl<float>,int>,std::allocator<fst::ArcTpl<fst::TropicalWeightTpl<float>,int>>>>::VectorFst();
}

+ (BOOL)writePlaceholderSymbolsToPath:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  fst::SymbolTable::SymbolTable((fst::SymbolTable *)v5);
}

- (id)lgFstName
{
  v2 = NSString;
  uint64_t LGFstName = quasar::PMBuilder::getLGFstName((quasar::PMBuilder *)self->_pmBuilder.__ptr_);
  if (*(char *)(LGFstName + 23) >= 0) {
    uint64_t v4 = LGFstName;
  }
  else {
    uint64_t v4 = *(void *)LGFstName;
  }
  return (id)[v2 stringWithUTF8String:v4];
}

- (id)lFstName
{
  v2 = NSString;
  uint64_t LFstName = quasar::PMBuilder::getLFstName((quasar::PMBuilder *)self->_pmBuilder.__ptr_);
  if (*(char *)(LFstName + 23) >= 0) {
    uint64_t v4 = LFstName;
  }
  else {
    uint64_t v4 = *(void *)LFstName;
  }
  return (id)[v2 stringWithUTF8String:v4];
}

- (id)osymsName
{
  v2 = NSString;
  uint64_t OsymsName = quasar::PMBuilder::getOsymsName((quasar::PMBuilder *)self->_pmBuilder.__ptr_);
  if (*(char *)(OsymsName + 23) >= 0) {
    uint64_t v4 = OsymsName;
  }
  else {
    uint64_t v4 = *(void *)OsymsName;
  }
  return (id)[v2 stringWithUTF8String:v4];
}

- (shared_ptr<quasar::TextTokenizer>)tokenizer
{
  cntrl = self->_tokenizer.__cntrl_;
  void *v2 = self->_tokenizer.__ptr_;
  v2[1] = (TextTokenizer *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (TextTokenizer *)self;
  return result;
}

- (shared_ptr<quasar::PMBuilder>)pmBuilder
{
  cntrl = self->_pmBuilder.__cntrl_;
  void *v2 = self->_pmBuilder.__ptr_;
  v2[1] = (PMBuilder *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (PMBuilder *)self;
  return result;
}

- (void).cxx_destruct
{
  cntrl = self->_pmBuilder.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
  uint64_t v4 = self->_tokenizer.__cntrl_;
  if (v4)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v4);
  }
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

- (uint64_t)initWithModelRoot:(uint64_t)a1 jsonConfigFile:dataFeeds:.cold.1(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 8))(a1);
}

- (void)buildGFsts
{
  if (a1) {
    OUTLINED_FUNCTION_1_2(&dword_1B1A86000, a2, a3, "Internal unknown exception", a5, a6, a7, a8, 0);
  }
}

@end