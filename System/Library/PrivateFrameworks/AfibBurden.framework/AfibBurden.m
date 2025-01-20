id ab_get_framework_log()
{
  void *v0;
  uint64_t vars8;

  if (ab_get_framework_log_onceToken != -1) {
    dispatch_once(&ab_get_framework_log_onceToken, &__block_literal_global);
  }
  v0 = (void *)ab_get_framework_log_log;
  return v0;
}

uint64_t __ab_get_framework_log_block_invoke()
{
  ab_get_framework_log_log = (uint64_t)os_log_create("com.apple.Health.AFibBurden", "hid-framework");
  return MEMORY[0x270F9A758]();
}

void sub_2477D0FFC(_Unwind_Exception *a1)
{
  uint64_t v3 = v2;
  MEMORY[0x24C55DD50](v3, 0x1020C40C76FD9F3);

  _Unwind_Resume(a1);
}

void sub_2477D1434(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,void *__p,uint64_t a28)
{
  if (__p)
  {
    a28 = (uint64_t)__p;
    operator delete(__p);
  }
  _Block_object_dispose(&a15, 8);
  if (a21)
  {
    a22 = (uint64_t)a21;
    operator delete(a21);
  }
  _Block_object_dispose((const void *)(v31 - 152), 8);
  std::vector<std::vector<double>>::__destroy_vector::operator()[abi:ne180100]((void ***)&a15);
  *(void *)(v31 - 152) = &a24;
  std::vector<Tellurium::tellurium_input_t>::__destroy_vector::operator()[abi:ne180100]((void ***)(v31 - 152));

  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = 0;
  *(void *)(a1 + 64) = 0;
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a2 + 48) = 0;
  *(void *)(a2 + 56) = 0;
  *(void *)(a2 + 64) = 0;
  __n128 result = *(__n128 *)(a2 + 72);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(__n128 *)(a1 + 72) = result;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
  v1 = (void **)(a1 + 48);
  std::vector<std::vector<double>>::__destroy_vector::operator()[abi:ne180100](&v1);
}

__n128 __Block_byref_object_copy__302(__n128 *a1, __n128 *a2)
{
  a1[3].n128_u64[0] = 0;
  a1[3].n128_u64[1] = 0;
  a1[4].n128_u64[0] = 0;
  __n128 result = a2[3];
  a1[3] = result;
  a1[4].n128_u64[0] = a2[4].n128_u64[0];
  a2[3].n128_u64[0] = 0;
  a2[3].n128_u64[1] = 0;
  a2[4].n128_u64[0] = 0;
  return result;
}

void __Block_byref_object_dispose__303(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 48);
  if (v2)
  {
    *(void *)(a1 + 56) = v2;
    operator delete(v2);
  }
}

void sub_2477D1BC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t *a19, uint64_t a20,uint64_t *a21,uint64_t a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28,void *a29,uint64_t a30,int a31,__int16 a32,char a33,char a34,uint64_t a35,uint64_t a36,uint64_t a37,void *a38,uint64_t a39,int a40,__int16 a41,char a42,char a43)
{
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::~basic_json(&a19);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::~basic_json(&a21);
  std::ofstream::~ofstream(&a38);
  if (a28 < 0) {
    operator delete(__p);
  }
  if (a34 < 0) {
    operator delete(a29);
  }

  _Unwind_Resume(a1);
}

uint64_t *std::ofstream::basic_ofstream(uint64_t *a1)
{
  uint64_t v2 = MEMORY[0x263F8C310] + 64;
  a1[52] = MEMORY[0x263F8C310] + 64;
  uint64_t v3 = a1 + 1;
  uint64_t v4 = *(void *)(MEMORY[0x263F8C2B0] + 16);
  uint64_t v5 = *(void *)(MEMORY[0x263F8C2B0] + 8);
  *a1 = v5;
  *(uint64_t *)((char *)a1 + *(void *)(v5 - 24)) = v4;
  v6 = (std::ios_base *)((char *)a1 + *(void *)(*a1 - 24));
  std::ios_base::init(v6, a1 + 1);
  uint64_t v7 = MEMORY[0x263F8C310] + 24;
  v6[1].__vftable = 0;
  v6[1].__fmtflags_ = -1;
  *a1 = v7;
  a1[52] = v2;
  MEMORY[0x24C55DBF0](v3);
  if (!std::filebuf::open()) {
    std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | 4);
  }
  return a1;
}

void sub_2477D1E80(_Unwind_Exception *a1)
{
  std::ostream::~ostream();
  MEMORY[0x24C55DCC0](v1);
  _Unwind_Resume(a1);
}

uint64_t nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace_back<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)a1)
  {
    if (*(unsigned char *)a1 != 2)
    {
      exception = (nlohmann::detail::exception *)__cxa_allocate_exception(0x20uLL);
      v10 = (char *)nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::type_name((char *)a1);
      std::string::basic_string[abi:ne180100]<0>(&v13, v10);
      v11 = std::string::insert(&v13, 0, "cannot use emplace_back() with ");
      long long v12 = *(_OWORD *)&v11->__r_.__value_.__l.__data_;
      std::string::size_type v15 = v11->__r_.__value_.__r.__words[2];
      long long v14 = v12;
      v11->__r_.__value_.__l.__size_ = 0;
      v11->__r_.__value_.__r.__words[2] = 0;
      v11->__r_.__value_.__r.__words[0] = 0;
      nlohmann::detail::type_error::create(311, (uint64_t)&v14, exception);
    }
  }
  else
  {
    *(unsigned char *)a1 = 2;
    uint64_t v4 = operator new(0x18uLL);
    v4[1] = 0;
    v4[2] = 0;
    *uint64_t v4 = 0;
    *(void *)(a1 + 8) = v4;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a1);
  }
  uint64_t v5 = *(uint64_t **)(a1 + 8);
  unint64_t v6 = v5[1];
  if (v6 >= v5[2])
  {
    uint64_t v7 = std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__emplace_back_slow_path<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>(v5, a2);
  }
  else
  {
    *(unsigned char *)unint64_t v6 = *(unsigned char *)a2;
    *(void *)(v6 + 8) = *(void *)(a2 + 8);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a2);
    *(unsigned char *)a2 = 0;
    *(void *)(a2 + 8) = 0;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v6);
    uint64_t v7 = v6 + 16;
  }
  v5[1] = v7;
  return v7 - 16;
}

void sub_2477D2000(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
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

uint64_t **nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::~basic_json(uint64_t **a1)
{
  return a1;
}

double nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[5],char const*>@<D0>(uint64_t a1@<X0>, char *a2@<X1>, char **a3@<X2>, uint64_t a4@<X8>)
{
  if (*(unsigned char *)a1)
  {
    if (*(unsigned char *)a1 != 1)
    {
      exception = (nlohmann::detail::exception *)__cxa_allocate_exception(0x20uLL);
      long long v14 = (char *)nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::type_name((char *)a1);
      std::string::basic_string[abi:ne180100]<0>(&v18, v14);
      std::string::size_type v15 = std::string::insert(&v18, 0, "cannot use emplace() with ");
      long long v16 = *(_OWORD *)&v15->__r_.__value_.__l.__data_;
      v17[2] = *((void *)&v15->__r_.__value_.__l + 2);
      *(_OWORD *)v17 = v16;
      v15->__r_.__value_.__l.__size_ = 0;
      v15->__r_.__value_.__r.__words[2] = 0;
      v15->__r_.__value_.__r.__words[0] = 0;
      nlohmann::detail::type_error::create(311, (uint64_t)v17, exception);
    }
  }
  else
  {
    *(unsigned char *)a1 = 1;
    v8 = operator new(0x18uLL);
    v8[2] = 0;
    v8[1] = 0;
    void *v8 = v8 + 1;
    *(void *)(a1 + 8) = v8;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a1);
  }
  v9 = std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__emplace_unique_impl<char const(&)[5],char const*>(*(uint64_t ***)(a1 + 8), a2, a3);
  char v11 = v10;
  nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::iter_impl(v17, a1);
  nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::set_begin((unsigned __int8 **)v17);
  v17[1] = v9;
  *(void *)a4 = v17[0];
  *(_OWORD *)(a4 + 24) = *(_OWORD *)&v17[3];
  double result = *(double *)&v17[1];
  *(_OWORD *)(a4 + 8) = *(_OWORD *)&v17[1];
  *(unsigned char *)(a4 + 40) = v11;
  return result;
}

void sub_2477D21E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a22 < 0)
  {
    operator delete(a17);
    if ((v23 & 1) == 0) {
LABEL_8:
    }
      _Unwind_Resume(a1);
  }
  else if (!v23)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v22);
  goto LABEL_8;
}

double nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[10],double>@<D0>(uint64_t a1@<X0>, char *a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  if (*(unsigned char *)a1)
  {
    if (*(unsigned char *)a1 != 1)
    {
      exception = (nlohmann::detail::exception *)__cxa_allocate_exception(0x20uLL);
      long long v14 = (char *)nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::type_name((char *)a1);
      std::string::basic_string[abi:ne180100]<0>(&v18, v14);
      std::string::size_type v15 = std::string::insert(&v18, 0, "cannot use emplace() with ");
      long long v16 = *(_OWORD *)&v15->__r_.__value_.__l.__data_;
      v17[2] = *((void *)&v15->__r_.__value_.__l + 2);
      *(_OWORD *)v17 = v16;
      v15->__r_.__value_.__l.__size_ = 0;
      v15->__r_.__value_.__r.__words[2] = 0;
      v15->__r_.__value_.__r.__words[0] = 0;
      nlohmann::detail::type_error::create(311, (uint64_t)v17, exception);
    }
  }
  else
  {
    *(unsigned char *)a1 = 1;
    v8 = operator new(0x18uLL);
    v8[2] = 0;
    v8[1] = 0;
    void *v8 = v8 + 1;
    *(void *)(a1 + 8) = v8;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a1);
  }
  v9 = std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__emplace_unique_impl<char const(&)[10],double>(*(uint64_t ***)(a1 + 8), a2, a3);
  char v11 = v10;
  nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::iter_impl(v17, a1);
  nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::set_begin((unsigned __int8 **)v17);
  v17[1] = v9;
  *(void *)a4 = v17[0];
  *(_OWORD *)(a4 + 24) = *(_OWORD *)&v17[3];
  double result = *(double *)&v17[1];
  *(_OWORD *)(a4 + 8) = *(_OWORD *)&v17[1];
  *(unsigned char *)(a4 + 40) = v11;
  return result;
}

void sub_2477D2394(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a22 < 0)
  {
    operator delete(a17);
    if ((v23 & 1) == 0) {
LABEL_8:
    }
      _Unwind_Resume(a1);
  }
  else if (!v23)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v22);
  goto LABEL_8;
}

double nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[13],BOOL>@<D0>(uint64_t a1@<X0>, char *a2@<X1>, unsigned __int8 *a3@<X2>, uint64_t a4@<X8>)
{
  if (*(unsigned char *)a1)
  {
    if (*(unsigned char *)a1 != 1)
    {
      exception = (nlohmann::detail::exception *)__cxa_allocate_exception(0x20uLL);
      long long v14 = (char *)nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::type_name((char *)a1);
      std::string::basic_string[abi:ne180100]<0>(&v18, v14);
      std::string::size_type v15 = std::string::insert(&v18, 0, "cannot use emplace() with ");
      long long v16 = *(_OWORD *)&v15->__r_.__value_.__l.__data_;
      v17[2] = *((void *)&v15->__r_.__value_.__l + 2);
      *(_OWORD *)v17 = v16;
      v15->__r_.__value_.__l.__size_ = 0;
      v15->__r_.__value_.__r.__words[2] = 0;
      v15->__r_.__value_.__r.__words[0] = 0;
      nlohmann::detail::type_error::create(311, (uint64_t)v17, exception);
    }
  }
  else
  {
    *(unsigned char *)a1 = 1;
    v8 = operator new(0x18uLL);
    v8[2] = 0;
    v8[1] = 0;
    void *v8 = v8 + 1;
    *(void *)(a1 + 8) = v8;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a1);
  }
  v9 = std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__emplace_unique_impl<char const(&)[13],BOOL>(*(uint64_t ***)(a1 + 8), a2, a3);
  char v11 = v10;
  nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::iter_impl(v17, a1);
  nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::set_begin((unsigned __int8 **)v17);
  v17[1] = v9;
  *(void *)a4 = v17[0];
  *(_OWORD *)(a4 + 24) = *(_OWORD *)&v17[3];
  double result = *(double *)&v17[1];
  *(_OWORD *)(a4 + 8) = *(_OWORD *)&v17[1];
  *(unsigned char *)(a4 + 40) = v11;
  return result;
}

void sub_2477D2544(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a22 < 0)
  {
    operator delete(a17);
    if ((v23 & 1) == 0) {
LABEL_8:
    }
      _Unwind_Resume(a1);
  }
  else if (!v23)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v22);
  goto LABEL_8;
}

double nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[15],nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>@<D0>(uint64_t a1@<X0>, char *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  if (*(unsigned char *)a1)
  {
    if (*(unsigned char *)a1 != 1)
    {
      exception = (nlohmann::detail::exception *)__cxa_allocate_exception(0x20uLL);
      long long v14 = (char *)nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::type_name((char *)a1);
      std::string::basic_string[abi:ne180100]<0>(&v18, v14);
      std::string::size_type v15 = std::string::insert(&v18, 0, "cannot use emplace() with ");
      long long v16 = *(_OWORD *)&v15->__r_.__value_.__l.__data_;
      v17[2] = *((void *)&v15->__r_.__value_.__l + 2);
      *(_OWORD *)v17 = v16;
      v15->__r_.__value_.__l.__size_ = 0;
      v15->__r_.__value_.__r.__words[2] = 0;
      v15->__r_.__value_.__r.__words[0] = 0;
      nlohmann::detail::type_error::create(311, (uint64_t)v17, exception);
    }
  }
  else
  {
    *(unsigned char *)a1 = 1;
    v8 = operator new(0x18uLL);
    v8[2] = 0;
    v8[1] = 0;
    void *v8 = v8 + 1;
    *(void *)(a1 + 8) = v8;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a1);
  }
  v9 = std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__emplace_unique_impl<char const(&)[15],nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>(*(uint64_t ***)(a1 + 8), a2, a3);
  char v11 = v10;
  nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::iter_impl(v17, a1);
  nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::set_begin((unsigned __int8 **)v17);
  v17[1] = v9;
  *(void *)a4 = v17[0];
  *(_OWORD *)(a4 + 24) = *(_OWORD *)&v17[3];
  double result = *(double *)&v17[1];
  *(_OWORD *)(a4 + 8) = *(_OWORD *)&v17[1];
  *(unsigned char *)(a4 + 40) = v11;
  return result;
}

void sub_2477D26F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a22 < 0)
  {
    operator delete(a17);
    if ((v23 & 1) == 0) {
LABEL_8:
    }
      _Unwind_Resume(a1);
  }
  else if (!v23)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v22);
  goto LABEL_8;
}

uint64_t *nlohmann::operator<<(uint64_t *a1, uint64_t a2)
{
  v15[80] = *(void ***)MEMORY[0x263EF8340];
  uint64_t v4 = *a1;
  uint64_t v5 = (char *)a1 + *(void *)(*a1 - 24);
  uint64_t v6 = *((void *)v5 + 3);
  *((void *)v5 + 3) = 0;
  uint64_t v7 = (std::__shared_weak_count *)operator new(0x28uLL);
  v7->__shared_owners_ = 0;
  v7->__vftable = (std::__shared_weak_count_vtbl *)&unk_26FBC2450;
  v7->__shared_weak_owners_ = 0;
  v7[1].__vftable = (std::__shared_weak_count_vtbl *)&unk_26FBC24A0;
  v7[1].__shared_owners_ = (uint64_t)a1;
  long long v12 = v7 + 1;
  std::string v13 = v7;
  atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  v8 = (const std::ios_base *)((char *)a1 + *(void *)(v4 - 24));
  std::ios_base::fmtflags fmtflags = v8[1].__fmtflags_;
  if (fmtflags == -1)
  {
    std::ios_base::getloc(v8);
    char v10 = std::locale::use_facet(&v14, MEMORY[0x263F8C108]);
    std::ios_base::fmtflags fmtflags = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
    std::locale::~locale(&v14);
    v8[1].__fmtflags_ = fmtflags;
  }
  nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::serializer((uint64_t)v15, (uint64_t)&v12, (char)fmtflags, 0);
  if (v13) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v13);
  }
  std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump(v15, a2, v6 > 0, 0, v6 & ~(v6 >> 63), 0);
  nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::~serializer((uint64_t)v15);
  return a1;
}

void sub_2477D2938(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::locale a11, char a12)
{
  std::locale::~locale(&a11);
  std::__shared_weak_count::__release_shared[abi:ne180100](v12);
  std::__shared_weak_count::__release_shared[abi:ne180100](v12);
  _Unwind_Resume(a1);
}

void *std::ofstream::~ofstream(void *a1)
{
  uint64_t v2 = MEMORY[0x263F8C2B0];
  uint64_t v3 = *MEMORY[0x263F8C2B0];
  *a1 = *MEMORY[0x263F8C2B0];
  *(void *)((char *)a1 + *(void *)(v3 - 24)) = *(void *)(v2 + 24);
  MEMORY[0x24C55DC00](a1 + 1);
  std::ostream::~ostream();
  MEMORY[0x24C55DCC0](a1 + 52);
  return a1;
}

void __clang_call_terminate(void *a1)
{
}

void std::vector<std::vector<double>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    std::vector<std::vector<double>>::__clear[abi:ne180100]((uint64_t *)v2);
    uint64_t v3 = **a1;
    operator delete(v3);
  }
}

void std::vector<std::vector<double>>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  if (v2 != *a1)
  {
    uint64_t v4 = a1[1];
    do
    {
      uint64_t v6 = *(void **)(v4 - 24);
      v4 -= 24;
      uint64_t v5 = v6;
      if (v6)
      {
        *(void *)(v2 - 16) = v5;
        operator delete(v5);
      }
      uint64_t v2 = v4;
    }
    while (v4 != v3);
  }
  a1[1] = v3;
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

void nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(uint64_t **a1, int a2)
{
  uint64_t v24 = 0;
  unint64_t v25 = 0;
  unint64_t v26 = 0;
  int v3 = a2 - 1;
  if (a2 == 1)
  {
    std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::reserve(&v24, (*a1)[2]);
    uint64_t v4 = (uint64_t)(*a1 + 1);
    uint64_t v5 = (void *)**a1;
    if (v5 != (void *)v4)
    {
      unint64_t v6 = v25;
      do
      {
        if (v6 >= v26)
        {
          unint64_t v6 = std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__push_back_slow_path<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>(&v24, (uint64_t)(v5 + 7));
        }
        else
        {
          *(unsigned char *)unint64_t v6 = *((unsigned char *)v5 + 56);
          *(void *)(v6 + 8) = v5[8];
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)(v5 + 7));
          *((unsigned char *)v5 + 56) = 0;
          v5[8] = 0;
          nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v6);
          v6 += 16;
        }
        unint64_t v25 = v6;
        uint64_t v7 = (void *)v5[1];
        if (v7)
        {
          do
          {
            v8 = v7;
            uint64_t v7 = (void *)*v7;
          }
          while (v7);
        }
        else
        {
          do
          {
            v8 = (void *)v5[2];
            BOOL v9 = *v8 == (void)v5;
            uint64_t v5 = v8;
          }
          while (!v9);
        }
        uint64_t v5 = v8;
      }
      while (v8 != (void *)v4);
    }
  }
  else if (a2 == 2)
  {
    std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::reserve(&v24, ((*a1)[1] - **a1) >> 4);
    std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> *,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> *,std::back_insert_iterator<std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>((uint64_t)&v22, **a1, (*a1)[1], &v24);
  }
  for (unint64_t i = v25; v24 != v25; unint64_t i = v25)
  {
    char v12 = *(unsigned char *)(i - 16);
    uint64_t v11 = i - 16;
    LOBYTE(v22) = v12;
    int v23 = *(uint64_t **)(v11 + 8);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v11);
    *(unsigned char *)uint64_t v11 = 0;
    *(void *)(v11 + 8) = 0;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v22);
    std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__base_destruct_at_end[abi:ne180100]((uint64_t)&v24, v25 - 16);
    if (v22 == 1)
    {
      std::string v13 = v23;
      std::locale v14 = v23 + 1;
      std::string::size_type v15 = (void *)*v23;
      if ((uint64_t *)*v23 != v23 + 1)
      {
        unint64_t v16 = v25;
        do
        {
          if (v16 >= v26)
          {
            unint64_t v16 = std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__push_back_slow_path<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>(&v24, (uint64_t)(v15 + 7));
          }
          else
          {
            *(unsigned char *)unint64_t v16 = *((unsigned char *)v15 + 56);
            *(void *)(v16 + 8) = v15[8];
            nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)(v15 + 7));
            *((unsigned char *)v15 + 56) = 0;
            v15[8] = 0;
            nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v16);
            v16 += 16;
          }
          unint64_t v25 = v16;
          v17 = (void *)v15[1];
          if (v17)
          {
            do
            {
              std::string v18 = v17;
              v17 = (void *)*v17;
            }
            while (v17);
          }
          else
          {
            do
            {
              std::string v18 = (void *)v15[2];
              BOOL v9 = *v18 == (void)v15;
              std::string::size_type v15 = v18;
            }
            while (!v9);
          }
          std::string::size_type v15 = v18;
        }
        while (v18 != v14);
        std::string v13 = v23;
      }
      std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::destroy((uint64_t)v13, (char *)v13[1]);
      *std::string v13 = (uint64_t)(v13 + 1);
      v13[2] = 0;
      v13[1] = 0;
    }
    else if (v22 == 2)
    {
      std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> *,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>> *,std::back_insert_iterator<std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>((uint64_t)&v27, *v23, v23[1], &v24);
      std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::clear[abi:ne180100](v23);
    }
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v22);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v23, v22);
  }
  switch(v3)
  {
    case 0:
      std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::destroy((uint64_t)*a1, (char *)(*a1)[1]);
      goto LABEL_41;
    case 1:
      int v22 = (void **)*a1;
      std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__destroy_vector::operator()[abi:ne180100](&v22);
      goto LABEL_41;
    case 2:
      v19 = *a1;
      if ((*((char *)*a1 + 23) & 0x80000000) == 0) {
        goto LABEL_42;
      }
      v20 = (void *)*v19;
      break;
    case 7:
      v19 = *a1;
      v21 = (void *)**a1;
      if (!v21) {
        goto LABEL_42;
      }
      v19[1] = (uint64_t)v21;
      v20 = v21;
      break;
    default:
      goto LABEL_43;
  }
  operator delete(v20);
LABEL_41:
  v19 = *a1;
LABEL_42:
  operator delete(v19);
LABEL_43:
  int v22 = (void **)&v24;
  std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__destroy_vector::operator()[abi:ne180100](&v22);
}

uint64_t std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::reserve(void *a1, unint64_t a2)
{
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

void sub_2477D2FC8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
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

void std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]()
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

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_2652213B8, MEMORY[0x263F8C060]);
}

{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_2652213B8, MEMORY[0x263F8C060]);
}

{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_2652213B8, MEMORY[0x263F8C060]);
}

void sub_2477D3114(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(16 * a2);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::reverse_iterator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>,std::reverse_iterator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>,std::reverse_iterator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v17 = a6;
  *((void *)&v17 + 1) = a7;
  long long v16 = v17;
  v14[0] = a1;
  v14[1] = &v16;
  v14[2] = &v17;
  char v15 = 0;
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
      uint64_t v7 = *((void *)&v17 + 1) - 16;
      *((void *)&v17 + 1) -= 16;
      BOOL v11 = v9 == a5;
      v9 -= 16;
    }
    while (!v11);
    uint64_t v12 = v17;
  }
  char v15 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::reverse_iterator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v14);
  return v12;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::reverse_iterator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::reverse_iterator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>>::operator()[abi:ne180100]((uint64_t *)a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::reverse_iterator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>>::operator()[abi:ne180100](uint64_t *a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v1 = (uint64_t *)a1[2];
  uint64_t v3 = *v1;
  uint64_t v2 = v1[1];
  uint64_t v14 = v3;
  uint64_t v15 = v2;
  uint64_t v16 = v3;
  uint64_t v17 = v2;
  uint64_t v4 = *a1;
  uint64_t v5 = (uint64_t *)a1[1];
  uint64_t v7 = *v5;
  uint64_t v6 = v5[1];
  uint64_t v9 = v7;
  uint64_t v10 = v6;
  uint64_t v11 = v7;
  uint64_t v12 = v6;
  std::__allocator_destroy[abi:ne180100]<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::reverse_iterator<std::reverse_iterator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>>,std::reverse_iterator<std::reverse_iterator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>>>(v4, (uint64_t)v13, (uint64_t)v8);
}

void std::__allocator_destroy[abi:ne180100]<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::reverse_iterator<std::reverse_iterator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>>,std::reverse_iterator<std::reverse_iterator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>>>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  for (unint64_t i = *(uint64_t ***)(a2 + 32); i != *(uint64_t ***)(a3 + 32); *(void *)(a2 + 32) = i)
  {
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)i);
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(i + 1, *(unsigned __int8 *)i);
    unint64_t i = (uint64_t **)(*(void *)(a2 + 32) + 16);
  }
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

uint64_t std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__push_back_slow_path<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>(uint64_t *a1, uint64_t a2)
{
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
  v15[4] = a1 + 2;
  uint64_t v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>(v7, v9);
  uint64_t v11 = (uint64_t)&v10[16 * v4];
  v15[0] = v10;
  v15[1] = v11;
  v15[3] = &v10[16 * v12];
  *(unsigned char *)uint64_t v11 = *(unsigned char *)a2;
  *(void *)(v11 + 8) = *(void *)(a2 + 8);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a2);
  *(unsigned char *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v11);
  v15[2] = v11 + 16;
  std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__swap_out_circular_buffer(a1, v15);
  uint64_t v13 = a1[1];
  std::__split_buffer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::~__split_buffer((uint64_t)v15);
  return v13;
}

void sub_2477D35C0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
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

void std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (char *)**a1;
  if (v2)
  {
    uint64_t v4 = (char *)v1[1];
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

id **std::unique_ptr<Tellurium::tellurium_classifier_t>::reset[abi:ne180100](id ***a1, id **a2)
{
  uint64_t result = *a1;
  *a1 = a2;
  if (result)
  {
    Tellurium::tellurium_classifier_t::~tellurium_classifier_t(result);
    JUMPOUT(0x24C55DD50);
  }
  return result;
}

void Tellurium::tellurium_classifier_t::~tellurium_classifier_t(id **this)
{
  Tellurium::PredictorWrapper_t::~PredictorWrapper_t(this + 8);
  uint64_t v2 = this[2];
  if (v2)
  {
    this[3] = v2;
    operator delete(v2);
  }
}

void std::vector<Tellurium::tellurium_input_t>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (void **)**a1;
  if (v2)
  {
    uint64_t v4 = (void **)v1[1];
    uint64_t v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        v4 -= 6;
        uint64_t v6 = v4;
        std::vector<std::vector<double>>::__destroy_vector::operator()[abi:ne180100](&v6);
      }
      while (v4 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void *std::vector<std::vector<double>>::__construct_one_at_end[abi:ne180100]<std::vector<double> const&>(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a1 + 8);
  *uint64_t v3 = 0;
  v3[1] = 0;
  v3[2] = 0;
  uint64_t result = std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(v3, *(const void **)a2, *(void *)(a2 + 8), (uint64_t)(*(void *)(a2 + 8) - *(void *)a2) >> 3);
  *(void *)(a1 + 8) = v3 + 3;
  return result;
}

void sub_2477D38FC(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t std::vector<std::vector<double>>::__push_back_slow_path<std::vector<double> const&>(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0xAAAAAAAAAAAAAAALL) {
    std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5) {
    unint64_t v5 = 2 * v8;
  }
  if (v8 >= 0x555555555555555) {
    unint64_t v9 = 0xAAAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v9 = v5;
  }
  uint64_t v17 = a1 + 2;
  if (v9) {
    uint64_t v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<double>>>(v7, v9);
  }
  else {
    uint64_t v10 = 0;
  }
  uint64_t v11 = &v10[24 * v4];
  v14[0] = v10;
  v14[1] = v11;
  uint64_t v15 = v11;
  uint64_t v16 = &v10[24 * v9];
  *(void *)uint64_t v11 = 0;
  *((void *)v11 + 1) = 0;
  *((void *)v11 + 2) = 0;
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(v11, *(const void **)a2, *(void *)(a2 + 8), (uint64_t)(*(void *)(a2 + 8) - *(void *)a2) >> 3);
  v15 += 24;
  std::vector<std::vector<double>>::__swap_out_circular_buffer(a1, v14);
  uint64_t v12 = a1[1];
  std::__split_buffer<std::vector<double>>::~__split_buffer((uint64_t)v14);
  return v12;
}

void sub_2477D3A08(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<std::vector<double>>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

void *std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    uint64_t result = std::vector<double>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      uint64_t result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_2477D3A7C(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<double>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
  }
  uint64_t result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

{
  char *result;
  uint64_t v4;

  if (a2 >> 61) {
    std::vector<double>::__throw_length_error[abi:ne180100]();
  }
  uint64_t result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(8 * a2);
}

uint64_t std::vector<std::vector<double>>::__swap_out_circular_buffer(uint64_t *a1, void *a2)
{
  uint64_t result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::vector<double>>,std::reverse_iterator<std::vector<double>*>,std::reverse_iterator<std::vector<double>*>,std::reverse_iterator<std::vector<double>*>>((uint64_t)(a1 + 2), a1[1], (void *)a1[1], *a1, (void *)*a1, a2[1], a2[1]);
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

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<double>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(24 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::vector<double>>,std::reverse_iterator<std::vector<double>*>,std::reverse_iterator<std::vector<double>*>,std::reverse_iterator<std::vector<double>*>>(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v14 = a6;
  *((void *)&v14 + 1) = a7;
  long long v13 = v14;
  v11[0] = a1;
  v11[1] = &v13;
  v11[2] = &v14;
  if (a3 == a5)
  {
    uint64_t v9 = a6;
  }
  else
  {
    do
    {
      *(void *)(v7 - 24) = 0;
      *(void *)(v7 - 16) = 0;
      *(void *)(v7 - 8) = 0;
      long long v8 = *(_OWORD *)(a3 - 3);
      a3 -= 3;
      *(_OWORD *)(v7 - 24) = v8;
      *(void *)(v7 - 8) = a3[2];
      *a3 = 0;
      a3[1] = 0;
      a3[2] = 0;
      uint64_t v7 = *((void *)&v14 + 1) - 24;
      *((void *)&v14 + 1) -= 24;
    }
    while (a3 != a5);
    uint64_t v9 = v14;
  }
  char v12 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<double>>,std::reverse_iterator<std::vector<double>*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v11);
  return v9;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<double>>,std::reverse_iterator<std::vector<double>*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<double>>,std::reverse_iterator<std::vector<double>*>>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<double>>,std::reverse_iterator<std::vector<double>*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 16) + 8);
  uint64_t v2 = *(void *)(*(void *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    uint64_t v3 = *(void **)v1;
    if (*(void *)v1)
    {
      *(void *)(v1 + 8) = v3;
      operator delete(v3);
    }
    v1 += 24;
  }
}

uint64_t std::__split_buffer<std::vector<double>>::~__split_buffer(uint64_t a1)
{
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void std::__split_buffer<std::vector<double>>::__destruct_at_end[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  while (v2 != a2)
  {
    uint64_t v5 = *(void **)(v2 - 24);
    *(void *)(a1 + 16) = v2 - 24;
    if (v5)
    {
      *(void *)(v2 - 16) = v5;
      operator delete(v5);
      uint64_t v2 = *(void *)(a1 + 16);
    }
    else
    {
      v2 -= 24;
    }
  }
}

__n128 std::vector<Tellurium::tellurium_input_t>::__construct_one_at_end[abi:ne180100]<Tellurium::tellurium_input_t const&>(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 8);
  *(void *)uint64_t v4 = 0;
  *(void *)(v4 + 8) = 0;
  *(void *)(v4 + 16) = 0;
  std::vector<std::vector<double>>::__init_with_size[abi:ne180100]<std::vector<double>*,std::vector<double>*>((void *)v4, *(void *)a2, *(void *)(a2 + 8), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a2 + 8) - *(void *)a2) >> 3));
  __n128 result = *(__n128 *)(a2 + 24);
  *(void *)(v4 + 40) = *(void *)(a2 + 40);
  *(__n128 *)(v4 + 24) = result;
  *(void *)(a1 + 8) = v4 + 48;
  return result;
}

void sub_2477D3E00(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t std::vector<Tellurium::tellurium_input_t>::__push_back_slow_path<Tellurium::tellurium_input_t const&>(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 4);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0x555555555555555) {
    std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 4);
  if (2 * v8 > v5) {
    unint64_t v5 = 2 * v8;
  }
  if (v8 >= 0x2AAAAAAAAAAAAAALL) {
    unint64_t v9 = 0x555555555555555;
  }
  else {
    unint64_t v9 = v5;
  }
  v19 = a1 + 2;
  if (v9) {
    uint64_t v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<Tellurium::tellurium_input_t>>(v7, v9);
  }
  else {
    uint64_t v10 = 0;
  }
  uint64_t v11 = &v10[48 * v4];
  v16[0] = v10;
  v16[1] = v11;
  uint64_t v17 = v11;
  uint64_t v18 = &v10[48 * v9];
  *(void *)uint64_t v11 = 0;
  *((void *)v11 + 1) = 0;
  *((void *)v11 + 2) = 0;
  std::vector<std::vector<double>>::__init_with_size[abi:ne180100]<std::vector<double>*,std::vector<double>*>(v11, *(void *)a2, *(void *)(a2 + 8), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a2 + 8) - *(void *)a2) >> 3));
  char v12 = &v10[48 * v4];
  long long v13 = *(_OWORD *)(a2 + 24);
  *((void *)v12 + 5) = *(void *)(a2 + 40);
  *(_OWORD *)(v12 + 24) = v13;
  v17 += 48;
  std::vector<Tellurium::tellurium_input_t>::__swap_out_circular_buffer(a1, v16);
  uint64_t v14 = a1[1];
  std::__split_buffer<Tellurium::tellurium_input_t>::~__split_buffer(v16);
  return v14;
}

void sub_2477D3F30(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<Tellurium::tellurium_input_t>::~__split_buffer((void **)va);
  _Unwind_Resume(a1);
}

void *std::vector<std::vector<double>>::__init_with_size[abi:ne180100]<std::vector<double>*,std::vector<double>*>(void *result, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    std::vector<std::vector<double>>::__vallocate[abi:ne180100](result, a4);
    __n128 result = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::vector<double>>,std::vector<double>*,std::vector<double>*,std::vector<double>*>((uint64_t)(v6 + 2), a2, a3, (void *)v6[1]);
    v6[1] = result;
  }
  return result;
}

void sub_2477D3FAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  *(void *)(v9 + 8) = v10;
  std::vector<std::vector<double>>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

char *std::vector<std::vector<double>>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
  }
  __n128 result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<double>>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[24 * v4];
  return result;
}

void *std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::vector<double>>,std::vector<double>*,std::vector<double>*,std::vector<double>*>(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v4 = a4;
  uint64_t v10 = a4;
  uint64_t v11 = a4;
  v8[0] = a1;
  v8[1] = &v10;
  v8[2] = &v11;
  char v9 = 0;
  if (a2 != a3)
  {
    uint64_t v6 = a2;
    do
    {
      *uint64_t v4 = 0;
      v4[1] = 0;
      v4[2] = 0;
      std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(v4, *(const void **)v6, *(void *)(v6 + 8), (uint64_t)(*(void *)(v6 + 8) - *(void *)v6) >> 3);
      uint64_t v4 = v11 + 3;
      v11 += 3;
      v6 += 24;
    }
    while (v6 != a3);
  }
  char v9 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<double>>,std::vector<double>*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v8);
  return v4;
}

void sub_2477D40C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<double>>,std::vector<double>*>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<double>>,std::vector<double>*>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<double>>,std::vector<double>*>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = **(void **)(a1 + 16);
  uint64_t v2 = **(void **)(a1 + 8);
  if (v1 != v2)
  {
    uint64_t v3 = **(void **)(a1 + 16);
    do
    {
      unint64_t v5 = *(void **)(v3 - 24);
      v3 -= 24;
      uint64_t v4 = v5;
      if (v5)
      {
        *(void *)(v1 - 16) = v4;
        operator delete(v4);
      }
      uint64_t v1 = v3;
    }
    while (v3 != v2);
  }
}

uint64_t std::vector<Tellurium::tellurium_input_t>::__swap_out_circular_buffer(uint64_t *a1, void *a2)
{
  uint64_t result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<Tellurium::tellurium_input_t>,std::reverse_iterator<Tellurium::tellurium_input_t*>,std::reverse_iterator<Tellurium::tellurium_input_t*>,std::reverse_iterator<Tellurium::tellurium_input_t*>>((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
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

void *std::__allocate_at_least[abi:ne180100]<std::allocator<Tellurium::tellurium_input_t>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x555555555555556) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(48 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<Tellurium::tellurium_input_t>,std::reverse_iterator<Tellurium::tellurium_input_t*>,std::reverse_iterator<Tellurium::tellurium_input_t*>,std::reverse_iterator<Tellurium::tellurium_input_t*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v15 = a6;
  *((void *)&v15 + 1) = a7;
  long long v14 = v15;
  v12[0] = a1;
  v12[1] = &v14;
  v12[2] = &v15;
  if (a3 == a5)
  {
    uint64_t v10 = a6;
  }
  else
  {
    do
    {
      *(void *)(v7 - 48) = 0;
      *(void *)(v7 - 40) = 0;
      *(void *)(v7 - 32) = 0;
      long long v8 = *(_OWORD *)(a3 - 48);
      a3 -= 48;
      *(_OWORD *)(v7 - 48) = v8;
      *(void *)(v7 - 32) = *(void *)(a3 + 16);
      *(void *)a3 = 0;
      *(void *)(a3 + 8) = 0;
      *(void *)(a3 + 16) = 0;
      uint64_t v9 = *(void *)(a3 + 40);
      *(_OWORD *)(v7 - 24) = *(_OWORD *)(a3 + 24);
      *(void *)(v7 - 8) = v9;
      uint64_t v7 = *((void *)&v15 + 1) - 48;
      *((void *)&v15 + 1) -= 48;
    }
    while (a3 != a5);
    uint64_t v10 = v15;
  }
  char v13 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<Tellurium::tellurium_input_t>,std::reverse_iterator<Tellurium::tellurium_input_t*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v12);
  return v10;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<Tellurium::tellurium_input_t>,std::reverse_iterator<Tellurium::tellurium_input_t*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<Tellurium::tellurium_input_t>,std::reverse_iterator<Tellurium::tellurium_input_t*>>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<Tellurium::tellurium_input_t>,std::reverse_iterator<Tellurium::tellurium_input_t*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = *(void ***)(*(void *)(a1 + 16) + 8);
  uint64_t v2 = *(void ***)(*(void *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    uint64_t v3 = v1;
    std::vector<std::vector<double>>::__destroy_vector::operator()[abi:ne180100](&v3);
    v1 += 6;
  }
}

void **std::__split_buffer<Tellurium::tellurium_input_t>::~__split_buffer(void **a1)
{
  if (*a1) {
    operator delete(*a1);
  }
  return a1;
}

void std::__split_buffer<Tellurium::tellurium_input_t>::clear[abi:ne180100](uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v2; uint64_t i = *(void *)(a1 + 16))
  {
    uint64_t v4 = (void **)(i - 48);
    *(void *)(a1 + 16) = v4;
    uint64_t v5 = v4;
    std::vector<std::vector<double>>::__destroy_vector::operator()[abi:ne180100](&v5);
  }
}

uint64_t nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json(uint64_t a1, uint64_t a2, uint64_t a3, char a4, int a5)
{
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
  uint64_t v11 = (unsigned char **)(a2 + 16);
  while (1)
  {
    char v12 = *v11;
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
    *uint64_t v16 = v16 + 1;
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

void sub_2477D4570(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
  {
    operator delete(__p);
    if ((v16 & 1) == 0) {
LABEL_6:
    }
      _Unwind_Resume(a1);
  }
  else if (!v16)
  {
    goto LABEL_6;
  }
  __cxa_free_exception(v15);
  goto LABEL_6;
}

void nlohmann::detail::type_error::create(int a1@<W0>, uint64_t a2@<X1>, nlohmann::detail::exception *a3@<X8>)
{
  std::string::basic_string[abi:ne180100]<0>(&__p, "type_error");
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
    uint64_t v11 = v15;
  }
  else {
    uint64_t v11 = (void **)v15[0];
  }
  nlohmann::detail::exception::exception(a3, a1, (const char *)v11);
  *(void *)a3 = &unk_26FBC2400;
  if (SHIBYTE(v16) < 0) {
    operator delete(v15[0]);
  }
}

void sub_2477D46A4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  if (a26 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void nlohmann::detail::type_error::~type_error(std::exception *this)
{
  this->__vftable = (std::exception_vtbl *)&unk_26FBC2428;
  MEMORY[0x24C55DB80](&this[2]);
  std::exception::~exception(this);
}

{
  uint64_t vars8;

  this->__vftable = (std::exception_vtbl *)&unk_26FBC2428;
  MEMORY[0x24C55DB80](&this[2]);
  std::exception::~exception(this);
  JUMPOUT(0x24C55DD50);
}

uint64_t std::for_each[abi:ne180100]<nlohmann::detail::json_ref<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>> const*,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::(std::initializer_list<nlohmann::detail::json_ref<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>,BOOL,nlohmann::detail::value_t)::{lambda(nlohmann::detail::json_ref<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>> const&)#2}>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v5 = a1;
    do
    {
      nlohmann::detail::json_ref<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::moved_or_copied(v5, (uint64_t)v7);
      std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__emplace_unique_key_args<std::string,std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>(*(uint64_t ***)(a3 + 8), *(const void ***)(*v8 + 8), *(void *)(*v8 + 8), *v8 + 16);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v7);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v8, v7[0]);
      v5 += 32;
    }
    while (v5 != a2);
  }
  return a3;
}

void sub_2477D47D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned __int8 a9)
{
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&a9);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(v9, a9);
  _Unwind_Resume(a1);
}

void *nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::create<std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,nlohmann::detail::json_ref<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>> const*,nlohmann::detail::json_ref<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>> const*>(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = operator new(0x18uLL);
  uint64_t v5 = *a1;
  uint64_t v6 = *a2;
  unint64_t v7 = (*a2 - *a1) >> 5;
  v4[1] = 0;
  v4[2] = 0;
  *uint64_t v4 = 0;
  std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__init_with_size[abi:ne180100]<nlohmann::detail::json_ref<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>> const*,nlohmann::detail::json_ref<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>> const*>(v4, v5, v6, v7);
  return v4;
}

void sub_2477D484C(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::operator[](uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)a1 != 2)
  {
    exception = (nlohmann::detail::exception *)__cxa_allocate_exception(0x20uLL);
    uint64_t v5 = (char *)nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::type_name((char *)a1);
    std::string::basic_string[abi:ne180100]<0>(&v8, v5);
    uint64_t v6 = std::string::insert(&v8, 0, "cannot use operator[] with a numeric argument with ");
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

void sub_2477D4930(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
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
    return off_265221470[v1];
  }
}

void nlohmann::detail::exception::name(int a1@<W1>, std::string *a2@<X8>)
{
  std::operator+<char>();
  uint64_t v4 = std::string::append(&v12, ".");
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
  std::string v8 = std::string::append(&v13, (const std::string::value_type *)p_p, size);
  long long v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
  v14.__r_.__value_.__r.__words[2] = v8->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v14.__r_.__value_.__l.__data_ = v9;
  v8->__r_.__value_.__l.__size_ = 0;
  v8->__r_.__value_.__r.__words[2] = 0;
  v8->__r_.__value_.__r.__words[0] = 0;
  std::string::size_type v10 = std::string::append(&v14, "] ");
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

void sub_2477D4AD8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26)
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
  *(void *)this = &unk_26FBC2428;
  *((_DWORD *)this + 2) = a2;
  MEMORY[0x24C55DB70]((char *)this + 16, a3);
  return this;
}

void sub_2477D4B8C(_Unwind_Exception *a1)
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
  this->__vftable = (std::exception_vtbl *)&unk_26FBC2428;
  MEMORY[0x24C55DB80](&this[2]);
  std::exception::~exception(this);
}

{
  uint64_t vars8;

  this->__vftable = (std::exception_vtbl *)&unk_26FBC2428;
  MEMORY[0x24C55DB80](&this[2]);
  std::exception::~exception(this);
  JUMPOUT(0x24C55DD50);
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
    uint64_t v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    uint64_t v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

void std::string::__throw_length_error[abi:ne180100]()
{
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
      size_t v4 = (std::string *)nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::create<std::map<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::map<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>> const&>(*(const void ****)(a2 + 8));
      goto LABEL_8;
    case 2:
      size_t v4 = (std::string *)nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::create<std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>> const&>(*(uint64_t **)(a2 + 8));
      goto LABEL_8;
    case 3:
      size_t v4 = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::create<std::string,std::string const&>(*(void *)(a2 + 8));
      goto LABEL_8;
    case 4:
      size_t v4 = (std::string *)*(unsigned __int8 *)(a2 + 8);
      goto LABEL_8;
    case 5:
    case 6:
    case 7:
      size_t v4 = *(std::string **)(a2 + 8);
      goto LABEL_8;
    case 8:
      size_t v4 = (std::string *)nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::create<nlohmann::byte_container_with_subtype<std::vector<unsigned char>>,nlohmann::byte_container_with_subtype<std::vector<unsigned char>> const&>(*(void *)(a2 + 8));
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
  uint64_t v2 = (uint64_t *)operator new(0x18uLL);
  std::map<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::map[abi:ne180100](v2, a1);
  return v2;
}

void sub_2477D4F28(_Unwind_Exception *a1)
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

void sub_2477D4F7C(_Unwind_Exception *a1)
{
  std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::destroy(v1, *(char **)(v1 + 8));
  _Unwind_Resume(a1);
}

uint64_t *std::map<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::insert[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__tree_node<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void *> *,long>>>(uint64_t *result, const void **a2, const void ***a3)
{
  if (a2 != (const void **)a3)
  {
    size_t v4 = a2;
    size_t v5 = (uint64_t **)result;
    uint64_t v6 = result + 1;
    do
    {
      uint64_t result = std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__emplace_hint_unique_key_args<std::string,std::pair<std::string const,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>> const&>(v5, v6, v4 + 4, (long long *)v4 + 2);
      uint64_t v7 = (const void **)v4[1];
      if (v7)
      {
        do
        {
          uint64_t v8 = (const void ***)v7;
          uint64_t v7 = (const void **)*v7;
        }
        while (v7);
      }
      else
      {
        do
        {
          uint64_t v8 = (const void ***)v4[2];
          BOOL v9 = *v8 == v4;
          size_t v4 = (const void **)v8;
        }
        while (!v9);
      }
      size_t v4 = (const void **)v8;
    }
    while (v8 != a3);
  }
  return result;
}

uint64_t *std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__emplace_hint_unique_key_args<std::string,std::pair<std::string const,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>> const&>(uint64_t **a1, uint64_t *a2, const void **a3, long long *a4)
{
  uint64_t v6 = (uint64_t **)std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__find_equal<std::string>(a1, a2, &v10, &v9, a3);
  uint64_t result = *v6;
  if (!*v6)
  {
    std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__construct_node<std::pair<std::string const,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>> const&>((uint64_t)a1, a4, (uint64_t)&v8);
    std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__insert_node_at(a1, (uint64_t)v10, v6, v8);
    return v8;
  }
  return result;
}

const void **std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__find_equal<std::string>(void *a1, uint64_t *a2, const void ***a3, uint64_t *a4, const void **a5)
{
  uint64_t v9 = (const void **)(a1 + 1);
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

std::string *std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__construct_node<std::pair<std::string const,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>> const&>@<X0>(uint64_t a1@<X0>, long long *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = a1 + 8;
  uint64_t v6 = (char *)operator new(0x48uLL);
  *(void *)a3 = v6;
  *(void *)(a3 + 8) = v5;
  *(unsigned char *)(a3 + 16) = 0;
  uint64_t result = std::pair<std::string const,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::pair[abi:ne180100]((std::string *)(v6 + 32), a2);
  *(unsigned char *)(a3 + 16) = 1;
  return result;
}

void sub_2477D52B8(_Unwind_Exception *a1)
{
  void *v1 = 0;
  std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

uint64_t *std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  uint64_t v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  uint64_t result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

void *std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__find_equal<std::string>(uint64_t a1, void *a2, const void **a3)
{
  uint64_t v5 = (void *)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 8);
  if (v4)
  {
    uint64_t v7 = a1 + 16;
    do
    {
      while (1)
      {
        uint64_t v8 = (void *)v4;
        uint64_t v9 = (const void **)(v4 + 32);
        if (!std::less<void>::operator()[abi:ne180100]<std::string const&,std::string const&>(v7, a3, (const void **)(v4 + 32)))break; {
        uint64_t v4 = *v8;
        }
        uint64_t v5 = v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }
      if (!std::less<void>::operator()[abi:ne180100]<std::string const&,std::string const&>(v7, v9, a3)) {
        break;
      }
      uint64_t v5 = v8 + 1;
      uint64_t v4 = v8[1];
    }
    while (v4);
  }
  else
  {
    uint64_t v8 = (void *)(a1 + 8);
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
    uint64_t v6 = a2;
  }
  else {
    uint64_t v6 = *a2;
  }
  if (v3 >= 0) {
    size_t v7 = *((unsigned __int8 *)a3 + 23);
  }
  else {
    size_t v7 = (size_t)a3[1];
  }
  if (v3 >= 0) {
    uint64_t v8 = a3;
  }
  else {
    uint64_t v8 = *a3;
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

void sub_2477D5494(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  size_t v5 = this;
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
    uint64_t v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    size_t v5 = v8;
  }
  else
  {
    *((unsigned char *)&this->__r_.__value_.__s + 23) = __sz;
  }
  memmove(v5, __s, __sz + 1);
}

uint64_t *std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  *((unsigned char *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      uint64_t v2 = (uint64_t *)a2[2];
      if (*((unsigned char *)v2 + 24)) {
        return result;
      }
      int v3 = (uint64_t *)v2[2];
      long long v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), size_t v5 = (unsigned char *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            size_t v9 = (uint64_t **)a2[2];
          }
          else
          {
            size_t v9 = (uint64_t **)v2[1];
            int v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              int v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = v9;
            std::string *v9 = v2;
            v2[2] = (uint64_t)v9;
            int v3 = v9[2];
            uint64_t v2 = (uint64_t *)*v3;
          }
          *((unsigned char *)v9 + 24) = 1;
          *((unsigned char *)v3 + 24) = 0;
          uint64_t v13 = v2[1];
          *int v3 = v13;
          if (v13) {
            *(void *)(v13 + 16) = v3;
          }
          v2[2] = v3[2];
          *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), size_t v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          uint64_t v11 = a2[1];
          *uint64_t v2 = v11;
          if (v11)
          {
            *(void *)(v11 + 16) = v2;
            int v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          int v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((unsigned char *)a2 + 24) = 1;
        *((unsigned char *)v3 + 24) = 0;
        uint64_t v2 = (uint64_t *)v3[1];
        uint64_t v12 = *v2;
        v3[1] = *v2;
        if (v12) {
          *(void *)(v12 + 16) = v3;
        }
        v2[2] = v3[2];
        *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
        *uint64_t v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((unsigned char *)v2 + 24) = 1;
      a2 = v3;
      *((unsigned char *)v3 + 24) = v3 == result;
      *size_t v5 = 1;
    }
    while (v3 != result);
  }
  return result;
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

void *nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::create<std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>> const&>(uint64_t *a1)
{
  uint64_t v2 = operator new(0x18uLL);
  v2[1] = 0;
  v2[2] = 0;
  *uint64_t v2 = 0;
  std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__init_with_size[abi:ne180100]<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>(v2, *a1, a1[1], (a1[1] - *a1) >> 4);
  return v2;
}

void sub_2477D578C(_Unwind_Exception *a1)
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
    uint64_t result = (void *)std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>((uint64_t)(v6 + 2), a2, a3, v6[1]);
    v6[1] = result;
  }
  return result;
}

void sub_2477D5808(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  *(void *)(v9 + 8) = v10;
  std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

char *std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 60) {
    std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
  }
  uint64_t result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[16 * v4];
  return result;
}

uint64_t std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  uint64_t v10 = a4;
  uint64_t v11 = a4;
  v8[0] = a1;
  v8[1] = &v10;
  v8[2] = &v11;
  char v9 = 0;
  if (a2 != a3)
  {
    uint64_t v6 = a2;
    do
    {
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json(v4, v6);
      v6 += 16;
      uint64_t v4 = v11 + 16;
      v11 += 16;
    }
    while (v6 != a3);
  }
  char v9 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v8);
  return v4;
}

void sub_2477D58FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
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
    uint64_t v7 = (unsigned __int8 *)(a3 - 16);
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
  int v3 = v2;
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

void sub_2477D5A10(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::create<nlohmann::byte_container_with_subtype<std::vector<unsigned char>>,nlohmann::byte_container_with_subtype<std::vector<unsigned char>> const&>(uint64_t a1)
{
  uint64_t v2 = operator new(0x20uLL);
  v2[1] = 0;
  v2[2] = 0;
  *uint64_t v2 = 0;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(v2, *(const void **)a1, *(void *)(a1 + 8), *(void *)(a1 + 8) - *(void *)a1);
  *((_WORD *)v2 + 12) = *(_WORD *)(a1 + 24);
  return v2;
}

void sub_2477D5A70(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(void *result, const void *a2, uint64_t a3, size_t __sz)
{
  if (__sz)
  {
    uint64_t v6 = result;
    uint64_t result = std::vector<unsigned char>::__vallocate[abi:ne180100](result, __sz);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      uint64_t result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_2477D5AE4(_Unwind_Exception *exception_object)
{
  int v3 = *(void **)v1;
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
  uint64_t result = (char *)operator new(__sz);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[__sz];
  return result;
}

uint64_t *std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__emplace_unique_key_args<std::string,std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>(uint64_t **a1, const void **a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = (uint64_t **)std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__find_equal<std::string>((uint64_t)a1, &v10, a2);
  uint64_t result = *v7;
  if (!*v7)
  {
    std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__construct_node<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>((uint64_t)a1, a3, a4, (uint64_t)&v9);
    std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__insert_node_at(a1, v10, v7, v9);
    return v9;
  }
  return result;
}

uint64_t std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__construct_node<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7 = a1 + 8;
  size_t v8 = operator new(0x48uLL);
  *(void *)a4 = v8;
  *(void *)(a4 + 8) = v7;
  v8[2] = *(_OWORD *)a2;
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
  *(unsigned char *)(a4 + 16) = 1;
  return result;
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

void sub_2477D5CC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  *(void *)(v9 + 8) = v10;
  std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

uint64_t std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,nlohmann::detail::json_ref<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>> const*,nlohmann::detail::json_ref<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>> const*,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  uint64_t v10 = a4;
  uint64_t v11 = a4;
  v8[0] = a1;
  v8[1] = &v10;
  v8[2] = &v11;
  char v9 = 0;
  if (a2 != a3)
  {
    uint64_t v6 = a2;
    do
    {
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<nlohmann::detail::json_ref<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,0>(v4, v6);
      v6 += 32;
      uint64_t v4 = v11 + 16;
      v11 += 16;
    }
    while (v6 != a3);
  }
  char v9 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v8);
  return v4;
}

void sub_2477D5D70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<nlohmann::detail::json_ref<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,0>(uint64_t a1, uint64_t a2)
{
  nlohmann::detail::json_ref<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::moved_or_copied(a2, (uint64_t)v4);
  *(unsigned char *)a1 = v4[0];
  *(void *)(a1 + 8) = v5;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v4);
  v4[0] = 0;
  size_t v5 = 0;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a1);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v4);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v5, v4[0]);
  return a1;
}

uint64_t nlohmann::detail::external_constructor<(nlohmann::detail::value_t)2>::construct<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,std::vector<double>,0>(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = 2;
  int v3 = *(uint64_t **)a2;
  size_t v5 = *(uint64_t **)(a2 + 8);
  uint64_t v6 = v3;
  *(void *)(a1 + 8) = nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::create<std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__wrap_iter<double const*>,std::__wrap_iter<double const*>>(&v6, &v5);
  return nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a1);
}

void *nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::create<std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__wrap_iter<double const*>,std::__wrap_iter<double const*>>(uint64_t **a1, uint64_t **a2)
{
  uint64_t v4 = operator new(0x18uLL);
  size_t v5 = *a1;
  uint64_t v6 = *a2;
  unint64_t v7 = *a2 - *a1;
  v4[1] = 0;
  v4[2] = 0;
  *uint64_t v4 = 0;
  std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__init_with_size[abi:ne180100]<std::__wrap_iter<double const*>,std::__wrap_iter<double const*>>(v4, v5, v6, v7);
  return v4;
}

void sub_2477D5EA8(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__init_with_size[abi:ne180100]<std::__wrap_iter<double const*>,std::__wrap_iter<double const*>>(void *result, uint64_t *a2, uint64_t *a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__vallocate[abi:ne180100](result, a4);
    uint64_t result = (void *)std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,double const*,double const*,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>((uint64_t)(v6 + 2), a2, a3, v6[1]);
    v6[1] = result;
  }
  return result;
}

void sub_2477D5F24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  *(void *)(v9 + 8) = v10;
  std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

uint64_t std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,double const*,double const*,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t a4)
{
  uint64_t v4 = a4;
  uint64_t v11 = a4;
  uint64_t v12 = a4;
  v9[0] = a1;
  v9[1] = &v11;
  v9[2] = &v12;
  if (a2 != a3)
  {
    uint64_t v6 = a2;
    do
    {
      *(void *)(v4 + 8) = 0;
      uint64_t v7 = *v6++;
      *(unsigned char *)uint64_t v4 = 7;
      *(void *)(v4 + 8) = v7;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v4);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v4);
      uint64_t v4 = v12 + 16;
      v12 += 16;
    }
    while (v6 != a3);
  }
  char v10 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v9);
  return v4;
}

uint64_t std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__emplace_back_slow_path<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>(uint64_t *a1, uint64_t a2)
{
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
  v15[4] = a1 + 2;
  char v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>(v7, v9);
  uint64_t v11 = (uint64_t)&v10[16 * v4];
  v15[0] = v10;
  v15[1] = v11;
  v15[3] = &v10[16 * v12];
  *(unsigned char *)uint64_t v11 = *(unsigned char *)a2;
  *(void *)(v11 + 8) = *(void *)(a2 + 8);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a2);
  *(unsigned char *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v11);
  v15[2] = v11 + 16;
  std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__swap_out_circular_buffer(a1, v15);
  uint64_t v13 = a1[1];
  std::__split_buffer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::~__split_buffer((uint64_t)v15);
  return v13;
}

void sub_2477D60C4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t *std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__emplace_unique_impl<char const(&)[5],char const*>(uint64_t **a1, char *a2, char **a3)
{
  std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__construct_node<char const(&)[5],char const*>((uint64_t)a1, a2, a3, (uint64_t)&__p);
  uint64_t v4 = (uint64_t **)std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__find_equal<std::string>((uint64_t)a1, &v8, (const void **)__p + 4);
  unint64_t v5 = *v4;
  if (*v4)
  {
    uint64_t v6 = __p;
    std::string __p = 0;
    if (v6) {
      std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void *>>>::operator()[abi:ne180100]((uint64_t)&v10, v6);
    }
  }
  else
  {
    std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__insert_node_at(a1, v8, v4, (uint64_t *)__p);
    return (uint64_t *)__p;
  }
  return v5;
}

void sub_2477D6160(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void *>>>::operator()[abi:ne180100]((uint64_t)&a11, __p);
  }
  _Unwind_Resume(exception_object);
}

void *std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__construct_node<char const(&)[5],char const*>@<X0>(uint64_t a1@<X0>, char *a2@<X1>, char **a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7 = a1 + 8;
  uint64_t v8 = operator new(0x48uLL);
  *(void *)a4 = v8;
  *(void *)(a4 + 8) = v7;
  *(unsigned char *)(a4 + 16) = 0;
  uint64_t result = std::pair<std::string const,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::pair[abi:ne180100]<char const(&)[5],char const*,0>(v8 + 4, a2, a3);
  *(unsigned char *)(a4 + 16) = 1;
  return result;
}

void sub_2477D61F4(_Unwind_Exception *a1)
{
  void *v1 = 0;
  std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

void *std::pair<std::string const,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::pair[abi:ne180100]<char const(&)[5],char const*,0>(void *a1, char *a2, char **a3)
{
  unint64_t v5 = std::string::basic_string[abi:ne180100]<0>(a1, a2);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const*,char const*,0>((uint64_t)(v5 + 3), a3);
  return a1;
}

void sub_2477D6248(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json<char const*,char const*,0>(uint64_t a1, char **a2)
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
  uint64_t v2 = operator new(0x18uLL);
  std::string::basic_string[abi:ne180100]<0>(v2, *a1);
  return v2;
}

void sub_2477D62E8(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
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

uint64_t *std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__emplace_unique_impl<char const(&)[10],double>(uint64_t **a1, char *a2, uint64_t *a3)
{
  std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__construct_node<char const(&)[10],double>((uint64_t)a1, a2, a3, (uint64_t)&__p);
  uint64_t v4 = (uint64_t **)std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__find_equal<std::string>((uint64_t)a1, &v8, (const void **)__p + 4);
  unint64_t v5 = *v4;
  if (*v4)
  {
    uint64_t v6 = __p;
    std::string __p = 0;
    if (v6) {
      std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void *>>>::operator()[abi:ne180100]((uint64_t)&v10, v6);
    }
  }
  else
  {
    std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__insert_node_at(a1, v8, v4, (uint64_t *)__p);
    return (uint64_t *)__p;
  }
  return v5;
}

void sub_2477D6460(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void *>>>::operator()[abi:ne180100]((uint64_t)&a11, __p);
  }
  _Unwind_Resume(exception_object);
}

void *std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__construct_node<char const(&)[10],double>@<X0>(uint64_t a1@<X0>, char *a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7 = a1 + 8;
  uint64_t v8 = operator new(0x48uLL);
  *(void *)a4 = v8;
  *(void *)(a4 + 8) = v7;
  *(unsigned char *)(a4 + 16) = 0;
  uint64_t result = std::pair<std::string const,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::pair[abi:ne180100]<char const(&)[10],double,0>(v8 + 4, a2, a3);
  *(unsigned char *)(a4 + 16) = 1;
  return result;
}

void sub_2477D64F4(_Unwind_Exception *a1)
{
  void *v1 = 0;
  std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

void *std::pair<std::string const,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::pair[abi:ne180100]<char const(&)[10],double,0>(void *a1, char *a2, uint64_t *a3)
{
  unint64_t v5 = std::string::basic_string[abi:ne180100]<0>(a1, a2);
  v5[4] = 0;
  uint64_t v6 = *a3;
  *((unsigned char *)v5 + 24) = 7;
  uint64_t v7 = (uint64_t)(v5 + 3);
  v5[4] = v6;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)(v5 + 3));
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v7);
  return a1;
}

uint64_t *std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__emplace_unique_impl<char const(&)[13],BOOL>(uint64_t **a1, char *a2, unsigned __int8 *a3)
{
  std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__construct_node<char const(&)[13],BOOL>((uint64_t)a1, a2, a3, (uint64_t)&__p);
  uint64_t v4 = (uint64_t **)std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__find_equal<std::string>((uint64_t)a1, &v8, (const void **)__p + 4);
  unint64_t v5 = *v4;
  if (*v4)
  {
    uint64_t v6 = __p;
    std::string __p = 0;
    if (v6) {
      std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void *>>>::operator()[abi:ne180100]((uint64_t)&v10, v6);
    }
  }
  else
  {
    std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__insert_node_at(a1, v8, v4, (uint64_t *)__p);
    return (uint64_t *)__p;
  }
  return v5;
}

void sub_2477D65EC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void *>>>::operator()[abi:ne180100]((uint64_t)&a11, __p);
  }
  _Unwind_Resume(exception_object);
}

void *std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__construct_node<char const(&)[13],BOOL>@<X0>(uint64_t a1@<X0>, char *a2@<X1>, unsigned __int8 *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7 = a1 + 8;
  uint64_t v8 = operator new(0x48uLL);
  *(void *)a4 = v8;
  *(void *)(a4 + 8) = v7;
  *(unsigned char *)(a4 + 16) = 0;
  uint64_t result = std::pair<std::string const,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::pair[abi:ne180100]<char const(&)[13],BOOL,0>(v8 + 4, a2, a3);
  *(unsigned char *)(a4 + 16) = 1;
  return result;
}

void sub_2477D6680(_Unwind_Exception *a1)
{
  void *v1 = 0;
  std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

void *std::pair<std::string const,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::pair[abi:ne180100]<char const(&)[13],BOOL,0>(void *a1, char *a2, unsigned __int8 *a3)
{
  unint64_t v5 = std::string::basic_string[abi:ne180100]<0>(a1, a2);
  v5[4] = 0;
  uint64_t v6 = *a3;
  *((unsigned char *)v5 + 24) = 4;
  uint64_t v7 = (uint64_t)(v5 + 3);
  v5[4] = v6;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)(v5 + 3));
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v7);
  return a1;
}

uint64_t *std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__emplace_unique_impl<char const(&)[15],nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>(uint64_t **a1, char *a2, uint64_t a3)
{
  std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__construct_node<char const(&)[15],nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>((uint64_t)a1, a2, a3, (uint64_t)&__p);
  uint64_t v4 = (uint64_t **)std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__find_equal<std::string>((uint64_t)a1, &v8, (const void **)__p + 4);
  unint64_t v5 = *v4;
  if (*v4)
  {
    uint64_t v6 = __p;
    std::string __p = 0;
    if (v6) {
      std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void *>>>::operator()[abi:ne180100]((uint64_t)&v10, v6);
    }
  }
  else
  {
    std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__insert_node_at(a1, v8, v4, (uint64_t *)__p);
    return (uint64_t *)__p;
  }
  return v5;
}

void sub_2477D6778(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void *>>>::operator()[abi:ne180100]((uint64_t)&a11, __p);
  }
  _Unwind_Resume(exception_object);
}

void *std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__construct_node<char const(&)[15],nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>@<X0>(uint64_t a1@<X0>, char *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7 = a1 + 8;
  uint64_t v8 = operator new(0x48uLL);
  *(void *)a4 = v8;
  *(void *)(a4 + 8) = v7;
  *(unsigned char *)(a4 + 16) = 0;
  uint64_t result = std::pair<std::string const,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::pair[abi:ne180100]<char const(&)[15],nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,0>(v8 + 4, a2, a3);
  *(unsigned char *)(a4 + 16) = 1;
  return result;
}

void sub_2477D680C(_Unwind_Exception *a1)
{
  void *v1 = 0;
  std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

void *std::pair<std::string const,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::pair[abi:ne180100]<char const(&)[15],nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>,0>(void *a1, char *a2, uint64_t a3)
{
  unint64_t v5 = std::string::basic_string[abi:ne180100]<0>(a1, a2);
  *((unsigned char *)v5 + 24) = *(unsigned char *)a3;
  uint64_t v6 = (uint64_t)(v5 + 3);
  v5[4] = *(void *)(a3 + 8);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a3);
  *(unsigned char *)a3 = 0;
  *(void *)(a3 + 8) = 0;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v6);
  return a1;
}

uint64_t nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump(void ***a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  switch(*(unsigned char *)a2)
  {
    case 0:
      uint64_t v11 = (uint64_t (*)(void))(**a1)[1];
      goto LABEL_83;
    case 1:
      uint64_t v12 = (uint64_t)**a1;
      if (!*(void *)(*(void *)(a2 + 8) + 16))
      {
        v45 = *(uint64_t (**)(void))(v12 + 8);
        goto LABEL_52;
      }
      if (a3)
      {
        (*(void (**)(void))(v12 + 8))();
        unsigned int v13 = a6 + a5;
        std::string v14 = a1 + 76;
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
            int64_t v16 = *(void **)(a2 + 8);
            BOOL v17 = (void *)*v16;
            if (v16[2] == 1)
            {
              uint64_t v18 = (void *)*v16;
            }
            else
            {
              unint64_t v67 = 0;
              do
              {
                v68 = a1 + 76;
                if (*((char *)a1 + 631) < 0) {
                  v68 = (void ***)*v14;
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
                    uint64_t v18 = v69;
                    v69 = (void *)*v69;
                  }
                  while (v69);
                }
                else
                {
                  do
                  {
                    uint64_t v18 = (void *)v17[2];
                    BOOL v51 = *v18 == (void)v17;
                    BOOL v17 = v18;
                  }
                  while (!v51);
                }
                ++v67;
                int64_t v16 = *(void **)(a2 + 8);
                BOOL v17 = v18;
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
          v49 = (void *)v47[1];
          v50 = v47;
          if (v49)
          {
            do
            {
              v47 = v49;
              v49 = (void *)*v49;
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
      v53 = (void *)v47[1];
      if (v53)
      {
        do
        {
          v54 = v53;
          v53 = (void *)*v53;
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
      uint64_t v11 = (uint64_t (*)(void))***a1;
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
              v59 = *(uint64_t **)(a2 + 8);
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
            int v23 = *(uint64_t **)(a2 + 8);
            uint64_t v25 = *v23;
            uint64_t v24 = v23[1];
            if (v25 != v24 - 16)
            {
              do
              {
                uint64_t v26 = a1 + 76;
                if (*((char *)a1 + 631) < 0) {
                  uint64_t v26 = (void ***)*v21;
                }
                ((void (*)(void, void ***, void))(**a1)[1])(*a1, v26, (a6 + a5));
                nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump(a1, v25, 1, a4, a5, (a6 + a5));
                ((void (*)(void, const char *, uint64_t))(**a1)[1])(*a1, ",\n", 2);
                v25 += 16;
                char v27 = *(uint64_t **)(a2 + 8);
                uint64_t v24 = v27[1];
              }
              while (v25 != v24 - 16);
              uint64_t v25 = *v27;
            }
            if (v25 == v24) {
              nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump();
            }
            v28 = a1 + 76;
            if (*((char *)a1 + 631) < 0) {
              v28 = (void ***)*v21;
            }
            ((void (*)(void, void ***, void))(**a1)[1])(*a1, v28, (a6 + a5));
            nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump(a1, *(void *)(*(void *)(a2 + 8) + 8) - 16, 1, a4, a5, (a6 + a5));
            ((void (*)(void))***a1)();
            if (*((char *)a1 + 631) < 0) {
              v21 = (void *)*v21;
            }
            ((void (*)(void, void *, void))(**a1)[1])(*a1, v21, a6);
LABEL_108:
            uint64_t v11 = (uint64_t (*)(void))***a1;
            goto LABEL_123;
          }
        }
        std::string::resize((std::string *)(a1 + 76), 2 * v22, 32);
        goto LABEL_13;
      }
      v45 = (uint64_t (*)(void))v19[1];
LABEL_52:
      return v45();
    case 3:
      ((void (*)(void))***a1)();
      nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_escaped((uint64_t)a1, *(uint64_t **)(a2 + 8), a4);
      uint64_t v11 = (uint64_t (*)(void))***a1;
      goto LABEL_123;
    case 4:
      uint64_t v11 = (uint64_t (*)(void))(**a1)[1];
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
        v35 = a1 + 76;
        if (*((char *)a1 + 631) < 0)
        {
          unint64_t v36 = (unint64_t)a1[77];
          if (v36 >= v34)
          {
            v37 = (uint64_t (***)(void))*a1;
            goto LABEL_73;
          }
        }
        else
        {
          unint64_t v36 = *((unsigned __int8 *)a1 + 631);
          if (v34 <= v36)
          {
            v37 = (uint64_t (***)(void))*a1;
            v38 = a1 + 76;
            goto LABEL_74;
          }
        }
        std::string::resize((std::string *)(a1 + 76), 2 * v36, 32);
        v37 = (uint64_t (***)(void))*a1;
        v38 = a1 + 76;
        if ((*((char *)a1 + 631) & 0x80000000) == 0)
        {
LABEL_74:
          ((void (*)(uint64_t (***)(void), void ***, uint64_t))(*v37)[1])(v37, v38, v34);
          ((void (*)(void, const char *, uint64_t))(**a1)[1])(*a1, "\"bytes\": [", 10);
          v60 = *(unsigned __int8 ***)(a2 + 8);
          v62 = *v60;
          v61 = v60[1];
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
        v38 = (void ***)*v35;
        goto LABEL_74;
      }
      v33();
      v39 = *(unsigned __int8 ***)(a2 + 8);
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
        v44 = (uint64_t (*)(void))***a1;
        return v44();
      }
      uint64_t v11 = (uint64_t (*)(void))(**a1)[1];
LABEL_83:
      return v11();
    case 9:
      uint64_t v11 = (uint64_t (*)(void))(**a1)[1];
      goto LABEL_83;
    default:
      nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump();
  }
}

void std::__shared_ptr_emplace<nlohmann::detail::output_stream_adapter<char>>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26FBC2450;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<nlohmann::detail::output_stream_adapter<char>>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26FBC2450;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x24C55DD50);
}

uint64_t std::__shared_ptr_emplace<nlohmann::detail::output_stream_adapter<char>>::__on_zero_shared(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 24) + 16))();
}

uint64_t nlohmann::detail::output_stream_adapter<char>::write_character(uint64_t a1)
{
  return MEMORY[0x270F98740](*(void *)(a1 + 8));
}

uint64_t nlohmann::detail::output_stream_adapter<char>::write_characters(uint64_t a1)
{
  return MEMORY[0x270F98750](*(void *)(a1 + 8));
}

void nlohmann::detail::output_stream_adapter<char>::~output_stream_adapter()
{
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
  uint64_t v7 = localeconv();
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
  int8x16_t *v10 = v11;
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

void sub_2477D7B44(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(std::__shared_weak_count **)(v1 + 8);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  _Unwind_Resume(exception_object);
}

void *std::string::basic_string[abi:ne180100](void *__b, size_t __len, int __c)
{
  if (__len >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (__len >= 0x17)
  {
    size_t v7 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17) {
      size_t v7 = __len | 7;
    }
    size_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    __b[1] = __len;
    __b[2] = v8 | 0x8000000000000000;
    *__b = v6;
  }
  else
  {
    *((unsigned char *)__b + 23) = __len;
    uint64_t v6 = __b;
    if (!__len) {
      goto LABEL_9;
    }
  }
  memset(v6, __c, __len);
LABEL_9:
  *((unsigned char *)v6 + __len) = 0;
  return __b;
}

uint64_t nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_escaped(uint64_t result, uint64_t *a2, int a3)
{
  char v46 = 0;
  LOBYTE(v3) = *((char *)a2 + 23) < 0;
  uint64_t v4 = *((unsigned __int8 *)a2 + 23);
  if ((v4 & 0x80u) != 0) {
    uint64_t v4 = a2[1];
  }
  if (!v4) {
    return result;
  }
  size_t v7 = (void *)result;
  unint64_t v8 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  v47[0] = 0;
  uint64_t v12 = result + 90;
  do
  {
    if (v3) {
      unsigned int v13 = (uint64_t *)*a2;
    }
    else {
      unsigned int v13 = a2;
    }
    int v14 = *((unsigned __int8 *)v13 + v8);
    uint64_t result = nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::decode(&v46, v47, v14);
    if (result == 1)
    {
      int v16 = *((_DWORD *)v7 + 158);
      if ((v16 - 1) >= 2)
      {
        if (!v16)
        {
          char v45 = 3;
          *(_DWORD *)__str = 0;
          snprintf(__str, 3uLL, "%.2X", v14);
          exception = (nlohmann::detail::exception *)__cxa_allocate_exception(0x20uLL);
          std::to_string(&v38, v8);
          v28 = std::string::insert(&v38, 0, "invalid UTF-8 byte at index ");
          long long v29 = *(_OWORD *)&v28->__r_.__value_.__l.__data_;
          v39.__r_.__value_.__r.__words[2] = v28->__r_.__value_.__r.__words[2];
          *(_OWORD *)&v39.__r_.__value_.__l.__data_ = v29;
          v28->__r_.__value_.__l.__size_ = 0;
          v28->__r_.__value_.__r.__words[2] = 0;
          v28->__r_.__value_.__r.__words[0] = 0;
          v30 = std::string::append(&v39, ": 0x");
          long long v31 = *(_OWORD *)&v30->__r_.__value_.__l.__data_;
          v40.__r_.__value_.__r.__words[2] = v30->__r_.__value_.__r.__words[2];
          *(_OWORD *)&v40.__r_.__value_.__l.__data_ = v31;
          v30->__r_.__value_.__l.__size_ = 0;
          v30->__r_.__value_.__r.__words[2] = 0;
          v30->__r_.__value_.__r.__words[0] = 0;
          if (v45 >= 0) {
            double v32 = __str;
          }
          else {
            double v32 = *(char **)__str;
          }
          if (v45 >= 0) {
            std::string::size_type v33 = v45;
          }
          else {
            std::string::size_type v33 = v44;
          }
          uint64_t v34 = std::string::append(&v40, v32, v33);
          long long v35 = *(_OWORD *)&v34->__r_.__value_.__l.__data_;
          std::string::size_type v42 = v34->__r_.__value_.__r.__words[2];
          long long v41 = v35;
          v34->__r_.__value_.__l.__size_ = 0;
          v34->__r_.__value_.__r.__words[2] = 0;
          v34->__r_.__value_.__r.__words[0] = 0;
          nlohmann::detail::type_error::create(316, (uint64_t)&v41, exception);
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
      char v46 = 0;
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
      switch(v47[0])
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
          if (v47[0] == 34)
          {
            __int16 v15 = 8796;
            goto LABEL_43;
          }
          if (v47[0] == 92)
          {
            __int16 v15 = 23644;
LABEL_43:
            *(_WORD *)(v12 + v11) = v15;
            v11 += 2;
            goto LABEL_44;
          }
LABEL_29:
          if (v47[0] > 0x7E) {
            int v20 = a3;
          }
          else {
            int v20 = 0;
          }
          if (v47[0] < 0x20 || v20)
          {
            uint64_t v24 = (char *)(v12 + v11);
            if (HIWORD(v47[0]))
            {
              uint64_t result = snprintf(v24, 0xDuLL, "\\u%04x\\u%04x", (unsigned __int16)((v47[0] >> 10) - 10304), v47[0] & 0x3FF | 0xDC00);
              v11 += 12;
            }
            else
            {
              uint64_t result = snprintf(v24, 7uLL, "\\u%04x", v47[0]);
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
  }
  while (v8 < v23);
  if (v46)
  {
    int v26 = *((_DWORD *)v7 + 158);
    switch(v26)
    {
      case 1:
        (*(void (**)(void, uint64_t, uint64_t))(*(void *)*v7 + 8))(*v7, v12, v10);
        uint64_t v25 = *(uint64_t (**)(void))(*(void *)*v7 + 8);
        break;
      case 2:
        uint64_t v25 = *(uint64_t (**)(void))(*(void *)*v7 + 8);
        break;
      case 0:
        char v45 = 3;
        *(_DWORD *)__str = 0;
        unint64_t v36 = (uint64_t *)*a2;
        if (v22 >= 0) {
          unint64_t v36 = a2;
        }
        snprintf(__str, 3uLL, "%.2X", *((unsigned __int8 *)v36 + v23 - 1));
        v37 = (nlohmann::detail::exception *)__cxa_allocate_exception(0x20uLL);
        std::operator+<char>();
        nlohmann::detail::type_error::create(316, (uint64_t)&v41, v37);
      default:
        nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_escaped();
    }
    return v25();
  }
  else if (v11)
  {
    uint64_t v25 = *(uint64_t (**)(void))(*(void *)*v7 + 8);
    return v25();
  }
  return result;
}

void sub_2477D81B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25,uint64_t a26,void *a27,uint64_t a28,int a29,__int16 a30,char a31,char a32,uint64_t a33,void *__p,uint64_t a35,int a36,__int16 a37,char a38,char a39)
{
  if (a39 < 0)
  {
    operator delete(__p);
    if ((v40 & 1) == 0)
    {
LABEL_6:
      if (*(char *)(v41 - 97) < 0) {
        operator delete(*(void **)(v41 - 120));
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

uint64_t nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_integer<long long,0>(uint64_t (****a1)(void), unint64_t a2)
{
  if (a2)
  {
    unint64_t v2 = a2;
    uint64_t v3 = a1 + 2;
    if ((v2 & 0x8000000000000000) != 0)
    {
      *uint64_t v3 = 45;
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
        uint64_t v4 = (char *)a1 + 17;
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
    uint64_t v4 = &v3[v8];
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
  uint64_t v5 = ***a1;
  return v5();
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
        unint64_t v11 = (**a1)[1];
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

uint64_t nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump_float(char *a1, double a2)
{
  if ((*(void *)&a2 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000)
  {
    uint64_t v5 = *(void *)a1;
    uint64_t v4 = *(uint64_t (**)(uint64_t, const char *, uint64_t))(**(void **)a1 + 8);
    unsigned int v6 = "null";
    uint64_t v3 = 4;
  }
  else
  {
    uint64_t v3 = nlohmann::detail::to_chars<double>(a1 + 16, (uint64_t)(a1 + 80), a2) - (a1 + 16);
    uint64_t v4 = *(uint64_t (**)(uint64_t, const char *, uint64_t))(**(void **)a1 + 8);
    uint64_t v5 = *(void *)a1;
    unsigned int v6 = a1 + 16;
  }
  return v4(v5, v6, v3);
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

char *nlohmann::detail::to_chars<double>(char *a1, uint64_t a2, double a3)
{
  if ((*(void *)&a3 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000) {
    nlohmann::detail::to_chars<double>();
  }
  unsigned int v3 = a1;
  if ((*(void *)&a3 & 0x8000000000000000) != 0)
  {
    a3 = -a3;
    *a1 = 45;
    unsigned int v3 = a1 + 1;
  }
  if (a3 == 0.0)
  {
    *(_WORD *)unsigned int v3 = 11824;
    uint64_t result = v3 + 3;
    v3[2] = 48;
  }
  else
  {
    unint64_t v5 = a2 - (void)v3;
    if (a2 - (uint64_t)v3 <= 16) {
      nlohmann::detail::to_chars<double>();
    }
    uint64_t v6 = 0;
    nlohmann::detail::dtoa_impl::grisu2<double>((uint64_t)v3, (unsigned int *)&v6 + 1, &v6, a3);
    if (SHIDWORD(v6) >= 18) {
      nlohmann::detail::to_chars<double>();
    }
    if (v5 <= 0x15) {
      nlohmann::detail::to_chars<double>();
    }
    if (v5 == 22) {
      nlohmann::detail::to_chars<double>();
    }
    return nlohmann::detail::dtoa_impl::format_buffer((nlohmann::detail::dtoa_impl *)v3, (char *)HIDWORD(v6), (int)v6, -4, 15);
  }
  return result;
}

uint64_t nlohmann::detail::dtoa_impl::grisu2<double>(uint64_t a1, unsigned int *a2, _DWORD *a3, double a4)
{
  if ((*(void *)&a4 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000) {
    nlohmann::detail::dtoa_impl::grisu2<double>();
  }
  if (a4 <= 0.0) {
    nlohmann::detail::dtoa_impl::grisu2<double>();
  }
  nlohmann::detail::dtoa_impl::compute_boundaries<double>((uint64_t)v9, a4);
  return nlohmann::detail::dtoa_impl::grisu2(a1, a2, a3, v9[2], v9[3], v9[0], v9[1], v7, v9[4], (nlohmann::detail::dtoa_impl *)v9[5]);
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
    unint64_t v12 = (char *)this + v11;
    *unint64_t v12 = 101;
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
        void v12[3] = (v17 / 0xAu) | 0x30;
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
    void v12[3] = v15;
    uint64_t v16 = 1;
    return &v12[v16 + 3];
  }
  if ((a3 & 0x80000000) == 0) {
    nlohmann::detail::dtoa_impl::format_buffer();
  }
  unint64_t v9 = (char *)this + v7;
  memmove(v9 + 1, v9, (int)a2 - (unint64_t)v7);
  unsigned char *v9 = 46;
  return (char *)this + v5 + 1;
}

uint64_t nlohmann::detail::dtoa_impl::compute_boundaries<double>@<X0>(uint64_t a1@<X8>, double a2@<D0>)
{
  if ((*(void *)&a2 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000) {
    nlohmann::detail::dtoa_impl::compute_boundaries<double>();
  }
  if (a2 <= 0.0) {
    nlohmann::detail::dtoa_impl::compute_boundaries<double>();
  }
  uint64_t v4 = *(void *)&a2 >> 52;
  uint64_t v5 = *(void *)&a2 & 0xFFFFFFFFFFFFFLL | 0x10000000000000;
  uint64_t v6 = 2 * v5;
  uint64_t v7 = *(void *)&a2 >> 53;
  uint64_t v8 = 4 * v5;
  int v9 = (*(void *)&a2 >> 52) - 1077;
  uint64_t v10 = 0x10000000000000;
  if ((*(void *)&a2 & 0xFFFFFFFFFFFFFLL) != 0)
  {
    uint64_t v8 = 2 * v5;
    int v9 = (*(void *)&a2 >> 52) - 1076;
    uint64_t v10 = *(void *)&a2 & 0xFFFFFFFFFFFFFLL | 0x10000000000000;
  }
  BOOL v11 = v7 == 0;
  if (v7) {
    uint64_t v12 = v8;
  }
  else {
    uint64_t v12 = 2 * v5;
  }
  if (v11) {
    int v9 = (*(void *)&a2 >> 52) - 1076;
  }
  else {
    uint64_t v5 = v10;
  }
  uint64_t v3 = *(void *)&a2 & 0xFFFFFFFFFFFFFLL;
  if (v4)
  {
    unint64_t v13 = (*(void *)&a2 >> 52) - 1076;
  }
  else
  {
    uint64_t v12 = 2 * v3;
    int v9 = -1075;
    unint64_t v13 = 4294966221;
  }
  if (v4)
  {
    unint64_t v14 = (*(void *)&a2 >> 52) - 1075;
  }
  else
  {
    uint64_t v6 = 2 * v3;
    unint64_t v14 = 4294966222;
  }
  if (v4) {
    uint64_t v15 = v5;
  }
  else {
    uint64_t v15 = *(void *)&a2 & 0xFFFFFFFFFFFFFLL;
  }
  uint64_t v24 = v12 - 1;
  int v25 = v9;
  uint64_t v16 = nlohmann::detail::dtoa_impl::diyfp::normalize(v6 | 1, v13);
  int v18 = v17;
  unint64_t v19 = nlohmann::detail::dtoa_impl::diyfp::normalize_to(&v24, v17);
  int v21 = v20;
  uint64_t result = nlohmann::detail::dtoa_impl::diyfp::normalize(v15, v14);
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v23;
  *(void *)(a1 + 16) = v19;
  *(_DWORD *)(a1 + 24) = v21;
  *(void *)(a1 + 32) = v16;
  *(_DWORD *)(a1 + 40) = v18;
  return result;
}

uint64_t nlohmann::detail::dtoa_impl::grisu2(uint64_t a1, unsigned int *a2, _DWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, nlohmann::detail::dtoa_impl *a10)
{
  v31[0] = a4;
  v31[1] = a5;
  v30[0] = a6;
  v30[1] = a7;
  v29[0] = a9;
  v29[1] = a10;
  if (a10 != a5) {
    nlohmann::detail::dtoa_impl::grisu2();
  }
  if (a10 != a7) {
    nlohmann::detail::dtoa_impl::grisu2();
  }
  uint64_t cached_power_for_binary_exponent = nlohmann::detail::dtoa_impl::get_cached_power_for_binary_exponent(a10);
  int v15 = v14;
  uint64_t v27 = cached_power_for_binary_exponent;
  int v28 = v16;
  unint64_t v17 = nlohmann::detail::dtoa_impl::diyfp::mul(v30, &v27);
  uint64_t v19 = v18;
  unint64_t v20 = nlohmann::detail::dtoa_impl::diyfp::mul(v31, &v27);
  unsigned int v22 = v21;
  unint64_t v23 = nlohmann::detail::dtoa_impl::diyfp::mul(v29, &v27);
  *a3 = -v15;
  return nlohmann::detail::dtoa_impl::grisu2_digit_gen(a1, a2, a3, v20 + 1, v22, v17, v19, v25, v23 - 1, v24);
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

uint64_t nlohmann::detail::dtoa_impl::grisu2_digit_gen(uint64_t a1, unsigned int *a2, _DWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unint64_t a9, uint64_t a10)
{
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

uint64_t nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::~serializer(uint64_t a1)
{
  if (*(char *)(a1 + 631) < 0) {
    operator delete(*(void **)(a1 + 608));
  }
  BOOL v2 = *(std::__shared_weak_count **)(a1 + 8);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  return a1;
}

void *std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(void *a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x24C55DC30](v13, a1);
  if (v13[0])
  {
    uint64_t v6 = (uint64_t)a1 + *(void *)(*a1 - 24);
    uint64_t v7 = *(void *)(v6 + 40);
    int v8 = *(_DWORD *)(v6 + 8);
    int v9 = *(_DWORD *)(v6 + 144);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
      unint64_t v10 = std::locale::use_facet(&v14, MEMORY[0x263F8C108]);
      int v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
      std::locale::~locale(&v14);
      *(_DWORD *)(v6 + 144) = v9;
    }
    if ((v8 & 0xB0) == 0x20) {
      uint64_t v11 = a2 + a3;
    }
    else {
      uint64_t v11 = a2;
    }
    if (!std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(v7, a2, v11, a2 + a3, v6, (char)v9)) {
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | 5);
    }
  }
  MEMORY[0x24C55DC40](v13);
  return a1;
}

void sub_2477D9518(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  MEMORY[0x24C55DC40](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(void *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x2477D94F8);
}

void sub_2477D956C(_Unwind_Exception *a1)
{
}

uint64_t std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
{
  uint64_t v6 = a1;
  if (a1)
  {
    uint64_t v11 = *(void *)(a5 + 24);
    if (v11 <= a4 - a2) {
      int64_t v12 = 0;
    }
    else {
      int64_t v12 = v11 - (a4 - a2);
    }
    if (a3 - a2 >= 1 && (*(uint64_t (**)(uint64_t))(*(void *)a1 + 96))(a1) != a3 - a2) {
      return 0;
    }
    if (v12 >= 1)
    {
      std::string::basic_string[abi:ne180100](__p, v12, __c);
      unint64_t v13 = v18 >= 0 ? __p : (void **)__p[0];
      uint64_t v14 = (*(uint64_t (**)(uint64_t, void **, int64_t))(*(void *)v6 + 96))(v6, v13, v12);
      if (v18 < 0) {
        operator delete(__p[0]);
      }
      if (v14 != v12) {
        return 0;
      }
    }
    uint64_t v15 = a4 - a3;
    if (v15 < 1 || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v6 + 96))(v6, a3, v15) == v15) {
      *(void *)(a5 + 24) = 0;
    }
    else {
      return 0;
    }
  }
  return v6;
}

void sub_2477D96EC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_2477D987C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2477D9DE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _Unwind_Exception *exception_object, uint64_t a10, int a11, int a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  _Unwind_Resume(a1);
}

void sub_2477DA6C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_2477DA878(_Unwind_Exception *a1)
{
  unint64_t v4 = v3;

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
  int v8 = *(char **)a1;
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

{
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  char *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;

  unint64_t v4 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  if (v4 == v5 << 6)
  {
    if ((uint64_t)(v4 + 1) < 0) {
      std::vector<double>::__throw_length_error[abi:ne180100]();
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
  int v8 = *(char **)a1;
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

void PerBucketClassification::~PerBucketClassification(PerBucketClassification *this)
{
  BOOL v2 = (void *)*((void *)this + 3);
  if (v2) {
    operator delete(v2);
  }
  uint64_t v3 = *(void **)this;
  if (*(void *)this)
  {
    *((void *)this + 1) = v3;
    operator delete(v3);
  }
}

void beryllium::input_t::~input_t(void **this)
{
  BOOL v2 = this + 3;
  std::vector<std::vector<BOOL>>::__destroy_vector::operator()[abi:ne180100](&v2);
  BOOL v2 = this;
  std::vector<std::vector<double>>::__destroy_vector::operator()[abi:ne180100](&v2);
}

void sub_2477DB0E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t *a43,uint64_t a44,uint64_t a45,uint64_t *a46,uint64_t a47,void *__p,uint64_t a49,int a50,__int16 a51,char a52,char a53,void *a54,uint64_t a55,int a56,__int16 a57,char a58,char a59)
{
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::~basic_json(&a43);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::~basic_json(&a46);
  std::ofstream::~ofstream(&STACK[0x280]);
  if (a53 < 0) {
    operator delete(__p);
  }
  if (a59 < 0) {
    operator delete(a54);
  }

  _Unwind_Resume(a1);
}

double nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[12],int &>@<D0>(uint64_t a1@<X0>, char *a2@<X1>, int *a3@<X2>, uint64_t a4@<X8>)
{
  if (*(unsigned char *)a1)
  {
    if (*(unsigned char *)a1 != 1)
    {
      exception = (nlohmann::detail::exception *)__cxa_allocate_exception(0x20uLL);
      uint64_t v14 = (char *)nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::type_name((char *)a1);
      std::string::basic_string[abi:ne180100]<0>(&v18, v14);
      uint64_t v15 = std::string::insert(&v18, 0, "cannot use emplace() with ");
      long long v16 = *(_OWORD *)&v15->__r_.__value_.__l.__data_;
      v17[2] = *((void *)&v15->__r_.__value_.__l + 2);
      *(_OWORD *)unint64_t v17 = v16;
      v15->__r_.__value_.__l.__size_ = 0;
      v15->__r_.__value_.__r.__words[2] = 0;
      v15->__r_.__value_.__r.__words[0] = 0;
      nlohmann::detail::type_error::create(311, (uint64_t)v17, exception);
    }
  }
  else
  {
    *(unsigned char *)a1 = 1;
    int v8 = operator new(0x18uLL);
    v8[2] = 0;
    v8[1] = 0;
    void *v8 = v8 + 1;
    *(void *)(a1 + 8) = v8;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a1);
  }
  unint64_t v9 = std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__emplace_unique_impl<char const(&)[12],int &>(*(uint64_t ***)(a1 + 8), a2, a3);
  char v11 = v10;
  nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::iter_impl(v17, a1);
  nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::set_begin((unsigned __int8 **)v17);
  v17[1] = v9;
  *(void *)a4 = v17[0];
  *(_OWORD *)(a4 + 24) = *(_OWORD *)&v17[3];
  double result = *(double *)&v17[1];
  *(_OWORD *)(a4 + 8) = *(_OWORD *)&v17[1];
  *(unsigned char *)(a4 + 40) = v11;
  return result;
}

void sub_2477DB3F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a22 < 0)
  {
    operator delete(a17);
    if ((v23 & 1) == 0) {
LABEL_8:
    }
      _Unwind_Resume(a1);
  }
  else if (!v23)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v22);
  goto LABEL_8;
}

double nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[20],nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>@<D0>(uint64_t a1@<X0>, char *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  if (*(unsigned char *)a1)
  {
    if (*(unsigned char *)a1 != 1)
    {
      exception = (nlohmann::detail::exception *)__cxa_allocate_exception(0x20uLL);
      uint64_t v14 = (char *)nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::type_name((char *)a1);
      std::string::basic_string[abi:ne180100]<0>(&v18, v14);
      uint64_t v15 = std::string::insert(&v18, 0, "cannot use emplace() with ");
      long long v16 = *(_OWORD *)&v15->__r_.__value_.__l.__data_;
      v17[2] = *((void *)&v15->__r_.__value_.__l + 2);
      *(_OWORD *)unint64_t v17 = v16;
      v15->__r_.__value_.__l.__size_ = 0;
      v15->__r_.__value_.__r.__words[2] = 0;
      v15->__r_.__value_.__r.__words[0] = 0;
      nlohmann::detail::type_error::create(311, (uint64_t)v17, exception);
    }
  }
  else
  {
    *(unsigned char *)a1 = 1;
    int v8 = operator new(0x18uLL);
    v8[2] = 0;
    v8[1] = 0;
    void *v8 = v8 + 1;
    *(void *)(a1 + 8) = v8;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a1);
  }
  unint64_t v9 = std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__emplace_unique_impl<char const(&)[15],nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>(*(uint64_t ***)(a1 + 8), a2, a3);
  char v11 = v10;
  nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::iter_impl(v17, a1);
  nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::set_begin((unsigned __int8 **)v17);
  v17[1] = v9;
  *(void *)a4 = v17[0];
  *(_OWORD *)(a4 + 24) = *(_OWORD *)&v17[3];
  double result = *(double *)&v17[1];
  *(_OWORD *)(a4 + 8) = *(_OWORD *)&v17[1];
  *(unsigned char *)(a4 + 40) = v11;
  return result;
}

void sub_2477DB5A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a22 < 0)
  {
    operator delete(a17);
    if ((v23 & 1) == 0) {
LABEL_8:
    }
      _Unwind_Resume(a1);
  }
  else if (!v23)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v22);
  goto LABEL_8;
}

double nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[20],float>@<D0>(uint64_t a1@<X0>, char *a2@<X1>, float *a3@<X2>, uint64_t a4@<X8>)
{
  if (*(unsigned char *)a1)
  {
    if (*(unsigned char *)a1 != 1)
    {
      exception = (nlohmann::detail::exception *)__cxa_allocate_exception(0x20uLL);
      uint64_t v14 = (char *)nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::type_name((char *)a1);
      std::string::basic_string[abi:ne180100]<0>(&v18, v14);
      uint64_t v15 = std::string::insert(&v18, 0, "cannot use emplace() with ");
      long long v16 = *(_OWORD *)&v15->__r_.__value_.__l.__data_;
      v17[2] = *((void *)&v15->__r_.__value_.__l + 2);
      *(_OWORD *)unint64_t v17 = v16;
      v15->__r_.__value_.__l.__size_ = 0;
      v15->__r_.__value_.__r.__words[2] = 0;
      v15->__r_.__value_.__r.__words[0] = 0;
      nlohmann::detail::type_error::create(311, (uint64_t)v17, exception);
    }
  }
  else
  {
    *(unsigned char *)a1 = 1;
    int v8 = operator new(0x18uLL);
    v8[2] = 0;
    v8[1] = 0;
    void *v8 = v8 + 1;
    *(void *)(a1 + 8) = v8;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a1);
  }
  unint64_t v9 = std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__emplace_unique_impl<char const(&)[20],float>(*(uint64_t ***)(a1 + 8), a2, a3);
  char v11 = v10;
  nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::iter_impl(v17, a1);
  nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::set_begin((unsigned __int8 **)v17);
  v17[1] = v9;
  *(void *)a4 = v17[0];
  *(_OWORD *)(a4 + 24) = *(_OWORD *)&v17[3];
  double result = *(double *)&v17[1];
  *(_OWORD *)(a4 + 8) = *(_OWORD *)&v17[1];
  *(unsigned char *)(a4 + 40) = v11;
  return result;
}

void sub_2477DB750(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a22 < 0)
  {
    operator delete(a17);
    if ((v23 & 1) == 0) {
LABEL_8:
    }
      _Unwind_Resume(a1);
  }
  else if (!v23)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v22);
  goto LABEL_8;
}

double nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[15],float &>@<D0>(uint64_t a1@<X0>, char *a2@<X1>, float *a3@<X2>, uint64_t a4@<X8>)
{
  if (*(unsigned char *)a1)
  {
    if (*(unsigned char *)a1 != 1)
    {
      exception = (nlohmann::detail::exception *)__cxa_allocate_exception(0x20uLL);
      uint64_t v14 = (char *)nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::type_name((char *)a1);
      std::string::basic_string[abi:ne180100]<0>(&v18, v14);
      uint64_t v15 = std::string::insert(&v18, 0, "cannot use emplace() with ");
      long long v16 = *(_OWORD *)&v15->__r_.__value_.__l.__data_;
      v17[2] = *((void *)&v15->__r_.__value_.__l + 2);
      *(_OWORD *)unint64_t v17 = v16;
      v15->__r_.__value_.__l.__size_ = 0;
      v15->__r_.__value_.__r.__words[2] = 0;
      v15->__r_.__value_.__r.__words[0] = 0;
      nlohmann::detail::type_error::create(311, (uint64_t)v17, exception);
    }
  }
  else
  {
    *(unsigned char *)a1 = 1;
    int v8 = operator new(0x18uLL);
    v8[2] = 0;
    v8[1] = 0;
    void *v8 = v8 + 1;
    *(void *)(a1 + 8) = v8;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a1);
  }
  unint64_t v9 = std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__emplace_unique_impl<char const(&)[20],float>(*(uint64_t ***)(a1 + 8), a2, a3);
  char v11 = v10;
  nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::iter_impl(v17, a1);
  nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::set_begin((unsigned __int8 **)v17);
  v17[1] = v9;
  *(void *)a4 = v17[0];
  *(_OWORD *)(a4 + 24) = *(_OWORD *)&v17[3];
  double result = *(double *)&v17[1];
  *(_OWORD *)(a4 + 8) = *(_OWORD *)&v17[1];
  *(unsigned char *)(a4 + 40) = v11;
  return result;
}

void sub_2477DB900(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a22 < 0)
  {
    operator delete(a17);
    if ((v23 & 1) == 0) {
LABEL_8:
    }
      _Unwind_Resume(a1);
  }
  else if (!v23)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v22);
  goto LABEL_8;
}

double nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[21],ABUnavailabilityReason>@<D0>(uint64_t a1@<X0>, char *a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  if (*(unsigned char *)a1)
  {
    if (*(unsigned char *)a1 != 1)
    {
      exception = (nlohmann::detail::exception *)__cxa_allocate_exception(0x20uLL);
      uint64_t v14 = (char *)nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::type_name((char *)a1);
      std::string::basic_string[abi:ne180100]<0>(&v18, v14);
      uint64_t v15 = std::string::insert(&v18, 0, "cannot use emplace() with ");
      long long v16 = *(_OWORD *)&v15->__r_.__value_.__l.__data_;
      v17[2] = *((void *)&v15->__r_.__value_.__l + 2);
      *(_OWORD *)unint64_t v17 = v16;
      v15->__r_.__value_.__l.__size_ = 0;
      v15->__r_.__value_.__r.__words[2] = 0;
      v15->__r_.__value_.__r.__words[0] = 0;
      nlohmann::detail::type_error::create(311, (uint64_t)v17, exception);
    }
  }
  else
  {
    *(unsigned char *)a1 = 1;
    int v8 = operator new(0x18uLL);
    v8[2] = 0;
    v8[1] = 0;
    void *v8 = v8 + 1;
    *(void *)(a1 + 8) = v8;
    nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(a1);
  }
  unint64_t v9 = std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__emplace_unique_impl<char const(&)[21],ABUnavailabilityReason>(*(uint64_t ***)(a1 + 8), a2, a3);
  char v11 = v10;
  nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::iter_impl(v17, a1);
  nlohmann::detail::iter_impl<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::set_begin((unsigned __int8 **)v17);
  v17[1] = v9;
  *(void *)a4 = v17[0];
  *(_OWORD *)(a4 + 24) = *(_OWORD *)&v17[3];
  double result = *(double *)&v17[1];
  *(_OWORD *)(a4 + 8) = *(_OWORD *)&v17[1];
  *(unsigned char *)(a4 + 40) = v11;
  return result;
}

void sub_2477DBAB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a22 < 0)
  {
    operator delete(a17);
    if ((v23 & 1) == 0) {
LABEL_8:
    }
      _Unwind_Resume(a1);
  }
  else if (!v23)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v22);
  goto LABEL_8;
}

void sub_2477DC064(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  _Unwind_Resume(a1);
}

void std::__throw_bad_variant_access[abi:ne180100]()
{
  exception = __cxa_allocate_exception(8uLL);
  void *exception = MEMORY[0x263F8C3A8] + 16;
  __cxa_throw(exception, MEMORY[0x263F8C1F8], (void (*)(void *))std::bad_variant_access::~bad_variant_access);
}

uint64_t **std::__variant_detail::__visitation::__base::__dispatcher<0ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<beryllium::overloaded<-[ABAfibBurdenAnalyzer processResults:withAlgsAnalytics:]::$_0,-[ABAfibBurdenAnalyzer processResults:withAlgsAnalytics:]::$_1>> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,beryllium::output_t,beryllium::ReasonForNoOutput> &>(uint64_t **result, int *a2)
{
  uint64_t v2 = **result;
  int v3 = *a2;
  if (!*(unsigned char *)(v2 + 4)) {
    *(unsigned char *)(v2 + 4) = 1;
  }
  *(_DWORD *)uint64_t v2 = v3;
  return result;
}

void std::__variant_detail::__visitation::__base::__dispatcher<1ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<beryllium::overloaded<-[ABAfibBurdenAnalyzer processResults:withAlgsAnalytics:]::$_0,-[ABAfibBurdenAnalyzer processResults:withAlgsAnalytics:]::$_1>> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,beryllium::output_t,beryllium::ReasonForNoOutput> &>(uint64_t *a1, _DWORD *a2)
{
  uint64_t v2 = *a1;
  switch(*a2)
  {
    case 0:
      uint64_t v3 = *(void *)(v2 + 8);
      *(void *)uint64_t v3 = 1;
      *(unsigned char *)(v3 + 8) = 1;
      break;
    case 1:
      uint64_t v4 = *(void *)(v2 + 8);
      uint64_t v5 = 2;
      goto LABEL_5;
    case 2:
      uint64_t v4 = *(void *)(v2 + 8);
      uint64_t v5 = 3;
LABEL_5:
      *(void *)uint64_t v4 = v5;
      *(unsigned char *)(v4 + 8) = 1;
      break;
    case 3:
      uint64_t v6 = *(void *)(v2 + 8);
      if (*(unsigned char *)(v6 + 8)) {
        *(unsigned char *)(v6 + 8) = 0;
      }
      unint64_t v7 = ab_get_framework_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        std::__variant_detail::__visitation::__base::__dispatcher<1ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<beryllium::overloaded<-[ABAfibBurdenAnalyzer processResults:withAlgsAnalytics:]::$_0,-[ABAfibBurdenAnalyzer processResults:withAlgsAnalytics:]::$_1>> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,beryllium::output_t,beryllium::ReasonForNoOutput> &>(v7);
      }

      break;
    default:
      return;
  }
}

void std::__throw_bad_optional_access[abi:ne180100]()
{
  exception = __cxa_allocate_exception(8uLL);
  void *exception = MEMORY[0x263F8C3B0] + 16;
  __cxa_throw(exception, MEMORY[0x263F8C200], MEMORY[0x263F8C088]);
}

void std::vector<std::vector<BOOL>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    std::vector<std::vector<BOOL>>::__clear[abi:ne180100]((uint64_t *)v2);
    uint64_t v3 = **a1;
    operator delete(v3);
  }
}

void std::vector<std::vector<BOOL>>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2 = *a1;
  for (uint64_t i = a1[1]; i != v2; i -= 24)
  {
    uint64_t v5 = *(void **)(i - 24);
    uint64_t v4 = v5;
    if (v5) {
      operator delete(v4);
    }
  }
  a1[1] = v2;
}

void std::vector<BOOL>::reserve(char **a1, unint64_t a2)
{
  if (a2 > (void)a1[2] << 6)
  {
    if ((a2 & 0x8000000000000000) != 0) {
      std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
    }
    char v10 = 0;
    long long v11 = 0uLL;
    std::vector<BOOL>::__vallocate[abi:ne180100](&v10, a2);
    unint64_t v3 = (unint64_t)a1[1];
    int v8 = *a1;
    int v9 = 0;
    uint64_t v6 = &v8[8 * (v3 >> 6)];
    int v7 = v3 & 0x3F;
    std::vector<BOOL>::__construct_at_end<std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>>(&v10, (uint64_t)&v8, (uint64_t)&v6, v3);
    uint64_t v4 = *a1;
    *a1 = v10;
    char v10 = v4;
    long long v5 = *(_OWORD *)(a1 + 1);
    *(_OWORD *)(a1 + 1) = v11;
    long long v11 = v5;
    if (v4) {
      operator delete(v4);
    }
  }
}

{
  unint64_t v3;
  char *v4;
  long long v5;
  char *v6;
  int v7;
  char *v8;
  int v9;
  char *v10;
  long long v11;

  if (a2 > (void)a1[2] << 6)
  {
    if ((a2 & 0x8000000000000000) != 0) {
      std::vector<double>::__throw_length_error[abi:ne180100]();
    }
    char v10 = 0;
    long long v11 = 0uLL;
    std::vector<BOOL>::__vallocate[abi:ne180100](&v10, a2);
    unint64_t v3 = (unint64_t)a1[1];
    int v8 = *a1;
    int v9 = 0;
    uint64_t v6 = &v8[8 * (v3 >> 6)];
    int v7 = v3 & 0x3F;
    std::vector<BOOL>::__construct_at_end<std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>>(&v10, (uint64_t)&v8, (uint64_t)&v6, v3);
    uint64_t v4 = *a1;
    *a1 = v10;
    char v10 = v4;
    long long v5 = *(_OWORD *)(a1 + 1);
    *(_OWORD *)(a1 + 1) = v11;
    long long v11 = v5;
    if (v4) {
      operator delete(v4);
    }
  }
}

void sub_2477DC470(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p)
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
  double result = std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)(a1 + 2), ((unint64_t)(a2 - 1) >> 6) + 1);
  *a1 = result;
  a1[1] = 0;
  a1[2] = v4;
  return result;
}

{
  void *result;
  uint64_t v4;

  if (a2 < 0) {
    std::vector<double>::__throw_length_error[abi:ne180100]();
  }
  double result = std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)(a1 + 2), ((unint64_t)(a2 - 1) >> 6) + 1);
  *a1 = result;
  a1[1] = 0;
  a1[2] = v4;
  return result;
}

void std::vector<BOOL>::__construct_at_end<std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>>(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
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
  std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>,0>(&v16, &v14, &v12, (uint64_t)&v11);
}

void std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>,0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  int v5 = *((_DWORD *)a1 + 2);
  uint64_t v6 = *a2;
  int v7 = *((_DWORD *)a2 + 2);
  uint64_t v16 = *a1;
  int v17 = v5;
  uint64_t v14 = v6;
  int v15 = v7;
  int v8 = *((_DWORD *)a3 + 2);
  uint64_t v12 = *a3;
  int v13 = v8;
  std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>>((uint64_t)&v16, (uint64_t)&v14, (uint64_t)&v12, (uint64_t)&v18);
  int v9 = v19;
  uint64_t v10 = v20;
  int v11 = v21;
  *(void *)a4 = v18;
  *(_DWORD *)(a4 + 8) = v9;
  *(void *)(a4 + 16) = v10;
  *(_DWORD *)(a4 + 24) = v11;
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

uint64_t std::vector<std::vector<BOOL>>::__push_back_slow_path<std::vector<BOOL> const&>(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0xAAAAAAAAAAAAAAALL) {
    std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5) {
    unint64_t v5 = 2 * v8;
  }
  if (v8 >= 0x555555555555555) {
    unint64_t v9 = 0xAAAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v9 = v5;
  }
  int v17 = a1 + 2;
  if (v9) {
    uint64_t v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<double>>>(v7, v9);
  }
  else {
    uint64_t v10 = 0;
  }
  int v13 = v10;
  uint64_t v14 = &v10[24 * v4];
  uint64_t v16 = &v10[24 * v9];
  std::vector<BOOL>::vector(v14, a2);
  int v15 = v14 + 24;
  std::vector<std::vector<BOOL>>::__swap_out_circular_buffer(a1, &v13);
  uint64_t v11 = a1[1];
  std::__split_buffer<std::vector<BOOL>>::~__split_buffer(&v13);
  return v11;
}

void sub_2477DC7C8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<std::vector<BOOL>>::~__split_buffer((void **)va);
  _Unwind_Resume(a1);
}

void *std::vector<BOOL>::vector(void *a1, uint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  uint64_t v4 = *(void *)(a2 + 8);
  if (v4)
  {
    std::vector<BOOL>::__vallocate[abi:ne180100](a1, v4);
    std::vector<BOOL>::__construct_at_end<std::__bit_iterator<std::vector<BOOL>,true,0ul>,std::__bit_iterator<std::vector<BOOL>,true,0ul>>(a1, *(void **)a2, 0, (void *)(*(void *)a2 + 8 * (*(void *)(a2 + 8) >> 6)), *(void *)(a2 + 8) & 0x3F, *(void *)(a2 + 8));
  }
  return a1;
}

{
  uint64_t v4;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  uint64_t v4 = *(void *)(a2 + 8);
  if (v4)
  {
    std::vector<BOOL>::__vallocate[abi:ne180100](a1, v4);
    std::vector<BOOL>::__construct_at_end<std::__bit_iterator<std::vector<BOOL>,true,0ul>,std::__bit_iterator<std::vector<BOOL>,true,0ul>>(a1, *(void **)a2, 0, (void *)(*(void *)a2 + 8 * (*(void *)(a2 + 8) >> 6)), *(void *)(a2 + 8) & 0x3F, *(void *)(a2 + 8));
  }
  return a1;
}

void std::vector<BOOL>::__construct_at_end<std::__bit_iterator<std::vector<BOOL>,true,0ul>,std::__bit_iterator<std::vector<BOOL>,true,0ul>>(void *a1, void *a2, unint64_t a3, void *a4, int a5, uint64_t a6)
{
  unint64_t v6 = a1[1];
  unint64_t v7 = v6 + a6;
  a1[1] = v6 + a6;
  if (!v6 || ((v7 - 1) ^ (v6 - 1)) >= 0x40)
  {
    if (v7 >= 0x41) {
      unint64_t v8 = (v7 - 1) >> 6;
    }
    else {
      unint64_t v8 = 0;
    }
    *(void *)(*a1 + 8 * v8) = 0;
  }
  uint64_t v9 = *a1 + 8 * (v6 >> 6);
  int v10 = v6 & 0x3F;
  std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::__bit_iterator<std::vector<BOOL>,true,0ul>,std::__bit_iterator<std::vector<BOOL>,true,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>>(a2, a3, a4, a5, (uint64_t)&v9, (uint64_t)v11);
}

void std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::__bit_iterator<std::vector<BOOL>,true,0ul>,std::__bit_iterator<std::vector<BOOL>,true,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>>(void *a1@<X1>, unint64_t a2@<X2>, void *a3@<X3>, int a4@<W4>, uint64_t a5@<X5>, uint64_t a6@<X8>)
{
  LODWORD(v6) = a2;
  unint64_t v7 = *(uint64_t **)a5;
  int v8 = *(_DWORD *)(a5 + 8);
  if (a1 != a3 || a2 != a4)
  {
    do
    {
      uint64_t v9 = 1 << v8;
      if ((*a1 >> a2)) {
        uint64_t v10 = *v7 | v9;
      }
      else {
        uint64_t v10 = *v7 & ~v9;
      }
      *unint64_t v7 = v10;
      BOOL v11 = v6 == 63;
      BOOL v12 = v6 == 63;
      uint64_t v6 = (a2 + 1);
      if (v11) {
        uint64_t v6 = 0;
      }
      if (v8 == 63)
      {
        int v8 = 0;
        *(void *)a5 = ++v7;
      }
      else
      {
        ++v8;
      }
      a1 += v12;
      a2 = v6 | a2 & 0xFFFFFFFF00000000;
      *(_DWORD *)(a5 + 8) = v8;
    }
    while (a1 != a3 || v6 != a4);
    a1 = a3;
  }
  *(void *)a6 = a1;
  *(void *)(a6 + 8) = a2;
  *(void *)(a6 + 16) = v7;
  *(_DWORD *)(a6 + 24) = v8;
}

uint64_t std::vector<std::vector<BOOL>>::__swap_out_circular_buffer(uint64_t *a1, void *a2)
{
  uint64_t result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::vector<BOOL>>,std::reverse_iterator<std::vector<BOOL>*>,std::reverse_iterator<std::vector<BOOL>*>,std::reverse_iterator<std::vector<BOOL>*>>((uint64_t)(a1 + 2), a1[1], (void *)a1[1], *a1, (void *)*a1, a2[1], a2[1]);
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

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::vector<BOOL>>,std::reverse_iterator<std::vector<BOOL>*>,std::reverse_iterator<std::vector<BOOL>*>,std::reverse_iterator<std::vector<BOOL>*>>(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v14 = a6;
  *((void *)&v14 + 1) = a7;
  long long v13 = v14;
  v11[0] = a1;
  v11[1] = &v13;
  v11[2] = &v14;
  if (a3 == a5)
  {
    uint64_t v9 = a6;
  }
  else
  {
    do
    {
      uint64_t v8 = *(a3 - 3);
      a3 -= 3;
      *(void *)(v7 - 24) = v8;
      *(void *)(v7 - 16) = a3[1];
      *(void *)(v7 - 8) = a3[2];
      *a3 = 0;
      a3[1] = 0;
      a3[2] = 0;
      uint64_t v7 = *((void *)&v14 + 1) - 24;
      *((void *)&v14 + 1) -= 24;
    }
    while (a3 != a5);
    uint64_t v9 = v14;
  }
  char v12 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<BOOL>>,std::reverse_iterator<std::vector<BOOL>*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v11);
  return v9;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<BOOL>>,std::reverse_iterator<std::vector<BOOL>*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<BOOL>>,std::reverse_iterator<std::vector<BOOL>*>>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<BOOL>>,std::reverse_iterator<std::vector<BOOL>*>>::operator()[abi:ne180100](uint64_t a1)
{
  int v1 = *(void ***)(*(void *)(a1 + 16) + 8);
  uint64_t v2 = *(void ***)(*(void *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    if (*v1) {
      operator delete(*v1);
    }
    v1 += 3;
  }
}

void **std::__split_buffer<std::vector<BOOL>>::~__split_buffer(void **a1)
{
  if (*a1) {
    operator delete(*a1);
  }
  return a1;
}

void std::__split_buffer<std::vector<BOOL>>::clear[abi:ne180100](uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v1 = *(void *)(a1 + 16);
  while (v1 != v2)
  {
    uint64_t v5 = *(void **)(v1 - 24);
    v1 -= 24;
    uint64_t v4 = v5;
    *(void *)(a1 + 16) = v1;
    if (v5)
    {
      operator delete(v4);
      uint64_t v1 = *(void *)(a1 + 16);
    }
  }
}

uint64_t *std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__emplace_unique_impl<char const(&)[12],int &>(uint64_t **a1, char *a2, int *a3)
{
  std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__construct_node<char const(&)[12],int &>((uint64_t)a1, a2, a3, (uint64_t)&__p);
  uint64_t v4 = (uint64_t **)std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__find_equal<std::string>((uint64_t)a1, &v8, (const void **)__p + 4);
  uint64_t v5 = *v4;
  if (*v4)
  {
    uint64_t v6 = __p;
    std::string __p = 0;
    if (v6) {
      std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void *>>>::operator()[abi:ne180100]((uint64_t)&v10, v6);
    }
  }
  else
  {
    std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__insert_node_at(a1, v8, v4, (uint64_t *)__p);
    return (uint64_t *)__p;
  }
  return v5;
}

void sub_2477DCC1C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void *>>>::operator()[abi:ne180100]((uint64_t)&a11, __p);
  }
  _Unwind_Resume(exception_object);
}

void *std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__construct_node<char const(&)[12],int &>@<X0>(uint64_t a1@<X0>, char *a2@<X1>, int *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7 = a1 + 8;
  uint64_t v8 = operator new(0x48uLL);
  *(void *)a4 = v8;
  *(void *)(a4 + 8) = v7;
  *(unsigned char *)(a4 + 16) = 0;
  uint64_t result = std::pair<std::string const,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::pair[abi:ne180100]<char const(&)[12],int &,0>(v8 + 4, a2, a3);
  *(unsigned char *)(a4 + 16) = 1;
  return result;
}

void sub_2477DCCB0(_Unwind_Exception *a1)
{
  void *v1 = 0;
  std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

void *std::pair<std::string const,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::pair[abi:ne180100]<char const(&)[12],int &,0>(void *a1, char *a2, int *a3)
{
  uint64_t v5 = std::string::basic_string[abi:ne180100]<0>(a1, a2);
  v5[4] = 0;
  uint64_t v6 = *a3;
  *((unsigned char *)v5 + 24) = 5;
  uint64_t v7 = (uint64_t)(v5 + 3);
  v5[4] = v6;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)(v5 + 3));
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v7);
  return a1;
}

uint64_t *std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__emplace_unique_impl<char const(&)[20],float>(uint64_t **a1, char *a2, float *a3)
{
  std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__construct_node<char const(&)[20],float>((uint64_t)a1, a2, a3, (uint64_t)&__p);
  uint64_t v4 = (uint64_t **)std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__find_equal<std::string>((uint64_t)a1, &v8, (const void **)__p + 4);
  uint64_t v5 = *v4;
  if (*v4)
  {
    uint64_t v6 = __p;
    std::string __p = 0;
    if (v6) {
      std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void *>>>::operator()[abi:ne180100]((uint64_t)&v10, v6);
    }
  }
  else
  {
    std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__insert_node_at(a1, v8, v4, (uint64_t *)__p);
    return (uint64_t *)__p;
  }
  return v5;
}

void sub_2477DCDA8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void *>>>::operator()[abi:ne180100]((uint64_t)&a11, __p);
  }
  _Unwind_Resume(exception_object);
}

void *std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__construct_node<char const(&)[20],float>@<X0>(uint64_t a1@<X0>, char *a2@<X1>, float *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7 = a1 + 8;
  uint64_t v8 = operator new(0x48uLL);
  *(void *)a4 = v8;
  *(void *)(a4 + 8) = v7;
  *(unsigned char *)(a4 + 16) = 0;
  uint64_t result = std::pair<std::string const,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::pair[abi:ne180100]<char const(&)[20],float,0>(v8 + 4, a2, a3);
  *(unsigned char *)(a4 + 16) = 1;
  return result;
}

void sub_2477DCE3C(_Unwind_Exception *a1)
{
  void *v1 = 0;
  std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

void *std::pair<std::string const,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::pair[abi:ne180100]<char const(&)[20],float,0>(void *a1, char *a2, float *a3)
{
  uint64_t v5 = std::string::basic_string[abi:ne180100]<0>(a1, a2);
  v5[4] = 0;
  double v6 = *a3;
  *((unsigned char *)v5 + 24) = 7;
  uint64_t v7 = (uint64_t)(v5 + 3);
  *((double *)v5 + 4) = v6;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)(v5 + 3));
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v7);
  return a1;
}

uint64_t *std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__emplace_unique_impl<char const(&)[21],ABUnavailabilityReason>(uint64_t **a1, char *a2, uint64_t *a3)
{
  std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__construct_node<char const(&)[21],ABUnavailabilityReason>((uint64_t)a1, a2, a3, (uint64_t)&__p);
  uint64_t v4 = (uint64_t **)std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__find_equal<std::string>((uint64_t)a1, &v8, (const void **)__p + 4);
  uint64_t v5 = *v4;
  if (*v4)
  {
    double v6 = __p;
    std::string __p = 0;
    if (v6) {
      std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void *>>>::operator()[abi:ne180100]((uint64_t)&v10, v6);
    }
  }
  else
  {
    std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__insert_node_at(a1, v8, v4, (uint64_t *)__p);
    return (uint64_t *)__p;
  }
  return v5;
}

void sub_2477DCF38(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void *>>>::operator()[abi:ne180100]((uint64_t)&a11, __p);
  }
  _Unwind_Resume(exception_object);
}

void *std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__construct_node<char const(&)[21],ABUnavailabilityReason>@<X0>(uint64_t a1@<X0>, char *a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7 = a1 + 8;
  uint64_t v8 = operator new(0x48uLL);
  *(void *)a4 = v8;
  *(void *)(a4 + 8) = v7;
  *(unsigned char *)(a4 + 16) = 0;
  uint64_t result = std::pair<std::string const,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::pair[abi:ne180100]<char const(&)[21],ABUnavailabilityReason,0>(v8 + 4, a2, a3);
  *(unsigned char *)(a4 + 16) = 1;
  return result;
}

void sub_2477DCFCC(_Unwind_Exception *a1)
{
  void *v1 = 0;
  std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

void *std::pair<std::string const,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::pair[abi:ne180100]<char const(&)[21],ABUnavailabilityReason,0>(void *a1, char *a2, uint64_t *a3)
{
  uint64_t v5 = std::string::basic_string[abi:ne180100]<0>(a1, a2);
  v5[4] = 0;
  uint64_t v6 = *a3;
  *((unsigned char *)v5 + 24) = 5;
  uint64_t v7 = (uint64_t)(v5 + 3);
  v5[4] = v6;
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)(v5 + 3));
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant(v7);
  return a1;
}

uint64_t beryllium::process(beryllium *this, core_analytics_t *a2, core_analytics_t *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (algs_get_log())
  {
    log = algs_get_log();
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315138;
      uint64_t v9 = "1.0.8.2";
      _os_log_impl(&dword_2477CF000, log, OS_LOG_TYPE_DEFAULT, "Beryllium Alg Version: %s", (uint8_t *)&v8, 0xCu);
    }
  }
  beryllium::BerylliumProcessor::BerylliumProcessor((beryllium::BerylliumProcessor *)&v8);
  uint64_t v6 = beryllium::BerylliumProcessor::beryllium_process((beryllium::BerylliumProcessor *)&v8, this, a2);
  beryllium::BerylliumProcessor::~BerylliumProcessor((beryllium::BerylliumProcessor *)&v8);
  return v6;
}

void sub_2477DD15C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void beryllium::BerylliumProcessor::~BerylliumProcessor(beryllium::BerylliumProcessor *this)
{
  uint64_t v2 = (void *)*((void *)this + 27);
  if (v2) {
    operator delete(v2);
  }
  uint64_t v3 = (void *)*((void *)this + 24);
  if (v3) {
    operator delete(v3);
  }
  uint64_t v4 = (void *)*((void *)this + 21);
  if (v4)
  {
    *((void *)this + 22) = v4;
    operator delete(v4);
  }
  uint64_t v5 = (void *)*((void *)this + 18);
  if (v5) {
    operator delete(v5);
  }
  uint64_t v6 = (void *)*((void *)this + 15);
  if (v6)
  {
    *((void *)this + 16) = v6;
    operator delete(v6);
  }
  uint64_t v7 = (void *)*((void *)this + 12);
  if (v7) {
    operator delete(v7);
  }
  int v8 = (void *)*((void *)this + 9);
  if (v8)
  {
    *((void *)this + 10) = v8;
    operator delete(v8);
  }
  uint64_t v9 = (void *)*((void *)this + 6);
  if (v9) {
    operator delete(v9);
  }
  uint64_t v10 = (void *)*((void *)this + 3);
  if (v10)
  {
    *((void *)this + 4) = v10;
    operator delete(v10);
  }
  BOOL v11 = *(void **)this;
  if (*(void *)this)
  {
    *((void *)this + 1) = v11;
    operator delete(v11);
  }
}

uint64_t algs_get_log()
{
  if (algs_get_log_onceToken != -1) {
    dispatch_once(&algs_get_log_onceToken, &__block_literal_global_1);
  }
  return algs_get_log_log;
}

os_log_t __algs_get_log_block_invoke()
{
  os_log_t result = os_log_create("com.apple.Health.AFibBurden", "hid-algs-burden-computation");
  algs_get_log_log = (uint64_t)result;
  return result;
}

double beryllium::BerylliumProcessor::BerylliumProcessor(beryllium::BerylliumProcessor *this)
{
  double result = 0.0;
  *((_OWORD *)this + 13) = 0u;
  *((_OWORD *)this + 14) = 0u;
  *((_OWORD *)this + 11) = 0u;
  *((_OWORD *)this + 12) = 0u;
  *((_OWORD *)this + 9) = 0u;
  *((_OWORD *)this + 10) = 0u;
  *((_OWORD *)this + 7) = 0u;
  *((_OWORD *)this + 8) = 0u;
  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 6) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *((_OWORD *)this + 4) = 0u;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *(_OWORD *)this = 0u;
  return result;
}

{
  double result;

  double result = 0.0;
  *((_OWORD *)this + 13) = 0u;
  *((_OWORD *)this + 14) = 0u;
  *((_OWORD *)this + 11) = 0u;
  *((_OWORD *)this + 12) = 0u;
  *((_OWORD *)this + 9) = 0u;
  *((_OWORD *)this + 10) = 0u;
  *((_OWORD *)this + 7) = 0u;
  *((_OWORD *)this + 8) = 0u;
  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 6) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *((_OWORD *)this + 4) = 0u;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *(_OWORD *)this = 0u;
  return result;
}

unint64_t beryllium::BerylliumProcessor::check_input_validity(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  uint64_t v3 = a2[1];
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((v3 - *a2) >> 3);
  uint64_t v5 = a2[3];
  if (v4 == 0xAAAAAAAAAAAAAAABLL * ((a2[4] - v5) >> 3))
  {
    if (v3 == v2)
    {
      unint64_t v6 = 0;
LABEL_12:
      uint64_t v9 = 0;
    }
    else
    {
      if (v4 <= 1) {
        unint64_t v6 = 1;
      }
      else {
        unint64_t v6 = 0xAAAAAAAAAAAAAAABLL * ((v3 - *a2) >> 3);
      }
      uint64_t v7 = (uint64_t *)(v5 + 8);
      int v8 = (void *)(v2 + 8);
      uint64_t v9 = 3;
      while (1)
      {
        uint64_t v10 = *v7;
        v7 += 3;
        if (v10 != (uint64_t)(*v8 - *(v8 - 1)) >> 3) {
          break;
        }
        v8 += 3;
        if (!--v6) {
          goto LABEL_12;
        }
      }
      unint64_t v6 = 0x100000000;
    }
  }
  else
  {
    unint64_t v6 = 0x100000000;
    uint64_t v9 = 3;
  }
  return v9 | v6;
}

uint64_t beryllium::BerylliumProcessor::check_min_tacho_condition(uint64_t a1, uint64_t *a2)
{
  unint64_t v3 = beryllium::BerylliumProcessor::check_input_validity(a1, a2);
  if ((v3 & 0xFF00000000) != 0)
  {
    uint64_t v4 = v3 & 0xFFFFFF00;
    uint64_t v5 = v3;
LABEL_3:
    uint64_t v6 = 0x100000000;
    return v5 | v6 | v4;
  }
  uint64_t v8 = *a2;
  uint64_t v4 = a2[1] - *a2;
  if (!v4)
  {
    uint64_t v5 = 0;
    goto LABEL_3;
  }
  int v9 = 0;
  unint64_t v10 = v4 / 24;
  if (v10 <= 1) {
    uint64_t v11 = 1;
  }
  else {
    uint64_t v11 = v10;
  }
  char v12 = (double **)(v8 + 8);
  int v13 = 1;
  uint64_t v14 = v11;
  do
  {
    int v15 = *(v12 - 1);
    if (*v12 != v15)
    {
      v9 += (unint64_t)((char *)*v12 - (char *)v15) >> 3;
      if (*(*v12 - 1) - *v15 > 14400.0) {
        int v13 = 0;
      }
    }
    v12 += 3;
    --v14;
  }
  while (v14);
  uint64_t v5 = v9 > 69;
  if (v9 < 70)
  {
    uint64_t v4 = 0;
    goto LABEL_3;
  }
  unsigned int v16 = 0;
  int v17 = (void *)(v8 + 8);
  do
  {
    if (*v17 - *(v17 - 1) > 0x20uLL) {
      ++v16;
    }
    v17 += 3;
    --v11;
  }
  while (v11);
  BOOL v18 = v10 < 0x14;
  BOOL v19 = (v13 & v18) == 0;
  if ((v13 & v18) != 0) {
    uint64_t v20 = 0x100000000;
  }
  else {
    uint64_t v20 = 0;
  }
  if (v19) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = 2;
  }
  if (v16 >= 5) {
    uint64_t v6 = v20;
  }
  else {
    uint64_t v6 = 0x100000000;
  }
  if (v16 < 5) {
    uint64_t v5 = 1;
  }
  uint64_t v4 = 0;
  return v5 | v6 | v4;
}

uint64_t beryllium::BerylliumProcessor::interpolate_Tachograms_and_calc_AFibBurden(beryllium::BerylliumProcessor *this, const beryllium::input_t *a2, output_t *a3)
{
  uint64_t v143 = *MEMORY[0x263EF8340];
  v135 = 0;
  v136 = 0;
  v137 = 0;
  std::string __p = 0;
  v133 = 0;
  v134 = 0;
  uint64_t v6 = beryllium::BerylliumProcessor::check_min_tacho_condition((uint64_t)this, (uint64_t *)a2);
  if ((v6 & 0xFF00000000) != 0)
  {
    uint64_t v7 = v6 & 0xFFFFFF00;
    uint64_t v8 = v6;
    uint64_t v9 = 0x100000000;
    goto LABEL_137;
  }
  uint64_t v10 = *(void *)a2;
  if (*((void *)a2 + 1) != *(void *)a2)
  {
    uint64_t v11 = 0;
    unint64_t v12 = 0;
    do
    {
      std::vector<double>::__insert_with_size[abi:ne180100]<std::__wrap_iter<double const*>,std::__wrap_iter<double const*>>((uint64_t)this + 168, *((void *)this + 22), *(char **)(v10 + v11), *(char **)(v10 + v11 + 8), (uint64_t)(*(void *)(v10 + v11 + 8) - *(void *)(v10 + v11)) >> 3);
      unint64_t v13 = *((void *)this + 25);
      unint64_t v14 = *((void *)this + 24) + 8 * (v13 >> 6);
      unsigned int v15 = v13 & 0x3F;
      uint64_t v16 = *((void *)a2 + 3) + v11;
      std::vector<BOOL>::__insert_with_size[abi:ne180100]<std::__bit_iterator<std::vector<BOOL>,true,0ul>,std::__bit_iterator<std::vector<BOOL>,true,0ul>>((uint64_t)this + 192, v14, v15, *(void **)v16, 0, (void *)(*(void *)v16 + 8 * (*(void *)(v16 + 8) >> 6)), *(void *)(v16 + 8) & 0x3F, *(void *)(v16 + 8), (uint64_t)buf);
      ++v12;
      uint64_t v10 = *(void *)a2;
      v11 += 24;
    }
    while (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a2 + 1) - *(void *)a2) >> 3) > v12);
  }
  int v17 = (const double *)*((void *)this + 22);
  if (v17 == *((const double **)this + 21))
  {
    vDSP_Length v29 = 0;
  }
  else
  {
    vDSP_Length v18 = 0;
    BOOL v19 = v133;
    do
    {
      if (v19 >= v134)
      {
        int v21 = (char *)__p;
        uint64_t v22 = (v19 - (unsigned char *)__p) >> 3;
        unint64_t v23 = v22 + 1;
        if ((unint64_t)(v22 + 1) >> 61) {
          std::vector<double>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v24 = v134 - (unsigned char *)__p;
        if ((v134 - (unsigned char *)__p) >> 2 > v23) {
          unint64_t v23 = v24 >> 2;
        }
        if ((unint64_t)v24 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v25 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v25 = v23;
        }
        if (v25)
        {
          int v26 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&v134, v25);
          int v21 = (char *)__p;
          BOOL v19 = v133;
        }
        else
        {
          int v26 = 0;
        }
        int v27 = (vDSP_Length *)&v26[8 * v22];
        *int v27 = v18;
        uint64_t v20 = (char *)(v27 + 1);
        while (v19 != v21)
        {
          vDSP_Length v28 = *((void *)v19 - 1);
          v19 -= 8;
          *--int v27 = v28;
        }
        std::string __p = v27;
        v133 = v20;
        v134 = &v26[8 * v25];
        if (v21) {
          operator delete(v21);
        }
      }
      else
      {
        *(void *)BOOL v19 = v18;
        uint64_t v20 = v19 + 8;
      }
      v133 = v20;
      ++v18;
      int v17 = (const double *)*((void *)this + 21);
      vDSP_Length v29 = (uint64_t)(*((void *)this + 22) - (void)v17) >> 3;
      BOOL v19 = v20;
    }
    while (v29 > v18);
  }
  vDSP_vsortiD(v17, (vDSP_Length *)__p, 0, v29, 1);
  vDSP_vsortD(*((double **)this + 21), (uint64_t)(*((void *)this + 22) - *((void *)this + 21)) >> 3, 1);
  if (*((void *)this + 25))
  {
    unint64_t v30 = 0;
    do
    {
      buf[0] = (*(void *)(*((void *)this + 24) + ((*((void *)__p + v30) >> 3) & 0x1FFFFFFFFFFFFFF8)) >> *((void *)__p + v30)) & 1;
      std::vector<BOOL>::push_back((uint64_t)this + 216, buf);
      ++v30;
    }
    while (v30 < *((void *)this + 25));
  }
  unint64_t v31 = (uint64_t)(*((void *)this + 22) - *((void *)this + 21)) >> 3;
  *(void *)buf = 0;
  std::vector<double>::assign((char **)this, v31, buf);
  int v32 = (double *)*((void *)this + 21);
  unsigned int v33 = (double *)*((void *)this + 22);
  unsigned int v34 = *(double **)this;
  if (v32 != v33)
  {
    double v36 = *v32;
    uint64_t v35 = v32 + 1;
    double v37 = v36;
    *unsigned int v34 = v36;
    if (v35 != v33)
    {
      uint64_t v38 = v34 + 1;
      do
      {
        double v39 = *v35++;
        *v38++ = v39 - v37;
        double v37 = v39;
      }
      while (v35 != v33);
    }
  }
  int v40 = (char *)*((void *)this + 1);
  int64_t v41 = v40 - (char *)(v34 + 1);
  if (v40 != (char *)(v34 + 1)) {
    memmove(v34, v34 + 1, v40 - (char *)(v34 + 1));
  }
  *((void *)this + 1) = (char *)v34 + v41;
  unint64_t v42 = (double *)v136;
  if (v136 >= v137)
  {
    unint64_t v44 = (double *)v135;
    uint64_t v45 = (v136 - (unsigned char *)v135) >> 3;
    unint64_t v46 = v45 + 1;
    if ((unint64_t)(v45 + 1) >> 61) {
      std::vector<double>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v47 = v137 - (unsigned char *)v135;
    if ((v137 - (unsigned char *)v135) >> 2 > v46) {
      unint64_t v46 = v47 >> 2;
    }
    if ((unint64_t)v47 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v48 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v48 = v46;
    }
    if (v48)
    {
      v49 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&v137, v48);
      unint64_t v44 = (double *)v135;
      unint64_t v42 = (double *)v136;
    }
    else
    {
      v49 = 0;
    }
    v50 = (double *)&v49[8 * v45];
    BOOL v51 = &v49[8 * v48];
    double *v50 = 0.0;
    uint64_t v43 = v50 + 1;
    while (v42 != v44)
    {
      uint64_t v52 = *((void *)v42-- - 1);
      *((void *)v50-- - 1) = v52;
    }
    v135 = v50;
    v136 = (char *)v43;
    v137 = v51;
    if (v44) {
      operator delete(v44);
    }
  }
  else
  {
    *(void *)v136 = 0;
    uint64_t v43 = v42 + 1;
  }
  v128 = a3;
  v136 = (char *)v43;
  v53 = *(double **)this;
  v54 = (double *)*((void *)this + 1);
  if (*(double **)this != v54)
  {
    int v55 = 0;
    char v56 = 0;
    do
    {
      if (*v53 < 0.0) {
        char v56 = 1;
      }
      if (*v53 > 14400.0)
      {
        double v57 = (double)v55;
        if (v43 >= (double *)v137)
        {
          v59 = (double *)v135;
          uint64_t v60 = ((char *)v43 - (unsigned char *)v135) >> 3;
          unint64_t v61 = v60 + 1;
          if ((unint64_t)(v60 + 1) >> 61) {
            std::vector<double>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v62 = v137 - (unsigned char *)v135;
          if ((v137 - (unsigned char *)v135) >> 2 > v61) {
            unint64_t v61 = v62 >> 2;
          }
          if ((unint64_t)v62 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v63 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v63 = v61;
          }
          if (v63)
          {
            v64 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&v137, v63);
            v59 = (double *)v135;
            uint64_t v43 = (double *)v136;
          }
          else
          {
            v64 = 0;
          }
          uint64_t v65 = (double *)&v64[8 * v60];
          *uint64_t v65 = v57;
          uint64_t v58 = v65 + 1;
          while (v43 != v59)
          {
            uint64_t v66 = *((void *)v43-- - 1);
            *((void *)v65-- - 1) = v66;
          }
          v135 = v65;
          v136 = (char *)v58;
          v137 = &v64[8 * v63];
          if (v59) {
            operator delete(v59);
          }
        }
        else
        {
          double *v43 = v57;
          uint64_t v58 = v43 + 1;
        }
        v136 = (char *)v58;
        uint64_t v43 = v58;
      }
      ++v55;
      ++v53;
    }
    while (v53 != v54);
    if (v56)
    {
      uint64_t v7 = 0;
      uint64_t v9 = 0x100000000;
      uint64_t v8 = 3;
      goto LABEL_137;
    }
  }
  unint64_t v67 = (double *)v135;
  if (v43 != v135)
  {
    unint64_t v68 = 0;
    unint64_t v69 = ((char *)v43 - (unsigned char *)v135) >> 3;
    v70 = (void **)((char *)this + 24);
    v129 = (void **)((char *)this + 144);
    v130 = (char *)this + 120;
    do
    {
      *((void *)this + 4) = *((void *)this + 3);
      *((void *)this + 7) = 0;
      if (v69 - 1 <= v68)
      {
        double v71 = (double)(int)(((*((void *)this + 22) - *((void *)this + 21)) >> 3) - 1);
        if (!v68)
        {
LABEL_83:
          double v72 = *v67;
          goto LABEL_84;
        }
      }
      else
      {
        double v71 = v67[v68 + 1];
        if (!v68) {
          goto LABEL_83;
        }
      }
      double v72 = v67[v68] + 1.0;
LABEL_84:
      int v73 = (int)v71;
      int v74 = (int)v72;
      int v75 = (int)v71 + 1;
      unint64_t v76 = v75 - (int)v72;
      *(void *)buf = 0;
      std::vector<double>::assign((char **)this + 3, v76, buf);
      buf[0] = 0;
      std::vector<BOOL>::assign((uint64_t)this + 48, v76, buf);
      uint64_t v77 = *((void *)this + 21);
      v78 = (const void *)(v77 + 8 * v74);
      uint64_t v79 = v77 + 8 * v73 + 8;
      if ((const void *)v79 != v78) {
        memmove(*v70, v78, v79 - (void)v78);
      }
      uint64_t v80 = *((void *)this + 27);
      unint64_t v81 = (unint64_t)v74 >> 6;
      if (v74 < 0) {
        unint64_t v81 = -(uint64_t)((63 - v74) >> 6);
      }
      uint64_t v82 = v80 + 8 * v81;
      unint64_t v83 = (unint64_t)v73 >> 6;
      if (v73 < 0) {
        unint64_t v83 = -(uint64_t)((63 - v73) >> 6);
      }
      uint64_t v84 = v80 + 8 * v83 + 8 * (((v73 & 0x3Fu) + 1) >> 6);
      uint64_t v85 = *((void *)this + 6);
      *(void *)buf = v82;
      if ((v74 & 0x3F) != 0)
      {
        *(_DWORD *)&buf[8] = v74 & 0x3F;
        uint64_t v140 = v84;
        int v141 = v75 & 0x3F;
        uint64_t v138 = v85;
        int v139 = 0;
        std::__copy_unaligned[abi:ne180100]<std::vector<BOOL>,false>((unsigned int *)buf, (uint64_t)&v140, (uint64_t)&v138, (uint64_t)v131);
      }
      else
      {
        *(_DWORD *)&buf[8] = 0;
        uint64_t v140 = v84;
        int v141 = v75 & 0x3F;
        uint64_t v138 = v85;
        int v139 = 0;
        std::__copy_aligned[abi:ne180100]<std::vector<BOOL>,false>(buf, &v140, (uint64_t)&v138, (uint64_t)v131);
      }
      if (algs_get_log() && *((void *)this + 4) != *((void *)this + 3))
      {
        unint64_t v86 = 0;
        do
        {
          log = algs_get_log();
          if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v88 = *((void *)*v70 + v86);
            *(_DWORD *)buf = 134217984;
            *(void *)&buf[4] = v88;
            _os_log_debug_impl(&dword_2477CF000, log, OS_LOG_TYPE_DEBUG, "\nPre-Interpolation Trigger Time: %f", buf, 0xCu);
          }
          ++v86;
        }
        while (v86 < (uint64_t)(*((void *)this + 4) - *((void *)this + 3)) >> 3);
      }
      if (*((void *)this + 7) == 1)
      {
        std::vector<double>::__assign_with_size[abi:ne180100]<double *,double *>((char *)this + 72, *((char **)this + 3), *((void *)this + 4), (uint64_t)(*((void *)this + 4) - *((void *)this + 3)) >> 3);
        std::vector<BOOL>::operator=((void **)this + 12, (uint64_t)this + 48);
      }
      else
      {
        signed int v89 = vcvtpd_s64_f64((*(double *)(*((void *)this + 4) - 8) - **((double **)this + 3)) / 600.0);
        *(void *)buf = 0x4082C00000000000;
        vDSP_Length v90 = v89;
        uint64_t v140 = 0;
        std::vector<double>::assign((char **)this + 9, v89, &v140);
        vDSP_vrampD((const double *)*v70, (const double *)buf, *((double **)this + 9), 1, v90);
        LOBYTE(v140) = 0;
        std::vector<BOOL>::assign((uint64_t)this + 96, v90, &v140);
        uint64_t v91 = *((void *)this + 9);
        uint64_t v92 = *((void *)this + 10);
        uint64_t v93 = v92 - v91;
        if (v92 != v91)
        {
          unint64_t v94 = 0;
          unint64_t v95 = v93 >> 3;
          uint64_t v96 = *((void *)this + 3);
          uint64_t v97 = *((void *)this + 4) - v96;
          uint64_t v98 = 2;
          if ((unint64_t)(v97 >> 3) > 2) {
            uint64_t v98 = v97 >> 3;
          }
          if (v95 <= 1) {
            unint64_t v95 = 1;
          }
          uint64_t v99 = v98 - 1;
          do
          {
            if ((unint64_t)v97 >= 9)
            {
              uint64_t v100 = 0;
              double v101 = *(double *)(v91 + 8 * v94);
              while (1)
              {
                double v102 = *(double *)(v96 + 8 + 8 * v100);
                if (v102 > v101) {
                  break;
                }
                if (v99 == ++v100) {
                  goto LABEL_118;
                }
              }
              if (vabdd_f64(v101, v102) < vabdd_f64(v101, *(double *)(v96 + 8 * (int)v100))) {
                LODWORD(v100) = v100 + 1;
              }
              char v103 = v100;
              unint64_t v104 = ((unint64_t)(int)v100 >> 3) & 0x1FFFFFFFFFFFFFF8;
              uint64_t v105 = *((void *)this + 12);
              unint64_t v106 = v94 >> 6;
              uint64_t v107 = 1 << v94;
              if ((*(void *)(*((void *)this + 6) + v104) >> v103)) {
                uint64_t v108 = *(void *)(v105 + 8 * v106) | v107;
              }
              else {
                uint64_t v108 = *(void *)(v105 + 8 * v106) & ~v107;
              }
              *(void *)(v105 + 8 * v106) = v108;
            }
LABEL_118:
            ++v94;
          }
          while (v94 != v95);
        }
      }
      uint64_t v109 = *((void *)this + 16);
      if (v109 == *((void *)this + 15))
      {
        std::vector<double>::__assign_with_size[abi:ne180100]<double *,double *>(v130, *((char **)this + 9), *((void *)this + 10), (uint64_t)(*((void *)this + 10) - *((void *)this + 9)) >> 3);
        std::vector<BOOL>::operator=(v129, (uint64_t)this + 96);
      }
      else
      {
        std::vector<double>::__insert_with_size[abi:ne180100]<std::__wrap_iter<double const*>,std::__wrap_iter<double const*>>((uint64_t)v130, v109, *((char **)this + 9), *((char **)this + 10), (uint64_t)(*((void *)this + 10) - *((void *)this + 9)) >> 3);
        unint64_t v110 = *((void *)this + 19);
        unint64_t v111 = *((void *)this + 18) + 8 * (v110 >> 6);
        unint64_t v112 = *((void *)this + 13);
        uint64_t v113 = *((void *)this + 12) + 8 * (v112 >> 6);
        *(void *)buf = *((void *)this + 12);
        *(_DWORD *)&buf[8] = 0;
        uint64_t v140 = v113;
        int v141 = v112 & 0x3F;
        std::vector<BOOL>::__insert_with_size[abi:ne180100]<std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>>((uint64_t)v129, v111, v110 & 0x3F, (uint64_t)buf, (uint64_t)&v140, v112, (uint64_t)&v138);
      }
      ++v68;
      unint64_t v67 = (double *)v135;
      unint64_t v69 = (v136 - (unsigned char *)v135) >> 3;
    }
    while (v69 > v68);
  }
  uint64_t v114 = *((void *)this + 18);
  unint64_t v115 = *((void *)this + 19);
  LODWORD(v138) = 1;
  *(void *)buf = v114;
  *(_DWORD *)&buf[8] = 0;
  uint64_t v140 = v114 + 8 * (v115 >> 6);
  int v141 = v115 & 0x3F;
  v128->Afib_burden = (float)((float)std::__count[abi:ne180100]<std::_ClassicAlgPolicy,std::vector<BOOL>,false,int,std::__identity,0>((uint64_t *)buf, (uint64_t)&v140, &v138)/ (float)*((unint64_t *)this + 19))* 100.0;
  uint64_t v116 = *((void *)this + 27);
  unint64_t v117 = *((void *)this + 28);
  LODWORD(v138) = 1;
  *(void *)buf = v116;
  *(_DWORD *)&buf[8] = 0;
  uint64_t v140 = v116 + 8 * (v117 >> 6);
  int v141 = v117 & 0x3F;
  uint64_t v118 = std::__count[abi:ne180100]<std::_ClassicAlgPolicy,std::vector<BOOL>,false,int,std::__identity,0>((uint64_t *)buf, (uint64_t)&v140, &v138);
  unint64_t v119 = *((void *)this + 28);
  if (algs_get_log())
  {
    if (*((void *)this + 16) != *((void *)this + 15))
    {
      unint64_t v120 = 0;
      do
      {
        v121 = algs_get_log();
        if (os_log_type_enabled(v121, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v122 = *(void *)(*((void *)this + 15) + 8 * v120);
          *(_DWORD *)buf = 134217984;
          *(void *)&buf[4] = v122;
          _os_log_debug_impl(&dword_2477CF000, v121, OS_LOG_TYPE_DEBUG, "\nInterpolated Trigger Time: %f", buf, 0xCu);
        }
        ++v120;
      }
      while (v120 < (uint64_t)(*((void *)this + 16) - *((void *)this + 15)) >> 3);
    }
    if (*((void *)this + 19))
    {
      unint64_t v123 = 0;
      do
      {
        v124 = algs_get_log();
        if (os_log_type_enabled(v124, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v125 = (*(void *)(*((void *)this + 18) + ((v123 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v123) & 1;
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = v125;
          _os_log_debug_impl(&dword_2477CF000, v124, OS_LOG_TYPE_DEBUG, "\nInterpolated Classification: %u", buf, 8u);
        }
        ++v123;
      }
      while (*((void *)this + 19) > v123);
    }
    v126 = algs_get_log();
    if (os_log_type_enabled(v126, OS_LOG_TYPE_DEBUG)) {
      beryllium::BerylliumProcessor::interpolate_Tachograms_and_calc_AFibBurden(v126, (float)((float)v118 / (float)v119) * 100.0);
    }
  }
  uint64_t v9 = 0;
  uint64_t v8 = 0;
  uint64_t v7 = 0;
LABEL_137:
  if (__p)
  {
    v133 = (char *)__p;
    operator delete(__p);
  }
  if (v135)
  {
    v136 = (char *)v135;
    operator delete(v135);
  }
  return v8 | v9 | v7;
}

void sub_2477DE00C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,uint64_t a21,void *a22,uint64_t a23)
{
}

char *std::vector<double>::assign(char **a1, unint64_t a2, void *a3)
{
  uint64_t v6 = (uint64_t)a1[2];
  double result = *a1;
  if (a2 <= (v6 - (uint64_t)result) >> 3)
  {
    unint64_t v13 = a1[1];
    unint64_t v14 = (v13 - result) >> 3;
    if (v14 >= a2) {
      uint64_t v15 = a2;
    }
    else {
      uint64_t v15 = (v13 - result) >> 3;
    }
    if (v15)
    {
      uint64_t v16 = result;
      do
      {
        *(void *)uint64_t v16 = *a3;
        v16 += 8;
        --v15;
      }
      while (v15);
    }
    if (a2 <= v14)
    {
      a1[1] = &result[8 * a2];
    }
    else
    {
      int v17 = &v13[8 * (a2 - v14)];
      uint64_t v18 = 8 * a2 - 8 * v14;
      do
      {
        *(void *)unint64_t v13 = *a3;
        v13 += 8;
        v18 -= 8;
      }
      while (v18);
      a1[1] = v17;
    }
  }
  else
  {
    if (result)
    {
      a1[1] = result;
      operator delete(result);
      uint64_t v6 = 0;
      *a1 = 0;
      a1[1] = 0;
      a1[2] = 0;
    }
    if (a2 >> 61) {
      std::vector<double>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v8 = v6 >> 2;
    if (v6 >> 2 <= a2) {
      uint64_t v8 = a2;
    }
    if ((unint64_t)v6 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v9 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v9 = v8;
    }
    double result = std::vector<double>::__vallocate[abi:ne180100](a1, v9);
    uint64_t v10 = a1[1];
    uint64_t v11 = &v10[8 * a2];
    uint64_t v12 = 8 * a2;
    do
    {
      *(void *)uint64_t v10 = *a3;
      v10 += 8;
      v12 -= 8;
    }
    while (v12);
    a1[1] = v11;
  }
  return result;
}

void std::vector<BOOL>::assign(uint64_t a1, unint64_t a2, unsigned char *a3)
{
  *(void *)(a1 + 8) = 0;
  if (a2)
  {
    uint64_t v6 = *(void *)(a1 + 16);
    unint64_t v7 = v6 << 6;
    if (v6 << 6 >= a2)
    {
      *(void *)(a1 + 8) = a2;
    }
    else
    {
      unint64_t v14 = 0;
      long long v15 = 0uLL;
      if ((a2 & 0x8000000000000000) != 0) {
        std::vector<double>::__throw_length_error[abi:ne180100]();
      }
      unint64_t v8 = v6 << 7;
      if (v8 <= ((a2 + 63) & 0xFFFFFFFFFFFFFFC0)) {
        unint64_t v8 = (a2 + 63) & 0xFFFFFFFFFFFFFFC0;
      }
      if (v7 <= 0x3FFFFFFFFFFFFFFELL) {
        unint64_t v9 = v8;
      }
      else {
        unint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
      }
      std::vector<BOOL>::reserve(&v14, v9);
      uint64_t v11 = v14;
      uint64_t v12 = *((void *)&v15 + 1);
      unint64_t v14 = *(char **)a1;
      uint64_t v10 = v14;
      long long v13 = *(_OWORD *)(a1 + 8);
      *(void *)a1 = v11;
      *(void *)(a1 + 8) = a2;
      *(void *)(a1 + 16) = v12;
      long long v15 = v13;
      if (v10) {
        operator delete(v10);
      }
    }
    if (*a3)
    {
      unint64_t v14 = *(char **)a1;
      LODWORD(v15) = 0;
      std::__fill_n[abi:ne180100]<true,std::vector<BOOL>>(&v14, a2);
    }
    else
    {
      unint64_t v14 = *(char **)a1;
      LODWORD(v15) = 0;
      std::__fill_n[abi:ne180100]<false,std::vector<BOOL>>((uint64_t)&v14, a2);
    }
  }
}

void sub_2477DE35C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void **std::vector<BOOL>::operator=(void **a1, uint64_t a2)
{
  if (a1 != (void **)a2)
  {
    unint64_t v4 = *(void *)(a2 + 8);
    if (v4)
    {
      if (v4 > (void)a1[2] << 6)
      {
        uint64_t v5 = *a1;
        if (*a1)
        {
          operator delete(v5);
          *a1 = 0;
          a1[1] = 0;
          a1[2] = 0;
          unint64_t v4 = *(void *)(a2 + 8);
        }
        std::vector<BOOL>::__vallocate[abi:ne180100](a1, v4);
        unint64_t v4 = *(void *)(a2 + 8);
      }
      memmove(*a1, *(const void **)a2, (((v4 - 1) >> 3) & 0x1FFFFFFFFFFFFFF8) + 8);
      uint64_t v6 = *(void **)(a2 + 8);
    }
    else
    {
      uint64_t v6 = 0;
    }
    a1[1] = v6;
  }
  return a1;
}

void beryllium::BerylliumProcessor::calculateAFdensity(uint64_t a1, double **a2, void *a3)
{
  unint64_t v81 = 0;
  uint64_t v82 = 0;
  uint64_t v83 = 0;
  __C = 0;
  uint64_t v79 = 0;
  uint64_t v80 = 0;
  __A = 0;
  unint64_t v76 = 0;
  uint64_t v77 = 0;
  std::string __p = 0;
  int v73 = 0;
  int v74 = 0;
  unint64_t v69 = 0;
  v70 = 0;
  uint64_t v71 = 0;
  uint64_t v66 = 0;
  unint64_t v67 = 0;
  unint64_t v68 = 0;
  unint64_t v63 = 0;
  unint64_t v64 = 0;
  uint64_t v65 = 0;
  uint64_t v6 = *(char **)(a1 + 216);
  *(void *)&double v7 = &v6[8 * (*(void *)(a1 + 224) >> 6)];
  uint64_t v8 = *(void *)(a1 + 224) & 0x3FLL;
  LODWORD(__B) = 1;
  uint64_t v58 = v6;
  LODWORD(v59) = 0;
  double v84 = v7;
  int v85 = v8;
  uint64_t v9 = std::__count[abi:ne180100]<std::_ClassicAlgPolicy,std::vector<BOOL>,false,int,std::__identity,0>((uint64_t *)&v58, (uint64_t)&v84, &__B);
  unint64_t v10 = *(void *)(a1 + 224);
  double v11 = *(a2[1] - 1) - **a2;
  long double v12 = fmod(v11, 600.0);
  double v13 = ceil(v11 / 600.0);
  if (v12 == 0.0) {
    double v14 = v11 / 600.0 + 1.0;
  }
  else {
    double v14 = v13;
  }
  double __B = 600.0;
  unint64_t v15 = (int)v14;
  uint64_t v58 = 0;
  std::vector<double>::assign((char **)&v81, v15, &v58);
  uint64_t v58 = 0;
  std::vector<double>::assign((char **)&__C, v15, &v58);
  uint64_t v58 = 0;
  std::vector<double>::assign((char **)&__A, v15, &v58);
  vDSP_vrampD(*a2, &__B, v81, 1, v15);
  double v61 = 0.0;
  double v61 = **a2;
  vDSP_vsubD(&v61, 0, v81, 1, __C, 1, v82 - v81);
  double v60 = 0.0;
  double v60 = *(a2[1] - 1) - **a2;
  vDSP_vsdivD(__C, 1, &v60, __A, 1, v79 - __C);
  uint64_t v79 = __C;
  uint64_t v16 = v73;
  if (v73 >= v74)
  {
    uint64_t v18 = (char *)__p;
    uint64_t v19 = (v73 - (unsigned char *)__p) >> 3;
    unint64_t v20 = v19 + 1;
    if ((unint64_t)(v19 + 1) >> 61) {
      std::vector<double>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v21 = v74 - (unsigned char *)__p;
    if ((v74 - (unsigned char *)__p) >> 2 > v20) {
      unint64_t v20 = v21 >> 2;
    }
    if ((unint64_t)v21 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v22 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v22 = v20;
    }
    if (v22)
    {
      unint64_t v23 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&v74, v22);
      uint64_t v18 = (char *)__p;
      uint64_t v16 = v73;
    }
    else
    {
      unint64_t v23 = 0;
    }
    uint64_t v24 = (double *)&v23[8 * v19];
    unint64_t v25 = &v23[8 * v22];
    *uint64_t v24 = 0.0;
    int v17 = v24 + 1;
    while (v16 != v18)
    {
      uint64_t v26 = *((void *)v16 - 1);
      v16 -= 8;
      *((void *)v24-- - 1) = v26;
    }
    std::string __p = v24;
    int v73 = (char *)v17;
    int v74 = v25;
    if (v18) {
      operator delete(v18);
    }
  }
  else
  {
    *(void *)int v73 = 0;
    int v17 = (double *)(v16 + 8);
  }
  int v73 = (char *)v17;
  if ((unint64_t)((char *)v82 - (char *)v81) >= 9)
  {
    unint64_t v27 = 1;
    do
    {
      unint64_t v67 = (char *)v66;
      unint64_t v64 = 0;
      vDSP_Length v29 = *a2;
      vDSP_Length v28 = a2[1];
      if (v28 == *a2)
      {
        unint64_t v41 = 0;
      }
      else
      {
        unint64_t v30 = 0;
        do
        {
          if (v29[v30] < v81[v27])
          {
            unint64_t v31 = v67;
            if (v67 >= v68)
            {
              unsigned int v33 = (char *)v66;
              uint64_t v34 = (v67 - (unsigned char *)v66) >> 2;
              unint64_t v35 = v34 + 1;
              if ((unint64_t)(v34 + 1) >> 62) {
                std::vector<double>::__throw_length_error[abi:ne180100]();
              }
              uint64_t v36 = v68 - (unsigned char *)v66;
              if ((v68 - (unsigned char *)v66) >> 1 > v35) {
                unint64_t v35 = v36 >> 1;
              }
              if ((unint64_t)v36 >= 0x7FFFFFFFFFFFFFFCLL) {
                unint64_t v37 = 0x3FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v37 = v35;
              }
              if (v37)
              {
                uint64_t v38 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)&v68, v37);
                unsigned int v33 = (char *)v66;
                unint64_t v31 = v67;
              }
              else
              {
                uint64_t v38 = 0;
              }
              double v39 = &v38[4 * v34];
              *(_DWORD *)double v39 = v30;
              int v32 = v39 + 4;
              while (v31 != v33)
              {
                int v40 = *((_DWORD *)v31 - 1);
                v31 -= 4;
                *((_DWORD *)v39 - 1) = v40;
                v39 -= 4;
              }
              uint64_t v66 = v39;
              unint64_t v67 = v32;
              unint64_t v68 = &v38[4 * v37];
              if (v33) {
                operator delete(v33);
              }
            }
            else
            {
              *(_DWORD *)unint64_t v67 = v30;
              int v32 = v31 + 4;
            }
            unint64_t v67 = v32;
            LOBYTE(v58) = (*(void *)(*a3 + ((v30 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v30) & 1;
            std::vector<BOOL>::push_back((uint64_t)&v63, &v58);
            vDSP_Length v29 = *a2;
            vDSP_Length v28 = a2[1];
          }
          ++v30;
        }
        while (v30 < v28 - v29);
        unint64_t v41 = v64;
      }
      LODWORD(v57) = 1;
      uint64_t v58 = v63;
      LODWORD(v59) = 0;
      *(void *)&double v84 = (char *)v63 + 8 * (v41 >> 6);
      int v85 = v41 & 0x3F;
      double v42 = 1.0
          / (float)((float)v9 / (float)v10)
          * (double)std::__count[abi:ne180100]<std::_ClassicAlgPolicy,std::vector<BOOL>,false,int,std::__identity,0>((uint64_t *)&v58, (uint64_t)&v84, &v57)/ (double)(unint64_t)a3[1];
      uint64_t v43 = v73;
      if (v73 >= v74)
      {
        unint64_t v44 = (char *)__p;
        uint64_t v45 = (v73 - (unsigned char *)__p) >> 3;
        unint64_t v46 = v45 + 1;
        if ((unint64_t)(v45 + 1) >> 61) {
          std::vector<double>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v47 = v74 - (unsigned char *)__p;
        if ((v74 - (unsigned char *)__p) >> 2 > v46) {
          unint64_t v46 = v47 >> 2;
        }
        if ((unint64_t)v47 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v48 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v48 = v46;
        }
        if (v48)
        {
          v49 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&v74, v48);
          unint64_t v44 = (char *)__p;
          uint64_t v43 = v73;
        }
        else
        {
          v49 = 0;
        }
        v50 = (double *)&v49[8 * v45];
        double *v50 = v42;
        int v17 = v50 + 1;
        while (v43 != v44)
        {
          uint64_t v51 = *((void *)v43 - 1);
          v43 -= 8;
          *((void *)v50-- - 1) = v51;
        }
        std::string __p = v50;
        int v73 = (char *)v17;
        int v74 = &v49[8 * v48];
        if (v44) {
          operator delete(v44);
        }
      }
      else
      {
        *(double *)int v73 = v42;
        int v17 = (double *)(v43 + 8);
      }
      int v73 = (char *)v17;
      ++v27;
    }
    while (v27 < v82 - v81);
  }
  vDSP_vsubD((const double *)__p, 1, __A, 1, (double *)__p, 1, ((char *)v17 - (unsigned char *)__p) >> 3);
  std::vector<double>::vector(&v58, (v73 - (unsigned char *)__p) >> 3);
  uint64_t v52 = (double *)__p;
  v53 = v73;
  v54 = v58;
  if (__p != v73)
  {
    int v55 = (double *)v58;
    do
    {
      double v56 = *v52++;
      *v55++ = fabs(v56);
    }
    while (v52 != (double *)v53);
  }
  double v84 = 0.0;
  double v84 = __A[1] - *__A;
  uint64_t v57 = 0;
  std::vector<double>::assign((char **)&v69, (v59 - v54) >> 3, &v57);
  vDSP_vtrapzD((const double *)v58, 1, &v84, v69, 1, (v59 - (unsigned char *)v58) >> 3);
  if (v58)
  {
    v59 = v58;
    operator delete(v58);
  }
  if (v63) {
    operator delete(v63);
  }
  if (v66)
  {
    unint64_t v67 = (char *)v66;
    operator delete(v66);
  }
  if (v69)
  {
    v70 = v69;
    operator delete(v69);
  }
  if (__p)
  {
    int v73 = (char *)__p;
    operator delete(__p);
  }
  if (__A)
  {
    unint64_t v76 = __A;
    operator delete(__A);
  }
  if (__C)
  {
    uint64_t v79 = __C;
    operator delete(__C);
  }
  if (v81)
  {
    uint64_t v82 = v81;
    operator delete(v81);
  }
}

void sub_2477DEA78(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,uint64_t a21,void *a22,uint64_t a23,uint64_t a24,void *a25,uint64_t a26,uint64_t a27,void *a28,uint64_t a29,uint64_t a30,void *a31,uint64_t a32)
{
  if (__p) {
    operator delete(__p);
  }
  if (a19) {
    operator delete(a19);
  }
  if (a22) {
    operator delete(a22);
  }
  if (a25) {
    operator delete(a25);
  }
  if (a28) {
    operator delete(a28);
  }
  if (a31) {
    operator delete(a31);
  }
  uint64_t v34 = *(void **)(v32 - 168);
  if (v34)
  {
    *(void *)(v32 - 160) = v34;
    operator delete(v34);
  }
  _Unwind_Resume(exception_object);
}

float beryllium::BerylliumProcessor::TachAFdensity(double **this, const beryllium::input_t *a2, const output_t *a3)
{
  std::string __p = 0;
  v53 = 0;
  uint64_t v54 = 0;
  v49 = 0;
  __dst = 0;
  uint64_t v51 = 0;
  unint64_t v46 = 0;
  uint64_t v47 = 0;
  unint64_t v48 = 0;
  if (a3->Afib_burden < 2.0)
  {
    float v3 = -1.0;
    goto LABEL_4;
  }
  float v3 = 1.0;
  if (a3->Afib_burden <= 95.0)
  {
    uint64_t v6 = *this;
    double v7 = this[1];
    if (*this == v7)
    {
      uint64_t v8 = 0;
      unint64_t v20 = 0;
      uint64_t v19 = (char **)(this + 21);
      int v21 = ((unint64_t)((char *)this[22] - (char *)this[21]) >> 3) - 1;
    }
    else
    {
      uint64_t v8 = 0;
      int v9 = 0;
      do
      {
        if (*v6 > 14400.0)
        {
          if (v8 >= v48)
          {
            double v11 = (char *)v46;
            uint64_t v12 = (v8 - (unsigned char *)v46) >> 2;
            unint64_t v13 = v12 + 1;
            if ((unint64_t)(v12 + 1) >> 62) {
              std::vector<double>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v14 = v48 - (unsigned char *)v46;
            if ((v48 - (unsigned char *)v46) >> 1 > v13) {
              unint64_t v13 = v14 >> 1;
            }
            if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFFCLL) {
              unint64_t v15 = 0x3FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v15 = v13;
            }
            if (v15)
            {
              uint64_t v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)&v48, v15);
              double v11 = (char *)v46;
              uint64_t v8 = v47;
            }
            else
            {
              uint64_t v16 = 0;
            }
            int v17 = &v16[4 * v12];
            *(_DWORD *)int v17 = v9;
            unint64_t v10 = v17 + 4;
            while (v8 != v11)
            {
              int v18 = *((_DWORD *)v8 - 1);
              v8 -= 4;
              *((_DWORD *)v17 - 1) = v18;
              v17 -= 4;
            }
            unint64_t v46 = v17;
            uint64_t v47 = v10;
            unint64_t v48 = &v16[4 * v15];
            if (v11) {
              operator delete(v11);
            }
          }
          else
          {
            *(_DWORD *)uint64_t v8 = v9;
            unint64_t v10 = v8 + 4;
          }
          uint64_t v47 = v10;
          uint64_t v8 = v10;
        }
        ++v9;
        ++v6;
      }
      while (v6 != v7);
      uint64_t v19 = (char **)(this + 21);
      unint64_t v20 = v48;
      int v21 = ((unint64_t)((char *)this[22] - (char *)this[21]) >> 3) - 1;
      if (v8 < v48)
      {
        *(_DWORD *)uint64_t v8 = v21;
        unint64_t v22 = v8 + 4;
LABEL_46:
        uint64_t v47 = v22;
        uint64_t v32 = &(*v19)[8 * *(int *)v46 + 8];
        std::vector<double>::__insert_with_size[abi:ne180100]<std::__wrap_iter<double const*>,std::__wrap_iter<double const*>>((uint64_t)&v49, (uint64_t)__dst, *v19, v32, (v32 - *v19) >> 3);
        unsigned int v33 = (char *)v46;
        if (v22 - (unsigned char *)v46 != 4)
        {
          unint64_t v34 = 0;
          do
          {
            double v35 = *((double *)__dst - 1);
            uint64_t v36 = &v33[4 * v34];
            uint64_t v37 = (uint64_t)&(*v19)[8 * *(int *)v36];
            double v38 = *(double *)(v37 + 8);
            uint64_t v39 = (uint64_t)&(*v19)[8 * *((int *)v36 + 1) + 8];
            __C = 0;
            unint64_t v44 = 0;
            uint64_t v45 = 0;
            std::vector<double>::__init_with_size[abi:ne180100]<std::__wrap_iter<double const*>,std::__wrap_iter<double const*>>(&__C, (const void *)(v37 + 8), v39, (v39 - (v37 + 8)) >> 3);
            double v42 = v35 + 600.0 - v38;
            std::vector<double>::assign((char **)&__p, v44 - __C, &v42);
            vDSP_vaddD(__C, 1, (const double *)__p, 1, __C, 1, (v53 - (unsigned char *)__p) >> 3);
            std::vector<double>::__insert_with_size[abi:ne180100]<std::__wrap_iter<double const*>,std::__wrap_iter<double const*>>((uint64_t)&v49, (uint64_t)__dst, (char *)__C, (char *)v44, v44 - __C);
            if (__C)
            {
              unint64_t v44 = __C;
              operator delete(__C);
            }
            ++v34;
            unsigned int v33 = (char *)v46;
          }
          while (((v47 - (unsigned char *)v46) >> 2) - 1 > v34);
        }
        __C = *(double **)v49;
        vDSP_vsubD((const double *)&__C, 0, v49, 1, v49, 1, ((unsigned char *)__dst - (unsigned char *)v49) >> 3);
        std::vector<BOOL>::vector(v41, (uint64_t)(this + 27));
        beryllium::BerylliumProcessor::calculateAFdensity((uint64_t)this, &v49, v41);
        float v3 = v40;
        if (v41[0]) {
          operator delete(v41[0]);
        }
        if (v46)
        {
          uint64_t v47 = (char *)v46;
          operator delete(v46);
        }
        goto LABEL_55;
      }
    }
    unint64_t v23 = (char *)v46;
    uint64_t v24 = (v8 - (unsigned char *)v46) >> 2;
    unint64_t v25 = v24 + 1;
    if ((unint64_t)(v24 + 1) >> 62) {
      std::vector<double>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v26 = v20 - (unsigned char *)v46;
    if (v26 >> 1 > v25) {
      unint64_t v25 = v26 >> 1;
    }
    if ((unint64_t)v26 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v27 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v27 = v25;
    }
    if (v27)
    {
      vDSP_Length v28 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)&v48, v27);
      unint64_t v23 = (char *)v46;
      uint64_t v8 = v47;
    }
    else
    {
      vDSP_Length v28 = 0;
    }
    vDSP_Length v29 = &v28[4 * v24];
    unint64_t v30 = &v28[4 * v27];
    *(_DWORD *)vDSP_Length v29 = v21;
    unint64_t v22 = v29 + 4;
    while (v8 != v23)
    {
      int v31 = *((_DWORD *)v8 - 1);
      v8 -= 4;
      *((_DWORD *)v29 - 1) = v31;
      v29 -= 4;
    }
    unint64_t v46 = v29;
    uint64_t v47 = v22;
    unint64_t v48 = v30;
    if (v23) {
      operator delete(v23);
    }
    goto LABEL_46;
  }
LABEL_55:
  if (v49)
  {
    __dst = v49;
    operator delete(v49);
  }
LABEL_4:
  if (__p)
  {
    v53 = __p;
    operator delete(__p);
  }
  return v3;
}

void sub_2477DEF58(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,uint64_t a21,void *a22,uint64_t a23)
{
  if (__p) {
    operator delete(__p);
  }
  if (a16) {
    operator delete(a16);
  }
  if (a19) {
    operator delete(a19);
  }
  if (a22) {
    operator delete(a22);
  }
  _Unwind_Resume(exception_object);
}

float beryllium::BerylliumProcessor::median(beryllium::BerylliumProcessor *this, double *a2, int a3)
{
  if (a3 <= 0) {
    beryllium::BerylliumProcessor::median();
  }
  if (!a2) {
    beryllium::BerylliumProcessor::median();
  }
  char v4 = a3;
  std::string __p = 0;
  uint64_t v19 = 0;
  uint64_t v5 = a3;
  uint64_t v20 = 0;
  std::vector<double>::reserve(&__p, a3);
  std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,double const*,double const*,std::back_insert_iterator<std::vector<double>>,0>(a2, &a2[v5], (uint64_t)&__p);
  double v7 = (double *)__p;
  uint64_t v8 = v19;
  unint64_t v9 = ((char *)v19 - (unsigned char *)__p) >> 3;
  if (v4)
  {
    unint64_t v15 = (4 * v9 - 4) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v16 = (double *)((char *)__p + v15);
    if ((char *)__p + v15 != (char *)v19) {
      std::__nth_element[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<double *>>((double *)__p, (double *)((char *)__p + v15), v19, v6);
    }
    double v14 = *v16;
  }
  else
  {
    unint64_t v10 = v9 >> 1;
    double v11 = (double *)((char *)__p + 8 * v10 - 8);
    if (v11 != v19)
    {
      double v6 = std::__nth_element[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<double *>>((double *)__p, (double *)__p + v10 - 1, v19, v6);
      double v7 = (double *)__p;
      uint64_t v8 = v19;
      unint64_t v10 = (unint64_t)(((char *)v19 - (unsigned char *)__p) >> 3) >> 1;
    }
    double v12 = *v11;
    unint64_t v13 = &v7[v10];
    if (v13 != v8) {
      std::__nth_element[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<double *>>(v7, &v7[v10], v8, v6);
    }
    double v14 = (v12 + *v13) * 0.5;
  }
  if (__p)
  {
    uint64_t v19 = (double *)__p;
    operator delete(__p);
  }
  return v14;
}

void sub_2477DF0FC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::vector<double>::reserve(void **a1, unint64_t a2)
{
  char v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (unsigned char *)*a1) >> 3)
  {
    if (a2 >> 61) {
      std::vector<double>::__throw_length_error[abi:ne180100]();
    }
    int64_t v5 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    double v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v3, a2);
    double v7 = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
    unint64_t v9 = &v6[8 * v8];
    unint64_t v10 = (char *)*a1;
    double v11 = (char *)a1[1];
    double v12 = v7;
    if (v11 != *a1)
    {
      double v12 = v7;
      do
      {
        uint64_t v13 = *((void *)v11 - 1);
        v11 -= 8;
        *((void *)v12 - 1) = v13;
        v12 -= 8;
      }
      while (v11 != v10);
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
    {
      operator delete(v10);
    }
  }
}

{
  uint64_t v3;
  unsigned char *v4;
  int64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t vars8;

  char v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (unsigned char *)*a1) >> 3)
  {
    if (a2 >> 61) {
      std::vector<float>::__throw_length_error[abi:ne180100]();
    }
    int64_t v5 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    double v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v3, a2);
    double v7 = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
    unint64_t v9 = &v6[8 * v8];
    unint64_t v10 = (char *)*a1;
    double v11 = (char *)a1[1];
    double v12 = v7;
    if (v11 != *a1)
    {
      double v12 = v7;
      do
      {
        uint64_t v13 = *((void *)v11 - 1);
        v11 -= 8;
        *((void *)v12 - 1) = v13;
        v12 -= 8;
      }
      while (v11 != v10);
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
    {
      operator delete(v10);
    }
  }
}

float beryllium::BerylliumProcessor::calc_tacho_times_diff_median(beryllium::BerylliumProcessor *this, const beryllium::input_t *a2)
{
  int v21 = 0;
  __dst = 0;
  uint64_t v23 = 0;
  std::string __p = 0;
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  uint64_t v2 = *(void *)a2;
  if (*((void *)a2 + 1) == *(void *)a2) {
    goto LABEL_13;
  }
  unint64_t v4 = 0;
  do
  {
    uint64_t v5 = *(void *)(v2 + 24 * v4 + 8) - *(void *)(v2 + 24 * v4);
    if (v5)
    {
      uint64_t v17 = 0;
      this = (beryllium::BerylliumProcessor *)std::vector<double>::assign((char **)&__p, v5 >> 3, &v17);
      uint64_t v2 = *(void *)a2;
      uint64_t v6 = *(void *)a2 + 24 * v4;
      double v7 = *(double **)v6;
      uint64_t v8 = *(double **)(v6 + 8);
      unint64_t v9 = (char *)__p;
      if (v7 != v8)
      {
        double v11 = *v7;
        unint64_t v10 = v7 + 1;
        double v12 = v11;
        *(double *)std::string __p = v11;
        if (v10 != v8)
        {
          uint64_t v13 = (double *)(v9 + 8);
          do
          {
            double v14 = *v10++;
            *v13++ = v14 - v12;
            double v12 = v14;
          }
          while (v10 != v8);
        }
      }
      if (v19 != v9)
      {
        this = (beryllium::BerylliumProcessor *)std::vector<double>::__insert_with_size[abi:ne180100]<std::__wrap_iter<double const*>,std::__wrap_iter<double const*>>((uint64_t)&v21, (uint64_t)__dst, v9 + 8, v19, (v19 - (v9 + 8)) >> 3);
        uint64_t v2 = *(void *)a2;
      }
    }
    ++v4;
  }
  while (0xAAAAAAAAAAAAAAABLL * ((*((void *)a2 + 1) - v2) >> 3) > v4);
  if (__dst == v21) {
LABEL_13:
  }
    float v15 = -1.0;
  else {
    float v15 = beryllium::BerylliumProcessor::median(this, (double *)v21, (unint64_t)((unsigned char *)__dst - (unsigned char *)v21) >> 3);
  }
  if (__p)
  {
    uint64_t v19 = (char *)__p;
    operator delete(__p);
  }
  if (v21)
  {
    __dst = v21;
    operator delete(v21);
  }
  return v15;
}

void sub_2477DF320(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13, void *a14, uint64_t a15)
{
  if (__p) {
    operator delete(__p);
  }
  if (a14) {
    operator delete(a14);
  }
  _Unwind_Resume(exception_object);
}

void beryllium::BerylliumProcessor::calc_timezone_shift(beryllium::BerylliumProcessor *this, const beryllium::input_t *a2, core_analytics_t *a3)
{
  std::string __p = 0;
  uint64_t v51 = 0;
  uint64_t v52 = 0;
  __dst = 0;
  unint64_t v48 = 0;
  uint64_t v49 = 0;
  double __C = 0.0;
  uint64_t v5 = *(void *)(*(void *)a2 + 8);
  uint64_t v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&v52, 1uLL);
  *(void *)uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v8 = v6 + 8;
  std::string __p = v6;
  uint64_t v52 = &v6[8 * v7];
  uint64_t v51 = v6 + 8;
  uint64_t v9 = *(void *)a2;
  if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a2 + 1) - *(void *)a2) >> 3) >= 2)
  {
    unint64_t v10 = 1;
    do
    {
      double v11 = *(void **)(v9 + 24 * v10);
      double v12 = v52;
      if (v8 >= v52)
      {
        double v14 = (char *)__p;
        uint64_t v15 = (v8 - (unsigned char *)__p) >> 3;
        unint64_t v16 = v15 + 1;
        if ((unint64_t)(v15 + 1) >> 61) {
          goto LABEL_54;
        }
        uint64_t v17 = v52 - (unsigned char *)__p;
        if ((v52 - (unsigned char *)__p) >> 2 > v16) {
          unint64_t v16 = v17 >> 2;
        }
        if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v18 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v18 = v16;
        }
        if (v18)
        {
          uint64_t v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&v52, v18);
          double v14 = (char *)__p;
          uint64_t v8 = v51;
        }
        else
        {
          uint64_t v19 = 0;
        }
        uint64_t v20 = &v19[8 * v15];
        *(void *)uint64_t v20 = *v11;
        uint64_t v13 = v20 + 8;
        while (v8 != v14)
        {
          uint64_t v21 = *((void *)v8 - 1);
          v8 -= 8;
          *((void *)v20 - 1) = v21;
          v20 -= 8;
        }
        double v12 = &v19[8 * v18];
        std::string __p = v20;
        uint64_t v51 = v13;
        uint64_t v52 = v12;
        if (v14)
        {
          operator delete(v14);
          double v12 = v52;
        }
      }
      else
      {
        *(void *)uint64_t v8 = *v11;
        uint64_t v13 = v8 + 8;
      }
      uint64_t v51 = v13;
      uint64_t v22 = *(void *)(*(void *)a2 + 24 * v10 + 8);
      if (v13 >= v12)
      {
        uint64_t v23 = (char *)__p;
        uint64_t v24 = (v13 - (unsigned char *)__p) >> 3;
        unint64_t v25 = v24 + 1;
        if ((unint64_t)(v24 + 1) >> 61) {
LABEL_54:
        }
          std::vector<double>::__throw_length_error[abi:ne180100]();
        uint64_t v26 = v12 - (unsigned char *)__p;
        if (v26 >> 2 > v25) {
          unint64_t v25 = v26 >> 2;
        }
        if ((unint64_t)v26 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v27 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v27 = v25;
        }
        if (v27)
        {
          vDSP_Length v28 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&v52, v27);
          uint64_t v23 = (char *)__p;
          uint64_t v13 = v51;
        }
        else
        {
          vDSP_Length v28 = 0;
        }
        vDSP_Length v29 = &v28[8 * v24];
        *(void *)vDSP_Length v29 = *(void *)(v22 - 8);
        uint64_t v8 = v29 + 8;
        while (v13 != v23)
        {
          uint64_t v30 = *((void *)v13 - 1);
          v13 -= 8;
          *((void *)v29 - 1) = v30;
          v29 -= 8;
        }
        std::string __p = v29;
        uint64_t v51 = v8;
        uint64_t v52 = &v28[8 * v27];
        if (v23) {
          operator delete(v23);
        }
      }
      else
      {
        *(void *)uint64_t v13 = *(void *)(v22 - 8);
        uint64_t v8 = v13 + 8;
      }
      uint64_t v51 = v8;
      ++v10;
      uint64_t v9 = *(void *)a2;
    }
    while (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a2 + 1) - *(void *)a2) >> 3) > v10);
  }
  uint64_t v45 = 0;
  std::vector<double>::assign((char **)&__dst, (v8 - (unsigned char *)__p) >> 3, &v45);
  int v31 = (double *)v51;
  uint64_t v32 = (char *)__dst;
  if (__p != v51)
  {
    unsigned int v33 = (double *)((char *)__p + 8);
    double v34 = *(double *)__p;
    *(void *)__dst = *(void *)__p;
    if (v33 != v31)
    {
      double v35 = (double *)(v32 + 8);
      do
      {
        double v36 = *v33++;
        *v35++ = v36 - v34;
        double v34 = v36;
      }
      while (v33 != v31);
    }
  }
  uint64_t v37 = (const double *)v32;
  int64_t v38 = v48 - (v32 + 8);
  if (v48 != v32 + 8)
  {
    memmove(v32, v32 + 8, v48 - (v32 + 8));
    uint64_t v37 = (const double *)__dst;
  }
  unint64_t v48 = &v32[v38];
  vDSP_minvD(v37, 1, &__C, (&v32[v38] - (char *)v37) >> 3);
  uint64_t v39 = (char *)__dst;
  double v40 = 0.0;
  double v41 = 0.0;
  if (__dst != v48)
  {
    double v42 = (double *)__dst;
    do
    {
      double v43 = *v42++;
      if (v43 < 0.0) {
        double v41 = v41 + 1.0;
      }
    }
    while (v42 != (double *)v48);
  }
  double v44 = fabs(__C);
  if (__C < 0.0) {
    double v40 = v44;
  }
  a3->var2 = v41;
  a3->var3 = v40;
  if (v39)
  {
    unint64_t v48 = v39;
    operator delete(v39);
  }
  if (__p)
  {
    uint64_t v51 = (char *)__p;
    operator delete(__p);
  }
}

void sub_2477DF6C4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, uint64_t a15, void *a16, uint64_t a17)
{
  if (__p) {
    operator delete(__p);
  }
  if (a16) {
    operator delete(a16);
  }
  _Unwind_Resume(exception_object);
}

uint64_t beryllium::BerylliumProcessor::beryllium_process(beryllium::BerylliumProcessor *this, const beryllium::input_t *a2, core_analytics_t *a3)
{
  a3->var0 = nanf("");
  a3->var1 = nanf("");
  a3->var2 = nanf("");
  a3->var3 = nanf("");
  a3->var0 = beryllium::BerylliumProcessor::calc_tacho_times_diff_median(v6, a2);
  beryllium::BerylliumProcessor::calc_timezone_shift(v7, a2, a3);
  uint64_t v8 = beryllium::BerylliumProcessor::interpolate_Tachograms_and_calc_AFibBurden(this, a2, &v13);
  if ((v8 & 0xFF00000000) != 0)
  {
    uint64_t v10 = 0x100000000;
  }
  else
  {
    float v11 = beryllium::BerylliumProcessor::TachAFdensity((double **)this, v9, &v13);
    uint64_t v10 = 0;
    a3->var1 = v11;
    LODWORD(v8) = v13;
  }
  return v10 | v8;
}

char *std::vector<double>::__insert_with_size[abi:ne180100]<std::__wrap_iter<double const*>,std::__wrap_iter<double const*>>(uint64_t a1, uint64_t __dst, char *__src, char *a4, uint64_t a5)
{
  uint64_t v5 = (char *)__dst;
  if (a5 < 1) {
    return v5;
  }
  uint64_t v7 = __src;
  uint64_t v11 = *(void *)(a1 + 16);
  uint64_t v9 = a1 + 16;
  uint64_t v10 = v11;
  unint64_t v12 = *(void *)(v9 - 8);
  if (a5 > (uint64_t)(v11 - v12) >> 3)
  {
    output_t v13 = *(void **)a1;
    unint64_t v14 = a5 + ((uint64_t)(v12 - *(void *)a1) >> 3);
    if (v14 >> 61) {
      std::vector<double>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v15 = (__dst - (uint64_t)v13) >> 3;
    uint64_t v16 = v10 - (void)v13;
    if (v16 >> 2 > v14) {
      unint64_t v14 = v16 >> 2;
    }
    if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v17 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v17 = v14;
    }
    uint64_t v37 = v9;
    if (v17) {
      unint64_t v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v9, v17);
    }
    else {
      unint64_t v18 = 0;
    }
    vDSP_Length v28 = &v18[8 * v15];
    std::string __p = v18;
    double v34 = v28;
    double v36 = &v18[8 * v17];
    uint64_t v29 = 8 * a5;
    uint64_t v30 = &v28[8 * a5];
    do
    {
      uint64_t v31 = *(void *)v7;
      v7 += 8;
      *(void *)vDSP_Length v28 = v31;
      v28 += 8;
      v29 -= 8;
    }
    while (v29);
    double v35 = v30;
    uint64_t v5 = std::vector<double>::__swap_out_circular_buffer((void **)a1, (uint64_t)&__p, v5);
    if (v35 != v34) {
      v35 += (v34 - v35 + 7) & 0xFFFFFFFFFFFFFFF8;
    }
    if (__p) {
      operator delete(__p);
    }
    return v5;
  }
  uint64_t v19 = v12 - __dst;
  uint64_t v20 = (uint64_t)(v12 - __dst) >> 3;
  if (v20 >= a5)
  {
    uint64_t v21 = &__src[8 * a5];
    uint64_t v23 = *(char **)(v9 - 8);
LABEL_17:
    uint64_t v24 = &v5[8 * a5];
    unint64_t v25 = &v23[-8 * a5];
    uint64_t v26 = v23;
    if ((unint64_t)v25 < v12)
    {
      uint64_t v26 = v23;
      do
      {
        uint64_t v27 = *(void *)v25;
        v25 += 8;
        *(void *)uint64_t v26 = v27;
        v26 += 8;
      }
      while ((unint64_t)v25 < v12);
    }
    *(void *)(a1 + 8) = v26;
    if (v23 != v24) {
      memmove(&v23[-8 * ((v23 - v24) >> 3)], v5, v23 - v24);
    }
    if (v21 != v7) {
      memmove(v5, v7, v21 - v7);
    }
    return v5;
  }
  uint64_t v21 = &__src[8 * v20];
  int64_t v22 = a4 - v21;
  if (a4 != v21) {
    memmove(*(void **)(v9 - 8), &__src[8 * v20], a4 - v21);
  }
  uint64_t v23 = (char *)(v12 + v22);
  *(void *)(a1 + 8) = v12 + v22;
  if (v19 >= 1) {
    goto LABEL_17;
  }
  return v5;
}

void sub_2477DF9A4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<double>::__swap_out_circular_buffer(void **a1, uint64_t a2, char *__src)
{
  uint64_t v5 = *(char **)(a2 + 8);
  uint64_t v6 = (char *)*a1;
  uint64_t v7 = v5;
  if (*a1 != __src)
  {
    uint64_t v8 = __src;
    uint64_t v7 = *(char **)(a2 + 8);
    do
    {
      uint64_t v9 = *((void *)v8 - 1);
      v8 -= 8;
      *((void *)v7 - 1) = v9;
      v7 -= 8;
    }
    while (v8 != v6);
  }
  *(void *)(a2 + 8) = v7;
  uint64_t v10 = a1[1];
  uint64_t v11 = *(void *)(a2 + 16);
  int64_t v12 = v10 - __src;
  if (v10 != __src)
  {
    memmove(*(void **)(a2 + 16), __src, v10 - __src);
    uint64_t v7 = *(char **)(a2 + 8);
  }
  *(void *)(a2 + 16) = v11 + v12;
  output_t v13 = (char *)*a1;
  *a1 = v7;
  *(void *)(a2 + 8) = v13;
  unint64_t v14 = a1[1];
  a1[1] = *(void **)(a2 + 16);
  *(void *)(a2 + 16) = v14;
  uint64_t v15 = a1[2];
  a1[2] = *(void **)(a2 + 24);
  *(void *)(a2 + 24) = v15;
  *(void *)a2 = *(void *)(a2 + 8);
  return v5;
}

void std::vector<double>::__throw_length_error[abi:ne180100]()
{
}

void sub_2477DFB04(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::vector<BOOL>::__insert_with_size[abi:ne180100]<std::__bit_iterator<std::vector<BOOL>,true,0ul>,std::__bit_iterator<std::vector<BOOL>,true,0ul>>(uint64_t a1@<X0>, unint64_t a2@<X1>, unsigned int a3@<W2>, void *a4@<X3>, unint64_t a5@<X4>, void *a6@<X5>, int a7@<W6>, unint64_t a8@<X7>, uint64_t a9@<X8>)
{
  *(void *)a9 = 0;
  *(_DWORD *)(a9 + 8) = 0;
  unint64_t v19 = *(void *)(a1 + 8);
  uint64_t v18 = *(void *)(a1 + 16);
  if (v18 << 6 < a8 || v19 > (v18 << 6) - a8)
  {
    double v44 = 0;
    long long v45 = 0uLL;
    uint64_t v21 = v19 + a8;
    if (v21 < 0) {
      std::vector<double>::__throw_length_error[abi:ne180100]();
    }
    if ((unint64_t)(v18 << 6) > 0x3FFFFFFFFFFFFFFELL)
    {
      unint64_t v24 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      unint64_t v22 = v18 << 7;
      unint64_t v23 = (v21 + 63) & 0xFFFFFFFFFFFFFFC0;
      if (v22 <= v23) {
        unint64_t v24 = v23;
      }
      else {
        unint64_t v24 = v22;
      }
    }
    std::vector<BOOL>::reserve(&v44, v24);
    uint64_t v31 = *(unint64_t **)a1;
    *(void *)&long long v45 = *(void *)(a1 + 8) + a8;
    double v42 = v44;
    int v43 = 0;
    std::__copy_aligned[abi:ne180100]<std::vector<BOOL>,true>(v31, 0, a2, a3, (uint64_t)&v42, (uint64_t)&v40);
    uint64_t v32 = v40;
    *(void *)a9 = v40;
    int v33 = v41;
    *(_DWORD *)(a9 + 8) = v41;
    unint64_t v34 = *(void *)(a1 + 8);
    double v35 = (void *)(*(void *)a1 + 8 * (v34 >> 6));
    unsigned int v36 = v34 & 0x3F;
    double v42 = &v44[8 * ((unint64_t)v45 >> 6)];
    int v43 = v45 & 0x3F;
    if (v43 == v36) {
      std::__copy_backward_aligned[abi:ne180100]<std::vector<BOOL>,true>(a2, a3, v35, v36, (uint64_t)&v42, (uint64_t)&v40);
    }
    else {
      std::__copy_backward_unaligned[abi:ne180100]<std::vector<BOOL>,true>(a2, a3, v35, v36, (uint64_t)&v42, (uint64_t)&v40);
    }
    uint64_t v37 = *(char **)a1;
    *(void *)a1 = v44;
    double v44 = v37;
    long long v38 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v45;
    long long v45 = v38;
    if (v37) {
      operator delete(v37);
    }
  }
  else
  {
    unint64_t v25 = *(unint64_t **)a1;
    uint64_t v26 = (void *)(*(void *)a1 + 8 * (v19 >> 6));
    uint64_t v27 = *(void *)(a1 + 8) & 0x3FLL;
    unsigned int v28 = v19 & 0x3F;
    *(void *)(a1 + 8) = v19 + a8;
    double v44 = (char *)&v25[(v19 + a8) >> 6];
    if ((((_BYTE)v19 + (_BYTE)a8) & 0x3F) == v27)
    {
      LODWORD(v45) = v27;
      std::__copy_backward_aligned[abi:ne180100]<std::vector<BOOL>,true>(a2, a3, v26, v28, (uint64_t)&v44, (uint64_t)&v42);
    }
    else
    {
      LODWORD(v45) = ((_BYTE)v19 + (_BYTE)a8) & 0x3F;
      std::__copy_backward_unaligned[abi:ne180100]<std::vector<BOOL>,true>(a2, a3, v26, v28, (uint64_t)&v44, (uint64_t)&v42);
    }
    uint64_t v29 = 8 * (a2 - *(void *)a1) + a3;
    if (v29 < 0)
    {
      uint64_t v39 = v29 - 63;
      if (v29 - 63 < 0) {
        uint64_t v39 = 8 * (a2 - *(void *)a1) + a3;
      }
      uint64_t v30 = v39 >> 6;
    }
    else
    {
      uint64_t v30 = (unint64_t)v29 >> 6;
    }
    uint64_t v32 = *(void *)a1 + 8 * v30;
    int v33 = v29 & 0x3F;
    *(void *)a9 = v32;
    *(_DWORD *)(a9 + 8) = v33;
  }
  double v42 = (char *)v32;
  int v43 = v33;
  std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::__bit_iterator<std::vector<BOOL>,true,0ul>,std::__bit_iterator<std::vector<BOOL>,true,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>>(a4, a5, a6, a7, (uint64_t)&v42, (uint64_t)&v44);
}

void sub_2477DFD88(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_2477DFE50(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *std::__copy_backward_aligned[abi:ne180100]<std::vector<BOOL>,true>@<X0>(uint64_t a1@<X0>, unsigned int a2@<W1>, void *a3@<X2>, unsigned int a4@<W3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  int64_t v8 = a4 - (unint64_t)a2 + 8 * ((void)a3 - a1);
  double result = *(void **)a5;
  if (v8 >= 1)
  {
    if (a4)
    {
      if (v8 >= (unint64_t)a4) {
        int64_t v10 = a4;
      }
      else {
        int64_t v10 = v8;
      }
      v8 -= v10;
      unint64_t v11 = (-1 << (a4 - v10)) & (0xFFFFFFFFFFFFFFFFLL >> -(char)a4);
      *double result = *result & ~v11 | *a3 & v11;
      *(_DWORD *)(a5 + 8) = (*(_DWORD *)(a5 + 8) - (_BYTE)v10) & 0x3F;
    }
    if (v8 >= 0) {
      uint64_t v12 = v8;
    }
    else {
      uint64_t v12 = v8 + 63;
    }
    uint64_t v13 = v12 >> 6;
    result -= v12 >> 6;
    *(void *)a5 = result;
    unint64_t v14 = &a3[-(v12 >> 6)];
    if ((unint64_t)(v8 + 63) >= 0x7F)
    {
      memmove(result, v14, 8 * v13);
      double result = *(void **)a5;
    }
    if (v8 - (v13 << 6) >= 1)
    {
      uint64_t v15 = -1 << (((_BYTE)v13 << 6) - v8);
      uint64_t v16 = *(v14 - 1) & v15;
      uint64_t v17 = *--result;
      *(void *)a5 = result;
      *double result = v17 & ~v15 | v16;
      *(_DWORD *)(a5 + 8) = -(int)v8 & 0x3F;
    }
  }
  *(void *)a6 = result;
  *(_DWORD *)(a6 + 8) = *(_DWORD *)(a5 + 8);
  return result;
}

unint64_t std::__copy_backward_unaligned[abi:ne180100]<std::vector<BOOL>,true>@<X0>(unint64_t result@<X0>, unsigned int a2@<W1>, void *a3@<X2>, unsigned int a4@<W3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  int64_t v6 = a4 - (unint64_t)a2 + 8 * ((void)a3 - result);
  if (v6 <= 0)
  {
    unint64_t v11 = *(unint64_t **)a5;
    LODWORD(v9) = *(_DWORD *)(a5 + 8);
  }
  else
  {
    if (a4)
    {
      if (v6 >= (unint64_t)a4) {
        int64_t v7 = a4;
      }
      else {
        int64_t v7 = a4 - (unint64_t)a2 + 8 * ((void)a3 - result);
      }
      v6 -= v7;
      unint64_t v8 = (-1 << (a4 - v7)) & (0xFFFFFFFFFFFFFFFFLL >> -(char)a4) & *a3;
      unint64_t v9 = *(unsigned int *)(a5 + 8);
      if (v7 >= v9) {
        int64_t v10 = *(unsigned int *)(a5 + 8);
      }
      else {
        int64_t v10 = v7;
      }
      unint64_t v11 = *(unint64_t **)a5;
      if (v10)
      {
        unint64_t v12 = v8 >> (a4 - v9);
        if (v9 > a4) {
          unint64_t v12 = v8 << (v9 - a4);
        }
        unint64_t *v11 = *v11 & ~((-1 << (v9 - v10)) & (0xFFFFFFFFFFFFFFFFLL >> -(char)v9)) | v12;
        LODWORD(v9) = ((_BYTE)v9 - (_BYTE)v10) & 0x3F;
        *(_DWORD *)(a5 + 8) = v9;
        v7 -= v10;
      }
      if (v7 >= 1)
      {
        uint64_t v13 = *--v11;
        *(void *)a5 = v11;
        LODWORD(v9) = -(int)v7 & 0x3F;
        *(_DWORD *)(a5 + 8) = v9;
        unint64_t *v11 = v13 & ~(-1 << -(char)v7) | (v8 << (v7 + v10 - a4 + (-(char)v7 & 0x3F)));
      }
    }
    else
    {
      LODWORD(v9) = *(_DWORD *)(a5 + 8);
      unint64_t v11 = *(unint64_t **)a5;
    }
    char v14 = 64 - v9;
    unint64_t v15 = 0xFFFFFFFFFFFFFFFFLL >> -(char)v9;
    if (v6 >= 64)
    {
      unint64_t v16 = *v11;
      do
      {
        unint64_t v17 = v6;
        unint64_t v19 = *--a3;
        unint64_t v18 = v19;
        double result = v19 >> v14;
        unint64_t *v11 = v16 & ~v15 | (v19 >> v14);
        uint64_t v20 = *--v11;
        unint64_t v16 = v20 & v15 | (v18 << v9);
        unint64_t *v11 = v16;
        int64_t v6 = v17 - 64;
      }
      while (v17 > 0x7F);
      *(void *)a5 = v11;
    }
    if (v6 >= 1)
    {
      unint64_t v21 = *(a3 - 1) & (-1 << -(char)v6);
      if (v6 >= (unint64_t)v9) {
        int64_t v22 = v9;
      }
      else {
        int64_t v22 = v6;
      }
      unint64_t *v11 = *v11 & ~((-1 << (v9 - v22)) & v15) | (v21 >> v14);
      LODWORD(v9) = ((_BYTE)v9 - (_BYTE)v22) & 0x3F;
      *(_DWORD *)(a5 + 8) = v9;
      if (v6 - v22 >= 1)
      {
        uint64_t v23 = *--v11;
        *(void *)a5 = v11;
        *(_DWORD *)(a5 + 8) = (v22 - v6) & 0x3F;
        unint64_t *v11 = v23 & ~(-1 << (v22 - v6)) | (v21 << (v6 + ((v22 - v6) & 0x3F)));
        LODWORD(v9) = (v22 - v6) & 0x3F;
      }
    }
  }
  *(void *)a6 = v11;
  *(_DWORD *)(a6 + 8) = v9;
  return result;
}

unint64_t *std::__copy_aligned[abi:ne180100]<std::vector<BOOL>,true>@<X0>(unint64_t *__src@<X0>, unsigned int a2@<W1>, uint64_t a3@<X2>, unsigned int a4@<W3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  int64_t v8 = a4 - (unint64_t)a2 + 8 * (a3 - (void)__src);
  if (v8 <= 0)
  {
    unint64_t v16 = *(unint64_t **)a5;
  }
  else
  {
    unint64_t v9 = __src;
    __src = *(unint64_t **)a5;
    if (a2)
    {
      if (v8 >= (unint64_t)(64 - a2)) {
        int64_t v10 = 64 - a2;
      }
      else {
        int64_t v10 = v8;
      }
      v8 -= v10;
      uint64_t v11 = *v9++;
      *__src = *__src & ~((0xFFFFFFFFFFFFFFFFLL >> (64 - a2 - v10)) & (-1 << a2)) | v11 & (0xFFFFFFFFFFFFFFFFLL >> (64 - a2 - v10)) & (-1 << a2);
      unint64_t v12 = v10 + *(unsigned int *)(a5 + 8);
      __src = (unint64_t *)((char *)__src + ((v12 >> 3) & 0x3FFFFFF8));
      *(void *)a5 = __src;
      *(_DWORD *)(a5 + 8) = v12 & 0x3F;
    }
    if (v8 >= 0) {
      uint64_t v13 = v8;
    }
    else {
      uint64_t v13 = v8 + 63;
    }
    uint64_t v14 = v13 >> 6;
    if ((unint64_t)(v8 + 63) >= 0x7F)
    {
      memmove(__src, v9, 8 * v14);
      __src = *(unint64_t **)a5;
    }
    uint64_t v15 = v8 - (v14 << 6);
    unint64_t v16 = &__src[v14];
    *(void *)a5 = v16;
    if (v15 >= 1)
    {
      *unint64_t v16 = *v16 & ~(0xFFFFFFFFFFFFFFFFLL >> (((_BYTE)v14 << 6) - v8)) | v9[v14] & (0xFFFFFFFFFFFFFFFFLL >> (((_BYTE)v14 << 6) - v8));
      *(_DWORD *)(a5 + 8) = v15;
    }
  }
  *(void *)a6 = v16;
  *(_DWORD *)(a6 + 8) = *(_DWORD *)(a5 + 8);
  return __src;
}

void *std::__fill_n[abi:ne180100]<true,std::vector<BOOL>>(void *result, unint64_t a2)
{
  unint64_t v2 = a2;
  uint64_t v3 = result;
  int v4 = *((_DWORD *)result + 2);
  uint64_t v5 = (void *)*result;
  if (v4)
  {
    if ((64 - v4) >= a2) {
      unint64_t v6 = a2;
    }
    else {
      unint64_t v6 = (64 - v4);
    }
    *v5++ |= (0xFFFFFFFFFFFFFFFFLL >> (64 - v4 - v6)) & (-1 << v4);
    unint64_t v2 = a2 - v6;
    *double result = v5;
  }
  unint64_t v7 = v2 >> 6;
  if (v2 >= 0x40) {
    double result = memset(v5, 255, 8 * v7);
  }
  if ((v2 & 0x3F) != 0)
  {
    int64_t v8 = &v5[v7];
    *uint64_t v3 = v8;
    *v8 |= 0xFFFFFFFFFFFFFFFFLL >> -(v2 & 0x3F);
  }
  return result;
}

void std::__fill_n[abi:ne180100]<false,std::vector<BOOL>>(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = a2;
  int v4 = *(_DWORD *)(a1 + 8);
  uint64_t v5 = *(void **)a1;
  if (v4)
  {
    if ((64 - v4) >= a2) {
      unint64_t v6 = a2;
    }
    else {
      unint64_t v6 = (64 - v4);
    }
    *v5++ &= ~((0xFFFFFFFFFFFFFFFFLL >> (64 - v4 - v6)) & (-1 << v4));
    unint64_t v2 = a2 - v6;
    *(void *)a1 = v5;
  }
  unint64_t v7 = v2 >> 6;
  if (v2 >= 0x40) {
    bzero(v5, 8 * v7);
  }
  if ((v2 & 0x3F) != 0)
  {
    int64_t v8 = &v5[v7];
    *(void *)a1 = v8;
    *v8 &= ~(0xFFFFFFFFFFFFFFFFLL >> -(v2 & 0x3F));
  }
}

void *std::__copy_aligned[abi:ne180100]<std::vector<BOOL>,false>@<X0>(void *result@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7 = *a2;
  int64_t v8 = (void *)*result;
  uint64_t v9 = *((unsigned int *)a2 + 2) + 8 * (v7 - *result);
  uint64_t v10 = *((unsigned int *)result + 2);
  uint64_t v11 = v9 - v10;
  if (v9 - v10 <= 0)
  {
    unint64_t v19 = *(unint64_t **)a3;
  }
  else
  {
    unint64_t v12 = result;
    if (v10)
    {
      if (v11 >= (unint64_t)(64 - v10)) {
        uint64_t v13 = (64 - v10);
      }
      else {
        uint64_t v13 = v9 - v10;
      }
      v11 -= v13;
      uint64_t v14 = *(unint64_t **)a3;
      *uint64_t v14 = **(void **)a3 & ~((0xFFFFFFFFFFFFFFFFLL >> (64 - v10 - v13)) & (-1 << v10)) | *v8 & (0xFFFFFFFFFFFFFFFFLL >> (64 - v10 - v13)) & (-1 << v10);
      unint64_t v15 = v13 + *(unsigned int *)(a3 + 8);
      *(void *)a3 = (char *)v14 + ((v15 >> 3) & 0x3FFFFFF8);
      *(_DWORD *)(a3 + 8) = v15 & 0x3F;
      int64_t v8 = (void *)(*result + 8);
      *double result = v8;
    }
    if (v11 >= 0) {
      uint64_t v16 = v11;
    }
    else {
      uint64_t v16 = v11 + 63;
    }
    uint64_t v17 = v16 >> 6;
    if ((unint64_t)(v11 + 63) >= 0x7F) {
      double result = memmove(*(void **)a3, v8, 8 * v17);
    }
    uint64_t v18 = v11 - (v17 << 6);
    unint64_t v19 = (unint64_t *)(*(void *)a3 + 8 * v17);
    *(void *)a3 = v19;
    if (v18 >= 1)
    {
      uint64_t v20 = (void *)(*v12 + 8 * v17);
      *unint64_t v12 = v20;
      unint64_t v21 = 0xFFFFFFFFFFFFFFFFLL >> (((_BYTE)v17 << 6) - v11);
      unint64_t v22 = *v20 & v21;
      unint64_t v19 = *(unint64_t **)a3;
      **(void **)a3 = **(void **)a3 & ~v21 | v22;
      *(_DWORD *)(a3 + 8) = v18;
    }
  }
  *(void *)a4 = v19;
  *(_DWORD *)(a4 + 8) = *(_DWORD *)(a3 + 8);
  return result;
}

unsigned int *std::__copy_unaligned[abi:ne180100]<std::vector<BOOL>,false>@<X0>(unsigned int *result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  int v4 = *(unint64_t **)result;
  uint64_t v5 = result[2];
  uint64_t v6 = *(unsigned int *)(a2 + 8) + 8 * (*(void *)a2 - *(void *)result) - v5;
  if (v6 <= 0)
  {
    uint64_t v20 = *(uint64_t **)a3;
    unsigned int v18 = *(_DWORD *)(a3 + 8);
  }
  else
  {
    if (v5)
    {
      if (v6 >= (unint64_t)(64 - v5)) {
        unint64_t v7 = (64 - v5);
      }
      else {
        unint64_t v7 = *(unsigned int *)(a2 + 8) + 8 * (*(void *)a2 - *(void *)result) - v5;
      }
      v6 -= v7;
      unint64_t v8 = (0xFFFFFFFFFFFFFFFFLL >> (64 - v5 - v7)) & (-1 << v5) & *v4;
      uint64_t v9 = *(unsigned int *)(a3 + 8);
      if (v7 >= (64 - v9)) {
        unint64_t v10 = (64 - v9);
      }
      else {
        unint64_t v10 = v7;
      }
      uint64_t v11 = *(uint64_t **)a3;
      unint64_t v12 = v8 >> (v5 - v9);
      BOOL v13 = v9 >= v5;
      int v15 = v9 - v5;
      BOOL v14 = v15 != 0 && v13;
      unint64_t v16 = v8 << v15;
      if (!v14) {
        unint64_t v16 = v12;
      }
      uint64_t *v11 = **(void **)a3 & ~((0xFFFFFFFFFFFFFFFFLL >> (64 - v9 - v10)) & (-1 << v9)) | v16;
      uint64_t v17 = (unint64_t *)((char *)v11 + (((v10 + v9) >> 3) & 0x3FFFFFF8));
      *(void *)a3 = v17;
      unsigned int v18 = ((_BYTE)v9 + (_BYTE)v10) & 0x3F;
      *(_DWORD *)(a3 + 8) = v18;
      uint64_t v19 = v7 - v10;
      if (v19 >= 1)
      {
        unint64_t *v17 = (v8 >> (v10 + result[2])) | *v17 & ~(0xFFFFFFFFFFFFFFFFLL >> -(char)v19);
        *(_DWORD *)(a3 + 8) = v19;
        unsigned int v18 = v19;
      }
      int v4 = (unint64_t *)(*(void *)result + 8);
      *(void *)double result = v4;
    }
    else
    {
      unsigned int v18 = *(_DWORD *)(a3 + 8);
    }
    unsigned int v21 = 64 - v18;
    uint64_t v22 = -1 << v18;
    if (v6 < 64)
    {
      uint64_t v26 = v6;
    }
    else
    {
      do
      {
        unint64_t v23 = *v4;
        unint64_t v24 = *(uint64_t **)a3;
        *unint64_t v24 = **(void **)a3 & ~v22 | (v23 << v18);
        uint64_t v25 = v24[1];
        *(void *)a3 = ++v24;
        *unint64_t v24 = v25 & v22 | (v23 >> v21);
        uint64_t v26 = v6 - 64;
        int v4 = (unint64_t *)(*(void *)result + 8);
        *(void *)double result = v4;
        BOOL v14 = (unint64_t)v6 > 0x7F;
        v6 -= 64;
      }
      while (v14);
    }
    uint64_t v20 = *(uint64_t **)a3;
    if (v26 >= 1)
    {
      unint64_t v27 = *v4 & (0xFFFFFFFFFFFFFFFFLL >> -(char)v26);
      if (v26 >= (unint64_t)v21) {
        uint64_t v28 = 64 - v18;
      }
      else {
        uint64_t v28 = v26;
      }
      uint64_t *v20 = *v20 & ~((0xFFFFFFFFFFFFFFFFLL >> (v21 - v28)) & v22) | (v27 << v18);
      uint64_t v20 = (uint64_t *)((char *)v20 + (((v28 + (unint64_t)v18) >> 3) & 0x3FFFFFF8));
      *(void *)a3 = v20;
      unsigned int v18 = ((_BYTE)v18 + (_BYTE)v28) & 0x3F;
      *(_DWORD *)(a3 + 8) = v18;
      if (v26 - v28 >= 1)
      {
        uint64_t *v20 = *v20 & ~(0xFFFFFFFFFFFFFFFFLL >> (v28 - v26)) | (v27 >> v28);
        *(_DWORD *)(a3 + 8) = v26 - v28;
        unsigned int v18 = v26 - v28;
      }
    }
  }
  *(void *)a4 = v20;
  *(_DWORD *)(a4 + 8) = v18;
  return result;
}

char *std::vector<double>::__assign_with_size[abi:ne180100]<double *,double *>(char *result, char *__src, uint64_t a3, unint64_t a4)
{
  unint64_t v7 = result;
  uint64_t v8 = *((void *)result + 2);
  uint64_t v9 = *(char **)result;
  if (a4 > (v8 - *(void *)result) >> 3)
  {
    if (v9)
    {
      *((void *)result + 1) = v9;
      operator delete(v9);
      uint64_t v8 = 0;
      *unint64_t v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if (a4 >> 61) {
      std::vector<double>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v10 = v8 >> 2;
    if (v8 >> 2 <= a4) {
      uint64_t v10 = a4;
    }
    if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v11 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v11 = v10;
    }
    double result = std::vector<double>::__vallocate[abi:ne180100](v7, v11);
    BOOL v13 = (char *)v7[1];
    unint64_t v12 = (void **)(v7 + 1);
    uint64_t v9 = v13;
LABEL_16:
    size_t v17 = a3 - (void)__src;
    if (v17)
    {
      unsigned int v18 = v9;
      uint64_t v19 = __src;
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  unint64_t v12 = (void **)(result + 8);
  BOOL v14 = (unsigned char *)*((void *)result + 1);
  unint64_t v15 = (v14 - v9) >> 3;
  if (v15 >= a4) {
    goto LABEL_16;
  }
  unint64_t v16 = &__src[8 * v15];
  if (v14 != v9)
  {
    double result = (char *)memmove(*(void **)result, __src, v14 - v9);
    uint64_t v9 = (char *)*v12;
  }
  size_t v17 = a3 - (void)v16;
  if (v17)
  {
    unsigned int v18 = v9;
    uint64_t v19 = v16;
LABEL_18:
    double result = (char *)memmove(v18, v19, v17);
  }
LABEL_19:
  *unint64_t v12 = &v9[v17];
  return result;
}

void std::vector<BOOL>::__insert_with_size[abi:ne180100]<std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>>(uint64_t a1@<X0>, unint64_t a2@<X1>, unsigned int a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, unint64_t a6@<X5>, uint64_t a7@<X8>)
{
  *(void *)a7 = 0;
  *(_DWORD *)(a7 + 8) = 0;
  unint64_t v15 = *(void *)(a1 + 8);
  uint64_t v14 = *(void *)(a1 + 16);
  if (v14 << 6 < a6 || v15 > (v14 << 6) - a6)
  {
    uint64_t v39 = 0;
    long long v40 = 0uLL;
    uint64_t v17 = v15 + a6;
    if (v17 < 0) {
      std::vector<double>::__throw_length_error[abi:ne180100]();
    }
    if ((unint64_t)(v14 << 6) > 0x3FFFFFFFFFFFFFFELL)
    {
      unint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      unint64_t v18 = v14 << 7;
      unint64_t v19 = (v17 + 63) & 0xFFFFFFFFFFFFFFC0;
      if (v18 <= v19) {
        unint64_t v20 = v19;
      }
      else {
        unint64_t v20 = v18;
      }
    }
    std::vector<BOOL>::reserve(&v39, v20);
    unint64_t v27 = *(unint64_t **)a1;
    *(void *)&long long v40 = *(void *)(a1 + 8) + a6;
    long long v45 = v39;
    int v46 = 0;
    std::__copy_aligned[abi:ne180100]<std::vector<BOOL>,true>(v27, 0, a2, a3, (uint64_t)&v45, (uint64_t)&v43);
    uint64_t v28 = v43;
    *(void *)a7 = v43;
    int v29 = v44;
    *(_DWORD *)(a7 + 8) = v44;
    unint64_t v30 = *(void *)(a1 + 8);
    uint64_t v31 = (void *)(*(void *)a1 + 8 * (v30 >> 6));
    unsigned int v32 = v30 & 0x3F;
    long long v45 = &v39[8 * ((unint64_t)v40 >> 6)];
    int v46 = v40 & 0x3F;
    if (v46 == v32) {
      std::__copy_backward_aligned[abi:ne180100]<std::vector<BOOL>,true>(a2, a3, v31, v32, (uint64_t)&v45, (uint64_t)&v43);
    }
    else {
      std::__copy_backward_unaligned[abi:ne180100]<std::vector<BOOL>,true>(a2, a3, v31, v32, (uint64_t)&v45, (uint64_t)&v43);
    }
    int v33 = *(char **)a1;
    *(void *)a1 = v39;
    uint64_t v39 = v33;
    long long v34 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v40;
    long long v40 = v34;
    if (v33) {
      operator delete(v33);
    }
  }
  else
  {
    unsigned int v21 = *(unint64_t **)a1;
    uint64_t v22 = (void *)(*(void *)a1 + 8 * (v15 >> 6));
    uint64_t v23 = *(void *)(a1 + 8) & 0x3FLL;
    unsigned int v24 = v15 & 0x3F;
    *(void *)(a1 + 8) = v15 + a6;
    uint64_t v39 = (char *)&v21[(v15 + a6) >> 6];
    if ((((_BYTE)v15 + (_BYTE)a6) & 0x3F) == v23)
    {
      LODWORD(v40) = v23;
      std::__copy_backward_aligned[abi:ne180100]<std::vector<BOOL>,true>(a2, a3, v22, v24, (uint64_t)&v39, (uint64_t)&v45);
    }
    else
    {
      LODWORD(v40) = ((_BYTE)v15 + (_BYTE)a6) & 0x3F;
      std::__copy_backward_unaligned[abi:ne180100]<std::vector<BOOL>,true>(a2, a3, v22, v24, (uint64_t)&v39, (uint64_t)&v45);
    }
    uint64_t v25 = 8 * (a2 - *(void *)a1) + a3;
    if (v25 < 0)
    {
      uint64_t v35 = v25 - 63;
      if (v25 - 63 < 0) {
        uint64_t v35 = 8 * (a2 - *(void *)a1) + a3;
      }
      uint64_t v26 = v35 >> 6;
    }
    else
    {
      uint64_t v26 = (unint64_t)v25 >> 6;
    }
    uint64_t v28 = *(void *)a1 + 8 * v26;
    int v29 = v25 & 0x3F;
    *(void *)a7 = v28;
    *(_DWORD *)(a7 + 8) = v29;
  }
  int v36 = *(_DWORD *)(a4 + 8);
  uint64_t v37 = *(void *)a5;
  int v38 = *(_DWORD *)(a5 + 8);
  long long v45 = *(char **)a4;
  int v46 = v36;
  uint64_t v43 = v37;
  int v44 = v38;
  uint64_t v41 = v28;
  int v42 = v29;
  std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>,std::__bit_iterator<std::vector<BOOL>,false,0ul>,0>((uint64_t *)&v45, &v43, &v41, (uint64_t)&v39);
}

void sub_2477E0BB4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::__count[abi:ne180100]<std::_ClassicAlgPolicy,std::vector<BOOL>,false,int,std::__identity,0>(uint64_t *a1, uint64_t a2, _DWORD *a3)
{
  uint64_t v3 = *a1;
  if (*a3)
  {
    uint64_t v6 = *a1;
    return std::__count_BOOL[abi:ne180100]<true,std::vector<BOOL>,false>((uint64_t)&v6, *(unsigned int *)(a2 + 8) - (unint64_t)*((unsigned int *)a1 + 2) + 8 * (*(void *)a2 - v3));
  }
  else
  {
    uint64_t v5 = *a1;
    return std::__count_BOOL[abi:ne180100]<false,std::vector<BOOL>,false>((uint64_t)&v5, *(unsigned int *)(a2 + 8) - (unint64_t)*((unsigned int *)a1 + 2) + 8 * (*(void *)a2 - v3));
  }
}

uint64_t std::__count_BOOL[abi:ne180100]<true,std::vector<BOOL>,false>(uint64_t a1, unint64_t a2)
{
  int v2 = *(_DWORD *)(a1 + 8);
  if (v2)
  {
    if ((64 - v2) >= a2) {
      unint64_t v3 = a2;
    }
    else {
      unint64_t v3 = (64 - v2);
    }
    uint8x8_t v4 = (uint8x8_t)vcnt_s8((int8x8_t)((0xFFFFFFFFFFFFFFFFLL >> (64 - v2 - v3)) & (-1 << v2) & **(void **)a1));
    v4.i16[0] = vaddlv_u8(v4);
    uint64_t v5 = v4.u32[0];
    a2 -= v3;
    *(void *)a1 += 8;
  }
  else
  {
    uint64_t v5 = 0;
  }
  if (a2 >= 0x40)
  {
    uint64_t v6 = *(int8x8_t **)a1;
    do
    {
      int8x8_t v7 = *v6++;
      uint8x8_t v8 = (uint8x8_t)vcnt_s8(v7);
      v8.i16[0] = vaddlv_u8(v8);
      v5 += v8.u32[0];
      a2 -= 64;
    }
    while (a2 > 0x3F);
    *(void *)a1 = v6;
  }
  if (a2)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)(**(void **)a1 & (0xFFFFFFFFFFFFFFFFLL >> -(char)a2)));
    v9.i16[0] = vaddlv_u8(v9);
    v5 += v9.u32[0];
  }
  return v5;
}

uint64_t std::__count_BOOL[abi:ne180100]<false,std::vector<BOOL>,false>(uint64_t a1, unint64_t a2)
{
  int v2 = *(_DWORD *)(a1 + 8);
  if (v2)
  {
    if ((64 - v2) >= a2) {
      unint64_t v3 = a2;
    }
    else {
      unint64_t v3 = (64 - v2);
    }
    uint8x8_t v4 = (uint8x8_t)vcnt_s8((int8x8_t)((0xFFFFFFFFFFFFFFFFLL >> (64 - v2 - v3)) & (-1 << v2) & ~**(void **)a1));
    v4.i16[0] = vaddlv_u8(v4);
    uint64_t v5 = v4.u32[0];
    a2 -= v3;
    *(void *)a1 += 8;
  }
  else
  {
    uint64_t v5 = 0;
  }
  if (a2 >= 0x40)
  {
    uint64_t v6 = *(uint64_t **)a1;
    do
    {
      uint64_t v7 = *v6++;
      uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)~v7);
      v8.i16[0] = vaddlv_u8(v8);
      v5 += v8.u32[0];
      a2 -= 64;
    }
    while (a2 > 0x3F);
    *(void *)a1 = v6;
  }
  if (a2)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)((0xFFFFFFFFFFFFFFFFLL >> -(char)a2) & ~**(void **)a1));
    v9.i16[0] = vaddlv_u8(v9);
    v5 += v9.u32[0];
  }
  return v5;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(4 * a2);
}

void *std::vector<double>::vector(void *a1, unint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<double>::__vallocate[abi:ne180100](a1, a2);
    uint8x8_t v4 = (char *)a1[1];
    bzero(v4, 8 * a2);
    a1[1] = &v4[8 * a2];
  }
  return a1;
}

void sub_2477E0E6C(_Unwind_Exception *exception_object)
{
  unint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void *std::vector<double>::__init_with_size[abi:ne180100]<std::__wrap_iter<double const*>,std::__wrap_iter<double const*>>(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    double result = std::vector<double>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      double result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_2477E0EE8(_Unwind_Exception *exception_object)
{
  unint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void *std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,double const*,double const*,std::back_insert_iterator<std::vector<double>>,0>(void *a1, void *a2, uint64_t a3)
{
  unint64_t v3 = a1;
  uint64_t v6 = a3;
  if (a1 == a2) {
    return a1;
  }
  uint8x8_t v4 = a2;
  do
    std::back_insert_iterator<std::vector<double>>::operator=[abi:ne180100](&v6, v3++);
  while (v3 != v4);
  return v4;
}

uint64_t *std::back_insert_iterator<std::vector<double>>::operator=[abi:ne180100](uint64_t *a1, void *a2)
{
  uint64_t v4 = *a1;
  uint64_t v5 = *(void **)(*a1 + 8);
  uint64_t v6 = (void *)(*a1 + 16);
  if ((unint64_t)v5 >= *v6)
  {
    size_t v8 = *(void **)v4;
    uint64_t v9 = ((uint64_t)v5 - *(void *)v4) >> 3;
    unint64_t v10 = v9 + 1;
    if ((unint64_t)(v9 + 1) >> 61) {
      std::vector<double>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v11 = *v6 - (void)v8;
    if (v11 >> 2 > v10) {
      unint64_t v10 = v11 >> 2;
    }
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v12 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v10;
    }
    if (v12)
    {
      BOOL v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)v6, v12);
      size_t v8 = *(void **)v4;
      uint64_t v5 = *(void **)(v4 + 8);
    }
    else
    {
      BOOL v13 = 0;
    }
    uint64_t v14 = &v13[8 * v9];
    unint64_t v15 = &v13[8 * v12];
    *(void *)uint64_t v14 = *a2;
    uint64_t v7 = v14 + 8;
    while (v5 != v8)
    {
      uint64_t v16 = *--v5;
      *((void *)v14 - 1) = v16;
      v14 -= 8;
    }
    *(void *)uint64_t v4 = v14;
    *(void *)(v4 + 8) = v7;
    *(void *)(v4 + 16) = v15;
    if (v8) {
      operator delete(v8);
    }
  }
  else
  {
    *uint64_t v5 = *a2;
    uint64_t v7 = v5 + 1;
  }
  *(void *)(v4 + 8) = v7;
  return a1;
}

double std::__nth_element[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<double *>>(double *a1, double *a2, double *a3, double result)
{
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    do
    {
      unint64_t v7 = v4 - a1;
      if (v7 < 2) {
        break;
      }
      if (v7 == 3)
      {
        std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<double *>>(a1, a1 + 1, v4 - 1);
        return result;
      }
      if (v7 == 2)
      {
        double result = *(v4 - 1);
        double v30 = *a1;
        if (result < *a1)
        {
          *a1 = result;
          *(v4 - 1) = v30;
        }
        return result;
      }
      if ((char *)v4 - (char *)a1 <= 63)
      {
        return std::__selection_sort[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<double *>>(a1, v4, result);
      }
      size_t v8 = &a1[v7 >> 1];
      uint64_t v9 = v4 - 1;
      int v10 = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<double *>>(a1, v8, v4 - 1);
      double result = *a1;
      if (*a1 >= *v8)
      {
        uint64_t v11 = v4 - 1;
        while (--v11 != a1)
        {
          if (*v11 < *v8)
          {
            *a1 = *v11;
            double *v11 = result;
            ++v10;
            goto LABEL_13;
          }
        }
        unsigned int v21 = a1 + 1;
        if (result >= *v9)
        {
          while (v21 != v9)
          {
            double v22 = *v21;
            if (result < *v21)
            {
              *v21++ = *v9;
              double *v9 = v22;
              goto LABEL_45;
            }
            ++v21;
          }
          return result;
        }
LABEL_45:
        if (v21 == v9) {
          return result;
        }
        while (1)
        {
          double v25 = *a1;
          do
          {
            double v26 = *v21++;
            double result = v26;
          }
          while (v25 >= v26);
          unint64_t v27 = v21 - 1;
          do
          {
            double v28 = *--v9;
            double v29 = v28;
          }
          while (v25 < v28);
          if (v27 >= v9) {
            break;
          }
          *unint64_t v27 = v29;
          double *v9 = result;
        }
        a1 = v21 - 1;
        if (v27 > a2) {
          return result;
        }
      }
      else
      {
        uint64_t v11 = v4 - 1;
LABEL_13:
        unint64_t v12 = a1 + 1;
        if (a1 + 1 >= v11)
        {
          uint64_t v16 = a1 + 1;
        }
        else
        {
          BOOL v13 = a1 + 1;
          while (1)
          {
            double v14 = *v8;
            do
            {
              double v15 = *v13++;
              double result = v15;
            }
            while (v15 < v14);
            uint64_t v16 = v13 - 1;
            do
            {
              double v17 = *--v11;
              double v18 = v17;
            }
            while (v17 >= v14);
            if (v16 >= v11) {
              break;
            }
            *uint64_t v16 = v18;
            double *v11 = result;
            ++v10;
            if (v16 == v8) {
              size_t v8 = v11;
            }
          }
        }
        if (v16 != v8)
        {
          double result = *v8;
          double v19 = *v16;
          if (*v8 < *v16)
          {
            *uint64_t v16 = result;
            double *v8 = v19;
            ++v10;
          }
        }
        if (v16 == a2) {
          return result;
        }
        if (!v10)
        {
          if (v16 <= a2)
          {
            uint64_t v23 = v16 + 1;
            while (v23 != v4)
            {
              double v24 = *(v23 - 1);
              double result = *v23++;
              if (result < v24) {
                goto LABEL_29;
              }
            }
          }
          else
          {
            while (v12 != v16)
            {
              double v20 = *(v12 - 1);
              double result = *v12++;
              if (result < v20) {
                goto LABEL_29;
              }
            }
          }
          return result;
        }
LABEL_29:
        if (v16 <= a2) {
          a1 = v16 + 1;
        }
        else {
          uint64_t v4 = v16;
        }
      }
    }
    while (v4 != a2);
  }
  return result;
}

uint64_t std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<double *>>(double *a1, double *a2, double *a3)
{
  double v3 = *a2;
  double v4 = *a1;
  double v5 = *a3;
  if (*a2 < *a1)
  {
    if (v5 < v3)
    {
      *a1 = v5;
      *a3 = v4;
      return 1;
    }
    *a1 = v3;
    *a2 = v4;
    if (*a3 >= v4) {
      return 1;
    }
    *a2 = *a3;
    *a3 = v4;
    return 2;
  }
  if (v5 < v3)
  {
    *a2 = v5;
    *a3 = v3;
    double v6 = *a1;
    if (*a2 >= *a1) {
      return 1;
    }
    *a1 = *a2;
    *a2 = v6;
    return 2;
  }
  return 0;
}

double std::__selection_sort[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<double *>>(double *a1, double *a2, double result)
{
  while (a1 != a2 - 1)
  {
    double v3 = a1++;
    if (v3 != a2 && a1 != a2)
    {
      double result = *v3;
      double v4 = a1;
      double v5 = v3;
      double v6 = a1;
      do
      {
        double v7 = *v6++;
        double v8 = v7;
        if (v7 < result)
        {
          double result = v8;
          double v5 = v4;
        }
        double v4 = v6;
      }
      while (v6 != a2);
      if (v5 != v3)
      {
        double result = *v3;
        *double v3 = *v5;
        *double v5 = result;
      }
    }
  }
  return result;
}

void beryllium::BerylliumProcessor::interpolate_Tachograms_and_calc_AFibBurden(os_log_t log, float a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  double v3 = a2;
  _os_log_debug_impl(&dword_2477CF000, log, OS_LOG_TYPE_DEBUG, "\nAfib burden without interpolation: %f", (uint8_t *)&v2, 0xCu);
}

void beryllium::BerylliumProcessor::median()
{
}

{
  __assert_rtn("median", "beryllium_core.cpp", 430, "x != NULL");
}

float stats::mean(stats *this, const float *a2)
{
  if ((int)a2 <= 0) {
    stats::mean();
  }
  if (!this) {
    stats::mean();
  }
  float v3 = 0.0;
  vDSP_meanv_wrapper((uint64_t)this, 1, &v3, a2);
  return v3;
}

float stats::variance(stats *this, const float *a2, int a3)
{
  if ((int)a2 <= 0) {
    stats::variance();
  }
  if (!this) {
    stats::variance();
  }
  int v5 = (int)a2;
  uint64_t v11 = 0;
  uint64_t __A = 0;
  double __C = 0;
  int v10 = 0;
  vDSP_Length v6 = a2;
  std::vector<float>::reserve((void **)&__C, a2);
  vDSP_meanv_wrapper((uint64_t)this, 1, (float *)&__A + 1, v6);
  vDSP_vsub((const float *)this->cp_time, 1, (const float *)&__A + 1, 0, __C, 1, v6);
  vDSP_dotpr(__C, 1, __C, 1, (float *)&__A, v6);
  float v7 = *(float *)&__A / (float)(v5 - (a3 ^ 1));
  *(float *)&uint64_t __A = v7;
  if (__C)
  {
    int v10 = __C;
    operator delete(__C);
  }
  return v7;
}

void sub_2477E206C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::vector<float>::reserve(void **a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (unsigned char *)*a1) >> 2)
  {
    if (a2 >> 62) {
      std::vector<float>::__throw_length_error[abi:ne180100]();
    }
    int64_t v5 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    vDSP_Length v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(v3, a2);
    float v7 = &v6[v5 & 0xFFFFFFFFFFFFFFFCLL];
    uint64_t v9 = &v6[4 * v8];
    int v10 = (char *)*a1;
    uint64_t v11 = (char *)a1[1];
    unint64_t v12 = v7;
    if (v11 != *a1)
    {
      unint64_t v12 = v7;
      do
      {
        int v13 = *((_DWORD *)v11 - 1);
        v11 -= 4;
        *((_DWORD *)v12 - 1) = v13;
        v12 -= 4;
      }
      while (v11 != v10);
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
    {
      operator delete(v10);
    }
  }
}

float stats::covariance(stats *this, const float *a2, const float *a3, const float *a4, int a5)
{
  if ((int)a2 <= 0) {
    stats::covariance();
  }
  unsigned int v5 = a2;
  if (a4 != a2) {
    stats::covariance();
  }
  if (!this) {
    stats::covariance();
  }
  if (!a3) {
    stats::covariance();
  }
  uint64_t __A = 0;
  float v17 = 0.0;
  double __C = 0;
  double v15 = 0;
  uint64_t v16 = 0;
  double __B = 0;
  unint64_t v12 = 0;
  uint64_t v13 = 0;
  std::vector<float>::reserve((void **)&__C, a2);
  std::vector<float>::reserve((void **)&__B, v5);
  vDSP_meanv_wrapper((uint64_t)this, 1, (float *)&__A + 1, v5);
  vDSP_vsub((const float *)this->cp_time, 1, (const float *)&__A + 1, 0, __C, 1, v5);
  vDSP_meanv_wrapper((uint64_t)a3, 1, (float *)&__A, v5);
  vDSP_vsub(a3, 1, (const float *)&__A, 0, __B, 1, v5);
  vDSP_dotpr(__C, 1, __B, 1, &v17, v5);
  float v9 = v17 / (float)(int)(v5 - (a5 ^ 1));
  float v17 = v9;
  if (__B)
  {
    unint64_t v12 = __B;
    operator delete(__B);
  }
  if (__C)
  {
    double v15 = __C;
    operator delete(__C);
  }
  return v9;
}

void sub_2477E2298(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, void *a12, uint64_t a13)
{
  if (__p) {
    operator delete(__p);
  }
  if (a12) {
    operator delete(a12);
  }
  _Unwind_Resume(exception_object);
}

float stats::std(stats *this, const float *a2, int a3)
{
  if ((int)a2 <= 0) {
    stats::std();
  }
  if (!this) {
    stats::std();
  }
  return sqrtf(stats::variance(this, a2, a3));
}

float stats::rmssd(stats *this, const float *a2)
{
  if ((int)a2 <= 0) {
    stats::rmssd();
  }
  if (!this) {
    stats::rmssd();
  }
  float v9 = 0.0;
  double __C = 0;
  float v7 = 0;
  unint64_t v3 = (a2 - 1);
  uint64_t v8 = 0;
  std::vector<float>::reserve((void **)&__C, v3);
  vDSP_vsub((const float *)&this->cp_time[1], 1, (const float *)this->cp_time, 1, __C, 1, v3);
  vDSP_dotpr(__C, 1, __C, 1, &v9, v3);
  float v4 = sqrtf(v9 / (float)(int)v3);
  float v9 = v4;
  if (__C)
  {
    float v7 = __C;
    operator delete(__C);
  }
  return v4;
}

void sub_2477E23B8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

float stats::madsd(stats *this, const float *a2)
{
  if ((int)a2 <= 0) {
    stats::madsd();
  }
  if (!this) {
    stats::madsd();
  }
  float v9 = 0.0;
  double __C = 0;
  float v7 = 0;
  unint64_t v3 = (a2 - 1);
  uint64_t v8 = 0;
  std::vector<float>::reserve((void **)&__C, v3);
  vDSP_vsub((const float *)&this->cp_time[1], 1, (const float *)this->cp_time, 1, __C, 1, v3);
  vDSP_vabs(__C, 1, __C, 1, v3);
  vDSP_meanv_wrapper((uint64_t)__C, 1, &v9, v3);
  float v4 = v9;
  if (__C)
  {
    float v7 = __C;
    operator delete(__C);
  }
  return v4;
}

void sub_2477E2498(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

float stats::mad(stats *this, const float *a2)
{
  if ((int)a2 <= 0) {
    stats::mad();
  }
  if (!this) {
    stats::mad();
  }
  uint64_t v8 = 0;
  uint64_t __A = 0;
  double __C = 0;
  float v7 = 0;
  vDSP_Length v3 = a2;
  std::vector<float>::reserve((void **)&__C, a2);
  vDSP_meanv_wrapper((uint64_t)this, 1, (float *)&__A, v3);
  vDSP_vsub((const float *)this->cp_time, 1, (const float *)&__A, 0, __C, 1, v3);
  vDSP_vabs(__C, 1, __C, 1, v3);
  vDSP_meanv_wrapper((uint64_t)__C, 1, (float *)&__A + 1, v3);
  float v4 = *((float *)&__A + 1);
  if (__C)
  {
    float v7 = __C;
    operator delete(__C);
  }
  return v4;
}

void sub_2477E2588(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

float stats::mad_median(stats *this, const float *a2)
{
  if ((int)a2 <= 0) {
    stats::mad_median();
  }
  if (!this) {
    stats::mad_median();
  }
  float __A = 0.0;
  double __C = 0;
  uint64_t v8 = 0;
  vDSP_Length v4 = a2;
  uint64_t v9 = 0;
  std::vector<float>::reserve((void **)&__C, a2);
  float __A = stats::median(this, a2);
  vDSP_vsub((const float *)this->cp_time, 1, &__A, 0, __C, 1, v4);
  vDSP_vabs(__C, 1, __C, 1, v4);
  float v5 = stats::median((stats *)__C, a2);
  if (__C)
  {
    uint64_t v8 = __C;
    operator delete(__C);
  }
  return v5;
}

void sub_2477E267C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

float stats::median(stats *this, const float *a2)
{
  if ((int)a2 <= 0) {
    stats::median();
  }
  if (!this) {
    stats::median();
  }
  char v3 = (char)a2;
  std::string __p = 0;
  double v18 = 0;
  uint64_t v4 = a2;
  uint64_t v19 = 0;
  std::vector<float>::reserve(&__p, a2);
  std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,float const*,float const*,std::back_insert_iterator<std::vector<float>>,0>(this, &this->cp_time[v4], (uint64_t)&__p);
  vDSP_Length v6 = (float *)__p;
  float v7 = v18;
  unint64_t v8 = ((char *)v18 - (unsigned char *)__p) >> 2;
  if (v3)
  {
    unint64_t v14 = (2 * v8 - 2) & 0xFFFFFFFFFFFFFFFCLL;
    double v15 = (float *)((char *)__p + v14);
    if ((char *)__p + v14 != (char *)v18) {
      std::__nth_element[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<float *>>((float *)__p, (float *)((char *)__p + v14), v18, v5);
    }
    float v13 = *v15;
  }
  else
  {
    unint64_t v9 = v8 >> 1;
    int v10 = (float *)((char *)__p + 4 * v9 - 4);
    if (v10 != v18)
    {
      float v5 = std::__nth_element[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<float *>>((float *)__p, (float *)__p + v9 - 1, v18, v5);
      vDSP_Length v6 = (float *)__p;
      float v7 = v18;
      unint64_t v9 = (unint64_t)(((char *)v18 - (unsigned char *)__p) >> 2) >> 1;
    }
    float v11 = *v10;
    unint64_t v12 = &v6[v9];
    if (v12 != v7) {
      std::__nth_element[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<float *>>(v6, &v6[v9], v7, v5);
    }
    float v13 = (float)(v11 + *v12) * 0.5;
  }
  if (__p)
  {
    double v18 = (float *)__p;
    operator delete(__p);
  }
  return v13;
}

void sub_2477E27BC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

float stats::range(stats *this, const float *a2)
{
  if ((int)a2 <= 0) {
    stats::range();
  }
  if (!this) {
    stats::range();
  }
  uint64_t v5 = 0;
  uint64_t v3 = a2;
  vDSP_maxv_wrapper((uint64_t)this, 1, (float *)&v5 + 1, a2);
  vDSP_minv_wrapper((uint64_t)this, 1, (float *)&v5, v3);
  return *((float *)&v5 + 1) - *(float *)&v5;
}

float stats::max(stats *this, const float *a2)
{
  if ((int)a2 <= 0) {
    stats::max();
  }
  if (!this) {
    stats::max();
  }
  float v3 = 0.0;
  vDSP_maxv_wrapper((uint64_t)this, 1, &v3, a2);
  return v3;
}

float stats::min(stats *this, const float *a2)
{
  if ((int)a2 <= 0) {
    stats::min();
  }
  if (!this) {
    stats::min();
  }
  float v3 = 0.0;
  vDSP_minv_wrapper((uint64_t)this, 1, &v3, a2);
  return v3;
}

void stats::median_vdsp(stats *this, vDSP_Length *a2, unint64_t *a3)
{
  if ((int)a3 <= 0) {
    stats::median_vdsp();
  }
  if (!this) {
    stats::median_vdsp();
  }
  if (!a2) {
    stats::median_vdsp();
  }
  stats::percentile(this, a2, (vDSP_Length)a3, 50.0);
}

void stats::percentile(stats *this, vDSP_Length *__I, vDSP_Length __N, float a4)
{
  if ((int)__N <= 0) {
    stats::percentile();
  }
  if (!this) {
    stats::percentile();
  }
  if (!__I) {
    stats::percentile();
  }
  if (a4 < 0.0 || a4 > 100.0) {
    stats::percentile();
  }
  vDSP_vsorti((const float *)this->cp_time, __I, 0, __N, 1);
}

float stats::auc(stats *this, const float *a2, float a3)
{
  float __C = 0.0;
  vDSP_sve((const float *)this->cp_time, 1, &__C, (int)a2);
  return __C * a3;
}

float stats::meanMag(stats *this, const float *a2, vDSP_Length __N)
{
  if ((int)__N <= 0) {
    stats::meanMag();
  }
  if (!this) {
    stats::meanMag();
  }
  float __C = 0.0;
  vDSP_meamgv((const float *)this->cp_time, (int)a2, &__C, __N);
  return __C;
}

float stats::measqv(stats *this, const float *a2, vDSP_Length __N)
{
  if ((int)__N <= 0) {
    stats::measqv();
  }
  if (!this) {
    stats::measqv();
  }
  float __C = 0.0;
  vDSP_measqv((const float *)this->cp_time, (int)a2, &__C, __N);
  return __C;
}

float stats::meassq(stats *this, const float *a2, vDSP_Length __N)
{
  if ((int)__N <= 0) {
    stats::meassq();
  }
  if (!this) {
    stats::meassq();
  }
  float __C = 0.0;
  vDSP_mvessq((const float *)this->cp_time, (int)a2, &__C, __N);
  return __C;
}

float stats::rmsqv(stats *this, const float *a2, vDSP_Length __N)
{
  if ((int)__N <= 0) {
    stats::rmsqv();
  }
  if (!this) {
    stats::rmsqv();
  }
  float __C = 0.0;
  vDSP_rmsqv((const float *)this->cp_time, (int)a2, &__C, __N);
  return __C;
}

void stats::kurt(stats *this, const float *a2)
{
  if ((int)a2 <= 0) {
    stats::kurt();
  }
  int v2 = this;
  if (!this) {
    stats::kurt();
  }
  float v4 = stats::variance(this, a2, 0);
  float v5 = stats::mean(v2, a2);
  if (v4 != 0.0)
  {
    double v6 = v5;
    uint64_t v7 = a2;
    double v8 = 0.0;
    do
    {
      float v9 = *(float *)v2->cp_time;
      int v2 = (stats *)((char *)v2 + 4);
      double v10 = (v9 - v6) * (v9 - v6);
      double v8 = v8 + v10 * v10;
      --v7;
    }
    while (v7);
  }
}

stats *stats::linear_interp(stats *this, float *a2, float *a3, int a4)
{
  if (a4 >= 1)
  {
    uint64_t v4 = a4;
    float v5 = a2;
    do
    {
      *v5++ = *(float *)this->cp_time;
      --v4;
    }
    while (v4);
  }
  if ((int)a3 > 1)
  {
    uint64_t v6 = 1;
    uint64_t v7 = &a2[a4];
    do
    {
      if (a4 >= 1)
      {
        for (uint64_t i = 0; i != a4; ++i)
          v7[i] = *(float *)&this->cp_time[v6 - 1]
                + (float)((float)((float)(*(float *)&this->cp_time[v6] - *(float *)&this->cp_time[v6 - 1])
                                * (float)(i + 1))
                        / (float)a4);
      }
      ++v6;
      v7 += a4;
    }
    while (v6 != a3);
  }
  return this;
}

float stats::pearsonr(stats *this, stats *a2, const float *a3)
{
  float v5 = this;
  float v6 = stats::mean(this, a3);
  float v7 = stats::mean(a2, a3);
  float v8 = stats::std(v5, a3, 1);
  float v9 = stats::std(a2, a3, 1);
  if ((int)a3 < 1)
  {
    double v11 = 0.0;
  }
  else
  {
    uint64_t v10 = a3;
    double v11 = 0.0;
    do
    {
      float v12 = *(float *)v5->cp_time;
      float v5 = (stats *)((char *)v5 + 4);
      double v13 = v12 - v6;
      float v14 = *(float *)a2->cp_time;
      a2 = (stats *)((char *)a2 + 4);
      double v11 = v11 + v13 * (v14 - v7);
      --v10;
    }
    while (v10);
  }
  return v11 / ((double)(int)a3 * v8 * v9);
}

void stats::median_filt(stats *this, const float *a2, float *a3, int a4, int a5)
{
  if ((int)a3 <= 0) {
    stats::median_filt();
  }
  if (!this) {
    stats::median_filt();
  }
  if (!a2) {
    stats::median_filt();
  }
  unsigned int v8 = a3;
  std::string __p = 0;
  double v29 = 0;
  uint64_t v30 = 0;
  std::vector<float>::reserve(&__p, a3);
  if (a4 >= 1)
  {
    uint64_t v9 = 0;
    uint64_t v10 = a4;
    unint64_t v11 = v8 >> 1;
    uint64_t v23 = &this->cp_time[a4];
    uint64_t v24 = a4 - (int)v11;
    int v25 = v8 - v11;
    BOOL v12 = (v8 & 1) == 0;
    double v13 = &this->cp_time[2 * a4 - (int)v11];
    if (v12) {
      uint64_t v14 = 0;
    }
    else {
      uint64_t v14 = -1;
    }
    int v22 = v11 - a4;
    unint64_t v15 = v11;
    uint64_t v16 = &this->cp_time[v11];
    do
    {
      std::vector<float>::resize((uint64_t)&__p, 0);
      if (v9 >= v11)
      {
        if (v9 > v24)
        {
          if (a5)
          {
            int v27 = 0;
            std::vector<float>::resize((uint64_t)&__p, v22 + (int)v9, &v27);
          }
          else
          {
            std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,float const*,float const*,std::back_insert_iterator<std::vector<float>>,0>(v13, v23, (uint64_t)&__p);
          }
          int v17 = v9 - v11;
          int v18 = v10;
          goto LABEL_21;
        }
        int v17 = v9 - v11;
      }
      else
      {
        if (a5)
        {
          int v27 = 0;
          std::vector<float>::resize((uint64_t)&__p, v15, &v27);
        }
        else
        {
          std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,float const*,float const*,std::back_insert_iterator<std::vector<float>>,0>(this, v16, (uint64_t)&__p);
        }
        int v17 = 0;
      }
      int v18 = v25 + v9;
LABEL_21:
      std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,float const*,float const*,std::back_insert_iterator<std::vector<float>>,0>(&this->cp_time[v17], &this->cp_time[v18], (uint64_t)&__p);
      unint64_t v20 = (unint64_t)(v14 + (((char *)v29 - (unsigned char *)__p) >> 2)) >> 1;
      unsigned int v21 = (float *)((char *)__p + 4 * v20);
      if (v21 != v29) {
        std::__nth_element[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<float *>>((float *)__p, (float *)__p + v20, v29, v19);
      }
      a2[v9++] = *v21;
      --v15;
      --v13;
      --v16;
    }
    while (v10 != v9);
  }
  if (__p)
  {
    double v29 = (float *)__p;
    operator delete(__p);
  }
}

void sub_2477E2FC8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::vector<float>::resize(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 2;
  if (a2 <= v2)
  {
    if (a2 < v2) {
      *(void *)(a1 + 8) = *(void *)a1 + 4 * a2;
    }
  }
  else
  {
    std::vector<float>::__append((char **)a1, a2 - v2);
  }
}

void std::vector<float>::resize(uint64_t a1, unint64_t a2, _DWORD *a3)
{
  unint64_t v3 = (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 2;
  if (a2 <= v3)
  {
    if (a2 < v3) {
      *(void *)(a1 + 8) = *(void *)a1 + 4 * a2;
    }
  }
  else
  {
    std::vector<float>::__append((void **)a1, a2 - v3, a3);
  }
}

void std::vector<float>::__throw_length_error[abi:ne180100]()
{
}

void sub_2477E30B4(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

_DWORD *std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,float const*,float const*,std::back_insert_iterator<std::vector<float>>,0>(_DWORD *a1, _DWORD *a2, uint64_t a3)
{
  unint64_t v3 = a1;
  uint64_t v6 = a3;
  if (a1 == a2) {
    return a1;
  }
  uint64_t v4 = a2;
  do
    std::back_insert_iterator<std::vector<float>>::operator=[abi:ne180100](&v6, v3++);
  while (v3 != v4);
  return v4;
}

uint64_t *std::back_insert_iterator<std::vector<float>>::operator=[abi:ne180100](uint64_t *a1, _DWORD *a2)
{
  uint64_t v4 = *a1;
  float v5 = *(_DWORD **)(*a1 + 8);
  uint64_t v6 = (void *)(*a1 + 16);
  if ((unint64_t)v5 >= *v6)
  {
    unsigned int v8 = *(_DWORD **)v4;
    uint64_t v9 = ((uint64_t)v5 - *(void *)v4) >> 2;
    unint64_t v10 = v9 + 1;
    if ((unint64_t)(v9 + 1) >> 62) {
      std::vector<float>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v11 = *v6 - (void)v8;
    if (v11 >> 1 > v10) {
      unint64_t v10 = v11 >> 1;
    }
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v12 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v10;
    }
    if (v12)
    {
      double v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)v6, v12);
      unsigned int v8 = *(_DWORD **)v4;
      float v5 = *(_DWORD **)(v4 + 8);
    }
    else
    {
      double v13 = 0;
    }
    uint64_t v14 = &v13[4 * v9];
    unint64_t v15 = &v13[4 * v12];
    *(_DWORD *)uint64_t v14 = *a2;
    float v7 = v14 + 4;
    while (v5 != v8)
    {
      int v16 = *--v5;
      *((_DWORD *)v14 - 1) = v16;
      v14 -= 4;
    }
    *(void *)uint64_t v4 = v14;
    *(void *)(v4 + 8) = v7;
    *(void *)(v4 + 16) = v15;
    if (v8) {
      operator delete(v8);
    }
  }
  else
  {
    *float v5 = *a2;
    float v7 = v5 + 1;
  }
  *(void *)(v4 + 8) = v7;
  return a1;
}

float std::__nth_element[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<float *>>(float *a1, float *a2, float *a3, float result)
{
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    do
    {
      unint64_t v7 = v4 - a1;
      if (v7 < 2) {
        break;
      }
      if (v7 == 3)
      {
        std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<float *>>(a1, a1 + 1, v4 - 1);
        return result;
      }
      if (v7 == 2)
      {
        double result = *(v4 - 1);
        float v30 = *a1;
        if (result < *a1)
        {
          *a1 = result;
          *(v4 - 1) = v30;
        }
        return result;
      }
      if ((char *)v4 - (char *)a1 <= 31)
      {
        return std::__selection_sort[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<float *>>(a1, v4, result);
      }
      unsigned int v8 = &a1[v7 >> 1];
      uint64_t v9 = v4 - 1;
      int v10 = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<float *>>(a1, v8, v4 - 1);
      double result = *a1;
      if (*a1 >= *v8)
      {
        uint64_t v11 = v4 - 1;
        while (--v11 != a1)
        {
          if (*v11 < *v8)
          {
            *a1 = *v11;
            float *v11 = result;
            ++v10;
            goto LABEL_13;
          }
        }
        unsigned int v21 = a1 + 1;
        if (result >= *v9)
        {
          while (v21 != v9)
          {
            float v22 = *v21;
            if (result < *v21)
            {
              *v21++ = *v9;
              float *v9 = v22;
              goto LABEL_45;
            }
            ++v21;
          }
          return result;
        }
LABEL_45:
        if (v21 == v9) {
          return result;
        }
        while (1)
        {
          float v25 = *a1;
          do
          {
            float v26 = *v21++;
            double result = v26;
          }
          while (v25 >= v26);
          int v27 = v21 - 1;
          do
          {
            float v28 = *--v9;
            float v29 = v28;
          }
          while (v25 < v28);
          if (v27 >= v9) {
            break;
          }
          *int v27 = v29;
          float *v9 = result;
        }
        a1 = v21 - 1;
        if (v27 > a2) {
          return result;
        }
      }
      else
      {
        uint64_t v11 = v4 - 1;
LABEL_13:
        unint64_t v12 = a1 + 1;
        if (a1 + 1 >= v11)
        {
          int v16 = a1 + 1;
        }
        else
        {
          double v13 = a1 + 1;
          while (1)
          {
            float v14 = *v8;
            do
            {
              float v15 = *v13++;
              double result = v15;
            }
            while (v15 < v14);
            int v16 = v13 - 1;
            do
            {
              float v17 = *--v11;
              float v18 = v17;
            }
            while (v17 >= v14);
            if (v16 >= v11) {
              break;
            }
            *int v16 = v18;
            float *v11 = result;
            ++v10;
            if (v16 == v8) {
              unsigned int v8 = v11;
            }
          }
        }
        if (v16 != v8)
        {
          double result = *v8;
          float v19 = *v16;
          if (*v8 < *v16)
          {
            *int v16 = result;
            float *v8 = v19;
            ++v10;
          }
        }
        if (v16 == a2) {
          return result;
        }
        if (!v10)
        {
          if (v16 <= a2)
          {
            uint64_t v23 = v16 + 1;
            while (v23 != v4)
            {
              float v24 = *(v23 - 1);
              double result = *v23++;
              if (result < v24) {
                goto LABEL_29;
              }
            }
          }
          else
          {
            while (v12 != v16)
            {
              float v20 = *(v12 - 1);
              double result = *v12++;
              if (result < v20) {
                goto LABEL_29;
              }
            }
          }
          return result;
        }
LABEL_29:
        if (v16 <= a2) {
          a1 = v16 + 1;
        }
        else {
          uint64_t v4 = v16;
        }
      }
    }
    while (v4 != a2);
  }
  return result;
}

uint64_t std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<float *>>(float *a1, float *a2, float *a3)
{
  float v3 = *a2;
  float v4 = *a1;
  float v5 = *a3;
  if (*a2 < *a1)
  {
    if (v5 < v3)
    {
      *a1 = v5;
      *a3 = v4;
      return 1;
    }
    *a1 = v3;
    *a2 = v4;
    if (*a3 >= v4) {
      return 1;
    }
    *a2 = *a3;
    *a3 = v4;
    return 2;
  }
  if (v5 < v3)
  {
    *a2 = v5;
    *a3 = v3;
    float v6 = *a1;
    if (*a2 >= *a1) {
      return 1;
    }
    *a1 = *a2;
    *a2 = v6;
    return 2;
  }
  return 0;
}

float std::__selection_sort[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<float *>>(float *a1, float *a2, float result)
{
  while (a1 != a2 - 1)
  {
    float v3 = a1++;
    if (v3 != a2 && a1 != a2)
    {
      double result = *v3;
      float v4 = a1;
      float v5 = v3;
      float v6 = a1;
      do
      {
        float v7 = *v6++;
        float v8 = v7;
        if (v7 < result)
        {
          double result = v8;
          float v5 = v4;
        }
        float v4 = v6;
      }
      while (v6 != a2);
      if (v5 != v3)
      {
        double result = *v3;
        *float v3 = *v5;
        *float v5 = result;
      }
    }
  }
  return result;
}

void std::vector<float>::__append(char **a1, unint64_t a2)
{
  float v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  float v5 = v6;
  float v7 = *(char **)(v4 - 8);
  if (a2 <= (v6 - v7) >> 2)
  {
    if (a2)
    {
      bzero(*(void **)(v4 - 8), 4 * a2);
      v7 += 4 * a2;
    }
    a1[1] = v7;
  }
  else
  {
    float v8 = *a1;
    uint64_t v9 = v7 - *a1;
    unint64_t v10 = a2 + (v9 >> 2);
    if (v10 >> 62) {
      std::vector<float>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v11 = v9 >> 2;
    uint64_t v12 = v5 - v8;
    if (v12 >> 1 > v10) {
      unint64_t v10 = v12 >> 1;
    }
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v13 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v13 = v10;
    }
    if (v13)
    {
      float v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(v4, v13);
      float v8 = *a1;
      float v7 = a1[1];
    }
    else
    {
      float v14 = 0;
    }
    float v15 = &v14[4 * v11];
    int v16 = &v14[4 * v13];
    bzero(v15, 4 * a2);
    float v17 = &v15[4 * a2];
    while (v7 != v8)
    {
      int v18 = *((_DWORD *)v7 - 1);
      v7 -= 4;
      *((_DWORD *)v15 - 1) = v18;
      v15 -= 4;
    }
    *a1 = v15;
    a1[1] = v17;
    a1[2] = v16;
    if (v8)
    {
      operator delete(v8);
    }
  }
}

void std::vector<float>::__append(void **a1, unint64_t a2, _DWORD *a3)
{
  float v8 = a1[2];
  uint64_t v6 = (uint64_t)(a1 + 2);
  float v7 = v8;
  uint64_t v9 = *(_DWORD **)(v6 - 8);
  if (a2 <= (v8 - (unsigned char *)v9) >> 2)
  {
    if (a2)
    {
      uint64_t v16 = 4 * a2;
      float v17 = &v9[a2];
      do
      {
        *v9++ = *a3;
        v16 -= 4;
      }
      while (v16);
      uint64_t v9 = v17;
    }
    a1[1] = v9;
  }
  else
  {
    uint64_t v10 = (char *)v9 - (unsigned char *)*a1;
    unint64_t v11 = a2 + (v10 >> 2);
    if (v11 >> 62) {
      std::vector<float>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v12 = v10 >> 2;
    uint64_t v13 = v7 - (unsigned char *)*a1;
    if (v13 >> 1 > v11) {
      unint64_t v11 = v13 >> 1;
    }
    if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v14 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v14 = v11;
    }
    if (v14) {
      float v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(v6, v14);
    }
    else {
      float v15 = 0;
    }
    int v18 = &v15[4 * v12];
    float v19 = &v18[4 * a2];
    uint64_t v20 = 4 * a2;
    unsigned int v21 = v18;
    do
    {
      *(_DWORD *)unsigned int v21 = *a3;
      v21 += 4;
      v20 -= 4;
    }
    while (v20);
    float v22 = &v15[4 * v14];
    uint64_t v23 = (char *)*a1;
    for (uint64_t i = (char *)a1[1]; i != v23; i -= 4)
    {
      int v25 = *((_DWORD *)i - 1);
      *((_DWORD *)v18 - 1) = v25;
      v18 -= 4;
    }
    *a1 = v18;
    a1[1] = v19;
    a1[2] = v22;
    if (v23)
    {
      operator delete(v23);
    }
  }
}

Tellurium::tellurium_classifier_t *Tellurium::tellurium_classifier_t::tellurium_classifier_t(Tellurium::tellurium_classifier_t *this, int a2, int a3, char a4)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  *(_DWORD *)this = a2;
  *((_DWORD *)this + 1) = a3;
  *((unsigned char *)this + 8) = a4;
  *((void *)this + 2) = 0;
  *((void *)this + 3) = 0;
  *((void *)this + 4) = 0;
  Tellurium::PredictorWrapper_t::PredictorWrapper_t((Tellurium::tellurium_classifier_t *)((char *)this + 64));
  if (algs_get_log_0())
  {
    log_0 = algs_get_log_0();
    if (os_log_type_enabled(log_0, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315138;
      uint64_t v13 = "0.0.5";
      _os_log_impl(&dword_2477CF000, log_0, OS_LOG_TYPE_DEFAULT, "Tellurium Alg Version: %s", (uint8_t *)&v12, 0xCu);
    }
  }
  __asm { FMOV            V0.2D, #-1.0 }
  *((_OWORD *)this + 3) = _Q0;
  return this;
}

void sub_2477E42EC(_Unwind_Exception *a1)
{
  Tellurium::PredictorWrapper_t::~PredictorWrapper_t(v2);
  float v5 = *v3;
  if (*v3)
  {
    *(void *)(v1 + 24) = v5;
    operator delete(v5);
  }
  _Unwind_Resume(a1);
}

double Tellurium::tellurium_classifier_t::get_core_analytics(Tellurium::tellurium_classifier_t *this)
{
  return *((double *)this + 6);
}

void Tellurium::tellurium_classifier_t::tellurium_classifier_process(uint64_t a1, const unsigned __int8 **a2)
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  uint64_t v5 = a1 + 16;
  uint64_t v4 = *(void **)(a1 + 16);
  if (v4)
  {
    *(void *)(a1 + 24) = v4;
    operator delete(v4);
    *(void *)uint64_t v5 = 0;
    *(void *)(v5 + 8) = 0;
    *(void *)(v5 + 16) = 0;
  }
  *(void *)uint64_t v5 = 0;
  *(void *)(v5 + 8) = 0;
  *(_WORD *)(v5 + 24) = 0;
  *(void *)(v5 + 16) = 0;
  uint64_t v66 = 0;
  unint64_t v67 = 0;
  uint64_t v68 = 0;
  uint64_t v6 = *a2;
  double v61 = (uint64_t *)a2[1];
  uint64_t v58 = a1;
  if (*a2 == (const unsigned __int8 *)v61)
  {
    uint64_t v49 = 0;
    unint64_t v48 = 0;
  }
  else
  {
    uint64_t v57 = a1 + 32;
    uint64_t v59 = a1 + 8;
    double v60 = (id **)(a1 + 64);
    do
    {
      std::string __p = 0;
      unint64_t v64 = 0;
      uint64_t v65 = 0;
      char v62 = 0;
      uint64_t v8 = *(void *)v6;
      uint64_t v7 = *((void *)v6 + 1);
      if (*(void *)v6 != v7)
      {
        uint64_t v9 = 0;
        do
        {
          uint64_t v10 = *(void **)v8;
          unint64_t v11 = *(void **)(v8 + 8);
          while (1)
          {
            int v12 = v9;
            if (v10 == v11) {
              break;
            }
            if (v9 >= v65)
            {
              uint64_t v13 = (char *)__p;
              uint64_t v14 = (v9 - (unsigned char *)__p) >> 3;
              unint64_t v15 = v14 + 1;
              if ((unint64_t)(v14 + 1) >> 61) {
                std::vector<float>::__throw_length_error[abi:ne180100]();
              }
              uint64_t v16 = v65 - (unsigned char *)__p;
              if ((v65 - (unsigned char *)__p) >> 2 > v15) {
                unint64_t v15 = v16 >> 2;
              }
              if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFF8) {
                unint64_t v17 = 0x1FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v17 = v15;
              }
              if (v17)
              {
                int v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&v65, v17);
                uint64_t v13 = (char *)__p;
                int v12 = v64;
              }
              else
              {
                int v18 = 0;
              }
              float v19 = &v18[8 * v14];
              *(void *)float v19 = *v10;
              uint64_t v9 = v19 + 8;
              while (v12 != v13)
              {
                uint64_t v20 = *((void *)v12 - 1);
                v12 -= 8;
                *((void *)v19 - 1) = v20;
                v19 -= 8;
              }
              std::string __p = v19;
              unint64_t v64 = v9;
              uint64_t v65 = &v18[8 * v17];
              if (v13) {
                operator delete(v13);
              }
            }
            else
            {
              *(void *)uint64_t v9 = *v10;
              v9 += 8;
            }
            unint64_t v64 = v9;
            ++v10;
          }
          if (v9 >= v65)
          {
            unsigned int v21 = (char *)__p;
            uint64_t v22 = (v9 - (unsigned char *)__p) >> 3;
            unint64_t v23 = v22 + 1;
            if ((unint64_t)(v22 + 1) >> 61) {
              std::vector<float>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v24 = v65 - (unsigned char *)__p;
            if ((v65 - (unsigned char *)__p) >> 2 > v23) {
              unint64_t v23 = v24 >> 2;
            }
            if ((unint64_t)v24 >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v25 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v25 = v23;
            }
            if (v25)
            {
              float v26 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&v65, v25);
              unsigned int v21 = (char *)__p;
              int v12 = v64;
            }
            else
            {
              float v26 = 0;
            }
            int v27 = &v26[8 * v22];
            *(void *)int v27 = 0x7FF8000000000000;
            uint64_t v9 = v27 + 8;
            while (v12 != v21)
            {
              uint64_t v28 = *((void *)v12 - 1);
              v12 -= 8;
              *((void *)v27 - 1) = v28;
              v27 -= 8;
            }
            std::string __p = v27;
            unint64_t v64 = v9;
            uint64_t v65 = &v26[8 * v25];
            if (v21) {
              operator delete(v21);
            }
          }
          else
          {
            *(void *)uint64_t v9 = 0x7FF8000000000000;
            v9 += 8;
          }
          unint64_t v64 = v9;
          v8 += 24;
        }
        while (v8 != v7);
      }
      char v29 = Tellurium::PredictorWrapper_t::predict(v60, (uint64_t)&__p, (uint64_t)&v66, (uint64_t)&v62, v59);
      if (!v62)
      {
        char v30 = v29;
        uuid_copy(dst, v6 + 32);
        char v70 = v30;
        uint64_t v31 = (void *)v58;
        unint64_t v32 = *(void *)(v58 + 24);
        unint64_t v33 = *(void *)(v58 + 32);
        if (v32 >= v33)
        {
          int v36 = (void **)v5;
          unint64_t v37 = 0xF0F0F0F0F0F0F0F1 * (v32 - *(void *)v5);
          unint64_t v38 = v37 + 1;
          if (v37 + 1 >= 0xF0F0F0F0F0F0F10) {
            std::vector<float>::__throw_length_error[abi:ne180100]();
          }
          unint64_t v39 = 0xF0F0F0F0F0F0F0F1 * (v33 - *(void *)v5);
          if (2 * v39 > v38) {
            unint64_t v38 = 2 * v39;
          }
          if (v39 >= 0x787878787878787) {
            unint64_t v40 = 0xF0F0F0F0F0F0F0FLL;
          }
          else {
            unint64_t v40 = v38;
          }
          if (v40)
          {
            uint64_t v41 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<Tellurium::tacho_classification_t>>(v57, v40);
            int v36 = (void **)v5;
            uint64_t v31 = (void *)v58;
          }
          else
          {
            uint64_t v41 = 0;
          }
          int v42 = &v41[17 * v37];
          long long v43 = *(_OWORD *)dst;
          v42[16] = v70;
          *(_OWORD *)int v42 = v43;
          long long v45 = (char *)v31[2];
          int v44 = (char *)v31[3];
          int v46 = v42;
          if (v44 != v45)
          {
            do
            {
              long long v47 = *(_OWORD *)(v44 - 17);
              *(v46 - 1) = *(v44 - 1);
              *(_OWORD *)(v46 - 17) = v47;
              v46 -= 17;
              v44 -= 17;
            }
            while (v44 != v45);
            int v44 = (char *)*v36;
          }
          uint64_t v35 = v42 + 17;
          void v31[2] = v46;
          v31[3] = v42 + 17;
          v31[4] = &v41[17 * v40];
          if (v44) {
            operator delete(v44);
          }
        }
        else
        {
          long long v34 = *(_OWORD *)dst;
          *(unsigned char *)(v32 + 16) = v70;
          *(_OWORD *)unint64_t v32 = v34;
          uint64_t v35 = (char *)(v32 + 17);
        }
        v31[3] = v35;
      }
      if (__p)
      {
        unint64_t v64 = (char *)__p;
        operator delete(__p);
      }
      v6 += 48;
    }
    while (v6 != (const unsigned __int8 *)v61);
    unint64_t v48 = (stats *)v66;
    uint64_t v49 = v67;
  }
  float v50 = stats::mean(v48, (const float *)((unint64_t)(v49 - (unsigned char *)v48) >> 2));
  float v51 = stats::variance((stats *)v66, (const float *)((unint64_t)(v67 - (unsigned char *)v66) >> 2), 1);
  log_0 = algs_get_log_0();
  float v53 = sqrtf(v51);
  if (os_log_type_enabled(log_0, OS_LOG_TYPE_DEBUG)) {
    Tellurium::tellurium_classifier_t::tellurium_classifier_process(log_0, v50, v53);
  }
  if ((LODWORD(v50) & 0x7FFFFFFFu) <= 0x7F7FFFFF) {
    *(double *)(v58 + 48) = v50;
  }
  if (SLODWORD(v53) > -1 && ((LODWORD(v53) & 0x7FFFFFFFu) - 0x800000) >> 24 < 0x7F
    || (LODWORD(v53) - 1) < 0x7FFFFF
    || (LODWORD(v53) & 0x7FFFFFFF) == 0)
  {
    *(double *)(v58 + 56) = v53;
  }
  if (v66)
  {
    unint64_t v67 = v66;
    operator delete(v66);
  }
}

void sub_2477E47D8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, void *__p,uint64_t a21)
{
}

void *Tellurium::tellurium_classifier_t::tellurium_get_outputs@<X0>(Tellurium::tellurium_classifier_t *this@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = (const void *)*((void *)this + 2);
  uint64_t v5 = *((void *)this + 3);
  if (v4 == (const void *)v5) {
    goto LABEL_8;
  }
  unsigned int v6 = 0;
  unsigned int v7 = 0;
  int v8 = 1;
  uint64_t v9 = *((void *)this + 2);
  do
  {
    if (!*(unsigned char *)(v9 + 16)) {
      ++v7;
    }
    v6 += *(unsigned __int8 *)(v9 + 16);
    v9 += 17;
    --v8;
  }
  while (v9 != v5);
  if (v8 == 1 || !(v8 | v6))
  {
LABEL_8:
    *((_WORD *)this + 20) = 0;
  }
  else if (v6 >= *(_DWORD *)this)
  {
    *((_WORD *)this + 20) = 1;
  }
  else
  {
    unsigned int v11 = *((_DWORD *)this + 1);
    *((unsigned char *)this + 40) = 0;
    *((unsigned char *)this + 41) = v7 < v11;
  }
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  double result = std::vector<Tellurium::tacho_classification_t>::__init_with_size[abi:ne180100]<Tellurium::tacho_classification_t*,Tellurium::tacho_classification_t*>((void *)a2, v4, v5, 0xF0F0F0F0F0F0F0F1 * (v5 - (void)v4));
  *(_WORD *)(a2 + 24) = *((_WORD *)this + 20);
  return result;
}

void *std::vector<Tellurium::tacho_classification_t>::__init_with_size[abi:ne180100]<Tellurium::tacho_classification_t*,Tellurium::tacho_classification_t*>(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    unsigned int v6 = result;
    double result = std::vector<Tellurium::tacho_classification_t>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      double result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_2477E4968(_Unwind_Exception *exception_object)
{
  float v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<Tellurium::tacho_classification_t>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >= 0xF0F0F0F0F0F0F10) {
    std::vector<float>::__throw_length_error[abi:ne180100]();
  }
  double result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<Tellurium::tacho_classification_t>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[17 * v4];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<Tellurium::tacho_classification_t>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xF0F0F0F0F0F0F10) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(17 * a2);
}

void sub_2477E4BC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2477E50E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,void *a30,uint64_t a31,int a32,__int16 a33,char a34,char a35,void *__p,uint64_t a37,uint64_t a38,void *a39,uint64_t a40,int a41,__int16 a42,char a43,char a44)
{
  if (__p) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_2477E5694(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void Tellurium::PredictorWrapper_t::PredictorWrapper_t(Tellurium::PredictorWrapper_t *this)
{
  *(void *)this = 0;
  operator new();
}

void sub_2477E5930(_Unwind_Exception *a1)
{
  __cxa_free_exception(v2);
  std::unique_ptr<Tellurium::PredictorImpl_t>::reset[abi:ne180100](v1, 0);
  _Unwind_Resume(a1);
}

void Tellurium::PredictorWrapper_t::~PredictorWrapper_t(id **this)
{
}

{
  std::unique_ptr<Tellurium::PredictorImpl_t>::reset[abi:ne180100](this, 0);
}

uint64_t Tellurium::PredictorWrapper_t::predict(id **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(**a1, "predict:afib:be_mode:with_error_status:", a2, a3, a5, a4);
}

id **std::unique_ptr<Tellurium::PredictorImpl_t>::reset[abi:ne180100](id **result, id *a2)
{
  unint64_t v2 = *result;
  *double result = a2;
  if (v2)
  {

    JUMPOUT(0x24C55DD50);
  }
  return result;
}

uint64_t remove_nan(uint64_t a1, uint64_t a2, float a3)
{
  if (a3 <= 0.0) {
    return 0;
  }
  uint64_t v3 = 0;
  uint64_t v4 = 0;
  do
    *(_DWORD *)(a2 + 4 * v4++) = *(_DWORD *)(a1 + 4 * v3++);
  while ((float)(int)v3 < a3);
  return v4;
}

uint64_t remove_nanD(uint64_t a1, uint64_t a2, float a3)
{
  if (a3 <= 0.0) {
    return 0;
  }
  uint64_t v3 = 0;
  uint64_t v4 = 0;
  do
    *(void *)(a2 + 8 * v4++) = *(void *)(a1 + 8 * v3++);
  while ((float)(int)v3 < a3);
  return v4;
}

void vDSP_maxv_wrapper(uint64_t a1, vDSP_Stride a2, float *a3, uint64_t a4)
{
  size_t v8 = (const float *)malloc_type_malloc(4 * a4, 0x100004052888210uLL);
  if (v8)
  {
    uint64_t v9 = (float *)v8;
    if (a4 < 1)
    {
      vDSP_Length v11 = 0;
    }
    else
    {
      uint64_t v10 = 0;
      vDSP_Length v11 = 0;
      do
        v8[v11++] = *(const float *)(a1 + 4 * v10++);
      while ((float)(int)v10 < (float)a4);
    }
    vDSP_maxv(v8, a2, a3, v11);
    free(v9);
  }
  else
  {
    *a3 = NAN;
  }
}

void vDSP_maxvD_wrapper(uint64_t a1, vDSP_Stride a2, double *a3, uint64_t a4)
{
  size_t v8 = (const double *)malloc_type_malloc(8 * a4, 0x100004000313F17uLL);
  if (v8)
  {
    uint64_t v9 = (double *)v8;
    if (a4 < 1)
    {
      vDSP_Length v11 = 0;
    }
    else
    {
      uint64_t v10 = 0;
      vDSP_Length v11 = 0;
      do
        v8[v11++] = *(const double *)(a1 + 8 * v10++);
      while ((float)(int)v10 < (float)a4);
    }
    vDSP_maxvD(v8, a2, a3, v11);
    free(v9);
  }
  else
  {
    *a3 = NAN;
  }
}

void vDSP_minv_wrapper(uint64_t a1, vDSP_Stride a2, float *a3, uint64_t a4)
{
  size_t v8 = (const float *)malloc_type_malloc(4 * a4, 0x100004052888210uLL);
  if (v8)
  {
    uint64_t v9 = (float *)v8;
    if (a4 < 1)
    {
      vDSP_Length v11 = 0;
    }
    else
    {
      uint64_t v10 = 0;
      vDSP_Length v11 = 0;
      do
        v8[v11++] = *(const float *)(a1 + 4 * v10++);
      while ((float)(int)v10 < (float)a4);
    }
    vDSP_minv(v8, a2, a3, v11);
    free(v9);
  }
  else
  {
    *a3 = NAN;
  }
}

void vDSP_minvD_wrapper(uint64_t a1, vDSP_Stride a2, double *a3, uint64_t a4)
{
  size_t v8 = (const double *)malloc_type_malloc(8 * a4, 0x100004000313F17uLL);
  if (v8)
  {
    uint64_t v9 = (double *)v8;
    if (a4 < 1)
    {
      vDSP_Length v11 = 0;
    }
    else
    {
      uint64_t v10 = 0;
      vDSP_Length v11 = 0;
      do
        v8[v11++] = *(const double *)(a1 + 8 * v10++);
      while ((float)(int)v10 < (float)a4);
    }
    vDSP_minvD(v8, a2, a3, v11);
    free(v9);
  }
  else
  {
    *a3 = NAN;
  }
}

void vDSP_maxvi_wrapper(uint64_t a1, vDSP_Stride a2, float *a3, vDSP_Length *a4, uint64_t a5)
{
  uint64_t v10 = (const float *)malloc_type_malloc(4 * a5, 0x100004052888210uLL);
  if (v10)
  {
    vDSP_Length v11 = (float *)v10;
    if (a5 < 1)
    {
      vDSP_Length v13 = 0;
    }
    else
    {
      uint64_t v12 = 0;
      vDSP_Length v13 = 0;
      do
        v10[v13++] = *(const float *)(a1 + 4 * v12++);
      while ((float)(int)v12 < (float)a5);
    }
    vDSP_maxvi(v10, a2, a3, a4, v13);
    free(v11);
  }
  else
  {
    *a3 = NAN;
  }
}

void vDSP_maxviD_wrapper(uint64_t a1, vDSP_Stride a2, double *a3, vDSP_Length *a4, uint64_t a5)
{
  uint64_t v10 = (const double *)malloc_type_malloc(8 * a5, 0x100004000313F17uLL);
  if (v10)
  {
    vDSP_Length v11 = (double *)v10;
    if (a5 < 1)
    {
      vDSP_Length v13 = 0;
    }
    else
    {
      uint64_t v12 = 0;
      vDSP_Length v13 = 0;
      do
        v10[v13++] = *(const double *)(a1 + 8 * v12++);
      while ((float)(int)v12 < (float)a5);
    }
    vDSP_maxviD(v10, a2, a3, a4, v13);
    free(v11);
  }
  else
  {
    *a3 = NAN;
  }
}

void vDSP_minvi_wrapper(uint64_t a1, vDSP_Stride a2, float *a3, vDSP_Length *a4, uint64_t a5)
{
  uint64_t v10 = (const float *)malloc_type_malloc(4 * a5, 0x100004052888210uLL);
  if (v10)
  {
    vDSP_Length v11 = (float *)v10;
    if (a5 < 1)
    {
      vDSP_Length v13 = 0;
    }
    else
    {
      uint64_t v12 = 0;
      vDSP_Length v13 = 0;
      do
        v10[v13++] = *(const float *)(a1 + 4 * v12++);
      while ((float)(int)v12 < (float)a5);
    }
    vDSP_minvi(v10, a2, a3, a4, v13);
    free(v11);
  }
  else
  {
    *a3 = NAN;
  }
}

void vDSP_minviD_wrapper(uint64_t a1, vDSP_Stride a2, double *a3, vDSP_Length *a4, uint64_t a5)
{
  uint64_t v10 = (const double *)malloc_type_malloc(8 * a5, 0x100004000313F17uLL);
  if (v10)
  {
    vDSP_Length v11 = (double *)v10;
    if (a5 < 1)
    {
      vDSP_Length v13 = 0;
    }
    else
    {
      uint64_t v12 = 0;
      vDSP_Length v13 = 0;
      do
        v10[v13++] = *(const double *)(a1 + 8 * v12++);
      while ((float)(int)v12 < (float)a5);
    }
    vDSP_minviD(v10, a2, a3, a4, v13);
    free(v11);
  }
  else
  {
    *a3 = NAN;
  }
}

void vDSP_meanv_wrapper(uint64_t a1, vDSP_Stride a2, float *a3, uint64_t a4)
{
  size_t v8 = (const float *)malloc_type_malloc(4 * a4, 0x100004052888210uLL);
  if (v8)
  {
    uint64_t v9 = (float *)v8;
    if (a4 < 1)
    {
      vDSP_Length v11 = 0;
    }
    else
    {
      uint64_t v10 = 0;
      vDSP_Length v11 = 0;
      do
        v8[v11++] = *(const float *)(a1 + 4 * v10++);
      while ((float)(int)v10 < (float)a4);
    }
    vDSP_meanv(v8, a2, a3, v11);
    free(v9);
  }
  else
  {
    *a3 = NAN;
  }
}

void vDSP_meanvD_wrapper(uint64_t a1, vDSP_Stride a2, double *a3, uint64_t a4)
{
  size_t v8 = (const double *)malloc_type_malloc(8 * a4, 0x100004000313F17uLL);
  if (v8)
  {
    uint64_t v9 = (double *)v8;
    if (a4 < 1)
    {
      vDSP_Length v11 = 0;
    }
    else
    {
      uint64_t v10 = 0;
      vDSP_Length v11 = 0;
      do
        v8[v11++] = *(const double *)(a1 + 8 * v10++);
      while ((float)(int)v10 < (float)a4);
    }
    vDSP_meanvD(v8, a2, a3, v11);
    free(v9);
  }
  else
  {
    *a3 = NAN;
  }
}

uint64_t algs_get_log_0()
{
  if (algs_get_log_onceToken_0 != -1) {
    dispatch_once(&algs_get_log_onceToken_0, &__block_literal_global_2);
  }
  return algs_get_log_log_0;
}

os_log_t __algs_get_log_block_invoke_0()
{
  os_log_t result = os_log_create("com.apple.Health.AFibBurden", "hid-algs-classification");
  algs_get_log_log_0 = (uint64_t)result;
  return result;
}

void stats::mean()
{
}

{
  __assert_rtn("mean", "stats.cpp", 19, "x != NULL");
}

void stats::variance()
{
}

{
  __assert_rtn("variance", "stats.cpp", 32, "x != NULL");
}

void stats::covariance()
{
}

{
  __assert_rtn("covariance", "stats.cpp", 55, "x != NULL");
}

{
  __assert_rtn("covariance", "stats.cpp", 56, "y != NULL");
}

{
  __assert_rtn("covariance", "stats.cpp", 53, "Ny == Nx");
}

void stats::std()
{
}

{
  __assert_rtn("std", "stats.cpp", 81, "x != NULL");
}

void stats::rmssd()
{
}

{
  __assert_rtn("rmssd", "stats.cpp", 94, "x != NULL");
}

void stats::madsd()
{
}

{
  __assert_rtn("madsd", "stats.cpp", 111, "x != NULL");
}

void stats::mad()
{
}

{
  __assert_rtn("mad", "stats.cpp", 128, "x != NULL");
}

void stats::mad_median()
{
}

{
  __assert_rtn("mad_median", "stats.cpp", 146, "x != NULL");
}

void stats::median()
{
}

{
  __assert_rtn("median", "stats.cpp", 205, "x != NULL");
}

void stats::range()
{
}

{
  __assert_rtn("range", "stats.cpp", 164, "x != NULL");
}

void stats::max()
{
}

{
  __assert_rtn("max", "stats.cpp", 179, "x != NULL");
}

void stats::min()
{
}

{
  __assert_rtn("min", "stats.cpp", 192, "x != NULL");
}

void stats::median_vdsp()
{
}

{
  __assert_rtn("median_vdsp", "stats.cpp", 235, "x != NULL");
}

{
  __assert_rtn("median_vdsp", "stats.cpp", 236, "pI != NULL");
}

void stats::percentile()
{
}

{
  __assert_rtn("percentile", "stats.cpp", 428, "x != NULL");
}

{
  __assert_rtn("percentile", "stats.cpp", 429, "pI != NULL");
}

{
  __assert_rtn("percentile", "stats.cpp", 430, "ptile >= 0 && ptile <= 100");
}

void stats::meanMag()
{
}

{
  __assert_rtn("meanMag", "stats.cpp", 257, "x != NULL");
}

void stats::measqv()
{
}

{
  __assert_rtn("measqv", "stats.cpp", 269, "x != NULL");
}

void stats::meassq()
{
}

{
  __assert_rtn("meassq", "stats.cpp", 281, "x != NULL");
}

void stats::rmsqv()
{
}

{
  __assert_rtn("rmsqv", "stats.cpp", 293, "x != NULL");
}

void stats::kurt()
{
}

{
  __assert_rtn("kurt", "stats.cpp", 305, "pX != NULL");
}

void stats::median_filt()
{
}

{
  __assert_rtn("median_filt", "stats.cpp", 366, "x != NULL");
}

{
  __assert_rtn("median_filt", "stats.cpp", 367, "y != NULL");
}

void Tellurium::tellurium_classifier_t::tellurium_classifier_process(os_log_t log, float a2, float a3)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 134218240;
  double v4 = a2;
  __int16 v5 = 2048;
  double v6 = a3;
  _os_log_debug_impl(&dword_2477CF000, log, OS_LOG_TYPE_DEBUG, "AfibMean:%f AfibStd:%f ", (uint8_t *)&v3, 0x16u);
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

void std::__variant_detail::__visitation::__base::__dispatcher<1ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<beryllium::overloaded<-[ABAfibBurdenAnalyzer processResults:withAlgsAnalytics:]::$_0,-[ABAfibBurdenAnalyzer processResults:withAlgsAnalytics:]::$_1>> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,beryllium::output_t,beryllium::ReasonForNoOutput> &>(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

const char *__cdecl std::runtime_error::what(const std::runtime_error *this)
{
  return (const char *)MEMORY[0x270F98200](this);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x270F982E8](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x270F982F8](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x270F983B0](this, a2);
}

void std::runtime_error::~runtime_error(std::runtime_error *this)
{
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x270F98498](this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984A0](this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x270F984E0](this, __pos, __s);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
}

uint64_t std::filebuf::open()
{
  return MEMORY[0x270F98638]();
}

uint64_t std::filebuf::basic_filebuf()
{
  return MEMORY[0x270F98650]();
}

uint64_t std::filebuf::~filebuf()
{
  return MEMORY[0x270F98658]();
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x270F98758]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x270F98760]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x270F98770]();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

void std::locale::~locale(std::locale *this)
{
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x270F98DE8]();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, double __val)
{
  return (std::string *)MEMORY[0x270F98DF8](retstr, __val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x270F98E08](retstr, *(void *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unint64_t __val)
{
  return (std::string *)MEMORY[0x270F98E20](retstr, __val);
}

{
  return (std::string *)MEMORY[0x270F98E30](retstr, __val);
}

uint64_t std::operator+<char>()
{
  return MEMORY[0x270F98E38]();
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
  return (void *)MEMORY[0x270F98EC0](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
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

void bzero(void *a1, size_t a2)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

uint64_t espresso_enable_autoinitialize()
{
  return MEMORY[0x270F27F38]();
}

long double exp(long double __x)
{
  MEMORY[0x270ED9858](__x);
  return result;
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x270ED99D0](__x, __y);
  return result;
}

void free(void *a1)
{
}

lconv *localeconv(void)
{
  return (lconv *)MEMORY[0x270EDA090]();
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

float modff(float a1, float *a2)
{
  MEMORY[0x270EDA5B0](a2, a1);
  return result;
}

float nanf(const char *a1)
{
  MEMORY[0x270EDA608](a1);
  return result;
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x270EDA748](*(void *)&token, state64);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x270EDA768](name, out_token);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
}

void vDSP_dotpr(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Length __N)
{
}

void vDSP_maxv(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
}

void vDSP_maxvD(const double *__A, vDSP_Stride __I, double *__C, vDSP_Length __N)
{
}

void vDSP_maxvi(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length *__I, vDSP_Length __N)
{
}

void vDSP_maxviD(const double *__A, vDSP_Stride __IA, double *__C, vDSP_Length *__I, vDSP_Length __N)
{
}

void vDSP_meamgv(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
}

void vDSP_meanv(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
}

void vDSP_meanvD(const double *__A, vDSP_Stride __IA, double *__C, vDSP_Length __N)
{
}

void vDSP_measqv(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
}

void vDSP_minv(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
}

void vDSP_minvD(const double *__A, vDSP_Stride __IA, double *__C, vDSP_Length __N)
{
}

void vDSP_minvi(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length *__I, vDSP_Length __N)
{
}

void vDSP_minviD(const double *__A, vDSP_Stride __IA, double *__C, vDSP_Length *__I, vDSP_Length __N)
{
}

void vDSP_mvessq(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
}

void vDSP_rmsqv(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
}

void vDSP_sve(const float *__A, vDSP_Stride __I, float *__C, vDSP_Length __N)
{
}

void vDSP_vabs(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vaddD(const double *__A, vDSP_Stride __IA, const double *__B, vDSP_Stride __IB, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vrampD(const double *__A, const double *__B, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vsdivD(const double *__A, vDSP_Stride __IA, const double *__B, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vsortD(double *__C, vDSP_Length __N, int __Order)
{
}

void vDSP_vsorti(const float *__C, vDSP_Length *__I, vDSP_Length *__Temporary, vDSP_Length __N, int __Order)
{
}

void vDSP_vsortiD(const double *__C, vDSP_Length *__I, vDSP_Length *__Temporary, vDSP_Length __N, int __Order)
{
}

void vDSP_vsub(const float *__B, vDSP_Stride __IB, const float *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vsubD(const double *__B, vDSP_Stride __IB, const double *__A, vDSP_Stride __IA, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vtrapzD(const double *__A, vDSP_Stride __IA, const double *__B, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}