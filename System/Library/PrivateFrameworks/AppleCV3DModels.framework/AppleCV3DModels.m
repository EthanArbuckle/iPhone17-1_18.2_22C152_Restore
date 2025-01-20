uint64_t CV3DModelsCreateObjectRegionProposalModelData()
{
  char *v0;
  char *v1;
  long long v2;
  uint64_t v3;
  std::string *v4;
  long long v5;
  void **v6;
  std::string::size_type v7;
  std::string *v8;
  long long v9;
  std::string *v10;
  long long v11;
  void **v12;
  std::string::size_type v13;
  std::string *v14;
  long long v15;
  void **v16;
  void *v17;
  std::string *v18;
  void *v19;
  uint64_t v20;
  void *v22[2];
  unsigned __int8 v23;
  void *v24[2];
  unsigned __int8 v25;
  std::string v26;
  char v27;
  std::string __p;
  std::string v29;
  std::string v30;
  char v31;
  void *v32[2];
  void v33[11];
  char v34;
  uint64_t v35;
  std::string v36;
  void v37[4];
  void v38[5];

  v38[4] = *MEMORY[0x263EF8340];
  v0 = (char *)operator new(0x40uLL);
  v36.__r_.__value_.__r.__words[0] = (std::string::size_type)v0;
  *(_OWORD *)&v36.__r_.__value_.__r.__words[1] = xmmword_21B5E38E0;
  strcpy(v0, "CV3D_ODT_ObjectRegionProposalModel_Model/model.espresso.net");
  sub_21B5E1154((uint64_t)v32);
  v29.__r_.__value_.__r.__words[0] = (std::string::size_type)operator new(0x30uLL);
  *(_OWORD *)&v29.__r_.__value_.__r.__words[1] = xmmword_21B5E38F0;
  strcpy(v29.__r_.__value_.__l.__data_, "com.apple.cv3d.ODT.ObjectRegionProposalModel");
  v1 = (char *)operator new(0x40uLL);
  *(_OWORD *)&__p.__r_.__value_.__r.__words[1] = xmmword_21B5E3900;
  v2 = *((_OWORD *)v0 + 1);
  *(_OWORD *)(v1 + 1) = *(_OWORD *)v0;
  __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v1;
  *v1 = 47;
  *(_OWORD *)(v1 + 17) = v2;
  *(_OWORD *)(v1 + 33) = *((_OWORD *)v0 + 2);
  *(_OWORD *)(v1 + 44) = *(_OWORD *)(v0 + 43);
  v1[60] = 0;
  sub_21B5E2080((uint64_t)&v29, (std::string::size_type)&__p, v33, 1, &v30);
  if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if ((SHIBYTE(v29.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    operator delete(v29.__r_.__value_.__l.__data_);
    if (v31) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v29.__r_.__value_.__r.__words[2]) < 0) {
    goto LABEL_6;
  }
LABEL_3:
  if (v31)
  {
LABEL_4:
    v26 = v30;
    v27 = 1;
    goto LABEL_12;
  }
LABEL_7:
  v29.__r_.__value_.__r.__words[0] = (std::string::size_type)operator new(0x20uLL);
  *(_OWORD *)&v29.__r_.__value_.__r.__words[1] = xmmword_21B5E3910;
  strcpy(v29.__r_.__value_.__l.__data_, "com.apple.AppleCV3D.models");
  sub_21B5E2080((uint64_t)&v29, (std::string::size_type)&v36, v33, 1, &v26);
  if (SHIBYTE(v29.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v29.__r_.__value_.__l.__data_);
  }
  if (v31 && SHIBYTE(v30.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v30.__r_.__value_.__l.__data_);
  }
LABEL_12:
  v32[0] = *(void **)MEMORY[0x263F8C2B8];
  v3 = *(void *)(MEMORY[0x263F8C2B8] + 72);
  *(void **)((char *)v32 + *((void *)v32[0] - 3)) = *(void **)(MEMORY[0x263F8C2B8] + 64);
  v33[0] = v3;
  v33[1] = MEMORY[0x263F8C318] + 16;
  if (v34 < 0) {
    operator delete((void *)v33[9]);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x21D491160](&v35);
  if ((SHIBYTE(v36.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if (v27) {
      goto LABEL_16;
    }
    return 0;
  }
  operator delete(v36.__r_.__value_.__l.__data_);
  if (!v27) {
    return 0;
  }
LABEL_16:
  sub_21B5E1028(&dword_21B5E3920);
  v4 = std::string::append(&__p, ".", 1uLL);
  v5 = *(_OWORD *)&v4->__r_.__value_.__l.__data_;
  v29.__r_.__value_.__r.__words[2] = v4->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v29.__r_.__value_.__l.__data_ = v5;
  v4->__r_.__value_.__l.__size_ = 0;
  v4->__r_.__value_.__r.__words[2] = 0;
  v4->__r_.__value_.__r.__words[0] = 0;
  sub_21B5E1028(&dword_21B5E3924);
  if ((v25 & 0x80u) == 0) {
    v6 = v24;
  }
  else {
    v6 = (void **)v24[0];
  }
  if ((v25 & 0x80u) == 0) {
    v7 = v25;
  }
  else {
    v7 = (std::string::size_type)v24[1];
  }
  v8 = std::string::append(&v29, (const std::string::value_type *)v6, v7);
  v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
  v36.__r_.__value_.__r.__words[2] = v8->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v36.__r_.__value_.__l.__data_ = v9;
  v8->__r_.__value_.__l.__size_ = 0;
  v8->__r_.__value_.__r.__words[2] = 0;
  v8->__r_.__value_.__r.__words[0] = 0;
  v10 = std::string::append(&v36, ".", 1uLL);
  v11 = *(_OWORD *)&v10->__r_.__value_.__l.__data_;
  v30.__r_.__value_.__r.__words[2] = v10->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v30.__r_.__value_.__l.__data_ = v11;
  v10->__r_.__value_.__l.__size_ = 0;
  v10->__r_.__value_.__r.__words[2] = 0;
  v10->__r_.__value_.__r.__words[0] = 0;
  sub_21B5E1028((unsigned int *)&unk_21B5E3928);
  if ((v23 & 0x80u) == 0) {
    v12 = v22;
  }
  else {
    v12 = (void **)v22[0];
  }
  if ((v23 & 0x80u) == 0) {
    v13 = v23;
  }
  else {
    v13 = (std::string::size_type)v22[1];
  }
  v14 = std::string::append(&v30, (const std::string::value_type *)v12, v13);
  v15 = *(_OWORD *)&v14->__r_.__value_.__l.__data_;
  v33[0] = *((void *)&v14->__r_.__value_.__l + 2);
  *(_OWORD *)v32 = v15;
  v14->__r_.__value_.__l.__size_ = 0;
  v14->__r_.__value_.__r.__words[2] = 0;
  v14->__r_.__value_.__r.__words[0] = 0;
  if ((char)v23 < 0)
  {
    operator delete(v22[0]);
    if ((SHIBYTE(v30.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
LABEL_30:
      if ((SHIBYTE(v36.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
        goto LABEL_31;
      }
      goto LABEL_50;
    }
  }
  else if ((SHIBYTE(v30.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    goto LABEL_30;
  }
  operator delete(v30.__r_.__value_.__l.__data_);
  if ((SHIBYTE(v36.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
LABEL_31:
    if (((char)v25 & 0x80000000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_51;
  }
LABEL_50:
  operator delete(v36.__r_.__value_.__l.__data_);
  if (((char)v25 & 0x80000000) == 0)
  {
LABEL_32:
    if ((SHIBYTE(v29.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_33;
    }
LABEL_52:
    operator delete(v29.__r_.__value_.__l.__data_);
    if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_34;
    }
LABEL_53:
    operator delete(__p.__r_.__value_.__l.__data_);
    goto LABEL_34;
  }
LABEL_51:
  operator delete(v24[0]);
  if (SHIBYTE(v29.__r_.__value_.__r.__words[2]) < 0) {
    goto LABEL_52;
  }
LABEL_33:
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    goto LABEL_53;
  }
LABEL_34:
  v37[0] = @"version";
  if (v33[0] >= 0) {
    v16 = v32;
  }
  else {
    v16 = (void **)v32[0];
  }
  v17 = [NSString stringWithUTF8String:v16];
  v38[0] = v17;
  v38[1] = @"object_region_proposal_model";
  v37[1] = @"name";
  v37[2] = @"type";
  v38[2] = @"espresso_model_path";
  v37[3] = @"path";
  if ((v26.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v18 = &v26;
  }
  else {
    v18 = (std::string *)v26.__r_.__value_.__r.__words[0];
  }
  v19 = [NSString stringWithUTF8String:v18];
  v38[3] = v19;
  v20 = [NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:4];

  if (SHIBYTE(v33[0]) < 0) {
    operator delete(v32[0]);
  }
  if (v27 && SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v26.__r_.__value_.__l.__data_);
  }
  return v20;
}

void sub_21B5E0E48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,char a27,uint64_t a28,void *a29,uint64_t a30,int a31,__int16 a32,char a33,char a34,void *__p,uint64_t a36,int a37,__int16 a38,char a39,char a40,uint64_t a41,void *a42,uint64_t a43,int a44,__int16 a45,char a46,char a47,char a48,void *a49,uint64_t a50,int a51,__int16 a52,char a53,char a54)
{
  if (a40 < 0) {
    operator delete(__p);
  }
  if (a48 && a47 < 0) {
    operator delete(a42);
  }
  sub_21B5E1438((uint64_t)&a49);
  if (*(char *)(v54 - 105) < 0)
  {
    operator delete(*(void **)(v54 - 128));
    _Unwind_Resume(a1);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_21B5E1028(unsigned int *a1)
{
  int v3 = 0;
  std::to_string(&v4, *a1);
  v5[0] = v2;
  v5[1] = &v4;
  v5[2] = v2;
  v5[3] = &v4;
  v5[4] = &v4;
  v6 = v5;
  ((void (*)(void **, unsigned char *))off_26CB68708[0])(&v6, v2);
  if (SHIBYTE(v4.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v4.__r_.__value_.__l.__data_);
  }
  if (v3 == -1) {
    sub_21B5E16BC();
  }
  v5[0] = &v4;
  uint64_t result = ((uint64_t (*)(void *, unsigned char *))off_26CB68738[v3])(v5, v2);
  if (v3 != -1) {
    return ((uint64_t (*)(void *, unsigned char *))off_26CB68720[v3])(v5, v2);
  }
  return result;
}

void sub_21B5E1118(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_21B5E1660((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_21B5E1130(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19)
{
  if (a19 < 0) {
    operator delete(__p);
  }
  sub_21B5E1660((uint64_t)&a10);
  _Unwind_Resume(a1);
}

uint64_t sub_21B5E1154(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263F8C328] + 104;
  *(void *)(a1 + 128) = MEMORY[0x263F8C328] + 104;
  uint64_t v3 = a1 + 16;
  uint64_t v4 = MEMORY[0x263F8C328] + 64;
  *(void *)(a1 + 16) = MEMORY[0x263F8C328] + 64;
  v5 = (void *)MEMORY[0x263F8C2B8];
  uint64_t v6 = *(void *)(MEMORY[0x263F8C2B8] + 24);
  uint64_t v7 = *(void *)(MEMORY[0x263F8C2B8] + 16);
  *(void *)a1 = v7;
  *(void *)(a1 + *(void *)(v7 - 24)) = v6;
  *(void *)(a1 + 8) = 0;
  v8 = (std::ios_base *)(a1 + *(void *)(*(void *)a1 - 24));
  std::ios_base::init(v8, (void *)(a1 + 24));
  uint64_t v9 = MEMORY[0x263F8C328] + 24;
  v8[1].__vftable = 0;
  v8[1].__fmtflags_ = -1;
  uint64_t v10 = v5[5];
  uint64_t v11 = v5[4];
  *(void *)(a1 + 16) = v11;
  *(void *)(v3 + *(void *)(v11 - 24)) = v10;
  uint64_t v12 = v5[1];
  *(void *)a1 = v12;
  *(void *)(a1 + *(void *)(v12 - 24)) = v5[6];
  *(void *)a1 = v9;
  *(void *)(a1 + 128) = v2;
  *(void *)(a1 + 16) = v4;
  std::streambuf::basic_streambuf();
  *(void *)(a1 + 24) = MEMORY[0x263F8C318] + 16;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_DWORD *)(a1 + 120) = 24;
  return a1;
}

void sub_21B5E1404(_Unwind_Exception *a1)
{
  std::iostream::~basic_iostream();
  MEMORY[0x21D491160](v1);
  _Unwind_Resume(a1);
}

uint64_t sub_21B5E1438(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263F8C2B8];
  uint64_t v3 = *MEMORY[0x263F8C2B8];
  *(void *)a1 = *MEMORY[0x263F8C2B8];
  uint64_t v4 = *(void *)(v2 + 72);
  *(void *)(a1 + *(void *)(v3 - 24)) = *(void *)(v2 + 64);
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = MEMORY[0x263F8C318] + 16;
  if (*(char *)(a1 + 111) < 0) {
    operator delete(*(void **)(a1 + 88));
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x21D491160](a1 + 128);
  return a1;
}

void sub_21B5E1570()
{
}

void sub_21B5E1588(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_21B5E15E4(exception, a1);
  __cxa_throw(exception, (struct type_info *)off_2643AE4D0, MEMORY[0x263F8C060]);
}

void sub_21B5E15D0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_21B5E15E4(std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

void sub_21B5E1618()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

void sub_21B5E164C(void *a1)
{
}

uint64_t sub_21B5E1660(uint64_t a1)
{
  uint64_t v2 = *(unsigned int *)(a1 + 24);
  if (v2 != -1) {
    ((void (*)(char *, uint64_t))off_26CB68720[v2])(&v4, a1);
  }
  *(_DWORD *)(a1 + 24) = -1;
  return a1;
}

void sub_21B5E16BC()
{
  exception = __cxa_allocate_exception(8uLL);
  void *exception = MEMORY[0x263F8C3A8] + 16;
  __cxa_throw(exception, MEMORY[0x263F8C1F8], (void (*)(void *))std::exception::~exception);
}

__n128 sub_21B5E170C(__n128 ***a1)
{
  uint64_t v1 = **a1;
  uint64_t v2 = (*a1)[1];
  uint64_t v3 = v1[1].n128_u32[2];
  if (v3 != -1) {
    ((void (*)(char *, __n128 *))off_26CB68720[v3])(&v5, v1);
  }
  v1[1].n128_u32[2] = -1;
  __n128 result = *v2;
  v1[1].n128_u64[0] = v2[1].n128_u64[0];
  *uint64_t v1 = result;
  v2->n128_u64[1] = 0;
  v2[1].n128_u64[0] = 0;
  v2->n128_u64[0] = 0;
  v1[1].n128_u32[2] = 1;
  return result;
}

void sub_21B5E1788(uint64_t a1, uint64_t a2)
{
}

char *sub_21B5E1794(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(*(void *)a1 + 32);
  unint64_t v4 = *(void *)(a2 + 8);
  if (v4 >= *(void *)(a2 + 16))
  {
    __n128 result = sub_21B5E1CA8((void **)a2, v3);
    *(void *)(a2 + 8) = result;
  }
  else
  {
    long long v5 = *(_OWORD *)v3;
    *(void *)(v4 + 16) = *(void *)(v3 + 16);
    *(_OWORD *)unint64_t v4 = v5;
    *(void *)(v3 + 8) = 0;
    *(void *)(v3 + 16) = 0;
    *(void *)uint64_t v3 = 0;
    __n128 result = (char *)(v4 + 24);
    *(void *)(a2 + 8) = v4 + 24;
  }
  return result;
}

void sub_21B5E1804(uint64_t a1, uint64_t a2)
{
  if (*(char *)(a2 + 23) < 0) {
    operator delete(*(void **)a2);
  }
}

void sub_21B5E1818(uint64_t a1, void **a2)
{
  uint64_t v2 = (void **)*a2;
  if (*a2)
  {
    unint64_t v4 = (void **)a2[1];
    long long v5 = *a2;
    if (v4 == v2)
    {
      a2[1] = v2;
    }
    else
    {
      do
      {
        if (*((char *)v4 - 1) < 0) {
          operator delete(*(v4 - 3));
        }
        v4 -= 3;
      }
      while (v4 != v2);
      long long v5 = *a2;
      a2[1] = v2;
    }
    operator delete(v5);
  }
}

void sub_21B5E18C4(uint64_t *a1, uint64_t a2)
{
  v14[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  *(void *)((char *)v14 + 7) = *(void *)(a2 + 15);
  uint64_t v3 = *(void **)a2;
  v14[0] = *(void *)(a2 + 8);
  char v4 = *(unsigned char *)(a2 + 23);
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)a2 = 0;
  uint64_t v9 = v3;
  *(void *)uint64_t v10 = v14[0];
  *(void *)&v10[7] = *(void *)((char *)v14 + 7);
  char v11 = v4;
  memset(v14, 0, 15);
  uint64_t v5 = a1[1];
  uint64_t v6 = *(void *)(v5 + 16);
  *(_OWORD *)__p = *(_OWORD *)v5;
  uint64_t v13 = v6;
  *(void *)uint64_t v5 = 0;
  *(void *)(v5 + 8) = 0;
  *(void *)(v5 + 16) = 0;
  uint64_t v7 = *(unsigned int *)(v2 + 24);
  if (v7 != -1) {
    ((void (*)(char *, uint64_t))off_26CB68720[v7])(&v8, v2);
  }
  *(_DWORD *)(v2 + 24) = -1;
  sub_21B5E1A2C((void *)v2, (uint64_t)&v9, 2uLL);
  *(_DWORD *)(v2 + 24) = 2;
  if ((SHIBYTE(v13) & 0x80000000) == 0)
  {
    if ((v11 & 0x80000000) == 0) {
      return;
    }
LABEL_7:
    operator delete(v9);
    return;
  }
  operator delete(__p[0]);
  if (v11 < 0) {
    goto LABEL_7;
  }
}

void sub_21B5E19F0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a2) {
    sub_21B5E164C(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void *sub_21B5E1A2C(void *a1, uint64_t a2, unint64_t a3)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a3)
  {
    if (a3 >= 0xAAAAAAAAAAAAAABLL) {
      sub_21B5E1BF0();
    }
    uint64_t v5 = 24 * a3;
    uint64_t v6 = (char *)operator new(24 * a3);
    uint64_t v7 = 0;
    *a1 = v6;
    a1[1] = v6;
    a1[2] = &v6[v5];
    do
    {
      uint64_t v9 = &v6[v7];
      uint64_t v10 = (long long *)(a2 + v7);
      if (*(char *)(a2 + v7 + 23) < 0)
      {
        sub_21B5E1C08(v9, *(void **)v10, *((void *)v10 + 1));
      }
      else
      {
        long long v8 = *v10;
        *((void *)v9 + 2) = *((void *)v10 + 2);
        *(_OWORD *)uint64_t v9 = v8;
      }
      v7 += 24;
    }
    while (v5 != v7);
    a1[1] = &v6[v7];
  }
  return a1;
}

void sub_21B5E1B08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
}

void sub_21B5E1B1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  for (; v11; v11 -= 24)
  {
    if (*(char *)(v10 + v11 - 1) < 0) {
      operator delete(*(void **)(v10 + v11 - 24));
    }
  }
  *(void *)(v9 + 8) = v10;
  sub_21B5E1B58(&a9);
  _Unwind_Resume(a1);
}

void ***sub_21B5E1B58(void ***result)
{
  uint64_t v1 = result;
  if (!*((unsigned char *)result + 8))
  {
    uint64_t v2 = *result;
    uint64_t v3 = (void **)**result;
    if (v3)
    {
      char v4 = (void **)v2[1];
      uint64_t v5 = **result;
      if (v4 != v3)
      {
        do
        {
          if (*((char *)v4 - 1) < 0) {
            operator delete(*(v4 - 3));
          }
          v4 -= 3;
        }
        while (v4 != v3);
        uint64_t v5 = **v1;
      }
      v2[1] = v3;
      operator delete(v5);
      return v1;
    }
  }
  return result;
}

void sub_21B5E1BF0()
{
}

void *sub_21B5E1C08(unsigned char *__dst, void *__src, unint64_t a3)
{
  uint64_t v5 = __dst;
  if (a3 > 0x16)
  {
    if (a3 >= 0x7FFFFFFFFFFFFFF8) {
      sub_21B5E1570();
    }
    uint64_t v6 = (a3 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a3 | 7) != 0x17) {
      uint64_t v6 = a3 | 7;
    }
    uint64_t v7 = v6 + 1;
    long long v8 = operator new(v6 + 1);
    v5[1] = a3;
    v5[2] = v7 | 0x8000000000000000;
    void *v5 = v8;
    uint64_t v5 = v8;
  }
  else
  {
    __dst[23] = a3;
  }

  return memmove(v5, __src, a3 + 1);
}

char *sub_21B5E1CA8(void **a1, uint64_t a2)
{
  unint64_t v3 = 0xAAAAAAAAAAAAAAABLL * (((unsigned char *)a1[1] - (unsigned char *)*a1) >> 3);
  unint64_t v4 = v3 + 1;
  if (v3 + 1 > 0xAAAAAAAAAAAAAAALL) {
    sub_21B5E1BF0();
  }
  if (0x5555555555555556 * (((unsigned char *)a1[2] - (unsigned char *)*a1) >> 3) > v4) {
    unint64_t v4 = 0x5555555555555556 * (((unsigned char *)a1[2] - (unsigned char *)*a1) >> 3);
  }
  if (0xAAAAAAAAAAAAAAABLL * (((unsigned char *)a1[2] - (unsigned char *)*a1) >> 3) >= 0x555555555555555) {
    unint64_t v6 = 0xAAAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v6 = v4;
  }
  if (v6)
  {
    if (v6 > 0xAAAAAAAAAAAAAAALL) {
      sub_21B5E1618();
    }
    uint64_t v7 = (char *)operator new(24 * v6);
  }
  else
  {
    uint64_t v7 = 0;
  }
  long long v8 = &v7[24 * v3];
  uint64_t v9 = &v7[24 * v6];
  *(_OWORD *)long long v8 = *(_OWORD *)a2;
  *((void *)v8 + 2) = *(void *)(a2 + 16);
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)a2 = 0;
  uint64_t v10 = v8 + 24;
  uint64_t v11 = (char *)*a1;
  uint64_t v12 = (char *)a1[1];
  if (v12 == *a1)
  {
    *a1 = v8;
    a1[1] = v10;
    a1[2] = v9;
    if (!v12) {
      return v10;
    }
    goto LABEL_20;
  }
  do
  {
    long long v13 = *(_OWORD *)(v12 - 24);
    *((void *)v8 - 1) = *((void *)v12 - 1);
    *(_OWORD *)(v8 - 24) = v13;
    v8 -= 24;
    *((void *)v12 - 2) = 0;
    *((void *)v12 - 1) = 0;
    *((void *)v12 - 3) = 0;
    v12 -= 24;
  }
  while (v12 != v11);
  v14 = (char *)*a1;
  uint64_t v12 = (char *)a1[1];
  *a1 = v8;
  a1[1] = v10;
  a1[2] = v9;
  if (v12 != v14)
  {
    do
    {
      if (*(v12 - 1) < 0) {
        operator delete(*((void **)v12 - 3));
      }
      v12 -= 24;
    }
    while (v12 != v14);
    uint64_t v12 = v14;
  }
  if (v12) {
LABEL_20:
  }
    operator delete(v12);
  return v10;
}

void sub_21B5E1E14(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
}

__n128 sub_21B5E1E20@<Q0>(__n128 *a1@<X1>, __n128 *a2@<X8>)
{
  __n128 result = *a1;
  *a2 = *a1;
  a2[1].n128_u64[0] = a1[1].n128_u64[0];
  a1->n128_u64[1] = 0;
  a1[1].n128_u64[0] = 0;
  a1->n128_u64[0] = 0;
  return result;
}

void sub_21B5E1E3C(uint64_t *a1@<X1>, std::string *a2@<X8>, int64x2_t a3@<Q3>, int8x16_t a4@<Q5>)
{
}

void sub_21B5E1E4C(uint64_t a1@<X0>, uint64_t a2@<X1>, const std::string::value_type *a3@<X2>, std::string::size_type a4@<X3>, std::string *a5@<X8>, int64x2_t a6@<Q3>, int8x16_t a7@<Q5>)
{
  int64_t v12 = 0xAAAAAAAAAAAAAAABLL * ((a2 - a1) >> 3);
  if (v12 <= 1) {
    unint64_t v13 = 1;
  }
  else {
    unint64_t v13 = 0xAAAAAAAAAAAAAAABLL * ((a2 - a1) >> 3);
  }
  uint64_t v14 = (v13 - 1) * a4;
  uint64_t v15 = a2 - a1;
  if (a2 == a1)
  {
    uint64_t v16 = 0;
  }
  else
  {
    if ((unint64_t)(v15 - 24) >= 0x60)
    {
      unint64_t v18 = (v15 - 24) / 0x18uLL + 1;
      uint64_t v19 = v18 & 3;
      if ((v18 & 3) == 0) {
        uint64_t v19 = 4;
      }
      unint64_t v20 = v18 - v19;
      uint64_t v17 = a1 + 24 * v20;
      v21 = (unsigned __int8 *)(a1 + 47);
      int64x2_t v22 = 0uLL;
      v23.i64[0] = 255;
      v23.i64[1] = 255;
      int64x2_t v24 = 0uLL;
      do
      {
        a6.i8[0] = *(v21 - 24);
        a6.i8[4] = *v21;
        a7.i8[0] = v21[24];
        a7.i8[4] = v21[48];
        v25 = (const double *)(v21 - 39);
        v26 = (const double *)(v21 + 9);
        unsigned long long v27 = (unsigned __int128)vld3q_f64(v25);
        unsigned long long v28 = (unsigned __int128)vld3q_f64(v26);
        int32x2_t v29 = vcltz_s32(vshr_n_s32(vshl_n_s32(*(int32x2_t *)a6.i8, 0x18uLL), 0x18uLL));
        v30.i64[0] = v29.i32[0];
        v30.i64[1] = v29.i32[1];
        int8x16_t v31 = v30;
        int32x2_t v32 = vcltz_s32(vshr_n_s32(vshl_n_s32(*(int32x2_t *)a7.i8, 0x18uLL), 0x18uLL));
        v30.i64[0] = v32.i32[0];
        v30.i64[1] = v32.i32[1];
        int8x16_t v33 = v30;
        v30.i64[0] = a6.u32[0];
        v30.i64[1] = a6.u32[1];
        int8x16_t v34 = vbicq_s8(v30, v31);
        v30.i64[0] = a7.u32[0];
        v30.i64[1] = a7.u32[1];
        a6 = (int64x2_t)vorrq_s8(vandq_s8((int8x16_t)v27, v31), vandq_s8(v34, v23));
        a7 = vandq_s8((int8x16_t)v28, v33);
        int64x2_t v22 = vaddq_s64(a6, v22);
        int64x2_t v24 = vaddq_s64((int64x2_t)vorrq_s8(a7, vandq_s8(vbicq_s8(v30, v33), v23)), v24);
        v21 += 96;
        v20 -= 4;
      }
      while (v20);
      uint64_t v16 = vaddvq_s64(vaddq_s64(v24, v22));
    }
    else
    {
      uint64_t v16 = 0;
      uint64_t v17 = a1;
    }
    do
    {
      uint64_t v35 = *(unsigned __int8 *)(v17 + 23);
      if ((v35 & 0x80u) != 0) {
        uint64_t v35 = *(void *)(v17 + 8);
      }
      v16 += v35;
      v17 += 24;
    }
    while (v17 != a2);
  }
  a5->__r_.__value_.__r.__words[0] = 0;
  a5->__r_.__value_.__l.__size_ = 0;
  a5->__r_.__value_.__r.__words[2] = 0;
  std::string::reserve(a5, v16 + v14);
  if (v15 >= 1)
  {
    int v36 = *(char *)(a1 + 23);
    v37 = v36 >= 0 ? (const std::string::value_type *)a1 : *(const std::string::value_type **)a1;
    std::string::size_type v38 = v36 >= 0 ? *(unsigned __int8 *)(a1 + 23) : *(void *)(a1 + 8);
    std::string::append(a5, v37, v38);
    if ((unint64_t)v12 >= 2)
    {
      for (uint64_t i = a1 + 24; i != a2; i += 24)
      {
        std::string::append(a5, a3, a4);
        int v40 = *(char *)(i + 23);
        if (v40 >= 0) {
          v41 = (const std::string::value_type *)i;
        }
        else {
          v41 = *(const std::string::value_type **)i;
        }
        if (v40 >= 0) {
          std::string::size_type v42 = *(unsigned __int8 *)(i + 23);
        }
        else {
          std::string::size_type v42 = *(void *)(i + 8);
        }
        std::string::append(a5, v41, v42);
      }
    }
  }
}

void sub_21B5E205C(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_21B5E2080(uint64_t a1@<X0>, std::string::size_type a2@<X1>, void *a3@<X2>, char a4@<W3>, std::string *a5@<X8>)
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  if (*(char *)(a1 + 23) >= 0) {
    uint64_t v10 = a1;
  }
  else {
    uint64_t v10 = *(void *)a1;
  }
  uint64_t v11 = [NSString stringWithUTF8String:v10];
  int64_t v12 = (void *)[MEMORY[0x263F086E0] bundleWithIdentifier:v11];
  if (!v12)
  {
    if (a4)
    {
      unint64_t v18 = sub_21B5E2944(a3, (uint64_t)"Could not find bundle '", 23);
      int v19 = *(char *)(a1 + 23);
      if (v19 >= 0) {
        uint64_t v20 = a1;
      }
      else {
        uint64_t v20 = *(void *)a1;
      }
      if (v19 >= 0) {
        uint64_t v21 = *(unsigned __int8 *)(a1 + 23);
      }
      else {
        uint64_t v21 = *(void *)(a1 + 8);
      }
      int64x2_t v22 = sub_21B5E2944(v18, v20, v21);
      int8x16_t v23 = sub_21B5E2944(v22, (uint64_t)"'.", 2);
      std::ios_base::getloc((const std::ios_base *)((char *)v23 + *(void *)(*v23 - 24)));
      int64x2_t v24 = std::locale::use_facet((const std::locale *)&v52, MEMORY[0x263F8C108]);
      ((void (*)(const std::locale::facet *, uint64_t))v24->__vftable[2].~facet_0)(v24, 10);
      std::locale::~locale((std::locale *)&v52);
      std::ostream::put();
      std::ostream::flush();
    }
    a5->__r_.__value_.__s.__data_[0] = 0;
    a5[1].__r_.__value_.__s.__data_[0] = 0;
    return;
  }
  unint64_t v13 = (void *)[v12 resourcePath];
  if (!v13
    && sub_21B5E2CD8("/Library/Caches/com.apple.xbs/Sources/AppleCV3D_AppleCV3DModels/library/Essentials/Resource/src/Resource.cpp", 125, (uint64_t)"resources_path", 14, (uint64_t)&unk_21B5E3D07, 0, (void (*)(void **))sub_21B5E31AC))
  {
    abort();
  }
  uint64_t v14 = (const char *)[v13 UTF8String];
  size_t v15 = strlen(v14);
  if (v15 > 0x7FFFFFFFFFFFFFF7) {
    sub_21B5E1570();
  }
  size_t v16 = v15;
  if (v15 >= 0x17)
  {
    uint64_t v25 = (v15 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v15 | 7) != 0x17) {
      uint64_t v25 = v15 | 7;
    }
    uint64_t v26 = v25 + 1;
    p_dst = (void **)operator new(v25 + 1);
    size_t v48 = v16;
    int64_t v49 = v26 | 0x8000000000000000;
    __dst = p_dst;
    goto LABEL_23;
  }
  HIBYTE(v49) = v15;
  p_dst = (void **)&__dst;
  if (v15) {
LABEL_23:
  }
    memmove(p_dst, v14, v16);
  *((unsigned char *)p_dst + v16) = 0;
  int v27 = SHIBYTE(v49);
  if (v49 >= 0) {
    size_t v28 = HIBYTE(v49);
  }
  else {
    size_t v28 = v48;
  }
  unint64_t v29 = v28 + 10;
  if (v28 + 10 > 0x7FFFFFFFFFFFFFF7) {
    sub_21B5E1570();
  }
  if (v29 >= 0x17)
  {
    uint64_t v31 = (v29 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v29 | 7) != 0x17) {
      uint64_t v31 = v29 | 7;
    }
    uint64_t v32 = v31 + 1;
    int8x16_t v30 = operator new(v31 + 1);
    v50.__r_.__value_.__l.__size_ = v28 + 10;
    v50.__r_.__value_.__r.__words[2] = v32 | 0x8000000000000000;
    v50.__r_.__value_.__r.__words[0] = (std::string::size_type)v30;
  }
  else
  {
    memset(&v50, 0, sizeof(v50));
    int8x16_t v30 = &v50;
    *((unsigned char *)&v50.__r_.__value_.__s + 23) = v28 + 10;
    if (!v28) {
      goto LABEL_38;
    }
  }
  if (v27 >= 0) {
    int8x16_t v33 = (void **)&__dst;
  }
  else {
    int8x16_t v33 = __dst;
  }
  memmove(v30, v33, v28);
LABEL_38:
  strcpy((char *)v30 + v28, "/.disabled");
  v52.__pn_ = v50;
  std::__fs::filesystem::__status(&v52, 0);
  if (SHIBYTE(v52.__pn_.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v52.__pn_.__r_.__value_.__l.__data_);
  }
  if (v49 >= 0) {
    int8x16_t v34 = (const std::string::value_type *)&__dst;
  }
  else {
    int8x16_t v34 = (const std::string::value_type *)__dst;
  }
  if (v49 >= 0) {
    std::string::size_type v35 = HIBYTE(v49);
  }
  else {
    std::string::size_type v35 = v48;
  }
  v52.__pn_.__r_.__value_.__r.__words[0] = (std::string::size_type)v34;
  v52.__pn_.__r_.__value_.__l.__size_ = v35;
  uint64_t v36 = *(unsigned __int8 *)(a2 + 23);
  if ((v36 & 0x80u) == 0) {
    std::string::size_type v37 = a2;
  }
  else {
    std::string::size_type v37 = *(void *)a2;
  }
  if ((v36 & 0x80u) != 0) {
    uint64_t v36 = *(void *)(a2 + 8);
  }
  v52.__pn_.__r_.__value_.__r.__words[2] = v37;
  uint64_t v53 = v36;
  memset(&v50, 0, sizeof(v50));
  std::string::reserve(&v50, v35 + v36 + 1);
  std::string::append(&v50, v34, v35);
  for (uint64_t i = 0; i != 2; i += 2)
  {
    std::string::append(&v50, "/", 1uLL);
    std::string::append(&v50, (const std::string::value_type *)v52.__pn_.__r_.__value_.__r.__words[i + 2], *(void *)((char *)&v52 + i * 8 + 24));
  }
  memset(&v52, 0, sizeof(v52));
  std::string::size_type size = HIBYTE(v50.__r_.__value_.__r.__words[2]);
  if ((v50.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    int v40 = &v50;
  }
  else {
    int v40 = (std::string *)v50.__r_.__value_.__r.__words[0];
  }
  if ((v50.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    std::string::size_type size = v50.__r_.__value_.__l.__size_;
  }
  sub_21B5E263C((unint64_t)&v52, (char *)v40, (char *)v40 + size);
  std::__fs::filesystem::__status(&v52, 0);
  unsigned __int8 v41 = v51;
  if (SHIBYTE(v52.__pn_.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v52.__pn_.__r_.__value_.__l.__data_);
    int v42 = v41;
    if (!v41) {
      goto LABEL_64;
    }
  }
  else
  {
    int v42 = v51;
    if (!(_BYTE)v51) {
      goto LABEL_64;
    }
  }
  if (v42 != 255)
  {
    *a5 = v50;
    a5[1].__r_.__value_.__s.__data_[0] = 1;
    if (SHIBYTE(v49) < 0) {
      goto LABEL_76;
    }
    return;
  }
LABEL_64:
  if (a4)
  {
    v43 = sub_21B5E2944(a3, (uint64_t)"Resource at '", 13);
    if ((v50.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v44 = &v50;
    }
    else {
      v44 = (std::string *)v50.__r_.__value_.__r.__words[0];
    }
    if ((v50.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v45 = HIBYTE(v50.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v45 = v50.__r_.__value_.__l.__size_;
    }
    v46 = sub_21B5E2944(v43, (uint64_t)v44, v45);
    sub_21B5E2944(v46, (uint64_t)"' does not exist.", 17);
  }
  a5->__r_.__value_.__s.__data_[0] = 0;
  a5[1].__r_.__value_.__s.__data_[0] = 0;
  if ((SHIBYTE(v50.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if ((SHIBYTE(v49) & 0x80000000) == 0) {
      return;
    }
LABEL_76:
    operator delete(__dst);
    return;
  }
  operator delete(v50.__r_.__value_.__l.__data_);
  if (SHIBYTE(v49) < 0) {
    goto LABEL_76;
  }
}

void sub_21B5E25B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, std::locale a17)
{
}

void sub_21B5E25C8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  if (a28 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (a15 < 0) {
    operator delete(a10);
  }
  _Unwind_Resume(exception_object);
}

unint64_t sub_21B5E263C(unint64_t a1, char *__src, char *a3)
{
  int v6 = *(char *)(a1 + 23);
  size_t v7 = a3 - __src;
  if (v6 < 0)
  {
    if (a3 == __src) {
      return a1;
    }
    size_t v8 = *(void *)(a1 + 8);
    unint64_t v12 = *(void *)(a1 + 16);
    unint64_t v9 = (v12 & 0x7FFFFFFFFFFFFFFFLL) - 1;
    uint64_t v11 = *(unsigned char **)a1;
    unint64_t v10 = HIBYTE(v12);
    if (*(void *)a1 > (unint64_t)__src) {
      goto LABEL_11;
    }
  }
  else
  {
    if (a3 == __src) {
      return a1;
    }
    size_t v8 = *(unsigned __int8 *)(a1 + 23);
    unint64_t v9 = 22;
    LOBYTE(v10) = *(unsigned char *)(a1 + 23);
    uint64_t v11 = (unsigned char *)a1;
    if (a1 > (unint64_t)__src)
    {
LABEL_11:
      if (v9 - v8 >= v7)
      {
        size_t v16 = (unsigned char *)a1;
        if ((v10 & 0x80) != 0)
        {
          size_t v16 = *(unsigned char **)a1;
          uint64_t v17 = (unsigned char *)(*(void *)a1 + v8);
          if (v7 >= 0x20) {
            goto LABEL_36;
          }
        }
        else
        {
          uint64_t v17 = (unsigned char *)(a1 + v8);
          if (v7 >= 0x20) {
            goto LABEL_36;
          }
        }
        goto LABEL_23;
      }
      size_t v14 = 0x7FFFFFFFFFFFFFF7;
      if (0x7FFFFFFFFFFFFFF7 - v9 < v8 + v7 - v9) {
        sub_21B5E1570();
      }
      size_t v15 = (unsigned char *)a1;
      if (v6 < 0)
      {
        size_t v15 = *(unsigned char **)a1;
        if (v9 > 0x3FFFFFFFFFFFFFF2)
        {
LABEL_15:
          size_t v16 = operator new(0x7FFFFFFFFFFFFFF7uLL);
          if (!v8) {
            goto LABEL_17;
          }
          goto LABEL_16;
        }
      }
      else if (v9 > 0x3FFFFFFFFFFFFFF2)
      {
        goto LABEL_15;
      }
      unint64_t v30 = 2 * v9;
      if (v8 + v7 > 2 * v9) {
        unint64_t v30 = v8 + v7;
      }
      uint64_t v31 = (v30 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v30 | 7) != 0x17) {
        uint64_t v31 = v30 | 7;
      }
      if (v30 >= 0x17) {
        size_t v14 = v31 + 1;
      }
      else {
        size_t v14 = 23;
      }
      size_t v16 = operator new(v14);
      if (!v8)
      {
LABEL_17:
        if (v9 != 22) {
          operator delete(v15);
        }
        *(void *)(a1 + 8) = v8;
        *(void *)(a1 + 16) = v14 | 0x8000000000000000;
        *(void *)a1 = v16;
        uint64_t v17 = &v16[v8];
        if (v7 >= 0x20)
        {
LABEL_36:
          if ((unint64_t)(&v16[v8] - __src) >= 0x20)
          {
            unint64_t v18 = &__src[v7 & 0xFFFFFFFFFFFFFFE0];
            v17 += v7 & 0xFFFFFFFFFFFFFFE0;
            int8x16_t v23 = &v16[v8 + 16];
            int64x2_t v24 = (long long *)(__src + 16);
            unint64_t v25 = v7 & 0xFFFFFFFFFFFFFFE0;
            do
            {
              long long v26 = *v24;
              *(v23 - 1) = *(v24 - 1);
              *int8x16_t v23 = v26;
              v23 += 2;
              v24 += 2;
              v25 -= 32;
            }
            while (v25);
            if (v7 == (v7 & 0xFFFFFFFFFFFFFFE0)) {
              goto LABEL_42;
            }
          }
          else
          {
            unint64_t v18 = __src;
          }
          do
          {
LABEL_41:
            char v27 = *v18++;
            *v17++ = v27;
          }
          while (v18 != a3);
LABEL_42:
          *uint64_t v17 = 0;
          size_t v28 = v8 + v7;
          if (*(char *)(a1 + 23) < 0) {
            *(void *)(a1 + 8) = v28;
          }
          else {
            *(unsigned char *)(a1 + 23) = v28 & 0x7F;
          }
          return a1;
        }
LABEL_23:
        unint64_t v18 = __src;
        goto LABEL_41;
      }
LABEL_16:
      memmove(v16, v15, v8);
      goto LABEL_17;
    }
  }
  if (&v11[v8 + 1] <= __src) {
    goto LABEL_11;
  }
  if (v7 > 0x7FFFFFFFFFFFFFF7) {
    sub_21B5E1570();
  }
  if (v7 > 0x16)
  {
    uint64_t v19 = (v7 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v7 | 7) != 0x17) {
      uint64_t v19 = v7 | 7;
    }
    uint64_t v20 = v19 + 1;
    p_dst = (void **)operator new(v19 + 1);
    size_t v33 = v7;
    int64_t v34 = v20 | 0x8000000000000000;
    __dst = p_dst;
  }
  else
  {
    HIBYTE(v34) = (_BYTE)a3 - (_BYTE)__src;
    p_dst = (void **)&__dst;
  }
  memcpy(p_dst, __src, v7);
  *((unsigned char *)p_dst + v7) = 0;
  if (v34 >= 0) {
    uint64_t v21 = (const std::string::value_type *)&__dst;
  }
  else {
    uint64_t v21 = (const std::string::value_type *)__dst;
  }
  if (v34 >= 0) {
    std::string::size_type v22 = HIBYTE(v34);
  }
  else {
    std::string::size_type v22 = v33;
  }
  std::string::append((std::string *)a1, v21, v22);
  if (SHIBYTE(v34) < 0) {
    operator delete(__dst);
  }
  return a1;
}

void sub_21B5E2928(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *sub_21B5E2944(void *a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x21D4910B0](v13, a1);
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
    if (!sub_21B5E2AE8(v7, a2, v11, a2 + a3, v6, (char)v9)) {
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | 5);
    }
  }
  MEMORY[0x21D4910C0](v13);
  return a1;
}

void sub_21B5E2A80(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  MEMORY[0x21D4910C0](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(void *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x21B5E2A60);
}

void sub_21B5E2AD4(_Unwind_Exception *a1)
{
}

uint64_t sub_21B5E2AE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
{
  uint64_t v6 = a1;
  if (a1)
  {
    uint64_t v11 = *(void *)(a5 + 24);
    if (v11 <= a4 - a2) {
      size_t v12 = 0;
    }
    else {
      size_t v12 = v11 - (a4 - a2);
    }
    if (a3 - a2 >= 1 && (*(uint64_t (**)(uint64_t))(*(void *)a1 + 96))(a1) != a3 - a2) {
      return 0;
    }
    if ((uint64_t)v12 >= 1)
    {
      if (v12 >= 0x7FFFFFFFFFFFFFF8) {
        sub_21B5E1570();
      }
      if (v12 >= 0x17)
      {
        uint64_t v14 = (v12 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v12 | 7) != 0x17) {
          uint64_t v14 = v12 | 7;
        }
        uint64_t v15 = v14 + 1;
        unint64_t v13 = (void **)operator new(v14 + 1);
        __b[1] = (void *)v12;
        int64_t v22 = v15 | 0x8000000000000000;
        __b[0] = v13;
      }
      else
      {
        HIBYTE(v22) = v12;
        unint64_t v13 = __b;
      }
      memset(v13, __c, v12);
      *((unsigned char *)v13 + v12) = 0;
      if (v22 >= 0) {
        size_t v16 = __b;
      }
      else {
        size_t v16 = (void **)__b[0];
      }
      uint64_t v17 = (*(uint64_t (**)(uint64_t, void **, size_t))(*(void *)v6 + 96))(v6, v16, v12);
      uint64_t v18 = v17;
      if (SHIBYTE(v22) < 0)
      {
        operator delete(__b[0]);
        if (v18 != v12) {
          return 0;
        }
      }
      else if (v17 != v12)
      {
        return 0;
      }
    }
    uint64_t v19 = a4 - a3;
    if (v19 < 1 || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v6 + 96))(v6, a3, v19) == v19)
    {
      *(void *)(a5 + 24) = 0;
      return v6;
    }
    return 0;
  }
  return v6;
}

void sub_21B5E2CBC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

BOOL sub_21B5E2CD8(const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void (*a7)(void **))
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_267C58EC8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_267C58EC8))
  {
    __cxa_atexit((void (*)(void *))sub_21B5E32F0, &qword_267C58EE0, &dword_21B5DB000);
    __cxa_guard_release(&qword_267C58EC8);
  }
  if (!byte_267C58F08)
  {
    int64_t v34 = a7;
    sub_21B5E1154((uint64_t)v37);
    if (a4) {
      unint64_t v13 = "Assert: ";
    }
    else {
      unint64_t v13 = "Abort: ";
    }
    if (a4) {
      uint64_t v14 = 8;
    }
    else {
      uint64_t v14 = 7;
    }
    sub_21B5E2944(v38, (uint64_t)v13, v14);
    size_t v15 = strlen(a1);
    size_t v16 = sub_21B5E2944(v38, (uint64_t)a1, v15);
    sub_21B5E2944(v16, (uint64_t)":", 1);
    std::ostream::operator<<();
    if (a4)
    {
      uint64_t v17 = sub_21B5E2944(v38, (uint64_t)" : ", 3);
      sub_21B5E2944(v17, a3, a4);
    }
    if (a6)
    {
      uint64_t v18 = sub_21B5E2944(v38, (uint64_t)" : ", 3);
      sub_21B5E2944(v18, a5, a6);
    }
    sub_21B5E2944(v38, (uint64_t)"\n", 1);
    if ((v46 & 0x10) != 0)
    {
      unint64_t v21 = v45;
      if (v45 < v42)
      {
        unint64_t v45 = v42;
        unint64_t v21 = v42;
      }
      int64_t v22 = v41;
      size_t v19 = v21 - (void)v41;
      if (v21 - (unint64_t)v41 >= 0x7FFFFFFFFFFFFFF8) {
        goto LABEL_45;
      }
    }
    else
    {
      if ((v46 & 8) == 0)
      {
        size_t v19 = 0;
        HIBYTE(v36) = 0;
        uint64_t v20 = __dst;
        goto LABEL_26;
      }
      int64_t v22 = v39;
      size_t v19 = v40 - (void)v39;
      if ((unint64_t)(v40 - (void)v39) >= 0x7FFFFFFFFFFFFFF8) {
LABEL_45:
      }
        sub_21B5E1570();
    }
    if (v19 >= 0x17)
    {
      uint64_t v23 = (v19 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v19 | 7) != 0x17) {
        uint64_t v23 = v19 | 7;
      }
      uint64_t v24 = v23 + 1;
      uint64_t v20 = (void **)operator new(v23 + 1);
      __dst[1] = (void *)v19;
      int64_t v36 = v24 | 0x8000000000000000;
      __dst[0] = v20;
    }
    else
    {
      HIBYTE(v36) = v19;
      uint64_t v20 = __dst;
      if (!v19) {
        goto LABEL_26;
      }
    }
    memmove(v20, v22, v19);
LABEL_26:
    *((unsigned char *)v20 + v19) = 0;
    v37[0] = *MEMORY[0x263F8C2B8];
    uint64_t v25 = *(void *)(MEMORY[0x263F8C2B8] + 72);
    *(void *)((char *)v37 + *(void *)(v37[0] - 24)) = *(void *)(MEMORY[0x263F8C2B8] + 64);
    v38[0] = v25;
    v38[1] = MEMORY[0x263F8C318] + 16;
    if (v44 < 0) {
      operator delete(__p);
    }
    std::streambuf::~streambuf();
    std::iostream::~basic_iostream();
    MEMORY[0x21D491160](&v47);
    if (v36 >= 0) {
      long long v26 = __dst;
    }
    else {
      long long v26 = (void **)__dst[0];
    }
    v34(v26);
    if (SHIBYTE(v36) < 0) {
      operator delete(__dst[0]);
    }
  }
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_267C58EC8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_267C58EC8))
  {
    __cxa_atexit((void (*)(void *))sub_21B5E32F0, &qword_267C58EE0, &dword_21B5DB000);
    __cxa_guard_release(&qword_267C58EC8);
  }
  if (byte_267C58F08) {
    BOOL v27 = byte_267C58F10 == 0;
  }
  else {
    BOOL v27 = 0;
  }
  if (!v27)
  {
    uint64_t v28 = qword_267C58EE0;
    uint64_t v29 = unk_267C58EE8;
    while (v28 != v29)
    {
      uint64_t v31 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v28;
      uint64_t v30 = *(void *)(v28 + 8);
      v28 += 16;
      v31(v30, a3, a4, a5, a6);
    }
  }
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_267C58EC8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_267C58EC8))
  {
    __cxa_atexit((void (*)(void *))sub_21B5E32F0, &qword_267C58EE0, &dword_21B5DB000);
    __cxa_guard_release(&qword_267C58EC8);
  }
  int v32 = byte_267C58F08;
  if (byte_267C58F08) {
    qword_267C58EF8(unk_267C58F00, a3, a4, a5, a6);
  }
  return v32 == 0;
}

void sub_21B5E317C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16)
{
  if (a15 < 0)
  {
    operator delete(__p);
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_21B5E31AC(char *a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = sub_21B5E3404();
  size_t v3 = strlen(a1);
  sub_21B5E3480((void **)v2 + 1, a1, v3);
  if (*((char *)v2 + 31) >= 0) {
    uint64_t v4 = (uint64_t)(v2 + 1);
  }
  else {
    uint64_t v4 = (uint64_t)v2[1];
  }
  qword_267C58E90 = v4;
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_267C58ED8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_267C58ED8))
  {
    qword_267C58ED0 = (uint64_t)os_log_create("cv3d", (const char *)&unk_21B5E3D07);
    __cxa_guard_release(&qword_267C58ED8);
  }
  uint64_t v5 = qword_267C58ED0;
  if (os_log_type_enabled((os_log_t)qword_267C58ED0, OS_LOG_TYPE_FAULT))
  {
    int v7 = 136315138;
    int v8 = a1;
    _os_log_impl(&dword_21B5DB000, v5, OS_LOG_TYPE_FAULT, "%s", (uint8_t *)&v7, 0xCu);
  }
  return fputs(a1, (FILE *)*MEMORY[0x263EF8348]);
}

uint64_t sub_21B5E32F0(uint64_t a1)
{
  uint64_t v2 = *(void **)a1;
  if (v2)
  {
    *(void *)(a1 + 8) = v2;
    operator delete(v2);
  }
  return a1;
}

uint64_t sub_21B5E3324(uint64_t result)
{
  uint64_t v1 = result;
  *(void *)__n128 result = off_26CB68760;
  qword_267C58E90 = 0;
  if (*(char *)(result + 31) < 0)
  {
    operator delete(*(void **)(result + 8));
    return v1;
  }
  return result;
}

void sub_21B5E338C(uint64_t a1)
{
  *(void *)a1 = off_26CB68760;
  qword_267C58E90 = 0;
  if (*(char *)(a1 + 31) < 0) {
    operator delete(*(void **)(a1 + 8));
  }

  JUMPOUT(0x21D4911B0);
}

uint64_t (***sub_21B5E3404())()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_267C58F18, memory_order_acquire) & 1) != 0
    || !__cxa_guard_acquire(&qword_267C58F18))
  {
    return &off_26AD09D28;
  }
  __cxa_atexit((void (*)(void *))sub_21B5E3324, &off_26AD09D28, &dword_21B5DB000);
  __cxa_guard_release(&qword_267C58F18);
  return &off_26AD09D28;
}

void **sub_21B5E3480(void **__dst, void *__src, size_t __len)
{
  LODWORD(v6) = *((char *)__dst + 23);
  if ((v6 & 0x80000000) != 0)
  {
    unint64_t v10 = (unint64_t)__dst[2];
    unint64_t v8 = (v10 & 0x7FFFFFFFFFFFFFFFLL) - 1;
    if (__len > v8)
    {
      size_t v11 = 0x7FFFFFFFFFFFFFF7;
      if (0x7FFFFFFFFFFFFFF7 - (v10 & 0x7FFFFFFFFFFFFFFFLL) >= __len - v8)
      {
        uint64_t v9 = *__dst;
        if (v8 > 0x3FFFFFFFFFFFFFF2)
        {
LABEL_15:
          int v7 = operator new(v11);
          memcpy(v7, __src, __len);
          if (v8 != 22) {
            operator delete(v9);
          }
          __dst[2] = (void *)(v11 | 0x8000000000000000);
          *__dst = v7;
LABEL_23:
          __dst[1] = (void *)__len;
          goto LABEL_24;
        }
LABEL_8:
        unint64_t v12 = 2 * v8;
        if (__len > 2 * v8) {
          unint64_t v12 = __len;
        }
        uint64_t v13 = (v12 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v12 | 7) != 0x17) {
          uint64_t v13 = v12 | 7;
        }
        if (v12 >= 0x17) {
          size_t v11 = v13 + 1;
        }
        else {
          size_t v11 = 23;
        }
        goto LABEL_15;
      }
LABEL_25:
      sub_21B5E1570();
    }
    unint64_t v6 = HIBYTE(v10);
    int v7 = *__dst;
  }
  else
  {
    int v7 = __dst;
    if (__len > 0x16)
    {
      if (__len - 0x7FFFFFFFFFFFFFF7 >= 0x800000000000001FLL)
      {
        unint64_t v8 = 22;
        uint64_t v9 = __dst;
        goto LABEL_8;
      }
      goto LABEL_25;
    }
  }
  if (__len)
  {
    memmove(v7, __src, __len);
    LOBYTE(v6) = *((unsigned char *)__dst + 23);
  }
  if ((v6 & 0x80) != 0) {
    goto LABEL_23;
  }
  *((unsigned char *)__dst + 23) = __len & 0x7F;
LABEL_24:
  *((unsigned char *)v7 + __len) = 0;
  return __dst;
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
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

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984A0](this, __s, __n);
}

void std::string::reserve(std::string *this, std::string::size_type __requested_capacity)
{
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

std::__fs::filesystem::file_status std::__fs::filesystem::__status(const std::__fs::filesystem::path *a1, std::error_code *__ec)
{
  return (std::__fs::filesystem::file_status)MEMORY[0x270F98B60](a1, __ec);
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

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unsigned int __val)
{
  return (std::string *)MEMORY[0x270F98E10](retstr, *(void *)&__val);
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

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x270F98EC0](thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x270ED7DA0](lpfunc, obj, lpdso_handle);
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

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x270F98F10](a1);
}

void __cxa_guard_release(__guard *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x270ED9A20](a1, a2);
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}