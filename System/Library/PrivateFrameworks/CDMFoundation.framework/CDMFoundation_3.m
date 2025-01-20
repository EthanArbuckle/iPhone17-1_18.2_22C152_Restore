void sub_2265DBD80(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2265DBFE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,long long buf)
{
  if (a2 == 1)
  {
    v38 = __cxa_begin_catch(a1);
    v39 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      uint64_t v40 = (*(uint64_t (**)(void *))(*(void *)v38 + 16))(v38);
      LODWORD(buf) = 136315394;
      *(void *)((char *)&buf + 4) = "-[CDMMarisaTrie createFromEntries:withHashValue:]";
      WORD6(buf) = 2080;
      *(void *)((char *)&buf + 14) = v40;
      _os_log_error_impl(&dword_2263A0000, v39, OS_LOG_TYPE_ERROR, "%s [ERR]: Marisa Exception: %s", (uint8_t *)&buf, 0x16u);
    }

    __cxa_end_catch();
    JUMPOUT(0x2265DBF74);
  }

  marisa::Keyset::~Keyset((marisa::Keyset *)&a20);
  _Unwind_Resume(a1);
}

void marisa::Keyset::~Keyset(marisa::Keyset *this)
{
  marisa::scoped_array<marisa::scoped_array<marisa::Key>>::~scoped_array((uint64_t *)this + 6);
  marisa::scoped_array<marisa::scoped_array<char>>::~scoped_array((uint64_t *)this + 3);
  marisa::scoped_array<marisa::scoped_array<char>>::~scoped_array((uint64_t *)this);
}

void sub_2265DC1F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2265DC26C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)CDMMarisaTrie;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_2265DC428(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2265DEAF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  if (v27) {
    (*(void (**)(uint64_t))(*(void *)v27 + 16))(v27);
  }
  if (v26) {
    (*(void (**)(uint64_t))(*(void *)v26 + 16))(v26);
  }
  if (*(char *)(v28 - 81) < 0) {
    operator delete(*(void **)(v28 - 104));
  }

  _Unwind_Resume(a1);
}

void sub_2265DF2A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2265DF43C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_2265DF4B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2265E01D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2265E033C(_Unwind_Exception *a1)
{
  MEMORY[0x22A6568D0](v1, 0x10A0C403D23BABBLL);
  _Unwind_Resume(a1);
}

void sub_2265E052C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  std::unique_ptr<siri::ontology::UsoEntitySpan>::reset[abi:ne180100](v24);

  _Unwind_Resume(a1);
}

uint64_t appName(void)
{
  {
    operator new();
  }
  return appName(void)::value;
}

void sub_2265E0608(_Unwind_Exception *a1)
{
  MEMORY[0x22A6568D0](v1, 0x1012C40EC159624);
  _Unwind_Resume(a1);
}

void sub_2265E08D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28,void *__p,uint64_t a30,int a31,__int16 a32,char a33,char a34,char a35,void *a36,uint64_t a37,int a38,__int16 a39,char a40,char a41,uint64_t a42,void *a43,uint64_t a44,int a45,__int16 a46,char a47,char a48)
{
  if (*(char *)(v51 - 89) < 0) {
    operator delete(*(void **)(v51 - 112));
  }
  if (a35 && a34 < 0) {
    operator delete(__p);
  }
  if (a41 < 0) {
    operator delete(a36);
  }
  if (a48 < 0) {
    operator delete(a43);
  }
  if (a22 < 0) {
    operator delete(a17);
  }
  if (a28 < 0) {
    operator delete(a23);
  }
  MEMORY[0x22A6568D0](v50, 0x1012C40071C2685);

  _Unwind_Resume(a1);
}

void std::default_delete<siri::ontology::UsoIdentifier>::operator()[abi:ne180100](uint64_t a1)
{
  if (*(unsigned char *)(a1 + 72) && *(char *)(a1 + 71) < 0) {
    operator delete(*(void **)(a1 + 48));
  }
  if (*(char *)(a1 + 47) < 0) {
    operator delete(*(void **)(a1 + 24));
  }
  if (*(char *)(a1 + 23) < 0) {
    operator delete(*(void **)a1);
  }
  JUMPOUT(0x22A6568D0);
}

std::string *std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100](std::string *this, long long *a2)
{
  this->__r_.__value_.__s.__data_[0] = 0;
  this[1].__r_.__value_.__s.__data_[0] = 0;
  if (*((unsigned char *)a2 + 24))
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
    this[1].__r_.__value_.__s.__data_[0] = 1;
  }
  return this;
}

void sub_2265E0AB4(_Unwind_Exception *exception_object)
{
  if (*(unsigned char *)(v1 + 24))
  {
    if (*(char *)(v1 + 23) < 0) {
      operator delete(*(void **)v1);
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_2265E0D20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, void *a11, void **a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, char a20,int a21,uint64_t a22)
{
  std::unique_ptr<siri::ontology::UsoEntitySpan>::reset[abi:ne180100](&a12);
  std::unique_ptr<siri::ontology::UsoGraph>::reset[abi:ne180100](&a22);

  _Unwind_Resume(a1);
}

void sub_2265E1008(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, void *a11, void **a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, char a20,int a21,uint64_t a22)
{
  std::unique_ptr<siri::ontology::UsoEntitySpan>::reset[abi:ne180100](&a12);
  std::unique_ptr<siri::ontology::UsoGraph>::reset[abi:ne180100](&a22);

  _Unwind_Resume(a1);
}

void sub_2265E14D8(_Unwind_Exception *a1)
{
  MEMORY[0x22A6568D0](v1, 0x10A0C403D23BABBLL);
  _Unwind_Resume(a1);
}

void sub_2265E2428(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::unique_ptr<siri::ontology::UsoGraph>::reset[abi:ne180100]((uint64_t *)va);

  _Unwind_Resume(a1);
}

void sub_2265E2C58(_Unwind_Exception *a1)
{
  MEMORY[0x22A6568D0](v2, 0x10A0C403D23BABBLL);

  _Unwind_Resume(a1);
}

void sub_2265E330C(_Unwind_Exception *a1)
{
  MEMORY[0x22A6568D0](v2, 0x10A0C403D23BABBLL);

  _Unwind_Resume(a1);
}

void sub_2265E3628(_Unwind_Exception *a1)
{
  MEMORY[0x22A6568D0](v2, 0x10A0C403D23BABBLL);

  _Unwind_Resume(a1);
}

void sub_2265E37B4(_Unwind_Exception *a1)
{
  MEMORY[0x22A6568D0](v2, 0x10A0C403D23BABBLL);

  _Unwind_Resume(a1);
}

void sub_2265E397C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16, int a17, uint64_t a18)
{
  if (a16)
  {
    if (a15 < 0) {
      operator delete(__p);
    }
  }
  std::unique_ptr<siri::ontology::UsoGraph>::reset[abi:ne180100](&a18);

  _Unwind_Resume(a1);
}

void sub_2265E3B64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16, int a17, uint64_t a18)
{
  if (a16)
  {
    if (a15 < 0) {
      operator delete(__p);
    }
  }
  std::unique_ptr<siri::ontology::UsoGraph>::reset[abi:ne180100](&a18);

  _Unwind_Resume(a1);
}

void sub_2265E3E14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, void *a11, void **a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, char a20,int a21,uint64_t a22)
{
  std::unique_ptr<siri::ontology::UsoEntitySpan>::reset[abi:ne180100](&a12);
  std::unique_ptr<siri::ontology::UsoGraph>::reset[abi:ne180100](&a22);

  _Unwind_Resume(a1);
}

void sub_2265E4034(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16, int a17, uint64_t a18)
{
  if (a16)
  {
    if (a15 < 0) {
      operator delete(__p);
    }
  }
  std::unique_ptr<siri::ontology::UsoGraph>::reset[abi:ne180100](&a18);

  _Unwind_Resume(a1);
}

void sub_2265E4310(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, void *a10, void *a11, void **a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, char a20,int a21,uint64_t a22)
{
  _Unwind_Resume(a1);
}

void sub_2265E4600(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, void *a11, void **a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, char a20,int a21,uint64_t a22)
{
  std::unique_ptr<siri::ontology::UsoEntitySpan>::reset[abi:ne180100](&a12);
  std::unique_ptr<siri::ontology::UsoGraph>::reset[abi:ne180100](&a22);

  _Unwind_Resume(a1);
}

void sub_2265E48E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, void *a11, void **a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, char a20,int a21,uint64_t a22)
{
  std::unique_ptr<siri::ontology::UsoEntitySpan>::reset[abi:ne180100](&a12);
  std::unique_ptr<siri::ontology::UsoGraph>::reset[abi:ne180100](&a22);

  _Unwind_Resume(a1);
}

void sub_2265E4BFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, void *a10, void *a11, void **a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, char a20,int a21,uint64_t a22)
{
  _Unwind_Resume(a1);
}

void sub_2265E4F18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, void *a10, void *a11, void **a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, char a20,int a21,uint64_t a22)
{
  _Unwind_Resume(a1);
}

void sub_2265E5234(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, void *a10, void *a11, void **a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, char a20,int a21,uint64_t a22)
{
  _Unwind_Resume(a1);
}

void sub_2265E9774(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2265E9870(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2265E9B28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2265E9DC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2265EA0C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_2265EAA34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, std::__shared_weak_count *a9, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24,char a25)
{
  std::unique_ptr<siri::ontology::UsoGraph>::reset[abi:ne180100](&a18);
  if (a9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a9);
  }

  _Unwind_Resume(a1);
}

void sub_2265EB058(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_2265EB224(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2265EB344(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2265EB4E4(_Unwind_Exception *a1)
{
  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_2265EBA60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, void *a16, void *a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_2265EBC7C(_Unwind_Exception *a1)
{
  v5 = v3;

  _Unwind_Resume(a1);
}

void sub_2265EBDA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2265EBEF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2265EC00C(_Unwind_Exception *a1)
{
  long long v3 = v2;

  _Unwind_Resume(a1);
}

void sub_2265EC9B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  objc_destroyWeak(v32);
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose((const void *)(v33 - 152), 8);
  objc_destroyWeak((id *)(v33 - 104));
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__10300(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10301(uint64_t a1)
{
}

void sub_2265ED830(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2265EDCCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, uint64_t a14, void *a15, uint64_t a16, void *a17)
{
  _Unwind_Resume(a1);
}

void sub_2265EDEAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2265EE0A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2265EE144(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2265EE2D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_2265EE450(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13)
{
  _Unwind_Resume(a1);
}

void sub_2265EE918(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25,char a26)
{
  if (a18 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_2265F28B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2265F2A64(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, long long a9)
{
  if (a2 == 1)
  {
    id v9 = objc_begin_catch(exception_object);
    v10 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LODWORD(a9) = 136315394;
      *(void *)((char *)&a9 + 4) = "-[NSDictionary(CDMJSONSerialization) _cdm_JSONString]";
      WORD6(a9) = 2112;
      *(void *)((char *)&a9 + 14) = v9;
      _os_log_error_impl(&dword_2263A0000, v10, OS_LOG_TYPE_ERROR, "%s [ERR]: Exception during JSON Serialization: %@", (uint8_t *)&a9, 0x16u);
    }

    objc_end_catch();
    JUMPOUT(0x2265F2A18);
  }
  _Unwind_Resume(exception_object);
}

void sub_2265F2CB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2265F364C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2265F36F0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2265F4C3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_2265F4C80()
{
  return MEMORY[0x270EEDAC8]();
}

uint64_t sub_2265F4CA0()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_2265F4CB0()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_2265F4CC0()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_2265F4CD0()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_2265F4CE0()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_2265F4CF0()
{
  return MEMORY[0x270EEE098]();
}

uint64_t sub_2265F4D00()
{
  return MEMORY[0x270EEE188]();
}

uint64_t sub_2265F4D10()
{
  return MEMORY[0x270EEE218]();
}

uint64_t sub_2265F4D20()
{
  return MEMORY[0x270EEE258]();
}

uint64_t sub_2265F4D30()
{
  return MEMORY[0x270EEE628]();
}

uint64_t sub_2265F4D40()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_2265F4D50()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_2265F4D60()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_2265F4D70()
{
  return MEMORY[0x270EEE688]();
}

uint64_t sub_2265F4D80()
{
  return MEMORY[0x270EEE8E8]();
}

uint64_t sub_2265F4D90()
{
  return MEMORY[0x270EEEA90]();
}

uint64_t sub_2265F4DA0()
{
  return MEMORY[0x270EEEAE8]();
}

uint64_t sub_2265F4DB0()
{
  return MEMORY[0x270EEEDD8]();
}

uint64_t sub_2265F4DC0()
{
  return MEMORY[0x270EEEEF0]();
}

uint64_t sub_2265F4DD0()
{
  return MEMORY[0x270EEEFF8]();
}

uint64_t sub_2265F4DE0()
{
  return MEMORY[0x270EEF760]();
}

uint64_t sub_2265F4DF0()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_2265F4E00()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_2265F4E10()
{
  return MEMORY[0x270EEF868]();
}

uint64_t sub_2265F4E20()
{
  return MEMORY[0x270EEF898]();
}

uint64_t sub_2265F4E30()
{
  return MEMORY[0x270EEF8C0]();
}

uint64_t sub_2265F4E40()
{
  return MEMORY[0x270EEF9D8]();
}

uint64_t sub_2265F4E50()
{
  return MEMORY[0x270EEFA78]();
}

uint64_t sub_2265F4E60()
{
  return MEMORY[0x270EEFC10]();
}

uint64_t sub_2265F4E70()
{
  return MEMORY[0x270EEFC48]();
}

uint64_t sub_2265F4E80()
{
  return MEMORY[0x270EEFC88]();
}

uint64_t sub_2265F4E90()
{
  return MEMORY[0x270EEFCE0]();
}

uint64_t sub_2265F4EA0()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_2265F4EB0()
{
  return MEMORY[0x270EEFD78]();
}

uint64_t sub_2265F4EC0()
{
  return MEMORY[0x270EEFDC0]();
}

uint64_t sub_2265F4ED0()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_2265F4EE0()
{
  return MEMORY[0x270EEFE68]();
}

uint64_t sub_2265F4EF0()
{
  return MEMORY[0x270EEFE80]();
}

uint64_t sub_2265F4F00()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_2265F4F10()
{
  return MEMORY[0x270EEFF18]();
}

uint64_t sub_2265F4F20()
{
  return MEMORY[0x270EEFF30]();
}

uint64_t sub_2265F4F30()
{
  return MEMORY[0x270EEFF40]();
}

uint64_t sub_2265F4F40()
{
  return MEMORY[0x270EEFF58]();
}

uint64_t sub_2265F4F50()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_2265F4F60()
{
  return MEMORY[0x270EF0048]();
}

uint64_t sub_2265F4F70()
{
  return MEMORY[0x270EF0070]();
}

uint64_t sub_2265F4F80()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_2265F4F90()
{
  return MEMORY[0x270EF0130]();
}

uint64_t sub_2265F4FA0()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_2265F4FB0()
{
  return MEMORY[0x270EF0198]();
}

uint64_t sub_2265F4FC0()
{
  return MEMORY[0x270EF01B0]();
}

uint64_t sub_2265F4FD0()
{
  return MEMORY[0x270EF0238]();
}

uint64_t sub_2265F4FE0()
{
  return MEMORY[0x270EF0700]();
}

uint64_t sub_2265F4FF0()
{
  return MEMORY[0x270EF07E0]();
}

uint64_t sub_2265F5000()
{
  return MEMORY[0x270EF0898]();
}

uint64_t sub_2265F5010()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_2265F5020()
{
  return MEMORY[0x270EF09A8]();
}

uint64_t sub_2265F5030()
{
  return MEMORY[0x270EF09B8]();
}

uint64_t sub_2265F5040()
{
  return MEMORY[0x270EF0AF8]();
}

uint64_t sub_2265F5050()
{
  return MEMORY[0x270EF0B88]();
}

uint64_t sub_2265F5060()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_2265F5070()
{
  return MEMORY[0x270EF0BE8]();
}

uint64_t sub_2265F5080()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_2265F5090()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_2265F50A0()
{
  return MEMORY[0x270EF0C58]();
}

uint64_t sub_2265F50B0()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_2265F50C0()
{
  return MEMORY[0x270EF0C88]();
}

uint64_t sub_2265F50D0()
{
  return MEMORY[0x270EF0CB0]();
}

uint64_t sub_2265F50E0()
{
  return MEMORY[0x270EF0CB8]();
}

uint64_t sub_2265F50F0()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_2265F5100()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_2265F5110()
{
  return MEMORY[0x270EF0D78]();
}

uint64_t sub_2265F5120()
{
  return MEMORY[0x270EF0D80]();
}

uint64_t sub_2265F5130()
{
  return MEMORY[0x270EF0D98]();
}

uint64_t sub_2265F5140()
{
  return MEMORY[0x270EF0DA8]();
}

uint64_t sub_2265F5150()
{
  return MEMORY[0x270EF0DB8]();
}

uint64_t sub_2265F5160()
{
  return MEMORY[0x270EF0DD8]();
}

uint64_t sub_2265F5170()
{
  return MEMORY[0x270EF0E00]();
}

uint64_t sub_2265F5180()
{
  return MEMORY[0x270EF0EE0]();
}

uint64_t sub_2265F51A0()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t sub_2265F51B0()
{
  return MEMORY[0x270EF1008]();
}

uint64_t sub_2265F51C0()
{
  return MEMORY[0x270EF1060]();
}

uint64_t sub_2265F51D0()
{
  return MEMORY[0x270EF1080]();
}

uint64_t sub_2265F51E0()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_2265F51F0()
{
  return MEMORY[0x270EF1368]();
}

uint64_t sub_2265F5200()
{
  return MEMORY[0x270EF13D8]();
}

uint64_t sub_2265F5210()
{
  return MEMORY[0x270EF1410]();
}

uint64_t sub_2265F5220()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_2265F5230()
{
  return MEMORY[0x270EF15A8]();
}

uint64_t sub_2265F5240()
{
  return MEMORY[0x270EF15C8]();
}

uint64_t sub_2265F5250()
{
  return MEMORY[0x270EF1608]();
}

uint64_t sub_2265F5260()
{
  return MEMORY[0x270F28690]();
}

uint64_t sub_2265F5280()
{
  return MEMORY[0x270F286C0]();
}

uint64_t sub_2265F5290()
{
  return MEMORY[0x270F286C8]();
}

uint64_t sub_2265F52A0()
{
  return MEMORY[0x270F286D8]();
}

uint64_t sub_2265F52B0()
{
  return MEMORY[0x270F4B890]();
}

uint64_t sub_2265F52C0()
{
  return MEMORY[0x270F4BAC8]();
}

uint64_t sub_2265F52D0()
{
  return MEMORY[0x270F4BBE0]();
}

uint64_t sub_2265F52E0()
{
  return MEMORY[0x270F4BBF0]();
}

uint64_t sub_2265F52F0()
{
  return MEMORY[0x270F4BC98]();
}

uint64_t sub_2265F5300()
{
  return MEMORY[0x270F4BCA0]();
}

uint64_t sub_2265F5310()
{
  return MEMORY[0x270F4BD30]();
}

uint64_t sub_2265F5320()
{
  return MEMORY[0x270F4BD48]();
}

uint64_t sub_2265F5330()
{
  return MEMORY[0x270F4BE70]();
}

uint64_t sub_2265F5340()
{
  return MEMORY[0x270F4BFD0]();
}

uint64_t sub_2265F5350()
{
  return MEMORY[0x270F4C4B0]();
}

uint64_t sub_2265F5360()
{
  return MEMORY[0x270F4C4B8]();
}

uint64_t sub_2265F5370()
{
  return MEMORY[0x270F4C4C0]();
}

uint64_t sub_2265F5380()
{
  return MEMORY[0x270F4C4C8]();
}

uint64_t sub_2265F5390()
{
  return MEMORY[0x270F4C4D0]();
}

uint64_t sub_2265F53A0()
{
  return MEMORY[0x270F4C4D8]();
}

uint64_t sub_2265F53B0()
{
  return MEMORY[0x270F4C4E0]();
}

uint64_t sub_2265F53C0()
{
  return MEMORY[0x270F4C4F0]();
}

uint64_t sub_2265F53D0()
{
  return MEMORY[0x270F4C508]();
}

uint64_t sub_2265F53E0()
{
  return MEMORY[0x270F6A260]();
}

uint64_t sub_2265F53F0()
{
  return MEMORY[0x270F6A268]();
}

uint64_t sub_2265F5400()
{
  return MEMORY[0x270F6A270]();
}

uint64_t sub_2265F5410()
{
  return MEMORY[0x270F6A278]();
}

uint64_t sub_2265F5420()
{
  return MEMORY[0x270F6A280]();
}

uint64_t sub_2265F5430()
{
  return MEMORY[0x270F6A288]();
}

uint64_t sub_2265F5440()
{
  return MEMORY[0x270F6A290]();
}

uint64_t sub_2265F5450()
{
  return MEMORY[0x270F6A2B8]();
}

uint64_t sub_2265F5460()
{
  return MEMORY[0x270F6A2C0]();
}

uint64_t sub_2265F5470()
{
  return MEMORY[0x270F6A2C8]();
}

uint64_t sub_2265F5480()
{
  return MEMORY[0x270F6A2D0]();
}

uint64_t sub_2265F5490()
{
  return MEMORY[0x270F6A2E0]();
}

uint64_t sub_2265F54A0()
{
  return MEMORY[0x270F6A2E8]();
}

uint64_t sub_2265F54B0()
{
  return MEMORY[0x270F6A308]();
}

uint64_t sub_2265F54C0()
{
  return MEMORY[0x270F6A350]();
}

uint64_t sub_2265F54D0()
{
  return MEMORY[0x270F6A368]();
}

uint64_t sub_2265F54E0()
{
  return MEMORY[0x270F6A370]();
}

uint64_t sub_2265F54F0()
{
  return MEMORY[0x270F6A388]();
}

uint64_t sub_2265F5500()
{
  return MEMORY[0x270F6A398]();
}

uint64_t sub_2265F5510()
{
  return MEMORY[0x270F6A3A8]();
}

uint64_t sub_2265F5520()
{
  return MEMORY[0x270F6A3B8]();
}

uint64_t sub_2265F5530()
{
  return MEMORY[0x270F6A3C0]();
}

uint64_t sub_2265F5540()
{
  return MEMORY[0x270F6A3C8]();
}

uint64_t sub_2265F5550()
{
  return MEMORY[0x270F6A3D0]();
}

uint64_t sub_2265F5560()
{
  return MEMORY[0x270F6A3D8]();
}

uint64_t sub_2265F5570()
{
  return MEMORY[0x270F6A3E0]();
}

uint64_t sub_2265F5580()
{
  return MEMORY[0x270F6A3E8]();
}

uint64_t sub_2265F5590()
{
  return MEMORY[0x270F6A3F0]();
}

uint64_t sub_2265F55A0()
{
  return MEMORY[0x270F6A3F8]();
}

uint64_t sub_2265F55B0()
{
  return MEMORY[0x270F6A400]();
}

uint64_t sub_2265F55C0()
{
  return MEMORY[0x270F6A408]();
}

uint64_t sub_2265F55D0()
{
  return MEMORY[0x270F6A410]();
}

uint64_t sub_2265F55E0()
{
  return MEMORY[0x270F6A418]();
}

uint64_t sub_2265F55F0()
{
  return MEMORY[0x270F6A420]();
}

uint64_t sub_2265F5600()
{
  return MEMORY[0x270F6A428]();
}

uint64_t sub_2265F5610()
{
  return MEMORY[0x270F6A430]();
}

uint64_t sub_2265F5620()
{
  return MEMORY[0x270F6A440]();
}

uint64_t sub_2265F5630()
{
  return MEMORY[0x270F6A448]();
}

uint64_t sub_2265F5640()
{
  return MEMORY[0x270F6A450]();
}

uint64_t sub_2265F5650()
{
  return MEMORY[0x270F6A458]();
}

uint64_t sub_2265F5660()
{
  return MEMORY[0x270F6A460]();
}

uint64_t sub_2265F5670()
{
  return MEMORY[0x270F6A468]();
}

uint64_t sub_2265F5680()
{
  return MEMORY[0x270F6A470]();
}

uint64_t sub_2265F5690()
{
  return MEMORY[0x270F6A478]();
}

uint64_t sub_2265F56A0()
{
  return MEMORY[0x270F6A480]();
}

uint64_t sub_2265F56B0()
{
  return MEMORY[0x270F6A498]();
}

uint64_t sub_2265F56C0()
{
  return MEMORY[0x270F6A4A0]();
}

uint64_t sub_2265F56D0()
{
  return MEMORY[0x270F6A4B0]();
}

uint64_t sub_2265F56E0()
{
  return MEMORY[0x270F6A4B8]();
}

uint64_t sub_2265F56F0()
{
  return MEMORY[0x270F6A4D0]();
}

uint64_t sub_2265F5700()
{
  return MEMORY[0x270F6A4D8]();
}

uint64_t sub_2265F5710()
{
  return MEMORY[0x270F6A4F0]();
}

uint64_t sub_2265F5720()
{
  return MEMORY[0x270F6A4F8]();
}

uint64_t sub_2265F5730()
{
  return MEMORY[0x270F6A500]();
}

uint64_t sub_2265F5740()
{
  return MEMORY[0x270F6A508]();
}

uint64_t sub_2265F5750()
{
  return MEMORY[0x270F6A510]();
}

uint64_t sub_2265F5760()
{
  return MEMORY[0x270F6A518]();
}

uint64_t sub_2265F5770()
{
  return MEMORY[0x270F6A520]();
}

uint64_t sub_2265F5780()
{
  return MEMORY[0x270F6A528]();
}

uint64_t sub_2265F5790()
{
  return MEMORY[0x270F6A560]();
}

uint64_t sub_2265F57A0()
{
  return MEMORY[0x270F6A568]();
}

uint64_t sub_2265F57B0()
{
  return MEMORY[0x270F6A578]();
}

uint64_t sub_2265F57C0()
{
  return MEMORY[0x270F6A580]();
}

uint64_t sub_2265F57D0()
{
  return MEMORY[0x270F6A588]();
}

uint64_t sub_2265F57E0()
{
  return MEMORY[0x270F6A590]();
}

uint64_t sub_2265F57F0()
{
  return MEMORY[0x270F6A598]();
}

uint64_t sub_2265F5800()
{
  return MEMORY[0x270F6A5A0]();
}

uint64_t sub_2265F5810()
{
  return MEMORY[0x270F6A5A8]();
}

uint64_t sub_2265F5820()
{
  return MEMORY[0x270F6A5B0]();
}

uint64_t sub_2265F5830()
{
  return MEMORY[0x270F6A5B8]();
}

uint64_t sub_2265F5840()
{
  return MEMORY[0x270F6A5D8]();
}

uint64_t sub_2265F5850()
{
  return MEMORY[0x270F6A5E0]();
}

uint64_t sub_2265F5860()
{
  return MEMORY[0x270F6A600]();
}

uint64_t sub_2265F5870()
{
  return MEMORY[0x270F6A608]();
}

uint64_t sub_2265F5880()
{
  return MEMORY[0x270F6A698]();
}

uint64_t sub_2265F5890()
{
  return MEMORY[0x270F6A6A0]();
}

uint64_t sub_2265F58A0()
{
  return MEMORY[0x270F6A6A8]();
}

uint64_t sub_2265F58B0()
{
  return MEMORY[0x270F6A6B0]();
}

uint64_t sub_2265F58C0()
{
  return MEMORY[0x270F6A6B8]();
}

uint64_t sub_2265F58D0()
{
  return MEMORY[0x270F6A6C0]();
}

uint64_t sub_2265F58E0()
{
  return MEMORY[0x270F6A6C8]();
}

uint64_t sub_2265F58F0()
{
  return MEMORY[0x270F6A6D0]();
}

uint64_t sub_2265F5900()
{
  return MEMORY[0x270F6A6D8]();
}

uint64_t sub_2265F5910()
{
  return MEMORY[0x270F6A6E0]();
}

uint64_t sub_2265F5920()
{
  return MEMORY[0x270F6A6E8]();
}

uint64_t sub_2265F5930()
{
  return MEMORY[0x270F6A6F0]();
}

uint64_t sub_2265F5940()
{
  return MEMORY[0x270F6A6F8]();
}

uint64_t sub_2265F5950()
{
  return MEMORY[0x270F6A700]();
}

uint64_t sub_2265F5960()
{
  return MEMORY[0x270F6A728]();
}

uint64_t sub_2265F5970()
{
  return MEMORY[0x270F6A758]();
}

uint64_t sub_2265F5980()
{
  return MEMORY[0x270F6A790]();
}

uint64_t sub_2265F5990()
{
  return MEMORY[0x270F6A7B0]();
}

uint64_t sub_2265F59A0()
{
  return MEMORY[0x270F6A818]();
}

uint64_t sub_2265F59B0()
{
  return MEMORY[0x270F6A830]();
}

uint64_t sub_2265F59C0()
{
  return MEMORY[0x270F6A850]();
}

uint64_t sub_2265F59D0()
{
  return MEMORY[0x270F6A858]();
}

uint64_t sub_2265F59E0()
{
  return MEMORY[0x270F6A860]();
}

uint64_t sub_2265F59F0()
{
  return MEMORY[0x270F6A868]();
}

uint64_t sub_2265F5A00()
{
  return MEMORY[0x270F6A870]();
}

uint64_t sub_2265F5A10()
{
  return MEMORY[0x270F6A878]();
}

uint64_t sub_2265F5A20()
{
  return MEMORY[0x270F6A880]();
}

uint64_t sub_2265F5A30()
{
  return MEMORY[0x270F6A888]();
}

uint64_t sub_2265F5A40()
{
  return MEMORY[0x270F6A890]();
}

uint64_t sub_2265F5A50()
{
  return MEMORY[0x270F6A898]();
}

uint64_t sub_2265F5A60()
{
  return MEMORY[0x270F6A8A0]();
}

uint64_t sub_2265F5A70()
{
  return MEMORY[0x270F6A8A8]();
}

uint64_t sub_2265F5A80()
{
  return MEMORY[0x270F6A8B0]();
}

uint64_t sub_2265F5A90()
{
  return MEMORY[0x270F6A8B8]();
}

uint64_t sub_2265F5AA0()
{
  return MEMORY[0x270F6A8C0]();
}

uint64_t sub_2265F5AB0()
{
  return MEMORY[0x270F6AA48]();
}

uint64_t sub_2265F5AC0()
{
  return MEMORY[0x270F6AA50]();
}

uint64_t sub_2265F5AD0()
{
  return MEMORY[0x270F6AA58]();
}

uint64_t sub_2265F5AE0()
{
  return MEMORY[0x270F6AA78]();
}

uint64_t sub_2265F5AF0()
{
  return MEMORY[0x270F6AA98]();
}

uint64_t sub_2265F5B00()
{
  return MEMORY[0x270F6AAA0]();
}

uint64_t sub_2265F5B10()
{
  return MEMORY[0x270F6AAB0]();
}

uint64_t sub_2265F5B20()
{
  return MEMORY[0x270F6AAC8]();
}

uint64_t sub_2265F5B30()
{
  return MEMORY[0x270F6AAD0]();
}

uint64_t sub_2265F5B40()
{
  return MEMORY[0x270F6AAD8]();
}

uint64_t sub_2265F5B50()
{
  return MEMORY[0x270F6AAE0]();
}

uint64_t sub_2265F5B60()
{
  return MEMORY[0x270F6AAE8]();
}

uint64_t sub_2265F5B70()
{
  return MEMORY[0x270F6AAF0]();
}

uint64_t sub_2265F5B80()
{
  return MEMORY[0x270F6AAF8]();
}

uint64_t sub_2265F5B90()
{
  return MEMORY[0x270F6AB00]();
}

uint64_t sub_2265F5BA0()
{
  return MEMORY[0x270F6AB08]();
}

uint64_t sub_2265F5BB0()
{
  return MEMORY[0x270F6AB10]();
}

uint64_t sub_2265F5BC0()
{
  return MEMORY[0x270F6AB18]();
}

uint64_t sub_2265F5BD0()
{
  return MEMORY[0x270F6AB20]();
}

uint64_t sub_2265F5BE0()
{
  return MEMORY[0x270F6AB28]();
}

uint64_t sub_2265F5BF0()
{
  return MEMORY[0x270F6AB30]();
}

uint64_t sub_2265F5C00()
{
  return MEMORY[0x270F6AB38]();
}

uint64_t sub_2265F5C10()
{
  return MEMORY[0x270F6AB40]();
}

uint64_t sub_2265F5C20()
{
  return MEMORY[0x270F6AB48]();
}

uint64_t sub_2265F5C30()
{
  return MEMORY[0x270F6AB50]();
}

uint64_t sub_2265F5C40()
{
  return MEMORY[0x270F6AB58]();
}

uint64_t sub_2265F5C50()
{
  return MEMORY[0x270F6AB70]();
}

uint64_t sub_2265F5C60()
{
  return MEMORY[0x270F6AB90]();
}

uint64_t sub_2265F5C70()
{
  return MEMORY[0x270F6ABB0]();
}

uint64_t sub_2265F5C80()
{
  return MEMORY[0x270F6ABE0]();
}

uint64_t sub_2265F5C90()
{
  return MEMORY[0x270F6AC08]();
}

uint64_t sub_2265F5CA0()
{
  return MEMORY[0x270F6AC10]();
}

uint64_t sub_2265F5CB0()
{
  return MEMORY[0x270F6AC18]();
}

uint64_t sub_2265F5CC0()
{
  return MEMORY[0x270F6AC30]();
}

uint64_t sub_2265F5CD0()
{
  return MEMORY[0x270F6AC38]();
}

uint64_t sub_2265F5CE0()
{
  return MEMORY[0x270F6AC80]();
}

uint64_t sub_2265F5CF0()
{
  return MEMORY[0x270F6AC98]();
}

uint64_t sub_2265F5D00()
{
  return MEMORY[0x270F6ACB8]();
}

uint64_t sub_2265F5D10()
{
  return MEMORY[0x270F6ACC0]();
}

uint64_t sub_2265F5D20()
{
  return MEMORY[0x270F6AD08]();
}

uint64_t sub_2265F5D30()
{
  return MEMORY[0x270F6AD18]();
}

uint64_t sub_2265F5D40()
{
  return MEMORY[0x270F6AD20]();
}

uint64_t sub_2265F5D50()
{
  return MEMORY[0x270F6AD28]();
}

uint64_t sub_2265F5D60()
{
  return MEMORY[0x270F6AD30]();
}

uint64_t sub_2265F5D70()
{
  return MEMORY[0x270F6AD38]();
}

uint64_t sub_2265F5D80()
{
  return MEMORY[0x270F6AD40]();
}

uint64_t sub_2265F5D90()
{
  return MEMORY[0x270F6AD48]();
}

uint64_t sub_2265F5DA0()
{
  return MEMORY[0x270F6AD50]();
}

uint64_t sub_2265F5DB0()
{
  return MEMORY[0x270F6AD58]();
}

uint64_t sub_2265F5DC0()
{
  return MEMORY[0x270F6AD60]();
}

uint64_t sub_2265F5DD0()
{
  return MEMORY[0x270F6AD68]();
}

uint64_t sub_2265F5DE0()
{
  return MEMORY[0x270F6AD70]();
}

uint64_t sub_2265F5DF0()
{
  return MEMORY[0x270F6AD78]();
}

uint64_t sub_2265F5E10()
{
  return MEMORY[0x270F6AD88]();
}

uint64_t sub_2265F5E20()
{
  return MEMORY[0x270F6AD90]();
}

uint64_t sub_2265F5E30()
{
  return MEMORY[0x270F6AD98]();
}

uint64_t sub_2265F5E40()
{
  return MEMORY[0x270F6ADA0]();
}

uint64_t sub_2265F5E50()
{
  return MEMORY[0x270F6ADC0]();
}

uint64_t sub_2265F5E60()
{
  return MEMORY[0x270F6AE40]();
}

uint64_t sub_2265F5E70()
{
  return MEMORY[0x270F6AE48]();
}

uint64_t sub_2265F5E80()
{
  return MEMORY[0x270F6AE50]();
}

uint64_t sub_2265F5E90()
{
  return MEMORY[0x270F6AE58]();
}

uint64_t sub_2265F5EA0()
{
  return MEMORY[0x270F6AEA8]();
}

uint64_t sub_2265F5EB0()
{
  return MEMORY[0x270F6AEB0]();
}

uint64_t sub_2265F5EC0()
{
  return MEMORY[0x270F6AEB8]();
}

uint64_t sub_2265F5ED0()
{
  return MEMORY[0x270F6AEC0]();
}

uint64_t sub_2265F5EE0()
{
  return MEMORY[0x270F6AEC8]();
}

uint64_t sub_2265F5EF0()
{
  return MEMORY[0x270F6AED0]();
}

uint64_t sub_2265F5F00()
{
  return MEMORY[0x270F6AED8]();
}

uint64_t sub_2265F5F10()
{
  return MEMORY[0x270F6AEE0]();
}

uint64_t sub_2265F5F20()
{
  return MEMORY[0x270F6AEE8]();
}

uint64_t sub_2265F5F30()
{
  return MEMORY[0x270F6AEF0]();
}

uint64_t sub_2265F5F40()
{
  return MEMORY[0x270F6AEF8]();
}

uint64_t sub_2265F5F50()
{
  return MEMORY[0x270F6AF00]();
}

uint64_t sub_2265F5F60()
{
  return MEMORY[0x270F6AF08]();
}

uint64_t sub_2265F5F70()
{
  return MEMORY[0x270F6AF10]();
}

uint64_t sub_2265F5F80()
{
  return MEMORY[0x270F6AF18]();
}

uint64_t sub_2265F5F90()
{
  return MEMORY[0x270F6AF20]();
}

uint64_t sub_2265F5FA0()
{
  return MEMORY[0x270F6AF28]();
}

uint64_t sub_2265F5FB0()
{
  return MEMORY[0x270F6AF30]();
}

uint64_t sub_2265F5FC0()
{
  return MEMORY[0x270F6AF38]();
}

uint64_t sub_2265F5FD0()
{
  return MEMORY[0x270F6AF40]();
}

uint64_t sub_2265F5FE0()
{
  return MEMORY[0x270F6AF48]();
}

uint64_t sub_2265F5FF0()
{
  return MEMORY[0x270F6AF80]();
}

uint64_t sub_2265F6000()
{
  return MEMORY[0x270F6AF88]();
}

uint64_t sub_2265F6010()
{
  return MEMORY[0x270F6AF90]();
}

uint64_t sub_2265F6020()
{
  return MEMORY[0x270F6AF98]();
}

uint64_t sub_2265F6030()
{
  return MEMORY[0x270F6AFA0]();
}

uint64_t sub_2265F6040()
{
  return MEMORY[0x270F6AFA8]();
}

uint64_t sub_2265F6050()
{
  return MEMORY[0x270F6AFB0]();
}

uint64_t sub_2265F6060()
{
  return MEMORY[0x270F6AFB8]();
}

uint64_t sub_2265F6070()
{
  return MEMORY[0x270F6AFC0]();
}

uint64_t sub_2265F6080()
{
  return MEMORY[0x270F6AFC8]();
}

uint64_t sub_2265F6090()
{
  return MEMORY[0x270F6AFD0]();
}

uint64_t sub_2265F60A0()
{
  return MEMORY[0x270F6AFD8]();
}

uint64_t sub_2265F60B0()
{
  return MEMORY[0x270F6AFE0]();
}

uint64_t sub_2265F60C0()
{
  return MEMORY[0x270F6AFE8]();
}

uint64_t sub_2265F60D0()
{
  return MEMORY[0x270F6B020]();
}

uint64_t sub_2265F60E0()
{
  return MEMORY[0x270F6B028]();
}

uint64_t sub_2265F6110()
{
  return MEMORY[0x270F6B040]();
}

uint64_t sub_2265F6120()
{
  return MEMORY[0x270F6B048]();
}

uint64_t sub_2265F6130()
{
  return MEMORY[0x270F6B050]();
}

uint64_t sub_2265F6140()
{
  return MEMORY[0x270F6B058]();
}

uint64_t sub_2265F6150()
{
  return MEMORY[0x270F6B060]();
}

uint64_t sub_2265F6160()
{
  return MEMORY[0x270F6B068]();
}

uint64_t sub_2265F6170()
{
  return MEMORY[0x270F6B070]();
}

uint64_t sub_2265F6180()
{
  return MEMORY[0x270F6B078]();
}

uint64_t sub_2265F6190()
{
  return MEMORY[0x270F6B080]();
}

uint64_t sub_2265F61A0()
{
  return MEMORY[0x270F6B088]();
}

uint64_t sub_2265F61B0()
{
  return MEMORY[0x270F6B090]();
}

uint64_t sub_2265F61C0()
{
  return MEMORY[0x270F6B098]();
}

uint64_t sub_2265F61D0()
{
  return MEMORY[0x270F6B0A0]();
}

uint64_t sub_2265F61E0()
{
  return MEMORY[0x270F6B0A8]();
}

uint64_t sub_2265F61F0()
{
  return MEMORY[0x270F6B0B0]();
}

uint64_t sub_2265F6200()
{
  return MEMORY[0x270F6B0B8]();
}

uint64_t sub_2265F6210()
{
  return MEMORY[0x270F6B0C0]();
}

uint64_t sub_2265F6220()
{
  return MEMORY[0x270F6B0C8]();
}

uint64_t sub_2265F6230()
{
  return MEMORY[0x270F6B0D0]();
}

uint64_t sub_2265F6240()
{
  return MEMORY[0x270F6B0D8]();
}

uint64_t sub_2265F6250()
{
  return MEMORY[0x270F6B0E0]();
}

uint64_t sub_2265F6260()
{
  return MEMORY[0x270F6B0E8]();
}

uint64_t sub_2265F6270()
{
  return MEMORY[0x270F6B0F0]();
}

uint64_t sub_2265F6280()
{
  return MEMORY[0x270F6B0F8]();
}

uint64_t sub_2265F6290()
{
  return MEMORY[0x270F6B100]();
}

uint64_t sub_2265F62A0()
{
  return MEMORY[0x270F6B108]();
}

uint64_t sub_2265F62B0()
{
  return MEMORY[0x270F6B110]();
}

uint64_t sub_2265F62C0()
{
  return MEMORY[0x270F6B118]();
}

uint64_t sub_2265F62D0()
{
  return MEMORY[0x270F6B120]();
}

uint64_t sub_2265F62E0()
{
  return MEMORY[0x270F6B128]();
}

uint64_t sub_2265F62F0()
{
  return MEMORY[0x270F6B130]();
}

uint64_t sub_2265F6300()
{
  return MEMORY[0x270F6B138]();
}

uint64_t sub_2265F6310()
{
  return MEMORY[0x270F6B140]();
}

uint64_t sub_2265F6320()
{
  return MEMORY[0x270F6B148]();
}

uint64_t sub_2265F6330()
{
  return MEMORY[0x270F6B150]();
}

uint64_t sub_2265F6340()
{
  return MEMORY[0x270F6B158]();
}

uint64_t sub_2265F6350()
{
  return MEMORY[0x270F6B160]();
}

uint64_t sub_2265F6360()
{
  return MEMORY[0x270F6B168]();
}

uint64_t sub_2265F6370()
{
  return MEMORY[0x270F6B170]();
}

uint64_t sub_2265F6380()
{
  return MEMORY[0x270F6B178]();
}

uint64_t sub_2265F6390()
{
  return MEMORY[0x270F6B180]();
}

uint64_t sub_2265F63A0()
{
  return MEMORY[0x270F6B188]();
}

uint64_t sub_2265F63B0()
{
  return MEMORY[0x270F6B190]();
}

uint64_t sub_2265F63C0()
{
  return MEMORY[0x270F6B198]();
}

uint64_t sub_2265F63D0()
{
  return MEMORY[0x270F6B1A0]();
}

uint64_t sub_2265F63E0()
{
  return MEMORY[0x270F6B1A8]();
}

uint64_t sub_2265F63F0()
{
  return MEMORY[0x270F6B1B0]();
}

uint64_t sub_2265F6400()
{
  return MEMORY[0x270F6B1B8]();
}

uint64_t sub_2265F6410()
{
  return MEMORY[0x270F6B1C0]();
}

uint64_t sub_2265F6420()
{
  return MEMORY[0x270F6B1C8]();
}

uint64_t sub_2265F6430()
{
  return MEMORY[0x270F6B1D0]();
}

uint64_t sub_2265F6440()
{
  return MEMORY[0x270F6B1D8]();
}

uint64_t sub_2265F6450()
{
  return MEMORY[0x270F6B1E0]();
}

uint64_t sub_2265F6460()
{
  return MEMORY[0x270F6B1E8]();
}

uint64_t sub_2265F6470()
{
  return MEMORY[0x270F6B210]();
}

uint64_t sub_2265F6480()
{
  return MEMORY[0x270F6B218]();
}

uint64_t sub_2265F6490()
{
  return MEMORY[0x270F6B220]();
}

uint64_t sub_2265F64A0()
{
  return MEMORY[0x270F6B228]();
}

uint64_t sub_2265F64B0()
{
  return MEMORY[0x270F6B230]();
}

uint64_t sub_2265F64C0()
{
  return MEMORY[0x270F6B238]();
}

uint64_t sub_2265F64D0()
{
  return MEMORY[0x270F6B240]();
}

uint64_t sub_2265F64E0()
{
  return MEMORY[0x270F6B248]();
}

uint64_t sub_2265F64F0()
{
  return MEMORY[0x270F6B250]();
}

uint64_t sub_2265F6500()
{
  return MEMORY[0x270F6B258]();
}

uint64_t sub_2265F6510()
{
  return MEMORY[0x270F6B260]();
}

uint64_t sub_2265F6520()
{
  return MEMORY[0x270F6B268]();
}

uint64_t sub_2265F6530()
{
  return MEMORY[0x270F6B270]();
}

uint64_t sub_2265F6540()
{
  return MEMORY[0x270F6B278]();
}

uint64_t sub_2265F6550()
{
  return MEMORY[0x270F6B280]();
}

uint64_t sub_2265F6560()
{
  return MEMORY[0x270F6B288]();
}

uint64_t sub_2265F6570()
{
  return MEMORY[0x270F6B290]();
}

uint64_t sub_2265F6580()
{
  return MEMORY[0x270F6B298]();
}

uint64_t sub_2265F6590()
{
  return MEMORY[0x270F6B2A0]();
}

uint64_t sub_2265F65A0()
{
  return MEMORY[0x270F6B2A8]();
}

uint64_t sub_2265F65B0()
{
  return MEMORY[0x270F6B2B0]();
}

uint64_t sub_2265F65C0()
{
  return MEMORY[0x270F6B2B8]();
}

uint64_t sub_2265F65D0()
{
  return MEMORY[0x270F6B2C0]();
}

uint64_t sub_2265F65E0()
{
  return MEMORY[0x270F6B2C8]();
}

uint64_t sub_2265F65F0()
{
  return MEMORY[0x270F6B2D0]();
}

uint64_t sub_2265F6600()
{
  return MEMORY[0x270F6B2D8]();
}

uint64_t sub_2265F6610()
{
  return MEMORY[0x270F6B2E0]();
}

uint64_t sub_2265F6620()
{
  return MEMORY[0x270F6B2E8]();
}

uint64_t sub_2265F6630()
{
  return MEMORY[0x270F6B2F0]();
}

uint64_t sub_2265F6640()
{
  return MEMORY[0x270F6B2F8]();
}

uint64_t sub_2265F6650()
{
  return MEMORY[0x270F6B300]();
}

uint64_t sub_2265F6660()
{
  return MEMORY[0x270F6B308]();
}

uint64_t sub_2265F6670()
{
  return MEMORY[0x270F6B310]();
}

uint64_t sub_2265F6680()
{
  return MEMORY[0x270F6B318]();
}

uint64_t sub_2265F6690()
{
  return MEMORY[0x270F6B320]();
}

uint64_t sub_2265F66A0()
{
  return MEMORY[0x270F6B328]();
}

uint64_t sub_2265F66B0()
{
  return MEMORY[0x270F6B330]();
}

uint64_t sub_2265F66C0()
{
  return MEMORY[0x270F6B338]();
}

uint64_t sub_2265F66D0()
{
  return MEMORY[0x270F6B340]();
}

uint64_t sub_2265F66E0()
{
  return MEMORY[0x270F6B348]();
}

uint64_t sub_2265F66F0()
{
  return MEMORY[0x270F6B350]();
}

uint64_t sub_2265F6700()
{
  return MEMORY[0x270F6B358]();
}

uint64_t sub_2265F6710()
{
  return MEMORY[0x270F6B360]();
}

uint64_t sub_2265F6720()
{
  return MEMORY[0x270F6B368]();
}

uint64_t sub_2265F6730()
{
  return MEMORY[0x270F6B370]();
}

uint64_t sub_2265F6740()
{
  return MEMORY[0x270F6B378]();
}

uint64_t sub_2265F6750()
{
  return MEMORY[0x270F6B380]();
}

uint64_t sub_2265F6760()
{
  return MEMORY[0x270F6B388]();
}

uint64_t sub_2265F6770()
{
  return MEMORY[0x270F6B390]();
}

uint64_t sub_2265F6780()
{
  return MEMORY[0x270F6B398]();
}

uint64_t sub_2265F6790()
{
  return MEMORY[0x270F6B3A0]();
}

uint64_t sub_2265F67A0()
{
  return MEMORY[0x270F6B3A8]();
}

uint64_t sub_2265F67B0()
{
  return MEMORY[0x270F6B3B0]();
}

uint64_t sub_2265F67C0()
{
  return MEMORY[0x270F6B3B8]();
}

uint64_t sub_2265F67D0()
{
  return MEMORY[0x270F6B3C0]();
}

uint64_t sub_2265F67E0()
{
  return MEMORY[0x270F6B3C8]();
}

uint64_t sub_2265F67F0()
{
  return MEMORY[0x270F6B3D0]();
}

uint64_t sub_2265F6800()
{
  return MEMORY[0x270F6B3D8]();
}

uint64_t sub_2265F6810()
{
  return MEMORY[0x270F6B3E0]();
}

uint64_t sub_2265F6820()
{
  return MEMORY[0x270F6B3E8]();
}

uint64_t sub_2265F6830()
{
  return MEMORY[0x270F6B3F0]();
}

uint64_t sub_2265F6840()
{
  return MEMORY[0x270F6B3F8]();
}

uint64_t sub_2265F6850()
{
  return MEMORY[0x270F6B400]();
}

uint64_t sub_2265F6860()
{
  return MEMORY[0x270F6B408]();
}

uint64_t sub_2265F6870()
{
  return MEMORY[0x270F6B410]();
}

uint64_t sub_2265F6880()
{
  return MEMORY[0x270F6B418]();
}

uint64_t sub_2265F6890()
{
  return MEMORY[0x270F6B420]();
}

uint64_t sub_2265F68A0()
{
  return MEMORY[0x270F6B428]();
}

uint64_t sub_2265F68B0()
{
  return MEMORY[0x270F6B430]();
}

uint64_t sub_2265F68C0()
{
  return MEMORY[0x270F6B438]();
}

uint64_t sub_2265F68D0()
{
  return MEMORY[0x270F6B440]();
}

uint64_t sub_2265F68E0()
{
  return MEMORY[0x270F6B448]();
}

uint64_t sub_2265F68F0()
{
  return MEMORY[0x270F6B450]();
}

uint64_t sub_2265F6900()
{
  return MEMORY[0x270F6B458]();
}

uint64_t sub_2265F6910()
{
  return MEMORY[0x270F6B460]();
}

uint64_t sub_2265F6920()
{
  return MEMORY[0x270F6B468]();
}

uint64_t sub_2265F6930()
{
  return MEMORY[0x270F6B470]();
}

uint64_t sub_2265F6940()
{
  return MEMORY[0x270F6B478]();
}

uint64_t sub_2265F6950()
{
  return MEMORY[0x270F6B480]();
}

uint64_t sub_2265F6960()
{
  return MEMORY[0x270F6B488]();
}

uint64_t sub_2265F6970()
{
  return MEMORY[0x270F6B490]();
}

uint64_t sub_2265F6980()
{
  return MEMORY[0x270F6B498]();
}

uint64_t sub_2265F6990()
{
  return MEMORY[0x270F6B4A0]();
}

uint64_t sub_2265F69A0()
{
  return MEMORY[0x270F6B4A8]();
}

uint64_t sub_2265F69B0()
{
  return MEMORY[0x270F6B4B0]();
}

uint64_t sub_2265F69C0()
{
  return MEMORY[0x270F6B4B8]();
}

uint64_t sub_2265F69D0()
{
  return MEMORY[0x270F6B4C0]();
}

uint64_t sub_2265F69E0()
{
  return MEMORY[0x270F6B4C8]();
}

uint64_t sub_2265F69F0()
{
  return MEMORY[0x270F6B4D0]();
}

uint64_t sub_2265F6A00()
{
  return MEMORY[0x270F6B4D8]();
}

uint64_t sub_2265F6A10()
{
  return MEMORY[0x270F6B4E0]();
}

uint64_t sub_2265F6A20()
{
  return MEMORY[0x270F6B4E8]();
}

uint64_t sub_2265F6A30()
{
  return MEMORY[0x270F6B4F0]();
}

uint64_t sub_2265F6A40()
{
  return MEMORY[0x270F6B4F8]();
}

uint64_t sub_2265F6A50()
{
  return MEMORY[0x270F6B500]();
}

uint64_t sub_2265F6A60()
{
  return MEMORY[0x270F6B508]();
}

uint64_t sub_2265F6A70()
{
  return MEMORY[0x270F6B510]();
}

uint64_t sub_2265F6A80()
{
  return MEMORY[0x270F6B518]();
}

uint64_t sub_2265F6A90()
{
  return MEMORY[0x270F6B520]();
}

uint64_t sub_2265F6AA0()
{
  return MEMORY[0x270F6B528]();
}

uint64_t sub_2265F6AB0()
{
  return MEMORY[0x270F6B530]();
}

uint64_t sub_2265F6AC0()
{
  return MEMORY[0x270F6B538]();
}

uint64_t sub_2265F6AD0()
{
  return MEMORY[0x270F6B540]();
}

uint64_t sub_2265F6AE0()
{
  return MEMORY[0x270F6B548]();
}

uint64_t sub_2265F6AF0()
{
  return MEMORY[0x270F6B550]();
}

uint64_t sub_2265F6B00()
{
  return MEMORY[0x270F6B558]();
}

uint64_t sub_2265F6B20()
{
  return MEMORY[0x270F6B568]();
}

uint64_t sub_2265F6B30()
{
  return MEMORY[0x270F6B570]();
}

uint64_t sub_2265F6B40()
{
  return MEMORY[0x270F6B578]();
}

uint64_t sub_2265F6B50()
{
  return MEMORY[0x270F6B580]();
}

uint64_t sub_2265F6B60()
{
  return MEMORY[0x270F6B588]();
}

uint64_t sub_2265F6B70()
{
  return MEMORY[0x270F6B590]();
}

uint64_t sub_2265F6B80()
{
  return MEMORY[0x270F6B598]();
}

uint64_t sub_2265F6B90()
{
  return MEMORY[0x270F6B5A0]();
}

uint64_t sub_2265F6BA0()
{
  return MEMORY[0x270F6B5A8]();
}

uint64_t sub_2265F6BB0()
{
  return MEMORY[0x270F6B5B0]();
}

uint64_t sub_2265F6BC0()
{
  return MEMORY[0x270F6B5B8]();
}

uint64_t sub_2265F6BD0()
{
  return MEMORY[0x270F6B5C0]();
}

uint64_t sub_2265F6BE0()
{
  return MEMORY[0x270F6B5C8]();
}

uint64_t sub_2265F6BF0()
{
  return MEMORY[0x270F6B5D0]();
}

uint64_t sub_2265F6C00()
{
  return MEMORY[0x270F6B5D8]();
}

uint64_t sub_2265F6C10()
{
  return MEMORY[0x270F6B5E0]();
}

uint64_t sub_2265F6C20()
{
  return MEMORY[0x270F6B5E8]();
}

uint64_t sub_2265F6C30()
{
  return MEMORY[0x270F6B5F0]();
}

uint64_t sub_2265F6C40()
{
  return MEMORY[0x270F6B5F8]();
}

uint64_t sub_2265F6C50()
{
  return MEMORY[0x270F6B600]();
}

uint64_t sub_2265F6C60()
{
  return MEMORY[0x270F6B608]();
}

uint64_t sub_2265F6C70()
{
  return MEMORY[0x270F6B610]();
}

uint64_t sub_2265F6C80()
{
  return MEMORY[0x270F6B618]();
}

uint64_t sub_2265F6C90()
{
  return MEMORY[0x270F6B620]();
}

uint64_t sub_2265F6CA0()
{
  return MEMORY[0x270F6B628]();
}

uint64_t sub_2265F6CB0()
{
  return MEMORY[0x270F6B630]();
}

uint64_t sub_2265F6CC0()
{
  return MEMORY[0x270F6B638]();
}

uint64_t sub_2265F6CD0()
{
  return MEMORY[0x270F6B640]();
}

uint64_t sub_2265F6CE0()
{
  return MEMORY[0x270F6B648]();
}

uint64_t sub_2265F6CF0()
{
  return MEMORY[0x270F6B650]();
}

uint64_t sub_2265F6D00()
{
  return MEMORY[0x270F6B658]();
}

uint64_t sub_2265F6D10()
{
  return MEMORY[0x270F6B660]();
}

uint64_t sub_2265F6D20()
{
  return MEMORY[0x270F6B668]();
}

uint64_t sub_2265F6D30()
{
  return MEMORY[0x270F6B670]();
}

uint64_t sub_2265F6D40()
{
  return MEMORY[0x270F6B678]();
}

uint64_t sub_2265F6D50()
{
  return MEMORY[0x270F6B680]();
}

uint64_t sub_2265F6D60()
{
  return MEMORY[0x270F6B688]();
}

uint64_t sub_2265F6D70()
{
  return MEMORY[0x270F6B690]();
}

uint64_t sub_2265F6D80()
{
  return MEMORY[0x270F6B698]();
}

uint64_t sub_2265F6D90()
{
  return MEMORY[0x270F6B6A0]();
}

uint64_t sub_2265F6DA0()
{
  return MEMORY[0x270F6B6A8]();
}

uint64_t sub_2265F6DB0()
{
  return MEMORY[0x270F6B6B0]();
}

uint64_t sub_2265F6DC0()
{
  return MEMORY[0x270F6B6B8]();
}

uint64_t sub_2265F6DD0()
{
  return MEMORY[0x270F6B6C0]();
}

uint64_t sub_2265F6DE0()
{
  return MEMORY[0x270F6B6C8]();
}

uint64_t sub_2265F6DF0()
{
  return MEMORY[0x270F6B6D0]();
}

uint64_t sub_2265F6E00()
{
  return MEMORY[0x270F6B6D8]();
}

uint64_t sub_2265F6E10()
{
  return MEMORY[0x270F6B6E0]();
}

uint64_t sub_2265F6E20()
{
  return MEMORY[0x270F6B6E8]();
}

uint64_t sub_2265F6E30()
{
  return MEMORY[0x270F6B6F0]();
}

uint64_t sub_2265F6E40()
{
  return MEMORY[0x270F6B6F8]();
}

uint64_t sub_2265F6E60()
{
  return MEMORY[0x270F6B708]();
}

uint64_t sub_2265F6E70()
{
  return MEMORY[0x270F6B710]();
}

uint64_t sub_2265F6E80()
{
  return MEMORY[0x270F6B718]();
}

uint64_t sub_2265F6E90()
{
  return MEMORY[0x270F6B720]();
}

uint64_t sub_2265F6EA0()
{
  return MEMORY[0x270F6B728]();
}

uint64_t sub_2265F6EB0()
{
  return MEMORY[0x270F6B730]();
}

uint64_t sub_2265F6EC0()
{
  return MEMORY[0x270F6B738]();
}

uint64_t sub_2265F6EE0()
{
  return MEMORY[0x270F6B748]();
}

uint64_t sub_2265F6EF0()
{
  return MEMORY[0x270F6B750]();
}

uint64_t sub_2265F6F00()
{
  return MEMORY[0x270F6B758]();
}

uint64_t sub_2265F6F10()
{
  return MEMORY[0x270F6B760]();
}

uint64_t sub_2265F6F20()
{
  return MEMORY[0x270F6B768]();
}

uint64_t sub_2265F6F40()
{
  return MEMORY[0x270F6B778]();
}

uint64_t sub_2265F6F50()
{
  return MEMORY[0x270F6B780]();
}

uint64_t sub_2265F6F60()
{
  return MEMORY[0x270F6B788]();
}

uint64_t sub_2265F6F70()
{
  return MEMORY[0x270F6B790]();
}

uint64_t sub_2265F6F80()
{
  return MEMORY[0x270F6B798]();
}

uint64_t sub_2265F6F90()
{
  return MEMORY[0x270F6B7A0]();
}

uint64_t sub_2265F6FA0()
{
  return MEMORY[0x270F6B7A8]();
}

uint64_t sub_2265F6FC0()
{
  return MEMORY[0x270F6B7B8]();
}

uint64_t sub_2265F6FD0()
{
  return MEMORY[0x270F6B7C0]();
}

uint64_t sub_2265F6FE0()
{
  return MEMORY[0x270F6B7C8]();
}

uint64_t sub_2265F6FF0()
{
  return MEMORY[0x270F6B7D0]();
}

uint64_t sub_2265F7000()
{
  return MEMORY[0x270F6B7D8]();
}

uint64_t sub_2265F7010()
{
  return MEMORY[0x270F6B7E0]();
}

uint64_t sub_2265F7020()
{
  return MEMORY[0x270F6B7E8]();
}

uint64_t sub_2265F7030()
{
  return MEMORY[0x270F6B7F0]();
}

uint64_t sub_2265F7040()
{
  return MEMORY[0x270F6B7F8]();
}

uint64_t sub_2265F7050()
{
  return MEMORY[0x270F6B800]();
}

uint64_t sub_2265F7060()
{
  return MEMORY[0x270F6B808]();
}

uint64_t sub_2265F7070()
{
  return MEMORY[0x270F6B810]();
}

uint64_t sub_2265F7080()
{
  return MEMORY[0x270F6B818]();
}

uint64_t sub_2265F7090()
{
  return MEMORY[0x270F6B820]();
}

uint64_t sub_2265F70A0()
{
  return MEMORY[0x270F6B828]();
}

uint64_t sub_2265F70B0()
{
  return MEMORY[0x270F6B830]();
}

uint64_t sub_2265F70C0()
{
  return MEMORY[0x270F6B838]();
}

uint64_t sub_2265F70D0()
{
  return MEMORY[0x270F6B840]();
}

uint64_t sub_2265F70E0()
{
  return MEMORY[0x270F6B848]();
}

uint64_t sub_2265F70F0()
{
  return MEMORY[0x270F6B850]();
}

uint64_t sub_2265F7100()
{
  return MEMORY[0x270F6B858]();
}

uint64_t sub_2265F7110()
{
  return MEMORY[0x270F6B860]();
}

uint64_t sub_2265F7120()
{
  return MEMORY[0x270F6B868]();
}

uint64_t sub_2265F7130()
{
  return MEMORY[0x270F6B870]();
}

uint64_t sub_2265F7140()
{
  return MEMORY[0x270F6B878]();
}

uint64_t sub_2265F7150()
{
  return MEMORY[0x270F6B880]();
}

uint64_t sub_2265F7160()
{
  return MEMORY[0x270F6B888]();
}

uint64_t sub_2265F7170()
{
  return MEMORY[0x270F6B890]();
}

uint64_t sub_2265F7180()
{
  return MEMORY[0x270F6B898]();
}

uint64_t sub_2265F7190()
{
  return MEMORY[0x270F6B8A0]();
}

uint64_t sub_2265F71A0()
{
  return MEMORY[0x270F6B8A8]();
}

uint64_t sub_2265F71B0()
{
  return MEMORY[0x270F6B8B0]();
}

uint64_t sub_2265F71C0()
{
  return MEMORY[0x270F6B8B8]();
}

uint64_t sub_2265F71D0()
{
  return MEMORY[0x270F6B8C0]();
}

uint64_t sub_2265F71E0()
{
  return MEMORY[0x270F6B8C8]();
}

uint64_t sub_2265F71F0()
{
  return MEMORY[0x270F6B8D0]();
}

uint64_t sub_2265F7200()
{
  return MEMORY[0x270F6B8D8]();
}

uint64_t sub_2265F7210()
{
  return MEMORY[0x270F6B8E0]();
}

uint64_t sub_2265F7220()
{
  return MEMORY[0x270F6B8E8]();
}

uint64_t sub_2265F7230()
{
  return MEMORY[0x270F6B8F0]();
}

uint64_t sub_2265F7240()
{
  return MEMORY[0x270F6B8F8]();
}

uint64_t sub_2265F7250()
{
  return MEMORY[0x270F6B900]();
}

uint64_t sub_2265F7260()
{
  return MEMORY[0x270F6B908]();
}

uint64_t sub_2265F7270()
{
  return MEMORY[0x270F6B910]();
}

uint64_t sub_2265F7280()
{
  return MEMORY[0x270F6B918]();
}

uint64_t sub_2265F7290()
{
  return MEMORY[0x270F6B920]();
}

uint64_t sub_2265F72A0()
{
  return MEMORY[0x270F6B928]();
}

uint64_t sub_2265F72B0()
{
  return MEMORY[0x270F6B930]();
}

uint64_t sub_2265F72C0()
{
  return MEMORY[0x270F6B938]();
}

uint64_t sub_2265F72D0()
{
  return MEMORY[0x270F6B980]();
}

uint64_t sub_2265F72E0()
{
  return MEMORY[0x270F6B988]();
}

uint64_t sub_2265F72F0()
{
  return MEMORY[0x270F6B990]();
}

uint64_t sub_2265F7300()
{
  return MEMORY[0x270F6B998]();
}

uint64_t sub_2265F7310()
{
  return MEMORY[0x270F6B9A0]();
}

uint64_t sub_2265F7320()
{
  return MEMORY[0x270F6B9A8]();
}

uint64_t sub_2265F7330()
{
  return MEMORY[0x270F6B9B0]();
}

uint64_t sub_2265F7340()
{
  return MEMORY[0x270F6B9B8]();
}

uint64_t sub_2265F7350()
{
  return MEMORY[0x270F6B9C0]();
}

uint64_t sub_2265F7360()
{
  return MEMORY[0x270F6B9C8]();
}

uint64_t sub_2265F7370()
{
  return MEMORY[0x270F6B9D0]();
}

uint64_t sub_2265F7380()
{
  return MEMORY[0x270F6B9D8]();
}

uint64_t sub_2265F7390()
{
  return MEMORY[0x270F6B9E0]();
}

uint64_t sub_2265F73A0()
{
  return MEMORY[0x270F6B9E8]();
}

uint64_t sub_2265F73B0()
{
  return MEMORY[0x270F6B9F0]();
}

uint64_t sub_2265F73C0()
{
  return MEMORY[0x270F6BA00]();
}

uint64_t sub_2265F73D0()
{
  return MEMORY[0x270F6BA08]();
}

uint64_t sub_2265F73E0()
{
  return MEMORY[0x270F6BA10]();
}

uint64_t sub_2265F73F0()
{
  return MEMORY[0x270F6BA18]();
}

uint64_t sub_2265F7400()
{
  return MEMORY[0x270F6BA20]();
}

uint64_t sub_2265F7410()
{
  return MEMORY[0x270F6BA28]();
}

uint64_t sub_2265F7420()
{
  return MEMORY[0x270F6BA30]();
}

uint64_t sub_2265F7430()
{
  return MEMORY[0x270F6BA38]();
}

uint64_t sub_2265F7440()
{
  return MEMORY[0x270F6BA40]();
}

uint64_t sub_2265F7450()
{
  return MEMORY[0x270F6BA48]();
}

uint64_t sub_2265F7460()
{
  return MEMORY[0x270F6BA50]();
}

uint64_t sub_2265F7470()
{
  return MEMORY[0x270F6BA58]();
}

uint64_t sub_2265F7480()
{
  return MEMORY[0x270F6BA60]();
}

uint64_t sub_2265F7490()
{
  return MEMORY[0x270F6BA68]();
}

uint64_t sub_2265F74A0()
{
  return MEMORY[0x270F6BA70]();
}

uint64_t sub_2265F74B0()
{
  return MEMORY[0x270F6BA78]();
}

uint64_t sub_2265F74C0()
{
  return MEMORY[0x270F6BA80]();
}

uint64_t sub_2265F74D0()
{
  return MEMORY[0x270F6BA88]();
}

uint64_t sub_2265F74E0()
{
  return MEMORY[0x270F6BA90]();
}

uint64_t sub_2265F74F0()
{
  return MEMORY[0x270F6BA98]();
}

uint64_t sub_2265F7500()
{
  return MEMORY[0x270F6BAA0]();
}

uint64_t sub_2265F7510()
{
  return MEMORY[0x270F6BAA8]();
}

uint64_t sub_2265F7520()
{
  return MEMORY[0x270F6BAB0]();
}

uint64_t sub_2265F7530()
{
  return MEMORY[0x270F6BAB8]();
}

uint64_t sub_2265F7540()
{
  return MEMORY[0x270F6BAC0]();
}

uint64_t sub_2265F7550()
{
  return MEMORY[0x270F6BAC8]();
}

uint64_t sub_2265F7560()
{
  return MEMORY[0x270F6BAD0]();
}

uint64_t sub_2265F7570()
{
  return MEMORY[0x270F6BAD8]();
}

uint64_t sub_2265F7580()
{
  return MEMORY[0x270F6BAE0]();
}

uint64_t sub_2265F7590()
{
  return MEMORY[0x270F6BAE8]();
}

uint64_t sub_2265F75A0()
{
  return MEMORY[0x270F6BAF0]();
}

uint64_t sub_2265F75B0()
{
  return MEMORY[0x270F6BAF8]();
}

uint64_t sub_2265F75C0()
{
  return MEMORY[0x270F6BB00]();
}

uint64_t sub_2265F75D0()
{
  return MEMORY[0x270F6BB10]();
}

uint64_t sub_2265F75E0()
{
  return MEMORY[0x270F6BB28]();
}

uint64_t sub_2265F75F0()
{
  return MEMORY[0x270F6BB30]();
}

uint64_t sub_2265F7600()
{
  return MEMORY[0x270F6BB38]();
}

uint64_t sub_2265F7610()
{
  return MEMORY[0x270F6BFC0]();
}

uint64_t sub_2265F7620()
{
  return MEMORY[0x270F6C1A0]();
}

uint64_t sub_2265F7630()
{
  return MEMORY[0x270F6C1A8]();
}

uint64_t sub_2265F7640()
{
  return MEMORY[0x270F6C1B0]();
}

uint64_t sub_2265F7650()
{
  return MEMORY[0x270F6C1B8]();
}

uint64_t sub_2265F7660()
{
  return MEMORY[0x270F6C1C0]();
}

uint64_t sub_2265F7670()
{
  return MEMORY[0x270F6C1C8]();
}

uint64_t sub_2265F7680()
{
  return MEMORY[0x270F6C1D0]();
}

uint64_t sub_2265F7690()
{
  return MEMORY[0x270F6C1D8]();
}

uint64_t sub_2265F76A0()
{
  return MEMORY[0x270F6C1E0]();
}

uint64_t sub_2265F76B0()
{
  return MEMORY[0x270F6C1E8]();
}

uint64_t sub_2265F76C0()
{
  return MEMORY[0x270F6C1F0]();
}

uint64_t sub_2265F76D0()
{
  return MEMORY[0x270F6C1F8]();
}

uint64_t sub_2265F76E0()
{
  return MEMORY[0x270F6C200]();
}

uint64_t sub_2265F76F0()
{
  return MEMORY[0x270F6C208]();
}

uint64_t sub_2265F7700()
{
  return MEMORY[0x270F6C210]();
}

uint64_t sub_2265F7710()
{
  return MEMORY[0x270F6C218]();
}

uint64_t sub_2265F7720()
{
  return MEMORY[0x270F6C220]();
}

uint64_t sub_2265F7730()
{
  return MEMORY[0x270F6C228]();
}

uint64_t sub_2265F7740()
{
  return MEMORY[0x270F6C230]();
}

uint64_t sub_2265F7750()
{
  return MEMORY[0x270F6C238]();
}

uint64_t sub_2265F7760()
{
  return MEMORY[0x270F6C240]();
}

uint64_t sub_2265F7770()
{
  return MEMORY[0x270F6C248]();
}

uint64_t sub_2265F7780()
{
  return MEMORY[0x270F6C250]();
}

uint64_t sub_2265F7790()
{
  return MEMORY[0x270F6C258]();
}

uint64_t sub_2265F77A0()
{
  return MEMORY[0x270F6C260]();
}

uint64_t sub_2265F77B0()
{
  return MEMORY[0x270F6C268]();
}

uint64_t sub_2265F77C0()
{
  return MEMORY[0x270F6C270]();
}

uint64_t sub_2265F77D0()
{
  return MEMORY[0x270F6C278]();
}

uint64_t sub_2265F77E0()
{
  return MEMORY[0x270F6C280]();
}

uint64_t sub_2265F77F0()
{
  return MEMORY[0x270F6C288]();
}

uint64_t sub_2265F7800()
{
  return MEMORY[0x270F6C290]();
}

uint64_t sub_2265F7810()
{
  return MEMORY[0x270F6C298]();
}

uint64_t sub_2265F7820()
{
  return MEMORY[0x270F6C2A0]();
}

uint64_t sub_2265F7830()
{
  return MEMORY[0x270F6C2A8]();
}

uint64_t sub_2265F7840()
{
  return MEMORY[0x270F6C2B0]();
}

uint64_t sub_2265F7850()
{
  return MEMORY[0x270F6C2B8]();
}

uint64_t sub_2265F7860()
{
  return MEMORY[0x270F6C2C0]();
}

uint64_t sub_2265F7870()
{
  return MEMORY[0x270F6C2C8]();
}

uint64_t sub_2265F7880()
{
  return MEMORY[0x270F6C2D0]();
}

uint64_t sub_2265F7890()
{
  return MEMORY[0x270F6C2D8]();
}

uint64_t sub_2265F78A0()
{
  return MEMORY[0x270F6C2E0]();
}

uint64_t sub_2265F78B0()
{
  return MEMORY[0x270F6C2E8]();
}

uint64_t sub_2265F78C0()
{
  return MEMORY[0x270F6C2F0]();
}

uint64_t sub_2265F78D0()
{
  return MEMORY[0x270F6C2F8]();
}

uint64_t sub_2265F78E0()
{
  return MEMORY[0x270F6C300]();
}

uint64_t sub_2265F78F0()
{
  return MEMORY[0x270F6C308]();
}

uint64_t sub_2265F7900()
{
  return MEMORY[0x270F6C310]();
}

uint64_t sub_2265F7910()
{
  return MEMORY[0x270F6C318]();
}

uint64_t sub_2265F7920()
{
  return MEMORY[0x270F6C320]();
}

uint64_t sub_2265F7930()
{
  return MEMORY[0x270F6C328]();
}

uint64_t sub_2265F7940()
{
  return MEMORY[0x270F6C330]();
}

uint64_t sub_2265F7950()
{
  return MEMORY[0x270F6C338]();
}

uint64_t sub_2265F7960()
{
  return MEMORY[0x270F6C340]();
}

uint64_t sub_2265F7970()
{
  return MEMORY[0x270F6C348]();
}

uint64_t sub_2265F7980()
{
  return MEMORY[0x270F6C350]();
}

uint64_t sub_2265F7990()
{
  return MEMORY[0x270F6C358]();
}

uint64_t sub_2265F79A0()
{
  return MEMORY[0x270F6C360]();
}

uint64_t sub_2265F79B0()
{
  return MEMORY[0x270F6C368]();
}

uint64_t sub_2265F79C0()
{
  return MEMORY[0x270F6C370]();
}

uint64_t sub_2265F79D0()
{
  return MEMORY[0x270F6C378]();
}

uint64_t sub_2265F79E0()
{
  return MEMORY[0x270F6C380]();
}

uint64_t sub_2265F79F0()
{
  return MEMORY[0x270F6C388]();
}

uint64_t sub_2265F7A00()
{
  return MEMORY[0x270F6C390]();
}

uint64_t sub_2265F7A10()
{
  return MEMORY[0x270F6C398]();
}

uint64_t sub_2265F7A20()
{
  return MEMORY[0x270F6C3A0]();
}

uint64_t sub_2265F7A30()
{
  return MEMORY[0x270F6C3A8]();
}

uint64_t sub_2265F7A40()
{
  return MEMORY[0x270F6C3B0]();
}

uint64_t sub_2265F7A50()
{
  return MEMORY[0x270F6C3B8]();
}

uint64_t sub_2265F7A60()
{
  return MEMORY[0x270F6C3C0]();
}

uint64_t sub_2265F7A70()
{
  return MEMORY[0x270F6C3C8]();
}

uint64_t sub_2265F7A80()
{
  return MEMORY[0x270F6C3D0]();
}

uint64_t sub_2265F7A90()
{
  return MEMORY[0x270F6C3D8]();
}

uint64_t sub_2265F7AA0()
{
  return MEMORY[0x270F6C3E0]();
}

uint64_t sub_2265F7AB0()
{
  return MEMORY[0x270F6C3E8]();
}

uint64_t sub_2265F7AC0()
{
  return MEMORY[0x270F6C3F0]();
}

uint64_t sub_2265F7AD0()
{
  return MEMORY[0x270F6C3F8]();
}

uint64_t sub_2265F7AE0()
{
  return MEMORY[0x270F6C400]();
}

uint64_t sub_2265F7AF0()
{
  return MEMORY[0x270F6C408]();
}

uint64_t sub_2265F7B00()
{
  return MEMORY[0x270F6C410]();
}

uint64_t sub_2265F7B10()
{
  return MEMORY[0x270F6C418]();
}

uint64_t sub_2265F7B20()
{
  return MEMORY[0x270F6C420]();
}

uint64_t sub_2265F7B30()
{
  return MEMORY[0x270F6C428]();
}

uint64_t sub_2265F7B40()
{
  return MEMORY[0x270F6C430]();
}

uint64_t sub_2265F7B50()
{
  return MEMORY[0x270F6C438]();
}

uint64_t sub_2265F7B60()
{
  return MEMORY[0x270F6C440]();
}

uint64_t sub_2265F7B70()
{
  return MEMORY[0x270F6C448]();
}

uint64_t sub_2265F7B80()
{
  return MEMORY[0x270F6C450]();
}

uint64_t sub_2265F7B90()
{
  return MEMORY[0x270F6C458]();
}

uint64_t sub_2265F7BA0()
{
  return MEMORY[0x270F6C460]();
}

uint64_t sub_2265F7BB0()
{
  return MEMORY[0x270F6C468]();
}

uint64_t sub_2265F7BC0()
{
  return MEMORY[0x270F6C470]();
}

uint64_t sub_2265F7BD0()
{
  return MEMORY[0x270F6C478]();
}

uint64_t sub_2265F7BE0()
{
  return MEMORY[0x270F6C480]();
}

uint64_t sub_2265F7BF0()
{
  return MEMORY[0x270F6C488]();
}

uint64_t sub_2265F7C00()
{
  return MEMORY[0x270F6C490]();
}

uint64_t sub_2265F7C10()
{
  return MEMORY[0x270F6C498]();
}

uint64_t sub_2265F7C20()
{
  return MEMORY[0x270F6C4A0]();
}

uint64_t sub_2265F7C30()
{
  return MEMORY[0x270F6C4A8]();
}

uint64_t sub_2265F7C40()
{
  return MEMORY[0x270F6C4B0]();
}

uint64_t sub_2265F7C50()
{
  return MEMORY[0x270F6C4B8]();
}

uint64_t sub_2265F7C60()
{
  return MEMORY[0x270F6C4C0]();
}

uint64_t sub_2265F7C70()
{
  return MEMORY[0x270F6C4C8]();
}

uint64_t sub_2265F7C80()
{
  return MEMORY[0x270F6C4D0]();
}

uint64_t sub_2265F7C90()
{
  return MEMORY[0x270F6C4D8]();
}

uint64_t sub_2265F7CA0()
{
  return MEMORY[0x270F6C4E0]();
}

uint64_t sub_2265F7CB0()
{
  return MEMORY[0x270F6C4E8]();
}

uint64_t sub_2265F7CC0()
{
  return MEMORY[0x270F6C4F0]();
}

uint64_t sub_2265F7CD0()
{
  return MEMORY[0x270F6C4F8]();
}

uint64_t sub_2265F7CE0()
{
  return MEMORY[0x270F6C500]();
}

uint64_t sub_2265F7CF0()
{
  return MEMORY[0x270F6C508]();
}

uint64_t sub_2265F7D00()
{
  return MEMORY[0x270F6C510]();
}

uint64_t sub_2265F7D10()
{
  return MEMORY[0x270F6C518]();
}

uint64_t sub_2265F7D20()
{
  return MEMORY[0x270F6C520]();
}

uint64_t sub_2265F7D30()
{
  return MEMORY[0x270F6C528]();
}

uint64_t sub_2265F7D40()
{
  return MEMORY[0x270F6C530]();
}

uint64_t sub_2265F7D50()
{
  return MEMORY[0x270F6C538]();
}

uint64_t sub_2265F7D60()
{
  return MEMORY[0x270F6C540]();
}

uint64_t sub_2265F7D70()
{
  return MEMORY[0x270F6C548]();
}

uint64_t sub_2265F7D80()
{
  return MEMORY[0x270F6C550]();
}

uint64_t sub_2265F7D90()
{
  return MEMORY[0x270F6C558]();
}

uint64_t sub_2265F7DA0()
{
  return MEMORY[0x270F6C560]();
}

uint64_t sub_2265F7DB0()
{
  return MEMORY[0x270F6C568]();
}

uint64_t sub_2265F7DC0()
{
  return MEMORY[0x270F6C570]();
}

uint64_t sub_2265F7DD0()
{
  return MEMORY[0x270F6C578]();
}

uint64_t sub_2265F7DE0()
{
  return MEMORY[0x270F6C580]();
}

uint64_t sub_2265F7DF0()
{
  return MEMORY[0x270F6C588]();
}

uint64_t sub_2265F7E00()
{
  return MEMORY[0x270F6C590]();
}

uint64_t sub_2265F7E10()
{
  return MEMORY[0x270F6C598]();
}

uint64_t sub_2265F7E20()
{
  return MEMORY[0x270F6C5A0]();
}

uint64_t sub_2265F7E30()
{
  return MEMORY[0x270F6C5A8]();
}

uint64_t sub_2265F7E40()
{
  return MEMORY[0x270F6C5B0]();
}

uint64_t sub_2265F7E50()
{
  return MEMORY[0x270F6C5B8]();
}

uint64_t sub_2265F7E60()
{
  return MEMORY[0x270F6C5C0]();
}

uint64_t sub_2265F7E70()
{
  return MEMORY[0x270F6C5C8]();
}

uint64_t sub_2265F7E80()
{
  return MEMORY[0x270F6C5D0]();
}

uint64_t sub_2265F7E90()
{
  return MEMORY[0x270F6C5D8]();
}

uint64_t sub_2265F7EA0()
{
  return MEMORY[0x270F6C5E0]();
}

uint64_t sub_2265F7EB0()
{
  return MEMORY[0x270F6C5E8]();
}

uint64_t sub_2265F7EC0()
{
  return MEMORY[0x270F6C5F0]();
}

uint64_t sub_2265F7ED0()
{
  return MEMORY[0x270F6C5F8]();
}

uint64_t sub_2265F7EE0()
{
  return MEMORY[0x270F6C600]();
}

uint64_t sub_2265F7EF0()
{
  return MEMORY[0x270F6C608]();
}

uint64_t sub_2265F7F00()
{
  return MEMORY[0x270F6C610]();
}

uint64_t sub_2265F7F10()
{
  return MEMORY[0x270F6C618]();
}

uint64_t sub_2265F7F20()
{
  return MEMORY[0x270F6C620]();
}

uint64_t sub_2265F7F30()
{
  return MEMORY[0x270F6C628]();
}

uint64_t sub_2265F7F40()
{
  return MEMORY[0x270F6C630]();
}

uint64_t sub_2265F7F50()
{
  return MEMORY[0x270F6C638]();
}

uint64_t sub_2265F7F60()
{
  return MEMORY[0x270F6C640]();
}

uint64_t sub_2265F7F70()
{
  return MEMORY[0x270F6C648]();
}

uint64_t sub_2265F7F80()
{
  return MEMORY[0x270F6C650]();
}

uint64_t sub_2265F7F90()
{
  return MEMORY[0x270F6C658]();
}

uint64_t sub_2265F7FA0()
{
  return MEMORY[0x270F6C660]();
}

uint64_t sub_2265F7FB0()
{
  return MEMORY[0x270F6C668]();
}

uint64_t sub_2265F7FC0()
{
  return MEMORY[0x270F6C670]();
}

uint64_t sub_2265F7FD0()
{
  return MEMORY[0x270F6C678]();
}

uint64_t sub_2265F7FE0()
{
  return MEMORY[0x270F6C680]();
}

uint64_t sub_2265F7FF0()
{
  return MEMORY[0x270F6C688]();
}

uint64_t sub_2265F8000()
{
  return MEMORY[0x270F6C690]();
}

uint64_t sub_2265F8010()
{
  return MEMORY[0x270F6C698]();
}

uint64_t sub_2265F8020()
{
  return MEMORY[0x270F6C6A0]();
}

uint64_t sub_2265F8030()
{
  return MEMORY[0x270F6C6A8]();
}

uint64_t sub_2265F8040()
{
  return MEMORY[0x270F6C6B0]();
}

uint64_t sub_2265F8050()
{
  return MEMORY[0x270F6C6B8]();
}

uint64_t sub_2265F8060()
{
  return MEMORY[0x270F6C6C0]();
}

uint64_t sub_2265F8070()
{
  return MEMORY[0x270F6C6C8]();
}

uint64_t sub_2265F8080()
{
  return MEMORY[0x270F6C6D0]();
}

uint64_t sub_2265F8090()
{
  return MEMORY[0x270F6C6D8]();
}

uint64_t sub_2265F80A0()
{
  return MEMORY[0x270F6C6E0]();
}

uint64_t sub_2265F80B0()
{
  return MEMORY[0x270F6C6E8]();
}

uint64_t sub_2265F80C0()
{
  return MEMORY[0x270F6C6F0]();
}

uint64_t sub_2265F80D0()
{
  return MEMORY[0x270F6C6F8]();
}

uint64_t sub_2265F80E0()
{
  return MEMORY[0x270F6C700]();
}

uint64_t sub_2265F80F0()
{
  return MEMORY[0x270F6C708]();
}

uint64_t sub_2265F8100()
{
  return MEMORY[0x270F6C710]();
}

uint64_t sub_2265F8110()
{
  return MEMORY[0x270F6C718]();
}

uint64_t sub_2265F8120()
{
  return MEMORY[0x270F6C720]();
}

uint64_t sub_2265F8130()
{
  return MEMORY[0x270F6C728]();
}

uint64_t sub_2265F8140()
{
  return MEMORY[0x270F6C730]();
}

uint64_t sub_2265F8150()
{
  return MEMORY[0x270F6C738]();
}

uint64_t sub_2265F8160()
{
  return MEMORY[0x270F6C740]();
}

uint64_t sub_2265F8170()
{
  return MEMORY[0x270F6C748]();
}

uint64_t sub_2265F8180()
{
  return MEMORY[0x270F6C750]();
}

uint64_t sub_2265F8190()
{
  return MEMORY[0x270F6C758]();
}

uint64_t sub_2265F81A0()
{
  return MEMORY[0x270F6C760]();
}

uint64_t sub_2265F81B0()
{
  return MEMORY[0x270F6C768]();
}

uint64_t sub_2265F81C0()
{
  return MEMORY[0x270F6C770]();
}

uint64_t sub_2265F81D0()
{
  return MEMORY[0x270F6C778]();
}

uint64_t sub_2265F81E0()
{
  return MEMORY[0x270F6C780]();
}

uint64_t sub_2265F81F0()
{
  return MEMORY[0x270F6C788]();
}

uint64_t sub_2265F8200()
{
  return MEMORY[0x270F6C790]();
}

uint64_t sub_2265F8210()
{
  return MEMORY[0x270F6C798]();
}

uint64_t sub_2265F8220()
{
  return MEMORY[0x270F6C7A0]();
}

uint64_t sub_2265F8230()
{
  return MEMORY[0x270F6C7A8]();
}

uint64_t sub_2265F8240()
{
  return MEMORY[0x270F6C7B0]();
}

uint64_t sub_2265F8250()
{
  return MEMORY[0x270F6C7B8]();
}

uint64_t sub_2265F8260()
{
  return MEMORY[0x270F6C7C0]();
}

uint64_t sub_2265F8270()
{
  return MEMORY[0x270F6C7C8]();
}

uint64_t sub_2265F8280()
{
  return MEMORY[0x270F6C7D0]();
}

uint64_t sub_2265F8290()
{
  return MEMORY[0x270F6C7D8]();
}

uint64_t sub_2265F82A0()
{
  return MEMORY[0x270F6C7E0]();
}

uint64_t sub_2265F82B0()
{
  return MEMORY[0x270F6C810]();
}

uint64_t sub_2265F82C0()
{
  return MEMORY[0x270F6C818]();
}

uint64_t sub_2265F82D0()
{
  return MEMORY[0x270F6C848]();
}

uint64_t sub_2265F82E0()
{
  return MEMORY[0x270F6C8B8]();
}

uint64_t sub_2265F82F0()
{
  return MEMORY[0x270F6C8D0]();
}

uint64_t sub_2265F8300()
{
  return MEMORY[0x270F6C8F0]();
}

uint64_t sub_2265F8310()
{
  return MEMORY[0x270F6C908]();
}

uint64_t sub_2265F8320()
{
  return MEMORY[0x270F6C940]();
}

uint64_t sub_2265F8330()
{
  return MEMORY[0x270F6C970]();
}

uint64_t sub_2265F8340()
{
  return MEMORY[0x270F6C9B0]();
}

uint64_t sub_2265F8350()
{
  return MEMORY[0x270F6C9D8]();
}

uint64_t sub_2265F8360()
{
  return MEMORY[0x270F6C9E0]();
}

uint64_t sub_2265F8370()
{
  return MEMORY[0x270F6CCA0]();
}

uint64_t sub_2265F8380()
{
  return MEMORY[0x270F6CCB0]();
}

uint64_t sub_2265F8390()
{
  return MEMORY[0x270F6CD70]();
}

uint64_t sub_2265F83A0()
{
  return MEMORY[0x270F6CDA8]();
}

uint64_t sub_2265F83B0()
{
  return MEMORY[0x270F6CDB8]();
}

uint64_t sub_2265F83C0()
{
  return MEMORY[0x270F6CE20]();
}

uint64_t sub_2265F83D0()
{
  return MEMORY[0x270F6CE28]();
}

uint64_t sub_2265F83E0()
{
  return MEMORY[0x270F6CE50]();
}

uint64_t sub_2265F83F0()
{
  return MEMORY[0x270F6CE58]();
}

uint64_t sub_2265F8400()
{
  return MEMORY[0x270F6D0C8]();
}

uint64_t sub_2265F8410()
{
  return MEMORY[0x270F6D0D8]();
}

uint64_t sub_2265F8420()
{
  return MEMORY[0x270F6D140]();
}

uint64_t sub_2265F8430()
{
  return MEMORY[0x270F6D180]();
}

uint64_t sub_2265F8440()
{
  return MEMORY[0x270F6D200]();
}

uint64_t sub_2265F8450()
{
  return MEMORY[0x270F6D210]();
}

uint64_t sub_2265F8460()
{
  return MEMORY[0x270F6D238]();
}

uint64_t sub_2265F8470()
{
  return MEMORY[0x270F6D2F8]();
}

uint64_t sub_2265F8480()
{
  return MEMORY[0x270F6D368]();
}

uint64_t sub_2265F8490()
{
  return MEMORY[0x270F6D370]();
}

uint64_t sub_2265F84A0()
{
  return MEMORY[0x270F6D3E8]();
}

uint64_t sub_2265F84B0()
{
  return MEMORY[0x270F6D438]();
}

uint64_t sub_2265F84C0()
{
  return MEMORY[0x270F6D490]();
}

uint64_t sub_2265F84D0()
{
  return MEMORY[0x270F6D498]();
}

uint64_t sub_2265F84E0()
{
  return MEMORY[0x270F6D4A8]();
}

uint64_t sub_2265F84F0()
{
  return MEMORY[0x270F6D4B8]();
}

uint64_t sub_2265F8500()
{
  return MEMORY[0x270F6D4F0]();
}

uint64_t sub_2265F8510()
{
  return MEMORY[0x270F6D510]();
}

uint64_t sub_2265F8520()
{
  return MEMORY[0x270F6D560]();
}

uint64_t sub_2265F8530()
{
  return MEMORY[0x270F6D600]();
}

uint64_t sub_2265F8540()
{
  return MEMORY[0x270F6D608]();
}

uint64_t sub_2265F8550()
{
  return MEMORY[0x270F6D610]();
}

uint64_t sub_2265F8560()
{
  return MEMORY[0x270F6D618]();
}

uint64_t sub_2265F8570()
{
  return MEMORY[0x270F6D620]();
}

uint64_t sub_2265F8580()
{
  return MEMORY[0x270F6D640]();
}

uint64_t sub_2265F8590()
{
  return MEMORY[0x270F6D650]();
}

uint64_t sub_2265F85A0()
{
  return MEMORY[0x270F6D658]();
}

uint64_t sub_2265F85B0()
{
  return MEMORY[0x270F6D668]();
}

uint64_t sub_2265F85C0()
{
  return MEMORY[0x270F6D670]();
}

uint64_t sub_2265F85D0()
{
  return MEMORY[0x270F6D678]();
}

uint64_t sub_2265F85E0()
{
  return MEMORY[0x270F6D758]();
}

uint64_t sub_2265F85F0()
{
  return MEMORY[0x270F6D760]();
}

uint64_t sub_2265F8600()
{
  return MEMORY[0x270F6D780]();
}

uint64_t sub_2265F8610()
{
  return MEMORY[0x270F6D788]();
}

uint64_t sub_2265F8620()
{
  return MEMORY[0x270F6D7F0]();
}

uint64_t sub_2265F8630()
{
  return MEMORY[0x270F6D810]();
}

uint64_t sub_2265F8640()
{
  return MEMORY[0x270F6D818]();
}

uint64_t sub_2265F8650()
{
  return MEMORY[0x270F6D830]();
}

uint64_t sub_2265F8660()
{
  return MEMORY[0x270F6D8F8]();
}

uint64_t sub_2265F8670()
{
  return MEMORY[0x270F6D900]();
}

uint64_t sub_2265F8680()
{
  return MEMORY[0x270F6D950]();
}

uint64_t sub_2265F8690()
{
  return MEMORY[0x270F6D958]();
}

uint64_t sub_2265F86A0()
{
  return MEMORY[0x270F6DA28]();
}

uint64_t sub_2265F86B0()
{
  return MEMORY[0x270F6DA40]();
}

uint64_t sub_2265F86C0()
{
  return MEMORY[0x270F6DA48]();
}

uint64_t sub_2265F86D0()
{
  return MEMORY[0x270F6DA58]();
}

uint64_t sub_2265F86E0()
{
  return MEMORY[0x270F6DAA8]();
}

uint64_t sub_2265F86F0()
{
  return MEMORY[0x270F6DAB0]();
}

uint64_t sub_2265F8700()
{
  return MEMORY[0x270F6DAC0]();
}

uint64_t sub_2265F8710()
{
  return MEMORY[0x270F6DB98]();
}

uint64_t sub_2265F8720()
{
  return MEMORY[0x270F6DBA8]();
}

uint64_t sub_2265F8730()
{
  return MEMORY[0x270F6DBB0]();
}

uint64_t sub_2265F8740()
{
  return MEMORY[0x270F6DC20]();
}

uint64_t sub_2265F8750()
{
  return MEMORY[0x270F6DC30]();
}

uint64_t sub_2265F8760()
{
  return MEMORY[0x270F6DC90]();
}

uint64_t sub_2265F8770()
{
  return MEMORY[0x270F6DCA0]();
}

uint64_t sub_2265F8780()
{
  return MEMORY[0x270F6DCE8]();
}

uint64_t sub_2265F8790()
{
  return MEMORY[0x270F6DCF0]();
}

uint64_t sub_2265F87A0()
{
  return MEMORY[0x270F6DCF8]();
}

uint64_t sub_2265F87B0()
{
  return MEMORY[0x270F6DD00]();
}

uint64_t sub_2265F87C0()
{
  return MEMORY[0x270F6DD10]();
}

uint64_t sub_2265F87D0()
{
  return MEMORY[0x270F6DD48]();
}

uint64_t sub_2265F87E0()
{
  return MEMORY[0x270F6DE68]();
}

uint64_t sub_2265F87F0()
{
  return MEMORY[0x270F6DE78]();
}

uint64_t sub_2265F8800()
{
  return MEMORY[0x270F6DF50]();
}

uint64_t sub_2265F8810()
{
  return MEMORY[0x270F6E150]();
}

uint64_t sub_2265F8820()
{
  return MEMORY[0x270F6E158]();
}

uint64_t sub_2265F8830()
{
  return MEMORY[0x270F6E1C8]();
}

uint64_t sub_2265F8840()
{
  return MEMORY[0x270F6E1D0]();
}

uint64_t sub_2265F8850()
{
  return MEMORY[0x270F6E1D8]();
}

uint64_t sub_2265F8870()
{
  return MEMORY[0x270F6E1F0]();
}

uint64_t sub_2265F8880()
{
  return MEMORY[0x270F6E208]();
}

uint64_t sub_2265F8890()
{
  return MEMORY[0x270F6E368]();
}

uint64_t sub_2265F88A0()
{
  return MEMORY[0x270F6E378]();
}

uint64_t sub_2265F88B0()
{
  return MEMORY[0x270F6E3D0]();
}

uint64_t sub_2265F88C0()
{
  return MEMORY[0x270F6E408]();
}

uint64_t sub_2265F88D0()
{
  return MEMORY[0x270F6E548]();
}

uint64_t sub_2265F88E0()
{
  return MEMORY[0x270F6E568]();
}

uint64_t sub_2265F88F0()
{
  return MEMORY[0x270F6E570]();
}

uint64_t sub_2265F8900()
{
  return MEMORY[0x270F6E700]();
}

uint64_t sub_2265F8910()
{
  return MEMORY[0x270F6E738]();
}

uint64_t sub_2265F8920()
{
  return MEMORY[0x270F6E740]();
}

uint64_t sub_2265F8930()
{
  return MEMORY[0x270F6E9A0]();
}

uint64_t sub_2265F8940()
{
  return MEMORY[0x270F6E9B8]();
}

uint64_t sub_2265F8950()
{
  return MEMORY[0x270F6EB80]();
}

uint64_t sub_2265F8960()
{
  return MEMORY[0x270F6EB88]();
}

uint64_t sub_2265F8970()
{
  return MEMORY[0x270F6EB98]();
}

uint64_t sub_2265F8980()
{
  return MEMORY[0x270F6ECC0]();
}

uint64_t sub_2265F8990()
{
  return MEMORY[0x270F6ECD8]();
}

uint64_t sub_2265F89A0()
{
  return MEMORY[0x270F6F058]();
}

uint64_t sub_2265F89B0()
{
  return MEMORY[0x270F6F158]();
}

uint64_t sub_2265F89C0()
{
  return MEMORY[0x270F6F160]();
}

uint64_t sub_2265F89D0()
{
  return MEMORY[0x270F6F168]();
}

uint64_t sub_2265F89E0()
{
  return MEMORY[0x270F6F170]();
}

uint64_t sub_2265F89F0()
{
  return MEMORY[0x270F6F178]();
}

uint64_t sub_2265F8A00()
{
  return MEMORY[0x270F6F180]();
}

uint64_t sub_2265F8A10()
{
  return MEMORY[0x270F6F188]();
}

uint64_t sub_2265F8A20()
{
  return MEMORY[0x270F6F190]();
}

uint64_t sub_2265F8A30()
{
  return MEMORY[0x270F6F198]();
}

uint64_t sub_2265F8A40()
{
  return MEMORY[0x270F6F1A0]();
}

uint64_t sub_2265F8A50()
{
  return MEMORY[0x270F6F1B0]();
}

uint64_t sub_2265F8A60()
{
  return MEMORY[0x270F6F1C0]();
}

uint64_t sub_2265F8A70()
{
  return MEMORY[0x270F6F1C8]();
}

uint64_t sub_2265F8A90()
{
  return MEMORY[0x270F6F250]();
}

uint64_t sub_2265F8AA0()
{
  return MEMORY[0x270F6F258]();
}

uint64_t sub_2265F8AB0()
{
  return MEMORY[0x270F6F340]();
}

uint64_t sub_2265F8AC0()
{
  return MEMORY[0x270F6F348]();
}

uint64_t sub_2265F8AD0()
{
  return MEMORY[0x270F6F428]();
}

uint64_t sub_2265F8AE0()
{
  return MEMORY[0x270F6F448]();
}

uint64_t sub_2265F8AF0()
{
  return MEMORY[0x270F6F450]();
}

uint64_t sub_2265F8B00()
{
  return MEMORY[0x270F6F458]();
}

uint64_t sub_2265F8B10()
{
  return MEMORY[0x270F6F4A8]();
}

uint64_t sub_2265F8B20()
{
  return MEMORY[0x270F6F4B0]();
}

uint64_t sub_2265F8B30()
{
  return MEMORY[0x270F6F4C8]();
}

uint64_t sub_2265F8B50()
{
  return MEMORY[0x270F72A78]();
}

uint64_t sub_2265F8B60()
{
  return MEMORY[0x270F72C78]();
}

uint64_t sub_2265F8B70()
{
  return MEMORY[0x270F72C88]();
}

uint64_t sub_2265F8B80()
{
  return MEMORY[0x270F72C98]();
}

uint64_t sub_2265F8B90()
{
  return MEMORY[0x270F72CA0]();
}

uint64_t sub_2265F8BA0()
{
  return MEMORY[0x270F72CB0]();
}

uint64_t sub_2265F8BB0()
{
  return MEMORY[0x270F72CB8]();
}

uint64_t sub_2265F8BC0()
{
  return MEMORY[0x270F7EBE8]();
}

uint64_t sub_2265F8BD0()
{
  return MEMORY[0x270F7EBF0]();
}

uint64_t sub_2265F8BE0()
{
  return MEMORY[0x270F7EC08]();
}

uint64_t sub_2265F8BF0()
{
  return MEMORY[0x270F7EC48]();
}

uint64_t sub_2265F8C00()
{
  return MEMORY[0x270F7EC50]();
}

uint64_t sub_2265F8C10()
{
  return MEMORY[0x270F2F838]();
}

uint64_t sub_2265F8C20()
{
  return MEMORY[0x270F7EC78]();
}

uint64_t sub_2265F8C30()
{
  return MEMORY[0x270F7EE60]();
}

uint64_t sub_2265F8C40()
{
  return MEMORY[0x270F7EE70]();
}

uint64_t sub_2265F8C50()
{
  return MEMORY[0x270F7EE90]();
}

uint64_t sub_2265F8C60()
{
  return MEMORY[0x270F7EEB0]();
}

uint64_t sub_2265F8C70()
{
  return MEMORY[0x270F7EEE8]();
}

uint64_t sub_2265F8C90()
{
  return MEMORY[0x270F7EF18]();
}

uint64_t sub_2265F8CA0()
{
  return MEMORY[0x270F7EF90]();
}

uint64_t sub_2265F8CB0()
{
  return MEMORY[0x270F7EFE8]();
}

uint64_t sub_2265F8CC0()
{
  return MEMORY[0x270F7F368]();
}

uint64_t sub_2265F8CD0()
{
  return MEMORY[0x270F7F5E0]();
}

uint64_t sub_2265F8CE0()
{
  return MEMORY[0x270F7F5E8]();
}

uint64_t sub_2265F8D00()
{
  return MEMORY[0x270F7F2C8]();
}

uint64_t sub_2265F8D20()
{
  return MEMORY[0x270F3E318]();
}

uint64_t sub_2265F8D30()
{
  return MEMORY[0x270F3E320]();
}

uint64_t sub_2265F8D40()
{
  return MEMORY[0x270F3E918]();
}

uint64_t sub_2265F8D50()
{
  return MEMORY[0x270F3E920]();
}

uint64_t sub_2265F8D60()
{
  return MEMORY[0x270F68990]();
}

uint64_t sub_2265F8D70()
{
  return MEMORY[0x270F70E30]();
}

uint64_t sub_2265F8D80()
{
  return MEMORY[0x270F689B8]();
}

uint64_t sub_2265F8D90()
{
  return MEMORY[0x270F689C0]();
}

uint64_t sub_2265F8DA0()
{
  return MEMORY[0x270F689D8]();
}

uint64_t sub_2265F8DB0()
{
  return MEMORY[0x270F689E0]();
}

uint64_t sub_2265F8DC0()
{
  return MEMORY[0x270F689E8]();
}

uint64_t sub_2265F8DD0()
{
  return MEMORY[0x270F689F0]();
}

uint64_t sub_2265F8DE0()
{
  return MEMORY[0x270F689F8]();
}

uint64_t sub_2265F8DF0()
{
  return MEMORY[0x270F68A00]();
}

uint64_t sub_2265F8E00()
{
  return MEMORY[0x270F68A08]();
}

uint64_t sub_2265F8E10()
{
  return MEMORY[0x270F68A10]();
}

uint64_t sub_2265F8E20()
{
  return MEMORY[0x270F68A18]();
}

uint64_t sub_2265F8E30()
{
  return MEMORY[0x270F68A20]();
}

uint64_t sub_2265F8E40()
{
  return MEMORY[0x270F68A30]();
}

uint64_t sub_2265F8E50()
{
  return MEMORY[0x270F68A38]();
}

uint64_t sub_2265F8E60()
{
  return MEMORY[0x270F68A40]();
}

uint64_t sub_2265F8E70()
{
  return MEMORY[0x270F68A48]();
}

uint64_t sub_2265F8E80()
{
  return MEMORY[0x270F68A50]();
}

uint64_t sub_2265F8E90()
{
  return MEMORY[0x270F68A58]();
}

uint64_t sub_2265F8EA0()
{
  return MEMORY[0x270F68A60]();
}

uint64_t sub_2265F8EB0()
{
  return MEMORY[0x270F68A68]();
}

uint64_t sub_2265F8EC0()
{
  return MEMORY[0x270F68A70]();
}

uint64_t sub_2265F8ED0()
{
  return MEMORY[0x270F68A78]();
}

uint64_t sub_2265F8EE0()
{
  return MEMORY[0x270F68A80]();
}

uint64_t sub_2265F8EF0()
{
  return MEMORY[0x270F68A88]();
}

uint64_t sub_2265F8F00()
{
  return MEMORY[0x270F68A90]();
}

uint64_t sub_2265F8F10()
{
  return MEMORY[0x270F68A98]();
}

uint64_t sub_2265F8F20()
{
  return MEMORY[0x270F68AB0]();
}

uint64_t sub_2265F8F30()
{
  return MEMORY[0x270F68AE8]();
}

uint64_t sub_2265F8F40()
{
  return MEMORY[0x270F68AF0]();
}

uint64_t sub_2265F8F50()
{
  return MEMORY[0x270F68AF8]();
}

uint64_t sub_2265F8F60()
{
  return MEMORY[0x270F68B00]();
}

uint64_t sub_2265F8F70()
{
  return MEMORY[0x270F68B08]();
}

uint64_t sub_2265F8F80()
{
  return MEMORY[0x270F68BC8]();
}

uint64_t sub_2265F8F90()
{
  return MEMORY[0x270F68C08]();
}

uint64_t sub_2265F8FA0()
{
  return MEMORY[0x270F68C10]();
}

uint64_t sub_2265F8FB0()
{
  return MEMORY[0x270F68C18]();
}

uint64_t sub_2265F8FC0()
{
  return MEMORY[0x270F68C20]();
}

uint64_t sub_2265F8FD0()
{
  return MEMORY[0x270F68C28]();
}

uint64_t sub_2265F8FE0()
{
  return MEMORY[0x270F68C30]();
}

uint64_t sub_2265F8FF0()
{
  return MEMORY[0x270F68C38]();
}

uint64_t sub_2265F9000()
{
  return MEMORY[0x270F68C40]();
}

uint64_t sub_2265F9010()
{
  return MEMORY[0x270F68C48]();
}

uint64_t sub_2265F9020()
{
  return MEMORY[0x270F68C50]();
}

uint64_t sub_2265F9030()
{
  return MEMORY[0x270F68C58]();
}

uint64_t sub_2265F9040()
{
  return MEMORY[0x270F68C60]();
}

uint64_t sub_2265F9050()
{
  return MEMORY[0x270F68C68]();
}

uint64_t sub_2265F9060()
{
  return MEMORY[0x270F68C70]();
}

uint64_t sub_2265F9070()
{
  return MEMORY[0x270F68C78]();
}

uint64_t sub_2265F9080()
{
  return MEMORY[0x270F68C80]();
}

uint64_t sub_2265F9090()
{
  return MEMORY[0x270F68C88]();
}

uint64_t sub_2265F90A0()
{
  return MEMORY[0x270F68C90]();
}

uint64_t sub_2265F90B0()
{
  return MEMORY[0x270F68C98]();
}

uint64_t sub_2265F90C0()
{
  return MEMORY[0x270F68CA0]();
}

uint64_t sub_2265F90D0()
{
  return MEMORY[0x270F68CA8]();
}

uint64_t sub_2265F90E0()
{
  return MEMORY[0x270F68CB0]();
}

uint64_t sub_2265F90F0()
{
  return MEMORY[0x270F68CB8]();
}

uint64_t sub_2265F9100()
{
  return MEMORY[0x270F68CC0]();
}

uint64_t sub_2265F9110()
{
  return MEMORY[0x270F68CC8]();
}

uint64_t sub_2265F9120()
{
  return MEMORY[0x270F68CD0]();
}

uint64_t sub_2265F9130()
{
  return MEMORY[0x270F68CD8]();
}

uint64_t sub_2265F9140()
{
  return MEMORY[0x270F68D28]();
}

uint64_t sub_2265F9150()
{
  return MEMORY[0x270F68D30]();
}

uint64_t sub_2265F9160()
{
  return MEMORY[0x270F68D38]();
}

uint64_t sub_2265F9170()
{
  return MEMORY[0x270F68D40]();
}

uint64_t sub_2265F9180()
{
  return MEMORY[0x270F68D48]();
}

uint64_t sub_2265F9190()
{
  return MEMORY[0x270F68D50]();
}

uint64_t sub_2265F91A0()
{
  return MEMORY[0x270F68D58]();
}

uint64_t sub_2265F91B0()
{
  return MEMORY[0x270F68D60]();
}

uint64_t sub_2265F91C0()
{
  return MEMORY[0x270F68D68]();
}

uint64_t sub_2265F91D0()
{
  return MEMORY[0x270F68D70]();
}

uint64_t sub_2265F91E0()
{
  return MEMORY[0x270F68D78]();
}

uint64_t sub_2265F91F0()
{
  return MEMORY[0x270F68D80]();
}

uint64_t sub_2265F9200()
{
  return MEMORY[0x270F68D88]();
}

uint64_t sub_2265F9210()
{
  return MEMORY[0x270F68D90]();
}

uint64_t sub_2265F9220()
{
  return MEMORY[0x270F68D98]();
}

uint64_t sub_2265F9230()
{
  return MEMORY[0x270F68DA0]();
}

uint64_t sub_2265F9240()
{
  return MEMORY[0x270F68DA8]();
}

uint64_t sub_2265F9250()
{
  return MEMORY[0x270F68DB0]();
}

uint64_t sub_2265F9260()
{
  return MEMORY[0x270F68DB8]();
}

uint64_t sub_2265F9270()
{
  return MEMORY[0x270F68DC0]();
}

uint64_t sub_2265F9280()
{
  return MEMORY[0x270F68DC8]();
}

uint64_t sub_2265F9290()
{
  return MEMORY[0x270F68DD0]();
}

uint64_t sub_2265F92A0()
{
  return MEMORY[0x270F68DD8]();
}

uint64_t sub_2265F92B0()
{
  return MEMORY[0x270F68DE0]();
}

uint64_t sub_2265F92C0()
{
  return MEMORY[0x270F68DE8]();
}

uint64_t sub_2265F92D0()
{
  return MEMORY[0x270F68DF0]();
}

uint64_t sub_2265F92E0()
{
  return MEMORY[0x270F68DF8]();
}

uint64_t sub_2265F92F0()
{
  return MEMORY[0x270F68E00]();
}

uint64_t sub_2265F9300()
{
  return MEMORY[0x270F68E08]();
}

uint64_t sub_2265F9310()
{
  return MEMORY[0x270F68E10]();
}

uint64_t sub_2265F9320()
{
  return MEMORY[0x270F68E18]();
}

uint64_t sub_2265F9330()
{
  return MEMORY[0x270F68E20]();
}

uint64_t sub_2265F9340()
{
  return MEMORY[0x270F68E28]();
}

uint64_t sub_2265F9350()
{
  return MEMORY[0x270F68E30]();
}

uint64_t sub_2265F9360()
{
  return MEMORY[0x270F68E38]();
}

uint64_t sub_2265F9370()
{
  return MEMORY[0x270F68E40]();
}

uint64_t sub_2265F9380()
{
  return MEMORY[0x270F68E48]();
}

uint64_t sub_2265F9390()
{
  return MEMORY[0x270F68E50]();
}

uint64_t sub_2265F93A0()
{
  return MEMORY[0x270F68E58]();
}

uint64_t sub_2265F93B0()
{
  return MEMORY[0x270F68E60]();
}

uint64_t sub_2265F93C0()
{
  return MEMORY[0x270F68E68]();
}

uint64_t sub_2265F93D0()
{
  return MEMORY[0x270F68E70]();
}

uint64_t sub_2265F93E0()
{
  return MEMORY[0x270F68E78]();
}

uint64_t sub_2265F93F0()
{
  return MEMORY[0x270F68E80]();
}

uint64_t sub_2265F9400()
{
  return MEMORY[0x270F68E88]();
}

uint64_t sub_2265F9410()
{
  return MEMORY[0x270F68E90]();
}

uint64_t sub_2265F9420()
{
  return MEMORY[0x270F68E98]();
}

uint64_t sub_2265F9430()
{
  return MEMORY[0x270F68EA0]();
}

uint64_t sub_2265F9440()
{
  return MEMORY[0x270F68EA8]();
}

uint64_t sub_2265F9450()
{
  return MEMORY[0x270F68EB0]();
}

uint64_t sub_2265F9460()
{
  return MEMORY[0x270F68EB8]();
}

uint64_t sub_2265F9470()
{
  return MEMORY[0x270F68EC0]();
}

uint64_t sub_2265F9480()
{
  return MEMORY[0x270F68EC8]();
}

uint64_t sub_2265F9490()
{
  return MEMORY[0x270F68ED0]();
}

uint64_t sub_2265F94A0()
{
  return MEMORY[0x270F68ED8]();
}

uint64_t sub_2265F94B0()
{
  return MEMORY[0x270F68EE0]();
}

uint64_t sub_2265F94C0()
{
  return MEMORY[0x270F68EE8]();
}

uint64_t sub_2265F94D0()
{
  return MEMORY[0x270F68EF0]();
}

uint64_t sub_2265F94E0()
{
  return MEMORY[0x270F68EF8]();
}

uint64_t sub_2265F94F0()
{
  return MEMORY[0x270F68F00]();
}

uint64_t sub_2265F9500()
{
  return MEMORY[0x270F68F08]();
}

uint64_t sub_2265F9510()
{
  return MEMORY[0x270F68F10]();
}

uint64_t sub_2265F9520()
{
  return MEMORY[0x270F68F18]();
}

uint64_t sub_2265F9530()
{
  return MEMORY[0x270F68F20]();
}

uint64_t sub_2265F9540()
{
  return MEMORY[0x270F68F68]();
}

uint64_t sub_2265F9550()
{
  return MEMORY[0x270F68FB0]();
}

uint64_t sub_2265F9560()
{
  return MEMORY[0x270F68FD0]();
}

uint64_t sub_2265F9570()
{
  return MEMORY[0x270F68FD8]();
}

uint64_t sub_2265F9580()
{
  return MEMORY[0x270F68FE0]();
}

uint64_t sub_2265F9590()
{
  return MEMORY[0x270F69030]();
}

uint64_t sub_2265F95A0()
{
  return MEMORY[0x270F69080]();
}

uint64_t sub_2265F95B0()
{
  return MEMORY[0x270F69120]();
}

uint64_t sub_2265F95C0()
{
  return MEMORY[0x270F69168]();
}

uint64_t sub_2265F95D0()
{
  return MEMORY[0x270F69170]();
}

uint64_t sub_2265F95E0()
{
  return MEMORY[0x270F69178]();
}

uint64_t sub_2265F95F0()
{
  return MEMORY[0x270F691C8]();
}

uint64_t sub_2265F9600()
{
  return MEMORY[0x270F691D0]();
}

uint64_t sub_2265F9610()
{
  return MEMORY[0x270F691E0]();
}

uint64_t sub_2265F9620()
{
  return MEMORY[0x270F69240]();
}

uint64_t sub_2265F9630()
{
  return MEMORY[0x270F69248]();
}

uint64_t sub_2265F9640()
{
  return MEMORY[0x270F69250]();
}

uint64_t sub_2265F9650()
{
  return MEMORY[0x270F69258]();
}

uint64_t sub_2265F9660()
{
  return MEMORY[0x270F69260]();
}

uint64_t sub_2265F9670()
{
  return MEMORY[0x270F69268]();
}

uint64_t sub_2265F9680()
{
  return MEMORY[0x270F69270]();
}

uint64_t sub_2265F9690()
{
  return MEMORY[0x270F69278]();
}

uint64_t sub_2265F96A0()
{
  return MEMORY[0x270F69280]();
}

uint64_t sub_2265F96B0()
{
  return MEMORY[0x270F692A0]();
}

uint64_t sub_2265F96C0()
{
  return MEMORY[0x270F692E8]();
}

uint64_t sub_2265F96D0()
{
  return MEMORY[0x270F69340]();
}

uint64_t sub_2265F96E0()
{
  return MEMORY[0x270F69388]();
}

uint64_t sub_2265F96F0()
{
  return MEMORY[0x270F69428]();
}

uint64_t sub_2265F9700()
{
  return MEMORY[0x270F69430]();
}

uint64_t sub_2265F9710()
{
  return MEMORY[0x270F69438]();
}

uint64_t sub_2265F9720()
{
  return MEMORY[0x270F69440]();
}

uint64_t sub_2265F9730()
{
  return MEMORY[0x270F69448]();
}

uint64_t sub_2265F9740()
{
  return MEMORY[0x270F69450]();
}

uint64_t sub_2265F9750()
{
  return MEMORY[0x270F69458]();
}

uint64_t sub_2265F9760()
{
  return MEMORY[0x270F69460]();
}

uint64_t sub_2265F9770()
{
  return MEMORY[0x270F69480]();
}

uint64_t sub_2265F9780()
{
  return MEMORY[0x270F69498]();
}

uint64_t sub_2265F9790()
{
  return MEMORY[0x270F694A0]();
}

uint64_t sub_2265F97A0()
{
  return MEMORY[0x270F694A8]();
}

uint64_t sub_2265F97B0()
{
  return MEMORY[0x270F694B0]();
}

uint64_t sub_2265F97C0()
{
  return MEMORY[0x270F694B8]();
}

uint64_t sub_2265F97D0()
{
  return MEMORY[0x270F69508]();
}

uint64_t sub_2265F97E0()
{
  return MEMORY[0x270F69510]();
}

uint64_t sub_2265F97F0()
{
  return MEMORY[0x270F69550]();
}

uint64_t sub_2265F9800()
{
  return MEMORY[0x270F69558]();
}

uint64_t sub_2265F9810()
{
  return MEMORY[0x270F69680]();
}

uint64_t sub_2265F9820()
{
  return MEMORY[0x270F696B8]();
}

uint64_t sub_2265F9830()
{
  return MEMORY[0x270F696C0]();
}

uint64_t sub_2265F9840()
{
  return MEMORY[0x270F696C8]();
}

uint64_t sub_2265F9850()
{
  return MEMORY[0x270F696D0]();
}

uint64_t sub_2265F9860()
{
  return MEMORY[0x270F696F0]();
}

uint64_t sub_2265F9870()
{
  return MEMORY[0x270F696F8]();
}

uint64_t sub_2265F9880()
{
  return MEMORY[0x270F69700]();
}

uint64_t sub_2265F9890()
{
  return MEMORY[0x270F69710]();
}

uint64_t sub_2265F98A0()
{
  return MEMORY[0x270F697A0]();
}

uint64_t sub_2265F98B0()
{
  return MEMORY[0x270F69820]();
}

uint64_t sub_2265F98C0()
{
  return MEMORY[0x270F69840]();
}

uint64_t sub_2265F98D0()
{
  return MEMORY[0x270F69848]();
}

uint64_t sub_2265F98E0()
{
  return MEMORY[0x270F69850]();
}

uint64_t sub_2265F98F0()
{
  return MEMORY[0x270F69858]();
}

uint64_t sub_2265F9900()
{
  return MEMORY[0x270F69860]();
}

uint64_t sub_2265F9910()
{
  return MEMORY[0x270F698F0]();
}

uint64_t sub_2265F9920()
{
  return MEMORY[0x270F698F8]();
}

uint64_t sub_2265F9930()
{
  return MEMORY[0x270F69900]();
}

uint64_t sub_2265F9940()
{
  return MEMORY[0x270F69910]();
}

uint64_t sub_2265F9950()
{
  return MEMORY[0x270F69918]();
}

uint64_t sub_2265F9960()
{
  return MEMORY[0x270F69920]();
}

uint64_t sub_2265F9970()
{
  return MEMORY[0x270F69928]();
}

uint64_t sub_2265F9980()
{
  return MEMORY[0x270F69930]();
}

uint64_t sub_2265F9990()
{
  return MEMORY[0x270F69938]();
}

uint64_t sub_2265F99A0()
{
  return MEMORY[0x270F69940]();
}

uint64_t sub_2265F99B0()
{
  return MEMORY[0x270F69948]();
}

uint64_t sub_2265F99C0()
{
  return MEMORY[0x270F69950]();
}

uint64_t sub_2265F99D0()
{
  return MEMORY[0x270F69958]();
}

uint64_t sub_2265F99E0()
{
  return MEMORY[0x270F69960]();
}

uint64_t sub_2265F99F0()
{
  return MEMORY[0x270F69968]();
}

uint64_t sub_2265F9A00()
{
  return MEMORY[0x270F69970]();
}

uint64_t sub_2265F9A10()
{
  return MEMORY[0x270F69978]();
}

uint64_t sub_2265F9A20()
{
  return MEMORY[0x270F69980]();
}

uint64_t sub_2265F9A30()
{
  return MEMORY[0x270F69988]();
}

uint64_t sub_2265F9A40()
{
  return MEMORY[0x270F69990]();
}

uint64_t sub_2265F9A50()
{
  return MEMORY[0x270F69998]();
}

uint64_t sub_2265F9A60()
{
  return MEMORY[0x270F699A0]();
}

uint64_t sub_2265F9A70()
{
  return MEMORY[0x270F699A8]();
}

uint64_t sub_2265F9A80()
{
  return MEMORY[0x270F699C0]();
}

uint64_t sub_2265F9A90()
{
  return MEMORY[0x270F699E8]();
}

uint64_t sub_2265F9AA0()
{
  return MEMORY[0x270F699F8]();
}

uint64_t sub_2265F9AB0()
{
  return MEMORY[0x270F69A00]();
}

uint64_t sub_2265F9AC0()
{
  return MEMORY[0x270F69A08]();
}

uint64_t sub_2265F9AD0()
{
  return MEMORY[0x270F69A10]();
}

uint64_t sub_2265F9AE0()
{
  return MEMORY[0x270F69A18]();
}

uint64_t sub_2265F9AF0()
{
  return MEMORY[0x270F69A20]();
}

uint64_t sub_2265F9B10()
{
  return MEMORY[0x270F69A30]();
}

uint64_t sub_2265F9B20()
{
  return MEMORY[0x270F69A38]();
}

uint64_t sub_2265F9B30()
{
  return MEMORY[0x270F69A40]();
}

uint64_t sub_2265F9B40()
{
  return MEMORY[0x270F69A48]();
}

uint64_t sub_2265F9B50()
{
  return MEMORY[0x270F69A50]();
}

uint64_t sub_2265F9B60()
{
  return MEMORY[0x270F69A58]();
}

uint64_t sub_2265F9B70()
{
  return MEMORY[0x270F69A60]();
}

uint64_t sub_2265F9B80()
{
  return MEMORY[0x270F69A68]();
}

uint64_t sub_2265F9B90()
{
  return MEMORY[0x270F69A70]();
}

uint64_t sub_2265F9BA0()
{
  return MEMORY[0x270F69A78]();
}

uint64_t sub_2265F9BB0()
{
  return MEMORY[0x270F69A80]();
}

uint64_t sub_2265F9BC0()
{
  return MEMORY[0x270F69A90]();
}

uint64_t sub_2265F9BD0()
{
  return MEMORY[0x270F69A98]();
}

uint64_t sub_2265F9BE0()
{
  return MEMORY[0x270F69AA0]();
}

uint64_t sub_2265F9BF0()
{
  return MEMORY[0x270F69AA8]();
}

uint64_t sub_2265F9C00()
{
  return MEMORY[0x270F69AB0]();
}

uint64_t sub_2265F9C10()
{
  return MEMORY[0x270F69AB8]();
}

uint64_t sub_2265F9C20()
{
  return MEMORY[0x270F69AC0]();
}

uint64_t sub_2265F9C30()
{
  return MEMORY[0x270F69AC8]();
}

uint64_t sub_2265F9C40()
{
  return MEMORY[0x270F69AD0]();
}

uint64_t sub_2265F9C50()
{
  return MEMORY[0x270F69AD8]();
}

uint64_t sub_2265F9C60()
{
  return MEMORY[0x270F69AE0]();
}

uint64_t sub_2265F9C70()
{
  return MEMORY[0x270F69AE8]();
}

uint64_t sub_2265F9C80()
{
  return MEMORY[0x270F69AF0]();
}

uint64_t sub_2265F9C90()
{
  return MEMORY[0x270F69B08]();
}

uint64_t sub_2265F9CA0()
{
  return MEMORY[0x270F69B10]();
}

uint64_t sub_2265F9CB0()
{
  return MEMORY[0x270F69B30]();
}

uint64_t sub_2265F9CC0()
{
  return MEMORY[0x270F69B38]();
}

uint64_t sub_2265F9CD0()
{
  return MEMORY[0x270F69B40]();
}

uint64_t sub_2265F9CE0()
{
  return MEMORY[0x270F69B48]();
}

uint64_t sub_2265F9CF0()
{
  return MEMORY[0x270F69B50]();
}

uint64_t sub_2265F9D00()
{
  return MEMORY[0x270F69B58]();
}

uint64_t sub_2265F9D10()
{
  return MEMORY[0x270F69B60]();
}

uint64_t sub_2265F9D20()
{
  return MEMORY[0x270F69B68]();
}

uint64_t sub_2265F9D30()
{
  return MEMORY[0x270F69B70]();
}

uint64_t sub_2265F9D40()
{
  return MEMORY[0x270F69B80]();
}

uint64_t sub_2265F9D50()
{
  return MEMORY[0x270F69B88]();
}

uint64_t sub_2265F9D60()
{
  return MEMORY[0x270F69BA0]();
}

uint64_t sub_2265F9D70()
{
  return MEMORY[0x270F69BA8]();
}

uint64_t sub_2265F9D80()
{
  return MEMORY[0x270F69BB0]();
}

uint64_t sub_2265F9D90()
{
  return MEMORY[0x270F69BC0]();
}

uint64_t sub_2265F9DA0()
{
  return MEMORY[0x270F69BC8]();
}

uint64_t sub_2265F9DB0()
{
  return MEMORY[0x270F69BD8]();
}

uint64_t sub_2265F9DC0()
{
  return MEMORY[0x270F69BF0]();
}

uint64_t sub_2265F9DD0()
{
  return MEMORY[0x270F6A1D0]();
}

uint64_t sub_2265F9DE0()
{
  return MEMORY[0x270F6A1D8]();
}

uint64_t sub_2265F9DF0()
{
  return MEMORY[0x270F6A1E0]();
}

uint64_t sub_2265F9E00()
{
  return MEMORY[0x270F6A1E8]();
}

uint64_t sub_2265F9E10()
{
  return MEMORY[0x270F6A1F0]();
}

uint64_t sub_2265F9E20()
{
  return MEMORY[0x270F6A1F8]();
}

uint64_t sub_2265F9E30()
{
  return MEMORY[0x270F6A200]();
}

uint64_t sub_2265F9E40()
{
  return MEMORY[0x270F6A208]();
}

uint64_t sub_2265F9E50()
{
  return MEMORY[0x270F6A210]();
}

uint64_t sub_2265F9E60()
{
  return MEMORY[0x270F6A218]();
}

uint64_t sub_2265F9E70()
{
  return MEMORY[0x270F6A220]();
}

uint64_t sub_2265F9E80()
{
  return MEMORY[0x270F6A228]();
}

uint64_t sub_2265F9E90()
{
  return MEMORY[0x270F6A230]();
}

uint64_t sub_2265F9EA0()
{
  return MEMORY[0x270F6A238]();
}

uint64_t sub_2265F9EB0()
{
  return MEMORY[0x270F6A240]();
}

uint64_t sub_2265F9EC0()
{
  return MEMORY[0x270F6A248]();
}

uint64_t sub_2265F9ED0()
{
  return MEMORY[0x270F6A250]();
}

uint64_t sub_2265F9EE0()
{
  return MEMORY[0x270F6A258]();
}

uint64_t sub_2265F9EF0()
{
  return MEMORY[0x270FA2A68]();
}

uint64_t sub_2265F9F00()
{
  return MEMORY[0x270FA2A78]();
}

uint64_t sub_2265F9F10()
{
  return MEMORY[0x270F2EE10]();
}

uint64_t sub_2265F9F20()
{
  return MEMORY[0x270F2EE20]();
}

uint64_t sub_2265F9F30()
{
  return MEMORY[0x270F2EE30]();
}

uint64_t sub_2265F9F40()
{
  return MEMORY[0x270F2EE48]();
}

uint64_t sub_2265F9F60()
{
  return MEMORY[0x270F4C180]();
}

uint64_t sub_2265F9F70()
{
  return MEMORY[0x270F4C188]();
}

uint64_t sub_2265F9F80()
{
  return MEMORY[0x270F6F9B8]();
}

uint64_t sub_2265F9F90()
{
  return MEMORY[0x270F6F9C0]();
}

uint64_t sub_2265F9FA0()
{
  return MEMORY[0x270F6F9C8]();
}

uint64_t sub_2265F9FB0()
{
  return MEMORY[0x270F6F9D0]();
}

uint64_t sub_2265F9FC0()
{
  return MEMORY[0x270F6F9D8]();
}

uint64_t sub_2265F9FD0()
{
  return MEMORY[0x270F6F9E0]();
}

uint64_t sub_2265F9FE0()
{
  return MEMORY[0x270F6F9E8]();
}

uint64_t sub_2265F9FF0()
{
  return MEMORY[0x270F6F9F0]();
}

uint64_t sub_2265FA000()
{
  return MEMORY[0x270F6F9F8]();
}

uint64_t sub_2265FA010()
{
  return MEMORY[0x270F6FA00]();
}

uint64_t sub_2265FA020()
{
  return MEMORY[0x270F6FA18]();
}

uint64_t sub_2265FA030()
{
  return MEMORY[0x270F6FA20]();
}

uint64_t sub_2265FA040()
{
  return MEMORY[0x270F6FA38]();
}

uint64_t sub_2265FA050()
{
  return MEMORY[0x270F44678]();
}

uint64_t sub_2265FA060()
{
  return MEMORY[0x270F446A0]();
}

uint64_t sub_2265FA070()
{
  return MEMORY[0x270F446A8]();
}

uint64_t sub_2265FA080()
{
  return MEMORY[0x270F446B0]();
}

uint64_t sub_2265FA090()
{
  return MEMORY[0x270F446D0]();
}

uint64_t sub_2265FA0A0()
{
  return MEMORY[0x270F446E8]();
}

uint64_t sub_2265FA0B0()
{
  return MEMORY[0x270F446F8]();
}

uint64_t sub_2265FA0C0()
{
  return MEMORY[0x270F44710]();
}

uint64_t sub_2265FA0D0()
{
  return MEMORY[0x270F44720]();
}

uint64_t sub_2265FA0E0()
{
  return MEMORY[0x270F44738]();
}

uint64_t sub_2265FA0F0()
{
  return MEMORY[0x270F449A0]();
}

uint64_t sub_2265FA100()
{
  return MEMORY[0x270F44A70]();
}

uint64_t sub_2265FA110()
{
  return MEMORY[0x270F44A78]();
}

uint64_t sub_2265FA120()
{
  return MEMORY[0x270F44A80]();
}

uint64_t sub_2265FA130()
{
  return MEMORY[0x270F44A88]();
}

uint64_t sub_2265FA140()
{
  return MEMORY[0x270F44A90]();
}

uint64_t sub_2265FA150()
{
  return MEMORY[0x270F44A98]();
}

uint64_t sub_2265FA160()
{
  return MEMORY[0x270F44AA8]();
}

uint64_t sub_2265FA170()
{
  return MEMORY[0x270F44AB0]();
}

uint64_t sub_2265FA180()
{
  return MEMORY[0x270F44C70]();
}

uint64_t sub_2265FA190()
{
  return MEMORY[0x270F44C78]();
}

uint64_t sub_2265FA1A0()
{
  return MEMORY[0x270F44C88]();
}

uint64_t sub_2265FA1B0()
{
  return MEMORY[0x270F44C90]();
}

uint64_t sub_2265FA1C0()
{
  return MEMORY[0x270F44CA0]();
}

uint64_t sub_2265FA1D0()
{
  return MEMORY[0x270F44CA8]();
}

uint64_t sub_2265FA1E0()
{
  return MEMORY[0x270F44CC8]();
}

uint64_t sub_2265FA1F0()
{
  return MEMORY[0x270F66070]();
}

uint64_t sub_2265FA200()
{
  return MEMORY[0x270F66078]();
}

uint64_t sub_2265FA210()
{
  return MEMORY[0x270F66088]();
}

uint64_t sub_2265FA220()
{
  return MEMORY[0x270F66098]();
}

uint64_t sub_2265FA230()
{
  return MEMORY[0x270F70E38]();
}

uint64_t sub_2265FA240()
{
  return MEMORY[0x270F70E40]();
}

uint64_t sub_2265FA250()
{
  return MEMORY[0x270F70E48]();
}

uint64_t sub_2265FA260()
{
  return MEMORY[0x270F70E50]();
}

uint64_t sub_2265FA270()
{
  return MEMORY[0x270F70E60]();
}

uint64_t sub_2265FA280()
{
  return MEMORY[0x270F70E68]();
}

uint64_t sub_2265FA290()
{
  return MEMORY[0x270F70E70]();
}

uint64_t sub_2265FA2A0()
{
  return MEMORY[0x270F70E78]();
}

uint64_t sub_2265FA2B0()
{
  return MEMORY[0x270F70E80]();
}

uint64_t sub_2265FA2C0()
{
  return MEMORY[0x270F70E88]();
}

uint64_t sub_2265FA2D0()
{
  return MEMORY[0x270F70E90]();
}

uint64_t sub_2265FA2E0()
{
  return MEMORY[0x270F70EA0]();
}

uint64_t sub_2265FA2F0()
{
  return MEMORY[0x270F70EA8]();
}

uint64_t sub_2265FA300()
{
  return MEMORY[0x270F70EB0]();
}

uint64_t sub_2265FA310()
{
  return MEMORY[0x270F70EB8]();
}

uint64_t sub_2265FA320()
{
  return MEMORY[0x270F70EC0]();
}

uint64_t sub_2265FA330()
{
  return MEMORY[0x270F70EC8]();
}

uint64_t sub_2265FA340()
{
  return MEMORY[0x270F70EE0]();
}

uint64_t sub_2265FA350()
{
  return MEMORY[0x270F70EE8]();
}

uint64_t sub_2265FA360()
{
  return MEMORY[0x270F70EF0]();
}

uint64_t sub_2265FA370()
{
  return MEMORY[0x270F70EF8]();
}

uint64_t sub_2265FA380()
{
  return MEMORY[0x270F70F00]();
}

uint64_t sub_2265FA390()
{
  return MEMORY[0x270F70F08]();
}

uint64_t sub_2265FA3A0()
{
  return MEMORY[0x270F70F10]();
}

uint64_t sub_2265FA3B0()
{
  return MEMORY[0x270F70F18]();
}

uint64_t sub_2265FA3C0()
{
  return MEMORY[0x270F70F20]();
}

uint64_t sub_2265FA3D0()
{
  return MEMORY[0x270F70F28]();
}

uint64_t sub_2265FA3E0()
{
  return MEMORY[0x270F70F30]();
}

uint64_t sub_2265FA3F0()
{
  return MEMORY[0x270F70F38]();
}

uint64_t sub_2265FA400()
{
  return MEMORY[0x270F70F40]();
}

uint64_t sub_2265FA410()
{
  return MEMORY[0x270F70F48]();
}

uint64_t sub_2265FA420()
{
  return MEMORY[0x270F70F50]();
}

uint64_t sub_2265FA430()
{
  return MEMORY[0x270F70F58]();
}

uint64_t sub_2265FA440()
{
  return MEMORY[0x270F70F60]();
}

uint64_t sub_2265FA450()
{
  return MEMORY[0x270F70FA8]();
}

uint64_t sub_2265FA460()
{
  return MEMORY[0x270F70FB0]();
}

uint64_t sub_2265FA470()
{
  return MEMORY[0x270F70FC0]();
}

uint64_t sub_2265FA480()
{
  return MEMORY[0x270F70FD0]();
}

uint64_t sub_2265FA490()
{
  return MEMORY[0x270F70FD8]();
}

uint64_t sub_2265FA4A0()
{
  return MEMORY[0x270F70FE0]();
}

uint64_t sub_2265FA4B0()
{
  return MEMORY[0x270F70FE8]();
}

uint64_t sub_2265FA4C0()
{
  return MEMORY[0x270F70FF0]();
}

uint64_t sub_2265FA4D0()
{
  return MEMORY[0x270F70FF8]();
}

uint64_t sub_2265FA4E0()
{
  return MEMORY[0x270F71008]();
}

uint64_t sub_2265FA4F0()
{
  return MEMORY[0x270F71010]();
}

uint64_t sub_2265FA500()
{
  return MEMORY[0x270F71018]();
}

uint64_t sub_2265FA510()
{
  return MEMORY[0x270F71020]();
}

uint64_t sub_2265FA520()
{
  return MEMORY[0x270F71048]();
}

uint64_t sub_2265FA530()
{
  return MEMORY[0x270F411F8]();
}

uint64_t sub_2265FA540()
{
  return MEMORY[0x270F41250]();
}

uint64_t sub_2265FA550()
{
  return MEMORY[0x270F41278]();
}

uint64_t sub_2265FA560()
{
  return MEMORY[0x270F41280]();
}

uint64_t sub_2265FA570()
{
  return MEMORY[0x270F412B0]();
}

uint64_t sub_2265FA580()
{
  return MEMORY[0x270F412C0]();
}

uint64_t sub_2265FA590()
{
  return MEMORY[0x270F412C8]();
}

uint64_t sub_2265FA5A0()
{
  return MEMORY[0x270F41390]();
}

uint64_t sub_2265FA5B0()
{
  return MEMORY[0x270F413A0]();
}

uint64_t sub_2265FA5C0()
{
  return MEMORY[0x270F413B0]();
}

uint64_t sub_2265FA5D0()
{
  return MEMORY[0x270F413E8]();
}

uint64_t sub_2265FA5E0()
{
  return MEMORY[0x270F414A0]();
}

uint64_t sub_2265FA5F0()
{
  return MEMORY[0x270F414F8]();
}

uint64_t sub_2265FA600()
{
  return MEMORY[0x270F41500]();
}

uint64_t sub_2265FA610()
{
  return MEMORY[0x270F41518]();
}

uint64_t sub_2265FA620()
{
  return MEMORY[0x270F41530]();
}

uint64_t sub_2265FA630()
{
  return MEMORY[0x270F41550]();
}

uint64_t sub_2265FA640()
{
  return MEMORY[0x270F41598]();
}

uint64_t sub_2265FA650()
{
  return MEMORY[0x270F415A0]();
}

uint64_t sub_2265FA660()
{
  return MEMORY[0x270F415B0]();
}

uint64_t sub_2265FA670()
{
  return MEMORY[0x270F415D8]();
}

uint64_t sub_2265FA680()
{
  return MEMORY[0x270F415E0]();
}

uint64_t sub_2265FA690()
{
  return MEMORY[0x270F417F0]();
}

uint64_t sub_2265FA6A0()
{
  return MEMORY[0x270F417F8]();
}

uint64_t sub_2265FA6B0()
{
  return MEMORY[0x270F41800]();
}

uint64_t sub_2265FA6C0()
{
  return MEMORY[0x270F41840]();
}

uint64_t sub_2265FA6E0()
{
  return MEMORY[0x270F41888]();
}

uint64_t sub_2265FA6F0()
{
  return MEMORY[0x270F41898]();
}

uint64_t sub_2265FA700()
{
  return MEMORY[0x270F418B0]();
}

uint64_t sub_2265FA710()
{
  return MEMORY[0x270F418B8]();
}

uint64_t sub_2265FA720()
{
  return MEMORY[0x270F418C0]();
}

uint64_t sub_2265FA730()
{
  return MEMORY[0x270F418D0]();
}

uint64_t sub_2265FA740()
{
  return MEMORY[0x270F418D8]();
}

uint64_t sub_2265FA750()
{
  return MEMORY[0x270F418E0]();
}

uint64_t sub_2265FA760()
{
  return MEMORY[0x270F418E8]();
}

uint64_t sub_2265FA770()
{
  return MEMORY[0x270F418F0]();
}

uint64_t sub_2265FA780()
{
  return MEMORY[0x270F418F8]();
}

uint64_t sub_2265FA790()
{
  return MEMORY[0x270F41918]();
}

uint64_t sub_2265FA7A0()
{
  return MEMORY[0x270F41920]();
}

uint64_t sub_2265FA7B0()
{
  return MEMORY[0x270F41930]();
}

uint64_t sub_2265FA7C0()
{
  return MEMORY[0x270F41988]();
}

uint64_t sub_2265FA7D0()
{
  return MEMORY[0x270F419B0]();
}

uint64_t sub_2265FA7E0()
{
  return MEMORY[0x270F419C0]();
}

uint64_t sub_2265FA7F0()
{
  return MEMORY[0x270F706B8]();
}

uint64_t sub_2265FA800()
{
  return MEMORY[0x270F706C0]();
}

uint64_t sub_2265FA810()
{
  return MEMORY[0x270F706E8]();
}

uint64_t sub_2265FA820()
{
  return MEMORY[0x270F706F0]();
}

uint64_t sub_2265FA830()
{
  return MEMORY[0x270F706F8]();
}

uint64_t sub_2265FA840()
{
  return MEMORY[0x270F2ECE0]();
}

uint64_t sub_2265FA850()
{
  return MEMORY[0x270F2ECE8]();
}

uint64_t sub_2265FA860()
{
  return MEMORY[0x270F2ECF0]();
}

uint64_t sub_2265FA870()
{
  return MEMORY[0x270F08550]();
}

uint64_t sub_2265FA880()
{
  return MEMORY[0x270F2F148]();
}

uint64_t sub_2265FA890()
{
  return MEMORY[0x270F2F150]();
}

uint64_t sub_2265FA8A0()
{
  return MEMORY[0x270F2F2A8]();
}

uint64_t sub_2265FA8B0()
{
  return MEMORY[0x270F2F2D0]();
}

uint64_t sub_2265FA8C0()
{
  return MEMORY[0x270F2F2E0]();
}

uint64_t sub_2265FA8D0()
{
  return MEMORY[0x270FA2C68]();
}

uint64_t sub_2265FA8E0()
{
  return MEMORY[0x270FA2C78]();
}

uint64_t sub_2265FA8F0()
{
  return MEMORY[0x270FA2C90]();
}

uint64_t sub_2265FA900()
{
  return MEMORY[0x270FA2C98]();
}

uint64_t sub_2265FA910()
{
  return MEMORY[0x270FA2CC0]();
}

uint64_t sub_2265FA920()
{
  return MEMORY[0x270FA2CF8]();
}

uint64_t sub_2265FA930()
{
  return MEMORY[0x270FA2D00]();
}

uint64_t sub_2265FA940()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_2265FA950()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_2265FA960()
{
  return MEMORY[0x270FA2E30]();
}

uint64_t sub_2265FA970()
{
  return MEMORY[0x270F70750]();
}

uint64_t sub_2265FA980()
{
  return MEMORY[0x270F70758]();
}

uint64_t sub_2265FA990()
{
  return MEMORY[0x270F70760]();
}

uint64_t sub_2265FA9A0()
{
  return MEMORY[0x270F70768]();
}

uint64_t sub_2265FA9B0()
{
  return MEMORY[0x270F70810]();
}

uint64_t sub_2265FA9C0()
{
  return MEMORY[0x270F70818]();
}

uint64_t sub_2265FA9D0()
{
  return MEMORY[0x270F70820]();
}

uint64_t sub_2265FA9F0()
{
  return MEMORY[0x270F70980]();
}

uint64_t sub_2265FAA00()
{
  return MEMORY[0x270F70988]();
}

uint64_t sub_2265FAA10()
{
  return MEMORY[0x270F709C0]();
}

uint64_t sub_2265FAA20()
{
  return MEMORY[0x270F709D0]();
}

uint64_t sub_2265FAA30()
{
  return MEMORY[0x270F709D8]();
}

uint64_t sub_2265FAA40()
{
  return MEMORY[0x270F709E0]();
}

uint64_t sub_2265FAA50()
{
  return MEMORY[0x270F709E8]();
}

uint64_t sub_2265FAA60()
{
  return MEMORY[0x270F709F0]();
}

uint64_t sub_2265FAA70()
{
  return MEMORY[0x270F70A00]();
}

uint64_t sub_2265FAA80()
{
  return MEMORY[0x270F70A08]();
}

uint64_t sub_2265FAA90()
{
  return MEMORY[0x270F70A28]();
}

uint64_t sub_2265FAAA0()
{
  return MEMORY[0x270F70A30]();
}

uint64_t sub_2265FAAB0()
{
  return MEMORY[0x270F70A80]();
}

uint64_t sub_2265FAAC0()
{
  return MEMORY[0x270F70A88]();
}

uint64_t sub_2265FAAD0()
{
  return MEMORY[0x270F70AA0]();
}

uint64_t sub_2265FAAE0()
{
  return MEMORY[0x270F70AA8]();
}

uint64_t sub_2265FAAF0()
{
  return MEMORY[0x270F70AB0]();
}

uint64_t sub_2265FAB00()
{
  return MEMORY[0x270F70AB8]();
}

uint64_t sub_2265FAB10()
{
  return MEMORY[0x270F70AC8]();
}

uint64_t sub_2265FAB20()
{
  return MEMORY[0x270F7F9D8]();
}

uint64_t sub_2265FAB30()
{
  return MEMORY[0x270F7FA08]();
}

uint64_t sub_2265FAB40()
{
  return MEMORY[0x270F7FDD8]();
}

uint64_t sub_2265FAB50()
{
  return MEMORY[0x270F7FE48]();
}

uint64_t sub_2265FAB60()
{
  return MEMORY[0x270F7FE50]();
}

uint64_t sub_2265FAB70()
{
  return MEMORY[0x270F7FE58]();
}

uint64_t sub_2265FAB80()
{
  return MEMORY[0x270F7FE70]();
}

uint64_t sub_2265FAB90()
{
  return MEMORY[0x270F7FE90]();
}

uint64_t sub_2265FABA0()
{
  return MEMORY[0x270F7FE98]();
}

uint64_t sub_2265FABB0()
{
  return MEMORY[0x270F7FEB8]();
}

uint64_t sub_2265FABC0()
{
  return MEMORY[0x270F7FEC0]();
}

uint64_t sub_2265FABD0()
{
  return MEMORY[0x270F7FEE8]();
}

uint64_t sub_2265FABE0()
{
  return MEMORY[0x270F7FEF0]();
}

uint64_t sub_2265FABF0()
{
  return MEMORY[0x270F7FF40]();
}

uint64_t sub_2265FAC00()
{
  return MEMORY[0x270F7FF48]();
}

uint64_t sub_2265FAC10()
{
  return MEMORY[0x270F7FF58]();
}

uint64_t sub_2265FAC20()
{
  return MEMORY[0x270F7FF80]();
}

uint64_t sub_2265FAC30()
{
  return MEMORY[0x270F7FF88]();
}

uint64_t sub_2265FAC40()
{
  return MEMORY[0x270F7FFA8]();
}

uint64_t sub_2265FAC50()
{
  return MEMORY[0x270F7FFC8]();
}

uint64_t sub_2265FAC60()
{
  return MEMORY[0x270F80000]();
}

uint64_t sub_2265FAC70()
{
  return MEMORY[0x270F800B8]();
}

uint64_t sub_2265FAC80()
{
  return MEMORY[0x270F800D0]();
}

uint64_t sub_2265FAC90()
{
  return MEMORY[0x270F800D8]();
}

uint64_t sub_2265FACA0()
{
  return MEMORY[0x270F800E8]();
}

uint64_t sub_2265FACB0()
{
  return MEMORY[0x270F800F0]();
}

uint64_t sub_2265FACC0()
{
  return MEMORY[0x270F80440]();
}

uint64_t sub_2265FACD0()
{
  return MEMORY[0x270F80448]();
}

uint64_t sub_2265FACE0()
{
  return MEMORY[0x270F80450]();
}

uint64_t sub_2265FACF0()
{
  return MEMORY[0x270F80458]();
}

uint64_t sub_2265FAD00()
{
  return MEMORY[0x270F80460]();
}

uint64_t sub_2265FAD10()
{
  return MEMORY[0x270FA0970]();
}

uint64_t sub_2265FAD20()
{
  return MEMORY[0x270FA0988]();
}

uint64_t sub_2265FAD30()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_2265FAD40()
{
  return MEMORY[0x270FA09D8]();
}

uint64_t sub_2265FAD50()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_2265FAD60()
{
  return MEMORY[0x270FA0A00]();
}

uint64_t sub_2265FAD70()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_2265FAD80()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t sub_2265FAD90()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t sub_2265FADA0()
{
  return MEMORY[0x270FA0BB0]();
}

uint64_t sub_2265FADB0()
{
  return MEMORY[0x270FA0BC8]();
}

uint64_t sub_2265FADC0()
{
  return MEMORY[0x270F469F8]();
}

uint64_t sub_2265FADD0()
{
  return MEMORY[0x270F46A00]();
}

uint64_t sub_2265FADF0()
{
  return MEMORY[0x270F46A10]();
}

uint64_t sub_2265FAE30()
{
  return MEMORY[0x270F46A38]();
}

uint64_t sub_2265FAE40()
{
  return MEMORY[0x270F46A40]();
}

uint64_t sub_2265FAE50()
{
  return MEMORY[0x270F46A48]();
}

uint64_t sub_2265FAE60()
{
  return MEMORY[0x270F46A58]();
}

uint64_t sub_2265FAE70()
{
  return MEMORY[0x270F46A60]();
}

uint64_t sub_2265FAE80()
{
  return MEMORY[0x270F46A68]();
}

uint64_t sub_2265FAE90()
{
  return MEMORY[0x270F46A70]();
}

uint64_t sub_2265FAEA0()
{
  return MEMORY[0x270F46A78]();
}

uint64_t sub_2265FAEB0()
{
  return MEMORY[0x270F46A80]();
}

uint64_t sub_2265FAEC0()
{
  return MEMORY[0x270F46A88]();
}

uint64_t sub_2265FAED0()
{
  return MEMORY[0x270F46A90]();
}

uint64_t sub_2265FAEE0()
{
  return MEMORY[0x270F58050]();
}

uint64_t sub_2265FAEF0()
{
  return MEMORY[0x270F58060]();
}

uint64_t sub_2265FAF00()
{
  return MEMORY[0x270F58128]();
}

uint64_t sub_2265FAF10()
{
  return MEMORY[0x270F58130]();
}

uint64_t sub_2265FAF20()
{
  return MEMORY[0x270F582E8]();
}

uint64_t sub_2265FAF30()
{
  return MEMORY[0x270F30050]();
}

uint64_t sub_2265FAF40()
{
  return MEMORY[0x270F2F510]();
}

uint64_t sub_2265FAF50()
{
  return MEMORY[0x270F2F530]();
}

uint64_t sub_2265FAF60()
{
  return MEMORY[0x270F7F318]();
}

uint64_t sub_2265FAF70()
{
  return MEMORY[0x270F2EF00]();
}

uint64_t sub_2265FAF80()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_2265FAF90()
{
  return MEMORY[0x270EF1830]();
}

uint64_t sub_2265FAFA0()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_2265FAFB0()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_2265FAFC0()
{
  return MEMORY[0x270F9D0A0]();
}

uint64_t sub_2265FAFD0()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_2265FAFE0()
{
  return MEMORY[0x270F9D190]();
}

uint64_t sub_2265FAFF0()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_2265FB000()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_2265FB010()
{
  return MEMORY[0x270F9D3C0]();
}

uint64_t sub_2265FB020()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_2265FB030()
{
  return MEMORY[0x270F9D488]();
}

uint64_t sub_2265FB040()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_2265FB050()
{
  return MEMORY[0x270EF1888]();
}

uint64_t sub_2265FB060()
{
  return MEMORY[0x270EF18A8]();
}

uint64_t sub_2265FB070()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_2265FB080()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_2265FB090()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_2265FB0A0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_2265FB0B0()
{
  return MEMORY[0x270EF1A10]();
}

uint64_t sub_2265FB0C0()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_2265FB0D0()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_2265FB0E0()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_2265FB0F0()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_2265FB100()
{
  return MEMORY[0x270F9D5F8]();
}

uint64_t sub_2265FB110()
{
  return MEMORY[0x270F6BB40]();
}

uint64_t sub_2265FB120()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_2265FB130()
{
  return MEMORY[0x270F9D660]();
}

uint64_t sub_2265FB140()
{
  return MEMORY[0x270F9D678]();
}

uint64_t sub_2265FB150()
{
  return MEMORY[0x270F9D680]();
}

uint64_t sub_2265FB160()
{
  return MEMORY[0x270F9D6B0]();
}

uint64_t sub_2265FB170()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t sub_2265FB180()
{
  return MEMORY[0x270F9D6D0]();
}

uint64_t sub_2265FB190()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_2265FB1A0()
{
  return MEMORY[0x270F9D718]();
}

uint64_t sub_2265FB1B0()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_2265FB1C0()
{
  return MEMORY[0x270F9D750]();
}

uint64_t sub_2265FB1D0()
{
  return MEMORY[0x270F9D758]();
}

uint64_t sub_2265FB1E0()
{
  return MEMORY[0x270F9D760]();
}

uint64_t sub_2265FB1F0()
{
  return MEMORY[0x270F9D778]();
}

uint64_t sub_2265FB200()
{
  return MEMORY[0x270F9D780]();
}

uint64_t sub_2265FB210()
{
  return MEMORY[0x270F9D788]();
}

uint64_t sub_2265FB220()
{
  return MEMORY[0x270F9D790]();
}

uint64_t sub_2265FB230()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_2265FB250()
{
  return MEMORY[0x270F9D7D8]();
}

uint64_t sub_2265FB260()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_2265FB270()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_2265FB280()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_2265FB2A0()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_2265FB2B0()
{
  return MEMORY[0x270F9D850]();
}

uint64_t sub_2265FB2C0()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_2265FB2D0()
{
  return MEMORY[0x270F9D878]();
}

uint64_t sub_2265FB2E0()
{
  return MEMORY[0x270F9D880]();
}

uint64_t sub_2265FB2F0()
{
  return MEMORY[0x270F9D8B0]();
}

uint64_t sub_2265FB300()
{
  return MEMORY[0x270F9D8D8]();
}

uint64_t sub_2265FB310()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_2265FB320()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_2265FB330()
{
  return MEMORY[0x270F9D8F8]();
}

uint64_t sub_2265FB340()
{
  return MEMORY[0x270F9DA28]();
}

uint64_t sub_2265FB350()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_2265FB360()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_2265FB370()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_2265FB380()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_2265FB390()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_2265FB3A0()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_2265FB3B0()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_2265FB3C0()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_2265FB3D0()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_2265FB3E0()
{
  return MEMORY[0x270F9DD30]();
}

uint64_t sub_2265FB3F0()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_2265FB400()
{
  return MEMORY[0x270FA1EB0]();
}

uint64_t sub_2265FB410()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_2265FB420()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_2265FB460()
{
  return MEMORY[0x270FA2050]();
}

uint64_t sub_2265FB470()
{
  return MEMORY[0x270F6BB48]();
}

uint64_t sub_2265FB480()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_2265FB490()
{
  return MEMORY[0x270EF1D50]();
}

uint64_t sub_2265FB4A0()
{
  return MEMORY[0x270F66208]();
}

uint64_t sub_2265FB4B0()
{
  return MEMORY[0x270F66210]();
}

uint64_t sub_2265FB4C0()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_2265FB4D0()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_2265FB4E0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_2265FB4F0()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_2265FB500()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_2265FB510()
{
  return MEMORY[0x270FA0C78]();
}

uint64_t sub_2265FB520()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_2265FB530()
{
  return MEMORY[0x270FA0D88]();
}

uint64_t sub_2265FB540()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_2265FB550()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_2265FB560()
{
  return MEMORY[0x270F6F4D8]();
}

uint64_t sub_2265FB570()
{
  return MEMORY[0x270F6F4E0]();
}

uint64_t sub_2265FB580()
{
  return MEMORY[0x270FA2E90]();
}

uint64_t sub_2265FB590()
{
  return MEMORY[0x270FA2EA8]();
}

uint64_t sub_2265FB5A0()
{
  return MEMORY[0x270FA2EB8]();
}

uint64_t sub_2265FB5B0()
{
  return MEMORY[0x270FA0F00]();
}

uint64_t sub_2265FB5C0()
{
  return MEMORY[0x270FA0F28]();
}

uint64_t sub_2265FB5D0()
{
  return MEMORY[0x270EF20F8]();
}

uint64_t sub_2265FB5E0()
{
  return MEMORY[0x270EF2210]();
}

uint64_t sub_2265FB5F0()
{
  return MEMORY[0x270FA2ED0]();
}

uint64_t sub_2265FB600()
{
  return MEMORY[0x270FA2F00]();
}

uint64_t sub_2265FB610()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_2265FB620()
{
  return MEMORY[0x270F9E468]();
}

uint64_t sub_2265FB630()
{
  return MEMORY[0x270F9E470]();
}

uint64_t sub_2265FB640()
{
  return MEMORY[0x270F9E518]();
}

uint64_t sub_2265FB650()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_2265FB660()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_2265FB670()
{
  return MEMORY[0x270EF23D8]();
}

uint64_t sub_2265FB680()
{
  return MEMORY[0x270EF23E8]();
}

uint64_t sub_2265FB690()
{
  return MEMORY[0x270EF2428]();
}

uint64_t sub_2265FB6A0()
{
  return MEMORY[0x270EF2478]();
}

uint64_t sub_2265FB6B0()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t sub_2265FB6C0()
{
  return MEMORY[0x270EF2560]();
}

uint64_t sub_2265FB6D0()
{
  return MEMORY[0x270EF2568]();
}

uint64_t sub_2265FB6E0()
{
  return MEMORY[0x270EF25B0]();
}

uint64_t sub_2265FB6F0()
{
  return MEMORY[0x270FA13A0]();
}

uint64_t sub_2265FB700()
{
  return MEMORY[0x270F9E658]();
}

uint64_t sub_2265FB710()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_2265FB720()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_2265FB730()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_2265FB740()
{
  return MEMORY[0x270F9E7F8]();
}

uint64_t sub_2265FB750()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_2265FB760()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_2265FB770()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_2265FB790()
{
  return MEMORY[0x270F9E9A0]();
}

uint64_t sub_2265FB7A0()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_2265FB7B0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_2265FB7C0()
{
  return MEMORY[0x270F9E9E8]();
}

uint64_t sub_2265FB7D0()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_2265FB7E0()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_2265FB7F0()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_2265FB800()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_2265FB810()
{
  return MEMORY[0x270F9EB30]();
}

uint64_t sub_2265FB820()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_2265FB830()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_2265FB840()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_2265FB850()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_2265FB860()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_2265FB870()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_2265FB880()
{
  return MEMORY[0x270F9EF08]();
}

uint64_t sub_2265FB890()
{
  return MEMORY[0x270F9EF20]();
}

uint64_t sub_2265FB8A0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_2265FB8B0()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_2265FB8C0()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_2265FB8D0()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_2265FB8E0()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_2265FB8F0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_2265FB910()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_2265FB930()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_2265FB940()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_2265FB950()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_2265FB960()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_2265FB970()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_2265FB980()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_2265FB990()
{
  return MEMORY[0x270F9F2F8]();
}

uint64_t sub_2265FB9A0()
{
  return MEMORY[0x270F9F308]();
}

uint64_t sub_2265FB9B0()
{
  return MEMORY[0x270F9F310]();
}

uint64_t sub_2265FB9C0()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_2265FB9D0()
{
  return MEMORY[0x270F9F358]();
}

uint64_t sub_2265FB9E0()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_2265FB9F0()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_2265FBA00()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_2265FBA10()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_2265FBA20()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_2265FBA30()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_2265FBA40()
{
  return MEMORY[0x270F9F438]();
}

uint64_t sub_2265FBA50()
{
  return MEMORY[0x270F9F448]();
}

uint64_t sub_2265FBA70()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_2265FBA80()
{
  return MEMORY[0x270F9F498]();
}

uint64_t sub_2265FBA90()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_2265FBAA0()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_2265FBAB0()
{
  return MEMORY[0x270F9F790]();
}

uint64_t sub_2265FBAC0()
{
  return MEMORY[0x270F9F7C8]();
}

uint64_t sub_2265FBAD0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_2265FBAF0()
{
  return MEMORY[0x270F9F920]();
}

uint64_t sub_2265FBB00()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_2265FBB10()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_2265FBB20()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_2265FBB30()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_2265FBB40()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_2265FBB50()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_2265FBB60()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_2265FBB70()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_2265FBB80()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_2265FBB90()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_2265FBBA0()
{
  return MEMORY[0x270F9FC78]();
}

uint64_t sub_2265FBBB0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_2265FBBC0()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_2265FBBD0()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_2265FBBE0()
{
  return MEMORY[0x270F9FDE0]();
}

uint64_t sub_2265FBBF0()
{
  return MEMORY[0x270F9FE78]();
}

uint64_t sub_2265FBC00()
{
  return MEMORY[0x270F9FF20]();
}

uint64_t sub_2265FBC10()
{
  return MEMORY[0x270F9FF30]();
}

uint64_t sub_2265FBC20()
{
  return MEMORY[0x270F9FF38]();
}

uint64_t sub_2265FBC50()
{
  return MEMORY[0x270FA0128]();
}

uint64_t AFDeviceSupportsSAE()
{
  return MEMORY[0x270F0ECD8]();
}

uint64_t AFMontaraRestricted()
{
  return MEMORY[0x270F0EE38]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

CFURLRef CFBundleCopyResourceURL(CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName)
{
  return (CFURLRef)MEMORY[0x270EE4590](bundle, resourceName, resourceType, subDirName);
}

CFPropertyListRef CFPropertyListCreateDeepCopy(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFOptionFlags mutabilityOption)
{
  return (CFPropertyListRef)MEMORY[0x270EE4D20](allocator, propertyList, mutabilityOption);
}

void CFRelease(CFTypeRef cf)
{
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

uint64_t MGCopyAnswerWithError()
{
  return MEMORY[0x270F95FA8]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2AD0]();
}

void NSLog(NSString *format, ...)
{
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x270EF2BD8](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x270EF2C28](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C48]();
}

uint64_t SiriAnalyticsMachAbsoluteTimeGetNanoseconds()
{
  return MEMORY[0x270F639B8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFBundleCreateUnique()
{
  return MEMORY[0x270EE55C0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t sirinluexternal::UsoGraph::UsoGraph(sirinluexternal::UsoGraph *this)
{
  return MEMORY[0x270F6BB50](this);
}

void sirinluexternal::UsoGraph::~UsoGraph(sirinluexternal::UsoGraph *this)
{
}

uint64_t PB::Writer::Writer(PB::Writer *this)
{
  return MEMORY[0x270F588A0](this);
}

void PB::Writer::~Writer(PB::Writer *this)
{
}

uint64_t siri::ontology::UsoGraphNode::setSuccessor()
{
  return MEMORY[0x270F6F4E8]();
}

uint64_t siri::ontology::UsoEntityNode::addEntitySpan()
{
  return MEMORY[0x270F6F4F0]();
}

uint64_t siri::ontology::UsoEntityNode::addIdentifier()
{
  return MEMORY[0x270F6F4F8]();
}

{
  return MEMORY[0x270F6F500]();
}

uint64_t siri::ontology::UsoEntityNode::addUtteranceAlignment(siri::ontology::UsoEntityNode *this)
{
  return MEMORY[0x270F6F508](this);
}

uint64_t siri::ontology::UsoEntityNode::addUtteranceAlignment()
{
  return MEMORY[0x270F6F510]();
}

uint64_t siri::ontology::UsoEntitySpan::addSpanProperty()
{
  return MEMORY[0x270F6F518]();
}

uint64_t siri::ontology::UsoVocabManager::createCustomEdgeName()
{
  return MEMORY[0x270F6F520]();
}

uint64_t siri::ontology::UsoVocabManager::createCustomVerbName()
{
  return MEMORY[0x270F6F528]();
}

uint64_t siri::ontology::UsoVocabManager::createCustomEntityName()
{
  return MEMORY[0x270F6F530]();
}

uint64_t siri::ontology::UsoGraphProtoWriter::toProtobuf()
{
  return MEMORY[0x270F6BB68]();
}

uint64_t siri::ontology::getSharedUsoVocabManager(siri::ontology *this)
{
  return MEMORY[0x270F6F538](this);
}

uint64_t siri::ontology::resetSharedUsoVocabManager(siri::ontology *this)
{
  return MEMORY[0x270F6F540](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_App(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F548](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_name(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F558](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_task(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F560](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Reference_run(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F568](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_Person(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F570](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_label(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F578](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_value(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F588](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_Decimal(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F590](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_Integer(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F598](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_Setting(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F5A0](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_entity(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F5B0](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_target(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F5B8](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_reference(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F5E8](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_PhoneNumber(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F5F0](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_EmailAddress(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F600](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F608](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_VoiceCommand(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F628](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_MixedFraction(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F638](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_definedValue(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F648](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_integerValue(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F650](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_AttachmentType(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F658](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ContactAddress(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F660](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_DeviceCategory(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F668](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_numeratorValue(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F688](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_canonicalString(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F690](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition_Last(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F698](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition_Next(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F6A0](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_denominatorValue(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F6B0](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_relationshipType(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F6B8](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_AttachmentType_App(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F6C0](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_AttachmentType_URL(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F6C8](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition_Fifth(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F6D0](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition_First(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F6D8](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition_Ninth(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F6E0](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition_Sixth(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F6E8](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition_Tenth(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F6F0](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition_Third(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F6F8](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_PersonRelationship(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F700](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_offsetToReference(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F708](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_AttachmentType_Book(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F710](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_AttachmentType_Show(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F718](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_AttachmentType_Song(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F720](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition_Eighth(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F728](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition_Fourth(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F730](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition_Middle(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F738](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition_Second(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F740](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_AttachmentType_Album(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F748](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_AttachmentType_Email(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F750](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_AttachmentType_Movie(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F758](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_AttachmentType_Photo(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F760](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_AttachmentType_Video(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F768](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition_Current(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F770](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition_Seventh(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F778](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition_Twelfth(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F780](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition_Eleventh(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F788](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition_Previous(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F790](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::appleMessage_MessageAttribute(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F798](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_AttachmentType_Article(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F7A0](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_AttachmentType_Episode(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F7A8](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_AttachmentType_Podcast(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F7B0](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_AttachmentType_Webpage(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F7B8](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition_Fifteenth(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F7C0](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition_Sixteenth(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F7C8](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition_Twentieth(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F7D0](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_AttachmentType_Document(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F7D8](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_AttachmentType_Location(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F7E0](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_AttachmentType_Playlist(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F7E8](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition_Eighteenth(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F7F0](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition_Fourteenth(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F7F8](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition_Nineteenth(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F800](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition_Thirteenth(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F808](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition_Seventeenth(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F810](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition_ThirdToLast(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F818](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition_TwentyFifth(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F820](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition_TwentyFirst(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F828](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition_TwentyThird(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F830](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_identifyingRelationship(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F838](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_AttachmentType_MyLocation(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F840](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_AttachmentType_Screenshot(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F848](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition_SecondToLast(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F850](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition_TwentyFourth(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F858](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ListPosition_TwentySecond(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F860](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_specifyingContactAddress(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F868](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_AttachmentType_PhoneNumber(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F870](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_AttachmentType_AudioMessage(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F878](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_AttachmentType_CurrencyAmount(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F880](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::appleMessage_MessageAttribute_SmsAttributesNew(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F888](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::appleMessage_MessageAttribute_SmsAttributesRead(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F890](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::appleMessage_MessageAttribute_SmsAttributesSent(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F898](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::appleMessage_MessageAttribute_SmsAttributesSaved(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F8A0](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::appleMessage_MessageAttribute_SmsAttributesLatest(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F8A8](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::appleMessage_MessageAttribute_SmsAttributesUnread(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F8B0](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::appleMessage_MessageAttribute_SmsAttributesFlagged(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F8B8](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::appleMessage_MessageAttribute_SmsAttributesSubject(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F8C0](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::appleMessage_MessageAttribute_SmsAttributesTapback(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F8C8](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::appleMessage_MessageAttribute_SmsAttributesUnsaved(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F8D0](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::appleMessage_MessageAttribute_SmsAttributesReceived(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F8D8](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::appleMessage_MessageAttribute_SmsAttributesUnflagged(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F8E0](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::appleMessage_MessageAttribute_SmsAttributesAttachment(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F8E8](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::appleMessage_MessageAttribute_SmsAttributesEchoEffect(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F8F0](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::appleMessage_MessageAttribute_SmsAttributesLoudEffect(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F8F8](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::appleMessage_MessageAttribute_SmsAttributesLoveEffect(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F900](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::appleMessage_MessageAttribute_SmsAttributesSlamEffect(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F908](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::appleMessage_MessageAttribute_SmsAttributesHandwritten(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F910](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::appleMessage_MessageAttribute_SmsAttributesDigitalTouch(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F918](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::appleMessage_MessageAttribute_SmsAttributesGentleEffect(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F920](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::appleMessage_MessageAttribute_SmsAttributesLasersEffect(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F928](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::appleMessage_MessageAttribute_SmsAttributesMusicSharing(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F930](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::appleMessage_MessageAttribute_SmsAttributesBalloonsEffect(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F938](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::appleMessage_MessageAttribute_SmsAttributesConfettiEffect(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F940](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::appleMessage_MessageAttribute_SmsAttributesFireworksEffect(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F948](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::appleMessage_MessageAttribute_SmsAttributesSpotlightEffect(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F950](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::appleMessage_MessageAttribute_SmsAttributesCelebrationEffect(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F958](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::appleMessage_MessageAttribute_SmsAttributesInvisibleInkEffect(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F960](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::appleMessage_MessageAttribute_SmsAttributesShootingStarEffect(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F968](this);
}

uint64_t siri::ontology::UsoGraph::createIntNode()
{
  return MEMORY[0x270F6F970]();
}

uint64_t siri::ontology::UsoGraph::createTaskNode()
{
  return MEMORY[0x270F6F978]();
}

uint64_t siri::ontology::UsoGraph::createEntityNode()
{
  return MEMORY[0x270F6F980]();
}

uint64_t siri::ontology::UsoGraph::createStringNode()
{
  return MEMORY[0x270F6F988]();
}

uint64_t siri::ontology::UsoGraph::UsoGraph()
{
  return MEMORY[0x270F6F990]();
}

void siri::ontology::UsoGraph::~UsoGraph(siri::ontology::UsoGraph *this)
{
}

uint64_t marisa::Trie::mmap(marisa::Trie *this, const char *a2)
{
  return MEMORY[0x270F99C30](this, a2);
}

uint64_t marisa::Trie::build(marisa::Trie *this, marisa::Keyset *a2)
{
  return MEMORY[0x270F99C38](this, a2);
}

uint64_t marisa::Trie::clear(marisa::Trie *this)
{
  return MEMORY[0x270F99C40](this);
}

uint64_t marisa::Trie::Trie(marisa::Trie *this)
{
  return MEMORY[0x270F99C48](this);
}

void marisa::Trie::~Trie(marisa::Trie *this)
{
}

uint64_t marisa::Agent::set_query(marisa::Agent *this, const char *a2)
{
  return MEMORY[0x270F99C58](this, a2);
}

uint64_t marisa::Agent::set_query(marisa::Agent *this)
{
  return MEMORY[0x270F99C60](this);
}

uint64_t marisa::Agent::Agent(marisa::Agent *this)
{
  return MEMORY[0x270F99C68](this);
}

void marisa::Agent::~Agent(marisa::Agent *this)
{
}

uint64_t marisa::Keyset::push_back(marisa::Keyset *this, const char *a2)
{
  return MEMORY[0x270F99C78](this, a2);
}

uint64_t marisa::Keyset::push_back(marisa::Keyset *this, const char *a2, float a3)
{
  return MEMORY[0x270F99C80](this, a2, a3);
}

uint64_t marisa::Keyset::Keyset(marisa::Keyset *this)
{
  return MEMORY[0x270F99C88](this);
}

uint64_t morphun::TokenIterator::TokenIterator()
{
  return MEMORY[0x270F99F30]();
}

uint64_t morphun::TokenIterator::operator++()
{
  return MEMORY[0x270F99F38]();
}

uint64_t morphun::TokenizerFactory::createTokenizer(morphun::TokenizerFactory *this, const ULocale *a2)
{
  return MEMORY[0x270F99F40](this, a2);
}

uint64_t morphun::util::ULocale::ULocale()
{
  return MEMORY[0x270F99F60]();
}

void morphun::util::ULocale::~ULocale(morphun::util::ULocale *this)
{
}

uint64_t morphun::analysis::DefaultAnalyzerFactory::DefaultAnalyzerFactory(morphun::analysis::DefaultAnalyzerFactory *this)
{
  return MEMORY[0x270F99F78](this);
}

uint64_t morphun::Tokenizer::setMaxTokens(morphun::Tokenizer *this)
{
  return MEMORY[0x270F99F88](this);
}

uint64_t morphun::Tokenizer::setMaxInputSize(morphun::Tokenizer *this)
{
  return MEMORY[0x270F99F90](this);
}

uint64_t morphun::resources::DataRegistrationService::registerDataPathForLocale()
{
  return MEMORY[0x270F99F98]();
}

uint64_t sirinluexternal::UsoGraph::writeTo(sirinluexternal::UsoGraph *this, PB::Writer *a2)
{
  return MEMORY[0x270F6BB70](this, a2);
}

uint64_t siri::ontology::UsoEntityNode::getEntitySpans(siri::ontology::UsoEntityNode *this)
{
  return MEMORY[0x270F6F9A0](this);
}

uint64_t siri::ontology::UsoGraph::prettyPrint()
{
  return MEMORY[0x270F6F9A8]();
}

uint64_t siri::ontology::UsoGraph::getNodes(siri::ontology::UsoGraph *this)
{
  return MEMORY[0x270F6F9B0](this);
}

uint64_t marisa::Trie::reverse_lookup(marisa::Trie *this, marisa::Agent *a2)
{
  return MEMORY[0x270F99C90](this, a2);
}

uint64_t marisa::Trie::predictive_search(marisa::Trie *this, marisa::Agent *a2)
{
  return MEMORY[0x270F99C98](this, a2);
}

uint64_t marisa::Trie::save(marisa::Trie *this, const char *a2)
{
  return MEMORY[0x270F99CA0](this, a2);
}

uint64_t marisa::Trie::size(marisa::Trie *this)
{
  return MEMORY[0x270F99CA8](this);
}

uint64_t marisa::Trie::empty(marisa::Trie *this)
{
  return MEMORY[0x270F99CB0](this);
}

uint64_t marisa::Trie::lookup(marisa::Trie *this, marisa::Agent *a2)
{
  return MEMORY[0x270F99CB8](this, a2);
}

uint64_t marisa::Trie::num_keys(marisa::Trie *this)
{
  return MEMORY[0x270F99CC0](this);
}

uint64_t morphun::TokenIterator::operator*()
{
  return MEMORY[0x270F99FA8]();
}

uint64_t morphun::TokenIterator::operator!=()
{
  return MEMORY[0x270F99FB0]();
}

uint64_t morphun::TokenIterator::operator->()
{
  return MEMORY[0x270F99FB8]();
}

uint64_t morphun::Token::isWhitespace(morphun::Token *this)
{
  return MEMORY[0x270F99FC0](this);
}

uint64_t morphun::Token::getCleanValue(morphun::Token *this)
{
  return MEMORY[0x270F99FC8](this);
}

uint64_t morphun::Token::isSignificant(morphun::Token *this)
{
  return MEMORY[0x270F99FD0](this);
}

uint64_t morphun::Token::isHead(morphun::Token *this)
{
  return MEMORY[0x270F99FD8](this);
}

uint64_t morphun::Token::isTail(morphun::Token *this)
{
  return MEMORY[0x270F99FE0](this);
}

uint64_t morphun::Token::getNext(morphun::Token *this)
{
  return MEMORY[0x270F99FE8](this);
}

uint64_t morphun::Token::getValue(morphun::Token *this)
{
  return MEMORY[0x270F99FF0](this);
}

uint64_t std::stringbuf::str()
{
  return MEMORY[0x270F98268]();
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

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x270F984B8](this, __s);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x270F98560](this, __str);
}

uint64_t std::ostream::put()
{
  return MEMORY[0x270F98740]();
}

uint64_t std::ostream::flush()
{
  return MEMORY[0x270F98748]();
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

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x270F987A8]();
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x270F98870]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x270F988A8]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x270F988B0]();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
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

void std::terminate(void)
{
}

void operator delete[]()
{
  while (1)
    ;
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

void operator new[]()
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

void __cxa_guard_abort(__guard *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x270F98F10](a1);
}

void __cxa_guard_release(__guard *a1)
{
}

void __cxa_rethrow(void)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

void *__dynamic_cast(const void *lpsrc, const struct __class_type_info *lpstype, const struct __class_type_info *lpdtype, ptrdiff_t s2d)
{
  return (void *)MEMORY[0x270F98F30](lpsrc, lpstype, lpdtype, s2d);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x270ED85F8](*(void *)&__upper_bound);
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x270ED9278](flags, block);
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x270ED9280](flags, *(void *)&qos_class, *(void *)&relative_priority, block);
}

void dispatch_block_perform(dispatch_block_flags_t flags, dispatch_block_t block)
{
}

intptr_t dispatch_block_wait(dispatch_block_t block, dispatch_time_t timeout)
{
  return MEMORY[0x270ED92B0](block, timeout);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x270ED9378](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

uintptr_t dispatch_source_get_data(dispatch_source_t source)
{
  return MEMORY[0x270ED9518](source);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x270ED9628](__path, *(void *)&__mode);
}

float expf(float a1)
{
  MEMORY[0x270ED9870](a1);
  return result;
}

void free(void *a1)
{
}

long double log(long double __x)
{
  MEMORY[0x270EDA0A8](__x);
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
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

void objc_exception_rethrow(void)
{
}

void objc_exception_throw(id exception)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x270F9A648](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x270EDAA58](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x270EDAA60](log);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x270EDAA90]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x270EDAB40]();
}

int printf(const char *a1, ...)
{
  return MEMORY[0x270EDAD20](a1);
}

int puts(const char *a1)
{
  return MEMORY[0x270EDB098](a1);
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x270EDB2C0]();
}

uint64_t skitRemoveBidiCharacters()
{
  return MEMORY[0x270F9B420]();
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x270EDB5A8](__s, *(void *)&__c);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB708](__str, __endptr, *(void *)&__base);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB718](__str, __endptr, *(void *)&__base);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x270FA01D0]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x270FA01D8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x270FA0218]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x270FA2408]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x270FA2420]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x270FA2428]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x270FA0330]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x270FA03C8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x270FA0458]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x270FA0460]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x270FA0470]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isClassType()
{
  return MEMORY[0x270FA0490]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x270FA0498]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x270FA04D8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_projectBox()
{
  return MEMORY[0x270FA04F8]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x270FA0528]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x270FA0538]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x270FA0550]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x270FA0568]();
}

uint64_t swift_stdlib_random()
{
  return MEMORY[0x270FA0570]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x270FA2458]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x270FA0598]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x270FA05A8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x270FA0648]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x270FA0650]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x270FA0658]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}

void vDSP_mmul(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Stride __IC, vDSP_Length __M, vDSP_Length __N, vDSP_Length __P)
{
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x270EDBD38](xarray);
}

const char *__cdecl xpc_array_get_string(xpc_object_t xarray, size_t index)
{
  return (const char *)MEMORY[0x270EDBD70](xarray, index);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDC040](xdict, key);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC050](xdict, key);
}

xpc_object_t xpc_dictionary_get_dictionary(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDC078](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x270EDC0A8](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}