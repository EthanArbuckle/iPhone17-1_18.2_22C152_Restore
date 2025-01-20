uint64_t AnalyticsSendEventLazy(void *a1, void *a2)
{
  return AnalyticsSendEventInternal(a1, a2, 0, 0, 0);
}

uint64_t AnalyticsSendEventInternal(void *a1, void *a2, unsigned int a3, int a4, void *a5)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v9 = a1;
  id v31 = v9;
  id v30 = a2;
  id v10 = a5;
  v11 = (void *)MEMORY[0x1AD0D6DD0]();
  CASPIEnter();
  v13 = CoreAnalytics::Client::get(v12);
  if (!v9)
  {
      AnalyticsSendEventInternal();
    goto LABEL_17;
  }
  v14 = (NSObject **)v13;
  id v15 = v9;
  v16 = (char *)[v15 UTF8String];
  if (!v16)
  {
      AnalyticsSendEventInternal();
LABEL_17:
    uint64_t v24 = 0;
    goto LABEL_33;
  }
  memset(&v29, 170, sizeof(v29));
  v17 = (CoreAnalytics::Client *)std::string::basic_string[abi:ne180100]<0>(&v29, v16);
  v18 = CoreAnalytics::Client::get(v17);
  if ((v29.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v19 = &v29;
  }
  else {
    v19 = (std::string *)v29.__r_.__value_.__r.__words[0];
  }
  if ((v29.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    size_t size = HIBYTE(v29.__r_.__value_.__r.__words[2]);
  }
  else {
    size_t size = v29.__r_.__value_.__l.__size_;
  }
  if (CoreAnalytics::Client::isEventUsed((uint64_t)v18, v19, size))
  {
    if (v10)
    {
      v21 = [NSString stringWithUTF8String:"kLogPayload"];
      v22 = [v10 objectForKey:v21];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        int v23 = [v22 BOOLValue];
      }
      else {
        int v23 = 0;
      }
    }
    else
    {
      int v23 = 0;
    }
    if (SHIBYTE(v29.__r_.__value_.__r.__words[2]) < 0) {
      std::string::__init_copy_ctor_external(&__p, v29.__r_.__value_.__l.__data_, v29.__r_.__value_.__l.__size_);
    }
    else {
      std::string __p = v29;
    }
    *(void *)&long long buf = &unk_1EFE15A40;
    *((void *)&buf + 1) = &v31;
    v33 = &v30;
    p_long long buf = &buf;
    int v26 = 0x10000;
    if (!v23) {
      int v26 = 0;
    }
    uint64_t v24 = CoreAnalytics::Client::sendEventAlways(v14, (uint64_t)&__p, (uint64_t)&buf, v26 | (a4 << 8) | a3);
    std::__function::__value_func<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> ()(void)>::~__value_func[abi:ne180100](&buf);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
  else
  {
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v15;
      _os_log_impl(&dword_1A7C3B000, v25, OS_LOG_TYPE_INFO, "Dropping \"%@\" as it isn't used in any transform (not in the config or budgeted?)", (uint8_t *)&buf, 0xCu);
    }
    uint64_t v24 = 0;
  }
  if (SHIBYTE(v29.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v29.__r_.__value_.__l.__data_);
  }
LABEL_33:

  return v24;
}

void sub_1A7C3D77C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,void *a22,char a23)
{
  if (a20 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

uint64_t *CoreAnalytics::Client::get(CoreAnalytics::Client *this)
{
  {
    CoreAnalytics::Client::Client((CoreAnalytics::Client *)CoreAnalytics::Client::get(void)::client);
  }
  if (CoreAnalytics::Client::get(void)::sonce != -1) {
    dispatch_once(&CoreAnalytics::Client::get(void)::sonce, &__block_literal_global_4);
  }
  return CoreAnalytics::Client::get(void)::client;
}

uint64_t CoreAnalytics::Client::isEventUsed(uint64_t a1, const void *a2, size_t a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v8 = (uint64_t *)0xAAAAAAAAAAAAAAAALL;
  id v9 = (std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL;
  std::atomic_load[abi:ne180100]<FrameworkConfiguration const>((void *)(a1 + 80), &v8);
  if (v8 && !*(unsigned char *)(a1 + 62)) {
    uint64_t isEventUsed = FrameworkConfiguration::isEventUsed(v8, a2, a3);
  }
  else {
    uint64_t isEventUsed = 1;
  }
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  return isEventUsed;
}

void std::atomic_load[abi:ne180100]<FrameworkConfiguration const>(void *a1@<X0>, void *a2@<X8>)
{
  sp_mut = std::__get_sp_mut(a1);
  std::__sp_mut::lock(sp_mut);
  uint64_t v5 = a1[1];
  *a2 = *a1;
  a2[1] = v5;
  if (v5) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v5 + 8), 1uLL, memory_order_relaxed);
  }

  std::__sp_mut::unlock(sp_mut);
}

void CASPIEnter(void)
{
  if (_dispatch_is_fork_of_multithreaded_parent())
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      CASPIEnter();
    }
    uint64_t v0 = abort_with_reason();
    std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__construct_node<std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v0);
  }
  else if (CASPIEnter(void)::sonce != -1)
  {
    dispatch_once(&CASPIEnter(void)::sonce, &__block_literal_global_0);
  }
}

uint64_t std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__construct_node<std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>@<X0>(uint64_t a1@<X0>, _OWORD **a2@<X2>, void *a3@<X8>)
{
  uint64_t v5 = a1 + 8;
  memset(a3, 170, 24);
  v6 = operator new(0x48uLL);
  *a3 = v6;
  a3[1] = v5;
  v7 = *a2;
  uint64_t v8 = *((void *)*a2 + 2);
  v6[2] = **a2;
  *((void *)v6 + 6) = v8;
  void *v7 = 0;
  v7[1] = 0;
  v7[2] = 0;
  *((void *)v6 + 8) = 0;
  *((unsigned char *)v6 + 56) = 0;
  uint64_t v9 = (uint64_t)v6 + 56;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v6 + 56);
  uint64_t result = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v9);
  *((unsigned char *)a3 + 16) = 1;
  return result;
}

uint64_t *std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(uint64_t **a1, const void **a2, uint64_t a3, _OWORD **a4)
{
  v9[3] = *(uint64_t **)MEMORY[0x1E4F143B8];
  uint64_t v8 = 0xAAAAAAAAAAAAAAAALL;
  v6 = (uint64_t **)std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__find_equal<std::string>((uint64_t)a1, &v8, a2);
  uint64_t result = *v6;
  if (!*v6)
  {
    memset(v9, 170, 24);
    std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__construct_node<std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)a1, a4, v9);
    std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__insert_node_at(a1, v8, v6, v9[0]);
    return v9[0];
  }
  return result;
}

void ___ZL34makeJsonFromNSObjectWithDepthCountP8NSObjecth_block_invoke(uint64_t a1, void *a2, void *a3)
{
  v10[1] = *(char **)MEMORY[0x1E4F143B8];
  id v5 = a2;
  v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v10[0] = (char *)[v5 UTF8String];
    if (!v10[0]) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Invalid non-UTF8 character(s) in dictionary key"];
    }
    v7 = *(uint64_t ***)(a1 + 32);
    makeJsonFromNSObjectWithDepthCount(&v8, v6, *(unsigned char *)(a1 + 40) + 1);
    std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__emplace_unique_impl<char const*&,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>(v7, v10, (uint64_t)&v8);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v8);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v9, v8);
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Invalid (non-string) key in JSON dictionary"];
  }
}

void sub_1A7C3DCA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t *a9)
{
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::~basic_json(&a9);

  _Unwind_Resume(a1);
}

void makeJsonFromNSObjectWithDepthCount(double *__return_ptr a1@<X8>, NSObject *a2@<X0>, unsigned int a3@<W1>)
{
  v26[1] = *(void ***)MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a3 >= 0xB) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Object exceeded the max depth"];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    __p.__r_.__value_.__r.__words[0] = [v5 UTF8String];
    if (!__p.__r_.__value_.__r.__words[0]) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Invalid non-UTF8 character(s) in string value"];
    }
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const*&,char const*,0>((uint64_t)a1, &__p.__r_.__value_.__l.__data_);
    goto LABEL_41;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = v5;
    CFTypeID v7 = CFGetTypeID(v6);
    if (v7 == CFBooleanGetTypeID())
    {
      unsigned int v8 = [v6 BOOLValue];
      *(unsigned char *)a1 = 4;
      *((void *)a1 + 1) = v8;
LABEL_40:
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)a1);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)a1);

      goto LABEL_41;
    }
    uint64_t v9 = v6;
    int v10 = *(char *)[v9 objCType];
    if (v10 <= 80)
    {
      if (v10 > 72)
      {
        if (v10 == 73 || v10 == 76) {
          goto LABEL_38;
        }
        goto LABEL_42;
      }
      if (v10 != 66)
      {
        if (v10 == 67)
        {
LABEL_38:
          uint64_t v15 = [v9 unsignedLongLongValue];
          char v16 = 6;
          goto LABEL_39;
        }
LABEL_42:
        v17 = (void *)MEMORY[0x1E4F1CA00];
        v18 = (char *)[v9 objCType];
        objc_msgSend(v17, "raise:format:", *MEMORY[0x1E4F1C3C8], @"Invalid number type in JSON write (%c)", *v18);
        *(unsigned char *)a1 = 0;
        a1[1] = 0.0;
        goto LABEL_40;
      }
    }
    else
    {
      if ((v10 - 99) > 0x10) {
        goto LABEL_36;
      }
      if (((1 << (v10 - 99)) & 0x14241) == 0)
      {
        if (v10 == 100)
        {
          [v9 doubleValue];
          uint64_t v20 = *(void *)&v19;
          if (fabs(v19) == INFINITY) {
            [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Invalid number value (infinite) in JSON write"];
          }
          *(unsigned char *)a1 = 7;
          *((void *)a1 + 1) = v20;
          goto LABEL_40;
        }
        if (v10 == 102)
        {
          [v9 floatValue];
          float v12 = v11;
          if (fabsf(v11) == INFINITY) {
            [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Invalid number value (infinite) in JSON conversion"];
          }
          *(unsigned char *)a1 = 7;
          a1[1] = v12;
          goto LABEL_40;
        }
LABEL_36:
        if (v10 == 81 || v10 == 83) {
          goto LABEL_38;
        }
        goto LABEL_42;
      }
    }
    uint64_t v15 = [v9 longLongValue];
    char v16 = 5;
LABEL_39:
    *(unsigned char *)a1 = v16;
    *((void *)a1 + 1) = v15;
    goto LABEL_40;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    *(_OWORD *)&__p.__r_.__value_.__r.__words[1] = 0uLL;
    __p.__r_.__value_.__r.__words[0] = (std::string::size_type)&__p.__r_.__value_.__l.__size_;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = ___ZL34makeJsonFromNSObjectWithDepthCountP8NSObjecth_block_invoke;
    v23[3] = &__block_descriptor_41_e15_v32__0_8_16_B24l;
    v23[4] = &__p;
    char v24 = a3;
    [v5 enumerateKeysAndObjectsUsingBlock:v23];
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<std::map<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::map<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,0>((uint64_t)a1, &__p);
    std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::destroy((uint64_t)&__p, (char *)__p.__r_.__value_.__l.__size_);
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      memset(&__p, 0, sizeof(__p));
      std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::reserve((uint64_t *)&__p, [v5 count]);
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = ___ZL34makeJsonFromNSObjectWithDepthCountP8NSObjecth_block_invoke_2;
      v21[3] = &__block_descriptor_41_e15_v32__0_8Q16_B24l;
      v21[4] = &__p;
      char v22 = a3;
      [v5 enumerateObjectsUsingBlock:v21];
      a1[1] = 0.0;
      *(unsigned char *)a1 = 2;
      v13 = (std::string *)operator new(0x18uLL);
      std::string *v13 = __p;
      memset(&__p, 0, sizeof(__p));
      *((void *)a1 + 1) = v13;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)a1);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)a1);
      v26[0] = (void **)&__p;
      std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__destroy_vector::operator()[abi:ne180100](v26);
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v14 = v5;
        hex((unsigned __int8 *)[v14 bytes], [v14 length], &__p);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<std::string,std::string,0>((uint64_t)a1, (uint64_t)&__p);
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__p.__r_.__value_.__l.__data_);
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Invalid type in JSON write (%@)", objc_opt_class() format];
        }
        *(unsigned char *)a1 = 0;
        a1[1] = 0.0;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)a1);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)a1);
      }
    }
  }
LABEL_41:
}

void sub_1A7C3E290(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  _Unwind_Resume(a1);
}

uint64_t *std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__emplace_unique_impl<char const*&,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>(uint64_t **a1, char **a2, uint64_t a3)
{
  v8[3] = *(uint64_t **)MEMORY[0x1E4F143B8];
  memset(v8, 170, 24);
  std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__construct_node<char const*&,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>((uint64_t)a1, a2, a3, v8);
  uint64_t v7 = 0xAAAAAAAAAAAAAAAALL;
  v4 = (uint64_t **)std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__find_equal<std::string>((uint64_t)a1, &v7, (const void **)v8[0] + 4);
  id v5 = *v4;
  if (!*v4)
  {
    std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__insert_node_at(a1, v7, v4, v8[0]);
    id v5 = v8[0];
    v8[0] = 0;
  }
  std::unique_ptr<std::__tree_node<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void *>>>>::reset[abi:ne180100]((uint64_t)v8, 0);
  return v5;
}

void sub_1A7C3E3D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  std::unique_ptr<std::__tree_node<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void *>>>>::reset[abi:ne180100]((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

uint64_t *std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  id v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  uint64_t result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

uint64_t *std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  *((unsigned char *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      v2 = (uint64_t *)a2[2];
      if (*((unsigned char *)v2 + 24)) {
        return result;
      }
      v3 = (uint64_t *)v2[2];
      v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), id v5 = (unsigned char *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            uint64_t v9 = (uint64_t **)a2[2];
          }
          else
          {
            uint64_t v9 = (uint64_t **)v2[1];
            int v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = v9;
            *uint64_t v9 = v2;
            v2[2] = (uint64_t)v9;
            v3 = v9[2];
            v2 = (uint64_t *)*v3;
          }
          *((unsigned char *)v9 + 24) = 1;
          *((unsigned char *)v3 + 24) = 0;
          uint64_t v13 = v2[1];
          uint64_t *v3 = v13;
          if (v13) {
            *(void *)(v13 + 16) = v3;
          }
          v2[2] = v3[2];
          *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), id v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          uint64_t v11 = a2[1];
          uint64_t *v2 = v11;
          if (v11)
          {
            *(void *)(v11 + 16) = v2;
            v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((unsigned char *)a2 + 24) = 1;
        *((unsigned char *)v3 + 24) = 0;
        v2 = (uint64_t *)v3[1];
        uint64_t v12 = *v2;
        v3[1] = *v2;
        if (v12) {
          *(void *)(v12 + 16) = v3;
        }
        v2[2] = v3[2];
        *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
        uint64_t *v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((unsigned char *)v2 + 24) = 1;
      a2 = v3;
      *((unsigned char *)v3 + 24) = v3 == result;
      *id v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

void *std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__find_equal<std::string>(uint64_t a1, void *a2, const void **a3)
{
  id v5 = (void *)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 8);
  if (v4)
  {
    uint64_t v7 = a1 + 16;
    do
    {
      while (1)
      {
        int v8 = (void *)v4;
        uint64_t v9 = (const void **)(v4 + 32);
        if (!std::less<void>::operator()[abi:ne180100]<std::string const&,std::string const&>(v7, a3, (const void **)(v4 + 32)))break; {
        uint64_t v4 = *v8;
        }
        id v5 = v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }
      if (!std::less<void>::operator()[abi:ne180100]<std::string const&,std::string const&>(v7, v9, a3)) {
        break;
      }
      id v5 = v8 + 1;
      uint64_t v4 = v8[1];
    }
    while (v4);
  }
  else
  {
    int v8 = (void *)(a1 + 8);
  }
LABEL_10:
  *a2 = v8;
  return v5;
}

BOOL std::less<void>::operator()[abi:ne180100]<std::string const&,std::string const&>(uint64_t a1, const void **a2, const void **a3)
{
  int v3 = *((char *)a3 + 23);
  int v4 = *((char *)a2 + 23);
  if (v4 >= 0) {
    size_t v5 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    size_t v5 = (size_t)a2[1];
  }
  if (v4 >= 0) {
    int v6 = a2;
  }
  else {
    int v6 = *a2;
  }
  if (v3 >= 0) {
    size_t v7 = *((unsigned __int8 *)a3 + 23);
  }
  else {
    size_t v7 = (size_t)a3[1];
  }
  if (v3 >= 0) {
    int v8 = a3;
  }
  else {
    int v8 = *a3;
  }
  if (v7 >= v5) {
    size_t v9 = v5;
  }
  else {
    size_t v9 = v7;
  }
  int v10 = memcmp(v6, v8, v9);
  if (v10) {
    return v10 < 0;
  }
  else {
    return v5 < v7;
  }
}

void *std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__construct_node<char const*&,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>@<X0>(uint64_t a1@<X0>, char **a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  uint64_t v7 = a1 + 8;
  memset(a4, 170, 24);
  int v8 = operator new(0x48uLL);
  *a4 = v8;
  a4[1] = v7;
  *((unsigned char *)a4 + 16) = 0;
  uint64_t result = std::pair<std::string const,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::pair[abi:ne180100]<char const*&,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,0>(v8 + 4, a2, a3);
  *((unsigned char *)a4 + 16) = 1;
  return result;
}

void sub_1A7C3E75C(_Unwind_Exception *a1)
{
  std::unique_ptr<std::__tree_node<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void *>>>>::reset[abi:ne180100](v1, 0);
  _Unwind_Resume(a1);
}

void *std::pair<std::string const,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::pair[abi:ne180100]<char const*&,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,0>(void *a1, char **a2, uint64_t a3)
{
  size_t v5 = std::string::basic_string[abi:ne180100]<0>(a1, *a2);
  *((unsigned char *)v5 + 24) = *(unsigned char *)a3;
  uint64_t v6 = (uint64_t)(v5 + 3);
  v5[4] = *(void *)(a3 + 8);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a3);
  *(unsigned char *)a3 = 0;
  *(void *)(a3 + 8) = 0;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v6);
  return a1;
}

void std::unique_ptr<std::__tree_node<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void *>>>>::reset[abi:ne180100](uint64_t a1, uint64_t a2)
{
  v2 = *(void **)a1;
  *(void *)a1 = a2;
  if (v2)
  {
    if (*(unsigned char *)(a1 + 16)) {
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,0>((uint64_t)v2 + 32);
    }
    operator delete(v2);
  }
}

void xpc_to_json(uint64_t *__return_ptr a1@<X8>, xpc_object_t *a2@<X0>)
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  *a1 = 0xAAAAAAAAAAAAAAAALL;
  a1[1] = 0;
  *(unsigned char *)a1 = 0;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)a1);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)a1);
  int v4 = (const _xpc_type_s *)MEMORY[0x1AD0D7420](*a2);
  if (v4 == (const _xpc_type_s *)MEMORY[0x1E4F14590])
  {
    uint64_t v8 = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v65, 0, 0, 0, 1);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v8);
    char v9 = *(unsigned char *)a1;
    *(unsigned char *)a1 = v65[0];
    v65[0] = v9;
    int v10 = (uint64_t *)a1[1];
    a1[1] = (uint64_t)v66;
    v66 = v10;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)a1);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v65);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v66, v65[0]);
    xpc_object_t v11 = *a2;
    applier[0] = MEMORY[0x1E4F143A8];
    applier[1] = 0x40000000;
    applier[2] = ___Z11xpc_to_jsonRKN10applesauce3xpc6objectE_block_invoke;
    applier[3] = &__block_descriptor_tmp_0;
    applier[4] = a1;
    xpc_dictionary_apply(v11, applier);
    return;
  }
  if (v4 == (const _xpc_type_s *)MEMORY[0x1E4F145F0])
  {
    *(void *)uuid_string_t out = xpc_string_get_string_ptr(*a2);
    uint64_t v12 = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const*&,char const*,0>((uint64_t)v62, (char **)out);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v12);
    char v13 = *(unsigned char *)a1;
    *(unsigned char *)a1 = v62[0];
    v62[0] = v13;
    v14 = (uint64_t *)a1[1];
    a1[1] = (uint64_t)v63;
    v63 = v14;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)a1);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v62);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v63, v62[0]);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::dump((uint64_t)a1, -1, 0x20u, 0, 0, &__p);
    if ((v61 & 0x80000000) == 0) {
      return;
    }
    uint64_t v15 = __p;
    goto LABEL_15;
  }
  if (v4 == (const _xpc_type_s *)MEMORY[0x1E4F145C0])
  {
    int64_t value = xpc_int64_get_value(*a2);
    v17 = &v59;
    v58[0] = 5;
    uint64_t v59 = value;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v58);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v58);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v58);
    unsigned __int8 v18 = *(unsigned char *)a1;
    *(unsigned char *)a1 = v58[0];
    v58[0] = v18;
    uint64_t v19 = a1[1];
    a1[1] = v59;
    uint64_t v59 = v19;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)a1);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v58);
    int v20 = v58[0];
    goto LABEL_17;
  }
  if (v4 != (const _xpc_type_s *)MEMORY[0x1E4F14568])
  {
    if (v4 != (const _xpc_type_s *)MEMORY[0x1E4F14580])
    {
      if (v4 == (const _xpc_type_s *)MEMORY[0x1E4F14570])
      {
        BOOL v34 = xpc_BOOL_get_value(*a2);
        v17 = &v53;
        v52[0] = 4;
        uint64_t v53 = v34;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v52);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v52);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v52);
        unsigned __int8 v35 = *(unsigned char *)a1;
        *(unsigned char *)a1 = v52[0];
        v52[0] = v35;
        uint64_t v36 = a1[1];
        a1[1] = v53;
        uint64_t v53 = v36;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)a1);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v52);
        int v20 = v52[0];
      }
      else
      {
        if (v4 != (const _xpc_type_s *)MEMORY[0x1E4F145F8])
        {
          if (v4 == (const _xpc_type_s *)MEMORY[0x1E4F145D8])
          {
            v48[0] = 0;
            uint64_t v49 = 0;
            nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v48);
            nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v48);
            nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::operator=((uint64_t)a1, (uint64_t)v48);
            uint64_t v7 = (uint64_t **)v48;
          }
          else if (v4 == (const _xpc_type_s *)MEMORY[0x1E4F14598])
          {
            *(void *)uuid_string_t out = xpc_double_get_value(*a2);
            nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<double,double,0>((uint64_t)v47, (uint64_t *)out);
            nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::operator=((uint64_t)a1, (uint64_t)v47);
            uint64_t v7 = (uint64_t **)v47;
          }
          else
          {
            if (v4 != (const _xpc_type_s *)MEMORY[0x1E4F14600])
            {
              memset(out, 170, 24);
              name = (char *)xpc_type_get_name(v4);
              std::string::basic_string[abi:ne180100]<0>(out, name);
              exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
              std::operator+<char>();
              v42 = std::string::append(&v44, ") cannot be converted and is invalid");
              long long v43 = *(_OWORD *)&v42->__r_.__value_.__l.__data_;
              v45.__r_.__value_.__r.__words[2] = v42->__r_.__value_.__r.__words[2];
              *(_OWORD *)&v45.__r_.__value_.__l.__data_ = v43;
              v42->__r_.__value_.__l.__size_ = 0;
              v42->__r_.__value_.__r.__words[2] = 0;
              v42->__r_.__value_.__r.__words[0] = 0;
              std::logic_error::logic_error(exception, &v45);
              exception->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E4FBA4E8] + 16);
              __cxa_throw(exception, (struct type_info *)off_1E5D1EA28, MEMORY[0x1E4FBA1E8]);
            }
            *(void *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
            *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
            *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
            *(_OWORD *)uuid_string_t out = v5;
            *(_OWORD *)&out[16] = v5;
            bytes = xpc_uuid_get_bytes(*a2);
            uuid_unparse_lower(bytes, out);
            nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char (&)[37],char [37],0>((uint64_t)v46, out);
            nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::operator=((uint64_t)a1, (uint64_t)v46);
            uint64_t v7 = (uint64_t **)v46;
          }
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::~basic_json(v7);
          return;
        }
        uint64_t v37 = xpc_uint64_get_value(*a2);
        v17 = &v51;
        v50[0] = 6;
        uint64_t v51 = v37;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v50);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v50);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v50);
        unsigned __int8 v38 = *(unsigned char *)a1;
        *(unsigned char *)a1 = v50[0];
        v50[0] = v38;
        uint64_t v39 = a1[1];
        a1[1] = v51;
        uint64_t v51 = v39;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)a1);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v50);
        int v20 = v50[0];
      }
LABEL_17:
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)v17, v20);
      return;
    }
    bytes_ptr = (unsigned __int8 *)xpc_data_get_bytes_ptr(*a2);
    size_t length = xpc_data_get_length(*a2);
    hex(bytes_ptr, length, (std::string *)out);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<std::string,std::string,0>((uint64_t)v54, (uint64_t)out);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v54);
    char v32 = *(unsigned char *)a1;
    *(unsigned char *)a1 = v54[0];
    v54[0] = v32;
    v33 = (uint64_t *)a1[1];
    a1[1] = (uint64_t)v55;
    v55 = v33;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)a1);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v54);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v55, v54[0]);
    if ((out[23] & 0x80000000) == 0) {
      return;
    }
    uint64_t v15 = *(void **)out;
LABEL_15:
    operator delete(v15);
    return;
  }
  memset(out, 170, 24);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)&v45, 0, 0, 0, 2);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::get<std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,0>((uint64_t)&v45, out);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v45);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v45.__r_.__value_.__l.__size_, v45.__r_.__value_.__s.__data_[0]);
  size_t count = xpc_array_get_count(*a2);
  std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::reserve((uint64_t *)out, count);
  if (count)
  {
    for (size_t i = 0; i != count; ++i)
    {
      xpc_object_t v23 = xpc_array_get_value(*a2, i);
      xpc_object_t v24 = v23;
      v44.__r_.__value_.__r.__words[0] = (std::string::size_type)v23;
      if (v23)
      {
        xpc_retain(v23);
      }
      else
      {
        xpc_object_t v24 = xpc_null_create();
        v44.__r_.__value_.__r.__words[0] = (std::string::size_type)v24;
      }
      xpc_to_json((uint64_t *)&v45, (const applesauce::xpc::object *)&v44);
      uint64_t v25 = *(void *)&out[8];
      if (*(void *)&out[8] >= *(void *)&out[16])
      {
        uint64_t v26 = std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__emplace_back_slow_path<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>((uint64_t *)out, (uint64_t)&v45);
      }
      else
      {
        **(unsigned char **)&out[8] = v45.__r_.__value_.__s.__data_[0];
        *(void *)(v25 + 8) = v45.__r_.__value_.__l.__size_;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v45);
        v45.__r_.__value_.__s.__data_[0] = 0;
        v45.__r_.__value_.__l.__size_ = 0;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v25);
        uint64_t v26 = v25 + 16;
      }
      *(void *)&out[8] = v26;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v45);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&v45.__r_.__value_.__l.__size_, v45.__r_.__value_.__s.__data_[0]);
      xpc_release(v24);
    }
  }
  v56[0] = 2;
  v27 = (uint64_t *)operator new(0x18uLL);
  *(_OWORD *)v27 = *(_OWORD *)out;
  v27[2] = *(void *)&out[16];
  memset(out, 0, 24);
  v57 = v27;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v56);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v56);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v56);
  unsigned __int8 v28 = *(unsigned char *)a1;
  *(unsigned char *)a1 = v56[0];
  v56[0] = v28;
  std::string v29 = (uint64_t *)a1[1];
  a1[1] = (uint64_t)v57;
  v57 = v29;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)a1);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v56);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v57, v56[0]);
  v45.__r_.__value_.__r.__words[0] = (std::string::size_type)out;
  std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v45);
}

void sub_1A7C3EFA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a15 < 0)
  {
    operator delete(a10);
    if ((v23 & 1) == 0)
    {
LABEL_8:
      if (*(char *)(v24 - 105) < 0) {
        operator delete(*(void **)(v24 - 128));
      }
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::~basic_json(v21);
      _Unwind_Resume(a1);
    }
  }
  else if (!v23)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v22);
  goto LABEL_8;
}

uint64_t std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__base_destruct_at_end[abi:ne180100](uint64_t result, uint64_t a2)
{
  uint64_t v3 = result;
  uint64_t v4 = *(void *)(result + 8);
  if (v4 != a2)
  {
    uint64_t v5 = v4 - 16;
    uint64_t v6 = (unsigned __int8 *)(v4 - 16);
    do
    {
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v5);
      unsigned int v7 = *v6;
      v6 -= 16;
      uint64_t result = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(v5 + 8, v7);
      BOOL v8 = v5 == a2;
      uint64_t v5 = (uint64_t)v6;
    }
    while (!v8);
  }
  *(void *)(v3 + 8) = a2;
  return result;
}

void nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(uint64_t **a1, int a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v23 = 0;
  unint64_t v24 = 0;
  unint64_t v25 = 0;
  int v3 = a2 - 1;
  if (a2 == 1)
  {
    std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::reserve(&v23, (*a1)[2]);
    uint64_t v5 = (uint64_t)(*a1 + 1);
    uint64_t v6 = (void *)**a1;
    unint64_t v4 = v24;
    if (v6 != (void *)v5)
    {
      do
      {
        if (v4 >= v25)
        {
          unint64_t v4 = std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__push_back_slow_path<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>(&v23, (uint64_t)(v6 + 7));
        }
        else
        {
          *(unsigned char *)unint64_t v4 = *((unsigned char *)v6 + 56);
          *(void *)(v4 + 8) = v6[8];
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)(v6 + 7));
          *((unsigned char *)v6 + 56) = 0;
          v6[8] = 0;
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v4);
          v4 += 16;
        }
        unint64_t v24 = v4;
        unsigned int v7 = (void *)v6[1];
        if (v7)
        {
          do
          {
            BOOL v8 = v7;
            unsigned int v7 = (void *)*v7;
          }
          while (v7);
        }
        else
        {
          do
          {
            BOOL v8 = (void *)v6[2];
            BOOL v9 = *v8 == (void)v6;
            uint64_t v6 = v8;
          }
          while (!v9);
        }
        uint64_t v6 = v8;
      }
      while (v8 != (void *)v5);
    }
  }
  else
  {
    unint64_t v4 = 0;
    if (a2 == 2)
    {
      std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::reserve(&v23, ((*a1)[1] - **a1) >> 4);
      std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> *,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> *,std::back_insert_iterator<std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>((uint64_t)&v21, **a1, (*a1)[1], &v23);
      unint64_t v4 = v24;
    }
  }
  if (v23 != v4)
  {
    do
    {
      v21 = (void **)0xAAAAAAAAAAAAAAAALL;
      char v22 = (uint64_t *)0xAAAAAAAAAAAAAAAALL;
      char v11 = *(unsigned char *)(v4 - 16);
      uint64_t v10 = v4 - 16;
      LOBYTE(v21) = v11;
      char v22 = *(uint64_t **)(v10 + 8);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v10);
      *(unsigned char *)uint64_t v10 = 0;
      *(void *)(v10 + 8) = 0;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v21);
      std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__base_destruct_at_end[abi:ne180100]((uint64_t)&v23, v24 - 16);
      if (v21 == 1)
      {
        uint64_t v12 = v22;
        char v13 = v22 + 1;
        v14 = (void *)*v22;
        if ((uint64_t *)*v22 != v22 + 1)
        {
          unint64_t v15 = v24;
          do
          {
            if (v15 >= v25)
            {
              unint64_t v15 = std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__push_back_slow_path<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>(&v23, (uint64_t)(v14 + 7));
            }
            else
            {
              *(unsigned char *)unint64_t v15 = *((unsigned char *)v14 + 56);
              *(void *)(v15 + 8) = v14[8];
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)(v14 + 7));
              *((unsigned char *)v14 + 56) = 0;
              v14[8] = 0;
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v15);
              v15 += 16;
            }
            unint64_t v24 = v15;
            char v16 = (void *)v14[1];
            if (v16)
            {
              do
              {
                v17 = v16;
                char v16 = (void *)*v16;
              }
              while (v16);
            }
            else
            {
              do
              {
                v17 = (void *)v14[2];
                BOOL v9 = *v17 == (void)v14;
                v14 = v17;
              }
              while (!v9);
            }
            v14 = v17;
          }
          while (v17 != v13);
          uint64_t v12 = v22;
        }
        std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::destroy((uint64_t)v12, (char *)v12[1]);
        uint64_t *v12 = (uint64_t)(v12 + 1);
        v12[2] = 0;
        v12[1] = 0;
      }
      else if (v21 == 2)
      {
        std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> *,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> *,std::back_insert_iterator<std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>((uint64_t)&v26, *v22, v22[1], &v23);
        std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::clear[abi:ne180100](v22);
      }
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v21);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v22, v21);
      unint64_t v4 = v24;
    }
    while (v23 != v24);
  }
  switch(v3)
  {
    case 0:
      std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::destroy((uint64_t)*a1, (char *)(*a1)[1]);
      goto LABEL_40;
    case 1:
      v21 = (void **)*a1;
      std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__destroy_vector::operator()[abi:ne180100](&v21);
      goto LABEL_40;
    case 2:
      unsigned __int8 v18 = *a1;
      if ((*((char *)*a1 + 23) & 0x80000000) == 0) {
        goto LABEL_41;
      }
      uint64_t v19 = (void *)*v18;
      break;
    case 7:
      unsigned __int8 v18 = *a1;
      int v20 = (void *)**a1;
      if (!v20) {
        goto LABEL_41;
      }
      v18[1] = (uint64_t)v20;
      uint64_t v19 = v20;
      break;
    default:
      goto LABEL_42;
  }
  operator delete(v19);
LABEL_40:
  unsigned __int8 v18 = *a1;
LABEL_41:
  operator delete(v18);
LABEL_42:
  v21 = (void **)&v23;
  std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__destroy_vector::operator()[abi:ne180100](&v21);
}

void sub_1A7C3F480(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

uint64_t nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(uint64_t result)
{
  switch(*(unsigned char *)result)
  {
    case 1:
      if (*(void *)(result + 8)) {
        return result;
      }
      uint64_t v1 = "m_type != value_t::object or m_value.object != nullptr";
      int v2 = 1220;
      break;
    case 2:
      if (*(void *)(result + 8)) {
        return result;
      }
      uint64_t v1 = "m_type != value_t::array or m_value.array != nullptr";
      int v2 = 1221;
      break;
    case 3:
      if (*(void *)(result + 8)) {
        return result;
      }
      uint64_t v1 = "m_type != value_t::string or m_value.string != nullptr";
      int v2 = 1222;
      break;
    case 8:
      if (*(void *)(result + 8)) {
        return result;
      }
      uint64_t v1 = "m_type != value_t::binary or m_value.binary != nullptr";
      int v2 = 1223;
      break;
    default:
      return result;
  }
  __assert_rtn("assert_invariant", "json.hpp", v2, v1);
}

void std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  int v2 = (char *)**a1;
  if (v2)
  {
    unint64_t v4 = (char *)v1[1];
    uint64_t v5 = **a1;
    if (v4 != v2)
    {
      uint64_t v6 = (uint64_t)(v4 - 16);
      unsigned int v7 = v4 - 16;
      do
      {
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v6);
        unsigned int v8 = *v7;
        v7 -= 16;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(v6 + 8, v8);
        BOOL v9 = v6 == (void)v2;
        uint64_t v6 = (uint64_t)v7;
      }
      while (!v9);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::destroy(uint64_t a1, char *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::destroy(a1, *(void *)a2);
    std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::destroy(a1, *((void *)a2 + 1));
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)(a2 + 56));
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(a2 + 64, a2[56]);
    if (a2[55] < 0) {
      operator delete(*((void **)a2 + 4));
    }
    operator delete(a2);
  }
}

uint64_t ___Z11xpc_to_jsonRKN10applesauce3xpc6objectE_block_invoke(uint64_t a1, char *a2, xpc_object_t a3)
{
  v15[1] = *(char **)MEMORY[0x1E4F143B8];
  v15[0] = a2;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const*&,char const*,0>((uint64_t)&v11, v15);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::dump((uint64_t)&v11, -1, 0x20u, 0, 0, &__p);
  if (v14 < 0) {
    operator delete(__p);
  }
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v11);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v12, v11);
  xpc_object_t v11 = a3;
  if (a3)
  {
    xpc_retain(a3);
  }
  else
  {
    a3 = xpc_null_create();
    xpc_object_t v11 = a3;
  }
  xpc_to_json(&v9, (const applesauce::xpc::object *)&v11);
  uint64_t v5 = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::operator[]<char const>(*(unsigned __int8 **)(a1 + 32), v15[0]);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v9);
  char v6 = *(unsigned char *)v5;
  *(unsigned char *)uint64_t v5 = v9;
  LOBYTE(v9) = v6;
  unsigned int v7 = (uint64_t *)v5[1];
  v5[1] = (uint64_t)v10;
  uint64_t v10 = v7;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v5);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v9);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v10, v9);
  xpc_release(a3);
  return 1;
}

void sub_1A7C3F7C0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, char a12)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

uint64_t nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const*&,char const*,0>(uint64_t a1, char **a2)
{
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)a1 = 3;
  *(void *)(a1 + 8) = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::create<std::string,char const* const&>(a2);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a1);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a1);
  return a1;
}

void *nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::create<std::string,char const* const&>(char **a1)
{
  int v2 = operator new(0x18uLL);
  std::string::basic_string[abi:ne180100]<0>(v2, *a1);
  return v2;
}

void sub_1A7C3F898(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::dump@<X0>(uint64_t a1@<X0>, int a2@<W1>, unsigned int a3@<W2>, uint64_t a4@<X3>, int a5@<W4>, void *a6@<X8>)
{
  __b[80] = *(void ***)MEMORY[0x1E4F143B8];
  *a6 = 0;
  a6[1] = 0;
  a6[2] = 0;
  memset(__b, 170, 0x280uLL);
  uint64_t v12 = (std::__shared_weak_count *)operator new(0x28uLL);
  v12->__shared_owners_ = 0;
  v12->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EFE160E0;
  v12->__shared_weak_owners_ = 0;
  v12[1].__vftable = (std::__shared_weak_count_vtbl *)&unk_1EFE15F08;
  v12[1].__shared_owners_ = (uint64_t)a6;
  char v14 = v12 + 1;
  unint64_t v15 = v12;
  atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
  nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::serializer((uint64_t)__b, (uint64_t)&v14, a3, a5);
  if (v15) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v15);
  }
  std::__shared_weak_count::__release_shared[abi:ne180100](v12);
  nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump(__b, a1, a2 >= 0, a4, a2 & ~(a2 >> 31), 0);
  return nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::~serializer((uint64_t)__b);
}

void sub_1A7C3F9F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::~serializer((uint64_t)va);
  if (*(char *)(v4 + 23) < 0) {
    operator delete(*(void **)v4);
  }
  _Unwind_Resume(a1);
}

uint64_t nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump(void ***a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  switch(*(unsigned char *)a2)
  {
    case 0:
      xpc_object_t v11 = (uint64_t (*)(void))(**a1)[1];
      goto LABEL_83;
    case 1:
      uint64_t v12 = (uint64_t)**a1;
      if (!*(void *)(*(void *)(a2 + 8) + 16))
      {
        std::string v45 = *(uint64_t (**)(void))(v12 + 8);
        goto LABEL_52;
      }
      if (a3)
      {
        (*(void (**)(void))(v12 + 8))();
        unsigned int v13 = a6 + a5;
        char v14 = a1 + 76;
        if (*((char *)a1 + 631) < 0)
        {
          unint64_t v15 = (unint64_t)a1[77];
          if (v15 >= v13) {
            goto LABEL_7;
          }
        }
        else
        {
          unint64_t v15 = *((unsigned __int8 *)a1 + 631);
          if (v13 <= v15)
          {
LABEL_7:
            char v16 = *(void **)(a2 + 8);
            v17 = (void *)*v16;
            if (v16[2] == 1)
            {
              unsigned __int8 v18 = (void *)*v16;
            }
            else
            {
              unint64_t v67 = 0;
              do
              {
                uint64_t v68 = a1 + 76;
                if (*((char *)a1 + 631) < 0) {
                  uint64_t v68 = (void ***)*v14;
                }
                ((void (*)(void, void ***, void))(**a1)[1])(*a1, v68, (a6 + a5));
                ((void (*)(void))***a1)();
                nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_escaped((uint64_t)a1, v17 + 4, a4);
                ((void (*)(void, const char *, uint64_t))(**a1)[1])(*a1, "\": ", 3);
                nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump(a1, v17 + 7, 1, a4, a5, (a6 + a5));
                ((void (*)(void, const char *, uint64_t))(**a1)[1])(*a1, ",\n", 2);
                v69 = (void *)v17[1];
                if (v69)
                {
                  do
                  {
                    unsigned __int8 v18 = v69;
                    v69 = (void *)*v69;
                  }
                  while (v69);
                }
                else
                {
                  do
                  {
                    unsigned __int8 v18 = (void *)v17[2];
                    BOOL v51 = *v18 == (void)v17;
                    v17 = v18;
                  }
                  while (!v51);
                }
                ++v67;
                char v16 = *(void **)(a2 + 8);
                v17 = v18;
              }
              while (v67 < v16[2] - 1);
            }
            v70 = v16 + 1;
            if (v18 == v70) {
              nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump();
            }
            v71 = (void *)v18[1];
            if (v71)
            {
              do
              {
                v72 = v71;
                v71 = (void *)*v71;
              }
              while (v71);
            }
            else
            {
              v74 = v18;
              do
              {
                v72 = (void *)v74[2];
                BOOL v51 = *v72 == (void)v74;
                v74 = v72;
              }
              while (!v51);
            }
            if (v72 != v70) {
              nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump();
            }
            v75 = a1 + 76;
            if (*((char *)a1 + 631) < 0) {
              v75 = (void ***)*v14;
            }
            ((void (*)(void, void ***, void))(**a1)[1])(*a1, v75, (a6 + a5));
            ((void (*)(void))***a1)();
            nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_escaped((uint64_t)a1, v18 + 4, a4);
            ((void (*)(void, const char *, uint64_t))(**a1)[1])(*a1, "\": ", 3);
            nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump(a1, v18 + 7, 1, a4, a5, (a6 + a5));
            ((void (*)(void))***a1)();
            v66 = (void (*)(void))(**a1)[1];
            goto LABEL_121;
          }
        }
        std::string::resize((std::string *)(a1 + 76), 2 * v15, 32);
        goto LABEL_7;
      }
      (*(void (**)(void))v12)();
      uint64_t v46 = *(void *)(a2 + 8);
      v47 = *(void **)v46;
      if (*(void *)(v46 + 16) != 1)
      {
        unint64_t v48 = 0;
        do
        {
          ((void (*)(void, uint64_t))***a1)(*a1, 34);
          nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_escaped((uint64_t)a1, v47 + 4, a4);
          ((void (*)(void, const char *, uint64_t))(**a1)[1])(*a1, "\":", 2);
          nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump(a1, v47 + 7, 0, a4, a5, a6);
          ((void (*)(void))***a1)();
          uint64_t v49 = (void *)v47[1];
          v50 = v47;
          if (v49)
          {
            do
            {
              v47 = v49;
              uint64_t v49 = (void *)*v49;
            }
            while (v49);
          }
          else
          {
            do
            {
              v47 = (void *)v50[2];
              BOOL v51 = *v47 == (void)v50;
              v50 = v47;
            }
            while (!v51);
          }
          ++v48;
          uint64_t v46 = *(void *)(a2 + 8);
        }
        while (v48 < *(void *)(v46 + 16) - 1);
      }
      v52 = (void *)(v46 + 8);
      if (v47 == v52) {
        nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump();
      }
      uint64_t v53 = (void *)v47[1];
      if (v53)
      {
        do
        {
          v54 = v53;
          uint64_t v53 = (void *)*v53;
        }
        while (v53);
      }
      else
      {
        v73 = v47;
        do
        {
          v54 = (void *)v73[2];
          BOOL v51 = *v54 == (void)v73;
          v73 = v54;
        }
        while (!v51);
      }
      if (v54 != v52) {
        nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump();
      }
      ((void (*)(void, uint64_t))***a1)(*a1, 34);
      nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_escaped((uint64_t)a1, v47 + 4, a4);
      ((void (*)(void, const char *, uint64_t))(**a1)[1])(*a1, "\":", 2);
      nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump(a1, v47 + 7, 0, a4, a5, a6);
LABEL_122:
      xpc_object_t v11 = (uint64_t (*)(void))***a1;
LABEL_123:
      return v11();
    case 2:
      uint64_t v19 = (void (**)(void))**a1;
      if (**(void **)(a2 + 8) != *(void *)(*(void *)(a2 + 8) + 8))
      {
        if (!a3)
        {
          (*v19)();
          v55 = *(uint64_t **)(a2 + 8);
          uint64_t v57 = *v55;
          uint64_t v56 = v55[1];
          if (v57 == v56 - 16)
          {
            uint64_t v58 = v57;
          }
          else
          {
            uint64_t v58 = v57;
            do
            {
              nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump(a1, v58, 0, a4, a5, a6);
              ((void (*)(void))***a1)();
              v58 += 16;
              uint64_t v59 = *(uint64_t **)(a2 + 8);
              uint64_t v56 = v59[1];
            }
            while (v58 != v56 - 16);
            uint64_t v57 = *v59;
          }
          if (v57 == v56) {
            nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump();
          }
          nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump(a1, v58, 0, a4, a5, a6);
          goto LABEL_108;
        }
        v19[1]();
        unsigned int v20 = a6 + a5;
        v21 = a1 + 76;
        if (*((char *)a1 + 631) < 0)
        {
          unint64_t v22 = (unint64_t)a1[77];
          if (v22 >= v20) {
            goto LABEL_13;
          }
        }
        else
        {
          unint64_t v22 = *((unsigned __int8 *)a1 + 631);
          if (v20 <= v22)
          {
LABEL_13:
            uint64_t v23 = *(uint64_t **)(a2 + 8);
            uint64_t v25 = *v23;
            uint64_t v24 = v23[1];
            if (v25 != v24 - 16)
            {
              do
              {
                char v26 = a1 + 76;
                if (*((char *)a1 + 631) < 0) {
                  char v26 = (void ***)*v21;
                }
                ((void (*)(void, void ***, void))(**a1)[1])(*a1, v26, (a6 + a5));
                nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump(a1, v25, 1, a4, a5, (a6 + a5));
                ((void (*)(void, const char *, uint64_t))(**a1)[1])(*a1, ",\n", 2);
                v25 += 16;
                uint64_t v27 = *(uint64_t **)(a2 + 8);
                uint64_t v24 = v27[1];
              }
              while (v25 != v24 - 16);
              uint64_t v25 = *v27;
            }
            if (v25 == v24) {
              nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump();
            }
            unsigned __int8 v28 = a1 + 76;
            if (*((char *)a1 + 631) < 0) {
              unsigned __int8 v28 = (void ***)*v21;
            }
            ((void (*)(void, void ***, void))(**a1)[1])(*a1, v28, (a6 + a5));
            nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump(a1, *(void *)(*(void *)(a2 + 8) + 8) - 16, 1, a4, a5, (a6 + a5));
            ((void (*)(void))***a1)();
            if (*((char *)a1 + 631) < 0) {
              v21 = (void *)*v21;
            }
            ((void (*)(void, void *, void))(**a1)[1])(*a1, v21, a6);
LABEL_108:
            xpc_object_t v11 = (uint64_t (*)(void))***a1;
            goto LABEL_123;
          }
        }
        std::string::resize((std::string *)(a1 + 76), 2 * v22, 32);
        goto LABEL_13;
      }
      std::string v45 = (uint64_t (*)(void))v19[1];
LABEL_52:
      return v45();
    case 3:
      ((void (*)(void))***a1)();
      nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_escaped((uint64_t)a1, *(uint64_t **)(a2 + 8), a4);
      xpc_object_t v11 = (uint64_t (*)(void))***a1;
      goto LABEL_123;
    case 4:
      xpc_object_t v11 = (uint64_t (*)(void))(**a1)[1];
      goto LABEL_83;
    case 5:
      unint64_t v29 = *(void *)(a2 + 8);
      return nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_integer<long long,0>((uint64_t (****)(void))a1, v29);
    case 6:
      unint64_t v31 = *(void *)(a2 + 8);
      return nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_integer<unsigned long long,0>((uint64_t (****)(void))a1, v31);
    case 7:
      double v32 = *(double *)(a2 + 8);
      return nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_float((char *)a1, v32);
    case 8:
      v33 = (void (*)(void))(**a1)[1];
      if (a3)
      {
        v33();
        uint64_t v34 = (a6 + a5);
        unsigned __int8 v35 = a1 + 76;
        if (*((char *)a1 + 631) < 0)
        {
          unint64_t v36 = (unint64_t)a1[77];
          if (v36 >= v34)
          {
            uint64_t v37 = (uint64_t (***)(void))*a1;
            goto LABEL_73;
          }
        }
        else
        {
          unint64_t v36 = *((unsigned __int8 *)a1 + 631);
          if (v34 <= v36)
          {
            uint64_t v37 = (uint64_t (***)(void))*a1;
            unsigned __int8 v38 = a1 + 76;
            goto LABEL_74;
          }
        }
        std::string::resize((std::string *)(a1 + 76), 2 * v36, 32);
        uint64_t v37 = (uint64_t (***)(void))*a1;
        unsigned __int8 v38 = a1 + 76;
        if ((*((char *)a1 + 631) & 0x80000000) == 0)
        {
LABEL_74:
          ((void (*)(uint64_t (***)(void), void ***, uint64_t))(*v37)[1])(v37, v38, v34);
          ((void (*)(void, const char *, uint64_t))(**a1)[1])(*a1, "\"bytes\": [", 10);
          v60 = *(unsigned __int8 ***)(a2 + 8);
          v62 = *v60;
          char v61 = v60[1];
          if (v62 != v61)
          {
            if (v62 != v61 - 1)
            {
              do
              {
                unsigned int v63 = *v62++;
                nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_integer<unsigned char,0>((uint64_t)a1, v63);
                ((void (*)(void, const char *, uint64_t))(**a1)[1])(*a1, ", ", 2);
              }
              while (v62 != (unsigned __int8 *)(*(void *)(*(void *)(a2 + 8) + 8) - 1));
            }
            nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_integer<unsigned char,0>((uint64_t)a1, *v62);
          }
          ((void (*)(void, const char *, uint64_t))(**a1)[1])(*a1, "],\n", 3);
          v64 = a1 + 76;
          if (*((char *)a1 + 631) < 0) {
            v64 = (void ***)*v35;
          }
          ((void (*)(void, void ***, uint64_t))(**a1)[1])(*a1, v64, v34);
          ((void (*)(void, const char *, uint64_t))(**a1)[1])(*a1, "\"subtype\": ", 11);
          uint64_t v65 = *(void *)(a2 + 8);
          if (*(unsigned char *)(v65 + 25)) {
            nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_integer<unsigned char,0>((uint64_t)a1, *(unsigned __int8 *)(v65 + 24));
          }
          else {
            ((void (*)(void, const char *, uint64_t))(**a1)[1])(*a1, "null", 4);
          }
          ((void (*)(void, uint64_t))***a1)(*a1, 10);
          v66 = (void (*)(void))(**a1)[1];
LABEL_121:
          v66();
          goto LABEL_122;
        }
LABEL_73:
        unsigned __int8 v38 = (void ***)*v35;
        goto LABEL_74;
      }
      v33();
      uint64_t v39 = *(unsigned __int8 ***)(a2 + 8);
      v41 = *v39;
      v40 = v39[1];
      if (v41 != v40)
      {
        while (v41 != v40 - 1)
        {
          unsigned int v42 = *v41++;
          nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_integer<unsigned char,0>((uint64_t)a1, v42);
          ((void (*)(void, uint64_t))***a1)(*a1, 44);
          v40 = *(unsigned __int8 **)(*(void *)(a2 + 8) + 8);
        }
        nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_integer<unsigned char,0>((uint64_t)a1, *v41);
      }
      ((void (*)(void, const char *, uint64_t))(**a1)[1])(*a1, "],\"subtype\":", 12);
      uint64_t v43 = *(void *)(a2 + 8);
      if (*(unsigned char *)(v43 + 25))
      {
        nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_integer<unsigned char,0>((uint64_t)a1, *(unsigned __int8 *)(v43 + 24));
        std::string v44 = (uint64_t (*)(void))***a1;
        return v44();
      }
      xpc_object_t v11 = (uint64_t (*)(void))(**a1)[1];
LABEL_83:
      return v11();
    case 9:
      xpc_object_t v11 = (uint64_t (*)(void))(**a1)[1];
      goto LABEL_83;
    default:
      nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump();
  }
}

void nlohmann::detail::output_string_adapter<char,std::string>::write_character(uint64_t a1, std::string::value_type a2)
{
}

uint64_t nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_escaped(uint64_t result, uint64_t *a2, int a3)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  char v45 = 0;
  LOBYTE(v3) = *((char *)a2 + 23) < 0;
  uint64_t v4 = *((unsigned __int8 *)a2 + 23);
  if ((v4 & 0x80u) != 0) {
    uint64_t v4 = a2[1];
  }
  if (v4)
  {
    unsigned int v7 = (void *)result;
    unint64_t v8 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    unsigned int v46 = -1431655766;
    uint64_t v12 = result + 90;
    while (1)
    {
      if (v3) {
        unsigned int v13 = (uint64_t *)*a2;
      }
      else {
        unsigned int v13 = a2;
      }
      int v14 = *((unsigned __int8 *)v13 + v8);
      uint64_t result = nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::decode(&v45, &v46, v14);
      if (result == 1)
      {
        int v16 = *((_DWORD *)v7 + 158);
        if ((v16 - 1) >= 2)
        {
          if (!v16)
          {
            unint64_t v43 = 0xAAAAAAAAAAAAAAAALL;
            uint64_t v44 = 0x3AAAAAAAAAAAAAALL;
            *(void *)__str = 0xAAAAAAAA00000000;
            snprintf(__str, 3uLL, "%.2X", v14);
            exception = (nlohmann::detail::exception *)__cxa_allocate_exception(0x20uLL);
            std::to_string(&v37, v8);
            uint64_t v27 = std::string::insert(&v37, 0, "invalid UTF-8 byte at index ");
            long long v28 = *(_OWORD *)&v27->__r_.__value_.__l.__data_;
            v38.__r_.__value_.__r.__words[2] = v27->__r_.__value_.__r.__words[2];
            *(_OWORD *)&v38.__r_.__value_.__l.__data_ = v28;
            v27->__r_.__value_.__l.__size_ = 0;
            v27->__r_.__value_.__r.__words[2] = 0;
            v27->__r_.__value_.__r.__words[0] = 0;
            unint64_t v29 = std::string::append(&v38, ": 0x");
            long long v30 = *(_OWORD *)&v29->__r_.__value_.__l.__data_;
            v39.__r_.__value_.__r.__words[2] = v29->__r_.__value_.__r.__words[2];
            *(_OWORD *)&v39.__r_.__value_.__l.__data_ = v30;
            v29->__r_.__value_.__l.__size_ = 0;
            v29->__r_.__value_.__r.__words[2] = 0;
            v29->__r_.__value_.__r.__words[0] = 0;
            if (v44 >= 0) {
              unint64_t v31 = __str;
            }
            else {
              unint64_t v31 = *(char **)__str;
            }
            if (v44 >= 0) {
              std::string::size_type v32 = HIBYTE(v44);
            }
            else {
              std::string::size_type v32 = v43;
            }
            v33 = std::string::append(&v39, v31, v32);
            long long v34 = *(_OWORD *)&v33->__r_.__value_.__l.__data_;
            std::string::size_type v41 = v33->__r_.__value_.__r.__words[2];
            long long v40 = v34;
            v33->__r_.__value_.__l.__size_ = 0;
            v33->__r_.__value_.__r.__words[2] = 0;
            v33->__r_.__value_.__r.__words[0] = 0;
            nlohmann::detail::type_error::create(316, (uint64_t)&v40, exception);
          }
          nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_escaped();
        }
        uint64_t v17 = v9 != 0;
        if (v16 == 1)
        {
          uint64_t v18 = v12 + v10;
          if (a3)
          {
            *(_DWORD *)uint64_t v18 = 1717990748;
            *(_WORD *)(v18 + 4) = 25702;
            v10 += 6;
          }
          else
          {
            v10 += 3;
            *(_WORD *)uint64_t v18 = -16401;
            *(unsigned char *)(v18 + 2) = -67;
          }
          if ((unint64_t)(v10 - 500) <= 0xC)
          {
            uint64_t result = (*(uint64_t (**)(void, uint64_t, uint64_t))(*(void *)*v7 + 8))(*v7, v12, v10);
            uint64_t v10 = 0;
          }
        }
        uint64_t v9 = 0;
        v8 -= v17;
        char v45 = 0;
        uint64_t v11 = v10;
      }
      else if (result)
      {
        if ((a3 & 1) == 0)
        {
          if (*((char *)a2 + 23) >= 0) {
            uint64_t v19 = a2;
          }
          else {
            uint64_t v19 = (uint64_t *)*a2;
          }
          *(unsigned char *)(v12 + v11++) = *((unsigned char *)v19 + v8);
        }
        ++v9;
      }
      else
      {
        switch(v46)
        {
          case 8u:
            __int16 v15 = 25180;
            goto LABEL_43;
          case 9u:
            __int16 v15 = 29788;
            goto LABEL_43;
          case 0xAu:
            __int16 v15 = 28252;
            goto LABEL_43;
          case 0xBu:
            goto LABEL_29;
          case 0xCu:
            __int16 v15 = 26204;
            goto LABEL_43;
          case 0xDu:
            __int16 v15 = 29276;
            goto LABEL_43;
          default:
            if (v46 == 34)
            {
              __int16 v15 = 8796;
              goto LABEL_43;
            }
            if (v46 == 92)
            {
              __int16 v15 = 23644;
LABEL_43:
              *(_WORD *)(v12 + v11) = v15;
              v11 += 2;
              goto LABEL_44;
            }
LABEL_29:
            if (v46 > 0x7E) {
              int v20 = a3;
            }
            else {
              int v20 = 0;
            }
            if (v46 < 0x20 || v20)
            {
              uint64_t v24 = (char *)(v12 + v11);
              if (HIWORD(v46))
              {
                uint64_t result = snprintf(v24, 0xDuLL, "\\u%04x\\u%04x", (unsigned __int16)((v46 >> 10) - 10304), v46 & 0x3FF | 0xDC00);
                v11 += 12;
              }
              else
              {
                uint64_t result = snprintf(v24, 7uLL, "\\u%04x", v46);
                v11 += 6;
              }
            }
            else
            {
              if (*((char *)a2 + 23) >= 0) {
                v21 = a2;
              }
              else {
                v21 = (uint64_t *)*a2;
              }
              *(unsigned char *)(v12 + v11++) = *((unsigned char *)v21 + v8);
            }
LABEL_44:
            if ((unint64_t)(v11 - 500) > 0xC)
            {
              uint64_t v9 = 0;
              uint64_t v10 = v11;
            }
            else
            {
              uint64_t result = (*(uint64_t (**)(void, uint64_t, uint64_t))(*(void *)*v7 + 8))(*v7, v12, v11);
              uint64_t v11 = 0;
              uint64_t v10 = 0;
              uint64_t v9 = 0;
            }
            break;
        }
      }
      ++v8;
      int v22 = *((char *)a2 + 23);
      unsigned int v3 = v22 >> 31;
      unint64_t v23 = a2[1];
      if (v22 >= 0) {
        unint64_t v23 = *((unsigned __int8 *)a2 + 23);
      }
      if (v8 >= v23)
      {
        if (v45)
        {
          int v25 = *((_DWORD *)v7 + 158);
          switch(v25)
          {
            case 1:
              (*(void (**)(void, uint64_t, uint64_t))(*(void *)*v7 + 8))(*v7, v12, v10);
              return (*(uint64_t (**)(void))(*(void *)*v7 + 8))();
            case 2:
              return (*(uint64_t (**)(void, uint64_t, uint64_t))(*(void *)*v7 + 8))(*v7, v12, v10);
            case 0:
              unint64_t v43 = 0xAAAAAAAAAAAAAAAALL;
              uint64_t v44 = 0x3AAAAAAAAAAAAAALL;
              *(void *)__str = 0xAAAAAAAA00000000;
              unsigned __int8 v35 = (uint64_t *)*a2;
              if (v22 >= 0) {
                unsigned __int8 v35 = a2;
              }
              snprintf(__str, 3uLL, "%.2X", *((unsigned __int8 *)v35 + v23 - 1));
              unint64_t v36 = (nlohmann::detail::exception *)__cxa_allocate_exception(0x20uLL);
              std::operator+<char>();
              nlohmann::detail::type_error::create(316, (uint64_t)&v40, v36);
            default:
              nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_escaped();
          }
        }
        else if (v11)
        {
          return (*(uint64_t (**)(void, uint64_t, uint64_t))(*(void *)*v7 + 8))(*v7, v12, v11);
        }
        return result;
      }
    }
  }
  return result;
}

void sub_1A7C4108C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25,uint64_t a26,void *a27,uint64_t a28,int a29,__int16 a30,char a31,char a32,uint64_t a33,void *__p,uint64_t a35,int a36,__int16 a37,char a38,char a39)
{
  if (a39 < 0)
  {
    operator delete(__p);
    if ((v40 & 1) == 0)
    {
LABEL_6:
      if (*(char *)(v41 - 105) < 0) {
        operator delete(*(void **)(v41 - 128));
      }
      _Unwind_Resume(a1);
    }
  }
  else if (!v40)
  {
    goto LABEL_6;
  }
  __cxa_free_exception(v39);
  goto LABEL_6;
}

uint64_t nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::decode(unsigned char *a1, unsigned int *a2, int a3)
{
  unsigned int v3 = nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::decode(unsigned char &,unsigned int &,unsigned char)::utf8d[a3];
  if (*a1) {
    unsigned int v4 = a3 & 0x3F | (*a2 << 6);
  }
  else {
    unsigned int v4 = (0xFFu >> v3) & a3;
  }
  *a2 = v4;
  unint64_t v5 = 16 * *a1 + v3 + 256;
  if (v5 >= 0x190) {
    __assert_rtn("decode", "serializer.hpp", 892, "index < 400");
  }
  uint64_t v6 = nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::decode(unsigned char &,unsigned int &,unsigned char)::utf8d[v5];
  *a1 = v6;
  return v6;
}

std::string *nlohmann::detail::output_string_adapter<char,std::string>::write_characters(uint64_t a1, const std::string::value_type *a2, std::string::size_type a3)
{
  return std::string::append(*(std::string **)(a1 + 8), a2, a3);
}

void std::__shared_weak_count::__release_shared[abi:ne180100](std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

uint64_t nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::serializer(uint64_t a1, uint64_t a2, unsigned int a3, int a4)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  unsigned int v7 = localeconv();
  *(void *)(a1 + 80) = v7;
  thousands_sep = v7->thousands_sep;
  if (thousands_sep) {
    LOBYTE(thousands_sep) = *thousands_sep;
  }
  *(unsigned char *)(a1 + 88) = (_BYTE)thousands_sep;
  decimal_point = v7->decimal_point;
  if (v7->decimal_point) {
    LOBYTE(decimal_point) = *decimal_point;
  }
  *(_OWORD *)(a1 + 90) = 0u;
  *(unsigned char *)(a1 + 89) = (_BYTE)decimal_point;
  *(_OWORD *)(a1 + 106) = 0u;
  *(_OWORD *)(a1 + 122) = 0u;
  *(_OWORD *)(a1 + 138) = 0u;
  *(_OWORD *)(a1 + 154) = 0u;
  *(_OWORD *)(a1 + 170) = 0u;
  *(_OWORD *)(a1 + 186) = 0u;
  *(_OWORD *)(a1 + 202) = 0u;
  *(_OWORD *)(a1 + 218) = 0u;
  *(_OWORD *)(a1 + 234) = 0u;
  *(_OWORD *)(a1 + 250) = 0u;
  *(_OWORD *)(a1 + 266) = 0u;
  *(_OWORD *)(a1 + 282) = 0u;
  *(_OWORD *)(a1 + 298) = 0u;
  *(_OWORD *)(a1 + 314) = 0u;
  *(_OWORD *)(a1 + 330) = 0u;
  *(_OWORD *)(a1 + 346) = 0u;
  *(_OWORD *)(a1 + 362) = 0u;
  *(_OWORD *)(a1 + 378) = 0u;
  *(_OWORD *)(a1 + 394) = 0u;
  *(_OWORD *)(a1 + 410) = 0u;
  *(_OWORD *)(a1 + 426) = 0u;
  *(_OWORD *)(a1 + 442) = 0u;
  *(_OWORD *)(a1 + 458) = 0u;
  *(_OWORD *)(a1 + 474) = 0u;
  *(_OWORD *)(a1 + 490) = 0u;
  *(_OWORD *)(a1 + 506) = 0u;
  *(_OWORD *)(a1 + 522) = 0u;
  *(_OWORD *)(a1 + 538) = 0u;
  *(_OWORD *)(a1 + 554) = 0u;
  *(_OWORD *)(a1 + 570) = 0u;
  *(_OWORD *)(a1 + 586) = 0u;
  *(unsigned char *)(a1 + 602) = a3;
  uint64_t v10 = (int8x16_t *)operator new(0x208uLL);
  *(void *)(a1 + 608) = v10;
  *(void *)(a1 + 624) = 0x8000000000000208;
  int8x16_t v11 = vdupq_n_s8(a3);
  *(void *)(a1 + 616) = 512;
  *uint64_t v10 = v11;
  v10[1] = v11;
  v10[2] = v11;
  v10[3] = v11;
  v10[4] = v11;
  v10[5] = v11;
  v10[6] = v11;
  v10[7] = v11;
  v10[8] = v11;
  v10[9] = v11;
  v10[10] = v11;
  v10[11] = v11;
  v10[12] = v11;
  v10[13] = v11;
  v10[14] = v11;
  v10[15] = v11;
  v10[16] = v11;
  v10[17] = v11;
  v10[18] = v11;
  v10[19] = v11;
  v10[20] = v11;
  v10[21] = v11;
  v10[22] = v11;
  v10[23] = v11;
  v10[24] = v11;
  v10[25] = v11;
  v10[26] = v11;
  v10[27] = v11;
  v10[28] = v11;
  v10[29] = v11;
  v10[30] = v11;
  v10[31] = v11;
  v10[32].i8[0] = 0;
  *(_DWORD *)(a1 + 632) = a4;
  return a1;
}

void sub_1A7C41390(_Unwind_Exception *exception_object)
{
  unsigned int v3 = *(std::__shared_weak_count **)(v1 + 8);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::~serializer(uint64_t a1)
{
  if (*(char *)(a1 + 631) < 0) {
    operator delete(*(void **)(a1 + 608));
  }
  int v2 = *(std::__shared_weak_count **)(a1 + 8);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  return a1;
}

uint64_t std::__shared_ptr_emplace<nlohmann::detail::output_string_adapter<char,std::string>>::__on_zero_shared(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 24) + 16))();
}

uint64_t *nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::operator[]<char const>(unsigned __int8 *a1, char *__s)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int v4 = *a1;
  if (!*a1)
  {
    *a1 = 1;
    unint64_t v5 = operator new(0x18uLL);
    v5[2] = 0;
    v5[1] = 0;
    *unint64_t v5 = v5 + 1;
    *((void *)a1 + 1) = v5;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)a1);
    int v4 = *a1;
  }
  if (v4 != 1)
  {
    exception = (nlohmann::detail::exception *)__cxa_allocate_exception(0x20uLL);
    uint64_t v10 = (char *)nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::type_name((char *)a1);
    std::string::basic_string[abi:ne180100]<0>(&v13, v10);
    int8x16_t v11 = std::string::insert(&v13, 0, "cannot use operator[] with a string argument with ");
    long long v12 = *(_OWORD *)&v11->__r_.__value_.__l.__data_;
    std::string::size_type v15 = v11->__r_.__value_.__r.__words[2];
    *(_OWORD *)std::string __p = v12;
    v11->__r_.__value_.__l.__size_ = 0;
    v11->__r_.__value_.__r.__words[2] = 0;
    v11->__r_.__value_.__r.__words[0] = 0;
    nlohmann::detail::type_error::create(305, (uint64_t)__p, exception);
  }
  uint64_t v6 = (uint64_t **)*((void *)a1 + 1);
  std::string::basic_string[abi:ne180100]<0>(__p, __s);
  v13.__r_.__value_.__r.__words[0] = (std::string::size_type)__p;
  unsigned int v7 = std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v6, (const void **)__p, (uint64_t)&std::piecewise_construct, &v13);
  if (SHIBYTE(v15) < 0) {
    operator delete(__p[0]);
  }
  return v7 + 7;
}

void sub_1A7C41588(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_integer<long long,0>(uint64_t (****a1)(void), unint64_t a2)
{
  if (a2)
  {
    unint64_t v2 = a2;
    unsigned int v3 = a1 + 2;
    if ((v2 & 0x8000000000000000) != 0)
    {
      unsigned char *v3 = 45;
      unint64_t v2 = -(uint64_t)v2;
      if (v2 >= 0xA)
      {
        int v7 = 4;
        unint64_t v11 = v2;
        while (1)
        {
          if (v11 <= 0x63)
          {
            v7 -= 2;
            goto LABEL_26;
          }
          if (v11 <= 0x3E7) {
            break;
          }
          if (v11 >> 4 < 0x271) {
            goto LABEL_26;
          }
          v7 += 4;
          BOOL v10 = v11 >= 0x186A0;
          v11 /= 0x2710uLL;
          if (!v10)
          {
            v7 -= 3;
            goto LABEL_26;
          }
        }
        --v7;
      }
      else
      {
        int v7 = 1;
      }
LABEL_26:
      unsigned int v8 = v7 + 1;
    }
    else
    {
      if (v2 < 0xA)
      {
        int v4 = (char *)a1 + 17;
        goto LABEL_35;
      }
      unsigned int v8 = 4;
      unint64_t v9 = v2;
      while (1)
      {
        if (v9 <= 0x63)
        {
          v8 -= 2;
          goto LABEL_27;
        }
        if (v9 <= 0x3E7) {
          break;
        }
        if (v9 >> 4 < 0x271) {
          goto LABEL_27;
        }
        v8 += 4;
        BOOL v10 = v9 >= 0x186A0;
        v9 /= 0x2710uLL;
        if (!v10)
        {
          v8 -= 3;
          goto LABEL_27;
        }
      }
      --v8;
    }
LABEL_27:
    if (v8 >= 0x3F) {
      nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_integer<long long,0>();
    }
    int v4 = &v3[v8];
    if (v2 < 0x64)
    {
      unint64_t v12 = v2;
    }
    else
    {
      do
      {
        unint64_t v12 = v2 / 0x64;
        *((_WORD *)v4 - 1) = nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_integer<long long,0>(long long)::digits_to_99[v2 % 0x64];
        v4 -= 2;
        unint64_t v13 = v2 >> 4;
        v2 /= 0x64uLL;
      }
      while (v13 > 0x270);
    }
    if (v12 >= 0xA)
    {
      *((_WORD *)v4 - 1) = nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_integer<long long,0>(long long)::digits_to_99[v12];
LABEL_36:
      int v14 = (**a1)[1];
      return v14();
    }
    LOBYTE(v2) = v12;
LABEL_35:
    *(v4 - 1) = v2 + 48;
    goto LABEL_36;
  }
  unint64_t v5 = ***a1;

  return v5();
}

uint64_t std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::reserve(uint64_t *a1, unint64_t a2)
{
  v7[5] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = a1[2];
  uint64_t result = (uint64_t)(a1 + 2);
  if (a2 > (v4 - *a1) >> 4)
  {
    if (a2 >> 60) {
      std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v5 = a1[1] - *a1;
    v7[4] = result;
    v7[0] = std::__allocate_at_least[abi:ne180100]<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>(result, a2);
    v7[1] = v7[0] + v5;
    v7[2] = v7[0] + v5;
    v7[3] = v7[0] + 16 * v6;
    std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__swap_out_circular_buffer(a1, v7);
    return std::__split_buffer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::~__split_buffer((uint64_t)v7);
  }
  return result;
}

void sub_1A7C418E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__swap_out_circular_buffer(uint64_t *a1, void *a2)
{
  uint64_t result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::reverse_iterator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>,std::reverse_iterator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>,std::reverse_iterator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>>((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::reverse_iterator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>,std::reverse_iterator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>,std::reverse_iterator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  *(void *)&long long v15 = a6;
  *((void *)&v15 + 1) = a7;
  long long v14 = v15;
  v16[0] = a1;
  v16[1] = &v14;
  v16[2] = &v15;
  unint64_t v17 = 0xAAAAAAAAAAAAAA00;
  if (a3 == a5)
  {
    uint64_t v12 = a6;
  }
  else
  {
    uint64_t v9 = a3 - 16;
    do
    {
      *(unsigned char *)(v7 - 16) = *(unsigned char *)v9;
      uint64_t v10 = v7 - 16;
      *(void *)(v10 + 8) = *(void *)(v9 + 8);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v9);
      *(unsigned char *)uint64_t v9 = 0;
      *(void *)(v9 + 8) = 0;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v10);
      uint64_t v7 = *((void *)&v15 + 1) - 16;
      *((void *)&v15 + 1) -= 16;
      BOOL v11 = v9 == a5;
      v9 -= 16;
    }
    while (!v11);
    uint64_t v12 = v15;
  }
  LOBYTE(v17) = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::reverse_iterator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v16);
  return v12;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::reverse_iterator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::reverse_iterator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>>::operator()[abi:ne180100]((uint64_t *)a1);
  }
  return a1;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(16 * a2);
}

uint64_t std::__split_buffer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::~__split_buffer(uint64_t a1)
{
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

uint64_t std::__split_buffer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__destruct_at_end[abi:ne180100](uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 16);
  if (v2 != a2)
  {
    uint64_t v4 = result;
    do
    {
      *(void *)(v4 + 16) = v2 - 16;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v2 - 16);
      uint64_t result = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(v2 - 8, *(unsigned __int8 *)(v2 - 16));
      uint64_t v2 = *(void *)(v4 + 16);
    }
    while (v2 != a2);
  }
  return result;
}

uint64_t nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_integer<unsigned long long,0>(uint64_t (****a1)(void), unint64_t a2)
{
  if (a2)
  {
    unint64_t v2 = a2;
    if (a2 >= 0xA)
    {
      unsigned int v6 = 4;
      unint64_t v7 = a2;
      while (1)
      {
        if (v7 <= 0x63)
        {
          v6 -= 2;
          goto LABEL_15;
        }
        if (v7 <= 0x3E7) {
          break;
        }
        if (v7 >> 4 < 0x271) {
          goto LABEL_15;
        }
        unint64_t v8 = v7 >> 5;
        v7 /= 0x2710uLL;
        v6 += 4;
        if (v8 <= 0xC34)
        {
          v6 -= 3;
          goto LABEL_15;
        }
      }
      --v6;
LABEL_15:
      if (v6 >= 0x3F) {
        nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_integer<long long,0>();
      }
      uint64_t v3 = (uint64_t)a1 + v6 + 16;
      if (a2 < 0x64)
      {
        unint64_t v9 = a2;
      }
      else
      {
        do
        {
          unint64_t v9 = v2 / 0x64;
          *(_WORD *)(v3 - 2) = nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_integer<unsigned long long,0>(unsigned long long)::digits_to_99[v2 % 0x64];
          v3 -= 2;
          unint64_t v10 = v2 >> 4;
          v2 /= 0x64uLL;
        }
        while (v10 > 0x270);
      }
      if (v9 >= 0xA)
      {
        *(_WORD *)(v3 - 2) = nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_integer<unsigned long long,0>(unsigned long long)::digits_to_99[v9];
LABEL_24:
        BOOL v11 = (**a1)[1];
        return v11();
      }
      LOBYTE(v2) = v9;
    }
    else
    {
      uint64_t v3 = (uint64_t)a1 + 17;
    }
    *(unsigned char *)(v3 - 1) = v2 + 48;
    goto LABEL_24;
  }
  uint64_t v4 = ***a1;

  return v4();
}

uint64_t nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<std::map<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::map<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,0>(uint64_t a1, void *a2)
{
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)a1 = 1;
  *(void *)(a1 + 8) = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::create<std::map<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::map<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>(a2);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a1);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a1);
  return a1;
}

void *nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::create<std::map<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::map<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>(void *a1)
{
  uint64_t result = operator new(0x18uLL);
  uint64_t v3 = a1 + 1;
  uint64_t v4 = a1[1];
  *uint64_t result = *a1;
  result[1] = v4;
  uint64_t v5 = result + 1;
  uint64_t v6 = a1[2];
  result[2] = v6;
  if (v6)
  {
    *(void *)(v4 + 16) = v5;
    *a1 = v3;
    void *v3 = 0;
    a1[2] = 0;
  }
  else
  {
    *uint64_t result = v5;
  }
  return result;
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  uint64_t v5 = this;
  if (__sz > 0x16)
  {
    if (__sz >= 0x7FFFFFFFFFFFFFF8) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    std::string::size_type v6 = (__sz & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__sz | 7) != 0x17) {
      std::string::size_type v6 = __sz | 7;
    }
    std::string::size_type v7 = v6 + 1;
    unint64_t v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    uint64_t v5 = v8;
  }
  else
  {
    *((unsigned char *)&this->__r_.__value_.__s + 23) = __sz;
  }

  memmove(v5, __s, __sz + 1);
}

uint64_t nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::operator=(uint64_t a1, uint64_t a2)
{
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a2);
  char v4 = *(unsigned char *)a1;
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)a2 = v4;
  uint64_t v5 = *(void *)(a1 + 8);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a2 + 8) = v5;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a1);
  return a1;
}

uint64_t **nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::~basic_json(uint64_t **a1)
{
  return a1;
}

uint64_t nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<double,double,0>(uint64_t a1, uint64_t *a2)
{
  *(void *)(a1 + 8) = 0;
  uint64_t v3 = *a2;
  *(unsigned char *)a1 = 7;
  *(void *)(a1 + 8) = v3;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a1);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a1);
  return a1;
}

uint64_t nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json(uint64_t a1, uint64_t a2, uint64_t a3, char a4, int a5)
{
  v20[3] = *MEMORY[0x1E4F143B8];
  *(unsigned char *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  if (!a3)
  {
LABEL_7:
    int v13 = 1;
    if (a4) {
      goto LABEL_17;
    }
    goto LABEL_10;
  }
  uint64_t v10 = 32 * a3;
  BOOL v11 = (unsigned char **)(a2 + 16);
  while (1)
  {
    uint64_t v12 = *v11;
    if (**v11 != 2
      || *(void *)(*((void *)v12 + 1) + 8) - **((void **)v12 + 1) != 32
      || *(unsigned char *)nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::operator[]((uint64_t)v12, 0) != 3)
    {
      break;
    }
    v11 += 4;
    v10 -= 32;
    if (!v10) {
      goto LABEL_7;
    }
  }
  int v13 = 0;
  if ((a4 & 1) == 0)
  {
LABEL_10:
    if (a5 == 2) {
      int v14 = 0;
    }
    else {
      int v14 = v13;
    }
    if (a5 != 1) {
      LOBYTE(v13) = 1;
    }
    if ((v13 & 1) == 0)
    {
      exception = (nlohmann::detail::exception *)__cxa_allocate_exception(0x20uLL);
      std::string::basic_string[abi:ne180100]<0>(v20, "cannot create object from initializer list");
      nlohmann::detail::type_error::create(301, (uint64_t)v20, exception);
    }
    int v13 = v14;
  }
LABEL_17:
  uint64_t v15 = a2 + 32 * a3;
  if (v13)
  {
    *(unsigned char *)a1 = 1;
    uint64_t v16 = operator new(0x18uLL);
    v16[2] = 0;
    v16[1] = 0;
    void *v16 = v16 + 1;
    *(void *)(a1 + 8) = v16;
    std::for_each[abi:ne180100]<nlohmann::detail::json_ref<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>> const*,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::(std::initializer_list<nlohmann::detail::json_ref<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>,BOOL,nlohmann::detail::value_t)::{lambda(nlohmann::detail::json_ref<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>> const&)#2}>(a2, v15, a1);
  }
  else
  {
    *(unsigned char *)a1 = 2;
    uint64_t v19 = v15;
    v20[0] = a2;
    *(void *)(a1 + 8) = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::create<std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,nlohmann::detail::json_ref<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>> const*,nlohmann::detail::json_ref<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>> const*>(v20, &v19);
  }
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a1);
  return a1;
}

void sub_1A7C420D8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
}

uint64_t std::for_each[abi:ne180100]<nlohmann::detail::json_ref<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>> const*,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::(std::initializer_list<nlohmann::detail::json_ref<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>,BOOL,nlohmann::detail::value_t)::{lambda(nlohmann::detail::json_ref<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>> const&)#2}>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v8[1] = *(uint64_t **)MEMORY[0x1E4F143B8];
  if (a1 != a2)
  {
    uint64_t v5 = a1;
    do
    {
      unint64_t v7 = 0xAAAAAAAAAAAAAAAALL;
      v8[0] = (uint64_t *)0xAAAAAAAAAAAAAAAALL;
      nlohmann::detail::json_ref<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::moved_or_copied(v5, (uint64_t)&v7);
      std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__emplace_unique_key_args<std::string,std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>(*(uint64_t ***)(a3 + 8), *(const void ***)(*v8[0] + 8), *(void *)(*v8[0] + 8), *v8[0] + 16);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v7);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(v8, v7);
      v5 += 32;
    }
    while (v5 != a2);
  }
  return a3;
}

void sub_1A7C421E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, unsigned __int8 a10)
{
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&a10);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(v10, a10);
  _Unwind_Resume(a1);
}

CoreAnalytics::Client *CoreAnalytics::Client::Client(CoreAnalytics::Client *this)
{
  unint64_t v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  *(void *)this = dispatch_queue_create("com.apple.CoreAnalytics::Client", v2);
  uint64_t v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
  *((void *)this + 1) = dispatch_queue_create("com.apple.CoreAnalytics::Client XPC Send", v3);
  char v4 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
  *((void *)this + 2) = dispatch_queue_create("com.apple.CoreAnalytics::Client XPC Reply", v4);
  uint64_t v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
  *((void *)this + 3) = dispatch_queue_create("com.apple.CoreAnalytics::Client XPC Retry", v5);
  *((void *)this + 4) = dispatch_semaphore_create(1000);
  *((unsigned char *)this + 40) = 0;
  *((void *)this + 6) = xpc_null_create();
  *((void *)this + 8) = 0;
  *((_DWORD *)this + 18) = 0;
  *((void *)this + 21) = 0;
  *((_DWORD *)this + 14) = 0;
  *(_DWORD *)((char *)this + 59) = 0;
  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 6) = 0u;
  *((_OWORD *)this + 7) = 0u;
  *((_OWORD *)this + 8) = 0u;
  return this;
}

uint64_t nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<std::string,std::string,0>(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)a1 = 3;
  char v4 = operator new(0x18uLL);
  *(_OWORD *)char v4 = *(_OWORD *)a2;
  v4[2] = *(void *)(a2 + 16);
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)a2 = 0;
  *(void *)(a1 + 8) = v4;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a1);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a1);
  return a1;
}

void hex(unsigned __int8 *a1@<X0>, uint64_t a2@<X1>, std::string *a3@<X8>)
{
  a3->__r_.__value_.__r.__words[0] = 0;
  a3->__r_.__value_.__l.__size_ = 0;
  a3->__r_.__value_.__r.__words[2] = 0;
  std::string::reserve(a3, 2 * a2);
  if (a2 >= 1)
  {
    std::string::size_type v6 = (char *)&a1[a2];
    do
    {
    }
    while (a1 < (unsigned __int8 *)v6);
  }
}

void sub_1A7C423F4(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> *,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> *,std::back_insert_iterator<std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v5 = a2;
  if (a2 != a3)
  {
    unint64_t v7 = a4[1];
    do
    {
      if (v7 >= a4[2])
      {
        unint64_t v7 = std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__push_back_slow_path<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>(a4, v5);
      }
      else
      {
        *(unsigned char *)unint64_t v7 = *(unsigned char *)v5;
        *(void *)(v7 + 8) = *(void *)(v5 + 8);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v5);
        *(unsigned char *)uint64_t v5 = 0;
        *(void *)(v5 + 8) = 0;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v7);
        v7 += 16;
      }
      a4[1] = v7;
      v5 += 16;
    }
    while (v5 != a3);
    return a3;
  }
  return v5;
}

void *std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::clear[abi:ne180100](void *result)
{
  uint64_t v1 = result;
  uint64_t v3 = *result;
  uint64_t v2 = result[1];
  if (v2 != *result)
  {
    uint64_t v4 = v2 - 16;
    uint64_t v5 = (unsigned __int8 *)(v2 - 16);
    do
    {
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v4);
      unsigned int v6 = *v5;
      v5 -= 16;
      uint64_t result = (void *)nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(v4 + 8, v6);
      BOOL v7 = v4 == v3;
      uint64_t v4 = (uint64_t)v5;
    }
    while (!v7);
  }
  v1[1] = v3;
  return result;
}

void sub_1A7C4267C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::__shared_weak_count *a11)
{
  if (a11) {
    std::__shared_weak_count::__release_weak(a11);
  }
  _Unwind_Resume(exception_object);
}

void CoreAnalytics::Client::registerEventObserver(NSObject **a1, uint64_t a2)
{
  block[5] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  uint64_t v3 = a1;
  *(_OWORD *)uint64_t v4 = *(_OWORD *)a2;
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 0x40000000;
  block[2] = ___ZN10applesauce8dispatch2v19sync_implIZN13CoreAnalytics6Client21registerEventObserverENSt3__18weak_ptrINS3_13EventObserverEEEE3__0EEvP16dispatch_queue_sOT_NS5_17integral_constantIbLb1EEE_block_invoke;
  block[3] = &__block_descriptor_tmp_142;
  block[4] = &v3;
  dispatch_sync(v2, block);
  if (v4[1]) {
    std::__shared_weak_count::__release_weak(v4[1]);
  }
}

void *nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::create<std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,nlohmann::detail::json_ref<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>> const*,nlohmann::detail::json_ref<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>> const*>(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = operator new(0x18uLL);
  uint64_t v5 = *a1;
  uint64_t v6 = *a2;
  unint64_t v7 = (*a2 - *a1) >> 5;
  v4[1] = 0;
  v4[2] = 0;
  void *v4 = 0;
  std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__init_with_size[abi:ne180100]<nlohmann::detail::json_ref<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>> const*,nlohmann::detail::json_ref<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>> const*>(v4, v5, v6, v7);
  return v4;
}

void sub_1A7C42800(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__init_with_size[abi:ne180100]<nlohmann::detail::json_ref<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>> const*,nlohmann::detail::json_ref<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>> const*>(void *result, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__vallocate[abi:ne180100](result, a4);
    uint64_t result = (void *)std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,nlohmann::detail::json_ref<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>> const*,nlohmann::detail::json_ref<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>> const*,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>((uint64_t)(v6 + 2), a2, a3, v6[1]);
    v6[1] = result;
  }
  return result;
}

void sub_1A7C428AC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  *(void *)(v2 + 8) = v3;
  std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  _Unwind_Resume(a1);
}

os_log_t sSetupSharedLogDomains(void)
{
  qword_1EB21C828 = (uint64_t)os_log_create("com.apple.CoreAnalytics.Shared.critical", "evaluator");
  os_log_t result = os_log_create("com.apple.CoreAnalytics.Shared.critical", "utils");
  qword_1EB21C830 = (uint64_t)result;
  return result;
}

os_log_t ___Z10CASPIEnterv_block_invoke()
{
  sSetupFrameworkLogDomains();

  return sSetupSharedLogDomains();
}

os_log_t sSetupFrameworkLogDomains(void)
{
  qword_1EB21C808 = (uint64_t)os_log_create("com.apple.CoreAnalytics.event", "send");
  qword_1EB21C810 = (uint64_t)os_log_create("com.apple.CoreAnalytics.event", "send-diagnostics");
  os_log_t result = os_log_create("com.apple.CoreAnalytics.event", "mgmt-send");
  qword_1EB21C818 = (uint64_t)result;
  return result;
}

void ___ZN13CoreAnalytics6Client3getEv_block_invoke()
{
  block[5] = *MEMORY[0x1E4F143B8];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 0x40000000;
  block[2] = ___ZN10applesauce8dispatch2v19sync_implIZZN13CoreAnalytics6Client3getEvEUb_E3__0EEvP16dispatch_queue_sOT_NSt3__117integral_constantIbLb1EEE_block_invoke;
  block[3] = &__block_descriptor_tmp_137;
  block[4] = &v0;
  dispatch_sync((dispatch_queue_t)CoreAnalytics::Client::get(void)::client[0], block);
}

uint64_t ___ZN13CoreAnalytics6Client22acquireSendTransactionEv_block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  int v2 = *(_DWORD *)(v1 + 72);
  if (!v2)
  {
    os_log_t result = os_transaction_create();
    *(void *)(v1 + 64) = result;
    int v2 = *(_DWORD *)(v1 + 72);
  }
  *(_DWORD *)(v1 + 72) = v2 + 1;
  return result;
}

void __destroy_helper_block_e8_48c27_ZTSN10applesauce3xpc4dictE(uint64_t a1)
{
  *(void *)(a1 + 48) = 0;
}

xpc_object_t __copy_helper_block_e8_40c27_ZTSN10applesauce3xpc4dictE(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a2 + 40);
  *(void *)(a1 + 40) = v3;
  if (v3) {
    return xpc_retain(v3);
  }
  xpc_object_t result = xpc_null_create();
  *(void *)(a1 + 40) = result;
  return result;
}

void __destroy_helper_block_e8_40c27_ZTSN10applesauce3xpc4dictE(uint64_t a1)
{
  *(void *)(a1 + 40) = 0;
}

xpc_object_t __copy_helper_block_e8_48c27_ZTSN10applesauce3xpc4dictE(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a2 + 48);
  *(void *)(a1 + 48) = v3;
  if (v3) {
    return xpc_retain(v3);
  }
  xpc_object_t result = xpc_null_create();
  *(void *)(a1 + 48) = result;
  return result;
}

void ___ZN13CoreAnalytics6Client22releaseSendTransactionEv_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(_DWORD *)(v1 + 72);
  BOOL v3 = __OFSUB__(v2--, 1);
  *(_DWORD *)(v1 + 72) = v2;
  if ((v2 < 0) ^ v3 | (v2 == 0))
  {
    os_release(*(void **)(v1 + 64));
    *(_DWORD *)(v1 + 72) = 0;
    *(void *)(v1 + 64) = 0;
  }
}

void AnalyticsSendEvent(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3321888768;
  v5[2] = __AnalyticsSendEvent_block_invoke;
  v5[3] = &__block_descriptor_40_ea8_32c31_ZTSKZ18AnalyticsSendEventE3__0_e19___NSDictionary_8__0l;
  id v6 = v3;
  id v4 = v3;
  AnalyticsSendEventInternal(a1, v5, 0, 0, 0);
}

void sub_1A7C42CB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void CoreAnalytics::Client::init(CoreAnalytics::Client *this)
{
  v4[5] = *MEMORY[0x1E4F143B8];
  {
    id v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    CoreAnalytics::Client::init(void)::exitQueue = (uint64_t)dispatch_queue_create("com.apple.CoreAnalytics::Client Exit Queue", v3);
  }
  {
    CoreAnalytics::Client::init(void)::signalSource = (uint64_t)dispatch_source_create(MEMORY[0x1E4F14480], 0xFuLL, 0, (dispatch_queue_t)CoreAnalytics::Client::init(void)::exitQueue);
  }
  dispatch_source_set_event_handler((dispatch_source_t)CoreAnalytics::Client::init(void)::signalSource, &__block_literal_global_19);
  dispatch_activate((dispatch_object_t)CoreAnalytics::Client::init(void)::signalSource);
  CoreAnalytics::Client::initConnection(this);
  int v2 = *(NSObject **)this;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 0x40000000;
  v4[2] = ___ZN13CoreAnalytics6Client4initEv_block_invoke_2;
  v4[3] = &__block_descriptor_tmp_21;
  v4[4] = this;
  notify_register_dispatch("com.apple.analyticsd.running", (int *)this + 14, v2, v4);
  CoreAnalytics::Client::updateDaemonState(this);
}

void CoreAnalytics::Client::updateDaemonState(CoreAnalytics::Client *this)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t state64 = 0;
  notify_get_state(*((_DWORD *)this + 14), &state64);
  int v2 = *((unsigned __int8 *)this + 60);
  uint64_t v3 = state64;
  int v4 = state64 != 0;
  *((unsigned char *)this + 60) = v4;
  if (v2 == v4)
  {
      CoreAnalytics::Client::updateDaemonState(v3 != 0, v5);
  }
  {
    *(_DWORD *)long long buf = 67109376;
    int v8 = v2;
    __int16 v9 = 1024;
    BOOL v10 = v3 != 0;
    _os_log_impl(&dword_1A7C3B000, v5, OS_LOG_TYPE_INFO, "Daemon status changed from %d to %d", buf, 0xEu);
  }
  if (!*((unsigned char *)this + 60)) {
    *((unsigned char *)this + 61) = 0;
  }
}

void CoreAnalytics::Client::initConnection(CoreAnalytics::Client *this)
{
  handler[5] = *MEMORY[0x1E4F143B8];
  mach_service = xpc_connection_create_mach_service("com.apple.analyticsd", *((dispatch_queue_t *)this + 2), 0);
  if ((mach_service || (mach_service = xpc_null_create()) != 0)
    && MEMORY[0x1AD0D7420](mach_service) == MEMORY[0x1E4F14578])
  {
    xpc_retain(mach_service);
    xpc_object_t v3 = mach_service;
  }
  else
  {
    xpc_object_t v3 = xpc_null_create();
  }
  xpc_object_t v4 = xpc_null_create();
  uint64_t v5 = (void *)*((void *)this + 6);
  *((void *)this + 6) = v3;
  xpc_release(v5);
  xpc_release(v4);
  xpc_release(mach_service);
  id v6 = (_xpc_connection_s *)*((void *)this + 6);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 0x40000000;
  handler[2] = ___ZN13CoreAnalytics6Client14initConnectionEv_block_invoke;
  handler[3] = &__block_descriptor_tmp_24;
  handler[4] = this;
  xpc_connection_set_event_handler(v6, handler);
  if (xpc_user_sessions_enabled())
  {
    out_token[1] = 0;
    int foreground_uid = xpc_user_sessions_get_foreground_uid();
    xpc_connection_set_target_user_session_uid();
    out_token[0] = 0;
    int v8 = *(NSObject **)this;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 0x40000000;
    v9[2] = ___ZN13CoreAnalytics6Client14initConnectionEv_block_invoke_26;
    v9[3] = &__block_descriptor_tmp_27;
    v9[4] = this;
    int v10 = foreground_uid;
    notify_register_dispatch("com.apple.mobile.usermanagerd.foregrounduser_changed", out_token, v8, v9);
  }
  xpc_connection_activate(*((xpc_connection_t *)this + 6));
}

void sub_1A7C4317C(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

void CoreAnalytics::Client::updateDaemonState(char a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_1A7C3B000, a2, OS_LOG_TYPE_DEBUG, "Daemon status did not change; still %d",
    (uint8_t *)v2,
    8u);
}

void ___ZN13CoreAnalytics6Client26retryXpcMessageHelper_syncEN10applesauce3xpc4dictE18XPCMessagePrioritybhy_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  xpc_object_t v4 = *(NSObject ***)(a1 + 32);
  uint64_t v5 = MEMORY[0x1AD0D7420](a2);
  uint64_t v6 = MEMORY[0x1E4F14520];
  if (v5 == MEMORY[0x1E4F145A8])
  {
    if (a2 == MEMORY[0x1E4F14520])
    {
        ___ZN13CoreAnalytics6Client26retryXpcMessageHelper_syncEN10applesauce3xpc4dictE18XPCMessagePrioritybhy_block_invoke_cold_1();
    }
    else if (a2 == MEMORY[0x1E4F14528])
    {
      string = xpc_dictionary_get_string(MEMORY[0x1E4F14528], (const char *)*MEMORY[0x1E4F14530]);
      {
        *(_DWORD *)block = 136446210;
        *(void *)&block[4] = string;
        _os_log_impl(&dword_1A7C3B000, v15, OS_LOG_TYPE_DEFAULT, "XPC message reply connection invalidated (client likely exiting): %{public}s", block, 0xCu);
      }
    }
  }
  if (a2 != v6 || *(unsigned char *)(a1 + 56) == 0)
  {
    int v8 = *v4;
    *(void *)block = MEMORY[0x1E4F143A8];
    *(void *)&block[8] = 0x40000000;
    *(void *)&block[16] = ___ZN13CoreAnalytics6Client22releaseSendTransactionEv_block_invoke;
    *(void *)&block[24] = &__block_descriptor_tmp_36;
    v33 = v4;
    dispatch_sync(v8, block);
    dispatch_semaphore_signal(v4[4]);
  }
  else
  {
    {
      int v11 = *(unsigned __int8 *)(a1 + 57);
      uint64_t v13 = *(void *)(a1 + 40);
      uint64_t v12 = *(void **)(a1 + 48);
      xpc_object_t object = v12;
      if (v12) {
        xpc_retain(v12);
      }
      else {
        xpc_object_t object = xpc_null_create();
      }
      try_xpc_to_json(&object, &v28);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::dump((uint64_t)&v28, -1, 0x20u, 0, 1, __p);
      if (v31 >= 0) {
        uint64_t v16 = __p;
      }
      else {
        uint64_t v16 = (void **)__p[0];
      }
      *(_DWORD *)block = 67109634;
      *(_DWORD *)&block[4] = v11 + 1;
      *(_WORD *)&block[8] = 2048;
      *(void *)&block[10] = v13;
      *(_WORD *)&block[18] = 2080;
      *(void *)&block[20] = v16;
      _os_log_impl(&dword_1A7C3B000, v9, OS_LOG_TYPE_DEFAULT, "Queueing retry %d with delay (ms) %llu for message: %s", block, 0x1Cu);
      if (v31 < 0) {
        operator delete(__p[0]);
      }
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v28);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v29, v28);
      xpc_release(object);
    }
    int v17 = *(unsigned __int8 *)(a1 + 58);
    dispatch_time_t v18 = dispatch_time(0, 1000000 * *(void *)(a1 + 40));
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 1174405120;
    v22[2] = ___ZN13CoreAnalytics6Client26retryXpcMessageHelper_syncEN10applesauce3xpc4dictE18XPCMessagePrioritybhy_block_invoke_29;
    v22[3] = &__block_descriptor_tmp_32;
    uint64_t v19 = *(void **)(a1 + 48);
    v22[4] = v4;
    xpc_object_t v23 = v19;
    if (v19) {
      xpc_retain(v19);
    }
    else {
      xpc_object_t v23 = xpc_null_create();
    }
    char v25 = *(unsigned char *)(a1 + 58);
    __int16 v26 = *(_WORD *)(a1 + 56);
    uint64_t v24 = *(void *)(a1 + 40);
    if (v17 == 1) {
      dispatch_qos_class_t v20 = QOS_CLASS_UTILITY;
    }
    else {
      dispatch_qos_class_t v20 = QOS_CLASS_BACKGROUND;
    }
    dispatch_block_t v21 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v20, 0, v22);
    dispatch_after(v18, v4[3], v21);
    _Block_release(v21);
    xpc_release(v23);
  }
}

void sub_1A7C435B8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, xpc_object_t a14, uint64_t a15, uint64_t a16, xpc_object_t object, char a18)
{
}

uint64_t AnalyticsIsEventUsed(void *a1)
{
  __p[3] = *(void **)MEMORY[0x1E4F143B8];
  id v1 = a1;
  int v2 = (void *)MEMORY[0x1AD0D6DD0]();
  CASPIEnter();
  memset(__p, 170, 24);
  id v3 = v1;
  xpc_object_t v4 = (CoreAnalytics::Client *)std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v3 UTF8String]);
  uint64_t v5 = CoreAnalytics::Client::get(v4);
  if (SHIBYTE(__p[2]) >= 0) {
    uint64_t v6 = __p;
  }
  else {
    uint64_t v6 = (void **)__p[0];
  }
  if (SHIBYTE(__p[2]) >= 0) {
    size_t v7 = HIBYTE(__p[2]);
  }
  else {
    size_t v7 = (size_t)__p[1];
  }
  uint64_t isEventUsed = CoreAnalytics::Client::isEventUsed((uint64_t)v5, v6, v7);
  if (SHIBYTE(__p[2]) < 0) {
    operator delete(__p[0]);
  }

  return isEventUsed;
}

void sub_1A7C436F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

uint64_t nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_float(char *a1, double a2)
{
  if ((*(void *)&a2 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000)
  {
    uint64_t v5 = *(void *)a1;
    xpc_object_t v4 = *(uint64_t (**)(uint64_t, const char *, uint64_t))(**(void **)a1 + 8);
    uint64_t v6 = "null";
    uint64_t v3 = 4;
  }
  else
  {
    uint64_t v3 = nlohmann::detail::to_chars<double>(a1 + 16, (uint64_t)(a1 + 80), a2) - (a1 + 16);
    xpc_object_t v4 = *(uint64_t (**)(uint64_t, const char *, uint64_t))(**(void **)a1 + 8);
    uint64_t v5 = *(void *)a1;
    uint64_t v6 = a1 + 16;
  }

  return v4(v5, v6, v3);
}

char *nlohmann::detail::to_chars<double>(char *a1, uint64_t a2, double a3)
{
  v6[1] = *(char **)MEMORY[0x1E4F143B8];
  if ((*(void *)&a3 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000) {
    nlohmann::detail::to_chars<double>();
  }
  uint64_t v3 = a1;
  if ((*(void *)&a3 & 0x8000000000000000) != 0)
  {
    a3 = -a3;
    *a1 = 45;
    uint64_t v3 = a1 + 1;
  }
  if (a3 == 0.0)
  {
    *(_WORD *)uint64_t v3 = 11824;
    xpc_object_t result = v3 + 3;
    v3[2] = 48;
  }
  else
  {
    unint64_t v5 = a2 - (void)v3;
    if (a2 - (uint64_t)v3 <= 16) {
      nlohmann::detail::to_chars<double>();
    }
    v6[0] = 0;
    nlohmann::detail::dtoa_impl::grisu2<double>((uint64_t)v3, (unsigned int *)v6 + 1, v6, a3);
    if (SHIDWORD(v6[0]) >= 18) {
      nlohmann::detail::to_chars<double>();
    }
    if (v5 <= 0x15) {
      nlohmann::detail::to_chars<double>();
    }
    if (v5 == 22) {
      nlohmann::detail::to_chars<double>();
    }
    return nlohmann::detail::dtoa_impl::format_buffer((nlohmann::detail::dtoa_impl *)v3, (char *)HIDWORD(v6[0]), (int)v6[0], -4, 15);
  }
  return result;
}

uint64_t nlohmann::detail::dtoa_impl::grisu2<double>(uint64_t a1, unsigned int *a2, _DWORD *a3, double a4)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ((*(void *)&a4 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000) {
    nlohmann::detail::dtoa_impl::grisu2<double>();
  }
  if (a4 <= 0.0) {
    nlohmann::detail::dtoa_impl::grisu2<double>();
  }
  *(void *)&long long v7 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v11 = v7;
  long long v12 = v7;
  long long v10 = v7;
  nlohmann::detail::dtoa_impl::compute_boundaries<double>((uint64_t)&v10, a4);
  return nlohmann::detail::dtoa_impl::grisu2(a1, a2, a3, v11, *((uint64_t *)&v11 + 1), v10, *((uint64_t *)&v10 + 1), v8, v12, *((nlohmann::detail::dtoa_impl **)&v12 + 1));
}

uint64_t nlohmann::detail::dtoa_impl::grisu2(uint64_t a1, unsigned int *a2, _DWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, nlohmann::detail::dtoa_impl *a10)
{
  v32[2] = *MEMORY[0x1E4F143B8];
  v32[0] = a4;
  v32[1] = a5;
  v31[0] = a6;
  v31[1] = a7;
  v30[0] = a9;
  v30[1] = a10;
  if (a10 != a5) {
    nlohmann::detail::dtoa_impl::grisu2();
  }
  if (a10 != a7) {
    nlohmann::detail::dtoa_impl::grisu2();
  }
  uint64_t cached_power_for_binary_exponent = nlohmann::detail::dtoa_impl::get_cached_power_for_binary_exponent(a10);
  int v15 = v14;
  uint64_t v27 = cached_power_for_binary_exponent;
  int v29 = -1431655766;
  int v28 = v16;
  unint64_t v17 = nlohmann::detail::dtoa_impl::diyfp::mul(v31, &v27);
  uint64_t v19 = v18;
  unint64_t v20 = nlohmann::detail::dtoa_impl::diyfp::mul(v32, &v27);
  unsigned int v22 = v21;
  unint64_t v23 = nlohmann::detail::dtoa_impl::diyfp::mul(v30, &v27);
  *a3 = -v15;
  return nlohmann::detail::dtoa_impl::grisu2_digit_gen(a1, a2, a3, v20 + 1, v22 | 0xAAAAAAAA00000000, v17, v19, v25, v23 - 1, v24 | 0xAAAAAAAA00000000);
}

unint64_t nlohmann::detail::dtoa_impl::diyfp::mul(void *a1, void *a2)
{
  uint64_t v2 = HIDWORD(*a1);
  uint64_t v3 = HIDWORD(*a2);
  unint64_t v4 = v3 * (unint64_t)*a1;
  unint64_t v5 = *a2 * (unint64_t)v2;
  return HIDWORD(v5)
       + v3 * (unint64_t)v2
       + HIDWORD(v4)
       + ((((*a2 * (unint64_t)*a1) >> 32)
         + v4
         + v5
         + 0x80000000) >> 32);
}

uint64_t nlohmann::detail::dtoa_impl::get_cached_power_for_binary_exponent(nlohmann::detail::dtoa_impl *this)
{
  if ((int)this <= -1501) {
    nlohmann::detail::dtoa_impl::get_cached_power_for_binary_exponent();
  }
  if ((int)this >= 1501) {
    nlohmann::detail::dtoa_impl::get_cached_power_for_binary_exponent();
  }
  int v1 = 78913 * (-61 - (int)this) / 0x40000;
  if ((int)this < -61) {
    ++v1;
  }
  if (v1 <= -315) {
    nlohmann::detail::dtoa_impl::get_cached_power_for_binary_exponent();
  }
  unsigned int v2 = (int)((v1 + 307 + (((__int16)(v1 + 307) >> 28) & 7)) << 16) >> 19;
  if (v2 >= 0x4F) {
    nlohmann::detail::dtoa_impl::get_cached_power_for_binary_exponent();
  }
  uint64_t v3 = (void *)((char *)&nlohmann::detail::dtoa_impl::get_cached_power_for_binary_exponent(int)::kCachedPowers
                + 16 * (unsigned __int16)v2);
  int v4 = v3[1] + this;
  if (v4 <= -125) {
    nlohmann::detail::dtoa_impl::get_cached_power_for_binary_exponent();
  }
  if (v4 >= -95) {
    nlohmann::detail::dtoa_impl::get_cached_power_for_binary_exponent();
  }
  return *v3;
}

uint64_t nlohmann::detail::dtoa_impl::compute_boundaries<double>@<X0>(uint64_t a1@<X8>, double a2@<D0>)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ((*(void *)&a2 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000) {
    nlohmann::detail::dtoa_impl::compute_boundaries<double>();
  }
  if (a2 <= 0.0) {
    nlohmann::detail::dtoa_impl::compute_boundaries<double>();
  }
  BOOL v3 = (*(void *)&a2 & 0xFFFFFFFFFFFFFLL) == 0;
  if (*(void *)&a2 >> 52) {
    unint64_t v4 = ((*(void *)&a2 >> 52) - 1075) | 0xAAAAAAAA00000000;
  }
  else {
    unint64_t v4 = 0xAAAAAAAAFFFFFBCELL;
  }
  if (*(void *)&a2 >> 52) {
    uint64_t v5 = *(void *)&a2 & 0xFFFFFFFFFFFFFLL | 0x10000000000000;
  }
  else {
    uint64_t v5 = *(void *)&a2 & 0xFFFFFFFFFFFFFLL;
  }
  BOOL v6 = *(void *)&a2 >> 53 != 0;
  BOOL v7 = !v6 || !v3;
  if (v6 && v3) {
    uint64_t v8 = 4 * v5;
  }
  else {
    uint64_t v8 = 2 * v5;
  }
  if (v7) {
    int v9 = v4 - 1;
  }
  else {
    int v9 = v4 - 2;
  }
  uint64_t v18 = v8 - 1;
  int v20 = -1431655766;
  int v19 = v9;
  uint64_t v10 = nlohmann::detail::dtoa_impl::diyfp::normalize((2 * v5) | 1, (v4 - 1) | 0xAAAAAAAA00000000);
  int v12 = v11;
  unint64_t v13 = nlohmann::detail::dtoa_impl::diyfp::normalize_to(&v18, v11);
  int v15 = v14;
  uint64_t result = nlohmann::detail::dtoa_impl::diyfp::normalize(v5, v4);
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v17;
  *(void *)(a1 + 16) = v13;
  *(_DWORD *)(a1 + 24) = v15;
  *(void *)(a1 + 32) = v10;
  *(_DWORD *)(a1 + 40) = v12;
  return result;
}

uint64_t nlohmann::detail::dtoa_impl::diyfp::normalize(uint64_t result, unint64_t a2)
{
  if (!result) {
    __assert_rtn("normalize", "to_chars.hpp", 143, "x.f != 0");
  }
  for (; (result & 0x8000000000000000) == 0; a2 = (a2 - 1) | a2 & 0xFFFFFFFF00000000)
    result *= 2;
  return result;
}

unint64_t nlohmann::detail::dtoa_impl::diyfp::normalize_to(uint64_t *a1, int a2)
{
  int v2 = *((_DWORD *)a1 + 2) - a2;
  if (v2 < 0)
  {
    uint64_t v5 = "delta >= 0";
    int v6 = 162;
    goto LABEL_6;
  }
  uint64_t v3 = *a1;
  unint64_t result = *a1 << v2;
  if (result >> v2 != v3)
  {
    uint64_t v5 = "((x.f << delta) >> delta) == x.f";
    int v6 = 163;
LABEL_6:
    __assert_rtn("normalize_to", "to_chars.hpp", v6, v5);
  }
  return result;
}

uint64_t nlohmann::detail::dtoa_impl::grisu2_digit_gen(uint64_t a1, unsigned int *a2, _DWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unint64_t a9, uint64_t a10)
{
  v47[2] = *MEMORY[0x1E4F143B8];
  v47[0] = a4;
  v47[1] = a5;
  v46[0] = a6;
  v46[1] = a7;
  unint64_t v44 = a9;
  uint64_t v45 = a10;
  if ((int)a10 <= -61) {
    nlohmann::detail::dtoa_impl::grisu2_digit_gen();
  }
  if ((int)a10 >= -31) {
    nlohmann::detail::dtoa_impl::grisu2_digit_gen();
  }
  unint64_t v13 = nlohmann::detail::dtoa_impl::diyfp::sub((uint64_t)&v44, (uint64_t)v47);
  uint64_t v14 = nlohmann::detail::dtoa_impl::diyfp::sub((uint64_t)&v44, (uint64_t)v46);
  int v15 = -(int)v45;
  unint64_t v16 = v44 >> -(char)v45;
  if (!v16) {
    nlohmann::detail::dtoa_impl::grisu2_digit_gen();
  }
  unint64_t v17 = v14;
  unint64_t v18 = 1 << v15;
  uint64_t v19 = (1 << v15) - 1;
  unint64_t v20 = v19 & v44;
  if (v16 <= 0x3B9AC9FF)
  {
    if (v16 <= 0x5F5E0FF)
    {
      if (v16 <= 0x98967F)
      {
        if (v16 <= 0xF423F)
        {
          unsigned int v23 = v16 >> 5;
          unsigned int v24 = v16 >> 4;
          if (v16 <= 9) {
            int v25 = 1;
          }
          else {
            int v25 = 10;
          }
          if (v16 <= 9) {
            int v26 = 1;
          }
          else {
            int v26 = 2;
          }
          if (v16 <= 0x63) {
            int v27 = v26;
          }
          else {
            int v27 = 3;
          }
          if (v16 <= 0x63) {
            int v28 = v25;
          }
          else {
            int v28 = 100;
          }
          if (v16 <= 0x3E7) {
            int v29 = v27;
          }
          else {
            int v29 = 4;
          }
          if (v16 <= 0x3E7) {
            int v30 = v28;
          }
          else {
            int v30 = 1000;
          }
          if (v24 <= 0x270) {
            int v31 = v29;
          }
          else {
            int v31 = 5;
          }
          if (v24 <= 0x270) {
            int v32 = v30;
          }
          else {
            int v32 = 10000;
          }
          if (v23 <= 0xC34) {
            int v22 = v31;
          }
          else {
            int v22 = 6;
          }
          if (v23 > 0xC34) {
            unsigned int v21 = 100000;
          }
          else {
            unsigned int v21 = v32;
          }
        }
        else
        {
          unsigned int v21 = 1000000;
          int v22 = 7;
        }
      }
      else
      {
        unsigned int v21 = 10000000;
        int v22 = 8;
      }
    }
    else
    {
      unsigned int v21 = 100000000;
      int v22 = 9;
    }
  }
  else
  {
    unsigned int v21 = 1000000000;
    int v22 = 10;
  }
  unsigned int v33 = v22 + 1;
  do
  {
    unsigned int v34 = v16 / v21;
    if (v16 / v21 >= 0xA) {
      nlohmann::detail::dtoa_impl::grisu2_digit_gen();
    }
    unint64_t v16 = v16 % v21;
    uint64_t v35 = (int)*a2;
    *a2 = v35 + 1;
    *(unsigned char *)(a1 + v35) = v34 + 48;
    if ((v16 << v15) + v20 <= v13)
    {
      *a3 = *a3 + v33 - 2;
      unint64_t v18 = (unint64_t)v21 << v15;
      int v40 = (char *)*a2;
      uint64_t v41 = a1;
      unint64_t v42 = v13;
      v20 += v16 << v15;
      return nlohmann::detail::dtoa_impl::grisu2_round(v41, v40, v17, v42, v20, v18);
    }
    v21 /= 0xAu;
    --v33;
  }
  while (v33 > 1);
  if (v20 <= v13) {
    nlohmann::detail::dtoa_impl::grisu2_digit_gen();
  }
  int v36 = 0;
  do
  {
    if (v20 >= 0x199999999999999ALL) {
      nlohmann::detail::dtoa_impl::grisu2_digit_gen();
    }
    unint64_t v37 = (10 * v20) >> v15;
    if (v37 >= 0xA) {
      nlohmann::detail::dtoa_impl::grisu2_digit_gen();
    }
    uint64_t v38 = (int)*a2;
    *a2 = v38 + 1;
    *(unsigned char *)(a1 + v38) = v37 + 48;
    uint64_t v39 = 5 * v13;
    unint64_t v20 = (10 * v20) & v19;
    v13 *= 10;
    v17 *= 10;
    --v36;
  }
  while (v20 > 2 * v39);
  *a3 += v36;
  int v40 = (char *)*a2;
  uint64_t v41 = a1;
  unint64_t v42 = v13;
  return nlohmann::detail::dtoa_impl::grisu2_round(v41, v40, v17, v42, v20, v18);
}

uint64_t nlohmann::detail::dtoa_impl::diyfp::sub(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a1 + 8) != *(_DWORD *)(a2 + 8))
  {
    unint64_t v4 = "x.e == y.e";
    int v5 = 66;
LABEL_6:
    __assert_rtn("sub", "to_chars.hpp", v5, v4);
  }
  BOOL v2 = *(void *)a1 >= *(void *)a2;
  uint64_t result = *(void *)a1 - *(void *)a2;
  if (!v2)
  {
    unint64_t v4 = "x.f >= y.f";
    int v5 = 67;
    goto LABEL_6;
  }
  return result;
}

char *nlohmann::detail::dtoa_impl::format_buffer(nlohmann::detail::dtoa_impl *this, char *a2, int a3, int a4, int a5)
{
  if ((a4 & 0x80000000) == 0) {
    nlohmann::detail::dtoa_impl::format_buffer();
  }
  if (a5 <= 0) {
    nlohmann::detail::dtoa_impl::format_buffer();
  }
  int v5 = (int)a2;
  uint64_t v7 = a3 + (uint64_t)(int)a2;
  if ((a3 & 0x80000000) == 0 && (int)v7 <= a5)
  {
    memset((char *)this + (int)a2, 48, a3);
    *((unsigned char *)this + v7) = 46;
    uint64_t result = (char *)this + v7 + 2;
    *((unsigned char *)this + (int)v7 + 1) = 48;
    return result;
  }
  if ((int)v7 < 1 || (int)v7 > a5)
  {
    if ((int)v7 > a4 && (int)v7 <= 0)
    {
      size_t v10 = -(int)v7;
      memmove((char *)this + v10 + 2, this, (int)a2);
      *(_WORD *)this = 11824;
      memset((char *)this + 2, 48, v10);
      return (char *)this + v10 + v5 + 2;
    }
    if (a2 == 1)
    {
      uint64_t v11 = 1;
    }
    else
    {
      memmove((char *)this + 2, (char *)this + 1, (int)a2 - 1);
      *((unsigned char *)this + 1) = 46;
      uint64_t v11 = v5 + 1;
    }
    int v12 = (char *)this + v11;
    char *v12 = 101;
    if ((int)v7 <= -999) {
      nlohmann::detail::dtoa_impl::format_buffer();
    }
    if ((int)v7 >= 1001) {
      nlohmann::detail::dtoa_impl::format_buffer();
    }
    if ((int)v7 >= 1) {
      char v13 = 43;
    }
    else {
      char v13 = 45;
    }
    if ((int)v7 - 1 >= 0) {
      unsigned int v14 = v7 - 1;
    }
    else {
      unsigned int v14 = 1 - v7;
    }
    v12[1] = v13;
    if (v14 > 9)
    {
      if (v14 > 0x63)
      {
        v12[2] = (unsigned __int16)v14 / 0x64u + 48;
        unsigned __int8 v17 = (unsigned __int16)v14 % 0x64u;
        v12[3] = (v17 / 0xAu) | 0x30;
        v12[4] = (v17 % 0xAu) | 0x30;
        uint64_t v16 = 2;
        return &v12[v16 + 3];
      }
      v12[2] = v14 / 0xAu + 48;
      char v15 = (v14 % 0xAu) | 0x30;
    }
    else
    {
      v12[2] = 48;
      char v15 = v14 + 48;
    }
    v12[3] = v15;
    uint64_t v16 = 1;
    return &v12[v16 + 3];
  }
  if ((a3 & 0x80000000) == 0) {
    nlohmann::detail::dtoa_impl::format_buffer();
  }
  int v9 = (char *)this + v7;
  memmove(v9 + 1, v9, (int)a2 - (unint64_t)v7);
  *int v9 = 46;
  return (char *)this + v5 + 1;
}

uint64_t nlohmann::detail::dtoa_impl::grisu2_round(uint64_t this, char *a2, unint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6)
{
  if ((int)a2 <= 0) {
    nlohmann::detail::dtoa_impl::grisu2_round();
  }
  if (a3 > a4) {
    nlohmann::detail::dtoa_impl::grisu2_round();
  }
  if (a4 < a5) {
    nlohmann::detail::dtoa_impl::grisu2_round();
  }
  if (!a6) {
    nlohmann::detail::dtoa_impl::grisu2_round();
  }
  if (a5 < a3 && a4 - a5 >= a6)
  {
    uint64_t v6 = (a2 - 1);
    uint64_t v7 = -(uint64_t)a5;
    unint64_t v8 = a6 + a5;
    do
    {
      if (v8 >= a3 && a3 + v7 <= v8 - a3) {
        break;
      }
      int v9 = *(unsigned __int8 *)(this + v6);
      if (v9 == 48) {
        nlohmann::detail::dtoa_impl::grisu2_round();
      }
      *(unsigned char *)(this + v6) = v9 - 1;
      if (v8 >= a3) {
        break;
      }
      unint64_t v10 = a4 - a6 + v7;
      v7 -= a6;
      v8 += a6;
    }
    while (v10 >= a6);
  }
  return this;
}

void analytics_send_event(char *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __analytics_send_event_block_invoke;
  v5[3] = &unk_1E5D1EB68;
  id v6 = v3;
  id v4 = v3;
  analytics_send_event_internal(a1, v5, 0, 0, 0);
}

void sub_1A7C444D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

uint64_t analytics_send_event_internal(char *a1, void *a2, unsigned int a3, int a4, void *a5)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  __s = a1;
  id v38 = a2;
  id v9 = a5;
  unint64_t v10 = (void *)MEMORY[0x1AD0D6DD0]();
  CASPIEnter();
  if (!a1)
  {
      AnalyticsSendEventInternal();
    goto LABEL_23;
  }
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const*&,char const*,0>((uint64_t)&buf, &__s);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::dump((uint64_t)&buf, -1, 0x20u, 0, 0, &__p);
  if (v37 < 0) {
    operator delete(__p);
  }
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&buf);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)&buf + 1, buf);
  int v12 = CoreAnalytics::Client::get(v11);
  size_t v13 = strlen(__s);
  if ((CoreAnalytics::Client::isEventUsed((uint64_t)v12, __s, v13) & 1) == 0)
  {
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = __s;
      _os_log_impl(&dword_1A7C3B000, v26, OS_LOG_TYPE_INFO, "Dropping \"%s\" as it isn't used in any transform (not in the config or budgeted?)", (uint8_t *)&buf, 0xCu);
    }
LABEL_23:
    uint64_t v27 = 0;
    goto LABEL_30;
  }
  id v35 = (id)0xAAAAAAAAAAAAAAAALL;
  id v14 = v9;
  xpc_object_t v15 = v14;
  if (!v14) {
    xpc_object_t v15 = xpc_null_create();
  }

  id v16 = v15;
  unsigned __int8 v17 = v16;
  id v35 = v16;
  unint64_t v18 = (CoreAnalytics::Client *)MEMORY[0x1E4F14590];
  if (!v16 || (xpc_object_t v19 = v16, (CoreAnalytics::Client *)MEMORY[0x1AD0D7420](v16) != v18))
  {
    xpc_object_t v19 = xpc_null_create();
    id v35 = v19;
  }
  memset(v34, 170, sizeof(v34));
  std::string::basic_string[abi:ne180100]<0>(v34, "kLogPayload");
  unint64_t v20 = (CoreAnalytics::Client *)MEMORY[0x1AD0D7420](v19);
  if (v20 != v18) {
    goto LABEL_24;
  }
  unsigned int v21 = v34;
  if (SHIBYTE(v34[2]) < 0) {
    unsigned int v21 = (void **)v34[0];
  }
  *(void *)&long long buf = &v35;
  *((void *)&buf + 1) = v21;
  unint64_t v20 = (CoreAnalytics::Client *)applesauce::xpc::dict::object_proxy::operator BOOL((uint64_t)&buf);
  if (v20)
  {
    int v22 = v34;
    if (SHIBYTE(v34[2]) < 0) {
      int v22 = (void **)v34[0];
    }
    *(void *)&long long buf = &v35;
    *((void *)&buf + 1) = v22;
    applesauce::xpc::dict::object_proxy::operator applesauce::xpc::object((uint64_t)&buf, &v33);
    int v23 = applesauce::xpc::dyn_cast_or_default();
    xpc_object_t v24 = v33;
    xpc_object_t v33 = 0;

    if (v23) {
      int v25 = 0x10000;
    }
    else {
      int v25 = 0;
    }
  }
  else
  {
LABEL_24:
    int v25 = 0;
  }
  int v28 = CoreAnalytics::Client::get(v20);
  std::string::basic_string[abi:ne180100]<0>(v31, __s);
  *(void *)&long long buf = &unk_1EFE15A98;
  *((void *)&buf + 1) = &__s;
  uint64_t v41 = &v38;
  p_long long buf = &buf;
  uint64_t v27 = CoreAnalytics::Client::sendEventAlways((NSObject **)v28, (uint64_t)v31, (uint64_t)&buf, v25 | (a4 << 8) | a3);
  std::__function::__value_func<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> ()(void)>::~__value_func[abi:ne180100](&buf);
  if (v32 < 0) {
    operator delete(v31[0]);
  }
  if (SHIBYTE(v34[2]) < 0) {
    operator delete(v34[0]);
  }
  id v29 = v35;
  id v35 = 0;

LABEL_30:

  return v27;
}

void sub_1A7C44888(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22,void *a23,uint64_t a24,uint64_t a25,uint64_t a26,void *a27,uint64_t a28,char a29)
{
  if (a22 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void *std::__function::__value_func<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> ()(void)>::~__value_func[abi:ne180100](void *a1)
{
  BOOL v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

BOOL applesauce::xpc::dict::object_proxy::operator BOOL(uint64_t a1)
{
  BOOL v2 = applesauce::xpc::dict::operator*(*(id **)a1);
  id v3 = xpc_dictionary_get_value(v2, *(const char **)(a1 + 8));
  BOOL v4 = v3 != 0;

  return v4;
}

void sub_1A7C44A74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZN10applesauce8dispatch2v19sync_implIZN13CoreAnalytics6Client14sendXpcMessageERKNS_3xpc4dictE18XPCMessagePrioritybbE3__0EENSt3__15decayIDTclfp0_EEE4typeEP16dispatch_queue_sOT_NSB_17integral_constantIbLb0EEE_block_invoke(uint64_t a1)
{
  v6[1] = *(void **)MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)v2;
  xpc_object_t v4 = **(xpc_object_t **)(v2 + 8);
  v6[0] = v4;
  if (v4)
  {
    xpc_retain(v4);
  }
  else
  {
    xpc_object_t v4 = xpc_null_create();
    v6[0] = v4;
  }
  BOOL v5 = CoreAnalytics::Client::sendXpcMessage_sync(v3, v6, *(unsigned __int8 *)(v2 + 16), *(unsigned char *)(v2 + 18), *(unsigned char *)(v2 + 17));
  xpc_release(v4);
  **(unsigned char **)(a1 + 32) = v5;
}

void sub_1A7C44B38(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

BOOL CoreAnalytics::Client::sendXpcMessage_sync(uint64_t a1, void **a2, int a3, char a4, char a5)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = MEMORY[0x1AD0D7420](*(void *)(a1 + 48));
  uint64_t v11 = MEMORY[0x1E4F14578];
  if (v10 == MEMORY[0x1E4F14578])
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 1174405120;
    v16[2] = ___ZN13CoreAnalytics6Client19sendXpcMessage_syncEN10applesauce3xpc4dictE18XPCMessagePrioritybb_block_invoke;
    void v16[3] = &__block_descriptor_tmp_28;
    int v12 = *a2;
    v16[4] = a1;
    xpc_object_t object = v12;
    if (v12) {
      xpc_retain(v12);
    }
    else {
      xpc_object_t object = xpc_null_create();
    }
    char v18 = a4;
    char v19 = a3;
    char v20 = a5;
    if (a3 == 1) {
      dispatch_qos_class_t v13 = QOS_CLASS_UTILITY;
    }
    else {
      dispatch_qos_class_t v13 = QOS_CLASS_BACKGROUND;
    }
    dispatch_block_t v14 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v13, 0, v16);
    dispatch_async(*(dispatch_queue_t *)(a1 + 8), v14);
    _Block_release(v14);
    xpc_release(object);
  }
  return v10 == v11;
}

void sub_1A7C44C94(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

void ___ZN13CoreAnalytics6Client19sendXpcMessage_syncEN10applesauce3xpc4dictE18XPCMessagePrioritybb_block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (xpc_object_t *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 32);
  if (xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 40), "event") && xpc_dictionary_get_value(*v2, "json"))
  {
    if (os_log_type_enabled((os_log_t)qword_1EB21C808, OS_LOG_TYPE_DEBUG))
    {
      unint64_t v8 = v2;
      id v9 = "event";
      applesauce::xpc::dict::object_proxy::operator applesauce::xpc::object((uint64_t)&v8, &v10);
      applesauce::xpc::dyn_cast<std::string>();
      BOOL v5 = v2;
      id v6 = "json";
      applesauce::xpc::dict::object_proxy::operator applesauce::xpc::object((uint64_t)&v5, &object);
      applesauce::xpc::dyn_cast<std::string>();
      CoreAnalytics::Client::sendManagementCommandWithReply();
      xpc_release(object);
      if (SHIBYTE(v12) < 0) {
        operator delete(__p[0]);
      }
      xpc_release(v10);
    }
    if (*(unsigned char *)(a1 + 48) && os_log_type_enabled((os_log_t)qword_1EB21C810, OS_LOG_TYPE_DEBUG))
    {
      unint64_t v8 = v2;
      id v9 = "event";
      applesauce::xpc::dict::object_proxy::operator applesauce::xpc::object((uint64_t)&v8, &v10);
      applesauce::xpc::dyn_cast<std::string>();
      BOOL v5 = v2;
      id v6 = "json";
      applesauce::xpc::dict::object_proxy::operator applesauce::xpc::object((uint64_t)&v5, &object);
      applesauce::xpc::dyn_cast<std::string>();
      CoreAnalytics::Client::sendManagementCommandWithReply();
      xpc_release(object);
      if (SHIBYTE(v12) < 0) {
        operator delete(__p[0]);
      }
      xpc_release(v10);
    }
  }
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(v3 + 32), 0xFFFFFFFFFFFFFFFFLL);
  xpc_object_t v4 = *(NSObject **)v3;
  __p[0] = (void *)MEMORY[0x1E4F143A8];
  __p[1] = (void *)0x40000000;
  int v12 = ___ZN13CoreAnalytics6Client22acquireSendTransactionEv_block_invoke;
  dispatch_qos_class_t v13 = &__block_descriptor_tmp_35;
  uint64_t v14 = v3;
  dispatch_sync(v4, __p);
  CoreAnalytics::Client::retryXpcMessage_sync(v3, v2, *(unsigned char *)(a1 + 49), *(unsigned char *)(a1 + 50));
}

void sub_1A7C44F00(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, xpc_object_t object, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, xpc_object_t a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void CoreAnalytics::Client::retryXpcMessage_sync(uint64_t a1, xpc_object_t *a2, char a3, char a4)
{
  v8[1] = *(void **)MEMORY[0x1E4F143B8];
  xpc_object_t v7 = *a2;
  v8[0] = v7;
  if (v7)
  {
    xpc_retain(v7);
  }
  else
  {
    xpc_object_t v7 = xpc_null_create();
    v8[0] = v7;
  }
  CoreAnalytics::Client::retryXpcMessageHelper_sync(a1, v8, a3, a4, 0, 100);
  xpc_release(v7);
}

void sub_1A7C45054(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

void CoreAnalytics::Client::retryXpcMessageHelper_sync(uint64_t a1, void **a2, char a3, char a4, unsigned int a5, uint64_t a6)
{
  block[8] = *MEMORY[0x1E4F143B8];
  if (a5 < 5)
  {
    xpc_object_t v10 = *(_xpc_connection_s **)(a1 + 48);
    uint64_t v11 = *a2;
    int v12 = *(NSObject **)(a1 + 16);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 1174405120;
    v14[2] = ___ZN13CoreAnalytics6Client26retryXpcMessageHelper_syncEN10applesauce3xpc4dictE18XPCMessagePrioritybhy_block_invoke;
    v14[3] = &__block_descriptor_tmp_33;
    char v16 = a4;
    char v17 = a5;
    v14[4] = a1;
    v14[5] = a6;
    xpc_object_t object = v11;
    if (v11) {
      xpc_retain(v11);
    }
    else {
      xpc_object_t object = xpc_null_create();
    }
    char v18 = a3;
    xpc_connection_send_message_with_reply(v10, v11, v12, v14);
    xpc_release(object);
  }
  else
  {
    {
      dispatch_qos_class_t v13 = *a2;
      xpc_object_t v19 = v13;
      if (v13) {
        xpc_retain(v13);
      }
      else {
        xpc_object_t v19 = xpc_null_create();
      }
      try_xpc_to_json(&v19, &v20);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::dump((uint64_t)&v20, -1, 0x20u, 0, 1, block);
      CoreAnalytics::Client::retryXpcMessageHelper_sync();
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v20);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v21, v20);
      xpc_release(v19);
    }
    unint64_t v8 = *(NSObject **)a1;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 0x40000000;
    block[2] = ___ZN13CoreAnalytics6Client22releaseSendTransactionEv_block_invoke;
    block[3] = &__block_descriptor_tmp_36;
    block[4] = a1;
    dispatch_sync(v8, block);
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
}

void sub_1A7C45268(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

uint64_t CoreAnalytics::Client::sendEventAlways(NSObject **a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  unint64_t v28 = 0xAAAAAAAAAAAAAAAALL;
  id v29 = (uint64_t *)0xAAAAAAAAAAAAAAAALL;
  uint64_t v5 = *(void *)(a3 + 24);
  if (!v5) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  (*(void (**)(unint64_t *__return_ptr))(*(void *)v5 + 48))(&v28);
  if (v28 == 1)
  {
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::dump((uint64_t)&v28, -1, 0x20u, 0, 0, &v30);
    *(_OWORD *)std::string __p = v30;
    uint64_t v27 = v31;
    v25[0] = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
    applesauce::xpc::dict::create(v25);
    xpc_object_t v23 = xpc_string_create("send");
    if (!v23) {
      xpc_object_t v23 = xpc_null_create();
    }
    *(void *)&long long v30 = v25;
    *((void *)&v30 + 1) = "command";
    applesauce::xpc::dict::object_proxy::operator=((uint64_t)&v30, &v23, &object);
    xpc_release(object);
    xpc_object_t object = 0;
    xpc_release(v23);
    xpc_object_t v23 = 0;
    xpc_object_t v21 = xpc_int64_create(a4);
    if (!v21) {
      xpc_object_t v21 = xpc_null_create();
    }
    *(void *)&long long v30 = v25;
    *((void *)&v30 + 1) = "priority";
    applesauce::xpc::dict::object_proxy::operator=((uint64_t)&v30, &v21, &v22);
    xpc_release(v22);
    xpc_object_t v22 = 0;
    xpc_release(v21);
    xpc_object_t v21 = 0;
    if (*(char *)(a2 + 23) >= 0) {
      unint64_t v8 = (const char *)a2;
    }
    else {
      unint64_t v8 = *(const char **)a2;
    }
    xpc_object_t v19 = xpc_string_create(v8);
    if (!v19) {
      xpc_object_t v19 = xpc_null_create();
    }
    *(void *)&long long v30 = v25;
    *((void *)&v30 + 1) = "event";
    applesauce::xpc::dict::object_proxy::operator=((uint64_t)&v30, &v19, &v20);
    xpc_release(v20);
    xpc_object_t v20 = 0;
    xpc_release(v19);
    xpc_object_t v19 = 0;
    v9.__d_.__rep_ = now().__d_.__rep_;
    xpc_object_t v17 = xpc_int64_create(v9.__d_.__rep_);
    if (!v17) {
      xpc_object_t v17 = xpc_null_create();
    }
    *(void *)&long long v30 = v25;
    *((void *)&v30 + 1) = "timestamp";
    applesauce::xpc::dict::object_proxy::operator=((uint64_t)&v30, &v17, &v18);
    xpc_release(v18);
    xpc_object_t v18 = 0;
    xpc_release(v17);
    xpc_object_t v17 = 0;
    if (v27 >= 0) {
      xpc_object_t v10 = __p;
    }
    else {
      xpc_object_t v10 = (void **)__p[0];
    }
    xpc_object_t v15 = xpc_string_create((const char *)v10);
    if (!v15) {
      xpc_object_t v15 = xpc_null_create();
    }
    *(void *)&long long v30 = v25;
    *((void *)&v30 + 1) = "json";
    applesauce::xpc::dict::object_proxy::operator=((uint64_t)&v30, &v15, &v16);
    xpc_release(v16);
    xpc_object_t v16 = 0;
    xpc_release(v15);
    xpc_object_t v15 = 0;
    xpc_object_t v13 = xpc_int64_create(BYTE1(a4));
    if (!v13) {
      xpc_object_t v13 = xpc_null_create();
    }
    *(void *)&long long v30 = v25;
    *((void *)&v30 + 1) = "format";
    applesauce::xpc::dict::object_proxy::operator=((uint64_t)&v30, &v13, &v14);
    xpc_release(v14);
    xpc_object_t v14 = 0;
    xpc_release(v13);
    xpc_object_t v13 = 0;
    uint64_t v11 = CoreAnalytics::Client::sendXpcMessage(a1, (uint64_t)v25, a4, BYTE2(a4) & 1, 1);
    xpc_release(v25[0]);
    if (SHIBYTE(v27) < 0) {
      operator delete(__p[0]);
    }
  }
  else
  {
    uint64_t v11 = 0;
  }
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v28);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v29, v28);
  return v11;
}

void sub_1A7C455E4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,xpc_object_t object,uint64_t a23,uint64_t a24,void *__p,uint64_t a26,int a27,__int16 a28,char a29,char a30)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

uint64_t applesauce::xpc::dict::object_proxy::operator=@<X0>(uint64_t a1@<X0>, id *a2@<X1>, void *a3@<X8>)
{
  id v6 = applesauce::xpc::dict::operator*(*(id **)a1);
  xpc_object_t v7 = *(const char **)(a1 + 8);
  id v8 = *a2;
  xpc_dictionary_set_value(v6, v7, v8);

  *a3 = *a2;
  *a2 = xpc_null_create();

  return MEMORY[0x1F41817F8]();
}

{
  void *v6;
  const char *v7;
  void *v8;
  uint64_t vars8;

  id v6 = applesauce::xpc::dict::operator*(*(id **)a1);
  xpc_object_t v7 = *(const char **)(a1 + 8);
  id v8 = applesauce::xpc::dict::operator*(a2);
  xpc_dictionary_set_value(v6, v7, v8);

  *a3 = *a2;
  *a2 = xpc_null_create();

  return MEMORY[0x1F41817F8]();
}

id applesauce::xpc::dict::operator*(id *a1)
{
  return *a1;
}

uint64_t FrameworkConfiguration::isEventUsed(uint64_t *a1, const void *a2, size_t a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  if (*a1 == -1) {
    uint64_t v3 = 0;
  }
  uint64_t v19 = v3;
  unsigned int v4 = *(_DWORD *)(a1[2] + 8);
  __p[0] = 0;
  __p[1] = 0;
  uint64_t v24 = 0;
  if (!v4) {
    return 0;
  }
  unsigned int v7 = 1;
  while (1)
  {
    unsigned int v8 = (v7 + v4) >> 1;
    std::string::basic_string[abi:ne180100]<0>(&v21, (char *)(v19 + *(unsigned int *)(a1[2] + 4 * (v8 - 1) + 24)));
    if (SHIBYTE(v24) < 0) {
      operator delete(__p[0]);
    }
    *(_OWORD *)std::string __p = v21;
    std::chrono::system_clock::time_point v9 = (void *)v21;
    uint64_t v24 = v22;
    int v10 = SHIBYTE(v22);
    size_t v11 = v22 >= 0 ? HIBYTE(v22) : *((void *)&v21 + 1);
    int v12 = v22 >= 0 ? __p : (void **)v21;
    if (a3 == v11 && !memcmp(a2, v12, a3)) {
      break;
    }
    if (v11 >= a3) {
      size_t v13 = a3;
    }
    else {
      size_t v13 = v11;
    }
    int v14 = memcmp(a2, v12, v13);
    BOOL v15 = a3 < v11;
    if (a3 == v11 || v14 != 0) {
      BOOL v15 = v14 < 0;
    }
    if (v15) {
      unsigned int v4 = v8 - 1;
    }
    else {
      unsigned int v7 = v8 + 1;
    }
    if (v7 > v4)
    {
      uint64_t v17 = 0;
      if ((v10 & 0x80000000) == 0) {
        return v17;
      }
      goto LABEL_31;
    }
  }
  uint64_t v17 = 1;
  if ((v10 & 0x80000000) == 0) {
    return v17;
  }
LABEL_31:
  operator delete(v9);
  return v17;
}

void sub_1A7C459E4(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  __clang_call_terminate(a1);
}

void *std::string::basic_string[abi:ne180100]<0>(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    id v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    id v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

uint64_t CoreAnalytics::Client::sendXpcMessage(NSObject **a1, uint64_t a2, char a3, char a4, char a5)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  size_t v5 = *a1;
  v9[0] = a1;
  v9[1] = a2;
  char v10 = a3;
  char v11 = a5;
  char v12 = a4;
  unsigned __int8 v8 = -86;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 0x40000000;
  block[2] = ___ZN10applesauce8dispatch2v19sync_implIZN13CoreAnalytics6Client14sendXpcMessageERKNS_3xpc4dictE18XPCMessagePrioritybbE3__0EENSt3__15decayIDTclfp0_EEE4typeEP16dispatch_queue_sOT_NSB_17integral_constantIbLb0EEE_block_invoke;
  block[3] = &__block_descriptor_tmp_151;
  block[4] = &v8;
  block[5] = v9;
  dispatch_sync(v5, block);
  return v8;
}

void applesauce::xpc::dict::create(xpc_object_t *a1@<X8>)
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  id v6 = v3;
  if (!v3) {
    xpc_object_t v3 = xpc_null_create();
  }

  id v4 = v3;
  size_t v5 = v4;
  *a1 = v4;
  if (!v4 || MEMORY[0x1AD0D7420](v4) != MEMORY[0x1E4F14590])
  {
    *a1 = xpc_null_create();
  }
}

void std::__function::__func<AnalyticsSendEventInternal(NSString const*,NSDictionary<NSString*,NSObject *> *({block_pointer})(void),XPCMessagePriority,EventPayloadFormat,NSDictionary<NSString*,NSObject *> *)::$_0,std::allocator<AnalyticsSendEventInternal(NSString const*,NSDictionary<NSString*,NSObject *> *({block_pointer})(void),XPCMessagePriority,EventPayloadFormat,NSDictionary<NSString*,NSObject *> *)::$_0>,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> ()(void)>::operator()(uint64_t a1@<X0>, double *a2@<X8>)
{
  xpc_object_t v3 = (*(void (**)(void))(**(void **)(a1 + 16) + 16))();
  id v4 = v3;
  if (v3) {
    makeJsonFromNSObject(v3, a2);
  }
  else {
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)a2, 0, 0, 0, 1);
  }
}

void sub_1A7C45D04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void makeJsonFromNSObject(NSObject *a1@<X0>, double *a2@<X8>)
{
}

id __AnalyticsSendEvent_block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void std::__function::__func<analytics_send_event_internal(char const*,NSObject  {objcproto13OS_xpc_object}* {ns_returns_retained}({block_pointer})(void),XPCMessagePriority,EventPayloadFormat,NSObject  {objcproto13OS_xpc_object}*)::$_0,std::allocator<EventPayloadFormat>,nlohmann::basic_json<std::map,std::vector,std::basic_string<char,std::char_traits<char>,analytics_send_event_internal(char const*,NSObject  {objcproto13OS_xpc_object}* {ns_returns_retained}({block_pointer})(void),XPCMessagePriority,EventPayloadFormat,NSObject  {objcproto13OS_xpc_object}*)::$_0<char>>,BOOL,long long,unsigned long long,double,analytics_send_event_internal(char const*,NSObject  {objcproto13OS_xpc_object}* {ns_returns_retained}({block_pointer})(void),XPCMessagePriority,EventPayloadFormat,NSObject  {objcproto13OS_xpc_object}*)::$_0,std::allocator<EventPayloadFormat>::adl_serializer,std::map<unsigned char,analytics_send_event_internal(char const*,NSObject  {objcproto13OS_xpc_object}* {ns_returns_retained}({block_pointer})(void),XPCMessagePriority,EventPayloadFormat,NSObject  {objcproto13OS_xpc_object}*)::$_0<unsigned char>>> ()(void)>::operator()(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  void v9[5] = *(xpc_object_t *)MEMORY[0x1E4F143B8];
  uint64_t v4 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 16))();
  size_t v5 = (void *)v4;
  if (!v4 || MEMORY[0x1AD0D7420](v4) == MEMORY[0x1E4F145D8])
  {
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)a2, 0, 0, 0, 1);
  }
  else
  {
    id v6 = (uint64_t **)(a1 + 8);
    if (MEMORY[0x1AD0D7420](v5) == MEMORY[0x1E4F14590])
    {
      v9[0] = v5;
      xpc_to_json(a2, v9);
      xpc_object_t v8 = v9[0];
      v9[0] = 0;
    }
    else
    {
        std::__function::__func<analytics_send_event_internal(char const*,NSObject  {objcproto13OS_xpc_object}* {ns_returns_retained}({block_pointer})(void),XPCMessagePriority,EventPayloadFormat,NSObject  {objcproto13OS_xpc_object}*)::$_0,std::allocator<EventPayloadFormat>,nlohmann::basic_json<std::map,std::vector,std::basic_string<char,std::char_traits<char>,analytics_send_event_internal(char const*,NSObject  {objcproto13OS_xpc_object}* {ns_returns_retained}({block_pointer})(void),XPCMessagePriority,EventPayloadFormat,NSObject  {objcproto13OS_xpc_object}*)::$_0<char>>,BOOL,long long,unsigned long long,double,analytics_send_event_internal(char const*,NSObject  {objcproto13OS_xpc_object}* {ns_returns_retained}({block_pointer})(void),XPCMessagePriority,EventPayloadFormat,NSObject  {objcproto13OS_xpc_object}*)::$_0,std::allocator<EventPayloadFormat>::adl_serializer,std::map<unsigned char,analytics_send_event_internal(char const*,NSObject  {objcproto13OS_xpc_object}* {ns_returns_retained}({block_pointer})(void),XPCMessagePriority,EventPayloadFormat,NSObject  {objcproto13OS_xpc_object}*)::$_0<unsigned char>>> ()(void)>::operator()(v6, v7);
      *(unsigned char *)a2 = 0;
      a2[1] = 0;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)a2);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)a2);
    }
  }
}

void sub_1A7C4607C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void **__p, uint64_t a11, uint64_t a12, long long buf, int a14, __int16 a15, __int16 a16, uint64_t a17)
{
  long long v21 = v19;
  uint64_t v24 = (void *)buf;
  *(void *)&long long buf = 0;

  if (a2 == 1)
  {
    uint64_t v25 = __cxa_begin_catch(a1);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
    {
      uint64_t v27 = **v21;
      id v28 = v20;
      id v29 = (char *)MEMORY[0x1AD0D7350]();
      memset(&__p, 170, 24);
      std::string::basic_string[abi:ne180100]<0>(&__p, v29);
      free(v29);
      if (a12 >= 0) {
        p_p = (void **)&__p;
      }
      else {
        p_p = __p;
      }
      uint64_t v31 = (*(uint64_t (**)(void *))(*(void *)v25 + 16))(v25);
      LODWORD(buf) = 136315650;
      *(void *)((char *)&buf + 4) = v27;
      WORD6(buf) = 2080;
      *(void *)((char *)&buf + 14) = p_p;
      a16 = 2082;
      a17 = v31;
      _os_log_fault_impl(&dword_1A7C3B000, v26, OS_LOG_TYPE_FAULT, "Error: event \"%s\" %s dropped because the payload was unable to be converted to json: %{public}s", (uint8_t *)&buf, 0x20u);
      if (SHIBYTE(a12) < 0) {
        operator delete(__p);
      }
    }
    *(unsigned char *)uint64_t v18 = 0;
    *(void *)(v18 + 8) = 0;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v18);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v18);
    __cxa_end_catch();
    JUMPOUT(0x1A7C46010);
  }

  _Unwind_Resume(a1);
}

void applesauce::xpc::dict::object_proxy::operator applesauce::xpc::object(uint64_t a1@<X0>, xpc_object_t *a2@<X8>)
{
  applesauce::xpc::dict::object_proxy::operator*(a1);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  *a2 = v3;
  id v4 = v3;
  if (!v3) {
    *a2 = xpc_null_create();
  }
}

id applesauce::xpc::dict::object_proxy::operator*(uint64_t a1)
{
  uint64_t v2 = applesauce::xpc::dict::operator*(*(id **)a1);
  id v3 = xpc_dictionary_get_value(v2, *(const char **)(a1 + 8));

  return v3;
}

void sub_1A7C462F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void applesauce::xpc::dyn_cast<std::string>()
{
}

void sub_1A7C46370(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

id __analytics_send_event_block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void CoreAnalytics::Client::sendManagementCommandWithReply()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(v1, v2, v3, 4.8151e-34);
  OUTLINED_FUNCTION_5(&dword_1A7C3B000, "%s %s", v4, v5);
  if (*(char *)(v0 + 23) < 0) {
    operator delete(*(void **)v0);
  }
}

void OUTLINED_FUNCTION_5(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_debug_impl(a1, a4, OS_LOG_TYPE_DEBUG, a2, a3, 0x16u);
}

void OUTLINED_FUNCTION_0_0(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void *OUTLINED_FUNCTION_0_1(void *result, uint64_t a2, uint64_t a3, float a4)
{
  if (v4 >= 0) {
    size_t v5 = result;
  }
  else {
    size_t v5 = (void *)*result;
  }
  *(float *)a2 = a4;
  *(void *)(a2 + 4) = a3;
  *(_WORD *)(a2 + 12) = 2080;
  *(void *)(a2 + 14) = v5;
  return result;
}

uint64_t analytics_send_event_lazy(char *a1, void *a2)
{
  return analytics_send_event_internal(a1, a2, 0, 0, 0);
}

void ___ZN10applesauce8dispatch2v19sync_implIZZN13CoreAnalytics6Client3getEvEUb_E3__0EEvP16dispatch_queue_sOT_NSt3__117integral_constantIbLb1EEE_block_invoke()
{
}

uint64_t analytics_send_event_lazy_with_options(char *a1, void *a2, void *a3)
{
  return analytics_send_event_internal(a1, a2, 0, 0, a3);
}

uint64_t AnalyticsSendEventLazyWithOptions(void *a1, void *a2, void *a3)
{
  return AnalyticsSendEventInternal(a1, a2, 0, 0, a3);
}

void *___ZN10applesauce8dispatch2v19sync_implIZN13CoreAnalytics6Client20registerErrorHandlerEONSt3__18functionIFvRKNS5_12basic_stringIcNS5_11char_traitsIcEENS5_9allocatorIcEEEEEEEE3__0EEvP16dispatch_queue_sOT_NS5_17integral_constantIbLb1EEE_block_invoke(void *result)
{
  uint64_t v1 = (void *)result[4];
  if (v1[4]) {
    return std::function<void ()(std::string)>::operator=<std::function<void ()(std::string const&)>,void>((void *)(*v1 + 144), (uint64_t)(v1 + 1));
  }
  return result;
}

void ___ZN13CoreAnalytics6Client14initConnectionEv_block_invoke(int a1, xpc_object_t object)
{
  if (object) {
    xpc_retain(object);
  }
  else {
    xpc_null_create();
  }
  operator new();
}

void sub_1A7C46588(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

uint64_t *_ZZN10applesauce8dispatch2v15asyncIZZN13CoreAnalytics6Client14initConnectionEvEUb0_E3__5EEvP16dispatch_queue_sOT_ENUlPvE_8__invokeESA_(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = a1;
  uint64_t v2 = *(void *)a1;
  uint64_t v3 = *(void **)(a1 + 8);
  if (v3 == (void *)MEMORY[0x1E4F14528])
  {
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1A7C3B000, v4, OS_LOG_TYPE_DEFAULT, "XPC connection invalidated (daemon unloaded/disabled)", buf, 2u);
    }
    *(_WORD *)(v2 + 60) = 0;
    if (*(void *)(v2 + 168))
    {
      string = (char *)xpc_dictionary_get_string(*(xpc_object_t *)(a1 + 8), (const char *)*MEMORY[0x1E4F14530]);
      std::string::basic_string[abi:ne180100]<0>(buf, string);
      uint64_t v6 = *(void *)(v2 + 168);
      if (!v6) {
        std::__throw_bad_function_call[abi:ne180100]();
      }
      goto LABEL_15;
    }
  }
  else
  {
    if (v3 != (void *)MEMORY[0x1E4F14520])
    {
      if (v3)
      {
        *(void *)long long buf = *(void *)(a1 + 8);
        if (MEMORY[0x1AD0D7420](v3) == MEMORY[0x1E4F14590]) {
          xpc_retain(v3);
        }
        else {
          *(void *)long long buf = xpc_null_create();
        }
        CoreAnalytics::Client::handleServerMessage_sync((CoreAnalytics::Client *)v2, (const applesauce::xpc::dict *)buf);
        xpc_release(*(xpc_object_t *)buf);
      }
      return _ZNSt3__110unique_ptrIZZN13CoreAnalytics6Client14initConnectionEvEUb0_E3__5NS_14default_deleteIS3_EEED1B8ne180100Ev(&v10);
    }
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1A7C3B000, v7, OS_LOG_TYPE_DEFAULT, "XPC connection interrupted (daemon probably exited)", buf, 2u);
    }
    *(_WORD *)(v2 + 60) = 0;
    if (*(void *)(v2 + 168))
    {
      xpc_object_t v8 = (char *)xpc_dictionary_get_string(*(xpc_object_t *)(a1 + 8), (const char *)*MEMORY[0x1E4F14530]);
      std::string::basic_string[abi:ne180100]<0>(buf, v8);
      uint64_t v6 = *(void *)(v2 + 168);
      if (!v6) {
        std::__throw_bad_function_call[abi:ne180100]();
      }
LABEL_15:
      (*(void (**)(uint64_t, uint8_t *))(*(void *)v6 + 48))(v6, buf);
      if (v12 < 0) {
        operator delete(*(void **)buf);
      }
    }
  }
  return _ZNSt3__110unique_ptrIZZN13CoreAnalytics6Client14initConnectionEvEUb0_E3__5NS_14default_deleteIS3_EEED1B8ne180100Ev(&v10);
}

void sub_1A7C467EC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, xpc_object_t object, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

uint64_t *_ZNSt3__110unique_ptrIZZN13CoreAnalytics6Client14initConnectionEvEUb0_E3__5NS_14default_deleteIS3_EEED1B8ne180100Ev(uint64_t *a1)
{
  uint64_t v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    xpc_release(*(xpc_object_t *)(v2 + 8));
    *(void *)(v2 + 8) = 0;
    MEMORY[0x1AD0D6A20](v2, 0xA0C40AFF93C70);
  }
  return a1;
}

void CoreAnalytics::Client::handleServerMessage_sync(CoreAnalytics::Client *this, const applesauce::xpc::dict *a2)
{
  v17[3] = *(xpc_object_t *)MEMORY[0x1E4F143B8];
  v13[0] = (uint64_t *)a2;
  v13[1] = (uint64_t *)"notification";
  memset(v14, 170, sizeof(v14));
  applesauce::xpc::dict::object_proxy::operator applesauce::xpc::object((uint64_t)v13, v17);
  __p[0] = 0;
  __p[1] = 0;
  uint64_t v16 = 0;
  applesauce::xpc::dyn_cast_or_default();
  if (SHIBYTE(v16) < 0) {
    operator delete(__p[0]);
  }
  xpc_release(v17[0]);
  if ((HIBYTE(v14[2]) & 0x80) == 0)
  {
    if (HIBYTE(v14[2]) != 12)
    {
      if (HIBYTE(v14[2]) != 20) {
        goto LABEL_31;
      }
      BOOL v4 = v14[0] == (void *)0x72756769666E6F63 && v14[1] == (void *)0x68632D6E6F697461;
      if (!v4 || LODWORD(v14[2]) != 1701277281) {
        goto LABEL_31;
      }
LABEL_34:
      CoreAnalytics::Client::handleConfigurationChange_sync(this, a2);
      goto LABEL_35;
    }
    xpc_object_t v8 = v14;
LABEL_27:
    std::chrono::system_clock::time_point v9 = *v8;
    int v10 = *((_DWORD *)v8 + 2);
    if (v9 == (void *)0x2D6567617373656DLL && v10 == 1953066341)
    {
      CoreAnalytics::Client::handleSinkMessageEmit_sync(this, (xpc_object_t *)a2);
      goto LABEL_35;
    }
    goto LABEL_31;
  }
  if (v14[1] == (void *)12)
  {
    xpc_object_t v8 = (void **)v14[0];
    goto LABEL_27;
  }
  if (v14[1] == (void *)20)
  {
    BOOL v6 = *(void *)v14[0] == 0x72756769666E6F63 && *((void *)v14[0] + 1) == 0x68632D6E6F697461;
    if (v6 && *((_DWORD *)v14[0] + 4) == 1701277281) {
      goto LABEL_34;
    }
  }
LABEL_31:
  {
    applesauce::xpc::object::object(&object, (void **)a2);
    try_xpc_to_json(&object, (uint64_t *)v13);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::dump((uint64_t)v13, -1, 0x20u, 0, 1, __p);
    CoreAnalytics::Client::handleServerMessage_sync();
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::~basic_json(v13);
    xpc_release(object);
  }
LABEL_35:
  if (SHIBYTE(v14[2]) < 0) {
    operator delete(v14[0]);
  }
}

void sub_1A7C46AE0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object, char a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, void *a19, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (a18 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void CoreAnalytics::Client::handleConfigurationChange_sync(CoreAnalytics::Client *this, const applesauce::xpc::dict *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  BOOL v4 = (uint64_t *)((char *)this + 80);
  uint64_t v5 = *((void *)this + 10);
  xpc_object_t v20 = (void *)0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v19 = a2;
  *((void *)&v19 + 1) = "configuration";
  applesauce::xpc::dict::object_proxy::operator applesauce::xpc::object((uint64_t)&v19, &v20);
  if (MEMORY[0x1AD0D7420](v20) == MEMORY[0x1E4F145D8])
  {
      CoreAnalytics::Client::handleConfigurationChange_sync();
  }
  else
  {
    *(void *)&long long v19 = a2;
    *((void *)&v19 + 1) = "configuration-size";
    applesauce::xpc::dict::object_proxy::operator applesauce::xpc::object((uint64_t)&v19, (xpc_object_t *)buf);
    BOOL v6 = (void *)MEMORY[0x1AD0D6840](buf, 0);
    xpc_release(*(xpc_object_t *)buf);
    uint64_t v18 = v6;
    if (v6)
    {
      *(void *)&long long v19 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v19 + 1) = 0xAAAAAAAAAAAAAAAALL;
      std::pair<applesauce::xpc::object,unsigned long>::pair[abi:ne180100]<applesauce::xpc::object&,unsigned long &,0>(object, &v20, &v18);
      FrameworkConfiguration::create(object, &v19);
      xpc_release(object[0]);
      object[0] = 0;
      long long v15 = v19;
      long long v19 = 0uLL;
      std::atomic_exchange[abi:ne180100]<FrameworkConfiguration const>(v4, (uint64_t *)&v15, &v16);
      if (*((void *)&v16 + 1)) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v16 + 1));
      }
      if (*((void *)&v15 + 1)) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v15 + 1));
      }
      if (!*v4)
      {
          CoreAnalytics::Client::handleConfigurationChange_sync();
        goto LABEL_17;
      }
      if (v5)
      {
        if (!v8) {
          goto LABEL_23;
        }
        *(_WORD *)long long buf = 0;
        std::chrono::system_clock::time_point v9 = "Received configuration update from daemon (change)";
      }
      else
      {
        if (!v8) {
          goto LABEL_23;
        }
        *(_WORD *)long long buf = 0;
        std::chrono::system_clock::time_point v9 = "Received configuration update from daemon (initial)";
      }
      _os_log_impl(&dword_1A7C3B000, v7, OS_LOG_TYPE_DEFAULT, v9, buf, 2u);
LABEL_23:
      int v10 = (void *)*((void *)this + 12);
      char v11 = (void *)*((void *)this + 13);
      while (v10 != v11)
      {
        char v12 = (std::__shared_weak_count *)v10[1];
        if (v12)
        {
          uint64_t v13 = std::__shared_weak_count::lock(v12);
          if (v13)
          {
            int v14 = v13;
            if (*v10) {
              (*(void (**)(void, uint64_t))(*(void *)*v10 + 16))(*v10, *v4);
            }
            std::__shared_weak_count::__release_shared[abi:ne180100](v14);
          }
        }
        v10 += 2;
      }
LABEL_17:
      if (*((void *)&v19 + 1)) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v19 + 1));
      }
      goto LABEL_19;
    }
      CoreAnalytics::Client::handleConfigurationChange_sync();
  }
LABEL_19:
  xpc_release(v20);
}

void sub_1A7C46DF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10, uint64_t a11, uint64_t a12, uint64_t a13, xpc_object_t object, uint64_t a15, uint64_t a16, uint64_t a17, std::__shared_weak_count *a18)
{
  if (a10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a10);
  }
  if (a18) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a18);
  }
  xpc_release(*(xpc_object_t *)(v18 - 56));
  _Unwind_Resume(a1);
}

void **std::pair<applesauce::xpc::object,unsigned long>::pair[abi:ne180100]<applesauce::xpc::object&,unsigned long &,0>(void **a1, void **a2, void **a3)
{
  uint64_t v5 = *a2;
  *a1 = *a2;
  if (v5) {
    xpc_retain(v5);
  }
  else {
    *a1 = xpc_null_create();
  }
  a1[1] = *a3;
  return a1;
}

__n128 std::atomic_exchange[abi:ne180100]<FrameworkConfiguration const>@<Q0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, _OWORD *a3@<X8>)
{
  sp_mut = std::__get_sp_mut(a1);
  std::__sp_mut::lock(sp_mut);
  uint64_t v7 = *a1;
  *a1 = *a2;
  *a2 = v7;
  uint64_t v8 = a1[1];
  a1[1] = a2[1];
  a2[1] = v8;
  std::__sp_mut::unlock(sp_mut);
  __n128 result = *(__n128 *)a2;
  *a3 = *(_OWORD *)a2;
  *a2 = 0;
  a2[1] = 0;
  return result;
}

void FrameworkConfiguration::create(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (MEMORY[0x1AD0D7420](*a1) == MEMORY[0x1E4F145E8])
  {
    uint64_t v5 = (char *)operator new(0x38uLL);
    *((void *)v5 + 1) = 0;
    *((void *)v5 + 2) = 0;
    *(void *)uint64_t v5 = &unk_1EFE16038;
    BOOL v6 = v5 + 24;
    MemoryMappedBuffer::fromXpcShmem(a1, (uint64_t *)v5 + 3);
    *((void *)v5 + 6) = 0;
    if (!FrameworkConfiguration::init((FrameworkConfiguration *)(v5 + 24)))
    {
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v5);
      BOOL v6 = 0;
      uint64_t v5 = 0;
    }
    *a2 = v6;
    a2[1] = v5;
  }
  else
  {
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_1A7C3B000, v4, OS_LOG_TYPE_DEFAULT, "[FrameworkConfiguration] #Error: Received configuration update from daemon but was wrong type.", v7, 2u);
    }
    *a2 = 0;
    a2[1] = 0;
  }
}

BOOL FrameworkConfiguration::init(FrameworkConfiguration *this)
{
  uint64_t v1 = *(int **)this;
  if (*(void *)this == -1)
  {
    if (!result) {
      return result;
    }
    FrameworkConfiguration::init(v7);
    return 0;
  }
  *((void *)this + 2) = v1;
  int v2 = *v1;
  if (*v1 != -258926936)
  {
    if (!result) {
      return result;
    }
    FrameworkConfiguration::init(v2, v8);
    return 0;
  }
  if (v1[1] != 1)
  {
    if (!result) {
      return result;
    }
    FrameworkConfiguration::init(v9);
    return 0;
  }
  unint64_t v3 = v1[5];
  unint64_t v4 = *((void *)this + 1);
  if (v4 < v3)
  {
    if (!result) {
      return result;
    }
    FrameworkConfiguration::init(v3, v4, v5);
    return 0;
  }
  *((void *)this + 3) = (char *)v1 + v3 + 1;
  return 1;
}

size_t MemoryMappedBuffer::fromXpcShmem@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  v7[1] = *(void **)MEMORY[0x1E4F143B8];
  size_t result = MEMORY[0x1AD0D7420](*a1);
  if (result != MEMORY[0x1E4F145D8] && (size_t result = MEMORY[0x1AD0D7420](*a1), result == MEMORY[0x1E4F145E8]))
  {
    v7[0] = 0;
    size_t result = xpc_shmem_map((xpc_object_t)*a1, v7);
    uint64_t v5 = (uint64_t)v7[0];
    if (v7[0] != 0 && result != 0)
    {
      uint64_t v6 = a1[1];
    }
    else
    {
      uint64_t v5 = -1;
      uint64_t v6 = 0;
    }
    *a2 = v5;
    a2[1] = v6;
  }
  else
  {
    *a2 = -1;
    a2[1] = 0;
  }
  return result;
}

void sub_1A7C47274(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  __clang_call_terminate(a1);
}

void *std::function<void ()(std::string)>::operator=<std::function<void ()(std::string const&)>,void>(void *a1, uint64_t a2)
{
  void v5[4] = *MEMORY[0x1E4F143B8];
  std::__function::__value_func<void ()(std::string const&)>::__value_func[abi:ne180100]((uint64_t)v4, a2);
  std::__function::__value_func<void ()(std::string)>::__value_func[abi:ne180100]<std::function<void ()(std::string const&)>,std::allocator<std::function<void ()(std::string const&)>>>((uint64_t)v5, (uint64_t)v4);
  std::__function::__value_func<void ()(std::string)>::swap[abi:ne180100](v5, a1);
  std::__function::__value_func<void ()(std::string)>::~__value_func[abi:ne180100](v5);
  std::__function::__value_func<void ()(std::string const&)>::~__value_func[abi:ne180100](v4);
  return a1;
}

void sub_1A7C4730C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__function::__value_func<void ()(std::string const&)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

void *std::__function::__value_func<void ()(std::string)>::~__value_func[abi:ne180100](void *a1)
{
  int v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

void std::__function::__func<std::function<void ()(std::string const&)>,std::allocator<std::function<void ()(std::string const&)>>,void ()(std::string)>::destroy_deallocate(void *a1)
{
  std::__function::__value_func<void ()(std::string const&)>::~__value_func[abi:ne180100](a1 + 1);

  operator delete(a1);
}

uint64_t std::__function::__value_func<void ()(std::string)>::__value_func[abi:ne180100]<std::function<void ()(std::string const&)>,std::allocator<std::function<void ()(std::string const&)>>>(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 24) = 0;
  if (*(void *)(a2 + 24))
  {
    unint64_t v4 = operator new(0x28uLL);
    void *v4 = &unk_1EFE15F60;
    std::__function::__value_func<void ()(std::string const&)>::__value_func[abi:ne180100]((uint64_t)(v4 + 1), a2);
    *(void *)(a1 + 24) = v4;
  }
  return a1;
}

uint64_t std::__function::__value_func<void ()(std::string const&)>::__value_func[abi:ne180100](uint64_t a1, uint64_t a2)
{
  unint64_t v3 = (void *)(a2 + 24);
  uint64_t v4 = *(void *)(a2 + 24);
  if (v4)
  {
    if (v4 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(*(void *)*v3 + 24))(*v3, a1);
      return a1;
    }
    *(void *)(a1 + 24) = v4;
  }
  else
  {
    unint64_t v3 = (void *)(a1 + 24);
  }
  void *v3 = 0;
  return a1;
}

{
  uint64_t v3;

  unint64_t v3 = *(void *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(**(void **)(a2 + 24) + 24))(*(void *)(a2 + 24), a1);
    }
    else
    {
      *(void *)(a1 + 24) = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 16))(v3);
    }
  }
  else
  {
    *(void *)(a1 + 24) = 0;
  }
  return a1;
}

void *std::__function::__value_func<void ()(std::string)>::swap[abi:ne180100](void *result, void *a2)
{
  v6[3] = *MEMORY[0x1E4F143B8];
  if (a2 != result)
  {
    unint64_t v3 = result;
    uint64_t v4 = (void *)result[3];
    uint64_t v5 = (void *)a2[3];
    if (v4 == result)
    {
      if (v5 == a2)
      {
        memset(v6, 170, 24);
        (*(void (**)(void *, void *))(*result + 24))(result, v6);
        (*(void (**)(void))(*(void *)v3[3] + 32))(v3[3]);
        v3[3] = 0;
        (*(void (**)(void, void *))(*(void *)a2[3] + 24))(a2[3], v3);
        (*(void (**)(void))(*(void *)a2[3] + 32))(a2[3]);
        a2[3] = 0;
        v3[3] = v3;
        (*(void (**)(void *, void *))(v6[0] + 24))(v6, a2);
        size_t result = (void *)(*(uint64_t (**)(void *))(v6[0] + 32))(v6);
      }
      else
      {
        (*(void (**)(void *, void *))(*result + 24))(result, a2);
        size_t result = (void *)(*(uint64_t (**)(void))(*(void *)v3[3] + 32))(v3[3]);
        v3[3] = a2[3];
      }
      a2[3] = a2;
    }
    else if (v5 == a2)
    {
      (*(void (**)(void *, void *))(*a2 + 24))(a2, result);
      size_t result = (void *)(*(uint64_t (**)(void))(*(void *)a2[3] + 32))(a2[3]);
      a2[3] = v3[3];
      v3[3] = v3;
    }
    else
    {
      result[3] = v5;
      a2[3] = v4;
    }
  }
  return result;
}

void sub_1A7C47784(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  __clang_call_terminate(a1);
}

void sub_1A7C47B24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,uint64_t a23,void *a24,void *a25,uint64_t a26)
{
  __cxa_free_exception(v28);

  _Unwind_Resume(a1);
}

applesauce::xpc::object *applesauce::xpc::object::object(applesauce::xpc::object *this, id *a2)
{
  id v3 = *a2;
  *(void *)this = v3;
  if (!v3)
  {
    xpc_object_t v4 = xpc_null_create();
    uint64_t v5 = *(void **)this;
    *(void *)this = v4;
  }
  return this;
}

{
  id v3;
  xpc_object_t v4;
  void *v5;

  applesauce::xpc::dict::operator*(a2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  *(void *)this = v3;
  if (!v3)
  {
    xpc_object_t v4 = xpc_null_create();
    uint64_t v5 = *(void **)this;
    *(void *)this = v4;
  }
  return this;
}

void *std::__function::__value_func<void ()(std::string const&)>::~__value_func[abi:ne180100](void *a1)
{
  int v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

void CoreAnalytics::Client::sendManagementCommandWithReply(NSObject **a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, xpc_object_t *a4@<X8>)
{
  v30[3] = *(xpc_connection_t *)MEMORY[0x1E4F143B8];
  uint64_t v8 = MEMORY[0x1AD0D7420](*a3);
  uint64_t v9 = MEMORY[0x1E4F14590];
  if (v8 != MEMORY[0x1E4F14590])
  {
    applesauce::xpc::dict::create(&object);
    xpc_object_t v10 = object;
    xpc_object_t object = xpc_null_create();
    char v11 = (void *)*a3;
    *a3 = v10;
    xpc_release(v11);
    xpc_release(object);
  }
  if (os_log_type_enabled((os_log_t)qword_1EB21C818, OS_LOG_TYPE_DEBUG))
  {
    char v12 = (void *)*a3;
    xpc_object_t v21 = v12;
    if (v12) {
      xpc_retain(v12);
    }
    else {
      xpc_object_t v21 = xpc_null_create();
    }
    try_xpc_to_json(&v21, (uint64_t *)&v22);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::dump((uint64_t)&v22, -1, 0x20u, 0, 1, &object);
    CoreAnalytics::Client::sendManagementCommandWithReply();
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v22);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v23, v22);
    xpc_release(v21);
  }
  if (*(char *)(a2 + 23) >= 0) {
    uint64_t v13 = (const char *)a2;
  }
  else {
    uint64_t v13 = *(const char **)a2;
  }
  xpc_object_t v19 = xpc_string_create(v13);
  if (!v19) {
    xpc_object_t v19 = xpc_null_create();
  }
  xpc_object_t object = a3;
  uint64_t v25 = "command";
  applesauce::xpc::dict::object_proxy::operator=((uint64_t)&object, &v19, &v20);
  xpc_release(v20);
  xpc_object_t v20 = 0;
  xpc_release(v19);
  xpc_object_t v19 = 0;
  xpc_object_t v17 = xpc_int64_create(1);
  if (!v17) {
    xpc_object_t v17 = xpc_null_create();
  }
  xpc_object_t object = a3;
  uint64_t v25 = "priority";
  applesauce::xpc::dict::object_proxy::operator=((uint64_t)&object, &v17, &v18);
  xpc_release(v18);
  xpc_object_t v18 = 0;
  xpc_release(v17);
  xpc_object_t v17 = 0;
  int v14 = *a1;
  uint64_t v22 = a1;
  v30[0] = (xpc_connection_t)0xAAAAAAAAAAAAAAAALL;
  v30[0] = (xpc_connection_t)xpc_null_create();
  xpc_object_t object = (xpc_object_t)MEMORY[0x1E4F143A8];
  uint64_t v25 = (const char *)0x40000000;
  int v26 = ___ZN10applesauce8dispatch2v19sync_implIZNK13CoreAnalytics6Client30sendManagementCommandWithReplyENSt3__112basic_stringIcNS5_11char_traitsIcEENS5_9allocatorIcEEEENS_3xpc4dictEE3__0EENS5_5decayIDTclfp0_EEE4typeEP16dispatch_queue_sOT_NS5_17integral_constantIbLb0EEE_block_invoke;
  uint64_t v27 = &__block_descriptor_tmp_140;
  id v28 = v30;
  id v29 = (uint64_t *)&v22;
  dispatch_sync(v14, &object);
  if (MEMORY[0x1AD0D7420](v30[0]) == MEMORY[0x1E4F14578])
  {
    xpc_object_t v15 = xpc_connection_send_message_with_reply_sync(v30[0], (xpc_object_t)*a3);
    xpc_object_t v16 = v15;
    if (v15)
    {
      *a4 = v15;
    }
    else
    {
      xpc_object_t v16 = xpc_null_create();
      *a4 = v16;
      if (!v16) {
        goto LABEL_21;
      }
    }
    if (MEMORY[0x1AD0D7420](v16) == v9)
    {
      xpc_retain(v16);
      goto LABEL_23;
    }
LABEL_21:
    *a4 = xpc_null_create();
LABEL_23:
    xpc_release(v16);
    goto LABEL_24;
  }
  *a4 = xpc_null_create();
LABEL_24:
  xpc_release(v30[0]);
}

void sub_1A7C48008(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, xpc_object_t object, char a15)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

void *CoreAnalytics::Client::registerErrorHandler(NSObject **a1, uint64_t a2)
{
  void v6[4] = *MEMORY[0x1E4F143B8];
  int v2 = *a1;
  uint64_t v5 = a1;
  std::__function::__value_func<void ()(std::string const&)>::__value_func[abi:ne180100]((uint64_t)v6, a2);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 0x40000000;
  block[2] = ___ZN10applesauce8dispatch2v19sync_implIZN13CoreAnalytics6Client20registerErrorHandlerEONSt3__18functionIFvRKNS5_12basic_stringIcNS5_11char_traitsIcEENS5_9allocatorIcEEEEEEEE3__0EEvP16dispatch_queue_sOT_NS5_17integral_constantIbLb1EEE_block_invoke;
  block[3] = &__block_descriptor_tmp_143;
  block[4] = &v5;
  dispatch_sync(v2, block);
  return std::__function::__value_func<void ()(std::string const&)>::~__value_func[abi:ne180100](v6);
}

applesauce::xpc::object *applesauce::xpc::object::object(applesauce::xpc::object *this, const char *string)
{
  xpc_object_t v3 = xpc_string_create(string);
  *(void *)this = v3;
  if (!v3)
  {
    xpc_object_t v4 = xpc_null_create();
    uint64_t v5 = *(void **)this;
    *(void *)this = v4;
  }
  return this;
}

void applesauce::xpc::array::create(xpc_object_t *a1@<X8>)
{
  xpc_object_t v3 = xpc_array_create(0, 0);
  id v6 = v3;
  if (!v3) {
    xpc_object_t v3 = xpc_null_create();
  }

  id v4 = v3;
  uint64_t v5 = v4;
  *a1 = v4;
  if (!v4 || MEMORY[0x1AD0D7420](v4) != MEMORY[0x1E4F14568])
  {
    *a1 = xpc_null_create();
  }
}

void ___ZN10applesauce8dispatch2v19sync_implIZNK13CoreAnalytics6Client30sendManagementCommandWithReplyENSt3__112basic_stringIcNS5_11char_traitsIcEENS5_9allocatorIcEEEENS_3xpc4dictEE3__0EENS5_5decayIDTclfp0_EEE4typeEP16dispatch_queue_sOT_NS5_17integral_constantIbLb0EEE_block_invoke(uint64_t a1)
{
  uint64_t v2 = **(void **)(a1 + 40);
  xpc_object_t v3 = *(xpc_object_t *)(v2 + 48);
  if (v3) {
    xpc_retain(*(xpc_object_t *)(v2 + 48));
  }
  else {
    xpc_object_t v3 = xpc_null_create();
  }
  id v4 = *(void ***)(a1 + 32);
  xpc_object_t v5 = xpc_null_create();
  id v6 = *v4;
  void *v4 = v3;
  xpc_release(v6);
  xpc_release(v5);
}

uint64_t nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::get<std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,0>@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  return nlohmann::detail::from_json<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,0>(a1, (uint64_t)a2);
}

void sub_1A7C48444(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
}

uint64_t std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__assign_with_size[abi:ne180100]<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = a1 + 16;
  uint64_t v9 = *(void *)a1;
  if (a4 > (uint64_t)(*(void *)(a1 + 16) - *(void *)a1) >> 4)
  {
    std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__vdeallocate((void **)a1);
    if (a4 >> 60) {
      std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v10 = *(void *)(a1 + 16) - *(void *)a1;
    uint64_t v11 = v10 >> 3;
    if (v10 >> 3 <= a4) {
      uint64_t v11 = a4;
    }
    if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v12 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v11;
    }
    std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__vallocate[abi:ne180100]((void *)a1, v12);
    uint64_t result = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>(v8, a2, a3, *(void *)(a1 + 8));
    goto LABEL_11;
  }
  unint64_t v14 = (*(void *)(a1 + 8) - v9) >> 4;
  if (v14 < a4)
  {
    uint64_t v15 = a2 + 16 * v14;
    std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> *,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> *,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> *>((uint64_t)&v17, a2, v15, v9);
    uint64_t result = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>(v8, v15, a3, *(void *)(a1 + 8));
LABEL_11:
    *(void *)(a1 + 8) = result;
    return result;
  }
  std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> *,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> *,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> *>((uint64_t)&v18, a2, a3, v9);
  return std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__base_destruct_at_end[abi:ne180100](a1, v16);
}

void sub_1A7C485B8(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void sub_1A7C485C0(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> *,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> *,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> *>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = a2;
  v11[1] = *(uint64_t **)MEMORY[0x1E4F143B8];
  if (a2 == a3) {
    return a2;
  }
  uint64_t v6 = a3;
  do
  {
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v10, v5);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v10);
    unsigned __int8 v7 = *(unsigned char *)a4;
    *(unsigned char *)a4 = v10[0];
    v10[0] = v7;
    uint64_t v8 = *(uint64_t **)(a4 + 8);
    *(uint64_t **)(a4 + 8) = v11[0];
    v11[0] = v8;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a4);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v10);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(v11, v10[0]);
    v5 += 16;
    a4 += 16;
  }
  while (v5 != v6);
  return v6;
}

uint64_t nlohmann::detail::from_json<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,0>(uint64_t result, uint64_t a2)
{
  uint64_t v2 = (char *)result;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)result != 2)
  {
    exception = (nlohmann::detail::exception *)__cxa_allocate_exception(0x20uLL);
    uint64_t v9 = (char *)nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::type_name(v2);
    std::string::basic_string[abi:ne180100]<0>(&v12, v9);
    uint64_t v10 = std::string::insert(&v12, 0, "type must be array, but is ");
    long long v11 = *(_OWORD *)&v10->__r_.__value_.__l.__data_;
    std::string::size_type v14 = v10->__r_.__value_.__r.__words[2];
    long long v13 = v11;
    v10->__r_.__value_.__l.__size_ = 0;
    v10->__r_.__value_.__r.__words[2] = 0;
    v10->__r_.__value_.__r.__words[0] = 0;
    nlohmann::detail::type_error::create(302, (uint64_t)&v13, exception);
  }
  xpc_object_t v3 = *(uint64_t **)(result + 8);
  if (v3 != (uint64_t *)a2)
  {
    uint64_t v4 = v3[1];
    unint64_t v5 = (v4 - *v3) >> 4;
    uint64_t v7 = *v3;
    return std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__assign_with_size[abi:ne180100]<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>(a2, v7, v4, v5);
  }
  return result;
}

void sub_1A7C487FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a15 < 0)
  {
    operator delete(a10);
    if ((v22 & 1) == 0) {
LABEL_8:
    }
      _Unwind_Resume(a1);
  }
  else if (!v22)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v21);
  goto LABEL_8;
}

void ___ZN10applesauce8dispatch2v19sync_implIZN13CoreAnalytics6Client21registerEventObserverENSt3__18weak_ptrINS3_13EventObserverEEEE3__0EEvP16dispatch_queue_sOT_NS5_17integral_constantIbLb1EEE_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(CoreAnalytics::Client ***)(a1 + 32);
  uint64_t v2 = *v1;
  std::vector<std::weak_ptr<CoreAnalytics::EventObserver>>::emplace_back<std::weak_ptr<CoreAnalytics::EventObserver>>((uint64_t *)*v1 + 15, (uint64_t)(v1 + 1));

  CoreAnalytics::Client::sendCheckinMessage_sync(v2);
}

_OWORD *std::vector<std::weak_ptr<CoreAnalytics::EventObserver>>::emplace_back<std::weak_ptr<CoreAnalytics::EventObserver>>(uint64_t *a1, uint64_t a2)
{
  v17[5] = *(void **)MEMORY[0x1E4F143B8];
  unint64_t v6 = a1[2];
  uint64_t v4 = a1 + 2;
  unint64_t v5 = v6;
  uint64_t v7 = (_OWORD *)*(v4 - 1);
  if ((unint64_t)v7 >= v6)
  {
    uint64_t v9 = ((uint64_t)v7 - *a1) >> 4;
    if ((unint64_t)(v9 + 1) >> 60) {
      std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v10 = v5 - *a1;
    uint64_t v11 = v10 >> 3;
    if (v10 >> 3 <= (unint64_t)(v9 + 1)) {
      uint64_t v11 = v9 + 1;
    }
    if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v12 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v11;
    }
    xpc_object_t v17[4] = v4;
    long long v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>((uint64_t)v4, v12);
    std::string::size_type v14 = &v13[16 * v9];
    v17[0] = v13;
    v17[1] = v14;
    v17[3] = &v13[16 * v15];
    *(_OWORD *)std::string::size_type v14 = *(_OWORD *)a2;
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
    v17[2] = v14 + 16;
    std::vector<std::weak_ptr<CoreAnalytics::EventObserver>>::__swap_out_circular_buffer(a1, v17);
    uint64_t v8 = (_OWORD *)a1[1];
    std::__split_buffer<std::weak_ptr<CoreAnalytics::ConfigurationObserver>>::~__split_buffer(v17);
  }
  else
  {
    _OWORD *v7 = *(_OWORD *)a2;
    uint64_t v8 = v7 + 1;
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
    a1[1] = (uint64_t)v8;
  }
  a1[1] = (uint64_t)v8;
  return v8 - 1;
}

void sub_1A7C489A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
}

void CoreAnalytics::Client::sendCheckinMessage_sync(CoreAnalytics::Client *this)
{
  v14[1] = *(xpc_object_t *)MEMORY[0x1E4F143B8];
  if (MEMORY[0x1AD0D7420](*((void *)this + 6)) == MEMORY[0x1E4F14578] && !*((unsigned char *)this + 61))
  {
    *((unsigned char *)this + 61) = 1;
      CoreAnalytics::Client::sendCheckinMessage_sync((uint64_t)this, v2);
    v14[0] = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
    applesauce::xpc::dict::create(v14);
    id v12 = xpc_string_create("checkin");
    if (!v12) {
      id v12 = xpc_null_create();
    }
    uint64_t v10 = v14;
    uint64_t v11 = "command";
    applesauce::xpc::dict::object_proxy::operator=((uint64_t)&v10, &v12, &v13);
    xpc_release(v13);
    xpc_object_t v13 = 0;
    xpc_release(v12);
    id v12 = 0;
    xpc_object_t v3 = getprogname();
    xpc_object_t v8 = xpc_string_create(v3);
    if (!v8) {
      xpc_object_t v8 = xpc_null_create();
    }
    uint64_t v10 = v14;
    uint64_t v11 = "process";
    applesauce::xpc::dict::object_proxy::operator=((uint64_t)&v10, &v8, &object);
    xpc_release(object);
    xpc_object_t object = 0;
    xpc_release(v8);
    xpc_object_t v8 = 0;
    xpc_object_t v6 = xpc_int64_create(0);
    if (!v6) {
      xpc_object_t v6 = xpc_null_create();
    }
    uint64_t v10 = v14;
    uint64_t v11 = "priority";
    applesauce::xpc::dict::object_proxy::operator=((uint64_t)&v10, &v6, &v7);
    xpc_release(v7);
    xpc_object_t v7 = 0;
    xpc_release(v6);
    xpc_object_t v4 = v14[0];
    xpc_object_t v5 = v14[0];
    xpc_object_t v6 = 0;
    if (v14[0])
    {
      xpc_retain(v14[0]);
    }
    else
    {
      xpc_object_t v4 = xpc_null_create();
      xpc_object_t v5 = v4;
    }
    CoreAnalytics::Client::sendXpcMessage_sync((uint64_t)this, &v5, 0, 0, 1);
    xpc_release(v4);
    xpc_object_t v5 = 0;
    xpc_release(v14[0]);
  }
}

void sub_1A7C48BB4(_Unwind_Exception *exception_object, int a2)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

void analytics_tool_log_dump(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  CASPIEnter();
  xpc_object_t v21 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  applesauce::xpc::dict::create(&v21);
  if (*(unsigned char *)(a1 + 24))
  {
    applesauce::xpc::object::object(&v19, a1);
    int v22 = &v21;
    xpc_object_t v23 = "aggPeriod";
    applesauce::xpc::dict::object_proxy::operator=((uint64_t)&v22, &v19, &v20);
    id v5 = v20;
    id v20 = 0;

    xpc_object_t v6 = v19;
    uint64_t v19 = 0;
  }
  xpc_object_t v18 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  xpc_object_t v7 = CoreAnalytics::Client::get(v4);
  std::string::basic_string[abi:ne180100]<0>(__p, "log-dump");
  applesauce::xpc::object::object((applesauce::xpc::object *)&v15, &v21);
  CoreAnalytics::Client::sendManagementCommandWithReply((NSObject **)v7, (uint64_t)__p, &v15, &v18);
  id v8 = v15;
  id v15 = 0;

  if (v17 < 0) {
    operator delete(__p[0]);
  }
  if (MEMORY[0x1AD0D7420](v18) == MEMORY[0x1E4F14590])
  {
    int v22 = &v18;
    xpc_object_t v23 = "error";
    if (applesauce::xpc::dict::object_proxy::operator BOOL((uint64_t)&v22))
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x1AD0D68A0](exception, "log-dump failed");
      __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
    }
    int v22 = &v18;
    xpc_object_t v23 = "log-dump";
    if (applesauce::xpc::dict::object_proxy::operator BOOL((uint64_t)&v22))
    {
      v13[0] = &v18;
      v13[1] = "log-dump";
      applesauce::xpc::dict::object_proxy::operator applesauce::xpc::object((uint64_t)v13, &v14);
      int v22 = 0;
      xpc_object_t v23 = 0;
      uint64_t v24 = 0;
      applesauce::xpc::dyn_cast_or_default();
      if (SHIBYTE(v24) < 0) {
        operator delete(v22);
      }
      xpc_object_t v9 = v14;
      xpc_object_t v14 = 0;
    }
    else
    {
      applesauce::xpc::object::to_string((applesauce::xpc::object *)&v18);
    }
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(a2, "unknown");
  }
  xpc_object_t v10 = v18;
  xpc_object_t v18 = 0;

  xpc_object_t v11 = v21;
  xpc_object_t v21 = 0;
}

void sub_1A7C48E74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *a20)
{
  if (*(char *)(v20 - 41) < 0) {
    operator delete(*(void **)(v20 - 64));
  }

  int v22 = *(void **)(v20 - 72);
  *(void *)(v20 - 72) = 0;

  _Unwind_Resume(a1);
}

void **applesauce::xpc::object::object(void **a1, uint64_t a2)
{
  if (*(char *)(a2 + 23) >= 0) {
    xpc_object_t v3 = (const char *)a2;
  }
  else {
    xpc_object_t v3 = *(const char **)a2;
  }
  xpc_object_t v4 = xpc_string_create(v3);
  *a1 = v4;
  if (!v4)
  {
    xpc_object_t v5 = xpc_null_create();
    xpc_object_t v6 = *a1;
    *a1 = v5;
  }
  return a1;
}

void analytics_tool_log_transform_counts(void *a1@<X8>)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  CASPIEnter();
  xpc_object_t v15 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  applesauce::xpc::dict::create(&v15);
  xpc_object_t v14 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  xpc_object_t v3 = CoreAnalytics::Client::get(v2);
  std::string::basic_string[abi:ne180100]<0>(__p, "log-transform-counts");
  applesauce::xpc::object::object((applesauce::xpc::object *)&v11, &v15);
  CoreAnalytics::Client::sendManagementCommandWithReply((NSObject **)v3, (uint64_t)__p, &v11, &v14);
  id v4 = v11;
  id v11 = 0;

  if (v13 < 0) {
    operator delete(__p[0]);
  }
  if (MEMORY[0x1AD0D7420](v14) == MEMORY[0x1E4F14590])
  {
    uint64_t v16 = &v14;
    char v17 = "error";
    if (applesauce::xpc::dict::object_proxy::operator BOOL((uint64_t)&v16))
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x1AD0D68A0](exception, "log-transform-counts failed");
      __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
    }
    uint64_t v16 = &v14;
    char v17 = "log-transform-counts";
    if (applesauce::xpc::dict::object_proxy::operator BOOL((uint64_t)&v16))
    {
      v9[0] = &v14;
      v9[1] = "log-transform-counts";
      applesauce::xpc::dict::object_proxy::operator applesauce::xpc::object((uint64_t)v9, &v10);
      uint64_t v16 = 0;
      char v17 = 0;
      uint64_t v18 = 0;
      applesauce::xpc::dyn_cast_or_default();
      if (SHIBYTE(v18) < 0) {
        operator delete(v16);
      }
      xpc_object_t v5 = v10;
      xpc_object_t v10 = 0;
    }
    else
    {
      applesauce::xpc::object::to_string((applesauce::xpc::object *)&v14);
    }
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(a1, "unknown");
  }
  xpc_object_t v6 = v14;
  xpc_object_t v14 = 0;

  xpc_object_t v7 = v15;
  xpc_object_t v15 = 0;
}

void sub_1A7C49194(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *a20,void *a21)
{
  if (*(char *)(v21 - 41) < 0) {
    operator delete(*(void **)(v21 - 64));
  }

  _Unwind_Resume(a1);
}

void analytics_tool_config_dump(void *a1@<X8>)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  CASPIEnter();
  xpc_object_t v16 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  applesauce::xpc::dict::create(&v16);
  xpc_object_t v15 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  xpc_object_t v3 = CoreAnalytics::Client::get(v2);
  std::string::basic_string[abi:ne180100]<0>(__p, "config-dump");
  applesauce::xpc::object::object((applesauce::xpc::object *)&v12, &v16);
  CoreAnalytics::Client::sendManagementCommandWithReply((NSObject **)v3, (uint64_t)__p, &v12, &v15);
  id v4 = v12;
  id v12 = 0;

  if (v14 < 0) {
    operator delete(__p[0]);
  }
  if (MEMORY[0x1AD0D7420](v15) == MEMORY[0x1E4F14590])
  {
    char v17 = &v15;
    uint64_t v18 = "error";
    if (applesauce::xpc::dict::object_proxy::operator BOOL((uint64_t)&v17))
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x1AD0D68A0](exception, "config-dump failed");
      __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
    }
    char v17 = &v15;
    uint64_t v18 = "config-dump";
    if (applesauce::xpc::dict::object_proxy::operator BOOL((uint64_t)&v17))
    {
      xpc_object_t v9 = &v15;
      xpc_object_t v10 = "config-dump";
      applesauce::xpc::dict::object_proxy::operator applesauce::xpc::object((uint64_t)&v9, &v11);
      char v17 = 0;
      uint64_t v18 = 0;
      uint64_t v19 = 0;
      applesauce::xpc::dyn_cast_or_default();
      if (SHIBYTE(v19) < 0) {
        operator delete(v17);
      }
    }
    else
    {
      char v17 = &v15;
      uint64_t v18 = "config-info";
      if (!applesauce::xpc::dict::object_proxy::operator BOOL((uint64_t)&v17))
      {
        applesauce::xpc::object::to_string((applesauce::xpc::object *)&v15);
        goto LABEL_15;
      }
      xpc_object_t v9 = &v15;
      xpc_object_t v10 = "config-info";
      applesauce::xpc::dict::object_proxy::operator applesauce::xpc::object((uint64_t)&v9, &v11);
      char v17 = 0;
      uint64_t v18 = 0;
      uint64_t v19 = 0;
      applesauce::xpc::dyn_cast_or_default();
      if (SHIBYTE(v19) < 0) {
        operator delete(v17);
      }
    }
    xpc_object_t v5 = v11;
    xpc_object_t v11 = 0;
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(a1, "unknown");
  }
LABEL_15:
  xpc_object_t v6 = v15;
  xpc_object_t v15 = 0;

  xpc_object_t v7 = v16;
  xpc_object_t v16 = 0;
}

void sub_1A7C494AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *a20,void *a21)
{
  if (*(char *)(v21 - 41) < 0) {
    operator delete(*(void **)(v21 - 64));
  }

  _Unwind_Resume(a1);
}

void analytics_tool_config_list(void *a1@<X8>)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  CASPIEnter();
  xpc_object_t v13 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  xpc_object_t v3 = CoreAnalytics::Client::get(v2);
  std::string::basic_string[abi:ne180100]<0>(__p, "config-list");
  applesauce::xpc::dict::create(&v10);
  CoreAnalytics::Client::sendManagementCommandWithReply((NSObject **)v3, (uint64_t)__p, &v10, &v13);
  xpc_object_t v4 = v10;
  xpc_object_t v10 = 0;

  if (v12 < 0) {
    operator delete(__p[0]);
  }
  if (MEMORY[0x1AD0D7420](v13) == MEMORY[0x1E4F14590])
  {
    char v14 = &v13;
    xpc_object_t v15 = "error";
    if (applesauce::xpc::dict::object_proxy::operator BOOL((uint64_t)&v14))
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x1AD0D68A0](exception, "config-list failed");
      __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
    }
    char v14 = &v13;
    xpc_object_t v15 = "config-list";
    if (applesauce::xpc::dict::object_proxy::operator BOOL((uint64_t)&v14))
    {
      v8[0] = &v13;
      v8[1] = "config-list";
      applesauce::xpc::dict::object_proxy::operator applesauce::xpc::object((uint64_t)v8, &v9);
      char v14 = 0;
      xpc_object_t v15 = 0;
      uint64_t v16 = 0;
      applesauce::xpc::dyn_cast_or_default();
      if (SHIBYTE(v16) < 0) {
        operator delete(v14);
      }
      xpc_object_t v5 = v9;
      xpc_object_t v9 = 0;
    }
    else
    {
      applesauce::xpc::object::to_string((applesauce::xpc::object *)&v13);
    }
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(a1, "unknown");
  }
  xpc_object_t v6 = v13;
  xpc_object_t v13 = 0;
}

void sub_1A7C49768(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, void *a13, uint64_t a14, int a15, __int16 a16, char a17, char a18, void *a19, void *__p,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  if (a25 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void analytics_tool_config_info(void *a1@<X8>)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  CASPIEnter();
  xpc_object_t v13 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  xpc_object_t v3 = CoreAnalytics::Client::get(v2);
  std::string::basic_string[abi:ne180100]<0>(__p, "config-info");
  applesauce::xpc::dict::create(&v10);
  CoreAnalytics::Client::sendManagementCommandWithReply((NSObject **)v3, (uint64_t)__p, &v10, &v13);
  xpc_object_t v4 = v10;
  xpc_object_t v10 = 0;

  if (v12 < 0) {
    operator delete(__p[0]);
  }
  if (MEMORY[0x1AD0D7420](v13) == MEMORY[0x1E4F14590])
  {
    char v14 = &v13;
    xpc_object_t v15 = "error";
    if (applesauce::xpc::dict::object_proxy::operator BOOL((uint64_t)&v14))
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x1AD0D68A0](exception, "config-info failed");
      __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
    }
    char v14 = &v13;
    xpc_object_t v15 = "config-info";
    if (applesauce::xpc::dict::object_proxy::operator BOOL((uint64_t)&v14))
    {
      v8[0] = &v13;
      v8[1] = "config-info";
      applesauce::xpc::dict::object_proxy::operator applesauce::xpc::object((uint64_t)v8, &v9);
      char v14 = 0;
      xpc_object_t v15 = 0;
      uint64_t v16 = 0;
      applesauce::xpc::dyn_cast_or_default();
      if (SHIBYTE(v16) < 0) {
        operator delete(v14);
      }
      xpc_object_t v5 = v9;
      xpc_object_t v9 = 0;
    }
    else
    {
      applesauce::xpc::object::to_string((applesauce::xpc::object *)&v13);
    }
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(a1, "unknown");
  }
  xpc_object_t v6 = v13;
  xpc_object_t v13 = 0;
}

void sub_1A7C499D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, void *a13, uint64_t a14, int a15, __int16 a16, char a17, char a18, void *a19, void *__p,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  if (a25 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void analytics_tool_config_reload(void)
{
  v9[1] = *(xpc_object_t *)MEMORY[0x1E4F143B8];
  CASPIEnter();
  v9[0] = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  uint64_t v1 = CoreAnalytics::Client::get(v0);
  std::string::basic_string[abi:ne180100]<0>(__p, "config-reload");
  applesauce::xpc::dict::create(&v6);
  CoreAnalytics::Client::sendManagementCommandWithReply((NSObject **)v1, (uint64_t)__p, &v6, v9);
  xpc_object_t v2 = v6;
  xpc_object_t v6 = 0;

  if (v8 < 0) {
    operator delete(__p[0]);
  }
  if (MEMORY[0x1AD0D7420](v9[0]) == MEMORY[0x1E4F14590])
  {
    v5[0] = v9;
    v5[1] = "error";
    if (applesauce::xpc::dict::object_proxy::operator BOOL((uint64_t)v5))
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x1AD0D68A0](exception, "Config-reload failed");
      __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
    }
  }
  xpc_object_t v3 = v9[0];
  v9[0] = 0;
}

void sub_1A7C49BA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  __cxa_free_exception(v17);
  uint64_t v20 = *(void **)(v18 - 32);
  *(void *)(v18 - 32) = 0;

  _Unwind_Resume(a1);
}

uint64_t analytics_tool_config_set_tasking(uint64_t a1)
{
  v22[1] = *(xpc_object_t *)MEMORY[0x1E4F143B8];
  CASPIEnter();
  v22[0] = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  applesauce::xpc::dict::create(v22);
  applesauce::xpc::object::object(&v20, a1);
  uint64_t v18 = v22;
  uint64_t v19 = "string-config";
  applesauce::xpc::dict::object_proxy::operator=((uint64_t)&v18, &v20, &v21);
  id v2 = v21;
  id v21 = 0;

  xpc_object_t v3 = v20;
  uint64_t v20 = 0;

  xpc_object_t v17 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  xpc_object_t v5 = CoreAnalytics::Client::get(v4);
  std::string::basic_string[abi:ne180100]<0>(__p, "set-tasking-old");
  applesauce::xpc::object::object((applesauce::xpc::object *)&v14, v22);
  CoreAnalytics::Client::sendManagementCommandWithReply((NSObject **)v5, (uint64_t)__p, &v14, &v17);
  id v6 = v14;
  id v14 = 0;

  if (v16 < 0) {
    operator delete(__p[0]);
  }
  if (MEMORY[0x1AD0D7420](v17) == MEMORY[0x1E4F14590])
  {
    uint64_t v18 = &v17;
    uint64_t v19 = "error";
    if (applesauce::xpc::dict::object_proxy::operator BOOL((uint64_t)&v18))
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x1AD0D68A0](exception, "Config-set-tasking (old style config) failed");
      __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
    }
  }
  uint64_t v18 = &v17;
  uint64_t v19 = "set-tasking-old";
  if (applesauce::xpc::dict::object_proxy::operator BOOL((uint64_t)&v18))
  {
    uint64_t v18 = &v17;
    uint64_t v19 = "set-tasking-old";
    applesauce::xpc::dict::object_proxy::operator applesauce::xpc::object((uint64_t)&v18, &v13);
    uint64_t v7 = applesauce::xpc::dyn_cast_or_default();
    xpc_object_t v8 = v13;
    xpc_object_t v13 = 0;
  }
  else
  {
    uint64_t v7 = 0;
  }
  xpc_object_t v9 = v17;
  xpc_object_t v17 = 0;

  xpc_object_t v10 = v22[0];
  v22[0] = 0;

  return v7;
}

void sub_1A7C49E20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *a17)
{
  __cxa_free_exception(v17);

  uint64_t v20 = *(void **)(v18 - 32);
  *(void *)(v18 - 32) = 0;

  _Unwind_Resume(a1);
}

uint64_t analytics_tool_config_set_tasking_ndjson(uint64_t a1)
{
  v26[1] = *(xpc_object_t *)MEMORY[0x1E4F143B8];
  CASPIEnter();
  v26[0] = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  applesauce::xpc::dict::create(v26);
  applesauce::xpc::object::object((applesauce::xpc::object *)&v24, (id *)a1);
  int v22 = v26;
  xpc_object_t v23 = "mmap-config";
  applesauce::xpc::dict::object_proxy::operator=((uint64_t)&v22, &v24, &v25);
  id v2 = v25;
  id v25 = 0;

  id v3 = v24;
  id v24 = 0;

  applesauce::xpc::object::object((applesauce::xpc::object *)&v20, *(void *)(a1 + 8));
  int v22 = v26;
  xpc_object_t v23 = "mmap-config-size";
  applesauce::xpc::dict::object_proxy::operator=((uint64_t)&v22, &v20, &v21);
  id v4 = v21;
  id v21 = 0;

  id v5 = v20;
  id v20 = 0;

  xpc_object_t v19 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  uint64_t v7 = CoreAnalytics::Client::get(v6);
  std::string::basic_string[abi:ne180100]<0>(__p, "set-tasking");
  applesauce::xpc::object::object((applesauce::xpc::object *)&v16, v26);
  CoreAnalytics::Client::sendManagementCommandWithReply((NSObject **)v7, (uint64_t)__p, &v16, &v19);
  id v8 = v16;
  id v16 = 0;

  if (v18 < 0) {
    operator delete(__p[0]);
  }
  if (MEMORY[0x1AD0D7420](v19) == MEMORY[0x1E4F14590])
  {
    int v22 = &v19;
    xpc_object_t v23 = "error";
    if (applesauce::xpc::dict::object_proxy::operator BOOL((uint64_t)&v22))
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x1AD0D68A0](exception, "Config-set-tasking (ndjson) failed");
      __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
    }
  }
  int v22 = &v19;
  xpc_object_t v23 = "set-tasking";
  if (applesauce::xpc::dict::object_proxy::operator BOOL((uint64_t)&v22))
  {
    int v22 = &v19;
    xpc_object_t v23 = "set-tasking";
    applesauce::xpc::dict::object_proxy::operator applesauce::xpc::object((uint64_t)&v22, &v15);
    uint64_t v9 = applesauce::xpc::dyn_cast_or_default();
    xpc_object_t v10 = v15;
    xpc_object_t v15 = 0;
  }
  else
  {
    uint64_t v9 = 0;
  }
  xpc_object_t v11 = v19;
  xpc_object_t v19 = 0;

  xpc_object_t v12 = v26[0];
  v26[0] = 0;

  return v9;
}

void sub_1A7C4A128(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *a17)
{
  __cxa_free_exception(v17);

  id v20 = *(void **)(v18 - 32);
  *(void *)(v18 - 32) = 0;

  _Unwind_Resume(a1);
}

applesauce::xpc::object *applesauce::xpc::object::object(applesauce::xpc::object *this, int64_t value)
{
  xpc_object_t v3 = xpc_int64_create(value);
  *(void *)this = v3;
  if (!v3)
  {
    xpc_object_t v4 = xpc_null_create();
    id v5 = *(void **)this;
    *(void *)this = v4;
  }
  return this;
}

{
  xpc_object_t v3;
  xpc_object_t v4;
  void *v5;

  xpc_object_t v3 = xpc_int64_create(value);
  *(void *)this = v3;
  if (!v3)
  {
    xpc_object_t v4 = xpc_null_create();
    id v5 = *(void **)this;
    *(void *)this = v4;
  }
  return this;
}

void analytics_tool_config_set_reboot_clear(BOOL a1)
{
  v18[1] = *(xpc_object_t *)MEMORY[0x1E4F143B8];
  CASPIEnter();
  v18[0] = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  applesauce::xpc::dict::create(v18);
  applesauce::xpc::object::object((applesauce::xpc::object *)&v16, a1);
  id v14 = v18;
  xpc_object_t v15 = "should-clear-config-after-reboot";
  applesauce::xpc::dict::object_proxy::operator=((uint64_t)&v14, &v16, &v17);
  id v2 = v17;
  id v17 = 0;

  id v3 = v16;
  id v16 = 0;

  xpc_object_t v13 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  id v5 = CoreAnalytics::Client::get(v4);
  std::string::basic_string[abi:ne180100]<0>(__p, "set-clear-config-after-reboot");
  applesauce::xpc::object::object((applesauce::xpc::object *)&v10, v18);
  CoreAnalytics::Client::sendManagementCommandWithReply((NSObject **)v5, (uint64_t)__p, &v10, &v13);
  id v6 = v10;
  id v10 = 0;

  if (v12 < 0) {
    operator delete(__p[0]);
  }
  if (MEMORY[0x1AD0D7420](v13) == MEMORY[0x1E4F14590])
  {
    id v14 = &v13;
    xpc_object_t v15 = "error";
    if (applesauce::xpc::dict::object_proxy::operator BOOL((uint64_t)&v14))
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x1AD0D68A0](exception, "Set-clear-config-after-reboot failed");
      __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
    }
  }
  xpc_object_t v7 = v13;
  xpc_object_t v13 = 0;

  xpc_object_t v8 = v18[0];
  v18[0] = 0;
}

void sub_1A7C4A3F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *a17)
{
  __cxa_free_exception(v17);

  id v20 = *(void **)(v18 - 32);
  *(void *)(v18 - 32) = 0;

  _Unwind_Resume(a1);
}

applesauce::xpc::object *applesauce::xpc::object::object(applesauce::xpc::object *this, BOOL value)
{
  xpc_object_t v3 = xpc_BOOL_create(value);
  *(void *)this = v3;
  if (!v3)
  {
    xpc_object_t v4 = xpc_null_create();
    id v5 = *(void **)this;
    *(void *)this = v4;
  }
  return this;
}

void analytics_tool_insert_query_state(uint64_t a1, id *a2, id *a3)
{
  v30[1] = *(xpc_object_t *)MEMORY[0x1E4F143B8];
  CASPIEnter();
  v30[0] = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  applesauce::xpc::dict::create(v30);
  applesauce::xpc::object::object(&v28, a1);
  int v26 = v30;
  uint64_t v27 = "state-name";
  applesauce::xpc::dict::object_proxy::operator=((uint64_t)&v26, &v28, &v29);
  id v6 = v29;
  id v29 = 0;

  xpc_object_t v7 = v28;
  id v28 = 0;

  applesauce::xpc::object::object((applesauce::xpc::object *)&v24, a2);
  int v26 = v30;
  uint64_t v27 = "state";
  applesauce::xpc::dict::object_proxy::operator=((uint64_t)&v26, &v24, &v25);
  id v8 = v25;
  id v25 = 0;

  id v9 = v24;
  id v24 = 0;

  applesauce::xpc::object::object((applesauce::xpc::object *)&v22, a3);
  int v26 = v30;
  uint64_t v27 = "state-parameters";
  applesauce::xpc::dict::object_proxy::operator=((uint64_t)&v26, &v22, &v23);
  id v10 = v23;
  id v23 = 0;

  id v11 = v22;
  id v22 = 0;

  xpc_object_t v21 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  xpc_object_t v13 = CoreAnalytics::Client::get(v12);
  std::string::basic_string[abi:ne180100]<0>(__p, "insert-query-state");
  applesauce::xpc::object::object((applesauce::xpc::object *)&v18, v30);
  CoreAnalytics::Client::sendManagementCommandWithReply((NSObject **)v13, (uint64_t)__p, &v18, &v21);
  id v14 = v18;
  id v18 = 0;

  if (v20 < 0) {
    operator delete(__p[0]);
  }
  if (MEMORY[0x1AD0D7420](v21) == MEMORY[0x1E4F14590])
  {
    int v26 = &v21;
    uint64_t v27 = "error";
    if (applesauce::xpc::dict::object_proxy::operator BOOL((uint64_t)&v26))
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x1AD0D68A0](exception, "insert-query-state failed");
      __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
    }
  }
  xpc_object_t v15 = v21;
  xpc_object_t v21 = 0;

  xpc_object_t v16 = v30[0];
  v30[0] = 0;
}

void sub_1A7C4A744(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *a17)
{
  __cxa_free_exception(v17);

  char v20 = *(void **)(v18 - 48);
  *(void *)(v18 - 48) = 0;

  _Unwind_Resume(a1);
}

void analytics_tool_query_state(uint64_t a1, id *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  CASPIEnter();
  xpc_object_t v25 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  applesauce::xpc::dict::create(&v25);
  applesauce::xpc::object::object(&v23, a1);
  int v26 = &v25;
  uint64_t v27 = "state-name";
  applesauce::xpc::dict::object_proxy::operator=((uint64_t)&v26, &v23, &v24);
  id v4 = v24;
  id v24 = 0;

  id v5 = v23;
  id v23 = 0;

  applesauce::xpc::object::object((applesauce::xpc::object *)&v21, a2);
  int v26 = &v25;
  uint64_t v27 = "state-parameters";
  applesauce::xpc::dict::object_proxy::operator=((uint64_t)&v26, &v21, &v22);
  id v6 = v22;
  id v22 = 0;

  id v7 = v21;
  id v21 = 0;

  xpc_object_t v20 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  id v9 = CoreAnalytics::Client::get(v8);
  std::string::basic_string[abi:ne180100]<0>(__p, "query-state");
  applesauce::xpc::object::object((applesauce::xpc::object *)&v17, &v25);
  CoreAnalytics::Client::sendManagementCommandWithReply((NSObject **)v9, (uint64_t)__p, &v17, &v20);
  id v10 = v17;
  id v17 = 0;

  if (v19 < 0) {
    operator delete(__p[0]);
  }
  if (MEMORY[0x1AD0D7420](v20) == MEMORY[0x1E4F14590])
  {
    int v26 = &v20;
    uint64_t v27 = "error";
    if (applesauce::xpc::dict::object_proxy::operator BOOL((uint64_t)&v26))
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x1AD0D68A0](exception, "query-state failed");
      __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
    }
  }
  int v26 = &v20;
  uint64_t v27 = "query-state";
  if (applesauce::xpc::dict::object_proxy::operator BOOL((uint64_t)&v26))
  {
    v15[0] = &v20;
    v15[1] = "query-state";
    applesauce::xpc::dict::object_proxy::operator applesauce::xpc::object((uint64_t)v15, &v16);
    int v26 = 0;
    uint64_t v27 = 0;
    uint64_t v28 = 0;
    applesauce::xpc::dyn_cast_or_default();
    if (SHIBYTE(v28) < 0) {
      operator delete(v26);
    }
    xpc_object_t v11 = v16;
    xpc_object_t v16 = 0;
  }
  else
  {
    applesauce::xpc::object::to_string((applesauce::xpc::object *)&v20);
  }
  xpc_object_t v12 = v20;
  xpc_object_t v20 = 0;

  xpc_object_t v13 = v25;
  xpc_object_t v25 = 0;
}

void sub_1A7C4AA54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *a20)
{
  __cxa_free_exception(v20);

  id v23 = *(void **)(v21 - 72);
  *(void *)(v21 - 72) = 0;

  _Unwind_Resume(a1);
}

void analytics_tool_query_clear(uint64_t a1)
{
  v18[1] = *(xpc_object_t *)MEMORY[0x1E4F143B8];
  CASPIEnter();
  v18[0] = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  applesauce::xpc::dict::create(v18);
  if (*(unsigned char *)(a1 + 24))
  {
    applesauce::xpc::object::object(&v16, a1);
    id v14 = v18;
    xpc_object_t v15 = "state-name";
    applesauce::xpc::dict::object_proxy::operator=((uint64_t)&v14, &v16, &v17);
    id v3 = v17;
    id v17 = 0;

    id v4 = v16;
    xpc_object_t v16 = 0;
  }
  xpc_object_t v13 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  id v5 = CoreAnalytics::Client::get(v2);
  std::string::basic_string[abi:ne180100]<0>(__p, "query-clear");
  applesauce::xpc::object::object((applesauce::xpc::object *)&v10, v18);
  CoreAnalytics::Client::sendManagementCommandWithReply((NSObject **)v5, (uint64_t)__p, &v10, &v13);
  id v6 = v10;
  id v10 = 0;

  if (v12 < 0) {
    operator delete(__p[0]);
  }
  if (MEMORY[0x1AD0D7420](v13) == MEMORY[0x1E4F14590])
  {
    id v14 = &v13;
    xpc_object_t v15 = "error";
    if (applesauce::xpc::dict::object_proxy::operator BOOL((uint64_t)&v14))
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x1AD0D68A0](exception, "query-clear failed");
      __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
    }
  }
  xpc_object_t v7 = v13;
  xpc_object_t v13 = 0;

  xpc_object_t v8 = v18[0];
  v18[0] = 0;
}

void sub_1A7C4ACD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *a17)
{
  __cxa_free_exception(v17);

  xpc_object_t v20 = *(void **)(v18 - 48);
  *(void *)(v18 - 48) = 0;

  _Unwind_Resume(a1);
}

void analytics_tool_query_list(void)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  CASPIEnter();
  xpc_object_t v13 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  applesauce::xpc::dict::create(&v13);
  xpc_object_t v12 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  uint64_t v1 = CoreAnalytics::Client::get(v0);
  std::string::basic_string[abi:ne180100]<0>(__p, "query-list");
  applesauce::xpc::object::object((applesauce::xpc::object *)&v9, &v13);
  CoreAnalytics::Client::sendManagementCommandWithReply((NSObject **)v1, (uint64_t)__p, &v9, &v12);
  id v2 = v9;
  id v9 = 0;

  if (v11 < 0) {
    operator delete(__p[0]);
  }
  if (MEMORY[0x1AD0D7420](v12) == MEMORY[0x1E4F14590])
  {
    id v14 = &v12;
    xpc_object_t v15 = "error";
    if (applesauce::xpc::dict::object_proxy::operator BOOL((uint64_t)&v14))
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x1AD0D68A0](exception, "query-list failed");
      __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
    }
  }
  id v14 = &v12;
  xpc_object_t v15 = "query-list";
  if (applesauce::xpc::dict::object_proxy::operator BOOL((uint64_t)&v14))
  {
    v7[0] = &v12;
    v7[1] = "query-list";
    applesauce::xpc::dict::object_proxy::operator applesauce::xpc::object((uint64_t)v7, &v8);
    id v14 = 0;
    xpc_object_t v15 = 0;
    uint64_t v16 = 0;
    applesauce::xpc::dyn_cast_or_default();
    if (SHIBYTE(v16) < 0) {
      operator delete(v14);
    }
    xpc_object_t v3 = v8;
    xpc_object_t v8 = 0;
  }
  else
  {
    applesauce::xpc::object::to_string((applesauce::xpc::object *)&v12);
  }
  xpc_object_t v4 = v12;
  xpc_object_t v12 = 0;

  xpc_object_t v5 = v13;
  xpc_object_t v13 = 0;
}

void sub_1A7C4AF30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *a20,void *a21)
{
  __cxa_free_exception(v21);

  _Unwind_Resume(a1);
}

void analytics_tool_get_cache_list(void)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  CASPIEnter();
  xpc_object_t v11 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  uint64_t v1 = CoreAnalytics::Client::get(v0);
  std::string::basic_string[abi:ne180100]<0>(__p, "list-transforms-in-cache");
  applesauce::xpc::dict::create(&v8);
  CoreAnalytics::Client::sendManagementCommandWithReply((NSObject **)v1, (uint64_t)__p, &v8, &v11);
  xpc_object_t v2 = v8;
  xpc_object_t v8 = 0;

  if (v10 < 0) {
    operator delete(__p[0]);
  }
  if (MEMORY[0x1AD0D7420](v11) == MEMORY[0x1E4F14590])
  {
    xpc_object_t v12 = &v11;
    xpc_object_t v13 = "error";
    if (applesauce::xpc::dict::object_proxy::operator BOOL((uint64_t)&v12))
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x1AD0D68A0](exception, "list-transforms-in-cache failed");
      __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
    }
  }
  v6[0] = &v11;
  v6[1] = "transforms-in-cache";
  applesauce::xpc::dict::object_proxy::operator applesauce::xpc::object((uint64_t)v6, &v7);
  xpc_object_t v12 = 0;
  xpc_object_t v13 = 0;
  uint64_t v14 = 0;
  applesauce::xpc::dyn_cast_or_default();
  if (SHIBYTE(v14) < 0) {
    operator delete(v12);
  }
  xpc_object_t v3 = v7;
  xpc_object_t v7 = 0;

  xpc_object_t v4 = v11;
  xpc_object_t v11 = 0;
}

void sub_1A7C4B17C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, void *a19)
{
  __cxa_free_exception(v19);

  _Unwind_Resume(a1);
}

void analytics_tool_save(void)
{
  v7[1] = *(xpc_object_t *)MEMORY[0x1E4F143B8];
  CASPIEnter();
  v7[0] = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  uint64_t v1 = CoreAnalytics::Client::get(v0);
  std::string::basic_string[abi:ne180100]<0>(__p, "save-log");
  applesauce::xpc::dict::create(&v4);
  CoreAnalytics::Client::sendManagementCommandWithReply((NSObject **)v1, (uint64_t)__p, &v4, v7);
  xpc_object_t v2 = v4;
  xpc_object_t v4 = 0;

  if (v6 < 0) {
    operator delete(__p[0]);
  }
  xpc_object_t v3 = v7[0];
  v7[0] = 0;
}

void sub_1A7C4B2DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

uint64_t analytics_tool_rollover(uint64_t a1, BOOL a2)
{
  v17[1] = *(xpc_object_t *)MEMORY[0x1E4F143B8];
  CASPIEnter();
  v17[0] = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  applesauce::xpc::dict::create(v17);
  if (*(unsigned char *)(a1 + 24))
  {
    applesauce::xpc::object::object(&v15, a1);
    xpc_object_t v13 = v17;
    uint64_t v14 = "aggPeriod";
    applesauce::xpc::dict::object_proxy::operator=((uint64_t)&v13, &v15, &v16);
    id v4 = v16;
    id v16 = 0;

    xpc_object_t v5 = v15;
    uint64_t v15 = 0;
  }
  applesauce::xpc::object::object((applesauce::xpc::object *)&v11, a2);
  xpc_object_t v13 = v17;
  uint64_t v14 = "preserveState";
  applesauce::xpc::dict::object_proxy::operator=((uint64_t)&v13, &v11, &v12);
  id v6 = v12;
  id v12 = 0;

  id v7 = v11;
  id v11 = 0;

  uint64_t v8 = analytics_rollover_with_options(v17[0]);
  xpc_object_t v9 = v17[0];
  v17[0] = 0;

  return v8;
}

void sub_1A7C4B460(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void analytics_tool_commit(void)
{
  v7[1] = *(xpc_object_t *)MEMORY[0x1E4F143B8];
  CASPIEnter();
  v7[0] = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  uint64_t v1 = CoreAnalytics::Client::get(v0);
  std::string::basic_string[abi:ne180100]<0>(__p, "commit");
  applesauce::xpc::dict::create(&v4);
  CoreAnalytics::Client::sendManagementCommandWithReply((NSObject **)v1, (uint64_t)__p, &v4, v7);
  xpc_object_t v2 = v4;
  xpc_object_t v4 = 0;

  if (v6 < 0) {
    operator delete(__p[0]);
  }
  xpc_object_t v3 = v7[0];
  v7[0] = 0;
}

void sub_1A7C4B550(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void analytics_tool_transform_info(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  CASPIEnter();
  xpc_object_t v21 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  applesauce::xpc::dict::create(&v21);
  applesauce::xpc::object::object(&v19, a1);
  id v22 = &v21;
  id v23 = "name";
  applesauce::xpc::dict::object_proxy::operator=((uint64_t)&v22, &v19, &v20);
  id v4 = v20;
  id v20 = 0;

  xpc_object_t v5 = v19;
  char v19 = 0;

  xpc_object_t v18 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  id v7 = CoreAnalytics::Client::get(v6);
  std::string::basic_string[abi:ne180100]<0>(__p, "transform-info");
  applesauce::xpc::object::object((applesauce::xpc::object *)&v15, &v21);
  CoreAnalytics::Client::sendManagementCommandWithReply((NSObject **)v7, (uint64_t)__p, &v15, &v18);
  id v8 = v15;
  id v15 = 0;

  if (v17 < 0) {
    operator delete(__p[0]);
  }
  if (MEMORY[0x1AD0D7420](v18) == MEMORY[0x1E4F14590])
  {
    id v22 = &v18;
    id v23 = "error";
    if (applesauce::xpc::dict::object_proxy::operator BOOL((uint64_t)&v22))
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x1AD0D68A0](exception, "transform-info failed");
      __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
    }
    id v22 = &v18;
    id v23 = "transform-info";
    if (applesauce::xpc::dict::object_proxy::operator BOOL((uint64_t)&v22))
    {
      v13[0] = &v18;
      v13[1] = "transform-info";
      applesauce::xpc::dict::object_proxy::operator applesauce::xpc::object((uint64_t)v13, &v14);
      id v22 = 0;
      id v23 = 0;
      uint64_t v24 = 0;
      applesauce::xpc::dyn_cast_or_default();
      if (SHIBYTE(v24) < 0) {
        operator delete(v22);
      }
      xpc_object_t v9 = v14;
      xpc_object_t v14 = 0;
    }
    else
    {
      applesauce::xpc::object::to_string((applesauce::xpc::object *)&v18);
    }
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(a2, "unknown");
  }
  xpc_object_t v10 = v18;
  xpc_object_t v18 = 0;

  xpc_object_t v11 = v21;
  xpc_object_t v21 = 0;
}

void sub_1A7C4B7D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *a20)
{
  if (*(char *)(v20 - 41) < 0) {
    operator delete(*(void **)(v20 - 64));
  }

  id v22 = *(void **)(v20 - 72);
  *(void *)(v20 - 72) = 0;

  _Unwind_Resume(a1);
}

uint64_t analytics_tool_transform_evict(uint64_t a1)
{
  v22[1] = *(xpc_object_t *)MEMORY[0x1E4F143B8];
  CASPIEnter();
  v22[0] = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  applesauce::xpc::dict::create(v22);
  applesauce::xpc::object::object(&v20, a1);
  xpc_object_t v18 = v22;
  char v19 = "name";
  applesauce::xpc::dict::object_proxy::operator=((uint64_t)&v18, &v20, &v21);
  id v2 = v21;
  id v21 = 0;

  xpc_object_t v3 = v20;
  uint64_t v20 = 0;

  xpc_object_t v17 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  xpc_object_t v5 = CoreAnalytics::Client::get(v4);
  std::string::basic_string[abi:ne180100]<0>(__p, "transform-evict");
  applesauce::xpc::object::object((applesauce::xpc::object *)&v14, v22);
  CoreAnalytics::Client::sendManagementCommandWithReply((NSObject **)v5, (uint64_t)__p, &v14, &v17);
  id v6 = v14;
  id v14 = 0;

  if (v16 < 0) {
    operator delete(__p[0]);
  }
  if (MEMORY[0x1AD0D7420](v17) != MEMORY[0x1E4F14590]) {
    goto LABEL_7;
  }
  xpc_object_t v18 = &v17;
  char v19 = "error";
  if (applesauce::xpc::dict::object_proxy::operator BOOL((uint64_t)&v18))
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1AD0D68A0](exception, "transform-evict failed");
    __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  xpc_object_t v18 = &v17;
  char v19 = "transform-evict";
  if (applesauce::xpc::dict::object_proxy::operator BOOL((uint64_t)&v18))
  {
    xpc_object_t v18 = &v17;
    char v19 = "transform-evict";
    applesauce::xpc::dict::object_proxy::operator applesauce::xpc::object((uint64_t)&v18, &v13);
    uint64_t v7 = applesauce::xpc::dyn_cast_or_default();
    xpc_object_t v8 = v13;
    xpc_object_t v13 = 0;
  }
  else
  {
LABEL_7:
    uint64_t v7 = 0;
  }
  xpc_object_t v9 = v17;
  xpc_object_t v17 = 0;

  xpc_object_t v10 = v22[0];
  v22[0] = 0;

  return v7;
}

void sub_1A7C4BAA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *a17)
{
  char v19 = *(void **)(v17 - 32);
  *(void *)(v17 - 32) = 0;

  _Unwind_Resume(a1);
}

uint64_t analytics_tool_transform_persist(uint64_t a1)
{
  v22[1] = *(xpc_object_t *)MEMORY[0x1E4F143B8];
  CASPIEnter();
  v22[0] = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  applesauce::xpc::dict::create(v22);
  applesauce::xpc::object::object(&v20, a1);
  xpc_object_t v18 = v22;
  char v19 = "name";
  applesauce::xpc::dict::object_proxy::operator=((uint64_t)&v18, &v20, &v21);
  id v2 = v21;
  id v21 = 0;

  xpc_object_t v3 = v20;
  uint64_t v20 = 0;

  xpc_object_t v17 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  xpc_object_t v5 = CoreAnalytics::Client::get(v4);
  std::string::basic_string[abi:ne180100]<0>(__p, "transform-persist");
  applesauce::xpc::object::object((applesauce::xpc::object *)&v14, v22);
  CoreAnalytics::Client::sendManagementCommandWithReply((NSObject **)v5, (uint64_t)__p, &v14, &v17);
  id v6 = v14;
  id v14 = 0;

  if (v16 < 0) {
    operator delete(__p[0]);
  }
  if (MEMORY[0x1AD0D7420](v17) != MEMORY[0x1E4F14590]) {
    goto LABEL_7;
  }
  xpc_object_t v18 = &v17;
  char v19 = "error";
  if (applesauce::xpc::dict::object_proxy::operator BOOL((uint64_t)&v18))
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1AD0D68A0](exception, "transform-persist failed");
    __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  xpc_object_t v18 = &v17;
  char v19 = "transform-persist";
  if (applesauce::xpc::dict::object_proxy::operator BOOL((uint64_t)&v18))
  {
    xpc_object_t v18 = &v17;
    char v19 = "transform-persist";
    applesauce::xpc::dict::object_proxy::operator applesauce::xpc::object((uint64_t)&v18, &v13);
    uint64_t v7 = applesauce::xpc::dyn_cast_or_default();
    xpc_object_t v8 = v13;
    xpc_object_t v13 = 0;
  }
  else
  {
LABEL_7:
    uint64_t v7 = 0;
  }
  xpc_object_t v9 = v17;
  xpc_object_t v17 = 0;

  xpc_object_t v10 = v22[0];
  v22[0] = 0;

  return v7;
}

void sub_1A7C4BD60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *a17)
{
  char v19 = *(void **)(v17 - 32);
  *(void *)(v17 - 32) = 0;

  _Unwind_Resume(a1);
}

uint64_t analytics_tool_is_event_used_check_db(uint64_t a1)
{
  v22[1] = *(xpc_object_t *)MEMORY[0x1E4F143B8];
  CASPIEnter();
  v22[0] = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  applesauce::xpc::dict::create(v22);
  applesauce::xpc::object::object(&v20, a1);
  xpc_object_t v18 = v22;
  char v19 = "name";
  applesauce::xpc::dict::object_proxy::operator=((uint64_t)&v18, &v20, &v21);
  id v2 = v21;
  id v21 = 0;

  xpc_object_t v3 = v20;
  uint64_t v20 = 0;

  xpc_object_t v17 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  xpc_object_t v5 = CoreAnalytics::Client::get(v4);
  std::string::basic_string[abi:ne180100]<0>(__p, "event-used");
  applesauce::xpc::object::object((applesauce::xpc::object *)&v14, v22);
  CoreAnalytics::Client::sendManagementCommandWithReply((NSObject **)v5, (uint64_t)__p, &v14, &v17);
  id v6 = v14;
  id v14 = 0;

  if (v16 < 0) {
    operator delete(__p[0]);
  }
  if (MEMORY[0x1AD0D7420](v17) != MEMORY[0x1E4F14590])
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1AD0D68A0](exception, "event-used failed");
    __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  xpc_object_t v18 = &v17;
  char v19 = "event-used";
  applesauce::xpc::dict::object_proxy::operator applesauce::xpc::object((uint64_t)&v18, &v13);
  uint64_t v7 = applesauce::xpc::dyn_cast_or_default();
  xpc_object_t v8 = v13;
  xpc_object_t v13 = 0;

  xpc_object_t v9 = v17;
  xpc_object_t v17 = 0;

  xpc_object_t v10 = v22[0];
  v22[0] = 0;

  return v7;
}

void sub_1A7C4BFE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *a17)
{
  __cxa_free_exception(v17);

  uint64_t v20 = *(void **)(v18 - 32);
  *(void *)(v18 - 32) = 0;

  _Unwind_Resume(a1);
}

BOOL analytics_tool_has_config(void)
{
  CASPIEnter();
  uint64_t v1 = CoreAnalytics::Client::get(v0);

  return CoreAnalytics::Client::hasConfig((CoreAnalytics::Client *)v1);
}

void report_locale_prefs_to_analyticsd()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  CASPIEnter();
  __report_locale_prefs_to_analyticsd_block_invoke();
  uint64_t v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v1 = objc_alloc_init(MEMORY[0x1E4F28F08]);
  uint64_t v2 = *MEMORY[0x1E4F1C370];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __report_locale_prefs_to_analyticsd_block_invoke_59;
  v4[3] = &unk_1E5D1EB30;
  id v5 = &__block_literal_global;
  id v3 = (id)[v0 addObserverForName:v2 object:0 queue:v1 usingBlock:v4];
}

void sub_1A7C4C1BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void __report_locale_prefs_to_analyticsd_block_invoke()
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  xpc_object_t v42 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  applesauce::xpc::dict::create(&v42);
  uint64_t v0 = (void *)MEMORY[0x1AD0D6DD0]();
  id v1 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  uint64_t v2 = (void *)MEMORY[0x1E4F28B50];
  id v3 = [MEMORY[0x1E4F1CA20] systemLanguages];
  id v4 = [v2 preferredLocalizationsFromArray:v3 forPreferences:v1];

  if ([v4 count])
  {
    id v5 = [v4 objectAtIndexedSubscript:0];
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v5 UTF8String]);
    applesauce::xpc::object::object(&v40, (uint64_t)__p);
    *(void *)&long long buf = &v42;
    *((void *)&buf + 1) = "user-interface-language";
    applesauce::xpc::dict::object_proxy::operator=((uint64_t)&buf, &v40, &v41);
    id v6 = v41;
    id v41 = 0;

    uint64_t v7 = v40;
    int v40 = 0;

    if (v39 < 0) {
      operator delete(__p[0]);
    }
  }
  if ([v1 count])
  {
    id v8 = [v1 objectAtIndexedSubscript:0];
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v8 UTF8String]);
    applesauce::xpc::object::object(&v36, (uint64_t)__p);
    *(void *)&long long buf = &v42;
    *((void *)&buf + 1) = "preferred-user-interface-language";
    applesauce::xpc::dict::object_proxy::operator=((uint64_t)&buf, &v36, &v37);
    id v9 = v37;
    id v37 = 0;

    xpc_object_t v10 = v36;
    int v36 = 0;

    if (v39 < 0) {
      operator delete(__p[0]);
    }
  }
  xpc_object_t v11 = [MEMORY[0x1E4F1CA20] currentLocale];
  id v12 = v11;
  if (v11)
  {
    uint64_t v13 = *MEMORY[0x1E4F1C400];
    id v14 = [v11 objectForKey:*MEMORY[0x1E4F1C400]];
    BOOL v15 = v14 == 0;

    if (!v15)
    {
      id v16 = [v12 objectForKey:v13];
      std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v16 UTF8String]);
      applesauce::xpc::object::object(&v34, (uint64_t)__p);
      *(void *)&long long buf = &v42;
      *((void *)&buf + 1) = "user-set-region-format";
      applesauce::xpc::dict::object_proxy::operator=((uint64_t)&buf, &v34, &v35);
      id v17 = v35;
      id v35 = 0;

      uint64_t v18 = v34;
      unsigned int v34 = 0;

      if (v39 < 0) {
        operator delete(__p[0]);
      }
    }
  }

  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    applesauce::xpc::dict::to_debug_string((applesauce::xpc::dict *)&v42, __p);
    uint64_t v20 = v39 >= 0 ? __p : (void **)__p[0];
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = v20;
    _os_log_impl(&dword_1A7C3B000, v19, OS_LOG_TYPE_INFO, "store-locale-info is sending %s", (uint8_t *)&buf, 0xCu);
    if (v39 < 0) {
      operator delete(__p[0]);
    }
  }

  xpc_object_t v33 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  id v22 = CoreAnalytics::Client::get(v21);
  std::string::basic_string[abi:ne180100]<0>(v31, "store-locale-info");
  applesauce::xpc::object::object((applesauce::xpc::object *)&v30, &v42);
  CoreAnalytics::Client::sendManagementCommandWithReply((NSObject **)v22, (uint64_t)v31, &v30, &v33);
  id v23 = v30;
  id v30 = 0;

  if (v32 < 0) {
    operator delete(v31[0]);
  }
  if (MEMORY[0x1AD0D7420](v33) == MEMORY[0x1E4F14590])
  {
    __p[0] = &v33;
    __p[1] = "error";
    if (applesauce::xpc::dict::object_proxy::operator BOOL((uint64_t)__p))
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(void *)&long long buf = &v33;
        *((void *)&buf + 1) = "error";
        applesauce::xpc::dict::object_proxy::operator applesauce::xpc::object((uint64_t)&buf, &v29);
        applesauce::xpc::dyn_cast<std::string>();
        if (v39 >= 0) {
          uint64_t v27 = __p;
        }
        else {
          uint64_t v27 = (void **)__p[0];
        }
        *(_DWORD *)uint64_t v43 = 136315138;
        unint64_t v44 = v27;
        _os_log_error_impl(&dword_1A7C3B000, v24, OS_LOG_TYPE_ERROR, "store-locale-info failed error: %s", v43, 0xCu);
        if (v39 < 0) {
          operator delete(__p[0]);
        }
        xpc_object_t v28 = v29;
        xpc_object_t v29 = 0;
      }
    }
  }
  xpc_object_t v25 = v33;
  xpc_object_t v33 = 0;

  xpc_object_t v26 = v42;
  xpc_object_t v42 = 0;
}

void sub_1A7C4C6C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void *a27)
{
  _Unwind_Resume(a1);
}

void applesauce::xpc::dict::to_debug_string(applesauce::xpc::dict *this@<X0>, void *a2@<X8>)
{
  id v3 = (char *)MEMORY[0x1AD0D7350](*(void *)this);
  memset(a2, 170, 24);
  std::string::basic_string[abi:ne180100]<0>(a2, v3);

  free(v3);
}

uint64_t __report_locale_prefs_to_analyticsd_block_invoke_59(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1A7C3B000, v2, OS_LOG_TYPE_DEFAULT, "Received locale changed notification", v4, 2u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void *ad_addScalarForKey(uint64_t a1, uint64_t a2)
{
  CASPIEnter();
  if (ad_addScalarForKey::onceToken != -1) {
    dispatch_once(&ad_addScalarForKey::onceToken, &__block_literal_global_62);
  }
  uint64_t result = ad_addScalarForKey::__ADClientAddValueForScalarKey;
  if (ad_addScalarForKey::__ADClientAddValueForScalarKey)
  {
    id v6 = (uint64_t (*)(uint64_t, uint64_t))ad_addScalarForKey::__ADClientAddValueForScalarKey;
    uint64_t v5 = [NSString stringWithUTF8String:a1];
    return (void *)v6(v5, a2);
  }
  return result;
}

void *__ad_addScalarForKey_block_invoke()
{
  uint64_t result = dlopen("/System/Library/PrivateFrameworks/AggregateDictionary.framework/AggregateDictionary", 1);
  if (result)
  {
    uint64_t result = dlsym(result, "ADClientAddValueForScalarKey");
    ad_addScalarForKey::__ADClientAddValueForScalarKey = result;
  }
  return result;
}

void analytics_tool_app_usage_sync(void)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  CASPIEnter();
  xpc_object_t v11 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  id v1 = CoreAnalytics::Client::get(v0);
  std::string::basic_string[abi:ne180100]<0>(__p, "app-usage-sync");
  applesauce::xpc::dict::create(&v8);
  CoreAnalytics::Client::sendManagementCommandWithReply((NSObject **)v1, (uint64_t)__p, &v8, &v11);
  xpc_object_t v2 = v8;
  xpc_object_t v8 = 0;

  if (v10 < 0) {
    operator delete(__p[0]);
  }
  if (MEMORY[0x1AD0D7420](v11) != MEMORY[0x1E4F14590])
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1AD0D68A0](exception, "Failed to run 'app-usage-sync'");
    __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  id v12 = &v11;
  uint64_t v13 = "appusage";
  if (applesauce::xpc::dict::object_proxy::operator BOOL((uint64_t)&v12))
  {
    v6[0] = &v11;
    v6[1] = "appusage";
    applesauce::xpc::dict::object_proxy::operator applesauce::xpc::object((uint64_t)v6, &v7);
    id v12 = 0;
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    applesauce::xpc::dyn_cast_or_default();
    if (SHIBYTE(v14) < 0) {
      operator delete(v12);
    }
    xpc_object_t v3 = v7;
    xpc_object_t v7 = 0;
  }
  else
  {
    applesauce::xpc::object::to_string((applesauce::xpc::object *)&v11);
  }
  xpc_object_t v4 = v11;
  xpc_object_t v11 = 0;
}

void sub_1A7C4CB5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, void *a19)
{
  if (*(char *)(v19 - 25) < 0) {
    operator delete(*(void **)(v19 - 48));
  }

  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
}

void std::string::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1E5D1EA18, MEMORY[0x1E4FBA1C8]);
}

void sub_1A7C4CC68(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E4FBA4D0] + 16);
  return result;
}

uint64_t analytics_is_event_used(const char *a1)
{
  xpc_object_t v2 = (void *)MEMORY[0x1AD0D6DD0]();
  CASPIEnter();
  xpc_object_t v4 = CoreAnalytics::Client::get(v3);
  size_t v5 = strlen(a1);
  uint64_t isEventUsed = CoreAnalytics::Client::isEventUsed((uint64_t)v4, a1, v5);
  return isEventUsed;
}

id __copy_helper_block_ea8_32c31_ZTSKZ18AnalyticsSendEventE3__0(uint64_t a1, uint64_t a2)
{
  id result = *(id *)(a2 + 32);
  *(void *)(a1 + 32) = result;
  return result;
}

void __destroy_helper_block_ea8_32c31_ZTSKZ18AnalyticsSendEventE3__0(uint64_t a1)
{
}

void AnalyticsSendEventWithOptions(void *a1, void *a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3321888768;
  xpc_object_t v7[2] = __AnalyticsSendEventWithOptions_block_invoke;
  v7[3] = &__block_descriptor_40_ea8_32c42_ZTSKZ29AnalyticsSendEventWithOptionsE3__0_e19___NSDictionary_8__0l;
  id v8 = v5;
  id v6 = v5;
  AnalyticsSendEventInternal(a1, v7, 0, 0, a3);
}

void sub_1A7C4CE20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

id __AnalyticsSendEventWithOptions_block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __copy_helper_block_ea8_32c42_ZTSKZ29AnalyticsSendEventWithOptionsE3__0(uint64_t a1, uint64_t a2)
{
  id result = *(id *)(a2 + 32);
  *(void *)(a1 + 32) = result;
  return result;
}

void __destroy_helper_block_ea8_32c42_ZTSKZ29AnalyticsSendEventWithOptionsE3__0(uint64_t a1)
{
}

uint64_t AnalyticsSendEventLazyHighPriority(void *a1, void *a2)
{
  return AnalyticsSendEventInternal(a1, a2, 1u, 0, 0);
}

uint64_t AnalyticsSendExplodingEventLazy(void *a1, void *a2)
{
  return AnalyticsSendEventInternal(a1, a2, 0, 1, 0);
}

void analytics_send_event_with_options(char *a1, void *a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  xpc_object_t v7[2] = __analytics_send_event_with_options_block_invoke;
  v7[3] = &unk_1E5D1EB68;
  id v8 = v5;
  id v6 = v5;
  analytics_send_event_internal(a1, v7, 0, 0, a3);
}

void sub_1A7C4CF74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

id __analytics_send_event_with_options_block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t analytics_send_event_lazy_high_priority(char *a1, void *a2)
{
  return analytics_send_event_internal(a1, a2, 1u, 0, 0);
}

uint64_t analytics_send_exploding_event_lazy(char *a1, void *a2)
{
  return analytics_send_event_internal(a1, a2, 0, 1, 0);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  id v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x1E4FBA350], MEMORY[0x1E4FBA1F8]);
}

void std::__function::__func<AnalyticsSendEventInternal(NSString const*,NSDictionary<NSString*,NSObject *> *({block_pointer})(void),XPCMessagePriority,EventPayloadFormat,NSDictionary<NSString*,NSObject *> *)::$_0,std::allocator<AnalyticsSendEventInternal(NSString const*,NSDictionary<NSString*,NSObject *> *({block_pointer})(void),XPCMessagePriority,EventPayloadFormat,NSDictionary<NSString*,NSObject *> *)::$_0>,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> ()(void)>::~__func()
{
}

__n128 std::__function::__func<AnalyticsSendEventInternal(NSString const*,NSDictionary<NSString*,NSObject *> *({block_pointer})(void),XPCMessagePriority,EventPayloadFormat,NSDictionary<NSString*,NSObject *> *)::$_0,std::allocator<AnalyticsSendEventInternal(NSString const*,NSDictionary<NSString*,NSObject *> *({block_pointer})(void),XPCMessagePriority,EventPayloadFormat,NSDictionary<NSString*,NSObject *> *)::$_0>,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> ()(void)>::__clone(uint64_t a1)
{
  xpc_object_t v2 = (char *)operator new(0x18uLL);
  *(void *)xpc_object_t v2 = &unk_1EFE15A40;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 std::__function::__func<AnalyticsSendEventInternal(NSString const*,NSDictionary<NSString*,NSObject *> *({block_pointer})(void),XPCMessagePriority,EventPayloadFormat,NSDictionary<NSString*,NSObject *> *)::$_0,std::allocator<AnalyticsSendEventInternal(NSString const*,NSDictionary<NSString*,NSObject *> *({block_pointer})(void),XPCMessagePriority,EventPayloadFormat,NSDictionary<NSString*,NSObject *> *)::$_0>,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> ()(void)>::__clone(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_1EFE15A40;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t std::__function::__func<AnalyticsSendEventInternal(NSString const*,NSDictionary<NSString*,NSObject *> *({block_pointer})(void),XPCMessagePriority,EventPayloadFormat,NSDictionary<NSString*,NSObject *> *)::$_0,std::allocator<AnalyticsSendEventInternal(NSString const*,NSDictionary<NSString*,NSObject *> *({block_pointer})(void),XPCMessagePriority,EventPayloadFormat,NSDictionary<NSString*,NSObject *> *)::$_0>,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> ()(void)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<AnalyticsSendEventInternal(NSString const*,NSDictionary<NSString*,NSObject *> *({block_pointer})(void),XPCMessagePriority,EventPayloadFormat,NSDictionary<NSString*,NSObject *> *)::$_0,std::allocator<AnalyticsSendEventInternal(NSString const*,NSDictionary<NSString*,NSObject *> *({block_pointer})(void),XPCMessagePriority,EventPayloadFormat,NSDictionary<NSString*,NSObject *> *)::$_0>,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> ()(void)>::target_type()
{
}

void nlohmann::detail::exception::name(int a1@<W1>, std::string *a2@<X8>)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  std::operator+<char>();
  xpc_object_t v4 = std::string::append(&v12, ".");
  long long v5 = *(_OWORD *)&v4->__r_.__value_.__l.__data_;
  v13.__r_.__value_.__r.__words[2] = v4->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v13.__r_.__value_.__l.__data_ = v5;
  v4->__r_.__value_.__l.__size_ = 0;
  v4->__r_.__value_.__r.__words[2] = 0;
  v4->__r_.__value_.__r.__words[0] = 0;
  std::to_string(&__p, a1);
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
  id v8 = std::string::append(&v13, (const std::string::value_type *)p_p, size);
  long long v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
  v14.__r_.__value_.__r.__words[2] = v8->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v14.__r_.__value_.__l.__data_ = v9;
  v8->__r_.__value_.__l.__size_ = 0;
  v8->__r_.__value_.__r.__words[2] = 0;
  v8->__r_.__value_.__r.__words[0] = 0;
  char v10 = std::string::append(&v14, "] ");
  *a2 = *v10;
  v10->__r_.__value_.__l.__size_ = 0;
  v10->__r_.__value_.__r.__words[2] = 0;
  v10->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v14.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v13.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v12.__r_.__value_.__l.__data_);
  }
}

void sub_1A7C4D238(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  if (*(char *)(v26 - 41) < 0) {
    operator delete(*(void **)(v26 - 64));
  }
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a26 < 0) {
    operator delete(a21);
  }
  if (a20 < 0) {
    operator delete(a15);
  }
  _Unwind_Resume(exception_object);
}

nlohmann::detail::exception *nlohmann::detail::exception::exception(nlohmann::detail::exception *this, int a2, const char *a3)
{
  *(void *)this = &unk_1EFE15F38;
  *((_DWORD *)this + 2) = a2;
  MEMORY[0x1AD0D68A0]((char *)this + 16, a3);
  return this;
}

void sub_1A7C4D2F4(_Unwind_Exception *a1)
{
  std::exception::~exception(v1);
  _Unwind_Resume(a1);
}

const char *nlohmann::detail::exception::what(const std::runtime_error *this)
{
  return std::runtime_error::what(this + 1);
}

void nlohmann::detail::exception::~exception(std::exception *this)
{
  this->__vftable = (std::exception_vtbl *)&unk_1EFE15F38;
  MEMORY[0x1AD0D68C0](&this[2]);

  std::exception::~exception(this);
}

{
  uint64_t vars8;

  this->__vftable = (std::exception_vtbl *)&unk_1EFE15F38;
  MEMORY[0x1AD0D68C0](&this[2]);
  std::exception::~exception(this);

  JUMPOUT(0x1AD0D6A20);
}

void nlohmann::detail::type_error::create(int a1@<W0>, uint64_t a2@<X1>, nlohmann::detail::exception *a3@<X8>)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  std::string::basic_string[abi:ne180100]<0>(&__p, "type_error");
  nlohmann::detail::exception::name(a1, &v14);
  int v6 = *(char *)(a2 + 23);
  if (v6 >= 0) {
    xpc_object_t v7 = (const std::string::value_type *)a2;
  }
  else {
    xpc_object_t v7 = *(const std::string::value_type **)a2;
  }
  if (v6 >= 0) {
    std::string::size_type v8 = *(unsigned __int8 *)(a2 + 23);
  }
  else {
    std::string::size_type v8 = *(void *)(a2 + 8);
  }
  long long v9 = std::string::append(&v14, v7, v8);
  long long v10 = *(_OWORD *)&v9->__r_.__value_.__l.__data_;
  int64_t v16 = v9->__r_.__value_.__r.__words[2];
  *(_OWORD *)uint64_t v15 = v10;
  v9->__r_.__value_.__l.__size_ = 0;
  v9->__r_.__value_.__r.__words[2] = 0;
  v9->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v14.__r_.__value_.__l.__data_);
  }
  if (v13 < 0) {
    operator delete(__p);
  }
  if (v16 >= 0) {
    xpc_object_t v11 = v15;
  }
  else {
    xpc_object_t v11 = (void **)v15[0];
  }
  nlohmann::detail::exception::exception(a3, a1, (const char *)v11);
  *(void *)a3 = &unk_1EFE15E40;
  if (SHIBYTE(v16) < 0) {
    operator delete(v15[0]);
  }
}

void sub_1A7C4D4F4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  if (a26 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void nlohmann::detail::type_error::~type_error(std::exception *this)
{
  this->__vftable = (std::exception_vtbl *)&unk_1EFE15F38;
  MEMORY[0x1AD0D68C0](&this[2]);

  std::exception::~exception(this);
}

{
  uint64_t vars8;

  this->__vftable = (std::exception_vtbl *)&unk_1EFE15F38;
  MEMORY[0x1AD0D68C0](&this[2]);
  std::exception::~exception(this);

  JUMPOUT(0x1AD0D6A20);
}

uint64_t nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::operator[](uint64_t a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)a1 != 2)
  {
    exception = (nlohmann::detail::exception *)__cxa_allocate_exception(0x20uLL);
    long long v5 = (char *)nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::type_name((char *)a1);
    std::string::basic_string[abi:ne180100]<0>(&v8, v5);
    int v6 = std::string::insert(&v8, 0, "cannot use operator[] with a numeric argument with ");
    long long v7 = *(_OWORD *)&v6->__r_.__value_.__l.__data_;
    std::string::size_type v10 = v6->__r_.__value_.__r.__words[2];
    long long v9 = v7;
    v6->__r_.__value_.__l.__size_ = 0;
    v6->__r_.__value_.__r.__words[2] = 0;
    v6->__r_.__value_.__r.__words[0] = 0;
    nlohmann::detail::type_error::create(305, (uint64_t)&v9, exception);
  }
  return **(void **)(a1 + 8) + 16 * a2;
}

void sub_1A7C4D694(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a15 < 0)
  {
    operator delete(a10);
    if ((v22 & 1) == 0) {
LABEL_8:
    }
      _Unwind_Resume(a1);
  }
  else if (!v22)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v21);
  goto LABEL_8;
}

const char *nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::type_name(char *a1)
{
  unint64_t v1 = *a1;
  if (v1 > 9) {
    return "number";
  }
  else {
    return off_1E5D1EB88[v1];
  }
}

uint64_t nlohmann::detail::json_ref<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::moved_or_copied@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (*(unsigned char *)(a1 + 24))
  {
    *(unsigned char *)a2 = *(unsigned char *)v3;
    *(void *)(a2 + 8) = *(void *)(v3 + 8);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v3);
    *(unsigned char *)uint64_t v3 = 0;
    *(void *)(v3 + 8) = 0;
    return nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a2);
  }
  else
  {
    return nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json(a2, v3);
  }
}

uint64_t nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = 0;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a2);
  switch(*(unsigned char *)a1)
  {
    case 1:
      xpc_object_t v4 = (std::string *)nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::create<std::map<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::map<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>> const&>(*(const void ****)(a2 + 8));
      goto LABEL_8;
    case 2:
      xpc_object_t v4 = (std::string *)nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::create<std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>> const&>(*(uint64_t **)(a2 + 8));
      goto LABEL_8;
    case 3:
      xpc_object_t v4 = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::create<std::string,std::string const&>(*(void *)(a2 + 8));
      goto LABEL_8;
    case 4:
      xpc_object_t v4 = (std::string *)*(unsigned __int8 *)(a2 + 8);
      goto LABEL_8;
    case 5:
    case 6:
    case 7:
      xpc_object_t v4 = *(std::string **)(a2 + 8);
      goto LABEL_8;
    case 8:
      xpc_object_t v4 = (std::string *)nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::create<nlohmann::byte_container_with_subtype<std::vector<unsigned char>>,nlohmann::byte_container_with_subtype<std::vector<unsigned char>> const&>(*(void *)(a2 + 8));
LABEL_8:
      *(void *)(a1 + 8) = v4;
      break;
    default:
      break;
  }
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a1);
  return a1;
}

uint64_t *nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::create<std::map<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::map<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>> const&>(const void ***a1)
{
  xpc_object_t v2 = (uint64_t *)operator new(0x18uLL);
  std::map<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::map[abi:ne180100](v2, a1);
  return v2;
}

void sub_1A7C4D914(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t *std::map<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::map[abi:ne180100](uint64_t *a1, const void ***a2)
{
  a1[2] = 0;
  a1[1] = 0;
  *a1 = (uint64_t)(a1 + 1);
  std::map<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::insert[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__tree_node<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void *> *,long>>>(a1, *a2, a2 + 1);
  return a1;
}

void sub_1A7C4D968(_Unwind_Exception *a1)
{
  std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::destroy(v1, *(char **)(v1 + 8));
  _Unwind_Resume(a1);
}

uint64_t *std::map<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::insert[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__tree_node<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void *> *,long>>>(uint64_t *result, const void **a2, const void ***a3)
{
  if (a2 != (const void **)a3)
  {
    xpc_object_t v4 = a2;
    long long v5 = (uint64_t **)result;
    int v6 = result + 1;
    do
    {
      __n128 result = std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__emplace_hint_unique_key_args<std::string,std::pair<std::string const,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>> const&>(v5, v6, v4 + 4, (long long *)v4 + 2);
      long long v7 = (const void **)v4[1];
      if (v7)
      {
        do
        {
          std::string v8 = (const void ***)v7;
          long long v7 = (const void **)*v7;
        }
        while (v7);
      }
      else
      {
        do
        {
          std::string v8 = (const void ***)v4[2];
          BOOL v9 = *v8 == v4;
          xpc_object_t v4 = (const void **)v8;
        }
        while (!v9);
      }
      xpc_object_t v4 = (const void **)v8;
    }
    while (v8 != a3);
  }
  return result;
}

uint64_t *std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__emplace_hint_unique_key_args<std::string,std::pair<std::string const,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>> const&>(uint64_t **a1, uint64_t *a2, const void **a3, long long *a4)
{
  v10[3] = *(uint64_t **)MEMORY[0x1E4F143B8];
  uint64_t v8 = 0xAAAAAAAAAAAAAAAALL;
  BOOL v9 = (const void **)0xAAAAAAAAAAAAAAAALL;
  int v6 = (uint64_t **)std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__find_equal<std::string>(a1, a2, &v9, &v8, a3);
  __n128 result = *v6;
  if (!*v6)
  {
    memset(v10, 170, 24);
    std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__construct_node<std::pair<std::string const,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>> const&>((uint64_t)a1, a4, v10);
    std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__insert_node_at(a1, (uint64_t)v9, v6, v10[0]);
    return v10[0];
  }
  return result;
}

const void **std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__find_equal<std::string>(void *a1, uint64_t *a2, const void ***a3, uint64_t *a4, const void **a5)
{
  BOOL v9 = (const void **)(a1 + 1);
  if (a1 + 1 != a2
    && !std::less<void>::operator()[abi:ne180100]<std::string const&,std::string const&>((uint64_t)(a1 + 2), a5, (const void **)a2 + 4))
  {
    if (!std::less<void>::operator()[abi:ne180100]<std::string const&,std::string const&>((uint64_t)(a1 + 2), (const void **)a2 + 4, a5))
    {
      *a3 = (const void **)a2;
      *a4 = (uint64_t)a2;
      return (const void **)a4;
    }
    a4 = a2 + 1;
    uint64_t v13 = a2[1];
    if (v13)
    {
      std::string v14 = (const void **)a2[1];
      do
      {
        uint64_t v15 = v14;
        std::string v14 = (const void **)*v14;
      }
      while (v14);
    }
    else
    {
      uint64_t v18 = (const void **)a2;
      do
      {
        uint64_t v15 = (const void **)v18[2];
        BOOL v17 = *v15 == v18;
        uint64_t v18 = v15;
      }
      while (!v17);
    }
    if (v15 != v9)
    {
      if (!std::less<void>::operator()[abi:ne180100]<std::string const&,std::string const&>((uint64_t)(a1 + 2), a5, v15 + 4))goto LABEL_28; {
      uint64_t v13 = *a4;
      }
    }
    if (v13)
    {
      *a3 = v15;
      return v15;
    }
    else
    {
      *a3 = (const void **)a2;
    }
    return (const void **)a4;
  }
  if ((uint64_t *)*a1 == a2)
  {
    std::string v12 = (const void **)a2;
LABEL_16:
    if (*a2)
    {
      *a3 = v12;
      return v12 + 1;
    }
    else
    {
      *a3 = (const void **)a2;
      return (const void **)a2;
    }
  }
  uint64_t v11 = (const void **)*a2;
  if (*a2)
  {
    do
    {
      std::string v12 = v11;
      uint64_t v11 = (const void **)v11[1];
    }
    while (v11);
  }
  else
  {
    int64_t v16 = a2;
    do
    {
      std::string v12 = (const void **)v16[2];
      BOOL v17 = *v12 == v16;
      int64_t v16 = (uint64_t *)v12;
    }
    while (v17);
  }
  if (std::less<void>::operator()[abi:ne180100]<std::string const&,std::string const&>((uint64_t)(a1 + 2), v12 + 4, a5)) {
    goto LABEL_16;
  }
LABEL_28:

  return (const void **)std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__find_equal<std::string>((uint64_t)a1, a3, a5);
}

std::string *std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__construct_node<std::pair<std::string const,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>> const&>@<X0>(uint64_t a1@<X0>, long long *a2@<X1>, void *a3@<X8>)
{
  uint64_t v5 = a1 + 8;
  memset(a3, 170, 24);
  int v6 = (char *)operator new(0x48uLL);
  *a3 = v6;
  a3[1] = v5;
  *((unsigned char *)a3 + 16) = 0;
  __n128 result = std::pair<std::string const,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::pair[abi:ne180100]((std::string *)(v6 + 32), a2);
  *((unsigned char *)a3 + 16) = 1;
  return result;
}

void sub_1A7C4DCEC(_Unwind_Exception *a1)
{
  *uint64_t v1 = 0;
  std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void *>>>::operator()[abi:ne180100](v2, v3);
  _Unwind_Resume(a1);
}

std::string *std::pair<std::string const,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::pair[abi:ne180100](std::string *this, long long *a2)
{
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v4 = *a2;
    this->__r_.__value_.__r.__words[2] = *((void *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v4;
  }
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json(&this[1], (char *)a2 + 24);
  return this;
}

void sub_1A7C4DD64(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void *>>>::operator()[abi:ne180100](uint64_t a1, void *__p)
{
  if (*(unsigned char *)(a1 + 8)) {
    std::allocator_traits<std::allocator<std::__tree_node<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void *>>>::destroy[abi:ne180100]<std::pair<std::string const,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void,void>(*(void *)a1, (uint64_t)__p + 32);
  }
  if (__p)
  {
    operator delete(__p);
  }
}

void std::allocator_traits<std::allocator<std::__tree_node<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void *>>>::destroy[abi:ne180100]<std::pair<std::string const,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void,void>(uint64_t a1, uint64_t a2)
{
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a2 + 24);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)(a2 + 32), *(unsigned __int8 *)(a2 + 24));
  if (*(char *)(a2 + 23) < 0)
  {
    uint64_t v3 = *(void **)a2;
    operator delete(v3);
  }
}

void *nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::create<std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>> const&>(uint64_t *a1)
{
  uint64_t v2 = operator new(0x18uLL);
  v2[1] = 0;
  _DWORD v2[2] = 0;
  void *v2 = 0;
  std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__init_with_size[abi:ne180100]<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>(v2, *a1, a1[1], (a1[1] - *a1) >> 4);
  return v2;
}

void sub_1A7C4DE80(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__init_with_size[abi:ne180100]<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>(void *result, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    int v6 = result;
    std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__vallocate[abi:ne180100](result, a4);
    __n128 result = (void *)std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>((uint64_t)(v6 + 2), a2, a3, v6[1]);
    v6[1] = result;
  }
  return result;
}

void sub_1A7C4DF2C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  *(void *)(v2 + 8) = v3;
  std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  _Unwind_Resume(a1);
}

char *std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 60) {
    std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
  }
  __n128 result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[16 * v4];
  return result;
}

void std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]()
{
}

uint64_t std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = a4;
  uint64_t v9 = a4;
  v10[0] = a1;
  v10[1] = &v8;
  v10[2] = &v9;
  unint64_t v11 = 0xAAAAAAAAAAAAAA00;
  if (a2 != a3)
  {
    uint64_t v6 = a2;
    do
    {
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json(v4, v6);
      v6 += 16;
      uint64_t v4 = v9 + 16;
      v9 += 16;
    }
    while (v6 != a3);
  }
  LOBYTE(v11) = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v10);
  return v4;
}

void sub_1A7C4E068(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::__allocator_destroy[abi:ne180100]<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::reverse_iterator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>,std::reverse_iterator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>>(*(void *)a1, **(void **)(a1 + 16), **(void **)(a1 + 16), **(void **)(a1 + 8), **(void **)(a1 + 8));
  }
  return a1;
}

void std::__allocator_destroy[abi:ne180100]<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::reverse_iterator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>,std::reverse_iterator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a3 != a5)
  {
    uint64_t v6 = a3 - 16;
    long long v7 = (unsigned __int8 *)(a3 - 16);
    do
    {
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v6);
      int v8 = *v7;
      v7 -= 16;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)(v6 + 8), v8);
      BOOL v9 = v6 == a5;
      uint64_t v6 = (uint64_t)v7;
    }
    while (!v9);
  }
}

std::string *nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::create<std::string,std::string const&>(uint64_t a1)
{
  uint64_t v2 = (std::string *)operator new(0x18uLL);
  uint64_t v3 = v2;
  if (*(char *)(a1 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v2, *(const std::string::value_type **)a1, *(void *)(a1 + 8));
  }
  else
  {
    *(_OWORD *)&v2->__r_.__value_.__l.__data_ = *(_OWORD *)a1;
    v2->__r_.__value_.__r.__words[2] = *(void *)(a1 + 16);
  }
  return v3;
}

void sub_1A7C4E17C(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::create<nlohmann::byte_container_with_subtype<std::vector<unsigned char>>,nlohmann::byte_container_with_subtype<std::vector<unsigned char>> const&>(uint64_t a1)
{
  uint64_t v2 = operator new(0x20uLL);
  v2[1] = 0;
  _DWORD v2[2] = 0;
  void *v2 = 0;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(v2, *(const void **)a1, *(void *)(a1 + 8), *(void *)(a1 + 8) - *(void *)a1);
  *((_WORD *)v2 + 12) = *(_WORD *)(a1 + 24);
  return v2;
}

void sub_1A7C4E1DC(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(void *result, const void *a2, uint64_t a3, size_t __sz)
{
  if (__sz)
  {
    uint64_t v6 = result;
    __n128 result = std::vector<unsigned char>::__vallocate[abi:ne180100](result, __sz);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      __n128 result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_1A7C4E250(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<unsigned char>::__vallocate[abi:ne180100](void *a1, size_t __sz)
{
  if ((__sz & 0x8000000000000000) != 0) {
    std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
  }
  __n128 result = (char *)operator new(__sz);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[__sz];
  return result;
}

uint64_t *std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__emplace_unique_key_args<std::string,std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>(uint64_t **a1, const void **a2, uint64_t a3, uint64_t a4)
{
  void v10[3] = *(uint64_t **)MEMORY[0x1E4F143B8];
  uint64_t v9 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v7 = (uint64_t **)std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__find_equal<std::string>((uint64_t)a1, &v9, a2);
  __n128 result = *v7;
  if (!*v7)
  {
    memset(v10, 170, 24);
    std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__construct_node<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>((uint64_t)a1, a3, a4, v10);
    std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__insert_node_at(a1, v9, v7, v10[0]);
    return v10[0];
  }
  return result;
}

uint64_t std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__construct_node<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  uint64_t v7 = a1 + 8;
  memset(a4, 170, 24);
  size_t v8 = operator new(0x48uLL);
  *a4 = v8;
  a4[1] = v7;
  void v8[2] = *(_OWORD *)a2;
  *((void *)v8 + 6) = *(void *)(a2 + 16);
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  char v9 = *(unsigned char *)a3;
  *((void *)v8 + 8) = *(void *)(a3 + 8);
  *((unsigned char *)v8 + 56) = v9;
  uint64_t v10 = (uint64_t)v8 + 56;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a3);
  *(unsigned char *)a3 = 0;
  *(void *)(a3 + 8) = 0;
  uint64_t result = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v10);
  *((unsigned char *)a4 + 16) = 1;
  return result;
}

uint64_t std::_AllocatorDestroyRangeReverse<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::reverse_iterator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>>::operator()[abi:ne180100](uint64_t *a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = (uint64_t *)a1[2];
  uint64_t v3 = *v1;
  uint64_t v2 = v1[1];
  uint64_t v15 = v3;
  uint64_t v16 = v2;
  uint64_t v17 = v3;
  uint64_t v18 = v2;
  uint64_t v4 = *a1;
  uint64_t v5 = (uint64_t *)a1[1];
  uint64_t v7 = *v5;
  uint64_t v6 = v5[1];
  uint64_t v10 = v7;
  uint64_t v11 = v6;
  uint64_t v12 = v7;
  uint64_t v13 = v6;
  return std::__allocator_destroy[abi:ne180100]<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::reverse_iterator<std::reverse_iterator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>>,std::reverse_iterator<std::reverse_iterator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>>>(v4, (uint64_t)v14, (uint64_t)v9);
}

uint64_t std::__allocator_destroy[abi:ne180100]<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::reverse_iterator<std::reverse_iterator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>>,std::reverse_iterator<std::reverse_iterator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>>>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  for (size_t i = *(unsigned __int8 **)(a2 + 32); i != *(unsigned __int8 **)(a3 + 32); *(void *)(a2 + 32) = i)
  {
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)i);
    uint64_t result = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(i + 8, *i);
    size_t i = (unsigned __int8 *)(*(void *)(a2 + 32) + 16);
  }
  return result;
}

uint64_t std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__push_back_slow_path<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>(uint64_t *a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  uint64_t v4 = (a1[1] - *a1) >> 4;
  unint64_t v5 = v4 + 1;
  if ((unint64_t)(v4 + 1) >> 60) {
    std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
  }
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = (uint64_t)(a1 + 2);
  uint64_t v8 = a1[2] - v3;
  if (v8 >> 3 > v5) {
    unint64_t v5 = v8 >> 3;
  }
  if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFF0) {
    unint64_t v9 = 0xFFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v9 = v5;
  }
  uint64_t v17 = a1 + 2;
  uint64_t v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>(v7, v9);
  uint64_t v11 = (uint64_t)&v10[16 * v4];
  *(void *)&long long v15 = v10;
  *((void *)&v15 + 1) = v11;
  *((void *)&v16 + 1) = &v10[16 * v12];
  *(unsigned char *)uint64_t v11 = *(unsigned char *)a2;
  *(void *)(v11 + 8) = *(void *)(a2 + 8);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a2);
  *(unsigned char *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v11);
  *(void *)&long long v16 = v11 + 16;
  std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__swap_out_circular_buffer(a1, &v15);
  uint64_t v13 = a1[1];
  std::__split_buffer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::~__split_buffer((uint64_t)&v15);
  return v13;
}

void sub_1A7C4E624(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,nlohmann::detail::json_ref<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>> const*,nlohmann::detail::json_ref<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>> const*,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = a4;
  uint64_t v9 = a4;
  v10[0] = a1;
  v10[1] = &v8;
  v10[2] = &v9;
  unint64_t v11 = 0xAAAAAAAAAAAAAA00;
  if (a2 != a3)
  {
    uint64_t v6 = a2;
    do
    {
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<nlohmann::detail::json_ref<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,0>(v4, v6);
      v6 += 32;
      uint64_t v4 = v9 + 16;
      v9 += 16;
    }
    while (v6 != a3);
  }
  LOBYTE(v11) = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v10);
  return v4;
}

void sub_1A7C4E6F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<nlohmann::detail::json_ref<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,0>(uint64_t a1, uint64_t a2)
{
  v5[1] = *(uint64_t **)MEMORY[0x1E4F143B8];
  nlohmann::detail::json_ref<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::moved_or_copied(a2, (uint64_t)v4);
  *(unsigned char *)a1 = v4[0];
  *(uint64_t **)(a1 + 8) = v5[0];
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v4);
  v4[0] = 0;
  v5[0] = 0;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a1);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v4);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(v5, v4[0]);
  return a1;
}

BOOL std::type_info::operator==[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a2 + 8);
  if (v2 == v3) {
    return 1;
  }
  if ((v3 & v2) < 0 != __OFSUB__(v2, v3)) {
    return strcmp((const char *)(v2 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL)) == 0;
  }
  return 0;
}

void std::__shared_ptr_emplace<nlohmann::detail::output_string_adapter<char,std::string>>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EFE160E0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<nlohmann::detail::output_string_adapter<char,std::string>>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EFE160E0;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x1AD0D6A20);
}

void nlohmann::detail::output_string_adapter<char,std::string>::~output_string_adapter()
{
}

uint64_t nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_integer<unsigned char,0>(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return (***(uint64_t (****)(void, uint64_t))a1)(*(void *)a1, 48);
  }
  LOBYTE(v2) = a2;
  if (a2 >= 0xA)
  {
    if (a2 >= 0x64)
    {
      *(_WORD *)(a1 + 17) = nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_integer<unsigned char,0>(unsigned char)::digits_to_99[(a2 - 100 * ((41 * a2) >> 12))];
      uint64_t v5 = a1 + 17;
      unsigned int v2 = (41 * a2) >> 12;
      goto LABEL_10;
    }
    uint64_t v3 = 2;
  }
  else
  {
    uint64_t v3 = 1;
  }
  uint64_t v5 = a1 + 16 + v3;
  if (a2 < 0xA)
  {
LABEL_10:
    *(unsigned char *)(v5 - 1) = v2 | 0x30;
    return (*(uint64_t (**)(void))(**(void **)a1 + 8))();
  }
  *(_WORD *)(v5 - 2) = nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_integer<unsigned char,0>(unsigned char)::digits_to_99[a2];
  return (*(uint64_t (**)(void))(**(void **)a1 + 8))();
}

void std::__function::__func<analytics_send_event_internal(char const*,NSObject  {objcproto13OS_xpc_object}* {ns_returns_retained}({block_pointer})(void),XPCMessagePriority,EventPayloadFormat,NSObject  {objcproto13OS_xpc_object}*)::$_0,std::allocator<EventPayloadFormat>,nlohmann::basic_json<std::map,std::vector,std::basic_string<char,std::char_traits<char>,analytics_send_event_internal(char const*,NSObject  {objcproto13OS_xpc_object}* {ns_returns_retained}({block_pointer})(void),XPCMessagePriority,EventPayloadFormat,NSObject  {objcproto13OS_xpc_object}*)::$_0<char>>,BOOL,long long,unsigned long long,double,analytics_send_event_internal(char const*,NSObject  {objcproto13OS_xpc_object}* {ns_returns_retained}({block_pointer})(void),XPCMessagePriority,EventPayloadFormat,NSObject  {objcproto13OS_xpc_object}*)::$_0,std::allocator<EventPayloadFormat>::adl_serializer,std::map<unsigned char,analytics_send_event_internal(char const*,NSObject  {objcproto13OS_xpc_object}* {ns_returns_retained}({block_pointer})(void),XPCMessagePriority,EventPayloadFormat,NSObject  {objcproto13OS_xpc_object}*)::$_0<unsigned char>>> ()(void)>::~__func()
{
}

__n128 std::__function::__func<analytics_send_event_internal(char const*,NSObject  {objcproto13OS_xpc_object}* {ns_returns_retained}({block_pointer})(void),XPCMessagePriority,EventPayloadFormat,NSObject  {objcproto13OS_xpc_object}*)::$_0,std::allocator<EventPayloadFormat>,nlohmann::basic_json<std::map,std::vector,std::basic_string<char,std::char_traits<char>,analytics_send_event_internal(char const*,NSObject  {objcproto13OS_xpc_object}* {ns_returns_retained}({block_pointer})(void),XPCMessagePriority,EventPayloadFormat,NSObject  {objcproto13OS_xpc_object}*)::$_0<char>>,BOOL,long long,unsigned long long,double,analytics_send_event_internal(char const*,NSObject  {objcproto13OS_xpc_object}* {ns_returns_retained}({block_pointer})(void),XPCMessagePriority,EventPayloadFormat,NSObject  {objcproto13OS_xpc_object}*)::$_0,std::allocator<EventPayloadFormat>::adl_serializer,std::map<unsigned char,analytics_send_event_internal(char const*,NSObject  {objcproto13OS_xpc_object}* {ns_returns_retained}({block_pointer})(void),XPCMessagePriority,EventPayloadFormat,NSObject  {objcproto13OS_xpc_object}*)::$_0<unsigned char>>> ()(void)>::__clone(uint64_t a1)
{
  unsigned int v2 = (char *)operator new(0x18uLL);
  *(void *)unsigned int v2 = &unk_1EFE15A98;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 std::__function::__func<analytics_send_event_internal(char const*,NSObject  {objcproto13OS_xpc_object}* {ns_returns_retained}({block_pointer})(void),XPCMessagePriority,EventPayloadFormat,NSObject  {objcproto13OS_xpc_object}*)::$_0,std::allocator<EventPayloadFormat>,nlohmann::basic_json<std::map,std::vector,std::basic_string<char,std::char_traits<char>,analytics_send_event_internal(char const*,NSObject  {objcproto13OS_xpc_object}* {ns_returns_retained}({block_pointer})(void),XPCMessagePriority,EventPayloadFormat,NSObject  {objcproto13OS_xpc_object}*)::$_0<char>>,BOOL,long long,unsigned long long,double,analytics_send_event_internal(char const*,NSObject  {objcproto13OS_xpc_object}* {ns_returns_retained}({block_pointer})(void),XPCMessagePriority,EventPayloadFormat,NSObject  {objcproto13OS_xpc_object}*)::$_0,std::allocator<EventPayloadFormat>::adl_serializer,std::map<unsigned char,analytics_send_event_internal(char const*,NSObject  {objcproto13OS_xpc_object}* {ns_returns_retained}({block_pointer})(void),XPCMessagePriority,EventPayloadFormat,NSObject  {objcproto13OS_xpc_object}*)::$_0<unsigned char>>> ()(void)>::__clone(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_1EFE15A98;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t std::__function::__func<analytics_send_event_internal(char const*,NSObject  {objcproto13OS_xpc_object}* {ns_returns_retained}({block_pointer})(void),XPCMessagePriority,EventPayloadFormat,NSObject  {objcproto13OS_xpc_object}*)::$_0,std::allocator<EventPayloadFormat>,nlohmann::basic_json<std::map,std::vector,std::basic_string<char,std::char_traits<char>,analytics_send_event_internal(char const*,NSObject  {objcproto13OS_xpc_object}* {ns_returns_retained}({block_pointer})(void),XPCMessagePriority,EventPayloadFormat,NSObject  {objcproto13OS_xpc_object}*)::$_0<char>>,BOOL,long long,unsigned long long,double,analytics_send_event_internal(char const*,NSObject  {objcproto13OS_xpc_object}* {ns_returns_retained}({block_pointer})(void),XPCMessagePriority,EventPayloadFormat,NSObject  {objcproto13OS_xpc_object}*)::$_0,std::allocator<EventPayloadFormat>::adl_serializer,std::map<unsigned char,analytics_send_event_internal(char const*,NSObject  {objcproto13OS_xpc_object}* {ns_returns_retained}({block_pointer})(void),XPCMessagePriority,EventPayloadFormat,NSObject  {objcproto13OS_xpc_object}*)::$_0<unsigned char>>> ()(void)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<analytics_send_event_internal(char const*,NSObject  {objcproto13OS_xpc_object}* {ns_returns_retained}({block_pointer})(void),XPCMessagePriority,EventPayloadFormat,NSObject  {objcproto13OS_xpc_object}*)::$_0,std::allocator<EventPayloadFormat>,nlohmann::basic_json<std::map,std::vector,std::basic_string<char,std::char_traits<char>,analytics_send_event_internal(char const*,NSObject  {objcproto13OS_xpc_object}* {ns_returns_retained}({block_pointer})(void),XPCMessagePriority,EventPayloadFormat,NSObject  {objcproto13OS_xpc_object}*)::$_0<char>>,BOOL,long long,unsigned long long,double,analytics_send_event_internal(char const*,NSObject  {objcproto13OS_xpc_object}* {ns_returns_retained}({block_pointer})(void),XPCMessagePriority,EventPayloadFormat,NSObject  {objcproto13OS_xpc_object}*)::$_0,std::allocator<EventPayloadFormat>::adl_serializer,std::map<unsigned char,analytics_send_event_internal(char const*,NSObject  {objcproto13OS_xpc_object}* {ns_returns_retained}({block_pointer})(void),XPCMessagePriority,EventPayloadFormat,NSObject  {objcproto13OS_xpc_object}*)::$_0<unsigned char>>> ()(void)>::target_type()
{
}

void sub_1A7C4EB40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7C4ECF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7C4F09C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<anonymous namespace'::EventObserverImpl>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EFE16070;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<anonymous namespace'::EventObserverImpl>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EFE16070;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x1AD0D6A20);
}

uint64_t std::__shared_ptr_emplace<anonymous namespace'::EventObserverImpl>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void anonymous namespace'::EventObserverImpl::~EventObserverImpl(id *this)
{
  objc_destroyWeak(this + 2);
  objc_destroyWeak(this + 1);

  CoreAnalytics::EventObserver::~EventObserver((CoreAnalytics::EventObserver *)this);
}

{
  uint64_t vars8;

  objc_destroyWeak(this + 2);
  objc_destroyWeak(this + 1);
  CoreAnalytics::EventObserver::~EventObserver((CoreAnalytics::EventObserver *)this);

  JUMPOUT(0x1AD0D6A20);
}

void anonymous namespace'::EventObserverImpl::notifyMessageEmitted(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)(a1 + 8));
    uint64_t v6 = NSString;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::dump(a2, 4, 0x20u, 0, 0, __p);
    if (v17 >= 0) {
      uint64_t v7 = __p;
    }
    else {
      uint64_t v7 = (void **)__p[0];
    }
    uint64_t v8 = [v6 stringWithUTF8String:v7];
    if (v17 < 0) {
      operator delete(__p[0]);
    }
    uint64_t v9 = *(NSObject **)(a1 + 24);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = ___ZN12_GLOBAL__N_117EventObserverImpl20notifyMessageEmittedEN8nlohmann10basic_jsonINSt3__13mapENS3_6vectorENS3_12basic_stringIcNS3_11char_traitsIcEENS3_9allocatorIcEEEEbxydS9_NS1_14adl_serializerENS5_IhNS9_IhEEEEEE_block_invoke;
    block[3] = &unk_1E5D1EBE0;
    id v13 = WeakRetained;
    id v14 = v5;
    id v15 = v8;
    id v10 = v8;
    id v11 = v5;
    dispatch_barrier_async(v9, block);
  }
}

void sub_1A7C4F3D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  if (a22 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

uint64_t ___ZN12_GLOBAL__N_117EventObserverImpl20notifyMessageEmittedEN8nlohmann10basic_jsonINSt3__13mapENS3_6vectorENS3_12basic_stringIcNS3_11char_traitsIcEENS3_9allocatorIcEEEEbxydS9_NS1_14adl_serializerENS5_IhNS9_IhEEEEEE_block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) observer:*(void *)(a1 + 40) didEmitMessage:*(void *)(a1 + 48)];
}

id makeNSObjectFromJson(unsigned __int8 *a1)
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  int v2 = *a1;
  if (v2 == 6)
  {
    id v5 = NSNumber;
    __p.__r_.__value_.__r.__words[0] = 0xAAAAAAAAAAAAAAAALL;
    nlohmann::detail::get_arithmetic_value<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,unsigned long long,0>(a1, (unint64_t *)&__p);
    uint64_t v4 = [v5 numberWithUnsignedLongLong:__p.__r_.__value_.__r.__words[0]];
    goto LABEL_7;
  }
  if (v2 == 4)
  {
    uint64_t v3 = NSNumber;
    __p.__r_.__value_.__s.__data_[0] = -86;
    nlohmann::detail::from_json<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>((char *)a1, &__p);
    uint64_t v4 = [v3 numberWithBool:__p.__r_.__value_.__s.__data_[0]];
LABEL_7:
    uint64_t v7 = (void *)v4;
    goto LABEL_8;
  }
  if ((v2 - 5) <= 1)
  {
    uint64_t v6 = NSNumber;
    __p.__r_.__value_.__r.__words[0] = 0xAAAAAAAAAAAAAAAALL;
    nlohmann::detail::get_arithmetic_value<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,long long,0>(a1, (uint64_t *)&__p);
    uint64_t v4 = [v6 numberWithLongLong:__p.__r_.__value_.__r.__words[0]];
    goto LABEL_7;
  }
  uint64_t v7 = 0;
  switch(*a1)
  {
    case 0u:
      uint64_t v4 = [MEMORY[0x1E4F1CA98] null];
      goto LABEL_7;
    case 1u:
      int64x2_t v70 = 0uLL;
      v71[0] = 0;
      v69 = 0;
      int64x2_t v68 = 0uLL;
      std::vector<NSString * {__strong}>::reserve((char **)&v70, *(void *)(*((void *)a1 + 1) + 16));
      unint64_t v10 = *a1;
      if (*a1)
      {
        if (v10 == 1)
        {
          unint64_t v10 = *(void *)(*((void *)a1 + 1) + 16);
        }
        else if (v10 == 2)
        {
          unint64_t v10 = (uint64_t)(*(void *)(*((void *)a1 + 1) + 8) - **((void **)a1 + 1)) >> 4;
        }
        else
        {
          unint64_t v10 = 1;
        }
      }
      std::vector<NSString * {__strong}>::reserve((char **)&v68, v10);
      unint64_t v48 = &v69;
      unint64_t v67 = a1;
      nlohmann::detail::iteration_proxy<nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>>::begin((uint64_t *)&v67, (uint64_t)&__p);
      nlohmann::detail::iteration_proxy<nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>>::end((uint64_t *)&v67, (uint64_t)v56);
      while (!nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>::operator==((unsigned __int8 **)&__p, v56))
      {
        *(void *)&long long v13 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
        *(_OWORD *)v55 = v13;
        *(_OWORD *)&v55[16] = v13;
        long long v54 = v13;
        std::string v51 = __p;
        long long v52 = v61;
        long long v53 = v62;
        if (SHIBYTE(v64) < 0)
        {
          std::string::__init_copy_ctor_external((std::string *)&v54, (const std::string::value_type *)v63, *((std::string::size_type *)&v63 + 1));
        }
        else
        {
          long long v54 = v63;
          *(void *)v55 = v64;
        }
        if (SHIBYTE(v66) < 0)
        {
          std::string::__init_copy_ctor_external((std::string *)&v55[8], (const std::string::value_type *)v65, *((std::string::size_type *)&v65 + 1));
        }
        else
        {
          *(_OWORD *)&v55[8] = v65;
          *(void *)&v55[24] = v66;
        }
        id v14 = NSString;
        uint64_t v15 = nlohmann::detail::iteration_proxy_value<nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>>::key((unsigned __int8 **)&v51);
        if (*(char *)(v15 + 23) >= 0) {
          uint64_t v16 = v15;
        }
        else {
          uint64_t v16 = *(void *)v15;
        }
        uint64_t v17 = objc_msgSend(v14, "stringWithUTF8String:", v16, v48);
        uint64_t v18 = v17;
        uint64_t v19 = v70.i64[1];
        if (v70.i64[1] >= v71[0])
        {
          uint64_t v21 = (v70.i64[1] - v70.i64[0]) >> 3;
          if ((unint64_t)(v21 + 1) >> 61) {
            std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
          }
          unint64_t v22 = (v71[0] - v70.i64[0]) >> 2;
          if (v22 <= v21 + 1) {
            unint64_t v22 = v21 + 1;
          }
          if (v71[0] - v70.i64[0] >= 0x7FFFFFFFFFFFFFF8uLL) {
            unint64_t v23 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v23 = v22;
          }
          v75 = (char **)v71;
          if (v23) {
            uint64_t v24 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<NSString * {__strong}>>((uint64_t)v71, v23);
          }
          else {
            uint64_t v24 = 0;
          }
          xpc_object_t v25 = (uint64_t *)&v24[8 * v21];
          uint64_t v26 = &v24[8 * v23];
          v74 = v26;
          uint64_t *v25 = v18;
          uint64_t v20 = v25 + 1;
          v73.i64[1] = (uint64_t)(v25 + 1);
          uint64_t v27 = (void *)v70.i64[1];
          xpc_object_t v28 = (void *)v70.i64[0];
          if (v70.i64[1] == v70.i64[0])
          {
            int64x2_t v30 = vdupq_n_s64(v70.u64[1]);
          }
          else
          {
            do
            {
              uint64_t v29 = *--v27;
              void *v27 = 0;
              *--xpc_object_t v25 = v29;
            }
            while (v27 != v28);
            int64x2_t v30 = v70;
            uint64_t v20 = (void *)v73.i64[1];
            uint64_t v26 = v74;
          }
          v70.i64[0] = (uint64_t)v25;
          v70.i64[1] = (uint64_t)v20;
          int64x2_t v73 = v30;
          uint64_t v31 = (char *)v71[0];
          v71[0] = v26;
          v74 = v31;
          uint64_t v72 = v30.i64[0];
          std::__split_buffer<NSString * {__strong}>::~__split_buffer((uint64_t)&v72);
        }
        else
        {
          *(void *)v70.i64[1] = v17;
          uint64_t v20 = (void *)(v19 + 8);
        }
        v70.i64[1] = (uint64_t)v20;
        char v32 = nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>::operator*((unsigned __int8 **)&v51);
        uint64_t v33 = makeNSObjectFromJson(v32);
        uint64_t v34 = v33;
        uint64_t v35 = v68.i64[1];
        if (v68.i64[1] >= (unint64_t)v69)
        {
          uint64_t v37 = (v68.i64[1] - v68.i64[0]) >> 3;
          if ((unint64_t)(v37 + 1) >> 61) {
            std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
          }
          unint64_t v38 = (uint64_t)&v69[-v68.i64[0]] >> 2;
          if (v38 <= v37 + 1) {
            unint64_t v38 = v37 + 1;
          }
          if ((unint64_t)&v69[-v68.i64[0]] >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v39 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v39 = v38;
          }
          v75 = v48;
          if (v39) {
            int v40 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<NSString * {__strong}>>((uint64_t)v48, v39);
          }
          else {
            int v40 = 0;
          }
          id v41 = (uint64_t *)&v40[8 * v37];
          xpc_object_t v42 = &v40[8 * v39];
          v74 = v42;
          uint64_t *v41 = v34;
          int v36 = v41 + 1;
          v73.i64[1] = (uint64_t)(v41 + 1);
          uint64_t v43 = (void *)v68.i64[1];
          unint64_t v44 = (void *)v68.i64[0];
          if (v68.i64[1] == v68.i64[0])
          {
            int64x2_t v46 = vdupq_n_s64(v68.u64[1]);
          }
          else
          {
            do
            {
              uint64_t v45 = *--v43;
              *uint64_t v43 = 0;
              *--id v41 = v45;
            }
            while (v43 != v44);
            int64x2_t v46 = v68;
            int v36 = (void *)v73.i64[1];
            xpc_object_t v42 = v74;
          }
          v68.i64[0] = (uint64_t)v41;
          v68.i64[1] = (uint64_t)v36;
          int64x2_t v73 = v46;
          uint64_t v47 = v69;
          v69 = v42;
          v74 = v47;
          uint64_t v72 = v46.i64[0];
          std::__split_buffer<NSString * {__strong}>::~__split_buffer((uint64_t)&v72);
        }
        else
        {
          *(void *)v68.i64[1] = v33;
          int v36 = (void *)(v35 + 8);
        }
        v68.i64[1] = (uint64_t)v36;
        if ((v55[31] & 0x80000000) != 0) {
          operator delete(*(void **)&v55[8]);
        }
        if ((v55[7] & 0x80000000) != 0) {
          operator delete((void *)v54);
        }
        nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>::operator++((unsigned __int8 **)&__p);
        *(void *)&long long v62 = v62 + 1;
      }
      if (v59 < 0) {
        operator delete(v58);
      }
      if (v57 < 0) {
        operator delete(v56[7]);
      }
      if (SHIBYTE(v66) < 0) {
        operator delete((void *)v65);
      }
      if (SHIBYTE(v64) < 0) {
        operator delete((void *)v63);
      }
      uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v48);
      __p.__r_.__value_.__r.__words[0] = (std::string::size_type)&v68;
      std::vector<NSString * {__strong}>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
      __p.__r_.__value_.__r.__words[0] = (std::string::size_type)&v70;
      std::vector<NSString * {__strong}>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
      break;
    case 2u:
      memset(&__p, 0, sizeof(__p));
      std::vector<NSString * {__strong}>::reserve(&__p.__r_.__value_.__l.__data_, (uint64_t)(*(void *)(*((void *)a1 + 1) + 8) - **((void **)a1 + 1)) >> 4);
      v50[0] = a1;
      memset(&v50[1], 0, 24);
      v50[4] = (unsigned __int8 *)0x8000000000000000;
      nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>::set_begin(v50);
      v49[0] = a1;
      memset(&v49[1], 0, 24);
      v49[4] = (unsigned __int8 *)0x8000000000000000;
      nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>::set_end(v49);
      v56[0] = (unsigned __int8 *)&__p;
      while (!nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>::operator==(v50, v49))
      {
        uint64_t v9 = nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>::operator*(v50);
        v51.__r_.__value_.__r.__words[0] = makeNSObjectFromJson(v9);
        std::back_insert_iterator<std::vector<NSObject * {__strong}>>::operator=[abi:ne180100]((char ***)v56, (uint64_t *)&v51);

        nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>::operator++(v50);
      }
      uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:");
      v56[0] = (unsigned __int8 *)&__p;
      std::vector<NSString * {__strong}>::__destroy_vector::operator()[abi:ne180100]((void ***)v56);
      break;
    case 3u:
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::get<std::string,std::string,0>((uint64_t)a1, &__p);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        p_p = &__p;
      }
      else {
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      }
      uint64_t v7 = [NSString stringWithUTF8String:p_p];
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      break;
    case 7u:
      uint64_t v12 = NSNumber;
      __p.__r_.__value_.__r.__words[0] = -1;
      nlohmann::detail::get_arithmetic_value<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,double,0>(a1, (double *)&__p);
      uint64_t v4 = [v12 numberWithDouble:*(double *)&__p.__r_.__value_.__l.__data_];
      goto LABEL_7;
    default:
      break;
  }
LABEL_8:

  return v7;
}

void sub_1A7C4FAF8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,void *__p,uint64_t a51,int a52,__int16 a53,char a54,char a55)
{
  if (a55 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::vector<NSString * {__strong}>::reserve(char **a1, unint64_t a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = a1[2];
  uint64_t result = (uint64_t)(a1 + 2);
  if (a2 > (v4 - *a1) >> 3)
  {
    if (a2 >> 61) {
      std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v5 = a1[1] - *a1;
    uint64_t v17 = result;
    uint64_t v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<NSString * {__strong}>>(result, a2);
    uint64_t v9 = *a1;
    uint64_t v8 = a1[1];
    if (v8 == *a1)
    {
      int64x2_t v12 = vdupq_n_s64((unint64_t)v8);
      unint64_t v10 = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
    }
    else
    {
      unint64_t v10 = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
      do
      {
        uint64_t v11 = *((void *)v8 - 1);
        v8 -= 8;
        *(void *)uint64_t v8 = 0;
        *((void *)v10 - 1) = v11;
        v10 -= 8;
      }
      while (v8 != v9);
      int64x2_t v12 = *(int64x2_t *)a1;
    }
    *a1 = v10;
    a1[1] = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
    int64x2_t v15 = v12;
    long long v13 = a1[2];
    a1[2] = &v6[8 * v7];
    uint64_t v16 = v13;
    uint64_t v14 = v12.i64[0];
    return std::__split_buffer<NSString * {__strong}>::~__split_buffer((uint64_t)&v14);
  }
  return result;
}

uint64_t nlohmann::detail::iteration_proxy<nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>>::begin@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v6[0] = v4;
  v6[1] = v4;
  unint64_t v7 = 0xAAAAAAAAAAAAAAAALL;
  nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>::iter_impl(v6, v3);
  nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>::set_begin((unsigned __int8 **)v6);
  return nlohmann::detail::iteration_proxy_value<nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>>::iteration_proxy_value(a2, (uint64_t)v6);
}

uint64_t nlohmann::detail::iteration_proxy<nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>>::end@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v6[0] = v4;
  v6[1] = v4;
  unint64_t v7 = 0xAAAAAAAAAAAAAAAALL;
  nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>::iter_impl(v6, v3);
  nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>::set_end((unsigned __int8 **)v6);
  return nlohmann::detail::iteration_proxy_value<nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>>::iteration_proxy_value(a2, (uint64_t)v6);
}

uint64_t nlohmann::detail::iteration_proxy_value<nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>>::key(unsigned __int8 **a1)
{
  if (!*a1) {
    nlohmann::detail::iteration_proxy_value<nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>>::key();
  }
  int v2 = **a1;
  if (v2 == 1)
  {
    return nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>::key(a1);
  }
  else if (v2 == 2)
  {
    unint64_t v3 = (unint64_t)a1[5];
    if ((unsigned __int8 *)v3 != a1[6])
    {
      nlohmann::detail::int_to_string<std::string>((uint64_t)(a1 + 7), v3);
      a1[6] = a1[5];
    }
    return (uint64_t)(a1 + 7);
  }
  else
  {
    return (uint64_t)(a1 + 10);
  }
}

uint64_t nlohmann::detail::iteration_proxy_value<nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>>::~iteration_proxy_value(uint64_t a1)
{
  if (*(char *)(a1 + 103) < 0) {
    operator delete(*(void **)(a1 + 80));
  }
  if (*(char *)(a1 + 79) < 0) {
    operator delete(*(void **)(a1 + 56));
  }
  return a1;
}

void ___ZL34makeJsonFromNSObjectWithDepthCountP8NSObjecth_block_invoke_2(uint64_t a1, NSObject *a2)
{
  v6[1] = *(uint64_t **)MEMORY[0x1E4F143B8];
  int v2 = *(uint64_t **)(a1 + 32);
  makeJsonFromNSObjectWithDepthCount(&v5, a2, *(unsigned char *)(a1 + 40) + 1);
  unint64_t v3 = v2[1];
  if (v3 >= v2[2])
  {
    uint64_t v4 = std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__emplace_back_slow_path<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>(v2, (uint64_t)&v5);
  }
  else
  {
    *(unsigned char *)unint64_t v3 = v5;
    *(uint64_t **)(v3 + 8) = v6[0];
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v5);
    LOBYTE(v5) = 0;
    v6[0] = 0;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v3);
    uint64_t v4 = v3 + 16;
  }
  v2[1] = v4;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v5);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(v6, v5);
}

void sub_1A7C4FF84(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::~basic_json((uint64_t **)va);
  _Unwind_Resume(a1);
}

void std::__destroy_at[abi:ne180100]<std::pair<std::string const,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,0>(uint64_t a1)
{
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a1 + 24);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)(a1 + 32), *(unsigned __int8 *)(a1 + 24));
  if (*(char *)(a1 + 23) < 0)
  {
    int v2 = *(void **)a1;
    operator delete(v2);
  }
}

uint64_t std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__emplace_back_slow_path<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>(uint64_t *a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  uint64_t v4 = (a1[1] - *a1) >> 4;
  unint64_t v5 = v4 + 1;
  if ((unint64_t)(v4 + 1) >> 60) {
    std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
  }
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = (uint64_t)(a1 + 2);
  uint64_t v8 = a1[2] - v3;
  if (v8 >> 3 > v5) {
    unint64_t v5 = v8 >> 3;
  }
  if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFF0) {
    unint64_t v9 = 0xFFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v9 = v5;
  }
  uint64_t v17 = a1 + 2;
  unint64_t v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>(v7, v9);
  uint64_t v11 = (uint64_t)&v10[16 * v4];
  *(void *)&long long v15 = v10;
  *((void *)&v15 + 1) = v11;
  *((void *)&v16 + 1) = &v10[16 * v12];
  *(unsigned char *)uint64_t v11 = *(unsigned char *)a2;
  *(void *)(v11 + 8) = *(void *)(a2 + 8);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a2);
  *(unsigned char *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v11);
  *(void *)&long long v16 = v11 + 16;
  std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__swap_out_circular_buffer(a1, &v15);
  uint64_t v13 = a1[1];
  std::__split_buffer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::~__split_buffer((uint64_t)&v15);
  return v13;
}

void sub_1A7C50110(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

unsigned __int8 **nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>::set_begin(unsigned __int8 **result)
{
  uint64_t v1 = *result;
  if (!*result) {
    __assert_rtn("set_begin", "iter_impl.hpp", 174, "m_object != nullptr");
  }
  int v2 = *v1;
  if (*v1)
  {
    if (v2 == 2)
    {
      result[2] = (unsigned __int8 *)**((void **)v1 + 1);
    }
    else if (v2 == 1)
    {
      result[1] = (unsigned __int8 *)**((void **)v1 + 1);
    }
    else
    {
      result[4] = 0;
    }
  }
  else
  {
    result[4] = (unsigned __int8 *)1;
  }
  return result;
}

void *nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>::iter_impl(void *result, uint64_t a2)
{
  *uint64_t result = a2;
  result[1] = 0;
  result[2] = 0;
  result[3] = 0;
  result[4] = 0x8000000000000000;
  if (!a2) {
    __assert_rtn("iter_impl", "iter_impl.hpp", 88, "m_object != nullptr");
  }
  return result;
}

unsigned __int8 **nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>::set_end(unsigned __int8 **result)
{
  uint64_t v1 = *result;
  if (!*result) {
    __assert_rtn("set_end", "iter_impl.hpp", 211, "m_object != nullptr");
  }
  int v2 = *v1;
  if (v2 == 2)
  {
    result[2] = *(unsigned __int8 **)(*((void *)v1 + 1) + 8);
  }
  else if (v2 == 1)
  {
    result[1] = (unsigned __int8 *)(*((void *)v1 + 1) + 8);
  }
  else
  {
    result[4] = (unsigned __int8 *)1;
  }
  return result;
}

char *nlohmann::detail::from_json<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>(char *result, unsigned char *a2)
{
  int v2 = result;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (*result != 4)
  {
    exception = (nlohmann::detail::exception *)__cxa_allocate_exception(0x20uLL);
    uint64_t v4 = (char *)nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::type_name(v2);
    std::string::basic_string[abi:ne180100]<0>(&v7, v4);
    unint64_t v5 = std::string::insert(&v7, 0, "type must be BOOLean, but is ");
    long long v6 = *(_OWORD *)&v5->__r_.__value_.__l.__data_;
    std::string::size_type v9 = v5->__r_.__value_.__r.__words[2];
    long long v8 = v6;
    v5->__r_.__value_.__l.__size_ = 0;
    v5->__r_.__value_.__r.__words[2] = 0;
    v5->__r_.__value_.__r.__words[0] = 0;
    nlohmann::detail::type_error::create(302, (uint64_t)&v8, exception);
  }
  *a2 = result[8];
  return result;
}

void sub_1A7C50378(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a15 < 0)
  {
    operator delete(a10);
    if ((v22 & 1) == 0) {
LABEL_8:
    }
      _Unwind_Resume(a1);
  }
  else if (!v22)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v21);
  goto LABEL_8;
}

unsigned __int8 *nlohmann::detail::get_arithmetic_value<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,unsigned long long,0>(unsigned __int8 *result, unint64_t *a2)
{
  int v2 = (char *)result;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v3 = *result;
  if (v3 != 5)
  {
    if (v3 == 7)
    {
      unint64_t v4 = (unint64_t)*((double *)result + 1);
      goto LABEL_6;
    }
    if (v3 != 6)
    {
      exception = (nlohmann::detail::exception *)__cxa_allocate_exception(0x20uLL);
      long long v6 = (char *)nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::type_name(v2);
      std::string::basic_string[abi:ne180100]<0>(&v9, v6);
      std::string v7 = std::string::insert(&v9, 0, "type must be number, but is ");
      long long v8 = *(_OWORD *)&v7->__r_.__value_.__l.__data_;
      std::string::size_type v11 = v7->__r_.__value_.__r.__words[2];
      long long v10 = v8;
      v7->__r_.__value_.__l.__size_ = 0;
      v7->__r_.__value_.__r.__words[2] = 0;
      v7->__r_.__value_.__r.__words[0] = 0;
      nlohmann::detail::type_error::create(302, (uint64_t)&v10, exception);
    }
  }
  unint64_t v4 = *((void *)result + 1);
LABEL_6:
  *a2 = v4;
  return result;
}

void sub_1A7C504EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a15 < 0)
  {
    operator delete(a10);
    if ((v22 & 1) == 0) {
LABEL_8:
    }
      _Unwind_Resume(a1);
  }
  else if (!v22)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v21);
  goto LABEL_8;
}

unsigned __int8 *nlohmann::detail::get_arithmetic_value<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,long long,0>(unsigned __int8 *result, uint64_t *a2)
{
  int v2 = (char *)result;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v3 = *result;
  if (v3 != 5)
  {
    if (v3 == 7)
    {
      uint64_t v4 = (uint64_t)*((double *)result + 1);
      goto LABEL_6;
    }
    if (v3 != 6)
    {
      exception = (nlohmann::detail::exception *)__cxa_allocate_exception(0x20uLL);
      long long v6 = (char *)nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::type_name(v2);
      std::string::basic_string[abi:ne180100]<0>(&v9, v6);
      std::string v7 = std::string::insert(&v9, 0, "type must be number, but is ");
      long long v8 = *(_OWORD *)&v7->__r_.__value_.__l.__data_;
      std::string::size_type v11 = v7->__r_.__value_.__r.__words[2];
      long long v10 = v8;
      v7->__r_.__value_.__l.__size_ = 0;
      v7->__r_.__value_.__r.__words[2] = 0;
      v7->__r_.__value_.__r.__words[0] = 0;
      nlohmann::detail::type_error::create(302, (uint64_t)&v10, exception);
    }
  }
  uint64_t v4 = *((void *)result + 1);
LABEL_6:
  *a2 = v4;
  return result;
}

void sub_1A7C50660(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a15 < 0)
  {
    operator delete(a10);
    if ((v22 & 1) == 0) {
LABEL_8:
    }
      _Unwind_Resume(a1);
  }
  else if (!v22)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v21);
  goto LABEL_8;
}

unsigned __int8 *nlohmann::detail::get_arithmetic_value<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,double,0>(unsigned __int8 *result, double *a2)
{
  int v2 = (char *)result;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v3 = *result;
  switch(v3)
  {
    case 5:
      double v4 = (double)*((uint64_t *)result + 1);
      break;
    case 7:
      double v4 = *((double *)result + 1);
      break;
    case 6:
      double v4 = (double)*((unint64_t *)result + 1);
      break;
    default:
      exception = (nlohmann::detail::exception *)__cxa_allocate_exception(0x20uLL);
      long long v6 = (char *)nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::type_name(v2);
      std::string::basic_string[abi:ne180100]<0>(&v9, v6);
      std::string v7 = std::string::insert(&v9, 0, "type must be number, but is ");
      long long v8 = *(_OWORD *)&v7->__r_.__value_.__l.__data_;
      std::string::size_type v11 = v7->__r_.__value_.__r.__words[2];
      long long v10 = v8;
      v7->__r_.__value_.__l.__size_ = 0;
      v7->__r_.__value_.__r.__words[2] = 0;
      v7->__r_.__value_.__r.__words[0] = 0;
      nlohmann::detail::type_error::create(302, (uint64_t)&v10, exception);
  }
  *a2 = v4;
  return result;
}

void sub_1A7C507E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a15 < 0)
  {
    operator delete(a10);
    if ((v22 & 1) == 0) {
LABEL_8:
    }
      _Unwind_Resume(a1);
  }
  else if (!v22)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v21);
  goto LABEL_8;
}

std::string *nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::get<std::string,std::string,0>@<X0>(uint64_t a1@<X0>, std::string *a2@<X8>)
{
  a2->__r_.__value_.__r.__words[0] = 0;
  a2->__r_.__value_.__l.__size_ = 0;
  a2->__r_.__value_.__r.__words[2] = 0;
  return nlohmann::detail::from_json<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>(a1, a2);
}

void sub_1A7C50870(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

std::string *nlohmann::detail::from_json<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>(uint64_t a1, std::string *this)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)a1 != 3)
  {
    exception = (nlohmann::detail::exception *)__cxa_allocate_exception(0x20uLL);
    std::string v7 = (char *)nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::type_name((char *)a1);
    std::string::basic_string[abi:ne180100]<0>(&v10, v7);
    long long v8 = std::string::insert(&v10, 0, "type must be string, but is ");
    long long v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
    std::string::size_type v12 = v8->__r_.__value_.__r.__words[2];
    long long v11 = v9;
    v8->__r_.__value_.__l.__size_ = 0;
    v8->__r_.__value_.__r.__words[2] = 0;
    v8->__r_.__value_.__r.__words[0] = 0;
    nlohmann::detail::type_error::create(302, (uint64_t)&v11, exception);
  }
  double v4 = *(const std::string **)(a1 + 8);

  return std::string::operator=(this, v4);
}

void sub_1A7C50998(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a15 < 0)
  {
    operator delete(a10);
    if ((v22 & 1) == 0) {
LABEL_8:
    }
      _Unwind_Resume(a1);
  }
  else if (!v22)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v21);
  goto LABEL_8;
}

void std::vector<NSString * {__strong}>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  int v2 = (char *)**a1;
  if (v2)
  {
    double v4 = (char *)v1[1];
    unint64_t v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        long long v6 = (void *)*((void *)v4 - 1);
        v4 -= 8;
      }
      while (v4 != v2);
      unint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<NSString * {__strong}>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(8 * a2);
}

uint64_t std::__split_buffer<NSString * {__strong}>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 8;
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

uint64_t nlohmann::detail::iteration_proxy_value<nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>>::iteration_proxy_value(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  long long v3 = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = v3;
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 48) = 0;
  std::string::basic_string[abi:ne180100]<0>((void *)(a1 + 56), "0");
  std::string::basic_string[abi:ne180100]<0>((void *)(a1 + 80), "");
  return a1;
}

BOOL nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>::operator==(unsigned __int8 **a1, unsigned __int8 **a2)
{
  v8[3] = *MEMORY[0x1E4F143B8];
  int v2 = *a1;
  if (*a1 != *a2)
  {
    exception = (nlohmann::detail::exception *)__cxa_allocate_exception(0x20uLL);
    std::string::basic_string[abi:ne180100]<0>(v8, "cannot compare iterators of different containers");
    nlohmann::detail::invalid_iterator::create(212, (uint64_t)v8, exception);
  }
  if (!v2) {
    nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>::operator==();
  }
  int v3 = *v2;
  if (v3 == 2)
  {
    double v4 = a1[2];
    unint64_t v5 = a2[2];
  }
  else if (v3 == 1)
  {
    double v4 = a1[1];
    unint64_t v5 = a2[1];
  }
  else
  {
    double v4 = a1[4];
    unint64_t v5 = a2[4];
  }
  return v4 == v5;
}

void sub_1A7C50C70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
  {
    operator delete(__p);
    if ((v15 & 1) == 0) {
LABEL_6:
    }
      _Unwind_Resume(a1);
  }
  else if (!v15)
  {
    goto LABEL_6;
  }
  __cxa_free_exception(v14);
  goto LABEL_6;
}

void nlohmann::detail::invalid_iterator::create(int a1@<W0>, uint64_t a2@<X1>, nlohmann::detail::exception *a3@<X8>)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  std::string::basic_string[abi:ne180100]<0>(&__p, "invalid_iterator");
  nlohmann::detail::exception::name(a1, &v14);
  int v6 = *(char *)(a2 + 23);
  if (v6 >= 0) {
    std::string v7 = (const std::string::value_type *)a2;
  }
  else {
    std::string v7 = *(const std::string::value_type **)a2;
  }
  if (v6 >= 0) {
    std::string::size_type v8 = *(unsigned __int8 *)(a2 + 23);
  }
  else {
    std::string::size_type v8 = *(void *)(a2 + 8);
  }
  long long v9 = std::string::append(&v14, v7, v8);
  long long v10 = *(_OWORD *)&v9->__r_.__value_.__l.__data_;
  int64_t v16 = v9->__r_.__value_.__r.__words[2];
  *(_OWORD *)int v15 = v10;
  v9->__r_.__value_.__l.__size_ = 0;
  v9->__r_.__value_.__r.__words[2] = 0;
  v9->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v14.__r_.__value_.__l.__data_);
  }
  if (v13 < 0) {
    operator delete(__p);
  }
  if (v16 >= 0) {
    long long v11 = v15;
  }
  else {
    long long v11 = (void **)v15[0];
  }
  nlohmann::detail::exception::exception(a3, a1, (const char *)v11);
  *(void *)a3 = &unk_1EFE15EE0;
  if (SHIBYTE(v16) < 0) {
    operator delete(v15[0]);
  }
}

void sub_1A7C50DD8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  if (a26 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void nlohmann::detail::invalid_iterator::~invalid_iterator(std::exception *this)
{
  this->__vftable = (std::exception_vtbl *)&unk_1EFE15F38;
  MEMORY[0x1AD0D68C0](&this[2]);

  std::exception::~exception(this);
}

{
  uint64_t vars8;

  this->__vftable = (std::exception_vtbl *)&unk_1EFE15F38;
  MEMORY[0x1AD0D68C0](&this[2]);
  std::exception::~exception(this);

  JUMPOUT(0x1AD0D6A20);
}

unsigned __int8 **nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>::operator++(unsigned __int8 **result)
{
  if (!*result) {
    nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>::operator++();
  }
  int v1 = **result;
  if (v1 == 2)
  {
    result[2] += 16;
  }
  else if (v1 == 1)
  {
    int v2 = result[1];
    int v3 = (unsigned __int8 *)*((void *)v2 + 1);
    if (v3)
    {
      do
      {
        double v4 = v3;
        int v3 = *(unsigned __int8 **)v3;
      }
      while (v3);
    }
    else
    {
      do
      {
        double v4 = (unsigned __int8 *)*((void *)v2 + 2);
        BOOL v5 = *(void *)v4 == (void)v2;
        int v2 = v4;
      }
      while (!v5);
    }
    result[1] = v4;
  }
  else
  {
    ++result[4];
  }
  return result;
}

double nlohmann::detail::int_to_string<std::string>(uint64_t a1, unint64_t __val)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  std::to_string(&v4, __val);
  if (*(char *)(a1 + 23) < 0) {
    operator delete(*(void **)a1);
  }
  double result = *(double *)&v4.__r_.__value_.__l.__data_;
  *(std::string *)a1 = v4;
  return result;
}

uint64_t nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>::key(void *a1)
{
  v3[3] = *MEMORY[0x1E4F143B8];
  if (!*a1) {
    nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>::key();
  }
  if (*(unsigned char *)*a1 != 1)
  {
    exception = (nlohmann::detail::exception *)__cxa_allocate_exception(0x20uLL);
    std::string::basic_string[abi:ne180100]<0>(v3, "cannot use key() for non-object iterators");
    nlohmann::detail::invalid_iterator::create(207, (uint64_t)v3, exception);
  }
  return a1[1] + 32;
}

void sub_1A7C510C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
  {
    operator delete(__p);
    if ((v15 & 1) == 0) {
LABEL_6:
    }
      _Unwind_Resume(a1);
  }
  else if (!v15)
  {
    goto LABEL_6;
  }
  __cxa_free_exception(v14);
  goto LABEL_6;
}

unsigned __int8 *nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>::operator*(unsigned __int8 **a1)
{
  v8[3] = *MEMORY[0x1E4F143B8];
  double result = *a1;
  if (!result) {
    nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>::operator*();
  }
  int v3 = *result;
  if (v3 == 1)
  {
    int v6 = a1[1];
    if (v6 == (unsigned __int8 *)(*((void *)result + 1) + 8)) {
      nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>::operator*();
    }
    return v6 + 56;
  }
  else if (v3 == 2)
  {
    uint64_t v5 = *(unsigned __int8 **)(*((void *)result + 1) + 8);
    double result = a1[2];
    if (result == v5) {
      nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>::operator*();
    }
  }
  else
  {
    if (!*result)
    {
      exception = (nlohmann::detail::exception *)__cxa_allocate_exception(0x20uLL);
      std::string::basic_string[abi:ne180100]<0>(v8, "cannot get value");
      nlohmann::detail::invalid_iterator::create(214, (uint64_t)v8, exception);
    }
    if (a1[4])
    {
      std::string v4 = (nlohmann::detail::exception *)__cxa_allocate_exception(0x20uLL);
      std::string::basic_string[abi:ne180100]<0>(v8, "cannot get value");
      nlohmann::detail::invalid_iterator::create(214, (uint64_t)v8, v4);
    }
  }
  return result;
}

void sub_1A7C5127C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (v15) {
    __cxa_free_exception(v14);
  }
  _Unwind_Resume(exception_object);
}

char ***std::back_insert_iterator<std::vector<NSObject * {__strong}>>::operator=[abi:ne180100](char ***a1, uint64_t *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  std::string v4 = *a1;
  uint64_t v5 = (*a1)[1];
  int v6 = *a1;
  unint64_t v9 = (unint64_t)v6[2];
  uint64_t v7 = (uint64_t)(v6 + 2);
  unint64_t v8 = v9;
  if ((unint64_t)v5 >= v9)
  {
    uint64_t v12 = (v5 - *v4) >> 3;
    if ((unint64_t)(v12 + 1) >> 61) {
      std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v13 = v8 - (void)*v4;
    uint64_t v14 = v13 >> 2;
    if (v13 >> 2 <= (unint64_t)(v12 + 1)) {
      uint64_t v14 = v12 + 1;
    }
    if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v15 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v15 = v14;
    }
    uint64_t v29 = v7;
    if (v15) {
      int64_t v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<NSString * {__strong}>>(v7, v15);
    }
    else {
      int64_t v16 = 0;
    }
    uint64_t v17 = &v16[8 * v12];
    uint64_t v18 = &v16[8 * v15];
    xpc_object_t v28 = v18;
    uint64_t v19 = *a2;
    *a2 = 0;
    *(void *)uint64_t v17 = v19;
    long long v11 = v17 + 8;
    uint64_t v27 = v17 + 8;
    uint64_t v21 = *v4;
    uint64_t v20 = v4[1];
    if (v20 == *v4)
    {
      unint64_t v23 = v4[1];
    }
    else
    {
      do
      {
        uint64_t v22 = *((void *)v20 - 1);
        v20 -= 8;
        *(void *)uint64_t v20 = 0;
        *((void *)v17 - 1) = v22;
        v17 -= 8;
      }
      while (v20 != v21);
      unint64_t v23 = *v4;
      uint64_t v20 = v4[1];
      long long v11 = v27;
      uint64_t v18 = v28;
    }
    nlohmann::detail::exception *v4 = v17;
    v26[0] = v23;
    v26[1] = v23;
    v4[1] = v11;
    uint64_t v27 = v20;
    uint64_t v24 = v4[2];
    v4[2] = v18;
    xpc_object_t v28 = v24;
    std::__split_buffer<NSString * {__strong}>::~__split_buffer((uint64_t)v26);
  }
  else
  {
    uint64_t v10 = *a2;
    *a2 = 0;
    *(void *)uint64_t v5 = v10;
    long long v11 = v5 + 8;
  }
  v4[1] = v11;
  return a1;
}

void FrameworkConfiguration::getExternalConfiguration(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  int v6 = a1 + 3;
  uint64_t v5 = a1[3];
  if (v5)
  {
    uint64_t v8 = *a1;
    if (*a1 == -1) {
      uint64_t v8 = 0;
    }
    uint64_t v9 = v8 + *(unsigned int *)(a1[2] + 12);
    unint64_t v28 = 0xAAAAAAAAAAAAAAAALL;
    uint64_t v29 = (uint64_t *)0xAAAAAAAAAAAAAAAALL;
    uint64_t v31 = 0;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::parse<char const*>(v5, v9, (uint64_t)v30, 1, &v28);
    std::__function::__value_func<BOOL ()(int,nlohmann::detail::parse_event_t,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> &)>::~__value_func[abi:ne180100](v30);
    if (v28 == 2)
    {
      v30[0] = (unsigned __int8 *)&v28;
      v30[1] = 0;
      xpc_object_t v30[2] = 0;
      uint64_t v31 = 0;
      unint64_t v32 = 0x8000000000000000;
      nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::set_begin(v30);
      v27[0] = (unsigned __int8 *)&v28;
      memset(&v27[1], 0, 24);
      v27[4] = (unsigned __int8 *)0x8000000000000000;
      nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::set_end(v27);
      while (!nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::operator==(v30, v27))
      {
        uint64_t v10 = nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::operator*(v30);
        uint64_t v11 = (uint64_t)v10;
        if (*v10 == 1)
        {
          unint64_t v26 = 0xAAAAAAAAAAAAAAAALL;
          *(void *)&long long v12 = 0xAAAAAAAAAAAAAAAALL;
          *((void *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
          v25[0] = v12;
          v25[1] = v12;
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::find<char const(&)[5]>((uint64_t)v10, "kind", (uint64_t)v25);
          unint64_t v24 = 0xAAAAAAAAAAAAAAAALL;
          *(void *)&long long v13 = 0xAAAAAAAAAAAAAAAALL;
          *((void *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
          long long v22 = v13;
          long long v23 = v13;
          nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::iter_impl(&v22, v11);
          nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::set_end((unsigned __int8 **)&v22);
          if (!nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::operator==((unsigned __int8 **)v25, (unsigned __int8 **)&v22))
          {
            uint64_t v14 = nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::operator*((unsigned __int8 **)v25);
            nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<std::string const&,std::string,0>((uint64_t)v20, a2);
            LODWORD(v14) = nlohmann::operator==(v14, (unsigned __int8 *)v20);
            nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v20);
            nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)v20 + 1, LOBYTE(v20[0]));
            if (v14)
            {
              unint64_t v24 = 0xAAAAAAAAAAAAAAAALL;
              *(void *)&long long v15 = 0xAAAAAAAAAAAAAAAALL;
              *((void *)&v15 + 1) = 0xAAAAAAAAAAAAAAAALL;
              long long v22 = v15;
              long long v23 = v15;
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::find<char const(&)[5]>(v11, "configuration", (uint64_t)&v22);
              unint64_t v21 = 0xAAAAAAAAAAAAAAAALL;
              *(void *)&long long v16 = 0xAAAAAAAAAAAAAAAALL;
              *((void *)&v16 + 1) = 0xAAAAAAAAAAAAAAAALL;
              v20[0] = v16;
              v20[1] = v16;
              nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::iter_impl(v20, v11);
              nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::set_end((unsigned __int8 **)v20);
              if (!nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::operator==((unsigned __int8 **)&v22, (unsigned __int8 **)v20))
              {
                uint64_t v19 = nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::operator*((unsigned __int8 **)&v22);
                *(unsigned char *)a3 = *v19;
                *(void *)(a3 + 8) = *((void *)v19 + 1);
                nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v19);
                unsigned __int8 *v19 = 0;
                *((void *)v19 + 1) = 0;
                goto LABEL_18;
              }
            }
          }
        }
        nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>::operator++(v30);
      }
    }
    else
    {
        FrameworkConfiguration::getExternalConfiguration(v6, v9, v18);
    }
    *(unsigned char *)a3 = 0;
    *(void *)(a3 + 8) = 0;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a3);
LABEL_18:
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a3);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v28);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v29, v28);
  }
  else
  {
      FrameworkConfiguration::getExternalConfiguration(v17);
    *(unsigned char *)a3 = 0;
    *(void *)(a3 + 8) = 0;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a3);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a3);
  }
}

void sub_1A7C51718(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {
    std::__function::__value_func<BOOL ()(int,nlohmann::detail::parse_event_t,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> &)>::~__value_func[abi:ne180100]((void *)(v2 - 128));
    if (a2 == 2)
    {
      __cxa_begin_catch(exception_object);
      *(unsigned char *)(v2 - 144) = 0;
      *(void *)(v2 - 136) = 0;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v2 - 144);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v2 - 144);
      __cxa_end_catch();
      JUMPOUT(0x1A7C514A0);
    }
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

unsigned __int8 *nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::operator*(unsigned __int8 **a1)
{
  v8[3] = *MEMORY[0x1E4F143B8];
  double result = *a1;
  if (!result) {
    nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>::operator*();
  }
  int v3 = *result;
  if (v3 == 1)
  {
    int v6 = a1[1];
    if (v6 == (unsigned __int8 *)(*((void *)result + 1) + 8)) {
      nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>::operator*();
    }
    return v6 + 56;
  }
  else if (v3 == 2)
  {
    uint64_t v5 = *(unsigned __int8 **)(*((void *)result + 1) + 8);
    double result = a1[2];
    if (result == v5) {
      nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>::operator*();
    }
  }
  else
  {
    if (!*result)
    {
      exception = (nlohmann::detail::exception *)__cxa_allocate_exception(0x20uLL);
      std::string::basic_string[abi:ne180100]<0>(v8, "cannot get value");
      nlohmann::detail::invalid_iterator::create(214, (uint64_t)v8, exception);
    }
    if (a1[4])
    {
      std::string v4 = (nlohmann::detail::exception *)__cxa_allocate_exception(0x20uLL);
      std::string::basic_string[abi:ne180100]<0>(v8, "cannot get value");
      nlohmann::detail::invalid_iterator::create(214, (uint64_t)v8, v4);
    }
  }
  return result;
}

void sub_1A7C518F0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (v15) {
    __cxa_free_exception(v14);
  }
  _Unwind_Resume(exception_object);
}

uint64_t nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::find<char const(&)[5]>@<X0>(uint64_t a1@<X0>, std::string::value_type *a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)(a3 + 32) = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)a3 = v6;
  *(_OWORD *)(a3 + 16) = v6;
  uint64_t v7 = (unsigned __int8 **)nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::iter_impl((void *)a3, a1);
  uint64_t result = (uint64_t)nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::set_end(v7);
  if (*(unsigned char *)a1 == 1)
  {
    uint64_t result = std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::find<char [5]>(*(void *)(a1 + 8), a2);
    *(void *)(a3 + 8) = result;
  }
  return result;
}

BOOL nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::operator==(unsigned __int8 **a1, unsigned __int8 **a2)
{
  v8[3] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  if (*a1 != *a2)
  {
    exception = (nlohmann::detail::exception *)__cxa_allocate_exception(0x20uLL);
    std::string::basic_string[abi:ne180100]<0>(v8, "cannot compare iterators of different containers");
    nlohmann::detail::invalid_iterator::create(212, (uint64_t)v8, exception);
  }
  if (!v2) {
    nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>::operator==();
  }
  int v3 = *v2;
  if (v3 == 2)
  {
    std::string v4 = a1[2];
    uint64_t v5 = a2[2];
  }
  else if (v3 == 1)
  {
    std::string v4 = a1[1];
    uint64_t v5 = a2[1];
  }
  else
  {
    std::string v4 = a1[4];
    uint64_t v5 = a2[4];
  }
  return v4 == v5;
}

void sub_1A7C51AA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
  {
    operator delete(__p);
    if ((v15 & 1) == 0) {
LABEL_6:
    }
      _Unwind_Resume(a1);
  }
  else if (!v15)
  {
    goto LABEL_6;
  }
  __cxa_free_exception(v14);
  goto LABEL_6;
}

uint64_t nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<std::string const&,std::string,0>(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)a1 = 3;
  *(void *)(a1 + 8) = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::create<std::string,std::string const&>(a2);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a1);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a1);
  return a1;
}

void std::__shared_ptr_emplace<FrameworkConfiguration>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EFE16038;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<FrameworkConfiguration>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EFE16038;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x1AD0D6A20);
}

void std::__shared_ptr_emplace<FrameworkConfiguration>::__on_zero_shared(uint64_t a1)
{
}

unsigned char *nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::json_value(unsigned char *a1, int a2)
{
  switch(a2)
  {
    case 1:
      int v3 = operator new(0x18uLL);
      v3[2] = 0;
      v3[1] = 0;
      void *v3 = v3 + 1;
      goto LABEL_8;
    case 2:
      int v3 = operator new(0x18uLL);
      v3[1] = 0;
      v3[2] = 0;
      void *v3 = 0;
      goto LABEL_8;
    case 3:
      int v3 = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::create<std::string,char const(&)[1]>("");
      goto LABEL_8;
    case 4:
      *a1 = 0;
      return a1;
    case 8:
      int v3 = operator new(0x20uLL);
      v3[1] = 0;
      v3[2] = 0;
      void *v3 = 0;
      *((_WORD *)v3 + 12) = 0;
LABEL_8:
      *(void *)a1 = v3;
      break;
    default:
      *(void *)a1 = 0;
      break;
  }
  return a1;
}

void *nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::create<std::string,char const(&)[1]>(char *a1)
{
  uint64_t v2 = operator new(0x18uLL);
  std::string::basic_string[abi:ne180100]<0>(v2, a1);
  return v2;
}

void sub_1A7C51CC4(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void nlohmann::detail::other_error::~other_error(std::exception *this)
{
  this->__vftable = (std::exception_vtbl *)&unk_1EFE15F38;
  MEMORY[0x1AD0D68C0](&this[2]);

  std::exception::~exception(this);
}

{
  uint64_t vars8;

  this->__vftable = (std::exception_vtbl *)&unk_1EFE15F38;
  MEMORY[0x1AD0D68C0](&this[2]);
  std::exception::~exception(this);

  JUMPOUT(0x1AD0D6A20);
}

void *nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::parse<char const*>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, void *a5@<X8>)
{
  v13[18] = *MEMORY[0x1E4F143B8];
  *a5 = 0xAAAAAAAAAAAAAAAALL;
  a5[1] = 0;
  *(unsigned char *)a5 = 0;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)a5);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)a5);
  std::__function::__value_func<BOOL ()(int,nlohmann::detail::parse_event_t,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> &)>::__value_func[abi:ne180100]((uint64_t)v11, a3);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::parser<nlohmann::detail::iterator_input_adapter<char const*>>(a1, a2, (uint64_t)v11, a4, (uint64_t)v12);
  nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::parse((uint64_t)v12, 1, (uint64_t)a5);
  nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::~lexer((uint64_t)v13);
  std::__function::__value_func<BOOL ()(int,nlohmann::detail::parse_event_t,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> &)>::~__value_func[abi:ne180100](v12);
  return std::__function::__value_func<BOOL ()(int,nlohmann::detail::parse_event_t,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> &)>::~__value_func[abi:ne180100](v11);
}

void sub_1A7C51E74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::~lexer(v14 + 40);
  std::__function::__value_func<BOOL ()(int,nlohmann::detail::parse_event_t,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> &)>::~__value_func[abi:ne180100](&a13);
  std::__function::__value_func<BOOL ()(int,nlohmann::detail::parse_event_t,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> &)>::~__value_func[abi:ne180100](&a9);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::~basic_json(v13);
  _Unwind_Resume(a1);
}

void *nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::parser<nlohmann::detail::iterator_input_adapter<char const*>>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X8>)
{
  v9[4] = *MEMORY[0x1E4F143B8];
  *(void *)&long long v8 = a1;
  *((void *)&v8 + 1) = a2;
  std::__function::__value_func<BOOL ()(int,nlohmann::detail::parse_event_t,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> &)>::__value_func[abi:ne180100]((uint64_t)v9, a3);
  nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::parser(a5, &v8, (uint64_t)v9, a4);
  return std::__function::__value_func<BOOL ()(int,nlohmann::detail::parse_event_t,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> &)>::~__value_func[abi:ne180100](v9);
}

void sub_1A7C51F34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  std::__function::__value_func<BOOL ()(int,nlohmann::detail::parse_event_t,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> &)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

void nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::parse(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 24))
  {
    unint64_t v42 = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v40 = v6;
    long long v41 = v6;
    long long v38 = v6;
    long long v39 = v6;
    long long v36 = v6;
    long long v37 = v6;
    *(_OWORD *)&v35[16] = v6;
    *(_OWORD *)&v35[32] = v6;
    *(_OWORD *)uint64_t v35 = v6;
    std::__function::__value_func<BOOL ()(int,nlohmann::detail::parse_event_t,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> &)>::__value_func[abi:ne180100]((uint64_t)v34, a1);
    nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::json_sax_dom_callback_parser((uint64_t)v35, a3, (uint64_t)v34, *(unsigned char *)(a1 + 176));
    std::__function::__value_func<BOOL ()(int,nlohmann::detail::parse_event_t,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> &)>::~__value_func[abi:ne180100](v34);
    nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::sax_parse_internal<nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>(a1, (uint64_t *)v35);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a3);
    if (a2)
    {
      int v7 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan(a1 + 40);
      *(_DWORD *)(a1 + 32) = v7;
      if (v7 != 15)
      {
        uint64_t v8 = *(void *)(a1 + 64);
        nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get_token_string(a1 + 40, &v33);
        long long v29 = *(_OWORD *)(a1 + 64);
        uint64_t v30 = *(void *)(a1 + 80);
        std::string::basic_string[abi:ne180100]<0>(v26, "value");
        nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::exception_message(a1, 0xFu, (uint64_t)v26, &__p);
        nlohmann::detail::parse_error::create(101, (uint64_t *)&v29, (uint64_t)&__p, (nlohmann::detail::exception *)&v31);
        nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::parse_error((uint64_t)v35, v8, (uint64_t)&v33, (const nlohmann::detail::parse_error *)&v31);
        v31.__vftable = (std::exception_vtbl *)&unk_1EFE15F38;
        MEMORY[0x1AD0D68C0](v32);
        std::exception::~exception(&v31);
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__p.__r_.__value_.__l.__data_);
        }
        if (v27 < 0) {
          operator delete(v26[0]);
        }
        if (SHIBYTE(v33.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v33.__r_.__value_.__l.__data_);
        }
      }
    }
    if (BYTE8(v38))
    {
      v24[0] = 9;
      uint64_t v9 = (uint64_t **)&v25;
      uint64_t v25 = 0;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v24);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v24);
      unsigned __int8 v10 = *(unsigned char *)a3;
      *(unsigned char *)a3 = v24[0];
      v24[0] = v10;
      uint64_t v11 = *(void *)(a3 + 8);
      *(void *)(a3 + 8) = v25;
      uint64_t v25 = v11;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a3);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v24);
      int v12 = v24[0];
    }
    else
    {
      if (*(unsigned char *)a3 != 9)
      {
LABEL_27:
        nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::~json_sax_dom_callback_parser((uint64_t)v35);
        return;
      }
      v22[0] = 0;
      uint64_t v9 = (uint64_t **)&v23;
      uint64_t v23 = 0;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v22);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v22);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v22);
      unsigned __int8 v18 = *(unsigned char *)a3;
      *(unsigned char *)a3 = v22[0];
      v22[0] = v18;
      uint64_t v19 = *(void *)(a3 + 8);
      *(void *)(a3 + 8) = v23;
      uint64_t v23 = v19;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a3);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v22);
      int v12 = v22[0];
    }
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(v9, v12);
    goto LABEL_27;
  }
  char v13 = *(unsigned char *)(a1 + 176);
  *(void *)&v35[40] = 0xAAAAAAAAAAAAAA00;
  *(void *)uint64_t v35 = a3;
  memset(&v35[8], 0, 32);
  v35[41] = v13;
  nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::sax_parse_internal<nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>(a1, (uint64_t *)v35);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a3);
  if (a2)
  {
    int v14 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan(a1 + 40);
    *(_DWORD *)(a1 + 32) = v14;
    if (v14 != 15)
    {
      uint64_t v15 = *(void *)(a1 + 64);
      nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get_token_string(a1 + 40, &v33);
      long long v29 = *(_OWORD *)(a1 + 64);
      uint64_t v30 = *(void *)(a1 + 80);
      std::string::basic_string[abi:ne180100]<0>(v26, "value");
      nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::exception_message(a1, 0xFu, (uint64_t)v26, &__p);
      nlohmann::detail::parse_error::create(101, (uint64_t *)&v29, (uint64_t)&__p, (nlohmann::detail::exception *)&v31);
      nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::parse_error((uint64_t)v35, v15, (uint64_t)&v33, (const nlohmann::detail::parse_error *)&v31);
      v31.__vftable = (std::exception_vtbl *)&unk_1EFE15F38;
      MEMORY[0x1AD0D68C0](v32);
      std::exception::~exception(&v31);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      if (v27 < 0) {
        operator delete(v26[0]);
      }
      if (SHIBYTE(v33.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v33.__r_.__value_.__l.__data_);
      }
    }
  }
  if (v35[40])
  {
    v20[0] = 9;
    unint64_t v21 = 0;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v20);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v20);
    unsigned __int8 v16 = *(unsigned char *)a3;
    *(unsigned char *)a3 = v20[0];
    v20[0] = v16;
    uint64_t v17 = *(uint64_t **)(a3 + 8);
    *(void *)(a3 + 8) = v21;
    unint64_t v21 = v17;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a3);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v20);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v21, v20[0]);
  }
  if (*(void *)&v35[8])
  {
    *(void *)&v35[16] = *(void *)&v35[8];
    operator delete(*(void **)&v35[8]);
  }
}

void sub_1A7C52384(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,std::exception a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,void *a36,uint64_t a37,int a38,__int16 a39,char a40,char a41,char a42)
{
  nlohmann::detail::parse_error::~parse_error(&a31);
  if (a26 < 0) {
    operator delete(__p);
  }
  if (a20 < 0) {
    operator delete(a15);
  }
  if (a41 < 0) {
    operator delete(a36);
  }
  unint64_t v44 = *(void **)(v42 - 200);
  if (v44)
  {
    *(void *)(v42 - 192) = v44;
    operator delete(v44);
  }
  _Unwind_Resume(a1);
}

uint64_t std::__function::__value_func<BOOL ()(int,nlohmann::detail::parse_event_t,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> &)>::__value_func[abi:ne180100](uint64_t a1, uint64_t a2)
{
  int v3 = (void *)(a2 + 24);
  uint64_t v4 = *(void *)(a2 + 24);
  if (v4)
  {
    if (v4 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(*(void *)*v3 + 24))(*v3, a1);
      return a1;
    }
    *(void *)(a1 + 24) = v4;
  }
  else
  {
    int v3 = (void *)(a1 + 24);
  }
  void *v3 = 0;
  return a1;
}

{
  uint64_t v3;

  int v3 = *(void *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(**(void **)(a2 + 24) + 24))(*(void *)(a2 + 24), a1);
    }
    else
    {
      *(void *)(a1 + 24) = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 16))(v3);
    }
  }
  else
  {
    *(void *)(a1 + 24) = 0;
  }
  return a1;
}

uint64_t nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::parser(uint64_t a1, _OWORD *a2, uint64_t a3, char a4)
{
  uint64_t v7 = std::__function::__value_func<BOOL ()(int,nlohmann::detail::parse_event_t,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> &)>::__value_func[abi:ne180100](a1, a3);
  *(_DWORD *)(v7 + 32) = 0;
  uint64_t v8 = v7 + 40;
  *(_OWORD *)(v7 + 40) = *a2;
  *(_DWORD *)(v7 + 56) = -1;
  *(unsigned char *)(v7 + 60) = 0;
  *(_OWORD *)(v7 + 64) = 0u;
  *(_OWORD *)(v7 + 80) = 0u;
  *(_OWORD *)(v7 + 96) = 0u;
  *(_OWORD *)(v7 + 112) = 0u;
  *(void *)(v7 + 128) = 0;
  *(void *)(v7 + 136) = "";
  *(void *)(v7 + 152) = 0;
  *(void *)(v7 + 160) = 0;
  *(void *)(v7 + 144) = 0;
  *(_DWORD *)(a1 + 168) = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get_decimal_point();
  *(unsigned char *)(a1 + 176) = a4;
  *(_DWORD *)(a1 + 32) = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan(v8);
  return a1;
}

void sub_1A7C52590(_Unwind_Exception *a1)
{
  nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::~lexer(v2);
  std::__function::__value_func<BOOL ()(int,nlohmann::detail::parse_event_t,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> &)>::~__value_func[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

uint64_t nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get_decimal_point()
{
  uint64_t v0 = localeconv();
  if (!v0) {
    __assert_rtn("get_decimal_point", "lexer.hpp", 136, "loc != nullptr");
  }
  if (v0->decimal_point) {
    return *v0->decimal_point;
  }
  else {
    return 46;
  }
}

uint64_t nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (!*(void *)(a1 + 24)
    && !nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::skip_bom((unsigned __int8 **)a1))
  {
    uint64_t v8 = "invalid BOM; must be 0xEF 0xBB 0xBF if given";
    goto LABEL_21;
  }
  while (2)
  {
    while (1)
    {
      nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get((unsigned __int8 **)a1);
      int v2 = *(_DWORD *)(a1 + 16);
      if (v2 > 31) {
        break;
      }
      if ((v2 - 9) >= 2 && v2 != 13)
      {
        if ((v2 + 1) < 2) {
          return 15;
        }
        goto LABEL_40;
      }
    }
    if (v2 > 90)
    {
      if (v2 <= 109)
      {
        if (v2 == 91) {
          return 8;
        }
        if (v2 == 93) {
          return 10;
        }
        if (v2 != 102) {
          goto LABEL_40;
        }
        qmemcpy(v9, "false", 5);
        uint64_t v5 = a1;
        unint64_t v6 = 5;
        uint64_t v7 = 2;
        return nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan_literal(v5, (unsigned __int8 *)v9, v6, v7);
      }
      if (v2 <= 122)
      {
        if (v2 == 110)
        {
          v9[0] = 1819047278;
          uint64_t v5 = a1;
          unint64_t v6 = 4;
          uint64_t v7 = 3;
        }
        else
        {
          if (v2 != 116) {
            goto LABEL_40;
          }
          v9[0] = 1702195828;
          uint64_t v5 = a1;
          unint64_t v6 = 4;
          uint64_t v7 = 1;
        }
        return nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan_literal(v5, (unsigned __int8 *)v9, v6, v7);
      }
      if (v2 == 123) {
        return 9;
      }
      if (v2 == 125) {
        return 11;
      }
LABEL_40:
      uint64_t v8 = "invalid literal";
LABEL_21:
      *(void *)(a1 + 96) = v8;
      return 14;
    }
    switch(v2)
    {
      case ' ':
        continue;
      case '""':
        uint64_t result = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan_string(a1);
        break;
      case ',':
        uint64_t result = 13;
        break;
      case '-':
      case '0':
      case '1':
      case '2':
      case '3':
      case '4':
      case '5':
      case '6':
      case '7':
      case '8':
      case '9':
        uint64_t result = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan_number(a1);
        break;
      case ':':
        uint64_t result = 12;
        break;
      default:
        goto LABEL_40;
    }
    return result;
  }
}

BOOL nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::skip_bom(unsigned __int8 **a1)
{
  if (nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get(a1) == 239)
  {
    return nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get(a1) == 187
        && nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get(a1) == 191;
  }
  else
  {
    nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::unget((uint64_t)a1);
    return 1;
  }
}

uint64_t nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get(unsigned __int8 **a1)
{
  *(int64x2_t *)(a1 + 3) = vaddq_s64(*(int64x2_t *)(a1 + 3), vdupq_n_s64(1uLL));
  if (*((unsigned char *)a1 + 20))
  {
    *((unsigned char *)a1 + 20) = 0;
    int v2 = *((_DWORD *)a1 + 4);
  }
  else
  {
    int v3 = *a1;
    if (*a1 == a1[1])
    {
      int v2 = -1;
    }
    else
    {
      int v2 = *v3;
      *a1 = v3 + 1;
    }
    *((_DWORD *)a1 + 4) = v2;
  }
  if (v2 == -1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v5 = a1[7];
  unint64_t v4 = (unint64_t)a1[8];
  if ((unint64_t)v5 >= v4)
  {
    uint64_t v7 = a1 + 6;
    unint64_t v8 = (unint64_t)a1[6];
    uint64_t v9 = &v5[-v8];
    uint64_t v10 = (uint64_t)&v5[-v8 + 1];
    if (v10 < 0) {
      std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v11 = v4 - v8;
    if (2 * v11 > v10) {
      uint64_t v10 = 2 * v11;
    }
    if (v11 >= 0x3FFFFFFFFFFFFFFFLL) {
      size_t v12 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      size_t v12 = v10;
    }
    if (v12) {
      char v13 = (unsigned __int8 *)operator new(v12);
    }
    else {
      char v13 = 0;
    }
    int v14 = &v13[v12];
    v9[(void)v13] = v2;
    uint64_t v6 = (uint64_t)&v9[(void)v13 + 1];
    if (v5 == (unsigned __int8 *)v8)
    {
      char v13 = &v9[(void)v13];
    }
    else
    {
      uint64_t v15 = &v5[~v8];
      do
      {
        unsigned __int8 v16 = *--v5;
        (v15--)[(void)v13] = v16;
      }
      while (v5 != (unsigned __int8 *)v8);
      uint64_t v5 = *v7;
    }
    a1[6] = v13;
    a1[7] = (unsigned __int8 *)v6;
    a1[8] = v14;
    if (v5) {
      operator delete(v5);
    }
  }
  else
  {
    *uint64_t v5 = v2;
    uint64_t v6 = (uint64_t)(v5 + 1);
  }
  a1[7] = (unsigned __int8 *)v6;
  uint64_t result = *((unsigned int *)a1 + 4);
  if (result == 10)
  {
    uint64_t v18 = (uint64_t)(a1[5] + 1);
    a1[4] = 0;
    a1[5] = (unsigned __int8 *)v18;
  }
  return result;
}

uint64_t nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan_literal(uint64_t a1, unsigned __int8 *a2, unint64_t a3, uint64_t a4)
{
  if (*a2 != *(unsigned __int8 *)(a1 + 16)) {
    nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan_literal();
  }
  if (a3 >= 2)
  {
    unint64_t v6 = a3 - 1;
    uint64_t v7 = a2 + 1;
    while (1)
    {
      unsigned __int8 v8 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get((unsigned __int8 **)a1);
      int v9 = *v7++;
      if (v9 != v8) {
        break;
      }
      if (!--v6) {
        return a4;
      }
    }
    *(void *)(a1 + 96) = "invalid literal";
    return 14;
  }
  return a4;
}

uint64_t nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan_string(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::reset(a1);
  if (*(_DWORD *)(a1 + 16) != 34) {
    nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan_string();
  }
  while (2)
  {
    while (2)
    {
      int v2 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get((unsigned __int8 **)a1)
         + 1;
      uint64_t result = 4;
      unint64_t v4 = "invalid string: missing closing quote";
      switch(v2)
      {
        case 0:
          goto LABEL_82;
        case 1:
          unint64_t v4 = "invalid string: control character U+0000 (NUL) must be escaped to \\u0000";
          goto LABEL_82;
        case 2:
          unint64_t v4 = "invalid string: control character U+0001 (SOH) must be escaped to \\u0001";
          goto LABEL_82;
        case 3:
          unint64_t v4 = "invalid string: control character U+0002 (STX) must be escaped to \\u0002";
          goto LABEL_82;
        case 4:
          unint64_t v4 = "invalid string: control character U+0003 (ETX) must be escaped to \\u0003";
          goto LABEL_82;
        case 5:
          unint64_t v4 = "invalid string: control character U+0004 (EOT) must be escaped to \\u0004";
          goto LABEL_82;
        case 6:
          unint64_t v4 = "invalid string: control character U+0005 (ENQ) must be escaped to \\u0005";
          goto LABEL_82;
        case 7:
          unint64_t v4 = "invalid string: control character U+0006 (ACK) must be escaped to \\u0006";
          goto LABEL_82;
        case 8:
          unint64_t v4 = "invalid string: control character U+0007 (BEL) must be escaped to \\u0007";
          goto LABEL_82;
        case 9:
          unint64_t v4 = "invalid string: control character U+0008 (BS) must be escaped to \\u0008 or \\b";
          goto LABEL_82;
        case 10:
          unint64_t v4 = "invalid string: control character U+0009 (HT) must be escaped to \\u0009 or \\t";
          goto LABEL_82;
        case 11:
          unint64_t v4 = "invalid string: control character U+000A (LF) must be escaped to \\u000A or \\n";
          goto LABEL_82;
        case 12:
          unint64_t v4 = "invalid string: control character U+000B (VT) must be escaped to \\u000B";
          goto LABEL_82;
        case 13:
          unint64_t v4 = "invalid string: control character U+000C (FF) must be escaped to \\u000C or \\f";
          goto LABEL_82;
        case 14:
          unint64_t v4 = "invalid string: control character U+000D (CR) must be escaped to \\u000D or \\r";
          goto LABEL_82;
        case 15:
          unint64_t v4 = "invalid string: control character U+000E (SO) must be escaped to \\u000E";
          goto LABEL_82;
        case 16:
          unint64_t v4 = "invalid string: control character U+000F (SI) must be escaped to \\u000F";
          goto LABEL_82;
        case 17:
          unint64_t v4 = "invalid string: control character U+0010 (DLE) must be escaped to \\u0010";
          goto LABEL_82;
        case 18:
          unint64_t v4 = "invalid string: control character U+0011 (DC1) must be escaped to \\u0011";
          goto LABEL_82;
        case 19:
          unint64_t v4 = "invalid string: control character U+0012 (DC2) must be escaped to \\u0012";
          goto LABEL_82;
        case 20:
          unint64_t v4 = "invalid string: control character U+0013 (DC3) must be escaped to \\u0013";
          goto LABEL_82;
        case 21:
          unint64_t v4 = "invalid string: control character U+0014 (DC4) must be escaped to \\u0014";
          goto LABEL_82;
        case 22:
          unint64_t v4 = "invalid string: control character U+0015 (NAK) must be escaped to \\u0015";
          goto LABEL_82;
        case 23:
          unint64_t v4 = "invalid string: control character U+0016 (SYN) must be escaped to \\u0016";
          goto LABEL_82;
        case 24:
          unint64_t v4 = "invalid string: control character U+0017 (ETB) must be escaped to \\u0017";
          goto LABEL_82;
        case 25:
          unint64_t v4 = "invalid string: control character U+0018 (CAN) must be escaped to \\u0018";
          goto LABEL_82;
        case 26:
          unint64_t v4 = "invalid string: control character U+0019 (EM) must be escaped to \\u0019";
          goto LABEL_82;
        case 27:
          unint64_t v4 = "invalid string: control character U+001A (SUB) must be escaped to \\u001A";
          goto LABEL_82;
        case 28:
          unint64_t v4 = "invalid string: control character U+001B (ESC) must be escaped to \\u001B";
          goto LABEL_82;
        case 29:
          unint64_t v4 = "invalid string: control character U+001C (FS) must be escaped to \\u001C";
          goto LABEL_82;
        case 30:
          unint64_t v4 = "invalid string: control character U+001D (GS) must be escaped to \\u001D";
          goto LABEL_82;
        case 31:
          unint64_t v4 = "invalid string: control character U+001E (RS) must be escaped to \\u001E";
          goto LABEL_82;
        case 32:
          unint64_t v4 = "invalid string: control character U+001F (US) must be escaped to \\u001F";
          goto LABEL_82;
        case 33:
        case 34:
        case 36:
        case 37:
        case 38:
        case 39:
        case 40:
        case 41:
        case 42:
        case 43:
        case 44:
        case 45:
        case 46:
        case 47:
        case 48:
        case 49:
        case 50:
        case 51:
        case 52:
        case 53:
        case 54:
        case 55:
        case 56:
        case 57:
        case 58:
        case 59:
        case 60:
        case 61:
        case 62:
        case 63:
        case 64:
        case 65:
        case 66:
        case 67:
        case 68:
        case 69:
        case 70:
        case 71:
        case 72:
        case 73:
        case 74:
        case 75:
        case 76:
        case 77:
        case 78:
        case 79:
        case 80:
        case 81:
        case 82:
        case 83:
        case 84:
        case 85:
        case 86:
        case 87:
        case 88:
        case 89:
        case 90:
        case 91:
        case 92:
        case 94:
        case 95:
        case 96:
        case 97:
        case 98:
        case 99:
        case 100:
        case 101:
        case 102:
        case 103:
        case 104:
        case 105:
        case 106:
        case 107:
        case 108:
        case 109:
        case 110:
        case 111:
        case 112:
        case 113:
        case 114:
        case 115:
        case 116:
        case 117:
        case 118:
        case 119:
        case 120:
        case 121:
        case 122:
        case 123:
        case 124:
        case 125:
        case 126:
        case 127:
        case 128:
          int v5 = *(_DWORD *)(a1 + 16);
          goto LABEL_4;
        case 35:
          return result;
        case 93:
          int v10 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get((unsigned __int8 **)a1);
          unint64_t v4 = "invalid string: forbidden character after backslash";
          if (v10 <= 97)
          {
            switch(v10)
            {
              case '""':
                LOBYTE(v5) = 34;
                break;
              case '/':
                LOBYTE(v5) = 47;
                break;
              case '\\':
                LOBYTE(v5) = 92;
                break;
              default:
                goto LABEL_82;
            }
            goto LABEL_4;
          }
          break;
        case 195:
        case 196:
        case 197:
        case 198:
        case 199:
        case 200:
        case 201:
        case 202:
        case 203:
        case 204:
        case 205:
        case 206:
        case 207:
        case 208:
        case 209:
        case 210:
        case 211:
        case 212:
        case 213:
        case 214:
        case 215:
        case 216:
        case 217:
        case 218:
        case 219:
        case 220:
        case 221:
        case 222:
        case 223:
        case 224:
          *(void *)&long long v14 = 0xBF00000080;
          unint64_t v6 = (std::string *)a1;
          unint64_t v7 = 2;
          goto LABEL_19;
        case 225:
          long long v8 = xmmword_1A7C67190;
          goto LABEL_7;
        case 226:
        case 227:
        case 228:
        case 229:
        case 230:
        case 231:
        case 232:
        case 233:
        case 234:
        case 235:
        case 236:
        case 237:
        case 239:
        case 240:
          long long v8 = xmmword_1A7C67180;
          goto LABEL_7;
        case 238:
          long long v8 = xmmword_1A7C67170;
LABEL_7:
          long long v14 = v8;
          unint64_t v6 = (std::string *)a1;
          unint64_t v7 = 4;
          goto LABEL_19;
        case 241:
          uint64_t v15 = 0xBF00000080;
          int v9 = &xmmword_1A7C67220;
          goto LABEL_18;
        case 242:
        case 243:
        case 244:
          uint64_t v15 = 0xBF00000080;
          int v9 = &xmmword_1A7C67238;
          goto LABEL_18;
        case 245:
          uint64_t v15 = 0xBF00000080;
          int v9 = &xmmword_1A7C67250;
LABEL_18:
          long long v14 = *v9;
          unint64_t v6 = (std::string *)a1;
          unint64_t v7 = 6;
LABEL_19:
          if ((nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::next_byte_in_range(v6, &v14, v7) & 1) == 0)return 14; {
          continue;
          }
        default:
          unint64_t v4 = "invalid string: ill-formed UTF-8 byte";
          goto LABEL_82;
      }
      break;
    }
    switch(v10)
    {
      case 'n':
        LOBYTE(v5) = 10;
        goto LABEL_4;
      case 'o':
      case 'p':
      case 'q':
      case 's':
        goto LABEL_82;
      case 'r':
        LOBYTE(v5) = 13;
        goto LABEL_4;
      case 't':
        LOBYTE(v5) = 9;
        goto LABEL_4;
      case 'u':
        unsigned int codepoint = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get_codepoint(a1);
        if (codepoint == -1) {
          goto LABEL_85;
        }
        unsigned int v12 = codepoint;
        if ((codepoint & 0xFFFFFC00) != 0xD800)
        {
          if ((codepoint & 0xFFFFFC00) == 0xDC00)
          {
            unint64_t v4 = "invalid string: surrogate U+DC00..U+DFFF must follow U+D800..U+DBFF";
            goto LABEL_82;
          }
          if (codepoint >= 0x110000) {
            nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan_string();
          }
          if (codepoint > 0x7F)
          {
            if (codepoint <= 0x7FF)
            {
              std::string::push_back((std::string *)(a1 + 72), (codepoint >> 6) | 0xC0);
              goto LABEL_39;
            }
            if (!HIWORD(codepoint))
            {
              std::string::push_back((std::string *)(a1 + 72), (codepoint >> 12) | 0xE0);
              goto LABEL_38;
            }
LABEL_37:
            std::string::push_back((std::string *)(a1 + 72), (v12 >> 18) | 0xF0);
            std::string::push_back((std::string *)(a1 + 72), (v12 >> 12) & 0x3F | 0x80);
LABEL_38:
            std::string::push_back((std::string *)(a1 + 72), (v12 >> 6) & 0x3F | 0x80);
LABEL_39:
            LOBYTE(v5) = v12 & 0x3F | 0x80;
            goto LABEL_4;
          }
          LOBYTE(v5) = codepoint;
LABEL_4:
          std::string::push_back((std::string *)(a1 + 72), v5);
          continue;
        }
        if (nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get((unsigned __int8 **)a1) != 92
          || nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get((unsigned __int8 **)a1) != 117)
        {
LABEL_86:
          unint64_t v4 = "invalid string: surrogate U+D800..U+DBFF must be followed by U+DC00..U+DFFF";
          goto LABEL_82;
        }
        unsigned int v13 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get_codepoint(a1);
        if (v13 != -1)
        {
          if (v13 >> 10 != 55) {
            goto LABEL_86;
          }
          unsigned int v12 = v13 + (v12 << 10) - 56613888;
          goto LABEL_37;
        }
LABEL_85:
        unint64_t v4 = "invalid string: '\\u' must be followed by 4 hex digits";
LABEL_82:
        *(void *)(a1 + 96) = v4;
        return 14;
      default:
        if (v10 == 98)
        {
          LOBYTE(v5) = 8;
        }
        else
        {
          if (v10 != 102) {
            goto LABEL_82;
          }
          LOBYTE(v5) = 12;
        }
        goto LABEL_4;
    }
  }
}

uint64_t nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan_number(uint64_t a1)
{
  v25[1] = *(char **)MEMORY[0x1E4F143B8];
  nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::reset(a1);
  int v2 = *(_DWORD *)(a1 + 16);
  if ((v2 - 49) >= 9)
  {
    if (v2 == 48)
    {
      std::string::push_back((std::string *)(a1 + 72), 48);
      int v4 = 5;
    }
    else
    {
      if (v2 != 45) {
        nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan_number();
      }
      int v3 = (std::string *)(a1 + 72);
      std::string::push_back((std::string *)(a1 + 72), 45);
      int v13 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get((unsigned __int8 **)a1);
      if ((v13 - 49) < 9)
      {
        int v2 = *(_DWORD *)(a1 + 16);
        int v4 = 6;
        goto LABEL_3;
      }
      if (v13 != 48)
      {
        long long v14 = "invalid number; expected digit after '-'";
        goto LABEL_52;
      }
      std::string::push_back((std::string *)(a1 + 72), *(unsigned char *)(a1 + 16));
      int v4 = 6;
    }
    int v15 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get((unsigned __int8 **)a1);
    if (v15 == 101 || v15 == 69)
    {
      int v5 = (std::string *)(a1 + 72);
      goto LABEL_9;
    }
    if (v15 != 46) {
      goto LABEL_40;
    }
    int v5 = (std::string *)(a1 + 72);
LABEL_34:
    std::string::push_back(v5, *(unsigned char *)(a1 + 128));
    if (nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get((unsigned __int8 **)a1)
       - 48 > 9)
    {
      long long v14 = "invalid number; expected digit after '.'";
      goto LABEL_52;
    }
    int v5 = (std::string *)(a1 + 72);
    do
    {
      std::string::push_back((std::string *)(a1 + 72), *(unsigned char *)(a1 + 16));
      int v16 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get((unsigned __int8 **)a1);
    }
    while ((v16 - 48) < 0xA);
    if (v16 != 101 && v16 != 69)
    {
LABEL_13:
      nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::unget(a1);
      v25[0] = 0;
      *__error() = 0;
      goto LABEL_14;
    }
LABEL_9:
    std::string::push_back(v5, *(unsigned char *)(a1 + 16));
    int v7 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get((unsigned __int8 **)a1);
    if ((v7 - 48) < 0xA)
    {
      long long v8 = (std::string *)(a1 + 72);
      goto LABEL_11;
    }
    if (v7 == 45 || v7 == 43)
    {
      long long v8 = (std::string *)(a1 + 72);
      std::string::push_back((std::string *)(a1 + 72), *(unsigned char *)(a1 + 16));
      if (nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get((unsigned __int8 **)a1)
         - 48 < 0xA)
      {
LABEL_11:
        std::string::push_back(v8, *(unsigned char *)(a1 + 16));
        if (nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get((unsigned __int8 **)a1)
           - 48 <= 9)
        {
          do
            std::string::push_back((std::string *)(a1 + 72), *(unsigned char *)(a1 + 16));
          while (nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get((unsigned __int8 **)a1)
                - 48 < 0xA);
        }
        goto LABEL_13;
      }
      long long v14 = "invalid number; expected digit after exponent sign";
    }
    else
    {
      long long v14 = "invalid number; expected '+', '-', or digit after exponent";
    }
LABEL_52:
    *(void *)(a1 + 96) = v14;
    return 14;
  }
  int v3 = (std::string *)(a1 + 72);
  int v4 = 5;
LABEL_3:
  std::string::push_back(v3, v2);
  int v5 = (std::string *)(a1 + 72);
  while (1)
  {
    int v6 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get((unsigned __int8 **)a1);
    if ((v6 - 48) >= 0xA) {
      break;
    }
    std::string::push_back((std::string *)(a1 + 72), *(unsigned char *)(a1 + 16));
  }
  if (v6 == 46) {
    goto LABEL_34;
  }
  if (v6 == 69 || v6 == 101) {
    goto LABEL_9;
  }
LABEL_40:
  nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::unget(a1);
  v25[0] = 0;
  *__error() = 0;
  if (v4 == 6)
  {
    unint64_t v21 = (const char **)(a1 + 72);
    long long v22 = (const char *)(a1 + 72);
    if (*(char *)(a1 + 95) < 0) {
      long long v22 = *v21;
    }
    uint64_t v23 = strtoll(v22, v25, 10);
    if (*(char *)(a1 + 95) < 0)
    {
      unint64_t v21 = *(const char ***)(a1 + 72);
      uint64_t v24 = *(void *)(a1 + 80);
    }
    else
    {
      uint64_t v24 = *(unsigned __int8 *)(a1 + 95);
    }
    if (v25[0] != (char *)v21 + v24) {
      nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan_number();
    }
    if (!*__error())
    {
      *(void *)(a1 + 104) = v23;
      return 6;
    }
  }
  else
  {
    uint64_t v17 = (const char **)(a1 + 72);
    uint64_t v18 = (const char *)(a1 + 72);
    if (*(char *)(a1 + 95) < 0) {
      uint64_t v18 = *v17;
    }
    unint64_t v19 = strtoull(v18, v25, 10);
    if (*(char *)(a1 + 95) < 0)
    {
      uint64_t v17 = *(const char ***)(a1 + 72);
      uint64_t v20 = *(void *)(a1 + 80);
    }
    else
    {
      uint64_t v20 = *(unsigned __int8 *)(a1 + 95);
    }
    if (v25[0] != (char *)v17 + v20) {
      nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan_number();
    }
    if (!*__error())
    {
      *(void *)(a1 + 112) = v19;
      return 5;
    }
  }
LABEL_14:
  int v9 = (const char **)(a1 + 72);
  int v10 = (const char *)(a1 + 72);
  if (*(char *)(a1 + 95) < 0) {
    int v10 = *v9;
  }
  *(double *)(a1 + 120) = strtod(v10, v25);
  if (*(char *)(a1 + 95) < 0)
  {
    int v9 = *(const char ***)(a1 + 72);
    uint64_t v11 = *(void *)(a1 + 80);
  }
  else
  {
    uint64_t v11 = *(unsigned __int8 *)(a1 + 95);
  }
  if (v25[0] != (char *)v9 + v11) {
    nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan_number();
  }
  return 7;
}

void sub_1A7C537EC(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

uint64_t nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::unget(uint64_t result)
{
  int v1 = (void *)(result + 32);
  uint64_t v2 = *(void *)(result + 32);
  *(unsigned char *)(result + 20) = 1;
  --*(void *)(result + 24);
  if (v2 || (int v1 = (void *)(result + 40), (v2 = *(void *)(result + 40)) != 0)) {
    *int v1 = v2 - 1;
  }
  if (*(_DWORD *)(result + 16) != -1)
  {
    uint64_t v3 = *(void *)(result + 56);
    if (*(void *)(result + 48) == v3) {
      nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::unget();
    }
    *(void *)(result + 56) = v3 - 1;
  }
  return result;
}

void nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::reset(uint64_t a1)
{
  if (*(char *)(a1 + 95) < 0)
  {
    **(unsigned char **)(a1 + 72) = 0;
    *(void *)(a1 + 80) = 0;
  }
  else
  {
    *(unsigned char *)(a1 + 72) = 0;
    *(unsigned char *)(a1 + 95) = 0;
  }
  uint64_t v2 = *(unsigned char **)(a1 + 48);
  *(void *)(a1 + 56) = v2;
  int v3 = *(_DWORD *)(a1 + 16);
  unint64_t v4 = *(void *)(a1 + 64);
  if ((unint64_t)v2 >= v4)
  {
    unint64_t v6 = v4 - (void)v2;
    uint64_t v7 = 2 * v6;
    if (2 * v6 <= 1) {
      uint64_t v7 = 1;
    }
    if (v6 >= 0x3FFFFFFFFFFFFFFFLL) {
      size_t v8 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      size_t v8 = v7;
    }
    int v9 = operator new(v8);
    *int v9 = v3;
    int v5 = v9 + 1;
    *(void *)(a1 + 48) = v9;
    *(void *)(a1 + 56) = v9 + 1;
    *(void *)(a1 + 64) = &v9[v8];
    if (v2) {
      operator delete(v2);
    }
  }
  else
  {
    unsigned char *v2 = v3;
    int v5 = v2 + 1;
  }
  *(void *)(a1 + 56) = v5;
}

uint64_t nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get_codepoint(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (*(_DWORD *)(a1 + 16) != 117) {
    nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get_codepoint();
  }
  uint64_t v2 = 0;
  LODWORD(v3) = 0;
  long long v8 = xmmword_1A7C671A0;
  do
  {
    int v4 = *(_DWORD *)((char *)&v8 + v2);
    nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get((unsigned __int8 **)a1);
    int v5 = *(_DWORD *)(a1 + 16);
    int v6 = v5 - 48;
    if ((v5 - 48) >= 0xA)
    {
      if ((v5 - 65) > 5)
      {
        if ((v5 - 97) > 5) {
          return 0xFFFFFFFFLL;
        }
        int v6 = v5 - 87;
      }
      else
      {
        int v6 = v5 - 55;
      }
    }
    uint64_t v3 = ((v6 << v4) + v3);
    v2 += 4;
  }
  while (v2 != 16);
  if (v3 >= 0x10000) {
    nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get_codepoint();
  }
  return v3;
}

uint64_t nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::next_byte_in_range(std::string *a1, _DWORD *a2, unint64_t a3)
{
  if (a3 > 6 || ((1 << a3) & 0x54) == 0) {
    nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::next_byte_in_range();
  }
  int v6 = a1 + 3;
  std::string::push_back(a1 + 3, a1->__r_.__value_.__s.__data_[16]);
  uint64_t v7 = &a2[a3];
  while (1)
  {
    nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get((unsigned __int8 **)a1);
    int v8 = a1->__r_.__value_.__r.__words[2];
    if (*a2 > v8 || v8 > a2[1]) {
      break;
    }
    std::string::push_back(v6, v8);
    a2 += 2;
    if (a2 == v7) {
      return 1;
    }
  }
  uint64_t result = 0;
  a1[4].__r_.__value_.__r.__words[0] = (std::string::size_type)"invalid string: ill-formed UTF-8 byte";
  return result;
}

uint64_t nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::~lexer(uint64_t a1)
{
  if (*(char *)(a1 + 95) < 0) {
    operator delete(*(void **)(a1 + 72));
  }
  uint64_t v2 = *(void **)(a1 + 48);
  if (v2)
  {
    *(void *)(a1 + 56) = v2;
    operator delete(v2);
  }
  return a1;
}

uint64_t nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::sax_parse_internal<nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>(uint64_t a1, uint64_t *a2)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  long long v40 = 0;
  uint64_t v41 = 0;
  uint64_t v42 = 0;
  int v4 = (long long *)(a1 + 112);
  uint64_t v5 = a1 + 40;
  while (2)
  {
    switch(*(_DWORD *)(a1 + 32))
    {
      case 1:
        LOBYTE(v37.__vftable) = 1;
        nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<BOOL &>(a2, (unsigned __int8 *)&v37, 0);
        goto LABEL_19;
      case 2:
        LOBYTE(v37.__vftable) = 0;
        nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<BOOL &>(a2, (unsigned __int8 *)&v37, 0);
        goto LABEL_19;
      case 3:
        v37.__vftable = 0;
        nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<decltype(nullptr)>(a2, (uint64_t)&v37, 0);
        goto LABEL_19;
      case 4:
        nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<std::string&>(a2, (uint64_t)v4, 0);
        goto LABEL_19;
      case 5:
        v37.__vftable = *(std::exception_vtbl **)(a1 + 152);
        nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<unsigned long long &>(a2, (uint64_t **)&v37, 0);
        goto LABEL_19;
      case 6:
        v37.__vftable = *(std::exception_vtbl **)(a1 + 144);
        nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<long long &>(a2, (uint64_t **)&v37, 0);
        goto LABEL_19;
      case 7:
        if ((*(void *)(a1 + 160) & 0x7FFFFFFFFFFFFFFFuLL) < 0x7FF0000000000000)
        {
          v37.__vftable = *(std::exception_vtbl **)(a1 + 160);
          nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<double &>(a2, (uint64_t **)&v37, 0);
          goto LABEL_19;
        }
        uint64_t v28 = *(void *)(a1 + 64);
        nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get_token_string(v5, &v39);
        nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get_token_string(v5, &v33);
        long long v29 = std::string::insert(&v33, 0, "number overflow parsing '");
        long long v30 = *(_OWORD *)&v29->__r_.__value_.__l.__data_;
        __p.__r_.__value_.__r.__words[2] = v29->__r_.__value_.__r.__words[2];
        *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v30;
        v29->__r_.__value_.__l.__size_ = 0;
        v29->__r_.__value_.__r.__words[2] = 0;
        v29->__r_.__value_.__r.__words[0] = 0;
        std::exception v31 = std::string::append(&__p, "'");
        long long v32 = *(_OWORD *)&v31->__r_.__value_.__l.__data_;
        std::string::size_type v36 = v31->__r_.__value_.__r.__words[2];
        *(_OWORD *)uint64_t v35 = v32;
        v31->__r_.__value_.__l.__size_ = 0;
        v31->__r_.__value_.__r.__words[2] = 0;
        v31->__r_.__value_.__r.__words[0] = 0;
        nlohmann::detail::out_of_range::create(406, (uint64_t)v35, (nlohmann::detail::exception *)&v37);
        uint64_t v17 = nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::parse_error((uint64_t)a2, v28, (uint64_t)&v39, (const nlohmann::detail::parse_error *)&v37);
        nlohmann::detail::out_of_range::~out_of_range(&v37);
        if (SHIBYTE(v36) < 0) {
          operator delete(v35[0]);
        }
        goto LABEL_50;
      case 8:
        if (!nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::start_array(a2, 0xFFFFFFFFFFFFFFFFLL))goto LABEL_56; {
        int v6 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan(v5);
        }
        *(_DWORD *)(a1 + 32) = v6;
        if (v6 == 10)
        {
          char v7 = nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::end_array(a2);
          goto LABEL_13;
        }
        LOBYTE(v37.__vftable) = 1;
        std::vector<BOOL>::push_back((uint64_t)&v40, &v37);
        continue;
      case 9:
        if ((nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::start_object(a2, 0xFFFFFFFFFFFFFFFFLL) & 1) == 0)goto LABEL_56; {
        int v8 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan(v5);
        }
        *(_DWORD *)(a1 + 32) = v8;
        if (v8 != 11)
        {
          if (v8 != 4) {
            goto LABEL_59;
          }
          if (!nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::key(a2, v4))goto LABEL_56; {
          int v16 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan(v5);
          }
          *(_DWORD *)(a1 + 32) = v16;
          if (v16 != 12) {
            goto LABEL_60;
          }
          LOBYTE(v37.__vftable) = 0;
          std::vector<BOOL>::push_back((uint64_t)&v40, &v37);
          int v15 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan(v5);
LABEL_37:
          *(_DWORD *)(a1 + 32) = v15;
          continue;
        }
        char v7 = nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::end_object(a2);
LABEL_13:
        if ((v7 & 1) == 0)
        {
LABEL_56:
          uint64_t v17 = 0;
          goto LABEL_44;
        }
LABEL_19:
        uint64_t v9 = v41;
        if (!v41)
        {
LABEL_43:
          uint64_t v17 = 1;
          goto LABEL_44;
        }
        while (2)
        {
          if ((*(void *)&v40[((unint64_t)(v9 - 1) >> 3) & 0x1FFFFFFFFFFFFFF8] >> (v9 - 1)))
          {
            int v10 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan(v5);
            *(_DWORD *)(a1 + 32) = v10;
            if (v10 == 13) {
              goto LABEL_36;
            }
            if (v10 != 10)
            {
              uint64_t v22 = *(void *)(a1 + 64);
              nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get_token_string(v5, &v39);
              *(_OWORD *)uint64_t v35 = *(_OWORD *)(a1 + 64);
              std::string::size_type v36 = *(void *)(a1 + 80);
              std::string::basic_string[abi:ne180100]<0>(&v33, "array");
              nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::exception_message(a1, 0xAu, (uint64_t)&v33, &__p);
              nlohmann::detail::parse_error::create(101, (uint64_t *)v35, (uint64_t)&__p, (nlohmann::detail::exception *)&v37);
              uint64_t v23 = nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::parse_error((uint64_t)a2, v22, (uint64_t)&v39, (const nlohmann::detail::parse_error *)&v37);
              goto LABEL_61;
            }
            if (!nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::end_array(a2)) {
              goto LABEL_56;
            }
            uint64_t v11 = v41;
            if (!v41)
            {
              int v24 = 383;
              goto LABEL_63;
            }
LABEL_30:
            uint64_t v9 = v11 - 1;
            uint64_t v41 = v9;
            if (!v9) {
              goto LABEL_43;
            }
            continue;
          }
          break;
        }
        int v12 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan(v5);
        *(_DWORD *)(a1 + 32) = v12;
        if (v12 != 13)
        {
          if (v12 != 11)
          {
            uint64_t v25 = *(void *)(a1 + 64);
            nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get_token_string(v5, &v39);
            *(_OWORD *)uint64_t v35 = *(_OWORD *)(a1 + 64);
            std::string::size_type v36 = *(void *)(a1 + 80);
            std::string::basic_string[abi:ne180100]<0>(&v33, "object");
            nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::exception_message(a1, 0xBu, (uint64_t)&v33, &__p);
            nlohmann::detail::parse_error::create(101, (uint64_t *)v35, (uint64_t)&__p, (nlohmann::detail::exception *)&v37);
            uint64_t v23 = nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::parse_error((uint64_t)a2, v25, (uint64_t)&v39, (const nlohmann::detail::parse_error *)&v37);
            goto LABEL_61;
          }
          if (!nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::end_object(a2)) {
            goto LABEL_56;
          }
          uint64_t v11 = v41;
          if (!v41)
          {
            int v24 = 439;
LABEL_63:
            __assert_rtn("sax_parse_internal", "parser.hpp", v24, "not states.empty()");
          }
          goto LABEL_30;
        }
        int v13 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan(v5);
        *(_DWORD *)(a1 + 32) = v13;
        if (v13 != 4)
        {
LABEL_59:
          uint64_t v26 = *(void *)(a1 + 64);
          nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get_token_string(v5, &v39);
          *(_OWORD *)uint64_t v35 = *(_OWORD *)(a1 + 64);
          std::string::size_type v36 = *(void *)(a1 + 80);
          std::string::basic_string[abi:ne180100]<0>(&v33, "object key");
          nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::exception_message(a1, 4u, (uint64_t)&v33, &__p);
          nlohmann::detail::parse_error::create(101, (uint64_t *)v35, (uint64_t)&__p, (nlohmann::detail::exception *)&v37);
          uint64_t v23 = nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::parse_error((uint64_t)a2, v26, (uint64_t)&v39, (const nlohmann::detail::parse_error *)&v37);
          goto LABEL_61;
        }
        if (!nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::key(a2, v4))goto LABEL_56; {
        int v14 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan(v5);
        }
        *(_DWORD *)(a1 + 32) = v14;
        if (v14 == 12)
        {
LABEL_36:
          int v15 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan(v5);
          goto LABEL_37;
        }
LABEL_60:
        uint64_t v27 = *(void *)(a1 + 64);
        nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get_token_string(v5, &v39);
        *(_OWORD *)uint64_t v35 = *(_OWORD *)(a1 + 64);
        std::string::size_type v36 = *(void *)(a1 + 80);
        std::string::basic_string[abi:ne180100]<0>(&v33, "object separator");
        nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::exception_message(a1, 0xCu, (uint64_t)&v33, &__p);
        nlohmann::detail::parse_error::create(101, (uint64_t *)v35, (uint64_t)&__p, (nlohmann::detail::exception *)&v37);
        uint64_t v23 = nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::parse_error((uint64_t)a2, v27, (uint64_t)&v39, (const nlohmann::detail::parse_error *)&v37);
LABEL_61:
        uint64_t v17 = v23;
        nlohmann::detail::parse_error::~parse_error(&v37);
LABEL_50:
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__p.__r_.__value_.__l.__data_);
        }
        if (SHIBYTE(v33.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v33.__r_.__value_.__l.__data_);
        }
        if (SHIBYTE(v39.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v39.__r_.__value_.__l.__data_);
        }
LABEL_44:
        if (v40) {
          operator delete(v40);
        }
        return v17;
      case 0xE:
        uint64_t v19 = *(void *)(a1 + 64);
        nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get_token_string(v5, &v39);
        *(_OWORD *)uint64_t v35 = *(_OWORD *)(a1 + 64);
        std::string::size_type v36 = *(void *)(a1 + 80);
        std::string::basic_string[abi:ne180100]<0>(&v33, "value");
        nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::exception_message(a1, 0, (uint64_t)&v33, &__p);
        nlohmann::detail::parse_error::create(101, (uint64_t *)v35, (uint64_t)&__p, (nlohmann::detail::exception *)&v37);
        uint64_t v20 = nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::parse_error((uint64_t)a2, v19, (uint64_t)&v39, (const nlohmann::detail::parse_error *)&v37);
        goto LABEL_49;
      default:
        uint64_t v21 = *(void *)(a1 + 64);
        nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get_token_string(v5, &v39);
        *(_OWORD *)uint64_t v35 = *(_OWORD *)(a1 + 64);
        std::string::size_type v36 = *(void *)(a1 + 80);
        std::string::basic_string[abi:ne180100]<0>(&v33, "value");
        nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::exception_message(a1, 0x10u, (uint64_t)&v33, &__p);
        nlohmann::detail::parse_error::create(101, (uint64_t *)v35, (uint64_t)&__p, (nlohmann::detail::exception *)&v37);
        uint64_t v20 = nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::parse_error((uint64_t)a2, v21, (uint64_t)&v39, (const nlohmann::detail::parse_error *)&v37);
LABEL_49:
        uint64_t v17 = v20;
        v37.__vftable = (std::exception_vtbl *)&unk_1EFE15F38;
        MEMORY[0x1AD0D68C0](&v38);
        std::exception::~exception(&v37);
        goto LABEL_50;
    }
  }
}

void sub_1A7C543E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28,uint64_t a29,std::exception a30)
{
  nlohmann::detail::parse_error::~parse_error(&a30);
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a15 < 0) {
    operator delete(a10);
  }
  if (*(char *)(v30 - 97) < 0) {
    operator delete(*(void **)(v30 - 120));
  }
  long long v32 = *(void **)(v30 - 96);
  if (v32) {
    operator delete(v32);
  }
  _Unwind_Resume(a1);
}

uint64_t nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::parse_error(uint64_t a1, uint64_t a2, uint64_t a3, const nlohmann::detail::parse_error *a4)
{
  *(unsigned char *)(a1 + 88) = 1;
  if (*(unsigned char *)(a1 + 128))
  {
    switch(~(100 * (*((_DWORD *)a4 + 2) / 100 / 100)) + *((_DWORD *)a4 + 2) / 100)
    {
      case 0:
        exception = (nlohmann::detail::parse_error *)__cxa_allocate_exception(0x28uLL);
        int v6 = nlohmann::detail::parse_error::parse_error(exception, a4);
        int v8 = (void (*)(void *))nlohmann::detail::parse_error::~parse_error;
        break;
      case 1:
        uint64_t v9 = (nlohmann::detail::invalid_iterator *)__cxa_allocate_exception(0x20uLL);
        int v6 = nlohmann::detail::invalid_iterator::invalid_iterator(v9, a4);
        int v8 = (void (*)(void *))nlohmann::detail::invalid_iterator::~invalid_iterator;
        break;
      case 2:
        int v10 = (nlohmann::detail::type_error *)__cxa_allocate_exception(0x20uLL);
        int v6 = nlohmann::detail::type_error::type_error(v10, a4);
        int v8 = (void (*)(void *))nlohmann::detail::type_error::~type_error;
        break;
      case 3:
        uint64_t v11 = (nlohmann::detail::out_of_range *)__cxa_allocate_exception(0x20uLL);
        int v6 = nlohmann::detail::out_of_range::out_of_range(v11, a4);
        int v8 = (void (*)(void *))nlohmann::detail::out_of_range::~out_of_range;
        break;
      case 4:
        int v12 = (nlohmann::detail::other_error *)__cxa_allocate_exception(0x20uLL);
        int v6 = nlohmann::detail::other_error::other_error(v12, a4);
        int v8 = (void (*)(void *))nlohmann::detail::other_error::~other_error;
        break;
      default:
        nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::parse_error();
    }
    __cxa_throw(v6, v7, v8);
  }
  return 0;
}

void nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get_token_string(uint64_t a1@<X0>, std::string *a2@<X8>)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  a2->__r_.__value_.__r.__words[0] = 0;
  a2->__r_.__value_.__l.__size_ = 0;
  a2->__r_.__value_.__r.__words[2] = 0;
  uint64_t v3 = *(unsigned __int8 **)(a1 + 48);
  for (uint64_t i = *(unsigned __int8 **)(a1 + 56); v3 != i; ++v3)
  {
    unsigned int v5 = *v3;
    if (v5 > 0x1F)
    {
      std::string::push_back(a2, v5);
    }
    else
    {
      char v7 = 0;
      *(void *)__str = 0;
      snprintf(__str, 9uLL, "<U+%.4X>", v5);
      std::string::append(a2, __str);
    }
  }
}

void sub_1A7C547A4(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void nlohmann::detail::parse_error::create(int a1@<W0>, uint64_t *a2@<X1>, uint64_t a3@<X2>, nlohmann::detail::exception *a4@<X8>)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  memset(v30, 170, sizeof(v30));
  std::string::basic_string[abi:ne180100]<0>(&v24, "parse_error");
  nlohmann::detail::exception::name(a1, &v26);
  uint64_t v8 = std::string::append(&v26, "parse error");
  long long v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
  v27.__r_.__value_.__r.__words[2] = v8->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v27.__r_.__value_.__l.__data_ = v9;
  v8->__r_.__value_.__l.__size_ = 0;
  v8->__r_.__value_.__r.__words[2] = 0;
  v8->__r_.__value_.__r.__words[0] = 0;
  nlohmann::detail::parse_error::position_string((uint64_t)a2, &__p);
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
  int v12 = std::string::append(&v27, (const std::string::value_type *)p_p, size);
  long long v13 = *(_OWORD *)&v12->__r_.__value_.__l.__data_;
  v28.__r_.__value_.__r.__words[2] = v12->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v28.__r_.__value_.__l.__data_ = v13;
  v12->__r_.__value_.__l.__size_ = 0;
  v12->__r_.__value_.__r.__words[2] = 0;
  v12->__r_.__value_.__r.__words[0] = 0;
  int v14 = std::string::append(&v28, ": ");
  long long v15 = *(_OWORD *)&v14->__r_.__value_.__l.__data_;
  v29.__r_.__value_.__r.__words[2] = v14->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v29.__r_.__value_.__l.__data_ = v15;
  v14->__r_.__value_.__l.__size_ = 0;
  v14->__r_.__value_.__r.__words[2] = 0;
  v14->__r_.__value_.__r.__words[0] = 0;
  int v16 = *(char *)(a3 + 23);
  if (v16 >= 0) {
    uint64_t v17 = (const std::string::value_type *)a3;
  }
  else {
    uint64_t v17 = *(const std::string::value_type **)a3;
  }
  if (v16 >= 0) {
    std::string::size_type v18 = *(unsigned __int8 *)(a3 + 23);
  }
  else {
    std::string::size_type v18 = *(void *)(a3 + 8);
  }
  uint64_t v19 = std::string::append(&v29, v17, v18);
  long long v20 = *(_OWORD *)&v19->__r_.__value_.__l.__data_;
  *(void *)&v30[16] = *((void *)&v19->__r_.__value_.__l + 2);
  *(_OWORD *)uint64_t v30 = v20;
  v19->__r_.__value_.__l.__size_ = 0;
  v19->__r_.__value_.__r.__words[2] = 0;
  v19->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v29.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v29.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v28.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v28.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v27.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v27.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v26.__r_.__value_.__l.__data_);
  }
  if (v25 < 0) {
    operator delete(v24);
  }
  uint64_t v21 = *a2;
  if (v30[23] >= 0) {
    uint64_t v22 = v30;
  }
  else {
    uint64_t v22 = *(const char **)v30;
  }
  nlohmann::detail::exception::exception(a4, a1, v22);
  *(void *)a4 = &unk_1EFE15E90;
  *((void *)a4 + 4) = v21;
  if ((v30[23] & 0x80000000) != 0) {
    operator delete(*(void **)v30);
  }
}

void sub_1A7C549E8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33,uint64_t a34,void *__p,uint64_t a36,int a37,__int16 a38,char a39,char a40)
{
  if (*(char *)(v40 - 57) < 0) {
    operator delete(*(void **)(v40 - 80));
  }
  _Unwind_Resume(exception_object);
}

void nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::exception_message(uint64_t a1@<X0>, unsigned int a2@<W1>, uint64_t a3@<X2>, std::string *a4@<X8>)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  memset(a4, 170, sizeof(std::string));
  std::string::basic_string[abi:ne180100]<0>(a4, "syntax error ");
  uint64_t v8 = *(unsigned __int8 *)(a3 + 23);
  if ((v8 & 0x80u) != 0) {
    uint64_t v8 = *(void *)(a3 + 8);
  }
  if (v8)
  {
    std::operator+<char>();
    long long v9 = std::string::append(&v38, " ");
    long long v10 = *(_OWORD *)&v9->__r_.__value_.__l.__data_;
    int64_t v40 = v9->__r_.__value_.__r.__words[2];
    long long v39 = v10;
    v9->__r_.__value_.__l.__size_ = 0;
    v9->__r_.__value_.__r.__words[2] = 0;
    v9->__r_.__value_.__r.__words[0] = 0;
    if (v40 >= 0) {
      uint64_t v11 = (const std::string::value_type *)&v39;
    }
    else {
      uint64_t v11 = (const std::string::value_type *)v39;
    }
    if (v40 >= 0) {
      std::string::size_type v12 = HIBYTE(v40);
    }
    else {
      std::string::size_type v12 = *((void *)&v39 + 1);
    }
    std::string::append(a4, v11, v12);
    if (SHIBYTE(v40) < 0) {
      operator delete((void *)v39);
    }
    if (SHIBYTE(v38.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v38.__r_.__value_.__l.__data_);
    }
  }
  std::string::append(a4, "- ");
  unsigned int v13 = *(_DWORD *)(a1 + 32);
  if (v13 == 14)
  {
    std::string::basic_string[abi:ne180100]<0>(&v36, *(char **)(a1 + 136));
    int v14 = std::string::append(&v36, "; last read: '");
    long long v15 = *(_OWORD *)&v14->__r_.__value_.__l.__data_;
    v37.__r_.__value_.__r.__words[2] = v14->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v37.__r_.__value_.__l.__data_ = v15;
    v14->__r_.__value_.__l.__size_ = 0;
    v14->__r_.__value_.__r.__words[2] = 0;
    v14->__r_.__value_.__r.__words[0] = 0;
    nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get_token_string(a1 + 40, &__p);
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
    std::string::size_type v18 = std::string::append(&v37, (const std::string::value_type *)p_p, size);
    long long v19 = *(_OWORD *)&v18->__r_.__value_.__l.__data_;
    v38.__r_.__value_.__r.__words[2] = v18->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v38.__r_.__value_.__l.__data_ = v19;
    v18->__r_.__value_.__l.__size_ = 0;
    v18->__r_.__value_.__r.__words[2] = 0;
    v18->__r_.__value_.__r.__words[0] = 0;
    long long v20 = std::string::append(&v38, "'");
    long long v21 = *(_OWORD *)&v20->__r_.__value_.__l.__data_;
    int64_t v40 = v20->__r_.__value_.__r.__words[2];
    long long v39 = v21;
    v20->__r_.__value_.__l.__size_ = 0;
    v20->__r_.__value_.__r.__words[2] = 0;
    v20->__r_.__value_.__r.__words[0] = 0;
    if (v40 >= 0) {
      uint64_t v22 = (const std::string::value_type *)&v39;
    }
    else {
      uint64_t v22 = (const std::string::value_type *)v39;
    }
    if (v40 >= 0) {
      std::string::size_type v23 = HIBYTE(v40);
    }
    else {
      std::string::size_type v23 = *((void *)&v39 + 1);
    }
    std::string::append(a4, v22, v23);
    if (SHIBYTE(v40) < 0) {
      operator delete((void *)v39);
    }
    if (SHIBYTE(v38.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v38.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v37.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v37.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v36.__r_.__value_.__r.__words[2]) < 0)
    {
      int v24 = (void *)v36.__r_.__value_.__r.__words[0];
      goto LABEL_49;
    }
LABEL_46:
    if (!a2) {
      return;
    }
    goto LABEL_50;
  }
  char v25 = (char *)nlohmann::detail::lexer_base<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::token_type_name(v13);
  std::string::basic_string[abi:ne180100]<0>(&v38, v25);
  std::string v26 = std::string::insert(&v38, 0, "unexpected ");
  long long v27 = *(_OWORD *)&v26->__r_.__value_.__l.__data_;
  int64_t v40 = v26->__r_.__value_.__r.__words[2];
  long long v39 = v27;
  v26->__r_.__value_.__l.__size_ = 0;
  v26->__r_.__value_.__r.__words[2] = 0;
  v26->__r_.__value_.__r.__words[0] = 0;
  if (v40 >= 0) {
    std::string v28 = (const std::string::value_type *)&v39;
  }
  else {
    std::string v28 = (const std::string::value_type *)v39;
  }
  if (v40 >= 0) {
    std::string::size_type v29 = HIBYTE(v40);
  }
  else {
    std::string::size_type v29 = *((void *)&v39 + 1);
  }
  std::string::append(a4, v28, v29);
  if (SHIBYTE(v40) < 0) {
    operator delete((void *)v39);
  }
  if ((SHIBYTE(v38.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
    goto LABEL_46;
  }
  int v24 = (void *)v38.__r_.__value_.__r.__words[0];
LABEL_49:
  operator delete(v24);
  if (!a2) {
    return;
  }
LABEL_50:
  uint64_t v30 = (char *)nlohmann::detail::lexer_base<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::token_type_name(a2);
  std::string::basic_string[abi:ne180100]<0>(&v38, v30);
  uint64_t v31 = std::string::insert(&v38, 0, "; expected ");
  long long v32 = *(_OWORD *)&v31->__r_.__value_.__l.__data_;
  int64_t v40 = v31->__r_.__value_.__r.__words[2];
  long long v39 = v32;
  v31->__r_.__value_.__l.__size_ = 0;
  v31->__r_.__value_.__r.__words[2] = 0;
  v31->__r_.__value_.__r.__words[0] = 0;
  if (v40 >= 0) {
    std::string v33 = (const std::string::value_type *)&v39;
  }
  else {
    std::string v33 = (const std::string::value_type *)v39;
  }
  if (v40 >= 0) {
    std::string::size_type v34 = HIBYTE(v40);
  }
  else {
    std::string::size_type v34 = *((void *)&v39 + 1);
  }
  std::string::append(a4, v33, v34);
  if (SHIBYTE(v40) < 0) {
    operator delete((void *)v39);
  }
  if (SHIBYTE(v38.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v38.__r_.__value_.__l.__data_);
  }
}

void sub_1A7C54DFC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,uint64_t a27,void *__p,uint64_t a29,int a30,__int16 a31,char a32,char a33)
{
  if (*(char *)(v34 - 41) < 0) {
    operator delete(*(void **)(v34 - 64));
  }
  if (a33 < 0) {
    operator delete(__p);
  }
  if (a14 < 0) {
    operator delete(a9);
  }
  if (a26 < 0) {
    operator delete(a21);
  }
  if (a20 < 0) {
    operator delete(a15);
  }
  if (*(char *)(v33 + 23) < 0) {
    operator delete(*(void **)v33);
  }
  _Unwind_Resume(exception_object);
}

void nlohmann::detail::parse_error::~parse_error(std::exception *this)
{
  this->__vftable = (std::exception_vtbl *)&unk_1EFE15F38;
  MEMORY[0x1AD0D68C0](&this[2]);

  std::exception::~exception(this);
}

{
  uint64_t vars8;

  this->__vftable = (std::exception_vtbl *)&unk_1EFE15F38;
  MEMORY[0x1AD0D68C0](&this[2]);
  std::exception::~exception(this);

  JUMPOUT(0x1AD0D6A20);
}

uint64_t nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::sax_parse_internal<nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>(uint64_t a1, uint64_t *a2)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  uint64_t v41 = 0;
  uint64_t v42 = 0;
  uint64_t v43 = 0;
  int v4 = (std::exception_vtbl *)(a1 + 112);
  uint64_t v5 = a1 + 40;
  while (2)
  {
    switch(*(_DWORD *)(a1 + 32))
    {
      case 1:
        LOBYTE(v38.__vftable) = 1;
        nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<BOOL &>(a2, (unsigned __int8 *)&v38);
        goto LABEL_17;
      case 2:
        LOBYTE(v38.__vftable) = 0;
        nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<BOOL &>(a2, (unsigned __int8 *)&v38);
        goto LABEL_17;
      case 3:
        v38.__vftable = 0;
        nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<decltype(nullptr)>(a2);
        goto LABEL_17;
      case 4:
        nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<std::string&>(a2, (uint64_t)v4);
        goto LABEL_17;
      case 5:
        v38.__vftable = *(std::exception_vtbl **)(a1 + 152);
        nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<unsigned long long &>(a2, (uint64_t *)&v38);
        goto LABEL_17;
      case 6:
        v38.__vftable = *(std::exception_vtbl **)(a1 + 144);
        nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<long long &>(a2, (uint64_t *)&v38);
        goto LABEL_17;
      case 7:
        if ((*(void *)(a1 + 160) & 0x7FFFFFFFFFFFFFFFuLL) < 0x7FF0000000000000)
        {
          v38.__vftable = *(std::exception_vtbl **)(a1 + 160);
          nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<double &>(a2, (uint64_t *)&v38);
          goto LABEL_17;
        }
        uint64_t v29 = *(void *)(a1 + 64);
        nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get_token_string(v5, &v40);
        nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get_token_string(v5, &v34);
        uint64_t v30 = std::string::insert(&v34, 0, "number overflow parsing '");
        long long v31 = *(_OWORD *)&v30->__r_.__value_.__l.__data_;
        __p.__r_.__value_.__r.__words[2] = v30->__r_.__value_.__r.__words[2];
        *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v31;
        v30->__r_.__value_.__l.__size_ = 0;
        v30->__r_.__value_.__r.__words[2] = 0;
        v30->__r_.__value_.__r.__words[0] = 0;
        long long v32 = std::string::append(&__p, "'");
        long long v33 = *(_OWORD *)&v32->__r_.__value_.__l.__data_;
        std::string::size_type v37 = v32->__r_.__value_.__r.__words[2];
        *(_OWORD *)std::string v36 = v33;
        v32->__r_.__value_.__l.__size_ = 0;
        v32->__r_.__value_.__r.__words[2] = 0;
        v32->__r_.__value_.__r.__words[0] = 0;
        nlohmann::detail::out_of_range::create(406, (uint64_t)v36, (nlohmann::detail::exception *)&v38);
        uint64_t v18 = nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::parse_error((uint64_t)a2, v29, (uint64_t)&v40, (const nlohmann::detail::parse_error *)&v38);
        nlohmann::detail::out_of_range::~out_of_range(&v38);
        if (SHIBYTE(v37) < 0) {
          operator delete(v36[0]);
        }
        goto LABEL_43;
      case 8:
        if (!nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::start_array(a2, 0xFFFFFFFFFFFFFFFFLL))goto LABEL_56; {
        int v6 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan(v5);
        }
        *(_DWORD *)(a1 + 32) = v6;
        if (v6 == 10) {
          goto LABEL_12;
        }
        LOBYTE(v38.__vftable) = 1;
        std::vector<BOOL>::push_back((uint64_t)&v41, &v38);
        continue;
      case 9:
        if ((nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::start_object(a2, 0xFFFFFFFFFFFFFFFFLL) & 1) == 0)
        {
LABEL_56:
          uint64_t v18 = 0;
          goto LABEL_37;
        }
        int v7 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan(v5);
        *(_DWORD *)(a1 + 32) = v7;
        if (v7 != 11)
        {
          if (v7 != 4) {
            goto LABEL_51;
          }
          int v16 = *(uint64_t ***)(*(void *)(a2[2] - 8) + 8);
          v38.__vftable = v4;
          a2[4] = (uint64_t)(std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v16, (const void **)&v4->~exception, (uint64_t)&std::piecewise_construct, (long long **)&v38)+ 7);
          int v17 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan(v5);
          *(_DWORD *)(a1 + 32) = v17;
          if (v17 != 12) {
            goto LABEL_54;
          }
          LOBYTE(v38.__vftable) = 0;
          std::vector<BOOL>::push_back((uint64_t)&v41, &v38);
          int v15 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan(v5);
LABEL_32:
          *(_DWORD *)(a1 + 32) = v15;
          continue;
        }
LABEL_12:
        a2[2] -= 8;
LABEL_17:
        uint64_t v8 = v42;
        if (!v42)
        {
LABEL_36:
          uint64_t v18 = 1;
          goto LABEL_37;
        }
        while (2)
        {
          if ((*(void *)&v41[((unint64_t)(v8 - 1) >> 3) & 0x1FFFFFFFFFFFFFF8] >> (v8 - 1)))
          {
            int v9 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan(v5);
            *(_DWORD *)(a1 + 32) = v9;
            if (v9 == 13) {
              goto LABEL_31;
            }
            if (v9 != 10)
            {
              uint64_t v23 = *(void *)(a1 + 64);
              nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get_token_string(v5, &v40);
              *(_OWORD *)std::string v36 = *(_OWORD *)(a1 + 64);
              std::string::size_type v37 = *(void *)(a1 + 80);
              std::string::basic_string[abi:ne180100]<0>(&v34, "array");
              nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::exception_message(a1, 0xAu, (uint64_t)&v34, &__p);
              nlohmann::detail::parse_error::create(101, (uint64_t *)v36, (uint64_t)&__p, (nlohmann::detail::exception *)&v38);
              uint64_t v24 = nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::parse_error((uint64_t)a2, v23, (uint64_t)&v40, (const nlohmann::detail::parse_error *)&v38);
              goto LABEL_55;
            }
            a2[2] -= 8;
            uint64_t v10 = v42;
            if (!v42)
            {
              int v25 = 383;
              goto LABEL_53;
            }
LABEL_26:
            uint64_t v8 = v10 - 1;
            uint64_t v42 = v8;
            if (!v8) {
              goto LABEL_36;
            }
            continue;
          }
          break;
        }
        int v11 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan(v5);
        *(_DWORD *)(a1 + 32) = v11;
        if (v11 != 13)
        {
          if (v11 != 11)
          {
            uint64_t v26 = *(void *)(a1 + 64);
            nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get_token_string(v5, &v40);
            *(_OWORD *)std::string v36 = *(_OWORD *)(a1 + 64);
            std::string::size_type v37 = *(void *)(a1 + 80);
            std::string::basic_string[abi:ne180100]<0>(&v34, "object");
            nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::exception_message(a1, 0xBu, (uint64_t)&v34, &__p);
            nlohmann::detail::parse_error::create(101, (uint64_t *)v36, (uint64_t)&__p, (nlohmann::detail::exception *)&v38);
            uint64_t v24 = nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::parse_error((uint64_t)a2, v26, (uint64_t)&v40, (const nlohmann::detail::parse_error *)&v38);
            goto LABEL_55;
          }
          a2[2] -= 8;
          uint64_t v10 = v42;
          if (!v42)
          {
            int v25 = 439;
LABEL_53:
            __assert_rtn("sax_parse_internal", "parser.hpp", v25, "not states.empty()");
          }
          goto LABEL_26;
        }
        int v12 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan(v5);
        *(_DWORD *)(a1 + 32) = v12;
        if (v12 != 4)
        {
LABEL_51:
          uint64_t v27 = *(void *)(a1 + 64);
          nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get_token_string(v5, &v40);
          *(_OWORD *)std::string v36 = *(_OWORD *)(a1 + 64);
          std::string::size_type v37 = *(void *)(a1 + 80);
          std::string::basic_string[abi:ne180100]<0>(&v34, "object key");
          nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::exception_message(a1, 4u, (uint64_t)&v34, &__p);
          nlohmann::detail::parse_error::create(101, (uint64_t *)v36, (uint64_t)&__p, (nlohmann::detail::exception *)&v38);
          uint64_t v24 = nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::parse_error((uint64_t)a2, v27, (uint64_t)&v40, (const nlohmann::detail::parse_error *)&v38);
          goto LABEL_55;
        }
        unsigned int v13 = *(uint64_t ***)(*(void *)(a2[2] - 8) + 8);
        v38.__vftable = v4;
        a2[4] = (uint64_t)(std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v13, (const void **)&v4->~exception, (uint64_t)&std::piecewise_construct, (long long **)&v38)+ 7);
        int v14 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan(v5);
        *(_DWORD *)(a1 + 32) = v14;
        if (v14 == 12)
        {
LABEL_31:
          int v15 = nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan(v5);
          goto LABEL_32;
        }
LABEL_54:
        uint64_t v28 = *(void *)(a1 + 64);
        nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get_token_string(v5, &v40);
        *(_OWORD *)std::string v36 = *(_OWORD *)(a1 + 64);
        std::string::size_type v37 = *(void *)(a1 + 80);
        std::string::basic_string[abi:ne180100]<0>(&v34, "object separator");
        nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::exception_message(a1, 0xCu, (uint64_t)&v34, &__p);
        nlohmann::detail::parse_error::create(101, (uint64_t *)v36, (uint64_t)&__p, (nlohmann::detail::exception *)&v38);
        uint64_t v24 = nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::parse_error((uint64_t)a2, v28, (uint64_t)&v40, (const nlohmann::detail::parse_error *)&v38);
LABEL_55:
        uint64_t v18 = v24;
        nlohmann::detail::parse_error::~parse_error(&v38);
LABEL_43:
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__p.__r_.__value_.__l.__data_);
        }
        if (SHIBYTE(v34.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v34.__r_.__value_.__l.__data_);
        }
        if (SHIBYTE(v40.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v40.__r_.__value_.__l.__data_);
        }
LABEL_37:
        if (v41) {
          operator delete(v41);
        }
        return v18;
      case 0xE:
        uint64_t v20 = *(void *)(a1 + 64);
        nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get_token_string(v5, &v40);
        *(_OWORD *)std::string v36 = *(_OWORD *)(a1 + 64);
        std::string::size_type v37 = *(void *)(a1 + 80);
        std::string::basic_string[abi:ne180100]<0>(&v34, "value");
        nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::exception_message(a1, 0, (uint64_t)&v34, &__p);
        nlohmann::detail::parse_error::create(101, (uint64_t *)v36, (uint64_t)&__p, (nlohmann::detail::exception *)&v38);
        uint64_t v21 = nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::parse_error((uint64_t)a2, v20, (uint64_t)&v40, (const nlohmann::detail::parse_error *)&v38);
        goto LABEL_42;
      default:
        uint64_t v22 = *(void *)(a1 + 64);
        nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get_token_string(v5, &v40);
        *(_OWORD *)std::string v36 = *(_OWORD *)(a1 + 64);
        std::string::size_type v37 = *(void *)(a1 + 80);
        std::string::basic_string[abi:ne180100]<0>(&v34, "value");
        nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::exception_message(a1, 0x10u, (uint64_t)&v34, &__p);
        nlohmann::detail::parse_error::create(101, (uint64_t *)v36, (uint64_t)&__p, (nlohmann::detail::exception *)&v38);
        uint64_t v21 = nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::parse_error((uint64_t)a2, v22, (uint64_t)&v40, (const nlohmann::detail::parse_error *)&v38);
LABEL_42:
        uint64_t v18 = v21;
        v38.__vftable = (std::exception_vtbl *)&unk_1EFE15F38;
        MEMORY[0x1AD0D68C0](&v39);
        std::exception::~exception(&v38);
        goto LABEL_43;
    }
  }
}

void sub_1A7C55778(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28,uint64_t a29,std::exception a30)
{
  nlohmann::detail::parse_error::~parse_error(&a30);
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a15 < 0) {
    operator delete(a10);
  }
  if (*(char *)(v30 - 97) < 0) {
    operator delete(*(void **)(v30 - 120));
  }
  long long v32 = *(void **)(v30 - 96);
  if (v32) {
    operator delete(v32);
  }
  _Unwind_Resume(a1);
}

uint64_t nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::parse_error(uint64_t a1, uint64_t a2, uint64_t a3, const nlohmann::detail::parse_error *a4)
{
  *(unsigned char *)(a1 + 40) = 1;
  if (*(unsigned char *)(a1 + 41))
  {
    switch(~(100 * (*((_DWORD *)a4 + 2) / 100 / 100)) + *((_DWORD *)a4 + 2) / 100)
    {
      case 0:
        exception = (nlohmann::detail::parse_error *)__cxa_allocate_exception(0x28uLL);
        int v6 = nlohmann::detail::parse_error::parse_error(exception, a4);
        uint64_t v8 = (void (*)(void *))nlohmann::detail::parse_error::~parse_error;
        break;
      case 1:
        int v9 = (nlohmann::detail::invalid_iterator *)__cxa_allocate_exception(0x20uLL);
        int v6 = nlohmann::detail::invalid_iterator::invalid_iterator(v9, a4);
        uint64_t v8 = (void (*)(void *))nlohmann::detail::invalid_iterator::~invalid_iterator;
        break;
      case 2:
        uint64_t v10 = (nlohmann::detail::type_error *)__cxa_allocate_exception(0x20uLL);
        int v6 = nlohmann::detail::type_error::type_error(v10, a4);
        uint64_t v8 = (void (*)(void *))nlohmann::detail::type_error::~type_error;
        break;
      case 3:
        int v11 = (nlohmann::detail::out_of_range *)__cxa_allocate_exception(0x20uLL);
        int v6 = nlohmann::detail::out_of_range::out_of_range(v11, a4);
        uint64_t v8 = (void (*)(void *))nlohmann::detail::out_of_range::~out_of_range;
        break;
      case 4:
        int v12 = (nlohmann::detail::other_error *)__cxa_allocate_exception(0x20uLL);
        int v6 = nlohmann::detail::other_error::other_error(v12, a4);
        uint64_t v8 = (void (*)(void *))nlohmann::detail::other_error::~other_error;
        break;
      default:
        nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::parse_error();
    }
    __cxa_throw(v6, v7, v8);
  }
  return 0;
}

uint64_t nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::json_sax_dom_callback_parser(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  *(void *)a1 = a2;
  *(_OWORD *)(a1 + 8) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  uint64_t v6 = a1 + 32;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(unsigned char *)(a1 + 88) = 0;
  std::__function::__value_func<BOOL ()(int,nlohmann::detail::parse_event_t,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> &)>::__value_func[abi:ne180100](a1 + 96, a3);
  *(unsigned char *)(a1 + 136) = 9;
  *(unsigned char *)(a1 + 128) = a4;
  *(void *)(a1 + 144) = 0;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a1 + 136);
  char v8 = 1;
  std::vector<BOOL>::push_back(v6, &v8);
  return a1;
}

void sub_1A7C55B4C(_Unwind_Exception *a1)
{
  uint64_t v6 = v3;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::~basic_json(v4);
  std::__function::__value_func<BOOL ()(int,nlohmann::detail::parse_event_t,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> &)>::~__value_func[abi:ne180100](v6);
  char v8 = *(void **)(v1 + 56);
  if (v8) {
    operator delete(v8);
  }
  if (*v2) {
    operator delete(*v2);
  }
  uint64_t v9 = *v5;
  if (*v5)
  {
    *(void *)(v1 + 16) = v9;
    operator delete(v9);
  }
  _Unwind_Resume(a1);
}

void std::vector<BOOL>::push_back(uint64_t a1, unsigned char *a2)
{
  unint64_t v4 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  if (v4 == v5 << 6)
  {
    if ((uint64_t)(v4 + 1) < 0) {
      std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v6 = v5 << 7;
    if (v6 <= (v4 & 0xFFFFFFFFFFFFFFC0) + 64) {
      unint64_t v6 = (v4 & 0xFFFFFFFFFFFFFFC0) + 64;
    }
    if (v4 <= 0x3FFFFFFFFFFFFFFELL) {
      unint64_t v7 = v6;
    }
    else {
      unint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
    }
    std::vector<BOOL>::reserve((char **)a1, v7);
    unint64_t v4 = *(void *)(a1 + 8);
  }
  *(void *)(a1 + 8) = v4 + 1;
  char v8 = *(char **)a1;
  unint64_t v9 = v4 >> 6;
  uint64_t v10 = 1 << v4;
  if (*a2) {
    uint64_t v11 = *(void *)&v8[8 * v9] | v10;
  }
  else {
    uint64_t v11 = *(void *)&v8[8 * v9] & ~v10;
  }
  *(void *)&v8[8 * v9] = v11;
}

void std::vector<BOOL>::reserve(char **a1, unint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a2 > (void)a1[2] << 6)
  {
    if ((a2 & 0x8000000000000000) != 0) {
      std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v6 = 0;
    long long v7 = 0uLL;
    std::vector<BOOL>::__vallocate[abi:ne180100](&v6, a2);
    unint64_t v3 = (unint64_t)a1[1];
    uint64_t v10 = *a1;
    int v11 = 0;
    char v8 = &v10[8 * (v3 >> 6)];
    int v9 = v3 & 0x3F;
    std::vector<BOOL>::__construct_at_end<std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>>(&v6, (uint64_t)&v10, (uint64_t)&v8, v3);
    unint64_t v4 = *a1;
    *a1 = v6;
    unint64_t v6 = v4;
    long long v5 = *(_OWORD *)(a1 + 1);
    *(_OWORD *)(a1 + 1) = v7;
    long long v7 = v5;
    if (v4) {
      operator delete(v4);
    }
  }
}

void sub_1A7C55D18(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *std::vector<BOOL>::__vallocate[abi:ne180100](void *a1, uint64_t a2)
{
  if (a2 < 0) {
    std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
  }
  uint64_t result = std::__allocate_at_least[abi:ne180100]<std::allocator<NSString * {__strong}>>((uint64_t)(a1 + 2), ((unint64_t)(a2 - 1) >> 6) + 1);
  *a1 = result;
  a1[1] = 0;
  a1[2] = v4;
  return result;
}

void std::vector<BOOL>::__construct_at_end<std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>>(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = a1[1];
  unint64_t v5 = v4 + a4;
  a1[1] = v4 + a4;
  if (!v4 || ((v5 - 1) ^ (v4 - 1)) >= 0x40)
  {
    if (v5 >= 0x41) {
      unint64_t v6 = (v5 - 1) >> 6;
    }
    else {
      unint64_t v6 = 0;
    }
    *(void *)(*a1 + 8 * v6) = 0;
  }
  int v7 = *(_DWORD *)(a2 + 8);
  uint64_t v8 = *(void *)a3;
  int v9 = *(_DWORD *)(a3 + 8);
  uint64_t v10 = *a1 + 8 * (v4 >> 6);
  uint64_t v16 = *(void *)a2;
  int v17 = v7;
  uint64_t v14 = v8;
  int v15 = v9;
  uint64_t v12 = v10;
  int v13 = v4 & 0x3F;
  std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>,0>(&v16, &v14, &v12, (uint64_t)v11);
}

void std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>,0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *a1;
  int v6 = *((_DWORD *)a1 + 2);
  uint64_t v7 = *a2;
  int v8 = *((_DWORD *)a2 + 2);
  *(void *)&long long v9 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v20 = v9;
  long long v21 = v9;
  uint64_t v18 = v5;
  int v19 = v6;
  uint64_t v16 = v7;
  int v17 = v8;
  int v10 = *((_DWORD *)a3 + 2);
  uint64_t v14 = *a3;
  int v15 = v10;
  std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>>((uint64_t)&v18, (uint64_t)&v16, (uint64_t)&v14, (uint64_t)&v20);
  int v11 = DWORD2(v20);
  uint64_t v12 = v21;
  int v13 = DWORD2(v21);
  *(void *)a4 = v20;
  *(_DWORD *)(a4 + 8) = v11;
  *(void *)(a4 + 16) = v12;
  *(_DWORD *)(a4 + 24) = v13;
}

void std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  unint64_t v4 = *(void **)a1;
  int v5 = *(_DWORD *)(a1 + 8);
  for (i = *(_DWORD *)(a3 + 8); *(void *)a1 != *(void *)a2 || v5 != *(_DWORD *)(a2 + 8); int v5 = *(_DWORD *)(a1 + 8))
  {
    int v8 = *(uint64_t **)a3;
    uint64_t v9 = 1 << i;
    if ((*v4 >> v5)) {
      uint64_t v10 = *v8 | v9;
    }
    else {
      uint64_t v10 = *v8 & ~v9;
    }
    uint64_t *v8 = v10;
    if (v5 == 63)
    {
      int v11 = 0;
      *(void *)a1 = v4 + 1;
    }
    else
    {
      int v11 = v5 + 1;
    }
    *(_DWORD *)(a1 + 8) = v11;
    int v12 = *(_DWORD *)(a3 + 8);
    if (v12 == 63)
    {
      int i = 0;
      *(void *)a3 += 8;
    }
    else
    {
      int i = v12 + 1;
    }
    *(_DWORD *)(a3 + 8) = i;
    unint64_t v4 = *(void **)a1;
  }
  *(void *)a4 = v4;
  *(_DWORD *)(a4 + 8) = v5;
  *(void *)(a4 + 16) = *(void *)a3;
  *(_DWORD *)(a4 + 24) = i;
}

uint64_t nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::start_object(uint64_t *a1, unint64_t a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = (void **)(a1 + 2);
  int v5 = (char **)(a1 + 1);
  char v31 = std::function<BOOL ()(int,nlohmann::detail::parse_event_t,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> &)>::operator()((uint64_t)(a1 + 12), (unint64_t)(a1[2] - a1[1]) >> 3, 0);
  std::vector<BOOL>::push_back((uint64_t)(v4 + 2), &v31);
  LOBYTE(v29) = 1;
  nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<nlohmann::detail::value_t>(a1, (unsigned __int8 *)&v29, 1);
  uint64_t v7 = v6;
  int v8 = *v4;
  unint64_t v9 = a1[3];
  if ((unint64_t)v8 >= v9)
  {
    uint64_t v11 = ((char *)v8 - *v5) >> 3;
    if ((unint64_t)(v11 + 1) >> 61) {
      std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v12 = v9 - (void)*v5;
    uint64_t v13 = v12 >> 2;
    if (v12 >> 2 <= (unint64_t)(v11 + 1)) {
      uint64_t v13 = v11 + 1;
    }
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v14 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v14 = v13;
    }
    if (v14) {
      int v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<NSString * {__strong}>>((uint64_t)(a1 + 3), v14);
    }
    else {
      int v15 = 0;
    }
    uint64_t v16 = &v15[8 * v11];
    int v17 = &v15[8 * v14];
    *(void *)uint64_t v16 = v7;
    uint64_t v10 = v16 + 8;
    int v19 = (char *)a1[1];
    uint64_t v18 = (char *)a1[2];
    if (v18 != v19)
    {
      do
      {
        uint64_t v20 = *((void *)v18 - 1);
        v18 -= 8;
        *((void *)v16 - 1) = v20;
        v16 -= 8;
      }
      while (v18 != v19);
      uint64_t v18 = *v5;
    }
    a1[1] = (uint64_t)v16;
    a1[2] = (uint64_t)v10;
    a1[3] = (uint64_t)v17;
    if (v18) {
      operator delete(v18);
    }
  }
  else
  {
    void *v8 = v6;
    uint64_t v10 = v8 + 1;
  }
  a1[2] = (uint64_t)v10;
  if (a2 != -1)
  {
    long long v21 = (char *)*(v10 - 1);
    if (v21)
    {
      unint64_t v22 = *v21;
      if (v22 > 2) {
        unint64_t v23 = 1;
      }
      else {
        unint64_t v23 = qword_1A7C672B0[v22];
      }
      if (v23 < a2)
      {
        exception = (nlohmann::detail::exception *)__cxa_allocate_exception(0x20uLL);
        std::to_string(&v28, a2);
        uint64_t v26 = std::string::insert(&v28, 0, "excessive object size: ");
        long long v27 = *(_OWORD *)&v26->__r_.__value_.__l.__data_;
        std::string::size_type v30 = v26->__r_.__value_.__r.__words[2];
        long long v29 = v27;
        v26->__r_.__value_.__l.__size_ = 0;
        v26->__r_.__value_.__r.__words[2] = 0;
        v26->__r_.__value_.__r.__words[0] = 0;
        nlohmann::detail::out_of_range::create(408, (uint64_t)&v29, exception);
      }
    }
  }
  return 1;
}

void sub_1A7C5621C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
}

uint64_t nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::end_object(void *a1)
{
  v26[1] = *(uint64_t **)MEMORY[0x1E4F143B8];
  uint64_t v2 = a1[2];
  if (*(void *)(v2 - 8)
    && (std::function<BOOL ()(int,nlohmann::detail::parse_event_t,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> &)>::operator()((uint64_t)(a1 + 12), ((unint64_t)(v2 - a1[1]) >> 3) - 1, 1) & 1) == 0)
  {
    uint64_t v3 = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v25, (uint64_t)(a1 + 17));
    uint64_t v4 = *(void *)(a1[2] - 8);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v3);
    char v5 = *(unsigned char *)v4;
    *(unsigned char *)uint64_t v4 = v25[0];
    v25[0] = v5;
    uint64_t v6 = *(uint64_t **)(v4 + 8);
    *(uint64_t **)(v4 + 8) = v26[0];
    v26[0] = v6;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v4);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v25);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(v26, v25[0]);
  }
  uint64_t v8 = a1[1];
  uint64_t v7 = a1[2];
  if (v8 == v7) {
    nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::end_object();
  }
  uint64_t v9 = a1[5];
  if (!v9) {
    nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::end_object();
  }
  a1[2] = v7 - 8;
  a1[5] = v9 - 1;
  if (v8 != v7 - 8)
  {
    uint64_t v10 = *(unsigned __int8 **)(v7 - 16);
    if (v10)
    {
      if (*v10 - 1 <= 1)
      {
        *(void *)&v24[32] = 0xAAAAAAAAAAAAAAAALL;
        *(void *)&long long v11 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
        *(_OWORD *)uint64_t v24 = v11;
        *(_OWORD *)&v24[16] = v11;
        nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::iter_impl(v24, (uint64_t)v10);
        nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::set_begin((unsigned __int8 **)v24);
        uint64_t v12 = *(void *)(a1[2] - 8);
        *(void *)&long long v13 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v21 = v13;
        long long v22 = v13;
        unint64_t v23 = 0xAAAAAAAAAAAAAAAALL;
        nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::iter_impl(&v21, v12);
        nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::set_end((unsigned __int8 **)&v21);
        if (!nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::operator==((unsigned __int8 **)v24, (unsigned __int8 **)&v21))
        {
          while (*nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::operator->((unsigned __int8 **)v24) != 9)
          {
            nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>::operator++((unsigned __int8 **)v24);
            uint64_t v14 = *(void *)(a1[2] - 8);
            *(void *)&long long v15 = 0xAAAAAAAAAAAAAAAALL;
            *((void *)&v15 + 1) = 0xAAAAAAAAAAAAAAAALL;
            long long v21 = v15;
            long long v22 = v15;
            unint64_t v23 = 0xAAAAAAAAAAAAAAAALL;
            nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::iter_impl(&v21, v14);
            nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::set_end((unsigned __int8 **)&v21);
            if (nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::operator==((unsigned __int8 **)v24, (unsigned __int8 **)&v21))
            {
              return 1;
            }
          }
          uint64_t v16 = *(unsigned __int8 **)(a1[2] - 8);
          uint64_t v18 = *(unsigned __int8 **)v24;
          long long v19 = *(_OWORD *)&v24[8];
          long long v20 = *(_OWORD *)&v24[24];
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::erase<nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,0>(v16, &v18, (uint64_t)&v21);
        }
      }
    }
  }
  return 1;
}

uint64_t nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::key(void *a1, long long *a2)
{
  v14[1] = *(long long **)MEMORY[0x1E4F143B8];
  unint64_t v12 = 0xAAAAAAAAAAAAAAAALL;
  long long v13 = (uint64_t *)0xAAAAAAAAAAAAAAAALL;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<std::string const&,std::string,0>((uint64_t)&v12, (uint64_t)a2);
  char v11 = std::function<BOOL ()(int,nlohmann::detail::parse_event_t,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> &)>::operator()((uint64_t)(a1 + 12), (a1[2] - a1[1]) >> 3, 4);
  std::vector<BOOL>::push_back((uint64_t)(a1 + 7), &v11);
  if (v11 && *(void *)(a1[2] - 8))
  {
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v9, (uint64_t)(a1 + 17));
    uint64_t v4 = *(uint64_t ***)(*(void *)(a1[2] - 8) + 8);
    v14[0] = a2;
    char v5 = std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v4, (const void **)a2, (uint64_t)&std::piecewise_construct, v14);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v9);
    char v6 = *((unsigned char *)v5 + 56);
    v5 += 7;
    *(unsigned char *)char v5 = v9[0];
    v9[0] = v6;
    uint64_t v7 = (uint64_t *)v5[1];
    v5[1] = (uint64_t)v10;
    uint64_t v10 = v7;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v5);
    a1[10] = v5;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v9);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v10, v9[0]);
  }
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v12);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v13, v12);
  return 1;
}

void sub_1A7C565EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t *a9, uint64_t a10, uint64_t a11, uint64_t *a12)
{
}

uint64_t nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::start_array(uint64_t *a1, unint64_t a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void **)(a1 + 2);
  char v5 = (char **)(a1 + 1);
  char v31 = std::function<BOOL ()(int,nlohmann::detail::parse_event_t,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> &)>::operator()((uint64_t)(a1 + 12), (unint64_t)(a1[2] - a1[1]) >> 3, 2);
  std::vector<BOOL>::push_back((uint64_t)(v4 + 2), &v31);
  LOBYTE(v29) = 2;
  nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<nlohmann::detail::value_t>(a1, (unsigned __int8 *)&v29, 1);
  uint64_t v7 = v6;
  uint64_t v8 = *v4;
  unint64_t v9 = a1[3];
  if ((unint64_t)v8 >= v9)
  {
    uint64_t v11 = ((char *)v8 - *v5) >> 3;
    if ((unint64_t)(v11 + 1) >> 61) {
      std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v12 = v9 - (void)*v5;
    uint64_t v13 = v12 >> 2;
    if (v12 >> 2 <= (unint64_t)(v11 + 1)) {
      uint64_t v13 = v11 + 1;
    }
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v14 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v14 = v13;
    }
    if (v14) {
      long long v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<NSString * {__strong}>>((uint64_t)(a1 + 3), v14);
    }
    else {
      long long v15 = 0;
    }
    uint64_t v16 = &v15[8 * v11];
    int v17 = &v15[8 * v14];
    *(void *)uint64_t v16 = v7;
    uint64_t v10 = v16 + 8;
    long long v19 = (char *)a1[1];
    uint64_t v18 = (char *)a1[2];
    if (v18 != v19)
    {
      do
      {
        uint64_t v20 = *((void *)v18 - 1);
        v18 -= 8;
        *((void *)v16 - 1) = v20;
        v16 -= 8;
      }
      while (v18 != v19);
      uint64_t v18 = *v5;
    }
    a1[1] = (uint64_t)v16;
    a1[2] = (uint64_t)v10;
    a1[3] = (uint64_t)v17;
    if (v18) {
      operator delete(v18);
    }
  }
  else
  {
    void *v8 = v6;
    uint64_t v10 = v8 + 1;
  }
  a1[2] = (uint64_t)v10;
  if (a2 != -1)
  {
    long long v21 = (char *)*(v10 - 1);
    if (v21)
    {
      unint64_t v22 = *v21;
      if (v22 > 2) {
        unint64_t v23 = 1;
      }
      else {
        unint64_t v23 = qword_1A7C672B0[v22];
      }
      if (v23 < a2)
      {
        exception = (nlohmann::detail::exception *)__cxa_allocate_exception(0x20uLL);
        std::to_string(&v28, a2);
        uint64_t v26 = std::string::insert(&v28, 0, "excessive array size: ");
        long long v27 = *(_OWORD *)&v26->__r_.__value_.__l.__data_;
        std::string::size_type v30 = v26->__r_.__value_.__r.__words[2];
        long long v29 = v27;
        v26->__r_.__value_.__l.__size_ = 0;
        v26->__r_.__value_.__r.__words[2] = 0;
        v26->__r_.__value_.__r.__words[0] = 0;
        nlohmann::detail::out_of_range::create(408, (uint64_t)&v29, exception);
      }
    }
  }
  return 1;
}

void sub_1A7C56844(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
}

uint64_t nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::end_array(void *a1)
{
  v13[1] = *(uint64_t **)MEMORY[0x1E4F143B8];
  uint64_t v2 = a1[2];
  if (*(void *)(v2 - 8)
    && (std::function<BOOL ()(int,nlohmann::detail::parse_event_t,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> &)>::operator()((uint64_t)(a1 + 12), ((unint64_t)(v2 - a1[1]) >> 3) - 1, 3) & 1) == 0)
  {
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v12, (uint64_t)(a1 + 17));
    uint64_t v4 = *(void *)(a1[2] - 8);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v12);
    char v5 = *(unsigned char *)v4;
    *(unsigned char *)uint64_t v4 = v12[0];
    v12[0] = v5;
    uint64_t v6 = *(uint64_t **)(v4 + 8);
    *(uint64_t **)(v4 + 8) = v13[0];
    v13[0] = v6;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v4);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v12);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(v13, v12[0]);
    char v3 = 0;
  }
  else
  {
    char v3 = 1;
  }
  uint64_t v8 = a1[1];
  uint64_t v7 = a1[2];
  if (v8 == v7) {
    nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::end_array();
  }
  uint64_t v9 = a1[5];
  if (!v9) {
    nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::end_array();
  }
  a1[2] = v7 - 8;
  a1[5] = v9 - 1;
  if (v8 == v7 - 8) {
    char v3 = 1;
  }
  if ((v3 & 1) == 0)
  {
    uint64_t v10 = *(void *)(v7 - 16);
    if (*(unsigned char *)v10 == 2) {
      std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__base_destruct_at_end[abi:ne180100](*(void *)(v10 + 8), *(void *)(*(void *)(v10 + 8) + 8) - 16);
    }
  }
  return 1;
}

void nlohmann::detail::out_of_range::create(int a1@<W0>, uint64_t a2@<X1>, nlohmann::detail::exception *a3@<X8>)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  std::string::basic_string[abi:ne180100]<0>(&__p, "out_of_range");
  nlohmann::detail::exception::name(a1, &v14);
  int v6 = *(char *)(a2 + 23);
  if (v6 >= 0) {
    uint64_t v7 = (const std::string::value_type *)a2;
  }
  else {
    uint64_t v7 = *(const std::string::value_type **)a2;
  }
  if (v6 >= 0) {
    std::string::size_type v8 = *(unsigned __int8 *)(a2 + 23);
  }
  else {
    std::string::size_type v8 = *(void *)(a2 + 8);
  }
  uint64_t v9 = std::string::append(&v14, v7, v8);
  long long v10 = *(_OWORD *)&v9->__r_.__value_.__l.__data_;
  int64_t v16 = v9->__r_.__value_.__r.__words[2];
  *(_OWORD *)long long v15 = v10;
  v9->__r_.__value_.__l.__size_ = 0;
  v9->__r_.__value_.__r.__words[2] = 0;
  v9->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v14.__r_.__value_.__l.__data_);
  }
  if (v13 < 0) {
    operator delete(__p);
  }
  if (v16 >= 0) {
    uint64_t v11 = v15;
  }
  else {
    uint64_t v11 = (void **)v15[0];
  }
  nlohmann::detail::exception::exception(a3, a1, (const char *)v11);
  *(void *)a3 = &unk_1EFE15EB8;
  if (SHIBYTE(v16) < 0) {
    operator delete(v15[0]);
  }
}

void sub_1A7C56B30(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  if (a26 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void nlohmann::detail::out_of_range::~out_of_range(std::exception *this)
{
  this->__vftable = (std::exception_vtbl *)&unk_1EFE15F38;
  MEMORY[0x1AD0D68C0](&this[2]);

  std::exception::~exception(this);
}

{
  uint64_t vars8;

  this->__vftable = (std::exception_vtbl *)&unk_1EFE15F38;
  MEMORY[0x1AD0D68C0](&this[2]);
  std::exception::~exception(this);

  JUMPOUT(0x1AD0D6A20);
}

uint64_t std::function<BOOL ()(int,nlohmann::detail::parse_event_t,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> &)>::operator()(uint64_t a1, int a2, char a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v6 = a2;
  char v5 = a3;
  uint64_t v3 = *(void *)(a1 + 24);
  if (!v3) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  return (*(uint64_t (**)(uint64_t, int *, char *))(*(void *)v3 + 48))(v3, &v6, &v5);
}

uint64_t nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<nlohmann::detail::value_t>(uint64_t *a1, unsigned __int8 *a2, char a3)
{
  v31[1] = *(uint64_t **)MEMORY[0x1E4F143B8];
  uint64_t v3 = a1[5];
  if (!v3) {
    nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<nlohmann::detail::value_t>();
  }
  if ((*(void *)(a1[4] + (((unint64_t)(v3 - 1) >> 3) & 0x1FFFFFFFFFFFFFF8)) >> (v3 - 1)))
  {
    unint64_t v30 = 0xAAAAAAAAAAAAAAAALL;
    v31[0] = (uint64_t *)0xAAAAAAAAAAAAAAAALL;
    int v6 = *a2;
    LOBYTE(v30) = v6;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::json_value(v31, v6);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v30);
    if ((a3 & 1) != 0
      || (std::function<BOOL ()(int,nlohmann::detail::parse_event_t,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> &)>::operator()((uint64_t)(a1 + 12), (unint64_t)(a1[2] - a1[1]) >> 3, 5) & 1) != 0)
    {
      uint64_t v7 = a1[2];
      if (a1[1] == v7)
      {
        v28[0] = v30;
        long long v29 = v31[0];
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v30);
        LOBYTE(v30) = 0;
        v31[0] = 0;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v28);
        uint64_t v14 = *a1;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v28);
        char v15 = *(unsigned char *)v14;
        *(unsigned char *)uint64_t v14 = v28[0];
        v28[0] = v15;
        int64_t v16 = *(uint64_t **)(v14 + 8);
        *(void *)(v14 + 8) = v29;
        long long v29 = v16;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v14);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v28);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v29, v28[0]);
LABEL_20:
        uint64_t v13 = 1;
        goto LABEL_21;
      }
      std::string::size_type v8 = *(unsigned __int8 **)(v7 - 8);
      if (v8)
      {
        int v9 = *v8;
        if (v9 == 2)
        {
          long long v10 = (uint64_t *)*((void *)v8 + 1);
          unint64_t v11 = v10[1];
          if (v11 >= v10[2])
          {
            uint64_t v12 = std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__push_back_slow_path<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>(v10, (uint64_t)&v30);
          }
          else
          {
            *(unsigned char *)unint64_t v11 = v30;
            *(uint64_t **)(v11 + 8) = v31[0];
            nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v30);
            LOBYTE(v30) = 0;
            v31[0] = 0;
            nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v11);
            uint64_t v12 = v11 + 16;
          }
          v10[1] = v12;
          goto LABEL_20;
        }
        if (v9 == 1)
        {
          uint64_t v17 = a1[8];
          if (v17)
          {
            unint64_t v18 = v17 - 1;
            unint64_t v19 = *(void *)(a1[7] + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8));
            a1[8] = v18;
            if ((v19 >> v18))
            {
              if (!a1[10]) {
                __assert_rtn("handle_value", "json_sax.hpp", 624, "object_element");
              }
              v26[0] = v30;
              long long v27 = v31[0];
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v30);
              LOBYTE(v30) = 0;
              v31[0] = 0;
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v26);
              uint64_t v20 = a1[10];
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v26);
              char v21 = *(unsigned char *)v20;
              *(unsigned char *)uint64_t v20 = v26[0];
              v26[0] = v21;
              unint64_t v22 = *(uint64_t **)(v20 + 8);
              *(void *)(v20 + 8) = v27;
              long long v27 = v22;
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v20);
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v26);
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v27, v26[0]);
              goto LABEL_20;
            }
            goto LABEL_17;
          }
          uint64_t v24 = "not key_keep_stack.empty()";
          int v25 = 615;
        }
        else
        {
          uint64_t v24 = "ref_stack.back()->is_array() or ref_stack.back()->is_object()";
          int v25 = 603;
        }
        __assert_rtn("handle_value", "json_sax.hpp", v25, v24);
      }
    }
LABEL_17:
    uint64_t v13 = 0;
LABEL_21:
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v30);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(v31, v30);
    return v13;
  }
  return 0;
}

void sub_1A7C56F80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::~basic_json((uint64_t **)va);
  _Unwind_Resume(a1);
}

void std::__throw_bad_function_call[abi:ne180100]()
{
  exception = __cxa_allocate_exception(8uLL);
}

void std::bad_function_call::~bad_function_call(std::bad_function_call *this)
{
  std::exception::~exception(this);

  JUMPOUT(0x1AD0D6A20);
}

unsigned __int8 *nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::operator->(unsigned __int8 **a1)
{
  v7[3] = *MEMORY[0x1E4F143B8];
  uint64_t result = *a1;
  if (!result) {
    nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::operator->();
  }
  int v3 = *result;
  if (v3 == 2)
  {
    char v5 = *(unsigned __int8 **)(*((void *)result + 1) + 8);
    uint64_t result = a1[2];
    if (result == v5) {
      nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::operator->();
    }
  }
  else if (v3 == 1)
  {
    uint64_t v4 = a1[1];
    if (v4 == (unsigned __int8 *)(*((void *)result + 1) + 8)) {
      nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::operator->();
    }
    return v4 + 56;
  }
  else if (a1[4])
  {
    exception = (nlohmann::detail::exception *)__cxa_allocate_exception(0x20uLL);
    std::string::basic_string[abi:ne180100]<0>(v7, "cannot get value");
    nlohmann::detail::invalid_iterator::create(214, (uint64_t)v7, exception);
  }
  return result;
}

void sub_1A7C57148(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
  {
    operator delete(__p);
    if ((v15 & 1) == 0) {
LABEL_6:
    }
      _Unwind_Resume(a1);
  }
  else if (!v15)
  {
    goto LABEL_6;
  }
  __cxa_free_exception(v14);
  goto LABEL_6;
}

void nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::erase<nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,0>(unsigned __int8 *a1@<X0>, unsigned __int8 **a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (*a2 != a1)
  {
    exception = (nlohmann::detail::exception *)__cxa_allocate_exception(0x20uLL);
    std::string::basic_string[abi:ne180100]<0>(&v26, "iterator does not fit current value");
    nlohmann::detail::invalid_iterator::create(202, (uint64_t)&v26, exception);
  }
  *(void *)(a3 + 32) = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)a3 = v6;
  *(_OWORD *)(a3 + 16) = v6;
  uint64_t v7 = (unsigned __int8 **)nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::iter_impl((void *)a3, (uint64_t)a1);
  nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::set_end(v7);
  int v8 = *a1;
  if ((v8 - 3) < 6)
  {
    if (a2[4])
    {
      uint64_t v20 = (nlohmann::detail::exception *)__cxa_allocate_exception(0x20uLL);
      std::string::basic_string[abi:ne180100]<0>(&v26, "iterator out of range");
      nlohmann::detail::invalid_iterator::create(205, (uint64_t)&v26, v20);
    }
    if (v8 == 8)
    {
      long long v10 = (void **)(a1 + 8);
      int v9 = (void **)*((void *)a1 + 1);
      int v15 = *v9;
      if (*v9)
      {
        v9[1] = v15;
        unint64_t v11 = v15;
        goto LABEL_13;
      }
    }
    else
    {
      if (v8 != 3)
      {
LABEL_15:
        *a1 = 0;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)a1);
        return;
      }
      long long v10 = (void **)(a1 + 8);
      int v9 = (void **)*((void *)a1 + 1);
      if (*((char *)v9 + 23) < 0)
      {
        unint64_t v11 = *v9;
LABEL_13:
        operator delete(v11);
        int v9 = (void **)*v10;
      }
    }
    operator delete(v9);
    *long long v10 = 0;
    goto LABEL_15;
  }
  if (v8 == 1)
  {
    int64_t v16 = (uint64_t **)*((void *)a1 + 1);
    uint64_t v17 = (uint64_t *)a2[1];
    unint64_t v18 = std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__remove_node_pointer(v16, v17);
    std::__destroy_at[abi:ne180100]<std::pair<std::string const,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,0>((uint64_t)(v17 + 4));
    operator delete(v17);
    *(void *)(a3 + 8) = v18;
  }
  else
  {
    if (v8 != 2)
    {
      char v21 = (nlohmann::detail::exception *)__cxa_allocate_exception(0x20uLL);
      unint64_t v22 = (char *)nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::type_name((char *)a1);
      std::string::basic_string[abi:ne180100]<0>(&v25, v22);
      unint64_t v23 = std::string::insert(&v25, 0, "cannot use erase() with ");
      long long v24 = *(_OWORD *)&v23->__r_.__value_.__l.__data_;
      std::string::size_type v27 = v23->__r_.__value_.__r.__words[2];
      long long v26 = v24;
      v23->__r_.__value_.__l.__size_ = 0;
      v23->__r_.__value_.__r.__words[2] = 0;
      v23->__r_.__value_.__r.__words[0] = 0;
      nlohmann::detail::type_error::create(307, (uint64_t)&v26, v21);
    }
    uint64_t v12 = *((void *)a1 + 1);
    uint64_t v13 = (uint64_t)a2[2];
    std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> *,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> *,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> *>((uint64_t)&v26, v13 + 16, *(void *)(v12 + 8), v13);
    std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__base_destruct_at_end[abi:ne180100](v12, v14);
    *(void *)(a3 + 16) = v13;
  }
}

void sub_1A7C57460(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a15 < 0) {
    operator delete(a10);
  }
  if (v22) {
    __cxa_free_exception(v21);
  }
  _Unwind_Resume(exception_object);
}

uint64_t *std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__remove_node_pointer(uint64_t **a1, uint64_t *a2)
{
  uint64_t v2 = (uint64_t *)a2[1];
  if (v2)
  {
    do
    {
      int v3 = v2;
      uint64_t v2 = (uint64_t *)*v2;
    }
    while (v2);
  }
  else
  {
    uint64_t v4 = a2;
    do
    {
      int v3 = (uint64_t *)v4[2];
      BOOL v5 = *v3 == (void)v4;
      uint64_t v4 = v3;
    }
    while (!v5);
  }
  if (*a1 == a2) {
    *a1 = v3;
  }
  long long v6 = a1[1];
  a1[2] = (uint64_t *)((char *)a1[2] - 1);
  std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(v6, a2);
  return v3;
}

uint64_t *std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  int v3 = a2;
  if (*a2)
  {
    uint64_t v4 = (uint64_t *)a2[1];
    if (!v4)
    {
      int v3 = a2;
      goto LABEL_7;
    }
    do
    {
      int v3 = v4;
      uint64_t v4 = (uint64_t *)*v4;
    }
    while (v4);
  }
  uint64_t v2 = v3[1];
  if (v2)
  {
LABEL_7:
    int v5 = 0;
    *(void *)(v2 + 16) = v3[2];
    goto LABEL_8;
  }
  int v5 = 1;
LABEL_8:
  long long v6 = (uint64_t **)v3[2];
  uint64_t v7 = *v6;
  if (*v6 == v3)
  {
    uint64_t *v6 = (uint64_t *)v2;
    if (v3 == result)
    {
      uint64_t v7 = 0;
      uint64_t result = (uint64_t *)v2;
    }
    else
    {
      uint64_t v7 = v6[1];
    }
  }
  else
  {
    v6[1] = (uint64_t *)v2;
  }
  int v8 = *((unsigned __int8 *)v3 + 24);
  if (v3 != a2)
  {
    uint64_t v9 = a2[2];
    v3[2] = v9;
    *(void *)(v9 + 8 * (*(void *)a2[2] != (void)a2)) = v3;
    uint64_t v11 = *a2;
    uint64_t v10 = a2[1];
    *(void *)(v11 + 16) = v3;
    uint64_t *v3 = v11;
    v3[1] = v10;
    if (v10) {
      *(void *)(v10 + 16) = v3;
    }
    *((unsigned char *)v3 + 24) = *((unsigned char *)a2 + 24);
    if (result == a2) {
      uint64_t result = v3;
    }
  }
  if (!v8 || !result) {
    return result;
  }
  if (!v5)
  {
    *(unsigned char *)(v2 + 24) = 1;
    return result;
  }
  while (1)
  {
    uint64_t v12 = v7[2];
    if (*(uint64_t **)v12 == v7) {
      break;
    }
    if (!*((unsigned char *)v7 + 24))
    {
      *((unsigned char *)v7 + 24) = 1;
      *(unsigned char *)(v12 + 24) = 0;
      uint64_t v13 = *(uint64_t **)(v12 + 8);
      uint64_t v14 = *v13;
      *(void *)(v12 + 8) = *v13;
      if (v14) {
        *(void *)(v14 + 16) = v12;
      }
      void v13[2] = *(void *)(v12 + 16);
      *(void *)(*(void *)(v12 + 16) + 8 * (**(void **)(v12 + 16) != v12)) = v13;
      uint64_t *v13 = v12;
      *(void *)(v12 + 16) = v13;
      if (result == (uint64_t *)*v7) {
        uint64_t result = v7;
      }
      uint64_t v7 = *(uint64_t **)(*v7 + 8);
    }
    int v15 = (void *)*v7;
    if (*v7 && !*((unsigned char *)v15 + 24))
    {
      int64_t v16 = (uint64_t *)v7[1];
      if (!v16) {
        goto LABEL_56;
      }
LABEL_55:
      if (*((unsigned char *)v16 + 24))
      {
LABEL_56:
        *((unsigned char *)v15 + 24) = 1;
        *((unsigned char *)v7 + 24) = 0;
        uint64_t v22 = v15[1];
        uint64_t *v7 = v22;
        if (v22) {
          *(void *)(v22 + 16) = v7;
        }
        void v15[2] = v7[2];
        *(void *)(v7[2] + 8 * (*(void *)v7[2] != (void)v7)) = v15;
        v15[1] = v7;
        xpc_object_t v7[2] = (uint64_t)v15;
        int64_t v16 = v7;
      }
      else
      {
        int v15 = v7;
      }
      uint64_t v23 = v15[2];
      *((unsigned char *)v15 + 24) = *(unsigned char *)(v23 + 24);
      *(unsigned char *)(v23 + 24) = 1;
      *((unsigned char *)v16 + 24) = 1;
      long long v24 = *(uint64_t **)(v23 + 8);
      uint64_t v25 = *v24;
      *(void *)(v23 + 8) = *v24;
      if (v25) {
        *(void *)(v25 + 16) = v23;
      }
      v24[2] = *(void *)(v23 + 16);
      *(void *)(*(void *)(v23 + 16) + 8 * (**(void **)(v23 + 16) != v23)) = v24;
      *long long v24 = v23;
      goto LABEL_72;
    }
    int64_t v16 = (uint64_t *)v7[1];
    if (v16 && !*((unsigned char *)v16 + 24)) {
      goto LABEL_55;
    }
    *((unsigned char *)v7 + 24) = 0;
    uint64_t v17 = (uint64_t *)v7[2];
    if (v17 == result)
    {
      uint64_t v17 = result;
LABEL_53:
      *((unsigned char *)v17 + 24) = 1;
      return result;
    }
    if (!*((unsigned char *)v17 + 24)) {
      goto LABEL_53;
    }
LABEL_49:
    uint64_t v7 = *(uint64_t **)(v17[2] + 8 * (*(void *)v17[2] == (void)v17));
  }
  if (!*((unsigned char *)v7 + 24))
  {
    *((unsigned char *)v7 + 24) = 1;
    *(unsigned char *)(v12 + 24) = 0;
    uint64_t v18 = v7[1];
    *(void *)uint64_t v12 = v18;
    if (v18) {
      *(void *)(v18 + 16) = v12;
    }
    xpc_object_t v7[2] = *(void *)(v12 + 16);
    *(void *)(*(void *)(v12 + 16) + 8 * (**(void **)(v12 + 16) != v12)) = v7;
    v7[1] = v12;
    *(void *)(v12 + 16) = v7;
    if (result == (uint64_t *)v12) {
      uint64_t result = v7;
    }
    uint64_t v7 = *(uint64_t **)v12;
  }
  unint64_t v19 = (void *)*v7;
  if (*v7 && !*((unsigned char *)v19 + 24)) {
    goto LABEL_68;
  }
  uint64_t v20 = (uint64_t *)v7[1];
  if (!v20 || *((unsigned char *)v20 + 24))
  {
    *((unsigned char *)v7 + 24) = 0;
    uint64_t v17 = (uint64_t *)v7[2];
    if (*((unsigned char *)v17 + 24)) {
      BOOL v21 = v17 == result;
    }
    else {
      BOOL v21 = 1;
    }
    if (v21) {
      goto LABEL_53;
    }
    goto LABEL_49;
  }
  if (v19 && !*((unsigned char *)v19 + 24))
  {
LABEL_68:
    uint64_t v20 = v7;
  }
  else
  {
    *((unsigned char *)v20 + 24) = 1;
    *((unsigned char *)v7 + 24) = 0;
    uint64_t v26 = *v20;
    v7[1] = *v20;
    if (v26) {
      *(void *)(v26 + 16) = v7;
    }
    _OWORD v20[2] = v7[2];
    *(void *)(v7[2] + 8 * (*(void *)v7[2] != (void)v7)) = v20;
    *uint64_t v20 = (uint64_t)v7;
    xpc_object_t v7[2] = (uint64_t)v20;
    unint64_t v19 = v7;
  }
  uint64_t v23 = v20[2];
  *((unsigned char *)v20 + 24) = *(unsigned char *)(v23 + 24);
  *(unsigned char *)(v23 + 24) = 1;
  *((unsigned char *)v19 + 24) = 1;
  long long v24 = *(uint64_t **)v23;
  uint64_t v27 = *(void *)(*(void *)v23 + 8);
  *(void *)uint64_t v23 = v27;
  if (v27) {
    *(void *)(v27 + 16) = v23;
  }
  v24[2] = *(void *)(v23 + 16);
  *(void *)(*(void *)(v23 + 16) + 8 * (**(void **)(v23 + 16) != v23)) = v24;
  v24[1] = v23;
LABEL_72:
  *(void *)(v23 + 16) = v24;
  return result;
}

uint64_t std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> *,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> *,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> *>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = a2;
  v11[1] = *(uint64_t **)MEMORY[0x1E4F143B8];
  if (a2 == a3) {
    return a2;
  }
  uint64_t v6 = a3;
  do
  {
    v10[0] = *(unsigned char *)v5;
    v11[0] = *(uint64_t **)(v5 + 8);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v5);
    *(unsigned char *)uint64_t v5 = 0;
    *(void *)(v5 + 8) = 0;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v10);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v10);
    unsigned __int8 v7 = *(unsigned char *)a4;
    *(unsigned char *)a4 = v10[0];
    v10[0] = v7;
    int v8 = *(uint64_t **)(a4 + 8);
    *(uint64_t **)(a4 + 8) = v11[0];
    v11[0] = v8;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a4);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v10);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(v11, v10[0]);
    a4 += 16;
    v5 += 16;
  }
  while (v5 != v6);
  return v6;
}

uint64_t *std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t **a1, const void **a2, uint64_t a3, long long **a4)
{
  v11[3] = *(uint64_t **)MEMORY[0x1E4F143B8];
  uint64_t v10 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v6 = (uint64_t **)std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__find_equal<std::string>((uint64_t)a1, &v10, a2);
  unsigned __int8 v7 = *v6;
  if (!*v6)
  {
    int v8 = v6;
    memset(v11, 170, 24);
    std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__construct_node<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)a1, a4, v11);
    std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__insert_node_at(a1, v10, v8, v11[0]);
    unsigned __int8 v7 = v11[0];
    v11[0] = 0;
    std::unique_ptr<std::__tree_node<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void *>>>>::reset[abi:ne180100]((uint64_t)v11, 0);
  }
  return v7;
}

std::string *std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__construct_node<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>@<X0>(uint64_t a1@<X0>, long long **a2@<X2>, void *a3@<X8>)
{
  uint64_t v5 = a1 + 8;
  memset(a3, 170, 24);
  uint64_t v6 = (char *)operator new(0x48uLL);
  *a3 = v6;
  a3[1] = v5;
  *((unsigned char *)a3 + 16) = 0;
  uint64_t result = std::pair<std::string const,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::pair[abi:ne180100]<std::string const&>((std::string *)(v6 + 32), *a2);
  *((unsigned char *)a3 + 16) = 1;
  return result;
}

void sub_1A7C57B24(_Unwind_Exception *a1)
{
  std::unique_ptr<std::__tree_node<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void *>>>>::reset[abi:ne180100](v1, 0);
  _Unwind_Resume(a1);
}

std::string *std::pair<std::string const,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::pair[abi:ne180100]<std::string const&>(std::string *this, long long *a2)
{
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v3 = *a2;
    this->__r_.__value_.__r.__words[2] = *((void *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v3;
  }
  this[1].__r_.__value_.__s.__data_[0] = 0;
  this[1].__r_.__value_.__l.__size_ = 0;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&this[1]);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&this[1]);
  return this;
}

uint64_t nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<double &>(uint64_t *a1, uint64_t **a2, char a3)
{
  v31[1] = *(uint64_t **)MEMORY[0x1E4F143B8];
  uint64_t v3 = a1[5];
  if (!v3) {
    nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<nlohmann::detail::value_t>();
  }
  if ((*(void *)(a1[4] + (((unint64_t)(v3 - 1) >> 3) & 0x1FFFFFFFFFFFFFF8)) >> (v3 - 1)))
  {
    unint64_t v30 = 0xAAAAAAAAAAAAAAAALL;
    uint64_t v6 = *a2;
    LOBYTE(v30) = 7;
    v31[0] = v6;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v30);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v30);
    if ((a3 & 1) != 0
      || (std::function<BOOL ()(int,nlohmann::detail::parse_event_t,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> &)>::operator()((uint64_t)(a1 + 12), (unint64_t)(a1[2] - a1[1]) >> 3, 5) & 1) != 0)
    {
      uint64_t v7 = a1[2];
      if (a1[1] == v7)
      {
        v28[0] = v30;
        long long v29 = v31[0];
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v30);
        LOBYTE(v30) = 0;
        v31[0] = 0;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v28);
        uint64_t v14 = *a1;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v28);
        char v15 = *(unsigned char *)v14;
        *(unsigned char *)uint64_t v14 = v28[0];
        v28[0] = v15;
        int64_t v16 = *(uint64_t **)(v14 + 8);
        *(void *)(v14 + 8) = v29;
        long long v29 = v16;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v14);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v28);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v29, v28[0]);
LABEL_20:
        uint64_t v13 = 1;
        goto LABEL_21;
      }
      int v8 = *(unsigned __int8 **)(v7 - 8);
      if (v8)
      {
        int v9 = *v8;
        if (v9 == 2)
        {
          uint64_t v10 = (uint64_t *)*((void *)v8 + 1);
          unint64_t v11 = v10[1];
          if (v11 >= v10[2])
          {
            uint64_t v12 = std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__push_back_slow_path<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>(v10, (uint64_t)&v30);
          }
          else
          {
            *(unsigned char *)unint64_t v11 = v30;
            *(uint64_t **)(v11 + 8) = v31[0];
            nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v30);
            LOBYTE(v30) = 0;
            v31[0] = 0;
            nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v11);
            uint64_t v12 = v11 + 16;
          }
          v10[1] = v12;
          goto LABEL_20;
        }
        if (v9 == 1)
        {
          uint64_t v17 = a1[8];
          if (v17)
          {
            unint64_t v18 = v17 - 1;
            unint64_t v19 = *(void *)(a1[7] + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8));
            a1[8] = v18;
            if ((v19 >> v18))
            {
              if (!a1[10]) {
                __assert_rtn("handle_value", "json_sax.hpp", 624, "object_element");
              }
              v26[0] = v30;
              uint64_t v27 = v31[0];
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v30);
              LOBYTE(v30) = 0;
              v31[0] = 0;
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v26);
              uint64_t v20 = a1[10];
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v26);
              char v21 = *(unsigned char *)v20;
              *(unsigned char *)uint64_t v20 = v26[0];
              v26[0] = v21;
              uint64_t v22 = *(uint64_t **)(v20 + 8);
              *(void *)(v20 + 8) = v27;
              uint64_t v27 = v22;
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v20);
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v26);
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v27, v26[0]);
              goto LABEL_20;
            }
            goto LABEL_17;
          }
          long long v24 = "not key_keep_stack.empty()";
          int v25 = 615;
        }
        else
        {
          long long v24 = "ref_stack.back()->is_array() or ref_stack.back()->is_object()";
          int v25 = 603;
        }
        __assert_rtn("handle_value", "json_sax.hpp", v25, v24);
      }
    }
LABEL_17:
    uint64_t v13 = 0;
LABEL_21:
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v30);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(v31, v30);
    return v13;
  }
  return 0;
}

void sub_1A7C57F3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::~basic_json((uint64_t **)va);
  _Unwind_Resume(a1);
}

uint64_t nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<BOOL &>(uint64_t *a1, unsigned __int8 *a2, char a3)
{
  v31[1] = *(uint64_t **)MEMORY[0x1E4F143B8];
  uint64_t v3 = a1[5];
  if (!v3) {
    nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<nlohmann::detail::value_t>();
  }
  if ((*(void *)(a1[4] + (((unint64_t)(v3 - 1) >> 3) & 0x1FFFFFFFFFFFFFF8)) >> (v3 - 1)))
  {
    uint64_t v6 = (uint64_t *)*a2;
    unint64_t v30 = 0xAAAAAAAAAAAAAA04;
    v31[0] = v6;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v30);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v30);
    if ((a3 & 1) != 0
      || (std::function<BOOL ()(int,nlohmann::detail::parse_event_t,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> &)>::operator()((uint64_t)(a1 + 12), (unint64_t)(a1[2] - a1[1]) >> 3, 5) & 1) != 0)
    {
      uint64_t v7 = a1[2];
      if (a1[1] == v7)
      {
        v28[0] = v30;
        long long v29 = v31[0];
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v30);
        LOBYTE(v30) = 0;
        v31[0] = 0;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v28);
        uint64_t v14 = *a1;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v28);
        char v15 = *(unsigned char *)v14;
        *(unsigned char *)uint64_t v14 = v28[0];
        v28[0] = v15;
        int64_t v16 = *(uint64_t **)(v14 + 8);
        *(void *)(v14 + 8) = v29;
        long long v29 = v16;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v14);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v28);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v29, v28[0]);
LABEL_20:
        uint64_t v13 = 1;
        goto LABEL_21;
      }
      int v8 = *(unsigned __int8 **)(v7 - 8);
      if (v8)
      {
        int v9 = *v8;
        if (v9 == 2)
        {
          uint64_t v10 = (uint64_t *)*((void *)v8 + 1);
          unint64_t v11 = v10[1];
          if (v11 >= v10[2])
          {
            uint64_t v12 = std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__push_back_slow_path<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>(v10, (uint64_t)&v30);
          }
          else
          {
            *(unsigned char *)unint64_t v11 = v30;
            *(uint64_t **)(v11 + 8) = v31[0];
            nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v30);
            LOBYTE(v30) = 0;
            v31[0] = 0;
            nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v11);
            uint64_t v12 = v11 + 16;
          }
          v10[1] = v12;
          goto LABEL_20;
        }
        if (v9 == 1)
        {
          uint64_t v17 = a1[8];
          if (v17)
          {
            unint64_t v18 = v17 - 1;
            unint64_t v19 = *(void *)(a1[7] + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8));
            a1[8] = v18;
            if ((v19 >> v18))
            {
              if (!a1[10]) {
                __assert_rtn("handle_value", "json_sax.hpp", 624, "object_element");
              }
              v26[0] = v30;
              uint64_t v27 = v31[0];
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v30);
              LOBYTE(v30) = 0;
              v31[0] = 0;
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v26);
              uint64_t v20 = a1[10];
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v26);
              char v21 = *(unsigned char *)v20;
              *(unsigned char *)uint64_t v20 = v26[0];
              v26[0] = v21;
              uint64_t v22 = *(uint64_t **)(v20 + 8);
              *(void *)(v20 + 8) = v27;
              uint64_t v27 = v22;
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v20);
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v26);
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v27, v26[0]);
              goto LABEL_20;
            }
            goto LABEL_17;
          }
          long long v24 = "not key_keep_stack.empty()";
          int v25 = 615;
        }
        else
        {
          long long v24 = "ref_stack.back()->is_array() or ref_stack.back()->is_object()";
          int v25 = 603;
        }
        __assert_rtn("handle_value", "json_sax.hpp", v25, v24);
      }
    }
LABEL_17:
    uint64_t v13 = 0;
LABEL_21:
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v30);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(v31, v30);
    return v13;
  }
  return 0;
}

void sub_1A7C58284(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::~basic_json((uint64_t **)va);
  _Unwind_Resume(a1);
}

uint64_t nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<decltype(nullptr)>(uint64_t *a1, uint64_t a2, char a3)
{
  v30[1] = *(uint64_t **)MEMORY[0x1E4F143B8];
  uint64_t v3 = a1[5];
  if (!v3) {
    nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<nlohmann::detail::value_t>();
  }
  if ((*(void *)(a1[4] + (((unint64_t)(v3 - 1) >> 3) & 0x1FFFFFFFFFFFFFF8)) >> (v3 - 1)))
  {
    unint64_t v29 = 0xAAAAAAAAAAAAAA00;
    v30[0] = 0;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v29);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v29);
    if ((a3 & 1) != 0
      || (std::function<BOOL ()(int,nlohmann::detail::parse_event_t,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> &)>::operator()((uint64_t)(a1 + 12), (unint64_t)(a1[2] - a1[1]) >> 3, 5) & 1) != 0)
    {
      uint64_t v6 = a1[2];
      if (a1[1] == v6)
      {
        v27[0] = v29;
        uint64_t v28 = v30[0];
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v29);
        LOBYTE(v29) = 0;
        v30[0] = 0;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v27);
        uint64_t v13 = *a1;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v27);
        char v14 = *(unsigned char *)v13;
        *(unsigned char *)uint64_t v13 = v27[0];
        v27[0] = v14;
        char v15 = *(uint64_t **)(v13 + 8);
        *(void *)(v13 + 8) = v28;
        uint64_t v28 = v15;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v13);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v27);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v28, v27[0]);
LABEL_20:
        uint64_t v12 = 1;
        goto LABEL_21;
      }
      uint64_t v7 = *(unsigned __int8 **)(v6 - 8);
      if (v7)
      {
        int v8 = *v7;
        if (v8 == 2)
        {
          int v9 = (uint64_t *)*((void *)v7 + 1);
          unint64_t v10 = v9[1];
          if (v10 >= v9[2])
          {
            uint64_t v11 = std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__push_back_slow_path<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>(v9, (uint64_t)&v29);
          }
          else
          {
            *(unsigned char *)unint64_t v10 = v29;
            *(uint64_t **)(v10 + 8) = v30[0];
            nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v29);
            LOBYTE(v29) = 0;
            v30[0] = 0;
            nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v10);
            uint64_t v11 = v10 + 16;
          }
          v9[1] = v11;
          goto LABEL_20;
        }
        if (v8 == 1)
        {
          uint64_t v16 = a1[8];
          if (v16)
          {
            unint64_t v17 = v16 - 1;
            unint64_t v18 = *(void *)(a1[7] + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8));
            a1[8] = v17;
            if ((v18 >> v17))
            {
              if (!a1[10]) {
                __assert_rtn("handle_value", "json_sax.hpp", 624, "object_element");
              }
              v25[0] = v29;
              uint64_t v26 = v30[0];
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v29);
              LOBYTE(v29) = 0;
              v30[0] = 0;
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v25);
              uint64_t v19 = a1[10];
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v25);
              char v20 = *(unsigned char *)v19;
              *(unsigned char *)uint64_t v19 = v25[0];
              v25[0] = v20;
              char v21 = *(uint64_t **)(v19 + 8);
              *(void *)(v19 + 8) = v26;
              uint64_t v26 = v21;
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v19);
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v25);
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v26, v25[0]);
              goto LABEL_20;
            }
            goto LABEL_17;
          }
          uint64_t v23 = "not key_keep_stack.empty()";
          int v24 = 615;
        }
        else
        {
          uint64_t v23 = "ref_stack.back()->is_array() or ref_stack.back()->is_object()";
          int v24 = 603;
        }
        __assert_rtn("handle_value", "json_sax.hpp", v24, v23);
      }
    }
LABEL_17:
    uint64_t v12 = 0;
LABEL_21:
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v29);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(v30, v29);
    return v12;
  }
  return 0;
}

void sub_1A7C585C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::~basic_json((uint64_t **)va);
  _Unwind_Resume(a1);
}

uint64_t nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<long long &>(uint64_t *a1, uint64_t **a2, char a3)
{
  v31[1] = *(uint64_t **)MEMORY[0x1E4F143B8];
  uint64_t v3 = a1[5];
  if (!v3) {
    nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<nlohmann::detail::value_t>();
  }
  if ((*(void *)(a1[4] + (((unint64_t)(v3 - 1) >> 3) & 0x1FFFFFFFFFFFFFF8)) >> (v3 - 1)))
  {
    uint64_t v6 = *a2;
    unint64_t v30 = 0xAAAAAAAAAAAAAA05;
    v31[0] = v6;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v30);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v30);
    if ((a3 & 1) != 0
      || (std::function<BOOL ()(int,nlohmann::detail::parse_event_t,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> &)>::operator()((uint64_t)(a1 + 12), (unint64_t)(a1[2] - a1[1]) >> 3, 5) & 1) != 0)
    {
      uint64_t v7 = a1[2];
      if (a1[1] == v7)
      {
        v28[0] = v30;
        unint64_t v29 = v31[0];
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v30);
        LOBYTE(v30) = 0;
        v31[0] = 0;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v28);
        uint64_t v14 = *a1;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v28);
        char v15 = *(unsigned char *)v14;
        *(unsigned char *)uint64_t v14 = v28[0];
        v28[0] = v15;
        uint64_t v16 = *(uint64_t **)(v14 + 8);
        *(void *)(v14 + 8) = v29;
        unint64_t v29 = v16;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v14);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v28);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v29, v28[0]);
LABEL_20:
        uint64_t v13 = 1;
        goto LABEL_21;
      }
      int v8 = *(unsigned __int8 **)(v7 - 8);
      if (v8)
      {
        int v9 = *v8;
        if (v9 == 2)
        {
          unint64_t v10 = (uint64_t *)*((void *)v8 + 1);
          unint64_t v11 = v10[1];
          if (v11 >= v10[2])
          {
            uint64_t v12 = std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__push_back_slow_path<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>(v10, (uint64_t)&v30);
          }
          else
          {
            *(unsigned char *)unint64_t v11 = v30;
            *(uint64_t **)(v11 + 8) = v31[0];
            nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v30);
            LOBYTE(v30) = 0;
            v31[0] = 0;
            nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v11);
            uint64_t v12 = v11 + 16;
          }
          v10[1] = v12;
          goto LABEL_20;
        }
        if (v9 == 1)
        {
          uint64_t v17 = a1[8];
          if (v17)
          {
            unint64_t v18 = v17 - 1;
            unint64_t v19 = *(void *)(a1[7] + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8));
            a1[8] = v18;
            if ((v19 >> v18))
            {
              if (!a1[10]) {
                __assert_rtn("handle_value", "json_sax.hpp", 624, "object_element");
              }
              v26[0] = v30;
              uint64_t v27 = v31[0];
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v30);
              LOBYTE(v30) = 0;
              v31[0] = 0;
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v26);
              uint64_t v20 = a1[10];
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v26);
              char v21 = *(unsigned char *)v20;
              *(unsigned char *)uint64_t v20 = v26[0];
              v26[0] = v21;
              uint64_t v22 = *(uint64_t **)(v20 + 8);
              *(void *)(v20 + 8) = v27;
              uint64_t v27 = v22;
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v20);
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v26);
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v27, v26[0]);
              goto LABEL_20;
            }
            goto LABEL_17;
          }
          int v24 = "not key_keep_stack.empty()";
          int v25 = 615;
        }
        else
        {
          int v24 = "ref_stack.back()->is_array() or ref_stack.back()->is_object()";
          int v25 = 603;
        }
        __assert_rtn("handle_value", "json_sax.hpp", v25, v24);
      }
    }
LABEL_17:
    uint64_t v13 = 0;
LABEL_21:
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v30);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(v31, v30);
    return v13;
  }
  return 0;
}

void sub_1A7C5890C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::~basic_json((uint64_t **)va);
  _Unwind_Resume(a1);
}

uint64_t nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<std::string&>(uint64_t *a1, uint64_t a2, char a3)
{
  v30[1] = *(uint64_t **)MEMORY[0x1E4F143B8];
  uint64_t v3 = a1[5];
  if (!v3) {
    nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<nlohmann::detail::value_t>();
  }
  if ((*(void *)(a1[4] + (((unint64_t)(v3 - 1) >> 3) & 0x1FFFFFFFFFFFFFF8)) >> (v3 - 1)))
  {
    unint64_t v29 = 0xAAAAAAAAAAAAAAAALL;
    v30[0] = (uint64_t *)0xAAAAAAAAAAAAAAAALL;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<std::string const&,std::string,0>((uint64_t)&v29, a2);
    if ((a3 & 1) != 0
      || (std::function<BOOL ()(int,nlohmann::detail::parse_event_t,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> &)>::operator()((uint64_t)(a1 + 12), (unint64_t)(a1[2] - a1[1]) >> 3, 5) & 1) != 0)
    {
      uint64_t v6 = a1[2];
      if (a1[1] == v6)
      {
        v27[0] = v29;
        uint64_t v28 = v30[0];
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v29);
        LOBYTE(v29) = 0;
        v30[0] = 0;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v27);
        uint64_t v13 = *a1;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v27);
        char v14 = *(unsigned char *)v13;
        *(unsigned char *)uint64_t v13 = v27[0];
        v27[0] = v14;
        char v15 = *(uint64_t **)(v13 + 8);
        *(void *)(v13 + 8) = v28;
        uint64_t v28 = v15;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v13);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v27);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v28, v27[0]);
LABEL_20:
        uint64_t v12 = 1;
        goto LABEL_21;
      }
      uint64_t v7 = *(unsigned __int8 **)(v6 - 8);
      if (v7)
      {
        int v8 = *v7;
        if (v8 == 2)
        {
          int v9 = (uint64_t *)*((void *)v7 + 1);
          unint64_t v10 = v9[1];
          if (v10 >= v9[2])
          {
            uint64_t v11 = std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__push_back_slow_path<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>(v9, (uint64_t)&v29);
          }
          else
          {
            *(unsigned char *)unint64_t v10 = v29;
            *(uint64_t **)(v10 + 8) = v30[0];
            nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v29);
            LOBYTE(v29) = 0;
            v30[0] = 0;
            nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v10);
            uint64_t v11 = v10 + 16;
          }
          v9[1] = v11;
          goto LABEL_20;
        }
        if (v8 == 1)
        {
          uint64_t v16 = a1[8];
          if (v16)
          {
            unint64_t v17 = v16 - 1;
            unint64_t v18 = *(void *)(a1[7] + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8));
            a1[8] = v17;
            if ((v18 >> v17))
            {
              if (!a1[10]) {
                __assert_rtn("handle_value", "json_sax.hpp", 624, "object_element");
              }
              v25[0] = v29;
              uint64_t v26 = v30[0];
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v29);
              LOBYTE(v29) = 0;
              v30[0] = 0;
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v25);
              uint64_t v19 = a1[10];
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v25);
              char v20 = *(unsigned char *)v19;
              *(unsigned char *)uint64_t v19 = v25[0];
              v25[0] = v20;
              char v21 = *(uint64_t **)(v19 + 8);
              *(void *)(v19 + 8) = v26;
              uint64_t v26 = v21;
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v19);
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v25);
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v26, v25[0]);
              goto LABEL_20;
            }
            goto LABEL_17;
          }
          uint64_t v23 = "not key_keep_stack.empty()";
          int v24 = 615;
        }
        else
        {
          uint64_t v23 = "ref_stack.back()->is_array() or ref_stack.back()->is_object()";
          int v24 = 603;
        }
        __assert_rtn("handle_value", "json_sax.hpp", v24, v23);
      }
    }
LABEL_17:
    uint64_t v12 = 0;
LABEL_21:
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v29);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(v30, v29);
    return v12;
  }
  return 0;
}

void sub_1A7C58C3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::~basic_json((uint64_t **)va);
  _Unwind_Resume(a1);
}

uint64_t nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<unsigned long long &>(uint64_t *a1, uint64_t **a2, char a3)
{
  v31[1] = *(uint64_t **)MEMORY[0x1E4F143B8];
  uint64_t v3 = a1[5];
  if (!v3) {
    nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<nlohmann::detail::value_t>();
  }
  if ((*(void *)(a1[4] + (((unint64_t)(v3 - 1) >> 3) & 0x1FFFFFFFFFFFFFF8)) >> (v3 - 1)))
  {
    uint64_t v6 = *a2;
    unint64_t v30 = 0xAAAAAAAAAAAAAA06;
    v31[0] = v6;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v30);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v30);
    if ((a3 & 1) != 0
      || (std::function<BOOL ()(int,nlohmann::detail::parse_event_t,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> &)>::operator()((uint64_t)(a1 + 12), (unint64_t)(a1[2] - a1[1]) >> 3, 5) & 1) != 0)
    {
      uint64_t v7 = a1[2];
      if (a1[1] == v7)
      {
        v28[0] = v30;
        unint64_t v29 = v31[0];
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v30);
        LOBYTE(v30) = 0;
        v31[0] = 0;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v28);
        uint64_t v14 = *a1;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v28);
        char v15 = *(unsigned char *)v14;
        *(unsigned char *)uint64_t v14 = v28[0];
        v28[0] = v15;
        uint64_t v16 = *(uint64_t **)(v14 + 8);
        *(void *)(v14 + 8) = v29;
        unint64_t v29 = v16;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v14);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v28);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v29, v28[0]);
LABEL_20:
        uint64_t v13 = 1;
        goto LABEL_21;
      }
      int v8 = *(unsigned __int8 **)(v7 - 8);
      if (v8)
      {
        int v9 = *v8;
        if (v9 == 2)
        {
          unint64_t v10 = (uint64_t *)*((void *)v8 + 1);
          unint64_t v11 = v10[1];
          if (v11 >= v10[2])
          {
            uint64_t v12 = std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__push_back_slow_path<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>(v10, (uint64_t)&v30);
          }
          else
          {
            *(unsigned char *)unint64_t v11 = v30;
            *(uint64_t **)(v11 + 8) = v31[0];
            nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v30);
            LOBYTE(v30) = 0;
            v31[0] = 0;
            nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v11);
            uint64_t v12 = v11 + 16;
          }
          v10[1] = v12;
          goto LABEL_20;
        }
        if (v9 == 1)
        {
          uint64_t v17 = a1[8];
          if (v17)
          {
            unint64_t v18 = v17 - 1;
            unint64_t v19 = *(void *)(a1[7] + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8));
            a1[8] = v18;
            if ((v19 >> v18))
            {
              if (!a1[10]) {
                __assert_rtn("handle_value", "json_sax.hpp", 624, "object_element");
              }
              v26[0] = v30;
              uint64_t v27 = v31[0];
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v30);
              LOBYTE(v30) = 0;
              v31[0] = 0;
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v26);
              uint64_t v20 = a1[10];
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v26);
              char v21 = *(unsigned char *)v20;
              *(unsigned char *)uint64_t v20 = v26[0];
              v26[0] = v21;
              uint64_t v22 = *(uint64_t **)(v20 + 8);
              *(void *)(v20 + 8) = v27;
              uint64_t v27 = v22;
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v20);
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v26);
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v27, v26[0]);
              goto LABEL_20;
            }
            goto LABEL_17;
          }
          int v24 = "not key_keep_stack.empty()";
          int v25 = 615;
        }
        else
        {
          int v24 = "ref_stack.back()->is_array() or ref_stack.back()->is_object()";
          int v25 = 603;
        }
        __assert_rtn("handle_value", "json_sax.hpp", v25, v24);
      }
    }
LABEL_17:
    uint64_t v13 = 0;
LABEL_21:
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v30);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(v31, v30);
    return v13;
  }
  return 0;
}

void sub_1A7C58F84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::~basic_json((uint64_t **)va);
  _Unwind_Resume(a1);
}

nlohmann::detail::parse_error *nlohmann::detail::parse_error::parse_error(nlohmann::detail::parse_error *this, const nlohmann::detail::parse_error *a2)
{
  *(void *)this = &unk_1EFE15F38;
  *((_DWORD *)this + 2) = *((_DWORD *)a2 + 2);
  MEMORY[0x1AD0D68B0]((char *)this + 16, (char *)a2 + 16);
  *(void *)this = &unk_1EFE15E90;
  *((void *)this + 4) = *((void *)a2 + 4);
  return this;
}

nlohmann::detail::out_of_range *nlohmann::detail::out_of_range::out_of_range(nlohmann::detail::out_of_range *this, const nlohmann::detail::out_of_range *a2)
{
  *(void *)this = &unk_1EFE15F38;
  *((_DWORD *)this + 2) = *((_DWORD *)a2 + 2);
  MEMORY[0x1AD0D68B0]((char *)this + 16, (char *)a2 + 16);
  *(void *)this = &unk_1EFE15EB8;
  return this;
}

nlohmann::detail::invalid_iterator *nlohmann::detail::invalid_iterator::invalid_iterator(nlohmann::detail::invalid_iterator *this, const nlohmann::detail::invalid_iterator *a2)
{
  *(void *)this = &unk_1EFE15F38;
  *((_DWORD *)this + 2) = *((_DWORD *)a2 + 2);
  MEMORY[0x1AD0D68B0]((char *)this + 16, (char *)a2 + 16);
  *(void *)this = &unk_1EFE15EE0;
  return this;
}

nlohmann::detail::type_error *nlohmann::detail::type_error::type_error(nlohmann::detail::type_error *this, const nlohmann::detail::type_error *a2)
{
  *(void *)this = &unk_1EFE15F38;
  *((_DWORD *)this + 2) = *((_DWORD *)a2 + 2);
  MEMORY[0x1AD0D68B0]((char *)this + 16, (char *)a2 + 16);
  *(void *)this = &unk_1EFE15E40;
  return this;
}

nlohmann::detail::other_error *nlohmann::detail::other_error::other_error(nlohmann::detail::other_error *this, const nlohmann::detail::other_error *a2)
{
  *(void *)this = &unk_1EFE15F38;
  *((_DWORD *)this + 2) = *((_DWORD *)a2 + 2);
  MEMORY[0x1AD0D68B0]((char *)this + 16, (char *)a2 + 16);
  *(void *)this = &unk_1EFE15E68;
  return this;
}

void nlohmann::detail::parse_error::position_string(uint64_t a1@<X0>, std::string *a2@<X8>)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  std::to_string(&v12, *(void *)(a1 + 16) + 1);
  uint64_t v4 = std::string::insert(&v12, 0, " at line ");
  long long v5 = *(_OWORD *)&v4->__r_.__value_.__l.__data_;
  v13.__r_.__value_.__r.__words[2] = v4->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v13.__r_.__value_.__l.__data_ = v5;
  v4->__r_.__value_.__l.__size_ = 0;
  v4->__r_.__value_.__r.__words[2] = 0;
  v4->__r_.__value_.__r.__words[0] = 0;
  uint64_t v6 = std::string::append(&v13, ", column ");
  long long v7 = *(_OWORD *)&v6->__r_.__value_.__l.__data_;
  v14.__r_.__value_.__r.__words[2] = v6->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v14.__r_.__value_.__l.__data_ = v7;
  v6->__r_.__value_.__l.__size_ = 0;
  v6->__r_.__value_.__r.__words[2] = 0;
  v6->__r_.__value_.__r.__words[0] = 0;
  std::to_string(&__p, *(void *)(a1 + 8));
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
  unint64_t v10 = std::string::append(&v14, (const std::string::value_type *)p_p, size);
  *a2 = *v10;
  v10->__r_.__value_.__l.__size_ = 0;
  v10->__r_.__value_.__r.__words[2] = 0;
  v10->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v14.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v13.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v12.__r_.__value_.__l.__data_);
  }
}

void sub_1A7C5938C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (*(char *)(v26 - 25) < 0) {
    operator delete(*(void **)(v26 - 48));
  }
  if (a26 < 0) {
    operator delete(a21);
  }
  if (a20 < 0) {
    operator delete(a15);
  }
  _Unwind_Resume(exception_object);
}

const char *nlohmann::detail::lexer_base<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::token_type_name(unsigned int a1)
{
  if (a1 > 0x10) {
    return "unknown token";
  }
  else {
    return off_1E5D1EC68[a1];
  }
}

uint64_t nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::~json_sax_dom_callback_parser(uint64_t a1)
{
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a1 + 136);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy((uint64_t **)(a1 + 144), *(unsigned __int8 *)(a1 + 136));
  std::__function::__value_func<BOOL ()(int,nlohmann::detail::parse_event_t,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> &)>::~__value_func[abi:ne180100]((void *)(a1 + 96));
  uint64_t v2 = *(void **)(a1 + 56);
  if (v2) {
    operator delete(v2);
  }
  uint64_t v3 = *(void **)(a1 + 32);
  if (v3) {
    operator delete(v3);
  }
  uint64_t v4 = *(void **)(a1 + 8);
  if (v4)
  {
    *(void *)(a1 + 16) = v4;
    operator delete(v4);
  }
  return a1;
}

uint64_t nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::start_object(uint64_t *a1, unint64_t a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  LOBYTE(v26) = 1;
  uint64_t v4 = nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<nlohmann::detail::value_t>(a1, (unsigned __int8 *)&v26);
  unint64_t v5 = a1[3];
  uint64_t v6 = (uint64_t *)a1[2];
  if ((unint64_t)v6 >= v5)
  {
    uint64_t v8 = a1[1];
    uint64_t v9 = ((uint64_t)v6 - v8) >> 3;
    if ((unint64_t)(v9 + 1) >> 61) {
      std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v10 = v5 - v8;
    uint64_t v11 = v10 >> 2;
    if (v10 >> 2 <= (unint64_t)(v9 + 1)) {
      uint64_t v11 = v9 + 1;
    }
    if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v12 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v11;
    }
    if (v12) {
      std::string v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<NSString * {__strong}>>((uint64_t)(a1 + 3), v12);
    }
    else {
      std::string v13 = 0;
    }
    std::string v14 = (uint64_t *)&v13[8 * v9];
    uint64_t v15 = &v13[8 * v12];
    uint64_t *v14 = v4;
    long long v7 = v14 + 1;
    uint64_t v17 = (char *)a1[1];
    uint64_t v16 = (char *)a1[2];
    if (v16 != v17)
    {
      do
      {
        uint64_t v18 = *((void *)v16 - 1);
        v16 -= 8;
        *--std::string v14 = v18;
      }
      while (v16 != v17);
      uint64_t v16 = (char *)a1[1];
    }
    a1[1] = (uint64_t)v14;
    a1[2] = (uint64_t)v7;
    a1[3] = (uint64_t)v15;
    if (v16) {
      operator delete(v16);
    }
  }
  else
  {
    uint64_t *v6 = v4;
    long long v7 = v6 + 1;
  }
  a1[2] = (uint64_t)v7;
  if (a2 != -1)
  {
    unint64_t v19 = *(char *)*(v7 - 1);
    if (v19 > 2) {
      unint64_t v20 = 1;
    }
    else {
      unint64_t v20 = qword_1A7C672B0[v19];
    }
    if (v20 < a2)
    {
      exception = (nlohmann::detail::exception *)__cxa_allocate_exception(0x20uLL);
      std::to_string(&v25, a2);
      uint64_t v23 = std::string::insert(&v25, 0, "excessive object size: ");
      long long v24 = *(_OWORD *)&v23->__r_.__value_.__l.__data_;
      std::string::size_type v27 = v23->__r_.__value_.__r.__words[2];
      long long v26 = v24;
      v23->__r_.__value_.__l.__size_ = 0;
      v23->__r_.__value_.__r.__words[2] = 0;
      v23->__r_.__value_.__r.__words[0] = 0;
      nlohmann::detail::out_of_range::create(408, (uint64_t)&v26, exception);
    }
  }
  return 1;
}

void sub_1A7C59670(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
}

uint64_t nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::start_array(uint64_t *a1, unint64_t a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  LOBYTE(v26) = 2;
  uint64_t v4 = nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<nlohmann::detail::value_t>(a1, (unsigned __int8 *)&v26);
  unint64_t v5 = a1[3];
  uint64_t v6 = (uint64_t *)a1[2];
  if ((unint64_t)v6 >= v5)
  {
    uint64_t v8 = a1[1];
    uint64_t v9 = ((uint64_t)v6 - v8) >> 3;
    if ((unint64_t)(v9 + 1) >> 61) {
      std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v10 = v5 - v8;
    uint64_t v11 = v10 >> 2;
    if (v10 >> 2 <= (unint64_t)(v9 + 1)) {
      uint64_t v11 = v9 + 1;
    }
    if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v12 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v11;
    }
    if (v12) {
      std::string v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<NSString * {__strong}>>((uint64_t)(a1 + 3), v12);
    }
    else {
      std::string v13 = 0;
    }
    std::string v14 = (uint64_t *)&v13[8 * v9];
    uint64_t v15 = &v13[8 * v12];
    uint64_t *v14 = v4;
    long long v7 = v14 + 1;
    uint64_t v17 = (char *)a1[1];
    uint64_t v16 = (char *)a1[2];
    if (v16 != v17)
    {
      do
      {
        uint64_t v18 = *((void *)v16 - 1);
        v16 -= 8;
        *--std::string v14 = v18;
      }
      while (v16 != v17);
      uint64_t v16 = (char *)a1[1];
    }
    a1[1] = (uint64_t)v14;
    a1[2] = (uint64_t)v7;
    a1[3] = (uint64_t)v15;
    if (v16) {
      operator delete(v16);
    }
  }
  else
  {
    uint64_t *v6 = v4;
    long long v7 = v6 + 1;
  }
  a1[2] = (uint64_t)v7;
  if (a2 != -1)
  {
    unint64_t v19 = *(char *)*(v7 - 1);
    if (v19 > 2) {
      unint64_t v20 = 1;
    }
    else {
      unint64_t v20 = qword_1A7C672B0[v19];
    }
    if (v20 < a2)
    {
      exception = (nlohmann::detail::exception *)__cxa_allocate_exception(0x20uLL);
      std::to_string(&v25, a2);
      uint64_t v23 = std::string::insert(&v25, 0, "excessive array size: ");
      long long v24 = *(_OWORD *)&v23->__r_.__value_.__l.__data_;
      std::string::size_type v27 = v23->__r_.__value_.__r.__words[2];
      long long v26 = v24;
      v23->__r_.__value_.__l.__size_ = 0;
      v23->__r_.__value_.__r.__words[2] = 0;
      v23->__r_.__value_.__r.__words[0] = 0;
      nlohmann::detail::out_of_range::create(408, (uint64_t)&v26, exception);
    }
  }
  return 1;
}

void sub_1A7C598C4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
}

uint64_t nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<nlohmann::detail::value_t>(uint64_t *a1, unsigned __int8 *a2)
{
  v21[1] = *(uint64_t **)MEMORY[0x1E4F143B8];
  uint64_t v3 = a1[2];
  if (a1[1] == v3)
  {
    int v9 = *a2;
    v20[0] = v9;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::json_value(v21, v9);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v20);
    uint64_t v10 = *a1;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v20);
    unsigned __int8 v11 = *(unsigned char *)v10;
    *(unsigned char *)uint64_t v10 = v20[0];
    v20[0] = v11;
    unint64_t v12 = *(uint64_t **)(v10 + 8);
    *(uint64_t **)(v10 + 8) = v21[0];
    v21[0] = v12;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v10);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v20);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(v21, v20[0]);
    return *a1;
  }
  else
  {
    uint64_t v4 = *(unsigned __int8 **)(v3 - 8);
    int v5 = *v4;
    if (v5 == 2)
    {
      uint64_t v6 = (uint64_t *)*((void *)v4 + 1);
      unint64_t v7 = v6[1];
      if (v7 >= v6[2])
      {
        uint64_t v8 = std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__emplace_back_slow_path<nlohmann::detail::value_t>(v6, a2);
      }
      else
      {
        std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__construct_one_at_end[abi:ne180100]<nlohmann::detail::value_t>((uint64_t)v6, a2);
        uint64_t v8 = v7 + 16;
      }
      v6[1] = v8;
      return *(void *)(*(void *)(*(void *)(a1[2] - 8) + 8) + 8) - 16;
    }
    else
    {
      if (v5 != 1) {
        nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<nlohmann::detail::value_t>();
      }
      if (!a1[4]) {
        nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<nlohmann::detail::value_t>();
      }
      int v14 = *a2;
      v18[0] = v14;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::json_value(&v19, v14);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v18);
      uint64_t v15 = a1[4];
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v18);
      unsigned __int8 v16 = *(unsigned char *)v15;
      *(unsigned char *)uint64_t v15 = v18[0];
      v18[0] = v16;
      uint64_t v17 = *(uint64_t **)(v15 + 8);
      *(void *)(v15 + 8) = v19;
      unint64_t v19 = v17;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v15);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v18);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v19, v18[0]);
      return a1[4];
    }
  }
}

uint64_t std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__construct_one_at_end[abi:ne180100]<nlohmann::detail::value_t>(uint64_t a1, unsigned __int8 *a2)
{
  int v4 = *a2;
  uint64_t v3 = *(unsigned char **)(a1 + 8);
  unsigned char *v3 = v4;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::json_value(v3 + 8, v4);
  uint64_t result = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v3);
  *(void *)(a1 + 8) = v3 + 16;
  return result;
}

void sub_1A7C59B1C(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__emplace_back_slow_path<nlohmann::detail::value_t>(uint64_t *a1, unsigned __int8 *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  uint64_t v4 = (a1[1] - *a1) >> 4;
  unint64_t v5 = v4 + 1;
  if ((unint64_t)(v4 + 1) >> 60) {
    std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  uint64_t v8 = a1[2] - v3;
  if (v8 >> 3 > v5) {
    unint64_t v5 = v8 >> 3;
  }
  if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFF0) {
    unint64_t v9 = 0xFFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v9 = v5;
  }
  uint64_t v18 = a1 + 2;
  if (v9) {
    uint64_t v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>(v7, v9);
  }
  else {
    uint64_t v10 = 0;
  }
  unsigned __int8 v11 = &v10[16 * v4];
  v15[0] = v10;
  v15[1] = v11;
  unsigned __int8 v16 = v11;
  uint64_t v17 = &v10[16 * v9];
  int v12 = *a2;
  char *v11 = v12;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::json_value(v11 + 8, v12);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v11);
  v16 += 16;
  std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__swap_out_circular_buffer(a1, v15);
  uint64_t v13 = a1[1];
  std::__split_buffer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::~__split_buffer((uint64_t)v15);
  return v13;
}

void sub_1A7C59C38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<double &>(uint64_t *a1, uint64_t *a2)
{
  v22[1] = *(uint64_t **)MEMORY[0x1E4F143B8];
  uint64_t v3 = a1[2];
  if (a1[1] == v3)
  {
    uint64_t v10 = (uint64_t *)*a2;
    v21[0] = 7;
    v22[0] = v10;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v21);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v21);
    uint64_t v11 = *a1;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v21);
    unsigned __int8 v12 = *(unsigned char *)v11;
    *(unsigned char *)uint64_t v11 = v21[0];
    v21[0] = v12;
    uint64_t v13 = *(uint64_t **)(v11 + 8);
    *(uint64_t **)(v11 + 8) = v22[0];
    v22[0] = v13;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v11);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v21);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(v22, v21[0]);
    return *a1;
  }
  else
  {
    uint64_t v4 = *(unsigned __int8 **)(v3 - 8);
    int v5 = *v4;
    if (v5 == 2)
    {
      uint64_t v6 = (uint64_t *)*((void *)v4 + 1);
      unint64_t v7 = v6[1];
      if (v7 >= v6[2])
      {
        uint64_t v9 = std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__emplace_back_slow_path<double &>(v6, a2);
      }
      else
      {
        *(void *)(v7 + 8) = 0;
        uint64_t v8 = *a2;
        *(unsigned char *)unint64_t v7 = 7;
        *(void *)(v7 + 8) = v8;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v7);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v7);
        uint64_t v9 = v7 + 16;
      }
      v6[1] = v9;
      return *(void *)(*(void *)(*(void *)(a1[2] - 8) + 8) + 8) - 16;
    }
    else
    {
      if (v5 != 1) {
        nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<nlohmann::detail::value_t>();
      }
      if (!a1[4]) {
        nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<nlohmann::detail::value_t>();
      }
      uint64_t v15 = (uint64_t *)*a2;
      v19[0] = 7;
      unint64_t v20 = v15;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v19);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v19);
      uint64_t v16 = a1[4];
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v19);
      unsigned __int8 v17 = *(unsigned char *)v16;
      *(unsigned char *)uint64_t v16 = v19[0];
      v19[0] = v17;
      uint64_t v18 = *(uint64_t **)(v16 + 8);
      *(void *)(v16 + 8) = v20;
      unint64_t v20 = v18;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v16);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v19);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v20, v19[0]);
      return a1[4];
    }
  }
}

uint64_t std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__emplace_back_slow_path<double &>(uint64_t *a1, uint64_t *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  uint64_t v4 = (a1[1] - *a1) >> 4;
  unint64_t v5 = v4 + 1;
  if ((unint64_t)(v4 + 1) >> 60) {
    std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
  }
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = (uint64_t)(a1 + 2);
  uint64_t v8 = a1[2] - v3;
  if (v8 >> 3 > v5) {
    unint64_t v5 = v8 >> 3;
  }
  if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFF0) {
    unint64_t v9 = 0xFFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v9 = v5;
  }
  uint64_t v18 = a1 + 2;
  uint64_t v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>(v7, v9);
  uint64_t v11 = (uint64_t)&v10[16 * v4];
  *(void *)&long long v16 = v10;
  *((void *)&v16 + 1) = v11;
  *((void *)&v17 + 1) = &v10[16 * v12];
  *(void *)(v11 + 8) = 0;
  uint64_t v13 = *a2;
  *(unsigned char *)uint64_t v11 = 7;
  *(void *)(v11 + 8) = v13;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v11);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v11);
  *(void *)&long long v17 = v11 + 16;
  std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__swap_out_circular_buffer(a1, &v16);
  uint64_t v14 = a1[1];
  std::__split_buffer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::~__split_buffer((uint64_t)&v16);
  return v14;
}

void sub_1A7C59F44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<BOOL &>(uint64_t *a1, unsigned __int8 *a2)
{
  v22[1] = *(uint64_t **)MEMORY[0x1E4F143B8];
  uint64_t v3 = a1[2];
  if (a1[1] == v3)
  {
    uint64_t v10 = (uint64_t *)*a2;
    v21[0] = 4;
    v22[0] = v10;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v21);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v21);
    uint64_t v11 = *a1;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v21);
    unsigned __int8 v12 = *(unsigned char *)v11;
    *(unsigned char *)uint64_t v11 = v21[0];
    v21[0] = v12;
    uint64_t v13 = *(uint64_t **)(v11 + 8);
    *(uint64_t **)(v11 + 8) = v22[0];
    v22[0] = v13;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v11);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v21);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(v22, v21[0]);
    return *a1;
  }
  else
  {
    uint64_t v4 = *(unsigned __int8 **)(v3 - 8);
    int v5 = *v4;
    if (v5 == 2)
    {
      uint64_t v6 = (uint64_t *)*((void *)v4 + 1);
      unint64_t v7 = v6[1];
      if (v7 >= v6[2])
      {
        uint64_t v9 = std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__emplace_back_slow_path<BOOL &>(v6, a2);
      }
      else
      {
        *(void *)(v7 + 8) = 0;
        uint64_t v8 = *a2;
        *(unsigned char *)unint64_t v7 = 4;
        *(void *)(v7 + 8) = v8;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v7);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v7);
        uint64_t v9 = v7 + 16;
      }
      v6[1] = v9;
      return *(void *)(*(void *)(*(void *)(a1[2] - 8) + 8) + 8) - 16;
    }
    else
    {
      if (v5 != 1) {
        nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<nlohmann::detail::value_t>();
      }
      if (!a1[4]) {
        nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<nlohmann::detail::value_t>();
      }
      uint64_t v15 = (uint64_t *)*a2;
      v19[0] = 4;
      unint64_t v20 = v15;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v19);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v19);
      uint64_t v16 = a1[4];
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v19);
      unsigned __int8 v17 = *(unsigned char *)v16;
      *(unsigned char *)uint64_t v16 = v19[0];
      v19[0] = v17;
      uint64_t v18 = *(uint64_t **)(v16 + 8);
      *(void *)(v16 + 8) = v20;
      unint64_t v20 = v18;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v16);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v19);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v20, v19[0]);
      return a1[4];
    }
  }
}

uint64_t std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__emplace_back_slow_path<BOOL &>(uint64_t *a1, unsigned __int8 *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  uint64_t v4 = (a1[1] - *a1) >> 4;
  unint64_t v5 = v4 + 1;
  if ((unint64_t)(v4 + 1) >> 60) {
    std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
  }
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = (uint64_t)(a1 + 2);
  uint64_t v8 = a1[2] - v3;
  if (v8 >> 3 > v5) {
    unint64_t v5 = v8 >> 3;
  }
  if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFF0) {
    unint64_t v9 = 0xFFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v9 = v5;
  }
  uint64_t v18 = a1 + 2;
  uint64_t v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>(v7, v9);
  uint64_t v11 = (uint64_t)&v10[16 * v4];
  *(void *)&long long v16 = v10;
  *((void *)&v16 + 1) = v11;
  *((void *)&v17 + 1) = &v10[16 * v12];
  *(void *)(v11 + 8) = 0;
  uint64_t v13 = *a2;
  *(unsigned char *)uint64_t v11 = 4;
  *(void *)(v11 + 8) = v13;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v11);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v11);
  *(void *)&long long v17 = v11 + 16;
  std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__swap_out_circular_buffer(a1, &v16);
  uint64_t v14 = a1[1];
  std::__split_buffer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::~__split_buffer((uint64_t)&v16);
  return v14;
}

void sub_1A7C5A250(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<decltype(nullptr)>(uint64_t *a1)
{
  v18[1] = *(uint64_t **)MEMORY[0x1E4F143B8];
  uint64_t v2 = a1[2];
  if (a1[1] == v2)
  {
    v17[0] = 0;
    v18[0] = 0;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v17);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v17);
    uint64_t v8 = *a1;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v17);
    unsigned __int8 v9 = *(unsigned char *)v8;
    *(unsigned char *)uint64_t v8 = v17[0];
    v17[0] = v9;
    uint64_t v10 = *(uint64_t **)(v8 + 8);
    *(uint64_t **)(v8 + 8) = v18[0];
    v18[0] = v10;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v8);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v17);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(v18, v17[0]);
    return *a1;
  }
  else
  {
    uint64_t v3 = *(unsigned __int8 **)(v2 - 8);
    int v4 = *v3;
    if (v4 == 2)
    {
      unint64_t v5 = (uint64_t *)*((void *)v3 + 1);
      unint64_t v6 = v5[1];
      if (v6 >= v5[2])
      {
        uint64_t v7 = std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__emplace_back_slow_path<decltype(nullptr)>(v5);
      }
      else
      {
        *(unsigned char *)unint64_t v6 = 0;
        *(void *)(v6 + 8) = 0;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v6);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v6);
        uint64_t v7 = v6 + 16;
      }
      v5[1] = v7;
      return *(void *)(*(void *)(*(void *)(a1[2] - 8) + 8) + 8) - 16;
    }
    else
    {
      if (v4 != 1) {
        nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<nlohmann::detail::value_t>();
      }
      if (!a1[4]) {
        nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<nlohmann::detail::value_t>();
      }
      v15[0] = 0;
      long long v16 = 0;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v15);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v15);
      uint64_t v12 = a1[4];
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v15);
      unsigned __int8 v13 = *(unsigned char *)v12;
      *(unsigned char *)uint64_t v12 = v15[0];
      v15[0] = v13;
      uint64_t v14 = *(uint64_t **)(v12 + 8);
      *(void *)(v12 + 8) = v16;
      long long v16 = v14;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v12);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v15);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v16, v15[0]);
      return a1[4];
    }
  }
}

uint64_t std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__emplace_back_slow_path<decltype(nullptr)>(uint64_t *a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  uint64_t v3 = (a1[1] - *a1) >> 4;
  unint64_t v4 = v3 + 1;
  if ((unint64_t)(v3 + 1) >> 60) {
    std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = (uint64_t)(a1 + 2);
  uint64_t v6 = a1[2] - v2;
  if (v6 >> 3 > v4) {
    unint64_t v4 = v6 >> 3;
  }
  if ((unint64_t)v6 >= 0x7FFFFFFFFFFFFFF0) {
    unint64_t v7 = 0xFFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v7 = v4;
  }
  uint64_t v15 = a1 + 2;
  uint64_t v8 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>(v5, v7);
  uint64_t v9 = (uint64_t)&v8[16 * v3];
  *(void *)&long long v13 = v8;
  *((void *)&v13 + 1) = v9;
  *((void *)&v14 + 1) = &v8[16 * v10];
  *(unsigned char *)uint64_t v9 = 0;
  *(void *)(v9 + 8) = 0;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v9);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v9);
  *(void *)&long long v14 = v9 + 16;
  std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__swap_out_circular_buffer(a1, &v13);
  uint64_t v11 = a1[1];
  std::__split_buffer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::~__split_buffer((uint64_t)&v13);
  return v11;
}

void sub_1A7C5A528(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<long long &>(uint64_t *a1, uint64_t *a2)
{
  v22[1] = *(uint64_t **)MEMORY[0x1E4F143B8];
  uint64_t v3 = a1[2];
  if (a1[1] == v3)
  {
    uint64_t v10 = (uint64_t *)*a2;
    v21[0] = 5;
    v22[0] = v10;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v21);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v21);
    uint64_t v11 = *a1;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v21);
    unsigned __int8 v12 = *(unsigned char *)v11;
    *(unsigned char *)uint64_t v11 = v21[0];
    v21[0] = v12;
    long long v13 = *(uint64_t **)(v11 + 8);
    *(uint64_t **)(v11 + 8) = v22[0];
    v22[0] = v13;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v11);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v21);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(v22, v21[0]);
    return *a1;
  }
  else
  {
    unint64_t v4 = *(unsigned __int8 **)(v3 - 8);
    int v5 = *v4;
    if (v5 == 2)
    {
      uint64_t v6 = (uint64_t *)*((void *)v4 + 1);
      unint64_t v7 = v6[1];
      if (v7 >= v6[2])
      {
        uint64_t v9 = std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__emplace_back_slow_path<long long &>(v6, a2);
      }
      else
      {
        *(void *)(v7 + 8) = 0;
        uint64_t v8 = *a2;
        *(unsigned char *)unint64_t v7 = 5;
        *(void *)(v7 + 8) = v8;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v7);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v7);
        uint64_t v9 = v7 + 16;
      }
      v6[1] = v9;
      return *(void *)(*(void *)(*(void *)(a1[2] - 8) + 8) + 8) - 16;
    }
    else
    {
      if (v5 != 1) {
        nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<nlohmann::detail::value_t>();
      }
      if (!a1[4]) {
        nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<nlohmann::detail::value_t>();
      }
      uint64_t v15 = (uint64_t *)*a2;
      v19[0] = 5;
      unint64_t v20 = v15;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v19);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v19);
      uint64_t v16 = a1[4];
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v19);
      unsigned __int8 v17 = *(unsigned char *)v16;
      *(unsigned char *)uint64_t v16 = v19[0];
      v19[0] = v17;
      uint64_t v18 = *(uint64_t **)(v16 + 8);
      *(void *)(v16 + 8) = v20;
      unint64_t v20 = v18;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v16);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v19);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v20, v19[0]);
      return a1[4];
    }
  }
}

uint64_t std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__emplace_back_slow_path<long long &>(uint64_t *a1, uint64_t *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  uint64_t v4 = (a1[1] - *a1) >> 4;
  unint64_t v5 = v4 + 1;
  if ((unint64_t)(v4 + 1) >> 60) {
    std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
  }
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = (uint64_t)(a1 + 2);
  uint64_t v8 = a1[2] - v3;
  if (v8 >> 3 > v5) {
    unint64_t v5 = v8 >> 3;
  }
  if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFF0) {
    unint64_t v9 = 0xFFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v9 = v5;
  }
  uint64_t v18 = a1 + 2;
  uint64_t v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>(v7, v9);
  uint64_t v11 = (uint64_t)&v10[16 * v4];
  *(void *)&long long v16 = v10;
  *((void *)&v16 + 1) = v11;
  *((void *)&v17 + 1) = &v10[16 * v12];
  *(void *)(v11 + 8) = 0;
  uint64_t v13 = *a2;
  *(unsigned char *)uint64_t v11 = 5;
  *(void *)(v11 + 8) = v13;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v11);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v11);
  *(void *)&long long v17 = v11 + 16;
  std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__swap_out_circular_buffer(a1, &v16);
  uint64_t v14 = a1[1];
  std::__split_buffer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::~__split_buffer((uint64_t)&v16);
  return v14;
}

void sub_1A7C5A834(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<std::string&>(uint64_t *a1, uint64_t a2)
{
  v19[1] = *(uint64_t **)MEMORY[0x1E4F143B8];
  uint64_t v3 = a1[2];
  if (a1[1] == v3)
  {
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<std::string const&,std::string,0>((uint64_t)v18, a2);
    uint64_t v9 = *a1;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v18);
    unsigned __int8 v10 = *(unsigned char *)v9;
    *(unsigned char *)uint64_t v9 = v18[0];
    v18[0] = v10;
    uint64_t v11 = *(uint64_t **)(v9 + 8);
    *(uint64_t **)(v9 + 8) = v19[0];
    v19[0] = v11;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v9);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v18);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(v19, v18[0]);
    return *a1;
  }
  else
  {
    uint64_t v4 = *(unsigned __int8 **)(v3 - 8);
    int v5 = *v4;
    if (v5 == 2)
    {
      uint64_t v6 = (uint64_t *)*((void *)v4 + 1);
      unint64_t v7 = v6[1];
      if (v7 >= v6[2])
      {
        uint64_t v8 = std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__emplace_back_slow_path<std::string&>(v6, a2);
      }
      else
      {
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<std::string const&,std::string,0>(v6[1], a2);
        uint64_t v8 = v7 + 16;
        v6[1] = v7 + 16;
      }
      v6[1] = v8;
      return *(void *)(*(void *)(*(void *)(a1[2] - 8) + 8) + 8) - 16;
    }
    else
    {
      if (v5 != 1) {
        nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<nlohmann::detail::value_t>();
      }
      if (!a1[4]) {
        nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<nlohmann::detail::value_t>();
      }
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<std::string const&,std::string,0>((uint64_t)v16, a2);
      uint64_t v13 = a1[4];
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v16);
      unsigned __int8 v14 = *(unsigned char *)v13;
      *(unsigned char *)uint64_t v13 = v16[0];
      v16[0] = v14;
      uint64_t v15 = *(uint64_t **)(v13 + 8);
      *(void *)(v13 + 8) = v17;
      long long v17 = v15;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v13);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v16);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v17, v16[0]);
      return a1[4];
    }
  }
}

void sub_1A7C5A9E4(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__emplace_back_slow_path<std::string&>(uint64_t *a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  uint64_t v4 = (a1[1] - *a1) >> 4;
  unint64_t v5 = v4 + 1;
  if ((unint64_t)(v4 + 1) >> 60) {
    std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  uint64_t v8 = a1[2] - v3;
  if (v8 >> 3 > v5) {
    unint64_t v5 = v8 >> 3;
  }
  if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFF0) {
    unint64_t v9 = 0xFFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v9 = v5;
  }
  long long v17 = a1 + 2;
  if (v9) {
    unsigned __int8 v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>(v7, v9);
  }
  else {
    unsigned __int8 v10 = 0;
  }
  uint64_t v13 = v10;
  unsigned __int8 v14 = &v10[16 * v4];
  long long v16 = &v10[16 * v9];
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<std::string const&,std::string,0>((uint64_t)v14, a2);
  uint64_t v15 = v14 + 16;
  std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__swap_out_circular_buffer(a1, &v13);
  uint64_t v11 = a1[1];
  std::__split_buffer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::~__split_buffer((uint64_t)&v13);
  return v11;
}

void sub_1A7C5AAF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<unsigned long long &>(uint64_t *a1, uint64_t *a2)
{
  v22[1] = *(uint64_t **)MEMORY[0x1E4F143B8];
  uint64_t v3 = a1[2];
  if (a1[1] == v3)
  {
    unsigned __int8 v10 = (uint64_t *)*a2;
    v21[0] = 6;
    v22[0] = v10;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v21);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v21);
    uint64_t v11 = *a1;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v21);
    unsigned __int8 v12 = *(unsigned char *)v11;
    *(unsigned char *)uint64_t v11 = v21[0];
    v21[0] = v12;
    uint64_t v13 = *(uint64_t **)(v11 + 8);
    *(uint64_t **)(v11 + 8) = v22[0];
    v22[0] = v13;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v11);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v21);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(v22, v21[0]);
    return *a1;
  }
  else
  {
    uint64_t v4 = *(unsigned __int8 **)(v3 - 8);
    int v5 = *v4;
    if (v5 == 2)
    {
      uint64_t v6 = (uint64_t *)*((void *)v4 + 1);
      unint64_t v7 = v6[1];
      if (v7 >= v6[2])
      {
        uint64_t v9 = std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__emplace_back_slow_path<unsigned long long &>(v6, a2);
      }
      else
      {
        *(void *)(v7 + 8) = 0;
        uint64_t v8 = *a2;
        *(unsigned char *)unint64_t v7 = 6;
        *(void *)(v7 + 8) = v8;
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v7);
        nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v7);
        uint64_t v9 = v7 + 16;
      }
      v6[1] = v9;
      return *(void *)(*(void *)(*(void *)(a1[2] - 8) + 8) + 8) - 16;
    }
    else
    {
      if (v5 != 1) {
        nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<nlohmann::detail::value_t>();
      }
      if (!a1[4]) {
        nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<nlohmann::detail::value_t>();
      }
      uint64_t v15 = (uint64_t *)*a2;
      v19[0] = 6;
      unint64_t v20 = v15;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v19);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v19);
      uint64_t v16 = a1[4];
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v19);
      unsigned __int8 v17 = *(unsigned char *)v16;
      *(unsigned char *)uint64_t v16 = v19[0];
      v19[0] = v17;
      uint64_t v18 = *(uint64_t **)(v16 + 8);
      *(void *)(v16 + 8) = v20;
      unint64_t v20 = v18;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v16);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v19);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v20, v19[0]);
      return a1[4];
    }
  }
}

uint64_t std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__emplace_back_slow_path<unsigned long long &>(uint64_t *a1, uint64_t *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  uint64_t v4 = (a1[1] - *a1) >> 4;
  unint64_t v5 = v4 + 1;
  if ((unint64_t)(v4 + 1) >> 60) {
    std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
  }
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = (uint64_t)(a1 + 2);
  uint64_t v8 = a1[2] - v3;
  if (v8 >> 3 > v5) {
    unint64_t v5 = v8 >> 3;
  }
  if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFF0) {
    unint64_t v9 = 0xFFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v9 = v5;
  }
  uint64_t v18 = a1 + 2;
  unsigned __int8 v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>(v7, v9);
  uint64_t v11 = (uint64_t)&v10[16 * v4];
  *(void *)&long long v16 = v10;
  *((void *)&v16 + 1) = v11;
  *((void *)&v17 + 1) = &v10[16 * v12];
  *(void *)(v11 + 8) = 0;
  uint64_t v13 = *a2;
  *(unsigned char *)uint64_t v11 = 6;
  *(void *)(v11 + 8) = v13;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v11);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v11);
  *(void *)&long long v17 = v11 + 16;
  std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__swap_out_circular_buffer(a1, &v16);
  uint64_t v14 = a1[1];
  std::__split_buffer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::~__split_buffer((uint64_t)&v16);
  return v14;
}

void sub_1A7C5AE04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void *std::__function::__value_func<BOOL ()(int,nlohmann::detail::parse_event_t,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> &)>::~__value_func[abi:ne180100](void *a1)
{
  uint64_t v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

unsigned __int8 **nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::set_begin(unsigned __int8 **result)
{
  uint64_t v1 = *result;
  if (!*result) {
    __assert_rtn("set_begin", "iter_impl.hpp", 174, "m_object != nullptr");
  }
  int v2 = *v1;
  if (*v1)
  {
    if (v2 == 2)
    {
      result[2] = (unsigned __int8 *)**((void **)v1 + 1);
    }
    else if (v2 == 1)
    {
      result[1] = (unsigned __int8 *)**((void **)v1 + 1);
    }
    else
    {
      result[4] = 0;
    }
  }
  else
  {
    result[4] = (unsigned __int8 *)1;
  }
  return result;
}

void *nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::iter_impl(void *result, uint64_t a2)
{
  *uint64_t result = a2;
  result[1] = 0;
  result[2] = 0;
  result[3] = 0;
  result[4] = 0x8000000000000000;
  if (!a2) {
    __assert_rtn("iter_impl", "iter_impl.hpp", 88, "m_object != nullptr");
  }
  return result;
}

unsigned __int8 **nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::set_end(unsigned __int8 **result)
{
  uint64_t v1 = *result;
  if (!*result) {
    __assert_rtn("set_end", "iter_impl.hpp", 211, "m_object != nullptr");
  }
  int v2 = *v1;
  if (v2 == 2)
  {
    result[2] = *(unsigned __int8 **)(*((void *)v1 + 1) + 8);
  }
  else if (v2 == 1)
  {
    result[1] = (unsigned __int8 *)(*((void *)v1 + 1) + 8);
  }
  else
  {
    result[4] = (unsigned __int8 *)1;
  }
  return result;
}

uint64_t std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::find<char [5]>(uint64_t a1, std::string::value_type *__s)
{
  uint64_t v2 = a1 + 8;
  uint64_t v3 = *(void *)(a1 + 8);
  if (!v3) {
    return v2;
  }
  uint64_t v5 = a1 + 8;
  do
  {
    int v6 = std::string::compare((const std::string *)(v3 + 32), __s);
    uint64_t v7 = (uint64_t *)(v3 + 8);
    if (v6 >= 0)
    {
      uint64_t v7 = (uint64_t *)v3;
      uint64_t v5 = v3;
    }
    uint64_t v3 = *v7;
  }
  while (*v7);
  if (v5 == v2 || std::string::compare((const std::string *)(v5 + 32), __s) >= 1) {
    return v2;
  }
  return v5;
}

uint64_t nlohmann::operator==(unsigned __int8 *a1, unsigned __int8 *a2)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  int v3 = *a1;
  int v4 = *a2;
  if (v3 != v4)
  {
    if (v3 == 5 && v4 == 7)
    {
      double v12 = (double)*((uint64_t *)a1 + 1);
    }
    else
    {
      if (v3 == 7 && v4 == 5)
      {
        double v10 = *((double *)a1 + 1);
        double v11 = (double)*((uint64_t *)a2 + 1);
        return v10 == v11;
      }
      if (v3 != 6 || v4 != 7)
      {
        if (v3 != 7 || v4 != 6)
        {
          if (v3 != 6 || v4 != 5)
          {
            uint64_t result = 0;
            if (v3 != 5 || v4 != 6) {
              return result;
            }
          }
          return *((void *)a1 + 1) == *((void *)a2 + 1);
        }
        double v10 = *((double *)a1 + 1);
        double v11 = (double)*((unint64_t *)a2 + 1);
        return v10 == v11;
      }
      double v12 = (double)*((unint64_t *)a1 + 1);
    }
    return *((double *)a2 + 1) == v12;
  }
  uint64_t result = 1;
  switch(v3)
  {
    case 0:
      return result;
    case 1:
      uint64_t v13 = (void *)*((void *)a1 + 1);
      uint64_t v14 = (void *)*((void *)a2 + 1);
      if (v13[2] != v14[2]) {
        return 0;
      }
      long long v17 = (void *)*v13;
      uint64_t v15 = v13 + 1;
      long long v16 = v17;
      if (v17 == v15) {
        return result;
      }
      uint64_t v18 = (void *)*v14;
      break;
    case 2:
      unint64_t v29 = (uint64_t *)*((void *)a1 + 1);
      unint64_t v30 = (uint64_t *)*((void *)a2 + 1);
      uint64_t v31 = *v29;
      uint64_t v32 = v29[1];
      uint64_t v33 = *v30;
      if (v32 - *v29 != v30[1] - *v30) {
        return 0;
      }
      while (v31 != v32)
      {
        uint64_t result = nlohmann::operator==(v31, v33);
        if (!result) {
          break;
        }
        v31 += 16;
        v33 += 16;
      }
      return result;
    case 3:
      std::string v34 = (unsigned __int8 *)*((void *)a1 + 1);
      uint64_t v35 = (unsigned __int8 **)*((void *)a2 + 1);
      uint64_t v36 = v34[23];
      if ((v36 & 0x80u) == 0) {
        std::string::size_type v37 = (unsigned __int8 *)v34[23];
      }
      else {
        std::string::size_type v37 = (unsigned __int8 *)*((void *)v34 + 1);
      }
      std::exception v38 = (unsigned __int8 *)*((unsigned __int8 *)v35 + 23);
      int v39 = (char)v38;
      if ((char)v38 < 0) {
        std::exception v38 = v35[1];
      }
      if (v37 != v38) {
        return 0;
      }
      if (v39 >= 0) {
        std::string v40 = (unsigned __int8 *)*((void *)a2 + 1);
      }
      else {
        std::string v40 = *v35;
      }
      if ((v36 & 0x80) != 0) {
        return memcmp(*(const void **)v34, v40, *((void *)v34 + 1)) == 0;
      }
      if (v34[23])
      {
        uint64_t v41 = v36 - 1;
        do
        {
          int v43 = *v34++;
          int v42 = v43;
          int v45 = *v40++;
          int v44 = v45;
          BOOL v47 = v41-- != 0;
          uint64_t result = v42 == v44;
        }
        while (v42 == v44 && v47);
      }
      return result;
    case 4:
      return a1[8] == a2[8];
    case 5:
    case 6:
      return *((void *)a1 + 1) == *((void *)a2 + 1);
    case 7:
      double v10 = *((double *)a1 + 1);
      double v11 = *((double *)a2 + 1);
      return v10 == v11;
    case 8:
      uint64_t v48 = *((void *)a2 + 1);
      v50[0] = *((void *)a1 + 1);
      v50[1] = v50[0] + 24;
      v50[2] = v50[0] + 25;
      v49[0] = v48;
      v49[1] = v48 + 24;
      v49[2] = v48 + 25;
      return std::__tuple_equal<3ul>::operator()[abi:ne180100]<std::tuple<std::vector<unsigned char> const&,unsigned char const&,BOOL const&>,std::tuple<std::vector<unsigned char> const&,unsigned char const&,BOOL const&>>((uint64_t)&v51, (uint64_t)v50, (uint64_t)v49);
    default:
      return 0;
  }
  while (1)
  {
    uint64_t v19 = *((unsigned __int8 *)v16 + 55);
    if ((v19 & 0x80u) == 0) {
      uint64_t v20 = *((unsigned __int8 *)v16 + 55);
    }
    else {
      uint64_t v20 = v16[5];
    }
    uint64_t v21 = *((unsigned __int8 *)v18 + 55);
    int v22 = (char)v21;
    if ((v21 & 0x80u) != 0) {
      uint64_t v21 = v18[5];
    }
    if (v20 != v21) {
      return 0;
    }
    uint64_t v23 = (const void **)(v16 + 4);
    if (v22 >= 0) {
      long long v24 = (unsigned __int8 *)(v18 + 4);
    }
    else {
      long long v24 = (unsigned __int8 *)v18[4];
    }
    if ((v19 & 0x80) != 0)
    {
      if (memcmp(*v23, v24, v16[5])) {
        return 0;
      }
    }
    else if (*((unsigned char *)v16 + 55))
    {
      while (*(unsigned __int8 *)v23 == *v24)
      {
        uint64_t v23 = (const void **)((char *)v23 + 1);
        ++v24;
        if (!--v19) {
          goto LABEL_41;
        }
      }
      return 0;
    }
LABEL_41:
    uint64_t result = nlohmann::operator==(v16 + 7, v18 + 7);
    if (result)
    {
      std::string v25 = (void *)v16[1];
      long long v26 = v16;
      if (v25)
      {
        do
        {
          long long v16 = v25;
          std::string v25 = (void *)*v25;
        }
        while (v25);
      }
      else
      {
        do
        {
          long long v16 = (void *)v26[2];
          BOOL v6 = *v16 == (void)v26;
          long long v26 = v16;
        }
        while (!v6);
      }
      std::string::size_type v27 = (void *)v18[1];
      if (v27)
      {
        do
        {
          uint64_t v28 = v27;
          std::string::size_type v27 = (void *)*v27;
        }
        while (v27);
      }
      else
      {
        do
        {
          uint64_t v28 = (void *)v18[2];
          BOOL v6 = *v28 == (void)v18;
          uint64_t v18 = v28;
        }
        while (!v6);
      }
      uint64_t result = 1;
      uint64_t v18 = v28;
      if (v16 != v15) {
        continue;
      }
    }
    return result;
  }
}

void sub_1A7C5B40C(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  __clang_call_terminate(a1);
}

BOOL std::__tuple_equal<3ul>::operator()[abi:ne180100]<std::tuple<std::vector<unsigned char> const&,unsigned char const&,BOOL const&>,std::tuple<std::vector<unsigned char> const&,unsigned char const&,BOOL const&>>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  return std::__tuple_equal<1ul>::operator()[abi:ne180100]<std::tuple<std::vector<unsigned char> const&,unsigned char const&,BOOL const&>,std::tuple<std::vector<unsigned char> const&,unsigned char const&,BOOL const&>>((uint64_t)&v6, (const void ***)a2, (uint64_t *)a3)&& **(unsigned __int8 **)(a2 + 8) == **(unsigned __int8 **)(a3 + 8)&& **(unsigned __int8 **)(a2 + 16) == **(unsigned __int8 **)(a3 + 16);
}

BOOL std::__tuple_equal<1ul>::operator()[abi:ne180100]<std::tuple<std::vector<unsigned char> const&,unsigned char const&,BOOL const&>,std::tuple<std::vector<unsigned char> const&,unsigned char const&,BOOL const&>>(uint64_t a1, const void ***a2, uint64_t *a3)
{
  uint64_t v3 = *a3;
  int v4 = **a2;
  size_t v5 = (unsigned char *)(*a2)[1] - v4;
  return v5 == *(void *)(v3 + 8) - *(void *)v3 && memcmp(v4, *(const void **)v3, v5) == 0;
}

void sub_1A7C5B5DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7C5B78C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7C5B8D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7C5BAD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  CoreAnalytics::ConfigurationObserver::~ConfigurationObserver(v22);

  if (a16 < 0) {
    operator delete(__p);
  }
  std::__shared_weak_count::~__shared_weak_count(v16);
  operator delete(v24);

  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<anonymous namespace'::ConfigurationObserverImpl>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EFE160A8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<anonymous namespace'::ConfigurationObserverImpl>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EFE160A8;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x1AD0D6A20);
}

uint64_t std::__shared_ptr_emplace<anonymous namespace'::ConfigurationObserverImpl>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void anonymous namespace'::ConfigurationObserverImpl::~ConfigurationObserverImpl(id *this)
{
  *this = &unk_1EFE15DC8;

  objc_destroyWeak(this + 5);
  objc_destroyWeak(this + 4);
  if (*((char *)this + 31) < 0) {
    operator delete(this[1]);
  }

  CoreAnalytics::ConfigurationObserver::~ConfigurationObserver((CoreAnalytics::ConfigurationObserver *)this);
}

{
  uint64_t vars8;

  *this = &unk_1EFE15DC8;

  objc_destroyWeak(this + 5);
  objc_destroyWeak(this + 4);
  if (*((char *)this + 31) < 0) {
    operator delete(this[1]);
  }
  CoreAnalytics::ConfigurationObserver::~ConfigurationObserver((CoreAnalytics::ConfigurationObserver *)this);

  JUMPOUT(0x1AD0D6A20);
}

void anonymous namespace'::ConfigurationObserverImpl::notifyConfigurationActivated(id *this, const FrameworkConfiguration *a2)
{
  v19[1] = *(uint64_t **)MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained(this + 5);
  if (WeakRetained)
  {
    unint64_t v18 = 0xAAAAAAAAAAAAAAAALL;
    v19[0] = (uint64_t *)0xAAAAAAAAAAAAAAAALL;
    size_t v5 = this + 1;
    FrameworkConfiguration::getExternalConfiguration((uint64_t *)a2, (uint64_t)(this + 1), (uint64_t)&v18);
    if ((_BYTE)v18)
    {
      char v6 = makeNSObjectFromJson((unsigned __int8 *)&v18);
    }
    else
    {
      char v6 = 0;
    }
    if (*((char *)this + 31) < 0) {
      size_t v5 = (void *)*v5;
    }
    uint64_t v7 = [NSString stringWithUTF8String:v5];
    id v8 = objc_loadWeakRetained(this + 4);
    unint64_t v9 = this[6];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = ___ZN12_GLOBAL__N_125ConfigurationObserverImpl28notifyConfigurationActivatedERK22FrameworkConfiguration_block_invoke;
    block[3] = &unk_1E5D1ED28;
    id v14 = WeakRetained;
    id v15 = v8;
    id v16 = v6;
    id v17 = v7;
    id v10 = v7;
    id v11 = v6;
    id v12 = v8;
    dispatch_barrier_async(v9, block);

    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v18);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(v19, v18);
  }
}

void sub_1A7C5C05C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::~basic_json((uint64_t **)va);

  _Unwind_Resume(a1);
}

uint64_t ___ZN12_GLOBAL__N_125ConfigurationObserverImpl28notifyConfigurationActivatedERK22FrameworkConfiguration_block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) observer:*(void *)(a1 + 40) didChangeConfiguration:*(void *)(a1 + 48) type:*(void *)(a1 + 56)];
}

uint64_t AnalyticsRolloverEvents()
{
  return analytics_rollover_with_options(0);
}

uint64_t analytics_rollover_events()
{
  return analytics_rollover_with_options(0);
}

uint64_t analytics_rollover_with_options(void *a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  CASPIEnter();
  xpc_object_t v23 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  uint64_t v3 = CoreAnalytics::Client::get(v2);
  std::string::basic_string[abi:ne180100]<0>(__p, "rollover");
  id v4 = v1;
  xpc_object_t v5 = v4;
  if (!v4) {
    xpc_object_t v5 = xpc_null_create();
  }

  id v6 = v5;
  uint64_t v7 = v6;
  id v20 = v6;
  uint64_t v8 = MEMORY[0x1E4F14590];
  if (!v6 || MEMORY[0x1AD0D7420](v6) != v8)
  {
    xpc_object_t v9 = xpc_null_create();
    id v10 = v20;
    id v20 = v9;
  }
  CoreAnalytics::Client::sendManagementCommandWithReply((NSObject **)v3, (uint64_t)__p, &v20, &v23);
  id v11 = v20;
  id v20 = 0;

  if (v22 < 0) {
    operator delete(__p[0]);
  }
  if (MEMORY[0x1AD0D7420](v23) == v8
    && (long long v24 = &v23, v25 = "error", applesauce::xpc::dict::object_proxy::operator BOOL((uint64_t)&v24)))
  {
    memset(v19, 170, sizeof(v19));
    v17[0] = &v23;
    v17[1] = "error";
    applesauce::xpc::dict::object_proxy::operator applesauce::xpc::object((uint64_t)v17, &v18);
    long long v24 = 0;
    std::string v25 = 0;
    uint64_t v26 = 0;
    applesauce::xpc::dyn_cast_or_default();
    if (SHIBYTE(v26) < 0) {
      operator delete(v24);
    }
    xpc_object_t v12 = v18;
    xpc_object_t v18 = 0;

      analytics_rollover_with_options_cold_1();
    if (SHIBYTE(v19[2]) < 0) {
      operator delete(v19[0]);
    }
    uint64_t v13 = 0;
  }
  else
  {
    long long v24 = &v23;
    std::string v25 = "rollover";
    applesauce::xpc::dict::object_proxy::operator applesauce::xpc::object((uint64_t)&v24, v19);
    uint64_t v13 = applesauce::xpc::dyn_cast_or_default();
    id v14 = v19[0];
    v19[0] = 0;
  }
  xpc_object_t v15 = v23;
  xpc_object_t v23 = 0;

  return v13;
}

void sub_1A7C5C308(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22,void *a23)
{
  if (*(char *)(v24 - 57) < 0) {
    operator delete(*(void **)(v24 - 80));
  }

  _Unwind_Resume(a1);
}

uint64_t AnalyticsRolloverWithOptions(void *a1)
{
  void v6[4] = *(xpc_object_t *)MEMORY[0x1E4F143B8];
  id v1 = a1;
  CASPIEnter();
  xpc_object_t v2 = xpc_null_create();
  if (v1)
  {
    makeXpcFromNSObject(v1, v6);
    xpc_object_t v3 = v6[0];
    v6[0] = 0;

    uint64_t v4 = analytics_rollover_with_options(v3);
  }
  else
  {
    uint64_t v4 = analytics_rollover_with_options(0);
    xpc_object_t v3 = v2;
  }

  return v4;
}

void sub_1A7C5C4A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint8_t buf)
{
  _Unwind_Resume(a1);
}

uint64_t analytics_disable_all_transform_sampling()
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  CASPIEnter();
  xpc_object_t v16 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  applesauce::xpc::dict::create(&v16);
  xpc_object_t v15 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  id v1 = CoreAnalytics::Client::get(v0);
  std::string::basic_string[abi:ne180100]<0>(__p, "disable-sampling");
  applesauce::xpc::object::object((applesauce::xpc::object *)&v12, &v16);
  CoreAnalytics::Client::sendManagementCommandWithReply((NSObject **)v1, (uint64_t)__p, &v12, &v15);
  id v2 = v12;
  id v12 = 0;

  if (v14 < 0) {
    operator delete(__p[0]);
  }
  if (MEMORY[0x1AD0D7420](v15) == MEMORY[0x1E4F14590]
    && (v17 = &v15, xpc_object_t v18 = "error", applesauce::xpc::dict::object_proxy::operator BOOL((uint64_t)&v17)))
  {
    memset(v11, 170, sizeof(v11));
    v9[0] = &v15;
    v9[1] = "error";
    applesauce::xpc::dict::object_proxy::operator applesauce::xpc::object((uint64_t)v9, &v10);
    id v17 = 0;
    xpc_object_t v18 = 0;
    uint64_t v19 = 0;
    applesauce::xpc::dyn_cast_or_default();
    if (SHIBYTE(v19) < 0) {
      operator delete(v17);
    }
    xpc_object_t v3 = v10;
    xpc_object_t v10 = 0;

      analytics_disable_all_transform_sampling_cold_1();
    if (SHIBYTE(v11[2]) < 0) {
      operator delete(v11[0]);
    }
    uint64_t v4 = 0;
  }
  else
  {
    id v17 = &v15;
    xpc_object_t v18 = "disable-sampling";
    applesauce::xpc::dict::object_proxy::operator applesauce::xpc::object((uint64_t)&v17, v11);
    uint64_t v4 = applesauce::xpc::dyn_cast_or_default();
    xpc_object_t v5 = v11[0];
    v11[0] = 0;
  }
  xpc_object_t v6 = v15;
  xpc_object_t v15 = 0;

  xpc_object_t v7 = v16;
  xpc_object_t v16 = 0;

  return v4;
}

void sub_1A7C5C790(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (*(char *)(v21 - 25) < 0) {
    operator delete(*(void **)(v21 - 48));
  }

  xpc_object_t v23 = *(void **)(v21 - 64);
  *(void *)(v21 - 64) = 0;

  uint64_t v24 = *(void **)(v21 - 56);
  *(void *)(v21 - 56) = 0;

  _Unwind_Resume(a1);
}

uint64_t analytics_reenable_all_transform_sampling()
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  CASPIEnter();
  xpc_object_t v16 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  applesauce::xpc::dict::create(&v16);
  xpc_object_t v15 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  id v1 = CoreAnalytics::Client::get(v0);
  std::string::basic_string[abi:ne180100]<0>(__p, "reenable-sampling");
  applesauce::xpc::object::object((applesauce::xpc::object *)&v12, &v16);
  CoreAnalytics::Client::sendManagementCommandWithReply((NSObject **)v1, (uint64_t)__p, &v12, &v15);
  id v2 = v12;
  id v12 = 0;

  if (v14 < 0) {
    operator delete(__p[0]);
  }
  if (MEMORY[0x1AD0D7420](v15) == MEMORY[0x1E4F14590]
    && (v17 = &v15, xpc_object_t v18 = "error", applesauce::xpc::dict::object_proxy::operator BOOL((uint64_t)&v17)))
  {
    memset(v11, 170, sizeof(v11));
    v9[0] = &v15;
    v9[1] = "error";
    applesauce::xpc::dict::object_proxy::operator applesauce::xpc::object((uint64_t)v9, &v10);
    id v17 = 0;
    xpc_object_t v18 = 0;
    uint64_t v19 = 0;
    applesauce::xpc::dyn_cast_or_default();
    if (SHIBYTE(v19) < 0) {
      operator delete(v17);
    }
    xpc_object_t v3 = v10;
    xpc_object_t v10 = 0;

      analytics_reenable_all_transform_sampling_cold_1();
    if (SHIBYTE(v11[2]) < 0) {
      operator delete(v11[0]);
    }
    uint64_t v4 = 0;
  }
  else
  {
    id v17 = &v15;
    xpc_object_t v18 = "reenable-sampling";
    applesauce::xpc::dict::object_proxy::operator applesauce::xpc::object((uint64_t)&v17, v11);
    uint64_t v4 = applesauce::xpc::dyn_cast_or_default();
    xpc_object_t v5 = v11[0];
    v11[0] = 0;
  }
  xpc_object_t v6 = v15;
  xpc_object_t v15 = 0;

  xpc_object_t v7 = v16;
  xpc_object_t v16 = 0;

  return v4;
}

void sub_1A7C5CA5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (*(char *)(v21 - 25) < 0) {
    operator delete(*(void **)(v21 - 48));
  }

  xpc_object_t v23 = *(void **)(v21 - 64);
  *(void *)(v21 - 64) = 0;

  uint64_t v24 = *(void **)(v21 - 56);
  *(void *)(v21 - 56) = 0;

  _Unwind_Resume(a1);
}

uint64_t AnalyticsNotifyTaskingAvailable(void *a1)
{
  id v1 = a1;
  uint64_t v2 = analytics_notify_tasking_available((const char *)[v1 UTF8String]);

  return v2;
}

void sub_1A7C5CB5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t analytics_notify_tasking_available(const char *a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  CASPIEnter();
  xpc_object_t v22 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  applesauce::xpc::dict::create(&v22);
  if (a1)
  {
    applesauce::xpc::object::object((applesauce::xpc::object *)&v20, a1);
    xpc_object_t v23 = &v22;
    uint64_t v24 = "tasking-id";
    applesauce::xpc::dict::object_proxy::operator=((uint64_t)&v23, &v20, &v21);
    id v3 = v21;
    id v21 = 0;

    id v4 = v20;
    id v20 = 0;
  }
  xpc_object_t v19 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  xpc_object_t v5 = CoreAnalytics::Client::get(v2);
  std::string::basic_string[abi:ne180100]<0>(__p, "tasking-notify");
  applesauce::xpc::object::object((applesauce::xpc::object *)&v16, &v22);
  CoreAnalytics::Client::sendManagementCommandWithReply((NSObject **)v5, (uint64_t)__p, &v16, &v19);
  id v6 = v16;
  id v16 = 0;

  if (v18 < 0) {
    operator delete(__p[0]);
  }
  if (MEMORY[0x1AD0D7420](v19) == MEMORY[0x1E4F14590]
    && (xpc_object_t v23 = &v19, v24 = "error", applesauce::xpc::dict::object_proxy::operator BOOL((uint64_t)&v23)))
  {
    memset(v15, 170, sizeof(v15));
    v13[0] = &v19;
    v13[1] = "error";
    applesauce::xpc::dict::object_proxy::operator applesauce::xpc::object((uint64_t)v13, &v14);
    xpc_object_t v23 = 0;
    uint64_t v24 = 0;
    uint64_t v25 = 0;
    applesauce::xpc::dyn_cast_or_default();
    if (SHIBYTE(v25) < 0) {
      operator delete(v23);
    }
    xpc_object_t v7 = v14;
    xpc_object_t v14 = 0;

      analytics_notify_tasking_available_cold_1();
    if (SHIBYTE(v15[2]) < 0) {
      operator delete(v15[0]);
    }
    uint64_t v8 = 0;
  }
  else
  {
    xpc_object_t v23 = &v19;
    uint64_t v24 = "tasking-notify";
    applesauce::xpc::dict::object_proxy::operator applesauce::xpc::object((uint64_t)&v23, v15);
    uint64_t v8 = applesauce::xpc::dyn_cast_or_default();
    xpc_object_t v9 = v15[0];
    v15[0] = 0;
  }
  xpc_object_t v10 = v19;
  xpc_object_t v19 = 0;

  xpc_object_t v11 = v22;
  xpc_object_t v22 = 0;

  return v8;
}

void sub_1A7C5CDD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22)
{
  if (*(char *)(v22 - 41) < 0) {
    operator delete(*(void **)(v22 - 64));
  }

  uint64_t v24 = *(void **)(v22 - 72);
  *(void *)(v22 - 72) = 0;

  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

BOOL CoreAnalytics::Client::hasConfig(CoreAnalytics::Client *this)
{
  return *((void *)this + 10) != 0;
}

void **applesauce::xpc::object::object(void **a1, void **a2)
{
  id v3 = *a2;
  *a1 = *a2;
  if (v3) {
    xpc_retain(v3);
  }
  else {
    *a1 = xpc_null_create();
  }
  return a1;
}

void CoreAnalytics::Client::registerConfigurationObserver(NSObject **a1, uint64_t a2)
{
  void block[5] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  id v3 = a1;
  *(_OWORD *)id v4 = *(_OWORD *)a2;
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 0x40000000;
  block[2] = ___ZN10applesauce8dispatch2v19sync_implIZN13CoreAnalytics6Client29registerConfigurationObserverENSt3__18weak_ptrINS3_21ConfigurationObserverEEEE3__0EEvP16dispatch_queue_sOT_NS5_17integral_constantIbLb1EEE_block_invoke;
  block[3] = &__block_descriptor_tmp_141;
  void block[4] = &v3;
  dispatch_sync(v2, block);
  if (v4[1]) {
    std::__shared_weak_count::__release_weak(v4[1]);
  }
}

void anonymous namespace'::atExitHandler(_anonymous_namespace_ *this)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if ((_dispatch_is_fork_of_multithreaded_parent() & 1) == 0)
  {
    id v1 = (void *)os_transaction_create();
    if (v3)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1A7C3B000, v2, OS_LOG_TYPE_DEFAULT, "Entering exit handler.", buf, 2u);
    }
    id v4 = CoreAnalytics::Client::get((CoreAnalytics::Client *)v3);
    CoreAnalytics::Client::sendExitBarrierWithTimeoutSync((NSObject **)v4, 0x12Cu);
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_1A7C3B000, v5, OS_LOG_TYPE_DEFAULT, "Exiting exit handler.", v6, 2u);
    }
    os_release(v1);
  }
}

void ___ZN13CoreAnalytics6Client4initEv_block_invoke_2(uint64_t a1)
{
  id v1 = *(CoreAnalytics::Client **)(a1 + 32);
  CoreAnalytics::Client::updateDaemonState(v1);
  if (*((unsigned char *)v1 + 60))
  {
    CoreAnalytics::Client::sendCheckinMessage_sync(v1);
  }
}

uint64_t ___ZN13CoreAnalytics6Client14initConnectionEv_block_invoke_26(uint64_t a1, int a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = *(CoreAnalytics::Client **)(a1 + 32);
  uint64_t result = xpc_user_sessions_get_foreground_uid();
  if (result != *(_DWORD *)(a1 + 40))
  {
    {
      *(_WORD *)xpc_object_t v7 = 0;
      _os_log_impl(&dword_1A7C3B000, v6, OS_LOG_TYPE_DEFAULT, "Re-estabilishing XPC connection after a user switch", v7, 2u);
    }
    CoreAnalytics::Client::initConnection(v4);
    return notify_cancel(a2);
  }
  return result;
}

void CoreAnalytics::Client::acquireSendTransaction(NSObject **this)
{
  v2[5] = *MEMORY[0x1E4F143B8];
  id v1 = *this;
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 0x40000000;
  _DWORD v2[2] = ___ZN13CoreAnalytics6Client22acquireSendTransactionEv_block_invoke;
  v2[3] = &__block_descriptor_tmp_35;
  v2[4] = this;
  dispatch_sync(v1, v2);
}

void CoreAnalytics::Client::releaseSendTransaction(NSObject **this)
{
  v2[5] = *MEMORY[0x1E4F143B8];
  id v1 = *this;
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 0x40000000;
  _DWORD v2[2] = ___ZN13CoreAnalytics6Client22releaseSendTransactionEv_block_invoke;
  v2[3] = &__block_descriptor_tmp_36;
  v2[4] = this;
  dispatch_sync(v1, v2);
}

void ___ZN13CoreAnalytics6Client26retryXpcMessageHelper_syncEN10applesauce3xpc4dictE18XPCMessagePrioritybhy_block_invoke_29(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  {
    id v4 = *(void **)(a1 + 40);
    xpc_object_t object = v4;
    if (v4) {
      xpc_retain(v4);
    }
    else {
      xpc_object_t object = xpc_null_create();
    }
    try_xpc_to_json(&object, &v9);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::dump((uint64_t)&v9, -1, 0x20u, 0, 1, __p);
    if (v12 >= 0) {
      xpc_object_t v5 = __p;
    }
    else {
      xpc_object_t v5 = (void **)__p[0];
    }
    *(_DWORD *)long long buf = 136315138;
    xpc_object_t v14 = v5;
    _os_log_impl(&dword_1A7C3B000, v3, OS_LOG_TYPE_DEFAULT, "Retrying message: %s", buf, 0xCu);
    if (v12 < 0) {
      operator delete(__p[0]);
    }
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v9);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v10, v9);
    xpc_release(object);
  }
  xpc_object_t v6 = *(xpc_object_t *)(a1 + 40);
  xpc_object_t v7 = v6;
  if (v6)
  {
    xpc_retain(v6);
  }
  else
  {
    xpc_object_t v6 = xpc_null_create();
    xpc_object_t v7 = v6;
  }
  CoreAnalytics::Client::retryXpcMessageHelper_sync(v2, &v7, *(unsigned __int8 *)(a1 + 56), *(unsigned __int8 *)(a1 + 57), (*(unsigned char *)(a1 + 58) + 1), 2 * *(void *)(a1 + 48));
  xpc_release(v6);
}

void sub_1A7C5D4EC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, xpc_object_t object, char a12)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

void CoreAnalytics::Client::cancelConnection_sync(xpc_connection_t *this)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  if (MEMORY[0x1AD0D7420](this[6]) == MEMORY[0x1E4F14578] && !*((unsigned char *)this + 40))
  {
    {
      *(_WORD *)BOOL v3 = 0;
      _os_log_impl(&dword_1A7C3B000, v2, OS_LOG_TYPE_DEFAULT, "Cancelling XPC connection. Any further reply handler invocations will not retry messages", v3, 2u);
    }
    xpc_connection_cancel(this[6]);
    *((unsigned char *)this + 40) = 1;
  }
}

void CoreAnalytics::Client::handleSinkMessageEmit_sync(CoreAnalytics::Client *this, xpc_object_t *a2)
{
  v14[4] = *MEMORY[0x1E4F143B8];
  string = xpc_dictionary_get_string(*a2, "message");
  if (string)
  {
    unint64_t v11 = 0xAAAAAAAAAAAAAAAALL;
    char v12 = (uint64_t *)0xAAAAAAAAAAAAAAAALL;
    v14[3] = 0;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::parse<char const*&>(&string, (uint64_t)v14, 1, &v11);
    std::__function::__value_func<BOOL ()(int,nlohmann::detail::parse_event_t,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> &)>::~__value_func[abi:ne180100](v14);
    if (v11 == 1)
    {
      BOOL v3 = (uint64_t *)*((void *)this + 15);
      for (int i = (uint64_t *)*((void *)this + 16); v3 != i; v3 += 2)
      {
        xpc_object_t v5 = (std::__shared_weak_count *)v3[1];
        if (v5)
        {
          uint64_t v6 = *v3;
          atomic_fetch_add_explicit(&v5->__shared_weak_owners_, 1uLL, memory_order_relaxed);
          xpc_object_t v7 = std::__shared_weak_count::lock(v5);
          if (v7)
          {
            uint64_t v8 = v7;
            if (v6)
            {
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v9, (uint64_t)&v11);
              (*(void (**)(uint64_t, unsigned char *))(*(void *)v6 + 16))(v6, v9);
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v9);
              nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v10, v9[0]);
            }
            std::__shared_weak_count::__release_shared[abi:ne180100](v8);
          }
          std::__shared_weak_count::__release_weak(v5);
        }
      }
    }
    {
      CoreAnalytics::Client::handleSinkMessageEmit_sync();
    }
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v11);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v12, v11);
  }
  {
    CoreAnalytics::Client::handleSinkMessageEmit_sync();
  }
}

void sub_1A7C5D7D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va1, a4);
  va_start(va, a4);
  uint64_t v6 = va_arg(va1, void);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v9 = va_arg(va1, void);
  std::__function::__value_func<BOOL ()(int,nlohmann::detail::parse_event_t,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> &)>::~__value_func[abi:ne180100]((uint64_t *)va1);
  if (a2 == 1)
  {
    CoreAnalytics::Client::handleSinkMessageEmit_sync(a1, a2, (uint64_t)va);
    JUMPOUT(0x1A7C5D674);
  }
  _Unwind_Resume(a1);
}

void CoreAnalytics::Client::sendExitBarrierWithTimeoutSync(NSObject **this, unsigned int a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = dispatch_group_create();
  dispatch_group_enter(v4);
  xpc_object_t v5 = *this;
  uint64_t v8 = this;
  dispatch_object_t object = v4;
  if (v4) {
    dispatch_retain(v4);
  }
  uint64_t block = MEMORY[0x1E4F143A8];
  uint64_t v11 = 0x40000000;
  char v12 = ___ZN10applesauce8dispatch2v19sync_implIZN13CoreAnalytics6Client30sendExitBarrierWithTimeoutSyncEjE3__0EEvP16dispatch_queue_sOT_NSt3__117integral_constantIbLb1EEE_block_invoke;
  uint64_t v13 = &__block_descriptor_tmp_284;
  xpc_object_t v14 = &v8;
  dispatch_sync(v5, &block);
  if (object) {
    dispatch_release(object);
  }
  dispatch_time_t v6 = dispatch_time(0, 1000000 * a2);
  if (dispatch_group_wait(v4, v6))
  {
    uint64_t v8 = this;
    xpc_object_t v7 = *this;
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v11 = 0x40000000;
    char v12 = ___ZN10applesauce8dispatch2v19sync_implIZN13CoreAnalytics6Client30sendExitBarrierWithTimeoutSyncEjE3__1EEvP16dispatch_queue_sOT_NSt3__117integral_constantIbLb1EEE_block_invoke;
    uint64_t v13 = &__block_descriptor_tmp_291;
    xpc_object_t v14 = &v8;
    dispatch_sync(v7, &block);
  }
  if (v4) {
    dispatch_release(v4);
  }
}

uint64_t CoreAnalytics::Client::allowAllEvents(uint64_t this)
{
  *(unsigned char *)(this + 62) = 1;
  return this;
}

void ___ZN10applesauce8dispatch2v19sync_implIZN13CoreAnalytics6Client29registerConfigurationObserverENSt3__18weak_ptrINS3_21ConfigurationObserverEEEE3__0EEvP16dispatch_queue_sOT_NS5_17integral_constantIbLb1EEE_block_invoke(uint64_t a1)
{
  id v1 = *(CoreAnalytics::Client ***)(a1 + 32);
  uint64_t v2 = *v1;
  std::vector<std::weak_ptr<CoreAnalytics::ConfigurationObserver>>::emplace_back<std::weak_ptr<CoreAnalytics::ConfigurationObserver>>((uint64_t *)*v1 + 12, (uint64_t)(v1 + 1));
  if (*((void *)v2 + 10))
  {
    uint64_t v3 = *((void *)v2 + 13);
    uint64_t v4 = *(std::__shared_weak_count **)(v3 - 8);
    if (v4)
    {
      xpc_object_t v5 = std::__shared_weak_count::lock(v4);
      if (v5)
      {
        dispatch_time_t v6 = v5;
        uint64_t v7 = *(void *)(v3 - 16);
        if (v7) {
          (*(void (**)(uint64_t, void))(*(void *)v7 + 16))(v7, *((void *)v2 + 10));
        }
        std::__shared_weak_count::__release_shared[abi:ne180100](v6);
      }
    }
  }
  else
  {
    CoreAnalytics::Client::sendCheckinMessage_sync(v2);
  }
}

void sub_1A7C5DA80(_Unwind_Exception *a1)
{
  std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

_OWORD *std::vector<std::weak_ptr<CoreAnalytics::ConfigurationObserver>>::emplace_back<std::weak_ptr<CoreAnalytics::ConfigurationObserver>>(uint64_t *a1, uint64_t a2)
{
  v17[5] = *(void **)MEMORY[0x1E4F143B8];
  unint64_t v6 = a1[2];
  uint64_t v4 = a1 + 2;
  unint64_t v5 = v6;
  uint64_t v7 = (_OWORD *)*(v4 - 1);
  if ((unint64_t)v7 >= v6)
  {
    uint64_t v9 = ((uint64_t)v7 - *a1) >> 4;
    if ((unint64_t)(v9 + 1) >> 60) {
      std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v10 = v5 - *a1;
    uint64_t v11 = v10 >> 3;
    if (v10 >> 3 <= (unint64_t)(v9 + 1)) {
      uint64_t v11 = v9 + 1;
    }
    if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v12 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v11;
    }
    xpc_object_t v17[4] = v4;
    uint64_t v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>((uint64_t)v4, v12);
    xpc_object_t v14 = &v13[16 * v9];
    v17[0] = v13;
    v17[1] = v14;
    v17[3] = &v13[16 * v15];
    *(_OWORD *)xpc_object_t v14 = *(_OWORD *)a2;
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
    void v17[2] = v14 + 16;
    std::vector<std::weak_ptr<CoreAnalytics::ConfigurationObserver>>::__swap_out_circular_buffer(a1, v17);
    uint64_t v8 = (_OWORD *)a1[1];
    std::__split_buffer<std::weak_ptr<CoreAnalytics::ConfigurationObserver>>::~__split_buffer(v17);
  }
  else
  {
    _OWORD *v7 = *(_OWORD *)a2;
    uint64_t v8 = v7 + 1;
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
    a1[1] = (uint64_t)v8;
  }
  a1[1] = (uint64_t)v8;
  return v8 - 1;
}

void sub_1A7C5DBA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
}

uint64_t std::vector<std::weak_ptr<CoreAnalytics::ConfigurationObserver>>::__swap_out_circular_buffer(uint64_t *a1, void *a2)
{
  uint64_t result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::weak_ptr<CoreAnalytics::ConfigurationObserver>>,std::reverse_iterator<std::weak_ptr<CoreAnalytics::ConfigurationObserver>*>,std::reverse_iterator<std::weak_ptr<CoreAnalytics::ConfigurationObserver>*>,std::reverse_iterator<std::weak_ptr<CoreAnalytics::ConfigurationObserver>*>>((uint64_t)(a1 + 2), a1[1], (void *)a1[1], *a1, (void *)*a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::weak_ptr<CoreAnalytics::ConfigurationObserver>>,std::reverse_iterator<std::weak_ptr<CoreAnalytics::ConfigurationObserver>*>,std::reverse_iterator<std::weak_ptr<CoreAnalytics::ConfigurationObserver>*>,std::reverse_iterator<std::weak_ptr<CoreAnalytics::ConfigurationObserver>*>>(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  *(void *)&long long v13 = a6;
  *((void *)&v13 + 1) = a7;
  long long v12 = v13;
  v14[0] = a1;
  v14[1] = &v12;
  xpc_object_t v14[2] = &v13;
  unint64_t v15 = 0xAAAAAAAAAAAAAAAALL;
  if (a3 == a5)
  {
    uint64_t v10 = a6;
  }
  else
  {
    uint64_t v8 = (_OWORD *)(a7 - 16);
    do
    {
      long long v9 = *((_OWORD *)a3 - 1);
      a3 -= 2;
      _OWORD *v8 = v9;
      *a3 = 0;
      a3[1] = 0;
      *((void *)&v13 + 1) = v8;
      v7 -= 16;
      --v8;
    }
    while (a3 != a5);
    uint64_t v10 = v13;
  }
  LOBYTE(v15) = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::weak_ptr<CoreAnalytics::ConfigurationObserver>>,std::reverse_iterator<std::weak_ptr<CoreAnalytics::ConfigurationObserver>*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v14);
  return v10;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::weak_ptr<CoreAnalytics::ConfigurationObserver>>,std::reverse_iterator<std::weak_ptr<CoreAnalytics::ConfigurationObserver>*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<std::weak_ptr<CoreAnalytics::ConfigurationObserver>>,std::reverse_iterator<std::weak_ptr<CoreAnalytics::ConfigurationObserver>*>>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::weak_ptr<CoreAnalytics::ConfigurationObserver>>,std::reverse_iterator<std::weak_ptr<CoreAnalytics::ConfigurationObserver>*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 16) + 8);
  uint64_t v2 = *(void *)(*(void *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    uint64_t v3 = *(std::__shared_weak_count **)(v1 + 8);
    if (v3) {
      std::__shared_weak_count::__release_weak(v3);
    }
    v1 += 16;
  }
}

void **std::__split_buffer<std::weak_ptr<CoreAnalytics::ConfigurationObserver>>::~__split_buffer(void **a1)
{
  if (*a1) {
    operator delete(*a1);
  }
  return a1;
}

void std::__split_buffer<std::weak_ptr<CoreAnalytics::ConfigurationObserver>>::clear[abi:ne180100](uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v1 = *(void *)(a1 + 16);
  while (v1 != v2)
  {
    *(void *)(a1 + 16) = v1 - 16;
    uint64_t v4 = *(std::__shared_weak_count **)(v1 - 8);
    if (v4)
    {
      std::__shared_weak_count::__release_weak(v4);
      uint64_t v1 = *(void *)(a1 + 16);
    }
    else
    {
      v1 -= 16;
    }
  }
}

uint64_t std::vector<std::weak_ptr<CoreAnalytics::EventObserver>>::__swap_out_circular_buffer(uint64_t *a1, void *a2)
{
  uint64_t result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::weak_ptr<CoreAnalytics::EventObserver>>,std::reverse_iterator<std::weak_ptr<CoreAnalytics::EventObserver>*>,std::reverse_iterator<std::weak_ptr<CoreAnalytics::EventObserver>*>,std::reverse_iterator<std::weak_ptr<CoreAnalytics::EventObserver>*>>((uint64_t)(a1 + 2), a1[1], (void *)a1[1], *a1, (void *)*a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::weak_ptr<CoreAnalytics::EventObserver>>,std::reverse_iterator<std::weak_ptr<CoreAnalytics::EventObserver>*>,std::reverse_iterator<std::weak_ptr<CoreAnalytics::EventObserver>*>,std::reverse_iterator<std::weak_ptr<CoreAnalytics::EventObserver>*>>(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  *(void *)&long long v13 = a6;
  *((void *)&v13 + 1) = a7;
  long long v12 = v13;
  v14[0] = a1;
  v14[1] = &v12;
  xpc_object_t v14[2] = &v13;
  unint64_t v15 = 0xAAAAAAAAAAAAAAAALL;
  if (a3 == a5)
  {
    uint64_t v10 = a6;
  }
  else
  {
    uint64_t v8 = (_OWORD *)(a7 - 16);
    do
    {
      long long v9 = *((_OWORD *)a3 - 1);
      a3 -= 2;
      _OWORD *v8 = v9;
      *a3 = 0;
      a3[1] = 0;
      *((void *)&v13 + 1) = v8;
      v7 -= 16;
      --v8;
    }
    while (a3 != a5);
    uint64_t v10 = v13;
  }
  LOBYTE(v15) = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::weak_ptr<CoreAnalytics::EventObserver>>,std::reverse_iterator<std::weak_ptr<CoreAnalytics::EventObserver>*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v14);
  return v10;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::weak_ptr<CoreAnalytics::EventObserver>>,std::reverse_iterator<std::weak_ptr<CoreAnalytics::EventObserver>*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<std::weak_ptr<CoreAnalytics::ConfigurationObserver>>,std::reverse_iterator<std::weak_ptr<CoreAnalytics::ConfigurationObserver>*>>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void *std::__function::__func<std::function<void ()(std::string const&)>,std::allocator<std::function<void ()(std::string const&)>>,void ()(std::string)>::~__func(void *a1)
{
  *a1 = &unk_1EFE15F60;
  std::__function::__value_func<void ()(std::string const&)>::~__value_func[abi:ne180100](a1 + 1);
  return a1;
}

void std::__function::__func<std::function<void ()(std::string const&)>,std::allocator<std::function<void ()(std::string const&)>>,void ()(std::string)>::~__func(void *a1)
{
  *a1 = &unk_1EFE15F60;
  std::__function::__value_func<void ()(std::string const&)>::~__value_func[abi:ne180100](a1 + 1);

  JUMPOUT(0x1AD0D6A20);
}

void *std::__function::__func<std::function<void ()(std::string const&)>,std::allocator<std::function<void ()(std::string const&)>>,void ()(std::string)>::__clone(uint64_t a1)
{
  uint64_t v1 = a1 + 8;
  uint64_t v2 = operator new(0x28uLL);
  void *v2 = &unk_1EFE15F60;
  std::__function::__value_func<void ()(std::string const&)>::__value_func[abi:ne180100]((uint64_t)(v2 + 1), v1);
  return v2;
}

void sub_1A7C5E064(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t std::__function::__func<std::function<void ()(std::string const&)>,std::allocator<std::function<void ()(std::string const&)>>,void ()(std::string)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_1EFE15F60;
  return std::__function::__value_func<void ()(std::string const&)>::__value_func[abi:ne180100]((uint64_t)(a2 + 1), a1 + 8);
}

void *std::__function::__func<std::function<void ()(std::string const&)>,std::allocator<std::function<void ()(std::string const&)>>,void ()(std::string)>::destroy(uint64_t a1)
{
  return std::__function::__value_func<void ()(std::string const&)>::~__value_func[abi:ne180100]((void *)(a1 + 8));
}

uint64_t std::__function::__func<std::function<void ()(std::string const&)>,std::allocator<std::function<void ()(std::string const&)>>,void ()(std::string)>::operator()(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!v1) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)v1 + 48);

  return v2();
}

uint64_t std::__function::__func<std::function<void ()(std::string const&)>,std::allocator<std::function<void ()(std::string const&)>>,void ()(std::string)>::target(uint64_t a1, uint64_t a2)
{
    return a1 + 8;
  else {
    return 0;
  }
}

void *std::__function::__func<std::function<void ()(std::string const&)>,std::allocator<std::function<void ()(std::string const&)>>,void ()(std::string)>::target_type()
{
}

void *nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::parse<char const*&>@<X0>(const char **a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, void *a4@<X8>)
{
  v13[18] = *MEMORY[0x1E4F143B8];
  *a4 = 0xAAAAAAAAAAAAAAAALL;
  a4[1] = 0;
  *(unsigned char *)a4 = 0;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)a4);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)a4);
  uint64_t v8 = *a1;
  size_t v9 = strlen(v8);
  std::__function::__value_func<BOOL ()(int,nlohmann::detail::parse_event_t,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> &)>::__value_func[abi:ne180100]((uint64_t)v11, a2);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::parser<nlohmann::detail::iterator_input_adapter<char const*>>((uint64_t)v8, (uint64_t)&v8[v9], (uint64_t)v11, a3, (uint64_t)v12);
  nlohmann::detail::parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::parse((uint64_t)v12, 1, (uint64_t)a4);
  nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::~lexer((uint64_t)v13);
  std::__function::__value_func<BOOL ()(int,nlohmann::detail::parse_event_t,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> &)>::~__value_func[abi:ne180100](v12);
  return std::__function::__value_func<BOOL ()(int,nlohmann::detail::parse_event_t,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> &)>::~__value_func[abi:ne180100](v11);
}

void sub_1A7C5E2CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::~lexer(v14 + 40);
  std::__function::__value_func<BOOL ()(int,nlohmann::detail::parse_event_t,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> &)>::~__value_func[abi:ne180100](&a13);
  std::__function::__value_func<BOOL ()(int,nlohmann::detail::parse_event_t,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> &)>::~__value_func[abi:ne180100](&a9);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::~basic_json(v13);
  _Unwind_Resume(a1);
}

void ___ZN10applesauce8dispatch2v19sync_implIZN13CoreAnalytics6Client30sendExitBarrierWithTimeoutSyncEjE3__0EEvP16dispatch_queue_sOT_NSt3__117integral_constantIbLb1EEE_block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *v1;
  if (MEMORY[0x1AD0D7420](*(void *)(*v1 + 48)) == MEMORY[0x1E4F14578])
  {
    {
      int v5 = *(_DWORD *)(v2 + 72);
      LODWORD(v8[0]) = 67109120;
      HIDWORD(v8[0]) = v5;
      _os_log_impl(&dword_1A7C3B000, v4, OS_LOG_TYPE_DEFAULT, "Queueing exit procedure onto XPC queue. Any further messages sent will be discarded. activeSendTransactions=%d", (uint8_t *)v8, 8u);
    }
    uint64_t v6 = *(NSObject **)(v2 + 8);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 1174405120;
    void v8[2] = ___ZZN13CoreAnalytics6Client30sendExitBarrierWithTimeoutSyncEjENK3__0clEv_block_invoke;
    v8[3] = &__block_descriptor_tmp_289;
    void v8[4] = v2;
    uint64_t v7 = v1[1];
    dispatch_object_t object = v7;
    if (v7) {
      dispatch_retain(v7);
    }
    dispatch_async(v6, v8);
    if (object) {
      dispatch_release(object);
    }
  }
  else
  {
    uint64_t v3 = v1[1];
    dispatch_group_leave(v3);
  }
}

void ___ZZN13CoreAnalytics6Client30sendExitBarrierWithTimeoutSyncEjENK3__0clEv_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
    ___ZZN13CoreAnalytics6Client30sendExitBarrierWithTimeoutSyncEjENK3__0clEv_block_invoke_cold_1();
  uint64_t v3 = *(_xpc_connection_s **)(v2 + 48);
  barrier[0] = MEMORY[0x1E4F143A8];
  barrier[1] = 1174405120;
  barrier[2] = ___ZZN13CoreAnalytics6Client30sendExitBarrierWithTimeoutSyncEjENK3__0clEv_block_invoke_285;
  barrier[3] = &__block_descriptor_tmp_286;
  uint64_t v4 = *(NSObject **)(a1 + 40);
  barrier[4] = v2;
  dispatch_object_t object = v4;
  if (v4) {
    dispatch_retain(v4);
  }
  xpc_connection_send_barrier(v3, barrier);
  if (object) {
    dispatch_release(object);
  }
}

void sub_1A7C5E584(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, dispatch_object_t object)
{
}

void ___ZZN13CoreAnalytics6Client30sendExitBarrierWithTimeoutSyncEjENK3__0clEv_block_invoke_285(uint64_t a1)
{
  void block[5] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(NSObject ***)(a1 + 32);
    ___ZZN13CoreAnalytics6Client30sendExitBarrierWithTimeoutSyncEjENK3__0clEv_block_invoke_285_cold_1();
  uint64_t v4 = v2;
  uint64_t v3 = *v2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 0x40000000;
  block[2] = ___ZN10applesauce8dispatch2v19sync_implIZZZZN13CoreAnalytics6Client30sendExitBarrierWithTimeoutSyncEjENK3__0clEvEUb_EUb_EUlvE_EEvP16dispatch_queue_sOT_NSt3__117integral_constantIbLb1EEE_block_invoke;
  block[3] = &__block_descriptor_tmp_290;
  void block[4] = &v4;
  dispatch_sync(v3, block);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __copy_helper_block_e8_40c36_ZTSN10applesauce8dispatch2v15groupE(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(NSObject **)(a2 + 40);
  *(void *)(a1 + 40) = v3;
  if (v3) {
    dispatch_retain(v3);
  }
}

void __destroy_helper_block_e8_40c36_ZTSN10applesauce8dispatch2v15groupE(uint64_t a1)
{
  uint64_t v1 = *(NSObject **)(a1 + 40);
  if (v1) {
    dispatch_release(v1);
  }
}

void ___ZN10applesauce8dispatch2v19sync_implIZZZZN13CoreAnalytics6Client30sendExitBarrierWithTimeoutSyncEjENK3__0clEvEUb_EUb_EUlvE_EEvP16dispatch_queue_sOT_NSt3__117integral_constantIbLb1EEE_block_invoke(uint64_t a1)
{
}

void ___ZN10applesauce8dispatch2v19sync_implIZN13CoreAnalytics6Client30sendExitBarrierWithTimeoutSyncEjE3__1EEvP16dispatch_queue_sOT_NSt3__117integral_constantIbLb1EEE_block_invoke(uint64_t a1)
{
  uint64_t v1 = **(xpc_connection_t ***)(a1 + 32);
    ___ZN10applesauce8dispatch2v19sync_implIZN13CoreAnalytics6Client30sendExitBarrierWithTimeoutSyncEjE3__1EEvP16dispatch_queue_sOT_NSt3__117integral_constantIbLb1EEE_block_invoke_cold_1((uint64_t)v1, v2);
  CoreAnalytics::Client::cancelConnection_sync(v1);
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void MemoryMappedBuffer::~MemoryMappedBuffer(MemoryMappedBuffer *this)
{
  uint64_t v2 = *(void **)this;
  if (v2 != (void *)-1)
  {
    munmap(v2, *((void *)this + 1));
    *(void *)this = -1;
  }
}

void makeXpcFromNSObject(NSObject *a1@<X0>, xpc_object_t *a2@<X8>)
{
}

void makeXpcFromNSObjectWithDepthCount(xpc_object_t *__return_ptr a1@<X8>, NSObject *a2@<X0>, unsigned int a3@<W1>)
{
  v26[1] = *(void **)MEMORY[0x1E4F143B8];
  int v5 = a2;
  if (a3 >= 0xB) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Object exceeded the max depth"];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = (const char *)[v5 UTF8String];
    if (!v6) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Invalid non-UTF8 character(s) in string value"];
    }
    applesauce::xpc::object::object((applesauce::xpc::object *)a1, v6);
    goto LABEL_41;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = v5;
    CFTypeID v8 = CFGetTypeID(v7);
    if (v8 == CFBooleanGetTypeID())
    {
      applesauce::xpc::object::object((applesauce::xpc::object *)a1, [v7 BOOLValue]);
LABEL_40:

      goto LABEL_41;
    }
    uint64_t v11 = v7;
    int v12 = *(char *)[v11 objCType];
    if (v12 <= 80)
    {
      if (v12 > 72)
      {
        if (v12 == 73 || v12 == 76) {
          goto LABEL_34;
        }
        goto LABEL_37;
      }
      if (v12 != 66)
      {
        if (v12 == 67)
        {
LABEL_34:
          applesauce::xpc::object::object((applesauce::xpc::object *)a1, [v11 unsignedLongLongValue]);
          goto LABEL_40;
        }
LABEL_37:
        char v18 = (void *)MEMORY[0x1E4F1CA00];
        xpc_object_t v19 = (char *)[v11 objCType];
        objc_msgSend(v18, "raise:format:", *MEMORY[0x1E4F1C3C8], @"Invalid number type in JSON write (%c)", *v19);
        *a1 = xpc_null_create();
        goto LABEL_40;
      }
    }
    else
    {
      if ((v12 - 99) > 0x10) {
        goto LABEL_32;
      }
      if (((1 << (v12 - 99)) & 0x14241) == 0)
      {
        if (v12 == 100)
        {
          [v11 doubleValue];
          goto LABEL_39;
        }
        if (v12 == 102)
        {
          [v11 floatValue];
          double v14 = v13;
LABEL_39:
          applesauce::xpc::object::object((applesauce::xpc::object *)a1, v14);
          goto LABEL_40;
        }
LABEL_32:
        if (v12 == 81 || v12 == 83) {
          goto LABEL_34;
        }
        goto LABEL_37;
      }
    }
    applesauce::xpc::object::object((applesauce::xpc::object *)a1, [v11 longLongValue]);
    goto LABEL_40;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v26[0] = (void *)0xAAAAAAAAAAAAAAAALL;
    applesauce::xpc::dict::create(v26);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3321888768;
    v23[2] = ___ZL33makeXpcFromNSObjectWithDepthCountP8NSObjecth_block_invoke;
    v23[3] = &__block_descriptor_41_ea8_32c27_ZTSN10applesauce3xpc4dictE_e15_v32__0_8_16_B24l;
    applesauce::xpc::object::object((applesauce::xpc::object *)&v24, v26);
    char v25 = a3;
    [v5 enumerateKeysAndObjectsUsingBlock:v23];
    applesauce::xpc::object::object(a1, v26);
    id v9 = v24;
    id v24 = 0;

    uint64_t v10 = v26[0];
    v26[0] = 0;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v26[0] = (void *)0xAAAAAAAAAAAAAAAALL;
      applesauce::xpc::array::create(v26);
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3321888768;
      _OWORD v20[2] = ___ZL33makeXpcFromNSObjectWithDepthCountP8NSObjecth_block_invoke_15;
      v20[3] = &__block_descriptor_41_ea8_32c28_ZTSN10applesauce3xpc5arrayE_e15_v32__0_8Q16_B24l;
      applesauce::xpc::object::object((applesauce::xpc::object *)&v21, v26);
      char v22 = a3;
      [v5 enumerateObjectsUsingBlock:v20];
      applesauce::xpc::object::object((applesauce::xpc::object *)a1, v26);
      id v15 = v21;
      id v21 = 0;

      uint64_t v16 = v26[0];
      v26[0] = 0;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v17 = v5;
        applesauce::xpc::object::object((applesauce::xpc::object *)a1, (const void *)[v17 bytes], [v17 length]);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Invalid type in JSON write (%@)", objc_opt_class() format];
        }
        *a1 = xpc_null_create();
      }
    }
  }
LABEL_41:
}

void sub_1A7C5EC58(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void ___ZL33makeXpcFromNSObjectWithDepthCountP8NSObjecth_block_invoke(uint64_t a1, void *a2, void *a3)
{
  v12[1] = *(id *)MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [v5 UTF8String];
    if (!v7) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Invalid non-UTF8 character(s) in dictionary key"];
    }
    makeXpcFromNSObjectWithDepthCount((uint64_t *)&v11, v6, *(unsigned char *)(a1 + 40) + 1);
    v10[0] = a1 + 32;
    v10[1] = v7;
    applesauce::xpc::dict::object_proxy::operator=((uint64_t)v10, &v11, v12);
    id v8 = v12[0];
    v12[0] = 0;

    id v9 = v11;
    id v11 = 0;
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Invalid (non-string) key in dictionary"];
  }
}

void sub_1A7C5EE3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

applesauce::xpc::object *__copy_helper_block_ea8_32c27_ZTSN10applesauce3xpc4dictE(uint64_t a1, uint64_t a2)
{
  return applesauce::xpc::object::object((applesauce::xpc::object *)(a1 + 32), (id *)(a2 + 32));
}

void __destroy_helper_block_ea8_32c27_ZTSN10applesauce3xpc4dictE(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  *(void *)(a1 + 32) = 0;

  uint64_t v3 = *(void **)(a1 + 32);
}

void ___ZL33makeXpcFromNSObjectWithDepthCountP8NSObjecth_block_invoke_15(uint64_t a1, NSObject *a2)
{
  value[1] = *(xpc_object_t *)MEMORY[0x1E4F143B8];
  makeXpcFromNSObjectWithDepthCount((uint64_t *)value, a2, *(unsigned char *)(a1 + 40) + 1);
  xpc_array_append_value(*(xpc_object_t *)(a1 + 32), value[0]);
  xpc_object_t v3 = value[0];
  value[0] = 0;
}

void sub_1A7C5EF38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

applesauce::xpc::object *__copy_helper_block_ea8_32c28_ZTSN10applesauce3xpc5arrayE(uint64_t a1, uint64_t a2)
{
  return applesauce::xpc::object::object((applesauce::xpc::object *)(a1 + 32), (id *)(a2 + 32));
}

void __destroy_helper_block_ea8_32c28_ZTSN10applesauce3xpc5arrayE(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  *(void *)(a1 + 32) = 0;

  xpc_object_t v3 = *(void **)(a1 + 32);
}

applesauce::xpc::object *applesauce::xpc::object::object(applesauce::xpc::object *this, const void *bytes, size_t length)
{
  xpc_object_t v4 = xpc_data_create(bytes, length);
  *(void *)this = v4;
  if (!v4)
  {
    xpc_object_t v5 = xpc_null_create();
    uint64_t v6 = *(void **)this;
    *(void *)this = v5;
  }
  return this;
}

applesauce::xpc::object *applesauce::xpc::object::object(applesauce::xpc::object *this, uint64_t value)
{
  xpc_object_t v3 = xpc_uint64_create(value);
  *(void *)this = v3;
  if (!v3)
  {
    xpc_object_t v4 = xpc_null_create();
    xpc_object_t v5 = *(void **)this;
    *(void *)this = v4;
  }
  return this;
}

applesauce::xpc::object *applesauce::xpc::object::object(applesauce::xpc::object *this, double a2)
{
  xpc_object_t v3 = xpc_double_create(a2);
  *(void *)this = v3;
  if (!v3)
  {
    xpc_object_t v4 = xpc_null_create();
    xpc_object_t v5 = *(void **)this;
    *(void *)this = v4;
  }
  return this;
}

void try_xpc_to_json(xpc_object_t *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_1A7C5F1D8(void *a1)
{
  try_xpc_to_json(a1, v1);
  JUMPOUT(0x1A7C5F1CCLL);
}

void std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__vdeallocate(void **a1)
{
  if (*a1)
  {
    std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::clear[abi:ne180100](a1);
    operator delete(*a1);
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
  }
}

uint64_t nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char (&)[37],char [37],0>(uint64_t a1, char *a2)
{
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)a1 = 3;
  *(void *)(a1 + 8) = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::create<std::string,char const(&)[37]>(a2);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a1);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a1);
  return a1;
}

void *nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::create<std::string,char const(&)[37]>(char *a1)
{
  uint64_t v2 = operator new(0x18uLL);
  std::string::basic_string[abi:ne180100]<0>(v2, a1);
  return v2;
}

void sub_1A7C5F2A8(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1A7C5F2BC()
{
  uint64_t v0 = sub_1A7C62710();
  __swift_allocate_value_buffer(v0, qword_1E9739B18);
  __swift_project_value_buffer(v0, (uint64_t)qword_1E9739B18);
  return sub_1A7C62700();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_1A7C5F3A8(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x1E4FBC868];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E97399F0);
  uint64_t v2 = (void *)sub_1A7C62800();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  xpc_object_t v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *(v4 - 2);
    uint64_t v6 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    unint64_t result = sub_1A7C60ABC(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v10 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v10 = v5;
    v10[1] = v6;
    *(void *)(v2[7] + 8 * result) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v4 += 3;
    _DWORD v2[2] = v13;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

id AnalyticsXPCQueryClient.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id AnalyticsXPCQueryClient.init()()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9739A00);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1A7C67BA0;
  uint64_t v2 = OBJC_IVAR____TtC13CoreAnalytics23AnalyticsXPCQueryClient_keyMapping;
  *(void *)(inited + 32) = 0x7474616D79657267;
  *(void *)(inited + 40) = 0xEA00000000007265;
  *(_OWORD *)(inited + 48) = xmmword_1A7C67BB0;
  *(void *)(inited + 64) = 0x80000001A7C6A010;
  *(void *)(inited + 72) = 1;
  uint64_t v3 = v0;
  *(void *)&v0[v2] = sub_1A7C5F3A8(inited);
  *(void *)&v3[OBJC_IVAR____TtC13CoreAnalytics23AnalyticsXPCQueryClient__connection] = xpc_connection_create_mach_service("com.apple.analyticsagent", 0, 0);

  v6.receiver = v3;
  v6.super_class = (Class)type metadata accessor for AnalyticsXPCQueryClient();
  id v4 = objc_msgSendSuper2(&v6, sel_init);
  sub_1A7C5F71C();

  return v4;
}

uint64_t type metadata accessor for AnalyticsXPCQueryClient()
{
  return self;
}

id AnalyticsXPCQueryClient.__deallocating_deinit()
{
  xpc_connection_cancel(*(xpc_connection_t *)&v0[OBJC_IVAR____TtC13CoreAnalytics23AnalyticsXPCQueryClient__connection]);
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AnalyticsXPCQueryClient();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_1A7C5F71C()
{
  aBlock[6] = *MEMORY[0x1E4F143B8];
  if (xpc_user_sessions_enabled() && xpc_is_system_session())
  {
    xpc_user_sessions_get_foreground_uid();
    xpc_connection_set_target_user_session_uid();
  }
  uint64_t v1 = OBJC_IVAR____TtC13CoreAnalytics23AnalyticsXPCQueryClient__connection;
  aBlock[4] = sub_1A7C5F94C;
  aBlock[5] = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1A7C5FC40;
  aBlock[3] = &block_descriptor;
  objc_super v2 = _Block_copy(aBlock);
  uint64_t v3 = (_xpc_connection_s *)swift_unknownObjectRetain();
  xpc_connection_set_event_handler(v3, v2);
  _Block_release(v2);
  swift_unknownObjectRelease();
  xpc_connection_activate(*(xpc_connection_t *)(v0 + v1));
}

void sub_1A7C5F94C()
{
  uint64_t v0 = MEMORY[0x1AD0D7420]();
  if (v0 == sub_1A7C62720())
  {
    if (qword_1E9739B00 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_1A7C62710();
    __swift_project_value_buffer(v9, (uint64_t)qword_1E9739B18);
    swift_unknownObjectRetain_n();
    objc_super v2 = sub_1A7C626F0();
    os_log_type_t v3 = sub_1A7C627A0();
    if (os_log_type_enabled(v2, v3))
    {
      id v4 = (uint8_t *)swift_slowAlloc();
      uint64_t v5 = swift_slowAlloc();
      uint64_t v12 = v5;
      *(_DWORD *)id v4 = 136446210;
      swift_unknownObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9739A08);
      uint64_t v10 = sub_1A7C62750();
      sub_1A7C60464(v10, v11, &v12);
      sub_1A7C627B0();
      swift_unknownObjectRelease_n();
      swift_bridgeObjectRelease();
      id v8 = "XPC error: %{public}s";
      goto LABEL_10;
    }
  }
  else
  {
    if (qword_1E9739B00 != -1) {
      swift_once();
    }
    uint64_t v1 = sub_1A7C62710();
    __swift_project_value_buffer(v1, (uint64_t)qword_1E9739B18);
    swift_unknownObjectRetain_n();
    objc_super v2 = sub_1A7C626F0();
    os_log_type_t v3 = sub_1A7C627A0();
    if (os_log_type_enabled(v2, v3))
    {
      id v4 = (uint8_t *)swift_slowAlloc();
      uint64_t v5 = swift_slowAlloc();
      uint64_t v12 = v5;
      *(_DWORD *)id v4 = 136446210;
      swift_unknownObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9739A08);
      uint64_t v6 = sub_1A7C62750();
      sub_1A7C60464(v6, v7, &v12);
      sub_1A7C627B0();
      swift_unknownObjectRelease_n();
      swift_bridgeObjectRelease();
      id v8 = "Unexpected XPC: %{public}s";
LABEL_10:
      _os_log_impl(&dword_1A7C3B000, v2, v3, v8, v4, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1AD0D7210](v5, -1, -1);
      MEMORY[0x1AD0D7210](v4, -1, -1);

      return;
    }
  }

  swift_unknownObjectRelease_n();
}

uint64_t sub_1A7C5FC40(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();

  return swift_unknownObjectRelease();
}

xpc_object_t sub_1A7C5FCA0(int64_t a1)
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v3, "analytics_user_data", a1);
  xpc_object_t v4 = xpc_connection_send_message_with_reply_sync(*(xpc_connection_t *)(v1 + OBJC_IVAR____TtC13CoreAnalytics23AnalyticsXPCQueryClient__connection), v3);
  uint64_t v5 = MEMORY[0x1AD0D7420]();
  unint64_t v6 = 0x1E9739000uLL;
  if (v5 == sub_1A7C62720())
  {
    if (qword_1E9739B00 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_1A7C62710();
    __swift_project_value_buffer(v7, (uint64_t)qword_1E9739B18);
    swift_unknownObjectRetain_n();
    id v8 = sub_1A7C626F0();
    os_log_type_t v9 = sub_1A7C627A0();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      uint64_t v11 = swift_slowAlloc();
      uint64_t v23 = v11;
      *(_DWORD *)uint64_t v10 = 136315138;
      id v12 = objc_msgSend(v4, sel_description);
      uint64_t v13 = sub_1A7C62740();
      unint64_t v15 = v14;

      sub_1A7C60464(v13, v15, &v23);
      sub_1A7C627B0();
      swift_unknownObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1A7C3B000, v8, v9, "Received an XPC error reply: %s", v10, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1AD0D7210](v11, -1, -1);
      uint64_t v16 = v10;
      unint64_t v6 = 0x1E9739000;
      MEMORY[0x1AD0D7210](v16, -1, -1);
    }
    else
    {

      swift_unknownObjectRelease_n();
    }
  }
  uint64_t v17 = MEMORY[0x1AD0D7420](v4);
  if (v17 != sub_1A7C62730())
  {
    if (*(void *)(v6 + 2816) != -1) {
      swift_once();
    }
    uint64_t v18 = sub_1A7C62710();
    __swift_project_value_buffer(v18, (uint64_t)qword_1E9739B18);
    xpc_object_t v19 = sub_1A7C626F0();
    os_log_type_t v20 = sub_1A7C627A0();
    if (os_log_type_enabled(v19, v20))
    {
      id v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v21 = 0;
      _os_log_impl(&dword_1A7C3B000, v19, v20, "Got unexpected response from analyticsagent", v21, 2u);
      MEMORY[0x1AD0D7210](v21, -1, -1);
    }
  }
  swift_unknownObjectRelease();
  return v4;
}

xpc_object_t AnalyticsQueryValuesFor(arguments:)()
{
  id v0 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for AnalyticsXPCQueryClient()), sel_init);
  xpc_object_t xdict = xpc_dictionary_create_empty();
  uint64_t v7 = 0;
  sub_1A7C62790();
  if (qword_1E9739B00 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_1A7C62710();
  __swift_project_value_buffer(v1, (uint64_t)qword_1E9739B18);
  uint64_t v2 = sub_1A7C626F0();
  os_log_type_t v3 = sub_1A7C627A0();
  if (os_log_type_enabled(v2, v3))
  {
    xpc_object_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)xpc_object_t v4 = 0;
    _os_log_impl(&dword_1A7C3B000, v2, v3, "Invalid parameter type. Expected a set of strings.", v4, 2u);
    MEMORY[0x1AD0D7210](v4, -1, -1);
  }
  else
  {
  }
  return xdict;
}

uint64_t sub_1A7C60464(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1A7C60538(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1A7C60C80((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x1E4FBB9B0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_1A7C60C80((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_1A7C60538(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_1A7C627C0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_1A7C606F4(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = sub_1A7C627E0();
  if (!v8)
  {
    sub_1A7C627F0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_1A7C62810();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_1A7C606F4(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_1A7C6078C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1A7C6096C(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1A7C6096C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1A7C6078C(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_1A7C60904(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_1A7C627D0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_1A7C627F0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_1A7C62780();
      if (!v2) {
        return MEMORY[0x1E4FBC860];
      }
    }
    sub_1A7C62810();
    __break(1u);
LABEL_14:
    uint64_t result = sub_1A7C627F0();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E4FBC860];
  }
  return result;
}

void *sub_1A7C60904(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x1E4FBC860];
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9739A90);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1A7C6096C(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9739A90);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_1A7C62810();
  __break(1u);
  return result;
}

unint64_t sub_1A7C60ABC(uint64_t a1, uint64_t a2)
{
  sub_1A7C62830();
  sub_1A7C62770();
  uint64_t v4 = sub_1A7C62840();

  return sub_1A7C60B4C(a1, a2, v4);
}

uint64_t method lookup function for AnalyticsXPCQueryClient(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for AnalyticsXPCQueryClient);
}

unint64_t sub_1A7C60B4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_1A7C62820() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_1A7C62820() & 1) == 0);
    }
  }
  return v6;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_1A7C60C80(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

void AnalyticsSendEventInternal()
{
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_1A7C3B000, v0, OS_LOG_TYPE_ERROR, "Dropping because event name was null", v1, 2u);
}

{
  os_log_t v0;
  uint8_t v1[8];

  OUTLINED_FUNCTION_0();
  _os_log_fault_impl(&dword_1A7C3B000, v0, OS_LOG_TYPE_FAULT, "Dropping because event name was non-UTF8", v1, 2u);
}

void nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump()
{
}

{
  __assert_rtn("dump", "serializer.hpp", 138, "i != val.m_value.object->cend()");
}

{
  __assert_rtn("dump", "serializer.hpp", 139, "std::next(i) == val.m_value.object->cend()");
}

{
  __assert_rtn("dump", "serializer.hpp", 166, "i != val.m_value.object->cend()");
}

{
  __assert_rtn("dump", "serializer.hpp", 167, "std::next(i) == val.m_value.object->cend()");
}

{
  __assert_rtn("dump", "serializer.hpp", 208, "not val.m_value.array->empty()");
}

{
  __assert_rtn("dump", "serializer.hpp", 229, "not val.m_value.array->empty()");
}

void nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_escaped()
{
}

{
  __assert_rtn("dump_escaped", "serializer.hpp", 562, "false");
}

void nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_integer<long long,0>()
{
}

void nlohmann::detail::to_chars<double>()
{
  __assert_rtn("to_chars", "to_chars.hpp", 1082, "last - first >= std::numeric_limits<FloatType>::max_digits10");
}

{
  __assert_rtn("to_chars", "to_chars.hpp", 1092, "len <= std::numeric_limits<FloatType>::max_digits10");
}

{
  __assert_rtn("to_chars", "to_chars.hpp", 1100, "last - first >= 2 + (-kMinExp - 1) + std::numeric_limits<FloatType>::max_digits10");
}

{
  __assert_rtn("to_chars", "to_chars.hpp", 1101, "last - first >= std::numeric_limits<FloatType>::max_digits10 + 6");
}

{
  __assert_rtn("to_chars", "to_chars.hpp", 1064, "std::isfinite(value)");
}

void nlohmann::detail::dtoa_impl::grisu2<double>()
{
}

{
  __assert_rtn("grisu2", "to_chars.hpp", 889, "std::isfinite(value)");
}

void nlohmann::detail::dtoa_impl::format_buffer()
{
}

{
  __assert_rtn("format_buffer", "to_chars.hpp", 980, "max_exp > 0");
}

{
  __assert_rtn("append_exponent", "to_chars.hpp", 926, "e > -1000");
}

{
  __assert_rtn("append_exponent", "to_chars.hpp", 927, "e < 1000");
}

{
  __assert_rtn("format_buffer", "to_chars.hpp", 1006, "k > n");
}

void nlohmann::detail::dtoa_impl::compute_boundaries<double>()
{
}

{
  __assert_rtn("compute_boundaries", "to_chars.hpp", 185, "std::isfinite(value)");
}

void nlohmann::detail::dtoa_impl::grisu2()
{
  __assert_rtn("grisu2", "to_chars.hpp", 828, "m_plus.e == v.e");
}

{
  __assert_rtn("grisu2", "to_chars.hpp", 827, "m_plus.e == m_minus.e");
}

void nlohmann::detail::dtoa_impl::get_cached_power_for_binary_exponent()
{
  __assert_rtn("get_cached_power_for_binary_exponent", "to_chars.hpp", 466, "e >= -1500");
}

{
  __assert_rtn("get_cached_power_for_binary_exponent", "to_chars.hpp", 467, "e <= 1500");
}

{
  __assert_rtn("get_cached_power_for_binary_exponent", "to_chars.hpp", 472, "index >= 0");
}

{
  __assert_rtn("get_cached_power_for_binary_exponent", "to_chars.hpp", 476, "kAlpha <= cached.e + e + 64");
}

{
  __assert_rtn("get_cached_power_for_binary_exponent", "to_chars.hpp", 477, "kGamma >= cached.e + e + 64");
}

{
  __assert_rtn("get_cached_power_for_binary_exponent", "to_chars.hpp", 473, "static_cast<std::size_t>(index) < kCachedPowers.size()");
}

void nlohmann::detail::dtoa_impl::grisu2_digit_gen()
{
  __assert_rtn("grisu2_digit_gen", "to_chars.hpp", 601, "M_plus.e >= kAlpha");
}

{
  __assert_rtn("grisu2_digit_gen", "to_chars.hpp", 602, "M_plus.e <= kGamma");
}

{
  __assert_rtn("grisu2_digit_gen", "to_chars.hpp", 623, "p1 > 0");
}

{
  __assert_rtn("grisu2_digit_gen", "to_chars.hpp", 659, "d <= 9");
}

{
  __assert_rtn("grisu2_digit_gen", "to_chars.hpp", 757, "p2 <= (std::numeric_limits<std::uint64_t>::max)() / 10");
}

{
  __assert_rtn("grisu2_digit_gen", "to_chars.hpp", 766, "d <= 9");
}

{
  __assert_rtn("grisu2_digit_gen", "to_chars.hpp", 746, "p2 > delta");
}

void nlohmann::detail::dtoa_impl::grisu2_round()
{
  __assert_rtn("grisu2_round", "to_chars.hpp", 545, "len >= 1");
}

{
  __assert_rtn("grisu2_round", "to_chars.hpp", 546, "dist <= delta");
}

{
  __assert_rtn("grisu2_round", "to_chars.hpp", 547, "rest <= delta");
}

{
  __assert_rtn("grisu2_round", "to_chars.hpp", 548, "ten_k > 0");
}

{
  __assert_rtn("grisu2_round", "to_chars.hpp", 573, "buf[len - 1] != '0'");
}

void std::__function::__func<analytics_send_event_internal(char const*,NSObject  {objcproto13OS_xpc_object}* {ns_returns_retained}({block_pointer})(void),XPCMessagePriority,EventPayloadFormat,NSObject  {objcproto13OS_xpc_object}*)::$_0,std::allocator<EventPayloadFormat>,nlohmann::basic_json<std::map,std::vector,std::basic_string<char,std::char_traits<char>,analytics_send_event_internal(char const*,NSObject  {objcproto13OS_xpc_object}* {ns_returns_retained}({block_pointer})(void),XPCMessagePriority,EventPayloadFormat,NSObject  {objcproto13OS_xpc_object}*)::$_0<char>>,BOOL,long long,unsigned long long,double,analytics_send_event_internal(char const*,NSObject  {objcproto13OS_xpc_object}* {ns_returns_retained}({block_pointer})(void),XPCMessagePriority,EventPayloadFormat,NSObject  {objcproto13OS_xpc_object}*)::$_0,std::allocator<EventPayloadFormat>::adl_serializer,std::map<unsigned char,analytics_send_event_internal(char const*,NSObject  {objcproto13OS_xpc_object}* {ns_returns_retained}({block_pointer})(void),XPCMessagePriority,EventPayloadFormat,NSObject  {objcproto13OS_xpc_object}*)::$_0<unsigned char>>> ()(void)>::operator()(uint64_t **a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = **a1;
  int v3 = 136315138;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1A7C3B000, a2, OS_LOG_TYPE_ERROR, "Error: event \"%s\" dropped because the payload is neither a dictionary nor null", (uint8_t *)&v3, 0xCu);
}

void nlohmann::detail::iteration_proxy_value<nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>>::key()
{
  __assert_rtn("key", "iteration_proxy.hpp", 75, "anchor.m_object != nullptr");
}

void nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>::operator==()
{
  __assert_rtn("operator==", "iter_impl.hpp", 405, "m_object != nullptr");
}

void nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>::operator++()
{
  __assert_rtn("operator++", "iter_impl.hpp", 324, "m_object != nullptr");
}

void nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>::key()
{
  __assert_rtn("key", "iter_impl.hpp", 612, "m_object != nullptr");
}

void nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> const>::operator*()
{
  __assert_rtn("operator*", "iter_impl.hpp", 242, "m_object != nullptr");
}

{
  __assert_rtn("operator*", "iter_impl.hpp", 248, "m_it.object_iterator != m_object->m_value.object->end()");
}

{
  __assert_rtn("operator*", "iter_impl.hpp", 254, "m_it.array_iterator != m_object->m_value.array->end()");
}

void FrameworkConfiguration::init(os_log_t log)
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1A7C3B000, log, OS_LOG_TYPE_ERROR, "[FrameworkConfiguration] Received configuration update from daemon but was not usable (not deserializable)", v1, 2u);
}

{
  _DWORD v1[2];
  uint64_t v2;

  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 67109120;
  v1[1] = -258926936;
  _os_log_fault_impl(&dword_1A7C3B000, log, OS_LOG_TYPE_FAULT, "[FrameworkConfiguration] Received configuration update from daemon but was not usable (invalid version) %u", (uint8_t *)v1, 8u);
}

void FrameworkConfiguration::init(int a1, uint64_t a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 67109376;
  v3[1] = a1;
  __int16 v4 = 2048;
  uint64_t v5 = a2;
  _os_log_fault_impl(&dword_1A7C3B000, log, OS_LOG_TYPE_FAULT, "[FrameworkConfiguration] Received configuration update from daemon but was not usable (fw end offset [%u] > mmap size [%zu])", (uint8_t *)v3, 0x12u);
}

void FrameworkConfiguration::init(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl(&dword_1A7C3B000, a2, OS_LOG_TYPE_FAULT, "[FrameworkConfiguration] Received configuration update from daemon but was not usable (invalid magic number) %u", (uint8_t *)v2, 8u);
}

void FrameworkConfiguration::getExternalConfiguration(os_log_t log)
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1A7C3B000, log, OS_LOG_TYPE_DEBUG, "[FrameworkConfiguration] External configs: null", v1, 2u);
}

void FrameworkConfiguration::getExternalConfiguration(void *a1, uint64_t a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a2 - *a1;
  int v4 = 134217984;
  uint64_t v5 = v3;
  _os_log_debug_impl(&dword_1A7C3B000, log, OS_LOG_TYPE_DEBUG, "[FrameworkConfiguration] External configs: present but not parsed (size=%zd)", (uint8_t *)&v4, 0xCu);
}

void nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan_literal()
{
  __assert_rtn("scan_literal", "lexer.hpp", 1222, "char_traits<char_type>::to_char_type(current) == literal_text[0]");
}

void nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan_string()
{
  __assert_rtn("scan_string", "lexer.hpp", 370, "0x00 <= codepoint and codepoint <= 0x10FFFF");
}

{
  __assert_rtn("scan_string", "lexer.hpp", 250, "current == '\\\"'");
}

void nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::scan_number()
{
}

{
  __assert_rtn("scan_number", "lexer.hpp", 1208, "endptr == token_buffer.data() + token_buffer.size()");
}

{
  __assert_rtn("scan_number", "lexer.hpp", 1175, "endptr == token_buffer.data() + token_buffer.size()");
}

{
  __assert_rtn("scan_number", "lexer.hpp", 1191, "endptr == token_buffer.data() + token_buffer.size()");
}

void nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::unget()
{
}

void nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::get_codepoint()
{
  __assert_rtn("get_codepoint", "lexer.hpp", 188, "0x0000 <= codepoint and codepoint <= 0xFFFF");
}

{
  __assert_rtn("get_codepoint", "lexer.hpp", 162, "current == 'u'");
}

void nlohmann::detail::lexer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,nlohmann::detail::iterator_input_adapter<char const*>>::next_byte_in_range()
{
  __assert_rtn("next_byte_in_range", "lexer.hpp", 209, "ranges.size() == 2 or ranges.size() == 4 or ranges.size() == 6");
}

void nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::parse_error()
{
}

void nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::parse_error()
{
}

void nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::end_object()
{
}

{
  __assert_rtn("end_object", "json_sax.hpp", 451, "not keep_stack.empty()");
}

void nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::end_array()
{
}

{
  __assert_rtn("end_array", "json_sax.hpp", 503, "not keep_stack.empty()");
}

void nlohmann::detail::json_sax_dom_callback_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<nlohmann::detail::value_t>()
{
}

void nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::operator->()
{
  __assert_rtn("operator->", "iter_impl.hpp", 279, "m_object != nullptr");
}

{
  __assert_rtn("operator->", "iter_impl.hpp", 285, "m_it.object_iterator != m_object->m_value.object->end()");
}

{
  __assert_rtn("operator->", "iter_impl.hpp", 291, "m_it.array_iterator != m_object->m_value.array->end()");
}

void nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::handle_value<nlohmann::detail::value_t>()
{
}

{
  __assert_rtn("handle_value", "json_sax.hpp", 321, "object_element");
}

void analytics_rollover_with_options_cold_1()
{
  OUTLINED_FUNCTION_0_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1A7C3B000, v0, v1, "Rollover failed with error: %s", v2, v3, v4, v5, v6);
}

void AnalyticsRolloverWithOptions_cold_1(void *a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)long long buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1A7C3B000, log, OS_LOG_TYPE_ERROR, "Error: Failed to perform rollover due to %{public}@ (%{public}@)", buf, 0x16u);
}

void analytics_disable_all_transform_sampling_cold_1()
{
  OUTLINED_FUNCTION_0_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1A7C3B000, v0, v1, "Failed to disable sampling with error: %s", v2, v3, v4, v5, v6);
}

void analytics_reenable_all_transform_sampling_cold_1()
{
  OUTLINED_FUNCTION_0_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1A7C3B000, v0, v1, "Failed to reenable sampling with error: %s", v2, v3, v4, v5, v6);
}

void analytics_notify_tasking_available_cold_1()
{
  OUTLINED_FUNCTION_0_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1A7C3B000, v0, v1, "Failed to reconfigure new tasking with error: %s", v2, v3, v4, v5, v6);
}

void CASPIEnter()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  uint64_t v1 = "Usage of CoreAnalytics is explicitly forbidden on the child side of fork. You must use exec.";
  _os_log_error_impl(&dword_1A7C3B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}s", (uint8_t *)&v0, 0xCu);
}

void CoreAnalytics::Client::initConnection(int a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 67109378;
  v3[1] = a1;
  __int16 v4 = 2080;
  uint64_t v5 = xpc_strerror();
  _os_log_error_impl(&dword_1A7C3B000, a2, OS_LOG_TYPE_ERROR, "xpc_user_sessions_get_foreground_uid() failed with error %d - %s", (uint8_t *)v3, 0x12u);
}

void CoreAnalytics::Client::sendCheckinMessage_sync(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = *(unsigned __int8 *)(a1 + 60);
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl(&dword_1A7C3B000, a2, OS_LOG_TYPE_DEBUG, "Checkin. Running=%d", (uint8_t *)v3, 8u);
}

void CoreAnalytics::Client::retryXpcMessageHelper_sync()
{
  OUTLINED_FUNCTION_4();
  if (v6 != v7) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = v1;
  }
  *(_DWORD *)uint64_t v2 = 136315138;
  *(void *)(v2 + 4) = v8;
  _os_log_error_impl(&dword_1A7C3B000, v3, OS_LOG_TYPE_ERROR, "Used all retries. Discarding message: %s.", v4, 0xCu);
  if (*(char *)(v0 + 23) < 0) {
    operator delete(*(void **)v0);
  }
}

void ___ZN13CoreAnalytics6Client26retryXpcMessageHelper_syncEN10applesauce3xpc4dictE18XPCMessagePrioritybhy_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0(&dword_1A7C3B000, v0, v1, "XPC message reply connection interrupted (daemon probably exited)", v2, v3, v4, v5, v6);
}

void CoreAnalytics::Client::handleServerMessage_sync()
{
  OUTLINED_FUNCTION_4();
  if (v6 != v7) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = v1;
  }
  *(_DWORD *)uint64_t v2 = 136315138;
  *(void *)(v2 + 4) = v8;
  _os_log_fault_impl(&dword_1A7C3B000, v3, OS_LOG_TYPE_FAULT, "#Error: Received unknown event from daemon: %s", v4, 0xCu);
  if (*(char *)(v0 + 23) < 0) {
    operator delete(*(void **)v0);
  }
}

void CoreAnalytics::Client::handleConfigurationChange_sync()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0(&dword_1A7C3B000, v0, v1, "#Error: Received configuration update from daemon but no config.", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0(&dword_1A7C3B000, v0, v1, "#Error: Received configuration update from daemon but no config size specified.", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0(&dword_1A7C3B000, v0, v1, "#Error: Received configuration update from daemon but was not usable.", v2, v3, v4, v5, v6);
}

void CoreAnalytics::Client::handleSinkMessageEmit_sync()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0(&dword_1A7C3B000, v0, v1, "#Error: Received message emit from daemon but no message.", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0(&dword_1A7C3B000, v0, v1, "#Error: Received message emit from daemon but was not parsable.", v2, v3, v4, v5, v6);
}

void CoreAnalytics::Client::handleSinkMessageEmit_sync(void *a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a3 = 0;
  *(void *)(a3 + 8) = 0;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a3);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a3);
  __cxa_end_catch();
}

void ___ZZN13CoreAnalytics6Client30sendExitBarrierWithTimeoutSyncEjENK3__0clEv_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_1A7C3B000, v0, OS_LOG_TYPE_DEBUG, "Sending exit barrier", v1, 2u);
}

void ___ZZN13CoreAnalytics6Client30sendExitBarrierWithTimeoutSyncEjENK3__0clEv_block_invoke_285_cold_1()
{
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_1A7C3B000, v0, OS_LOG_TYPE_DEBUG, "Running exit barrier block", v1, 2u);
}

void ___ZN10applesauce8dispatch2v19sync_implIZN13CoreAnalytics6Client30sendExitBarrierWithTimeoutSyncEjE3__1EEvP16dispatch_queue_sOT_NSt3__117integral_constantIbLb1EEE_block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = *(_DWORD *)(a1 + 72);
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_fault_impl(&dword_1A7C3B000, a2, OS_LOG_TYPE_FAULT, "Timed out waiting for the exit barrier block. activeSendTransactions=%d", (uint8_t *)v3, 8u);
}

void try_xpc_to_json(void *a1, uint64_t a2)
{
  __cxa_begin_catch(a1);
  *(unsigned char *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a2);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a2);

  __cxa_end_catch();
}

uint64_t sub_1A7C626F0()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1A7C62700()
{
  return MEMORY[0x1F4188680]();
}

uint64_t sub_1A7C62710()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1A7C62720()
{
  return MEMORY[0x1F4187A68]();
}

uint64_t sub_1A7C62730()
{
  return MEMORY[0x1F4187AB8]();
}

uint64_t sub_1A7C62740()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1A7C62750()
{
  return MEMORY[0x1F4183880]();
}

uint64_t sub_1A7C62760()
{
  return MEMORY[0x1F41838B8]();
}

uint64_t sub_1A7C62770()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1A7C62780()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1A7C62790()
{
  return MEMORY[0x1F40E6448]();
}

uint64_t sub_1A7C627A0()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1A7C627B0()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1A7C627C0()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_1A7C627D0()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1A7C627E0()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1A7C627F0()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1A7C62800()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_1A7C62810()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1A7C62820()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1A7C62830()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1A7C62840()
{
  return MEMORY[0x1F4185EF8]();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1F40D7420]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t applesauce::xpc::dyn_cast_or_default()
{
  return MEMORY[0x1F410AB48]();
}

{
  return MEMORY[0x1F410AB50]();
}

{
  return MEMORY[0x1F410AB68]();
}

uint64_t applesauce::xpc::object::to_string(applesauce::xpc::object *this)
{
  return MEMORY[0x1F410AB70](this);
}

const char *__cdecl std::runtime_error::what(const std::runtime_error *this)
{
  return (const char *)MEMORY[0x1F417E350](this);
}

int std::string::compare(const std::string *this, const std::string::value_type *__s)
{
  return MEMORY[0x1F417E390](this, __s);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1F417E448](this, a2);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const std::string *a2)
{
  return (std::logic_error *)MEMORY[0x1F417E450](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x1F417E4B8](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const std::runtime_error *a2)
{
  return (std::runtime_error *)MEMORY[0x1F417E4C8](this, a2);
}

void std::runtime_error::~runtime_error(std::runtime_error *this)
{
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1F417E530](this);
}

std::__sp_mut *__cdecl std::__get_sp_mut(const void *a1)
{
  return (std::__sp_mut *)MEMORY[0x1F417E580](a1);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x1F417E5B8](this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1F417E5C0](this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x1F417E600](this, __pos, __s);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
}

void std::string::reserve(std::string *this, std::string::size_type __requested_capacity)
{
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x1F417E670](this, __str);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

std::__shared_weak_count *__cdecl std::__shared_weak_count::lock(std::__shared_weak_count *this)
{
  return (std::__shared_weak_count *)MEMORY[0x1F417EA90](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

std::chrono::system_clock::time_point std::chrono::system_clock::now(void)
{
  return (std::chrono::system_clock::time_point)MEMORY[0x1F417ECA0]();
}

void std::__sp_mut::lock(std::__sp_mut *this)
{
}

void std::__sp_mut::unlock(std::__sp_mut *this)
{
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x1F417EE70](retstr, *(void *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unint64_t __val)
{
  return (std::string *)MEMORY[0x1F417EE88](retstr, __val);
}

uint64_t std::operator+<char>()
{
  return MEMORY[0x1F417EEA0]();
}

void std::exception::~exception(std::exception *this)
{
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1F417EF30](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1F417EF48](a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x1F417EF80](a1);
}

void __cxa_guard_release(__guard *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

uint64_t _dispatch_is_fork_of_multithreaded_parent()
{
  return MEMORY[0x1F40C9D68]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t abort_with_reason()
{
  return MEMORY[0x1F40CA1F8]();
}

int atexit(void (*a1)(void))
{
  return MEMORY[0x1F40CA488](a1);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1F40CB9C8](flags, *(void *)&qos_class, *(void *)&relative_priority, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBAC0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1F40CBDB8](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

void free(void *a1)
{
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1F40CC4C0]();
}

lconv *localeconv(void)
{
  return (lconv *)MEMORY[0x1F40CC858]();
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1F40CCCE8](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD20](__b, *(void *)&__c, __len);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1F40CCE88](a1, a2);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1F40CD040](*(void *)&token, state64);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

void os_release(void *object)
{
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1F40CD5A0]();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1F40CE080](__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

double strtod(const char *a1, char **a2)
{
  MEMORY[0x1F40CE260](a1, a2);
  return result;
}

uint64_t strtoll(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2C0](__str, __endptr, *(void *)&__base);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2F0](__str, __endptr, *(void *)&__base);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1F4186410]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1F4186430]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1F4186448]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1F41866A8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
}

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1F41867A0]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x1F41867E8]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x1F41867F8]();
}

void uuid_unparse_lower(const uuid_t uu, uuid_string_t out)
{
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEA30](objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1F40CEA58](xarray);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x1F40CEAA8](xarray, index);
}

xpc_object_t xpc_BOOL_create(BOOL value)
{
  return (xpc_object_t)MEMORY[0x1F40CEB10](value);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x1F40CEB18](xBOOL);
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1F40CEBD0](name, targetq, flags);
}

void xpc_connection_send_barrier(xpc_connection_t connection, dispatch_block_t barrier)
{
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1F40CEC68](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

uint64_t xpc_connection_set_target_user_session_uid()
{
  return MEMORY[0x1F40CECF0]();
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x1F40CED28](object);
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x1F40CED90](bytes, length);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x1F40CEDB0](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x1F40CEDC0](xdata);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x1F40CEE08](xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEE20](keys, values, count);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x1F40CEE30]();
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1F40CEEF0](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1F40CEF10](xdict, key);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_object_t xpc_double_create(double value)
{
  return (xpc_object_t)MEMORY[0x1F40CEFE8](value);
}

double xpc_double_get_value(xpc_object_t xdouble)
{
  MEMORY[0x1F40CEFF8](xdouble);
  return result;
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1F40CF148](object);
}

xpc_object_t xpc_int64_create(int64_t value)
{
  return (xpc_object_t)MEMORY[0x1F40CF188](value);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x1F40CF190](xint);
}

uint64_t xpc_is_system_session()
{
  return MEMORY[0x1F40CF1A8]();
}

xpc_object_t xpc_null_create(void)
{
  return (xpc_object_t)MEMORY[0x1F40CF208]();
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x1F40CF248](object);
}

size_t xpc_shmem_map(xpc_object_t xshmem, void **region)
{
  return MEMORY[0x1F40CF278](xshmem, region);
}

uint64_t xpc_strerror()
{
  return MEMORY[0x1F40CF288]();
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x1F40CF290](string);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x1F40CF2C8](xstring);
}

const char *__cdecl xpc_type_get_name(xpc_type_t type)
{
  return (const char *)MEMORY[0x1F40CF310](type);
}

xpc_object_t xpc_uint64_create(uint64_t value)
{
  return (xpc_object_t)MEMORY[0x1F40CF320](value);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x1F40CF330](xuint);
}

uint64_t xpc_user_sessions_enabled()
{
  return MEMORY[0x1F40CF340]();
}

uint64_t xpc_user_sessions_get_foreground_uid()
{
  return MEMORY[0x1F40CF348]();
}

const uint8_t *__cdecl xpc_uuid_get_bytes(xpc_object_t xuuid)
{
  return (const uint8_t *)MEMORY[0x1F40CF368](xuuid);
}