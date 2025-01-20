@interface _EARLMTKaldiVocab
+ (void)initialize;
- (_EARLMTKaldiVocab)init;
- (_EARLMTKaldiVocab)initWithContentsOfUrl:(id)a3 outError:(id *)a4;
- (id).cxx_construct;
- (id)endOfSentenceToken;
- (unint64_t)beginOfSentenceIndex;
- (unint64_t)endOfSentenceIndex;
- (unint64_t)indexForWord:(id)a3;
- (unint64_t)unknownWordIndex;
- (unint64_t)vocabSize;
@end

@implementation _EARLMTKaldiVocab

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    os_log_t v2 = os_log_create("com.apple.speech.languagemodeltraining", "_EARLMTKaldiVocab");
    v3 = (void *)sLog;
    sLog = (uint64_t)v2;
  }
}

- (_EARLMTKaldiVocab)init
{
  return 0;
}

- (_EARLMTKaldiVocab)initWithContentsOfUrl:(id)a3 outError:(id *)a4
{
  v71[1] = *MEMORY[0x1E4F143B8];
  id v28 = a3;
  v66.receiver = self;
  v66.super_class = (Class)_EARLMTKaldiVocab;
  v6 = [(_EARLMTKaldiVocab *)&v66 init];
  if (!v6) {
    goto LABEL_21;
  }
  v7 = [NSString stringWithContentsOfURL:v28 encoding:4 error:a4];
  if (!v7) {
    goto LABEL_20;
  }
  v26 = v7;
  v8 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
  v27 = [v7 componentsSeparatedByCharactersInSet:v8];

  uint64_t v60 = 0;
  v61 = &v60;
  uint64_t v62 = 0x3032000000;
  v63 = __Block_byref_object_copy__4;
  v64 = __Block_byref_object_dispose__4;
  id v65 = 0;
  uint64_t v54 = 0;
  v55 = &v54;
  uint64_t v56 = 0x3032000000;
  v57 = __Block_byref_object_copy__4;
  v58 = __Block_byref_object_dispose__4;
  id v59 = 0;
  uint64_t v48 = 0;
  v49 = &v48;
  uint64_t v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__4;
  v52 = __Block_byref_object_dispose__4;
  id v53 = 0;
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__4;
  v46 = __Block_byref_object_dispose__4;
  id v47 = 0;
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x2020000000;
  uint64_t v41 = 0;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __52___EARLMTKaldiVocab_initWithContentsOfUrl_outError___block_invoke;
  v31[3] = &unk_1E5FFE868;
  v33 = &v42;
  v34 = &v38;
  v35 = &v48;
  v36 = &v60;
  v37 = &v54;
  v9 = v6;
  v32 = v9;
  [v27 enumerateObjectsUsingBlock:v31];
  uint64_t v10 = v39[3];
  unint64_t value = v9->_w2i.__table_.__p2_.__value_;
  v12 = (uint64_t *)MEMORY[0x1E4F28568];
  if (v10 != value)
  {
    v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v70 = *MEMORY[0x1E4F28568];
    v14 = objc_msgSend(NSString, "stringWithFormat:", @"VocabSize in the file %lu does not match total vocabulary in file %lu", v10, value);
    v71[0] = v14;
    v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v71 forKeys:&v70 count:1];
    uint64_t v16 = [v13 errorWithDomain:@"com.apple.siri.languagemodeltraining" code:151 userInfo:v15];
    v17 = (void *)v43[5];
    v43[5] = v16;
  }
  if (!v49[5] || !v61[5] || !v55[5])
  {
    v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v68 = *v12;
    v19 = [NSString stringWithFormat:@"One of <UnknownWord>, <BeginOfSentenceWord> or <EndOfSentenceWord> symbols are missing from file:%@", v28];
    v69 = v19;
    v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v69 forKeys:&v68 count:1];
    uint64_t v21 = [v18 errorWithDomain:@"com.apple.siri.languagemodeltraining" code:151 userInfo:v20];
    v22 = (void *)v43[5];
    v43[5] = v21;
  }
  v23 = (void *)v43[5];
  if (v23)
  {
    if (a4) {
      *a4 = v23;
    }
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)[ (id) v49[5] UTF8String]);
    v67 = __p;
    v9->_unkIndex = *((void *)std::__hash_table<std::__hash_value_type<std::string,unsigned long>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned long>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned long>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned long>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&v9->_w2i, (unsigned __int8 *)__p, (uint64_t)&std::piecewise_construct, (long long **)&v67)+ 5);
    if (v30 < 0) {
      operator delete(__p[0]);
    }
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)[ (id) v55[5] UTF8String]);
    v67 = __p;
    v9->_eosIndex = *((void *)std::__hash_table<std::__hash_value_type<std::string,unsigned long>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned long>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned long>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned long>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&v9->_w2i, (unsigned __int8 *)__p, (uint64_t)&std::piecewise_construct, (long long **)&v67)+ 5);
    if (v30 < 0) {
      operator delete(__p[0]);
    }
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)[ (id) v61[5] UTF8String]);
    v67 = __p;
    v9->_bosIndex = *((void *)std::__hash_table<std::__hash_value_type<std::string,unsigned long>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned long>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned long>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned long>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&v9->_w2i, (unsigned __int8 *)__p, (uint64_t)&std::piecewise_construct, (long long **)&v67)+ 5);
    if (v30 < 0) {
      operator delete(__p[0]);
    }
    objc_storeStrong((id *)&v9->_eosToken, (id)v55[5]);
  }

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v42, 8);

  _Block_object_dispose(&v48, 8);
  _Block_object_dispose(&v54, 8);

  _Block_object_dispose(&v60, 8);
  if (v23) {
LABEL_20:
  }
    v24 = 0;
  else {
LABEL_21:
  }
    v24 = v6;

  return v24;
}

- (unint64_t)indexForWord:(id)a3
{
  id v4 = a3;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v4 UTF8String]);
  if (std::__hash_table<std::__hash_value_type<std::string,std::variant<kaldi::quasar::ShortlistDataInManyFiles::NotLoadedShortListDataOnDisk,std::shared_ptr<kaldi::quasar::ShortlistDataOnDisk>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::variant<kaldi::quasar::ShortlistDataInManyFiles::NotLoadedShortListDataOnDisk,std::shared_ptr<kaldi::quasar::ShortlistDataOnDisk>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::variant<kaldi::quasar::ShortlistDataInManyFiles::NotLoadedShortListDataOnDisk,std::shared_ptr<kaldi::quasar::ShortlistDataOnDisk>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::variant<kaldi::quasar::ShortlistDataInManyFiles::NotLoadedShortListDataOnDisk,std::shared_ptr<kaldi::quasar::ShortlistDataOnDisk>>>>>::find<std::string>(&self->_w2i.__table_.__bucket_list_.__ptr_.__value_, (unsigned __int8 *)__p))
  {
    uint64_t v10 = __p;
    p_unkIndex = (unint64_t *)(std::__hash_table<std::__hash_value_type<std::string,std::__list_iterator<std::pair<std::string,std::vector<std::string>>,void *>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::__list_iterator<std::pair<std::string,std::vector<std::string>>,void *>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::__list_iterator<std::pair<std::string,std::vector<std::string>>,void *>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::__list_iterator<std::pair<std::string,std::vector<std::string>>,void *>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)&self->_w2i, (unsigned __int8 *)__p, (uint64_t)&std::piecewise_construct, (long long **)&v10)+ 40);
  }
  else
  {
    p_unkIndex = &self->_unkIndex;
  }
  unint64_t v6 = *p_unkIndex;
  if (v9 < 0) {
    operator delete(__p[0]);
  }

  return v6;
}

- (unint64_t)vocabSize
{
  return self->_w2i.__table_.__p2_.__value_;
}

- (unint64_t)endOfSentenceIndex
{
  return self->_eosIndex;
}

- (unint64_t)beginOfSentenceIndex
{
  return self->_bosIndex;
}

- (unint64_t)unknownWordIndex
{
  return self->_unkIndex;
}

- (id)endOfSentenceToken
{
  return self->_eosToken;
}

- (void).cxx_destruct
{
  std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::~__hash_table((uint64_t)&self->_w2i);
  objc_storeStrong((id *)&self->_eosToken, 0);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *((_DWORD *)self + 18) = 1065353216;
  return self;
}

@end