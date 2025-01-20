@interface CATPattern
+ (id)executeCAT:(id)a3 templateDir:()basic_string<char catId:()std:(std::allocator<char>> *)data :char_traits<char> patternId:requestType:parameters:globals:patternContext:callback:options:error:;
+ (id)patternNameFromType:(unint64_t)a3;
+ (id)segment:(id)a3 settings:(id)a4;
+ (void)execute:(id)a3 patternId:(id)a4 parameters:(id)a5 globals:(id)a6 callback:(id)a7 options:(int)a8 completion:(id)a9;
+ (void)execute:(id)a3 patternId:(id)a4 parameters:(id)a5 globals:(id)a6 options:(int)a7 completion:(id)a8;
+ (void)execute:(id)a3 templateDir:(id)a4 patternId:(id)a5 parameters:(id)a6 globals:(id)a7 callback:(id)a8 options:(int)a9 completion:(id)a10;
+ (void)execute:(id)a3 templateDir:(id)a4 patternId:(id)a5 parameters:(id)a6 globals:(id)a7 options:(int)a8 completion:(id)a9;
+ (void)load:(id)a3 patternId:(id)a4 completion:(id)a5;
+ (void)load:(id)a3 patternId:(id)a4 options:(int)a5 completion:(id)a6;
@end

@implementation CATPattern

+ (void)execute:(id)a3 templateDir:(id)a4 patternId:(id)a5 parameters:(id)a6 globals:(id)a7 callback:(id)a8 options:(int)a9 completion:(id)a10
{
  MEMORY[0x1F4188790](a1);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  uint64_t v610 = *MEMORY[0x1E4F143B8];
  id v517 = v20;
  id v518 = v19;
  id v519 = v17;
  id v516 = v15;
  id v535 = v13;
  id v520 = v11;
  v524 = (void (**)(id, PatternExecutionResult *, void *))a10;
  v21 = GetPatternLog();
  os_signpost_id_t v22 = os_signpost_id_generate(v21);
  v23 = v21;
  v24 = v23;
  os_signpost_id_t spid = v22;
  unint64_t v515 = v22 - 1;
  log = v23;
  if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = [v519 UTF8String];
    v24 = log;
    _os_signpost_emit_with_name_impl(&dword_1C5C1E000, log, OS_SIGNPOST_INTERVAL_BEGIN, v22, "PatternExecute", "PATTERN_ID = %s", (uint8_t *)&buf, 0xCu);
  }

  uint64_t v25 = objc_opt_new();
  char v590 = 0;
  memset(v588, 0, sizeof(v588));
  char v589 = 0;
  siri::dialogengine::ElapsedTimer::Reset((siri::dialogengine::ElapsedTimer *)v588);
  id v26 = v517;
  id v27 = v518;
  memset(&__s, 0, sizeof(__s));
  v541 = (PatternExecutionResult *)v25;
  v528 = v26;
  v521 = v27;
  if (v26)
  {
    id v28 = +[DEExecutor bundleTemplateDir:v26];
    MEMORY[0x1C8796900](&__s, [v28 UTF8String]);

    id v29 = [v528 bundleIdentifier];
    std::string::basic_string[abi:ne180100]<0>(&buf, (char *)[v29 UTF8String]);
    siri::dialogengine::GradingAllowListFactory::RegisterBundle((char *)&buf, (long long *)&__s);
    if (SHIBYTE(v608) < 0) {
      operator delete((void *)buf);
    }
  }
  else
  {
    id v30 = [v27 path];
    MEMORY[0x1C8796900](&__s, [v30 UTF8String]);
  }
  id v523 = v519;
  std::string::basic_string[abi:ne180100]<0>(&v586, (char *)[v523 UTF8String]);
  id v533 = v516;
  id v536 = v535;
  std::operator+<char>();
  v31 = std::string::append((std::string *)__str, "' with template dir '");
  long long v32 = *(_OWORD *)&v31->__r_.__value_.__l.__data_;
  v609.__r_.__value_.__r.__words[2] = v31->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v609.__r_.__value_.__l.__data_ = v32;
  v31->__r_.__value_.__l.__size_ = 0;
  v31->__r_.__value_.__r.__words[2] = 0;
  v31->__r_.__value_.__r.__words[0] = 0;
  if ((__s.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_s = &__s;
  }
  else {
    p_s = (std::string *)__s.__r_.__value_.__r.__words[0];
  }
  if ((__s.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type size = HIBYTE(__s.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type size = __s.__r_.__value_.__l.__size_;
  }
  v35 = std::string::append(&v609, (const std::string::value_type *)p_s, size);
  long long v36 = *(_OWORD *)&v35->__r_.__value_.__l.__data_;
  v597.__end_ = (std::__split_buffer<std::string>::pointer)v35->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v597.__first_ = v36;
  v35->__r_.__value_.__l.__size_ = 0;
  v35->__r_.__value_.__r.__words[2] = 0;
  v35->__r_.__value_.__r.__words[0] = 0;
  v37 = std::string::append((std::string *)&v597, "'");
  long long v38 = *(_OWORD *)&v37->__r_.__value_.__l.__data_;
  std::string::size_type v608 = v37->__r_.__value_.__r.__words[2];
  long long buf = v38;
  v37->__r_.__value_.__l.__size_ = 0;
  v37->__r_.__value_.__r.__words[2] = 0;
  v37->__r_.__value_.__r.__words[0] = 0;
  siri::dialogengine::Log::LogWithLevel((uint64_t)&buf, 0);
  if (SHIBYTE(v608) < 0) {
    operator delete((void *)buf);
  }
  if (SHIBYTE(v597.__end_) < 0) {
    operator delete(v597.__first_);
  }
  if (SHIBYTE(v609.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v609.__r_.__value_.__l.__data_);
  }
  if ((__str[23] & 0x80000000) != 0) {
    operator delete(*(void **)__str);
  }
  has_internal_diagnostics = (siri::dialogengine *)os_variant_has_internal_diagnostics();
  if (has_internal_diagnostics && siri::dialogengine::ShouldLogCATParameters(has_internal_diagnostics, v40))
  {
    *(void *)__str = 0;
    v41 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v533 options:3 error:__str];
    if (v41 && (v42 = (void *)[[NSString alloc] initWithData:v41 encoding:4]) != 0)
    {
      id v43 = v42;
      v44 = (char *)[v43 UTF8String];
    }
    else
    {
      id v43 = 0;
      v44 = "unable to represent parameters as JSON";
    }
    std::string::basic_string[abi:ne180100]<0>(&buf, v44);
    std::operator+<char>();
    siri::dialogengine::Log::LogWithLevel((uint64_t)&v597, 0);
    if (SHIBYTE(v597.__end_) < 0) {
      operator delete(v597.__first_);
    }
    *(void *)v591 = 0;
    v45 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v536 options:3 error:v591];
    if (v45 && (v46 = (void *)[[NSString alloc] initWithData:v45 encoding:4]) != 0)
    {
      id v47 = v46;
      v48 = (char *)[v47 UTF8String];
    }
    else
    {
      id v47 = 0;
      v48 = "unable to represent globals as JSON";
    }
    std::string::basic_string[abi:ne180100]<0>(&v597, v48);
    std::operator+<char>();
    siri::dialogengine::Log::LogWithLevel((uint64_t)&v609, 0);
    if (SHIBYTE(v609.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v609.__r_.__value_.__l.__data_);
    }
    char v583 = 1;
    std::string::basic_string[abi:ne180100]<0>(v584, "");
    if (SHIBYTE(v597.__end_) < 0) {
      operator delete(v597.__first_);
    }

    if (SHIBYTE(v608) < 0) {
      operator delete((void *)buf);
    }
  }
  else
  {
    char v583 = 1;
    std::string::basic_string[abi:ne180100]<0>(v584, "");
  }

  if (siri::dialogengine::HasPreloadBeenCalled(v49)) {
    siri::dialogengine::Log::Debug((siri::dialogengine::Log *)"Performance: DialogEngine's 'preload' function has been called", v50);
  }
  else {
    siri::dialogengine::Log::Info((siri::dialogengine::Log *)"Performance: DialogEngine's 'preload' function has not been called.", v50);
  }
  siri::dialogengine::GetTemplateDirs((uint64_t)&__s, +[CATCommonApi UpdatesEnabled:](CATCommonApi, "UpdatesEnabled:"), (uint64_t)&v581);
  siri::dialogengine::Context::Context((siri::dialogengine::Context *)&buf, &v581);
  siri::dialogengine::PatternFile::LoadFromId((uint64_t)&buf, (uint64_t)&v586, 1, &v579);
  uint64_t v51 = v579;
  if (!v579)
  {
    LogPatternExecutionResult(v541);
    v67 = log;
    v68 = v67;
    if (v515 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v67))
    {
      LOWORD(v597.__first_) = 0;
      _os_signpost_emit_with_name_impl(&dword_1C5C1E000, v68, OS_SIGNPOST_INTERVAL_END, spid, "PatternExecute", "", (uint8_t *)&v597, 2u);
    }

    std::operator+<char>();
    std::string::basic_string[abi:ne180100]<0>(&v609, "load-failed");
    v69 = NSErrorFromString((uint64_t *)&v597, (uint64_t *)&v609);
    v524[2](v524, v541, v69);

    if (SHIBYTE(v609.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v609.__r_.__value_.__l.__data_);
    }
    v70 = v541;
    if (SHIBYTE(v597.__end_) < 0) {
      operator delete(v597.__first_);
    }
    goto LABEL_934;
  }
  std::string::basic_string[abi:ne180100]<0>(&v597, "globalParameters");
  v52 = [v536 objectForKeyedSubscript:@"globalParameters"];
  VariableFromNSDictionary(&v577, (const std::string *)&v597, v52);

  if (SHIBYTE(v597.__end_) < 0) {
    operator delete(v597.__first_);
  }
  std::string::basic_string[abi:ne180100]<0>(&v597, "parameters");
  VariableFromNSDictionary(&v575, (const std::string *)&v597, v533);
  if (SHIBYTE(v597.__end_) < 0) {
    operator delete(v597.__first_);
  }
  v53 = [v536 valueForKey:@"responseMode"];
  if (!v53) {
    v53 = &stru_1F2127290;
  }
  v54 = v53;
  std::string::basic_string[abi:ne180100]<0>(&v597, (char *)[(__CFString *)v54 UTF8String]);
  unsigned int v534 = siri::dialogengine::ParseResponseModeString((unint64_t)&v597);
  if (SHIBYTE(v597.__end_) < 0) {
    operator delete(v597.__first_);
  }

  unsigned int v56 = v534 - 1;
  if (v534 == 1) {
    goto LABEL_58;
  }
  if (siri::dialogengine::DeviceIsHomePod(v575, v577, v55))
  {
    siri::dialogengine::Log::Info((siri::dialogengine::Log *)"Device is a HomePod; Forcing response mode to voiceOnly",
      v57);
    v58 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v536];
    [v58 setValue:@"voiceOnly" forKey:@"responseMode"];
    id v59 = v58;

    id v536 = v59;
LABEL_58:
    unsigned int v56 = 0;
    char v60 = HIBYTE(v586.__r_.__value_.__r.__words[2]);
    std::string::size_type v61 = v586.__r_.__value_.__r.__words[0];
    unsigned int v534 = 1;
LABEL_59:
    std::string::basic_string[abi:ne180100]<0>(&v597, off_1E651E420[v56]);
    v63 = &v586;
    if (v60 < 0) {
      v63 = (std::string *)v61;
    }
    if (SHIBYTE(v597.__end_) >= 0) {
      first = &v597;
    }
    else {
      first = v597.__first_;
    }
    siri::dialogengine::Log::Info((siri::dialogengine::Log *)"Response mode for execution of pattern %s: %s", v62, v63, first);
    if (SHIBYTE(v597.__end_) < 0) {
      operator delete(v597.__first_);
    }
    uint64_t v51 = v579;
    goto LABEL_67;
  }
  char v60 = HIBYTE(v586.__r_.__value_.__r.__words[2]);
  if (v534)
  {
    std::string::size_type v61 = v586.__r_.__value_.__r.__words[0];
    goto LABEL_59;
  }
  v410 = (std::string *)v586.__r_.__value_.__r.__words[0];
  if ((v586.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v410 = &v586;
  }
  siri::dialogengine::Log::Warn((siri::dialogengine::Log *)"WARNING: Response mode for execution of pattern %s was not specified", v57, v410);
  unsigned int v534 = 0;
LABEL_67:
  v66 = (_OWORD *)(v51 + 64);
  if (*(char *)(v51 + 87) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)&v597, *(const std::string::value_type **)(v51 + 64), *(void *)(v51 + 72));
  }
  else
  {
    *(_OWORD *)&v597.__first_ = *v66;
    v597.__end_ = *(std::__split_buffer<std::string>::pointer *)(v51 + 80);
  }
  if (SHIBYTE(v597.__end_) >= 0) {
    std::__split_buffer<std::string>::pointer end_high = (std::__split_buffer<std::string>::pointer)HIBYTE(v597.__end_);
  }
  else {
    std::__split_buffer<std::string>::pointer end_high = v597.__begin_;
  }
  std::string::size_type v72 = HIBYTE(v586.__r_.__value_.__r.__words[2]);
  if ((v586.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    std::string::size_type v72 = v586.__r_.__value_.__l.__size_;
  }
  if (end_high != (std::__split_buffer<std::string>::pointer)v72)
  {
    if ((HIBYTE(v597.__end_) & 0x80) != 0) {
      operator delete(v597.__first_);
    }
    goto LABEL_101;
  }
  if ((v586.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v65 = &v586;
  }
  else {
    v65 = (std::string *)v586.__r_.__value_.__r.__words[0];
  }
  if ((HIBYTE(v597.__end_) & 0x80) == 0)
  {
    if (!HIBYTE(v597.__end_)) {
      goto LABEL_110;
    }
    uint64_t v73 = 0;
    do
    {
      int v74 = *((unsigned __int8 *)&v597.__first_ + v73);
      int v75 = v65->__r_.__value_.__s.__data_[v73];
      BOOL v76 = v74 != v75 || HIBYTE(v597.__end_) - 1 == v73++;
    }
    while (!v76);
    if (v74 == v75) {
      goto LABEL_110;
    }
LABEL_101:
    if (*(char *)(v51 + 87) < 0)
    {
      std::string::__init_copy_ctor_external((std::string *)&v597, *(const std::string::value_type **)(v51 + 64), *(void *)(v51 + 72));
    }
    else
    {
      *(_OWORD *)&v597.__first_ = *v66;
      v597.__end_ = *(std::__split_buffer<std::string>::pointer *)(v51 + 80);
    }
    v79 = &v597;
    if (SHIBYTE(v597.__end_) < 0) {
      v79 = v597.__first_;
    }
    v80 = &v586;
    if ((v586.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      v80 = (std::string *)v586.__r_.__value_.__r.__words[0];
    }
    siri::dialogengine::Log::Warn((siri::dialogengine::Log *)"The pattern ID in the pattern file [%s] does not match the requested pattern ID [%s]", (const char *)v65, v79, v80);
    if (SHIBYTE(v597.__end_) < 0) {
      operator delete(v597.__first_);
    }
    goto LABEL_110;
  }
  std::__split_buffer<std::string>::pointer v77 = v597.__first_;
  int v78 = memcmp(v597.__first_, v65, (size_t)v597.__begin_);
  operator delete(v77);
  if (v78) {
    goto LABEL_101;
  }
LABEL_110:
  [(PatternExecutionResult *)v541 setPatternId:v523];
  v81 = (_OWORD *)(v51 + 112);
  if (*(char *)(v51 + 135) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)&v597, *(const std::string::value_type **)(v51 + 112), *(void *)(v51 + 120));
  }
  else
  {
    *(_OWORD *)&v597.__first_ = *v81;
    v597.__end_ = *(std::__split_buffer<std::string>::pointer *)(v51 + 128);
  }
  [(PatternExecutionResult *)v541 setPatternType:PatternTypeFromName((uint64_t)&v597)];
  if (SHIBYTE(v597.__end_) < 0) {
    operator delete(v597.__first_);
  }
  v82 = NSString;
  if (v534 - 1 > 3) {
    v83 = "";
  }
  else {
    v83 = off_1E651E420[v534 - 1];
  }
  std::string::basic_string[abi:ne180100]<0>(&v597, v83);
  if (SHIBYTE(v597.__end_) >= 0) {
    v84 = &v597;
  }
  else {
    v84 = v597.__first_;
  }
  v85 = [v82 stringWithUTF8String:v84];
  [(PatternExecutionResult *)v541 setResponseMode:v85];

  if (SHIBYTE(v597.__end_) < 0) {
    operator delete(v597.__first_);
  }
  v537 = objc_opt_new();
  uint64_t v86 = 0x1E4F29000uLL;
  std::map<std::string,std::string>::map[abi:ne180100]((uint64_t)&v609, (const void ***)(v51 + 184));
  std::string::size_type v87 = v609.__r_.__value_.__r.__words[0];
  if ((std::string::size_type *)v609.__r_.__value_.__l.__data_ != &v609.__r_.__value_.__r.__words[1])
  {
    do
    {
      std::pair<std::string const,std::string>::pair[abi:ne180100]((std::string *)&v597, (long long *)(v87 + 32));
      if (SHIBYTE(v597.__end_) >= 0) {
        v88 = &v597;
      }
      else {
        v88 = v597.__first_;
      }
      v89 = [*(id *)(v86 + 24) stringWithUTF8String:v88];
      if (SHIBYTE(v598) >= 0) {
        p_end_cap = &v597.__end_cap_;
      }
      else {
        p_end_cap = v597.__end_cap_.__value_;
      }
      v91 = [*(id *)(v86 + 24) stringWithUTF8String:p_end_cap];
      [v537 setObject:v91 forKey:v89];

      if (SHIBYTE(v598) < 0) {
        operator delete(v597.__end_cap_.__value_);
      }
      uint64_t v86 = 0x1E4F29000;
      if (SHIBYTE(v597.__end_) < 0) {
        operator delete(v597.__first_);
      }
      v92 = *(std::string **)(v87 + 8);
      if (v92)
      {
        do
        {
          v93 = v92;
          v92 = (std::string *)v92->__r_.__value_.__r.__words[0];
        }
        while (v92);
      }
      else
      {
        do
        {
          v93 = *(std::string **)(v87 + 16);
          BOOL v76 = v93->__r_.__value_.__r.__words[0] == v87;
          std::string::size_type v87 = (std::string::size_type)v93;
        }
        while (!v76);
      }
      std::string::size_type v87 = (std::string::size_type)v93;
    }
    while (v93 != (std::string *)&v609.__r_.__value_.__r.__words[1]);
  }
  std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy((void *)v609.__r_.__value_.__l.__size_);
  [(PatternExecutionResult *)v541 setMeta:v537];
  if (*(char *)(v51 + 135) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)&v597, *(const std::string::value_type **)(v51 + 112), *(void *)(v51 + 120));
  }
  else
  {
    *(_OWORD *)&v597.__first_ = *v81;
    v597.__end_ = *(std::__split_buffer<std::string>::pointer *)(v51 + 128);
  }
  siri::dialogengine::PatternFactory::Create((uint64_t)&v597, (uint64_t)&v573);
  if (SHIBYTE(v597.__end_) < 0) {
    operator delete(v597.__first_);
  }
  uint64_t v94 = v573;
  if (v573)
  {
    v95 = v580;
    if (v580)
    {
      atomic_fetch_add_explicit(&v580->__shared_owners_, 1uLL, memory_order_relaxed);
      atomic_fetch_add_explicit(&v95->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    v96 = *(std::__shared_weak_count **)(v94 + 16);
    *(void *)(v94 + 8) = v51;
    *(void *)(v94 + 16) = v95;
    if (v96) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v96);
    }
    if (v95) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v95);
    }
    v97 = v577;
    v98 = v578;
    if (v578) {
      atomic_fetch_add_explicit(&v578->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    v99 = *(std::__shared_weak_count **)(v94 + 32);
    *(void *)(v94 + 24) = v97;
    *(void *)(v94 + 32) = v98;
    if (v99) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v99);
    }
    v100 = v575;
    v101 = v576;
    if (v576) {
      atomic_fetch_add_explicit(&v576->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    v102 = *(std::__shared_weak_count **)(v94 + 48);
    *(void *)(v94 + 40) = v100;
    *(void *)(v94 + 48) = v101;
    if (v102) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v102);
    }
    if ((std::string **)(v94 + 80) != &v581) {
      std::vector<siri::dialogengine::UpdatableDir>::__assign_with_size[abi:ne180100]<siri::dialogengine::UpdatableDir*,siri::dialogengine::UpdatableDir*>(v94 + 80, v581, *(std::string **)v582, 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)v582 - (void)v581) >> 5));
    }
    if (*(char *)(v51 + 135) < 0)
    {
      std::string::__init_copy_ctor_external((std::string *)&v597, *(const std::string::value_type **)(v51 + 112), *(void *)(v51 + 120));
    }
    else
    {
      *(_OWORD *)&v597.__first_ = *v81;
      v597.__end_ = *(std::__split_buffer<std::string>::pointer *)(v51 + 128);
    }
    siri::dialogengine::PatternRegistry::GetSchema((uint64_t)&buf, (const std::string::value_type **)&v597, (uint64_t *)&v571);
    if (SHIBYTE(v597.__end_) < 0) {
      operator delete(v597.__first_);
    }
    if (v571)
    {
      siri::dialogengine::PatternSchema::GetSettings(v571, (uint64_t)&v609);
      std::string::size_type v106 = v609.__r_.__value_.__r.__words[0];
      if ((std::string::size_type *)v609.__r_.__value_.__l.__data_ != &v609.__r_.__value_.__r.__words[1])
      {
        do
        {
          std::pair<std::string const,std::shared_ptr<siri::dialogengine::JSONValue>>::pair[abi:ne180100]((std::string *)&v597, (long long *)(v106 + 32));
          if (!v597.__end_cap_.__value_[9].__r_.__value_.__s.__data_[17])
          {
            uint64_t v109 = *(void *)(v94 + 40);
            uint64_t v110 = std::__tree<std::string>::find<std::string>(v109 + 72, (const void **)&v597.__first_);
            if (v109 + 80 != v110)
            {
              uint64_t v112 = *(void *)(v110 + 56);
              v111 = *(std::__shared_weak_count **)(v110 + 64);
              if (v111)
              {
                atomic_fetch_add_explicit(&v111->__shared_owners_, 1uLL, memory_order_relaxed);
                std::__shared_weak_count::__release_shared[abi:ne180100](v111);
              }
              if (v112)
              {
                std::operator+<char>();
                v113 = std::string::append((std::string *)v591, "' cannot be overridden. Ignoring runtime value.");
                long long v114 = *(_OWORD *)&v113->__r_.__value_.__l.__data_;
                *(void *)&__str[16] = *((void *)&v113->__r_.__value_.__l + 2);
                *(_OWORD *)__str = v114;
                v113->__r_.__value_.__l.__size_ = 0;
                v113->__r_.__value_.__r.__words[2] = 0;
                v113->__r_.__value_.__r.__words[0] = 0;
                siri::dialogengine::Log::LogWithLevel((uint64_t)__str, 1u);
                if ((__str[23] & 0x80000000) != 0) {
                  operator delete(*(void **)__str);
                }
                if ((v591[23] & 0x80000000) != 0) {
                  operator delete(*(void **)v591);
                }
                siri::dialogengine::VariableObject::RemoveProperty(*(void *)(v94 + 40), (const void **)&v597.__first_);
              }
            }
          }
          if (v597.__end_cap_.__value_) {
            std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v597.__end_cap_.__value_);
          }
          if (SHIBYTE(v597.__end_) < 0) {
            operator delete(v597.__first_);
          }
          v107 = *(std::string **)(v106 + 8);
          if (v107)
          {
            do
            {
              v108 = v107;
              v107 = (std::string *)v107->__r_.__value_.__r.__words[0];
            }
            while (v107);
          }
          else
          {
            do
            {
              v108 = *(std::string **)(v106 + 16);
              BOOL v76 = v108->__r_.__value_.__r.__words[0] == v106;
              std::string::size_type v106 = (std::string::size_type)v108;
            }
            while (!v76);
          }
          std::string::size_type v106 = (std::string::size_type)v108;
        }
        while (v108 != (std::string *)&v609.__r_.__value_.__r.__words[1]);
      }
      std::__tree<std::__value_type<std::string,std::shared_ptr<siri::dialogengine::JSONValue>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<siri::dialogengine::JSONValue>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<siri::dialogengine::JSONValue>>>>::destroy((void *)v609.__r_.__value_.__l.__size_);
    }
    siri::dialogengine::PatternFile::GetSettingsAsVariables((siri::dialogengine::PatternFile *)v51, (uint64_t)&v609);
    std::string::size_type v115 = v609.__r_.__value_.__r.__words[0];
    p_std::string::size_type size = (uint64_t)&v609.__r_.__value_.__l.__size_;
    if ((std::string::size_type *)v609.__r_.__value_.__l.__data_ != &v609.__r_.__value_.__r.__words[1])
    {
      do
      {
        std::pair<std::string const,std::shared_ptr<siri::dialogengine::JSONValue>>::pair[abi:ne180100]((std::string *)&v597, (long long *)(v115 + 32));
        uint64_t v117 = *(void *)(v94 + 40);
        uint64_t v118 = std::__tree<std::string>::find<std::string>(v117 + 72, (const void **)&v597.__first_);
        if (v117 + 80 == v118)
        {
          if (!v597.__end_cap_.__value_) {
            goto LABEL_209;
          }
        }
        else
        {
          uint64_t v120 = *(void *)(v118 + 56);
          v119 = *(std::__shared_weak_count **)(v118 + 64);
          if (v119) {
            atomic_fetch_add_explicit(&v119->__shared_owners_, 1uLL, memory_order_relaxed);
          }
          if (v120)
          {
            if (v119) {
              std::__shared_weak_count::__release_shared[abi:ne180100](v119);
            }
            goto LABEL_209;
          }
          value = v597.__end_cap_.__value_;
          if (v119) {
            std::__shared_weak_count::__release_shared[abi:ne180100](v119);
          }
          if (!value) {
            goto LABEL_209;
          }
        }
        siri::dialogengine::ExecutePatternBase::AddParameter(v94, &v597.__end_cap_.__value_);
LABEL_209:
        if (v597.__end_cap_.__value_) {
          std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v597.__end_cap_.__value_);
        }
        if (SHIBYTE(v597.__end_) < 0) {
          operator delete(v597.__first_);
        }
        v122 = *(std::string **)(v115 + 8);
        if (v122)
        {
          do
          {
            v123 = v122;
            v122 = (std::string *)v122->__r_.__value_.__r.__words[0];
          }
          while (v122);
        }
        else
        {
          do
          {
            v123 = *(std::string **)(v115 + 16);
            BOOL v76 = v123->__r_.__value_.__r.__words[0] == v115;
            std::string::size_type v115 = (std::string::size_type)v123;
          }
          while (!v76);
        }
        std::string::size_type v115 = (std::string::size_type)v123;
      }
      while (v123 != (std::string *)&v609.__r_.__value_.__r.__words[1]);
    }
    std::__tree<std::__value_type<std::string,std::shared_ptr<siri::dialogengine::JSONValue>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<siri::dialogengine::JSONValue>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<siri::dialogengine::JSONValue>>>>::destroy((void *)v609.__r_.__value_.__l.__size_);
    (*(void (**)(void **__return_ptr, uint64_t))(*(void *)v94 + 16))(&v569, v94);
    v124 = operator new(0x70uLL);
    v124[1] = 0;
    v124[2] = 0;
    void *v124 = &unk_1F211B7A0;
    v510 = (std::__shared_weak_count *)v124;
    v512 = (uint64_t **)(v124 + 3);
    siri::dialogengine::PatternContext::PatternContext((siri::dialogengine::PatternContext *)(v124 + 3));
    siri::dialogengine::PatternFile::GetSettingsAsVariables((siri::dialogengine::PatternFile *)v51, (uint64_t)&v597);
    siri::dialogengine::PatternContext::AddPatternSettings(v512, (const char *)&v597);
    std::__tree<std::__value_type<std::string,std::shared_ptr<siri::dialogengine::JSONValue>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<siri::dialogengine::JSONValue>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<siri::dialogengine::JSONValue>>>>::destroy(v597.__begin_->__r_.__value_.__r.__words);
    memset(&v568, 0, sizeof(v568));
    v125 = v569;
    v126 = v570;
    if (v569 != v570)
    {
      p_std::string::size_type size = 0xAAAAAAAAAAAAAAALL;
      do
      {
        uint64_t v127 = *v125;
        if (*(char *)(*v125 + 87) < 0) {
          std::string::__init_copy_ctor_external(&v609, *(const std::string::value_type **)(v127 + 64), *(void *)(v127 + 72));
        }
        else {
          std::string v609 = *(std::string *)(v127 + 64);
        }
        std::vector<std::string>::pointer end = v568.__end_;
        if (v568.__end_ >= v568.__end_cap_.__value_)
        {
          unint64_t v130 = 0xAAAAAAAAAAAAAAABLL * (((char *)v568.__end_ - (char *)v568.__begin_) >> 3);
          unint64_t v131 = v130 + 1;
          if (v130 + 1 > 0xAAAAAAAAAAAAAAALL) {
            std::vector<BOOL>::__throw_length_error[abi:ne180100]();
          }
          if (0x5555555555555556 * (((char *)v568.__end_cap_.__value_ - (char *)v568.__begin_) >> 3) > v131) {
            unint64_t v131 = 0x5555555555555556 * (((char *)v568.__end_cap_.__value_ - (char *)v568.__begin_) >> 3);
          }
          if (0xAAAAAAAAAAAAAAABLL * (((char *)v568.__end_cap_.__value_ - (char *)v568.__begin_) >> 3) >= 0x555555555555555) {
            unint64_t v132 = 0xAAAAAAAAAAAAAAALL;
          }
          else {
            unint64_t v132 = v131;
          }
          v597.__end_cap_.__value_ = (std::allocator<std::string> *)&v568.__end_cap_;
          if (v132) {
            v133 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v568.__end_cap_, v132);
          }
          else {
            v133 = 0;
          }
          v134 = v133 + v130;
          v597.__first_ = v133;
          v597.__begin_ = v134;
          v597.__end_cap_.__value_ = &v133[v132];
          long long v135 = *(_OWORD *)&v609.__r_.__value_.__l.__data_;
          v134->__r_.__value_.__r.__words[2] = v609.__r_.__value_.__r.__words[2];
          *(_OWORD *)&v134->__r_.__value_.__l.__data_ = v135;
          memset(&v609, 0, sizeof(v609));
          v597.__end_ = v134 + 1;
          std::vector<std::string>::__swap_out_circular_buffer(&v568, &v597);
          v136 = v568.__end_;
          std::__split_buffer<std::string>::~__split_buffer(&v597);
          v568.__end_ = v136;
          if (SHIBYTE(v609.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v609.__r_.__value_.__l.__data_);
          }
        }
        else
        {
          long long v129 = *(_OWORD *)&v609.__r_.__value_.__l.__data_;
          v568.__end_->__r_.__value_.__r.__words[2] = v609.__r_.__value_.__r.__words[2];
          *(_OWORD *)&end->__r_.__value_.__l.__data_ = v129;
          v568.__end_ = end + 1;
        }
        v125 += 7;
      }
      while (v125 != v126);
    }
    std::string::basic_string[abi:ne180100]<0>(&v597, ", ");
    siri::dialogengine::StringJoinInternal<std::vector<std::string>>((uint64_t)v566, (uint64_t)v568.__begin_, (uint64_t)v568.__end_, (uint64_t)&v597);
    if (SHIBYTE(v597.__end_) < 0) {
      operator delete(v597.__first_);
    }
    v138 = v566;
    if (v567 < 0) {
      v138 = (void **)v566[0];
    }
    siri::dialogengine::Log::Info((siri::dialogengine::Log *)"Effective group names from pattern execute: %s", v137, v138);
    int64x2_t v564 = 0uLL;
    v565 = 0;
    int64x2_t v562 = 0uLL;
    v563 = 0;
    v139 = v569;
    v538 = v570;
    if (v569 != v570)
    {
      v529 = (std::string *)*MEMORY[0x1E4FBA408];
      v525 = *(std::string **)(MEMORY[0x1E4FBA408] + 64);
      v514 = *(std::string **)(MEMORY[0x1E4FBA408] + 72);
      int v513 = CATIsSpotlight & a9;
      while (1)
      {
        uint64_t v140 = *v139;
        if (*(char *)(*v139 + 87) < 0)
        {
          std::string::__init_copy_ctor_external((std::string *)v591, *(const std::string::value_type **)(v140 + 64), *(void *)(v140 + 72));
        }
        else
        {
          *(_OWORD *)v591 = *(_OWORD *)(v140 + 64);
          *(void *)&v591[16] = *(void *)(v140 + 80);
        }
        std::operator+<char>();
        v141 = std::string::append(&v561, "' in pattern '");
        long long v142 = *(_OWORD *)&v141->__r_.__value_.__l.__data_;
        *(void *)&__str[16] = *((void *)&v141->__r_.__value_.__l + 2);
        *(_OWORD *)__str = v142;
        v141->__r_.__value_.__l.__size_ = 0;
        v141->__r_.__value_.__r.__words[2] = 0;
        v141->__r_.__value_.__r.__words[0] = 0;
        uint64_t v143 = v579;
        v144 = (std::string *)(v579 + 64);
        if (*(char *)(v579 + 87) < 0)
        {
          std::string::__init_copy_ctor_external(&v560, *(const std::string::value_type **)(v579 + 64), *(void *)(v579 + 72));
        }
        else
        {
          *(_OWORD *)&v560.__r_.__value_.__l.__data_ = *(_OWORD *)&v144->__r_.__value_.__l.__data_;
          v560.__r_.__value_.__r.__words[2] = *(void *)(v579 + 80);
        }
        if ((v560.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          v145 = &v560;
        }
        else {
          v145 = (std::string *)v560.__r_.__value_.__r.__words[0];
        }
        if ((v560.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          std::string::size_type v146 = HIBYTE(v560.__r_.__value_.__r.__words[2]);
        }
        else {
          std::string::size_type v146 = v560.__r_.__value_.__l.__size_;
        }
        v147 = std::string::append((std::string *)__str, (const std::string::value_type *)v145, v146);
        long long v148 = *(_OWORD *)&v147->__r_.__value_.__l.__data_;
        v609.__r_.__value_.__r.__words[2] = v147->__r_.__value_.__r.__words[2];
        *(_OWORD *)&v609.__r_.__value_.__l.__data_ = v148;
        v147->__r_.__value_.__l.__size_ = 0;
        v147->__r_.__value_.__r.__words[2] = 0;
        v147->__r_.__value_.__r.__words[0] = 0;
        v149 = std::string::append(&v609, "'");
        long long v150 = *(_OWORD *)&v149->__r_.__value_.__l.__data_;
        v597.__end_ = (std::__split_buffer<std::string>::pointer)v149->__r_.__value_.__r.__words[2];
        *(_OWORD *)&v597.__first_ = v150;
        v149->__r_.__value_.__l.__size_ = 0;
        v149->__r_.__value_.__r.__words[2] = 0;
        v149->__r_.__value_.__r.__words[0] = 0;
        siri::dialogengine::Log::LogWithLevel((uint64_t)&v597, 0);
        if (SHIBYTE(v597.__end_) < 0) {
          operator delete(v597.__first_);
        }
        if (SHIBYTE(v609.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v609.__r_.__value_.__l.__data_);
        }
        if (SHIBYTE(v560.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v560.__r_.__value_.__l.__data_);
        }
        if ((__str[23] & 0x80000000) != 0) {
          operator delete(*(void **)__str);
        }
        if (SHIBYTE(v561.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v561.__r_.__value_.__l.__data_);
        }
        uint64_t v152 = *v139;
        v151 = (std::__shared_weak_count *)v139[1];
        if (v151) {
          atomic_fetch_add_explicit(&v151->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        v153 = v571;
        v154 = v572;
        if (v572) {
          atomic_fetch_add_explicit(&v572->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        if (*(char *)(v143 + 87) < 0) {
          std::string::__init_copy_ctor_external(&v561, *(const std::string::value_type **)(v143 + 64), *(void *)(v143 + 72));
        }
        else {
          std::string v561 = *v144;
        }
        char v155 = 0;
        if (v152)
        {
          if (v153) {
            break;
          }
        }
LABEL_381:
        if ((SHIBYTE(v561.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        {
          if (!v154) {
            goto LABEL_384;
          }
LABEL_383:
          std::__shared_weak_count::__release_shared[abi:ne180100](v154);
          goto LABEL_384;
        }
        operator delete(v561.__r_.__value_.__l.__data_);
        if (v154) {
          goto LABEL_383;
        }
LABEL_384:
        if (v151) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v151);
        }
        if ((v155 & 1) == 0)
        {
          uint64_t v195 = v139[2];
          if (v195) {
            int v196 = (*(uint64_t (**)(uint64_t))(*(void *)v195 + 32))(v195) ^ 1;
          }
          else {
            int v196 = 0;
          }
          uint64_t v197 = v139[6];
          id v198 = v533;
          v200 = v198;
          if (v197) {
            int v201 = 1;
          }
          else {
            int v201 = v196;
          }
          if (v201 == 1)
          {
            v202 = v591;
            if (v591[23] < 0) {
              v202 = *(unsigned char **)v591;
            }
            siri::dialogengine::Log::Debug((siri::dialogengine::Log *)"Group '%s' has parameter modifications. Don't try to use cached CAT results.", v199, v202);
            v204 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v200];
            if (v196)
            {
              std::map<std::string,std::shared_ptr<siri::dialogengine::Variable>>::map[abi:ne180100]((uint64_t)&v597, (const void ***)(v139[2] + 72));
              std::__split_buffer<std::string>::pointer v205 = v597.__first_;
              if ((std::__split_buffer<std::string>::pointer *)v597.__first_ != &v597.__begin_)
              {
                do
                {
                  std::string::size_type v206 = v205[2].__r_.__value_.__l.__size_;
                  if (v206)
                  {
                    v609.__r_.__value_.__r.__words[0] = (std::string::size_type)&unk_1F211B740;
                    *(_OWORD *)&v609.__r_.__value_.__r.__words[1] = 0uLL;
                    (*(void (**)(std::string::size_type, std::string *))(*(void *)v206 + 16))(v206, &v609);
                    id v207 = (id)v609.__r_.__value_.__r.__words[2];
                    id v208 = (id)v609.__r_.__value_.__l.__size_;
                    [v204 setObject:v207 forKey:v208];
                  }
                  v209 = (std::__split_buffer<std::string> *)v205->__r_.__value_.__l.__size_;
                  if (v209)
                  {
                    do
                    {
                      v210 = v209;
                      v209 = (std::__split_buffer<std::string> *)v209->__first_;
                    }
                    while (v209);
                  }
                  else
                  {
                    do
                    {
                      v210 = (std::__split_buffer<std::string> *)v205->__r_.__value_.__r.__words[2];
                      BOOL v76 = v210->__first_ == v205;
                      std::__split_buffer<std::string>::pointer v205 = (std::__split_buffer<std::string>::pointer)v210;
                    }
                    while (!v76);
                  }
                  std::__split_buffer<std::string>::pointer v205 = (std::__split_buffer<std::string>::pointer)v210;
                }
                while (v210 != (std::__split_buffer<std::string> *)&v597.__begin_);
              }
              std::__tree<std::__value_type<std::string,std::shared_ptr<siri::dialogengine::JSONValue>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<siri::dialogengine::JSONValue>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<siri::dialogengine::JSONValue>>>>::destroy(v597.__begin_->__r_.__value_.__r.__words);
              uint64_t v86 = 0x1E4F29000uLL;
            }
            if (v197)
            {
              v211 = (void *)v139[4];
              if (v211 != v139 + 5)
              {
                do
                {
                  v212 = v211 + 4;
                  v213 = v211 + 4;
                  if (*((char *)v211 + 55) < 0) {
                    v213 = (void *)*v212;
                  }
                  v214 = v591;
                  if (v591[23] < 0) {
                    v214 = *(unsigned char **)v591;
                  }
                  siri::dialogengine::Log::Debug((siri::dialogengine::Log *)"Deleting parameter '%s' (if it exists) for group '%s'", v203, v213, v214);
                  if (*((char *)v211 + 55) < 0) {
                    v212 = (void *)*v212;
                  }
                  v215 = [*(id *)(v86 + 24) stringWithUTF8String:v212];
                  [v204 removeObjectForKey:v215];

                  v216 = (void *)v211[1];
                  if (v216)
                  {
                    do
                    {
                      v217 = v216;
                      v216 = (void *)*v216;
                    }
                    while (v216);
                  }
                  else
                  {
                    do
                    {
                      v217 = (void *)v211[2];
                      BOOL v76 = *v217 == (void)v211;
                      v211 = v217;
                    }
                    while (!v76);
                  }
                  v211 = v217;
                  uint64_t v86 = 0x1E4F29000;
                }
                while (v217 != v139 + 5);
              }
            }
            id v218 = v204;

            uint64_t v86 = 0x1E4F29000;
          }
          else
          {
            id v218 = v198;
          }
          uint64_t v219 = *v139;
          if (*(char *)(*v139 + 111) < 0) {
            std::string::__init_copy_ctor_external(&v609, *(const std::string::value_type **)(v219 + 88), *(void *)(v219 + 96));
          }
          else {
            std::string v609 = *(std::string *)(v219 + 88);
          }
          if (v513)
          {
LABEL_430:
            id v220 = 0;
            goto LABEL_431;
          }
          std::string::size_type v222 = HIBYTE(v609.__r_.__value_.__r.__words[2]);
          if ((v609.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
            std::string::size_type v222 = v609.__r_.__value_.__l.__size_;
          }
          if (!v222)
          {
            std::operator+<char>();
            v231 = std::string::append(&v560, "' in pattern '");
            long long v232 = *(_OWORD *)&v231->__r_.__value_.__l.__data_;
            v561.__r_.__value_.__r.__words[2] = v231->__r_.__value_.__r.__words[2];
            *(_OWORD *)&v561.__r_.__value_.__l.__data_ = v232;
            v231->__r_.__value_.__l.__size_ = 0;
            v231->__r_.__value_.__r.__words[2] = 0;
            v231->__r_.__value_.__r.__words[0] = 0;
            if (*(char *)(v579 + 87) < 0) {
              std::string::__init_copy_ctor_external(&v559, *(const std::string::value_type **)(v579 + 64), *(void *)(v579 + 72));
            }
            else {
              std::string v559 = *(std::string *)(v579 + 64);
            }
            if ((v559.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
              v297 = &v559;
            }
            else {
              v297 = (std::string *)v559.__r_.__value_.__r.__words[0];
            }
            if ((v559.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
              std::string::size_type v298 = HIBYTE(v559.__r_.__value_.__r.__words[2]);
            }
            else {
              std::string::size_type v298 = v559.__r_.__value_.__l.__size_;
            }
            v299 = std::string::append(&v561, (const std::string::value_type *)v297, v298);
            long long v300 = *(_OWORD *)&v299->__r_.__value_.__l.__data_;
            *(void *)&__str[16] = *((void *)&v299->__r_.__value_.__l + 2);
            *(_OWORD *)__str = v300;
            v299->__r_.__value_.__l.__size_ = 0;
            v299->__r_.__value_.__r.__words[2] = 0;
            v299->__r_.__value_.__r.__words[0] = 0;
            v301 = std::string::append((std::string *)__str, "'");
            long long v302 = *(_OWORD *)&v301->__r_.__value_.__l.__data_;
            v597.__end_ = (std::__split_buffer<std::string>::pointer)v301->__r_.__value_.__r.__words[2];
            *(_OWORD *)&v597.__first_ = v302;
            v301->__r_.__value_.__l.__size_ = 0;
            v301->__r_.__value_.__r.__words[2] = 0;
            v301->__r_.__value_.__r.__words[0] = 0;
            siri::dialogengine::Log::LogWithLevel((uint64_t)&v597, 0);
            if (SHIBYTE(v597.__end_) < 0) {
              operator delete(v597.__first_);
            }
            if ((__str[23] & 0x80000000) != 0) {
              operator delete(*(void **)__str);
            }
            if (SHIBYTE(v559.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v559.__r_.__value_.__l.__data_);
            }
            if (SHIBYTE(v561.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v561.__r_.__value_.__l.__data_);
            }
            if (SHIBYTE(v560.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v560.__r_.__value_.__l.__data_);
            }
            goto LABEL_430;
          }
          if (v201)
          {
            id v220 = 0;
            goto LABEL_670;
          }
          siri::dialogengine::PatternContext::FindPatternCacheEntry((uint64_t)v512, (const void **)&v609.__r_.__value_.__l.__data_, 0, (std::string *)&v597);
          if (SHIBYTE(v597.__end_) >= 0) {
            std::__split_buffer<std::string>::pointer begin = (std::__split_buffer<std::string>::pointer)HIBYTE(v597.__end_);
          }
          else {
            std::__split_buffer<std::string>::pointer begin = v597.__begin_;
          }
          if (begin)
          {
            v251 = [DEResult alloc];
            if (SHIBYTE(v597.__end_) >= 0) {
              v252 = &v597;
            }
            else {
              v252 = v597.__first_;
            }
            v253 = [*(id *)(v86 + 24) stringWithUTF8String:v252];
            id v220 = [(DEResult *)v251 initFromJson:v253];

            v255 = &v609;
            if ((v609.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
              v255 = (std::string *)v609.__r_.__value_.__r.__words[0];
            }
            v256 = v591;
            if (v591[23] < 0) {
              v256 = *(unsigned char **)v591;
            }
            v257 = &v586;
            if ((v586.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
              v257 = (std::string *)v586.__r_.__value_.__r.__words[0];
            }
            siri::dialogengine::Log::Info((siri::dialogengine::Log *)"Using cached result for dialog CAT '%s' for group '%s' in pattern '%s'", v254, v255, v256, v257);
          }
          else
          {
            v335 = &v609;
            if ((v609.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
              v335 = (std::string *)v609.__r_.__value_.__r.__words[0];
            }
            v336 = v591;
            if (v591[23] < 0) {
              v336 = *(unsigned char **)v591;
            }
            v337 = &v586;
            if ((v586.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
              v337 = (std::string *)v586.__r_.__value_.__r.__words[0];
            }
            id v220 = 0;
            siri::dialogengine::Log::Info((siri::dialogengine::Log *)"No cached result found for dialog CAT '%s' for group '%s' in pattern '%s'", v249, v335, v336, v337);
          }
          if (SHIBYTE(v597.__end_) < 0)
          {
            operator delete(v597.__first_);
            if (!begin) {
              goto LABEL_670;
            }
            goto LABEL_431;
          }
          if (begin) {
            goto LABEL_431;
          }
LABEL_670:
          std::operator+<char>();
          v338 = std::string::append(&v558, "' for group '");
          long long v339 = *(_OWORD *)&v338->__r_.__value_.__l.__data_;
          v559.__r_.__value_.__r.__words[2] = v338->__r_.__value_.__r.__words[2];
          *(_OWORD *)&v559.__r_.__value_.__l.__data_ = v339;
          v338->__r_.__value_.__l.__size_ = 0;
          v338->__r_.__value_.__r.__words[2] = 0;
          v338->__r_.__value_.__r.__words[0] = 0;
          if (v591[23] >= 0) {
            v340 = v591;
          }
          else {
            v340 = *(const std::string::value_type **)v591;
          }
          if (v591[23] >= 0) {
            std::string::size_type v341 = v591[23];
          }
          else {
            std::string::size_type v341 = *(void *)&v591[8];
          }
          v342 = std::string::append(&v559, v340, v341);
          long long v343 = *(_OWORD *)&v342->__r_.__value_.__l.__data_;
          v560.__r_.__value_.__r.__words[2] = v342->__r_.__value_.__r.__words[2];
          *(_OWORD *)&v560.__r_.__value_.__l.__data_ = v343;
          v342->__r_.__value_.__l.__size_ = 0;
          v342->__r_.__value_.__r.__words[2] = 0;
          v342->__r_.__value_.__r.__words[0] = 0;
          v344 = std::string::append(&v560, "' in pattern '");
          long long v345 = *(_OWORD *)&v344->__r_.__value_.__l.__data_;
          v561.__r_.__value_.__r.__words[2] = v344->__r_.__value_.__r.__words[2];
          *(_OWORD *)&v561.__r_.__value_.__l.__data_ = v345;
          v344->__r_.__value_.__l.__size_ = 0;
          v344->__r_.__value_.__r.__words[2] = 0;
          v344->__r_.__value_.__r.__words[0] = 0;
          if (*(char *)(v579 + 87) < 0) {
            std::string::__init_copy_ctor_external(&v557, *(const std::string::value_type **)(v579 + 64), *(void *)(v579 + 72));
          }
          else {
            std::string v557 = *(std::string *)(v579 + 64);
          }
          if ((v557.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            v346 = &v557;
          }
          else {
            v346 = (std::string *)v557.__r_.__value_.__r.__words[0];
          }
          if ((v557.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            std::string::size_type v347 = HIBYTE(v557.__r_.__value_.__r.__words[2]);
          }
          else {
            std::string::size_type v347 = v557.__r_.__value_.__l.__size_;
          }
          v348 = std::string::append(&v561, (const std::string::value_type *)v346, v347);
          long long v349 = *(_OWORD *)&v348->__r_.__value_.__l.__data_;
          *(void *)&__str[16] = *((void *)&v348->__r_.__value_.__l + 2);
          *(_OWORD *)__str = v349;
          v348->__r_.__value_.__l.__size_ = 0;
          v348->__r_.__value_.__r.__words[2] = 0;
          v348->__r_.__value_.__r.__words[0] = 0;
          v350 = std::string::append((std::string *)__str, "'");
          long long v351 = *(_OWORD *)&v350->__r_.__value_.__l.__data_;
          v597.__end_ = (std::__split_buffer<std::string>::pointer)v350->__r_.__value_.__r.__words[2];
          *(_OWORD *)&v597.__first_ = v351;
          v350->__r_.__value_.__l.__size_ = 0;
          v350->__r_.__value_.__r.__words[2] = 0;
          v350->__r_.__value_.__r.__words[0] = 0;
          siri::dialogengine::Log::LogWithLevel((uint64_t)&v597, 0);
          if (SHIBYTE(v597.__end_) < 0) {
            operator delete(v597.__first_);
          }
          if ((__str[23] & 0x80000000) != 0) {
            operator delete(*(void **)__str);
          }
          if (SHIBYTE(v557.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v557.__r_.__value_.__l.__data_);
          }
          if (SHIBYTE(v561.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v561.__r_.__value_.__l.__data_);
          }
          if (SHIBYTE(v560.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v560.__r_.__value_.__l.__data_);
          }
          if (SHIBYTE(v559.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v559.__r_.__value_.__l.__data_);
          }
          if (SHIBYTE(v558.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v558.__r_.__value_.__l.__data_);
          }
          if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0) {
            std::string::__init_copy_ctor_external(&v556, __s.__r_.__value_.__l.__data_, __s.__r_.__value_.__l.__size_);
          }
          else {
            std::string v556 = __s;
          }
          if (SHIBYTE(v609.__r_.__value_.__r.__words[2]) < 0) {
            std::string::__init_copy_ctor_external(&v555, v609.__r_.__value_.__l.__data_, v609.__r_.__value_.__l.__size_);
          }
          else {
            std::string v555 = v609;
          }
          if (SHIBYTE(v586.__r_.__value_.__r.__words[2]) < 0) {
            std::string::__init_copy_ctor_external(&v554, v586.__r_.__value_.__l.__data_, v586.__r_.__value_.__l.__size_);
          }
          else {
            std::string v554 = v586;
          }
          v552 = v512;
          v553 = v510;
          atomic_fetch_add_explicit(&v510->__shared_owners_, 1uLL, memory_order_relaxed);
          id v551 = 0;
          LODWORD(v509) = a9;
          v296 = +[CATPattern executeCAT:v528 templateDir:&v556 catId:&v555 patternId:&v554 requestType:0 parameters:v218 globals:v536 patternContext:&v552 callback:v520 options:v509 error:&v551];
          id v295 = v551;

          if (v553) {
            std::__shared_weak_count::__release_shared[abi:ne180100](v553);
          }
          if (SHIBYTE(v554.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v554.__r_.__value_.__l.__data_);
          }
          if (SHIBYTE(v555.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v555.__r_.__value_.__l.__data_);
          }
          if (SHIBYTE(v556.__r_.__value_.__r.__words[2]) < 0)
          {
            operator delete(v556.__r_.__value_.__l.__data_);
            if (!v295) {
              goto LABEL_736;
            }
LABEL_716:
            LogPatternExecutionResult(v541);
            std::operator+<char>();
            v352 = std::string::append(&v559, "' for group '");
            long long v353 = *(_OWORD *)&v352->__r_.__value_.__l.__data_;
            v560.__r_.__value_.__r.__words[2] = v352->__r_.__value_.__r.__words[2];
            *(_OWORD *)&v560.__r_.__value_.__l.__data_ = v353;
            v352->__r_.__value_.__l.__size_ = 0;
            v352->__r_.__value_.__r.__words[2] = 0;
            v352->__r_.__value_.__r.__words[0] = 0;
            if (v591[23] >= 0) {
              v354 = v591;
            }
            else {
              v354 = *(const std::string::value_type **)v591;
            }
            if (v591[23] >= 0) {
              std::string::size_type v355 = v591[23];
            }
            else {
              std::string::size_type v355 = *(void *)&v591[8];
            }
            v356 = std::string::append(&v560, v354, v355);
            long long v357 = *(_OWORD *)&v356->__r_.__value_.__l.__data_;
            v561.__r_.__value_.__r.__words[2] = v356->__r_.__value_.__r.__words[2];
            *(_OWORD *)&v561.__r_.__value_.__l.__data_ = v357;
            v356->__r_.__value_.__l.__size_ = 0;
            v356->__r_.__value_.__r.__words[2] = 0;
            v356->__r_.__value_.__r.__words[0] = 0;
            v358 = std::string::append(&v561, "': ");
            long long v359 = *(_OWORD *)&v358->__r_.__value_.__l.__data_;
            *(void *)&__str[16] = *((void *)&v358->__r_.__value_.__l + 2);
            *(_OWORD *)__str = v359;
            v358->__r_.__value_.__l.__size_ = 0;
            v358->__r_.__value_.__r.__words[2] = 0;
            v358->__r_.__value_.__r.__words[0] = 0;
            id v360 = [v295 localizedDescription];
            v361 = std::string::append((std::string *)__str, (const std::string::value_type *)[v360 UTF8String]);
            long long v362 = *(_OWORD *)&v361->__r_.__value_.__l.__data_;
            v597.__end_ = (std::__split_buffer<std::string>::pointer)v361->__r_.__value_.__r.__words[2];
            *(_OWORD *)&v597.__first_ = v362;
            v361->__r_.__value_.__l.__size_ = 0;
            v361->__r_.__value_.__r.__words[2] = 0;
            v361->__r_.__value_.__r.__words[0] = 0;

            if ((__str[23] & 0x80000000) != 0) {
              operator delete(*(void **)__str);
            }
            if (SHIBYTE(v561.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v561.__r_.__value_.__l.__data_);
            }
            if (SHIBYTE(v560.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v560.__r_.__value_.__l.__data_);
            }
            if (SHIBYTE(v559.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v559.__r_.__value_.__l.__data_);
            }
            std::string::basic_string[abi:ne180100]<0>(__str, "request-error");
            v363 = NSErrorFromString((uint64_t *)&v597, (uint64_t *)__str);
            v524[2](v524, v541, v363);

            if ((__str[23] & 0x80000000) != 0) {
              operator delete(*(void **)__str);
            }
            if (SHIBYTE(v597.__end_) < 0) {
              operator delete(v597.__first_);
            }
            p_std::string::size_type size = 1;
          }
          else
          {
            if (v295) {
              goto LABEL_716;
            }
LABEL_736:
            if ((v201 & 1) == 0)
            {
              v364 = &v609;
              if ((v609.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
                v364 = (std::string *)v609.__r_.__value_.__r.__words[0];
              }
              siri::dialogengine::Log::Debug((siri::dialogengine::Log *)"Caching result for dialog CAT '%s'", v199, v364);
              id v365 = [v296 json];
              std::string::basic_string[abi:ne180100]<0>(&v597, (char *)[v365 UTF8String]);
              siri::dialogengine::PatternContext::AddEntryToPatternCache((uint64_t)v512, (uint64_t)&v609, (uint64_t)&v597, 0);
              if (SHIBYTE(v597.__end_) < 0) {
                operator delete(v597.__first_);
              }
            }
            id v220 = v296;
LABEL_431:
            uint64_t v221 = *v139;
            if (*(char *)(*v139 + 135) < 0)
            {
              std::string::__init_copy_ctor_external((std::string *)__str, *(const std::string::value_type **)(v221 + 112), *(void *)(v221 + 120));
            }
            else
            {
              *(_OWORD *)__str = *(_OWORD *)(v221 + 112);
              *(void *)&__str[16] = *(void *)(v221 + 128);
            }
            uint64_t v223 = __str[23];
            int v224 = __str[23];
            if (__str[23] < 0) {
              uint64_t v223 = *(void *)&__str[8];
            }
            if (!v223)
            {
              std::operator+<char>();
              v228 = std::string::append(&v559, "' in pattern '");
              long long v229 = *(_OWORD *)&v228->__r_.__value_.__l.__data_;
              v560.__r_.__value_.__r.__words[2] = v228->__r_.__value_.__r.__words[2];
              *(_OWORD *)&v560.__r_.__value_.__l.__data_ = v229;
              v228->__r_.__value_.__l.__size_ = 0;
              v228->__r_.__value_.__r.__words[2] = 0;
              v228->__r_.__value_.__r.__words[0] = 0;
              if (*(char *)(v579 + 87) < 0) {
                std::string::__init_copy_ctor_external(&v558, *(const std::string::value_type **)(v579 + 64), *(void *)(v579 + 72));
              }
              else {
                std::string v558 = *(std::string *)(v579 + 64);
              }
              if ((v558.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                v242 = &v558;
              }
              else {
                v242 = (std::string *)v558.__r_.__value_.__r.__words[0];
              }
              if ((v558.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                std::string::size_type v243 = HIBYTE(v558.__r_.__value_.__r.__words[2]);
              }
              else {
                std::string::size_type v243 = v558.__r_.__value_.__l.__size_;
              }
              v244 = std::string::append(&v560, (const std::string::value_type *)v242, v243);
              long long v245 = *(_OWORD *)&v244->__r_.__value_.__l.__data_;
              v561.__r_.__value_.__r.__words[2] = v244->__r_.__value_.__r.__words[2];
              *(_OWORD *)&v561.__r_.__value_.__l.__data_ = v245;
              v244->__r_.__value_.__l.__size_ = 0;
              v244->__r_.__value_.__r.__words[2] = 0;
              v244->__r_.__value_.__r.__words[0] = 0;
              v246 = std::string::append(&v561, "'");
              long long v247 = *(_OWORD *)&v246->__r_.__value_.__l.__data_;
              v597.__end_ = (std::__split_buffer<std::string>::pointer)v246->__r_.__value_.__r.__words[2];
              *(_OWORD *)&v597.__first_ = v247;
              v246->__r_.__value_.__l.__size_ = 0;
              v246->__r_.__value_.__r.__words[2] = 0;
              v246->__r_.__value_.__r.__words[0] = 0;
              siri::dialogengine::Log::LogWithLevel((uint64_t)&v597, 0);
              if (SHIBYTE(v597.__end_) < 0) {
                operator delete(v597.__first_);
              }
              if (SHIBYTE(v561.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(v561.__r_.__value_.__l.__data_);
              }
              if (SHIBYTE(v558.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(v558.__r_.__value_.__l.__data_);
              }
              if (SHIBYTE(v560.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(v560.__r_.__value_.__l.__data_);
              }
              if (SHIBYTE(v559.__r_.__value_.__r.__words[2]) < 0)
              {
                std::__split_buffer<std::string>::pointer v248 = (std::__split_buffer<std::string>::pointer)v559.__r_.__value_.__r.__words[0];
                goto LABEL_505;
              }
LABEL_506:
              id v230 = 0;
              goto LABEL_507;
            }
            if (v534 == 1)
            {
              v225 = *(unsigned char **)__str;
              int v226 = v591[23];
              v227 = *(unsigned char **)v591;
              if (*(char *)(v579 + 87) < 0)
              {
                std::string::__init_copy_ctor_external((std::string *)&v597, *(const std::string::value_type **)(v579 + 64), *(void *)(v579 + 72));
              }
              else
              {
                *(_OWORD *)&v597.__first_ = *(_OWORD *)(v579 + 64);
                v597.__end_ = *(std::__split_buffer<std::string>::pointer *)(v579 + 80);
              }
              v258 = v591;
              if (v226 < 0) {
                v258 = v227;
              }
              v259 = __str;
              if (v224 < 0) {
                v259 = v225;
              }
              v260 = &v597;
              if (SHIBYTE(v597.__end_) < 0) {
                v260 = v597.__first_;
              }
              siri::dialogengine::Log::Info((siri::dialogengine::Log *)"Skipping visual CAT '%s' for group '%s' in pattern '%s' because response mode is 'voiceOnly'", v199, v259, v258, v260);
              if (SHIBYTE(v597.__end_) < 0)
              {
                std::__split_buffer<std::string>::pointer v248 = v597.__first_;
LABEL_505:
                operator delete(v248);
              }
              goto LABEL_506;
            }
            if (v201)
            {
              id v230 = 0;
              goto LABEL_586;
            }
            siri::dialogengine::PatternContext::FindPatternCacheEntry((uint64_t)v512, (const void **)__str, 1, (std::string *)&v597);
            if (SHIBYTE(v597.__end_) >= 0) {
              std::__split_buffer<std::string>::pointer v234 = (std::__split_buffer<std::string>::pointer)HIBYTE(v597.__end_);
            }
            else {
              std::__split_buffer<std::string>::pointer v234 = v597.__begin_;
            }
            if (v234)
            {
              v235 = [DEResult alloc];
              if (SHIBYTE(v597.__end_) >= 0) {
                v236 = &v597;
              }
              else {
                v236 = v597.__first_;
              }
              v237 = [NSString stringWithUTF8String:v236];
              id v230 = [(DEResult *)v235 initFromJson:v237];

              v239 = __str;
              if (__str[23] < 0) {
                v239 = *(unsigned char **)__str;
              }
              v240 = v591;
              if (v591[23] < 0) {
                v240 = *(unsigned char **)v591;
              }
              v241 = &v586;
              if ((v586.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
                v241 = (std::string *)v586.__r_.__value_.__r.__words[0];
              }
              siri::dialogengine::Log::Info((siri::dialogengine::Log *)"Using cached result for visual CAT '%s' for group '%s' in pattern '%s'", v238, v239, v240, v241);
            }
            else
            {
              v303 = __str;
              if (__str[23] < 0) {
                v303 = *(unsigned char **)__str;
              }
              v304 = v591;
              if (v591[23] < 0) {
                v304 = *(unsigned char **)v591;
              }
              v305 = &v586;
              if ((v586.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
                v305 = (std::string *)v586.__r_.__value_.__r.__words[0];
              }
              id v230 = 0;
              siri::dialogengine::Log::Info((siri::dialogengine::Log *)"No cached result found for visual CAT '%s' for group '%s' in pattern '%s'", v233, v303, v304, v305);
            }
            if (SHIBYTE(v597.__end_) < 0)
            {
              operator delete(v597.__first_);
              if (!v234) {
                goto LABEL_586;
              }
              goto LABEL_507;
            }
            if (v234) {
              goto LABEL_507;
            }
LABEL_586:
            std::operator+<char>();
            v306 = std::string::append(&v557, "' for group '");
            long long v307 = *(_OWORD *)&v306->__r_.__value_.__l.__data_;
            v558.__r_.__value_.__r.__words[2] = v306->__r_.__value_.__r.__words[2];
            *(_OWORD *)&v558.__r_.__value_.__l.__data_ = v307;
            v306->__r_.__value_.__l.__size_ = 0;
            v306->__r_.__value_.__r.__words[2] = 0;
            v306->__r_.__value_.__r.__words[0] = 0;
            if (v591[23] >= 0) {
              v308 = v591;
            }
            else {
              v308 = *(const std::string::value_type **)v591;
            }
            if (v591[23] >= 0) {
              std::string::size_type v309 = v591[23];
            }
            else {
              std::string::size_type v309 = *(void *)&v591[8];
            }
            v310 = std::string::append(&v558, v308, v309);
            long long v311 = *(_OWORD *)&v310->__r_.__value_.__l.__data_;
            v559.__r_.__value_.__r.__words[2] = v310->__r_.__value_.__r.__words[2];
            *(_OWORD *)&v559.__r_.__value_.__l.__data_ = v311;
            v310->__r_.__value_.__l.__size_ = 0;
            v310->__r_.__value_.__r.__words[2] = 0;
            v310->__r_.__value_.__r.__words[0] = 0;
            v312 = std::string::append(&v559, "' in pattern '");
            long long v313 = *(_OWORD *)&v312->__r_.__value_.__l.__data_;
            v560.__r_.__value_.__r.__words[2] = v312->__r_.__value_.__r.__words[2];
            *(_OWORD *)&v560.__r_.__value_.__l.__data_ = v313;
            v312->__r_.__value_.__l.__size_ = 0;
            v312->__r_.__value_.__r.__words[2] = 0;
            v312->__r_.__value_.__r.__words[0] = 0;
            if (*(char *)(v579 + 87) < 0) {
              std::string::__init_copy_ctor_external(&v550, *(const std::string::value_type **)(v579 + 64), *(void *)(v579 + 72));
            }
            else {
              std::string v550 = *(std::string *)(v579 + 64);
            }
            if ((v550.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
              v314 = &v550;
            }
            else {
              v314 = (std::string *)v550.__r_.__value_.__r.__words[0];
            }
            if ((v550.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
              std::string::size_type v315 = HIBYTE(v550.__r_.__value_.__r.__words[2]);
            }
            else {
              std::string::size_type v315 = v550.__r_.__value_.__l.__size_;
            }
            v316 = std::string::append(&v560, (const std::string::value_type *)v314, v315);
            long long v317 = *(_OWORD *)&v316->__r_.__value_.__l.__data_;
            v561.__r_.__value_.__r.__words[2] = v316->__r_.__value_.__r.__words[2];
            *(_OWORD *)&v561.__r_.__value_.__l.__data_ = v317;
            v316->__r_.__value_.__l.__size_ = 0;
            v316->__r_.__value_.__r.__words[2] = 0;
            v316->__r_.__value_.__r.__words[0] = 0;
            v318 = std::string::append(&v561, "'");
            long long v319 = *(_OWORD *)&v318->__r_.__value_.__l.__data_;
            v597.__end_ = (std::__split_buffer<std::string>::pointer)v318->__r_.__value_.__r.__words[2];
            *(_OWORD *)&v597.__first_ = v319;
            v318->__r_.__value_.__l.__size_ = 0;
            v318->__r_.__value_.__r.__words[2] = 0;
            v318->__r_.__value_.__r.__words[0] = 0;
            siri::dialogengine::Log::LogWithLevel((uint64_t)&v597, 0);
            if (SHIBYTE(v597.__end_) < 0) {
              operator delete(v597.__first_);
            }
            if (SHIBYTE(v561.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v561.__r_.__value_.__l.__data_);
            }
            if (SHIBYTE(v550.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v550.__r_.__value_.__l.__data_);
            }
            if (SHIBYTE(v560.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v560.__r_.__value_.__l.__data_);
            }
            if (SHIBYTE(v559.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v559.__r_.__value_.__l.__data_);
            }
            if (SHIBYTE(v558.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v558.__r_.__value_.__l.__data_);
            }
            if (SHIBYTE(v557.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v557.__r_.__value_.__l.__data_);
            }
            if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0) {
              std::string::__init_copy_ctor_external(&v549, __s.__r_.__value_.__l.__data_, __s.__r_.__value_.__l.__size_);
            }
            else {
              std::string v549 = __s;
            }
            if ((__str[23] & 0x80000000) != 0) {
              std::string::__init_copy_ctor_external(&v548, *(const std::string::value_type **)__str, *(std::string::size_type *)&__str[8]);
            }
            else {
              std::string v548 = *(std::string *)__str;
            }
            if (SHIBYTE(v586.__r_.__value_.__r.__words[2]) < 0) {
              std::string::__init_copy_ctor_external(&v547, v586.__r_.__value_.__l.__data_, v586.__r_.__value_.__l.__size_);
            }
            else {
              std::string v547 = v586;
            }
            v545 = v512;
            v546 = v510;
            atomic_fetch_add_explicit(&v510->__shared_owners_, 1uLL, memory_order_relaxed);
            id v544 = 0;
            LODWORD(v509) = a9;
            id v295 = +[CATPattern executeCAT:v528 templateDir:&v549 catId:&v548 patternId:&v547 requestType:1 parameters:v218 globals:v536 patternContext:&v545 callback:v520 options:v509 error:&v544];
            id v279 = v544;

            if (v546) {
              std::__shared_weak_count::__release_shared[abi:ne180100](v546);
            }
            if (SHIBYTE(v547.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v547.__r_.__value_.__l.__data_);
            }
            if (SHIBYTE(v548.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v548.__r_.__value_.__l.__data_);
            }
            if (SHIBYTE(v549.__r_.__value_.__r.__words[2]) < 0)
            {
              operator delete(v549.__r_.__value_.__l.__data_);
              if (!v279) {
                goto LABEL_652;
              }
LABEL_632:
              LogPatternExecutionResult(v541);
              std::operator+<char>();
              v321 = std::string::append(&v558, "' for group '");
              long long v322 = *(_OWORD *)&v321->__r_.__value_.__l.__data_;
              v559.__r_.__value_.__r.__words[2] = v321->__r_.__value_.__r.__words[2];
              *(_OWORD *)&v559.__r_.__value_.__l.__data_ = v322;
              v321->__r_.__value_.__l.__size_ = 0;
              v321->__r_.__value_.__r.__words[2] = 0;
              v321->__r_.__value_.__r.__words[0] = 0;
              if (v591[23] >= 0) {
                v323 = v591;
              }
              else {
                v323 = *(const std::string::value_type **)v591;
              }
              if (v591[23] >= 0) {
                std::string::size_type v324 = v591[23];
              }
              else {
                std::string::size_type v324 = *(void *)&v591[8];
              }
              v325 = std::string::append(&v559, v323, v324);
              long long v326 = *(_OWORD *)&v325->__r_.__value_.__l.__data_;
              v560.__r_.__value_.__r.__words[2] = v325->__r_.__value_.__r.__words[2];
              *(_OWORD *)&v560.__r_.__value_.__l.__data_ = v326;
              v325->__r_.__value_.__l.__size_ = 0;
              v325->__r_.__value_.__r.__words[2] = 0;
              v325->__r_.__value_.__r.__words[0] = 0;
              v327 = std::string::append(&v560, "': ");
              long long v328 = *(_OWORD *)&v327->__r_.__value_.__l.__data_;
              v561.__r_.__value_.__r.__words[2] = v327->__r_.__value_.__r.__words[2];
              *(_OWORD *)&v561.__r_.__value_.__l.__data_ = v328;
              v327->__r_.__value_.__l.__size_ = 0;
              v327->__r_.__value_.__r.__words[2] = 0;
              v327->__r_.__value_.__r.__words[0] = 0;
              id v329 = [v279 localizedDescription];
              v330 = std::string::append(&v561, (const std::string::value_type *)[v329 UTF8String]);
              long long v331 = *(_OWORD *)&v330->__r_.__value_.__l.__data_;
              v597.__end_ = (std::__split_buffer<std::string>::pointer)v330->__r_.__value_.__r.__words[2];
              *(_OWORD *)&v597.__first_ = v331;
              v330->__r_.__value_.__l.__size_ = 0;
              v330->__r_.__value_.__r.__words[2] = 0;
              v330->__r_.__value_.__r.__words[0] = 0;

              if (SHIBYTE(v561.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(v561.__r_.__value_.__l.__data_);
              }
              if (SHIBYTE(v560.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(v560.__r_.__value_.__l.__data_);
              }
              if (SHIBYTE(v559.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(v559.__r_.__value_.__l.__data_);
              }
              if (SHIBYTE(v558.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(v558.__r_.__value_.__l.__data_);
              }
              std::string::basic_string[abi:ne180100]<0>(&v561, "request-error");
              v332 = NSErrorFromString((uint64_t *)&v597, (uint64_t *)&v561);
              v524[2](v524, v541, v332);

              if (SHIBYTE(v561.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(v561.__r_.__value_.__l.__data_);
              }
              if (SHIBYTE(v597.__end_) < 0) {
                operator delete(v597.__first_);
              }
              p_std::string::size_type size = 1;
            }
            else
            {
              if (v279) {
                goto LABEL_632;
              }
LABEL_652:
              if ((v201 & 1) == 0)
              {
                v333 = __str;
                if (__str[23] < 0) {
                  v333 = *(unsigned char **)__str;
                }
                siri::dialogengine::Log::Debug((siri::dialogengine::Log *)"Caching result for visual CAT '%s'", v320, v333);
                id v334 = [v295 json];
                std::string::basic_string[abi:ne180100]<0>(&v597, (char *)[v334 UTF8String]);
                siri::dialogengine::PatternContext::AddEntryToPatternCache((uint64_t)v512, (uint64_t)__str, (uint64_t)&v597, 1);
                if (SHIBYTE(v597.__end_) < 0) {
                  operator delete(v597.__first_);
                }
              }
              id v230 = v295;
LABEL_507:
              if ((v609.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                v261 = &v609;
              }
              else {
                v261 = (std::string *)v609.__r_.__value_.__r.__words[0];
              }
              v262 = [NSString stringWithUTF8String:v261];
              uint64_t v263 = +[CATCommonApi DEResultToCATResult:v220 catId:v262];
              uint64_t v264 = v263;
              uint64_t v265 = v564.i64[1];
              if (v564.i64[1] >= (unint64_t)v565)
              {
                uint64_t v267 = (v564.i64[1] - v564.i64[0]) >> 3;
                if ((unint64_t)(v267 + 1) >> 61) {
                  std::vector<BOOL>::__throw_length_error[abi:ne180100]();
                }
                unint64_t v268 = ((uint64_t)v565 - v564.i64[0]) >> 2;
                if (v268 <= v267 + 1) {
                  unint64_t v268 = v267 + 1;
                }
                if ((unint64_t)v565 - v564.i64[0] >= 0x7FFFFFFFFFFFFFF8) {
                  unint64_t v269 = 0x1FFFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v269 = v268;
                }
                v597.__end_cap_.__value_ = (std::allocator<std::string> *)&v565;
                if (v269) {
                  unint64_t v269 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<morphun::dialog::SemanticFeatureConceptBase *>>(v269);
                }
                else {
                  uint64_t v270 = 0;
                }
                unint64_t v271 = v269 + 8 * v267;
                v272 = (std::string *)(v269 + 8 * v270);
                v597.__end_cap_.__value_ = v272;
                *(void *)unint64_t v271 = v264;
                std::__split_buffer<std::string>::pointer v266 = (std::__split_buffer<std::string>::pointer)(v271 + 8);
                v597.__end_ = (std::__split_buffer<std::string>::pointer)(v271 + 8);
                v273 = (void *)v564.i64[1];
                v274 = (void *)v564.i64[0];
                if (v564.i64[1] == v564.i64[0])
                {
                  int64x2_t v276 = vdupq_n_s64(v564.u64[1]);
                }
                else
                {
                  do
                  {
                    uint64_t v275 = *--v273;
                    void *v273 = 0;
                    *(void *)(v271 - 8) = v275;
                    v271 -= 8;
                  }
                  while (v273 != v274);
                  int64x2_t v276 = v564;
                  std::__split_buffer<std::string>::pointer v266 = v597.__end_;
                  v272 = v597.__end_cap_.__value_;
                }
                v564.i64[0] = v271;
                v564.i64[1] = (uint64_t)v266;
                *(int64x2_t *)&v597.__begin_ = v276;
                v277 = v565;
                v565 = v272;
                v597.__end_cap_.__value_ = v277;
                v597.__first_ = (std::__split_buffer<std::string>::pointer)v276.i64[0];
                std::__split_buffer<CATResult * {__strong}>::~__split_buffer((uint64_t)&v597);
              }
              else
              {
                *(void *)v564.i64[1] = v263;
                std::__split_buffer<std::string>::pointer v266 = (std::__split_buffer<std::string>::pointer)(v265 + 8);
              }
              v564.i64[1] = (uint64_t)v266;

              if (__str[23] >= 0) {
                v278 = __str;
              }
              else {
                v278 = *(unsigned char **)__str;
              }
              id v279 = [NSString stringWithUTF8String:v278];
              uint64_t v280 = +[CATCommonApi DEResultToCATResult:v230 catId:v279];
              uint64_t v281 = v280;
              uint64_t v282 = v562.i64[1];
              if (v562.i64[1] >= (unint64_t)v563)
              {
                uint64_t v284 = (v562.i64[1] - v562.i64[0]) >> 3;
                if ((unint64_t)(v284 + 1) >> 61) {
                  std::vector<BOOL>::__throw_length_error[abi:ne180100]();
                }
                unint64_t v285 = ((uint64_t)v563 - v562.i64[0]) >> 2;
                if (v285 <= v284 + 1) {
                  unint64_t v285 = v284 + 1;
                }
                if ((unint64_t)v563 - v562.i64[0] >= 0x7FFFFFFFFFFFFFF8) {
                  unint64_t v286 = 0x1FFFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v286 = v285;
                }
                v597.__end_cap_.__value_ = (std::allocator<std::string> *)&v563;
                if (v286) {
                  unint64_t v286 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<morphun::dialog::SemanticFeatureConceptBase *>>(v286);
                }
                else {
                  uint64_t v287 = 0;
                }
                unint64_t v288 = v286 + 8 * v284;
                v289 = (std::string *)(v286 + 8 * v287);
                v597.__end_cap_.__value_ = v289;
                *(void *)unint64_t v288 = v281;
                std::__split_buffer<std::string>::pointer v283 = (std::__split_buffer<std::string>::pointer)(v288 + 8);
                v597.__end_ = (std::__split_buffer<std::string>::pointer)(v288 + 8);
                v290 = (void *)v562.i64[1];
                v291 = (void *)v562.i64[0];
                if (v562.i64[1] == v562.i64[0])
                {
                  int64x2_t v293 = vdupq_n_s64(v562.u64[1]);
                }
                else
                {
                  do
                  {
                    uint64_t v292 = *--v290;
                    void *v290 = 0;
                    *(void *)(v288 - 8) = v292;
                    v288 -= 8;
                  }
                  while (v290 != v291);
                  int64x2_t v293 = v562;
                  std::__split_buffer<std::string>::pointer v283 = v597.__end_;
                  v289 = v597.__end_cap_.__value_;
                }
                v562.i64[0] = v288;
                v562.i64[1] = (uint64_t)v283;
                *(int64x2_t *)&v597.__begin_ = v293;
                v294 = v563;
                v563 = v289;
                v597.__end_cap_.__value_ = v294;
                v597.__first_ = (std::__split_buffer<std::string>::pointer)v293.i64[0];
                std::__split_buffer<CATResult * {__strong}>::~__split_buffer((uint64_t)&v597);
              }
              else
              {
                *(void *)v562.i64[1] = v280;
                std::__split_buffer<std::string>::pointer v283 = (std::__split_buffer<std::string>::pointer)(v282 + 8);
              }
              p_std::string::size_type size = 0;
              v562.i64[1] = (uint64_t)v283;
              id v295 = v230;
            }

            if ((__str[23] & 0x80000000) != 0) {
              operator delete(*(void **)__str);
            }
            v296 = v220;
          }

          if (SHIBYTE(v609.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v609.__r_.__value_.__l.__data_);
          }

          uint64_t v86 = 0x1E4F29000;
          goto LABEL_552;
        }
        p_std::string::size_type size = 11;
LABEL_552:
        if ((v591[23] & 0x80000000) != 0) {
          operator delete(*(void **)v591);
        }
        if (p_size != 11 && p_size)
        {
          v597.__first_ = (std::__split_buffer<std::string>::pointer)&v562;
          std::vector<CATResult * {__strong}>::__destroy_vector::operator()[abi:ne180100]((void ***)&v597);
          v597.__first_ = (std::__split_buffer<std::string>::pointer)&v564;
          std::vector<CATResult * {__strong}>::__destroy_vector::operator()[abi:ne180100]((void ***)&v597);
          if (v567 < 0) {
            operator delete(v566[0]);
          }
          v597.__first_ = (std::__split_buffer<std::string>::pointer)&v568;
          std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v597);
          std::__shared_weak_count::__release_shared[abi:ne180100](v510);
          v597.__first_ = (std::__split_buffer<std::string>::pointer)&v569;
          std::vector<siri::dialogengine::ExecutePatternBase::Stage>::__destroy_vector::operator()[abi:ne180100]((void ***)&v597);
          if (v572) {
            std::__shared_weak_count::__release_shared[abi:ne180100](v572);
          }
          goto LABEL_928;
        }
        v139 += 7;
        if (v139 == v538)
        {
          if (v570 != v569)
          {
            uint64_t v366 = 0;
            do
            {
              v367 = *(void **)(v564.i64[0] + 8 * v366);
              uint64_t v531 = v366;
              v368 = *(void **)(v562.i64[0] + 8 * v366);
              v542 = v541;
              id v369 = v367;
              id v370 = v368;
              v371 = (void *)MEMORY[0x1E4F1CA60];
              id v539 = v370;
              v372 = [v370 meta];
              p_std::string::size_type size = [v371 dictionaryWithDictionary:v372];

              long long v595 = 0u;
              long long v596 = 0u;
              memset(__str, 0, sizeof(__str));
              v373 = [v539 meta];
              uint64_t v374 = [v373 countByEnumeratingWithState:__str objects:&v597 count:16];
              if (v374)
              {
                uint64_t v375 = **(void **)&__str[16];
                do
                {
                  for (uint64_t i = 0; i != v374; ++i)
                  {
                    if (**(void **)&__str[16] != v375) {
                      objc_enumerationMutation(v373);
                    }
                    v377 = *(void **)(*(void *)&__str[8] + 8 * i);
                    uint64_t v86 = [v369 meta];
                    v378 = [(id)v86 objectForKey:v377];
                    BOOL v379 = v378 == 0;

                    if (!v379)
                    {
                      uint64_t v380 = [v377 UTF8String];
                      siri::dialogengine::Log::Warn((siri::dialogengine::Log *)"Pattern result meta conflict, visual and dialog result meta both contain key '%s'", v381, v380);
                    }
                  }
                  uint64_t v374 = [v373 countByEnumeratingWithState:__str objects:&v597 count:16];
                }
                while (v374);
              }

              v382 = [v369 meta];
              [(id)p_size addEntriesFromDictionary:v382];

              long long v592 = 0u;
              long long v593 = 0u;
              memset(v591, 0, sizeof(v591));
              v383 = [(PatternExecutionResult *)v542 meta];
              uint64_t v384 = [v383 countByEnumeratingWithState:v591 objects:&v609 count:16];
              if (v384)
              {
                uint64_t v385 = **(void **)&v591[16];
                do
                {
                  for (uint64_t j = 0; j != v384; ++j)
                  {
                    if (**(void **)&v591[16] != v385) {
                      objc_enumerationMutation(v383);
                    }
                    v387 = *(void **)(*(void *)&v591[8] + 8 * j);
                    v388 = [(id)p_size objectForKey:v387];
                    BOOL v389 = v388 == 0;

                    if (!v389)
                    {
                      uint64_t v390 = [v387 UTF8String];
                      siri::dialogengine::Log::Warn((siri::dialogengine::Log *)"Pattern result meta conflict, visual/dialog result meta conflicts with pattern meta key '%s'", v391, v390);
                    }
                  }
                  uint64_t v384 = [v383 countByEnumeratingWithState:v591 objects:&v609 count:16];
                }
                while (v384);
              }

              v392 = [(PatternExecutionResult *)v542 meta];
              BOOL v393 = v392 == 0;

              if (!v393)
              {
                v394 = [(PatternExecutionResult *)v542 meta];
                [(id)p_size addEntriesFromDictionary:v394];
              }
              [(PatternExecutionResult *)v542 setMeta:p_size];

              uint64_t v366 = v531 + 1;
              v395 = v569;
            }
            while (v531 + 1 < (unint64_t)(0x6DB6DB6DB6DB6DB7 * (v570 - v569)));
            if (v570 != v569)
            {
              uint64_t v396 = 0;
              unint64_t v397 = 0;
              p_std::string::size_type size = 0x6DB6DB6DB6DB6DB7;
              do
              {
                v398 = [*(id *)(v562.i64[0] + 8 * v397) visualResponse];
                uint64_t v399 = v395[v396];
                if (*(char *)(v399 + 207) < 0)
                {
                  std::string::__init_copy_ctor_external((std::string *)&v597, *(const std::string::value_type **)(v399 + 184), *(void *)(v399 + 192));
                }
                else
                {
                  *(_OWORD *)&v597.__first_ = *(_OWORD *)(v399 + 184);
                  v597.__end_ = *(std::__split_buffer<std::string>::pointer *)(v399 + 200);
                }
                AppendVisualResultToPatternExecutionResult(v542, v398, (uint64_t)&v597);
                if (SHIBYTE(v597.__end_) < 0) {
                  operator delete(v597.__first_);
                }

                ++v397;
                v395 = v569;
                v396 += 7;
              }
              while (v397 < 0x6DB6DB6DB6DB6DB7 * (v570 - v569));
            }
          }
          goto LABEL_774;
        }
      }
      std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)&v597);
      v156 = (_OWORD *)(v152 + 64);
      if (*(char *)(v152 + 87) < 0)
      {
        std::string::__init_copy_ctor_external(&v609, *(const std::string::value_type **)(v152 + 64), *(void *)(v152 + 72));
      }
      else
      {
        *(_OWORD *)&v609.__r_.__value_.__l.__data_ = *v156;
        v609.__r_.__value_.__r.__words[2] = *(void *)(v152 + 80);
      }
      siri::dialogengine::PatternSchema::GetGroup((uint64_t)v153, (uint64_t)&v609, &v560);
      if (SHIBYTE(v609.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v609.__r_.__value_.__l.__data_);
      }
      std::string::size_type v157 = v560.__r_.__value_.__r.__words[0];
      if (!v560.__r_.__value_.__r.__words[0])
      {
        std::string::basic_string[abi:ne180100]<0>(&v609, "");
        std::string::operator=(&v604, &v609);
        std::stringbuf::__init_buf_ptrs[abi:ne180100]((uint64_t)&v597.__end_cap_);
        if (SHIBYTE(v609.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v609.__r_.__value_.__l.__data_);
        }
        v160 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v597.__end_, (uint64_t)"Group '", 7);
        if (*(char *)(v152 + 87) < 0)
        {
          std::string::__init_copy_ctor_external(&v609, *(const std::string::value_type **)(v152 + 64), *(void *)(v152 + 72));
        }
        else
        {
          *(_OWORD *)&v609.__r_.__value_.__l.__data_ = *v156;
          v609.__r_.__value_.__r.__words[2] = *(void *)(v152 + 80);
        }
        if ((v609.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          v176 = &v609;
        }
        else {
          v176 = (std::string *)v609.__r_.__value_.__r.__words[0];
        }
        if ((v609.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          std::string::size_type v177 = HIBYTE(v609.__r_.__value_.__r.__words[2]);
        }
        else {
          std::string::size_type v177 = v609.__r_.__value_.__l.__size_;
        }
        v178 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v160, (uint64_t)v176, v177);
        v179 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v178, (uint64_t)"' in pattern '", 14);
        if ((v561.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          v180 = &v561;
        }
        else {
          v180 = (std::string *)v561.__r_.__value_.__r.__words[0];
        }
        if ((v561.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          std::string::size_type v181 = HIBYTE(v561.__r_.__value_.__r.__words[2]);
        }
        else {
          std::string::size_type v181 = v561.__r_.__value_.__l.__size_;
        }
        v182 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v179, (uint64_t)v180, v181);
        v183 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v182, (uint64_t)"' is not defined in the schema '", 32);
        if (*((char *)v153 + 23) < 0)
        {
          std::string::__init_copy_ctor_external((std::string *)__str, *(const std::string::value_type **)v153, *((void *)v153 + 1));
        }
        else
        {
          long long v184 = *(_OWORD *)v153;
          *(void *)&__str[16] = *((void *)v153 + 2);
          *(_OWORD *)__str = v184;
        }
        if (__str[23] >= 0) {
          v185 = __str;
        }
        else {
          v185 = *(unsigned char **)__str;
        }
        if (__str[23] >= 0) {
          uint64_t v186 = __str[23];
        }
        else {
          uint64_t v186 = *(void *)&__str[8];
        }
        v187 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v183, (uint64_t)v185, v186);
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v187, (uint64_t)"'", 1);
        if ((__str[23] & 0x80000000) != 0) {
          operator delete(*(void **)__str);
        }
        if (SHIBYTE(v609.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v609.__r_.__value_.__l.__data_);
        }
        std::stringbuf::str();
        siri::dialogengine::Log::LogWithLevel((uint64_t)&v609, 1u);
        if (SHIBYTE(v609.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v609.__r_.__value_.__l.__data_);
        }
        char v155 = 0;
        goto LABEL_376;
      }
      (*(void (**)(std::string *__return_ptr, std::string::size_type))(*(void *)v560.__r_.__value_.__l.__data_
                                                                                + 96))(&v609, v560.__r_.__value_.__r.__words[0]);
      std::string::size_type v158 = HIBYTE(v609.__r_.__value_.__r.__words[2]);
      if ((v609.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        std::string::size_type v158 = v609.__r_.__value_.__l.__size_;
      }
      if (!v158)
      {
LABEL_324:
        char v155 = 0;
        goto LABEL_374;
      }
      std::string::basic_string[abi:ne180100]<0>(__str, "");
      std::string::operator=(&v604, (const std::string *)__str);
      std::stringbuf::__init_buf_ptrs[abi:ne180100]((uint64_t)&v597.__end_cap_);
      if ((__str[23] & 0x80000000) != 0) {
        operator delete(*(void **)__str);
      }
      v159 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v597.__end_, (uint64_t)"Group '", 7);
      if (*(char *)(v152 + 87) < 0)
      {
        std::string::__init_copy_ctor_external((std::string *)__str, *(const std::string::value_type **)(v152 + 64), *(void *)(v152 + 72));
      }
      else
      {
        *(_OWORD *)__str = *v156;
        *(void *)&__str[16] = *(void *)(v152 + 80);
      }
      if (__str[23] >= 0) {
        v161 = __str;
      }
      else {
        v161 = *(unsigned char **)__str;
      }
      if (__str[23] >= 0) {
        uint64_t v162 = __str[23];
      }
      else {
        uint64_t v162 = *(void *)&__str[8];
      }
      v163 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v159, (uint64_t)v161, v162);
      v164 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v163, (uint64_t)"' in pattern '", 14);
      if ((v561.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v165 = &v561;
      }
      else {
        v165 = (std::string *)v561.__r_.__value_.__r.__words[0];
      }
      if ((v561.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v166 = HIBYTE(v561.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v166 = v561.__r_.__value_.__l.__size_;
      }
      v167 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v164, (uint64_t)v165, v166);
      v168 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v167, (uint64_t)"' is deprecated: ", 17);
      if ((v609.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v169 = &v609;
      }
      else {
        v169 = (std::string *)v609.__r_.__value_.__r.__words[0];
      }
      if ((v609.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v170 = HIBYTE(v609.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v170 = v609.__r_.__value_.__l.__size_;
      }
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v168, (uint64_t)v169, v170);
      if ((__str[23] & 0x80000000) != 0) {
        operator delete(*(void **)__str);
      }
      std::stringbuf::str();
      siri::dialogengine::Log::LogWithLevel((uint64_t)__str, 1u);
      if ((__str[23] & 0x80000000) != 0) {
        operator delete(*(void **)__str);
      }
      (*(void (**)(unsigned char *__return_ptr, std::string::size_type))(*(void *)v157 + 104))(__str, v157);
      if ((__str[23] & 0x80000000) != 0)
      {
        uint64_t v175 = *(void *)&__str[8];
        operator delete(*(void **)__str);
        if (v175)
        {
LABEL_317:
          std::vector<std::string>::pointer v171 = v568.__begin_;
          std::vector<std::string>::pointer v172 = v568.__end_;
          (*(void (**)(unsigned char *__return_ptr, std::string::size_type))(*(void *)v157 + 104))(__str, v157);
          v173 = (std::string *)std::__find_impl[abi:ne180100]<std::string *,std::string *,std::string,std::__identity>((uint64_t)v171, (uint64_t)v172, (unsigned __int8 **)__str);
          if ((__str[23] & 0x80000000) != 0) {
            operator delete(*(void **)__str);
          }
          uint64_t v86 = 0x1E4F29000uLL;
          if (v173 != v568.__end_)
          {
            std::string::basic_string[abi:ne180100]<0>(__str, "");
            std::string::operator=(&v604, (const std::string *)__str);
            std::stringbuf::__init_buf_ptrs[abi:ne180100]((uint64_t)&v597.__end_cap_);
            if ((__str[23] & 0x80000000) != 0) {
              operator delete(*(void **)__str);
            }
            v174 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v597.__end_, (uint64_t)"Skipping deprecated group '", 27);
            if (*(char *)(v152 + 87) < 0)
            {
              std::string::__init_copy_ctor_external((std::string *)__str, *(const std::string::value_type **)(v152 + 64), *(void *)(v152 + 72));
            }
            else
            {
              *(_OWORD *)__str = *v156;
              *(void *)&__str[16] = *(void *)(v152 + 80);
            }
            if (__str[23] >= 0) {
              v188 = __str;
            }
            else {
              v188 = *(unsigned char **)__str;
            }
            if (__str[23] >= 0) {
              uint64_t v189 = __str[23];
            }
            else {
              uint64_t v189 = *(void *)&__str[8];
            }
            v190 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v174, (uint64_t)v188, v189);
            v191 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v190, (uint64_t)"' in pattern '", 14);
            if ((v561.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
              v192 = &v561;
            }
            else {
              v192 = (std::string *)v561.__r_.__value_.__r.__words[0];
            }
            if ((v561.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
              std::string::size_type v193 = HIBYTE(v561.__r_.__value_.__r.__words[2]);
            }
            else {
              std::string::size_type v193 = v561.__r_.__value_.__l.__size_;
            }
            v194 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v191, (uint64_t)v192, v193);
            std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v194, (uint64_t)"' because its replacement is also active", 40);
            if ((__str[23] & 0x80000000) != 0) {
              operator delete(*(void **)__str);
            }
            std::stringbuf::str();
            siri::dialogengine::Log::LogWithLevel((uint64_t)__str, 0);
            if ((__str[23] & 0x80000000) != 0) {
              operator delete(*(void **)__str);
            }
            char v155 = 1;
            goto LABEL_374;
          }
          goto LABEL_324;
        }
      }
      else if (__str[23])
      {
        goto LABEL_317;
      }
      char v155 = 0;
      uint64_t v86 = 0x1E4F29000;
LABEL_374:
      if (SHIBYTE(v609.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v609.__r_.__value_.__l.__data_);
      }
LABEL_376:
      if (v560.__r_.__value_.__l.__size_) {
        std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v560.__r_.__value_.__l.__size_);
      }
      v597.__first_ = v529;
      *(std::__split_buffer<std::string>::pointer *)((char *)&v597.__first_ + v529[-1].__r_.__value_.__r.__words[0]) = v525;
      v597.__end_ = v514;
      v597.__end_cap_.__value_ = (std::string *)(MEMORY[0x1E4FBA470] + 16);
      if (SHIBYTE(v604.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v604.__r_.__value_.__l.__data_);
      }
      std::streambuf::~streambuf();
      std::iostream::~basic_iostream();
      MEMORY[0x1C8796CC0](v606);
      goto LABEL_381;
    }
LABEL_774:
    uint64_t v400 = v579;
    std::string::basic_string[abi:ne180100]<0>(&v609, "printSupportingDialogInDisplayModes");
    siri::dialogengine::PatternFile::GetSetting(v400, (const void **)&v609.__r_.__value_.__l.__data_, (std::string *)&v597);
    int v532 = siri::dialogengine::StringToBool((const std::string *)&v597);
    if (SHIBYTE(v597.__end_) < 0) {
      operator delete(v597.__first_);
    }
    if (SHIBYTE(v609.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v609.__r_.__value_.__l.__data_);
    }
    v401 = (siri::dialogengine *)v536;
    siri::dialogengine::ExtractUserSettings(v401, (NSDictionary *)1, (uint64_t)&v597);
    std::string::basic_string[abi:ne180100]<0>(&v609, "alwaysDisplayDialog");
    uint64_t v402 = std::__tree<std::string>::find<std::string>((uint64_t)&v597, (const void **)&v609.__r_.__value_.__l.__data_);
    if (SHIBYTE(v609.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v609.__r_.__value_.__l.__data_);
    }
    if (&v597.__begin_ == (std::__split_buffer<std::string>::pointer *)v402)
    {
      int v527 = 0;
    }
    else
    {
      if (*(char *)(v402 + 79) < 0) {
        std::string::__init_copy_ctor_external(&v609, *(const std::string::value_type **)(v402 + 56), *(void *)(v402 + 64));
      }
      else {
        std::string v609 = *(std::string *)(v402 + 56);
      }
      int v527 = siri::dialogengine::StringToBool(&v609);
      if (SHIBYTE(v609.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v609.__r_.__value_.__l.__data_);
      }
    }
    std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(v597.__begin_->__r_.__value_.__r.__words);

    id v406 = [(PatternExecutionResult *)v541 visual];
    if (v406)
    {
      SnippetUI::Response::Response((SnippetUI::Response *)&v597);
      id v407 = [v406 base64EncodedStringWithOptions:0];
      std::string::basic_string[abi:ne180100]<0>(__str, (char *)[v407 UTF8String]);
      siri::dialogengine::DecodeBase64((std::string::size_type)__str, &v609);
      google::protobuf::MessageLite::ParseFromString(&v597, &v609);
      if (SHIBYTE(v609.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v609.__r_.__value_.__l.__data_);
      }
      if ((__str[23] & 0x80000000) != 0) {
        operator delete(*(void **)__str);
      }

      memset(__str, 0, 24);
      google::protobuf::internal::RepeatedPtrFieldBase::MergeFrom<google::protobuf::RepeatedPtrField<SnippetUI::Response_Section>::TypeHandler>((int **)__str, (uint64_t)&v597.__end_);
      if (*(int *)&__str[8] < 1)
      {
LABEL_804:
        int v530 = 0;
      }
      else
      {
        int v408 = 0;
        while (1)
        {
          v409 = (const SnippetUI::Response_Section *)google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<SnippetUI::Response_Section>::TypeHandler>((uint64_t)__str, v408);
          SnippetUI::Response_Section::Response_Section((SnippetUI::Response_Section *)&v609, v409);
          memset(v591, 0, 24);
          google::protobuf::internal::RepeatedPtrFieldBase::MergeFrom<google::protobuf::RepeatedPtrField<SnippetUI::Response_Component>::TypeHandler>((int **)v591, (uint64_t)&v609.__r_.__value_.__r.__words[2]);
          p_std::string::size_type size = *(unsigned int *)&v591[8];
          google::protobuf::RepeatedPtrField<siri::dialogengine::SchemaBinary::Value>::~RepeatedPtrField((google::protobuf::internal::RepeatedPtrFieldBase *)v591);
          SnippetUI::Response_Section::~Response_Section((SnippetUI::Response_Section *)&v609);
          if ((int)p_size > 0) {
            break;
          }
          if (++v408 >= *(int *)&__str[8]) {
            goto LABEL_804;
          }
        }
        int v530 = 1;
      }
      google::protobuf::RepeatedPtrField<siri::dialogengine::SchemaBinary::Value>::~RepeatedPtrField((google::protobuf::internal::RepeatedPtrFieldBase *)__str);
      SnippetUI::Response::~Response((SnippetUI::Response *)&v597);
    }
    else
    {
      int v530 = 0;
    }

    v411 = v569;
    if (v570 == v569)
    {
      unsigned int v483 = v534 - 3;
      v414 = v541;
LABEL_870:
      if (v483 <= 1) {
        uint64_t v484 = v532 | v530 ^ 1u;
      }
      else {
        uint64_t v484 = 0;
      }
      v485 = [NSNumber numberWithBool:v484];
      [(PatternExecutionResult *)v414 setPrintSupportingDialog:v485];

      v486 = [(PatternExecutionResult *)v541 visualInfo];
      v487 = [(PatternExecutionResult *)v541 visualInfo];
      BOOL v488 = v487 == 0;

      if (v488)
      {
        uint64_t v489 = objc_opt_new();

        v486 = (void *)v489;
      }
      [v486 setVisualLocation:0];
      [(PatternExecutionResult *)v541 setVisualInfo:v486];
      if (_os_feature_enabled_impl())
      {
        std::string::basic_string[abi:ne180100]<0>(&v597, "visualLocation");
        uint64_t v490 = std::__tree<std::string>::find<std::string>((uint64_t)v512, (const void **)&v597.__first_);
        if (&v510[1].__shared_owners_ == (uint64_t *)v490)
        {
          v493 = 0;
          v492 = 0;
        }
        else
        {
          v493 = *(const void **)(v490 + 56);
          v492 = *(std::__shared_weak_count **)(v490 + 64);
          if (v492) {
            atomic_fetch_add_explicit(&v492->__shared_owners_, 1uLL, memory_order_relaxed);
          }
        }
        if (SHIBYTE(v597.__end_) < 0) {
          operator delete(v597.__first_);
        }
        if (v493)
        {
          if (v494)
          {
            if (v494[95] < 0) {
              std::string::__init_copy_ctor_external(&v609, *((const std::string::value_type **)v494 + 9), *((void *)v494 + 10));
            }
            else {
              std::string v609 = *(std::string *)(v494 + 3);
            }
            siri::dialogengine::StringToLower((uint64_t)&v609, (uint64_t)&v597);
            if (SHIBYTE(v597.__end_) < 0)
            {
              if (v597.__begin_ == (std::__split_buffer<std::string>::pointer)17)
              {
                unint64_t v499 = 0x636F6E7665727361;
                unint64_t v500 = bswap64(v597.__first_->__r_.__value_.__r.__words[0]);
                if (v500 == 0x636F6E7665727361
                  && (unint64_t v499 = 0x74696F6E73706163,
                      unint64_t v500 = bswap64(v597.__first_->__r_.__value_.__l.__size_),
                      v500 == 0x74696F6E73706163))
                {
                  int v501 = v597.__first_->__r_.__value_.__s.__data_[16] - 101;
                }
                else if (v500 < v499)
                {
                  int v501 = -1;
                }
                else
                {
                  int v501 = 1;
                }
                BOOL v502 = v501 == 0;
              }
              else
              {
                BOOL v502 = 0;
              }
              operator delete(v597.__first_);
            }
            else if (SHIBYTE(v597.__end_) == 17)
            {
              unint64_t v496 = 0x636F6E7665727361;
              unint64_t v497 = bswap64((unint64_t)v597.__first_);
              if (v497 == 0x636F6E7665727361
                && (unint64_t v496 = 0x74696F6E73706163,
                    unint64_t v497 = bswap64((unint64_t)v597.__begin_),
                    v497 == 0x74696F6E73706163))
              {
                int v498 = LOBYTE(v597.__end_) - 101;
              }
              else if (v497 < v496)
              {
                int v498 = -1;
              }
              else
              {
                int v498 = 1;
              }
              BOOL v502 = v498 == 0;
            }
            else
            {
              BOOL v502 = 0;
            }
            [v486 setVisualLocation:v502];
            if (SHIBYTE(v609.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v609.__r_.__value_.__l.__data_);
            }
            uint64_t v503 = [v486 visualLocation];
            v504 = "Invalid";
            if (!v503) {
              v504 = "SnippetSpace";
            }
            if (v503 == 1) {
              v505 = "ConversationSpace";
            }
            else {
              v505 = (char *)v504;
            }
            std::string::basic_string[abi:ne180100]<0>(&v597, v505);
            if (SHIBYTE(v597.__end_) >= 0) {
              v507 = &v597;
            }
            else {
              v507 = v597.__first_;
            }
            siri::dialogengine::Log::Info((siri::dialogengine::Log *)"Visual location: %s", v506, v507);
            if (SHIBYTE(v597.__end_) < 0) {
              operator delete(v597.__first_);
            }
          }
          else
          {
            siri::dialogengine::Log::Warn((siri::dialogengine::Log *)"Pattern setting 'visualLocation' is not a string; Using default value",
              v495);
          }
        }
        else
        {
          siri::dialogengine::Log::Warn((siri::dialogengine::Log *)"Pattern setting 'visualLocation' not found; Using default value",
            v491);
        }
        if (v492) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v492);
        }
      }
      siri::dialogengine::RequestInfo::RequestInfo((siri::dialogengine::RequestInfo *)&v597, (const siri::dialogengine::RequestInfo *)((char *)&buf + 8));
      std::string::operator=(v606, &v586);
      siri::dialogengine::Context::SetRequestInfo((siri::dialogengine::Context *)&buf, (const siri::dialogengine::RequestInfo *)&v597);
      siri::dialogengine::Context::UpdatePatternState((siri::dialogengine::Context *)&buf, v508, 0);
    }
    uint64_t v412 = 0;
    int v413 = v532 ^ 1;
    if (v534 - 3 > 1) {
      int v413 = 1;
    }
    unsigned int v526 = v530 & v413 & ~v527;
    v414 = v541;
    while (1)
    {
      siri::dialogengine::CATResultDialogFilterAdapter::CATResultDialogFilterAdapter((siri::dialogengine::CATResultDialogFilterAdapter *)&v597, *(CATResult **)(v564.i64[0] + 8 * v412));
      uint64_t v540 = v412;
      v415 = &v411[7 * v412];
      uint64_t v416 = *v415;
      if (*(char *)(*v415 + 87) < 0) {
        std::string::__init_copy_ctor_external(&v609, *(const std::string::value_type **)(v416 + 64), *(void *)(v416 + 72));
      }
      else {
        std::string v609 = *(std::string *)(v416 + 64);
      }
      siri::dialogengine::FilterDialogForModeAndSettings((uint64_t *)&v597, v534, v527, v532, v530, (uint64_t)&v609);
      if (SHIBYTE(v609.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v609.__r_.__value_.__l.__data_);
      }
      v417 = *(void **)(v564.i64[0] + 8 * v412);
      uint64_t v418 = *v415;
      if (*(char *)(*v415 + 183) < 0)
      {
        std::string::__init_copy_ctor_external((std::string *)v591, *(const std::string::value_type **)(v418 + 160), *(void *)(v418 + 168));
      }
      else
      {
        *(_OWORD *)v591 = *(_OWORD *)(v418 + 160);
        *(void *)&v591[16] = *(void *)(v418 + 176);
      }
      uint64_t v419 = *v415;
      if (*(char *)(*v415 + 87) < 0) {
        std::string::__init_copy_ctor_external(&v561, *(const std::string::value_type **)(v419 + 64), *(void *)(v419 + 72));
      }
      else {
        std::string v561 = *(std::string *)(v419 + 64);
      }
      v420 = v414;
      id v422 = v417;
      v423 = &v561;
      if ((v561.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        v423 = (std::string *)v561.__r_.__value_.__r.__words[0];
      }
      siri::dialogengine::Log::Info((siri::dialogengine::Log *)"Appending dialog for group '%s' to pattern execution result", v421, v423);
      v543 = [NSNumber numberWithBool:v526];
      v424 = [v422 speak];
      uint64_t v425 = [v424 count];

      if (v425) {
        break;
      }
LABEL_861:
      v482 = &v561;
      if ((v561.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        v482 = (std::string *)v561.__r_.__value_.__r.__words[0];
      }
      siri::dialogengine::Log::Info((siri::dialogengine::Log *)"Done appending dialog for group '%s'", v426, v482);

      if (SHIBYTE(v561.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v561.__r_.__value_.__l.__data_);
      }
      if ((v591[23] & 0x80000000) != 0) {
        operator delete(*(void **)v591);
      }

      v414 = v541;
      uint64_t v412 = v540 + 1;
      v411 = v569;
      if (v540 + 1 >= (unint64_t)(0x6DB6DB6DB6DB6DB7 * (v570 - v569)))
      {
        unsigned int v483 = v534 - 3;
        goto LABEL_870;
      }
    }
    uint64_t v427 = 0;
    while (1)
    {
      uint64_t v428 = v591[23];
      if (v591[23] < 0) {
        uint64_t v428 = *(void *)&v591[8];
      }
      if (v428)
      {
        v429 = [v422 dialogId];
        id v430 = [v429 objectAtIndexedSubscript:v427];
        std::string::basic_string[abi:ne180100]<0>(__str, (char *)[v430 UTF8String]);
        siri::dialogengine::StringSplit(__str, "#", &v609);
        if ((__str[23] & 0x80000000) != 0) {
          operator delete(*(void **)__str);
        }

        if (v609.__r_.__value_.__r.__words[0] == v609.__r_.__value_.__l.__size_)
        {
          std::string::basic_string[abi:ne180100]<0>(__str, "");
        }
        else if (*(char *)(v609.__r_.__value_.__l.__size_ - 1) < 0)
        {
          std::string::__init_copy_ctor_external((std::string *)__str, *(const std::string::value_type **)(v609.__r_.__value_.__l.__size_ - 24), *(void *)(v609.__r_.__value_.__l.__size_ - 16));
        }
        else
        {
          long long v431 = *(_OWORD *)(v609.__r_.__value_.__l.__size_ - 24);
          *(void *)&__str[16] = *(void *)(v609.__r_.__value_.__l.__size_ - 8);
          *(_OWORD *)__str = v431;
        }
        BOOL v436 = siri::dialogengine::StringGlobMatch((std::string *)__str, (const std::string *)v591);
        BOOL v438 = v436;
        v439 = __str;
        if (__str[23] < 0) {
          v439 = *(unsigned char **)__str;
        }
        v440 = v591;
        if (v591[23] < 0) {
          v440 = *(unsigned char **)v591;
        }
        if (v436) {
          v441 = "Dialog ID '%s' matches pattern '%s'; Including it in result";
        }
        else {
          v441 = "Dialog ID '%s' does not match pattern '%s'; Excluding it from result";
        }
        siri::dialogengine::Log::Info((siri::dialogengine::Log *)v441, v437, v439, v440);
        if ((__str[23] & 0x80000000) != 0) {
          operator delete(*(void **)__str);
        }
        *(void *)__str = &v609;
        std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)__str);
        if (!v438) {
          goto LABEL_860;
        }
      }
      else
      {
        v432 = [v422 dialogId];
        id v433 = [v432 objectAtIndexedSubscript:v427];
        uint64_t v434 = [v433 UTF8String];
        siri::dialogengine::Log::Info((siri::dialogengine::Log *)"No dialog ID pattern specified; Including dialog with ID '%s' in output",
          v435,
          v434);
      }
      v442 = objc_opt_new();
      v443 = [v422 dialogId];
      v444 = [v443 objectAtIndexedSubscript:v427];
      [v442 setDialogId:v444];

      if ((v561.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v445 = &v561;
      }
      else {
        v445 = (std::string *)v561.__r_.__value_.__r.__words[0];
      }
      v446 = [NSString stringWithUTF8String:v445];
      [v442 setGroupName:v446];

      v447 = [v422 print];
      v448 = [v447 objectAtIndexedSubscript:v427];
      [v442 setFullPrint:v448];

      v449 = [v422 speak];
      v450 = [v449 objectAtIndexedSubscript:v427];
      [v442 setFullSpeak:v450];

      v451 = [v422 captionPrint];
      v452 = [v451 objectAtIndexedSubscript:v427];
      [v442 setSupportingPrint:v452];

      v453 = [v422 captionSpeak];
      v454 = [v453 objectAtIndexedSubscript:v427];
      [v442 setSupportingSpeak:v454];

      v455 = [v422 spokenOnlyDefined];
      v456 = [v455 objectAtIndexedSubscript:v427];
      int v457 = [v456 BOOLValue];
      v458 = v543;
      if (v457)
      {
        p_std::string::size_type size = objc_msgSend(v422, "spokenOnly", v543);
        uint64_t v86 = [(id)p_size objectAtIndexedSubscript:v427];
        v458 = (void *)v86;
      }
      [v442 setSpokenOnly:v458];
      if (v457)
      {
      }
      v459 = [v422 printOnly];
      v460 = [v459 objectAtIndexedSubscript:v427];
      [v442 setPrintOnly:v460];

      v461 = [v422 unfilteredPrint];
      v462 = [v461 objectAtIndexedSubscript:v427];
      [v442 setUnfilteredFullPrint:v462];

      v463 = [v422 unfilteredSpeak];
      v464 = [v463 objectAtIndexedSubscript:v427];
      [v442 setUnfilteredFullSpeak:v464];

      v465 = [v422 unfilteredCaptionPrint];
      v466 = [v465 objectAtIndexedSubscript:v427];
      [v442 setUnfilteredSupportingPrint:v466];

      v467 = [v422 unfilteredCaptionSpeak];
      v468 = [v467 objectAtIndexedSubscript:v427];
      [v442 setUnfilteredSupportingSpeak:v468];

      v469 = [v422 redactedPrint];
      v470 = [v469 objectAtIndexedSubscript:v427];
      [v442 setRedactedFullPrint:v470];

      v471 = [v422 redactedSpeak];
      v472 = [v471 objectAtIndexedSubscript:v427];
      [v442 setRedactedFullSpeak:v472];

      v473 = [v422 redactedCaptionPrint];
      v474 = [v473 objectAtIndexedSubscript:v427];
      [v442 setRedactedSupportingPrint:v474];

      v475 = [v422 redactedCaptionSpeak];
      v476 = [v475 objectAtIndexedSubscript:v427];
      [v442 setRedactedSupportingSpeak:v476];

      v477 = [v422 isApprovedForGrading];
      v478 = [v477 objectAtIndexedSubscript:v427];
      objc_msgSend(v442, "setIsApprovedForGrading:", objc_msgSend(v478, "BOOLValue"));

      v479 = [(PatternExecutionResult *)v420 dialog];
      LODWORD(v477) = v479 == 0;

      if (v477)
      {
        v480 = objc_opt_new();
        [(PatternExecutionResult *)v420 setDialog:v480];
      }
      v481 = [(PatternExecutionResult *)v420 dialog];
      [v481 addObject:v442];

LABEL_860:
      if (v425 == ++v427) {
        goto LABEL_861;
      }
    }
  }
  LogPatternExecutionResult(v541);
  v103 = log;
  v104 = v103;
  if (v515 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v103))
  {
    LOWORD(v597.__first_) = 0;
    _os_signpost_emit_with_name_impl(&dword_1C5C1E000, v104, OS_SIGNPOST_INTERVAL_END, spid, "PatternExecute", "", (uint8_t *)&v597, 2u);
  }

  if (*(char *)(v51 + 135) < 0)
  {
    v105 = v541;
    std::string::__init_copy_ctor_external(&v609, *(const std::string::value_type **)(v51 + 112), *(void *)(v51 + 120));
  }
  else
  {
    *(_OWORD *)&v609.__r_.__value_.__l.__data_ = *v81;
    v609.__r_.__value_.__r.__words[2] = *(void *)(v51 + 128);
    v105 = v541;
  }
  v403 = std::string::insert(&v609, 0, "Pattern type is unsupported: ");
  long long v404 = *(_OWORD *)&v403->__r_.__value_.__l.__data_;
  v597.__end_ = (std::__split_buffer<std::string>::pointer)v403->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v597.__first_ = v404;
  v403->__r_.__value_.__l.__size_ = 0;
  v403->__r_.__value_.__r.__words[2] = 0;
  v403->__r_.__value_.__r.__words[0] = 0;
  std::string::basic_string[abi:ne180100]<0>(__str, "load-failed");
  v405 = NSErrorFromString((uint64_t *)&v597, (uint64_t *)__str);
  v524[2](v524, v105, v405);

  if ((__str[23] & 0x80000000) != 0) {
    operator delete(*(void **)__str);
  }
  if (SHIBYTE(v597.__end_) < 0) {
    operator delete(v597.__first_);
  }
  if (SHIBYTE(v609.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v609.__r_.__value_.__l.__data_);
  }
LABEL_928:
  if (v574) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v574);
  }

  if (v576) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v576);
  }
  v70 = v541;
  if (v578) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v578);
  }
LABEL_934:
  if (v580) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v580);
  }
  siri::dialogengine::Context::~Context((siri::dialogengine::Context *)&buf);
  *(void *)&long long buf = &v581;
  std::vector<siri::dialogengine::UpdatableDir>::__destroy_vector::operator()[abi:ne180100]((void ***)&buf);
  if (v585 < 0) {
    operator delete(v584[0]);
  }
  if (SHIBYTE(v586.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v586.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__s.__r_.__value_.__l.__data_);
  }
}

+ (void)execute:(id)a3 templateDir:(id)a4 patternId:(id)a5 parameters:(id)a6 globals:(id)a7 options:(int)a8 completion:(id)a9
{
  LODWORD(v9) = a8;
  +[CATPattern execute:a3 templateDir:a4 patternId:a5 parameters:a6 globals:a7 callback:0 options:v9 completion:a9];
}

+ (void)execute:(id)a3 patternId:(id)a4 parameters:(id)a5 globals:(id)a6 callback:(id)a7 options:(int)a8 completion:(id)a9
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  v19 = (void (**)(id, void *, void *))a9;
  id v20 = objc_opt_new();
  if (v14)
  {
    id v28 = v15;
    id v21 = [v14 bundleIdentifier];
    std::string::basic_string[abi:ne180100]<0>(v31, (char *)[v21 UTF8String]);
    id v22 = +[DEExecutor bundleTemplateDir:v14];
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v22 UTF8String]);
    siri::dialogengine::GradingAllowListFactory::RegisterBundle((char *)v31, (long long *)__p);
    if (v30 < 0) {
      operator delete(__p[0]);
    }

    if (v32 < 0) {
      operator delete(v31[0]);
    }

    v23 = (void *)MEMORY[0x1E4F1CB10];
    v24 = +[DEExecutor bundleTemplateDir:v14];
    uint64_t v25 = [v23 fileURLWithPath:v24];
    LODWORD(v27) = a8;
    id v15 = v28;
    +[CATPattern execute:0 templateDir:v25 patternId:v28 parameters:v16 globals:v17 callback:v18 options:v27 completion:v19];
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(v31, "Nil bundle supplied");
    std::string::basic_string[abi:ne180100]<0>(__p, "request-error");
    id v26 = NSErrorFromString((uint64_t *)v31, (uint64_t *)__p);
    v19[2](v19, v20, v26);

    if (v30 < 0) {
      operator delete(__p[0]);
    }
    if (v32 < 0) {
      operator delete(v31[0]);
    }
  }
}

+ (void)execute:(id)a3 patternId:(id)a4 parameters:(id)a5 globals:(id)a6 options:(int)a7 completion:(id)a8
{
}

+ (id)executeCAT:(id)a3 templateDir:()basic_string<char catId:()std:(std::allocator<char>> *)data :char_traits<char> patternId:requestType:parameters:globals:patternContext:callback:options:error:
{
  int v8 = v6;
  uint64_t v9 = v5;
  v10 = v4;
  uint64_t v12 = v50;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v36 = v7;
  id v37 = v47;
  id v38 = v49;
  v13 = GetPatternLog();
  os_signpost_id_t v14 = os_signpost_id_generate(v13);
  id v15 = v13;
  id v16 = v15;
  os_signpost_id_t spid = v14;
  unint64_t v17 = v14 - 1;
  if (v17 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    id v18 = v9;
    if (*((char *)v9 + 23) < 0) {
      id v18 = (uint64_t *)*v9;
    }
    v19 = v10;
    if (*((char *)v10 + 23) < 0) {
      v19 = (uint64_t *)*v10;
    }
    *(_DWORD *)long long buf = 136315394;
    *(void *)&buf[4] = v18;
    __int16 v42 = 2080;
    id v43 = v19;
    _os_signpost_emit_with_name_impl(&dword_1C5C1E000, v16, OS_SIGNPOST_INTERVAL_BEGIN, spid, "PatternExecute_ExecuteCAT", "PATTERN_ID = %s; CAT_ID = %s",
      buf,
      0x16u);
  }

  if (*((char *)v10 + 23) < 0) {
    v10 = (uint64_t *)*v10;
  }
  id v20 = objc_msgSend(NSString, "stringWithUTF8String:", v10, spid);
  id v21 = objc_opt_new();
  if (*((char *)&data->__r_.__value_.var0.var1 + 23) < 0) {
    data = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)data->__r_.__value_.var0.var1.__data_;
  }
  id v22 = [NSString stringWithUTF8String:data];
  [v21 setTemplateDir:v22];

  if (*((char *)v9 + 23) < 0) {
    uint64_t v9 = (uint64_t *)*v9;
  }
  v23 = [NSString stringWithUTF8String:v9];
  [v21 setPatternId:v23];

  v24 = [[DEPatternContext alloc] initWithSharedPtr:v48];
  [v21 setPatternContext:v24];

  if (v8 == 1)
  {
    uint64_t v12 = CATVisualMode | v50;
  }
  else if (!v8)
  {
    uint64_t v12 = v50 & ~CATVisualMode;
  }
  +[CATCommonApi ConfigureDEExecutor:v21 parameters:v36 globalParameters:v37 catId:v20 callback:v38 options:v12];
  uint64_t v25 = [v21 execute];
  id v26 = v25;
  if (v51)
  {
    uint64_t v27 = [v25 status];
    char v28 = [v27 isEqualToString:@"success"];

    if (v28)
    {
      std::string::basic_string[abi:ne180100]<0>(buf, "");
      std::string::basic_string[abi:ne180100]<0>(__p, "");
      NSErrorFromString((uint64_t *)buf, (uint64_t *)__p);
      *uint64_t v51 = (id)objc_claimAutoreleasedReturnValue();
      if (v40 < 0) {
        operator delete(__p[0]);
      }
      if (v44 < 0) {
        operator delete(*(void **)buf);
      }
    }
    else
    {
      id v29 = [v26 error];
      std::string::basic_string[abi:ne180100]<0>(buf, (char *)[v29 UTF8String]);
      id v30 = [v26 status];
      std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v30 UTF8String]);
      NSErrorFromString((uint64_t *)buf, (uint64_t *)__p);
      *uint64_t v51 = (id)objc_claimAutoreleasedReturnValue();
      if (v40 < 0) {
        operator delete(__p[0]);
      }

      if (v44 < 0) {
        operator delete(*(void **)buf);
      }
    }
  }
  v31 = v16;
  char v32 = v31;
  if (v17 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C5C1E000, v32, OS_SIGNPOST_INTERVAL_END, spida, "PatternExecute_ExecuteCAT", "", buf, 2u);
  }

  return v26;
}

+ (void)load:(id)a3 patternId:(id)a4 completion:(id)a5
{
  id v5 = PatternLoader((uint64_t)a3);
}

+ (void)load:(id)a3 patternId:(id)a4 options:(int)a5 completion:(id)a6
{
  id v6 = PatternLoader((uint64_t)a3);
}

+ (id)segment:(id)a3 settings:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v6 objectForKey:@"windowType"];
  int v8 = [v6 objectForKey:@"firstWindowSize"];
  uint64_t v9 = [v6 objectForKey:@"windowSize"];
  v10 = [v6 objectForKey:@"locale"];
  [v6 objectForKey:@"followupWindowSize"];
  if (objc_claimAutoreleasedReturnValue()) {
    siri::dialogengine::Log::Warn((siri::dialogengine::Log *)"The pattern setting/parameter 'followupWindowSize' is deprecated. See 'firstWindowSize' and 'windowSize'.", v11);
  }
  if (v5) {
    uint64_t v12 = (char *)[v5 UTF8String];
  }
  else {
    uint64_t v12 = "";
  }
  std::string::basic_string[abi:ne180100]<0>(&v29, v12);
  siri::dialogengine::SpeakableString::SpeakableString((siri::dialogengine::SpeakableString *)&v28);
  siri::dialogengine::SpeakableString::SetString((uint64_t)&v28, (uint64_t)&v29);
  if (SHIBYTE(v28.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v27, v28.__r_.__value_.__l.__data_, v28.__r_.__value_.__l.__size_);
  }
  else {
    std::string v27 = v28;
  }
  if (SHIBYTE(v29.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v29.__r_.__value_.__l.__data_);
  }
  std::string v29 = v27;
  if (v7) {
    v13 = (char *)[v7 UTF8String];
  }
  else {
    v13 = "";
  }
  std::string::basic_string[abi:ne180100]<0>(&v27, v13);
  if (v10) {
    os_signpost_id_t v14 = (char *)[v10 UTF8String];
  }
  else {
    os_signpost_id_t v14 = "en";
  }
  std::string::basic_string[abi:ne180100]<0>(&v26, v14);
  if (v9) {
    [v9 doubleValue];
  }
  if (v8) {
    [v8 doubleValue];
  }
  siri::dialogengine::StringTrim(" \t\n\r", &v27, &__p);
  siri::dialogengine::StringToLower((uint64_t)&__p, (uint64_t)&v23);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (v25 < 0)
  {
    if (v24 != 4)
    {
      if (v24 != 8)
      {
        if (v24 != 9) {
          goto LABEL_45;
        }
        id v15 = (unsigned __int8 *)v23;
LABEL_32:
        uint64_t v16 = *(void *)v15;
        int v17 = v15[8];
        if (v16 == 0x6574636172616863 && v17 == 114) {
LABEL_47:
        }
          siri::dialogengine::GetICUTextSegments(&__p);
LABEL_45:
        std::operator+<char>();
        siri::dialogengine::Log::LogWithLevel((uint64_t)&__p, 3u);
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__p.__r_.__value_.__l.__data_);
        }
        goto LABEL_47;
      }
      id v20 = *(void **)v23;
LABEL_44:
      if (v20 == (void *)0x65636E65746E6573) {
        goto LABEL_47;
      }
      goto LABEL_45;
    }
    int v19 = *(_DWORD *)v23;
  }
  else
  {
    if (v25 != 4)
    {
      if (v25 != 8)
      {
        if (v25 != 9) {
          goto LABEL_45;
        }
        id v15 = (unsigned __int8 *)&v23;
        goto LABEL_32;
      }
      id v20 = v23;
      goto LABEL_44;
    }
    int v19 = (int)v23;
  }
  if (v19 == 1685221239) {
    goto LABEL_47;
  }
  goto LABEL_45;
}

+ (id)patternNameFromType:(unint64_t)a3
{
  if (a3 > 0x12) {
    v3 = "UNKNOWN_PATTERN";
  }
  else {
    v3 = off_1E651DE40[a3];
  }
  std::string::basic_string[abi:ne180100]<0>(__p, v3);
  if (v8 >= 0) {
    v4 = __p;
  }
  else {
    v4 = (void **)__p[0];
  }
  id v5 = [NSString stringWithUTF8String:v4];
  if (v8 < 0) {
    operator delete(__p[0]);
  }
  return v5;
}

@end