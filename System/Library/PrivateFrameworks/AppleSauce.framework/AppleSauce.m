BOOL applesauce::xpc::dyn_cast_or_default(xpc_object_t *a1, uint64_t a2)
{
  uint64_t v4;
  xpc_object_t v5;
  uint64_t v6;
  xpc_object_t v7;
  uint64_t value;

  v4 = MEMORY[0x210564E30](*a1);
  v5 = *a1;
  if (v4 == MEMORY[0x263EF86E0]) {
    return v5 == (xpc_object_t)MEMORY[0x263EF8698];
  }
  v6 = MEMORY[0x210564E30](v5);
  v7 = *a1;
  if (v6 == MEMORY[0x263EF8738])
  {
    value = xpc_int64_get_value(v7);
    return value != 0;
  }
  if (MEMORY[0x210564E30](v7) == MEMORY[0x263EF87A0])
  {
    value = xpc_uint64_get_value(*a1);
    return value != 0;
  }
  return a2;
}

uint64_t applesauce::xpc::dyn_cast_or_default(void *a1, int64_t value)
{
  uint64_t v4 = MEMORY[0x210564E30](*a1);
  v5 = (void *)*a1;
  if (v4 == MEMORY[0x263EF8738])
  {
    value = xpc_int64_get_value(v5);
    if (value < 0)
    {
      exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
      sub_20DB652A8(exception, "dyn_cast to uint64_t requires nonnegative values");
      __cxa_throw(exception, (struct type_info *)off_264127280, MEMORY[0x263F8C068]);
    }
    return value;
  }
  if (MEMORY[0x210564E30](v5) != MEMORY[0x263EF87A0]) {
    return value;
  }
  v6 = (void *)*a1;

  return xpc_uint64_get_value(v6);
}

void sub_20DB5B5EC(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t applesauce::xpc::dyn_cast_or_default(xpc_object_t *a1, int a2)
{
  return applesauce::xpc::dyn_cast_or_default(a1, a2);
}

uint64_t applesauce::xpc::dyn_cast_or_default(xpc_object_t *a1, uint64_t a2)
{
  uint64_t v4 = MEMORY[0x210564E30](*a1);
  xpc_object_t v5 = *a1;
  if (v4 == MEMORY[0x263EF8738])
  {
    return xpc_int64_get_value(v5);
  }
  else
  {
    uint64_t v6 = MEMORY[0x210564E30](v5);
    xpc_object_t v7 = *a1;
    if (v6 == MEMORY[0x263EF87A0])
    {
      return xpc_uint64_get_value(v7);
    }
    else
    {
      if (MEMORY[0x210564E30](v7) == MEMORY[0x263EF86E0]) {
        return applesauce::xpc::dyn_cast_or_default(a1, 0);
      }
      return a2;
    }
  }
}

void *sub_20DB5B6DC(void *__dst, void *__src, size_t __len)
{
  if (__len >= 0x7FFFFFFFFFFFFFF8) {
    sub_20DB5DACC();
  }
  if (__len >= 0x17)
  {
    size_t v7 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17) {
      size_t v7 = __len | 7;
    }
    size_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    __dst[1] = __len;
    __dst[2] = v8 | 0x8000000000000000;
    *__dst = v6;
  }
  else
  {
    *((unsigned char *)__dst + 23) = __len;
    uint64_t v6 = __dst;
    if (!__len) {
      goto LABEL_9;
    }
  }
  memmove(v6, __src, __len);
LABEL_9:
  *((unsigned char *)v6 + __len) = 0;
  return __dst;
}

void *applesauce::xpc::dyn_cast_or_default@<X0>(xpc_object_t *a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  result = (void *)MEMORY[0x210564E30](*a1);
  if (result == (void *)MEMORY[0x263EF8798])
  {
    string_ptr = (char *)xpc_string_get_string_ptr(*a1);
    size_t length = xpc_string_get_length(*a1);
    return sub_20DB5B6DC(a3, string_ptr, length);
  }
  else if (*(char *)(a2 + 23) < 0)
  {
    v9 = *(void **)a2;
    unint64_t v10 = *(void *)(a2 + 8);
    return sub_20DB66FF4(a3, v9, v10);
  }
  else
  {
    *(_OWORD *)a3 = *(_OWORD *)a2;
    a3[2] = *(void *)(a2 + 16);
  }
  return result;
}

void *docopt::operator<<(void *a1, uint64_t a2)
{
  v2 = a1;
  switch(*(_DWORD *)a2)
  {
    case 1:
      sub_20DB5D878((int *)a2, 1u);
      if (*(unsigned char *)(a2 + 8)) {
        uint64_t v4 = "true";
      }
      else {
        uint64_t v4 = "false";
      }
      if (*(unsigned char *)(a2 + 8)) {
        uint64_t v5 = 4;
      }
      else {
        uint64_t v5 = 5;
      }
      a1 = v2;
      break;
    case 2:
      sub_20DB5BA3C(a2);
      std::ostream::operator<<();
      return v2;
    case 3:
      sub_20DB5D878((int *)a2, 3u);
      char v22 = 34;
      uint64_t v6 = sub_20DB7AC2C(v2, (uint64_t)&v22, 1);
      uint64_t v9 = *(void *)(a2 + 8);
      uint64_t v8 = a2 + 8;
      uint64_t v7 = v9;
      int v10 = *(char *)(v8 + 23);
      if (v10 >= 0) {
        uint64_t v11 = v8;
      }
      else {
        uint64_t v11 = v7;
      }
      if (v10 >= 0) {
        uint64_t v12 = *(unsigned __int8 *)(v8 + 23);
      }
      else {
        uint64_t v12 = *(void *)(v8 + 8);
      }
      a1 = sub_20DB7AC2C(v6, v11, v12);
      char v23 = 34;
      uint64_t v4 = &v23;
      goto LABEL_30;
    case 4:
      sub_20DB5D878((int *)a2, 4u);
      sub_20DB7AC2C(v2, (uint64_t)"[", 1);
      uint64_t v13 = *(void *)(a2 + 8);
      uint64_t v14 = *(void *)(a2 + 16);
      if (v13 != v14)
      {
        char v15 = 1;
        do
        {
          if ((v15 & 1) == 0) {
            sub_20DB7AC2C(v2, (uint64_t)", ", 2);
          }
          char v24 = 34;
          v16 = sub_20DB7AC2C(v2, (uint64_t)&v24, 1);
          int v17 = *(char *)(v13 + 23);
          if (v17 >= 0) {
            uint64_t v18 = v13;
          }
          else {
            uint64_t v18 = *(void *)v13;
          }
          if (v17 >= 0) {
            uint64_t v19 = *(unsigned __int8 *)(v13 + 23);
          }
          else {
            uint64_t v19 = *(void *)(v13 + 8);
          }
          v20 = sub_20DB7AC2C(v16, v18, v19);
          char v25 = 34;
          sub_20DB7AC2C(v20, (uint64_t)&v25, 1);
          char v15 = 0;
          v13 += 24;
        }
        while (v13 != v14);
      }
      uint64_t v4 = "]";
      a1 = v2;
LABEL_30:
      uint64_t v5 = 1;
      break;
    default:
      uint64_t v4 = "null";
      uint64_t v5 = 4;
      break;
  }
  sub_20DB7AC2C(a1, (uint64_t)v4, v5);
  return v2;
}

uint64_t sub_20DB5BA3C(uint64_t a1)
{
  if (*(_DWORD *)a1 == 3)
  {
    size_t __idx = 0;
    uint64_t result = std::stol((const std::string *)(a1 + 8), &__idx, 10);
    if (*(char *)(a1 + 31) < 0) {
      uint64_t v3 = *(void *)(a1 + 16);
    }
    else {
      uint64_t v3 = *(unsigned __int8 *)(a1 + 31);
    }
    if (__idx != v3)
    {
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      sub_20DB5D988(" contains non-numeric characters.", (const void **)(a1 + 8), (void **)&v5.__r_.__value_.__l.__data_);
      std::runtime_error::runtime_error(exception, &v5);
      __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
    }
  }
  else
  {
    sub_20DB5D878((int *)a1, 2u);
    return *(void *)(a1 + 8);
  }
  return result;
}

void sub_20DB5BB20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
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

void docopt::docopt_parse()
{
  uint64_t v4 = &unk_26C244828;
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  long long v1 = 0uLL;
  __p = 0;
  p_p = &__p;
  sub_20DB5E714(&p_p);
  uint64_t v4 = &unk_26C244B50;
  long long v2 = 0uLL;
  uint64_t v3 = 0;
  sub_20DB7AA9C(&p_p, "usage:");
  sub_20DB5EEC4();
}

void sub_20DB5CC80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,void *a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,void *__p,uint64_t a52,int a53,__int16 a54,char a55,char a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60)
{
  if (a56 < 0)
  {
    operator delete(__p);
    if ((v60 & 1) == 0)
    {
LABEL_6:
      if (*(char *)(v62 - 121) < 0) {
        operator delete(*(void **)(v62 - 144));
      }
      __p = &a28;
      sub_20DB5E714((void ***)&__p);
      __p = &a60;
      sub_20DB5E714((void ***)&__p);
      a60 = (uint64_t)&a35;
      sub_20DB7AF58((void ***)&a60);
      a39 = a12;
      a60 = a14;
      sub_20DB5E714((void ***)&a60);
      _Unwind_Resume(a1);
    }
  }
  else if (!v60)
  {
    goto LABEL_6;
  }
  __cxa_free_exception(v61);
  goto LABEL_6;
}

void sub_20DB5D0EC()
{
}

void sub_20DB5D238()
{
}

void sub_20DB5D288(void *a1)
{
}

uint64_t sub_20DB5D2A0(uint64_t a1)
{
  memset(v3, 0, sizeof(v3));
  int v4 = 1065353216;
  (*(void (**)(uint64_t, _OWORD *))(*(void *)a1 + 72))(a1, v3);
  sub_20DB7907C(a1);
  sub_20DB7A84C((uint64_t)v3);
  return a1;
}

void sub_20DB5D314(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t sub_20DB5D328(uint64_t a1, int *a2)
{
  int v5 = *a2;
  switch(*a2)
  {
    case 1:
      LOBYTE(v6) = *((unsigned char *)a2 + 8);
      break;
    case 2:
      *(void *)&long long v6 = *((void *)a2 + 1);
      break;
    case 3:
      if (*((char *)a2 + 31) < 0)
      {
        sub_20DB66FF4(&v6, *((void **)a2 + 1), *((void *)a2 + 2));
      }
      else
      {
        long long v6 = *(_OWORD *)(a2 + 2);
        uint64_t v7 = *((void *)a2 + 3);
      }
      break;
    case 4:
      long long v6 = 0uLL;
      uint64_t v7 = 0;
      sub_20DB7AB50((char *)&v6, *((long long **)a2 + 1), *((long long **)a2 + 2), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a2 + 2) - *((void *)a2 + 1)) >> 3));
      break;
    default:
      break;
  }
  if (*(_DWORD *)a1 == 4)
  {
    uint64_t v8 = (void **)(a1 + 8);
    sub_20DB7ABD8(&v8);
  }
  else if (*(_DWORD *)a1 == 3 && *(char *)(a1 + 31) < 0)
  {
    operator delete(*(void **)(a1 + 8));
  }
  *(_DWORD *)a1 = v5;
  uint64_t v3 = (unsigned char *)(a1 + 8);
  switch(v5)
  {
    case 1:
      *uint64_t v3 = v6;
      break;
    case 2:
      *(void *)uint64_t v3 = v6;
      break;
    case 3:
      *(_OWORD *)uint64_t v3 = v6;
      *(void *)(a1 + 24) = v7;
      break;
    case 4:
      *(_OWORD *)(a1 + 8) = v6;
      *(void *)(a1 + 24) = v7;
      uint64_t v7 = 0;
      long long v6 = 0uLL;
      uint64_t v8 = (void **)&v6;
      sub_20DB7ABD8(&v8);
      break;
    default:
      return a1;
  }
  return a1;
}

char *sub_20DB5D4E8@<X0>(char *result@<X0>, char *a2@<X1>, uint64_t a3@<X2>, std::string *a4@<X8>)
{
  if (result == a2)
  {
    a4->__r_.__value_.__r.__words[0] = 0;
    a4->__r_.__value_.__l.__size_ = 0;
    a4->__r_.__value_.__r.__words[2] = 0;
  }
  else
  {
    uint64_t v7 = result;
    if (result[23] < 0)
    {
      uint64_t result = (char *)sub_20DB66FF4(a4, *(void **)result, *((void *)result + 1));
    }
    else
    {
      long long v8 = *(_OWORD *)result;
      a4->__r_.__value_.__r.__words[2] = *((void *)result + 2);
      *(_OWORD *)&a4->__r_.__value_.__l.__data_ = v8;
    }
    for (i = v7 + 24; i != a2; i += 24)
    {
      int v10 = *(char *)(a3 + 23);
      if (v10 >= 0) {
        uint64_t v11 = (const std::string::value_type *)a3;
      }
      else {
        uint64_t v11 = *(const std::string::value_type **)a3;
      }
      if (v10 >= 0) {
        std::string::size_type v12 = *(unsigned __int8 *)(a3 + 23);
      }
      else {
        std::string::size_type v12 = *(void *)(a3 + 8);
      }
      std::string::append(a4, v11, v12);
      int v13 = i[23];
      if (v13 >= 0) {
        uint64_t v14 = i;
      }
      else {
        uint64_t v14 = *(const std::string::value_type **)i;
      }
      if (v13 >= 0) {
        std::string::size_type v15 = i[23];
      }
      else {
        std::string::size_type v15 = *((void *)i + 1);
      }
      uint64_t result = (char *)std::string::append(a4, v14, v15);
    }
  }
  return result;
}

void sub_20DB5D5A8(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_20DB5D5C4(uint64_t a1)
{
  *(void *)a1 = &unk_26C244828;
  uint64_t v3 = (void **)(a1 + 8);
  sub_20DB5E714(&v3);
  return a1;
}

void docopt::docopt()
{
}

void *sub_20DB5D7C0(void *a1)
{
  std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
  long long v2 = std::locale::use_facet(&v4, MEMORY[0x263F8C108]);
  ((void (*)(const std::locale::facet *, uint64_t))v2->__vftable[2].~facet_0)(v2, 10);
  std::locale::~locale(&v4);
  std::ostream::put();
  std::ostream::flush();
  return a1;
}

void sub_20DB5D864(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::locale a10)
{
}

int *sub_20DB5D878(int *result, unsigned int a2)
{
  if (*result != a2)
  {
    uint64_t v3 = result;
    sub_20DB7AA9C(&v8, "Illegal cast to ");
    if (a2 > 4) {
      std::locale v4 = "unknown";
    }
    else {
      std::locale v4 = off_264127328[a2];
    }
    std::string::append(&v8, v4);
    std::string::append(&v8, "; type is actually ");
    uint64_t v5 = *v3;
    if (v5 > 4) {
      long long v6 = "unknown";
    }
    else {
      long long v6 = off_264127328[v5];
    }
    std::string::append(&v8, v6);
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, &v8);
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  return result;
}

void sub_20DB5D95C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  __cxa_free_exception(v15);
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_20DB5D988@<X0>(char *__s@<X1>, const void **a2@<X0>, void **a3@<X8>)
{
  if (*((char *)a2 + 23) >= 0) {
    size_t v6 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    size_t v6 = (size_t)a2[1];
  }
  size_t v7 = strlen(__s);
  uint64_t result = sub_20DB5DA44((uint64_t)a3, v6 + v7);
  if (*((char *)a3 + 23) < 0) {
    a3 = (void **)*a3;
  }
  if (v6)
  {
    if (*((char *)a2 + 23) >= 0) {
      uint64_t v9 = a2;
    }
    else {
      uint64_t v9 = *a2;
    }
    uint64_t result = (uint64_t)memmove(a3, v9, v6);
  }
  int v10 = (char *)a3 + v6;
  if (v7) {
    uint64_t result = (uint64_t)memmove(v10, __s, v7);
  }
  v10[v7] = 0;
  return result;
}

uint64_t sub_20DB5DA44(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x7FFFFFFFFFFFFFF8) {
    sub_20DB5DACC();
  }
  if (a2 > 0x16)
  {
    uint64_t v4 = (a2 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a2 | 7) != 0x17) {
      uint64_t v4 = a2 | 7;
    }
    uint64_t v5 = v4 + 1;
    size_t v6 = operator new(v4 + 1);
    *(void *)(a1 + 8) = a2;
    *(void *)(a1 + 16) = v5 | 0x8000000000000000;
    *(void *)a1 = v6;
  }
  else
  {
    *(void *)(a1 + 8) = 0;
    *(void *)(a1 + 16) = 0;
    *(void *)a1 = 0;
    *(unsigned char *)(a1 + 23) = a2;
  }
  return a1;
}

void sub_20DB5DACC()
{
}

void sub_20DB5DAE4(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_20DB5DB40(exception, a1);
  __cxa_throw(exception, (struct type_info *)off_264127278, MEMORY[0x263F8C060]);
}

void sub_20DB5DB2C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_20DB5DB40(std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

void sub_20DB5DB74()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

void sub_20DB5DBA8(uint64_t a1@<X0>, uint64_t (*a2)(void)@<X1>, void *a3@<X8>)
{
  void (****v7)(void **__return_ptr);
  void (****v8)(void **__return_ptr);
  void *__p;
  char *v10;

  int v5 = a2();
  a3[1] = 0;
  a3[2] = 0;
  *a3 = 0;
  if (v5)
  {
    size_t v6 = operator new(8uLL);
    *a3 = v6;
    *v6++ = a1;
    a3[1] = v6;
    a3[2] = v6;
  }
  else
  {
    std::string v8 = *(void (*****)(void **__return_ptr))(a1 + 8);
    size_t v7 = *(void (*****)(void **__return_ptr))(a1 + 16);
    while (v8 != v7)
    {
      (***v8)(&__p);
      sub_20DB5E1B8((uint64_t)a3, a3[1], (char *)__p, v10, (v10 - (unsigned char *)__p) >> 3);
      if (__p)
      {
        int v10 = (char *)__p;
        operator delete(__p);
      }
      v8 += 2;
    }
  }
}

void sub_20DB5DC70(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  int v13 = *(void **)v11;
  if (*(void *)v11)
  {
    *(void *)(v11 + 8) = v13;
    operator delete(v13);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_20DB5DCA4(uint64_t result, uint64_t a2)
{
  long long v2 = *(uint64_t **)(result + 8);
  for (i = *(uint64_t **)(result + 16);
        v2 != i;
        uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v5 + 8))(v5, a2))
  {
    uint64_t v5 = *v2;
    v2 += 2;
  }
  return result;
}

uint64_t sub_20DB5DD0C(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  long long v12 = 0uLL;
  uint64_t v13 = 0;
  sub_20DB5E490(&v12, (void *)*a2, (void *)a2[1], (a2[1] - *a2) >> 4);
  long long v10 = 0uLL;
  uint64_t v11 = 0;
  sub_20DB5E7B4(&v10, (void *)*a3, (void *)a3[1], (a3[1] - *a3) >> 4);
  size_t v7 = *(void **)(a1 + 8);
  size_t v6 = *(void **)(a1 + 16);
  while (1)
  {
    if (v7 == v6)
    {
      sub_20DB5E904(a2);
      *(_OWORD *)a2 = v12;
      a2[2] = v13;
      uint64_t v13 = 0;
      long long v12 = 0uLL;
      sub_20DB5E904(a3);
      *(_OWORD *)a3 = v10;
      a3[2] = v11;
      uint64_t v11 = 0;
      long long v10 = 0uLL;
      uint64_t v8 = 1;
      goto LABEL_7;
    }
    if (((*(uint64_t (**)(void, long long *, long long *))(*(void *)*v7 + 16))(*v7, &v12, &v10) & 1) == 0) {
      break;
    }
    v7 += 2;
  }
  uint64_t v8 = 0;
LABEL_7:
  uint64_t v14 = (void **)&v10;
  sub_20DB5E714(&v14);
  *(void *)&long long v10 = &v12;
  sub_20DB5E714((void ***)&v10);
  return v8;
}

void sub_20DB5DE38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
  a9 = (void **)&a13;
  sub_20DB5E714(&a9);
  _Unwind_Resume(a1);
}

void sub_20DB5DE6C()
{
  exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
  std::runtime_error::runtime_error(exception, "Logic error: name() shouldnt be called on a BranchPattern");
  __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
}

void sub_20DB5DEB4(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_20DB5DEC8()
{
  return 0;
}

unint64_t sub_20DB5DED0(void *a1)
{
  if (!a1) {
    __cxa_bad_typeid();
  }
  unint64_t v1 = *(void *)(*(void *)(*a1 - 8) + 8);
  if ((v1 & 0x8000000000000000) != 0)
  {
    long long v2 = (unsigned __int8 *)(v1 & 0x7FFFFFFFFFFFFFFFLL);
    uint64_t v3 = 5381;
    do
    {
      unint64_t v1 = v3;
      unsigned int v4 = *v2++;
      uint64_t v3 = (33 * v3) ^ v4;
    }
    while (v4);
  }
  size_t v6 = (char *)a1[1];
  uint64_t v5 = (char *)a1[2];
  for (unint64_t i = ((v1 << 6) + (v1 >> 2) + ((v5 - v6) >> 4) + 2654435769u) ^ v1;
        v6 != v5;
        i ^= (i << 6) + 2654435769u + (i >> 2) + (*(uint64_t (**)(uint64_t))(*(void *)v8 + 40))(v8))
  {
    uint64_t v8 = *(void *)v6;
    v6 += 16;
  }
  return i;
}

uint64_t sub_20DB5DFA0(uint64_t a1)
{
  *(void *)a1 = &unk_26C244828;
  uint64_t v3 = (void **)(a1 + 8);
  sub_20DB5E714(&v3);
  return MEMORY[0x210564B70](a1, 0xA1C4030951706);
}

void sub_20DB5E00C()
{
  exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
  std::runtime_error::runtime_error(exception, "Logic error: name() shouldnt be called on a BranchPattern");
  __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
}

void sub_20DB5E054(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_20DB5E068(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); v2 != i; v2 += 16)
  {
    if (*(void *)v2)
    {
      uint64_t v5 = __dynamic_cast(*(const void **)v2, (const struct __class_type_info *)&unk_26C2443C0, (const struct __class_type_info *)&unk_26C2442E8, 0);
      if (v5) {
        (*(void (**)(void *, uint64_t))(*(void *)v5 + 72))(v5, a2);
      }
    }
    size_t v6 = sub_20DB5E940(a2, v2, (void *)v2);
    if (!v7)
    {
      uint64_t v9 = v6[2];
      uint64_t v8 = v6[3];
      if (v8) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(v8 + 8), 1uLL, memory_order_relaxed);
      }
      long long v10 = *(std::__shared_weak_count **)(v2 + 8);
      *(void *)uint64_t v2 = v9;
      *(void *)(v2 + 8) = v8;
      if (v10) {
        sub_20DB5E6A0(v10);
      }
    }
  }
}

void sub_20DB5E168()
{
}

void *sub_20DB5E180(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    sub_20DB5DB74();
  }
  return operator new(8 * a2);
}

char *sub_20DB5E1B8(uint64_t a1, uint64_t __dst, char *__src, char *a4, uint64_t a5)
{
  uint64_t v5 = (char *)__dst;
  if (a5 < 1) {
    return v5;
  }
  char v7 = __src;
  uint64_t v11 = *(void *)(a1 + 16);
  uint64_t v9 = a1 + 16;
  uint64_t v10 = v11;
  unint64_t v12 = *(void *)(v9 - 8);
  if (a5 > (uint64_t)(v11 - v12) >> 3)
  {
    uint64_t v13 = *(void **)a1;
    unint64_t v14 = a5 + ((uint64_t)(v12 - *(void *)a1) >> 3);
    if (v14 >> 61) {
      sub_20DB5E168();
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
      uint64_t v18 = (char *)sub_20DB5E180(v9, v17);
    }
    else {
      uint64_t v18 = 0;
    }
    v28 = &v18[8 * v15];
    __p = v18;
    v34 = v28;
    v36 = &v18[8 * v17];
    uint64_t v29 = 8 * a5;
    v30 = &v28[8 * a5];
    do
    {
      uint64_t v31 = *(void *)v7;
      v7 += 8;
      *(void *)v28 = v31;
      v28 += 8;
      v29 -= 8;
    }
    while (v29);
    v35 = v30;
    uint64_t v5 = sub_20DB5E3C8((void **)a1, (uint64_t)&__p, v5);
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
    v21 = &__src[8 * a5];
    char v23 = *(char **)(v9 - 8);
LABEL_17:
    char v24 = &v5[8 * a5];
    char v25 = &v23[-8 * a5];
    v26 = v23;
    if ((unint64_t)v25 < v12)
    {
      v26 = v23;
      do
      {
        uint64_t v27 = *(void *)v25;
        v25 += 8;
        *(void *)v26 = v27;
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
  v21 = &__src[8 * v20];
  int64_t v22 = a4 - v21;
  if (a4 != v21) {
    memmove(*(void **)(v9 - 8), &__src[8 * v20], a4 - v21);
  }
  char v23 = (char *)(v12 + v22);
  *(void *)(a1 + 8) = v12 + v22;
  if (v19 >= 1) {
    goto LABEL_17;
  }
  return v5;
}

void sub_20DB5E390(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

char *sub_20DB5E3C8(void **a1, uint64_t a2, char *__src)
{
  uint64_t v5 = *(char **)(a2 + 8);
  size_t v6 = (char *)*a1;
  char v7 = v5;
  if (*a1 != __src)
  {
    uint64_t v8 = __src;
    char v7 = *(char **)(a2 + 8);
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
    char v7 = *(char **)(a2 + 8);
  }
  *(void *)(a2 + 16) = v11 + v12;
  uint64_t v13 = (char *)*a1;
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

void *sub_20DB5E490(void *result, void *a2, void *a3, unint64_t a4)
{
  if (a4)
  {
    size_t v6 = result;
    sub_20DB5E518(result, a4);
    uint64_t result = sub_20DB5E594((uint64_t)(v6 + 2), a2, a3, (void *)v6[1]);
    v6[1] = result;
  }
  return result;
}

void sub_20DB5E4F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  *(void *)(v9 + 8) = v10;
  sub_20DB5E714(&a9);
  _Unwind_Resume(a1);
}

char *sub_20DB5E518(void *a1, unint64_t a2)
{
  if (a2 >> 60) {
    sub_20DB5E168();
  }
  uint64_t result = (char *)sub_20DB5E55C((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[16 * v4];
  return result;
}

void *sub_20DB5E55C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60) {
    sub_20DB5DB74();
  }
  return operator new(16 * a2);
}

void *sub_20DB5E594(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v4 = a4;
  uint64_t v10 = a4;
  uint64_t v9 = a4;
  v7[0] = a1;
  v7[1] = &v9;
  v7[2] = &v10;
  if (a2 != a3)
  {
    do
    {
      *uint64_t v4 = *a2;
      uint64_t v5 = a2[1];
      v4[1] = v5;
      if (v5) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(v5 + 8), 1uLL, memory_order_relaxed);
      }
      v4 += 2;
      a2 += 2;
    }
    while (a2 != a3);
    uint64_t v10 = v4;
  }
  char v8 = 1;
  sub_20DB5E624((uint64_t)v7);
  return v4;
}

uint64_t sub_20DB5E624(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    sub_20DB5E65C(a1);
  }
  return a1;
}

void sub_20DB5E65C(uint64_t a1)
{
  uint64_t v1 = **(void **)(a1 + 16);
  uint64_t v2 = **(void **)(a1 + 8);
  while (v1 != v2)
  {
    uint64_t v3 = *(std::__shared_weak_count **)(v1 - 8);
    if (v3) {
      sub_20DB5E6A0(v3);
    }
    v1 -= 16;
  }
}

void sub_20DB5E6A0(std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

void sub_20DB5E714(void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    sub_20DB5E768((uint64_t *)v2);
    uint64_t v3 = **a1;
    operator delete(v3);
  }
}

void sub_20DB5E768(uint64_t *a1)
{
  uint64_t v2 = *a1;
  for (uint64_t i = a1[1]; i != v2; i -= 16)
  {
    uint64_t v4 = *(std::__shared_weak_count **)(i - 8);
    if (v4) {
      sub_20DB5E6A0(v4);
    }
  }
  a1[1] = v2;
}

void *sub_20DB5E7B4(void *result, void *a2, void *a3, unint64_t a4)
{
  if (a4)
  {
    size_t v6 = result;
    sub_20DB5E518(result, a4);
    uint64_t result = sub_20DB5E83C((uint64_t)(v6 + 2), a2, a3, (void *)v6[1]);
    v6[1] = result;
  }
  return result;
}

void sub_20DB5E81C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  *(void *)(v9 + 8) = v10;
  sub_20DB5E714(&a9);
  _Unwind_Resume(a1);
}

void *sub_20DB5E83C(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v4 = a4;
  uint64_t v10 = a4;
  uint64_t v9 = a4;
  v7[0] = a1;
  v7[1] = &v9;
  v7[2] = &v10;
  if (a2 != a3)
  {
    do
    {
      *uint64_t v4 = *a2;
      uint64_t v5 = a2[1];
      v4[1] = v5;
      if (v5) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(v5 + 8), 1uLL, memory_order_relaxed);
      }
      v4 += 2;
      a2 += 2;
    }
    while (a2 != a3);
    uint64_t v10 = v4;
  }
  char v8 = 1;
  sub_20DB5E8CC((uint64_t)v7);
  return v4;
}

uint64_t sub_20DB5E8CC(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    sub_20DB5E65C(a1);
  }
  return a1;
}

void sub_20DB5E904(uint64_t *a1)
{
  if (*a1)
  {
    sub_20DB5E768(a1);
    operator delete((void *)*a1);
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
  }
}

void *sub_20DB5E940(uint64_t a1, uint64_t a2, void *a3)
{
  unint64_t v7 = (*(uint64_t (**)(void))(**(void **)a2 + 40))();
  unint64_t v8 = v7;
  unint64_t v9 = *(void *)(a1 + 8);
  if (v9)
  {
    uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    unint64_t v11 = v10.u32[0];
    if (v10.u32[0] > 1uLL)
    {
      unint64_t v3 = v7;
      if (v7 >= v9) {
        unint64_t v3 = v7 % v9;
      }
    }
    else
    {
      unint64_t v3 = (v9 - 1) & v7;
    }
    int64_t v12 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v12)
    {
      uint64_t v13 = *v12;
      if (*v12)
      {
        do
        {
          unint64_t v14 = v13[1];
          if (v14 == v8)
          {
            uint64_t v15 = (*(uint64_t (**)(void))(*(void *)v13[2] + 40))(v13[2]);
            if (v15 == (*(uint64_t (**)(void))(**(void **)a2 + 40))()) {
              return v13;
            }
          }
          else
          {
            if (v11 > 1)
            {
              if (v14 >= v9) {
                v14 %= v9;
              }
            }
            else
            {
              v14 &= v9 - 1;
            }
            if (v14 != v3) {
              break;
            }
          }
          uint64_t v13 = (void *)*v13;
        }
        while (v13);
      }
    }
  }
  uint64_t v16 = (void *)(a1 + 16);
  uint64_t v13 = operator new(0x20uLL);
  *uint64_t v13 = 0;
  v13[1] = v8;
  uint64_t v17 = a3[1];
  v13[2] = *a3;
  v13[3] = v17;
  if (v17) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v17 + 8), 1uLL, memory_order_relaxed);
  }
  float v18 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v19 = *(float *)(a1 + 32);
  if (!v9 || (float)(v19 * (float)v9) < v18)
  {
    BOOL v20 = 1;
    if (v9 >= 3) {
      BOOL v20 = (v9 & (v9 - 1)) != 0;
    }
    unint64_t v21 = v20 | (2 * v9);
    unint64_t v22 = vcvtps_u32_f32(v18 / v19);
    if (v21 <= v22) {
      size_t v23 = v22;
    }
    else {
      size_t v23 = v21;
    }
    sub_20DB5EC1C(a1, v23);
    unint64_t v9 = *(void *)(a1 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v8 >= v9) {
        unint64_t v3 = v8 % v9;
      }
      else {
        unint64_t v3 = v8;
      }
    }
    else
    {
      unint64_t v3 = (v9 - 1) & v8;
    }
  }
  uint64_t v24 = *(void *)a1;
  char v25 = *(void **)(*(void *)a1 + 8 * v3);
  if (v25)
  {
    *uint64_t v13 = *v25;
LABEL_40:
    *char v25 = v13;
    goto LABEL_41;
  }
  *uint64_t v13 = *v16;
  void *v16 = v13;
  *(void *)(v24 + 8 * v3) = v16;
  if (*v13)
  {
    unint64_t v26 = *(void *)(*v13 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v26 >= v9) {
        v26 %= v9;
      }
    }
    else
    {
      v26 &= v9 - 1;
    }
    char v25 = (void *)(*(void *)a1 + 8 * v26);
    goto LABEL_40;
  }
LABEL_41:
  ++*(void *)(a1 + 24);
  return v13;
}

void sub_20DB5EC00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  sub_20DB5EE68(v11, v10);
  _Unwind_Resume(a1);
}

void sub_20DB5EC1C(uint64_t a1, size_t __n)
{
  if (__n == 1)
  {
    size_t prime = 2;
  }
  else
  {
    size_t prime = __n;
    if ((__n & (__n - 1)) != 0) {
      size_t prime = std::__next_prime(__n);
    }
  }
  int8x8_t v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(void *)&v4) {
    goto LABEL_16;
  }
  if (prime < *(void *)&v4)
  {
    unint64_t v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      unint64_t v5 = std::__next_prime(v5);
    }
    else
    {
      uint64_t v7 = 1 << -(char)__clz(v5 - 1);
      if (v5 >= 2) {
        unint64_t v5 = v7;
      }
    }
    if (prime <= v5) {
      size_t prime = v5;
    }
    if (prime < *(void *)&v4)
    {
LABEL_16:
      sub_20DB5ED0C(a1, prime);
    }
  }
}

void sub_20DB5ED0C(uint64_t a1, unint64_t a2)
{
  if (a2)
  {
    if (a2 >> 61) {
      sub_20DB5DB74();
    }
    int8x8_t v4 = operator new(8 * a2);
    unint64_t v5 = *(void **)a1;
    *(void *)a1 = v4;
    if (v5) {
      operator delete(v5);
    }
    uint64_t v6 = 0;
    *(void *)(a1 + 8) = a2;
    do
      *(void *)(*(void *)a1 + 8 * v6++) = 0;
    while (a2 != v6);
    uint64_t v7 = *(void **)(a1 + 16);
    if (v7)
    {
      unint64_t v8 = v7[1];
      uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2) {
          v8 %= a2;
        }
      }
      else
      {
        v8 &= a2 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v8) = a1 + 16;
      uint64_t v11 = (void *)*v7;
      if (*v7)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= a2) {
              v12 %= a2;
            }
          }
          else
          {
            v12 &= a2 - 1;
          }
          if (v12 != v8)
          {
            if (!*(void *)(*(void *)a1 + 8 * v12))
            {
              *(void *)(*(void *)a1 + 8 * v12) = v7;
              goto LABEL_24;
            }
            *uint64_t v7 = *v11;
            *uint64_t v11 = **(void **)(*(void *)a1 + 8 * v12);
            **(void **)(*(void *)a1 + 8 * v12) = v11;
            uint64_t v11 = v7;
          }
          unint64_t v12 = v8;
LABEL_24:
          uint64_t v7 = v11;
          uint64_t v11 = (void *)*v11;
          unint64_t v8 = v12;
        }
        while (v11);
      }
    }
  }
  else
  {
    uint8x8_t v10 = *(void **)a1;
    *(void *)a1 = 0;
    if (v10) {
      operator delete(v10);
    }
    *(void *)(a1 + 8) = 0;
  }
}

void sub_20DB5EE68(uint64_t a1, void *__p)
{
  if (*(unsigned char *)(a1 + 8))
  {
    unint64_t v3 = (std::__shared_weak_count *)__p[3];
    if (v3) {
      sub_20DB5E6A0(v3);
    }
  }
  else if (!__p)
  {
    return;
  }

  operator delete(__p);
}

void sub_20DB5EEC4()
{
  std::operator+<char>();
  v0 = std::string::append(&v3, "[^\\n]*(?=\\n?)(?:\\n[ \\t].*?(?=\\n|$))*)");
  long long v1 = *(_OWORD *)&v0->__r_.__value_.__l.__data_;
  std::string::size_type v5 = v0->__r_.__value_.__r.__words[2];
  long long v4 = v1;
  v0->__r_.__value_.__l.__size_ = 0;
  v0->__r_.__value_.__r.__words[2] = 0;
  v0->__r_.__value_.__r.__words[0] = 0;
  sub_20DB5FAEC(&v2, (uint64_t)&v4, 1);
}

void sub_20DB5F2EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,void *a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,std::locale a47)
{
  if (__p) {
    operator delete(__p);
  }
  if (a33) {
    operator delete(a33);
  }
  *(void *)(v48 - 208) = v47;
  sub_20DB7ABD8((void ***)(v48 - 208));
  sub_20DB5FAAC(&a47);
  _Unwind_Resume(a1);
}

void sub_20DB5F3C4(void *a1@<X8>)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26772C038, memory_order_acquire) & 1) == 0)
  {
    if (__cxa_guard_acquire(&qword_26772C038)) {
      sub_20DB6B684((const std::locale *)&unk_26772BFF8, "(?:^|\\n)[ \\t]*(-(.|\\n)*?)(?=\\n[ \\t]*-|$)", 0);
    }
  }
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  sub_20DB7AA9C(&__s1, "options:");
  sub_20DB5EEC4();
}

void sub_20DB5F79C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,void *a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,void *__p,uint64_t a52,int a53,__int16 a54,char a55,char a56,char a57)
{
}

void sub_20DB5F8EC(void (***a1)(void **__return_ptr)@<X0>, uint64_t a2@<X8>)
{
  (**a1)(&v5);
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  std::string v3 = v5;
  long long v4 = v6;
  unint64_t v8 = (void **)a2;
  if (v5 != v6)
  {
    do
    {
      uint64_t v7 = *v3;
      sub_20DB78408(&v8, &v7);
      ++v3;
    }
    while (v3 != v4);
    std::string v3 = v5;
  }
  if (v3)
  {
    uint64_t v6 = v3;
    operator delete(v3);
  }
}

void sub_20DB5F9A0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  uint64_t v13 = *(void **)v11;
  if (*(void *)v11)
  {
    *(void *)(v11 + 8) = v13;
    operator delete(v13);
  }
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_20DB5F9CC(void (***a1)(void **__return_ptr)@<X0>, uint64_t a2@<X8>)
{
  (**a1)(&v5);
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  std::string v3 = v5;
  long long v4 = v6;
  unint64_t v8 = (void **)a2;
  if (v5 != v6)
  {
    do
    {
      uint64_t v7 = *v3;
      sub_20DB78408(&v8, &v7);
      ++v3;
    }
    while (v3 != v4);
    std::string v3 = v5;
  }
  if (v3)
  {
    uint64_t v6 = v3;
    operator delete(v3);
  }
}

void sub_20DB5FA80(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  uint64_t v13 = *(void **)v11;
  if (*(void *)v11)
  {
    *(void *)(v11 + 8) = v13;
    operator delete(v13);
  }
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_20DB5FAAC(std::locale *this)
{
  locale = (std::__shared_weak_count *)this[6].__locale_;
  if (locale) {
    sub_20DB5E6A0(locale);
  }

  std::locale::~locale(this);
}

void sub_20DB5FAEC(const std::locale *a1, uint64_t a2, int a3)
{
  long long v4 = sub_20DB5FB8C(a1);
  LODWORD(v4[3].__locale_) = a3;
  *(_OWORD *)((char *)&v4[3].__locale_ + 4) = 0u;
  *(_OWORD *)((char *)&v4[5].__locale_ + 4) = 0u;
  HIDWORD(v4[7].__locale_) = 0;
  sub_20DB5FBEC();
}

void sub_20DB5FB6C(_Unwind_Exception *a1)
{
  locale = (std::__shared_weak_count *)v1[6].__locale_;
  if (locale) {
    sub_20DB5E6A0(locale);
  }
  std::locale::~locale(v1);
  _Unwind_Resume(a1);
}

const std::locale *sub_20DB5FB8C(const std::locale *a1)
{
  std::locale v2 = (const std::locale *)MEMORY[0x210564AC0]();
  a1[1].__locale_ = (std::locale::__imp *)std::locale::use_facet(v2, MEMORY[0x263F8C108]);
  a1[2].__locale_ = (std::locale::__imp *)std::locale::use_facet(a1, MEMORY[0x263F8C130]);
  return a1;
}

void sub_20DB5FBD8(_Unwind_Exception *a1)
{
  std::locale::~locale(v1);
  _Unwind_Resume(a1);
}

void sub_20DB5FBEC()
{
}

void sub_20DB5FDAC(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

void sub_20DB5FDE0()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x210564930](exception, 17);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_20DB5FE24(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_20DB5FE38(uint64_t a1, uint64_t a2)
{
  sub_20DB60460(&v2, a2);
}

unsigned __int8 *sub_20DB5FE80(uint64_t a1, unsigned __int8 *a2, char *a3)
{
  uint64_t v6 = sub_20DB607E4(a1, a2, a3);
  if (v6 == a2) {
    operator new();
  }
  if (v6 == (unsigned __int8 *)a3) {
    return (unsigned __int8 *)a3;
  }
  if (*v6 == 124)
  {
    if (v6 + 1 == sub_20DB607E4(a1, v6 + 1, a3)) {
      operator new();
    }
    sub_20DB60830();
  }
  return v6;
}

unsigned __int8 *sub_20DB5FFB8(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  std::string v3 = a2;
  if (a2 == a3) {
    return a2;
  }
  long long v4 = a3;
  if (*a2 == 94) {
    sub_20DB610FC();
  }
  if (a2 != a3)
  {
    do
    {
      uint64_t v6 = v3;
      std::string v3 = sub_20DB68464(a1, v3, v4);
    }
    while (v6 != v3);
    if (v6 != v4)
    {
      if (v6 + 1 == v4 && *v6 == 36) {
        sub_20DB61180();
      }
      sub_20DB6840C();
    }
  }
  return v4;
}

char *sub_20DB60068(uint64_t a1, char *a2, char *a3)
{
  uint64_t v6 = sub_20DB68B04(a1, a2, a3);
  if (v6 == (unsigned __int8 *)a2) {
LABEL_8:
  }
    sub_20DB6840C();
  uint64_t v7 = v6;
  if (v6 == (unsigned __int8 *)a3) {
    return a3;
  }
  if (*v6 == 124)
  {
    if (v6 + 1 != sub_20DB68B04(a1, (char *)v6 + 1, a3)) {
      sub_20DB60830();
    }
    goto LABEL_8;
  }
  return (char *)v7;
}

unsigned __int8 *sub_20DB6010C(uint64_t a1, unsigned __int8 *__s, unsigned __int8 *a3)
{
  uint64_t v6 = (unsigned __int8 *)memchr(__s, 10, a3 - __s);
  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = a3;
  }
  if (v7 == __s) {
    operator new();
  }
  sub_20DB5FFB8(a1, __s, v7);
  if (v7 == a3) {
    uint8x8_t v10 = v7;
  }
  else {
    uint8x8_t v10 = v7 + 1;
  }
  if (v10 != a3)
  {
    unint64_t v8 = (unsigned __int8 *)memchr(v10, 10, a3 - v10);
    if (v8) {
      uint8x8_t v9 = v8;
    }
    else {
      uint8x8_t v9 = a3;
    }
    if (v9 != v10)
    {
      sub_20DB5FFB8(a1, v10, v9);
      sub_20DB60830();
    }
    operator new();
  }
  return a3;
}

char *sub_20DB60274(uint64_t a1, char *__s, char *a3)
{
  uint64_t v6 = (char *)memchr(__s, 10, a3 - __s);
  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = a3;
  }
  if (v7 == __s) {
    operator new();
  }
  sub_20DB60068(a1, __s, v7);
  if (v7 == a3) {
    uint8x8_t v10 = v7;
  }
  else {
    uint8x8_t v10 = v7 + 1;
  }
  if (v10 != a3)
  {
    unint64_t v8 = (char *)memchr(v10, 10, a3 - v10);
    if (v8) {
      uint8x8_t v9 = v8;
    }
    else {
      uint8x8_t v9 = a3;
    }
    if (v9 != v10)
    {
      sub_20DB60068(a1, v10, v9);
      sub_20DB60830();
    }
    operator new();
  }
  return a3;
}

void sub_20DB603DC()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x210564930](exception, 14);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_20DB60420(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_20DB60438()
{
}

void sub_20DB6044C(uint64_t a1, _DWORD *a2)
{
  *a2 = -1000;
}

void sub_20DB60460(void *a1, uint64_t a2)
{
  *a1 = a2;
  operator new();
}

void sub_20DB604C8(_Unwind_Exception *exception_object)
{
  if (v1) {
    sub_20DB7C978(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_20DB604E4(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x210564B70);
}

uint64_t sub_20DB6051C(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

uint64_t sub_20DB6054C(uint64_t a1, uint64_t a2)
{
  if (sub_20DB60590(a2, (uint64_t)&unk_26C244448)) {
    return a1 + 24;
  }
  else {
    return 0;
  }
}

BOOL sub_20DB60590(uint64_t a1, uint64_t a2)
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

void *sub_20DB605E0(void *a1)
{
  *a1 = &unk_26C244DC0;
  uint64_t v2 = a1[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  return a1;
}

void sub_20DB6064C(void *a1)
{
  *a1 = &unk_26C244DC0;
  uint64_t v1 = a1[1];
  if (v1) {
    (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  }

  JUMPOUT(0x210564B70);
}

uint64_t sub_20DB606D8(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -994;
  *(void *)(a2 + 80) = *(void *)(result + 8);
  return result;
}

void *sub_20DB606EC(void *a1)
{
  *a1 = &unk_26C244DC0;
  uint64_t v2 = a1[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  return a1;
}

void sub_20DB60758(void *a1)
{
  *a1 = &unk_26C244DC0;
  uint64_t v1 = a1[1];
  if (v1) {
    (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  }

  JUMPOUT(0x210564B70);
}

unsigned __int8 *sub_20DB607E4(uint64_t a1, unsigned __int8 *a2, char *a3)
{
  do
  {
    std::string::size_type v5 = a2;
    a2 = sub_20DB60938(a1, (char *)a2, a3);
  }
  while (v5 != a2);
  return v5;
}

void sub_20DB60830()
{
}

unsigned __int8 *sub_20DB60938(uint64_t a1, char *a2, char *a3)
{
  uint64_t result = (unsigned __int8 *)sub_20DB609E0(a1, a2, a3);
  if (result == (unsigned __int8 *)a2)
  {
    uint64_t v7 = sub_20DB60BF8(a1, (unsigned __int8 *)a2, a3);
    uint64_t result = (unsigned __int8 *)a2;
    if (v7 != (unsigned __int8 *)a2)
    {
      return sub_20DB60DF0(a1, v7, (unsigned __int8 *)a3);
    }
  }
  return result;
}

char *sub_20DB609E0(uint64_t a1, char *a2, char *a3)
{
  if (a2 != a3)
  {
    int v6 = *a2;
    if (v6 > 91)
    {
      if (v6 == 92)
      {
        if (a2 + 1 != a3)
        {
          int v9 = a2[1];
          if (v9 == 66 || v9 == 98) {
            sub_20DB61204();
          }
        }
      }
      else if (v6 == 94)
      {
        sub_20DB610FC();
      }
    }
    else
    {
      if (v6 == 36) {
        sub_20DB61180();
      }
      if (v6 == 40 && a2 + 1 != a3 && a2[1] == 63 && a2 + 2 != a3)
      {
        int v7 = a2[2];
        if (v7 == 33)
        {
          sub_20DB5FB8C(v10);
          long long v11 = 0u;
          uint64_t v13 = 0;
          long long v12 = 0u;
          LODWORD(v11) = *(_DWORD *)(a1 + 24);
          sub_20DB5FBEC(v10, a2 + 3, a3);
          sub_20DB61298();
        }
        if (v7 == 61)
        {
          sub_20DB5FB8C(v10);
          long long v11 = 0u;
          uint64_t v13 = 0;
          long long v12 = 0u;
          LODWORD(v11) = *(_DWORD *)(a1 + 24);
          sub_20DB5FBEC(v10, a2 + 3, a3);
          sub_20DB61298();
        }
      }
    }
  }
  return a2;
}

void sub_20DB60BD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9)
{
}

unsigned __int8 *sub_20DB60BF8(uint64_t a1, unsigned __int8 *a2, char *a3)
{
  uint64_t v3 = a2;
  if (a2 != (unsigned __int8 *)a3)
  {
    int v6 = (char)*a2;
    if (v6 <= 62)
    {
      if (v6 != 40)
      {
        if (v6 == 46) {
          operator new();
        }
        if ((v6 - 42) >= 2) {
          return sub_20DB62FF0(a1, a2, a3);
        }
LABEL_28:
        sub_20DB62F98();
      }
      unint64_t v8 = a2 + 1;
      if (a2 + 1 != (unsigned __int8 *)a3)
      {
        if (a2 + 2 != (unsigned __int8 *)a3 && *v8 == 63 && a2[2] == 58)
        {
          ++*(_DWORD *)(a1 + 36);
          int v9 = (char *)sub_20DB5FE80(a1, a2 + 3, a3);
          if (v9 != a3 && *v9 == 41)
          {
            --*(_DWORD *)(a1 + 36);
            return (unsigned __int8 *)(v9 + 1);
          }
        }
        else
        {
          sub_20DB62E98(a1);
          ++*(_DWORD *)(a1 + 36);
          uint8x8_t v10 = (char *)sub_20DB5FE80(a1, v8, a3);
          if (v10 != a3)
          {
            long long v11 = v10;
            if (*v10 == 41)
            {
              sub_20DB62F1C(a1);
              --*(_DWORD *)(a1 + 36);
              return (unsigned __int8 *)(v11 + 1);
            }
          }
        }
      }
      sub_20DB61340();
    }
    if (v6 > 91)
    {
      if (v6 == 92) {
        return sub_20DB62CE0(a1, a2, (unsigned __int8 *)a3);
      }
      if (v6 == 123) {
        goto LABEL_28;
      }
    }
    else
    {
      if (v6 == 91) {
        return sub_20DB62D84(a1, a2, a3);
      }
      if (v6 == 63) {
        goto LABEL_28;
      }
    }
    return sub_20DB62FF0(a1, a2, a3);
  }
  return v3;
}

unsigned __int8 *sub_20DB60DF0(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  if (a2 == a3) {
    return a2;
  }
  int v5 = (char)*a2;
  if (v5 <= 62)
  {
    if (v5 == 42 || (int v6 = a2, v5 == 43)) {
LABEL_18:
    }
      sub_20DB67DB8();
    return v6;
  }
  if (v5 == 63) {
    goto LABEL_18;
  }
  int v6 = a2;
  if (v5 == 123)
  {
    int v7 = a2 + 1;
    unint64_t v8 = sub_20DB67F48(a1, a2 + 1, a3, &v14);
    if (v7 == v8) {
      goto LABEL_24;
    }
    if (v8 != a3)
    {
      int v9 = (char)*v8;
      if (v9 != 44)
      {
        if (v9 == 125) {
          goto LABEL_18;
        }
LABEL_24:
        sub_20DB67FE8();
      }
      uint8x8_t v10 = v8 + 1;
      if (v8 + 1 == a3) {
        goto LABEL_24;
      }
      if (*v10 == 125) {
        goto LABEL_18;
      }
      int v13 = -1;
      long long v12 = sub_20DB67F48(a1, v10, a3, &v13);
      if (v10 != v12 && v12 != a3 && *v12 == 125)
      {
        if (v13 >= v14) {
          goto LABEL_18;
        }
        goto LABEL_24;
      }
    }
    sub_20DB68040();
  }
  return v6;
}

void sub_20DB610FC()
{
}

void sub_20DB61180()
{
}

void sub_20DB61204()
{
}

void sub_20DB61298()
{
}

void sub_20DB6131C(_Unwind_Exception *a1)
{
  MEMORY[0x210564B70](v1, 0x10E1C4030FC3181);
  _Unwind_Resume(a1);
}

void sub_20DB61340()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x210564930](exception, 6);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_20DB61384(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void *sub_20DB61398(void *a1)
{
  *a1 = &unk_26C244DC0;
  uint64_t v2 = a1[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  return a1;
}

void sub_20DB61404(void *a1)
{
  *a1 = &unk_26C244DC0;
  uint64_t v1 = a1[1];
  if (v1) {
    (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  }

  JUMPOUT(0x210564B70);
}

uint64_t sub_20DB61490(uint64_t result, uint64_t a2)
{
  if (*(unsigned char *)(a2 + 92))
  {
    if (*(void *)(a2 + 16) != *(void *)(a2 + 8) || (*(unsigned char *)(a2 + 88) & 1) != 0)
    {
LABEL_12:
      uint64_t v4 = 0;
      *(_DWORD *)a2 = -993;
      goto LABEL_13;
    }
  }
  else
  {
    if (!*(unsigned char *)(result + 16)) {
      goto LABEL_12;
    }
    int v2 = *(unsigned __int8 *)(*(void *)(a2 + 16) - 1);
    if (v2 != 13 && v2 != 10) {
      goto LABEL_12;
    }
  }
  *(_DWORD *)a2 = -994;
  uint64_t v4 = *(void *)(result + 8);
LABEL_13:
  *(void *)(a2 + 80) = v4;
  return result;
}

void *sub_20DB614F0(void *a1)
{
  *a1 = &unk_26C244DC0;
  uint64_t v2 = a1[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  return a1;
}

void sub_20DB6155C(void *a1)
{
  *a1 = &unk_26C244DC0;
  uint64_t v1 = a1[1];
  if (v1) {
    (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  }

  JUMPOUT(0x210564B70);
}

uint64_t sub_20DB615E8(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(unsigned __int8 **)(a2 + 16);
  if (v2 == *(unsigned __int8 **)(a2 + 24) && (*(unsigned char *)(a2 + 88) & 2) == 0
    || *(unsigned char *)(result + 16) && ((v3 = *v2, v3 != 13) ? (BOOL v4 = v3 == 10) : (BOOL v4 = 1), v4))
  {
    *(_DWORD *)a2 = -994;
    uint64_t v5 = *(void *)(result + 8);
  }
  else
  {
    uint64_t v5 = 0;
    *(_DWORD *)a2 = -993;
  }
  *(void *)(a2 + 80) = v5;
  return result;
}

std::locale *sub_20DB61638(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_26C244D60;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)&unk_26C244DC0;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  return a1;
}

void sub_20DB616C4(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_26C244D60;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)&unk_26C244DC0;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }

  JUMPOUT(0x210564B70);
}

uint64_t sub_20DB61770(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(unsigned __int8 **)(a2 + 8);
  int v3 = *(unsigned __int8 **)(a2 + 24);
  if (v2 == v3) {
    goto LABEL_17;
  }
  BOOL v4 = *(unsigned __int8 **)(a2 + 16);
  if (v4 == v3)
  {
    if ((*(unsigned char *)(a2 + 88) & 8) == 0)
    {
      uint64_t v6 = *(v3 - 1);
      goto LABEL_13;
    }
LABEL_17:
    int v10 = 0;
    goto LABEL_25;
  }
  if (v4 == v2)
  {
    int v5 = *(_DWORD *)(a2 + 88);
    if ((v5 & 0x80) == 0)
    {
      if ((v5 & 4) == 0)
      {
        uint64_t v6 = *v2;
LABEL_13:
        if (v6 == 95
          || (v6 & 0x80) == 0 && (*(_DWORD *)(*(void *)(*(void *)(result + 24) + 16) + 4 * v6) & 0x500) != 0)
        {
          int v10 = 1;
          goto LABEL_25;
        }
        goto LABEL_17;
      }
      goto LABEL_17;
    }
  }
  uint64_t v7 = *(v4 - 1);
  uint64_t v8 = *v4;
  int v9 = v7 == 95 || (v7 & 0x80) == 0 && (*(_DWORD *)(*(void *)(*(void *)(result + 24) + 16) + 4 * v7) & 0x500) != 0;
  int v11 = v8 == 95
     || (v8 & 0x80) == 0 && (*(_DWORD *)(*(void *)(*(void *)(result + 24) + 16) + 4 * v8) & 0x500) != 0;
  int v10 = v9 != v11;
LABEL_25:
  if (*(unsigned __int8 *)(result + 40) == v10)
  {
    uint64_t v12 = 0;
    int v13 = -993;
  }
  else
  {
    uint64_t v12 = *(void *)(result + 8);
    int v13 = -994;
  }
  *(_DWORD *)a2 = v13;
  *(void *)(a2 + 80) = v12;
  return result;
}

uint64_t sub_20DB61884(uint64_t a1, uint64_t a2, char a3, uint64_t a4, int a5)
{
  *(void *)a1 = &unk_26C244CA0;
  *(void *)(a1 + 8) = a4;
  std::locale::locale((std::locale *)(a1 + 16), (const std::locale *)a2);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 24);
  uint64_t v9 = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 40);
  *(void *)(a1 + 64) = v9;
  if (v9) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v9 + 8), 1uLL, memory_order_relaxed);
  }
  *(void *)(a1 + 72) = *(void *)(a2 + 56);
  *(_DWORD *)(a1 + 80) = a5;
  *(unsigned char *)(a1 + 84) = a3;
  return a1;
}

std::locale *sub_20DB61914(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_26C244CA0;
  uint64_t v2 = a1 + 2;
  locale = (std::__shared_weak_count *)a1[8].__locale_;
  if (locale) {
    sub_20DB5E6A0(locale);
  }
  std::locale::~locale(v2);
  a1->__locale_ = (std::locale::__imp *)&unk_26C244DC0;
  BOOL v4 = a1[1].__locale_;
  if (v4) {
    (*(void (**)(std::locale::__imp *))(*(void *)v4 + 8))(v4);
  }
  return a1;
}

void sub_20DB619B4(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_26C244CA0;
  uint64_t v2 = a1 + 2;
  locale = (std::__shared_weak_count *)a1[8].__locale_;
  if (locale) {
    sub_20DB5E6A0(locale);
  }
  std::locale::~locale(v2);
  a1->__locale_ = (std::locale::__imp *)&unk_26C244DC0;
  BOOL v4 = a1[1].__locale_;
  if (v4) {
    (*(void (**)(std::locale::__imp *))(*(void *)v4 + 8))(v4);
  }

  JUMPOUT(0x210564B70);
}

void sub_20DB61A74(uint64_t a1, uint64_t a2)
{
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  char v25 = 0;
  long long v26 = 0uLL;
  char v27 = 0;
  char v28 = 0;
  uint64_t v29 = 0;
  __p = 0;
  float v19 = 0;
  unint64_t v4 = (*(_DWORD *)(a1 + 44) + 1);
  uint64_t v6 = *(void *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 24);
  uint64_t v20 = 0;
  *(void *)&long long v21 = v5;
  *((void *)&v21 + 1) = v5;
  char v22 = 0;
  sub_20DB620E4((char **)&__p, v4, &v21);
  uint64_t v23 = v6;
  uint64_t v24 = v6;
  char v25 = 0;
  long long v26 = v21;
  char v27 = v22;
  uint64_t v29 = v6;
  char v28 = 1;
  uint64_t v7 = *(void *)(a2 + 16);
  if (*(unsigned char *)(a2 + 92)) {
    BOOL v8 = v7 == *(void *)(a2 + 8);
  }
  else {
    BOOL v8 = 0;
  }
  char v9 = v8;
  if (*(unsigned __int8 *)(a1 + 84) == sub_20DB61C74(a1 + 16, v7, *(void *)(a2 + 24), (uint64_t *)&__p, *(_DWORD *)(a2 + 88) & 0xFBF | 0x40u, v9))
  {
    *(_DWORD *)a2 = -993;
    *(void *)(a2 + 80) = 0;
    int v10 = (char *)__p;
    goto LABEL_13;
  }
  *(_DWORD *)a2 = -994;
  *(void *)(a2 + 80) = *(void *)(a1 + 8);
  int v10 = (char *)__p;
  unint64_t v11 = 0xAAAAAAAAAAAAAAABLL * ((v19 - (unsigned char *)__p) >> 3);
  if (v11 < 2)
  {
LABEL_13:
    if (!v10) {
      return;
    }
    goto LABEL_14;
  }
  int v12 = 0;
  int v13 = *(_DWORD *)(a1 + 80);
  uint64_t v14 = *(void *)(a2 + 32);
  unint64_t v15 = 1;
  do
  {
    uint64_t v16 = &v10[24 * v15];
    uint64_t v17 = v14 + 24 * (v13 + v12);
    *(_OWORD *)uint64_t v17 = *(_OWORD *)v16;
    *(unsigned char *)(v17 + 16) = v16[16];
    unint64_t v15 = (v12 + 2);
    ++v12;
  }
  while (v11 > v15);
LABEL_14:
  float v19 = v10;
  operator delete(v10);
}

void sub_20DB61BE0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

char *sub_20DB61C00(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, char a5)
{
  *(void *)(a1 + 24) = a4;
  BOOL v8 = (_OWORD *)(a1 + 24);
  *(void *)(a1 + 32) = a4;
  *(unsigned char *)(a1 + 40) = 0;
  uint64_t result = sub_20DB620E4((char **)a1, a2, (long long *)(a1 + 24));
  *(void *)(a1 + 48) = a3;
  *(void *)(a1 + 56) = a3;
  *(unsigned char *)(a1 + 64) = 0;
  *(_OWORD *)(a1 + 72) = *v8;
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a1 + 40);
  if ((a5 & 1) == 0) {
    *(void *)(a1 + 104) = a3;
  }
  *(unsigned char *)(a1 + 96) = 1;
  return result;
}

uint64_t sub_20DB61C74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, int a5, char a6)
{
  v42 = 0;
  v43 = 0;
  unint64_t v44 = 0;
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6)
  {
    *(void *)&long long v40 = a3;
    *((void *)&v40 + 1) = a3;
    char v41 = 0;
    *(_DWORD *)uint64_t v37 = 0;
    memset(&v37[8], 0, 48);
    *(_OWORD *)__p = 0u;
    memset(v39, 0, 21);
    v43 = (_OWORD *)sub_20DB62458((uint64_t *)&v42, (uint64_t)v37);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    if (*(void *)&v37[32])
    {
      *(void *)&v37[40] = *(void *)&v37[32];
      operator delete(*(void **)&v37[32]);
    }
    v35 = a4;
    int v12 = v43;
    *((_DWORD *)v43 - 24) = 0;
    *((void *)v12 - 11) = a2;
    *((void *)v12 - 10) = a2;
    *((void *)v12 - 9) = a3;
    sub_20DB6233C((uint64_t)(v12 - 4), *(unsigned int *)(a1 + 28), &v40);
    sub_20DB62378((uint64_t)v43 - 40, *(unsigned int *)(a1 + 32));
    int v13 = v43;
    *((void *)v43 - 2) = v6;
    *((_DWORD *)v13 - 2) = a5;
    *((unsigned char *)v13 - 4) = a6;
    unsigned int v14 = 1;
    while (2)
    {
      if ((v14 & 0xFFF) == 0 && (int)(v14 >> 12) >= (int)a3 - (int)a2) {
        sub_20DB623A8();
      }
      uint64_t v16 = v13 - 1;
      uint64_t v15 = *((void *)v13 - 2);
      uint64_t v17 = v13 - 6;
      if (v15) {
        (*(void (**)(uint64_t, _OWORD *))(*(void *)v15 + 16))(v15, v13 - 6);
      }
      switch(*(_DWORD *)v17)
      {
        case 0xFFFFFC18:
          uint64_t v18 = *((void *)v13 - 10);
          if ((a5 & 0x20) != 0 && v18 == a2 || (a5 & 0x1000) != 0 && v18 != a3) {
            goto LABEL_16;
          }
          uint64_t v26 = *v35;
          *(void *)uint64_t v26 = a2;
          *(void *)(v26 + 8) = v18;
          *(unsigned char *)(v26 + 16) = 1;
          uint64_t v27 = *((void *)v13 - 8);
          uint64_t v28 = *((void *)v13 - 7) - v27;
          if (v28)
          {
            unint64_t v29 = 0xAAAAAAAAAAAAAAABLL * (v28 >> 3);
            v30 = (unsigned char *)(v27 + 16);
            unsigned int v31 = 1;
            do
            {
              uint64_t v32 = v26 + 24 * v31;
              *(_OWORD *)uint64_t v32 = *((_OWORD *)v30 - 1);
              char v33 = *v30;
              v30 += 24;
              *(unsigned char *)(v32 + 16) = v33;
            }
            while (v29 > v31++);
          }
          uint64_t v6 = 1;
          break;
        case 0xFFFFFC1D:
        case 0xFFFFFC1E:
        case 0xFFFFFC21:
          goto LABEL_23;
        case 0xFFFFFC1F:
LABEL_16:
          float v19 = v43 - 6;
          sub_20DB627D8((uint64_t)&v44, (void *)v43 - 12);
          v43 = v19;
          goto LABEL_23;
        case 0xFFFFFC20:
          long long v20 = *(v13 - 5);
          *(_OWORD *)uint64_t v37 = *v17;
          *(_OWORD *)&v37[16] = v20;
          memset(&v37[32], 0, 24);
          sub_20DB62B54(&v37[32], *((long long **)v13 - 8), *((long long **)v13 - 7), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)v13 - 7) - *((void *)v13 - 8)) >> 3));
          __p[0] = 0;
          __p[1] = 0;
          v39[0] = 0;
          sub_20DB62BD4((char *)__p, *((long long **)v13 - 5), *((long long **)v13 - 4), (uint64_t)(*((void *)v13 - 4) - *((void *)v13 - 5)) >> 4);
          uint64_t v21 = *v16;
          *(void *)((char *)&v39[1] + 5) = *(void *)((char *)v13 - 11);
          v39[1] = v21;
          (*(void (**)(void, uint64_t, _OWORD *))(*(void *)*v16 + 24))(*v16, 1, v13 - 6);
          (*(void (**)(void, void, unsigned char *))(*(void *)v39[1] + 24))(v39[1], 0, v37);
          char v22 = v43;
          if ((unint64_t)v43 >= v44)
          {
            v43 = (_OWORD *)sub_20DB62458((uint64_t *)&v42, (uint64_t)v37);
            if (__p[0])
            {
              __p[1] = __p[0];
              operator delete(__p[0]);
            }
          }
          else
          {
            long long v23 = *(_OWORD *)&v37[16];
            _OWORD *v43 = *(_OWORD *)v37;
            v22[1] = v23;
            *((void *)v22 + 4) = 0;
            *((void *)v22 + 5) = 0;
            *((void *)v22 + 6) = 0;
            *((void *)v22 + 7) = 0;
            v22[2] = *(_OWORD *)&v37[32];
            *((void *)v22 + 6) = *(void *)&v37[48];
            memset(&v37[32], 0, 24);
            *((void *)v22 + 8) = 0;
            *((void *)v22 + 9) = 0;
            *(_OWORD *)((char *)v22 + 56) = *(_OWORD *)__p;
            *((void *)v22 + 9) = v39[0];
            __p[0] = 0;
            __p[1] = 0;
            v39[0] = 0;
            uint64_t v24 = v39[1];
            *(void *)((char *)v22 + 85) = *(void *)((char *)&v39[1] + 5);
            *((void *)v22 + 10) = v24;
            v43 = v22 + 6;
          }
          if (*(void *)&v37[32])
          {
            *(void *)&v37[40] = *(void *)&v37[32];
            operator delete(*(void **)&v37[32]);
          }
LABEL_23:
          int v13 = v43;
          ++v14;
          if (v42 != v43) {
            continue;
          }
          uint64_t v6 = 0;
          break;
        default:
          sub_20DB62400();
      }
      break;
    }
  }
  *(void *)uint64_t v37 = &v42;
  sub_20DB62C48((void ***)v37);
  return v6;
}

void sub_20DB62064(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18)
{
  sub_20DB622F8(&a13);
  a13 = v18 - 112;
  sub_20DB62C48((void ***)&a13);
  _Unwind_Resume(a1);
}

char *sub_20DB620E4(char **a1, unint64_t a2, long long *a3)
{
  uint64_t v6 = (uint64_t)a1[2];
  uint64_t result = *a1;
  if (0xAAAAAAAAAAAAAAABLL * ((v6 - (uint64_t)result) >> 3) >= a2)
  {
    uint64_t v15 = a1[1];
    unint64_t v16 = (v15 - result) / 24;
    if (v16 >= a2) {
      uint64_t v17 = a2;
    }
    else {
      uint64_t v17 = (v15 - result) / 24;
    }
    if (v17)
    {
      uint64_t v18 = result;
      do
      {
        *(_OWORD *)uint64_t v18 = *a3;
        v18[16] = *((unsigned char *)a3 + 16);
        v18 += 24;
        --v17;
      }
      while (v17);
    }
    if (a2 <= v16)
    {
      a1[1] = &result[24 * a2];
    }
    else
    {
      float v19 = &v15[24 * (a2 - v16)];
      uint64_t v20 = 24 * a2 - 24 * v16;
      do
      {
        long long v21 = *a3;
        *((void *)v15 + 2) = *((void *)a3 + 2);
        *(_OWORD *)uint64_t v15 = v21;
        v15 += 24;
        v20 -= 24;
      }
      while (v20);
      a1[1] = v19;
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
    if (a2 > 0xAAAAAAAAAAAAAAALL) {
      sub_20DB5E168();
    }
    unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * (v6 >> 3);
    uint64_t v9 = 2 * v8;
    if (2 * v8 <= a2) {
      uint64_t v9 = a2;
    }
    if (v8 >= 0x555555555555555) {
      unint64_t v10 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v10 = v9;
    }
    uint64_t result = sub_20DB6225C(a1, v10);
    unint64_t v11 = a1[1];
    int v12 = &v11[24 * a2];
    uint64_t v13 = 24 * a2;
    do
    {
      long long v14 = *a3;
      *((void *)v11 + 2) = *((void *)a3 + 2);
      *(_OWORD *)unint64_t v11 = v14;
      v11 += 24;
      v13 -= 24;
    }
    while (v13);
    a1[1] = v12;
  }
  return result;
}

char *sub_20DB6225C(void *a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    sub_20DB5E168();
  }
  uint64_t result = (char *)sub_20DB622B0((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[24 * v4];
  return result;
}

void *sub_20DB622B0(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    sub_20DB5DB74();
  }
  return operator new(24 * a2);
}

void *sub_20DB622F8(void *a1)
{
  uint64_t v2 = (void *)a1[7];
  if (v2)
  {
    a1[8] = v2;
    operator delete(v2);
  }
  int v3 = (void *)a1[4];
  if (v3)
  {
    a1[5] = v3;
    operator delete(v3);
  }
  return a1;
}

void sub_20DB6233C(uint64_t a1, unint64_t a2, long long *a3)
{
  unint64_t v3 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 3);
  BOOL v4 = a2 >= v3;
  unint64_t v5 = a2 - v3;
  if (v5 != 0 && v4)
  {
    sub_20DB628AC((void **)a1, v5, a3);
  }
  else if (!v4)
  {
    *(void *)(a1 + 8) = *(void *)a1 + 24 * a2;
  }
}

void sub_20DB62378(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 4;
  if (a2 <= v2)
  {
    if (a2 < v2) {
      *(void *)(a1 + 8) = *(void *)a1 + 16 * a2;
    }
  }
  else
  {
    sub_20DB62A34((void **)a1, a2 - v2);
  }
}

void sub_20DB623A8()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x210564930](exception, 12);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_20DB623EC(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_20DB62400()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x210564930](exception, 16);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_20DB62444(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_20DB62458(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 5);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0x2AAAAAAAAAAAAAALL) {
    sub_20DB5E168();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 5);
  if (2 * v8 > v5) {
    unint64_t v5 = 2 * v8;
  }
  if (v8 >= 0x155555555555555) {
    unint64_t v9 = 0x2AAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v9 = v5;
  }
  v16[4] = a1 + 2;
  if (v9) {
    unint64_t v10 = (char *)sub_20DB62620(v7, v9);
  }
  else {
    unint64_t v10 = 0;
  }
  unint64_t v11 = &v10[96 * v4];
  v16[0] = v10;
  v16[1] = v11;
  v16[3] = &v10[96 * v9];
  long long v12 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)unint64_t v11 = *(_OWORD *)a2;
  *((_OWORD *)v11 + 1) = v12;
  *((void *)v11 + 5) = 0;
  *((void *)v11 + 6) = 0;
  *((void *)v11 + 4) = 0;
  *((_OWORD *)v11 + 2) = *(_OWORD *)(a2 + 32);
  *((void *)v11 + 6) = *(void *)(a2 + 48);
  *(void *)(a2 + 32) = 0;
  *(void *)(a2 + 40) = 0;
  *(void *)(a2 + 48) = 0;
  *((void *)v11 + 7) = 0;
  *((void *)v11 + 8) = 0;
  *((void *)v11 + 9) = 0;
  *(_OWORD *)(v11 + 56) = *(_OWORD *)(a2 + 56);
  *((void *)v11 + 9) = *(void *)(a2 + 72);
  *(void *)(a2 + 56) = 0;
  *(void *)(a2 + 64) = 0;
  *(void *)(a2 + 72) = 0;
  uint64_t v13 = *(void *)(a2 + 80);
  *(void *)(v11 + 85) = *(void *)(a2 + 85);
  *((void *)v11 + 10) = v13;
  v16[2] = v11 + 96;
  sub_20DB625A8(a1, v16);
  uint64_t v14 = a1[1];
  sub_20DB62830(v16);
  return v14;
}

void sub_20DB62594(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_20DB62830((void **)va);
  _Unwind_Resume(a1);
}

uint64_t sub_20DB625A8(uint64_t *a1, void *a2)
{
  uint64_t result = sub_20DB62668((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
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

void *sub_20DB62620(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x2AAAAAAAAAAAAABLL) {
    sub_20DB5DB74();
  }
  return operator new(96 * a2);
}

uint64_t sub_20DB62668(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
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
      long long v8 = *(_OWORD *)(a3 - 80);
      *(_OWORD *)(v7 - 96) = *(_OWORD *)(a3 - 96);
      *(_OWORD *)(v7 - 80) = v8;
      *(void *)(v7 - 56) = 0;
      *(void *)(v7 - 48) = 0;
      *(void *)(v7 - 64) = 0;
      *(_OWORD *)(v7 - 64) = *(_OWORD *)(a3 - 64);
      *(void *)(v7 - 48) = *(void *)(a3 - 48);
      *(void *)(a3 - 64) = 0;
      *(void *)(a3 - 56) = 0;
      *(void *)(a3 - 48) = 0;
      *(void *)(v7 - 40) = 0;
      *(void *)(v7 - 32) = 0;
      *(void *)(v7 - 24) = 0;
      *(_OWORD *)(v7 - 40) = *(_OWORD *)(a3 - 40);
      *(void *)(v7 - 24) = *(void *)(a3 - 24);
      *(void *)(a3 - 40) = 0;
      *(void *)(a3 - 32) = 0;
      *(void *)(a3 - 24) = 0;
      uint64_t v9 = *(void *)(a3 - 16);
      *(void *)(v7 - 11) = *(void *)(a3 - 11);
      *(void *)(v7 - 16) = v9;
      uint64_t v7 = *((void *)&v15 + 1) - 96;
      *((void *)&v15 + 1) -= 96;
      a3 -= 96;
    }
    while (a3 != a5);
    uint64_t v10 = v15;
  }
  char v13 = 1;
  sub_20DB6274C((uint64_t)v12);
  return v10;
}

uint64_t sub_20DB6274C(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    sub_20DB62784((uint64_t *)a1);
  }
  return a1;
}

void sub_20DB62784(uint64_t *a1)
{
  uint64_t v1 = *(void **)(a1[2] + 8);
  unint64_t v2 = *(void **)(a1[1] + 8);
  if (v1 != v2)
  {
    uint64_t v3 = *a1;
    do
    {
      sub_20DB627D8(v3, v1);
      v1 += 12;
    }
    while (v1 != v2);
  }
}

void sub_20DB627D8(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)a2[7];
  if (v3)
  {
    a2[8] = v3;
    operator delete(v3);
  }
  unint64_t v4 = (void *)a2[4];
  if (v4)
  {
    a2[5] = v4;
    operator delete(v4);
  }
}

void **sub_20DB62830(void **a1)
{
  if (*a1) {
    operator delete(*a1);
  }
  return a1;
}

void sub_20DB62864(void *a1)
{
  uint64_t v2 = a1[1];
  for (uint64_t i = a1[2]; i != v2; uint64_t i = a1[2])
  {
    uint64_t v4 = a1[4];
    a1[2] = i - 96;
    sub_20DB627D8(v4, (void *)(i - 96));
  }
}

void sub_20DB628AC(void **a1, unint64_t a2, long long *a3)
{
  long long v8 = a1[2];
  uint64_t v6 = (uint64_t)(a1 + 2);
  uint64_t v7 = v8;
  uint64_t v9 = *(void **)(v6 - 8);
  if (0xAAAAAAAAAAAAAAABLL * ((v8 - (unsigned char *)v9) >> 3) >= a2)
  {
    if (a2)
    {
      long long v15 = &v9[3 * a2];
      uint64_t v16 = 24 * a2;
      do
      {
        long long v17 = *a3;
        v9[2] = *((void *)a3 + 2);
        *(_OWORD *)uint64_t v9 = v17;
        v9 += 3;
        v16 -= 24;
      }
      while (v16);
      uint64_t v9 = v15;
    }
    a1[1] = v9;
  }
  else
  {
    unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * (((char *)v9 - (unsigned char *)*a1) >> 3);
    unint64_t v11 = v10 + a2;
    if (v10 + a2 > 0xAAAAAAAAAAAAAAALL) {
      sub_20DB5E168();
    }
    unint64_t v12 = 0xAAAAAAAAAAAAAAABLL * ((v7 - (unsigned char *)*a1) >> 3);
    if (2 * v12 > v11) {
      unint64_t v11 = 2 * v12;
    }
    if (v12 >= 0x555555555555555) {
      unint64_t v13 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v13 = v11;
    }
    if (v13) {
      long long v14 = (char *)sub_20DB622B0(v6, v13);
    }
    else {
      long long v14 = 0;
    }
    uint64_t v18 = &v14[24 * v10];
    float v19 = &v18[24 * a2];
    uint64_t v20 = 24 * a2;
    long long v21 = v18;
    do
    {
      long long v22 = *a3;
      *((void *)v21 + 2) = *((void *)a3 + 2);
      *(_OWORD *)long long v21 = v22;
      v21 += 24;
      v20 -= 24;
    }
    while (v20);
    long long v23 = &v14[24 * v13];
    char v25 = (char *)*a1;
    uint64_t v24 = (char *)a1[1];
    if (v24 != *a1)
    {
      do
      {
        long long v26 = *(_OWORD *)(v24 - 24);
        *((void *)v18 - 1) = *((void *)v24 - 1);
        *(_OWORD *)(v18 - 24) = v26;
        v18 -= 24;
        v24 -= 24;
      }
      while (v24 != v25);
      uint64_t v24 = (char *)*a1;
    }
    *a1 = v18;
    a1[1] = v19;
    a1[2] = v23;
    if (v24)
    {
      operator delete(v24);
    }
  }
}

void sub_20DB62A34(void **a1, unint64_t a2)
{
  uint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  uint64_t v5 = v6;
  uint64_t v7 = *(char **)(v4 - 8);
  if (a2 <= (v6 - v7) >> 4)
  {
    if (a2)
    {
      bzero(*(void **)(v4 - 8), 16 * a2);
      v7 += 16 * a2;
    }
    a1[1] = v7;
  }
  else
  {
    uint64_t v8 = v7 - (unsigned char *)*a1;
    unint64_t v9 = a2 + (v8 >> 4);
    if (v9 >> 60) {
      sub_20DB5E168();
    }
    uint64_t v10 = v8 >> 4;
    uint64_t v11 = v5 - (unsigned char *)*a1;
    if (v11 >> 3 > v9) {
      unint64_t v9 = v11 >> 3;
    }
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v12 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v9;
    }
    if (v12) {
      unint64_t v13 = (char *)sub_20DB5E55C(v4, v12);
    }
    else {
      unint64_t v13 = 0;
    }
    long long v14 = &v13[16 * v10];
    long long v15 = &v13[16 * v12];
    bzero(v14, 16 * a2);
    uint64_t v16 = &v14[16 * a2];
    uint64_t v18 = (char *)*a1;
    long long v17 = (char *)a1[1];
    if (v17 != *a1)
    {
      do
      {
        *((_OWORD *)v14 - 1) = *((_OWORD *)v17 - 1);
        v14 -= 16;
        v17 -= 16;
      }
      while (v17 != v18);
      long long v17 = (char *)*a1;
    }
    *a1 = v14;
    a1[1] = v16;
    a1[2] = v15;
    if (v17)
    {
      operator delete(v17);
    }
  }
}

char *sub_20DB62B54(char *result, long long *a2, long long *a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    uint64_t result = sub_20DB6225C(result, a4);
    uint64_t v7 = *((void *)v6 + 1);
    while (a2 != a3)
    {
      long long v8 = *a2;
      *(void *)(v7 + 16) = *((void *)a2 + 2);
      *(_OWORD *)uint64_t v7 = v8;
      v7 += 24;
      a2 = (long long *)((char *)a2 + 24);
    }
    *((void *)v6 + 1) = v7;
  }
  return result;
}

void sub_20DB62BB8(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *sub_20DB62BD4(char *result, long long *a2, long long *a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    uint64_t result = sub_20DB5E518(result, a4);
    uint64_t v7 = (_OWORD *)*((void *)v6 + 1);
    while (a2 != a3)
    {
      long long v8 = *a2++;
      *v7++ = v8;
    }
    *((void *)v6 + 1) = v7;
  }
  return result;
}

void sub_20DB62C2C(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void sub_20DB62C48(void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = **a1;
  if (v2)
  {
    uint64_t v4 = v1[1];
    uint64_t v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        v4 -= 12;
        sub_20DB627D8((uint64_t)(v1 + 2), v4);
      }
      while (v4 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

unsigned __int8 *sub_20DB62CE0(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  if (a2 == a3 || *a2 != 92) {
    return a2;
  }
  uint64_t v5 = a2 + 1;
  if (a2 + 1 == a3) {
    sub_20DB6315C();
  }
  uint64_t result = sub_20DB631B4(a1, a2 + 1, a3);
  if (v5 == result)
  {
    uint64_t result = (unsigned __int8 *)sub_20DB6326C(a1, (char *)a2 + 1, (char *)a3);
    if (v5 == result)
    {
      uint64_t result = sub_20DB6333C(a1, (char *)a2 + 1, (char *)a3, 0);
      if (v5 == result) {
        return a2;
      }
    }
  }
  return result;
}

unsigned char *sub_20DB62D84(uint64_t a1, unsigned char *a2, unsigned char *a3)
{
  if (a2 != a3 && *a2 == 91)
  {
    if (a2 + 1 != a3) {
      sub_20DB64448();
    }
    sub_20DB659C4();
  }
  return a2;
}

uint64_t sub_20DB62E98(uint64_t result)
{
  if ((*(unsigned char *)(result + 24) & 2) == 0) {
    operator new();
  }
  return result;
}

uint64_t sub_20DB62F1C(uint64_t result)
{
  if ((*(unsigned char *)(result + 24) & 2) == 0) {
    operator new();
  }
  return result;
}

void sub_20DB62F98()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x210564930](exception, 11);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_20DB62FDC(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

unsigned char *sub_20DB62FF0(uint64_t a1, unsigned char *a2, unsigned char *a3)
{
  if (a2 != a3)
  {
    int v3 = (char)*a2;
    BOOL v4 = (v3 - 36) > 0x3A || ((1 << (*a2 - 36)) & 0x7800000080004F1) == 0;
    if (v4 && (v3 - 123) >= 3) {
      sub_20DB63650(a1);
    }
  }
  return a2;
}

void *sub_20DB63064(void *a1)
{
  *a1 = &unk_26C244DC0;
  uint64_t v2 = a1[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  return a1;
}

void sub_20DB630D0(void *a1)
{
  *a1 = &unk_26C244DC0;
  uint64_t v1 = a1[1];
  if (v1) {
    (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  }

  JUMPOUT(0x210564B70);
}

void sub_20DB6315C()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x210564930](exception, 3);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_20DB631A0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *sub_20DB631B4(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  if (a2 != a3)
  {
    int v4 = *a2;
    unsigned int v5 = v4 - 48;
    if (v4 == 48) {
      sub_20DB63650(a1);
    }
    if ((v4 - 49) <= 8)
    {
      uint64_t v6 = a2 + 1;
      if (v6 == a3) {
        goto LABEL_10;
      }
      do
      {
        int v7 = *v6;
        if ((v7 - 48) > 9) {
          break;
        }
        if (v5 >= 0x19999999) {
          goto LABEL_13;
        }
        ++v6;
        unsigned int v5 = v7 + 10 * v5 - 48;
      }
      while (v6 != a3);
      if (v5)
      {
LABEL_10:
        if (v5 <= *(_DWORD *)(a1 + 28)) {
          sub_20DB637E8(a1);
        }
      }
LABEL_13:
      sub_20DB63790();
    }
  }
  return a2;
}

char *sub_20DB6326C(uint64_t a1, char *a2, char *a3)
{
  if (a2 == a3) {
    return a2;
  }
  int v3 = *a2;
  if (v3 > 99)
  {
    if (v3 == 119) {
      goto LABEL_12;
    }
    if (v3 == 115) {
LABEL_13:
    }
      sub_20DB64448();
    if (v3 != 100) {
      return a2;
    }
LABEL_10:
    sub_20DB64448();
  }
  switch(v3)
  {
    case 'D':
      goto LABEL_10;
    case 'S':
      goto LABEL_13;
    case 'W':
LABEL_12:
      sub_20DB64448();
  }
  return a2;
}

unsigned __int8 *sub_20DB6333C(uint64_t a1, char *a2, char *a3, std::string *this)
{
  int v4 = a2;
  if (a2 == a3) {
    return (unsigned __int8 *)v4;
  }
  int v5 = *a2;
  if (v5 > 109)
  {
    char v6 = 0;
    switch(*a2)
    {
      case 'n':
        if (!this) {
          goto LABEL_54;
        }
        int v7 = this;
        std::string::value_type v8 = 10;
        goto LABEL_52;
      case 'r':
        if (!this) {
          goto LABEL_54;
        }
        int v7 = this;
        std::string::value_type v8 = 13;
        goto LABEL_52;
      case 't':
        if (!this) {
          goto LABEL_54;
        }
        int v7 = this;
        std::string::value_type v8 = 9;
        goto LABEL_52;
      case 'u':
        if (a2 + 1 == a3) {
          goto LABEL_57;
        }
        int v9 = a2[1];
        if ((v9 & 0xF8) != 0x30 && (v9 & 0xFE) != 0x38 && (v9 | 0x20u) - 97 >= 6) {
          goto LABEL_57;
        }
        int v4 = a2 + 2;
        if (a2 + 2 == a3) {
          goto LABEL_57;
        }
        int v10 = *v4;
        char v11 = -48;
        if ((v10 & 0xF8) == 0x30 || (v10 & 0xFE) == 0x38) {
          goto LABEL_24;
        }
        v10 |= 0x20u;
        if ((v10 - 97) >= 6) {
          goto LABEL_57;
        }
        char v11 = -87;
LABEL_24:
        char v6 = 16 * (v11 + v10);
LABEL_25:
        if (v4 + 1 == a3) {
          goto LABEL_57;
        }
        int v12 = v4[1];
        char v13 = -48;
        if ((v12 & 0xF8) == 0x30 || (v12 & 0xFE) == 0x38) {
          goto LABEL_30;
        }
        v12 |= 0x20u;
        if ((v12 - 97) >= 6) {
          goto LABEL_57;
        }
        char v13 = -87;
LABEL_30:
        if (v4 + 2 == a3) {
          goto LABEL_57;
        }
        int v14 = v4[2];
        char v15 = -48;
        if ((v14 & 0xF8) == 0x30 || (v14 & 0xFE) == 0x38) {
          goto LABEL_35;
        }
        v14 |= 0x20u;
        if ((v14 - 97) >= 6) {
          goto LABEL_57;
        }
        char v15 = -87;
LABEL_35:
        if (!this) {
          sub_20DB63650(a1);
        }
        std::string::operator=(this, v15 + v14 + 16 * (v13 + v12 + v6));
        v4 += 3;
        break;
      case 'v':
        if (!this) {
          goto LABEL_54;
        }
        int v7 = this;
        std::string::value_type v8 = 11;
        goto LABEL_52;
      case 'x':
        goto LABEL_25;
      default:
        goto LABEL_47;
    }
    return (unsigned __int8 *)v4;
  }
  if (v5 == 48)
  {
    if (this)
    {
      int v7 = this;
      std::string::value_type v8 = 0;
      goto LABEL_52;
    }
LABEL_54:
    sub_20DB63650(a1);
  }
  if (v5 != 99)
  {
    if (v5 == 102)
    {
      if (this)
      {
        int v7 = this;
        std::string::value_type v8 = 12;
LABEL_52:
        std::string::operator=(v7, v8);
        return (unsigned __int8 *)++v4;
      }
      goto LABEL_54;
    }
LABEL_47:
    if (*a2 != 95
      && ((v5 & 0x80) != 0
       || (*(_DWORD *)(*(void *)(*(void *)(a1 + 8) + 16) + 4 * *a2) & 0x500) == 0))
    {
      std::string::value_type v8 = *a2;
      if (this)
      {
        int v7 = this;
        goto LABEL_52;
      }
      goto LABEL_54;
    }
LABEL_57:
    sub_20DB6315C();
  }
  if (a2 + 1 == a3) {
    goto LABEL_57;
  }
  if (a2[1] < 65) {
    goto LABEL_57;
  }
  unsigned int v16 = a2[1];
  if (v16 >= 0x5B && (v16 - 97) > 0x19u) {
    goto LABEL_57;
  }
  if (!this) {
    sub_20DB63650(a1);
  }
  std::string::operator=(this, v16 & 0x1F);
  v4 += 2;
  return (unsigned __int8 *)v4;
}

void sub_20DB63650(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 24);
  if ((v1 & 1) == 0)
  {
    if ((v1 & 8) == 0) {
      operator new();
    }
    operator new();
  }
  operator new();
}

void sub_20DB6376C(_Unwind_Exception *a1)
{
  MEMORY[0x210564B70](v1, 0x10E1C4010F5D982);
  _Unwind_Resume(a1);
}

void sub_20DB63790()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x210564930](exception, 4);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_20DB637D4(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_20DB637E8(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 24);
  if ((v1 & 1) == 0)
  {
    if ((v1 & 8) == 0) {
      operator new();
    }
    operator new();
  }
  operator new();
}

uint64_t sub_20DB63918(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)a1 = &unk_26C244E80;
  *(void *)(a1 + 8) = a4;
  std::locale::locale((std::locale *)(a1 + 16), (const std::locale *)a2);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 8);
  *(unsigned char *)(a1 + 40) = (*(uint64_t (**)(void, uint64_t))(**(void **)(a2 + 8) + 40))(*(void *)(a2 + 8), a3);
  return a1;
}

void sub_20DB639AC(_Unwind_Exception *a1)
{
  std::locale::~locale(v2);
  void *v1 = &unk_26C244DC0;
  uint64_t v4 = v1[1];
  if (v4) {
    sub_20DB7C978(v4);
  }
  _Unwind_Resume(a1);
}

std::locale *sub_20DB639EC(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_26C244E80;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)&unk_26C244DC0;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  return a1;
}

void sub_20DB63A78(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_26C244E80;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)&unk_26C244DC0;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }

  JUMPOUT(0x210564B70);
}

uint64_t sub_20DB63B24(uint64_t result, uint64_t a2)
{
  int v3 = *(char **)(a2 + 16);
  if (v3 == *(char **)(a2 + 24)
    || (uint64_t v4 = result,
        uint64_t result = (*(uint64_t (**)(void, void))(**(void **)(result + 24) + 40))(*(void *)(result + 24), *v3), *(unsigned __int8 *)(v4 + 40) != result))
  {
    uint64_t v5 = 0;
    *(_DWORD *)a2 = -993;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    ++*(void *)(a2 + 16);
    uint64_t v5 = *(void *)(v4 + 8);
  }
  *(void *)(a2 + 80) = v5;
  return result;
}

std::locale *sub_20DB63BB8(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_26C244F10;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)&unk_26C244DC0;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  return a1;
}

void sub_20DB63C44(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_26C244F10;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)&unk_26C244DC0;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }

  JUMPOUT(0x210564B70);
}

uint64_t sub_20DB63CF0(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(unsigned __int8 **)(a2 + 16);
  if (v2 == *(unsigned __int8 **)(a2 + 24) || *v2 != *(unsigned __int8 *)(result + 40))
  {
    uint64_t v3 = 0;
    *(_DWORD *)a2 = -993;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    *(void *)(a2 + 16) = v2 + 1;
    uint64_t v3 = *(void *)(result + 8);
  }
  *(void *)(a2 + 80) = v3;
  return result;
}

void *sub_20DB63D38(void *a1)
{
  *a1 = &unk_26C244DC0;
  uint64_t v2 = a1[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  return a1;
}

void sub_20DB63DA4(void *a1)
{
  *a1 = &unk_26C244DC0;
  uint64_t v1 = a1[1];
  if (v1) {
    (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  }

  JUMPOUT(0x210564B70);
}

uint64_t sub_20DB63E30(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(unsigned __int8 **)(a2 + 16);
  if (v2 == *(unsigned __int8 **)(a2 + 24) || *v2 != *(unsigned __int8 *)(result + 16))
  {
    uint64_t v3 = 0;
    *(_DWORD *)a2 = -993;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    *(void *)(a2 + 16) = v2 + 1;
    uint64_t v3 = *(void *)(result + 8);
  }
  *(void *)(a2 + 80) = v3;
  return result;
}

std::locale *sub_20DB63E78(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_26C244D90;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)&unk_26C244DC0;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  return a1;
}

void sub_20DB63F04(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_26C244D90;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)&unk_26C244DC0;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }

  JUMPOUT(0x210564B70);
}

uint64_t sub_20DB63FB0(uint64_t result, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 32) + 24 * (*(_DWORD *)(result + 40) - 1);
  if (*(unsigned char *)(v3 + 16))
  {
    uint64_t v4 = *(void *)(v3 + 8) - *(void *)v3;
    uint64_t v5 = *(void *)(a2 + 16);
    if (*(void *)(a2 + 24) - v5 >= v4)
    {
      uint64_t v7 = result;
      if (v4 < 1)
      {
LABEL_9:
        *(_DWORD *)a2 = -994;
        *(void *)(a2 + 16) = v5 + v4;
        uint64_t v6 = *(void *)(v7 + 8);
        goto LABEL_10;
      }
      uint64_t v8 = 0;
      while (1)
      {
        int v9 = (*(uint64_t (**)(void, void))(**(void **)(v7 + 24) + 40))(*(void *)(v7 + 24), *(char *)(*(void *)v3 + v8));
        uint64_t result = (*(uint64_t (**)(void, void))(**(void **)(v7 + 24) + 40))(*(void *)(v7 + 24), *(char *)(*(void *)(a2 + 16) + v8));
        if (v9 != result) {
          break;
        }
        if (v4 == ++v8)
        {
          uint64_t v5 = *(void *)(a2 + 16);
          goto LABEL_9;
        }
      }
    }
  }
  uint64_t v6 = 0;
  *(_DWORD *)a2 = -993;
LABEL_10:
  *(void *)(a2 + 80) = v6;
  return result;
}

std::locale *sub_20DB640C8(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_26C244E50;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)&unk_26C244DC0;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  return a1;
}

void sub_20DB64154(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_26C244E50;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)&unk_26C244DC0;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }

  JUMPOUT(0x210564B70);
}

uint64_t sub_20DB64200(uint64_t result, uint64_t a2)
{
  unsigned int v2 = *(_DWORD *)(result + 40) - 1;
  uint64_t v3 = *(void *)(a2 + 32);
  if (*(unsigned char *)(v3 + 24 * v2 + 16))
  {
    uint64_t v4 = (unsigned __int8 **)(v3 + 24 * v2);
    uint64_t v5 = *v4;
    uint64_t v6 = v4[1] - *v4;
    uint64_t v7 = *(void *)(a2 + 16);
    if (*(void *)(a2 + 24) - v7 >= v6)
    {
      if (v6 < 1)
      {
LABEL_8:
        *(_DWORD *)a2 = -994;
        *(void *)(a2 + 16) = v7 + v6;
        uint64_t v8 = *(void *)(result + 8);
        goto LABEL_9;
      }
      int v9 = *(unsigned __int8 **)(a2 + 16);
      uint64_t v10 = v6;
      while (1)
      {
        int v12 = *v5++;
        int v11 = v12;
        int v13 = *v9++;
        if (v11 != v13) {
          break;
        }
        if (!--v10) {
          goto LABEL_8;
        }
      }
    }
  }
  uint64_t v8 = 0;
  *(_DWORD *)a2 = -993;
LABEL_9:
  *(void *)(a2 + 80) = v8;
  return result;
}

void *sub_20DB64290(void *a1)
{
  *a1 = &unk_26C244DC0;
  uint64_t v2 = a1[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  return a1;
}

void sub_20DB642FC(void *a1)
{
  *a1 = &unk_26C244DC0;
  uint64_t v1 = a1[1];
  if (v1) {
    (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  }

  JUMPOUT(0x210564B70);
}

unsigned int *sub_20DB64388(unsigned int *result, uint64_t a2)
{
  unint64_t v2 = result[4];
  uint64_t v3 = *(void *)(a2 + 32);
  if (0xAAAAAAAAAAAAAAABLL * ((*(void *)(a2 + 40) - v3) >> 3) < v2) {
    sub_20DB63790();
  }
  unsigned int v5 = v2 - 1;
  if (*(unsigned char *)(v3 + 24 * v5 + 16)
    && (uint64_t v6 = result,
        uint64_t v7 = v3 + 24 * v5,
        uint64_t result = *(unsigned int **)v7,
        int64_t v8 = *(void *)(v7 + 8) - *(void *)v7,
        uint64_t v9 = *(void *)(a2 + 16),
        *(void *)(a2 + 24) - v9 >= v8)
    && (uint64_t result = (unsigned int *)memcmp(result, *(const void **)(a2 + 16), v8), !result))
  {
    *(_DWORD *)a2 = -994;
    *(void *)(a2 + 16) = v9 + v8;
    uint64_t v10 = *((void *)v6 + 1);
  }
  else
  {
    uint64_t v10 = 0;
    *(_DWORD *)a2 = -993;
  }
  *(void *)(a2 + 80) = v10;
  return result;
}

void sub_20DB64448()
{
}

void sub_20DB644C0(_Unwind_Exception *a1)
{
  MEMORY[0x210564B70](v1, 0x10F1C4061CF1F02);
  _Unwind_Resume(a1);
}

void sub_20DB644E4(uint64_t a1, uint64_t a2)
{
  char v2 = a2;
  if (*(unsigned char *)(a1 + 169))
  {
    char v2 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), a2);
    unsigned int v5 = *(unsigned char **)(a1 + 48);
    unint64_t v4 = *(void *)(a1 + 56);
    if ((unint64_t)v5 >= v4)
    {
      uint64_t v6 = (unint64_t *)(a1 + 40);
      unint64_t v7 = *(void *)(a1 + 40);
      int64_t v8 = &v5[-v7];
      uint64_t v9 = (uint64_t)&v5[-v7 + 1];
      if (v9 >= 0)
      {
        unint64_t v10 = v4 - v7;
        if (2 * v10 > v9) {
          uint64_t v9 = 2 * v10;
        }
        if (v10 >= 0x3FFFFFFFFFFFFFFFLL) {
          size_t v11 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          size_t v11 = v9;
        }
        if (v11) {
          int v12 = operator new(v11);
        }
        else {
          int v12 = 0;
        }
        uint64_t v20 = &v8[(void)v12];
        long long v21 = (char *)v12 + v11;
        v8[(void)v12] = v2;
        uint64_t v19 = (uint64_t)&v8[(void)v12 + 1];
        if (v5 != (unsigned char *)v7)
        {
          long long v22 = &v5[~v7];
          do
          {
            char v23 = *--v5;
            (v22--)[(void)v12] = v23;
          }
          while (v5 != (unsigned char *)v7);
LABEL_45:
          unsigned int v5 = (unsigned char *)*v6;
          goto LABEL_47;
        }
        goto LABEL_46;
      }
LABEL_50:
      sub_20DB5E168();
    }
    goto LABEL_22;
  }
  uint64_t v6 = (unint64_t *)(a1 + 40);
  unsigned int v5 = *(unsigned char **)(a1 + 48);
  unint64_t v13 = *(void *)(a1 + 56);
  if (!*(unsigned char *)(a1 + 170))
  {
    if ((unint64_t)v5 >= v13)
    {
      unint64_t v24 = *v6;
      char v25 = &v5[-*v6];
      unint64_t v26 = (unint64_t)(v25 + 1);
      if ((uint64_t)(v25 + 1) >= 0)
      {
        unint64_t v27 = v13 - v24;
        if (2 * v27 > v26) {
          unint64_t v26 = 2 * v27;
        }
        if (v27 >= 0x3FFFFFFFFFFFFFFFLL) {
          size_t v28 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          size_t v28 = v26;
        }
        if (v28) {
          int v12 = operator new(v28);
        }
        else {
          int v12 = 0;
        }
        uint64_t v20 = &v25[(void)v12];
        long long v21 = (char *)v12 + v28;
        v25[(void)v12] = v2;
        uint64_t v19 = (uint64_t)&v25[(void)v12 + 1];
        if (v5 != (unsigned char *)v24)
        {
          unsigned int v31 = &v5[~v24];
          do
          {
            char v32 = *--v5;
            (v31--)[(void)v12] = v32;
          }
          while (v5 != (unsigned char *)v24);
          goto LABEL_45;
        }
        goto LABEL_46;
      }
      goto LABEL_50;
    }
LABEL_22:
    unsigned char *v5 = v2;
    uint64_t v19 = (uint64_t)(v5 + 1);
    goto LABEL_49;
  }
  if ((unint64_t)v5 < v13) {
    goto LABEL_22;
  }
  unint64_t v14 = *v6;
  char v15 = &v5[-*v6];
  unint64_t v16 = (unint64_t)(v15 + 1);
  if ((uint64_t)(v15 + 1) < 0) {
    goto LABEL_50;
  }
  unint64_t v17 = v13 - v14;
  if (2 * v17 > v16) {
    unint64_t v16 = 2 * v17;
  }
  if (v17 >= 0x3FFFFFFFFFFFFFFFLL) {
    size_t v18 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    size_t v18 = v16;
  }
  if (v18) {
    int v12 = operator new(v18);
  }
  else {
    int v12 = 0;
  }
  uint64_t v20 = &v15[(void)v12];
  long long v21 = (char *)v12 + v18;
  v15[(void)v12] = v2;
  uint64_t v19 = (uint64_t)&v15[(void)v12 + 1];
  if (v5 != (unsigned char *)v14)
  {
    unint64_t v29 = &v5[~v14];
    do
    {
      char v30 = *--v5;
      (v29--)[(void)v12] = v30;
    }
    while (v5 != (unsigned char *)v14);
    goto LABEL_45;
  }
LABEL_46:
  int v12 = v20;
LABEL_47:
  *(void *)(a1 + 40) = v12;
  *(void *)(a1 + 48) = v19;
  *(void *)(a1 + 56) = v21;
  if (v5) {
    operator delete(v5);
  }
LABEL_49:
  *(void *)(a1 + 48) = v19;
}

uint64_t sub_20DB6472C(uint64_t a1, uint64_t a2, uint64_t a3, char a4, char a5, char a6)
{
  *(void *)a1 = &unk_26C244EB0;
  *(void *)(a1 + 8) = a3;
  size_t v11 = (const std::locale *)(a1 + 16);
  std::locale::locale((std::locale *)(a1 + 16), (const std::locale *)a2);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_OWORD *)(a1 + 120) = 0u;
  *(_OWORD *)(a1 + 136) = 0u;
  *(_OWORD *)(a1 + 152) = 0u;
  *(unsigned char *)(a1 + 168) = a4;
  *(unsigned char *)(a1 + 169) = a5;
  *(unsigned char *)(a1 + 170) = a6;
  std::locale::locale(&v14, v11);
  std::locale::name(&v15, &v14);
  if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0)
  {
    BOOL v12 = v15.__r_.__value_.__l.__size_ != 1 || *v15.__r_.__value_.__l.__data_ != 67;
    operator delete(v15.__r_.__value_.__l.__data_);
  }
  else
  {
    BOOL v12 = SHIBYTE(v15.__r_.__value_.__r.__words[2]) != 1 || v15.__r_.__value_.__s.__data_[0] != 67;
  }
  std::locale::~locale(&v14);
  *(unsigned char *)(a1 + 171) = v12;
  return a1;
}

void sub_20DB64874(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10)
{
  std::locale::~locale((std::locale *)&a9);
  a10 = v10 + 17;
  sub_20DB7ABD8((void ***)&a10);
  std::string v15 = (void *)v10[14];
  if (v15)
  {
    v10[15] = v15;
    operator delete(v15);
  }
  sub_20DB652DC((void ***)&a10);
  unint64_t v16 = (void *)v10[8];
  if (v16)
  {
    v10[9] = v16;
    operator delete(v16);
  }
  unint64_t v17 = *v13;
  if (*v13)
  {
    v10[6] = v17;
    operator delete(v17);
  }
  std::locale::~locale(v12);
  *unint64_t v10 = v11;
  uint64_t v18 = v10[1];
  if (v18) {
    (*(void (**)(uint64_t))(*(void *)v18 + 8))(v18);
  }
  _Unwind_Resume(a1);
}

void sub_20DB64910(std::locale *a1)
{
  sub_20DB65410(a1);

  JUMPOUT(0x210564B70);
}

void sub_20DB64948(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = *(signed __int8 **)(a2 + 16);
  unsigned int v5 = *(signed __int8 **)(a2 + 24);
  if (v4 == v5)
  {
    uint64_t v37 = 0;
    int v36 = *(unsigned __int8 *)(a1 + 168);
    goto LABEL_221;
  }
  if (!*(unsigned char *)(a1 + 171) || v4 + 1 == v5) {
    goto LABEL_58;
  }
  signed __int8 v6 = *v4;
  unsigned __int8 v125 = *v4;
  signed __int8 v7 = v4[1];
  unsigned __int8 v126 = v7;
  if (*(unsigned char *)(a1 + 169))
  {
    unsigned __int8 v125 = (*(uint64_t (**)(void, void))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), v6);
    unsigned __int8 v126 = (*(uint64_t (**)(void, void))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), v7);
  }
  uint64_t v8 = a1 + 16;
  sub_20DB655B0(a1 + 16, (char *)&v125, (char *)&v127, (uint64_t)&__p);
  if ((v124 & 0x80000000) == 0)
  {
    if (v124) {
      goto LABEL_8;
    }
LABEL_58:
    int v36 = 0;
    uint64_t v37 = 1;
    goto LABEL_59;
  }
  size_t v38 = v123;
  operator delete(__p);
  if (!v38) {
    goto LABEL_58;
  }
LABEL_8:
  uint64_t v9 = *(void *)(a1 + 112);
  uint64_t v10 = *(void *)(a1 + 120) - v9;
  if (v10)
  {
    uint64_t v11 = v10 >> 1;
    if ((unint64_t)(v10 >> 1) <= 1) {
      uint64_t v11 = 1;
    }
    BOOL v12 = (unsigned char *)(v9 + 1);
    do
    {
      if (v125 == *(v12 - 1) && v126 == *v12) {
        goto LABEL_218;
      }
      v12 += 2;
      --v11;
    }
    while (v11);
  }
  if (!*(unsigned char *)(a1 + 170) || *(void *)(a1 + 88) == *(void *)(a1 + 96))
  {
    int v36 = 0;
  }
  else
  {
    sub_20DB654F8(a1 + 16, (char *)&v125, (char *)&v127);
    uint64_t v14 = *(void *)(a1 + 88);
    char v15 = v124;
    uint64_t v16 = *(void *)(a1 + 96) - v14;
    if (v16)
    {
      uint64_t v17 = 0;
      unint64_t v18 = v16 / 48;
      char v113 = v124;
      if (v124 >= 0) {
        size_t v19 = v124;
      }
      else {
        size_t v19 = v123;
      }
      if (v124 >= 0) {
        p_p = &__p;
      }
      else {
        p_p = __p;
      }
      if (v18 <= 1) {
        uint64_t v21 = 1;
      }
      else {
        uint64_t v21 = v16 / 48;
      }
      BOOL v22 = 1;
      while (1)
      {
        int v23 = *(char *)(v14 + 23);
        if (v23 >= 0) {
          size_t v24 = *(unsigned __int8 *)(v14 + 23);
        }
        else {
          size_t v24 = *(void *)(v14 + 8);
        }
        if (v23 >= 0) {
          char v25 = (const void *)v14;
        }
        else {
          char v25 = *(const void **)v14;
        }
        if (v24 >= v19) {
          size_t v26 = v19;
        }
        else {
          size_t v26 = v24;
        }
        int v27 = memcmp(p_p, v25, v26);
        BOOL v28 = v19 >= v24;
        if (v27) {
          BOOL v28 = v27 >= 0;
        }
        if (v28)
        {
          int v29 = *(char *)(v14 + 47);
          if (v29 >= 0) {
            size_t v30 = *(unsigned __int8 *)(v14 + 47);
          }
          else {
            size_t v30 = *(void *)(v14 + 32);
          }
          if (v29 >= 0) {
            unsigned int v31 = (const void *)(v14 + 24);
          }
          else {
            unsigned int v31 = *(const void **)(v14 + 24);
          }
          if (v19 >= v30) {
            size_t v32 = v30;
          }
          else {
            size_t v32 = v19;
          }
          int v33 = memcmp(v31, p_p, v32);
          BOOL v34 = v30 >= v19;
          if (v33) {
            BOOL v34 = v33 >= 0;
          }
          if (v34) {
            break;
          }
        }
        BOOL v22 = ++v17 < v18;
        v14 += 48;
        if (v21 == v17)
        {
          int v35 = 0;
          int v36 = 0;
          goto LABEL_162;
        }
      }
      int v36 = 1;
      int v35 = 5;
LABEL_162:
      uint64_t v8 = a1 + 16;
      char v15 = v113;
    }
    else
    {
      BOOL v22 = 0;
      int v35 = 0;
      int v36 = 0;
    }
    if (v15 < 0) {
      operator delete(__p);
    }
    if (v22) {
      goto LABEL_195;
    }
  }
  if (*(void *)(a1 + 136) == *(void *)(a1 + 144)) {
    goto LABEL_200;
  }
  sub_20DB65808(v8, (char *)&v125, (char *)&v127, (uint64_t)&__p);
  uint64_t v89 = *(void *)(a1 + 136);
  uint64_t v90 = v124;
  uint64_t v91 = *(void *)(a1 + 144) - v89;
  if (v91)
  {
    uint64_t v92 = 0;
    unint64_t v93 = v91 / 24;
    v95 = __p;
    size_t v94 = v123;
    if (v124 >= 0) {
      size_t v96 = v124;
    }
    else {
      size_t v96 = v123;
    }
    if (v93 <= 1) {
      uint64_t v97 = 1;
    }
    else {
      uint64_t v97 = v91 / 24;
    }
    BOOL v98 = 1;
    while (1)
    {
      v99 = (unsigned __int8 **)(v89 + 24 * v92);
      v100 = (unsigned __int8 *)*((unsigned __int8 *)v99 + 23);
      int v101 = (char)v100;
      if ((char)v100 < 0) {
        v100 = v99[1];
      }
      if ((unsigned __int8 *)v96 == v100)
      {
        if (v101 >= 0) {
          v102 = (unsigned __int8 *)(v89 + 24 * v92);
        }
        else {
          v102 = *v99;
        }
        if ((v90 & 0x80) == 0)
        {
          if (v90)
          {
            v103 = &__p;
            uint64_t v104 = v90;
            do
            {
              if (*(unsigned __int8 *)v103 != *v102) {
                goto LABEL_188;
              }
              v103 = (void **)((char *)v103 + 1);
              ++v102;
              --v104;
            }
            while (v104);
            int v36 = 1;
            int v35 = 5;
            goto LABEL_192;
          }
          int v36 = 1;
          if (v98) {
            goto LABEL_220;
          }
LABEL_200:
          if ((char)v125 < 0)
          {
            int v109 = *(_DWORD *)(a1 + 164);
            goto LABEL_213;
          }
          int v106 = *(_DWORD *)(a1 + 160);
          uint64_t v107 = *(void *)(*(void *)(a1 + 24) + 16);
          int v108 = *(_DWORD *)(v107 + 4 * v125);
          if ((v108 & v106) == 0 && (v125 != 95 || (v106 & 0x80) == 0)
            || (char)v126 < 0
            || (*(_DWORD *)(v107 + 4 * v126) & v106) == 0 && ((v106 & 0x80) == 0 || v126 != 95))
          {
            int v109 = *(_DWORD *)(a1 + 164);
            if ((v108 & v109) != 0 || v125 == 95 && (v109 & 0x80) != 0)
            {
LABEL_217:
              int v110 = v36;
              goto LABEL_219;
            }
LABEL_213:
            if (((char)v126 & 0x80000000) == 0)
            {
              if ((*(_DWORD *)(*(void *)(*(void *)(a1 + 24) + 16) + 4 * v126) & v109) != 0) {
                goto LABEL_217;
              }
              int v110 = 1;
              if (v126 == 95 && (v109 & 0x80) != 0) {
                goto LABEL_217;
              }
LABEL_219:
              int v36 = v110;
LABEL_220:
              uint64_t v37 = 2;
              goto LABEL_221;
            }
          }
LABEL_218:
          int v110 = 1;
          goto LABEL_219;
        }
        unint64_t v118 = v93;
        uint64_t v121 = v90;
        int v105 = memcmp(v95, v102, v94);
        unint64_t v93 = v118;
        uint64_t v90 = v121;
        if (!v105) {
          break;
        }
      }
LABEL_188:
      BOOL v98 = ++v92 < v93;
      if (v92 == v97) {
        goto LABEL_191;
      }
    }
    int v35 = 5;
    int v36 = 1;
    goto LABEL_193;
  }
  BOOL v98 = 0;
LABEL_191:
  int v35 = 0;
LABEL_192:
  if ((v90 & 0x80) != 0) {
LABEL_193:
  }
    operator delete(__p);
  if (!v98) {
    goto LABEL_200;
  }
LABEL_195:
  if (v35) {
    goto LABEL_220;
  }
  uint64_t v37 = 2;
LABEL_59:
  unsigned __int8 v39 = **(unsigned char **)(a2 + 16);
  unsigned __int8 v125 = v39;
  if (*(unsigned char *)(a1 + 169))
  {
    unsigned __int8 v39 = (*(uint64_t (**)(void, void))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), (char)v39);
    unsigned __int8 v125 = v39;
  }
  long long v40 = *(unsigned __int8 **)(a1 + 40);
  unint64_t v41 = *(void *)(a1 + 48) - (void)v40;
  if (v41)
  {
    if (v41 <= 1) {
      unint64_t v41 = 1;
    }
    while (1)
    {
      int v42 = *v40++;
      if (v42 == v39) {
        break;
      }
      if (!--v41) {
        goto LABEL_66;
      }
    }
LABEL_77:
    int v36 = 1;
    goto LABEL_221;
  }
LABEL_66:
  unsigned int v43 = *(_DWORD *)(a1 + 164);
  if (v43 || *(void *)(a1 + 64) != *(void *)(a1 + 72))
  {
    if ((v39 & 0x80) != 0 || (*(_DWORD *)(*(void *)(*(void *)(a1 + 24) + 16) + 4 * v39) & v43) == 0) {
      int v44 = (v39 == 95) & (v43 >> 7);
    }
    else {
      LOBYTE(v44) = 1;
    }
    v45 = *(void **)(a1 + 72);
    v46 = memchr(*(void **)(a1 + 64), (char)v39, (size_t)v45 - *(void *)(a1 + 64));
    uint64_t v47 = v46 ? v46 : v45;
    if ((v44 & 1) == 0 && v47 == v45) {
      goto LABEL_77;
    }
  }
  uint64_t v49 = *(void *)(a1 + 88);
  uint64_t v48 = *(void *)(a1 + 96);
  if (v49 != v48)
  {
    if (*(unsigned char *)(a1 + 170))
    {
      sub_20DB654F8(a1 + 16, (char *)&v125, (char *)&v126);
      uint64_t v49 = *(void *)(a1 + 88);
      uint64_t v48 = *(void *)(a1 + 96);
    }
    else
    {
      char v124 = 1;
      LOWORD(__p) = v39;
    }
    uint64_t v50 = v48 - v49;
    if (v50)
    {
      uint64_t v119 = v37;
      int v116 = v36;
      uint64_t v51 = 0;
      unint64_t v52 = v50 / 48;
      char v114 = v124;
      if (v124 >= 0) {
        size_t v53 = v124;
      }
      else {
        size_t v53 = v123;
      }
      if (v124 >= 0) {
        v54 = &__p;
      }
      else {
        v54 = __p;
      }
      if (v52 <= 1) {
        uint64_t v55 = 1;
      }
      else {
        uint64_t v55 = v50 / 48;
      }
      BOOL v56 = 1;
      while (1)
      {
        int v57 = *(char *)(v49 + 23);
        if (v57 >= 0) {
          size_t v58 = *(unsigned __int8 *)(v49 + 23);
        }
        else {
          size_t v58 = *(void *)(v49 + 8);
        }
        if (v57 >= 0) {
          v59 = (const void *)v49;
        }
        else {
          v59 = *(const void **)v49;
        }
        if (v58 >= v53) {
          size_t v60 = v53;
        }
        else {
          size_t v60 = v58;
        }
        int v61 = memcmp(v54, v59, v60);
        BOOL v62 = v53 >= v58;
        if (v61) {
          BOOL v62 = v61 >= 0;
        }
        if (v62)
        {
          int v63 = *(char *)(v49 + 47);
          if (v63 >= 0) {
            size_t v64 = *(unsigned __int8 *)(v49 + 47);
          }
          else {
            size_t v64 = *(void *)(v49 + 32);
          }
          if (v63 >= 0) {
            v65 = (const void *)(v49 + 24);
          }
          else {
            v65 = *(const void **)(v49 + 24);
          }
          if (v53 >= v64) {
            size_t v66 = v64;
          }
          else {
            size_t v66 = v53;
          }
          int v67 = memcmp(v65, v54, v66);
          BOOL v68 = v64 >= v53;
          if (v67) {
            BOOL v68 = v67 >= 0;
          }
          if (v68) {
            break;
          }
        }
        BOOL v56 = ++v51 < v52;
        v49 += 48;
        if (v55 == v51)
        {
          int v36 = v116;
          goto LABEL_123;
        }
      }
      int v36 = 1;
LABEL_123:
      uint64_t v37 = v119;
      if ((v114 & 0x80) == 0) {
        goto LABEL_125;
      }
    }
    else
    {
      BOOL v56 = 0;
      if ((v124 & 0x80) == 0) {
        goto LABEL_125;
      }
    }
    operator delete(__p);
LABEL_125:
    if (v56) {
      goto LABEL_221;
    }
  }
  if (*(void *)(a1 + 136) == *(void *)(a1 + 144)) {
    goto LABEL_154;
  }
  sub_20DB65808(a1 + 16, (char *)&v125, (char *)&v126, (uint64_t)&__p);
  uint64_t v69 = *(void *)(a1 + 136);
  uint64_t v70 = v124;
  uint64_t v71 = *(void *)(a1 + 144) - v69;
  if (v71)
  {
    uint64_t v120 = v37;
    uint64_t v72 = 0;
    unint64_t v73 = v71 / 24;
    v74 = __p;
    size_t v75 = v123;
    if (v124 >= 0) {
      size_t v76 = v124;
    }
    else {
      size_t v76 = v123;
    }
    if (v73 <= 1) {
      uint64_t v77 = 1;
    }
    else {
      uint64_t v77 = v71 / 24;
    }
    BOOL v78 = 1;
    while (1)
    {
      v79 = (unsigned __int8 **)(v69 + 24 * v72);
      v80 = (unsigned __int8 *)*((unsigned __int8 *)v79 + 23);
      int v81 = (char)v80;
      if ((char)v80 < 0) {
        v80 = v79[1];
      }
      if ((unsigned __int8 *)v76 == v80)
      {
        if (v81 >= 0) {
          v82 = (unsigned __int8 *)(v69 + 24 * v72);
        }
        else {
          v82 = *v79;
        }
        if ((v70 & 0x80) != 0)
        {
          int v117 = v36;
          unint64_t v85 = v73;
          uint64_t v115 = v77;
          int v86 = memcmp(v74, v82, v75);
          uint64_t v77 = v115;
          unint64_t v73 = v85;
          int v36 = v117;
          if (!v86)
          {
            int v36 = 1;
            uint64_t v37 = v120;
            goto LABEL_152;
          }
        }
        else
        {
          if (!v70)
          {
            int v36 = 1;
            uint64_t v37 = v120;
            if (!v78) {
              goto LABEL_154;
            }
            goto LABEL_221;
          }
          v83 = &__p;
          uint64_t v84 = v70;
          while (*(unsigned __int8 *)v83 == *v82)
          {
            v83 = (void **)((char *)v83 + 1);
            ++v82;
            if (!--v84)
            {
              int v36 = 1;
              goto LABEL_149;
            }
          }
        }
      }
      BOOL v78 = ++v72 < v73;
      if (v72 == v77)
      {
LABEL_149:
        uint64_t v37 = v120;
        if ((v70 & 0x80) == 0) {
          goto LABEL_153;
        }
        goto LABEL_152;
      }
    }
  }
  BOOL v78 = 0;
  if (v124 < 0) {
LABEL_152:
  }
    operator delete(__p);
LABEL_153:
  if (!v78)
  {
LABEL_154:
    if ((char)v125 < 0) {
      goto LABEL_221;
    }
    unsigned int v87 = *(_DWORD *)(a1 + 160);
    if ((*(_DWORD *)(*(void *)(*(void *)(a1 + 24) + 16) + 4 * v125) & v87) == 0)
    {
      int v88 = (v87 >> 7) & 1;
      if (v125 != 95) {
        int v88 = 0;
      }
      if (v88 != 1) {
        goto LABEL_221;
      }
    }
    goto LABEL_77;
  }
LABEL_221:
  if (v36 == *(unsigned __int8 *)(a1 + 168))
  {
    uint64_t v111 = 0;
    int v112 = -993;
  }
  else
  {
    *(void *)(a2 + 16) += v37;
    uint64_t v111 = *(void *)(a1 + 8);
    int v112 = -995;
  }
  *(_DWORD *)a2 = v112;
  *(void *)(a2 + 80) = v111;
}

void sub_20DB6524C(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_20DB652A8(exception, a1);
  __cxa_throw(exception, (struct type_info *)off_264127280, MEMORY[0x263F8C068]);
}

void sub_20DB65294(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_20DB652A8(std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C390] + 16);
  return result;
}

void sub_20DB652DC(void ***a1)
{
  uint64_t v1 = *a1;
  char v2 = **a1;
  if (v2)
  {
    uint64_t v4 = (uint64_t)v1[1];
    unsigned int v5 = **a1;
    if ((void *)v4 != v2)
    {
      do
      {
        v4 -= 48;
        sub_20DB65374((uint64_t)(v1 + 2), v4);
      }
      while ((void *)v4 != v2);
      unsigned int v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void sub_20DB65374(uint64_t a1, uint64_t a2)
{
  if (*(char *)(a2 + 47) < 0) {
    operator delete(*(void **)(a2 + 24));
  }
  if (*(char *)(a2 + 23) < 0)
  {
    uint64_t v3 = *(void **)a2;
    operator delete(v3);
  }
}

uint64_t sub_20DB653CC(uint64_t a1)
{
  if (*(char *)(a1 + 47) < 0) {
    operator delete(*(void **)(a1 + 24));
  }
  if (*(char *)(a1 + 23) < 0) {
    operator delete(*(void **)a1);
  }
  return a1;
}

std::locale *sub_20DB65410(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_26C244EB0;
  signed __int8 v7 = a1 + 17;
  sub_20DB7ABD8((void ***)&v7);
  locale = a1[14].__locale_;
  if (locale)
  {
    a1[15].__locale_ = locale;
    operator delete(locale);
  }
  signed __int8 v7 = a1 + 11;
  sub_20DB652DC((void ***)&v7);
  uint64_t v3 = a1[8].__locale_;
  if (v3)
  {
    a1[9].__locale_ = v3;
    operator delete(v3);
  }
  uint64_t v4 = a1[5].__locale_;
  if (v4)
  {
    a1[6].__locale_ = v4;
    operator delete(v4);
  }
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)&unk_26C244DC0;
  unsigned int v5 = a1[1].__locale_;
  if (v5) {
    (*(void (**)(std::locale::__imp *))(*(void *)v5 + 8))(v5);
  }
  return a1;
}

void sub_20DB654F8(uint64_t a1, char *a2, char *a3)
{
  sub_20DB65760(__p, a2, a3, a3 - a2);
  unint64_t v4 = v7;
  if ((v7 & 0x80u) == 0) {
    unsigned int v5 = __p;
  }
  else {
    unsigned int v5 = (void **)__p[0];
  }
  if ((v7 & 0x80u) != 0) {
    unint64_t v4 = (unint64_t)__p[1];
  }
  (*(void (**)(void, void **, char *))(**(void **)(a1 + 16) + 32))(*(void *)(a1 + 16), v5, (char *)v5 + v4);
  if ((char)v7 < 0) {
    operator delete(__p[0]);
  }
}

void sub_20DB65594(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_20DB655B0(uint64_t a1@<X0>, char *a2@<X1>, char *a3@<X2>, uint64_t a4@<X8>)
{
  sub_20DB65760(&__s, a2, a3, a3 - a2);
  *(void *)a4 = 0;
  *(void *)(a4 + 8) = 0;
  *(void *)(a4 + 16) = 0;
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
  {
    if (!__s.__r_.__value_.__l.__size_) {
      goto LABEL_9;
    }
    p_s = (std::string *)__s.__r_.__value_.__r.__words[0];
  }
  else
  {
    if (!*((unsigned char *)&__s.__r_.__value_.__s + 23)) {
      return;
    }
    p_s = &__s;
  }
  std::__get_collation_name(&v11, (const char *)p_s);
  *(_OWORD *)a4 = *(_OWORD *)&v11.__r_.__value_.__l.__data_;
  unint64_t v7 = v11.__r_.__value_.__r.__words[2];
  *(void *)(a4 + 16) = *((void *)&v11.__r_.__value_.__l + 2);
  unint64_t v8 = HIBYTE(v7);
  if ((v8 & 0x80u) != 0) {
    unint64_t v8 = *(void *)(a4 + 8);
  }
  if (v8) {
    goto LABEL_9;
  }
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
  {
    if (__s.__r_.__value_.__l.__size_ >= 3) {
      goto LABEL_9;
    }
  }
  else if (HIBYTE(__s.__r_.__value_.__r.__words[2]) >= 3u)
  {
    return;
  }
  (*(void (**)(std::string *__return_ptr))(**(void **)(a1 + 16) + 32))(&v11);
  if (*(char *)(a4 + 23) < 0) {
    operator delete(*(void **)a4);
  }
  *(std::string *)a4 = v11;
  if ((*(char *)(a4 + 23) & 0x80000000) == 0)
  {
    int v9 = *(unsigned __int8 *)(a4 + 23);
    if (v9 != 12 && v9 != 1)
    {
      *(unsigned char *)a4 = 0;
      *(unsigned char *)(a4 + 23) = 0;
      goto LABEL_9;
    }
    goto LABEL_23;
  }
  uint64_t v10 = *(void *)(a4 + 8);
  if (v10 == 1 || v10 == 12)
  {
LABEL_23:
    std::string::operator=((std::string *)a4, &__s);
    goto LABEL_9;
  }
  **(unsigned char **)a4 = 0;
  *(void *)(a4 + 8) = 0;
LABEL_9:
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__s.__r_.__value_.__l.__data_);
  }
}

void sub_20DB6572C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (*(char *)(v17 + 23) < 0) {
    operator delete(*(void **)v17);
  }
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *sub_20DB65760(void *result, char *a2, char *a3, unint64_t a4)
{
  unint64_t v4 = result;
  if (a4 >= 0x7FFFFFFFFFFFFFF8) {
    sub_20DB5DACC();
  }
  if (a4 > 0x16)
  {
    uint64_t v8 = (a4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a4 | 7) != 0x17) {
      uint64_t v8 = a4 | 7;
    }
    uint64_t v9 = v8 + 1;
    uint64_t result = operator new(v8 + 1);
    v4[1] = a4;
    v4[2] = v9 | 0x8000000000000000;
    *unint64_t v4 = result;
    unint64_t v4 = result;
  }
  else
  {
    *((unsigned char *)result + 23) = a4;
  }
  while (a2 != a3)
  {
    char v10 = *a2++;
    *(unsigned char *)unint64_t v4 = v10;
    unint64_t v4 = (void *)((char *)v4 + 1);
  }
  *(unsigned char *)unint64_t v4 = 0;
  return result;
}

void sub_20DB65808(uint64_t a1@<X0>, char *a2@<X1>, char *a3@<X2>, uint64_t a4@<X8>)
{
  sub_20DB65760(__p, a2, a3, a3 - a2);
  unint64_t v6 = v12;
  if ((v12 & 0x80u) == 0) {
    unint64_t v7 = __p;
  }
  else {
    unint64_t v7 = (void **)__p[0];
  }
  if ((v12 & 0x80u) != 0) {
    unint64_t v6 = (unint64_t)__p[1];
  }
  (*(void (**)(void, void **, char *))(**(void **)(a1 + 16) + 32))(*(void *)(a1 + 16), v7, (char *)v7 + v6);
  uint64_t v8 = *(unsigned __int8 *)(a4 + 23);
  int v9 = (char)v8;
  if ((v8 & 0x80u) != 0) {
    uint64_t v8 = *(void *)(a4 + 8);
  }
  if (v8 != 1)
  {
    if (v8 == 12)
    {
      if (v9 >= 0) {
        char v10 = (unsigned char *)a4;
      }
      else {
        char v10 = *(unsigned char **)a4;
      }
      v10[11] = v10[3];
    }
    else if (v9 < 0)
    {
      **(unsigned char **)a4 = 0;
      *(void *)(a4 + 8) = 0;
    }
    else
    {
      *(unsigned char *)a4 = 0;
      *(unsigned char *)(a4 + 23) = 0;
    }
  }
  if ((char)v12 < 0) {
    operator delete(__p[0]);
  }
}

void sub_20DB658FC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *sub_20DB65918(void *__b, size_t __len, int __c)
{
  if (__len >= 0x7FFFFFFFFFFFFFF8) {
    sub_20DB5DACC();
  }
  if (__len >= 0x17)
  {
    size_t v7 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17) {
      size_t v7 = __len | 7;
    }
    size_t v8 = v7 + 1;
    unint64_t v6 = operator new(v7 + 1);
    __b[1] = __len;
    __b[2] = v8 | 0x8000000000000000;
    *__b = v6;
  }
  else
  {
    *((unsigned char *)__b + 23) = __len;
    unint64_t v6 = __b;
    if (!__len) {
      goto LABEL_9;
    }
  }
  memset(v6, __c, __len);
LABEL_9:
  *((unsigned char *)v6 + __len) = 0;
  return __b;
}

void sub_20DB659C4()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x210564930](exception, 5);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_20DB65A08(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

char *sub_20DB65A1C(uint64_t a1, char *a2, char *a3, uint64_t *a4)
{
  unint64_t v4 = a2;
  if (a2 == a3) {
    return v4;
  }
  int v5 = *a2;
  if (v5 == 93) {
    return v4;
  }
  uint64_t v6 = (uint64_t)a4;
  memset(&v26, 0, sizeof(v26));
  if (a2 + 1 == a3 || v5 != 91)
  {
LABEL_9:
    int v11 = *(_DWORD *)(a1 + 24) & 0x1F0;
    goto LABEL_10;
  }
  int v9 = a2[1];
  if (v9 != 46)
  {
    if (v9 == 58)
    {
      char v10 = sub_20DB65FC4(a1, a2 + 2, a3, (uint64_t)a4);
      goto LABEL_38;
    }
    if (v9 == 61)
    {
      char v10 = sub_20DB65DE4(a1, a2 + 2, a3, a4);
LABEL_38:
      uint64_t v6 = (uint64_t)v10;
      char v21 = 0;
      goto LABEL_42;
    }
    goto LABEL_9;
  }
  size_t v19 = sub_20DB66078(a1, a2 + 2, a3, (uint64_t)&v26);
  unint64_t v4 = v19;
  int v11 = *(_DWORD *)(a1 + 24) & 0x1F0;
  std::string::size_type size = HIBYTE(v26.__r_.__value_.__r.__words[2]);
  if ((v26.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    std::string::size_type size = v26.__r_.__value_.__l.__size_;
  }
  uint64_t v14 = v19;
  if (!size)
  {
LABEL_10:
    if ((v11 | 0x40) == 0x40)
    {
      int v12 = *v4;
      if (v12 == 92)
      {
        unint64_t v13 = v4 + 1;
        if (v11)
        {
          uint64_t v14 = sub_20DB66288(a1, v13, a3, &v26);
        }
        else
        {
          uint64_t v14 = (char *)sub_20DB66160(a1, v13, a3, &v26, v6);
          int v11 = 0;
        }
        goto LABEL_16;
      }
    }
    else
    {
      LOBYTE(v12) = *v4;
    }
    std::string::operator=(&v26, v12);
    uint64_t v14 = v4 + 1;
  }
LABEL_16:
  if (v14 == a3
    || (int v15 = *v14, v15 == 93)
    || (uint64_t v17 = v14 + 1, v14 + 1 == a3)
    || v15 != 45
    || *v17 == 93)
  {
    if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0)
    {
      if (v26.__r_.__value_.__l.__size_)
      {
        if (v26.__r_.__value_.__l.__size_ != 1)
        {
          uint64_t v16 = (std::string *)v26.__r_.__value_.__r.__words[0];
LABEL_40:
          sub_20DB668B8(v6, v16->__r_.__value_.__s.__data_[0], v16->__r_.__value_.__s.__data_[1]);
          goto LABEL_41;
        }
        uint64_t v16 = (std::string *)v26.__r_.__value_.__r.__words[0];
        goto LABEL_25;
      }
    }
    else if (*((unsigned char *)&v26.__r_.__value_.__s + 23))
    {
      uint64_t v16 = &v26;
      if (HIBYTE(v26.__r_.__value_.__r.__words[2]) != 1) {
        goto LABEL_40;
      }
LABEL_25:
      sub_20DB644E4(v6, v16->__r_.__value_.__s.__data_[0]);
    }
LABEL_41:
    char v21 = 1;
    unint64_t v4 = v14;
    goto LABEL_42;
  }
  memset(&v25, 0, sizeof(v25));
  unint64_t v4 = v14 + 2;
  if (v14 + 2 != a3 && *v17 == 91 && *v4 == 46)
  {
    unint64_t v18 = sub_20DB66078(a1, v14 + 3, a3, (uint64_t)&v25);
LABEL_55:
    unint64_t v4 = v18;
    goto LABEL_56;
  }
  if ((v11 | 0x40) == 0x40)
  {
    LODWORD(v17) = *v17;
    if (v17 == 92)
    {
      if (v11) {
        unint64_t v18 = sub_20DB66288(a1, v14 + 2, a3, &v25);
      }
      else {
        unint64_t v18 = (char *)sub_20DB66160(a1, v14 + 2, a3, &v25, v6);
      }
      goto LABEL_55;
    }
  }
  else
  {
    LOBYTE(v17) = *v17;
  }
  std::string::operator=(&v25, (std::string::value_type)v17);
LABEL_56:
  std::string v24 = v26;
  memset(&v26, 0, sizeof(v26));
  std::string __p = v25;
  memset(&v25, 0, sizeof(v25));
  sub_20DB66490(v6, (char *)&v24, (char *)&__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v24.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v25.__r_.__value_.__l.__data_);
  }
  char v21 = 1;
LABEL_42:
  if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v26.__r_.__value_.__l.__data_);
  }
  if (v21) {
    return v4;
  }
  return (char *)v6;
}

void sub_20DB65D6C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  if (a28 < 0) {
    operator delete(__p);
  }
  if (*(char *)(v28 - 49) < 0) {
    operator delete(*(void **)(v28 - 72));
  }
  _Unwind_Resume(exception_object);
}

char *sub_20DB65DE4(uint64_t a1, char *a2, char *a3, uint64_t *a4)
{
  if (a3 - a2 < 2 || a3 - 1 == a2) {
    goto LABEL_33;
  }
  uint64_t v6 = a3 - 2;
  size_t v7 = a2;
  size_t v8 = a2;
  for (i = a2; ; size_t v8 = i)
  {
    int v10 = *i++;
    if (v10 == 61 && *i == 93) {
      break;
    }
    if (a2 == v6) {
      goto LABEL_33;
    }
    ++v7;
    --v6;
  }
  if (v8 == a3) {
LABEL_33:
  }
    sub_20DB659C4();
  sub_20DB66BB0(a1, a2, v7, (uint64_t)&v20);
  if (((char)v22 & 0x80000000) == 0)
  {
    uint64_t v11 = v22;
    if (v22)
    {
      int v12 = (char *)&v20;
      goto LABEL_14;
    }
LABEL_34:
    sub_20DB66B14();
  }
  uint64_t v11 = v21;
  if (!v21) {
    goto LABEL_34;
  }
  int v12 = (char *)v20;
LABEL_14:
  sub_20DB66D60(a1, v12, &v12[v11], (uint64_t)__p);
  unint64_t v13 = v19;
  if ((v19 & 0x80u) != 0) {
    unint64_t v13 = (unint64_t)__p[1];
  }
  if (v13)
  {
    sub_20DB66B6C(a4, (long long *)__p);
  }
  else
  {
    uint64_t v14 = v22;
    if ((v22 & 0x80u) != 0) {
      uint64_t v14 = v21;
    }
    if (v14 == 2)
    {
      uint64_t v16 = (char *)&v20;
      if ((v22 & 0x80u) != 0) {
        uint64_t v16 = (char *)v20;
      }
      sub_20DB668B8((uint64_t)a4, *v16, v16[1]);
    }
    else
    {
      if (v14 != 1) {
        sub_20DB66B14();
      }
      int v15 = (char *)&v20;
      if ((v22 & 0x80u) != 0) {
        int v15 = (char *)v20;
      }
      sub_20DB644E4((uint64_t)a4, *v15);
    }
  }
  if ((char)v19 < 0) {
    operator delete(__p[0]);
  }
  if ((char)v22 < 0) {
    operator delete(v20);
  }
  return v7 + 2;
}

void sub_20DB65F8C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

char *sub_20DB65FC4(uint64_t a1, char *a2, char *a3, uint64_t a4)
{
  if (a3 - a2 < 2 || a3 - 1 == a2) {
    goto LABEL_11;
  }
  int v5 = a3 - 2;
  uint64_t v6 = a2;
  size_t v7 = a2;
  for (i = a2; ; size_t v7 = i)
  {
    int v9 = *i++;
    if (v9 == 58 && *i == 93) {
      break;
    }
    if (a2 == v5) {
      goto LABEL_11;
    }
    ++v6;
    --v5;
  }
  if (v7 == a3) {
LABEL_11:
  }
    sub_20DB659C4();
  int v10 = sub_20DB67314(a1, a2, v6, *(_DWORD *)(a1 + 24) & 1);
  if (!v10) {
    sub_20DB672BC();
  }
  *(_DWORD *)(a4 + 160) |= v10;
  return v6 + 2;
}

char *sub_20DB66078(uint64_t a1, char *a2, char *a3, uint64_t a4)
{
  if (a3 - a2 < 2 || a3 - 1 == a2) {
    goto LABEL_15;
  }
  int v5 = a3 - 2;
  uint64_t v6 = a2;
  size_t v7 = a2;
  for (i = a2; ; size_t v7 = i)
  {
    int v9 = *i++;
    if (v9 == 46 && *i == 93) {
      break;
    }
    if (a2 == v5) {
      goto LABEL_15;
    }
    ++v6;
    --v5;
  }
  if (v7 == a3) {
LABEL_15:
  }
    sub_20DB659C4();
  sub_20DB66BB0(a1, a2, v6, (uint64_t)&v13);
  if (*(char *)(a4 + 23) < 0) {
    operator delete(*(void **)a4);
  }
  *(_OWORD *)a4 = v13;
  unint64_t v10 = v14;
  *(void *)(a4 + 16) = v14;
  unint64_t v11 = HIBYTE(v10);
  if ((v11 & 0x80u) != 0) {
    unint64_t v11 = *(void *)(a4 + 8);
  }
  if (v11 - 1 >= 2) {
    sub_20DB66B14();
  }
  return v6 + 2;
}

unsigned __int8 *sub_20DB66160(uint64_t a1, char *a2, char *a3, std::string *this, uint64_t a5)
{
  if (a2 == a3) {
    sub_20DB6315C();
  }
  int v6 = *a2;
  if (v6 > 97)
  {
    if (v6 > 114)
    {
      if (v6 != 115)
      {
        if (v6 != 119) {
          return sub_20DB6333C(a1, a2, a3, this);
        }
        *(_DWORD *)(a5 + 160) |= 0x500u;
        sub_20DB644E4(a5, 95);
        return (unsigned __int8 *)(a2 + 1);
      }
      int v8 = *(_DWORD *)(a5 + 160) | 0x4000;
    }
    else
    {
      if (v6 == 98)
      {
        unint64_t v10 = this;
        std::string::value_type v9 = 8;
LABEL_19:
        std::string::operator=(v10, v9);
        return (unsigned __int8 *)(a2 + 1);
      }
      if (v6 != 100) {
        return sub_20DB6333C(a1, a2, a3, this);
      }
      int v8 = *(_DWORD *)(a5 + 160) | 0x400;
    }
    *(_DWORD *)(a5 + 160) = v8;
    return (unsigned __int8 *)(a2 + 1);
  }
  if (v6 <= 82)
  {
    if (*a2)
    {
      if (v6 == 68)
      {
        int v7 = *(_DWORD *)(a5 + 164) | 0x400;
LABEL_21:
        *(_DWORD *)(a5 + 164) = v7;
        return (unsigned __int8 *)(a2 + 1);
      }
      return sub_20DB6333C(a1, a2, a3, this);
    }
    std::string::value_type v9 = 0;
    unint64_t v10 = this;
    goto LABEL_19;
  }
  if (v6 == 83)
  {
    int v7 = *(_DWORD *)(a5 + 164) | 0x4000;
    goto LABEL_21;
  }
  if (v6 == 87)
  {
    *(_DWORD *)(a5 + 164) |= 0x500u;
    sub_20DB673E8(a5, 95);
    return (unsigned __int8 *)(a2 + 1);
  }
  return sub_20DB6333C(a1, a2, a3, this);
}

char *sub_20DB66288(uint64_t a1, char *a2, char *a3, std::string *this)
{
  if (a2 == a3) {
LABEL_45:
  }
    sub_20DB6315C();
  int v5 = *a2;
  if (v5 > 97)
  {
    switch(v5)
    {
      case 'n':
        if (!this) {
          goto LABEL_43;
        }
        int v6 = this;
        LOBYTE(v5) = 10;
        goto LABEL_16;
      case 'o':
      case 'p':
      case 'q':
      case 's':
      case 'u':
        goto LABEL_21;
      case 'r':
        if (!this) {
          goto LABEL_43;
        }
        int v6 = this;
        LOBYTE(v5) = 13;
        goto LABEL_16;
      case 't':
        if (!this) {
          goto LABEL_43;
        }
        int v6 = this;
        LOBYTE(v5) = 9;
        goto LABEL_16;
      case 'v':
        if (!this) {
          goto LABEL_43;
        }
        int v6 = this;
        LOBYTE(v5) = 11;
        goto LABEL_16;
      default:
        if (v5 == 98)
        {
          if (this)
          {
            int v6 = this;
            LOBYTE(v5) = 8;
            goto LABEL_16;
          }
        }
        else
        {
          if (v5 != 102) {
            goto LABEL_21;
          }
          if (this)
          {
            int v6 = this;
            LOBYTE(v5) = 12;
            goto LABEL_16;
          }
        }
        break;
    }
    goto LABEL_43;
  }
  if (v5 > 91)
  {
    if (v5 != 92)
    {
      if (v5 != 97) {
        goto LABEL_21;
      }
      if (this)
      {
        int v6 = this;
        LOBYTE(v5) = 7;
LABEL_16:
        std::string::operator=(v6, v5);
        return a2 + 1;
      }
LABEL_43:
      sub_20DB63650(a1);
    }
LABEL_14:
    if (this)
    {
      int v6 = this;
      goto LABEL_16;
    }
    goto LABEL_43;
  }
  if (v5 == 34 || v5 == 47) {
    goto LABEL_14;
  }
LABEL_21:
  if ((v5 & 0xFFFFFFF8) != 0x30) {
    goto LABEL_45;
  }
  std::string::value_type v7 = v5 - 48;
  unint64_t v11 = a2 + 1;
  if (a2 + 1 == a3)
  {
LABEL_38:
    unint64_t v11 = a3;
    goto LABEL_39;
  }
  if ((*v11 & 0xF8) == 0x30)
  {
    std::string::value_type v7 = *v11 + 8 * v7 - 48;
    if (a2 + 2 != a3)
    {
      char v8 = a2[2];
      int v9 = v8 & 0xF8;
      std::string::value_type v10 = v8 + 8 * v7 - 48;
      if (v9 == 48) {
        unint64_t v11 = a2 + 3;
      }
      else {
        unint64_t v11 = a2 + 2;
      }
      if (v9 == 48) {
        std::string::value_type v7 = v10;
      }
      goto LABEL_39;
    }
    goto LABEL_38;
  }
LABEL_39:
  if (!this) {
    sub_20DB63650(a1);
  }
  std::string::operator=(this, v7);
  return v11;
}

void sub_20DB66490(uint64_t a1, char *a2, char *a3)
{
  uint64_t v3 = a3;
  unint64_t v4 = a2;
  if (*(unsigned char *)(a1 + 170))
  {
    if (*(unsigned char *)(a1 + 169))
    {
      for (unint64_t i = 0; ; ++i)
      {
        unint64_t v7 = v4[23] < 0 ? *((void *)v4 + 1) : v4[23];
        if (i >= v7) {
          break;
        }
        char v8 = v4;
        if (v4[23] < 0) {
          char v8 = *(char **)v4;
        }
        char v9 = (*(uint64_t (**)(void, void))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), v8[i]);
        std::string::value_type v10 = v4;
        if (v4[23] < 0) {
          std::string::value_type v10 = *(char **)v4;
        }
        v10[i] = v9;
      }
      for (unint64_t j = 0; ; ++j)
      {
        unint64_t v12 = v3[23] < 0 ? *((void *)v3 + 1) : v3[23];
        if (j >= v12) {
          break;
        }
        long long v13 = v3;
        if (v3[23] < 0) {
          long long v13 = *(char **)v3;
        }
        char v14 = (*(uint64_t (**)(void, void))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), v13[j]);
        int v15 = v3;
        if (v3[23] < 0) {
          int v15 = *(char **)v3;
        }
        v15[j] = v14;
      }
    }
    else
    {
      for (unint64_t k = 0; ; ++k)
      {
        unint64_t v18 = a2[23] < 0 ? *((void *)a2 + 1) : a2[23];
        if (k >= v18) {
          break;
        }
        unsigned __int8 v19 = a2;
        if (a2[23] < 0) {
          unsigned __int8 v19 = *(char **)a2;
        }
        uint64_t v20 = a2;
        if (a2[23] < 0) {
          uint64_t v20 = *(char **)a2;
        }
        v20[k] = v19[k];
      }
      for (unint64_t m = 0; ; ++m)
      {
        unint64_t v22 = a3[23] < 0 ? *((void *)a3 + 1) : a3[23];
        if (m >= v22) {
          break;
        }
        int v23 = a3;
        if (a3[23] < 0) {
          int v23 = *(char **)a3;
        }
        std::string v24 = a3;
        if (a3[23] < 0) {
          std::string v24 = *(char **)a3;
        }
        v24[m] = v23[m];
      }
    }
    if (v4[23] < 0)
    {
      std::string v26 = v4;
      unint64_t v4 = *(char **)v4;
      uint64_t v25 = *((void *)v26 + 1);
    }
    else
    {
      uint64_t v25 = v4[23];
    }
    sub_20DB6779C(a1 + 16, v4, &v4[v25]);
    if (v3[23] < 0)
    {
      uint64_t v28 = v3;
      uint64_t v3 = *(char **)v3;
      uint64_t v27 = *((void *)v28 + 1);
    }
    else
    {
      uint64_t v27 = v3[23];
    }
    sub_20DB6779C(a1 + 16, v3, &v3[v27]);
    *(_OWORD *)long long v40 = v38;
    uint64_t v41 = v39;
    *(_OWORD *)std::string __p = *(_OWORD *)v36;
    uint64_t v43 = v37;
    sub_20DB67630((uint64_t *)(a1 + 88), (long long *)v40);
    if (SHIBYTE(v43) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v41) < 0) {
      operator delete(v40[0]);
    }
  }
  else
  {
    if (a2[23] < 0) {
      uint64_t v16 = *((void *)a2 + 1);
    }
    else {
      uint64_t v16 = a2[23];
    }
    if (v16 != 1 || (a3[23] < 0 ? (uint64_t v29 = *((void *)a3 + 1)) : (uint64_t v29 = a3[23]), v29 != 1)) {
      sub_20DB67854();
    }
    if (*(unsigned char *)(a1 + 169))
    {
      size_t v30 = a2;
      if (a2[23] < 0) {
        size_t v30 = *(char **)a2;
      }
      char v31 = (*(uint64_t (**)(void, void))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), *v30);
      size_t v32 = v4;
      if (v4[23] < 0) {
        size_t v32 = *(unsigned char **)v4;
      }
      *size_t v32 = v31;
      int v33 = v3;
      if (v3[23] < 0) {
        int v33 = *(char **)v3;
      }
      char v34 = (*(uint64_t (**)(void, void))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), *v33);
      int v35 = v3;
      if (v3[23] < 0) {
        int v35 = *(unsigned char **)v3;
      }
      unsigned char *v35 = v34;
    }
    *(_OWORD *)long long v40 = *(_OWORD *)v4;
    uint64_t v41 = *((void *)v4 + 2);
    *((void *)v4 + 1) = 0;
    *((void *)v4 + 2) = 0;
    *(void *)unint64_t v4 = 0;
    *(_OWORD *)std::string __p = *(_OWORD *)v3;
    uint64_t v43 = *((void *)v3 + 2);
    *(void *)uint64_t v3 = 0;
    *((void *)v3 + 1) = 0;
    *((void *)v3 + 2) = 0;
    sub_20DB67630((uint64_t *)(a1 + 88), (long long *)v40);
    if (SHIBYTE(v43) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v41) < 0) {
      operator delete(v40[0]);
    }
  }
}

void sub_20DB6686C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,char a21)
{
}

void sub_20DB668B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!*(unsigned char *)(a1 + 169))
  {
    uint64_t v18 = a1 + 128;
    unint64_t v19 = *(void *)(a1 + 128);
    std::string::value_type v10 = (char **)(a1 + 112);
    __int16 v8 = a2 | (unsigned __int16)((_WORD)a3 << 8);
    char v9 = *(_WORD **)(a1 + 120);
    if (*(unsigned char *)(a1 + 170))
    {
      if ((unint64_t)v9 < v19) {
        goto LABEL_24;
      }
      uint64_t v20 = (char *)v9 - *v10;
      if (v20 > -3)
      {
        uint64_t v21 = v20 >> 1;
        unint64_t v22 = v19 - (void)*v10;
        if (v22 <= (v20 >> 1) + 1) {
          unint64_t v23 = v21 + 1;
        }
        else {
          unint64_t v23 = v22;
        }
        if (v22 >= 0x7FFFFFFFFFFFFFFELL) {
          uint64_t v24 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          uint64_t v24 = v23;
        }
        if (v24) {
          uint64_t v25 = (char *)sub_20DB67B2C(v18, v24);
        }
        else {
          uint64_t v25 = 0;
        }
        uint64_t v27 = &v25[2 * v21];
        uint64_t v28 = &v25[2 * v24];
        *(_WORD *)uint64_t v27 = v8;
        std::string v26 = v27 + 2;
        long long v38 = *(char **)(a1 + 112);
        uint64_t v29 = *(char **)(a1 + 120);
        if (v29 == v38) {
          goto LABEL_46;
        }
        do
        {
          __int16 v39 = *((_WORD *)v29 - 1);
          v29 -= 2;
          *((_WORD *)v27 - 1) = v39;
          v27 -= 2;
        }
        while (v29 != v38);
        goto LABEL_45;
      }
    }
    else
    {
      if ((unint64_t)v9 < v19) {
        goto LABEL_24;
      }
      uint64_t v32 = (char *)v9 - *v10;
      if (v32 > -3)
      {
        uint64_t v33 = v32 >> 1;
        unint64_t v34 = v19 - (void)*v10;
        if (v34 <= (v32 >> 1) + 1) {
          unint64_t v35 = v33 + 1;
        }
        else {
          unint64_t v35 = v34;
        }
        if (v34 >= 0x7FFFFFFFFFFFFFFELL) {
          uint64_t v36 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          uint64_t v36 = v35;
        }
        if (v36) {
          uint64_t v37 = (char *)sub_20DB67B2C(v18, v36);
        }
        else {
          uint64_t v37 = 0;
        }
        uint64_t v27 = &v37[2 * v33];
        uint64_t v28 = &v37[2 * v36];
        *(_WORD *)uint64_t v27 = v8;
        std::string v26 = v27 + 2;
        long long v40 = *(char **)(a1 + 112);
        uint64_t v29 = *(char **)(a1 + 120);
        if (v29 == v40) {
          goto LABEL_46;
        }
        do
        {
          __int16 v41 = *((_WORD *)v29 - 1);
          v29 -= 2;
          *((_WORD *)v27 - 1) = v41;
          v27 -= 2;
        }
        while (v29 != v40);
        goto LABEL_45;
      }
    }
LABEL_49:
    sub_20DB5E168();
  }
  unsigned __int8 v5 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), a2);
  __int16 v6 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), a3);
  unint64_t v7 = *(void *)(a1 + 128);
  __int16 v8 = v5 | (unsigned __int16)(v6 << 8);
  char v9 = *(_WORD **)(a1 + 120);
  if ((unint64_t)v9 < v7)
  {
LABEL_24:
    _WORD *v9 = v8;
    std::string v26 = v9 + 1;
    goto LABEL_48;
  }
  std::string::value_type v10 = (char **)(a1 + 112);
  uint64_t v11 = *(void *)(a1 + 112);
  uint64_t v12 = (uint64_t)v9 - v11;
  if ((uint64_t)v9 - v11 <= -3) {
    goto LABEL_49;
  }
  uint64_t v13 = v12 >> 1;
  unint64_t v14 = v7 - v11;
  if (v14 <= (v12 >> 1) + 1) {
    unint64_t v15 = v13 + 1;
  }
  else {
    unint64_t v15 = v14;
  }
  if (v14 >= 0x7FFFFFFFFFFFFFFELL) {
    uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v16 = v15;
  }
  if (v16) {
    uint64_t v17 = (char *)sub_20DB67B2C(a1 + 128, v16);
  }
  else {
    uint64_t v17 = 0;
  }
  uint64_t v27 = &v17[2 * v13];
  uint64_t v28 = &v17[2 * v16];
  *(_WORD *)uint64_t v27 = v8;
  std::string v26 = v27 + 2;
  size_t v30 = *(char **)(a1 + 112);
  uint64_t v29 = *(char **)(a1 + 120);
  if (v29 == v30) {
    goto LABEL_46;
  }
  do
  {
    __int16 v31 = *((_WORD *)v29 - 1);
    v29 -= 2;
    *((_WORD *)v27 - 1) = v31;
    v27 -= 2;
  }
  while (v29 != v30);
LABEL_45:
  uint64_t v29 = *v10;
LABEL_46:
  *(void *)(a1 + 112) = v27;
  *(void *)(a1 + 120) = v26;
  *(void *)(a1 + 128) = v28;
  if (v29) {
    operator delete(v29);
  }
LABEL_48:
  *(void *)(a1 + 120) = v26;
}

void sub_20DB66B14()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x210564930](exception, 1);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_20DB66B58(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_20DB66B6C(uint64_t *a1, long long *a2)
{
  uint64_t v3 = a1 + 17;
  unint64_t v4 = a1[18];
  if (v4 >= a1[19])
  {
    uint64_t result = sub_20DB66ED0(v3, a2);
  }
  else
  {
    sub_20DB66E70(v3, a2);
    uint64_t result = v4 + 24;
  }
  a1[18] = result;
  return result;
}

void sub_20DB66BB0(uint64_t a1@<X0>, char *a2@<X1>, char *a3@<X2>, uint64_t a4@<X8>)
{
  sub_20DB65760(&__s, a2, a3, a3 - a2);
  *(void *)a4 = 0;
  *(void *)(a4 + 8) = 0;
  *(void *)(a4 + 16) = 0;
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
  {
    if (!__s.__r_.__value_.__l.__size_) {
      goto LABEL_9;
    }
    p_s = (std::string *)__s.__r_.__value_.__r.__words[0];
  }
  else
  {
    if (!*((unsigned char *)&__s.__r_.__value_.__s + 23)) {
      return;
    }
    p_s = &__s;
  }
  std::__get_collation_name(&v11, (const char *)p_s);
  *(_OWORD *)a4 = *(_OWORD *)&v11.__r_.__value_.__l.__data_;
  unint64_t v7 = v11.__r_.__value_.__r.__words[2];
  *(void *)(a4 + 16) = *((void *)&v11.__r_.__value_.__l + 2);
  unint64_t v8 = HIBYTE(v7);
  if ((v8 & 0x80u) != 0) {
    unint64_t v8 = *(void *)(a4 + 8);
  }
  if (v8) {
    goto LABEL_9;
  }
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
  {
    if (__s.__r_.__value_.__l.__size_ >= 3) {
      goto LABEL_9;
    }
  }
  else if (HIBYTE(__s.__r_.__value_.__r.__words[2]) >= 3u)
  {
    return;
  }
  (*(void (**)(std::string *__return_ptr))(**(void **)(a1 + 16) + 32))(&v11);
  if (*(char *)(a4 + 23) < 0) {
    operator delete(*(void **)a4);
  }
  *(std::string *)a4 = v11;
  if ((*(char *)(a4 + 23) & 0x80000000) == 0)
  {
    int v9 = *(unsigned __int8 *)(a4 + 23);
    if (v9 != 12 && v9 != 1)
    {
      *(unsigned char *)a4 = 0;
      *(unsigned char *)(a4 + 23) = 0;
      goto LABEL_9;
    }
    goto LABEL_23;
  }
  uint64_t v10 = *(void *)(a4 + 8);
  if (v10 == 1 || v10 == 12)
  {
LABEL_23:
    std::string::operator=((std::string *)a4, &__s);
    goto LABEL_9;
  }
  **(unsigned char **)a4 = 0;
  *(void *)(a4 + 8) = 0;
LABEL_9:
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__s.__r_.__value_.__l.__data_);
  }
}

void sub_20DB66D2C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (*(char *)(v17 + 23) < 0) {
    operator delete(*(void **)v17);
  }
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_20DB66D60(uint64_t a1@<X0>, char *a2@<X1>, char *a3@<X2>, uint64_t a4@<X8>)
{
  sub_20DB65760(__p, a2, a3, a3 - a2);
  unint64_t v6 = v12;
  if ((v12 & 0x80u) == 0) {
    unint64_t v7 = __p;
  }
  else {
    unint64_t v7 = (void **)__p[0];
  }
  if ((v12 & 0x80u) != 0) {
    unint64_t v6 = (unint64_t)__p[1];
  }
  (*(void (**)(void, void **, char *))(**(void **)(a1 + 16) + 32))(*(void *)(a1 + 16), v7, (char *)v7 + v6);
  uint64_t v8 = *(unsigned __int8 *)(a4 + 23);
  int v9 = (char)v8;
  if ((v8 & 0x80u) != 0) {
    uint64_t v8 = *(void *)(a4 + 8);
  }
  if (v8 != 1)
  {
    if (v8 == 12)
    {
      if (v9 >= 0) {
        uint64_t v10 = (unsigned char *)a4;
      }
      else {
        uint64_t v10 = *(unsigned char **)a4;
      }
      v10[11] = v10[3];
    }
    else if (v9 < 0)
    {
      **(unsigned char **)a4 = 0;
      *(void *)(a4 + 8) = 0;
    }
    else
    {
      *(unsigned char *)a4 = 0;
      *(unsigned char *)(a4 + 23) = 0;
    }
  }
  if ((char)v12 < 0) {
    operator delete(__p[0]);
  }
}

void sub_20DB66E54(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *sub_20DB66E70(void *result, long long *a2)
{
  char v2 = result;
  uint64_t v3 = result[1];
  if (*((char *)a2 + 23) < 0)
  {
    uint64_t result = sub_20DB66FF4((unsigned char *)result[1], *(void **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v4 = *a2;
    *(void *)(v3 + 16) = *((void *)a2 + 2);
    *(_OWORD *)uint64_t v3 = v4;
  }
  v2[1] = v3 + 24;
  return result;
}

void sub_20DB66EC8(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t sub_20DB66ED0(uint64_t *a1, long long *a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0xAAAAAAAAAAAAAAALL) {
    sub_20DB5E168();
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
  uint64_t v18 = a1 + 2;
  if (v9) {
    uint64_t v10 = (char *)sub_20DB622B0(v7, v9);
  }
  else {
    uint64_t v10 = 0;
  }
  std::string v11 = &v10[24 * v4];
  v15[0] = v10;
  v15[1] = v11;
  uint64_t v16 = v11;
  uint64_t v17 = &v10[24 * v9];
  if (*((char *)a2 + 23) < 0)
  {
    sub_20DB66FF4(v11, *(void **)a2, *((void *)a2 + 1));
    std::string v11 = v16;
  }
  else
  {
    long long v12 = *a2;
    *((void *)v11 + 2) = *((void *)a2 + 2);
    *(_OWORD *)std::string v11 = v12;
  }
  uint64_t v16 = v11 + 24;
  sub_20DB67094(a1, v15);
  uint64_t v13 = a1[1];
  sub_20DB6722C((uint64_t)v15);
  return v13;
}

void sub_20DB66FE0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_20DB6722C((uint64_t)va);
  _Unwind_Resume(a1);
}

void *sub_20DB66FF4(unsigned char *__dst, void *__src, unint64_t a3)
{
  unint64_t v5 = __dst;
  if (a3 > 0x16)
  {
    if (a3 >= 0x7FFFFFFFFFFFFFF8) {
      sub_20DB5DACC();
    }
    uint64_t v6 = (a3 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a3 | 7) != 0x17) {
      uint64_t v6 = a3 | 7;
    }
    uint64_t v7 = v6 + 1;
    unint64_t v8 = operator new(v6 + 1);
    v5[1] = a3;
    v5[2] = v7 | 0x8000000000000000;
    void *v5 = v8;
    unint64_t v5 = v8;
  }
  else
  {
    __dst[23] = a3;
  }

  return memmove(v5, __src, a3 + 1);
}

uint64_t sub_20DB67094(uint64_t *a1, void *a2)
{
  uint64_t result = sub_20DB6710C((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
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

uint64_t sub_20DB6710C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v15 = a6;
  *((void *)&v15 + 1) = a7;
  long long v14 = v15;
  v12[0] = a1;
  v12[1] = &v14;
  v12[2] = &v15;
  if (a3 != a5)
  {
    uint64_t v9 = a7;
    do
    {
      long long v10 = *(_OWORD *)(a3 - 24);
      *(void *)(v9 - 8) = *(void *)(a3 - 8);
      *(_OWORD *)(v9 - 24) = v10;
      v9 -= 24;
      *(void *)(a3 - 16) = 0;
      *(void *)(a3 - 8) = 0;
      *(void *)(a3 - 24) = 0;
      v7 -= 24;
      a3 -= 24;
    }
    while (a3 != a5);
    *((void *)&v15 + 1) = v9;
  }
  char v13 = 1;
  sub_20DB671AC((uint64_t)v12);
  return a6;
}

uint64_t sub_20DB671AC(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    sub_20DB671E4(a1);
  }
  return a1;
}

void sub_20DB671E4(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 16) + 8);
  uint64_t v2 = *(void *)(*(void *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 + 23) < 0) {
      operator delete(*(void **)v1);
    }
    v1 += 24;
  }
}

uint64_t sub_20DB6722C(uint64_t a1)
{
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void sub_20DB67264(uint64_t a1, void **a2)
{
  uint64_t v2 = *(void ***)(a1 + 16);
  if (v2 != a2)
  {
    do
    {
      uint64_t v5 = v2 - 3;
      *(void *)(a1 + 16) = v2 - 3;
      if (*((char *)v2 - 1) < 0)
      {
        operator delete(*v5);
        uint64_t v5 = *(void ***)(a1 + 16);
      }
      uint64_t v2 = v5;
    }
    while (v5 != a2);
  }
}

void sub_20DB672BC()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x210564930](exception, 2);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_20DB67300(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_20DB67314(uint64_t a1, char *a2, char *a3, BOOL a4)
{
  sub_20DB65760(__p, a2, a3, a3 - a2);
  unint64_t v6 = v12;
  if ((v12 & 0x80u) == 0) {
    uint64_t v7 = __p;
  }
  else {
    uint64_t v7 = (void **)__p[0];
  }
  if ((v12 & 0x80u) != 0) {
    unint64_t v6 = (unint64_t)__p[1];
  }
  (*(void (**)(void, void **, char *))(**(void **)(a1 + 8) + 48))(*(void *)(a1 + 8), v7, (char *)v7 + v6);
  if ((v12 & 0x80u) == 0) {
    uint64_t v8 = __p;
  }
  else {
    uint64_t v8 = (void **)__p[0];
  }
  uint64_t classname = std::__get_classname((const char *)v8, a4);
  if ((char)v12 < 0) {
    operator delete(__p[0]);
  }
  return classname;
}

void sub_20DB673CC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_20DB673E8(uint64_t a1, uint64_t a2)
{
  char v2 = a2;
  if (*(unsigned char *)(a1 + 169))
  {
    char v2 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), a2);
    uint64_t v5 = *(unsigned char **)(a1 + 72);
    unint64_t v4 = *(void *)(a1 + 80);
    if ((unint64_t)v5 >= v4)
    {
      unint64_t v6 = (unint64_t *)(a1 + 64);
      unint64_t v7 = *(void *)(a1 + 64);
      uint64_t v8 = &v5[-v7];
      uint64_t v9 = (uint64_t)&v5[-v7 + 1];
      if (v9 >= 0)
      {
        unint64_t v10 = v4 - v7;
        if (2 * v10 > v9) {
          uint64_t v9 = 2 * v10;
        }
        if (v10 >= 0x3FFFFFFFFFFFFFFFLL) {
          size_t v11 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          size_t v11 = v9;
        }
        if (v11) {
          unsigned __int8 v12 = operator new(v11);
        }
        else {
          unsigned __int8 v12 = 0;
        }
        uint64_t v20 = &v8[(void)v12];
        uint64_t v21 = (char *)v12 + v11;
        v8[(void)v12] = v2;
        uint64_t v19 = (uint64_t)&v8[(void)v12 + 1];
        if (v5 != (unsigned char *)v7)
        {
          unint64_t v22 = &v5[~v7];
          do
          {
            char v23 = *--v5;
            (v22--)[(void)v12] = v23;
          }
          while (v5 != (unsigned char *)v7);
LABEL_45:
          uint64_t v5 = (unsigned char *)*v6;
          goto LABEL_47;
        }
        goto LABEL_46;
      }
LABEL_50:
      sub_20DB5E168();
    }
    goto LABEL_22;
  }
  unint64_t v6 = (unint64_t *)(a1 + 64);
  uint64_t v5 = *(unsigned char **)(a1 + 72);
  unint64_t v13 = *(void *)(a1 + 80);
  if (!*(unsigned char *)(a1 + 170))
  {
    if ((unint64_t)v5 >= v13)
    {
      unint64_t v24 = *v6;
      uint64_t v25 = &v5[-*v6];
      unint64_t v26 = (unint64_t)(v25 + 1);
      if ((uint64_t)(v25 + 1) >= 0)
      {
        unint64_t v27 = v13 - v24;
        if (2 * v27 > v26) {
          unint64_t v26 = 2 * v27;
        }
        if (v27 >= 0x3FFFFFFFFFFFFFFFLL) {
          size_t v28 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          size_t v28 = v26;
        }
        if (v28) {
          unsigned __int8 v12 = operator new(v28);
        }
        else {
          unsigned __int8 v12 = 0;
        }
        uint64_t v20 = &v25[(void)v12];
        uint64_t v21 = (char *)v12 + v28;
        v25[(void)v12] = v2;
        uint64_t v19 = (uint64_t)&v25[(void)v12 + 1];
        if (v5 != (unsigned char *)v24)
        {
          __int16 v31 = &v5[~v24];
          do
          {
            char v32 = *--v5;
            (v31--)[(void)v12] = v32;
          }
          while (v5 != (unsigned char *)v24);
          goto LABEL_45;
        }
        goto LABEL_46;
      }
      goto LABEL_50;
    }
LABEL_22:
    unsigned char *v5 = v2;
    uint64_t v19 = (uint64_t)(v5 + 1);
    goto LABEL_49;
  }
  if ((unint64_t)v5 < v13) {
    goto LABEL_22;
  }
  unint64_t v14 = *v6;
  long long v15 = &v5[-*v6];
  unint64_t v16 = (unint64_t)(v15 + 1);
  if ((uint64_t)(v15 + 1) < 0) {
    goto LABEL_50;
  }
  unint64_t v17 = v13 - v14;
  if (2 * v17 > v16) {
    unint64_t v16 = 2 * v17;
  }
  if (v17 >= 0x3FFFFFFFFFFFFFFFLL) {
    size_t v18 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    size_t v18 = v16;
  }
  if (v18) {
    unsigned __int8 v12 = operator new(v18);
  }
  else {
    unsigned __int8 v12 = 0;
  }
  uint64_t v20 = &v15[(void)v12];
  uint64_t v21 = (char *)v12 + v18;
  v15[(void)v12] = v2;
  uint64_t v19 = (uint64_t)&v15[(void)v12 + 1];
  if (v5 != (unsigned char *)v14)
  {
    uint64_t v29 = &v5[~v14];
    do
    {
      char v30 = *--v5;
      (v29--)[(void)v12] = v30;
    }
    while (v5 != (unsigned char *)v14);
    goto LABEL_45;
  }
LABEL_46:
  unsigned __int8 v12 = v20;
LABEL_47:
  *(void *)(a1 + 64) = v12;
  *(void *)(a1 + 72) = v19;
  *(void *)(a1 + 80) = v21;
  if (v5) {
    operator delete(v5);
  }
LABEL_49:
  *(void *)(a1 + 72) = v19;
}

void **sub_20DB67630(uint64_t *a1, long long *a2)
{
  unint64_t v6 = a1[2];
  uint64_t result = (void **)(a1 + 2);
  unint64_t v5 = v6;
  unint64_t v7 = (unint64_t)*(result - 1);
  if (v7 >= v6)
  {
    unint64_t v11 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v7 - *a1) >> 4);
    unint64_t v12 = v11 + 1;
    if (v11 + 1 > 0x555555555555555) {
      sub_20DB5E168();
    }
    unint64_t v13 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v5 - *a1) >> 4);
    if (2 * v13 > v12) {
      unint64_t v12 = 2 * v13;
    }
    if (v13 >= 0x2AAAAAAAAAAAAAALL) {
      unint64_t v14 = 0x555555555555555;
    }
    else {
      unint64_t v14 = v12;
    }
    v19[4] = result;
    if (v14) {
      long long v15 = (char *)sub_20DB67924((uint64_t)result, v14);
    }
    else {
      long long v15 = 0;
    }
    unint64_t v16 = &v15[48 * v11];
    v19[0] = v15;
    v19[1] = v16;
    v19[3] = &v15[48 * v14];
    long long v17 = *a2;
    *((void *)v16 + 2) = *((void *)a2 + 2);
    *(_OWORD *)unint64_t v16 = v17;
    *((void *)a2 + 1) = 0;
    *((void *)a2 + 2) = 0;
    *(void *)a2 = 0;
    long long v18 = *(long long *)((char *)a2 + 24);
    *((void *)v16 + 5) = *((void *)a2 + 5);
    *(_OWORD *)(v16 + 24) = v18;
    *((void *)a2 + 4) = 0;
    *((void *)a2 + 5) = 0;
    *((void *)a2 + 3) = 0;
    v19[2] = v16 + 48;
    sub_20DB678AC(a1, v19);
    uint64_t v10 = a1[1];
    uint64_t result = sub_20DB67AB0(v19);
  }
  else
  {
    long long v8 = *a2;
    *(void *)(v7 + 16) = *((void *)a2 + 2);
    *(_OWORD *)unint64_t v7 = v8;
    *((void *)a2 + 1) = 0;
    *((void *)a2 + 2) = 0;
    *(void *)a2 = 0;
    long long v9 = *(long long *)((char *)a2 + 24);
    *(void *)(v7 + 40) = *((void *)a2 + 5);
    *(_OWORD *)(v7 + 24) = v9;
    *((void *)a2 + 4) = 0;
    *((void *)a2 + 5) = 0;
    *((void *)a2 + 3) = 0;
    uint64_t v10 = v7 + 48;
    a1[1] = v7 + 48;
  }
  a1[1] = v10;
  return result;
}

void sub_20DB67788(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_20DB67AB0((void **)va);
  _Unwind_Resume(a1);
}

void sub_20DB6779C(uint64_t a1, char *a2, char *a3)
{
  sub_20DB65760(__p, a2, a3, a3 - a2);
  unint64_t v4 = v7;
  if ((v7 & 0x80u) == 0) {
    unint64_t v5 = __p;
  }
  else {
    unint64_t v5 = (void **)__p[0];
  }
  if ((v7 & 0x80u) != 0) {
    unint64_t v4 = (unint64_t)__p[1];
  }
  (*(void (**)(void, void **, char *))(**(void **)(a1 + 16) + 32))(*(void *)(a1 + 16), v5, (char *)v5 + v4);
  if ((char)v7 < 0) {
    operator delete(__p[0]);
  }
}

void sub_20DB67838(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_20DB67854()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x210564930](exception, 9);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_20DB67898(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_20DB678AC(uint64_t *a1, void *a2)
{
  uint64_t result = sub_20DB6796C((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
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

void *sub_20DB67924(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x555555555555556) {
    sub_20DB5DB74();
  }
  return operator new(48 * a2);
}

uint64_t sub_20DB6796C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v16 = a6;
  *((void *)&v16 + 1) = a7;
  long long v15 = v16;
  v13[0] = a1;
  v13[1] = &v15;
  v13[2] = &v16;
  if (a3 != a5)
  {
    uint64_t v9 = a7;
    do
    {
      long long v10 = *(_OWORD *)(a3 - 48);
      *(void *)(v9 - 32) = *(void *)(a3 - 32);
      *(_OWORD *)(v9 - 48) = v10;
      *(void *)(a3 - 40) = 0;
      *(void *)(a3 - 32) = 0;
      *(void *)(a3 - 48) = 0;
      long long v11 = *(_OWORD *)(a3 - 24);
      *(void *)(v9 - 8) = *(void *)(a3 - 8);
      *(_OWORD *)(v9 - 24) = v11;
      v9 -= 48;
      *(void *)(a3 - 16) = 0;
      *(void *)(a3 - 8) = 0;
      *(void *)(a3 - 24) = 0;
      v7 -= 48;
      a3 -= 48;
    }
    while (a3 != a5);
    *((void *)&v16 + 1) = v9;
  }
  char v14 = 1;
  sub_20DB67A24((uint64_t)v13);
  return a6;
}

uint64_t sub_20DB67A24(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    sub_20DB67A5C((uint64_t *)a1);
  }
  return a1;
}

void sub_20DB67A5C(uint64_t *a1)
{
  uint64_t v1 = *(void *)(a1[2] + 8);
  uint64_t v2 = *(void *)(a1[1] + 8);
  if (v1 != v2)
  {
    uint64_t v3 = *a1;
    do
    {
      sub_20DB65374(v3, v1);
      v1 += 48;
    }
    while (v1 != v2);
  }
}

void **sub_20DB67AB0(void **a1)
{
  if (*a1) {
    operator delete(*a1);
  }
  return a1;
}

void sub_20DB67AE4(void *a1)
{
  uint64_t v2 = a1[1];
  for (uint64_t i = a1[2]; i != v2; uint64_t i = a1[2])
  {
    uint64_t v4 = a1[4];
    a1[2] = i - 48;
    sub_20DB65374(v4, i - 48);
  }
}

void *sub_20DB67B2C(uint64_t a1, uint64_t a2)
{
  if (a2 < 0) {
    sub_20DB5DB74();
  }
  return operator new(2 * a2);
}

void *sub_20DB67B60(void *a1)
{
  *a1 = &unk_26C244DC0;
  uint64_t v2 = a1[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  return a1;
}

void sub_20DB67BCC(void *a1)
{
  *a1 = &unk_26C244DC0;
  uint64_t v1 = a1[1];
  if (v1) {
    (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  }

  JUMPOUT(0x210564B70);
}

uint64_t sub_20DB67C58(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -994;
  *(void *)(*(void *)(a2 + 32) + 24 * (*(_DWORD *)(result + 16) - 1)) = *(void *)(a2 + 16);
  *(void *)(a2 + 80) = *(void *)(result + 8);
  return result;
}

void *sub_20DB67C88(void *a1)
{
  *a1 = &unk_26C244DC0;
  uint64_t v2 = a1[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  return a1;
}

void sub_20DB67CF4(void *a1)
{
  *a1 = &unk_26C244DC0;
  uint64_t v1 = a1[1];
  if (v1) {
    (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  }

  JUMPOUT(0x210564B70);
}

uint64_t sub_20DB67D80(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -994;
  uint64_t v2 = *(void *)(a2 + 32) + 24 * (*(_DWORD *)(result + 16) - 1);
  *(void *)(v2 + 8) = *(void *)(a2 + 16);
  *(unsigned char *)(v2 + 16) = 1;
  *(void *)(a2 + 80) = *(void *)(result + 8);
  return result;
}

void sub_20DB67DB8()
{
}

void sub_20DB67F10(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *sub_20DB67F48(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3, int *a4)
{
  if (a2 != a3)
  {
    int v4 = *a2;
    if ((v4 & 0xF8) == 0x30 || (v4 & 0xFE) == 0x38)
    {
      int v5 = v4 - 48;
      *a4 = v5;
      if (++a2 == a3)
      {
        return a3;
      }
      else
      {
        while (1)
        {
          int v6 = *a2;
          if ((v6 & 0xF8) != 0x30 && (v6 & 0xFE) != 0x38) {
            break;
          }
          if (v5 >= 214748364) {
            sub_20DB67FE8();
          }
          int v5 = v6 + 10 * v5 - 48;
          *a4 = v5;
          if (++a2 == a3) {
            return a3;
          }
        }
      }
    }
  }
  return a2;
}

void sub_20DB67FE8()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x210564930](exception, 8);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_20DB6802C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_20DB68040()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x210564930](exception, 7);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_20DB68084(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_20DB6809C(void *a1)
{
  sub_20DB681F4(a1);

  JUMPOUT(0x210564B70);
}

unsigned int *sub_20DB680D4(unsigned int *result, void *a2)
{
  uint64_t v2 = result[10];
  uint64_t v3 = a2[7];
  int v4 = (unint64_t *)(v3 + 16 * v2);
  if (*(_DWORD *)a2 == -991)
  {
    unint64_t v5 = *v4 + 1;
    *int v4 = v5;
    unint64_t v6 = *((void *)result + 3);
    unint64_t v7 = *((void *)result + 4);
    BOOL v8 = v5 < v7;
    if (v5 < v7 && v5 >= v6)
    {
      uint64_t v10 = *(void *)(v3 + 16 * v2 + 8);
      BOOL v8 = v5 < v7 && v10 != a2[2];
    }
    if (!v8 || v5 < v6)
    {
      *(_DWORD *)a2 = -994;
      if (!v8) {
        goto LABEL_25;
      }
LABEL_22:
      a2[10] = *((void *)result + 1);
      return sub_20DB682A8(result, a2);
    }
    goto LABEL_23;
  }
  *int v4 = 0;
  if (*((void *)result + 4))
  {
    if (*((void *)result + 3))
    {
      *(_DWORD *)a2 = -994;
      goto LABEL_22;
    }
LABEL_23:
    *(_DWORD *)a2 = -992;
    return result;
  }
  *(_DWORD *)a2 = -994;
LABEL_25:
  a2[10] = *((void *)result + 2);
  return result;
}

unsigned int *sub_20DB68188(unsigned int *result, int a2, void *a3)
{
  *(_DWORD *)a3 = -994;
  if (*((unsigned __int8 *)result + 52) == a2)
  {
    a3[10] = *((void *)result + 2);
  }
  else
  {
    a3[10] = *((void *)result + 1);
    return sub_20DB682A8(result, a3);
  }
  return result;
}

void sub_20DB681BC(void *a1)
{
  sub_20DB681F4(a1);

  JUMPOUT(0x210564B70);
}

void *sub_20DB681F4(void *a1)
{
  *a1 = &unk_26C244DF0;
  uint64_t v2 = a1[2];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  *a1 = &unk_26C244DC0;
  uint64_t v3 = a1[1];
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
  }
  return a1;
}

unsigned int *sub_20DB682A8(unsigned int *result, void *a2)
{
  unsigned int v2 = result[11];
  *(void *)(a2[7] + 16 * result[10] + 8) = a2[2];
  unsigned int v3 = result[12];
  if (v2 != v3)
  {
    uint64_t v4 = v2 - 1;
    uint64_t v5 = a2[3];
    uint64_t v6 = v3 - 1 - v4;
    uint64_t v7 = a2[4] + 24 * v4 + 8;
    do
    {
      *(void *)(v7 - 8) = v5;
      *(void *)uint64_t v7 = v5;
      *(unsigned char *)(v7 + 8) = 0;
      v7 += 24;
      --v6;
    }
    while (v6);
  }
  return result;
}

void sub_20DB68300()
{
}

uint64_t sub_20DB68314(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -991;
  *(void *)(a2 + 80) = *(void *)(result + 8);
  return result;
}

void sub_20DB6832C(void *a1)
{
  sub_20DB681F4(a1);

  JUMPOUT(0x210564B70);
}

void sub_20DB68364(uint64_t a1, _DWORD *a2)
{
  *a2 = -992;
}

uint64_t sub_20DB68370(uint64_t result, int a2, uint64_t a3)
{
  *(_DWORD *)a3 = -994;
  uint64_t v3 = 8;
  if (a2) {
    uint64_t v3 = 16;
  }
  *(void *)(a3 + 80) = *(void *)(result + v3);
  return result;
}

void sub_20DB68398()
{
}

uint64_t sub_20DB683AC(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -994;
  *(void *)(a2 + 80) = *(void *)(result + 8);
  return result;
}

uint64_t sub_20DB683C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  do
  {
    uint64_t v5 = a2;
    a2 = sub_20DB68464(a1, a2, a3);
  }
  while (v5 != a2);
  return v5;
}

void sub_20DB6840C()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x210564930](exception, 15);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_20DB68450(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *sub_20DB68464(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  if (a2 == a3) {
    return a2;
  }
  uint64_t v6 = sub_20DB68500(a1, a2, a3);
  if (v6 == a2) {
    return a2;
  }

  return sub_20DB68614(a1, v6, a3);
}

unsigned char *sub_20DB68500(uint64_t a1, unsigned char *a2, unsigned char *a3)
{
  uint64_t v6 = sub_20DB687B8(a1, a2, a3);
  uint64_t v7 = v6;
  if (a2 == v6 && a2 != a3 && a2 + 1 != a3)
  {
    uint64_t v9 = (uint64_t)v6;
    if (*a2 == 92) {
      uint64_t v9 = (uint64_t)&a2[2 * (a2[1] == 40)];
    }
    if ((unsigned char *)v9 == a2)
    {
      if (*a2 == 92)
      {
        int v11 = sub_20DB68AA4(a1, a2[1]);
        uint64_t v12 = 2;
        if (!v11) {
          uint64_t v12 = 0;
        }
        return &a2[v12];
      }
    }
    else
    {
      sub_20DB62E98(a1);
      uint64_t v10 = (unsigned char *)sub_20DB683C0(a1, v9, (uint64_t)a3);
      if (v10 == a3 || v10 + 1 == a3 || *v10 != 92 || v10[1] != 41) {
        sub_20DB61340();
      }
      uint64_t v7 = v10 + 2;
      sub_20DB62F1C(a1);
    }
  }
  return v7;
}

unsigned __int8 *sub_20DB68614(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  if (a2 != a3)
  {
    int v4 = *a2;
    if (v4 == 42) {
      sub_20DB67DB8();
    }
    if (a2 + 1 != a3 && v4 == 92 && a2[1] == 123)
    {
      uint64_t v6 = a2 + 2;
      int v13 = 0;
      uint64_t v7 = sub_20DB67F48(a1, a2 + 2, a3, &v13);
      if (v6 == v7) {
        goto LABEL_16;
      }
      if (v7 != a3)
      {
        BOOL v8 = v7 + 1;
        int v9 = *v7;
        if (v9 == 44)
        {
          int v12 = -1;
          uint64_t v10 = sub_20DB67F48(a1, v8, a3, &v12);
          if (v10 != a3 && v10 + 1 != a3 && *v10 == 92 && v10[1] == 125)
          {
            if (v12 != -1 && v12 < v13) {
LABEL_16:
            }
              sub_20DB67FE8();
LABEL_20:
            sub_20DB67DB8();
          }
        }
        else if (v8 != a3 && v9 == 92 && *v8 == 125)
        {
          goto LABEL_20;
        }
      }
      sub_20DB68040();
    }
  }
  return a2;
}

unsigned char *sub_20DB687B8(uint64_t a1, unsigned char *a2, unsigned char *a3)
{
  if (a2 == a3)
  {
    uint64_t result = sub_20DB688F0(a1, a2, a3);
    if (result != a2) {
      return result;
    }
    goto LABEL_12;
  }
  int v6 = *a2;
  if ((a2 + 1 != a3 || v6 != 36)
    && ((v6 - 46) > 0x2E || ((1 << (v6 - 46)) & 0x600000000001) == 0))
  {
    sub_20DB63650(a1);
  }
  uint64_t result = sub_20DB688F0(a1, a2, a3);
  if (result == a2)
  {
    if (*a2 == 46) {
      operator new();
    }
LABEL_12:
    return sub_20DB62D84(a1, a2, a3);
  }
  return result;
}

unsigned char *sub_20DB688F0(uint64_t a1, unsigned char *a2, unsigned char *a3)
{
  if (a2 != a3
    && a2 + 1 != a3
    && *a2 == 92
    && ((char)a2[1] - 36) <= 0x3A
    && ((1 << (a2[1] - 36)) & 0x580000000000441) != 0)
  {
    sub_20DB63650(a1);
  }
  return a2;
}

void *sub_20DB6896C(void *a1)
{
  *a1 = &unk_26C244DC0;
  uint64_t v2 = a1[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  return a1;
}

void sub_20DB689D8(void *a1)
{
  *a1 = &unk_26C244DC0;
  uint64_t v1 = a1[1];
  if (v1) {
    (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  }

  JUMPOUT(0x210564B70);
}

uint64_t sub_20DB68A64(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(unsigned char **)(a2 + 16);
  if (v2 == *(unsigned char **)(a2 + 24) || !*v2)
  {
    uint64_t v3 = 0;
    *(_DWORD *)a2 = -993;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    *(void *)(a2 + 16) = v2 + 1;
    uint64_t v3 = *(void *)(result + 8);
  }
  *(void *)(a2 + 80) = v3;
  return result;
}

uint64_t sub_20DB68AA4(uint64_t a1, unsigned __int8 a2)
{
  if (((a2 & 0xF8) == 0x30 || (a2 & 0xFE) == 0x38) && a2 - 49 <= 8)
  {
    if (a2 - 48 <= *(_DWORD *)(a1 + 28)) {
      sub_20DB637E8(a1);
    }
    sub_20DB63790();
  }
  return 0;
}

unsigned __int8 *sub_20DB68B04(uint64_t a1, char *a2, char *a3)
{
  int v6 = sub_20DB68B64(a1, a2, a3);
  if (v6 == (unsigned __int8 *)a2) {
    sub_20DB6840C();
  }
  do
  {
    uint64_t v7 = v6;
    int v6 = sub_20DB68B64(a1, (char *)v6, a3);
  }
  while (v7 != v6);
  return v7;
}

unsigned __int8 *sub_20DB68B64(uint64_t a1, char *a2, char *a3)
{
  int v6 = sub_20DB68CA8(a1, a2, a3);
  uint64_t v7 = (unsigned __int8 *)v6;
  if (v6 == a2 && v6 != a3)
  {
    int v8 = *a2;
    if (v8 == 36) {
      sub_20DB61180();
    }
    if (v8 != 40)
    {
      if (v8 == 94) {
        sub_20DB610FC();
      }
      return (unsigned __int8 *)a2;
    }
    sub_20DB62E98(a1);
    ++*(_DWORD *)(a1 + 36);
    int v9 = (char *)sub_20DB60068(a1, a2 + 1, a3);
    if (v9 == a3 || (uint64_t v10 = v9, *v9 != 41)) {
      sub_20DB61340();
    }
    sub_20DB62F1C(a1);
    --*(_DWORD *)(a1 + 36);
    uint64_t v7 = (unsigned __int8 *)(v10 + 1);
  }
  if (v7 == (unsigned __int8 *)a2) {
    return (unsigned __int8 *)a2;
  }

  return sub_20DB60DF0(a1, v7, (unsigned __int8 *)a3);
}

char *sub_20DB68CA8(uint64_t a1, char *a2, char *a3)
{
  uint64_t result = sub_20DB68D90(a1, a2, a3);
  if (result == a2)
  {
    uint64_t result = sub_20DB68E1C(a1, a2, a3);
    if (result == a2)
    {
      if (a2 != a3 && *a2 == 46) {
        operator new();
      }
      return sub_20DB62D84(a1, a2, a3);
    }
  }
  return result;
}

char *sub_20DB68D90(uint64_t a1, char *a2, char *a3)
{
  if (a2 != a3)
  {
    int v3 = *a2;
    uint64_t v4 = (v3 - 36);
    if (v4 > 0x3A) {
      goto LABEL_8;
    }
    if (((1 << (v3 - 36)) & 0x5800000080004D1) != 0) {
      return a2;
    }
    if (v4 == 5)
    {
      if (*(_DWORD *)(a1 + 36)) {
        return a2;
      }
    }
    else
    {
LABEL_8:
      if ((v3 - 123) < 2) {
        return a2;
      }
    }
    sub_20DB63650(a1);
  }
  return a2;
}

char *sub_20DB68E1C(uint64_t a1, char *a2, char *a3)
{
  int v3 = a2;
  if (a2 != a3)
  {
    uint64_t v4 = a2 + 1;
    if (v3 + 1 != a3 && *v3 == 92)
    {
      int v5 = *v4;
      BOOL v6 = (v5 - 36) > 0x3A || ((1 << (*v4 - 36)) & 0x5800000080004F1) == 0;
      if (!v6 || (v5 - 123) < 3) {
        sub_20DB63650(a1);
      }
      if ((*(_DWORD *)(a1 + 24) & 0x1F0) == 0x40)
      {
        return sub_20DB66288(a1, v4, a3, 0);
      }
      else
      {
        int v8 = sub_20DB68AA4(a1, *v4);
        uint64_t v9 = 2;
        if (!v8) {
          uint64_t v9 = 0;
        }
        v3 += v9;
      }
    }
  }
  return v3;
}

uint64_t sub_20DB68EE4(uint64_t a1)
{
  uint64_t v3 = a1 + 32;
  uint64_t v2 = *(void **)(a1 + 32);
  int v4 = *(_DWORD *)(v3 - 8);
  int v5 = v4 | 0x800;
  *(_DWORD *)(v3 - 8) = v4 | 0x800;
  if (*(void **)(v3 + 8) == v2) {
    BOOL v6 = (void *)(v3 + 24);
  }
  else {
    BOOL v6 = v2;
  }
  uint64_t v7 = v6[1];
  if (*v6 != v7)
  {
LABEL_5:
    *(_DWORD *)(a1 + 24) = v5 | 0x80;
    uint64_t v9 = *(void *)(a1 + 8);
    uint64_t v8 = *(void *)(a1 + 16);
    uint64_t v17 = 0;
    uint64_t v18 = 0;
    char v19 = 0;
    uint64_t v20 = 0;
    uint64_t v21 = 0;
    char v22 = 0;
    char v23 = 0;
    uint64_t v24 = 0;
    *(_OWORD *)std::string __p = 0u;
    memset(v16, 0, sizeof(v16));
    char v10 = sub_20DB69270(v8, v7, v9, (uint64_t)__p, v5 | 0x80u);
    sub_20DB6944C(v3, v7, v9, (uint64_t *)__p, (v5 & 0x800) != 0);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    if ((v10 & 1) == 0)
    {
      uint64_t v2 = *(void **)v3;
LABEL_14:
      if (v2)
      {
        *(void *)(a1 + 40) = v2;
        operator delete(v2);
        *(void *)uint64_t v3 = 0;
        *(void *)(v3 + 8) = 0;
        *(void *)(v3 + 16) = 0;
      }
      *(unsigned char *)(a1 + 128) = 0;
      *(_OWORD *)uint64_t v3 = 0u;
      *(_OWORD *)(v3 + 16) = 0u;
      *(_OWORD *)(v3 + 25) = 0u;
      *(void *)(a1 + 80) = 0;
      *(void *)(a1 + 88) = 0;
      *(unsigned char *)(a1 + 96) = 0;
      *(void *)(a1 + 104) = 0;
      *(void *)(a1 + 112) = 0;
      *(unsigned char *)(a1 + 120) = 0;
      *(void *)(a1 + 136) = 0;
      return a1;
    }
    return a1;
  }
  uint64_t v11 = *(void *)(a1 + 8);
  if (v11 == v7) {
    goto LABEL_14;
  }
  uint64_t v12 = *(void *)(a1 + 16);
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  char v19 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  char v22 = 0;
  char v23 = 0;
  uint64_t v24 = 0;
  *(_OWORD *)std::string __p = 0u;
  memset(v16, 0, sizeof(v16));
  char v13 = sub_20DB69270(v12, v7, v11, (uint64_t)__p, v4 | 0x860u);
  sub_20DB6944C(v3, v7, v11, (uint64_t *)__p, 1);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if ((v13 & 1) == 0)
  {
    ++v7;
    int v5 = *(_DWORD *)(a1 + 24);
    goto LABEL_5;
  }
  return a1;
}

void sub_20DB69088(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

BOOL sub_20DB690A8(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = a1 + 32;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(v6 + 8);
  uint64_t v9 = a2 + 32;
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(v9 + 8);
  BOOL v10 = v8 == v7 && v5 == v4;
  if (v5 != v4 && v8 != v7) {
    return *(void *)a1 == *(void *)a2
  }
        && *(void *)(a1 + 8) == *(void *)(a2 + 8)
        && *(void *)(a1 + 16) == *(void *)(a2 + 16)
        && *(_DWORD *)(a1 + 24) == *(_DWORD *)(a2 + 24)
        && sub_20DB69140(v4, v7) == 0;
  return v10;
}

uint64_t sub_20DB69140(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a1 + 16))
  {
    sub_20DB65760(&__p, *(char **)a1, *(char **)(a1 + 8), *(void *)(a1 + 8) - *(void *)a1);
  }
  else
  {
    std::string __p = 0;
    size_t v19 = 0;
    uint64_t v20 = 0;
  }
  if (*(unsigned char *)(a2 + 16))
  {
    sub_20DB65760(&v15, *(char **)a2, *(char **)(a2 + 8), *(void *)(a2 + 8) - *(void *)a2);
    unsigned int v3 = HIBYTE(v17);
    uint64_t v5 = v15;
    size_t v4 = v16;
  }
  else
  {
    size_t v4 = 0;
    uint64_t v5 = 0;
    unsigned int v3 = 0;
    long long v15 = 0;
    size_t v16 = 0;
    uint64_t v17 = 0;
  }
  char v6 = HIBYTE(v20);
  if (v20 >= 0) {
    size_t v7 = HIBYTE(v20);
  }
  else {
    size_t v7 = v19;
  }
  if (v20 >= 0) {
    p_p = &__p;
  }
  else {
    p_p = __p;
  }
  if ((v3 & 0x80u) == 0) {
    size_t v9 = v3;
  }
  else {
    size_t v9 = v4;
  }
  if ((v3 & 0x80u) == 0) {
    BOOL v10 = (void **)&v15;
  }
  else {
    BOOL v10 = v5;
  }
  if (v9 >= v7) {
    size_t v11 = v7;
  }
  else {
    size_t v11 = v9;
  }
  unsigned int v12 = memcmp(p_p, v10, v11);
  if ((v3 & 0x80) != 0)
  {
    operator delete(v5);
    if ((v20 & 0x8000000000000000) == 0) {
      goto LABEL_24;
    }
  }
  else if ((v6 & 0x80) == 0)
  {
    goto LABEL_24;
  }
  operator delete(__p);
LABEL_24:
  unsigned int v13 = v9 < v7;
  if (v7 < v9) {
    unsigned int v13 = -1;
  }
  if (v12) {
    return v12;
  }
  else {
    return v13;
  }
}

void sub_20DB69254(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_20DB69270(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  if ((a5 & 0x80) != 0) {
    int v9 = a5 & 0xFFA;
  }
  else {
    int v9 = a5;
  }
  sub_20DB61C00(a4, *(_DWORD *)(a1 + 28) + 1, a2, a3, (unsigned __int16)(v9 & 0x800) >> 11);
  if (sub_20DB695DC(a1, a2, a3, (uint64_t *)a4, v9, (v9 & 0x800) == 0))
  {
    if (*(void *)(a4 + 8) == *(void *)a4) {
      BOOL v10 = (uint64_t *)(a4 + 24);
    }
    else {
      BOOL v10 = *(uint64_t **)a4;
    }
LABEL_8:
    uint64_t v11 = *v10;
    *(void *)(a4 + 56) = *v10;
    *(unsigned char *)(a4 + 64) = *(void *)(a4 + 48) != v11;
    uint64_t v12 = v10[1];
    *(void *)(a4 + 72) = v12;
    *(unsigned char *)(a4 + 88) = v12 != *(void *)(a4 + 80);
    return 1;
  }
  if (a2 != a3 && (v9 & 0x40) == 0)
  {
    int v14 = v9 | 0x80;
    uint64_t v15 = a2 + 1;
    if (v15 != a3)
    {
      while (1)
      {
        sub_20DB620E4((char **)a4, 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a4 + 8) - *(void *)a4) >> 3), (long long *)(a4 + 24));
        int v16 = sub_20DB695DC(a1, v15, a3, (uint64_t *)a4, v14, 0);
        uint64_t v18 = *(void *)a4;
        uint64_t v17 = *(void *)(a4 + 8);
        if (v16) {
          break;
        }
        sub_20DB620E4((char **)a4, 0xAAAAAAAAAAAAAAABLL * ((v17 - v18) >> 3), (long long *)(a4 + 24));
        if (++v15 == a3) {
          goto LABEL_14;
        }
      }
      if (v17 == v18) {
        BOOL v10 = (uint64_t *)(a4 + 24);
      }
      else {
        BOOL v10 = *(uint64_t **)a4;
      }
      goto LABEL_8;
    }
LABEL_14:
    sub_20DB620E4((char **)a4, 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a4 + 8) - *(void *)a4) >> 3), (long long *)(a4 + 24));
    if (sub_20DB695DC(a1, a3, a3, (uint64_t *)a4, v14, 0))
    {
      if (*(void *)(a4 + 8) == *(void *)a4) {
        BOOL v10 = (uint64_t *)(a4 + 24);
      }
      else {
        BOOL v10 = *(uint64_t **)a4;
      }
      goto LABEL_8;
    }
  }
  uint64_t result = 0;
  *(void *)(a4 + 8) = *(void *)a4;
  return result;
}

void sub_20DB6944C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, char a5)
{
  uint64_t v10 = a4[6];
  sub_20DB6B3C8(a1, 0xAAAAAAAAAAAAAAABLL * ((a4[1] - *a4) >> 3));
  uint64_t v11 = *(void *)a1;
  if (*(void *)(a1 + 8) != *(void *)a1)
  {
    uint64_t v12 = 0;
    unint64_t v13 = 0;
    uint64_t v15 = *a4;
    uint64_t v14 = a4[1];
    do
    {
      unint64_t v16 = 0xAAAAAAAAAAAAAAABLL * ((v14 - v15) >> 3);
      uint64_t v17 = (void *)(v15 + v12);
      if (v16 <= v13) {
        uint64_t v18 = a4 + 3;
      }
      else {
        uint64_t v18 = v17;
      }
      *(void *)(v11 + v12) = a2 + *v18 - v10;
      if (0xAAAAAAAAAAAAAAABLL * ((a4[1] - *a4) >> 3) <= v13) {
        size_t v19 = a4 + 3;
      }
      else {
        size_t v19 = (uint64_t *)(*a4 + v12);
      }
      *(void *)(*(void *)a1 + v12 + 8) = a2 + v19[1] - v10;
      uint64_t v15 = *a4;
      uint64_t v14 = a4[1];
      if (0xAAAAAAAAAAAAAAABLL * ((v14 - *a4) >> 3) <= v13) {
        uint64_t v20 = a4 + 3;
      }
      else {
        uint64_t v20 = (uint64_t *)(*a4 + v12);
      }
      char v21 = *((unsigned char *)v20 + 16);
      uint64_t v11 = *(void *)a1;
      uint64_t v22 = *(void *)(a1 + 8);
      *(unsigned char *)(*(void *)a1 + v12 + 16) = v21;
      ++v13;
      v12 += 24;
    }
    while (v13 < 0xAAAAAAAAAAAAAAABLL * ((v22 - v11) >> 3));
  }
  *(void *)(a1 + 24) = a3;
  *(void *)(a1 + 32) = a3;
  *(unsigned char *)(a1 + 40) = 0;
  uint64_t v23 = a2 + a4[6] - v10;
  *(void *)(a1 + 48) = v23;
  *(void *)(a1 + 56) = a2 + a4[7] - v10;
  *(unsigned char *)(a1 + 64) = *((unsigned char *)a4 + 64);
  *(void *)(a1 + 72) = a2 + a4[9] - v10;
  *(void *)(a1 + 80) = a2 + a4[10] - v10;
  *(unsigned char *)(a1 + 88) = *((unsigned char *)a4 + 88);
  if ((a5 & 1) == 0) {
    *(void *)(a1 + 104) = v23;
  }
  *(unsigned char *)(a1 + 96) = *((unsigned char *)a4 + 96);
}

uint64_t sub_20DB695DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, int a5, char a6)
{
  if ((*(_WORD *)(a1 + 24) & 0x1F0) == 0) {
    return sub_20DB61C74(a1, a2, a3, a4, a5, a6);
  }
  if (*(_DWORD *)(a1 + 28)) {
    return sub_20DB69BAC(a1, a2, a3, a4, a5, a6);
  }
  return sub_20DB695FC(a1, a2, a3, a4, a5, a6);
}

uint64_t sub_20DB695FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, int a5, char a6)
{
  long long v62 = 0u;
  long long v63 = 0u;
  long long v61 = 0u;
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6)
  {
    *(_DWORD *)int v57 = 0;
    memset(&v57[8], 0, 32);
    long long v58 = 0uLL;
    *(_OWORD *)std::string __p = 0uLL;
    memset(v60, 0, 21);
    sub_20DB6A174(&v61, (uint64_t)v57);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    if (*(void *)&v57[32])
    {
      *(void *)&long long v58 = *(void *)&v57[32];
      operator delete(*(void **)&v57[32]);
    }
    unint64_t v52 = a4;
    uint64_t v12 = *((void *)&v61 + 1);
    unint64_t v13 = *((void *)&v63 + 1) + v63 - 1;
    unint64_t v14 = v13 / 0x2A;
    uint64_t v15 = *(void *)(*((void *)&v61 + 1) + 8 * (v13 / 0x2A));
    unint64_t v16 = 3 * (v13 % 0x2A);
    uint64_t v17 = v15 + 32 * v16;
    *(_DWORD *)uint64_t v17 = 0;
    *(void *)(v17 + 8) = a2;
    *(void *)(*(void *)(v12 + 8 * v14) + 32 * v16 + 16) = a2;
    *(void *)(*(void *)(v12 + 8 * v14) + 32 * v16 + 24) = a3;
    sub_20DB62378(*(void *)(v12 + 8 * v14) + 32 * v16 + 56, *(unsigned int *)(a1 + 32));
    char v55 = 0;
    unsigned int v18 = 0;
    uint64_t v53 = 0;
    uint64_t v54 = a2;
    uint64_t v19 = a3 - a2;
    uint64_t v20 = *((void *)&v63 + 1);
    uint64_t v21 = *((void *)&v61 + 1);
    unint64_t v22 = *((void *)&v63 + 1) + v63 - 1;
    unint64_t v23 = v22 / 0x2A;
    unint64_t v24 = 3 * (v22 % 0x2A);
    *(void *)(*(void *)(*((void *)&v61 + 1) + 8 * v23) + 32 * v24 + 80) = v6;
    uint64_t v25 = *(void *)(v21 + 8 * v23) + 32 * v24;
    *(_DWORD *)(v25 + 88) = a5;
    *(unsigned char *)(v25 + 92) = a6;
    while (2)
    {
      if ((++v18 & 0xFFF) == 0 && (int)(v18 >> 12) >= (int)v19) {
        sub_20DB623A8();
      }
      unint64_t v27 = v20 + v63 - 1;
      uint64_t v28 = *(void *)(*((void *)&v61 + 1) + 8 * (v27 / 0x2A));
      unint64_t v29 = v27 % 0x2A;
      uint64_t v30 = v28 + 96 * (v27 % 0x2A);
      char v32 = (void *)(v30 + 80);
      uint64_t v31 = *(void *)(v30 + 80);
      if (v31) {
        (*(void (**)(uint64_t, unint64_t))(*(void *)v31 + 16))(v31, v28 + 96 * v29);
      }
      switch(*(_DWORD *)v30)
      {
        case 0xFFFFFC18:
          uint64_t v33 = *(void *)(v28 + 96 * v29 + 16);
          BOOL v35 = (a5 & 0x1000) == 0 || v33 == a3;
          BOOL v36 = v33 != v54 || (a5 & 0x20) == 0;
          if (!v36 || !v35) {
            goto LABEL_37;
          }
          uint64_t v37 = v33 - *(void *)(v28 + 96 * v29 + 8);
          uint64_t v38 = v53;
          if ((v55 & (v53 >= v37)) == 0) {
            uint64_t v38 = v37;
          }
          if (v38 != v19)
          {
            uint64_t v53 = v38;
            sub_20DB6A278(&v61);
            char v55 = 1;
            goto LABEL_38;
          }
          __int16 v39 = (void **)*((void *)&v61 + 1);
          uint64_t v40 = v62;
          if ((void)v62 == *((void *)&v61 + 1))
          {
            uint64_t v40 = *((void *)&v61 + 1);
          }
          else
          {
            __int16 v41 = (void *)(*((void *)&v61 + 1) + 8 * ((unint64_t)v63 / 0x2A));
            int v42 = (void *)(*v41 + 96 * ((unint64_t)v63 % 0x2A));
            unint64_t v43 = *(void *)(*((void *)&v61 + 1) + 8 * ((*((void *)&v63 + 1) + (void)v63) / 0x2AuLL))
                + 96 * ((*((void *)&v63 + 1) + (void)v63) % 0x2AuLL);
            if (v42 != (void *)v43)
            {
              do
              {
                sub_20DB627D8((uint64_t)&v63 + 8, v42);
                v42 += 12;
                if ((void *)((char *)v42 - *v41) == (void *)4032)
                {
                  int v44 = (void *)v41[1];
                  ++v41;
                  int v42 = v44;
                }
              }
              while (v42 != (void *)v43);
              __int16 v39 = (void **)*((void *)&v61 + 1);
              uint64_t v40 = v62;
            }
          }
          *((void *)&v63 + 1) = 0;
          unint64_t v47 = v40 - (void)v39;
          if (v47 >= 0x11)
          {
            do
            {
              operator delete(*v39);
              __int16 v39 = (void **)(*((void *)&v61 + 1) + 8);
              *((void *)&v61 + 1) = v39;
              unint64_t v47 = v62 - (void)v39;
            }
            while ((void)v62 - (void)v39 > 0x10uLL);
          }
          if (v47 >> 3 == 1)
          {
            uint64_t v48 = 21;
          }
          else
          {
            if (v47 >> 3 != 2) {
              goto LABEL_53;
            }
            uint64_t v48 = 42;
          }
          *(void *)&long long v63 = v48;
LABEL_53:
          char v55 = 1;
          uint64_t v53 = v19;
LABEL_38:
          uint64_t v20 = *((void *)&v63 + 1);
          if (*((void *)&v63 + 1)) {
            continue;
          }
          if ((v55 & 1) == 0) {
            goto LABEL_56;
          }
          uint64_t v49 = *v52;
          *(void *)uint64_t v49 = v54;
          *(void *)(v49 + 8) = v54 + v53;
          uint64_t v50 = 1;
          *(unsigned char *)(v49 + 16) = 1;
          break;
        case 0xFFFFFC19:
        case 0xFFFFFC1E:
        case 0xFFFFFC21:
          goto LABEL_38;
        case 0xFFFFFC1D:
          sub_20DB6A30C((uint64_t)&v61, v28 + 96 * v29);
          goto LABEL_37;
        case 0xFFFFFC1F:
LABEL_37:
          sub_20DB6A278(&v61);
          goto LABEL_38;
        case 0xFFFFFC20:
          long long v45 = *(_OWORD *)(v30 + 16);
          *(_OWORD *)int v57 = *(_OWORD *)v30;
          *(_OWORD *)&v57[16] = v45;
          long long v58 = 0uLL;
          *(void *)&v57[32] = 0;
          sub_20DB62B54(&v57[32], *(long long **)(v28 + 96 * v29 + 32), *(long long **)(v28 + 96 * v29 + 40), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(v28 + 96 * v29 + 40) - *(void *)(v28 + 96 * v29 + 32)) >> 3));
          __p[0] = 0;
          __p[1] = 0;
          v60[0] = 0;
          sub_20DB62BD4((char *)__p, *(long long **)(v28 + 96 * v29 + 56), *(long long **)(v28 + 96 * v29 + 64), (uint64_t)(*(void *)(v28 + 96 * v29 + 64) - *(void *)(v28 + 96 * v29 + 56)) >> 4);
          uint64_t v46 = *v32;
          *(void *)((char *)&v60[1] + 5) = *(void *)(v30 + 85);
          v60[1] = v46;
          (*(void (**)(void, uint64_t, unint64_t))(*(void *)*v32 + 24))(*v32, 1, v28 + 96 * v29);
          (*(void (**)(void, void, unsigned char *))(*(void *)v60[1] + 24))(v60[1], 0, v57);
          sub_20DB6A174(&v61, (uint64_t)v57);
          if (__p[0])
          {
            __p[1] = __p[0];
            operator delete(__p[0]);
          }
          if (*(void *)&v57[32])
          {
            *(void *)&long long v58 = *(void *)&v57[32];
            operator delete(*(void **)&v57[32]);
          }
          goto LABEL_38;
        default:
          sub_20DB62400();
      }
      break;
    }
  }
  else
  {
LABEL_56:
    uint64_t v50 = 0;
  }
  sub_20DB6AF18(&v61);
  return v50;
}

void sub_20DB69B34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,void *__p,uint64_t a22)
{
  sub_20DB6AF18((void *)(v22 - 144));
  _Unwind_Resume(a1);
}

uint64_t sub_20DB69BAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, int a5, char a6)
{
  char v55 = 0;
  BOOL v56 = 0;
  v57[0] = 0;
  *(_DWORD *)unint64_t v52 = 0;
  memset(&v52[8], 0, 32);
  long long v53 = 0u;
  memset(v54, 0, 37);
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6)
  {
    *(void *)&long long v50 = a3;
    *((void *)&v50 + 1) = a3;
    char v51 = 0;
    *(_DWORD *)unint64_t v47 = 0;
    memset(&v47[8], 0, 48);
    *(_OWORD *)std::string __p = 0uLL;
    memset(v49, 0, 21);
    BOOL v56 = (_OWORD *)sub_20DB62458((uint64_t *)&v55, (uint64_t)v47);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    if (*(void *)&v47[32])
    {
      *(void *)&v47[40] = *(void *)&v47[32];
      operator delete(*(void **)&v47[32]);
    }
    int v42 = a4;
    uint64_t v11 = v56;
    *((_DWORD *)v56 - 24) = 0;
    *((void *)v11 - 11) = a2;
    *((void *)v11 - 10) = a2;
    *((void *)v11 - 9) = a3;
    sub_20DB6233C((uint64_t)(v11 - 4), *(unsigned int *)(a1 + 28), &v50);
    sub_20DB62378((uint64_t)v56 - 40, *(unsigned int *)(a1 + 32));
    uint64_t v43 = a3;
    uint64_t v44 = 0;
    char v12 = 0;
    unsigned int v13 = 0;
    uint64_t v14 = a3 - a2;
    uint64_t v15 = v56;
    *((void *)v56 - 2) = v6;
    *((_DWORD *)v15 - 2) = a5;
    *((unsigned char *)v15 - 4) = a6;
    do
    {
      BOOL v16 = (++v13 & 0xFFF) != 0 || (int)(v13 >> 12) < (int)v14;
      if (!v16) {
        sub_20DB623A8();
      }
      unsigned int v18 = v15 - 1;
      uint64_t v17 = *((void *)v15 - 2);
      uint64_t v19 = v15 - 6;
      if (v17) {
        (*(void (**)(uint64_t, _OWORD *))(*(void *)v17 + 16))(v17, v15 - 6);
      }
      switch(*(_DWORD *)v19)
      {
        case 0xFFFFFC18:
          uint64_t v20 = *((void *)v15 - 10);
          if ((a5 & 0x20) != 0 && v20 == a2 || (a5 & 0x1000) != 0 && v20 != v43) {
            goto LABEL_19;
          }
          char v27 = v12;
          uint64_t v28 = v20 - *((void *)v15 - 11);
          uint64_t v29 = v44;
          if ((v27 & (v44 >= v28)) == 0)
          {
            long long v30 = *(v15 - 5);
            *(_OWORD *)unint64_t v52 = *(_OWORD *)v19;
            *(_OWORD *)&v52[16] = v30;
            if (v52 != v19)
            {
              sub_20DB6B0C0(&v52[32], *((long long **)v15 - 8), *((long long **)v15 - 7), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)v15 - 7) - *((void *)v15 - 8)) >> 3));
              sub_20DB6B278(v54, *((uint64_t **)v15 - 5), *((uint64_t **)v15 - 4), (uint64_t)(*((void *)v15 - 4) - *((void *)v15 - 5)) >> 4);
            }
            uint64_t v31 = (void *)*v18;
            *(void **)((char *)&v54[3] + 5) = *(void **)((char *)v15 - 11);
            v54[3] = v31;
            uint64_t v29 = v28;
          }
          char v32 = v56;
          if (v29 == v14)
          {
            uint64_t v33 = (uint64_t)v55;
            while (v32 != (void *)v33)
            {
              v32 -= 12;
              sub_20DB627D8((uint64_t)v57, v32);
            }
            BOOL v56 = (_OWORD *)v33;
            char v12 = 1;
            uint64_t v44 = v14;
          }
          else
          {
            uint64_t v44 = v29;
            unint64_t v34 = v56 - 6;
            sub_20DB627D8((uint64_t)v57, (void *)v56 - 12);
            BOOL v56 = v34;
            char v12 = 1;
          }
          break;
        case 0xFFFFFC1D:
        case 0xFFFFFC1E:
        case 0xFFFFFC21:
          break;
        case 0xFFFFFC1F:
LABEL_19:
          uint64_t v21 = v56 - 6;
          sub_20DB627D8((uint64_t)v57, (void *)v56 - 12);
          BOOL v56 = v21;
          break;
        case 0xFFFFFC20:
          long long v22 = *(v15 - 5);
          *(_OWORD *)unint64_t v47 = *(_OWORD *)v19;
          *(_OWORD *)&v47[16] = v22;
          memset(&v47[32], 0, 24);
          sub_20DB62B54(&v47[32], *((long long **)v15 - 8), *((long long **)v15 - 7), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)v15 - 7) - *((void *)v15 - 8)) >> 3));
          __p[0] = 0;
          __p[1] = 0;
          v49[0] = 0;
          sub_20DB62BD4((char *)__p, *((long long **)v15 - 5), *((long long **)v15 - 4), (uint64_t)(*((void *)v15 - 4) - *((void *)v15 - 5)) >> 4);
          unint64_t v23 = (void *)*v18;
          *(void *)((char *)&v49[1] + 5) = *(void *)((char *)v15 - 11);
          v49[1] = v23;
          (*(void (**)(void, uint64_t, _OWORD *))(*(void *)*v18 + 24))(*v18, 1, v15 - 6);
          (*(void (**)(void, void, unsigned char *))(*(void *)v49[1] + 24))(v49[1], 0, v47);
          unint64_t v24 = v56;
          if ((unint64_t)v56 >= v57[0])
          {
            BOOL v56 = (_OWORD *)sub_20DB62458((uint64_t *)&v55, (uint64_t)v47);
            if (__p[0])
            {
              __p[1] = __p[0];
              operator delete(__p[0]);
            }
          }
          else
          {
            long long v25 = *(_OWORD *)&v47[16];
            *BOOL v56 = *(_OWORD *)v47;
            v24[1] = v25;
            *((void *)v24 + 4) = 0;
            *((void *)v24 + 5) = 0;
            *((void *)v24 + 6) = 0;
            *((void *)v24 + 7) = 0;
            v24[2] = *(_OWORD *)&v47[32];
            *((void *)v24 + 6) = *(void *)&v47[48];
            memset(&v47[32], 0, 24);
            *((void *)v24 + 8) = 0;
            *((void *)v24 + 9) = 0;
            *(_OWORD *)((char *)v24 + 56) = *(_OWORD *)__p;
            *((void *)v24 + 9) = v49[0];
            __p[0] = 0;
            __p[1] = 0;
            v49[0] = 0;
            uint64_t v26 = v49[1];
            *(void *)((char *)v24 + 85) = *(void *)((char *)&v49[1] + 5);
            *((void *)v24 + 10) = v26;
            BOOL v56 = v24 + 6;
          }
          if (*(void *)&v47[32])
          {
            *(void *)&v47[40] = *(void *)&v47[32];
            operator delete(*(void **)&v47[32]);
          }
          break;
        default:
          sub_20DB62400();
      }
      uint64_t v15 = v56;
    }
    while (v55 != v56);
    if (v12)
    {
      uint64_t v35 = *v42;
      *(void *)uint64_t v35 = a2;
      *(void *)(v35 + 8) = a2 + v44;
      *(unsigned char *)(v35 + 16) = 1;
      if ((void)v53 != *(void *)&v52[32])
      {
        unint64_t v36 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v53 - *(void *)&v52[32]) >> 3);
        uint64_t v37 = (unsigned char *)(*(void *)&v52[32] + 16);
        unsigned int v38 = 1;
        do
        {
          uint64_t v39 = v35 + 24 * v38;
          *(_OWORD *)uint64_t v39 = *((_OWORD *)v37 - 1);
          char v40 = *v37;
          v37 += 24;
          *(unsigned char *)(v39 + 16) = v40;
          BOOL v16 = v36 > v38++;
        }
        while (v16);
      }
      uint64_t v6 = 1;
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  if (v54[0])
  {
    v54[1] = v54[0];
    operator delete(v54[0]);
  }
  if (*(void *)&v52[32])
  {
    *(void *)&long long v53 = *(void *)&v52[32];
    operator delete(*(void **)&v52[32]);
  }
  *(void *)unint64_t v52 = &v55;
  sub_20DB62C48((void ***)v52);
  return v6;
}

void sub_20DB6A0EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *__p,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33)
{
  sub_20DB622F8(&a17);
  sub_20DB622F8(&a33);
  a33 = v33 - 120;
  sub_20DB62C48((void ***)&a33);
  _Unwind_Resume(a1);
}

__n128 sub_20DB6A174(void *a1, uint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t v5 = a1[1];
  uint64_t v6 = 42 * ((v4 - v5) >> 3) - 1;
  if (v4 == v5) {
    uint64_t v6 = 0;
  }
  unint64_t v7 = a1[5] + a1[4];
  if (v6 == v7)
  {
    sub_20DB6A400(a1);
    uint64_t v5 = a1[1];
    unint64_t v7 = a1[5] + a1[4];
  }
  unint64_t v8 = *(void *)(v5 + 8 * (v7 / 0x2A)) + 96 * (v7 % 0x2A);
  long long v9 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)unint64_t v8 = *(_OWORD *)a2;
  *(_OWORD *)(v8 + 16) = v9;
  *(void *)(v8 + 40) = 0;
  *(void *)(v8 + 48) = 0;
  *(void *)(v8 + 32) = 0;
  *(_OWORD *)(v8 + 32) = *(_OWORD *)(a2 + 32);
  *(void *)(v8 + 48) = *(void *)(a2 + 48);
  *(void *)(a2 + 32) = 0;
  *(void *)(a2 + 40) = 0;
  *(void *)(a2 + 48) = 0;
  *(void *)(v8 + 56) = 0;
  *(void *)(v8 + 64) = 0;
  *(void *)(v8 + 72) = 0;
  __n128 result = *(__n128 *)(a2 + 56);
  *(__n128 *)(v8 + 56) = result;
  *(void *)(v8 + 72) = *(void *)(a2 + 72);
  *(void *)(a2 + 56) = 0;
  *(void *)(a2 + 64) = 0;
  *(void *)(a2 + 72) = 0;
  uint64_t v11 = *(void *)(a2 + 80);
  *(void *)(v8 + 85) = *(void *)(a2 + 85);
  *(void *)(v8 + 80) = v11;
  ++a1[5];
  return result;
}

uint64_t sub_20DB6A278(void *a1)
{
  uint64_t v2 = a1 + 5;
  unint64_t v3 = a1[5] + a1[4] - 1;
  sub_20DB627D8((uint64_t)(a1 + 5), (void *)(*(void *)(a1[1] + 8 * (v3 / 0x2A)) + 96 * (v3 % 0x2A)));
  --*v2;

  return sub_20DB6AB84(a1, 1);
}

int64x2_t sub_20DB6A30C(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = *(void *)(a1 + 32);
  if (!v4)
  {
    sub_20DB6ABFC((void **)a1);
    unint64_t v4 = *(void *)(a1 + 32);
  }
  uint64_t v5 = *(void *)(a1 + 8);
  uint64_t v6 = (void *)(v5 + 8 * (v4 / 0x2A));
  uint64_t v7 = *v6 + 96 * (v4 % 0x2A);
  if (*(void *)(a1 + 16) == v5) {
    uint64_t v7 = 0;
  }
  if (v7 == *v6) {
    uint64_t v7 = *(v6 - 1) + 4032;
  }
  long long v8 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v7 - 96) = *(_OWORD *)a2;
  *(_OWORD *)(v7 - 80) = v8;
  *(void *)(v7 - 56) = 0;
  *(void *)(v7 - 48) = 0;
  *(void *)(v7 - 64) = 0;
  *(_OWORD *)(v7 - 64) = *(_OWORD *)(a2 + 32);
  *(void *)(v7 - 48) = *(void *)(a2 + 48);
  *(void *)(a2 + 32) = 0;
  *(void *)(a2 + 40) = 0;
  *(void *)(a2 + 48) = 0;
  *(void *)(v7 - 40) = 0;
  *(void *)(v7 - 32) = 0;
  *(void *)(v7 - 24) = 0;
  *(_OWORD *)(v7 - 40) = *(_OWORD *)(a2 + 56);
  *(void *)(v7 - 24) = *(void *)(a2 + 72);
  *(void *)(a2 + 56) = 0;
  *(void *)(a2 + 64) = 0;
  *(void *)(a2 + 72) = 0;
  uint64_t v9 = *(void *)(a2 + 80);
  *(void *)(v7 - 11) = *(void *)(a2 + 85);
  *(void *)(v7 - 16) = v9;
  int64x2_t result = vaddq_s64(*(int64x2_t *)(a1 + 32), (int64x2_t)xmmword_20DB7E610);
  *(int64x2_t *)(a1 + 32) = result;
  return result;
}

void sub_20DB6A400(void *a1)
{
  unint64_t v2 = a1[4];
  BOOL v3 = v2 >= 0x2A;
  unint64_t v4 = v2 - 42;
  if (v3)
  {
    uint64_t v5 = (uint64_t)(a1 + 3);
    uint64_t v6 = (char *)a1[3];
    a1[4] = v4;
    uint64_t v7 = (void *)a1[1];
    long long v8 = (char *)a1[2];
    uint64_t v11 = *v7;
    uint64_t v9 = (char *)(v7 + 1);
    uint64_t v10 = v11;
    a1[1] = v9;
    if (v8 != v6)
    {
LABEL_33:
      *(void *)long long v8 = v10;
      a1[2] += 8;
      return;
    }
    uint64_t v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1) {
        unint64_t v33 = 1;
      }
      else {
        unint64_t v33 = (uint64_t)&v8[-*a1] >> 2;
      }
      unint64_t v34 = (char *)sub_20DB5E180(v5, v33);
      uint64_t v35 = &v34[8 * (v33 >> 2)];
      uint64_t v37 = &v34[8 * v36];
      unsigned int v38 = (uint64_t *)a1[1];
      long long v8 = v35;
      uint64_t v39 = a1[2] - (void)v38;
      if (v39)
      {
        long long v8 = &v35[v39 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v40 = 8 * (v39 >> 3);
        __int16 v41 = &v34[8 * (v33 >> 2)];
        do
        {
          uint64_t v42 = *v38++;
          *(void *)__int16 v41 = v42;
          v41 += 8;
          v40 -= 8;
        }
        while (v40);
      }
      goto LABEL_30;
    }
LABEL_5:
    uint64_t v13 = v12 >> 3;
    BOOL v14 = v12 >> 3 < -1;
    uint64_t v15 = (v12 >> 3) + 2;
    if (v14) {
      uint64_t v16 = v15;
    }
    else {
      uint64_t v16 = v13 + 1;
    }
    uint64_t v17 = -(v16 >> 1);
    uint64_t v18 = v16 >> 1;
    uint64_t v19 = &v9[-8 * v18];
    int64_t v20 = v8 - v9;
    if (v8 != v9)
    {
      memmove(&v9[-8 * v18], v9, v8 - v9);
      uint64_t v9 = (char *)a1[1];
    }
    long long v8 = &v19[v20];
    a1[1] = &v9[8 * v17];
    a1[2] = &v19[v20];
    goto LABEL_33;
  }
  uint64_t v21 = a1[2];
  unint64_t v22 = (v21 - a1[1]) >> 3;
  uint64_t v23 = a1[3];
  uint64_t v24 = v23 - *a1;
  if (v22 < v24 >> 3)
  {
    if (v23 != v21)
    {
      *(void *)&long long v54 = operator new(0xFC0uLL);
      sub_20DB6A718(a1, &v54);
      return;
    }
    *(void *)&long long v54 = operator new(0xFC0uLL);
    sub_20DB6A830((uint64_t)a1, &v54);
    uint64_t v44 = (void *)a1[1];
    long long v8 = (char *)a1[2];
    uint64_t v45 = *v44;
    uint64_t v9 = (char *)(v44 + 1);
    uint64_t v10 = v45;
    a1[1] = v9;
    if (v8 != (char *)a1[3]) {
      goto LABEL_33;
    }
    uint64_t v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1) {
        unint64_t v46 = 1;
      }
      else {
        unint64_t v46 = (uint64_t)&v8[-*a1] >> 2;
      }
      unint64_t v34 = (char *)sub_20DB5E180((uint64_t)(a1 + 3), v46);
      uint64_t v35 = &v34[8 * (v46 >> 2)];
      uint64_t v37 = &v34[8 * v47];
      uint64_t v48 = (uint64_t *)a1[1];
      long long v8 = v35;
      uint64_t v49 = a1[2] - (void)v48;
      if (v49)
      {
        long long v8 = &v35[v49 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v50 = 8 * (v49 >> 3);
        char v51 = &v34[8 * (v46 >> 2)];
        do
        {
          uint64_t v52 = *v48++;
          *(void *)char v51 = v52;
          v51 += 8;
          v50 -= 8;
        }
        while (v50);
      }
LABEL_30:
      uint64_t v43 = (char *)*a1;
      *a1 = v34;
      a1[1] = v35;
      a1[2] = v8;
      a1[3] = v37;
      if (v43)
      {
        operator delete(v43);
        long long v8 = (char *)a1[2];
      }
      goto LABEL_33;
    }
    goto LABEL_5;
  }
  if (v23 == *a1) {
    unint64_t v25 = 1;
  }
  else {
    unint64_t v25 = v24 >> 2;
  }
  BOOL v56 = a1 + 3;
  *(void *)&long long v54 = sub_20DB5E180((uint64_t)(a1 + 3), v25);
  *((void *)&v54 + 1) = v54 + 8 * v22;
  *(void *)&long long v55 = *((void *)&v54 + 1);
  *((void *)&v55 + 1) = v54 + 8 * v26;
  long long v53 = operator new(0xFC0uLL);
  sub_20DB6A950(&v54, &v53);
  char v27 = (void *)a1[2];
  uint64_t v28 = -7 - (void)v27;
  while (v27 != (void *)a1[1])
  {
    --v27;
    v28 += 8;
    sub_20DB6AA68((uint64_t)&v54, v27);
  }
  uint64_t v29 = (char *)*a1;
  long long v30 = v54;
  long long v31 = v55;
  *(void *)&long long v54 = *a1;
  *((void *)&v54 + 1) = v27;
  long long v32 = *((_OWORD *)a1 + 1);
  *(_OWORD *)a1 = v30;
  *((_OWORD *)a1 + 1) = v31;
  long long v55 = v32;
  if (v27 != (void *)v32) {
    *(void *)&long long v55 = v32 + (-(v32 + v28) & 0xFFFFFFFFFFFFFFF8);
  }
  if (v29) {
    operator delete(v29);
  }
}

void sub_20DB6A6CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13)
{
  operator delete(v13);
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void sub_20DB6A718(void *a1, void *a2)
{
  uint64_t v5 = (char *)a1[3];
  uint64_t v4 = (uint64_t)(a1 + 3);
  uint64_t v6 = *(char **)(v4 - 8);
  if (v6 == v5)
  {
    uint64_t v7 = (char *)a1[1];
    uint64_t v8 = (uint64_t)&v7[-*a1];
    if ((unint64_t)v7 <= *a1)
    {
      if (v6 == (char *)*a1) {
        unint64_t v18 = 1;
      }
      else {
        unint64_t v18 = (uint64_t)&v6[-*a1] >> 2;
      }
      uint64_t v19 = (char *)sub_20DB5E180(v4, v18);
      uint64_t v21 = &v19[8 * (v18 >> 2)];
      unint64_t v22 = (uint64_t *)a1[1];
      uint64_t v6 = v21;
      uint64_t v23 = a1[2] - (void)v22;
      if (v23)
      {
        uint64_t v6 = &v21[v23 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v24 = 8 * (v23 >> 3);
        unint64_t v25 = &v19[8 * (v18 >> 2)];
        do
        {
          uint64_t v26 = *v22++;
          *(void *)unint64_t v25 = v26;
          v25 += 8;
          v24 -= 8;
        }
        while (v24);
      }
      char v27 = (char *)*a1;
      *a1 = v19;
      a1[1] = v21;
      a1[2] = v6;
      a1[3] = &v19[8 * v20];
      if (v27)
      {
        operator delete(v27);
        uint64_t v6 = (char *)a1[2];
      }
    }
    else
    {
      uint64_t v9 = v8 >> 3;
      BOOL v10 = v8 >> 3 < -1;
      uint64_t v11 = (v8 >> 3) + 2;
      if (v10) {
        uint64_t v12 = v11;
      }
      else {
        uint64_t v12 = v9 + 1;
      }
      uint64_t v13 = -(v12 >> 1);
      uint64_t v14 = v12 >> 1;
      uint64_t v15 = &v7[-8 * v14];
      int64_t v16 = v6 - v7;
      if (v6 != v7)
      {
        memmove(&v7[-8 * v14], v7, v6 - v7);
        uint64_t v6 = (char *)a1[1];
      }
      uint64_t v17 = &v6[8 * v13];
      uint64_t v6 = &v15[v16];
      a1[1] = v17;
      a1[2] = &v15[v16];
    }
  }
  *(void *)uint64_t v6 = *a2;
  a1[2] += 8;
}

void sub_20DB6A830(uint64_t a1, void *a2)
{
  uint64_t v4 = *(char **)(a1 + 8);
  if (v4 == *(char **)a1)
  {
    uint64_t v6 = a1 + 24;
    uint64_t v7 = *(unsigned char **)(a1 + 24);
    uint64_t v8 = *(unsigned char **)(a1 + 16);
    if (v8 >= v7)
    {
      if (v7 == v4) {
        unint64_t v12 = 1;
      }
      else {
        unint64_t v12 = (v7 - v4) >> 2;
      }
      uint64_t v13 = 2 * v12;
      uint64_t v14 = (char *)sub_20DB5E180(v6, v12);
      uint64_t v5 = &v14[(v13 + 6) & 0xFFFFFFFFFFFFFFF8];
      int64_t v16 = *(uint64_t **)(a1 + 8);
      uint64_t v17 = v5;
      uint64_t v18 = *(void *)(a1 + 16) - (void)v16;
      if (v18)
      {
        uint64_t v17 = &v5[v18 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v19 = 8 * (v18 >> 3);
        uint64_t v20 = v5;
        do
        {
          uint64_t v21 = *v16++;
          *(void *)uint64_t v20 = v21;
          v20 += 8;
          v19 -= 8;
        }
        while (v19);
      }
      unint64_t v22 = *(char **)a1;
      *(void *)a1 = v14;
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = v17;
      *(void *)(a1 + 24) = &v14[8 * v15];
      if (v22)
      {
        operator delete(v22);
        uint64_t v5 = *(char **)(a1 + 8);
      }
    }
    else
    {
      uint64_t v9 = (v7 - v8) >> 3;
      if (v9 >= -1) {
        uint64_t v10 = v9 + 1;
      }
      else {
        uint64_t v10 = v9 + 2;
      }
      uint64_t v11 = v10 >> 1;
      uint64_t v5 = &v4[8 * (v10 >> 1)];
      if (v8 != v4)
      {
        memmove(&v4[8 * (v10 >> 1)], v4, v8 - v4);
        uint64_t v4 = *(char **)(a1 + 16);
      }
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = &v4[8 * v11];
    }
  }
  else
  {
    uint64_t v5 = *(char **)(a1 + 8);
  }
  *((void *)v5 - 1) = *a2;
  *(void *)(a1 + 8) -= 8;
}

void sub_20DB6A950(void *a1, void *a2)
{
  uint64_t v4 = (char *)a1[2];
  if (v4 == (char *)a1[3])
  {
    uint64_t v5 = (char *)a1[1];
    uint64_t v6 = (uint64_t)&v5[-*a1];
    if ((unint64_t)v5 <= *a1)
    {
      if (v4 == (char *)*a1) {
        unint64_t v16 = 1;
      }
      else {
        unint64_t v16 = (uint64_t)&v4[-*a1] >> 2;
      }
      uint64_t v17 = (char *)sub_20DB5E180(a1[4], v16);
      uint64_t v19 = &v17[8 * (v16 >> 2)];
      uint64_t v20 = (uint64_t *)a1[1];
      uint64_t v4 = v19;
      uint64_t v21 = a1[2] - (void)v20;
      if (v21)
      {
        uint64_t v4 = &v19[v21 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v22 = 8 * (v21 >> 3);
        uint64_t v23 = &v17[8 * (v16 >> 2)];
        do
        {
          uint64_t v24 = *v20++;
          *(void *)uint64_t v23 = v24;
          v23 += 8;
          v22 -= 8;
        }
        while (v22);
      }
      unint64_t v25 = (char *)*a1;
      *a1 = v17;
      a1[1] = v19;
      a1[2] = v4;
      a1[3] = &v17[8 * v18];
      if (v25)
      {
        operator delete(v25);
        uint64_t v4 = (char *)a1[2];
      }
    }
    else
    {
      uint64_t v7 = v6 >> 3;
      BOOL v8 = v6 >> 3 < -1;
      uint64_t v9 = (v6 >> 3) + 2;
      if (v8) {
        uint64_t v10 = v9;
      }
      else {
        uint64_t v10 = v7 + 1;
      }
      uint64_t v11 = -(v10 >> 1);
      uint64_t v12 = v10 >> 1;
      uint64_t v13 = &v5[-8 * v12];
      int64_t v14 = v4 - v5;
      if (v4 != v5)
      {
        memmove(&v5[-8 * v12], v5, v4 - v5);
        uint64_t v4 = (char *)a1[1];
      }
      uint64_t v15 = &v4[8 * v11];
      uint64_t v4 = &v13[v14];
      a1[1] = v15;
      a1[2] = &v13[v14];
    }
  }
  *(void *)uint64_t v4 = *a2;
  a1[2] += 8;
}

void sub_20DB6AA68(uint64_t a1, void *a2)
{
  uint64_t v4 = *(char **)(a1 + 8);
  if (v4 == *(char **)a1)
  {
    uint64_t v6 = *(unsigned char **)(a1 + 16);
    uint64_t v7 = *(unsigned char **)(a1 + 24);
    if (v6 >= v7)
    {
      if (v7 == v4) {
        unint64_t v11 = 1;
      }
      else {
        unint64_t v11 = (v7 - v4) >> 2;
      }
      uint64_t v12 = 2 * v11;
      uint64_t v13 = (char *)sub_20DB5E180(*(void *)(a1 + 32), v11);
      uint64_t v5 = &v13[(v12 + 6) & 0xFFFFFFFFFFFFFFF8];
      uint64_t v15 = *(uint64_t **)(a1 + 8);
      unint64_t v16 = v5;
      uint64_t v17 = *(void *)(a1 + 16) - (void)v15;
      if (v17)
      {
        unint64_t v16 = &v5[v17 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v18 = 8 * (v17 >> 3);
        uint64_t v19 = v5;
        do
        {
          uint64_t v20 = *v15++;
          *(void *)uint64_t v19 = v20;
          v19 += 8;
          v18 -= 8;
        }
        while (v18);
      }
      uint64_t v21 = *(char **)a1;
      *(void *)a1 = v13;
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = v16;
      *(void *)(a1 + 24) = &v13[8 * v14];
      if (v21)
      {
        operator delete(v21);
        uint64_t v5 = *(char **)(a1 + 8);
      }
    }
    else
    {
      uint64_t v8 = (v7 - v6) >> 3;
      if (v8 >= -1) {
        uint64_t v9 = v8 + 1;
      }
      else {
        uint64_t v9 = v8 + 2;
      }
      uint64_t v10 = v9 >> 1;
      uint64_t v5 = &v4[8 * (v9 >> 1)];
      if (v6 != v4)
      {
        memmove(&v4[8 * (v9 >> 1)], v4, v6 - v4);
        uint64_t v4 = *(char **)(a1 + 16);
      }
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = &v4[8 * v10];
    }
  }
  else
  {
    uint64_t v5 = *(char **)(a1 + 8);
  }
  *((void *)v5 - 1) = *a2;
  *(void *)(a1 + 8) -= 8;
}

uint64_t sub_20DB6AB84(void *a1, int a2)
{
  uint64_t v3 = a1[1];
  uint64_t v2 = a1[2];
  if (v2 == v3) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = 42 * ((v2 - v3) >> 3) - 1;
  }
  unint64_t v5 = v4 - (a1[5] + a1[4]);
  if (v5 < 0x2A) {
    a2 = 1;
  }
  if (v5 < 0x54) {
    int v7 = a2;
  }
  else {
    int v7 = 0;
  }
  if ((v7 & 1) == 0)
  {
    operator delete(*(void **)(v2 - 8));
    a1[2] -= 8;
  }
  return v7 ^ 1u;
}

void sub_20DB6ABFC(void **a1)
{
  uint64_t v2 = a1[1];
  uint64_t v3 = a1[2];
  unint64_t v4 = (v3 - v2) >> 3;
  if (v3 == v2) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = 42 * v4 - 1;
  }
  uint64_t v6 = (char *)a1[4];
  if (v5 - (unint64_t)&v6[(void)a1[5]] < 0x2A)
  {
    uint64_t v7 = (uint64_t)(a1 + 3);
    uint64_t v8 = a1[3];
    uint64_t v9 = *a1;
    uint64_t v10 = v8 - (unsigned char *)*a1;
    if (v4 >= v10 >> 3)
    {
      if (v8 == v9) {
        unint64_t v11 = 1;
      }
      else {
        unint64_t v11 = v10 >> 2;
      }
      unint64_t v46 = a1 + 3;
      std::string __p = sub_20DB5E180(v7, v11);
      uint64_t v43 = (char *)__p;
      uint64_t v44 = (char *)__p;
      uint64_t v45 = (char *)__p + 8 * v12;
      __int16 v41 = operator new(0xFC0uLL);
      sub_20DB6A950(&__p, &v41);
      uint64_t v13 = (char *)a1[1];
      uint64_t v14 = v44;
      if (v13 == a1[2])
      {
        unint64_t v33 = (char *)a1[1];
      }
      else
      {
        do
        {
          if (v14 == v45)
          {
            int64_t v15 = v43 - (unsigned char *)__p;
            if (v43 <= __p)
            {
              if (v14 == __p) {
                unint64_t v23 = 1;
              }
              else {
                unint64_t v23 = (v14 - (unsigned char *)__p) >> 2;
              }
              uint64_t v24 = (char *)sub_20DB5E180((uint64_t)v46, v23);
              uint64_t v26 = v43;
              uint64_t v14 = &v24[8 * (v23 >> 2)];
              uint64_t v27 = v44 - v43;
              if (v44 != v43)
              {
                uint64_t v14 = &v24[8 * (v23 >> 2) + (v27 & 0xFFFFFFFFFFFFFFF8)];
                uint64_t v28 = 8 * (v27 >> 3);
                uint64_t v29 = &v24[8 * (v23 >> 2)];
                do
                {
                  uint64_t v30 = *(void *)v26;
                  v26 += 8;
                  *(void *)uint64_t v29 = v30;
                  v29 += 8;
                  v28 -= 8;
                }
                while (v28);
              }
              long long v31 = __p;
              std::string __p = v24;
              uint64_t v43 = &v24[8 * (v23 >> 2)];
              uint64_t v44 = v14;
              uint64_t v45 = &v24[8 * v25];
              if (v31)
              {
                operator delete(v31);
                uint64_t v14 = v44;
              }
            }
            else
            {
              uint64_t v16 = v15 >> 3;
              BOOL v17 = v15 >> 3 < -1;
              uint64_t v18 = (v15 >> 3) + 2;
              if (v17) {
                uint64_t v19 = v18;
              }
              else {
                uint64_t v19 = v16 + 1;
              }
              uint64_t v20 = &v43[-8 * (v19 >> 1)];
              int64_t v21 = v14 - v43;
              if (v14 != v43)
              {
                memmove(&v43[-8 * (v19 >> 1)], v43, v14 - v43);
                uint64_t v14 = v43;
              }
              uint64_t v22 = &v14[-8 * (v19 >> 1)];
              uint64_t v14 = &v20[v21];
              uint64_t v43 = v22;
              uint64_t v44 = &v20[v21];
            }
          }
          uint64_t v32 = *(void *)v13;
          v13 += 8;
          *(void *)uint64_t v14 = v32;
          uint64_t v14 = v44 + 8;
          v44 += 8;
        }
        while (v13 != a1[2]);
        unint64_t v33 = (char *)a1[1];
      }
      uint64_t v36 = *a1;
      uint64_t v37 = v43;
      *a1 = __p;
      a1[1] = v37;
      std::string __p = v36;
      uint64_t v43 = v33;
      unsigned int v38 = (char *)a1[3];
      uint64_t v39 = v45;
      a1[2] = v14;
      a1[3] = v39;
      uint64_t v44 = v13;
      uint64_t v45 = v38;
      if (v14 - v37 == 8) {
        uint64_t v40 = 21;
      }
      else {
        uint64_t v40 = (uint64_t)a1[4] + 42;
      }
      a1[4] = (void *)v40;
      if (v13 != v33) {
        uint64_t v44 = &v13[(v33 - v13 + 7) & 0xFFFFFFFFFFFFFFF8];
      }
      if (v36) {
        operator delete(v36);
      }
    }
    else
    {
      if (v2 == v9)
      {
        std::string __p = operator new(0xFC0uLL);
        sub_20DB6A718(a1, &__p);
        unint64_t v34 = a1[2];
        std::string __p = (void *)*(v34 - 1);
        a1[2] = v34 - 1;
      }
      else
      {
        std::string __p = operator new(0xFC0uLL);
      }
      sub_20DB6A830((uint64_t)a1, &__p);
      if ((unsigned char *)a1[2] - (unsigned char *)a1[1] == 8) {
        uint64_t v35 = 21;
      }
      else {
        uint64_t v35 = (uint64_t)a1[4] + 42;
      }
      a1[4] = (void *)v35;
    }
  }
  else
  {
    a1[4] = v6 + 42;
    std::string __p = (void *)*((void *)v3 - 1);
    a1[2] = v3 - 8;
    sub_20DB6A830((uint64_t)a1, &__p);
  }
}

void sub_20DB6AECC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  operator delete(v12);
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_20DB6AF18(void *a1)
{
  uint64_t v2 = a1 + 5;
  uint64_t v3 = (void **)a1[1];
  unint64_t v4 = (void **)a1[2];
  if (v4 == v3)
  {
    unint64_t v4 = (void **)a1[1];
  }
  else
  {
    unint64_t v5 = a1[4];
    uint64_t v6 = &v3[v5 / 0x2A];
    uint64_t v7 = (char *)*v6 + 96 * (v5 % 0x2A);
    unint64_t v8 = (unint64_t)v3[(a1[5] + v5) / 0x2A] + 96 * ((a1[5] + v5) % 0x2A);
    if (v7 != (char *)v8)
    {
      do
      {
        sub_20DB627D8((uint64_t)v2, v7);
        v7 += 96;
        if (v7 - (unsigned char *)*v6 == 4032)
        {
          uint64_t v9 = (char *)v6[1];
          ++v6;
          uint64_t v7 = v9;
        }
      }
      while (v7 != (char *)v8);
      uint64_t v3 = (void **)a1[1];
      unint64_t v4 = (void **)a1[2];
    }
  }
  void *v2 = 0;
  unint64_t v10 = (char *)v4 - (char *)v3;
  if ((unint64_t)((char *)v4 - (char *)v3) >= 0x11)
  {
    do
    {
      operator delete(*v3);
      unint64_t v4 = (void **)a1[2];
      uint64_t v3 = (void **)(a1[1] + 8);
      a1[1] = v3;
      unint64_t v10 = (char *)v4 - (char *)v3;
    }
    while ((unint64_t)((char *)v4 - (char *)v3) > 0x10);
  }
  unint64_t v11 = v10 >> 3;
  if (v11 == 1)
  {
    uint64_t v12 = 21;
  }
  else
  {
    if (v11 != 2) {
      goto LABEL_16;
    }
    uint64_t v12 = 42;
  }
  a1[4] = v12;
LABEL_16:
  while (v3 != v4)
  {
    uint64_t v13 = *v3++;
    operator delete(v13);
  }

  return sub_20DB6B070((uint64_t)a1);
}

uint64_t sub_20DB6B070(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != v3) {
    *(void *)(a1 + 16) = v2 + ((v3 - v2 + 7) & 0xFFFFFFFFFFFFFFF8);
  }
  unint64_t v4 = *(void **)a1;
  if (*(void *)a1) {
    operator delete(v4);
  }
  return a1;
}

char *sub_20DB6B0C0(void *a1, long long *a2, long long *a3, unint64_t a4)
{
  uint64_t v6 = a2;
  uint64_t v8 = a1[2];
  int64x2_t result = (char *)*a1;
  if (0xAAAAAAAAAAAAAAABLL * ((v8 - (uint64_t)result) >> 3) >= a4)
  {
    uint64_t v19 = (char *)a1[1];
    uint64_t v14 = a1 + 1;
    uint64_t v13 = v19;
    unint64_t v20 = 0xAAAAAAAAAAAAAAABLL * ((v19 - result) >> 3);
    if (v20 >= a4)
    {
      uint64_t v25 = result;
      if (a2 != a3)
      {
        uint64_t v26 = result;
        do
        {
          *(_OWORD *)uint64_t v26 = *v6;
          v26[16] = *((unsigned char *)v6 + 16);
          v25 += 24;
          uint64_t v6 = (long long *)((char *)v6 + 24);
          v26 += 24;
        }
        while (v6 != a3);
      }
      int64_t v18 = v25 - result;
      uint64_t v13 = result;
    }
    else
    {
      int64_t v21 = (long long *)((char *)a2 + 24 * v20);
      if (v13 != result)
      {
        do
        {
          *(_OWORD *)int64x2_t result = *v6;
          result[16] = *((unsigned char *)v6 + 16);
          uint64_t v6 = (long long *)((char *)v6 + 24);
          result += 24;
        }
        while (v6 != v21);
      }
      uint64_t v22 = v13;
      if (v21 != a3)
      {
        unint64_t v23 = v13;
        do
        {
          long long v24 = *v21;
          *((void *)v23 + 2) = *((void *)v21 + 2);
          *(_OWORD *)unint64_t v23 = v24;
          v23 += 24;
          int64_t v21 = (long long *)((char *)v21 + 24);
          v22 += 24;
        }
        while (v21 != a3);
      }
      int64_t v18 = v22 - v13;
    }
  }
  else
  {
    if (result)
    {
      a1[1] = result;
      operator delete(result);
      uint64_t v8 = 0;
      *a1 = 0;
      a1[1] = 0;
      a1[2] = 0;
    }
    if (a4 > 0xAAAAAAAAAAAAAAALL) {
      sub_20DB5E168();
    }
    unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * (v8 >> 3);
    uint64_t v11 = 2 * v10;
    if (2 * v10 <= a4) {
      uint64_t v11 = a4;
    }
    if (v10 >= 0x555555555555555) {
      unint64_t v12 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v12 = v11;
    }
    int64x2_t result = sub_20DB6225C(a1, v12);
    int64_t v15 = (char *)a1[1];
    uint64_t v14 = a1 + 1;
    uint64_t v13 = v15;
    uint64_t v16 = v15;
    if (v6 != a3)
    {
      uint64_t v16 = v13;
      do
      {
        long long v17 = *v6;
        *((void *)v16 + 2) = *((void *)v6 + 2);
        *(_OWORD *)uint64_t v16 = v17;
        v16 += 24;
        uint64_t v6 = (long long *)((char *)v6 + 24);
      }
      while (v6 != a3);
    }
    int64_t v18 = v16 - v13;
  }
  *uint64_t v14 = &v13[v18];
  return result;
}

char *sub_20DB6B278(void *a1, uint64_t *a2, uint64_t *a3, unint64_t a4)
{
  uint64_t v6 = a2;
  uint64_t v8 = a1[2];
  int64x2_t result = (char *)*a1;
  if (a4 <= (v8 - (uint64_t)result) >> 4)
  {
    int64_t v18 = (char *)a1[1];
    uint64_t v13 = a1 + 1;
    unint64_t v12 = v18;
    unint64_t v19 = (v18 - result) >> 4;
    if (v19 >= a4)
    {
      uint64_t v26 = result;
      if (a2 != a3)
      {
        uint64_t v27 = result;
        do
        {
          uint64_t v28 = *v6;
          uint64_t v29 = v6[1];
          v6 += 2;
          *(void *)uint64_t v27 = v28;
          *((void *)v27 + 1) = v29;
          v27 += 16;
          v26 += 16;
        }
        while (v6 != a3);
      }
      long long v17 = (char *)(v26 - result);
      unint64_t v12 = result;
    }
    else
    {
      unint64_t v20 = (long long *)&a2[2 * v19];
      if (v12 != result)
      {
        do
        {
          uint64_t v21 = *v6;
          uint64_t v22 = v6[1];
          v6 += 2;
          *(void *)int64x2_t result = v21;
          *((void *)result + 1) = v22;
          result += 16;
        }
        while (v6 != (uint64_t *)v20);
      }
      unint64_t v23 = v12;
      if (v20 != (long long *)a3)
      {
        long long v24 = v12;
        do
        {
          long long v25 = *v20++;
          *(_OWORD *)long long v24 = v25;
          v24 += 16;
          v23 += 16;
        }
        while (v20 != (long long *)a3);
      }
      long long v17 = (char *)(v23 - v12);
    }
  }
  else
  {
    if (result)
    {
      a1[1] = result;
      operator delete(result);
      uint64_t v8 = 0;
      *a1 = 0;
      a1[1] = 0;
      a1[2] = 0;
    }
    if (a4 >> 60) {
      sub_20DB5E168();
    }
    uint64_t v10 = v8 >> 3;
    if (v8 >> 3 <= a4) {
      uint64_t v10 = a4;
    }
    if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v11 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v11 = v10;
    }
    int64x2_t result = sub_20DB5E518(a1, v11);
    uint64_t v14 = (char *)a1[1];
    uint64_t v13 = a1 + 1;
    unint64_t v12 = v14;
    int64_t v15 = v14;
    if (v6 != a3)
    {
      int64_t v15 = v12;
      do
      {
        long long v16 = *(_OWORD *)v6;
        v6 += 2;
        *(_OWORD *)int64_t v15 = v16;
        v15 += 16;
      }
      while (v6 != a3);
    }
    long long v17 = (char *)(v15 - v12);
  }
  *uint64_t v13 = &v17[(void)v12];
  return result;
}

void sub_20DB6B3C8(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 3);
  BOOL v3 = a2 >= v2;
  unint64_t v4 = a2 - v2;
  if (v4 != 0 && v3)
  {
    sub_20DB6B404((void **)a1, v4);
  }
  else if (!v3)
  {
    *(void *)(a1 + 8) = *(void *)a1 + 24 * a2;
  }
}

void sub_20DB6B404(void **a1, unint64_t a2)
{
  uint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  unint64_t v5 = v6;
  uint64_t v7 = *(void **)(v4 - 8);
  if (0xAAAAAAAAAAAAAAABLL * ((v6 - (unsigned char *)v7) >> 3) >= a2)
  {
    if (a2)
    {
      uint64_t v13 = &v7[3 * a2];
      uint64_t v14 = 24 * a2;
      do
      {
        *uint64_t v7 = 0;
        v7[1] = 0;
        *((unsigned char *)v7 + 16) = 0;
        v7 += 3;
        v14 -= 24;
      }
      while (v14);
      uint64_t v7 = v13;
    }
    a1[1] = v7;
  }
  else
  {
    unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * (((char *)v7 - (unsigned char *)*a1) >> 3);
    unint64_t v9 = v8 + a2;
    if (v8 + a2 > 0xAAAAAAAAAAAAAAALL) {
      sub_20DB5E168();
    }
    unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * ((v5 - (unsigned char *)*a1) >> 3);
    if (2 * v10 > v9) {
      unint64_t v9 = 2 * v10;
    }
    if (v10 >= 0x555555555555555) {
      unint64_t v11 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v11 = v9;
    }
    if (v11) {
      unint64_t v12 = (char *)sub_20DB622B0(v4, v11);
    }
    else {
      unint64_t v12 = 0;
    }
    int64_t v15 = &v12[24 * v8];
    long long v16 = &v15[24 * a2];
    uint64_t v17 = 24 * a2;
    int64_t v18 = v15;
    do
    {
      *(void *)int64_t v18 = 0;
      *((void *)v18 + 1) = 0;
      v18[16] = 0;
      v18 += 24;
      v17 -= 24;
    }
    while (v17);
    unint64_t v19 = &v12[24 * v11];
    uint64_t v21 = (char *)*a1;
    unint64_t v20 = (char *)a1[1];
    if (v20 != *a1)
    {
      do
      {
        long long v22 = *(_OWORD *)(v20 - 24);
        *((void *)v15 - 1) = *((void *)v20 - 1);
        *(_OWORD *)(v15 - 24) = v22;
        v15 -= 24;
        v20 -= 24;
      }
      while (v20 != v21);
      unint64_t v20 = (char *)*a1;
    }
    *a1 = v15;
    a1[1] = v16;
    a1[2] = v19;
    if (v20)
    {
      operator delete(v20);
    }
  }
}

uint64_t sub_20DB6B580(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  __int16 v5 = a5;
  *(void *)a1 = a2;
  *(void *)(a1 + 8) = a3;
  *(void *)(a1 + 16) = a4;
  *(_DWORD *)(a1 + 24) = a5;
  *(_OWORD *)(a1 + 32) = 0u;
  uint64_t v9 = a1 + 32;
  *(void *)(a1 + 80) = 0;
  *(void *)(a1 + 88) = 0;
  *(unsigned char *)(a1 + 96) = 0;
  *(void *)(a1 + 104) = 0;
  *(void *)(a1 + 112) = 0;
  *(unsigned char *)(a1 + 120) = 0;
  *(unsigned char *)(a1 + 128) = 0;
  *(void *)(a1 + 136) = 0;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 57) = 0u;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  char v15 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  char v18 = 0;
  char v19 = 0;
  uint64_t v20 = 0;
  *(_OWORD *)std::string __p = 0u;
  memset(v12, 0, sizeof(v12));
  sub_20DB69270(a4, a2, a3, (uint64_t)__p, a5);
  sub_20DB6944C(v9, a2, a3, (uint64_t *)__p, (v5 & 0x800) != 0);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  return a1;
}

void sub_20DB6B658(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p) {
    operator delete(__p);
  }
  uint64_t v13 = *v11;
  if (*v11)
  {
    *(void *)(v10 + 40) = v13;
    operator delete(v13);
  }
  _Unwind_Resume(exception_object);
}

void sub_20DB6B684(const std::locale *a1, const char *a2, int a3)
{
  __int16 v5 = sub_20DB5FB8C(a1);
  LODWORD(v5[3].__locale_) = a3;
  *(_OWORD *)((char *)&v5[3].__locale_ + 4) = 0u;
  *(_OWORD *)((char *)&v5[5].__locale_ + 4) = 0u;
  HIDWORD(v5[7].__locale_) = 0;
  strlen(a2);
  sub_20DB6B71C();
}

void sub_20DB6B6FC(_Unwind_Exception *a1)
{
  locale = (std::__shared_weak_count *)v1[6].__locale_;
  if (locale) {
    sub_20DB5E6A0(locale);
  }
  std::locale::~locale(v1);
  _Unwind_Resume(a1);
}

void sub_20DB6B71C()
{
}

void sub_20DB6B8DC(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

char *sub_20DB6B910(uint64_t a1, unsigned __int8 *a2, char *a3)
{
  uint64_t v6 = a2;
  do
  {
    uint64_t v7 = v6;
    uint64_t v6 = sub_20DB6BE94(a1, (char *)v6, a3);
  }
  while (v6 != v7);
  if (v7 == a2) {
    operator new();
  }
  if (v7 != (unsigned __int8 *)a3)
  {
    if (*v7 == 124)
    {
      unint64_t v8 = v7 + 1;
      uint64_t v9 = v7 + 1;
      do
      {
        uint64_t v10 = v9;
        uint64_t v9 = sub_20DB6BE94(a1, (char *)v9, a3);
      }
      while (v9 != v10);
      if (v10 == v8) {
        operator new();
      }
      sub_20DB60830();
    }
    return (char *)v7;
  }
  return a3;
}

unsigned __int8 *sub_20DB6BA70(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  BOOL v3 = a2;
  if (a2 == a3) {
    return a2;
  }
  uint64_t v4 = a3;
  if (*a2 == 94) {
    sub_20DB610FC();
  }
  if (a2 != a3)
  {
    do
    {
      uint64_t v6 = v3;
      BOOL v3 = sub_20DB6D918(a1, v3, v4);
    }
    while (v3 != v6);
    if (v6 != v4)
    {
      if (v6 + 1 == v4 && *v6 == 36) {
        sub_20DB61180();
      }
      sub_20DB6840C();
    }
  }
  return v4;
}

unsigned __int8 *sub_20DB6BB20(uint64_t a1, char *a2, char *a3)
{
  BOOL v3 = a3;
  uint64_t v6 = sub_20DB6DDA0(a1, a2, a3);
  if (v6 == (unsigned __int8 *)a2) {
LABEL_8:
  }
    sub_20DB6840C();
  if (v6 != (unsigned __int8 *)v3)
  {
    if (*v6 == 124)
    {
      if (sub_20DB6DDA0(a1, (char *)v6 + 1, v3) != v6 + 1) {
        sub_20DB60830();
      }
      goto LABEL_8;
    }
    return v6;
  }
  return (unsigned __int8 *)v3;
}

unsigned __int8 *sub_20DB6BBC4(uint64_t a1, unsigned __int8 *__s, unsigned __int8 *a3)
{
  uint64_t v6 = (unsigned __int8 *)memchr(__s, 10, a3 - __s);
  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = a3;
  }
  if (v7 == __s) {
    operator new();
  }
  sub_20DB6BA70(a1, __s, v7);
  if (v7 == a3) {
    uint64_t v10 = v7;
  }
  else {
    uint64_t v10 = v7 + 1;
  }
  if (v10 != a3)
  {
    unint64_t v8 = (unsigned __int8 *)memchr(v10, 10, a3 - v10);
    if (v8) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = a3;
    }
    if (v9 != v10)
    {
      sub_20DB6BA70(a1, v10, v9);
      sub_20DB60830();
    }
    operator new();
  }
  return a3;
}

char *sub_20DB6BD2C(uint64_t a1, char *__s, char *a3)
{
  uint64_t v6 = (char *)memchr(__s, 10, a3 - __s);
  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = a3;
  }
  if (v7 == __s) {
    operator new();
  }
  sub_20DB6BB20(a1, __s, v7);
  if (v7 == a3) {
    uint64_t v10 = v7;
  }
  else {
    uint64_t v10 = v7 + 1;
  }
  if (v10 != a3)
  {
    unint64_t v8 = (char *)memchr(v10, 10, a3 - v10);
    if (v8) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = a3;
    }
    if (v9 != v10)
    {
      sub_20DB6BB20(a1, v10, v9);
      sub_20DB60830();
    }
    operator new();
  }
  return a3;
}

unsigned __int8 *sub_20DB6BE94(uint64_t a1, char *a2, char *a3)
{
  int64x2_t result = (unsigned __int8 *)sub_20DB6BF3C(a1, a2, a3);
  if (result == (unsigned __int8 *)a2)
  {
    uint64_t v7 = sub_20DB6C14C(a1, (unsigned __int8 *)a2, a3);
    int64x2_t result = (unsigned __int8 *)a2;
    if (v7 != (unsigned __int8 *)a2)
    {
      return sub_20DB6C394(a1, v7, (unsigned __int8 *)a3);
    }
  }
  return result;
}

char *sub_20DB6BF3C(uint64_t a1, char *a2, char *a3)
{
  if (a2 != a3)
  {
    int v6 = *a2;
    if (v6 > 91)
    {
      if (v6 == 92)
      {
        if (a2 + 1 != a3)
        {
          int v13 = a2[1];
          if (v13 == 66 || v13 == 98) {
            sub_20DB61204();
          }
        }
      }
      else if (v6 == 94)
      {
        sub_20DB610FC();
      }
    }
    else
    {
      if (v6 == 36) {
        sub_20DB61180();
      }
      BOOL v8 = v6 == 40;
      uint64_t v7 = a2 + 1;
      BOOL v8 = !v8 || v7 == a3;
      if (!v8)
      {
        BOOL v8 = *v7 == 63;
        uint64_t v9 = a2 + 2;
        if (v8 && v9 != a3)
        {
          int v11 = *v9;
          if (v11 == 33)
          {
            sub_20DB5FB8C(v14);
            long long v15 = 0u;
            uint64_t v17 = 0;
            long long v16 = 0u;
            LODWORD(v15) = *(_DWORD *)(a1 + 24);
            sub_20DB6B71C(v14, a2 + 3, a3);
            sub_20DB61298();
          }
          if (v11 == 61)
          {
            sub_20DB5FB8C(v14);
            long long v15 = 0u;
            uint64_t v17 = 0;
            long long v16 = 0u;
            LODWORD(v15) = *(_DWORD *)(a1 + 24);
            sub_20DB6B71C(v14, a2 + 3, a3);
            sub_20DB61298();
          }
        }
      }
    }
  }
  return a2;
}

void sub_20DB6C12C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9)
{
}

unsigned __int8 *sub_20DB6C14C(uint64_t a1, unsigned __int8 *a2, char *a3)
{
  BOOL v3 = a2;
  if (a2 == (unsigned __int8 *)a3) {
    return v3;
  }
  int v6 = (char)*a2;
  if (v6 <= 62)
  {
    if (v6 != 40)
    {
      if (v6 == 46) {
        operator new();
      }
      if ((v6 - 42) >= 2) {
        goto LABEL_28;
      }
LABEL_34:
      sub_20DB62F98();
    }
    if (a2 + 1 != (unsigned __int8 *)a3)
    {
      if (a2 + 2 != (unsigned __int8 *)a3 && a2[1] == 63 && a2[2] == 58)
      {
        BOOL v8 = (_DWORD *)(a1 + 36);
        ++*(_DWORD *)(a1 + 36);
        uint64_t v9 = (char *)sub_20DB6B910(a1, a2 + 3, a3);
        if (v9 == a3) {
          goto LABEL_35;
        }
        uint64_t v10 = v9;
        if (*v9 != 41) {
          goto LABEL_35;
        }
        goto LABEL_25;
      }
      sub_20DB62E98(a1);
      BOOL v8 = (_DWORD *)(a1 + 36);
      ++*(_DWORD *)(a1 + 36);
      int v11 = (char *)sub_20DB6B910(a1, v3 + 1, a3);
      if (v11 != a3)
      {
        uint64_t v10 = v11;
        if (*v11 == 41)
        {
          sub_20DB62F1C(a1);
LABEL_25:
          --*v8;
          return (unsigned __int8 *)(v10 + 1);
        }
      }
    }
LABEL_35:
    sub_20DB61340();
  }
  if (v6 <= 91)
  {
    if (v6 == 91)
    {
      return sub_20DB6C73C(a1, a2, a3);
    }
    if (v6 == 63) {
      goto LABEL_34;
    }
LABEL_28:
    return sub_20DB62FF0(a1, a2, a3);
  }
  if (v6 != 92)
  {
    if (v6 == 123) {
      goto LABEL_34;
    }
    goto LABEL_28;
  }

  return sub_20DB6C698(a1, a2, (unsigned __int8 *)a3);
}

unsigned __int8 *sub_20DB6C394(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  if (a2 == a3) {
    return a2;
  }
  int v5 = (char)*a2;
  if (v5 <= 62)
  {
    if (v5 == 42 || v5 == 43) {
LABEL_18:
    }
      sub_20DB67DB8();
    return a2;
  }
  if (v5 == 63) {
    goto LABEL_18;
  }
  if (v5 == 123)
  {
    int v6 = a2 + 1;
    uint64_t v7 = sub_20DB67F48(a1, a2 + 1, a3, &v13);
    if (v7 == v6) {
      goto LABEL_23;
    }
    if (v7 != a3)
    {
      int v8 = (char)*v7;
      if (v8 != 44)
      {
        if (v8 == 125) {
          goto LABEL_18;
        }
LABEL_23:
        sub_20DB67FE8();
      }
      uint64_t v9 = v7 + 1;
      if (v7 + 1 == a3) {
        goto LABEL_23;
      }
      if (*v9 == 125) {
        goto LABEL_18;
      }
      int v12 = -1;
      int v11 = sub_20DB67F48(a1, v9, a3, &v12);
      if (v11 != v9 && v11 != a3 && *v11 == 125)
      {
        if (v12 >= v13) {
          goto LABEL_18;
        }
        goto LABEL_23;
      }
    }
    sub_20DB68040();
  }
  return a2;
}

unsigned __int8 *sub_20DB6C698(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  if (a2 == a3 || *a2 != 92) {
    return a2;
  }
  int v5 = a2 + 1;
  if (a2 + 1 == a3) {
    sub_20DB6315C();
  }
  int64x2_t result = sub_20DB6C850(a1, a2 + 1, a3);
  if (result == v5)
  {
    int64x2_t result = (unsigned __int8 *)sub_20DB6326C(a1, (char *)a2 + 1, (char *)a3);
    if (result == v5)
    {
      int64x2_t result = sub_20DB6C910(a1, (char *)a2 + 1, (char *)a3, 0);
      if (result == v5) {
        return a2;
      }
    }
  }
  return result;
}

unsigned char *sub_20DB6C73C(uint64_t a1, unsigned char *a2, unsigned char *a3)
{
  if (a2 != a3 && *a2 == 91)
  {
    if (a2 + 1 != a3) {
      sub_20DB64448();
    }
    sub_20DB659C4();
  }
  return a2;
}

unsigned __int8 *sub_20DB6C850(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  if (a2 != a3)
  {
    int v4 = *a2;
    unsigned int v5 = v4 - 48;
    if (v4 == 48) {
      sub_20DB63650(a1);
    }
    if ((v4 - 49) <= 8)
    {
      int v6 = a2 + 1;
      if (a2 + 1 == a3) {
        goto LABEL_12;
      }
      do
      {
        int v7 = *v6;
        if ((v7 - 48) > 9) {
          break;
        }
        if (v5 >= 0x19999999) {
          goto LABEL_14;
        }
        ++v6;
        unsigned int v5 = v7 + 10 * v5 - 48;
      }
      while (v6 != a3);
      if (v5)
      {
LABEL_12:
        if (v5 <= *(_DWORD *)(a1 + 28)) {
          sub_20DB637E8(a1);
        }
      }
LABEL_14:
      sub_20DB63790();
    }
  }
  return a2;
}

unsigned __int8 *sub_20DB6C910(uint64_t a1, char *a2, char *a3, std::string *this)
{
  int v4 = a2;
  if (a2 == a3) {
    return (unsigned __int8 *)v4;
  }
  int v5 = *a2;
  if (v5 > 109)
  {
    char v6 = 0;
    switch(*a2)
    {
      case 'n':
        if (!this) {
          goto LABEL_52;
        }
        int v7 = this;
        std::string::value_type v8 = 10;
        goto LABEL_50;
      case 'r':
        if (!this) {
          goto LABEL_52;
        }
        int v7 = this;
        std::string::value_type v8 = 13;
        goto LABEL_50;
      case 't':
        if (!this) {
          goto LABEL_52;
        }
        int v7 = this;
        std::string::value_type v8 = 9;
        goto LABEL_50;
      case 'u':
        if (a2 + 1 == a3) {
          goto LABEL_55;
        }
        int v9 = a2[1];
        if ((v9 & 0xF8) != 0x30 && (v9 & 0xFE) != 0x38 && (v9 | 0x20u) - 97 >= 6) {
          goto LABEL_55;
        }
        int v4 = a2 + 2;
        if (a2 + 2 == a3) {
          goto LABEL_55;
        }
        int v10 = *v4;
        char v11 = -48;
        if ((v10 & 0xF8) == 0x30 || (v10 & 0xFE) == 0x38) {
          goto LABEL_24;
        }
        v10 |= 0x20u;
        if ((v10 - 97) >= 6) {
          goto LABEL_55;
        }
        char v11 = -87;
LABEL_24:
        char v6 = 16 * (v11 + v10);
LABEL_25:
        if (v4 + 1 == a3) {
          goto LABEL_55;
        }
        int v12 = v4[1];
        char v13 = -48;
        if ((v12 & 0xF8) == 0x30 || (v12 & 0xFE) == 0x38) {
          goto LABEL_30;
        }
        v12 |= 0x20u;
        if ((v12 - 97) >= 6) {
          goto LABEL_55;
        }
        char v13 = -87;
LABEL_30:
        if (v4 + 2 == a3) {
          goto LABEL_55;
        }
        int v14 = v4[2];
        char v15 = -48;
        if ((v14 & 0xF8) == 0x30 || (v14 & 0xFE) == 0x38) {
          goto LABEL_35;
        }
        v14 |= 0x20u;
        if ((v14 - 97) >= 6) {
          goto LABEL_55;
        }
        char v15 = -87;
LABEL_35:
        if (!this) {
          sub_20DB63650(a1);
        }
        std::string::operator=(this, v15 + v14 + 16 * (v13 + v12 + v6));
        v4 += 3;
        break;
      case 'v':
        if (!this) {
          goto LABEL_52;
        }
        int v7 = this;
        std::string::value_type v8 = 11;
        goto LABEL_50;
      case 'x':
        goto LABEL_25;
      default:
        goto LABEL_45;
    }
    return (unsigned __int8 *)v4;
  }
  if (v5 == 48)
  {
    if (this)
    {
      int v7 = this;
      std::string::value_type v8 = 0;
      goto LABEL_50;
    }
LABEL_52:
    sub_20DB63650(a1);
  }
  if (v5 != 99)
  {
    if (v5 == 102)
    {
      if (this)
      {
        int v7 = this;
        std::string::value_type v8 = 12;
LABEL_50:
        std::string::operator=(v7, v8);
        return (unsigned __int8 *)++v4;
      }
      goto LABEL_52;
    }
LABEL_45:
    if (*a2 != 95
      && ((v5 & 0x80) != 0
       || (*(_DWORD *)(*(void *)(*(void *)(a1 + 8) + 16) + 4 * *a2) & 0x500) == 0))
    {
      std::string::value_type v8 = *a2;
      if (this)
      {
        int v7 = this;
        goto LABEL_50;
      }
      goto LABEL_52;
    }
LABEL_55:
    sub_20DB6315C();
  }
  if (a2 + 1 == a3) {
    goto LABEL_55;
  }
  char v16 = a2[1];
  if (((v16 & 0xDF) - 65) > 0x19u) {
    goto LABEL_55;
  }
  if (!this) {
    sub_20DB63650(a1);
  }
  std::string::operator=(this, v16 & 0x1F);
  v4 += 2;
  return (unsigned __int8 *)v4;
}

unsigned char *sub_20DB6CC14(uint64_t a1, char *a2, char *a3, uint64_t *a4)
{
  int v4 = a2;
  if (a2 == a3) {
    return v4;
  }
  int v5 = *a2;
  if (v5 == 93) {
    return v4;
  }
  uint64_t v6 = (uint64_t)a4;
  memset(&v26, 0, sizeof(v26));
  if (a2 + 1 == a3 || v5 != 91)
  {
LABEL_9:
    int v11 = *(_DWORD *)(a1 + 24) & 0x1F0;
    goto LABEL_10;
  }
  int v9 = a2[1];
  if (v9 != 46)
  {
    if (v9 == 58)
    {
      uint64_t v10 = sub_20DB6D1A4(a1, a2 + 2, a3, (uint64_t)a4);
      goto LABEL_34;
    }
    if (v9 == 61)
    {
      uint64_t v10 = sub_20DB6CFC4(a1, a2 + 2, a3, a4);
LABEL_34:
      uint64_t v6 = v10;
      char v20 = 0;
      goto LABEL_38;
    }
    goto LABEL_9;
  }
  uint64_t v18 = sub_20DB6D260(a1, a2 + 2, a3, (uint64_t)&v26);
  int v4 = (unsigned char *)v18;
  int v11 = *(_DWORD *)(a1 + 24) & 0x1F0;
  std::string::size_type size = HIBYTE(v26.__r_.__value_.__r.__words[2]);
  if ((v26.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    std::string::size_type size = v26.__r_.__value_.__l.__size_;
  }
  int v14 = (char *)v18;
  if (!size)
  {
LABEL_10:
    if ((v11 | 0x40) == 0x40)
    {
      int v12 = *v4;
      if (v12 == 92)
      {
        char v13 = v4 + 1;
        if (v11)
        {
          int v14 = sub_20DB6D48C(a1, v13, a3, &v26);
        }
        else
        {
          int v14 = (char *)sub_20DB6D350(a1, v13, a3, &v26, v6);
          int v11 = 0;
        }
        goto LABEL_16;
      }
    }
    else
    {
      LOBYTE(v12) = *v4;
    }
    std::string::operator=(&v26, v12);
    int v14 = v4 + 1;
  }
LABEL_16:
  if (v14 == a3
    || (int v15 = *v14, v15 == 93)
    || (char v16 = v14 + 1, v14 + 1 == a3)
    || v15 != 45
    || *v16 == 93)
  {
    if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0)
    {
      if (v26.__r_.__value_.__l.__size_)
      {
        if (v26.__r_.__value_.__l.__size_ != 1)
        {
          uint64_t v17 = (std::string *)v26.__r_.__value_.__r.__words[0];
LABEL_36:
          sub_20DB668B8(v6, v17->__r_.__value_.__s.__data_[0], v17->__r_.__value_.__s.__data_[1]);
          goto LABEL_37;
        }
        uint64_t v17 = (std::string *)v26.__r_.__value_.__r.__words[0];
        goto LABEL_28;
      }
    }
    else if (*((unsigned char *)&v26.__r_.__value_.__s + 23))
    {
      uint64_t v17 = &v26;
      if (HIBYTE(v26.__r_.__value_.__r.__words[2]) != 1) {
        goto LABEL_36;
      }
LABEL_28:
      sub_20DB644E4(v6, v17->__r_.__value_.__s.__data_[0]);
    }
LABEL_37:
    char v20 = 1;
    int v4 = v14;
    goto LABEL_38;
  }
  memset(&v25, 0, sizeof(v25));
  int v4 = v14 + 2;
  if (v14 + 2 != a3 && *v16 == 91 && *v4 == 46)
  {
    uint64_t v22 = sub_20DB6D260(a1, v14 + 3, a3, (uint64_t)&v25);
LABEL_55:
    int v4 = (unsigned char *)v22;
    goto LABEL_56;
  }
  if ((v11 | 0x40) == 0x40)
  {
    LODWORD(v16) = *v16;
    if (v16 == 92)
    {
      if (v11) {
        uint64_t v22 = (uint64_t)sub_20DB6D48C(a1, v14 + 2, a3, &v25);
      }
      else {
        uint64_t v22 = (uint64_t)sub_20DB6D350(a1, v14 + 2, a3, &v25, v6);
      }
      goto LABEL_55;
    }
  }
  else
  {
    LOBYTE(v16) = *v16;
  }
  std::string::operator=(&v25, (std::string::value_type)v16);
LABEL_56:
  std::string v24 = v26;
  memset(&v26, 0, sizeof(v26));
  std::string __p = v25;
  memset(&v25, 0, sizeof(v25));
  sub_20DB66490(v6, (char *)&v24, (char *)&__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v24.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v25.__r_.__value_.__l.__data_);
  }
  char v20 = 1;
LABEL_38:
  if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v26.__r_.__value_.__l.__data_);
  }
  if (v20) {
    return v4;
  }
  return (unsigned char *)v6;
}

void sub_20DB6CF64(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (a28 < 0) {
    operator delete(a23);
  }
  if (*(char *)(v28 - 49) < 0) {
    operator delete(*(void **)(v28 - 72));
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_20DB6CFC4(uint64_t a1, char *a2, char *a3, uint64_t *a4)
{
  if (a3 - a2 < 2 || a3 - 1 == a2) {
    goto LABEL_33;
  }
  for (uint64_t i = 0; a2[i] != 61 || a2[i + 1] != 93; ++i)
  {
    if (a3 - a2 - 2 == i) {
      goto LABEL_33;
    }
  }
  if (&a2[i] == a3) {
LABEL_33:
  }
    sub_20DB659C4();
  sub_20DB6D694(a1, a2, &a2[i], (uint64_t)&v17);
  if (((char)v19 & 0x80000000) == 0)
  {
    uint64_t v8 = v19;
    if (v19)
    {
      int v9 = (char *)&v17;
      goto LABEL_14;
    }
LABEL_34:
    sub_20DB66B14();
  }
  uint64_t v8 = v18;
  if (!v18) {
    goto LABEL_34;
  }
  int v9 = (char *)v17;
LABEL_14:
  sub_20DB66D60(a1, v9, &v9[v8], (uint64_t)__p);
  unint64_t v10 = v16;
  if ((v16 & 0x80u) != 0) {
    unint64_t v10 = (unint64_t)__p[1];
  }
  if (v10)
  {
    sub_20DB66B6C(a4, (long long *)__p);
  }
  else
  {
    uint64_t v11 = v19;
    if ((v19 & 0x80u) != 0) {
      uint64_t v11 = v18;
    }
    if (v11 == 2)
    {
      char v13 = (char *)&v17;
      if ((v19 & 0x80u) != 0) {
        char v13 = (char *)v17;
      }
      sub_20DB668B8((uint64_t)a4, *v13, v13[1]);
    }
    else
    {
      if (v11 != 1) {
        sub_20DB66B14();
      }
      int v12 = (char *)&v17;
      if ((v19 & 0x80u) != 0) {
        int v12 = (char *)v17;
      }
      sub_20DB644E4((uint64_t)a4, *v12);
    }
  }
  if ((char)v16 < 0) {
    operator delete(__p[0]);
  }
  if ((char)v19 < 0) {
    operator delete(v17);
  }
  return (uint64_t)&a2[i + 2];
}

void sub_20DB6D16C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_20DB6D1A4(uint64_t a1, char *a2, char *a3, uint64_t a4)
{
  if (a3 - a2 < 2 || a3 - 1 == a2) {
    goto LABEL_11;
  }
  for (uint64_t i = 0; a2[i] != 58 || a2[i + 1] != 93; ++i)
  {
    if (a3 - a2 - 2 == i) {
      goto LABEL_11;
    }
  }
  if (&a2[i] == a3) {
LABEL_11:
  }
    sub_20DB659C4();
  int v7 = sub_20DB6D844(a1, a2, &a2[i], *(unsigned char *)(a1 + 24) & 1);
  if (!v7) {
    sub_20DB672BC();
  }
  *(_DWORD *)(a4 + 160) |= v7;
  return (uint64_t)&a2[i + 2];
}

uint64_t sub_20DB6D260(uint64_t a1, char *a2, char *a3, uint64_t a4)
{
  if (a3 - a2 < 2 || a3 - 1 == a2) {
    goto LABEL_15;
  }
  for (uint64_t i = 0; a2[i] != 46 || a2[i + 1] != 93; ++i)
  {
    if (a3 - a2 - 2 == i) {
      goto LABEL_15;
    }
  }
  if (&a2[i] == a3) {
LABEL_15:
  }
    sub_20DB659C4();
  sub_20DB6D694(a1, a2, &a2[i], (uint64_t)&v10);
  if (*(char *)(a4 + 23) < 0) {
    operator delete(*(void **)a4);
  }
  *(_OWORD *)a4 = v10;
  unint64_t v7 = v11;
  *(void *)(a4 + 16) = v11;
  unint64_t v8 = HIBYTE(v7);
  if ((v8 & 0x80u) != 0) {
    unint64_t v8 = *(void *)(a4 + 8);
  }
  if (v8 - 1 >= 2) {
    sub_20DB66B14();
  }
  return (uint64_t)&a2[i + 2];
}

unsigned __int8 *sub_20DB6D350(uint64_t a1, char *a2, char *a3, std::string *this, uint64_t a5)
{
  if (a2 == a3) {
    sub_20DB6315C();
  }
  int v6 = *a2;
  if (v6 > 97)
  {
    if (v6 > 114)
    {
      if (v6 != 115)
      {
        if (v6 != 119) {
          goto LABEL_25;
        }
        *(_DWORD *)(a5 + 160) |= 0x500u;
        sub_20DB644E4(a5, 95);
        return (unsigned __int8 *)(a2 + 1);
      }
      int v8 = *(_DWORD *)(a5 + 160) | 0x4000;
    }
    else
    {
      if (v6 == 98)
      {
        long long v10 = this;
        std::string::value_type v9 = 8;
LABEL_19:
        std::string::operator=(v10, v9);
        return (unsigned __int8 *)(a2 + 1);
      }
      if (v6 != 100) {
        goto LABEL_25;
      }
      int v8 = *(_DWORD *)(a5 + 160) | 0x400;
    }
    *(_DWORD *)(a5 + 160) = v8;
    return (unsigned __int8 *)(a2 + 1);
  }
  if (v6 <= 82)
  {
    if (*a2)
    {
      if (v6 == 68)
      {
        int v7 = *(_DWORD *)(a5 + 164) | 0x400;
LABEL_21:
        *(_DWORD *)(a5 + 164) = v7;
        return (unsigned __int8 *)(a2 + 1);
      }
      goto LABEL_25;
    }
    std::string::value_type v9 = 0;
    long long v10 = this;
    goto LABEL_19;
  }
  if (v6 == 83)
  {
    int v7 = *(_DWORD *)(a5 + 164) | 0x4000;
    goto LABEL_21;
  }
  if (v6 == 87)
  {
    *(_DWORD *)(a5 + 164) |= 0x500u;
    sub_20DB673E8(a5, 95);
    return (unsigned __int8 *)(a2 + 1);
  }
LABEL_25:

  return sub_20DB6C910(a1, a2, a3, this);
}

char *sub_20DB6D48C(uint64_t a1, char *a2, char *a3, std::string *this)
{
  if (a2 == a3) {
LABEL_45:
  }
    sub_20DB6315C();
  int v5 = *a2;
  if (v5 > 97)
  {
    switch(v5)
    {
      case 'n':
        if (!this) {
          goto LABEL_43;
        }
        int v6 = this;
        LOBYTE(v5) = 10;
        goto LABEL_16;
      case 'o':
      case 'p':
      case 'q':
      case 's':
      case 'u':
        goto LABEL_21;
      case 'r':
        if (!this) {
          goto LABEL_43;
        }
        int v6 = this;
        LOBYTE(v5) = 13;
        goto LABEL_16;
      case 't':
        if (!this) {
          goto LABEL_43;
        }
        int v6 = this;
        LOBYTE(v5) = 9;
        goto LABEL_16;
      case 'v':
        if (!this) {
          goto LABEL_43;
        }
        int v6 = this;
        LOBYTE(v5) = 11;
        goto LABEL_16;
      default:
        if (v5 == 98)
        {
          if (this)
          {
            int v6 = this;
            LOBYTE(v5) = 8;
            goto LABEL_16;
          }
        }
        else
        {
          if (v5 != 102) {
            goto LABEL_21;
          }
          if (this)
          {
            int v6 = this;
            LOBYTE(v5) = 12;
            goto LABEL_16;
          }
        }
        break;
    }
    goto LABEL_43;
  }
  if (v5 > 91)
  {
    if (v5 != 92)
    {
      if (v5 != 97) {
        goto LABEL_21;
      }
      if (this)
      {
        int v6 = this;
        LOBYTE(v5) = 7;
LABEL_16:
        std::string::operator=(v6, v5);
        return a2 + 1;
      }
LABEL_43:
      sub_20DB63650(a1);
    }
LABEL_14:
    if (this)
    {
      int v6 = this;
      goto LABEL_16;
    }
    goto LABEL_43;
  }
  if (v5 == 34 || v5 == 47) {
    goto LABEL_14;
  }
LABEL_21:
  if ((v5 & 0xFFFFFFF8) != 0x30) {
    goto LABEL_45;
  }
  std::string::value_type v7 = v5 - 48;
  unint64_t v11 = a2 + 1;
  if (a2 + 1 == a3)
  {
LABEL_38:
    unint64_t v11 = a3;
    goto LABEL_39;
  }
  if ((*v11 & 0xF8) == 0x30)
  {
    std::string::value_type v7 = *v11 + 8 * v7 - 48;
    if (a2 + 2 != a3)
    {
      char v8 = a2[2];
      int v9 = v8 & 0xF8;
      std::string::value_type v10 = v8 + 8 * v7 - 48;
      if (v9 == 48) {
        unint64_t v11 = a2 + 3;
      }
      else {
        unint64_t v11 = a2 + 2;
      }
      if (v9 == 48) {
        std::string::value_type v7 = v10;
      }
      goto LABEL_39;
    }
    goto LABEL_38;
  }
LABEL_39:
  if (!this) {
    sub_20DB63650(a1);
  }
  std::string::operator=(this, v7);
  return v11;
}

void sub_20DB6D694(uint64_t a1@<X0>, char *a2@<X1>, char *a3@<X2>, uint64_t a4@<X8>)
{
  sub_20DB65760(&__s, a2, a3, a3 - a2);
  *(void *)a4 = 0;
  *(void *)(a4 + 8) = 0;
  *(void *)(a4 + 16) = 0;
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
  {
    if (!__s.__r_.__value_.__l.__size_) {
      goto LABEL_9;
    }
    p_s = (std::string *)__s.__r_.__value_.__r.__words[0];
  }
  else
  {
    if (!*((unsigned char *)&__s.__r_.__value_.__s + 23)) {
      return;
    }
    p_s = &__s;
  }
  std::__get_collation_name(&v11, (const char *)p_s);
  *(_OWORD *)a4 = *(_OWORD *)&v11.__r_.__value_.__l.__data_;
  unint64_t v7 = v11.__r_.__value_.__r.__words[2];
  *(void *)(a4 + 16) = *((void *)&v11.__r_.__value_.__l + 2);
  unint64_t v8 = HIBYTE(v7);
  if ((v8 & 0x80u) != 0) {
    unint64_t v8 = *(void *)(a4 + 8);
  }
  if (v8) {
    goto LABEL_9;
  }
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
  {
    if (__s.__r_.__value_.__l.__size_ >= 3) {
      goto LABEL_9;
    }
  }
  else if (HIBYTE(__s.__r_.__value_.__r.__words[2]) >= 3u)
  {
    return;
  }
  (*(void (**)(std::string *__return_ptr))(**(void **)(a1 + 16) + 32))(&v11);
  if (*(char *)(a4 + 23) < 0) {
    operator delete(*(void **)a4);
  }
  *(std::string *)a4 = v11;
  if ((*(char *)(a4 + 23) & 0x80000000) == 0)
  {
    int v9 = *(unsigned __int8 *)(a4 + 23);
    if (v9 != 12 && v9 != 1)
    {
      *(unsigned char *)a4 = 0;
      *(unsigned char *)(a4 + 23) = 0;
      goto LABEL_9;
    }
    goto LABEL_23;
  }
  uint64_t v10 = *(void *)(a4 + 8);
  if (v10 == 1 || v10 == 12)
  {
LABEL_23:
    std::string::operator=((std::string *)a4, &__s);
    goto LABEL_9;
  }
  **(unsigned char **)a4 = 0;
  *(void *)(a4 + 8) = 0;
LABEL_9:
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__s.__r_.__value_.__l.__data_);
  }
}

void sub_20DB6D810(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (*(char *)(v17 + 23) < 0) {
    operator delete(*(void **)v17);
  }
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_20DB6D844(uint64_t a1, char *a2, char *a3, BOOL a4)
{
  sub_20DB65760(__p, a2, a3, a3 - a2);
  unint64_t v6 = v12;
  if ((v12 & 0x80u) == 0) {
    unint64_t v7 = __p;
  }
  else {
    unint64_t v7 = (void **)__p[0];
  }
  if ((v12 & 0x80u) != 0) {
    unint64_t v6 = (unint64_t)__p[1];
  }
  (*(void (**)(void, void **, char *))(**(void **)(a1 + 8) + 48))(*(void *)(a1 + 8), v7, (char *)v7 + v6);
  if ((v12 & 0x80u) == 0) {
    unint64_t v8 = __p;
  }
  else {
    unint64_t v8 = (void **)__p[0];
  }
  uint64_t classname = std::__get_classname((const char *)v8, a4);
  if ((char)v12 < 0) {
    operator delete(__p[0]);
  }
  return classname;
}

void sub_20DB6D8FC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

unsigned __int8 *sub_20DB6D918(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  if (a2 == a3) {
    return a2;
  }
  unint64_t v6 = sub_20DB6D9B4(a1, a2, a3);
  if (v6 == a2) {
    return a2;
  }

  return sub_20DB6DAC4(a1, v6, a3);
}

unsigned char *sub_20DB6D9B4(uint64_t a1, unsigned char *a2, unsigned char *a3)
{
  unint64_t v6 = sub_20DB6DC68(a1, a2, a3);
  unint64_t v7 = v6;
  if (v6 == a2 && v6 != a3)
  {
    if (a2 + 1 == a3 || *a2 != 92)
    {
      return a2;
    }
    else
    {
      int v8 = a2[1];
      if (v8 == 40)
      {
        uint64_t v9 = (uint64_t)(a2 + 2);
        sub_20DB62E98(a1);
        do
        {
          uint64_t v10 = (unsigned char *)v9;
          uint64_t v9 = sub_20DB6D918(a1, v9, a3);
        }
        while ((unsigned char *)v9 != v10);
        if (v10 == a3 || v10 + 1 == a3 || *v10 != 92 || v10[1] != 41) {
          sub_20DB61340();
        }
        unint64_t v7 = v10 + 2;
        sub_20DB62F1C(a1);
      }
      else
      {
        int v12 = sub_20DB68AA4(a1, v8);
        uint64_t v13 = 2;
        if (!v12) {
          uint64_t v13 = 0;
        }
        return &a2[v13];
      }
    }
  }
  return v7;
}

unsigned __int8 *sub_20DB6DAC4(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  if (a2 != a3)
  {
    int v4 = *a2;
    if (v4 == 42) {
      sub_20DB67DB8();
    }
    if (a2 + 1 != a3 && v4 == 92 && a2[1] == 123)
    {
      unint64_t v6 = a2 + 2;
      int v13 = 0;
      unint64_t v7 = sub_20DB67F48(a1, a2 + 2, a3, &v13);
      if (v7 == v6) {
        goto LABEL_16;
      }
      if (v7 != a3)
      {
        int v8 = v7 + 1;
        int v9 = *v7;
        if (v9 == 44)
        {
          int v12 = -1;
          uint64_t v10 = sub_20DB67F48(a1, v8, a3, &v12);
          if (v10 != a3 && v10 + 1 != a3 && *v10 == 92 && v10[1] == 125)
          {
            if (v12 != -1 && v12 < v13) {
LABEL_16:
            }
              sub_20DB67FE8();
LABEL_20:
            sub_20DB67DB8();
          }
        }
        else if (v8 != a3 && v9 == 92 && *v8 == 125)
        {
          goto LABEL_20;
        }
      }
      sub_20DB68040();
    }
  }
  return a2;
}

unsigned char *sub_20DB6DC68(uint64_t a1, unsigned char *a2, unsigned char *a3)
{
  if (a2 == a3)
  {
    int64x2_t result = sub_20DB688F0(a1, a2, a3);
    if (result != a2) {
      return result;
    }
    goto LABEL_12;
  }
  int v6 = *a2;
  if ((a2 + 1 != a3 || v6 != 36)
    && ((v6 - 46) > 0x2E || ((1 << (v6 - 46)) & 0x600000000001) == 0))
  {
    sub_20DB63650(a1);
  }
  int64x2_t result = sub_20DB688F0(a1, a2, a3);
  if (result == a2)
  {
    if (*a2 == 46) {
      operator new();
    }
LABEL_12:
    return sub_20DB6C73C(a1, a2, a3);
  }
  return result;
}

unsigned __int8 *sub_20DB6DDA0(uint64_t a1, char *a2, char *a3)
{
  int v6 = sub_20DB6DE00(a1, a2, a3);
  if (v6 == (unsigned __int8 *)a2) {
    sub_20DB6840C();
  }
  do
  {
    unint64_t v7 = v6;
    int v6 = sub_20DB6DE00(a1, (char *)v6, a3);
  }
  while (v6 != v7);
  return v7;
}

unsigned __int8 *sub_20DB6DE00(uint64_t a1, char *a2, char *a3)
{
  int v6 = sub_20DB6DF44(a1, a2, a3);
  unint64_t v7 = (unsigned __int8 *)v6;
  if (v6 == a2 && v6 != a3)
  {
    int v8 = *a2;
    if (v8 == 36) {
      sub_20DB61180();
    }
    if (v8 != 40)
    {
      if (v8 == 94) {
        sub_20DB610FC();
      }
      return (unsigned __int8 *)a2;
    }
    sub_20DB62E98(a1);
    ++*(_DWORD *)(a1 + 36);
    int v9 = (char *)sub_20DB6BB20(a1, a2 + 1, a3);
    if (v9 == a3 || (uint64_t v10 = v9, *v9 != 41)) {
      sub_20DB61340();
    }
    sub_20DB62F1C(a1);
    --*(_DWORD *)(a1 + 36);
    unint64_t v7 = (unsigned __int8 *)(v10 + 1);
  }
  if (v7 == (unsigned __int8 *)a2) {
    return (unsigned __int8 *)a2;
  }

  return sub_20DB6C394(a1, v7, (unsigned __int8 *)a3);
}

char *sub_20DB6DF44(uint64_t a1, char *a2, char *a3)
{
  int64x2_t result = sub_20DB68D90(a1, a2, a3);
  if (result == a2)
  {
    int64x2_t result = sub_20DB6E02C(a1, a2, a3);
    if (result == a2)
    {
      if (a2 != a3 && *a2 == 46) {
        operator new();
      }
      return sub_20DB6C73C(a1, a2, a3);
    }
  }
  return result;
}

char *sub_20DB6E02C(uint64_t a1, char *a2, char *a3)
{
  BOOL v3 = a2;
  if (a2 == a3) {
    return v3;
  }
  int v4 = (unsigned __int8 *)(a2 + 1);
  if (v3 + 1 == a3 || *v3 != 92) {
    return v3;
  }
  int v5 = (char)*v4;
  BOOL v6 = (v5 - 36) > 0x3A || ((1 << (*v4 - 36)) & 0x5800000080004F1) == 0;
  if (!v6 || (v5 - 123) < 3) {
    sub_20DB63650(a1);
  }
  if ((*(_DWORD *)(a1 + 24) & 0x1F0) != 0x40)
  {
    int v8 = sub_20DB68AA4(a1, *v4);
    uint64_t v9 = 2;
    if (!v8) {
      uint64_t v9 = 0;
    }
    v3 += v9;
    return v3;
  }

  return sub_20DB6D48C(a1, (char *)v4, a3, 0);
}

BOOL sub_20DB6E104(const void **a1, void *__s1)
{
  size_t v2 = *((unsigned __int8 *)a1 + 23);
  int v3 = (char)v2;
  if ((v2 & 0x80u) != 0) {
    size_t v2 = (size_t)a1[1];
  }
  if ((*((char *)__s1 + 23) & 0x80000000) == 0)
  {
    size_t v4 = *((unsigned __int8 *)__s1 + 23);
    if (v2 >= v4) {
      goto LABEL_9;
    }
    return 0;
  }
  size_t v4 = __s1[1];
  if (v2 < v4) {
    return 0;
  }
  uint64_t __s1 = (void *)*__s1;
LABEL_9:
  if (v3 >= 0) {
    BOOL v6 = a1;
  }
  else {
    BOOL v6 = *a1;
  }
  return memcmp(__s1, v6, v4) == 0;
}

uint64_t sub_20DB6E17C(uint64_t *a1, uint64_t a2)
{
  unint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  unint64_t v5 = v6;
  unint64_t v7 = *(void *)(v4 - 8);
  if (v7 >= v6)
  {
    unint64_t v9 = 0xEEEEEEEEEEEEEEEFLL * ((uint64_t)(v7 - *a1) >> 3);
    if (v9 + 1 > 0x222222222222222) {
      sub_20DB5E168();
    }
    unint64_t v10 = 0xEEEEEEEEEEEEEEEFLL * ((uint64_t)(v5 - *a1) >> 3);
    uint64_t v11 = 2 * v10;
    if (2 * v10 <= v9 + 1) {
      uint64_t v11 = v9 + 1;
    }
    if (v10 >= 0x111111111111111) {
      unint64_t v12 = 0x222222222222222;
    }
    else {
      unint64_t v12 = v11;
    }
    uint64_t v19 = v4;
    if (v12) {
      int v13 = (char *)sub_20DB70D68(v4, v12);
    }
    else {
      int v13 = 0;
    }
    int v15 = v13;
    unsigned __int8 v16 = &v13[120 * v9];
    uint64_t v18 = &v13[120 * v12];
    sub_20DB6ECC8((uint64_t)v16, a2);
    uint64_t v17 = v16 + 120;
    sub_20DB70CF0(a1, &v15);
    uint64_t v8 = a1[1];
    sub_20DB70F90(&v15);
  }
  else
  {
    sub_20DB6ECC8(*(void *)(v4 - 8), a2);
    uint64_t v8 = v7 + 120;
    a1[1] = v7 + 120;
  }
  a1[1] = v8;
  return v8 - 120;
}

void sub_20DB6E290(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_20DB70F90((void **)va);
  _Unwind_Resume(a1);
}

void sub_20DB6E2A4(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  v81[2] = *MEMORY[0x263EF8340];
  *(void *)((char *)v81 + 7) = 0;
  v81[0] = 0;
  *(void *)((char *)v80 + 7) = 0;
  v80[0] = 0;
  int v76 = 1;
  LOBYTE(v77) = 0;
  uint64_t v3 = *(unsigned __int8 *)(a1 + 23);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  if ((v3 & 0x80u) == 0) {
    uint64_t v6 = *(unsigned __int8 *)(a1 + 23);
  }
  else {
    uint64_t v6 = *(void *)(a1 + 8);
  }
  if ((v3 & 0x80u) == 0) {
    unint64_t v7 = (char *)a1;
  }
  else {
    unint64_t v7 = *(char **)a1;
  }
  uint64_t v8 = &v7[v6];
  if (v6 >= 2)
  {
    unint64_t v9 = v7;
    do
    {
      unint64_t v10 = (char *)memchr(v9, 32, v6 - 1);
      if (!v10) {
        break;
      }
      if (*(_WORD *)v10 == 8224) {
        goto LABEL_13;
      }
      unint64_t v9 = v10 + 1;
      uint64_t v6 = v8 - (unsigned char *)v9;
    }
    while (v8 - (unsigned char *)v9 > 1);
  }
  unint64_t v10 = v8;
LABEL_13:
  uint64_t v11 = v10 - v7;
  if (v10 == v8) {
    uint64_t v11 = -1;
  }
  if ((v3 & 0x80) != 0)
  {
    if (v11 == -1)
    {
      uint64_t v12 = v4 + v5;
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  uint64_t v4 = a1;
  if (v11 != -1)
  {
LABEL_19:
    uint64_t v12 = v4 + v11;
    goto LABEL_20;
  }
  uint64_t v12 = a1 + v3;
LABEL_20:
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26772BF40, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26772BF40))
  {
    sub_20DB6B684((const std::locale *)&unk_26772BF00, "(-{1,2})?(.*?)([,= ]|$)", 0);
  }
  if (*(char *)(a1 + 23) >= 0) {
    uint64_t v13 = a1;
  }
  else {
    uint64_t v13 = *(void *)a1;
  }
  sub_20DB6B580((uint64_t)&v70, v13, v12, (uint64_t)&unk_26772BF00, 32);
  char v49 = 0;
  std::string __p = 0;
  uint64_t v48 = 0;
  char v14 = 0;
  int v15 = 0;
  uint64_t v62 = 0;
  uint64_t v63 = 0;
  char v64 = 0;
  uint64_t v65 = 0;
  uint64_t v66 = 0;
  char v67 = 0;
  char v68 = 0;
  uint64_t v69 = 0;
  *(_OWORD *)&v60[32] = 0u;
  memset(v61, 0, 25);
  memset(v60, 0, 28);
  while (!sub_20DB690A8((uint64_t)&v70, (uint64_t)v60))
  {
    unint64_t v16 = 0xAAAAAAAAAAAAAAABLL * ((v72 - (unsigned char *)v71) >> 3);
    uint64_t v17 = (uint64_t *)((char *)v71 + 40);
    if (v16 <= 1) {
      uint64_t v17 = &v75;
    }
    if (*(unsigned char *)v17)
    {
      uint64_t v18 = (uint64_t *)((char *)v71 + 24);
      if (v16 <= 1) {
        uint64_t v18 = &v73;
      }
      uint64_t v19 = *v18;
      char v20 = (char *)v71 + 32;
      if (v16 <= 1) {
        char v20 = &v74;
      }
      uint64_t v21 = *(void *)v20 - v19;
      uint64_t v22 = (uint64_t *)((char *)v71 + 64);
      if (v16 <= 2) {
        uint64_t v22 = &v75;
      }
      if (v21 == 1)
      {
        if (*(unsigned char *)v22)
        {
          BOOL v23 = v16 > 2;
          if (v16 <= 2) {
            std::string v24 = (char **)&v73;
          }
          else {
            std::string v24 = (char **)((char *)v71 + 48);
          }
          std::string v25 = (char **)((char *)v71 + 56);
          if (!v23) {
            std::string v25 = (char **)&v74;
          }
          sub_20DB65760(&v59, *v24, *v25, *v25 - *v24);
        }
        else
        {
          memset(&v59, 0, sizeof(v59));
        }
        unint64_t v34 = std::string::insert(&v59, 0, "-");
        uint64_t v35 = (void *)v34->__r_.__value_.__r.__words[0];
        v79[0] = v34->__r_.__value_.__l.__size_;
        *(void *)((char *)v79 + 7) = *(std::string::size_type *)((char *)&v34->__r_.__value_.__r.__words[1] + 7);
        char v36 = HIBYTE(v34->__r_.__value_.__r.__words[2]);
        v34->__r_.__value_.__l.__size_ = 0;
        v34->__r_.__value_.__r.__words[2] = 0;
        v34->__r_.__value_.__r.__words[0] = 0;
        if (v49 < 0) {
          operator delete(__p);
        }
        v81[0] = v79[0];
        *(void *)((char *)v81 + 7) = *(void *)((char *)v79 + 7);
        if (SHIBYTE(v59.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v59.__r_.__value_.__l.__data_);
        }
        char v49 = v36;
        std::string __p = v35;
      }
      else
      {
        if (*(unsigned char *)v22)
        {
          BOOL v31 = v16 > 2;
          if (v16 <= 2) {
            uint64_t v32 = (char **)&v73;
          }
          else {
            uint64_t v32 = (char **)((char *)v71 + 48);
          }
          unint64_t v33 = (char **)((char *)v71 + 56);
          if (!v31) {
            unint64_t v33 = (char **)&v74;
          }
          sub_20DB65760(&v59, *v32, *v33, *v33 - *v32);
        }
        else
        {
          memset(&v59, 0, sizeof(v59));
        }
        uint64_t v37 = std::string::insert(&v59, 0, "--");
        unsigned int v38 = (void *)v37->__r_.__value_.__r.__words[0];
        v79[0] = v37->__r_.__value_.__l.__size_;
        *(void *)((char *)v79 + 7) = *(std::string::size_type *)((char *)&v37->__r_.__value_.__r.__words[1] + 7);
        char v39 = HIBYTE(v37->__r_.__value_.__r.__words[2]);
        v37->__r_.__value_.__l.__size_ = 0;
        v37->__r_.__value_.__r.__words[2] = 0;
        v37->__r_.__value_.__r.__words[0] = 0;
        if (v14 < 0) {
          operator delete(v48);
        }
        v80[0] = v79[0];
        *(void *)((char *)v80 + 7) = *(void *)((char *)v79 + 7);
        if (SHIBYTE(v59.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v59.__r_.__value_.__l.__data_);
        }
        uint64_t v48 = v38;
        char v14 = v39;
      }
    }
    else
    {
      std::string v26 = (uint64_t *)((char *)v71 + 64);
      if (v16 <= 2) {
        std::string v26 = &v75;
      }
      if (*(unsigned char *)v26)
      {
        BOOL v27 = v16 > 2;
        if (v16 <= 2) {
          uint64_t v28 = &v73;
        }
        else {
          uint64_t v28 = (uint64_t *)((char *)v71 + 48);
        }
        uint64_t v29 = *v28;
        uint64_t v30 = (char *)v71 + 56;
        if (!v27) {
          uint64_t v30 = &v74;
        }
        if (*(void *)v30 - v29 > 0) {
          int v15 = 1;
        }
      }
    }
    unint64_t v40 = 0xAAAAAAAAAAAAAAABLL * ((v72 - (unsigned char *)v71) >> 3);
    __int16 v41 = (uint64_t *)((char *)v71 + 88);
    if (v40 <= 3) {
      __int16 v41 = &v75;
    }
    if (!*(unsigned char *)v41) {
      break;
    }
    BOOL v42 = v40 > 3;
    if (v40 <= 3) {
      uint64_t v43 = &v73;
    }
    else {
      uint64_t v43 = (uint64_t *)((char *)v71 + 72);
    }
    uint64_t v44 = *v43;
    uint64_t v45 = (char *)v71 + 80;
    if (!v42) {
      uint64_t v45 = &v74;
    }
    if (*(void *)v45 == v44) {
      break;
    }
    sub_20DB68EE4((uint64_t)&v70);
  }
  if (*(void *)&v60[32])
  {
    *(void *)&v60[40] = *(void *)&v60[32];
    operator delete(*(void **)&v60[32]);
  }
  if (v71)
  {
    uint64_t v72 = v71;
    operator delete(v71);
  }
  if (v15)
  {
    memset(v61, 0, 17);
    *(void *)&v61[24] = 0;
    uint64_t v62 = 0;
    LOBYTE(v63) = 0;
    char v64 = 0;
    uint64_t v65 = 0;
    memset(v60, 0, 41);
    sub_20DB6B684((const std::locale *)&v59, "\\[default: (.*)\\]", 1);
  }
  BOOL v56 = __p;
  *(void *)int v57 = v81[0];
  *(void *)&v57[7] = *(void *)((char *)v81 + 7);
  char v58 = v49;
  long long v53 = v48;
  *(void *)long long v54 = v80[0];
  *(void *)&v54[7] = *(void *)((char *)v80 + 7);
  char v55 = v14;
  int v50 = v76;
  switch(v76)
  {
    case 1:
      LOBYTE(v51[0]) = v77;
      break;
    case 2:
      v51[0] = (void *)v77;
      break;
    case 3:
      *(_OWORD *)char v51 = v77;
      uint64_t v52 = v78;
      uint64_t v78 = 0;
      long long v77 = 0uLL;
      break;
    case 4:
      *(_OWORD *)char v51 = v77;
      uint64_t v52 = v78;
      uint64_t v78 = 0;
      long long v77 = 0uLL;
      break;
    default:
      break;
  }
  sub_20DB7100C(a2, (long long *)&v56, (long long *)&v53, 0, (uint64_t)&v50);
  if (v50 == 4)
  {
    uint64_t v70 = v51;
    sub_20DB7ABD8((void ***)&v70);
  }
  else if (v50 == 3 && SHIBYTE(v52) < 0)
  {
    operator delete(v51[0]);
  }
  if (v55 < 0) {
    operator delete(v53);
  }
  if (v58 < 0) {
    operator delete(v56);
  }
  if (v76 == 4)
  {
    uint64_t v70 = &v77;
    sub_20DB7ABD8((void ***)&v70);
  }
  else if (v76 == 3 && SHIBYTE(v78) < 0)
  {
    operator delete((void *)v77);
  }
}

void sub_20DB6EAEC(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_26772BF40);
  sub_20DB6FFB4(v1 - 184);
  _Unwind_Resume(a1);
}

uint64_t sub_20DB6EC18(uint64_t a1)
{
  if (*(char *)(a1 + 111) < 0) {
    operator delete(*(void **)(a1 + 88));
  }
  if (*(char *)(a1 + 87) < 0) {
    operator delete(*(void **)(a1 + 64));
  }
  *(void *)a1 = &unk_26C2447D0;
  int v2 = *(_DWORD *)(a1 + 32);
  if (v2 == 4)
  {
    uint64_t v4 = (void **)(a1 + 40);
    sub_20DB7ABD8(&v4);
  }
  else if (v2 == 3 && *(char *)(a1 + 63) < 0)
  {
    operator delete(*(void **)(a1 + 40));
  }
  if (*(char *)(a1 + 31) < 0) {
    operator delete(*(void **)(a1 + 8));
  }
  return a1;
}

__n128 sub_20DB6ECC8(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = &unk_26C2447D0;
  long long v2 = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = v2;
  *(void *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = 0;
  *(void *)(a2 + 8) = 0;
  int v3 = *(_DWORD *)(a2 + 32);
  *(_DWORD *)(a1 + 32) = v3;
  int v4 = v3 - 1;
  uint64_t v5 = (unsigned char *)(a1 + 40);
  switch(v4)
  {
    case 0:
      unsigned char *v5 = *(unsigned char *)(a2 + 40);
      break;
    case 1:
      *(void *)uint64_t v5 = *(void *)(a2 + 40);
      break;
    case 2:
      long long v6 = *(_OWORD *)(a2 + 40);
      *(void *)(a1 + 56) = *(void *)(a2 + 56);
      *(_OWORD *)uint64_t v5 = v6;
      *(void *)(a2 + 48) = 0;
      *(void *)(a2 + 56) = 0;
      *(void *)(a2 + 40) = 0;
      break;
    case 3:
      *(void *)uint64_t v5 = 0;
      *(void *)(a1 + 48) = 0;
      *(void *)(a1 + 56) = 0;
      *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
      *(void *)(a1 + 56) = *(void *)(a2 + 56);
      *(void *)(a2 + 40) = 0;
      *(void *)(a2 + 48) = 0;
      *(void *)(a2 + 56) = 0;
      break;
    default:
      break;
  }
  *(void *)a1 = &unk_26C2449E8;
  long long v7 = *(_OWORD *)(a2 + 64);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = v7;
  *(void *)(a2 + 72) = 0;
  *(void *)(a2 + 80) = 0;
  *(void *)(a2 + 64) = 0;
  __n128 result = *(__n128 *)(a2 + 88);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(__n128 *)(a1 + 88) = result;
  *(void *)(a2 + 96) = 0;
  *(void *)(a2 + 104) = 0;
  *(void *)(a2 + 88) = 0;
  *(_DWORD *)(a1 + 112) = *(_DWORD *)(a2 + 112);
  return result;
}

uint64_t sub_20DB6EDF0@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(void)@<X1>, void *a3@<X8>)
{
  uint64_t result = a2();
  a3[1] = 0;
  a3[2] = 0;
  *a3 = 0;
  if (result)
  {
    long long v6 = operator new(8uLL);
    *a3 = v6;
    void *v6 = a1;
    uint64_t result = (uint64_t)(v6 + 1);
    a3[1] = result;
    a3[2] = result;
  }
  return result;
}

void sub_20DB6EE38(uint64_t a1, void **a2)
{
  uint64_t v4 = (uint64_t)(a2 + 2);
  unint64_t v5 = (unint64_t)a2[2];
  long long v6 = a2[1];
  if ((unint64_t)v6 >= v5)
  {
    uint64_t v8 = ((char *)v6 - (unsigned char *)*a2) >> 3;
    if ((unint64_t)(v8 + 1) >> 61) {
      sub_20DB5E168();
    }
    uint64_t v9 = v5 - (void)*a2;
    uint64_t v10 = v9 >> 2;
    if (v9 >> 2 <= (unint64_t)(v8 + 1)) {
      uint64_t v10 = v8 + 1;
    }
    if ((unint64_t)v9 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v11 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v11 = v10;
    }
    if (v11) {
      uint64_t v12 = (char *)sub_20DB5E180(v4, v11);
    }
    else {
      uint64_t v12 = 0;
    }
    uint64_t v13 = &v12[8 * v8];
    char v14 = &v12[8 * v11];
    *(void *)uint64_t v13 = a1;
    long long v7 = v13 + 8;
    unint64_t v16 = (char *)*a2;
    int v15 = (char *)a2[1];
    if (v15 != *a2)
    {
      do
      {
        uint64_t v17 = *((void *)v15 - 1);
        v15 -= 8;
        *((void *)v13 - 1) = v17;
        v13 -= 8;
      }
      while (v15 != v16);
      int v15 = (char *)*a2;
    }
    *a2 = v13;
    a2[1] = v7;
    a2[2] = v14;
    if (v15) {
      operator delete(v15);
    }
  }
  else
  {
    void *v6 = a1;
    long long v7 = v6 + 1;
  }
  a2[1] = v7;
}

BOOL sub_20DB6EF14(_DWORD *a1, uint64_t a2, uint64_t *a3)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 64))(&v43);
  uint64_t v6 = v44;
  if (!(void)v44) {
    goto LABEL_65;
  }
  sub_20DB70018((uint64_t)&v40, (long long *)(*(void *)a2 + 16 * v43 + 16), *(long long **)(a2 + 8), *(void *)a2 + 16 * v43);
  uint64_t v8 = v7;
  for (uint64_t i = *(void *)(a2 + 8); i != v8; i -= 16)
  {
    uint64_t v10 = *(std::__shared_weak_count **)(i - 8);
    if (v10) {
      sub_20DB5E6A0(v10);
    }
  }
  *(void *)(a2 + 8) = v8;
  uint64_t v11 = *a3;
  uint64_t v12 = a3[1];
  if (*a3 != v12)
  {
    do
    {
      uint64_t v13 = (unsigned __int8 *)(*(uint64_t (**)(void))(**(void **)v11 + 24))();
      uint64_t v14 = (*(uint64_t (**)(_DWORD *))(*(void *)a1 + 24))(a1);
      uint64_t v15 = v13[23];
      if ((v15 & 0x80u) == 0) {
        uint64_t v16 = v13[23];
      }
      else {
        uint64_t v16 = *((void *)v13 + 1);
      }
      uint64_t v17 = *(unsigned __int8 *)(v14 + 23);
      int v18 = (char)v17;
      if ((v17 & 0x80u) != 0) {
        uint64_t v17 = *(void *)(v14 + 8);
      }
      if (v16 == v17)
      {
        if (v18 >= 0) {
          uint64_t v19 = (unsigned __int8 *)v14;
        }
        else {
          uint64_t v19 = *(unsigned __int8 **)v14;
        }
        if ((v15 & 0x80) != 0)
        {
          if (!memcmp(*(const void **)v13, v19, *((void *)v13 + 1))) {
            goto LABEL_25;
          }
        }
        else
        {
          if (!v13[23]) {
            goto LABEL_25;
          }
          while (*v13 == *v19)
          {
            ++v13;
            ++v19;
            if (!--v15) {
              goto LABEL_25;
            }
          }
        }
      }
      v11 += 16;
    }
    while (v11 != v12);
    uint64_t v11 = v12;
  }
LABEL_25:
  int v20 = a1[8];
  if (v20 == 4)
  {
    *(void *)uint64_t v37 = 0;
    unsigned int v38 = 0;
    uint64_t v39 = 0;
    uint64_t v23 = v44;
    std::string v24 = (int *)(v44 + 32);
    if (*(_DWORD *)(v44 + 32) == 4)
    {
      sub_20DB5D878(v24, 4u);
      if (v37 != (int *)(v23 + 40)) {
        sub_20DB70294((uint64_t)v37, *(std::string **)(v23 + 40), *(long long **)(v23 + 48), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(v23 + 48) - *(void *)(v23 + 40)) >> 3));
      }
    }
    else if (*(_DWORD *)(v44 + 32) == 3)
    {
      sub_20DB5D878(v24, 3u);
      unsigned int v38 = (long long *)sub_20DB66ED0((uint64_t *)v37, (long long *)(v23 + 40));
    }
    if (v11 == a3[1])
    {
      sub_20DB6FD98(a3, &v44);
      uint64_t v28 = v44;
      uint64_t v36 = 0;
      long long v35 = 0uLL;
      sub_20DB7AB50((char *)&v35, *(long long **)v37, v38, 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v38 - *(void *)v37) >> 3));
      LODWORD(v40) = 4;
      *(_OWORD *)std::string __p = v35;
      uint64_t v42 = v36;
      long long v35 = 0uLL;
      uint64_t v36 = 0;
      sub_20DB6FEB4(v28, (int *)&v40);
      if (v40 == 4)
      {
        uint64_t v45 = __p;
        sub_20DB7ABD8(&v45);
      }
      else if (v40 == 3 && SHIBYTE(v42) < 0)
      {
        operator delete(__p[0]);
      }
      uint64_t v29 = (void **)&v35;
    }
    else
    {
      uint64_t v26 = *(void *)v11;
      if (*(_DWORD *)(*(void *)v11 + 32) == 4)
      {
        sub_20DB5D878((int *)(*(void *)v11 + 32), 4u);
        sub_20DB70638((uint64_t *)v37, *(std::string **)v37, *(std::string **)(v26 + 40), *(long long **)(v26 + 48), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(v26 + 48) - *(void *)(v26 + 40)) >> 3));
        uint64_t v27 = *(void *)v11;
        uint64_t v34 = 0;
        long long v33 = 0uLL;
        sub_20DB7AB50((char *)&v33, *(long long **)v37, v38, 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v38 - *(void *)v37) >> 3));
        LODWORD(v40) = 4;
        *(_OWORD *)std::string __p = v33;
        uint64_t v42 = v34;
        long long v33 = 0uLL;
        uint64_t v34 = 0;
        sub_20DB6FEB4(v27, (int *)&v40);
        if (v40 == 4)
        {
          uint64_t v45 = __p;
          sub_20DB7ABD8(&v45);
        }
        else if (v40 == 3 && SHIBYTE(v42) < 0)
        {
          operator delete(__p[0]);
        }
        uint64_t v29 = (void **)&v33;
      }
      else
      {
        uint64_t v32 = 0;
        long long v31 = 0uLL;
        sub_20DB7AB50((char *)&v31, *(long long **)v37, v38, 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v38 - *(void *)v37) >> 3));
        LODWORD(v40) = 4;
        *(_OWORD *)std::string __p = v31;
        uint64_t v42 = v32;
        long long v31 = 0uLL;
        uint64_t v32 = 0;
        sub_20DB6FEB4(v26, (int *)&v40);
        if (v40 == 4)
        {
          uint64_t v45 = __p;
          sub_20DB7ABD8(&v45);
        }
        else if (v40 == 3 && SHIBYTE(v42) < 0)
        {
          operator delete(__p[0]);
        }
        uint64_t v29 = (void **)&v31;
      }
    }
    uint64_t v45 = v29;
    sub_20DB7ABD8(&v45);
    unint64_t v40 = v37;
    std::string v25 = (int *)&v40;
    goto LABEL_64;
  }
  if (v20 != 2)
  {
    sub_20DB6FD98(a3, &v44);
    goto LABEL_65;
  }
  if (v11 == a3[1])
  {
    sub_20DB6FD98(a3, &v44);
    uint64_t v21 = v44;
  }
  else
  {
    uint64_t v21 = *(void *)v11;
    if (*(_DWORD *)(*(void *)v11 + 32) == 2)
    {
      uint64_t v22 = sub_20DB5BA3C(*(void *)v11 + 32) + 1;
      uint64_t v21 = *(void *)v11;
      LODWORD(v40) = 2;
      goto LABEL_36;
    }
  }
  LODWORD(v40) = 2;
  uint64_t v22 = 1;
LABEL_36:
  __p[0] = (void *)v22;
  sub_20DB6FEB4(v21, (int *)&v40);
  if (v40 == 4)
  {
    *(void *)uint64_t v37 = __p;
    std::string v25 = v37;
LABEL_64:
    sub_20DB7ABD8((void ***)v25);
    goto LABEL_65;
  }
  if (v40 == 3 && SHIBYTE(v42) < 0) {
    operator delete(__p[0]);
  }
LABEL_65:
  if (*((void *)&v44 + 1)) {
    sub_20DB5E6A0(*((std::__shared_weak_count **)&v44 + 1));
  }
  return v6 != 0;
}

void sub_20DB6F480(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,void **a23)
{
  a23 = (void **)&a20;
  sub_20DB7ABD8(&a23);
  std::string v25 = *(std::__shared_weak_count **)(v23 - 80);
  if (v25) {
    sub_20DB5E6A0(v25);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_20DB6F4DC(uint64_t a1)
{
  return a1 + 8;
}

BOOL sub_20DB6F4E4(uint64_t a1)
{
  return *(_DWORD *)(a1 + 32) != 0;
}

uint64_t sub_20DB6F4F4(uint64_t a1)
{
  unint64_t v2 = sub_20DB6F740((void *)a1);
  unint64_t v3 = ((v2 << 6) + (v2 >> 2) + sub_20DB6F7F4((uint64_t)&v6, a1 + 64) + 2654435769u) ^ v2;
  unint64_t v4 = (sub_20DB6F7F4((uint64_t)&v7, a1 + 88) + (v3 << 6) + (v3 >> 2) + 2654435769u) ^ v3;
  return (*(int *)(a1 + 112) + (v4 << 6) + (v4 >> 2) + 2654435769u) ^ v4;
}

uint64_t sub_20DB6F584(uint64_t a1)
{
  if (*(char *)(a1 + 111) < 0) {
    operator delete(*(void **)(a1 + 88));
  }
  if (*(char *)(a1 + 87) < 0) {
    operator delete(*(void **)(a1 + 64));
  }
  *(void *)a1 = &unk_26C2447D0;
  int v2 = *(_DWORD *)(a1 + 32);
  if (v2 == 4)
  {
    unint64_t v4 = (void **)(a1 + 40);
    sub_20DB7ABD8(&v4);
  }
  else if (v2 == 3 && *(char *)(a1 + 63) < 0)
  {
    operator delete(*(void **)(a1 + 40));
  }
  if (*(char *)(a1 + 31) < 0) {
    operator delete(*(void **)(a1 + 8));
  }
  return MEMORY[0x210564B70](a1, 0x10B3C406F8632FBLL);
}

uint64_t sub_20DB6F648@<X0>(uint64_t result@<X0>, uint64_t **a2@<X1>, uint64_t *a3@<X8>)
{
  unint64_t v4 = *a2;
  unint64_t v5 = a2[1];
  uint64_t v9 = result;
  if (v4 == v5) {
    goto LABEL_10;
  }
  while (1)
  {
    uint64_t result = sub_20DB70B7C(&v9, (uint64_t)v4);
    if (result) {
      break;
    }
    v4 += 2;
    if (v4 == v5)
    {
      unint64_t v4 = v5;
      break;
    }
  }
  if (v4 == a2[1])
  {
LABEL_10:
    *a3 = 0;
    a3[1] = 0;
    a3[2] = 0;
  }
  else
  {
    uint64_t v7 = ((char *)v4 - (char *)*a2) >> 4;
    uint64_t result = *v4;
    if (*v4
      && (uint64_t result = (uint64_t)__dynamic_cast((const void *)result, (const struct __class_type_info *)&unk_26C2443C0, (const struct __class_type_info *)&unk_26C2442D0, 0)) != 0)
    {
      uint64_t v8 = v4[1];
      if (v8) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(v8 + 8), 1uLL, memory_order_relaxed);
      }
    }
    else
    {
      uint64_t v8 = 0;
    }
    *a3 = v7;
    a3[1] = result;
    a3[2] = v8;
  }
  return result;
}

unint64_t sub_20DB6F740(void *a1)
{
  if (!a1) {
    __cxa_bad_typeid();
  }
  unint64_t v2 = *(void *)(*(void *)(*a1 - 8) + 8);
  if ((v2 & 0x8000000000000000) != 0)
  {
    unint64_t v3 = (unsigned __int8 *)(v2 & 0x7FFFFFFFFFFFFFFFLL);
    uint64_t v4 = 5381;
    do
    {
      unint64_t v2 = v4;
      unsigned int v5 = *v3++;
      uint64_t v4 = (33 * v4) ^ v5;
    }
    while (v5);
  }
  unint64_t v6 = ((v2 << 6) + (v2 >> 2) + sub_20DB6F7F4((uint64_t)&v8, (uint64_t)(a1 + 1)) + 2654435769u) ^ v2;
  return (sub_20DB6FCA0((uint64_t)&v9, (uint64_t)(a1 + 4)) + (v6 << 6) + (v6 >> 2) + 2654435769u) ^ v6;
}

unint64_t sub_20DB6F7F4(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = *(void *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    unint64_t v3 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(void *)a2;
    unint64_t v3 = v2;
  }
  return sub_20DB6F834((uint64_t)&v5, (uint64_t *)a2, v3);
}

unint64_t sub_20DB6F834(uint64_t a1, uint64_t *a2, unint64_t a3)
{
  if (a3 > 0x20)
  {
    if (a3 > 0x40)
    {
      uint64_t v4 = *(uint64_t *)((char *)a2 + a3 - 48);
      uint64_t v5 = *(uint64_t *)((char *)a2 + a3 - 40);
      uint64_t v6 = *(uint64_t *)((char *)a2 + a3 - 24);
      uint64_t v8 = *(uint64_t *)((char *)a2 + a3 - 64);
      uint64_t v7 = *(uint64_t *)((char *)a2 + a3 - 56);
      uint64_t v9 = *(uint64_t *)((char *)a2 + a3 - 16);
      uint64_t v10 = *(uint64_t *)((char *)a2 + a3 - 8);
      unint64_t v11 = v7 + v9;
      unint64_t v12 = 0x9DDFEA08EB382D69
          * (v6 ^ ((0x9DDFEA08EB382D69 * (v6 ^ (v4 + a3))) >> 47) ^ (0x9DDFEA08EB382D69 * (v6 ^ (v4 + a3))));
      unint64_t v13 = 0x9DDFEA08EB382D69 * (v12 ^ (v12 >> 47));
      unint64_t v14 = v8 + a3 + v7 + v4;
      uint64_t v15 = v14 + v5;
      unint64_t v16 = __ROR8__(v14, 44) + v8 + a3 + __ROR8__(v5 + v8 + a3 - 0x622015F714C7D297 * (v12 ^ (v12 >> 47)), 21);
      uint64_t v17 = v7 + v9 + *(uint64_t *)((char *)a2 + a3 - 32) - 0x4B6D499041670D8DLL;
      uint64_t v18 = v17 + v6 + v9;
      uint64_t v19 = __ROR8__(v18, 44);
      uint64_t v20 = v18 + v10;
      uint64_t v21 = v19 + v17 + __ROR8__(v17 + v5 + v10, 21);
      uint64_t v23 = *a2;
      uint64_t v22 = a2 + 4;
      unint64_t v24 = v23 - 0x4B6D499041670D8DLL * v5;
      uint64_t v25 = -(uint64_t)((a3 - 1) & 0xFFFFFFFFFFFFFFC0);
      do
      {
        uint64_t v26 = *(v22 - 3);
        uint64_t v27 = v24 + v15 + v11 + v26;
        uint64_t v28 = v22[2];
        uint64_t v29 = v22[3];
        uint64_t v30 = v22[1];
        unint64_t v11 = v30 + v15 - 0x4B6D499041670D8DLL * __ROR8__(v11 + v16 + v28, 42);
        uint64_t v31 = v13 + v20;
        uint64_t v32 = *(v22 - 2);
        uint64_t v33 = *(v22 - 1);
        uint64_t v34 = *(v22 - 4) - 0x4B6D499041670D8DLL * v16;
        uint64_t v35 = v34 + v20 + v33;
        uint64_t v36 = v34 + v26 + v32;
        uint64_t v15 = v36 + v33;
        uint64_t v37 = __ROR8__(v36, 44) + v34;
        unint64_t v38 = (0xB492B66FBE98F273 * __ROR8__(v27, 37)) ^ v21;
        unint64_t v24 = 0xB492B66FBE98F273 * __ROR8__(v31, 33);
        unint64_t v16 = v37 + __ROR8__(v35 + v38, 21);
        unint64_t v39 = v24 + v21 + *v22;
        uint64_t v20 = v39 + v30 + v28 + v29;
        uint64_t v21 = __ROR8__(v39 + v30 + v28, 44) + v39 + __ROR8__(v11 + v32 + v39 + v29, 21);
        v22 += 8;
        unint64_t v13 = v38;
        v25 += 64;
      }
      while (v25);
      unint64_t v40 = v24
          - 0x622015F714C7D297
          * ((0x9DDFEA08EB382D69
            * (v21 ^ ((0x9DDFEA08EB382D69 * (v21 ^ v16)) >> 47) ^ (0x9DDFEA08EB382D69 * (v21 ^ v16)))) ^ ((0x9DDFEA08EB382D69 * (v21 ^ ((0x9DDFEA08EB382D69 * (v21 ^ v16)) >> 47) ^ (0x9DDFEA08EB382D69 * (v21 ^ v16)))) >> 47));
      unint64_t v41 = 0x9DDFEA08EB382D69
          * (v40 ^ (v38
                  - 0x4B6D499041670D8DLL * (v11 ^ (v11 >> 47))
                  - 0x622015F714C7D297
                  * ((0x9DDFEA08EB382D69
                    * (v20 ^ ((0x9DDFEA08EB382D69 * (v20 ^ v15)) >> 47) ^ (0x9DDFEA08EB382D69 * (v20 ^ v15)))) ^ ((0x9DDFEA08EB382D69 * (v20 ^ ((0x9DDFEA08EB382D69 * (v20 ^ v15)) >> 47) ^ (0x9DDFEA08EB382D69 * (v20 ^ v15)))) >> 47))));
      return 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * (v40 ^ (v41 >> 47) ^ v41)) ^ ((0x9DDFEA08EB382D69 * (v40 ^ (v41 >> 47) ^ v41)) >> 47));
    }
    else
    {
      return sub_20DB6FBE0(a2, a3);
    }
  }
  else if (a3 > 0x10)
  {
    return sub_20DB6FB34(a2, a3);
  }
  else
  {
    return sub_20DB6FA3C(a2, a3);
  }
}

unint64_t sub_20DB6FA3C(_DWORD *a1, unint64_t a2)
{
  if (a2 < 9)
  {
    if (a2 < 4)
    {
      unint64_t result = 0x9AE16A3B2F90404FLL;
      if (a2)
      {
        unint64_t v8 = (0xC949D7C7509E6557 * (a2 + 4 * *((unsigned __int8 *)a1 + a2 - 1))) ^ (0x9AE16A3B2F90404FLL
                                                                                      * (*(unsigned __int8 *)a1 | ((unint64_t)*((unsigned __int8 *)a1 + (a2 >> 1)) << 8)));
        return 0x9AE16A3B2F90404FLL * (v8 ^ (v8 >> 47));
      }
    }
    else
    {
      uint64_t v6 = *(unsigned int *)((char *)a1 + a2 - 4);
      unint64_t v7 = 0x9DDFEA08EB382D69 * (((8 * *a1) + a2) ^ v6);
      return 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * (v6 ^ (v7 >> 47) ^ v7)) ^ ((0x9DDFEA08EB382D69 * (v6 ^ (v7 >> 47) ^ v7)) >> 47));
    }
  }
  else
  {
    uint64_t v3 = *(void *)((char *)a1 + a2 - 8);
    uint64_t v4 = __ROR8__(v3 + a2, a2);
    return (0x9DDFEA08EB382D69
          * ((0x9DDFEA08EB382D69
            * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *(void *)a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *(void *)a1)))) ^ ((0x9DDFEA08EB382D69 * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *(void *)a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *(void *)a1)))) >> 47))) ^ v3;
  }
  return result;
}

unint64_t sub_20DB6FB34(void *a1, uint64_t a2)
{
  uint64_t v2 = a1[1];
  unint64_t v3 = 0xB492B66FBE98F273 * *a1;
  uint64_t v4 = __ROR8__(0x9AE16A3B2F90404FLL * *(void *)((char *)a1 + a2 - 8), 30) + __ROR8__(v3 - v2, 43);
  unint64_t v5 = v3 + a2 + __ROR8__(v2 ^ 0xC949D7C7509E6557, 20) - 0x9AE16A3B2F90404FLL * *(void *)((char *)a1 + a2 - 8);
  unint64_t v6 = 0x9DDFEA08EB382D69 * (v5 ^ (v4 - 0x3C5A37A36834CED9 * *(void *)((char *)a1 + a2 - 16)));
  return 0x9DDFEA08EB382D69
       * ((0x9DDFEA08EB382D69 * (v5 ^ (v6 >> 47) ^ v6)) ^ ((0x9DDFEA08EB382D69 * (v5 ^ (v6 >> 47) ^ v6)) >> 47));
}

unint64_t sub_20DB6FBE0(void *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)((char *)a1 + a2 - 16);
  uint64_t v3 = *a1 - 0x3C5A37A36834CED9 * (v2 + a2);
  uint64_t v5 = a1[2];
  uint64_t v4 = a1[3];
  uint64_t v6 = __ROR8__(v3 + v4, 52);
  uint64_t v7 = v3 + a1[1];
  uint64_t v8 = __ROR8__(v7, 7);
  uint64_t v9 = v7 + v5;
  uint64_t v10 = *(void *)((char *)a1 + a2 - 32) + v5;
  uint64_t v11 = v8 + __ROR8__(*a1 - 0x3C5A37A36834CED9 * (v2 + a2), 37) + v6 + __ROR8__(v9, 31);
  uint64_t v12 = *(void *)((char *)a1 + a2 - 24) + v10 + v2;
  unint64_t v13 = 0xC3A5C85C97CB3127 * (v12 + *(void *)((char *)a1 + a2 - 8) + v4 + v11)
      - 0x651E95C4D06FBFB1
      * (v9
       + v4
       + __ROR8__(v10, 37)
       + __ROR8__(*(void *)((char *)a1 + a2 - 24) + v10, 7)
       + __ROR8__(*(void *)((char *)a1 + a2 - 8) + v4 + v10, 52)
       + __ROR8__(v12, 31));
  return 0x9AE16A3B2F90404FLL
       * ((v11 - 0x3C5A37A36834CED9 * (v13 ^ (v13 >> 47))) ^ ((v11 - 0x3C5A37A36834CED9 * (v13 ^ (v13 >> 47))) >> 47));
}

unint64_t sub_20DB6FCA0(uint64_t a1, uint64_t a2)
{
  switch(*(_DWORD *)a2)
  {
    case 1:
      unint64_t i = *(unsigned __int8 *)(a2 + 8);
      break;
    case 2:
      unint64_t i = *(void *)(a2 + 8);
      break;
    case 3:
      unint64_t i = sub_20DB6F7F4((uint64_t)&v6, a2 + 8);
      break;
    case 4:
      uint64_t v3 = *(void *)(a2 + 8);
      uint64_t v4 = *(void *)(a2 + 16);
      for (unint64_t i = 0xAAAAAAAAAAAAAAABLL * ((v4 - v3) >> 3); v3 != v4; v3 += 24)
        i ^= (i << 6) + (i >> 2) + sub_20DB6F7F4((uint64_t)&v7, v3) + 2654435769u;
      break;
    default:
      unint64_t i = 0xD7C06285B9DE677ALL;
      break;
  }
  return i;
}

void **sub_20DB6FD98(uint64_t *a1, long long *a2)
{
  unint64_t v6 = a1[2];
  unint64_t result = (void **)(a1 + 2);
  unint64_t v5 = v6;
  char v7 = *(result - 1);
  if ((unint64_t)v7 >= v6)
  {
    uint64_t v10 = ((uint64_t)v7 - *a1) >> 4;
    unint64_t v11 = v10 + 1;
    if ((unint64_t)(v10 + 1) >> 60) {
      sub_20DB5E168();
    }
    uint64_t v12 = v5 - *a1;
    if (v12 >> 3 > v11) {
      unint64_t v11 = v12 >> 3;
    }
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v13 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v13 = v11;
    }
    v18[4] = result;
    unint64_t v14 = (char *)sub_20DB5E55C((uint64_t)result, v13);
    uint64_t v15 = &v14[16 * v10];
    v18[0] = v14;
    v18[1] = v15;
    v18[3] = &v14[16 * v16];
    long long v17 = *a2;
    *(_OWORD *)uint64_t v15 = *a2;
    if (*((void *)&v17 + 1)) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v17 + 1) + 8), 1uLL, memory_order_relaxed);
    }
    v18[2] = v15 + 16;
    sub_20DB70084(a1, v18);
    uint64_t v9 = (void *)a1[1];
    unint64_t result = sub_20DB7020C(v18);
  }
  else
  {
    *char v7 = *(void *)a2;
    uint64_t v8 = *((void *)a2 + 1);
    v7[1] = v8;
    if (v8) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v8 + 8), 1uLL, memory_order_relaxed);
    }
    uint64_t v9 = v7 + 2;
    a1[1] = (uint64_t)(v7 + 2);
  }
  a1[1] = (uint64_t)v9;
  return result;
}

void sub_20DB6FEA0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_20DB7020C((void **)va);
  _Unwind_Resume(a1);
}

__n128 sub_20DB6FEB4(uint64_t a1, int *a2)
{
  int v4 = *(_DWORD *)(a1 + 32);
  if (v4 == 4)
  {
    uint64_t v9 = (void **)(a1 + 40);
    sub_20DB7ABD8(&v9);
  }
  else if (v4 == 3 && *(char *)(a1 + 63) < 0)
  {
    operator delete(*(void **)(a1 + 40));
  }
  int v6 = *a2;
  *(_DWORD *)(a1 + 32) = *a2;
  int v7 = v6 - 1;
  uint64_t v8 = (unsigned char *)(a1 + 40);
  switch(v7)
  {
    case 0:
      *uint64_t v8 = *((unsigned char *)a2 + 8);
      break;
    case 1:
      *(void *)uint64_t v8 = *((void *)a2 + 1);
      break;
    case 2:
      __n128 result = *(__n128 *)(a2 + 2);
      *(void *)(a1 + 56) = *((void *)a2 + 3);
      *(__n128 *)uint64_t v8 = result;
      *((void *)a2 + 2) = 0;
      *((void *)a2 + 3) = 0;
      *((void *)a2 + 1) = 0;
      break;
    case 3:
      *(void *)uint64_t v8 = 0;
      *(void *)(a1 + 48) = 0;
      *(void *)(a1 + 56) = 0;
      __n128 result = *(__n128 *)(a2 + 2);
      *(__n128 *)(a1 + 40) = result;
      *(void *)(a1 + 56) = *((void *)a2 + 3);
      *((void *)a2 + 1) = 0;
      *((void *)a2 + 2) = 0;
      *((void *)a2 + 3) = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_20DB6FFB4(uint64_t a1)
{
  if (*(_DWORD *)a1 == 4)
  {
    uint64_t v3 = (void **)(a1 + 8);
    sub_20DB7ABD8(&v3);
  }
  else if (*(_DWORD *)a1 == 3 && *(char *)(a1 + 31) < 0)
  {
    operator delete(*(void **)(a1 + 8));
  }
  return a1;
}

long long *sub_20DB70018(uint64_t a1, long long *a2, long long *a3, uint64_t a4)
{
  unint64_t v5 = a2;
  if (a2 != a3)
  {
    do
    {
      long long v7 = *v5;
      *(void *)unint64_t v5 = 0;
      *((void *)v5 + 1) = 0;
      uint64_t v8 = *(std::__shared_weak_count **)(a4 + 8);
      *(_OWORD *)a4 = v7;
      if (v8) {
        sub_20DB5E6A0(v8);
      }
      ++v5;
      a4 += 16;
    }
    while (v5 != a3);
    return a3;
  }
  return v5;
}

uint64_t sub_20DB70084(uint64_t *a1, void *a2)
{
  uint64_t result = sub_20DB700FC((uint64_t)(a1 + 2), a1[1], (void *)a1[1], *a1, (void *)*a1, a2[1], a2[1]);
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

uint64_t sub_20DB700FC(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7)
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
    uint64_t v8 = (_OWORD *)(a7 - 16);
    do
    {
      long long v9 = *((_OWORD *)a3 - 1);
      a3 -= 2;
      *uint64_t v8 = v9;
      *a3 = 0;
      a3[1] = 0;
      *((void *)&v15 + 1) = v8;
      v7 -= 16;
      --v8;
    }
    while (a3 != a5);
    uint64_t v10 = v15;
  }
  char v13 = 1;
  sub_20DB70190((uint64_t)v12);
  return v10;
}

uint64_t sub_20DB70190(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    sub_20DB701C8(a1);
  }
  return a1;
}

void sub_20DB701C8(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 16) + 8);
  uint64_t v2 = *(void *)(*(void *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    uint64_t v3 = *(std::__shared_weak_count **)(v1 + 8);
    if (v3) {
      sub_20DB5E6A0(v3);
    }
    v1 += 16;
  }
}

void **sub_20DB7020C(void **a1)
{
  if (*a1) {
    operator delete(*a1);
  }
  return a1;
}

void sub_20DB70240(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v1 = *(void *)(a1 + 16);
  while (v1 != v2)
  {
    *(void *)(a1 + 16) = v1 - 16;
    int v4 = *(std::__shared_weak_count **)(v1 - 8);
    if (v4)
    {
      sub_20DB5E6A0(v4);
      uint64_t v1 = *(void *)(a1 + 16);
    }
    else
    {
      v1 -= 16;
    }
  }
}

void sub_20DB70294(uint64_t a1, std::string *__str, long long *a3, unint64_t a4)
{
  uint64_t v8 = a1 + 16;
  long long v9 = *(std::string **)a1;
  if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a1 + 16) - *(void *)a1) >> 3) < a4)
  {
    sub_20DB7040C((uint64_t *)a1);
    if (a4 > 0xAAAAAAAAAAAAAAALL) {
      sub_20DB5E168();
    }
    unint64_t v10 = 0x5555555555555556 * ((uint64_t)(*(void *)(a1 + 16) - *(void *)a1) >> 3);
    if (v10 <= a4) {
      unint64_t v10 = a4;
    }
    if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a1 + 16) - *(void *)a1) >> 3) >= 0x555555555555555) {
      unint64_t v11 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v11 = v10;
    }
    sub_20DB6225C((void *)a1, v11);
    uint64_t v12 = sub_20DB70448(v8, (long long *)__str, a3, *(char **)(a1 + 8));
    goto LABEL_11;
  }
  if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a1 + 8) - (void)v9) >> 3) < a4)
  {
    char v13 = (std::string *)((char *)__str + 8 * ((uint64_t)(*(void *)(a1 + 8) - (void)v9) >> 3));
    sub_20DB70588(__str, v13, v9);
    uint64_t v12 = sub_20DB70448(v8, (long long *)v13, a3, *(char **)(a1 + 8));
LABEL_11:
    *(void *)(a1 + 8) = v12;
    return;
  }
  sub_20DB70588(__str, (std::string *)a3, v9);
  uint64_t v15 = v14;
  uint64_t v16 = *(void *)(a1 + 8);
  if (v16 != v14)
  {
    do
    {
      if (*(char *)(v16 - 1) < 0) {
        operator delete(*(void **)(v16 - 24));
      }
      v16 -= 24;
    }
    while (v16 != v15);
  }
  *(void *)(a1 + 8) = v15;
}

void sub_20DB703FC(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void sub_20DB70404(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void sub_20DB7040C(uint64_t *a1)
{
  if (*a1)
  {
    sub_20DB705E8(a1);
    operator delete((void *)*a1);
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
  }
}

char *sub_20DB70448(uint64_t a1, long long *a2, long long *a3, char *__dst)
{
  int v4 = __dst;
  unint64_t v11 = __dst;
  uint64_t v12 = __dst;
  v9[0] = a1;
  v9[1] = &v11;
  v9[2] = &v12;
  char v10 = 0;
  if (a2 != a3)
  {
    uint64_t v6 = a2;
    do
    {
      if (*((char *)v6 + 23) < 0)
      {
        sub_20DB66FF4(v4, *(void **)v6, *((void *)v6 + 1));
        int v4 = v12;
      }
      else
      {
        long long v7 = *v6;
        *((void *)v4 + 2) = *((void *)v6 + 2);
        *(_OWORD *)int v4 = v7;
      }
      uint64_t v6 = (long long *)((char *)v6 + 24);
      v4 += 24;
      uint64_t v12 = v4;
    }
    while (v6 != a3);
  }
  char v10 = 1;
  sub_20DB70508((uint64_t)v9);
  return v4;
}

void sub_20DB704F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t sub_20DB70508(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    sub_20DB70540(a1);
  }
  return a1;
}

void sub_20DB70540(uint64_t a1)
{
  uint64_t v1 = **(void **)(a1 + 16);
  uint64_t v2 = **(void **)(a1 + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 - 1) < 0) {
      operator delete(*(void **)(v1 - 24));
    }
    v1 -= 24;
  }
}

std::string *sub_20DB70588(std::string *__str, std::string *a2, std::string *this)
{
  int v4 = __str;
  if (__str != a2)
  {
    do
      std::string::operator=(this++, v4++);
    while (v4 != a2);
    return a2;
  }
  return (std::string *)v4;
}

void sub_20DB705E8(uint64_t *a1)
{
  uint64_t v2 = *a1;
  for (uint64_t i = a1[1]; i != v2; i -= 24)
  {
    if (*(char *)(i - 1) < 0) {
      operator delete(*(void **)(i - 24));
    }
  }
  a1[1] = v2;
}

std::string *sub_20DB70638(uint64_t *a1, std::string *a2, std::string *a3, long long *a4, uint64_t a5)
{
  uint64_t v5 = a2;
  if (a5 >= 1)
  {
    uint64_t v11 = a1[2];
    uint64_t v9 = (uint64_t)(a1 + 2);
    uint64_t v10 = v11;
    unint64_t v12 = *(void *)(v9 - 8);
    if ((uint64_t)(0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v11 - v12) >> 3)) >= a5)
    {
      uint64_t v20 = v12 - (void)a2;
      if ((uint64_t)(0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v12 - (void)a2) >> 3)) >= a5)
      {
        uint64_t v21 = (long long *)&a3[a5];
      }
      else
      {
        uint64_t v21 = (long long *)(&a3->__r_.__value_.__l.__data_ + ((uint64_t)(v12 - (void)a2) >> 3));
        a1[1] = (uint64_t)sub_20DB709B4(v9, v21, a4, *(char **)(v9 - 8));
        if (v20 < 1) {
          return v5;
        }
      }
      sub_20DB707FC((uint64_t)a1, (uint64_t)v5, v12, (uint64_t)&v5[a5]);
      sub_20DB70588(a3, (std::string *)v21, v5);
    }
    else
    {
      uint64_t v13 = *a1;
      unint64_t v14 = a5 - 0x5555555555555555 * ((uint64_t)(v12 - *a1) >> 3);
      if (v14 > 0xAAAAAAAAAAAAAAALL) {
        sub_20DB5E168();
      }
      unint64_t v15 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)a2 - v13) >> 3);
      unint64_t v16 = 0xAAAAAAAAAAAAAAABLL * ((v10 - v13) >> 3);
      uint64_t v17 = 2 * v16;
      if (2 * v16 <= v14) {
        uint64_t v17 = v14;
      }
      if (v16 >= 0x555555555555555) {
        unint64_t v18 = 0xAAAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v18 = v17;
      }
      uint64_t v27 = v9;
      if (v18) {
        uint64_t v19 = (char *)sub_20DB622B0(v9, v18);
      }
      else {
        uint64_t v19 = 0;
      }
      uint64_t v23 = v19;
      unint64_t v24 = &v19[24 * v15];
      uint64_t v25 = v24;
      uint64_t v26 = &v19[24 * v18];
      sub_20DB7086C(&v23, (long long *)a3, a5);
      uint64_t v5 = (std::string *)sub_20DB70900((uint64_t)a1, &v23, (long long *)v5);
      sub_20DB6722C((uint64_t)&v23);
    }
  }
  return v5;
}

void sub_20DB707DC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  *(void *)(v10 + 8) = v11;
  _Unwind_Resume(exception_object);
}

uint64_t sub_20DB707FC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a1 + 8);
  unint64_t v7 = a2 + v6 - a4;
  uint64_t v8 = v6;
  if (v7 < a3)
  {
    unint64_t v9 = v7;
    uint64_t v8 = *(void *)(a1 + 8);
    do
    {
      long long v10 = *(_OWORD *)v9;
      *(void *)(v8 + 16) = *(void *)(v9 + 16);
      *(_OWORD *)uint64_t v8 = v10;
      v8 += 24;
      *(void *)(v9 + 8) = 0;
      *(void *)(v9 + 16) = 0;
      *(void *)unint64_t v9 = 0;
      v9 += 24;
    }
    while (v9 < a3);
  }
  *(void *)(a1 + 8) = v8;
  return sub_20DB70A74((uint64_t)&v12, a2, v7, v6);
}

void *sub_20DB7086C(void *result, long long *a2, uint64_t a3)
{
  uint64_t v3 = result;
  uint64_t v4 = result[2];
  if (a3)
  {
    uint64_t v6 = v4 + 24 * a3;
    uint64_t v7 = 24 * a3;
    do
    {
      if (*((char *)a2 + 23) < 0)
      {
        uint64_t result = sub_20DB66FF4((unsigned char *)v4, *(void **)a2, *((void *)a2 + 1));
      }
      else
      {
        long long v8 = *a2;
        *(void *)(v4 + 16) = *((void *)a2 + 2);
        *(_OWORD *)uint64_t v4 = v8;
      }
      v4 += 24;
      a2 = (long long *)((char *)a2 + 24);
      v7 -= 24;
    }
    while (v7);
    uint64_t v4 = v6;
  }
  _OWORD v3[2] = v4;
  return result;
}

void sub_20DB708F8(_Unwind_Exception *a1)
{
  *(void *)(v1 + 16) = v2;
  _Unwind_Resume(a1);
}

uint64_t sub_20DB70900(uint64_t a1, void *a2, long long *a3)
{
  uint64_t v6 = a2[1];
  uint64_t v7 = a1 + 16;
  sub_20DB6710C(a1 + 16, (uint64_t)a3, (uint64_t)a3, *(void *)a1, *(void *)a1, v6, v6);
  a2[1] = v8;
  a2[2] = sub_20DB70AFC(v7, a3, *(long long **)(a1 + 8), a2[2]);
  uint64_t v9 = *(void *)a1;
  *(void *)a1 = a2[1];
  a2[1] = v9;
  uint64_t v10 = *(void *)(a1 + 8);
  *(void *)(a1 + 8) = a2[2];
  a2[2] = v10;
  uint64_t v11 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = a2[3];
  a2[3] = v11;
  *a2 = a2[1];
  return v6;
}

char *sub_20DB709B4(uint64_t a1, long long *a2, long long *a3, char *__dst)
{
  uint64_t v4 = __dst;
  uint64_t v11 = __dst;
  char v12 = __dst;
  v9[0] = a1;
  v9[1] = &v11;
  v9[2] = &v12;
  char v10 = 0;
  if (a2 != a3)
  {
    uint64_t v6 = a2;
    do
    {
      if (*((char *)v6 + 23) < 0)
      {
        sub_20DB66FF4(v4, *(void **)v6, *((void *)v6 + 1));
        uint64_t v4 = v12;
      }
      else
      {
        long long v7 = *v6;
        *((void *)v4 + 2) = *((void *)v6 + 2);
        *(_OWORD *)uint64_t v4 = v7;
      }
      uint64_t v6 = (long long *)((char *)v6 + 24);
      v4 += 24;
      char v12 = v4;
    }
    while (v6 != a3);
  }
  char v10 = 1;
  sub_20DB70508((uint64_t)v9);
  return v4;
}

void sub_20DB70A60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t sub_20DB70A74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a3 != a2)
  {
    uint64_t v6 = a3;
    do
    {
      uint64_t v7 = a4 - 24;
      if (*(char *)(a4 - 1) < 0) {
        operator delete(*(void **)v7);
      }
      long long v8 = *(_OWORD *)(v6 - 24);
      *(void *)(v7 + 16) = *(void *)(v6 - 8);
      *(_OWORD *)uint64_t v7 = v8;
      *(unsigned char *)(v6 - 1) = 0;
      *(unsigned char *)(v6 - 24) = 0;
      a4 = v7;
      v6 -= 24;
    }
    while (v6 != a2);
  }
  return a3;
}

uint64_t sub_20DB70AFC(uint64_t a1, long long *a2, long long *a3, uint64_t a4)
{
  uint64_t v4 = a4;
  uint64_t v10 = a4;
  uint64_t v9 = a4;
  v7[0] = a1;
  v7[1] = &v9;
  v7[2] = &v10;
  if (a2 != a3)
  {
    do
    {
      long long v5 = *a2;
      *(void *)(v4 + 16) = *((void *)a2 + 2);
      *(_OWORD *)uint64_t v4 = v5;
      v4 += 24;
      *((void *)a2 + 1) = 0;
      *((void *)a2 + 2) = 0;
      *(void *)a2 = 0;
      a2 = (long long *)((char *)a2 + 24);
    }
    while (a2 != a3);
    uint64_t v10 = v4;
  }
  char v8 = 1;
  sub_20DB70508((uint64_t)v7);
  return v4;
}

BOOL sub_20DB70B7C(uint64_t *a1, uint64_t a2)
{
  if (!*(void *)a2) {
    return 0;
  }
  uint64_t v3 = *a1;
  uint64_t v4 = __dynamic_cast(*(const void **)a2, (const struct __class_type_info *)&unk_26C2443C0, (const struct __class_type_info *)&unk_26C2442D0, 0);
  if (!v4) {
    return 0;
  }
  long long v5 = *(std::__shared_weak_count **)(a2 + 8);
  if (v5) {
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v6 = (*(uint64_t (**)(void *))(*(void *)v4 + 24))(v4);
  uint64_t v7 = *(unsigned __int8 *)(v3 + 31);
  if ((v7 & 0x80u) == 0) {
    uint64_t v8 = *(unsigned __int8 *)(v3 + 31);
  }
  else {
    uint64_t v8 = *(void *)(v3 + 16);
  }
  uint64_t v9 = *(unsigned __int8 *)(v6 + 23);
  int v10 = (char)v9;
  if ((v9 & 0x80u) != 0) {
    uint64_t v9 = *(void *)(v6 + 8);
  }
  if (v8 != v9)
  {
    BOOL v20 = 0;
    if (!v5) {
      return v20;
    }
    goto LABEL_28;
  }
  uint64_t v11 = (const void **)(v3 + 8);
  if (v10 >= 0) {
    char v12 = (unsigned __int8 *)v6;
  }
  else {
    char v12 = *(unsigned __int8 **)v6;
  }
  if ((v7 & 0x80) != 0)
  {
    BOOL v20 = memcmp(*v11, v12, *(void *)(v3 + 16)) == 0;
  }
  else
  {
    if (!*(unsigned char *)(v3 + 31))
    {
      BOOL v20 = 1;
      if (!v5) {
        return v20;
      }
      goto LABEL_28;
    }
    uint64_t v13 = v7 - 1;
    do
    {
      int v15 = *(unsigned __int8 *)v11;
      uint64_t v11 = (const void **)((char *)v11 + 1);
      int v14 = v15;
      int v17 = *v12++;
      int v16 = v17;
      BOOL v19 = v13-- != 0;
      BOOL v20 = v14 == v16;
    }
    while (v14 == v16 && v19);
  }
  if (v5) {
LABEL_28:
  }
    sub_20DB5E6A0(v5);
  return v20;
}

void sub_20DB70CD8(_Unwind_Exception *exception_object)
{
  if (v1) {
    sub_20DB5E6A0(v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_20DB70CF0(uint64_t *a1, void *a2)
{
  uint64_t result = sub_20DB70DB0((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
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

void *sub_20DB70D68(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x222222222222223) {
    sub_20DB5DB74();
  }
  return operator new(120 * a2);
}

uint64_t sub_20DB70DB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v15 = a6;
  *((void *)&v15 + 1) = a7;
  long long v14 = v15;
  v12[0] = a1;
  v12[1] = &v14;
  v12[2] = &v15;
  char v13 = 0;
  if (a3 == a5)
  {
    uint64_t v10 = a6;
  }
  else
  {
    uint64_t v9 = a3;
    do
    {
      v9 -= 120;
      sub_20DB6ECC8(v7 - 120, v9);
      uint64_t v7 = *((void *)&v15 + 1) - 120;
      *((void *)&v15 + 1) -= 120;
    }
    while (v9 != a5);
    uint64_t v10 = v15;
  }
  char v13 = 1;
  sub_20DB70E58((uint64_t)v12);
  return v10;
}

uint64_t sub_20DB70E58(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    sub_20DB70E90((uint64_t *)a1);
  }
  return a1;
}

void sub_20DB70E90(uint64_t *a1)
{
  uint64_t v1 = *(void *)(a1[2] + 8);
  uint64_t v2 = *(void *)(a1[1] + 8);
  if (v1 != v2)
  {
    uint64_t v3 = *a1;
    do
    {
      sub_20DB70EE4(v3, v1);
      v1 += 120;
    }
    while (v1 != v2);
  }
}

void sub_20DB70EE4(uint64_t a1, uint64_t a2)
{
  if (*(char *)(a2 + 111) < 0) {
    operator delete(*(void **)(a2 + 88));
  }
  if (*(char *)(a2 + 87) < 0) {
    operator delete(*(void **)(a2 + 64));
  }
  *(void *)a2 = &unk_26C2447D0;
  int v3 = *(_DWORD *)(a2 + 32);
  if (v3 == 4)
  {
    uint64_t v4 = (void **)(a2 + 40);
    sub_20DB7ABD8(&v4);
  }
  else if (v3 == 3 && *(char *)(a2 + 63) < 0)
  {
    operator delete(*(void **)(a2 + 40));
  }
  if (*(char *)(a2 + 31) < 0) {
    operator delete(*(void **)(a2 + 8));
  }
}

void **sub_20DB70F90(void **a1)
{
  if (*a1) {
    operator delete(*a1);
  }
  return a1;
}

void sub_20DB70FC4(void *a1)
{
  uint64_t v2 = a1[1];
  for (uint64_t i = a1[2]; i != v2; uint64_t i = a1[2])
  {
    uint64_t v4 = a1[4];
    a1[2] = i - 120;
    sub_20DB70EE4(v4, i - 120);
  }
}

uint64_t sub_20DB7100C(uint64_t a1, long long *a2, long long *a3, int a4, uint64_t a5)
{
  if (*((char *)a3 + 23) < 0) {
    uint64_t v10 = *((void *)a3 + 1);
  }
  else {
    uint64_t v10 = *((unsigned __int8 *)a3 + 23);
  }
  if (v10) {
    uint64_t v11 = a3;
  }
  else {
    uint64_t v11 = a2;
  }
  if (*((char *)v11 + 23) < 0)
  {
    sub_20DB66FF4(__dst, *(void **)v11, *((void *)v11 + 1));
  }
  else
  {
    *(_OWORD *)__dst = *v11;
    uint64_t v22 = *((void *)v11 + 2);
  }
  int v18 = *(_DWORD *)a5;
  switch(v18)
  {
    case 1:
      LOBYTE(__p[0]) = *(unsigned char *)(a5 + 8);
      break;
    case 2:
      __p[0] = *(void **)(a5 + 8);
      break;
    case 3:
      *(_OWORD *)std::string __p = *(_OWORD *)(a5 + 8);
      uint64_t v20 = *(void *)(a5 + 24);
      goto LABEL_15;
    case 4:
      *(_OWORD *)std::string __p = *(_OWORD *)(a5 + 8);
      uint64_t v20 = *(void *)(a5 + 24);
LABEL_15:
      *(void *)(a5 + 16) = 0;
      *(void *)(a5 + 24) = 0;
      *(void *)(a5 + 8) = 0;
      break;
    default:
      break;
  }
  sub_20DB71280(a1, (__n128 *)__dst, &v18);
  if (v18 == 4)
  {
    long long v15 = __p;
    sub_20DB7ABD8(&v15);
  }
  else if (v18 == 3 && SHIBYTE(v20) < 0)
  {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v22) < 0) {
    operator delete(__dst[0]);
  }
  *(void *)a1 = &unk_26C2449E8;
  long long v12 = *a2;
  *(void *)(a1 + 80) = *((void *)a2 + 2);
  *(_OWORD *)(a1 + 64) = v12;
  *((void *)a2 + 1) = 0;
  *((void *)a2 + 2) = 0;
  *(void *)a2 = 0;
  long long v13 = *a3;
  *(void *)(a1 + 104) = *((void *)a3 + 2);
  *(_OWORD *)(a1 + 88) = v13;
  *((void *)a3 + 1) = 0;
  *((void *)a3 + 2) = 0;
  *(void *)a3 = 0;
  *(_DWORD *)(a1 + 112) = a4;
  if (a4)
  {
    if (*(_DWORD *)a5 == 1)
    {
      sub_20DB5D878((int *)a5, 1u);
      if (!*(unsigned char *)(a5 + 8))
      {
        LODWORD(v15) = 0;
        sub_20DB6FEB4(a1, (int *)&v15);
        if (v15 == 4)
        {
          uint64_t v23 = &v16;
          sub_20DB7ABD8(&v23);
        }
        else if (v15 == 3 && v17 < 0)
        {
          operator delete(v16);
        }
      }
    }
  }
  return a1;
}

void sub_20DB7123C(_Unwind_Exception *a1)
{
  if (*(char *)(v1 + 111) < 0) {
    operator delete(*v3);
  }
  if (*(char *)(v1 + 87) < 0) {
    operator delete(*v2);
  }
  sub_20DB71354(v1);
  _Unwind_Resume(a1);
}

__n128 sub_20DB71280(uint64_t a1, __n128 *a2, int *a3)
{
  *(void *)a1 = &unk_26C2447D0;
  __n128 result = *a2;
  *(void *)(a1 + 24) = a2[1].n128_u64[0];
  *(__n128 *)(a1 + 8) = result;
  a2->n128_u64[1] = 0;
  a2[1].n128_u64[0] = 0;
  a2->n128_u64[0] = 0;
  int v4 = *a3;
  *(_DWORD *)(a1 + 32) = *a3;
  int v5 = v4 - 1;
  uint64_t v6 = (unsigned char *)(a1 + 40);
  switch(v5)
  {
    case 0:
      unsigned char *v6 = *((unsigned char *)a3 + 8);
      break;
    case 1:
      *(void *)uint64_t v6 = *((void *)a3 + 1);
      break;
    case 2:
      __n128 result = *(__n128 *)(a3 + 2);
      *(void *)(a1 + 56) = *((void *)a3 + 3);
      *(__n128 *)uint64_t v6 = result;
      *((void *)a3 + 2) = 0;
      *((void *)a3 + 3) = 0;
      *((void *)a3 + 1) = 0;
      break;
    case 3:
      *(void *)uint64_t v6 = 0;
      *(void *)(a1 + 48) = 0;
      *(void *)(a1 + 56) = 0;
      __n128 result = *(__n128 *)(a3 + 2);
      *(__n128 *)(a1 + 40) = result;
      *(void *)(a1 + 56) = *((void *)a3 + 3);
      *((void *)a3 + 1) = 0;
      *((void *)a3 + 2) = 0;
      *((void *)a3 + 3) = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_20DB71354(uint64_t a1)
{
  *(void *)a1 = &unk_26C2447D0;
  int v2 = *(_DWORD *)(a1 + 32);
  if (v2 == 4)
  {
    int v4 = (void **)(a1 + 40);
    sub_20DB7ABD8(&v4);
  }
  else if (v2 == 3 && *(char *)(a1 + 63) < 0)
  {
    operator delete(*(void **)(a1 + 40));
  }
  if (*(char *)(a1 + 31) < 0) {
    operator delete(*(void **)(a1 + 8));
  }
  return a1;
}

void sub_20DB713E4(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26772BF88, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26772BF88))
  {
    sub_20DB6B684((const std::locale *)&unk_26772BF48, "(?:\\s*)([\\[\\]\\(\\)\\|]|\\.\\.\\.)", 0);
  }
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26772BFD0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26772BFD0))
  {
    sub_20DB6B684((const std::locale *)&unk_26772BF90, "(?:\\s*)(\\S*<.*?>|[^<>\\s]+)", 0);
  }
  unint64_t v24 = 0;
  uint64_t v25 = 0;
  uint64_t v26 = 0;
  uint64_t v4 = *(unsigned __int8 *)(a1 + 23);
  if ((v4 & 0x80u) == 0) {
    uint64_t v5 = a1;
  }
  else {
    uint64_t v5 = *(void *)a1;
  }
  if ((v4 & 0x80u) != 0) {
    uint64_t v4 = *(void *)(a1 + 8);
  }
  sub_20DB6B580((uint64_t)v21, v5, v5 + v4, (uint64_t)&unk_26772BF48, 0);
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  char v15 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  char v18 = 0;
  char v19 = 0;
  uint64_t v20 = 0;
  *(_OWORD *)std::string __p = 0u;
  memset(v12, 0, sizeof(v12));
  memset(v9, 0, sizeof(v9));
  int v10 = 0;
  sub_20DB71B34((uint64_t)v21, (uint64_t)v9, (uint64_t *)&v24);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if (v22)
  {
    uint64_t v23 = v22;
    operator delete(v22);
  }
  long long v7 = 0uLL;
  uint64_t v8 = 0;
  sub_20DB7AB50((char *)&v7, v24, v25, 0xAAAAAAAAAAAAAAABLL * (((char *)v25 - (char *)v24) >> 3));
  *(_OWORD *)a2 = v7;
  uint64_t v6 = v8;
  uint64_t v8 = 0;
  long long v7 = 0uLL;
  *(void *)(a2 + 16) = v6;
  *(void *)(a2 + 24) = 0;
  *(unsigned char *)(a2 + 32) = 0;
  uint64_t v27 = (long long **)&v7;
  sub_20DB7ABD8((void ***)&v27);
  uint64_t v27 = &v24;
  sub_20DB7ABD8((void ***)&v27);
}

void sub_20DB715EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,void *a35,uint64_t a36)
{
}

void sub_20DB71654(void *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  v38[1] = *MEMORY[0x263EF8340];
  sub_20DB72020(a1, a2, (uint64_t *)&v31);
  uint64_t v6 = sub_20DB72C94(a1);
  int v7 = *((char *)v6 + 23);
  if (v7 < 0)
  {
    if (v6[1] != 1)
    {
LABEL_8:
      *(_OWORD *)a3 = v31;
      *(void *)(a3 + 16) = v32;
      uint64_t v32 = 0;
      long long v31 = 0uLL;
      goto LABEL_40;
    }
    uint64_t v6 = (uint64_t *)*v6;
  }
  else if (v7 != 1)
  {
    goto LABEL_8;
  }
  if (*(unsigned char *)v6 != 124) {
    goto LABEL_8;
  }
  long long v29 = 0uLL;
  unint64_t v30 = 0;
  sub_20DB72D4C(&v31, &v37);
  uint64_t v8 = (uint64_t)(*((void *)&v29 + 1) - v29) >> 4;
  if ((unint64_t)(v8 + 1) >> 60) {
    sub_20DB5E168();
  }
  unint64_t v9 = (uint64_t)(v30 - v29) >> 3;
  if (v9 <= v8 + 1) {
    unint64_t v9 = v8 + 1;
  }
  if (v30 - (unint64_t)v29 >= 0x7FFFFFFFFFFFFFF0) {
    unint64_t v10 = 0xFFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v10 = v9;
  }
  uint64_t v36 = &v30;
  uint64_t v11 = (char *)sub_20DB5E55C((uint64_t)&v30, v10);
  long long v12 = (long long *)&v11[16 * v8];
  *(void *)&long long v33 = v11;
  *((void *)&v33 + 1) = v12;
  uint64_t v35 = &v11[16 * v13];
  *long long v12 = v37;
  uint64_t v34 = v12 + 1;
  sub_20DB749F0((uint64_t *)&v29, &v33);
  uint64_t v14 = *((void *)&v29 + 1);
  sub_20DB7020C((void **)&v33);
  for (*((void *)&v29 + 1) = v14; ; *((void *)&v29 + 1) = v18)
  {
    char v15 = sub_20DB72C94(a1);
    int v16 = *((char *)v15 + 23);
    if (v16 < 0)
    {
      if (v15[1] != 1) {
        break;
      }
      char v15 = (uint64_t *)*v15;
    }
    else if (v16 != 1)
    {
      break;
    }
    if (*(unsigned char *)v15 != 124) {
      break;
    }
    sub_20DB72DAC(a1, &__p);
    if (v28 < 0) {
      operator delete((void *)__p.n128_u64[0]);
    }
    sub_20DB72020(a1, a2, (uint64_t *)&v33);
    sub_20DB5E904((uint64_t *)&v31);
    long long v31 = v33;
    uint64_t v32 = v34;
    uint64_t v34 = 0;
    long long v33 = 0uLL;
    *(void *)&long long v37 = &v33;
    sub_20DB5E714((void ***)&v37);
    sub_20DB72D4C(&v31, &v37);
    uint64_t v17 = *((void *)&v29 + 1);
    if (*((void *)&v29 + 1) >= v30)
    {
      uint64_t v19 = (uint64_t)(*((void *)&v29 + 1) - v29) >> 4;
      if ((unint64_t)(v19 + 1) >> 60) {
        sub_20DB5E168();
      }
      unint64_t v20 = (uint64_t)(v30 - v29) >> 3;
      if (v20 <= v19 + 1) {
        unint64_t v20 = v19 + 1;
      }
      if (v30 - (unint64_t)v29 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v21 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v21 = v20;
      }
      uint64_t v36 = &v30;
      uint64_t v22 = (char *)sub_20DB5E55C((uint64_t)&v30, v21);
      uint64_t v23 = (long long *)&v22[16 * v19];
      *(void *)&long long v33 = v22;
      *((void *)&v33 + 1) = v23;
      uint64_t v35 = &v22[16 * v24];
      *uint64_t v23 = v37;
      long long v37 = 0uLL;
      uint64_t v34 = v23 + 1;
      sub_20DB749F0((uint64_t *)&v29, &v33);
      uint64_t v18 = *((void *)&v29 + 1);
      sub_20DB7020C((void **)&v33);
    }
    else
    {
      **((_OWORD **)&v29 + 1) = v37;
      uint64_t v18 = v17 + 16;
    }
  }
  uint64_t v25 = v29;
  if (*((void *)&v29 + 1) - (void)v29 == 16)
  {
    long long v37 = *(_OWORD *)v29;
    *(void *)long long v29 = 0;
    *(void *)(v25 + 8) = 0;
  }
  else
  {
    sub_20DB77710(&v29, &v33);
    long long v37 = v33;
  }
  *(void *)a3 = 0;
  *(void *)(a3 + 8) = 0;
  *(void *)(a3 + 16) = 0;
  *(void *)&long long v33 = a3;
  BYTE8(v33) = 0;
  uint64_t v26 = operator new(0x10uLL);
  *(void *)a3 = v26;
  *(void *)(a3 + 8) = v26;
  *(void *)(a3 + 16) = v26 + 2;
  *(void *)(a3 + 8) = sub_20DB5E594(a3 + 16, &v37, v38, v26);
  if (*((void *)&v37 + 1)) {
    sub_20DB5E6A0(*((std::__shared_weak_count **)&v37 + 1));
  }
  *(void *)&long long v33 = &v29;
  sub_20DB5E714((void ***)&v33);
LABEL_40:
  *(void *)&long long v33 = &v31;
  sub_20DB5E714((void ***)&v33);
}

void sub_20DB719D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void **a12, uint64_t a13, uint64_t a14, char a15)
{
  *(void *)(v15 - 112) = &a12;
  sub_20DB5E714((void ***)(v15 - 112));
  a12 = (void **)&a15;
  sub_20DB5E714(&a12);
  _Unwind_Resume(a1);
}

void sub_20DB71A7C(void *a1@<X0>, std::string *a2@<X8>)
{
  unint64_t v3 = a1[3];
  uint64_t v4 = (char *)a1[1];
  if (v3 >= 0xAAAAAAAAAAAAAAABLL * ((uint64_t)&v4[-*a1] >> 3))
  {
    a2->__r_.__value_.__r.__words[0] = 0;
    a2->__r_.__value_.__l.__size_ = 0;
    a2->__r_.__value_.__r.__words[2] = 0;
  }
  else
  {
    uint64_t v5 = (char *)(*a1 + 24 * v3);
    sub_20DB7AA9C(__p, " ");
    sub_20DB5D4E8(v5, v4, (uint64_t)__p, a2);
    if (v7 < 0) {
      operator delete(__p[0]);
    }
  }
}

void sub_20DB71B18(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t *sub_20DB71B34(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  unint64_t v3 = a3;
  char v7 = a3;
  if (!sub_20DB690A8(a1, a2))
  {
    do
    {
      sub_20DB71BA8(&v7, (uint64_t *)(a1 + 32));
      sub_20DB68EE4(a1);
    }
    while (!sub_20DB690A8(a1, a2));
    return v7;
  }
  return v3;
}

void sub_20DB71BA8(uint64_t **a1, uint64_t *a2)
{
  if (*((unsigned char *)a2 + 64))
  {
    sub_20DB6B580((uint64_t)v35, a2[6], a2[7], (uint64_t)&unk_26772BF90, 0);
    uint64_t v27 = 0;
    uint64_t v28 = 0;
    char v29 = 0;
    uint64_t v30 = 0;
    uint64_t v31 = 0;
    char v32 = 0;
    char v33 = 0;
    uint64_t v34 = 0;
    *(_OWORD *)__n128 __p = 0u;
    memset(v26, 0, sizeof(v26));
    memset(v23, 0, sizeof(v23));
    int v24 = 0;
    sub_20DB71E00((uint64_t)v35, (uint64_t)v23, *a1);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    if (v36)
    {
      long long v37 = v36;
      operator delete(v36);
    }
  }
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((a2[1] - *a2) >> 3);
  BOOL v5 = v4 > 1;
  if (v4 <= 1) {
    uint64_t v6 = a2;
  }
  else {
    uint64_t v6 = (uint64_t *)*a2;
  }
  if (v5) {
    uint64_t v7 = *a2 + 24;
  }
  else {
    uint64_t v7 = (uint64_t)(a2 + 3);
  }
  if (*(unsigned char *)(v7 + 16))
  {
    uint64_t v8 = *a1;
    sub_20DB65760(v21, (char *)v6[3], *(char **)(v7 + 8), *(void *)(v7 + 8) - v6[3]);
    unint64_t v9 = v8[1];
    unint64_t v10 = v8[2];
    if (v9 >= v10)
    {
      unint64_t v12 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v9 - *v8) >> 3);
      unint64_t v13 = v12 + 1;
      if (v12 + 1 > 0xAAAAAAAAAAAAAAALL) {
        sub_20DB5E168();
      }
      unint64_t v14 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v10 - *v8) >> 3);
      if (2 * v14 > v13) {
        unint64_t v13 = 2 * v14;
      }
      if (v14 >= 0x555555555555555) {
        unint64_t v15 = 0xAAAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v15 = v13;
      }
      v38[4] = v8 + 2;
      if (v15) {
        int v16 = (char *)sub_20DB622B0((uint64_t)(v8 + 2), v15);
      }
      else {
        int v16 = 0;
      }
      uint64_t v17 = &v16[24 * v12];
      v38[0] = v16;
      v38[1] = v17;
      v38[3] = &v16[24 * v15];
      long long v18 = *(_OWORD *)v21;
      *((void *)v17 + 2) = v22;
      *(_OWORD *)uint64_t v17 = v18;
      v21[1] = 0;
      uint64_t v22 = 0;
      v21[0] = 0;
      void v38[2] = v17 + 24;
      sub_20DB67094(v8, v38);
      uint64_t v19 = v8[1];
      sub_20DB6722C((uint64_t)v38);
      int v20 = SHIBYTE(v22);
      v8[1] = v19;
      if (v20 < 0) {
        operator delete(v21[0]);
      }
    }
    else
    {
      long long v11 = *(_OWORD *)v21;
      *(void *)(v9 + 16) = v22;
      *(_OWORD *)unint64_t v9 = v11;
      v8[1] = v9 + 24;
    }
  }
}

void sub_20DB71DB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38)
{
  sub_20DB6722C(v38 - 72);
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

uint64_t *sub_20DB71E00(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  unint64_t v3 = a3;
  uint64_t v7 = a3;
  if (!sub_20DB690A8(a1, a2))
  {
    do
    {
      sub_20DB71E74(&v7, (void *)(a1 + 32));
      sub_20DB68EE4(a1);
    }
    while (!sub_20DB690A8(a1, a2));
    return v7;
  }
  return v3;
}

void sub_20DB71E74(uint64_t **a1, void *a2)
{
  int v2 = *a1;
  unint64_t v3 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(a2[1] - *a2) >> 3);
  BOOL v4 = v3 > 1;
  if (v3 <= 1) {
    BOOL v5 = a2;
  }
  else {
    BOOL v5 = (void *)*a2;
  }
  if (v4) {
    uint64_t v6 = *a2 + 24;
  }
  else {
    uint64_t v6 = (uint64_t)(a2 + 3);
  }
  if (*(unsigned char *)(v6 + 16))
  {
    sub_20DB65760(__p, (char *)v5[3], *(char **)(v6 + 8), *(void *)(v6 + 8) - v5[3]);
  }
  else
  {
    __p[0] = 0;
    __p[1] = 0;
    uint64_t v20 = 0;
  }
  unint64_t v7 = v2[2];
  unint64_t v8 = v2[1];
  if (v8 >= v7)
  {
    unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v8 - *v2) >> 3);
    unint64_t v11 = v10 + 1;
    if (v10 + 1 > 0xAAAAAAAAAAAAAAALL) {
      sub_20DB5E168();
    }
    unint64_t v12 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v7 - *v2) >> 3);
    if (2 * v12 > v11) {
      unint64_t v11 = 2 * v12;
    }
    if (v12 >= 0x555555555555555) {
      unint64_t v13 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v13 = v11;
    }
    v21[4] = v2 + 2;
    if (v13) {
      unint64_t v14 = (char *)sub_20DB622B0((uint64_t)(v2 + 2), v13);
    }
    else {
      unint64_t v14 = 0;
    }
    unint64_t v15 = &v14[24 * v10];
    v21[0] = v14;
    v21[1] = v15;
    v21[3] = &v14[24 * v13];
    long long v16 = *(_OWORD *)__p;
    *((void *)v15 + 2) = v20;
    *(_OWORD *)unint64_t v15 = v16;
    __p[1] = 0;
    uint64_t v20 = 0;
    __p[0] = 0;
    v21[2] = v15 + 24;
    sub_20DB67094(v2, v21);
    uint64_t v17 = v2[1];
    sub_20DB6722C((uint64_t)v21);
    int v18 = SHIBYTE(v20);
    v2[1] = v17;
    if (v18 < 0) {
      operator delete(__p[0]);
    }
  }
  else
  {
    long long v9 = *(_OWORD *)__p;
    *(void *)(v8 + 16) = v20;
    *(_OWORD *)unint64_t v8 = v9;
    v2[1] = v8 + 24;
  }
}

void sub_20DB71FF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void sub_20DB72020(void *a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X8>)
{
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  if (a1[3] < 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(a1[1] - *a1) >> 3))
  {
    uint64_t v88 = (uint64_t)(a3 + 2);
    uint64_t v6 = MEMORY[0x263EF8318];
    do
    {
      unint64_t v7 = sub_20DB72C94(a1);
      int v8 = *((char *)v7 + 23);
      if (v8 < 0)
      {
        if (v7[1] != 1) {
          goto LABEL_13;
        }
        int v10 = *(unsigned __int8 *)*v7;
        if (v10 == 41 || v10 == 93) {
          return;
        }
        int v9 = *(unsigned __int8 *)*v7;
      }
      else
      {
        if (v8 != 1) {
          goto LABEL_13;
        }
        int v9 = *(unsigned __int8 *)v7;
        if (v9 == 41 || v9 == 93) {
          return;
        }
      }
      if (v9 == 124) {
        return;
      }
LABEL_13:
      unint64_t v11 = sub_20DB72C94(a1);
      unint64_t v12 = v11;
      v92[0] = 0;
      long long v91 = 0uLL;
      int v13 = *((unsigned __int8 *)v11 + 23);
      if ((v13 & 0x80) != 0)
      {
        uint64_t v15 = v11[1];
        if (v15 == 1)
        {
          int v23 = *(unsigned __int8 *)*v11;
          if (v23 == 40)
          {
LABEL_57:
            __n128 v28 = sub_20DB72DAC(a1, &__p);
            if (v98 < 0) {
              operator delete((void *)__p.n128_u64[0]);
            }
            sub_20DB71654(&v96, a1, a2, v28);
            sub_20DB72DAC(a1, &v94);
            if (v95 < 0)
            {
              if (v94.n128_u64[1] != 1) {
                goto LABEL_176;
              }
              char v29 = (__n128 *)v94.n128_u64[0];
            }
            else
            {
              if (v95 != 1) {
                goto LABEL_176;
              }
              char v29 = &v94;
            }
            if (v29->n128_u8[0] != 41)
            {
LABEL_176:
              exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
              std::runtime_error::runtime_error(exception, "Mismatched '('");
              exception->__vftable = (std::runtime_error_vtbl *)&unk_26C244960;
              __cxa_throw(exception, (struct type_info *)&unk_26C244360, (void (*)(void *))std::runtime_error::~runtime_error);
            }
            sub_20DB74E04((long long *)&v96, &v93);
            unint64_t v41 = (__n128 *)*((void *)&v91 + 1);
            if (*((void *)&v91 + 1) < v92[0]) {
              goto LABEL_96;
            }
            uint64_t v42 = (uint64_t)(*((void *)&v91 + 1) - v91) >> 4;
            unint64_t v46 = v42 + 1;
            if ((unint64_t)(v42 + 1) >> 60) {
              sub_20DB5E168();
            }
            uint64_t v47 = v92[0] - v91;
            if ((uint64_t)(v92[0] - v91) >> 3 > v46) {
              unint64_t v46 = v47 >> 3;
            }
            if ((unint64_t)v47 >= 0x7FFFFFFFFFFFFFF0) {
              unint64_t v45 = 0xFFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v45 = v46;
            }
LABEL_103:
            v102 = v92;
            uint64_t v48 = (char *)sub_20DB5E55C((uint64_t)v92, v45);
            char v49 = (__n128 *)&v48[16 * v42];
            *(void *)&long long __s1 = v48;
            *((void *)&__s1 + 1) = v49;
            int v101 = &v48[16 * v50];
            *char v49 = v93;
            __n128 v93 = 0uLL;
            v100 = v49 + 1;
            sub_20DB749F0((uint64_t *)&v91, &__s1);
            uint64_t v51 = *((void *)&v91 + 1);
            sub_20DB7020C((void **)&__s1);
            *((void *)&v91 + 1) = v51;
            if (v93.n128_u64[1]) {
              sub_20DB5E6A0((std::__shared_weak_count *)v93.n128_u64[1]);
            }
LABEL_105:
            if (v95 < 0) {
              operator delete((void *)v94.n128_u64[0]);
            }
            *(void *)&long long __s1 = &v96;
            p_s1 = (void ***)&__s1;
            goto LABEL_108;
          }
          if (v23 == 91) {
            goto LABEL_39;
          }
        }
        if (v15 != 7) {
          goto LABEL_31;
        }
        unint64_t v14 = (int *)*v11;
      }
      else
      {
        if (v13 == 1)
        {
          int v20 = *(unsigned __int8 *)v11;
          if (v20 == 40) {
            goto LABEL_57;
          }
          if (v20 == 91)
          {
LABEL_39:
            __n128 v24 = sub_20DB72DAC(a1, &__p);
            if (v98 < 0) {
              operator delete((void *)__p.n128_u64[0]);
            }
            sub_20DB71654(&v96, a1, a2, v24);
            sub_20DB72DAC(a1, &v94);
            if (v95 < 0)
            {
              if (v94.n128_u64[1] != 1) {
                goto LABEL_175;
              }
              uint64_t v25 = (__n128 *)v94.n128_u64[0];
            }
            else
            {
              if (v95 != 1) {
                goto LABEL_175;
              }
              uint64_t v25 = &v94;
            }
            if (v25->n128_u8[0] != 93)
            {
LABEL_175:
              int v86 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
              std::runtime_error::runtime_error(v86, "Mismatched '['");
              v86->__vftable = (std::runtime_error_vtbl *)&unk_26C244960;
              __cxa_throw(v86, (struct type_info *)&unk_26C244360, (void (*)(void *))std::runtime_error::~runtime_error);
            }
            sub_20DB74B34((long long *)&v96, &v93);
            unint64_t v41 = (__n128 *)*((void *)&v91 + 1);
            if (*((void *)&v91 + 1) >= v92[0])
            {
              uint64_t v42 = (uint64_t)(*((void *)&v91 + 1) - v91) >> 4;
              unint64_t v43 = v42 + 1;
              if ((unint64_t)(v42 + 1) >> 60) {
                sub_20DB5E168();
              }
              uint64_t v44 = v92[0] - v91;
              if ((uint64_t)(v92[0] - v91) >> 3 > v43) {
                unint64_t v43 = v44 >> 3;
              }
              if ((unint64_t)v44 >= 0x7FFFFFFFFFFFFFF0) {
                unint64_t v45 = 0xFFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v45 = v43;
              }
              goto LABEL_103;
            }
LABEL_96:
            *unint64_t v41 = v93;
            *((void *)&v91 + 1) = v41 + 1;
            goto LABEL_105;
          }
LABEL_31:
          sub_20DB7AA9C(&__s1, "--");
          if (sub_20DB6E104((const void **)v12, &__s1))
          {
            int v21 = *((char *)v12 + 23);
            if (v21 < 0)
            {
              if (v12[1] != 2) {
                goto LABEL_47;
              }
              uint64_t v22 = (unsigned __int16 *)*v12;
            }
            else
            {
              uint64_t v22 = (unsigned __int16 *)v12;
              if (v21 != 2)
              {
LABEL_47:
                BOOL v26 = 1;
                goto LABEL_48;
              }
            }
            BOOL v26 = *v22 != 11565;
LABEL_48:
            if (SHIBYTE(v100) < 0)
            {
              operator delete((void *)__s1);
              if (v26)
              {
LABEL_50:
                sub_20DB72E10((uint64_t)a1, a2, (uint64_t *)&__s1);
                goto LABEL_81;
              }
            }
            else if (v26)
            {
              goto LABEL_50;
            }
          }
          else if (SHIBYTE(v100) < 0)
          {
            operator delete((void *)__s1);
          }
          sub_20DB7AA9C(&__s1, "-");
          if (sub_20DB6E104((const void **)v12, &__s1))
          {
            if (*((char *)v12 + 23) < 0)
            {
              uint64_t v30 = v12[1];
              if (v30 != 1 || *(unsigned char *)*v12 != 45)
              {
                if (v30 != 2) {
                  goto LABEL_75;
                }
                uint64_t v27 = (unsigned __int16 *)*v12;
                goto LABEL_65;
              }
            }
            else
            {
              if (*((unsigned char *)v12 + 23) != 1)
              {
                uint64_t v27 = (unsigned __int16 *)v12;
                if (*((unsigned char *)v12 + 23) != 2)
                {
LABEL_75:
                  BOOL v31 = 1;
                  goto LABEL_76;
                }
LABEL_65:
                BOOL v31 = *v27 != 11565;
LABEL_76:
                if (SHIBYTE(v100) < 0)
                {
                  operator delete((void *)__s1);
                  if (v31)
                  {
LABEL_80:
                    sub_20DB73DE4((uint64_t)a1, a2, (uint64_t *)&__s1);
LABEL_81:
                    sub_20DB5E904((uint64_t *)&v91);
                    long long v91 = __s1;
                    v92[0] = v100;
                    v100 = 0;
                    long long __s1 = 0uLL;
                    __p.n128_u64[0] = (unint64_t)&__s1;
                    p_s1 = (void ***)&__p;
LABEL_108:
                    sub_20DB5E714(p_s1);
                    goto LABEL_146;
                  }
                }
                else if (v31)
                {
                  goto LABEL_80;
                }
LABEL_112:
                if (*((char *)v12 + 23) < 0)
                {
                  uint64_t v54 = v12[1];
                  if (v54)
                  {
                    long long v53 = (char *)*v12;
                    uint64_t v52 = (char *)*v12;
                    if (*(unsigned char *)*v12 != 60) {
                      goto LABEL_121;
                    }
                    goto LABEL_118;
                  }
LABEL_134:
                  sub_20DB72DAC(a1, &__p);
                  sub_20DB76768((uint64_t)&__p, &v96);
                  char v58 = (_OWORD *)*((void *)&v91 + 1);
                  if (*((void *)&v91 + 1) < v92[0]) {
                    goto LABEL_135;
                  }
                  uint64_t v59 = (uint64_t)(*((void *)&v91 + 1) - v91) >> 4;
                  unint64_t v63 = v59 + 1;
                  if ((unint64_t)(v59 + 1) >> 60) {
                    sub_20DB5E168();
                  }
                  uint64_t v64 = v92[0] - v91;
                  if ((uint64_t)(v92[0] - v91) >> 3 > v63) {
                    unint64_t v63 = v64 >> 3;
                  }
                  if ((unint64_t)v64 >= 0x7FFFFFFFFFFFFFF0) {
                    unint64_t v62 = 0xFFFFFFFFFFFFFFFLL;
                  }
                  else {
                    unint64_t v62 = v63;
                  }
LABEL_142:
                  v102 = v92;
                  uint64_t v65 = (char *)sub_20DB5E55C((uint64_t)v92, v62);
                  uint64_t v66 = (__n128 *)&v65[16 * v59];
                  *(void *)&long long __s1 = v65;
                  *((void *)&__s1 + 1) = v66;
                  int v101 = &v65[16 * v67];
                  *uint64_t v66 = v96;
                  __n128 v96 = 0uLL;
                  v100 = v66 + 1;
                  sub_20DB749F0((uint64_t *)&v91, &__s1);
                  uint64_t v68 = *((void *)&v91 + 1);
                  sub_20DB7020C((void **)&__s1);
                  *((void *)&v91 + 1) = v68;
                  if (v96.n128_u64[1]) {
                    sub_20DB5E6A0((std::__shared_weak_count *)v96.n128_u64[1]);
                  }
                }
                else
                {
                  if (!*((unsigned char *)v12 + 23)) {
                    goto LABEL_134;
                  }
                  if (*(unsigned char *)v12 != 60) {
                    goto LABEL_120;
                  }
                  uint64_t v52 = (char *)*v12;
                  long long v53 = (char *)v12;
                  uint64_t v54 = *((unsigned __int8 *)v12 + 23);
LABEL_118:
                  if (v53[v54 - 1] != 62)
                  {
                    if ((*((unsigned char *)v12 + 23) & 0x80) == 0)
                    {
LABEL_120:
                      long long v53 = (char *)v12;
                      uint64_t v54 = *((unsigned __int8 *)v12 + 23);
LABEL_121:
                      char v55 = &v53[v54];
                      uint64_t v52 = v53;
                      goto LABEL_122;
                    }
                    uint64_t v85 = v12[1];
                    if (v85)
                    {
                      char v55 = &v52[v85];
LABEL_122:
                      do
                      {
                        unsigned int v56 = *v52;
                        if (!((v56 & 0x80000000) != 0
                             ? __maskrune(v56, 0x8000uLL)
                             : *(_DWORD *)(v6 + 4 * v56 + 60) & 0x8000))
                          goto LABEL_134;
                      }
                      while (++v52 != v55);
                    }
                  }
                  sub_20DB72DAC(a1, &__p);
                  sub_20DB7607C((uint64_t)&__p, &v96);
                  char v58 = (_OWORD *)*((void *)&v91 + 1);
                  if (*((void *)&v91 + 1) >= v92[0])
                  {
                    uint64_t v59 = (uint64_t)(*((void *)&v91 + 1) - v91) >> 4;
                    unint64_t v60 = v59 + 1;
                    if ((unint64_t)(v59 + 1) >> 60) {
                      sub_20DB5E168();
                    }
                    uint64_t v61 = v92[0] - v91;
                    if ((uint64_t)(v92[0] - v91) >> 3 > v60) {
                      unint64_t v60 = v61 >> 3;
                    }
                    if ((unint64_t)v61 >= 0x7FFFFFFFFFFFFFF0) {
                      unint64_t v62 = 0xFFFFFFFFFFFFFFFLL;
                    }
                    else {
                      unint64_t v62 = v60;
                    }
                    goto LABEL_142;
                  }
LABEL_135:
                  *char v58 = v96;
                  __n128 v96 = 0uLL;
                  *((void *)&v91 + 1) = v58 + 1;
                }
                if (v98 < 0) {
                  operator delete((void *)__p.n128_u64[0]);
                }
                goto LABEL_146;
              }
              if (*(unsigned char *)v12 != 45) {
                goto LABEL_75;
              }
            }
          }
          if (SHIBYTE(v100) < 0) {
            operator delete((void *)__s1);
          }
          goto LABEL_112;
        }
        unint64_t v14 = (int *)v11;
        if (v13 != 7) {
          goto LABEL_31;
        }
      }
      int v16 = *v14;
      int v17 = *(int *)((char *)v14 + 3);
      if (v16 != 1769238639 || v17 != 1936617321) {
        goto LABEL_31;
      }
      sub_20DB72DAC(a1, &__p);
      if (v98 < 0) {
        operator delete((void *)__p.n128_u64[0]);
      }
      sub_20DB74F9C(&v96);
      uint64_t v19 = *((void *)&v91 + 1);
      if (*((void *)&v91 + 1) >= v92[0])
      {
        uint64_t v32 = (uint64_t)(*((void *)&v91 + 1) - v91) >> 4;
        unint64_t v33 = v32 + 1;
        if ((unint64_t)(v32 + 1) >> 60) {
          sub_20DB5E168();
        }
        uint64_t v34 = v92[0] - v91;
        if ((uint64_t)(v92[0] - v91) >> 3 > v33) {
          unint64_t v33 = v34 >> 3;
        }
        if ((unint64_t)v34 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v35 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v35 = v33;
        }
        v102 = v92;
        uint64_t v36 = (char *)sub_20DB5E55C((uint64_t)v92, v35);
        long long v37 = (__n128 *)&v36[16 * v32];
        *(void *)&long long __s1 = v36;
        *((void *)&__s1 + 1) = v37;
        int v101 = &v36[16 * v38];
        *long long v37 = v96;
        __n128 v96 = 0uLL;
        v100 = v37 + 1;
        sub_20DB749F0((uint64_t *)&v91, &__s1);
        uint64_t v39 = *((void *)&v91 + 1);
        sub_20DB7020C((void **)&__s1);
        *((void *)&v91 + 1) = v39;
        if (v96.n128_u64[1]) {
          sub_20DB5E6A0((std::__shared_weak_count *)v96.n128_u64[1]);
        }
      }
      else
      {
        **((_OWORD **)&v91 + 1) = v96;
        *((void *)&v91 + 1) = v19 + 16;
      }
LABEL_146:
      uint64_t v69 = sub_20DB72C94(a1);
      int v70 = *((char *)v69 + 23);
      if (v70 < 0)
      {
        if (v69[1] != 3) {
          goto LABEL_155;
        }
        uint64_t v69 = (uint64_t *)*v69;
      }
      else if (v70 != 3)
      {
        goto LABEL_155;
      }
      if (*(_WORD *)v69 == 11822 && *((unsigned char *)v69 + 2) == 46)
      {
        sub_20DB770D8(&v91, &__p);
        uint64_t v75 = (__n128 *)a3[1];
        unint64_t v74 = a3[2];
        if ((unint64_t)v75 >= v74)
        {
          uint64_t v76 = ((uint64_t)v75 - *a3) >> 4;
          unint64_t v77 = v76 + 1;
          if ((unint64_t)(v76 + 1) >> 60) {
            sub_20DB5E168();
          }
          uint64_t v78 = v74 - *a3;
          if (v78 >> 3 > v77) {
            unint64_t v77 = v78 >> 3;
          }
          if ((unint64_t)v78 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v79 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v79 = v77;
          }
          v102 = (void *)v88;
          v80 = (char *)sub_20DB5E55C(v88, v79);
          int v81 = (__n128 *)&v80[16 * v76];
          *(void *)&long long __s1 = v80;
          *((void *)&__s1 + 1) = v81;
          int v101 = &v80[16 * v82];
          *int v81 = __p;
          __n128 __p = 0uLL;
          v100 = v81 + 1;
          sub_20DB749F0(a3, &__s1);
          uint64_t v83 = a3[1];
          sub_20DB7020C((void **)&__s1);
          uint64_t v84 = (std::__shared_weak_count *)__p.n128_u64[1];
          a3[1] = v83;
          if (v84) {
            sub_20DB5E6A0(v84);
          }
        }
        else
        {
          *uint64_t v75 = __p;
          a3[1] = (uint64_t)&v75[1];
        }
        sub_20DB72DAC(a1, &v89);
        if (v90 < 0) {
          operator delete((void *)v89.n128_u64[0]);
        }
        goto LABEL_170;
      }
LABEL_155:
      uint64_t v72 = *((void *)&v91 + 1);
      for (uint64_t i = v91; i != v72; i += 16)
        sub_20DB753F4(a3, i);
LABEL_170:
      *(void *)&long long __s1 = &v91;
      sub_20DB5E714((void ***)&__s1);
    }
    while (a1[3] < 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(a1[1] - *a1) >> 3));
  }
}

void sub_20DB72AF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, std::__shared_weak_count *a18, uint64_t a19, char **__p,uint64_t a21,int a22,__int16 a23,char a24,char a25,char *a26,uint64_t a27,uint64_t a28,uint64_t a29,void *a30,uint64_t a31,int a32,__int16 a33,char a34,char a35)
{
  if (a18) {
    sub_20DB5E6A0(a18);
  }
  if (a25 < 0) {
    operator delete(__p);
  }
  __n128 __p = &a26;
  sub_20DB5E714((void ***)&__p);
  a26 = &a13;
  sub_20DB5E714((void ***)&a26);
  sub_20DB5E714((void ***)&a26);
  _Unwind_Resume(a1);
}

uint64_t *sub_20DB72C94(void *a1)
{
  unint64_t v1 = a1[3];
  if (v1 < 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(a1[1] - *a1) >> 3)) {
    return (uint64_t *)(*a1 + 24 * v1);
  }
  if (atomic_load_explicit((atomic_uchar *volatile)&qword_26772BFF0, memory_order_acquire)) {
    return &qword_26772BFD8;
  }
  if (__cxa_guard_acquire(&qword_26772BFF0))
  {
    qword_26772BFD8 = 0;
    unk_26772BFE0 = 0;
    qword_26772BFE8 = 0;
    __cxa_atexit(MEMORY[0x263F8C0B8], &qword_26772BFD8, &dword_20DB5A000);
    __cxa_guard_release(&qword_26772BFF0);
  }
  return &qword_26772BFD8;
}

double sub_20DB72D4C@<D0>(long long *a1@<X0>, _OWORD *a2@<X8>)
{
  unint64_t v3 = *(long long **)a1;
  if (*((void *)a1 + 1) - *(void *)a1 == 16)
  {
    long long v4 = *v3;
    *a2 = *v3;
    *(void *)unint64_t v3 = 0;
    *((void *)v3 + 1) = 0;
  }
  else
  {
    sub_20DB74E04(a1, &v6);
    *(void *)&long long v4 = v6;
    *a2 = v6;
  }
  return *(double *)&v4;
}

__n128 sub_20DB72DAC@<Q0>(void *a1@<X0>, __n128 *a2@<X8>)
{
  unint64_t v2 = a1[3];
  a1[3] = v2 + 1;
  if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(a1[1] - *a1) >> 3) <= v2) {
    sub_20DB776F8();
  }
  unint64_t v3 = (__n128 *)(*a1 + 24 * v2);
  __n128 result = *v3;
  *a2 = *v3;
  a2[1].n128_u64[0] = v3[1].n128_u64[0];
  v3->n128_u64[1] = 0;
  v3[1].n128_u64[0] = 0;
  v3->n128_u64[0] = 0;
  return result;
}

void sub_20DB72E10(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X8>)
{
  long long __s1 = 0;
  uint64_t v103 = 0;
  uint64_t v104 = 0;
  v99 = 0;
  uint64_t v100 = 0;
  uint64_t v101 = 0;
  int v96 = 0;
  sub_20DB72DAC((void *)a1, (__n128 *)&__str);
  sub_20DB7AA9C(&v91, "=");
  long long v94 = 0u;
  memset(&v95, 0, sizeof(v95));
  memset(__p, 0, sizeof(__p));
  int64_t size = HIBYTE(__str.__r_.__value_.__r.__words[2]);
  if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_str = &__str;
  }
  else {
    p_str = (std::string *)__str.__r_.__value_.__r.__words[0];
  }
  if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    int64_t size = __str.__r_.__value_.__l.__size_;
  }
  if ((v91.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    int v8 = &v91;
  }
  else {
    int v8 = (std::string *)v91.__r_.__value_.__r.__words[0];
  }
  if ((v91.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    int64_t v9 = HIBYTE(v91.__r_.__value_.__r.__words[2]);
  }
  else {
    int64_t v9 = v91.__r_.__value_.__l.__size_;
  }
  if (v9)
  {
    if (size >= v9)
    {
      int v10 = (char *)p_str + size;
      int v11 = v8->__r_.__value_.__s.__data_[0];
      unint64_t v12 = p_str;
      do
      {
        int64_t v13 = size - v9;
        if (v13 == -1) {
          break;
        }
        unint64_t v14 = (char *)memchr(v12, v11, v13 + 1);
        if (!v14) {
          break;
        }
        uint64_t v15 = v14;
        if (!memcmp(v14, v8, v9))
        {
          if (v15 != v10)
          {
            std::string::size_type v16 = v15 - (char *)p_str;
            if (v15 - (char *)p_str != -1) {
              goto LABEL_21;
            }
          }
          break;
        }
        unint64_t v12 = (std::string *)(v15 + 1);
        int64_t size = v10 - (v15 + 1);
      }
      while (size >= v9);
    }
  }
  else
  {
    std::string::size_type v16 = 0;
LABEL_21:
    std::string::basic_string(&v105, &__str, v16 + v9, 0xFFFFFFFFFFFFFFFFLL, (std::allocator<char> *)&v90);
    std::string v95 = v105;
    std::string::operator=((std::string *)&__p[24], &v91);
    std::string::resize(&__str, v16, 0);
    if ((__p[23] & 0x80000000) != 0) {
      operator delete(*(void **)__p);
    }
  }
  *(std::string *)__n128 __p = __str;
  *((unsigned char *)&__str.__r_.__value_.__s + 23) = 0;
  __str.__r_.__value_.__s.__data_[0] = 0;
  v105.__r_.__value_.__r.__words[0] = (std::string::size_type)&__s1;
  v105.__r_.__value_.__l.__size_ = (std::string::size_type)&v99;
  v105.__r_.__value_.__r.__words[2] = (std::string::size_type)&v96;
  sub_20DB754E4(&v105, (long long *)__p);
  if (SHIBYTE(v95.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v95.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v94) < 0) {
    operator delete(*(void **)&__p[24]);
  }
  if ((__p[23] & 0x80000000) != 0) {
    operator delete(*(void **)__p);
  }
  if (SHIBYTE(v91.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v91.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__str.__r_.__value_.__l.__data_);
  }
  uint64_t v17 = HIBYTE(v101);
  if (v101 < 0) {
    uint64_t v17 = v100;
  }
  if (v17) {
    goto LABEL_36;
  }
  *(_DWORD *)__n128 __p = 0;
  if (v96 == 3)
  {
    if (SHIBYTE(v98) < 0) {
      operator delete((void *)v97);
    }
    goto LABEL_129;
  }
  if (v96 == 4)
  {
    v105.__r_.__value_.__r.__words[0] = (std::string::size_type)&v97;
    sub_20DB7ABD8((void ***)&v105);
LABEL_129:
    int v96 = *(_DWORD *)__p;
    switch(*(_DWORD *)__p)
    {
      case 1:
        LOBYTE(v97) = __p[8];
        break;
      case 2:
        *(void *)&long long v97 = *(void *)&__p[8];
        break;
      case 3:
        long long v97 = *(_OWORD *)&__p[8];
        uint64_t v98 = *(void *)&__p[24];
        break;
      case 4:
        long long v97 = *(_OWORD *)&__p[8];
        uint64_t v98 = *(void *)&__p[24];
        memset(&__p[8], 0, 24);
        v105.__r_.__value_.__r.__words[0] = (std::string::size_type)&__p[8];
        sub_20DB7ABD8((void ***)&v105);
        break;
      default:
        goto LABEL_36;
    }
    goto LABEL_36;
  }
  int v96 = 0;
LABEL_36:
  memset(&v105, 0, sizeof(v105));
  uint64_t v18 = *a2;
  uint64_t v19 = a2[1];
  if (*a2 == v19)
  {
    unint64_t v35 = (unsigned char *)(a1 + 32);
    if (!*(unsigned char *)(a1 + 32))
    {
      *a3 = 0;
      a3[1] = 0;
      a3[2] = 0;
LABEL_118:
      uint64_t v50 = HIBYTE(v101);
      if (v101 < 0) {
        uint64_t v50 = v100;
      }
      LODWORD(v88[0]) = v50 != 0;
      unint64_t v51 = a2[1];
      if (v51 >= a2[2])
      {
        uint64_t v52 = sub_20DB757A4(a2, (char *)&unk_20DB7F171, (uint64_t)&__s1, (int *)v88);
      }
      else
      {
        sub_20DB758CC(a2 + 16, a2[1], (char *)&unk_20DB7F171, (uint64_t)&__s1, (int *)v88);
        uint64_t v52 = v51 + 120;
        a2[1] = v51 + 120;
      }
      a2[1] = v52;
      sub_20DB759F4(v52 - 120, &v91);
      if (*v35)
      {
        uint64_t v53 = v91.__r_.__value_.__r.__words[0];
        if (LODWORD(v88[0]))
        {
          *(_DWORD *)__n128 __p = v96;
          switch(v96)
          {
            case 1:
              char v54 = v97;
              goto LABEL_133;
            case 2:
              *(void *)&__p[8] = v97;
              break;
            case 3:
              if (SHIBYTE(v98) < 0)
              {
                sub_20DB66FF4(&__p[8], (void *)v97, *((unint64_t *)&v97 + 1));
              }
              else
              {
                *(_OWORD *)&__p[8] = v97;
                *(void *)&__p[24] = v98;
              }
              break;
            case 4:
              memset(&__p[8], 0, 24);
              sub_20DB7AB50(&__p[8], (long long *)v97, *((long long **)&v97 + 1), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)&v97 + 1) - v97) >> 3));
              break;
            default:
              break;
          }
        }
        else
        {
          char v54 = 1;
          *(_DWORD *)__n128 __p = 1;
LABEL_133:
          __p[8] = v54;
        }
        sub_20DB6FEB4(v53, (int *)__p);
        if (*(_DWORD *)__p == 4)
        {
          v90.__r_.__value_.__r.__words[0] = (std::string::size_type)&__p[8];
          sub_20DB7ABD8((void ***)&v90);
        }
        else if (*(_DWORD *)__p == 3 && (__p[31] & 0x80000000) != 0)
        {
          operator delete(*(void **)&__p[8]);
        }
      }
      long long v55 = *(_OWORD *)&v91.__r_.__value_.__l.__data_;
      std::string::size_type v56 = v91.__r_.__value_.__l.__size_;
      if (v91.__r_.__value_.__l.__size_) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(v91.__r_.__value_.__l.__size_ + 8), 1uLL, memory_order_relaxed);
      }
      unint64_t v57 = a3[2];
      char v58 = (uint64_t *)a3[1];
      if ((unint64_t)v58 < v57)
      {
        *char v58 = v55;
        v58[1] = v56;
        goto LABEL_199;
      }
      long long v85 = v55;
      uint64_t v59 = ((uint64_t)v58 - *a3) >> 4;
      unint64_t v60 = v59 + 1;
      if ((unint64_t)(v59 + 1) >> 60) {
        sub_20DB5E168();
      }
      uint64_t v61 = v57 - *a3;
      if (v61 >> 3 > v60) {
        unint64_t v60 = v61 >> 3;
      }
      if ((unint64_t)v61 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v62 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v62 = v60;
      }
      *(void *)&long long v94 = a3 + 2;
      unint64_t v63 = (char *)sub_20DB5E55C((uint64_t)(a3 + 2), v62);
      uint64_t v64 = &v63[16 * v59];
      *(void *)__n128 __p = v63;
      *(void *)&__p[8] = v64;
      *(void *)&__p[24] = &v63[16 * v65];
      *(_OWORD *)uint64_t v64 = v85;
      *(void *)&__p[16] = v64 + 16;
      sub_20DB749F0(a3, __p);
      goto LABEL_207;
    }
    uint64_t v34 = 0;
    goto LABEL_80;
  }
  int v20 = 0;
  do
  {
    uint64_t v21 = *(unsigned __int8 *)(v18 + 111);
    if ((v21 & 0x80u) == 0) {
      uint64_t v22 = *(unsigned __int8 *)(v18 + 111);
    }
    else {
      uint64_t v22 = *(void *)(v18 + 96);
    }
    uint64_t v23 = HIBYTE(v104);
    if (v104 < 0) {
      uint64_t v23 = v103;
    }
    if (v22 == v23)
    {
      if (v104 >= 0) {
        p_s1 = (void **)&__s1;
      }
      else {
        p_s1 = __s1;
      }
      if ((v21 & 0x80) != 0)
      {
        if (memcmp(*(const void **)(v18 + 88), p_s1, *(void *)(v18 + 96))) {
          goto LABEL_71;
        }
LABEL_54:
        if ((unint64_t)v20 >= v105.__r_.__value_.__r.__words[2])
        {
          uint64_t v26 = (uint64_t)((uint64_t)v20 - v105.__r_.__value_.__r.__words[0]) >> 3;
          if ((unint64_t)(v26 + 1) >> 61) {
            sub_20DB5E168();
          }
          unint64_t v27 = (uint64_t)(v105.__r_.__value_.__r.__words[2] - v105.__r_.__value_.__r.__words[0]) >> 2;
          if (v27 <= v26 + 1) {
            unint64_t v27 = v26 + 1;
          }
          if (v105.__r_.__value_.__r.__words[2] - v105.__r_.__value_.__r.__words[0] >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v28 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v28 = v27;
          }
          if (v28) {
            char v29 = (char *)sub_20DB5E180((uint64_t)&v105.__r_.__value_.__r.__words[2], v28);
          }
          else {
            char v29 = 0;
          }
          uint64_t v30 = (uint64_t *)&v29[8 * v26];
          uint64_t *v30 = v18;
          int v20 = v30 + 1;
          BOOL v31 = (char *)v105.__r_.__value_.__l.__size_;
          std::string::size_type v32 = v105.__r_.__value_.__r.__words[0];
          if (v105.__r_.__value_.__l.__size_ != v105.__r_.__value_.__r.__words[0])
          {
            do
            {
              uint64_t v33 = *((void *)v31 - 1);
              v31 -= 8;
              *--uint64_t v30 = v33;
            }
            while (v31 != (char *)v32);
            BOOL v31 = (char *)v105.__r_.__value_.__r.__words[0];
          }
          v105.__r_.__value_.__r.__words[0] = (std::string::size_type)v30;
          v105.__r_.__value_.__l.__size_ = (std::string::size_type)v20;
          v105.__r_.__value_.__r.__words[2] = (std::string::size_type)&v29[8 * v28];
          if (v31) {
            operator delete(v31);
          }
        }
        else
        {
          *v20++ = v18;
        }
        v105.__r_.__value_.__l.__size_ = (std::string::size_type)v20;
        goto LABEL_71;
      }
      if (!*(unsigned char *)(v18 + 111)) {
        goto LABEL_54;
      }
      uint64_t v25 = 0;
      while (*(unsigned __int8 *)(v18 + v25 + 88) == *((unsigned __int8 *)p_s1 + v25))
      {
        if (v21 == ++v25) {
          goto LABEL_54;
        }
      }
    }
LABEL_71:
    v18 += 120;
  }
  while (v18 != v19);
  uint64_t v34 = (uint64_t *)v105.__r_.__value_.__r.__words[0];
  unint64_t v35 = (unsigned char *)(a1 + 32);
  if (*(unsigned char *)(a1 + 32) && (uint64_t *)v105.__r_.__value_.__l.__data_ == v20)
  {
LABEL_80:
    uint64_t v36 = *a2;
    uint64_t v37 = a2[1];
    if (*a2 == v37)
    {
      int v20 = v34;
      goto LABEL_107;
    }
    int v20 = v34;
    while (1)
    {
      if (*(char *)(v36 + 111) < 0)
      {
        if (*(void *)(v36 + 96))
        {
LABEL_86:
          if (sub_20DB6E104((const void **)(v36 + 88), &__s1))
          {
            if ((unint64_t)v20 >= v105.__r_.__value_.__r.__words[2])
            {
              uint64_t v38 = (uint64_t)((uint64_t)v20 - v105.__r_.__value_.__r.__words[0]) >> 3;
              if ((unint64_t)(v38 + 1) >> 61) {
                sub_20DB5E168();
              }
              unint64_t v39 = (uint64_t)(v105.__r_.__value_.__r.__words[2] - v105.__r_.__value_.__r.__words[0]) >> 2;
              if (v39 <= v38 + 1) {
                unint64_t v39 = v38 + 1;
              }
              if (v105.__r_.__value_.__r.__words[2] - v105.__r_.__value_.__r.__words[0] >= 0x7FFFFFFFFFFFFFF8) {
                unint64_t v40 = 0x1FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v40 = v39;
              }
              if (v40) {
                unint64_t v41 = (char *)sub_20DB5E180((uint64_t)&v105.__r_.__value_.__r.__words[2], v40);
              }
              else {
                unint64_t v41 = 0;
              }
              uint64_t v42 = (uint64_t *)&v41[8 * v38];
              uint64_t *v42 = v36;
              int v20 = v42 + 1;
              unint64_t v43 = (char *)v105.__r_.__value_.__l.__size_;
              std::string::size_type v44 = v105.__r_.__value_.__r.__words[0];
              if (v105.__r_.__value_.__l.__size_ != v105.__r_.__value_.__r.__words[0])
              {
                do
                {
                  uint64_t v45 = *((void *)v43 - 1);
                  v43 -= 8;
                  *--uint64_t v42 = v45;
                }
                while (v43 != (char *)v44);
                unint64_t v43 = (char *)v105.__r_.__value_.__r.__words[0];
              }
              v105.__r_.__value_.__r.__words[0] = (std::string::size_type)v42;
              v105.__r_.__value_.__l.__size_ = (std::string::size_type)v20;
              v105.__r_.__value_.__r.__words[2] = (std::string::size_type)&v41[8 * v40];
              if (v43) {
                operator delete(v43);
              }
            }
            else
            {
              *v20++ = v36;
            }
            v105.__r_.__value_.__l.__size_ = (std::string::size_type)v20;
          }
        }
      }
      else if (*(unsigned char *)(v36 + 111))
      {
        goto LABEL_86;
      }
      v36 += 120;
      if (v36 == v37)
      {
        uint64_t v34 = (uint64_t *)v105.__r_.__value_.__r.__words[0];
        break;
      }
    }
  }
LABEL_107:
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  if ((unint64_t)((char *)v20 - (char *)v34) > 8)
  {
    sub_20DB75244(v34, v20, (uint64_t *)__p);
    std::operator+<char>();
    uint64_t v78 = std::string::append(&v90, "' is not a unique prefix: ");
    long long v79 = *(_OWORD *)&v78->__r_.__value_.__l.__data_;
    v91.__r_.__value_.__r.__words[2] = v78->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v91.__r_.__value_.__l.__data_ = v79;
    v78->__r_.__value_.__l.__size_ = 0;
    v78->__r_.__value_.__r.__words[2] = 0;
    v78->__r_.__value_.__r.__words[0] = 0;
    if (SHIBYTE(v90.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v90.__r_.__value_.__l.__data_);
    }
    v80 = *(char **)__p;
    int v81 = *(char **)&__p[8];
    sub_20DB7AA9C(v88, ", ");
    sub_20DB75314(v80, v81, (uint64_t)v88, &v90);
    if ((v90.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      uint64_t v82 = &v90;
    }
    else {
      uint64_t v82 = (std::string *)v90.__r_.__value_.__r.__words[0];
    }
    if ((v90.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v83 = HIBYTE(v90.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v83 = v90.__r_.__value_.__l.__size_;
    }
    std::string::append(&v91, (const std::string::value_type *)v82, v83);
    if (SHIBYTE(v90.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v90.__r_.__value_.__l.__data_);
    }
    if (v89 < 0) {
      operator delete(v88[0]);
    }
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, &v91);
    exception->__vftable = (std::runtime_error_vtbl *)&unk_26C2447A8;
    __cxa_throw(exception, (struct type_info *)&unk_26C2442B8, (void (*)(void *))std::runtime_error::~runtime_error);
  }
  if (v34 == v20) {
    goto LABEL_118;
  }
  sub_20DB75D74(*v34, &v91);
  uint64_t v46 = v91.__r_.__value_.__r.__words[0];
  if (!*(_DWORD *)(v91.__r_.__value_.__r.__words[0] + 112))
  {
    if (v96)
    {
      sub_20DB5D988(" must not have an argument", (const void **)(v91.__r_.__value_.__r.__words[0] + 88), (void **)__p);
      char v49 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(v49, (const std::string *)__p);
      v49->__vftable = (std::runtime_error_vtbl *)&unk_26C2447A8;
      __cxa_throw(v49, (struct type_info *)&unk_26C2442B8, (void (*)(void *))std::runtime_error::~runtime_error);
    }
    goto LABEL_179;
  }
  if (v96) {
    goto LABEL_179;
  }
  uint64_t v47 = sub_20DB72C94((void *)a1);
  if (*((char *)v47 + 23) < 0)
  {
    uint64_t v66 = v47[1];
    if (v66 != 2)
    {
      if (v66) {
        goto LABEL_165;
      }
      goto LABEL_114;
    }
    uint64_t v47 = (uint64_t *)*v47;
LABEL_164:
    if (*(_WORD *)v47 != 11565) {
      goto LABEL_165;
    }
LABEL_114:
    sub_20DB5D988(" requires an argument", (const void **)(v91.__r_.__value_.__r.__words[0] + 88), (void **)__p);
    uint64_t v48 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v48, (const std::string *)__p);
    v48->__vftable = (std::runtime_error_vtbl *)&unk_26C2447A8;
    __cxa_throw(v48, (struct type_info *)&unk_26C2442B8, (void (*)(void *))std::runtime_error::~runtime_error);
  }
  if (*((unsigned char *)v47 + 23) == 2) {
    goto LABEL_164;
  }
  if (!*((unsigned char *)v47 + 23)) {
    goto LABEL_114;
  }
LABEL_165:
  sub_20DB72DAC((void *)a1, (__n128 *)v86);
  *(_DWORD *)__n128 __p = 3;
  *(_OWORD *)&__p[8] = *(_OWORD *)v86;
  *(void *)&__p[24] = v87;
  v86[0] = 0;
  v86[1] = 0;
  uint64_t v87 = 0;
  if (v96 == 3)
  {
    if (SHIBYTE(v98) < 0) {
      operator delete((void *)v97);
    }
LABEL_170:
    int v96 = *(_DWORD *)__p;
    switch(*(_DWORD *)__p)
    {
      case 1:
        LOBYTE(v97) = __p[8];
        break;
      case 2:
        *(void *)&long long v97 = *(void *)&__p[8];
        break;
      case 3:
        goto LABEL_173;
      case 4:
        long long v97 = *(_OWORD *)&__p[8];
        uint64_t v98 = *(void *)&__p[24];
        memset(&__p[8], 0, 24);
        v90.__r_.__value_.__r.__words[0] = (std::string::size_type)&__p[8];
        sub_20DB7ABD8((void ***)&v90);
        break;
      default:
        break;
    }
  }
  else
  {
    if (v96 == 4)
    {
      v90.__r_.__value_.__r.__words[0] = (std::string::size_type)&v97;
      sub_20DB7ABD8((void ***)&v90);
      goto LABEL_170;
    }
    int v96 = 3;
LABEL_173:
    long long v97 = *(_OWORD *)&__p[8];
    uint64_t v98 = *(void *)&__p[24];
    memset(&__p[8], 0, 24);
  }
  if (SHIBYTE(v87) < 0) {
    operator delete(v86[0]);
  }
  uint64_t v46 = v91.__r_.__value_.__r.__words[0];
LABEL_179:
  if (*v35)
  {
    if (v96)
    {
      *(_DWORD *)__n128 __p = v96;
      switch(v96)
      {
        case 1:
          char v67 = v97;
          goto LABEL_184;
        case 2:
          *(void *)&__p[8] = v97;
          break;
        case 3:
          *(_OWORD *)&__p[8] = v97;
          *(void *)&__p[24] = v98;
          goto LABEL_187;
        case 4:
          *(_OWORD *)&__p[8] = v97;
          *(void *)&__p[24] = v98;
LABEL_187:
          uint64_t v98 = 0;
          long long v97 = 0uLL;
          break;
        default:
          break;
      }
    }
    else
    {
      char v67 = 1;
      *(_DWORD *)__n128 __p = 1;
LABEL_184:
      __p[8] = v67;
    }
    sub_20DB6FEB4(v46, (int *)__p);
    if (*(_DWORD *)__p == 4)
    {
      v90.__r_.__value_.__r.__words[0] = (std::string::size_type)&__p[8];
      sub_20DB7ABD8((void ***)&v90);
    }
    else if (*(_DWORD *)__p == 3 && (__p[31] & 0x80000000) != 0)
    {
      operator delete(*(void **)&__p[8]);
    }
    uint64_t v46 = v91.__r_.__value_.__r.__words[0];
  }
  std::string::size_type v68 = v91.__r_.__value_.__l.__size_;
  if (v91.__r_.__value_.__l.__size_) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v91.__r_.__value_.__l.__size_ + 8), 1uLL, memory_order_relaxed);
  }
  unint64_t v69 = a3[2];
  char v58 = (uint64_t *)a3[1];
  if ((unint64_t)v58 >= v69)
  {
    uint64_t v71 = ((uint64_t)v58 - *a3) >> 4;
    unint64_t v72 = v71 + 1;
    if ((unint64_t)(v71 + 1) >> 60) {
      sub_20DB5E168();
    }
    uint64_t v73 = v69 - *a3;
    if (v73 >> 3 > v72) {
      unint64_t v72 = v73 >> 3;
    }
    if ((unint64_t)v73 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v74 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v74 = v72;
    }
    *(void *)&long long v94 = a3 + 2;
    uint64_t v75 = (char *)sub_20DB5E55C((uint64_t)(a3 + 2), v74);
    uint64_t v76 = (uint64_t *)&v75[16 * v71];
    *(void *)__n128 __p = v75;
    *(void *)&__p[8] = v76;
    *(void *)&__p[24] = &v75[16 * v77];
    *uint64_t v76 = v46;
    v76[1] = v68;
    *(void *)&__p[16] = v76 + 2;
    sub_20DB749F0(a3, __p);
LABEL_207:
    int v70 = (void *)a3[1];
    sub_20DB7020C((void **)__p);
    goto LABEL_208;
  }
  *char v58 = v46;
  v58[1] = v68;
LABEL_199:
  int v70 = v58 + 2;
  a3[1] = (uint64_t)(v58 + 2);
LABEL_208:
  a3[1] = (uint64_t)v70;
  if (v91.__r_.__value_.__l.__size_) {
    sub_20DB5E6A0((std::__shared_weak_count *)v91.__r_.__value_.__l.__size_);
  }
  if (v105.__r_.__value_.__r.__words[0])
  {
    v105.__r_.__value_.__l.__size_ = v105.__r_.__value_.__r.__words[0];
    operator delete(v105.__r_.__value_.__l.__data_);
  }
  if (v96 == 4)
  {
    *(void *)__n128 __p = &v97;
    sub_20DB7ABD8((void ***)__p);
  }
  else if (v96 == 3 && SHIBYTE(v98) < 0)
  {
    operator delete((void *)v97);
  }
  if (SHIBYTE(v101) < 0) {
    operator delete(v99);
  }
  if (SHIBYTE(v104) < 0) {
    operator delete(__s1);
  }
}

void sub_20DB73BD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,void **__p,uint64_t a28,int a29,__int16 a30,char a31,char a32,uint64_t a33,uint64_t a34,int a35,__int16 a36,char a37,char a38,void *a39,uint64_t a40,int a41,__int16 a42,char a43,char a44)
{
  if (a32 < 0) {
    operator delete(__p);
  }
  __n128 __p = &a39;
  sub_20DB7ABD8(&__p);
  sub_20DB5E714(&__p);
  uint64_t v46 = *(void **)(v44 - 120);
  if (v46)
  {
    *(void *)(v44 - 112) = v46;
    operator delete(v46);
  }
  sub_20DB6FFB4(v44 - 200);
  if (*(char *)(v44 - 145) < 0) {
    operator delete(*(void **)(v44 - 168));
  }
  if (*(char *)(v44 - 121) < 0) {
    operator delete(*(void **)(v44 - 144));
  }
  _Unwind_Resume(a1);
}

void sub_20DB73DE4(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X8>)
{
  sub_20DB72DAC((void *)a1, &v82);
  uint64_t v5 = v83;
  long long v6 = (__n128 *)v82.n128_u64[0];
  if ((v83 & 0x80u) == 0) {
    long long v6 = &v82;
  }
  unint64_t v7 = (__n128 *)((char *)v6->n128_u64 + 1);
  a3[2] = 0;
  uint64_t v66 = (uint64_t)(a3 + 2);
  *a3 = 0;
  a3[1] = 0;
  if ((v5 & 0x80) == 0) {
    goto LABEL_4;
  }
LABEL_6:
  if (v7 == (__n128 *)(v82.n128_u64[0] + v82.n128_u64[1]))
  {
    operator delete((void *)v82.n128_u64[0]);
    return;
  }
  do
  {
    unsigned __int8 v8 = v7->n128_u8[0];
    unint64_t v7 = (__n128 *)((char *)v7 + 1);
    char v81 = 2;
    LOBYTE(v80[0]) = 45;
    *(_WORD *)((char *)v80 + 1) = v8;
    __n128 __p = 0;
    uint64_t v78 = 0;
    long long v79 = 0;
    uint64_t v9 = *a2;
    uint64_t v10 = a2[1];
    if (*a2 == v10)
    {
LABEL_49:
      LODWORD(v84.__r_.__value_.__l.__data_) = 0;
      unint64_t v27 = a2[1];
      if (v27 >= a2[2])
      {
        uint64_t v28 = sub_20DB75E2C(a2, (uint64_t)v80, (char *)&unk_20DB7F171, (int *)&v84);
      }
      else
      {
        sub_20DB75F54(a2 + 16, a2[1], (uint64_t)v80, (char *)&unk_20DB7F171, (int *)&v84);
        uint64_t v28 = v27 + 120;
        a2[1] = v27 + 120;
      }
      a2[1] = v28;
      sub_20DB759F4(v28 - 120, &v73);
      if (*(unsigned char *)(a1 + 32))
      {
        LODWORD(v84.__r_.__value_.__l.__data_) = 1;
        v84.__r_.__value_.__s.__data_[8] = 1;
        sub_20DB6FEB4((uint64_t)v73.__r_.__value_.__l.__data_, (int *)&v84);
        if (LODWORD(v84.__r_.__value_.__l.__data_) == 4)
        {
          v76.__r_.__value_.__r.__words[0] = (std::string::size_type)&v84.__r_.__value_.__l.__size_;
          sub_20DB7ABD8((void ***)&v76);
        }
        else if (LODWORD(v84.__r_.__value_.__l.__data_) == 3 && SHIBYTE(v85) < 0)
        {
          operator delete((void *)v84.__r_.__value_.__l.__size_);
        }
      }
      long long v29 = *(_OWORD *)&v73.__r_.__value_.__l.__data_;
      std::string::size_type size = v73.__r_.__value_.__l.__size_;
      if (v73.__r_.__value_.__l.__size_) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(v73.__r_.__value_.__l.__size_ + 8), 1uLL, memory_order_relaxed);
      }
      std::string::size_type v32 = (void *)a3[1];
      unint64_t v31 = a3[2];
      if ((unint64_t)v32 >= v31)
      {
        long long v67 = v29;
        uint64_t v34 = ((uint64_t)v32 - *a3) >> 4;
        unint64_t v35 = v34 + 1;
        if ((unint64_t)(v34 + 1) >> 60) {
          sub_20DB5E168();
        }
        uint64_t v36 = v31 - *a3;
        if (v36 >> 3 > v35) {
          unint64_t v35 = v36 >> 3;
        }
        if ((unint64_t)v36 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v37 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v37 = v35;
        }
        int v86 = a3 + 2;
        uint64_t v38 = (char *)sub_20DB5E55C(v66, v37);
        unint64_t v39 = &v38[16 * v34];
        v84.__r_.__value_.__r.__words[0] = (std::string::size_type)v38;
        v84.__r_.__value_.__l.__size_ = (std::string::size_type)v39;
        long long v85 = &v38[16 * v40];
        *(_OWORD *)unint64_t v39 = v67;
        v84.__r_.__value_.__r.__words[2] = (std::string::size_type)(v39 + 16);
        sub_20DB749F0(a3, &v84);
        uint64_t v33 = (void *)a3[1];
        sub_20DB7020C((void **)&v84.__r_.__value_.__l.__data_);
      }
      else
      {
        *std::string::size_type v32 = v29;
        v32[1] = size;
        uint64_t v33 = v32 + 2;
        a3[1] = (uint64_t)(v32 + 2);
      }
      a3[1] = (uint64_t)v33;
      unint64_t v41 = (std::__shared_weak_count *)v73.__r_.__value_.__l.__size_;
      if (!v73.__r_.__value_.__l.__size_) {
        goto LABEL_71;
      }
LABEL_70:
      sub_20DB5E6A0(v41);
      goto LABEL_71;
    }
    int v11 = 0;
    do
    {
      uint64_t v12 = *(unsigned __int8 *)(v9 + 87);
      if ((v12 & 0x80u) == 0) {
        int64_t v13 = (const void *)*(unsigned __int8 *)(v9 + 87);
      }
      else {
        int64_t v13 = *(const void **)(v9 + 72);
      }
      unint64_t v14 = v81;
      if (v81 < 0) {
        unint64_t v14 = (unint64_t)v80[1];
      }
      if (v13 == (const void *)v14)
      {
        if (v81 >= 0) {
          uint64_t v15 = v80;
        }
        else {
          uint64_t v15 = (const void **)v80[0];
        }
        if ((v12 & 0x80) != 0)
        {
          if (memcmp(*(const void **)(v9 + 64), v15, *(void *)(v9 + 72))) {
            goto LABEL_42;
          }
LABEL_25:
          if (v11 >= v79)
          {
            uint64_t v17 = ((char *)v11 - (unsigned char *)__p) >> 3;
            if ((unint64_t)(v17 + 1) >> 61) {
              sub_20DB5E168();
            }
            unint64_t v18 = ((char *)v79 - (unsigned char *)__p) >> 2;
            if (v18 <= v17 + 1) {
              unint64_t v18 = v17 + 1;
            }
            if ((unint64_t)((char *)v79 - (unsigned char *)__p) >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v19 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v19 = v18;
            }
            if (v19) {
              int v20 = (char *)sub_20DB5E180((uint64_t)&v79, v19);
            }
            else {
              int v20 = 0;
            }
            uint64_t v21 = (uint64_t *)&v20[8 * v17];
            uint64_t *v21 = v9;
            int v11 = v21 + 1;
            uint64_t v23 = (char *)__p;
            uint64_t v22 = (char *)v78;
            if (v78 != __p)
            {
              do
              {
                uint64_t v24 = *((void *)v22 - 1);
                v22 -= 8;
                *--uint64_t v21 = v24;
              }
              while (v22 != v23);
              uint64_t v22 = (char *)__p;
            }
            __n128 __p = v21;
            uint64_t v78 = v11;
            long long v79 = (uint64_t *)&v20[8 * v19];
            if (v22) {
              operator delete(v22);
            }
          }
          else
          {
            *v11++ = v9;
          }
          uint64_t v78 = v11;
          goto LABEL_42;
        }
        if (!*(unsigned char *)(v9 + 87)) {
          goto LABEL_25;
        }
        uint64_t v16 = 0;
        while (*(unsigned __int8 *)(v9 + v16 + 64) == *((unsigned __int8 *)v15 + v16))
        {
          if (v12 == ++v16) {
            goto LABEL_25;
          }
        }
      }
LABEL_42:
      v9 += 120;
    }
    while (v9 != v10);
    if ((unint64_t)((char *)v11 - (unsigned char *)__p) > 8)
    {
      sub_20DB5D988(" is specified ambiguously ", v80, (void **)&v76.__r_.__value_.__l.__data_);
      std::to_string(&v75, ((char *)v78 - (unsigned char *)__p) >> 3);
      if ((v75.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        char v58 = &v75;
      }
      else {
        char v58 = (std::string *)v75.__r_.__value_.__r.__words[0];
      }
      if ((v75.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v59 = HIBYTE(v75.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v59 = v75.__r_.__value_.__l.__size_;
      }
      unint64_t v60 = std::string::append(&v76, (const std::string::value_type *)v58, v59);
      long long v61 = *(_OWORD *)&v60->__r_.__value_.__l.__data_;
      v73.__r_.__value_.__r.__words[2] = v60->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v73.__r_.__value_.__l.__data_ = v61;
      v60->__r_.__value_.__l.__size_ = 0;
      v60->__r_.__value_.__r.__words[2] = 0;
      v60->__r_.__value_.__r.__words[0] = 0;
      unint64_t v62 = std::string::append(&v73, " times");
      long long v63 = *(_OWORD *)&v62->__r_.__value_.__l.__data_;
      v84.__r_.__value_.__r.__words[2] = v62->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v84.__r_.__value_.__l.__data_ = v63;
      v62->__r_.__value_.__l.__size_ = 0;
      v62->__r_.__value_.__r.__words[2] = 0;
      v62->__r_.__value_.__r.__words[0] = 0;
      if (SHIBYTE(v73.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v73.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v75.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v75.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v76.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v76.__r_.__value_.__l.__data_);
      }
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, &v84);
      exception->__vftable = (std::runtime_error_vtbl *)&unk_26C2447A8;
      __cxa_throw(exception, (struct type_info *)&unk_26C2442B8, (void (*)(void *))std::runtime_error::~runtime_error);
    }
    if (__p == v11) {
      goto LABEL_49;
    }
    sub_20DB75D74(*(void *)__p, &v76);
    LODWORD(v73.__r_.__value_.__l.__data_) = 0;
    if (!*(_DWORD *)(v76.__r_.__value_.__r.__words[0] + 112)) {
      goto LABEL_116;
    }
    if ((char)v83 < 0)
    {
      unint64_t v25 = v82.n128_u64[1];
      uint64_t v26 = (__n128 *)v82.n128_u64[0];
      if (v7 == (__n128 *)(v82.n128_u64[0] + v82.n128_u64[1])) {
        goto LABEL_81;
      }
LABEL_78:
      sub_20DB65760(v69, (char *)v7, (char *)v26 + v25, (char *)v26 + v25 - (char *)v7);
      LODWORD(v84.__r_.__value_.__l.__data_) = 3;
      *(_OWORD *)&v84.__r_.__value_.__r.__words[1] = *(_OWORD *)v69;
      long long v85 = v70;
      v69[0] = 0;
      v69[1] = 0;
      int v70 = 0;
      if (LODWORD(v73.__r_.__value_.__l.__data_) == 3)
      {
        if (SHIBYTE(v74) < 0) {
          operator delete((void *)v73.__r_.__value_.__l.__size_);
        }
      }
      else
      {
        if (LODWORD(v73.__r_.__value_.__l.__data_) != 4)
        {
          LODWORD(v73.__r_.__value_.__l.__data_) = 3;
LABEL_90:
          *(_OWORD *)&v73.__r_.__value_.__r.__words[1] = *(_OWORD *)&v84.__r_.__value_.__r.__words[1];
          unint64_t v74 = v85;
          long long v85 = 0;
          *(_OWORD *)&v84.__r_.__value_.__r.__words[1] = 0uLL;
LABEL_96:
          if (SHIBYTE(v70) < 0) {
            operator delete(v69[0]);
          }
          unint64_t v44 = v83;
          uint64_t v45 = &v82;
          if ((v83 & 0x80u) != 0)
          {
            unint64_t v44 = v82.n128_u64[1];
            uint64_t v45 = (__n128 *)v82.n128_u64[0];
          }
          unint64_t v7 = (__n128 *)((char *)v45 + v44);
          goto LABEL_116;
        }
        v75.__r_.__value_.__r.__words[0] = (std::string::size_type)&v73.__r_.__value_.__l.__size_;
        sub_20DB7ABD8((void ***)&v75);
      }
      LODWORD(v73.__r_.__value_.__l.__data_) = v84.__r_.__value_.__l.__data_;
      switch(LODWORD(v84.__r_.__value_.__l.__data_))
      {
        case 1:
          v73.__r_.__value_.__s.__data_[8] = v84.__r_.__value_.__s.__data_[8];
          break;
        case 2:
          v73.__r_.__value_.__l.__size_ = v84.__r_.__value_.__l.__size_;
          break;
        case 3:
          goto LABEL_90;
        case 4:
          *(_OWORD *)&v73.__r_.__value_.__r.__words[1] = *(_OWORD *)&v84.__r_.__value_.__r.__words[1];
          unint64_t v74 = v85;
          long long v85 = 0;
          *(_OWORD *)&v84.__r_.__value_.__r.__words[1] = 0uLL;
          v75.__r_.__value_.__r.__words[0] = (std::string::size_type)&v84.__r_.__value_.__l.__size_;
          sub_20DB7ABD8((void ***)&v75);
          break;
        default:
          goto LABEL_96;
      }
      goto LABEL_96;
    }
    unint64_t v25 = v83;
    if (v7 != (__n128 *)((char *)&v82 + v83))
    {
      uint64_t v26 = &v82;
      goto LABEL_78;
    }
LABEL_81:
    uint64_t v42 = sub_20DB72C94((void *)a1);
    if ((*((char *)v42 + 23) & 0x80000000) == 0)
    {
      if (*((unsigned char *)v42 + 23) != 2)
      {
        if (!*((unsigned char *)v42 + 23)) {
          goto LABEL_165;
        }
        goto LABEL_103;
      }
LABEL_102:
      if (*(_WORD *)v42 == 11565) {
        goto LABEL_165;
      }
      goto LABEL_103;
    }
    uint64_t v43 = v42[1];
    if (v43 == 2)
    {
      uint64_t v42 = (uint64_t *)*v42;
      goto LABEL_102;
    }
    if (!v43)
    {
LABEL_165:
      sub_20DB5D988(" requires an argument", v80, (void **)&v84.__r_.__value_.__l.__data_);
      uint64_t v65 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(v65, &v84);
      v65->__vftable = (std::runtime_error_vtbl *)&unk_26C2447A8;
      __cxa_throw(v65, (struct type_info *)&unk_26C2442B8, (void (*)(void *))std::runtime_error::~runtime_error);
    }
LABEL_103:
    sub_20DB72DAC((void *)a1, (__n128 *)v71);
    LODWORD(v84.__r_.__value_.__l.__data_) = 3;
    *(_OWORD *)&v84.__r_.__value_.__r.__words[1] = *(_OWORD *)v71;
    long long v85 = v72;
    v71[0] = 0;
    v71[1] = 0;
    unint64_t v72 = 0;
    if (LODWORD(v73.__r_.__value_.__l.__data_) == 3)
    {
      if (SHIBYTE(v74) < 0) {
        operator delete((void *)v73.__r_.__value_.__l.__size_);
      }
LABEL_108:
      LODWORD(v73.__r_.__value_.__l.__data_) = v84.__r_.__value_.__l.__data_;
      switch(LODWORD(v84.__r_.__value_.__l.__data_))
      {
        case 1:
          v73.__r_.__value_.__s.__data_[8] = v84.__r_.__value_.__s.__data_[8];
          break;
        case 2:
          v73.__r_.__value_.__l.__size_ = v84.__r_.__value_.__l.__size_;
          break;
        case 3:
          goto LABEL_111;
        case 4:
          *(_OWORD *)&v73.__r_.__value_.__r.__words[1] = *(_OWORD *)&v84.__r_.__value_.__r.__words[1];
          unint64_t v74 = v85;
          long long v85 = 0;
          *(_OWORD *)&v84.__r_.__value_.__r.__words[1] = 0uLL;
          v75.__r_.__value_.__r.__words[0] = (std::string::size_type)&v84.__r_.__value_.__l.__size_;
          sub_20DB7ABD8((void ***)&v75);
          break;
        default:
          break;
      }
    }
    else
    {
      if (LODWORD(v73.__r_.__value_.__l.__data_) == 4)
      {
        v75.__r_.__value_.__r.__words[0] = (std::string::size_type)&v73.__r_.__value_.__l.__size_;
        sub_20DB7ABD8((void ***)&v75);
        goto LABEL_108;
      }
      LODWORD(v73.__r_.__value_.__l.__data_) = 3;
LABEL_111:
      *(_OWORD *)&v73.__r_.__value_.__r.__words[1] = *(_OWORD *)&v84.__r_.__value_.__r.__words[1];
      unint64_t v74 = v85;
      long long v85 = 0;
      *(_OWORD *)&v84.__r_.__value_.__r.__words[1] = 0uLL;
    }
    if (SHIBYTE(v72) < 0) {
      operator delete(v71[0]);
    }
LABEL_116:
    std::string::size_type v46 = v76.__r_.__value_.__r.__words[0];
    if (*(unsigned char *)(a1 + 32))
    {
      if (LODWORD(v73.__r_.__value_.__l.__data_))
      {
        LODWORD(v84.__r_.__value_.__l.__data_) = v73.__r_.__value_.__l.__data_;
        switch(LODWORD(v73.__r_.__value_.__l.__data_))
        {
          case 1:
            v84.__r_.__value_.__s.__data_[8] = v73.__r_.__value_.__s.__data_[8];
            break;
          case 2:
            v84.__r_.__value_.__l.__size_ = v73.__r_.__value_.__l.__size_;
            break;
          case 3:
            *(_OWORD *)&v84.__r_.__value_.__r.__words[1] = *(_OWORD *)&v73.__r_.__value_.__r.__words[1];
            long long v85 = v74;
            unint64_t v74 = 0;
            *(_OWORD *)&v73.__r_.__value_.__r.__words[1] = 0uLL;
            break;
          case 4:
            *(_OWORD *)&v84.__r_.__value_.__r.__words[1] = *(_OWORD *)&v73.__r_.__value_.__r.__words[1];
            long long v85 = v74;
            unint64_t v74 = 0;
            *(_OWORD *)&v73.__r_.__value_.__r.__words[1] = 0uLL;
            break;
          default:
            break;
        }
      }
      else
      {
        LODWORD(v84.__r_.__value_.__l.__data_) = 1;
        v84.__r_.__value_.__s.__data_[8] = 1;
      }
      sub_20DB6FEB4((uint64_t)v76.__r_.__value_.__l.__data_, (int *)&v84);
      if (LODWORD(v84.__r_.__value_.__l.__data_) == 4)
      {
        v75.__r_.__value_.__r.__words[0] = (std::string::size_type)&v84.__r_.__value_.__l.__size_;
        sub_20DB7ABD8((void ***)&v75);
      }
      else if (LODWORD(v84.__r_.__value_.__l.__data_) == 3 && SHIBYTE(v85) < 0)
      {
        operator delete((void *)v84.__r_.__value_.__l.__size_);
      }
      std::string::size_type v46 = v76.__r_.__value_.__r.__words[0];
    }
    std::string::size_type v47 = v76.__r_.__value_.__l.__size_;
    if (v76.__r_.__value_.__l.__size_) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v76.__r_.__value_.__l.__size_ + 8), 1uLL, memory_order_relaxed);
    }
    char v49 = (std::string::size_type *)a3[1];
    unint64_t v48 = a3[2];
    if ((unint64_t)v49 >= v48)
    {
      uint64_t v51 = ((uint64_t)v49 - *a3) >> 4;
      unint64_t v52 = v51 + 1;
      if ((unint64_t)(v51 + 1) >> 60) {
        sub_20DB5E168();
      }
      uint64_t v53 = v48 - *a3;
      if (v53 >> 3 > v52) {
        unint64_t v52 = v53 >> 3;
      }
      if ((unint64_t)v53 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v54 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v54 = v52;
      }
      int v86 = a3 + 2;
      long long v55 = (char *)sub_20DB5E55C(v66, v54);
      std::string::size_type v56 = (std::string::size_type *)&v55[16 * v51];
      v84.__r_.__value_.__r.__words[0] = (std::string::size_type)v55;
      v84.__r_.__value_.__l.__size_ = (std::string::size_type)v56;
      long long v85 = &v55[16 * v57];
      *std::string::size_type v56 = v46;
      v56[1] = v47;
      v84.__r_.__value_.__r.__words[2] = (std::string::size_type)(v56 + 2);
      sub_20DB749F0(a3, &v84);
      uint64_t v50 = (void *)a3[1];
      sub_20DB7020C((void **)&v84.__r_.__value_.__l.__data_);
    }
    else
    {
      *char v49 = v46;
      v49[1] = v47;
      uint64_t v50 = v49 + 2;
      a3[1] = (uint64_t)(v49 + 2);
    }
    a3[1] = (uint64_t)v50;
    if (LODWORD(v73.__r_.__value_.__l.__data_) == 4)
    {
      v84.__r_.__value_.__r.__words[0] = (std::string::size_type)&v73.__r_.__value_.__l.__size_;
      sub_20DB7ABD8((void ***)&v84);
    }
    else if (LODWORD(v73.__r_.__value_.__l.__data_) == 3 && SHIBYTE(v74) < 0)
    {
      operator delete((void *)v73.__r_.__value_.__l.__size_);
    }
    unint64_t v41 = (std::__shared_weak_count *)v76.__r_.__value_.__l.__size_;
    if (v76.__r_.__value_.__l.__size_) {
      goto LABEL_70;
    }
LABEL_71:
    if (__p)
    {
      uint64_t v78 = (uint64_t *)__p;
      operator delete(__p);
    }
    if (v81 < 0) {
      operator delete((void *)v80[0]);
    }
    uint64_t v5 = v83;
    if ((v83 & 0x80) != 0) {
      goto LABEL_6;
    }
LABEL_4:
    ;
  }
  while (v7 != (__n128 *)((char *)&v82 + v5));
}

void sub_20DB74844(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28,uint64_t a29,uint64_t a30,void *a31,uint64_t a32,int a33,__int16 a34,char a35,char a36,uint64_t a37,uint64_t a38,int a39,__int16 a40,char a41,char a42,void *__p,uint64_t a44)
{
  if (*(char *)(v44 - 121) < 0) {
    operator delete(*(void **)(v44 - 144));
  }
  if (__p)
  {
    a44 = (uint64_t)__p;
    operator delete(__p);
  }
  if (*(char *)(v44 - 169) < 0) {
    operator delete(*(void **)(v44 - 192));
  }
  sub_20DB5E714((void ***)&a23);
  if (*(char *)(v44 - 145) < 0) {
    operator delete(*(void **)(v44 - 168));
  }
  _Unwind_Resume(a1);
}

uint64_t sub_20DB749F0(uint64_t *a1, void *a2)
{
  uint64_t result = sub_20DB74A68((uint64_t)(a1 + 2), a1[1], (void *)a1[1], *a1, (void *)*a1, a2[1], a2[1]);
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

uint64_t sub_20DB74A68(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7)
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
    uint64_t v8 = (_OWORD *)(a7 - 16);
    do
    {
      long long v9 = *((_OWORD *)a3 - 1);
      a3 -= 2;
      *uint64_t v8 = v9;
      *a3 = 0;
      a3[1] = 0;
      *((void *)&v15 + 1) = v8;
      v7 -= 16;
      --v8;
    }
    while (a3 != a5);
    uint64_t v10 = v15;
  }
  char v13 = 1;
  sub_20DB74AFC((uint64_t)v12);
  return v10;
}

uint64_t sub_20DB74AFC(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    sub_20DB701C8(a1);
  }
  return a1;
}

uint64_t sub_20DB74B34@<X0>(long long *a1@<X1>, void *a2@<X8>)
{
  long long v4 = (char *)operator new(0x38uLL);
  uint64_t result = sub_20DB74B90((uint64_t)v4, a1);
  *a2 = v4 + 24;
  a2[1] = v4;
  return result;
}

void sub_20DB74B7C(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_20DB74B90(uint64_t a1, long long *a2)
{
  *(_OWORD *)(a1 + 8) = 0u;
  *(void *)a1 = &unk_26C2450C0;
  uint64_t v3 = *((void *)a2 + 2);
  long long v4 = *a2;
  *(void *)a2 = 0;
  *(long long *)((char *)a2 + 8) = 0u;
  *(_OWORD *)(a1 + 32) = v4;
  *(void *)(a1 + 48) = v3;
  uint64_t v6 = 0;
  long long v7 = 0u;
  *(void *)(a1 + 24) = &unk_26C244AF0;
  uint64_t v8 = (void **)&v6;
  sub_20DB5E714(&v8);
  return a1;
}

void sub_20DB74C30(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C2450C0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_20DB74C50(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C2450C0;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x210564B70);
}

uint64_t sub_20DB74CA4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 24) + 48))();
}

uint64_t sub_20DB74CCC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(uint64_t **)(a1 + 8);
  long long v4 = *(uint64_t **)(a1 + 16);
  while (v3 != v4)
  {
    uint64_t v7 = *v3;
    v3 += 2;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)v7 + 16))(v7, a2, a3);
  }
  return 1;
}

uint64_t sub_20DB74D40(uint64_t a1)
{
  *(void *)a1 = &unk_26C244828;
  uint64_t v3 = (void **)(a1 + 8);
  sub_20DB5E714(&v3);
  return a1;
}

uint64_t sub_20DB74D98(uint64_t a1)
{
  *(void *)a1 = &unk_26C244828;
  uint64_t v3 = (void **)(a1 + 8);
  sub_20DB5E714(&v3);
  return MEMORY[0x210564B70](a1, 0xA1C4030951706);
}

uint64_t sub_20DB74E04@<X0>(long long *a1@<X1>, void *a2@<X8>)
{
  long long v4 = (char *)operator new(0x38uLL);
  uint64_t result = sub_20DB74E60((uint64_t)v4, a1);
  *a2 = v4 + 24;
  a2[1] = v4;
  return result;
}

void sub_20DB74E4C(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_20DB74E60(uint64_t a1, long long *a2)
{
  *(_OWORD *)(a1 + 8) = 0u;
  *(void *)a1 = &unk_26C2450F8;
  uint64_t v3 = *((void *)a2 + 2);
  long long v4 = *a2;
  *(void *)a2 = 0;
  *(long long *)((char *)a2 + 8) = 0u;
  *(_OWORD *)(a1 + 32) = v4;
  *(void *)(a1 + 48) = v3;
  uint64_t v6 = 0;
  long long v7 = 0u;
  *(void *)(a1 + 24) = &unk_26C244B50;
  uint64_t v8 = (void **)&v6;
  sub_20DB5E714(&v8);
  return a1;
}

void sub_20DB74F00(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C2450F8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_20DB74F20(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C2450F8;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x210564B70);
}

uint64_t sub_20DB74F74(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 24) + 48))();
}

uint64_t sub_20DB74F9C@<X0>(void *a1@<X8>)
{
  unint64_t v2 = (char *)operator new(0x38uLL);
  uint64_t result = sub_20DB74FE8((uint64_t)v2);
  *a1 = v2 + 24;
  a1[1] = v2;
  return result;
}

void sub_20DB74FD4(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_20DB74FE8(uint64_t a1)
{
  *(_OWORD *)(a1 + 8) = 0u;
  *(void *)a1 = &unk_26C244FA8;
  *(void *)(a1 + 24) = &unk_26C244828;
  *(void *)(a1 + 32) = 0;
  *(_OWORD *)(a1 + 40) = 0u;
  uint64_t v3 = 0;
  long long v4 = 0u;
  uint64_t v5 = (void **)&v3;
  sub_20DB5E714(&v5);
  *(void *)(a1 + 24) = &unk_26C2448B0;
  return a1;
}

void sub_20DB75090(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C244FA8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_20DB750B0(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C244FA8;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x210564B70);
}

uint64_t sub_20DB75104(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 24) + 48))();
}

uint64_t sub_20DB7512C(uint64_t a1)
{
  *(void *)a1 = &unk_26C244828;
  uint64_t v3 = (void **)(a1 + 8);
  sub_20DB5E714(&v3);
  return a1;
}

uint64_t sub_20DB75184(uint64_t a1)
{
  *(void *)a1 = &unk_26C244828;
  uint64_t v3 = (void **)(a1 + 8);
  sub_20DB5E714(&v3);
  return MEMORY[0x210564B70](a1, 0xA1C4030951706);
}

uint64_t sub_20DB751F0(uint64_t a1)
{
  if (*(char *)(a1 + 71) < 0) {
    operator delete(*(void **)(a1 + 48));
  }
  if (*(char *)(a1 + 47) < 0) {
    operator delete(*(void **)(a1 + 24));
  }
  if (*(char *)(a1 + 23) < 0) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void sub_20DB75244(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X8>)
{
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  uint64_t v8 = a3;
  if (a1 != a2)
  {
    long long v4 = a1;
    do
    {
      uint64_t v5 = *v4;
      if (*(char *)(*v4 + 111) < 0)
      {
        sub_20DB66FF4(__p, *(void **)(v5 + 88), *(void *)(v5 + 96));
      }
      else
      {
        *(_OWORD *)__n128 __p = *(_OWORD *)(v5 + 88);
        uint64_t v7 = *(void *)(v5 + 104);
      }
      sub_20DB75624(&v8, (long long *)__p);
      if (SHIBYTE(v7) < 0) {
        operator delete(__p[0]);
      }
      ++v4;
    }
    while (v4 != a2);
  }
}

void sub_20DB752E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
}

char *sub_20DB75314@<X0>(char *result@<X0>, char *a2@<X1>, uint64_t a3@<X2>, std::string *a4@<X8>)
{
  if (result == a2)
  {
    a4->__r_.__value_.__r.__words[0] = 0;
    a4->__r_.__value_.__l.__size_ = 0;
    a4->__r_.__value_.__r.__words[2] = 0;
  }
  else
  {
    uint64_t v7 = result;
    if (result[23] < 0)
    {
      uint64_t result = (char *)sub_20DB66FF4(a4, *(void **)result, *((void *)result + 1));
    }
    else
    {
      long long v8 = *(_OWORD *)result;
      a4->__r_.__value_.__r.__words[2] = *((void *)result + 2);
      *(_OWORD *)&a4->__r_.__value_.__l.__data_ = v8;
    }
    for (uint64_t i = v7 + 24; i != a2; i += 24)
    {
      int v10 = *(char *)(a3 + 23);
      if (v10 >= 0) {
        int v11 = (const std::string::value_type *)a3;
      }
      else {
        int v11 = *(const std::string::value_type **)a3;
      }
      if (v10 >= 0) {
        std::string::size_type v12 = *(unsigned __int8 *)(a3 + 23);
      }
      else {
        std::string::size_type v12 = *(void *)(a3 + 8);
      }
      std::string::append(a4, v11, v12);
      int v13 = i[23];
      if (v13 >= 0) {
        long long v14 = i;
      }
      else {
        long long v14 = *(const std::string::value_type **)i;
      }
      if (v13 >= 0) {
        std::string::size_type v15 = i[23];
      }
      else {
        std::string::size_type v15 = *((void *)i + 1);
      }
      uint64_t result = (char *)std::string::append(a4, v14, v15);
    }
  }
  return result;
}

void sub_20DB753D4(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void **sub_20DB753F4(uint64_t *a1, uint64_t a2)
{
  unint64_t v6 = a1[2];
  uint64_t result = (void **)(a1 + 2);
  unint64_t v5 = v6;
  uint64_t v7 = *(result - 1);
  if ((unint64_t)v7 >= v6)
  {
    uint64_t v9 = ((uint64_t)v7 - *a1) >> 4;
    if ((unint64_t)(v9 + 1) >> 60) {
      sub_20DB5E168();
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
    v16[4] = result;
    int v13 = (char *)sub_20DB5E55C((uint64_t)result, v12);
    long long v14 = &v13[16 * v9];
    v16[0] = v13;
    v16[1] = v14;
    v16[3] = &v13[16 * v15];
    *(_OWORD *)long long v14 = *(_OWORD *)a2;
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
    v16[2] = v14 + 16;
    sub_20DB749F0(a1, v16);
    long long v8 = (_OWORD *)a1[1];
    uint64_t result = sub_20DB7020C(v16);
  }
  else
  {
    *uint64_t v7 = *(_OWORD *)a2;
    long long v8 = v7 + 1;
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
    a1[1] = (uint64_t)v8;
  }
  a1[1] = (uint64_t)v8;
  return result;
}

void sub_20DB754D0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_20DB7020C((void **)va);
  _Unwind_Resume(a1);
}

void sub_20DB754E4(void *a1, long long *a2)
{
  v14[2] = *MEMORY[0x263EF8340];
  uint64_t v4 = *a1;
  if (*(char *)(*a1 + 23) < 0) {
    operator delete(*(void **)v4);
  }
  long long v5 = *a2;
  *(void *)(v4 + 16) = *((void *)a2 + 2);
  *(_OWORD *)uint64_t v4 = v5;
  *((unsigned char *)a2 + 23) = 0;
  *(unsigned char *)a2 = 0;
  uint64_t v6 = a1[1];
  if (*(char *)(v6 + 23) < 0) {
    operator delete(*(void **)v6);
  }
  long long v7 = *(long long *)((char *)a2 + 24);
  *(void *)(v6 + 16) = *((void *)a2 + 5);
  *(_OWORD *)uint64_t v6 = v7;
  *((unsigned char *)a2 + 47) = 0;
  *((unsigned char *)a2 + 24) = 0;
  uint64_t v8 = *((void *)a2 + 6);
  v13[0] = *((void *)a2 + 7);
  *(void *)((char *)v13 + 7) = *(void *)((char *)a2 + 63);
  char v9 = *((unsigned char *)a2 + 71);
  *((void *)a2 + 7) = 0;
  *((void *)a2 + 8) = 0;
  *((void *)a2 + 6) = 0;
  v14[0] = v13[0];
  *(void *)((char *)v14 + 7) = *(void *)((char *)v13 + 7);
  uint64_t v10 = a1[2];
  if (*(_DWORD *)v10 == 4)
  {
    unint64_t v12 = (void **)(v10 + 8);
    sub_20DB7ABD8(&v12);
  }
  else if (*(_DWORD *)v10 == 3 && *(char *)(v10 + 31) < 0)
  {
    operator delete(*(void **)(v10 + 8));
  }
  *(_DWORD *)uint64_t v10 = 3;
  uint64_t v11 = v14[0];
  *(void *)(v10 + 8) = v8;
  *(void *)(v10 + 16) = v11;
  *(void *)(v10 + 23) = *(void *)((char *)v14 + 7);
  *(unsigned char *)(v10 + 31) = v9;
}

uint64_t **sub_20DB75624(uint64_t **a1, long long *a2)
{
  uint64_t v4 = *a1;
  unint64_t v5 = (*a1)[1];
  uint64_t v6 = *a1;
  unint64_t v9 = v6[2];
  uint64_t v7 = (uint64_t)(v6 + 2);
  unint64_t v8 = v9;
  if (v5 >= v9)
  {
    unint64_t v12 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v5 - *v4) >> 3);
    unint64_t v13 = v12 + 1;
    if (v12 + 1 > 0xAAAAAAAAAAAAAAALL) {
      sub_20DB5E168();
    }
    unint64_t v14 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v8 - *v4) >> 3);
    if (2 * v14 > v13) {
      unint64_t v13 = 2 * v14;
    }
    if (v14 >= 0x555555555555555) {
      unint64_t v15 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v15 = v13;
    }
    v20[4] = v7;
    if (v15) {
      uint64_t v16 = (char *)sub_20DB622B0(v7, v15);
    }
    else {
      uint64_t v16 = 0;
    }
    uint64_t v17 = &v16[24 * v12];
    v20[0] = v16;
    v20[1] = v17;
    v20[3] = &v16[24 * v15];
    long long v18 = *a2;
    *((void *)v17 + 2) = *((void *)a2 + 2);
    *(_OWORD *)uint64_t v17 = v18;
    *((void *)a2 + 1) = 0;
    *((void *)a2 + 2) = 0;
    *(void *)a2 = 0;
    v20[2] = v17 + 24;
    sub_20DB67094(v4, v20);
    uint64_t v11 = v4[1];
    sub_20DB6722C((uint64_t)v20);
  }
  else
  {
    long long v10 = *a2;
    *(void *)(v5 + 16) = *((void *)a2 + 2);
    *(_OWORD *)unint64_t v5 = v10;
    *((void *)a2 + 1) = 0;
    *((void *)a2 + 2) = 0;
    *(void *)a2 = 0;
    uint64_t v11 = v5 + 24;
    v4[1] = v5 + 24;
  }
  v4[1] = v11;
  return a1;
}

void sub_20DB75758(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_20DB6722C((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_20DB7576C(std::runtime_error *a1)
{
  std::runtime_error::~runtime_error(a1);

  JUMPOUT(0x210564B70);
}

uint64_t sub_20DB757A4(uint64_t *a1, char *a2, uint64_t a3, int *a4)
{
  unint64_t v5 = 0xEEEEEEEEEEEEEEEFLL * ((a1[1] - *a1) >> 3);
  unint64_t v6 = v5 + 1;
  if (v5 + 1 > 0x222222222222222) {
    sub_20DB5E168();
  }
  if (0xDDDDDDDDDDDDDDDELL * ((a1[2] - *a1) >> 3) > v6) {
    unint64_t v6 = 0xDDDDDDDDDDDDDDDELL * ((a1[2] - *a1) >> 3);
  }
  if (0xEEEEEEEEEEEEEEEFLL * ((a1[2] - *a1) >> 3) >= 0x111111111111111) {
    unint64_t v10 = 0x222222222222222;
  }
  else {
    unint64_t v10 = v6;
  }
  long long v18 = a1 + 2;
  if (v10) {
    uint64_t v11 = (char *)sub_20DB70D68((uint64_t)(a1 + 2), v10);
  }
  else {
    uint64_t v11 = 0;
  }
  unint64_t v14 = v11;
  unint64_t v15 = &v11[120 * v5];
  uint64_t v17 = &v11[120 * v10];
  sub_20DB758CC(a1 + 16, (uint64_t)v15, a2, a3, a4);
  uint64_t v16 = v15 + 120;
  sub_20DB70CF0(a1, &v14);
  uint64_t v12 = a1[1];
  sub_20DB70F90(&v14);
  return v12;
}

void sub_20DB758B8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_20DB70F90((void **)va);
  _Unwind_Resume(a1);
}

void sub_20DB758CC(int a1, uint64_t a2, char *__s, uint64_t a4, int *a5)
{
  sub_20DB7AA9C(v14, __s);
  if (*(char *)(a4 + 23) < 0)
  {
    sub_20DB66FF4(__dst, *(void **)a4, *(void *)(a4 + 8));
  }
  else
  {
    *(_OWORD *)__dst = *(_OWORD *)a4;
    uint64_t v13 = *(void *)(a4 + 16);
  }
  int v8 = *a5;
  int v9 = 1;
  LOBYTE(__p) = 0;
  sub_20DB7100C(a2, (long long *)v14, (long long *)__dst, v8, (uint64_t)&v9);
  if (v9 == 4)
  {
    p_p = &__p;
    sub_20DB7ABD8(&p_p);
  }
  else if (v9 == 3 && v11 < 0)
  {
    operator delete(__p);
  }
  if (SHIBYTE(v13) < 0) {
    operator delete(__dst[0]);
  }
  if (v15 < 0) {
    operator delete(v14[0]);
  }
}

void sub_20DB759B8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, void *__p,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  if (a25 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *sub_20DB759F4@<X0>(uint64_t a1@<X1>, void *a2@<X8>)
{
  uint64_t v4 = operator new(0x90uLL);
  uint64_t result = sub_20DB75A50(v4, a1);
  *a2 = v4 + 3;
  a2[1] = v4;
  return result;
}

void sub_20DB75A3C(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *sub_20DB75A50(void *a1, uint64_t a2)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = &unk_26C245018;
  sub_20DB75B4C((uint64_t)(a1 + 3), a2);
  return a1;
}

void sub_20DB75A98(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void sub_20DB75AAC(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C245018;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_20DB75ACC(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C245018;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x210564B70);
}

void sub_20DB75B20(uint64_t a1)
{
  sub_20DB70EE4((uint64_t)&v1, a1 + 24);
}

uint64_t sub_20DB75B4C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_20DB75C2C(a1, a2);
  *(void *)uint64_t v4 = &unk_26C2449E8;
  if (*(char *)(a2 + 87) < 0)
  {
    sub_20DB66FF4((unsigned char *)(v4 + 64), *(void **)(a2 + 64), *(void *)(a2 + 72));
  }
  else
  {
    long long v5 = *(_OWORD *)(a2 + 64);
    *(void *)(v4 + 80) = *(void *)(a2 + 80);
    *(_OWORD *)(v4 + 64) = v5;
  }
  unint64_t v6 = (unsigned char *)(a1 + 88);
  if (*(char *)(a2 + 111) < 0)
  {
    sub_20DB66FF4(v6, *(void **)(a2 + 88), *(void *)(a2 + 96));
  }
  else
  {
    long long v7 = *(_OWORD *)(a2 + 88);
    *(void *)(a1 + 104) = *(void *)(a2 + 104);
    *(_OWORD *)unint64_t v6 = v7;
  }
  *(_DWORD *)(a1 + 112) = *(_DWORD *)(a2 + 112);
  return a1;
}

void sub_20DB75C00(_Unwind_Exception *a1)
{
  if (*(char *)(v1 + 87) < 0) {
    operator delete(*v2);
  }
  sub_20DB71354(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_20DB75C2C(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = &unk_26C2447D0;
  if (*(char *)(a2 + 31) < 0)
  {
    sub_20DB66FF4((unsigned char *)(a1 + 8), *(void **)(a2 + 8), *(void *)(a2 + 16));
  }
  else
  {
    long long v4 = *(_OWORD *)(a2 + 8);
    *(void *)(a1 + 24) = *(void *)(a2 + 24);
    *(_OWORD *)(a1 + 8) = v4;
  }
  int v5 = *(_DWORD *)(a2 + 32);
  *(_DWORD *)(a1 + 32) = v5;
  unint64_t v6 = (char *)(a1 + 40);
  switch(v5)
  {
    case 1:
      char *v6 = *(unsigned char *)(a2 + 40);
      break;
    case 2:
      *(void *)unint64_t v6 = *(void *)(a2 + 40);
      break;
    case 3:
      if (*(char *)(a2 + 63) < 0)
      {
        sub_20DB66FF4(v6, *(void **)(a2 + 40), *(void *)(a2 + 48));
      }
      else
      {
        long long v7 = *(_OWORD *)(a2 + 40);
        *(void *)(a1 + 56) = *(void *)(a2 + 56);
        *(_OWORD *)unint64_t v6 = v7;
      }
      break;
    case 4:
      *(void *)unint64_t v6 = 0;
      *(void *)(a1 + 48) = 0;
      *(void *)(a1 + 56) = 0;
      sub_20DB7AB50(v6, *(long long **)(a2 + 40), *(long long **)(a2 + 48), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a2 + 48) - *(void *)(a2 + 40)) >> 3));
      break;
    default:
      return a1;
  }
  return a1;
}

void sub_20DB75D48(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 31) < 0) {
    operator delete(*v2);
  }
  _Unwind_Resume(exception_object);
}

void *sub_20DB75D74@<X0>(uint64_t a1@<X1>, void *a2@<X8>)
{
  long long v4 = operator new(0x90uLL);
  uint64_t result = sub_20DB75DD0(v4, a1);
  *a2 = v4 + 3;
  a2[1] = v4;
  return result;
}

void sub_20DB75DBC(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *sub_20DB75DD0(void *a1, uint64_t a2)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = &unk_26C245018;
  sub_20DB75B4C((uint64_t)(a1 + 3), a2);
  return a1;
}

void sub_20DB75E18(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_20DB75E2C(uint64_t *a1, uint64_t a2, char *a3, int *a4)
{
  unint64_t v5 = 0xEEEEEEEEEEEEEEEFLL * ((a1[1] - *a1) >> 3);
  unint64_t v6 = v5 + 1;
  if (v5 + 1 > 0x222222222222222) {
    sub_20DB5E168();
  }
  if (0xDDDDDDDDDDDDDDDELL * ((a1[2] - *a1) >> 3) > v6) {
    unint64_t v6 = 0xDDDDDDDDDDDDDDDELL * ((a1[2] - *a1) >> 3);
  }
  if (0xEEEEEEEEEEEEEEEFLL * ((a1[2] - *a1) >> 3) >= 0x111111111111111) {
    unint64_t v10 = 0x222222222222222;
  }
  else {
    unint64_t v10 = v6;
  }
  long long v18 = a1 + 2;
  if (v10) {
    char v11 = (char *)sub_20DB70D68((uint64_t)(a1 + 2), v10);
  }
  else {
    char v11 = 0;
  }
  unint64_t v14 = v11;
  char v15 = &v11[120 * v5];
  uint64_t v17 = &v11[120 * v10];
  sub_20DB75F54(a1 + 16, (uint64_t)v15, a2, a3, a4);
  uint64_t v16 = v15 + 120;
  sub_20DB70CF0(a1, &v14);
  uint64_t v12 = a1[1];
  sub_20DB70F90(&v14);
  return v12;
}

void sub_20DB75F40(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_20DB70F90((void **)va);
  _Unwind_Resume(a1);
}

void sub_20DB75F54(int a1, uint64_t a2, uint64_t a3, char *__s, int *a5)
{
  if (*(char *)(a3 + 23) < 0)
  {
    sub_20DB66FF4(__dst, *(void **)a3, *(void *)(a3 + 8));
  }
  else
  {
    *(_OWORD *)__dst = *(_OWORD *)a3;
    uint64_t v15 = *(void *)(a3 + 16);
  }
  sub_20DB7AA9C(v12, __s);
  int v8 = *a5;
  int v9 = 1;
  LOBYTE(__p) = 0;
  sub_20DB7100C(a2, (long long *)__dst, (long long *)v12, v8, (uint64_t)&v9);
  if (v9 == 4)
  {
    p_p = &__p;
    sub_20DB7ABD8(&p_p);
  }
  else if (v9 == 3 && v11 < 0)
  {
    operator delete(__p);
  }
  if (v13 < 0) {
    operator delete(v12[0]);
  }
  if (SHIBYTE(v15) < 0) {
    operator delete(__dst[0]);
  }
}

void sub_20DB76040(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  if (a19 < 0) {
    operator delete(__p);
  }
  if (a25 < 0) {
    operator delete(a20);
  }
  _Unwind_Resume(a1);
}

void *sub_20DB7607C@<X0>(uint64_t a1@<X1>, void *a2@<X8>)
{
  long long v4 = operator new(0x58uLL);
  uint64_t result = sub_20DB760D8(v4, a1);
  *a2 = v4 + 3;
  a2[1] = v4;
  return result;
}

void sub_20DB760C4(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *sub_20DB760D8(void *a1, uint64_t a2)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = &unk_26C245088;
  sub_20DB761E4((uint64_t)&v4, (uint64_t)(a1 + 3), a2);
  return a1;
}

void sub_20DB76134(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void sub_20DB76148(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C245088;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_20DB76168(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C245088;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x210564B70);
}

uint64_t sub_20DB761BC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 24) + 48))();
}

void sub_20DB761E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)long long v7 = *(_OWORD *)a3;
  uint64_t v8 = *(void *)(a3 + 16);
  *(void *)(a3 + 8) = 0;
  *(void *)(a3 + 16) = 0;
  *(void *)a3 = 0;
  int v4 = 0;
  sub_20DB71280(a2, (__n128 *)v7, &v4);
  *uint64_t v3 = &unk_26C244A98;
  if (v4 == 4)
  {
    p_p = &__p;
    sub_20DB7ABD8(&p_p);
  }
  else if (v4 == 3 && v6 < 0)
  {
    operator delete(__p);
  }
  if (SHIBYTE(v8) < 0) {
    operator delete(v7[0]);
  }
}

uint64_t sub_20DB7629C(uint64_t a1)
{
  *(void *)a1 = &unk_26C2447D0;
  int v2 = *(_DWORD *)(a1 + 32);
  if (v2 == 4)
  {
    int v4 = (void **)(a1 + 40);
    sub_20DB7ABD8(&v4);
  }
  else if (v2 == 3 && *(char *)(a1 + 63) < 0)
  {
    operator delete(*(void **)(a1 + 40));
  }
  if (*(char *)(a1 + 31) < 0) {
    operator delete(*(void **)(a1 + 8));
  }
  return a1;
}

uint64_t sub_20DB7632C(uint64_t a1)
{
  *(void *)a1 = &unk_26C2447D0;
  int v2 = *(_DWORD *)(a1 + 32);
  if (v2 == 4)
  {
    int v4 = (void **)(a1 + 40);
    sub_20DB7ABD8(&v4);
  }
  else if (v2 == 3 && *(char *)(a1 + 63) < 0)
  {
    operator delete(*(void **)(a1 + 40));
  }
  if (*(char *)(a1 + 31) < 0) {
    operator delete(*(void **)(a1 + 8));
  }
  return MEMORY[0x210564B70](a1, 0x10B3C40F41401DALL);
}

double sub_20DB763D0@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  int v4 = *(const void ***)a2;
  uint64_t v5 = *(void *)(a2 + 8) - *(void *)a2;
  if (v5)
  {
    uint64_t v7 = 0;
    unint64_t v8 = v5 >> 4;
    if (v8 <= 1) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = v8;
    }
    while (1)
    {
      if (*v4)
      {
        unint64_t v10 = __dynamic_cast(*v4, (const struct __class_type_info *)&unk_26C2443C0, (const struct __class_type_info *)&unk_26C2443D0, 0);
        if (v10) {
          break;
        }
      }
      ++v7;
      v4 += 2;
      if (v9 == v7) {
        return result;
      }
    }
    uint64_t v12 = v10;
    *a3 = v7;
    uint64_t v13 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 24))(a1);
    sub_20DB764EC(v13, (uint64_t)v12 + 32, v14);
    double result = v14[0];
    *(_OWORD *)(a3 + 1) = *(_OWORD *)v14;
  }
  return result;
}

void *sub_20DB764EC@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, void *a3@<X8>)
{
  char v6 = operator new(0x58uLL);
  double result = sub_20DB76550(v6, a1, a2);
  *a3 = v6 + 3;
  a3[1] = v6;
  return result;
}

void sub_20DB7653C(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *sub_20DB76550(void *a1, uint64_t a2, uint64_t a3)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = &unk_26C245088;
  sub_20DB765C4((uint64_t)&v5, a1 + 3, a2, a3);
  return a1;
}

void sub_20DB765B0(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void sub_20DB765C4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  if (*(char *)(a3 + 23) < 0)
  {
    sub_20DB66FF4(__dst, *(void **)a3, *(void *)(a3 + 8));
  }
  else
  {
    *(_OWORD *)__dst = *(_OWORD *)a3;
    uint64_t v10 = *(void *)(a3 + 16);
  }
  int v6 = *(_DWORD *)a4;
  switch(v6)
  {
    case 1:
      LOBYTE(__p) = *(unsigned char *)(a4 + 8);
      break;
    case 2:
      *(void *)&long long __p = *(void *)(a4 + 8);
      break;
    case 3:
      if (*(char *)(a4 + 31) < 0)
      {
        sub_20DB66FF4(&__p, *(void **)(a4 + 8), *(void *)(a4 + 16));
      }
      else
      {
        long long __p = *(_OWORD *)(a4 + 8);
        uint64_t v8 = *(void *)(a4 + 24);
      }
      break;
    case 4:
      long long __p = 0uLL;
      uint64_t v8 = 0;
      sub_20DB7AB50((char *)&__p, *(long long **)(a4 + 8), *(long long **)(a4 + 16), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a4 + 16) - *(void *)(a4 + 8)) >> 3));
      break;
    default:
      break;
  }
  sub_20DB71280((uint64_t)a2, (__n128 *)__dst, &v6);
  *a2 = &unk_26C244A98;
  if (v6 == 4)
  {
    p_p = (void **)&__p;
    sub_20DB7ABD8(&p_p);
  }
  else if (v6 == 3 && SHIBYTE(v8) < 0)
  {
    operator delete((void *)__p);
  }
  if (SHIBYTE(v10) < 0) {
    operator delete(__dst[0]);
  }
}

void sub_20DB7673C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  if (a18 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *sub_20DB76768@<X0>(uint64_t a1@<X1>, void *a2@<X8>)
{
  int v4 = operator new(0x58uLL);
  double result = sub_20DB767C4(v4, a1);
  *a2 = v4 + 3;
  a2[1] = v4;
  return result;
}

void sub_20DB767B0(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *sub_20DB767C4(void *a1, uint64_t a2)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = &unk_26C245050;
  sub_20DB768D0((uint64_t)&v4, a1 + 3, a2);
  return a1;
}

void sub_20DB76820(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void sub_20DB76834(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C245050;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_20DB76854(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C245050;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x210564B70);
}

uint64_t sub_20DB768A8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 24) + 48))();
}

void sub_20DB768D0(uint64_t a1, void *a2, uint64_t a3)
{
  *(_OWORD *)int v6 = *(_OWORD *)a3;
  uint64_t v7 = *(void *)(a3 + 16);
  *(void *)(a3 + 8) = 0;
  *(void *)(a3 + 16) = 0;
  *(void *)a3 = 0;
  int v3 = 1;
  LOBYTE(__p) = 0;
  sub_20DB76974(a2, (uint64_t)v6, (uint64_t)&v3);
  if (v3 == 4)
  {
    p_p = &__p;
    sub_20DB7ABD8(&p_p);
  }
  else if (v3 == 3 && v5 < 0)
  {
    operator delete(__p);
  }
  if (SHIBYTE(v7) < 0) {
    operator delete(v6[0]);
  }
}

void *sub_20DB76974(void *a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)uint64_t v8 = *(_OWORD *)a2;
  uint64_t v9 = *(void *)(a2 + 16);
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)a2 = 0;
  int v5 = *(_DWORD *)a3;
  switch(v5)
  {
    case 1:
      LOBYTE(__p[0]) = *(unsigned char *)(a3 + 8);
      break;
    case 2:
      __p[0] = *(void **)(a3 + 8);
      break;
    case 3:
      *(_OWORD *)long long __p = *(_OWORD *)(a3 + 8);
      uint64_t v7 = *(void *)(a3 + 24);
      goto LABEL_6;
    case 4:
      *(_OWORD *)long long __p = *(_OWORD *)(a3 + 8);
      uint64_t v7 = *(void *)(a3 + 24);
LABEL_6:
      *(void *)(a3 + 16) = 0;
      *(void *)(a3 + 24) = 0;
      *(void *)(a3 + 8) = 0;
      break;
    default:
      break;
  }
  sub_20DB71280((uint64_t)a1, (__n128 *)v8, &v5);
  *a1 = &unk_26C244A98;
  if (v5 == 4)
  {
    uint64_t v10 = __p;
    sub_20DB7ABD8(&v10);
  }
  else if (v5 == 3 && SHIBYTE(v7) < 0)
  {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v9) < 0) {
    operator delete(v8[0]);
  }
  *a1 = &unk_26C244A40;
  return a1;
}

uint64_t sub_20DB76AD4(uint64_t a1)
{
  *(void *)a1 = &unk_26C2447D0;
  int v2 = *(_DWORD *)(a1 + 32);
  if (v2 == 4)
  {
    char v4 = (void **)(a1 + 40);
    sub_20DB7ABD8(&v4);
  }
  else if (v2 == 3 && *(char *)(a1 + 63) < 0)
  {
    operator delete(*(void **)(a1 + 40));
  }
  if (*(char *)(a1 + 31) < 0) {
    operator delete(*(void **)(a1 + 8));
  }
  return a1;
}

uint64_t sub_20DB76B64(uint64_t a1)
{
  *(void *)a1 = &unk_26C2447D0;
  int v2 = *(_DWORD *)(a1 + 32);
  if (v2 == 4)
  {
    char v4 = (void **)(a1 + 40);
    sub_20DB7ABD8(&v4);
  }
  else if (v2 == 3 && *(char *)(a1 + 63) < 0)
  {
    operator delete(*(void **)(a1 + 40));
  }
  if (*(char *)(a1 + 31) < 0) {
    operator delete(*(void **)(a1 + 8));
  }
  return MEMORY[0x210564B70](a1, 0x10B3C40F41401DALL);
}

void sub_20DB76C08(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  char v4 = *(const void ***)a2;
  uint64_t v5 = *(void *)(a2 + 8) - *(void *)a2;
  if (v5)
  {
    uint64_t v7 = 0;
    unint64_t v8 = v5 >> 4;
    if (v8 <= 1) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = v8;
    }
    while (1)
    {
      if (*v4)
      {
        uint64_t v10 = (unsigned __int8 *)__dynamic_cast(*v4, (const struct __class_type_info *)&unk_26C2443C0, (const struct __class_type_info *)&unk_26C2443D0, 0);
        if (v10) {
          break;
        }
      }
      ++v7;
      v4 += 2;
      if (v9 == v7) {
        return;
      }
    }
    char v11 = v10;
    uint64_t v12 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 24))(a1);
    if (*(char *)(v12 + 23) < 0)
    {
      sub_20DB66FF4(__dst, *(void **)v12, *(void *)(v12 + 8));
    }
    else
    {
      long long v14 = *(_OWORD *)v12;
      uint64_t v34 = *(void *)(v12 + 16);
      *(_OWORD *)__dst = v14;
    }
    int v35 = 3;
    *(_OWORD *)long long __p = *(_OWORD *)__dst;
    uint64_t v37 = v34;
    __dst[0] = 0;
    __dst[1] = 0;
    uint64_t v34 = 0;
    if (*((_DWORD *)v11 + 8) != 3) {
      goto LABEL_31;
    }
    if (v37 >= 0) {
      uint64_t v15 = (void *)HIBYTE(v37);
    }
    else {
      uint64_t v15 = __p[1];
    }
    uint64_t v16 = (void *)v11[63];
    int v17 = (char)v16;
    if ((char)v16 < 0) {
      uint64_t v16 = (void *)*((void *)v11 + 6);
    }
    if (v15 == v16)
    {
      int v20 = (unsigned __int8 *)*((void *)v11 + 5);
      unint64_t v19 = v11 + 40;
      long long v18 = v20;
      if (v17 >= 0) {
        uint64_t v13 = v19;
      }
      else {
        uint64_t v13 = v18;
      }
      if (v37 < 0)
      {
        BOOL v29 = memcmp(__p[0], v13, (size_t)__p[1]) == 0;
      }
      else if (HIBYTE(v37))
      {
        uint64_t v21 = __p;
        uint64_t v22 = HIBYTE(v37) - 1;
        do
        {
          int v24 = *(unsigned __int8 *)v21;
          uint64_t v21 = (void **)((char *)v21 + 1);
          int v23 = v24;
          int v26 = *v13++;
          int v25 = v26;
          BOOL v28 = v22-- != 0;
          BOOL v29 = v23 == v25;
        }
        while (v23 == v25 && v28);
      }
      else
      {
        BOOL v29 = 1;
      }
    }
    else
    {
LABEL_31:
      BOOL v29 = 0;
    }
    if (SHIBYTE(v37) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v34) < 0)
    {
      operator delete(__dst[0]);
      if (!v29) {
        return;
      }
    }
    else if (!v29)
    {
      return;
    }
    *a3 = v7;
    uint64_t v30 = (*(uint64_t (**)(uint64_t, unsigned __int8 *))(*(void *)a1 + 24))(a1, v13);
    int v35 = 1;
    LOBYTE(__p[0]) = 1;
    sub_20DB76EC0(v30, &v35, &v32);
    long long v31 = v32;
    long long v32 = 0uLL;
    *(_OWORD *)(a3 + 1) = v31;
    if (v35 == 4)
    {
      uint64_t v38 = __p;
      sub_20DB7ABD8(&v38);
    }
    else if (v35 == 3 && SHIBYTE(v37) < 0)
    {
      operator delete(__p[0]);
    }
  }
}

void sub_20DB76EAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  sub_20DB6FFB4((uint64_t)va);
  _Unwind_Resume(a1);
}

void *sub_20DB76EC0@<X0>(uint64_t a1@<X1>, int *a2@<X2>, void *a3@<X8>)
{
  int v6 = operator new(0x58uLL);
  double result = sub_20DB76F24(v6, a1, a2);
  *a3 = v6 + 3;
  a3[1] = v6;
  return result;
}

void sub_20DB76F10(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *sub_20DB76F24(void *a1, uint64_t a2, int *a3)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = &unk_26C245050;
  sub_20DB76F98((uint64_t)&v5, a1 + 3, a2, a3);
  return a1;
}

void sub_20DB76F84(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void sub_20DB76F98(uint64_t a1, void *a2, uint64_t a3, int *a4)
{
  if (*(char *)(a3 + 23) < 0)
  {
    sub_20DB66FF4(__dst, *(void **)a3, *(void *)(a3 + 8));
  }
  else
  {
    *(_OWORD *)__dst = *(_OWORD *)a3;
    uint64_t v10 = *(void *)(a3 + 16);
  }
  int v6 = *a4;
  switch(v6)
  {
    case 1:
      LOBYTE(__p[0]) = *((unsigned char *)a4 + 8);
      break;
    case 2:
      __p[0] = *((void **)a4 + 1);
      break;
    case 3:
      *(_OWORD *)long long __p = *(_OWORD *)(a4 + 2);
      uint64_t v8 = *((void *)a4 + 3);
      goto LABEL_9;
    case 4:
      *(_OWORD *)long long __p = *(_OWORD *)(a4 + 2);
      uint64_t v8 = *((void *)a4 + 3);
LABEL_9:
      *((void *)a4 + 2) = 0;
      *((void *)a4 + 3) = 0;
      *((void *)a4 + 1) = 0;
      break;
    default:
      break;
  }
  sub_20DB76974(a2, (uint64_t)__dst, (uint64_t)&v6);
  if (v6 == 4)
  {
    char v11 = __p;
    sub_20DB7ABD8(&v11);
  }
  else if (v6 == 3 && SHIBYTE(v8) < 0)
  {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v10) < 0) {
    operator delete(__dst[0]);
  }
}

uint64_t sub_20DB770D8@<X0>(long long *a1@<X1>, void *a2@<X8>)
{
  char v4 = (char *)operator new(0x38uLL);
  uint64_t result = sub_20DB77134((uint64_t)v4, a1);
  *a2 = v4 + 24;
  a2[1] = v4;
  return result;
}

void sub_20DB77120(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_20DB77134(uint64_t a1, long long *a2)
{
  *(_OWORD *)(a1 + 8) = 0u;
  *(void *)a1 = &unk_26C245130;
  uint64_t v3 = *((void *)a2 + 2);
  long long v4 = *a2;
  *(void *)a2 = 0;
  *(long long *)((char *)a2 + 8) = 0u;
  *(_OWORD *)(a1 + 32) = v4;
  *(void *)(a1 + 48) = v3;
  uint64_t v6 = 0;
  long long v7 = 0u;
  *(void *)(a1 + 24) = &unk_26C244BB0;
  uint64_t v8 = (void **)&v6;
  sub_20DB5E714(&v8);
  return a1;
}

void sub_20DB771D4(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C245130;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_20DB771F4(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C245130;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x210564B70);
}

uint64_t sub_20DB77248(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 24) + 48))();
}

BOOL sub_20DB77270(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  long long v19 = 0uLL;
  uint64_t v20 = 0;
  sub_20DB5E490(&v19, (void *)*a2, (void *)a2[1], (a2[1] - *a2) >> 4);
  long long v17 = 0uLL;
  uint64_t v18 = 0;
  sub_20DB5E7B4(&v17, (void *)*a3, (void *)a3[1], (a3[1] - *a3) >> 4);
  uint64_t v6 = 0;
  long long v14 = 0;
  uint64_t v15 = 0;
  char v7 = 1;
  char v8 = 1;
  uint64_t v16 = 0;
  while ((v7 & 1) != 0)
  {
    unsigned int v9 = (*(uint64_t (**)(void, long long *, long long *))(***(void ***)(a1 + 8) + 16))(**(void **)(a1 + 8), &v19, &v17);
    char v7 = v9;
    v6 += v9;
    uint64_t v10 = *((void *)&v19 + 1) - v19;
    if ((v8 & 1) == 0)
    {
      char v11 = v14;
      if (v10 == v15 - (void)v14)
      {
        if ((void)v19 == *((void *)&v19 + 1)) {
          break;
        }
        uint64_t v12 = (void **)v19;
        while (*v12 == *v11)
        {
          v12 += 2;
          v11 += 2;
          if (v12 == *((void ***)&v19 + 1)) {
            goto LABEL_11;
          }
        }
      }
    }
    sub_20DB77528((uint64_t)&v14, (uint64_t *)v19, *((uint64_t **)&v19 + 1), v10 >> 4);
    char v8 = 0;
  }
LABEL_11:
  if (v6)
  {
    sub_20DB5E904(a2);
    *(_OWORD *)a2 = v19;
    a2[2] = v20;
    uint64_t v20 = 0;
    long long v19 = 0uLL;
    sub_20DB5E904(a3);
    *(_OWORD *)a3 = v17;
    a3[2] = v18;
    uint64_t v18 = 0;
    long long v17 = 0uLL;
  }
  uint64_t v21 = &v14;
  sub_20DB5E714((void ***)&v21);
  long long v14 = (void **)&v17;
  sub_20DB5E714(&v14);
  *(void *)&long long v17 = &v19;
  sub_20DB5E714((void ***)&v17);
  return v6 != 0;
}

void sub_20DB77420(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void **a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
  a13 = (void **)&a17;
  sub_20DB5E714(&a13);
  _Unwind_Resume(a1);
}

uint64_t sub_20DB77464(uint64_t a1)
{
  *(void *)a1 = &unk_26C244828;
  uint64_t v3 = (void **)(a1 + 8);
  sub_20DB5E714(&v3);
  return a1;
}

uint64_t sub_20DB774BC(uint64_t a1)
{
  *(void *)a1 = &unk_26C244828;
  uint64_t v3 = (void **)(a1 + 8);
  sub_20DB5E714(&v3);
  return MEMORY[0x210564B70](a1, 0xA1C4030951706);
}

void sub_20DB77528(uint64_t a1, uint64_t *a2, uint64_t *a3, unint64_t a4)
{
  uint64_t v8 = a1 + 16;
  unsigned int v9 = *(void **)a1;
  if (a4 > (uint64_t)(*(void *)(a1 + 16) - *(void *)a1) >> 4)
  {
    sub_20DB5E904((uint64_t *)a1);
    if (a4 >> 60) {
      sub_20DB5E168();
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
    sub_20DB5E518((void *)a1, v12);
    uint64_t v13 = sub_20DB5E594(v8, a2, a3, *(void **)(a1 + 8));
    goto LABEL_11;
  }
  unint64_t v14 = (uint64_t)(*(void *)(a1 + 8) - (void)v9) >> 4;
  if (v14 < a4)
  {
    uint64_t v15 = &a2[2 * v14];
    sub_20DB7767C((uint64_t)&v20, a2, v15, v9);
    uint64_t v13 = sub_20DB5E594(v8, v15, a3, *(void **)(a1 + 8));
LABEL_11:
    *(void *)(a1 + 8) = v13;
    return;
  }
  sub_20DB7767C((uint64_t)&v21, a2, a3, v9);
  uint64_t v17 = v16;
  uint64_t v18 = *(void *)(a1 + 8);
  if (v18 != v16)
  {
    do
    {
      long long v19 = *(std::__shared_weak_count **)(v18 - 8);
      if (v19) {
        sub_20DB5E6A0(v19);
      }
      v18 -= 16;
    }
    while (v18 != v17);
  }
  *(void *)(a1 + 8) = v17;
}

void sub_20DB7766C(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void sub_20DB77674(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t *sub_20DB7767C(uint64_t a1, uint64_t *a2, uint64_t *a3, void *a4)
{
  char v5 = a2;
  if (a2 == a3) {
    return a2;
  }
  uint64_t v6 = a3;
  do
  {
    uint64_t v8 = *v5;
    uint64_t v7 = v5[1];
    if (v7) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v7 + 8), 1uLL, memory_order_relaxed);
    }
    unsigned int v9 = (std::__shared_weak_count *)a4[1];
    *a4 = v8;
    a4[1] = v7;
    if (v9) {
      sub_20DB5E6A0(v9);
    }
    a4 += 2;
    v5 += 2;
  }
  while (v5 != v6);
  return v6;
}

void sub_20DB776F8()
{
}

uint64_t sub_20DB77710@<X0>(long long *a1@<X1>, void *a2@<X8>)
{
  long long v4 = (char *)operator new(0x38uLL);
  uint64_t result = sub_20DB7776C((uint64_t)v4, a1);
  *a2 = v4 + 24;
  a2[1] = v4;
  return result;
}

void sub_20DB77758(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_20DB7776C(uint64_t a1, long long *a2)
{
  *(_OWORD *)(a1 + 8) = 0u;
  *(void *)a1 = &unk_26C244FE0;
  uint64_t v3 = *((void *)a2 + 2);
  long long v4 = *a2;
  *(void *)a2 = 0;
  *(long long *)((char *)a2 + 8) = 0u;
  *(_OWORD *)(a1 + 32) = v4;
  *(void *)(a1 + 48) = v3;
  uint64_t v6 = 0;
  long long v7 = 0u;
  *(void *)(a1 + 24) = &unk_26C244988;
  uint64_t v8 = (void **)&v6;
  sub_20DB5E714(&v8);
  return a1;
}

void sub_20DB7780C(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C244FE0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_20DB7782C(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C244FE0;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x210564B70);
}

uint64_t sub_20DB77880(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 24) + 48))();
}

uint64_t sub_20DB778A8(uint64_t a1, void **a2, void **a3)
{
  uint64_t v18 = 0;
  long long v19 = 0;
  unint64_t v20 = 0;
  uint64_t v3 = *(void **)(a1 + 8);
  long long v4 = *(void **)(a1 + 16);
  if (v3 == v4) {
    goto LABEL_16;
  }
  do
  {
    long long v16 = 0uLL;
    uint64_t v17 = 0;
    sub_20DB5E490(&v16, *a2, a2[1], ((char *)a2[1] - (char *)*a2) >> 4);
    long long v14 = 0uLL;
    uint64_t v15 = 0;
    sub_20DB5E7B4(&v14, *a3, a3[1], ((char *)a3[1] - (char *)*a3) >> 4);
    if ((*(unsigned int (**)(void, long long *, long long *))(*(void *)*v3 + 16))(*v3, &v16, &v14))
    {
      long long v7 = v19;
      if ((unint64_t)v19 >= v20)
      {
        uint64_t v8 = sub_20DB77BF0((uint64_t *)&v18, (uint64_t)&v16, (uint64_t)&v14);
      }
      else
      {
        *long long v19 = 0;
        v7[1] = 0;
        v7[2] = 0;
        *(_OWORD *)long long v7 = v16;
        v7[2] = v17;
        long long v16 = 0uLL;
        uint64_t v17 = 0;
        *(_OWORD *)(v7 + 3) = v14;
        v7[5] = v15;
        long long v14 = 0uLL;
        uint64_t v15 = 0;
        uint64_t v8 = (uint64_t)(v7 + 6);
      }
      long long v19 = (uint64_t *)v8;
    }
    char v21 = (void **)&v14;
    sub_20DB5E714(&v21);
    *(void *)&long long v14 = &v16;
    sub_20DB5E714((void ***)&v14);
    v3 += 2;
  }
  while (v3 != v4);
  uint64_t v9 = (uint64_t)v18;
  if (v18 != v19)
  {
    uint64_t v10 = v18 + 6;
    if (v18 + 6 != v19)
    {
      uint64_t v11 = *v18;
      do
      {
        if (v10[1] - *v10 < (unint64_t)(*(void *)(v9 + 8) - v11))
        {
          uint64_t v11 = *v10;
          uint64_t v9 = (uint64_t)v10;
        }
        v10 += 6;
      }
      while (v10 != v19);
    }
  }
  if ((uint64_t *)v9 == v19)
  {
LABEL_16:
    uint64_t v12 = 0;
  }
  else
  {
    *(void *)&long long v16 = a2;
    *((void *)&v16 + 1) = a3;
    sub_20DB77B78((uint64_t **)&v16, v9);
    uint64_t v12 = 1;
  }
  *(void *)&long long v16 = &v18;
  sub_20DB7802C((void ***)&v16);
  return v12;
}

void sub_20DB77A68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void ***a9, uint64_t a10, uint64_t a11, uint64_t a12, void **a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
  a9 = &a13;
  sub_20DB5E714((void ***)&a9);
  a13 = (void **)&a17;
  sub_20DB7802C(&a13);
  _Unwind_Resume(a1);
}

uint64_t sub_20DB77AB4(uint64_t a1)
{
  *(void *)a1 = &unk_26C244828;
  uint64_t v3 = (void **)(a1 + 8);
  sub_20DB5E714(&v3);
  return a1;
}

uint64_t sub_20DB77B0C(uint64_t a1)
{
  *(void *)a1 = &unk_26C244828;
  uint64_t v3 = (void **)(a1 + 8);
  sub_20DB5E714(&v3);
  return MEMORY[0x210564B70](a1, 0xA1C4030951706);
}

uint64_t **sub_20DB77B78(uint64_t **a1, uint64_t a2)
{
  long long v4 = *a1;
  sub_20DB5E904(*a1);
  *(_OWORD *)long long v4 = *(_OWORD *)a2;
  v4[2] = *(void *)(a2 + 16);
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  char v5 = a1[1];
  sub_20DB5E904(v5);
  *(_OWORD *)char v5 = *(_OWORD *)(a2 + 24);
  v5[2] = *(void *)(a2 + 40);
  *(void *)(a2 + 24) = 0;
  *(void *)(a2 + 32) = 0;
  *(void *)(a2 + 40) = 0;
  return a1;
}

uint64_t sub_20DB77BF0(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *a1;
  unint64_t v5 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 4);
  unint64_t v6 = v5 + 1;
  if (v5 + 1 > 0x555555555555555) {
    sub_20DB5E168();
  }
  uint64_t v9 = (uint64_t)(a1 + 2);
  unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v4) >> 4);
  if (2 * v10 > v6) {
    unint64_t v6 = 2 * v10;
  }
  if (v10 >= 0x2AAAAAAAAAAAAAALL) {
    unint64_t v11 = 0x555555555555555;
  }
  else {
    unint64_t v11 = v6;
  }
  v17[4] = a1 + 2;
  uint64_t v12 = (char *)sub_20DB67924(v9, v11);
  uint64_t v13 = &v12[48 * v5];
  v17[0] = v12;
  v17[1] = v13;
  v17[3] = &v12[48 * v14];
  *((void *)v13 + 1) = 0;
  *((void *)v13 + 2) = 0;
  *(void *)uint64_t v13 = 0;
  *(_OWORD *)uint64_t v13 = *(_OWORD *)a2;
  *((void *)v13 + 2) = *(void *)(a2 + 16);
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *((void *)v13 + 4) = 0;
  *((void *)v13 + 5) = 0;
  *((void *)v13 + 3) = 0;
  *(_OWORD *)(v13 + 24) = *(_OWORD *)a3;
  *((void *)v13 + 5) = *(void *)(a3 + 16);
  *(void *)a3 = 0;
  *(void *)(a3 + 8) = 0;
  *(void *)(a3 + 16) = 0;
  v17[2] = v13 + 48;
  sub_20DB77D20(a1, v17);
  uint64_t v15 = a1[1];
  sub_20DB77F84((uint64_t)v17);
  return v15;
}

void sub_20DB77D0C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_20DB77F84((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_20DB77D20(uint64_t *a1, void *a2)
{
  uint64_t result = sub_20DB77D98((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
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

uint64_t sub_20DB77D98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
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
      *(void *)(v7 - 24) = 0;
      *(void *)(v7 - 16) = 0;
      *(void *)(v7 - 8) = 0;
      *(_OWORD *)(v7 - 24) = *(_OWORD *)(a3 + 24);
      *(void *)(v7 - 8) = *(void *)(a3 + 40);
      *(void *)(a3 + 24) = 0;
      *(void *)(a3 + 32) = 0;
      *(void *)(a3 + 40) = 0;
      uint64_t v7 = *((void *)&v14 + 1) - 48;
      *((void *)&v14 + 1) -= 48;
    }
    while (a3 != a5);
    uint64_t v9 = v14;
  }
  char v12 = 1;
  sub_20DB77E5C((uint64_t)v11);
  return v9;
}

uint64_t sub_20DB77E5C(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    sub_20DB77E94((uint64_t *)a1);
  }
  return a1;
}

void sub_20DB77E94(uint64_t *a1)
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
  sub_20DB77F0C(v4, (uint64_t)v13, (uint64_t)v8);
}

void sub_20DB77F0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  for (uint64_t i = *(void ***)(a2 + 32); i != *(void ***)(a3 + 32); *(void *)(a2 + 32) = i)
  {
    uint64_t v6 = i + 3;
    sub_20DB5E714(&v6);
    uint64_t v6 = i;
    sub_20DB5E714(&v6);
    uint64_t i = (void **)(*(void *)(a2 + 32) + 48);
  }
}

uint64_t sub_20DB77F84(uint64_t a1)
{
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void sub_20DB77FBC(uint64_t a1, uint64_t a2)
{
  for (uint64_t i = *(void *)(a1 + 16); i != a2; uint64_t i = *(void *)(a1 + 16))
  {
    uint64_t v5 = (void **)(i - 48);
    *(void *)(a1 + 16) = i - 48;
    uint64_t v6 = (void **)(i - 24);
    sub_20DB5E714(&v6);
    uint64_t v6 = v5;
    sub_20DB5E714(&v6);
  }
}

void sub_20DB7802C(void ***a1)
{
  uint64_t v2 = (void ***)*a1;
  if (*v2)
  {
    sub_20DB78080((uint64_t)v2, *v2);
    uint64_t v3 = **a1;
    operator delete(v3);
  }
}

void sub_20DB78080(uint64_t a1, void **a2)
{
  uint64_t v4 = *(void ***)(a1 + 8);
  if (v4 != a2)
  {
    do
    {
      uint64_t v5 = v4 - 6;
      uint64_t v6 = v4 - 3;
      sub_20DB5E714(&v6);
      uint64_t v6 = v5;
      sub_20DB5E714(&v6);
      uint64_t v4 = v5;
    }
    while (v5 != a2);
  }
  *(void *)(a1 + 8) = a2;
}

void sub_20DB780F0(std::runtime_error *a1)
{
  std::runtime_error::~runtime_error(a1);

  JUMPOUT(0x210564B70);
}

void sub_20DB78128(const std::string *a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  if (a2 != -1)
  {
    unint64_t v3 = a2;
    uint64_t v6 = (uint64_t)(a3 + 2);
    do
    {
      int v7 = SHIBYTE(a1->__r_.__value_.__r.__words[2]);
      if (v7 >= 0) {
        std::string::size_type v8 = (std::string::size_type)a1;
      }
      else {
        std::string::size_type v8 = a1->__r_.__value_.__r.__words[0];
      }
      if (v7 >= 0) {
        unint64_t size = HIBYTE(a1->__r_.__value_.__r.__words[2]);
      }
      else {
        unint64_t size = a1->__r_.__value_.__l.__size_;
      }
      if (size <= v3) {
        break;
      }
      uint64_t v10 = (unsigned __int8 *)(v8 + size);
      std::string::size_type v11 = v3;
      while (memchr(" \t\r\n\v\f", *(char *)(v8 + v11), 6uLL))
      {
        if (size == ++v11) {
          return;
        }
      }
      if (v11 == -1) {
        break;
      }
      if (size > v11)
      {
        uint64_t v12 = (unsigned __int8 *)(v8 + v11);
LABEL_17:
        uint64_t v13 = 0;
        while (*v12 != asc_20DB7F1D1[v13])
        {
          if (++v13 == 6)
          {
            if (++v12 != v10) {
              goto LABEL_17;
            }
            goto LABEL_25;
          }
        }
        if (v12 != v10)
        {
          unint64_t v3 = (unint64_t)&v12[-v8];
          if (&v12[-v8] != (unsigned __int8 *)-1)
          {
            std::string::size_type v14 = v3 - v11;
            goto LABEL_26;
          }
        }
      }
LABEL_25:
      unint64_t v3 = -1;
      std::string::size_type v14 = -1;
LABEL_26:
      std::string::basic_string(&__p, a1, v11, v14, (std::allocator<char> *)v28);
      unint64_t v16 = a3[1];
      unint64_t v15 = a3[2];
      if (v16 >= v15)
      {
        unint64_t v18 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v16 - *a3) >> 3);
        unint64_t v19 = v18 + 1;
        if (v18 + 1 > 0xAAAAAAAAAAAAAAALL) {
          sub_20DB5E168();
        }
        unint64_t v20 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v15 - *a3) >> 3);
        if (2 * v20 > v19) {
          unint64_t v19 = 2 * v20;
        }
        unint64_t v21 = v20 >= 0x555555555555555 ? 0xAAAAAAAAAAAAAAALL : v19;
        v28[4] = v6;
        uint64_t v22 = v21 ? (char *)sub_20DB622B0(v6, v21) : 0;
        int v23 = &v22[24 * v18];
        v28[0] = v22;
        v28[1] = v23;
        v28[3] = &v22[24 * v21];
        long long v24 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
        *((void *)v23 + 2) = *((void *)&__p.__r_.__value_.__l + 2);
        *(_OWORD *)int v23 = v24;
        memset(&__p, 0, sizeof(__p));
        v28[2] = v23 + 24;
        sub_20DB67094(a3, v28);
        uint64_t v25 = a3[1];
        sub_20DB6722C((uint64_t)v28);
        int v26 = SHIBYTE(__p.__r_.__value_.__r.__words[2]);
        a3[1] = v25;
        if (v26 < 0) {
          operator delete(__p.__r_.__value_.__l.__data_);
        }
      }
      else
      {
        long long v17 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
        *(void *)(v16 + 16) = *((void *)&__p.__r_.__value_.__l + 2);
        *(_OWORD *)unint64_t v16 = v17;
        a3[1] = v16 + 24;
      }
    }
    while (v3 != -1);
  }
}

void sub_20DB78360(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  sub_20DB7ABD8((void ***)&__p);
  _Unwind_Resume(a1);
}

const void *sub_20DB783A4(const void *result)
{
  if (result) {
    return (const void *)(__dynamic_cast(result, (const struct __class_type_info *)&unk_26C2443C0, (const struct __class_type_info *)&unk_26C244390, 0) != 0);
  }
  return result;
}

void ***sub_20DB78408(void ***a1, void *a2)
{
  uint64_t v4 = *a1;
  uint64_t v5 = (*a1)[1];
  uint64_t v6 = *a1;
  unint64_t v9 = (unint64_t)v6[2];
  uint64_t v7 = (uint64_t)(v6 + 2);
  unint64_t v8 = v9;
  if ((unint64_t)v5 >= v9)
  {
    uint64_t v11 = ((char *)v5 - (unsigned char *)*v4) >> 3;
    if ((unint64_t)(v11 + 1) >> 61) {
      sub_20DB5E168();
    }
    uint64_t v12 = v8 - (void)*v4;
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
      unint64_t v15 = (char *)sub_20DB5E180(v7, v14);
    }
    else {
      unint64_t v15 = 0;
    }
    unint64_t v16 = &v15[8 * v11];
    long long v17 = &v15[8 * v14];
    *(void *)unint64_t v16 = *a2;
    uint64_t v10 = v16 + 8;
    unint64_t v19 = (char *)*v4;
    unint64_t v18 = (char *)v4[1];
    if (v18 != *v4)
    {
      do
      {
        uint64_t v20 = *((void *)v18 - 1);
        v18 -= 8;
        *((void *)v16 - 1) = v20;
        v16 -= 8;
      }
      while (v18 != v19);
      unint64_t v18 = (char *)*v4;
    }
    *uint64_t v4 = v16;
    v4[1] = v10;
    v4[2] = v17;
    if (v18) {
      operator delete(v18);
    }
  }
  else
  {
    void *v5 = *a2;
    uint64_t v10 = v5 + 1;
  }
  v4[1] = v10;
  return a1;
}

uint64_t sub_20DB784F4(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = 1065353216;
  if (a2 != a3)
  {
    uint64_t v5 = a2;
    do
    {
      sub_20DB78570(a1, v5, v5);
      ++v5;
    }
    while (v5 != a3);
  }
  return a1;
}

void sub_20DB7855C(_Unwind_Exception *a1)
{
  sub_20DB787CC(v1);
  _Unwind_Resume(a1);
}

void *sub_20DB78570(uint64_t a1, uint64_t *a2, void *a3)
{
  unint64_t v7 = sub_20DB6F4F4(*a2);
  unint64_t v8 = v7;
  unint64_t v9 = *(void *)(a1 + 8);
  if (v9)
  {
    uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    unint64_t v11 = v10.u32[0];
    if (v10.u32[0] > 1uLL)
    {
      unint64_t v3 = v7;
      if (v7 >= v9) {
        unint64_t v3 = v7 % v9;
      }
    }
    else
    {
      unint64_t v3 = (v9 - 1) & v7;
    }
    uint64_t v12 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v12)
    {
      for (uint64_t i = *v12; i; uint64_t i = (void *)*i)
      {
        unint64_t v14 = i[1];
        if (v14 == v8)
        {
          uint64_t v15 = *a2;
          uint64_t v16 = sub_20DB6F4F4(i[2]);
          if (v16 == sub_20DB6F4F4(v15)) {
            return i;
          }
        }
        else
        {
          if (v11 > 1)
          {
            if (v14 >= v9) {
              v14 %= v9;
            }
          }
          else
          {
            v14 &= v9 - 1;
          }
          if (v14 != v3) {
            break;
          }
        }
      }
    }
  }
  uint64_t i = operator new(0x18uLL);
  void *i = 0;
  i[1] = v8;
  i[2] = *a3;
  float v17 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v18 = *(float *)(a1 + 32);
  if (!v9 || (float)(v18 * (float)v9) < v17)
  {
    BOOL v19 = 1;
    if (v9 >= 3) {
      BOOL v19 = (v9 & (v9 - 1)) != 0;
    }
    unint64_t v20 = v19 | (2 * v9);
    unint64_t v21 = vcvtps_u32_f32(v17 / v18);
    if (v20 <= v21) {
      size_t v22 = v21;
    }
    else {
      size_t v22 = v20;
    }
    sub_20DB5EC1C(a1, v22);
    unint64_t v9 = *(void *)(a1 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v8 >= v9) {
        unint64_t v3 = v8 % v9;
      }
      else {
        unint64_t v3 = v8;
      }
    }
    else
    {
      unint64_t v3 = (v9 - 1) & v8;
    }
  }
  uint64_t v23 = *(void *)a1;
  long long v24 = *(void **)(*(void *)a1 + 8 * v3);
  if (v24)
  {
    void *i = *v24;
LABEL_38:
    *long long v24 = i;
    goto LABEL_39;
  }
  void *i = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = i;
  *(void *)(v23 + 8 * v3) = a1 + 16;
  if (*i)
  {
    unint64_t v25 = *(void *)(*i + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v25 >= v9) {
        v25 %= v9;
      }
    }
    else
    {
      v25 &= v9 - 1;
    }
    long long v24 = (void *)(*(void *)a1 + 8 * v25);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return i;
}

void sub_20DB787B8(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_20DB787CC(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 16);
  if (v2)
  {
    do
    {
      unint64_t v3 = (void *)*v2;
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = 0;
  if (v4) {
    operator delete(v4);
  }
  return a1;
}

const void *sub_20DB78818(const void *result)
{
  if (result) {
    return (const void *)(__dynamic_cast(result, (const struct __class_type_info *)&unk_26C2443C0, (const struct __class_type_info *)&unk_26C244318, 0) != 0);
  }
  return result;
}

void *sub_20DB7887C(void *a1, uint64_t *a2)
{
  unint64_t v4 = sub_20DB6F4F4(*a2);
  int8x8_t v5 = (int8x8_t)a1[1];
  if (!*(void *)&v5) {
    return 0;
  }
  unint64_t v6 = v4;
  uint8x8_t v7 = (uint8x8_t)vcnt_s8(v5);
  v7.i16[0] = vaddlv_u8(v7);
  unint64_t v8 = v7.u32[0];
  if (v7.u32[0] > 1uLL)
  {
    unint64_t v9 = v4;
    if (v4 >= *(void *)&v5) {
      unint64_t v9 = v4 % *(void *)&v5;
    }
  }
  else
  {
    unint64_t v9 = (*(void *)&v5 - 1) & v4;
  }
  uint8x8_t v10 = *(void **)(*a1 + 8 * v9);
  if (!v10) {
    return 0;
  }
  unint64_t v11 = (void *)*v10;
  if (*v10)
  {
    do
    {
      unint64_t v12 = v11[1];
      if (v6 == v12)
      {
        uint64_t v13 = *a2;
        uint64_t v14 = sub_20DB6F4F4(v11[2]);
        if (v14 == sub_20DB6F4F4(v13)) {
          return v11;
        }
      }
      else
      {
        if (v8 > 1)
        {
          if (v12 >= *(void *)&v5) {
            v12 %= *(void *)&v5;
          }
        }
        else
        {
          v12 &= *(void *)&v5 - 1;
        }
        if (v12 != v9) {
          return 0;
        }
      }
      unint64_t v11 = (void *)*v11;
    }
    while (v11);
  }
  return v11;
}

void *sub_20DB78990(uint64_t a1, uint64_t *a2, void *a3)
{
  unint64_t v7 = sub_20DB6F4F4(*a2);
  unint64_t v8 = v7;
  unint64_t v9 = *(void *)(a1 + 8);
  if (v9)
  {
    uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    unint64_t v11 = v10.u32[0];
    if (v10.u32[0] > 1uLL)
    {
      unint64_t v3 = v7;
      if (v7 >= v9) {
        unint64_t v3 = v7 % v9;
      }
    }
    else
    {
      unint64_t v3 = (v9 - 1) & v7;
    }
    unint64_t v12 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v12)
    {
      for (uint64_t i = *v12; i; uint64_t i = (void *)*i)
      {
        unint64_t v14 = i[1];
        if (v14 == v8)
        {
          uint64_t v15 = *a2;
          uint64_t v16 = sub_20DB6F4F4(i[2]);
          if (v16 == sub_20DB6F4F4(v15)) {
            return i;
          }
        }
        else
        {
          if (v11 > 1)
          {
            if (v14 >= v9) {
              v14 %= v9;
            }
          }
          else
          {
            v14 &= v9 - 1;
          }
          if (v14 != v3) {
            break;
          }
        }
      }
    }
  }
  uint64_t i = operator new(0x18uLL);
  void *i = 0;
  i[1] = v8;
  i[2] = *a3;
  float v17 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v18 = *(float *)(a1 + 32);
  if (!v9 || (float)(v18 * (float)v9) < v17)
  {
    BOOL v19 = 1;
    if (v9 >= 3) {
      BOOL v19 = (v9 & (v9 - 1)) != 0;
    }
    unint64_t v20 = v19 | (2 * v9);
    unint64_t v21 = vcvtps_u32_f32(v17 / v18);
    if (v20 <= v21) {
      size_t v22 = v21;
    }
    else {
      size_t v22 = v20;
    }
    sub_20DB5EC1C(a1, v22);
    unint64_t v9 = *(void *)(a1 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v8 >= v9) {
        unint64_t v3 = v8 % v9;
      }
      else {
        unint64_t v3 = v8;
      }
    }
    else
    {
      unint64_t v3 = (v9 - 1) & v8;
    }
  }
  uint64_t v23 = *(void *)a1;
  long long v24 = *(void **)(*(void *)a1 + 8 * v3);
  if (v24)
  {
    void *i = *v24;
LABEL_38:
    *long long v24 = i;
    goto LABEL_39;
  }
  void *i = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = i;
  *(void *)(v23 + 8 * v3) = a1 + 16;
  if (*i)
  {
    unint64_t v25 = *(void *)(*i + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v25 >= v9) {
        v25 %= v9;
      }
    }
    else
    {
      v25 &= v9 - 1;
    }
    long long v24 = (void *)(*(void *)a1 + 8 * v25);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return i;
}

void sub_20DB78BD8(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *sub_20DB78BEC@<X0>(char *a1@<X1>, uint64_t a2@<X2>, void *a3@<X8>)
{
  unint64_t v6 = operator new(0x58uLL);
  uint64_t result = sub_20DB78C50(v6, a1, a2);
  *a3 = v6 + 3;
  a3[1] = v6;
  return result;
}

void sub_20DB78C3C(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *sub_20DB78C50(void *a1, char *__s, uint64_t a3)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = &unk_26C245088;
  sub_20DB78CC4((int)&v5, a1 + 3, __s, a3);
  return a1;
}

void sub_20DB78CB0(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void sub_20DB78CC4(int a1, void *a2, char *__s, uint64_t a4)
{
  void v15[2] = *MEMORY[0x263EF8340];
  sub_20DB7AA9C(&v12, __s);
  unint64_t v6 = *(void **)a4;
  v15[0] = *(void *)(a4 + 8);
  *(void *)((char *)v15 + 7) = *(void *)(a4 + 15);
  char v7 = *(unsigned char *)(a4 + 23);
  *(void *)(a4 + 8) = 0;
  *(void *)(a4 + 16) = 0;
  *(void *)a4 = 0;
  int v8 = 3;
  std::string __p = v6;
  *(void *)uint8x8_t v10 = v15[0];
  *(void *)&v10[7] = *(void *)((char *)v15 + 7);
  char v11 = v7;
  sub_20DB71280((uint64_t)a2, &v12, &v8);
  *a2 = &unk_26C244A98;
  if (v8 == 4)
  {
    p_p = &__p;
    sub_20DB7ABD8(&p_p);
  }
  else if (v8 == 3 && v11 < 0)
  {
    operator delete(__p);
  }
  if (v13 < 0) {
    operator delete((void *)v12.n128_u64[0]);
  }
}

void sub_20DB78DDC(std::runtime_error *a1)
{
  std::runtime_error::~runtime_error(a1);

  JUMPOUT(0x210564B70);
}

uint64_t sub_20DB78E14(uint64_t **a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  unint64_t v3 = *a1;
  unint64_t v4 = a1[1];
  if (*a1 != v4)
  {
    while (1)
    {
      uint64_t v8 = *v3;
      char v7 = (std::__shared_weak_count *)v3[1];
      if (v7) {
        atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      uint64_t v9 = (*(uint64_t (**)(uint64_t))(*(void *)v8 + 24))(v8);
      uint8x8_t v10 = (const void **)v9;
      uint64_t v11 = *(unsigned __int8 *)(v9 + 23);
      size_t v12 = *(void *)(v9 + 8);
      if ((v11 & 0x80u) == 0) {
        uint64_t v13 = *(unsigned __int8 *)(v9 + 23);
      }
      else {
        uint64_t v13 = *(void *)(v9 + 8);
      }
      uint64_t v14 = a2[23];
      int v15 = (char)v14;
      if ((v14 & 0x80u) != 0) {
        uint64_t v14 = *((void *)a2 + 1);
      }
      if (v13 == v14)
      {
        if (v15 >= 0) {
          uint64_t v16 = a2;
        }
        else {
          uint64_t v16 = *(unsigned __int8 **)a2;
        }
        if ((v11 & 0x80) != 0)
        {
          if (!memcmp(*(const void **)v9, v16, v12)) {
            goto LABEL_42;
          }
        }
        else
        {
          if (!*(unsigned char *)(v9 + 23)) {
            goto LABEL_42;
          }
          float v17 = (unsigned __int8 *)v9;
          uint64_t v18 = *(unsigned __int8 *)(v9 + 23);
          while (*v17 == *v16)
          {
            ++v17;
            ++v16;
            if (!--v18) {
              goto LABEL_42;
            }
          }
        }
      }
      uint64_t v19 = a3[23];
      int v20 = (char)v19;
      if ((v19 & 0x80u) != 0) {
        uint64_t v19 = *((void *)a3 + 1);
      }
      if (v19) {
        BOOL v21 = v13 == v19;
      }
      else {
        BOOL v21 = 0;
      }
      if (v21)
      {
        if (v20 >= 0) {
          uint64_t v16 = a3;
        }
        else {
          uint64_t v16 = *(unsigned __int8 **)a3;
        }
        if ((v11 & 0x80) != 0)
        {
          if (!memcmp(*v10, v16, v12))
          {
LABEL_42:
            uint64_t v22 = (*(uint64_t (**)(uint64_t, unsigned __int8 *))(*(void *)v8 + 32))(v8, v16);
            if (!v7) {
              goto LABEL_28;
            }
LABEL_27:
            sub_20DB5E6A0(v7);
            goto LABEL_28;
          }
        }
        else
        {
          if (!v11) {
            goto LABEL_42;
          }
          while (*(unsigned __int8 *)v10 == *v16)
          {
            uint8x8_t v10 = (const void **)((char *)v10 + 1);
            ++v16;
            if (!--v11) {
              goto LABEL_42;
            }
          }
        }
      }
      uint64_t v22 = 0;
      if (v7) {
        goto LABEL_27;
      }
LABEL_28:
      v3 += 2;
      if (v3 == v4) {
        char v23 = 1;
      }
      else {
        char v23 = v22;
      }
      if (v23) {
        return v22;
      }
    }
  }
  return 0;
}

void sub_20DB78FEC(_Unwind_Exception *exception_object)
{
  if (v1) {
    sub_20DB5E6A0(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_20DB7900C(std::runtime_error *a1)
{
  std::runtime_error::~runtime_error(a1);

  JUMPOUT(0x210564B70);
}

void sub_20DB79044(std::runtime_error *a1)
{
  std::runtime_error::~runtime_error(a1);

  JUMPOUT(0x210564B70);
}

void sub_20DB7907C(uint64_t a1)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  memset(v37, 0, sizeof(v37));
  sub_20DB5E490(v37, *(void **)(a1 + 8), *(void **)(a1 + 16), (uint64_t)(*(void *)(a1 + 16) - *(void *)(a1 + 8)) >> 4);
  uint64_t v38 = 0;
  unint64_t v39 = 0;
  uint64_t v40 = 0;
  uint64_t v34 = 0;
  int v35 = 0;
  uint64_t v36 = 0;
  sub_20DB79864((uint64_t *)&v34, (uint64_t)v37);
  for (uint64_t i = v34; v34 != v35; uint64_t i = v34)
  {
    memset(__p, 0, sizeof(__p));
    *(_OWORD *)std::string __p = *(_OWORD *)i;
    __p[2] = i[2];
    void *i = 0;
    i[1] = 0;
    i[2] = 0;
    sub_20DB79BD0((uint64_t)&v43, (uint64_t)(v34 + 3), (uint64_t)v35, (uint64_t *)v34);
    unint64_t v3 = v2;
    unint64_t v4 = v35;
    while (v4 != v3)
    {
      v4 -= 3;
      *(void *)&long long v41 = v4;
      sub_20DB5E714((void ***)&v41);
    }
    int v35 = v3;
    unint64_t v6 = (char *)__p[0];
    char v5 = (char *)__p[1];
    if (__p[0] != __p[1])
    {
      while (!*(void *)v6
           || !__dynamic_cast(*(const void **)v6, (const struct __class_type_info *)&unk_26C2443C0, (const struct __class_type_info *)&unk_26C2442E8, 0))
      {
        v6 += 16;
        if (v6 == v5) {
          goto LABEL_16;
        }
      }
    }
    if (v6 == v5)
    {
LABEL_16:
      sub_20DB79864((uint64_t *)&v38, (uint64_t)__p);
    }
    else
    {
      uint64_t v8 = *(const void **)v6;
      char v7 = (std::__shared_weak_count *)*((void *)v6 + 1);
      *(void *)unint64_t v6 = 0;
      *((void *)v6 + 1) = 0;
      sub_20DB70018((uint64_t)&v43, (long long *)v6 + 1, (long long *)__p[1], (uint64_t)v6);
      uint8x8_t v10 = v9;
      for (unint64_t j = (char *)__p[1]; j != v10; j -= 16)
      {
        size_t v12 = (std::__shared_weak_count *)*((void *)j - 1);
        if (v12) {
          sub_20DB5E6A0(v12);
        }
      }
      __p[1] = v10;
      uint64_t v13 = __dynamic_cast(v8, (const struct __class_type_info *)&unk_26C2443C0, (const struct __class_type_info *)&unk_26C244378, 0);
      if (v13)
      {
        uint64_t v14 = (uint64_t *)v13[1];
        int v15 = (uint64_t *)v13[2];
        while (v14 != v15)
        {
          uint64_t v45 = *v14;
          uint64_t v16 = (std::__shared_weak_count *)v14[1];
          std::string::size_type v46 = v16;
          if (v16) {
            atomic_fetch_add_explicit(&v16->__shared_owners_, 1uLL, memory_order_relaxed);
          }
          long long v41 = 0uLL;
          uint64_t v42 = 0;
          uint64_t v43 = (void **)&v41;
          char v44 = 0;
          *(void *)&long long v41 = operator new(0x10uLL);
          *((void *)&v41 + 1) = v41;
          uint64_t v42 = (void *)(v41 + 16);
          float v17 = sub_20DB5E594((uint64_t)&v42, &v45, &v47, (void *)v41);
          *((void *)&v41 + 1) = v17;
          if (v46)
          {
            sub_20DB5E6A0(v46);
            float v17 = (void *)*((void *)&v41 + 1);
          }
          sub_20DB79C48((uint64_t *)&v41, v17, (uint64_t *)__p[0], (void *)__p[1], ((char *)__p[1] - (char *)__p[0]) >> 4);
          sub_20DB79864((uint64_t *)&v34, (uint64_t)&v41);
          uint64_t v43 = (void **)&v41;
          sub_20DB5E714(&v43);
          v14 += 2;
        }
      }
      else
      {
        uint64_t v18 = (void **)__dynamic_cast(v8, (const struct __class_type_info *)&unk_26C2443C0, (const struct __class_type_info *)&unk_26C244418, 0);
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v42 = 0;
          long long v41 = 0uLL;
          sub_20DB5E490(&v41, v18[1], v18[2], ((char *)v18[2] - (char *)v18[1]) >> 4);
          sub_20DB79FE4((uint64_t *)&v41, *((void **)&v41 + 1), v19[1], v19[2], ((char *)v19[2] - (char *)v19[1]) >> 4);
        }
        else
        {
          int v20 = (void **)__dynamic_cast(v8, (const struct __class_type_info *)&unk_26C2443C0, (const struct __class_type_info *)&unk_26C2442E8, 0);
          uint64_t v42 = 0;
          long long v41 = 0uLL;
          sub_20DB5E490(&v41, v20[1], v20[2], ((char *)v20[2] - (char *)v20[1]) >> 4);
        }
        sub_20DB79C48((uint64_t *)&v41, *((void **)&v41 + 1), (uint64_t *)__p[0], (void *)__p[1], ((char *)__p[1] - (char *)__p[0]) >> 4);
        sub_20DB79864((uint64_t *)&v34, (uint64_t)&v41);
        uint64_t v43 = (void **)&v41;
        sub_20DB5E714(&v43);
      }
      if (v7) {
        sub_20DB5E6A0(v7);
      }
    }
    *(void *)&long long v41 = __p;
    sub_20DB5E714((void ***)&v41);
  }
  __p[0] = &v34;
  sub_20DB7AA28((void ***)__p);
  uint64_t v34 = (void **)v37;
  sub_20DB5E714(&v34);
  BOOL v21 = v38;
  uint64_t v22 = v39;
  if (v38 != v39)
  {
    while (1)
    {
      sub_20DB7A190((uint64_t)&v34, *v21, v21[1]);
      char v23 = v36;
      if (v36) {
        break;
      }
LABEL_59:
      sub_20DB7A84C((uint64_t)&v34);
      v21 += 3;
      if (v21 == v22) {
        goto LABEL_60;
      }
    }
    while (1)
    {
      long long v24 = (const void **)(v23 + 2);
      if (sub_20DB7A8D0(&v34, v23 + 2) == 1) {
        goto LABEL_58;
      }
      if (!*v24) {
        goto LABEL_58;
      }
      unint64_t v25 = __dynamic_cast(*v24, (const struct __class_type_info *)&unk_26C2443C0, (const struct __class_type_info *)&unk_26C2442D0, 0);
      if (!v25) {
        goto LABEL_58;
      }
      uint64_t v26 = (uint64_t)v25;
      if (__dynamic_cast(v25, (const struct __class_type_info *)&unk_26C2442D0, (const struct __class_type_info *)&unk_26C2443A8, 0))
      {
        goto LABEL_38;
      }
      if (__dynamic_cast((const void *)v26, (const struct __class_type_info *)&unk_26C2442D0, (const struct __class_type_info *)&unk_26C2443D0, 0))
      {
        goto LABEL_43;
      }
      BOOL v29 = __dynamic_cast((const void *)v26, (const struct __class_type_info *)&unk_26C2442D0, (const struct __class_type_info *)&unk_26C244390, 0);
      if (v29) {
        break;
      }
LABEL_58:
      char v23 = (void *)*v23;
      if (!v23) {
        goto LABEL_59;
      }
    }
    if (v29[28])
    {
LABEL_43:
      long long v41 = 0uLL;
      uint64_t v42 = 0;
      int v27 = *(_DWORD *)(v26 + 32);
      if (v27 == 3)
      {
        sub_20DB5D878((int *)(v26 + 32), 3u);
        sub_20DB78128((const std::string *)(v26 + 40), 0, (uint64_t *)__p);
        sub_20DB7040C((uint64_t *)&v41);
        long long v41 = *(_OWORD *)__p;
        uint64_t v42 = __p[2];
        memset(__p, 0, sizeof(__p));
        uint64_t v43 = __p;
        sub_20DB7ABD8(&v43);
        int v27 = *(_DWORD *)(v26 + 32);
      }
      if (v27 != 4)
      {
        uint64_t v31 = 0;
        long long v30 = 0uLL;
        sub_20DB7AB50((char *)&v30, (long long *)v41, *((long long **)&v41 + 1), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)&v41 + 1) - v41) >> 3));
        LODWORD(__p[0]) = 4;
        *(_OWORD *)&__p[1] = v30;
        uint64_t v33 = v31;
        long long v30 = 0uLL;
        uint64_t v31 = 0;
        sub_20DB6FEB4(v26, (int *)__p);
        if (LODWORD(__p[0]) == 4)
        {
          uint64_t v43 = &__p[1];
          sub_20DB7ABD8(&v43);
        }
        else if (LODWORD(__p[0]) == 3 && SHIBYTE(v33) < 0)
        {
          operator delete(__p[1]);
        }
        uint64_t v43 = (void **)&v30;
        sub_20DB7ABD8(&v43);
      }
      __p[0] = &v41;
      BOOL v28 = __p;
    }
    else
    {
LABEL_38:
      LODWORD(__p[0]) = 2;
      __p[1] = 0;
      sub_20DB6FEB4(v26, (int *)__p);
      if (LODWORD(__p[0]) != 4)
      {
        if (LODWORD(__p[0]) == 3 && SHIBYTE(v33) < 0) {
          operator delete(__p[1]);
        }
        goto LABEL_58;
      }
      *(void *)&long long v41 = &__p[1];
      BOOL v28 = (void **)&v41;
    }
    sub_20DB7ABD8((void ***)v28);
    goto LABEL_58;
  }
LABEL_60:
  uint64_t v34 = (void **)&v38;
  sub_20DB7AA28(&v34);
}

void sub_20DB7974C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void ***a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void **a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,void ***a29)
{
  *(void *)(v30 - 128) = &a29;
  sub_20DB5E714((void ***)(v30 - 128));
  if (v29) {
    sub_20DB5E6A0(v29);
  }
  a29 = (void ***)&a13;
  sub_20DB5E714((void ***)&a29);
  a13 = &a18;
  sub_20DB7AA28((void ***)&a13);
  a18 = (void **)&a26;
  sub_20DB7AA28(&a18);
  a18 = (void **)&a23;
  sub_20DB5E714(&a18);
  _Unwind_Resume(a1);
}

void *sub_20DB79864(uint64_t *a1, uint64_t a2)
{
  unint64_t v6 = a1[2];
  unint64_t v4 = a1 + 2;
  unint64_t v5 = v6;
  char v7 = (void *)*(v4 - 1);
  if ((unint64_t)v7 >= v6)
  {
    unint64_t v9 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v7 - *a1) >> 3);
    unint64_t v10 = v9 + 1;
    if (v9 + 1 > 0xAAAAAAAAAAAAAAALL) {
      sub_20DB5E168();
    }
    unint64_t v11 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v5 - *a1) >> 3);
    if (2 * v11 > v10) {
      unint64_t v10 = 2 * v11;
    }
    if (v11 >= 0x555555555555555) {
      unint64_t v12 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v12 = v10;
    }
    v17[4] = v4;
    uint64_t v13 = (char *)sub_20DB622B0((uint64_t)v4, v12);
    uint64_t v14 = &v13[24 * v9];
    v17[0] = v13;
    v17[1] = v14;
    v17[3] = &v13[24 * v15];
    *((void *)v14 + 1) = 0;
    *((void *)v14 + 2) = 0;
    *(void *)uint64_t v14 = 0;
    *(_OWORD *)uint64_t v14 = *(_OWORD *)a2;
    *((void *)v14 + 2) = *(void *)(a2 + 16);
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
    *(void *)(a2 + 16) = 0;
    v17[2] = v14 + 24;
    sub_20DB799A8(a1, v17);
    uint64_t v8 = (void *)a1[1];
    sub_20DB79B48(v17);
  }
  else
  {
    *char v7 = 0;
    v7[1] = 0;
    v7[2] = 0;
    *(_OWORD *)char v7 = *(_OWORD *)a2;
    v7[2] = *(void *)(a2 + 16);
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
    *(void *)(a2 + 16) = 0;
    uint64_t v8 = v7 + 3;
    a1[1] = (uint64_t)(v7 + 3);
  }
  a1[1] = (uint64_t)v8;
  return v8 - 3;
}

void sub_20DB79994(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_20DB79B48((void **)va);
  _Unwind_Resume(a1);
}

uint64_t sub_20DB799A8(uint64_t *a1, void *a2)
{
  uint64_t result = sub_20DB79A20((uint64_t)(a1 + 2), a1[1], (void *)a1[1], *a1, (void *)*a1, a2[1], a2[1]);
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

uint64_t sub_20DB79A20(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7)
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
  sub_20DB79AC4((uint64_t)v11);
  return v9;
}

uint64_t sub_20DB79AC4(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    sub_20DB79AFC(a1);
  }
  return a1;
}

void sub_20DB79AFC(uint64_t a1)
{
  uint64_t v1 = *(void ***)(*(void *)(a1 + 16) + 8);
  uint64_t v2 = *(void ***)(*(void *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    unint64_t v3 = v1;
    sub_20DB5E714(&v3);
    v1 += 3;
  }
}

void **sub_20DB79B48(void **a1)
{
  if (*a1) {
    operator delete(*a1);
  }
  return a1;
}

void sub_20DB79B7C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v2; uint64_t i = *(void *)(a1 + 16))
  {
    unint64_t v4 = (void **)(i - 24);
    *(void *)(a1 + 16) = v4;
    uint64_t v5 = v4;
    sub_20DB5E714(&v5);
  }
}

uint64_t sub_20DB79BD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v5 = a2;
  if (a2 == a3) {
    return a2;
  }
  uint64_t v6 = a3;
  do
  {
    sub_20DB5E904(a4);
    *(_OWORD *)a4 = *(_OWORD *)v5;
    a4[2] = *(void *)(v5 + 16);
    *(void *)uint64_t v5 = 0;
    *(void *)(v5 + 8) = 0;
    *(void *)(v5 + 16) = 0;
    a4 += 3;
    v5 += 24;
  }
  while (v5 != v6);
  return v6;
}

void *sub_20DB79C48(uint64_t *a1, void *a2, uint64_t *a3, void *a4, uint64_t a5)
{
  uint64_t v5 = a2;
  if (a5 >= 1)
  {
    uint64_t v7 = a3;
    uint64_t v11 = a1[2];
    uint64_t v9 = a1 + 2;
    uint64_t v10 = v11;
    unint64_t v12 = *(v9 - 1);
    if (a5 <= (uint64_t)(v11 - v12) >> 4)
    {
      uint64_t v19 = v12 - (void)a2;
      uint64_t v20 = (uint64_t)(v12 - (void)a2) >> 4;
      if (v20 >= a5)
      {
        BOOL v21 = &a3[2 * a5];
      }
      else
      {
        BOOL v21 = &a3[2 * v20];
        a1[1] = (uint64_t)sub_20DB5E594((uint64_t)v9, v21, a4, (void *)*(v9 - 1));
        if (v19 < 1) {
          return v5;
        }
      }
      sub_20DB79DF4((uint64_t)a1, v5, v12, (uint64_t)&v5[2 * a5]);
      sub_20DB7767C((uint64_t)v26, v7, v21, v5);
    }
    else
    {
      uint64_t v13 = *a1;
      unint64_t v14 = a5 + ((uint64_t)(v12 - *a1) >> 4);
      if (v14 >> 60) {
        sub_20DB5E168();
      }
      uint64_t v15 = ((uint64_t)a2 - v13) >> 4;
      uint64_t v16 = v10 - v13;
      if (v16 >> 3 > v14) {
        unint64_t v14 = v16 >> 3;
      }
      if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v17 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v17 = v14;
      }
      v26[4] = v9;
      if (v17) {
        uint64_t v18 = (char *)sub_20DB5E55C((uint64_t)v9, v17);
      }
      else {
        uint64_t v18 = 0;
      }
      uint64_t v22 = (uint64_t *)&v18[16 * v15];
      v26[0] = v18;
      v26[1] = v22;
      v26[3] = &v18[16 * v17];
      char v23 = &v22[2 * a5];
      do
      {
        *uint64_t v22 = *v7;
        uint64_t v24 = v7[1];
        v22[1] = v24;
        if (v24) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)(v24 + 8), 1uLL, memory_order_relaxed);
        }
        v22 += 2;
        v7 += 2;
      }
      while (v22 != v23);
      v26[2] = v23;
      uint64_t v5 = (void *)sub_20DB79E58(a1, v26, v5);
      sub_20DB7020C(v26);
    }
  }
  return v5;
}

void sub_20DB79DD4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  *(void *)(v10 + 8) = v11;
  _Unwind_Resume(exception_object);
}

void *sub_20DB79DF4(uint64_t a1, void *a2, unint64_t a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a1 + 8);
  uint64_t v7 = (void *)((char *)a2 + v6 - a4);
  long long v8 = (_OWORD *)v6;
  if ((unint64_t)v7 < a3)
  {
    uint64_t v9 = v7;
    long long v8 = *(_OWORD **)(a1 + 8);
    do
    {
      *v8++ = *(_OWORD *)v9;
      void *v9 = 0;
      v9[1] = 0;
      v9 += 2;
    }
    while ((unint64_t)v9 < a3);
  }
  *(void *)(a1 + 8) = v8;
  return sub_20DB79F0C((uint64_t)&v11, a2, v7, v6);
}

uint64_t sub_20DB79E58(uint64_t *a1, void *a2, void *a3)
{
  uint64_t v6 = a2[1];
  uint64_t v7 = (uint64_t)(a1 + 2);
  sub_20DB74A68((uint64_t)(a1 + 2), (uint64_t)a3, a3, *a1, (void *)*a1, v6, v6);
  a2[1] = v8;
  a2[2] = sub_20DB79F70(v7, (uint64_t)a3, a1[1], (_OWORD *)a2[2]);
  uint64_t v9 = *a1;
  *a1 = a2[1];
  a2[1] = v9;
  uint64_t v10 = a1[1];
  a1[1] = a2[2];
  a2[2] = v10;
  uint64_t v11 = a1[2];
  a1[2] = a2[3];
  a2[3] = v11;
  *a2 = a2[1];
  return v6;
}

void *sub_20DB79F0C(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  if (a3 != a2)
  {
    uint64_t v7 = a3;
    do
    {
      long long v8 = *((_OWORD *)v7 - 1);
      v7 -= 2;
      *uint64_t v7 = 0;
      v7[1] = 0;
      uint64_t v9 = *(std::__shared_weak_count **)(a4 - 8);
      *(_OWORD *)(a4 - 16) = v8;
      a4 -= 16;
      if (v9) {
        sub_20DB5E6A0(v9);
      }
    }
    while (v7 != a2);
  }
  return a3;
}

_OWORD *sub_20DB79F70(uint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4)
{
  unint64_t v4 = a4;
  uint64_t v9 = a4;
  long long v8 = a4;
  v6[0] = a1;
  v6[1] = &v8;
  v6[2] = &v9;
  if (a2 != a3)
  {
    do
    {
      *v4++ = *(_OWORD *)a2;
      *(void *)a2 = 0;
      *(void *)(a2 + 8) = 0;
      a2 += 16;
    }
    while (a2 != a3);
    uint64_t v9 = v4;
  }
  char v7 = 1;
  sub_20DB5E624((uint64_t)v6);
  return v4;
}

void *sub_20DB79FE4(uint64_t *a1, void *a2, uint64_t *a3, void *a4, uint64_t a5)
{
  uint64_t v5 = a2;
  if (a5 >= 1)
  {
    char v7 = a3;
    uint64_t v11 = a1[2];
    uint64_t v9 = a1 + 2;
    uint64_t v10 = v11;
    unint64_t v12 = *(v9 - 1);
    if (a5 <= (uint64_t)(v11 - v12) >> 4)
    {
      uint64_t v19 = v12 - (void)a2;
      uint64_t v20 = (uint64_t)(v12 - (void)a2) >> 4;
      if (v20 >= a5)
      {
        BOOL v21 = &a3[2 * a5];
      }
      else
      {
        BOOL v21 = &a3[2 * v20];
        a1[1] = (uint64_t)sub_20DB5E594((uint64_t)v9, v21, a4, (void *)*(v9 - 1));
        if (v19 < 1) {
          return v5;
        }
      }
      sub_20DB79DF4((uint64_t)a1, v5, v12, (uint64_t)&v5[2 * a5]);
      sub_20DB7767C((uint64_t)v26, v7, v21, v5);
    }
    else
    {
      uint64_t v13 = *a1;
      unint64_t v14 = a5 + ((uint64_t)(v12 - *a1) >> 4);
      if (v14 >> 60) {
        sub_20DB5E168();
      }
      uint64_t v15 = ((uint64_t)a2 - v13) >> 4;
      uint64_t v16 = v10 - v13;
      if (v16 >> 3 > v14) {
        unint64_t v14 = v16 >> 3;
      }
      if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v17 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v17 = v14;
      }
      v26[4] = v9;
      if (v17) {
        uint64_t v18 = (char *)sub_20DB5E55C((uint64_t)v9, v17);
      }
      else {
        uint64_t v18 = 0;
      }
      uint64_t v22 = (uint64_t *)&v18[16 * v15];
      v26[0] = v18;
      v26[1] = v22;
      v26[3] = &v18[16 * v17];
      char v23 = &v22[2 * a5];
      do
      {
        *uint64_t v22 = *v7;
        uint64_t v24 = v7[1];
        v22[1] = v24;
        if (v24) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)(v24 + 8), 1uLL, memory_order_relaxed);
        }
        v22 += 2;
        v7 += 2;
      }
      while (v22 != v23);
      v26[2] = v23;
      uint64_t v5 = (void *)sub_20DB79E58(a1, v26, v5);
      sub_20DB7020C(v26);
    }
  }
  return v5;
}

void sub_20DB7A170(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  *(void *)(v10 + 8) = v11;
  _Unwind_Resume(exception_object);
}

uint64_t sub_20DB7A190(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = 1065353216;
  if (a2 != a3)
  {
    uint64_t v5 = a2;
    do
    {
      sub_20DB7A208((void *)a1, v5);
      v5 += 2;
    }
    while (v5 != a3);
  }
  return a1;
}

void sub_20DB7A1F4(_Unwind_Exception *a1)
{
  sub_20DB7A84C(v1);
  _Unwind_Resume(a1);
}

void *sub_20DB7A208(void *a1, uint64_t *a2)
{
  sub_20DB7A268((uint64_t)a1, a2, (uint64_t)&v4);
  return sub_20DB7A328(a1, v4);
}

void sub_20DB7A244(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    sub_20DB5EE68((uint64_t)&a11, __p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_20DB7A268@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = a1 + 16;
  uint64_t v6 = operator new(0x20uLL);
  *(void *)a3 = v6;
  *(void *)(a3 + 8) = v5;
  *(unsigned char *)(a3 + 16) = 0;
  void *v6 = 0;
  v6[1] = 0;
  uint64_t v7 = *a2;
  uint64_t v8 = a2[1];
  v6[2] = *a2;
  void v6[3] = v8;
  if (v8)
  {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v8 + 8), 1uLL, memory_order_relaxed);
    uint64_t v7 = v6[2];
  }
  *(unsigned char *)(a3 + 16) = 1;
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v7 + 40))(v7);
  v6[1] = result;
  return result;
}

void sub_20DB7A30C(_Unwind_Exception *a1)
{
  void *v1 = 0;
  sub_20DB5EE68(v3, v2);
  _Unwind_Resume(a1);
}

void *sub_20DB7A328(void *a1, void *a2)
{
  unint64_t v4 = a2 + 2;
  unint64_t v5 = (*(uint64_t (**)(void))(*(void *)a2[2] + 40))(a2[2]);
  a2[1] = v5;
  uint64_t v6 = sub_20DB7A3A8((uint64_t)a1, v5, v4);
  sub_20DB7A500(a1, a2, v6);
  return a2;
}

void *sub_20DB7A3A8(uint64_t a1, unint64_t a2, void *a3)
{
  unint64_t v6 = *(void *)(a1 + 8);
  float v7 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v8 = *(float *)(a1 + 32);
  if (!v6 || (float)(v8 * (float)v6) < v7)
  {
    uint64_t v9 = 2 * v6;
    BOOL v10 = v6 < 3 || (v6 & (v6 - 1)) != 0;
    size_t v11 = v10 | v9;
    unint64_t v12 = vcvtps_u32_f32(v7 / v8);
    if (v11 <= v12) {
      size_t v13 = v12;
    }
    else {
      size_t v13 = v11;
    }
    sub_20DB7A5E8(a1, v13);
    unint64_t v6 = *(void *)(a1 + 8);
  }
  uint8x8_t v14 = (uint8x8_t)vcnt_s8((int8x8_t)v6);
  v14.i16[0] = vaddlv_u8(v14);
  if (v14.u32[0] > 1uLL)
  {
    unint64_t v15 = a2;
    if (v6 <= a2) {
      unint64_t v15 = a2 % v6;
    }
  }
  else
  {
    unint64_t v15 = (v6 - 1) & a2;
  }
  uint64_t v16 = *(void **)(*(void *)a1 + 8 * v15);
  if (!v16) {
    return 0;
  }
  int v17 = 0;
  do
  {
    uint64_t result = v16;
    uint64_t v16 = (void *)*v16;
    if (!v16) {
      break;
    }
    unint64_t v19 = v16[1];
    if (v14.u32[0] > 1uLL)
    {
      unint64_t v20 = v16[1];
      if (v19 >= v6) {
        unint64_t v20 = v19 % v6;
      }
    }
    else
    {
      unint64_t v20 = v19 & (v6 - 1);
    }
    if (v20 != v15) {
      break;
    }
    BOOL v21 = v19 == a2 && v16[2] == *a3;
    int v22 = v17 & !v21;
    v17 |= v21;
  }
  while (v22 != 1);
  return result;
}

void *sub_20DB7A500(void *result, void *a2, void *a3)
{
  int8x8_t v3 = (int8x8_t)result[1];
  unint64_t v4 = a2[1];
  uint8x8_t v5 = (uint8x8_t)vcnt_s8(v3);
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] > 1uLL)
  {
    if (v4 >= *(void *)&v3) {
      v4 %= *(void *)&v3;
    }
  }
  else
  {
    v4 &= *(void *)&v3 - 1;
  }
  if (!a3)
  {
    *a2 = result[2];
    result[2] = a2;
    *(void *)(*result + 8 * v4) = result + 2;
    if (!*a2) {
      goto LABEL_19;
    }
    unint64_t v6 = *(void *)(*a2 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v6 >= *(void *)&v3) {
        v6 %= *(void *)&v3;
      }
    }
    else
    {
      v6 &= *(void *)&v3 - 1;
    }
LABEL_18:
    *(void *)(*result + 8 * v6) = a2;
    goto LABEL_19;
  }
  *a2 = *a3;
  *a3 = a2;
  if (*a2)
  {
    unint64_t v6 = *(void *)(*a2 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v6 >= *(void *)&v3) {
        v6 %= *(void *)&v3;
      }
    }
    else
    {
      v6 &= *(void *)&v3 - 1;
    }
    if (v6 != v4) {
      goto LABEL_18;
    }
  }
LABEL_19:
  ++result[3];
  return result;
}

void sub_20DB7A5E8(uint64_t a1, size_t __n)
{
  if (__n == 1)
  {
    size_t prime = 2;
  }
  else
  {
    size_t prime = __n;
    if ((__n & (__n - 1)) != 0) {
      size_t prime = std::__next_prime(__n);
    }
  }
  int8x8_t v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(void *)&v4) {
    goto LABEL_16;
  }
  if (prime < *(void *)&v4)
  {
    unint64_t v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      unint64_t v5 = std::__next_prime(v5);
    }
    else
    {
      uint64_t v7 = 1 << -(char)__clz(v5 - 1);
      if (v5 >= 2) {
        unint64_t v5 = v7;
      }
    }
    if (prime <= v5) {
      size_t prime = v5;
    }
    if (prime < *(void *)&v4)
    {
LABEL_16:
      sub_20DB7A6D8(a1, prime);
    }
  }
}

void sub_20DB7A6D8(uint64_t a1, unint64_t a2)
{
  if (a2)
  {
    if (a2 >> 61) {
      sub_20DB5DB74();
    }
    int8x8_t v4 = operator new(8 * a2);
    unint64_t v5 = *(void **)a1;
    *(void *)a1 = v4;
    if (v5) {
      operator delete(v5);
    }
    uint64_t v6 = 0;
    *(void *)(a1 + 8) = a2;
    do
      *(void *)(*(void *)a1 + 8 * v6++) = 0;
    while (a2 != v6);
    uint64_t v7 = *(void **)(a1 + 16);
    if (v7)
    {
      unint64_t v8 = v7[1];
      uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2) {
          v8 %= a2;
        }
      }
      else
      {
        v8 &= a2 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v8) = a1 + 16;
      for (uint64_t i = (void *)*v7; *v7; uint64_t i = (void *)*v7)
      {
        unint64_t v12 = i[1];
        if (v9.u32[0] > 1uLL)
        {
          if (v12 >= a2) {
            v12 %= a2;
          }
        }
        else
        {
          v12 &= a2 - 1;
        }
        if (v12 == v8)
        {
          uint64_t v7 = i;
        }
        else
        {
          size_t v13 = i;
          if (*(void *)(*(void *)a1 + 8 * v12))
          {
            do
            {
              uint8x8_t v14 = v13;
              size_t v13 = (void *)*v13;
            }
            while (v13 && i[2] == v13[2]);
            *uint64_t v7 = v13;
            *uint8x8_t v14 = **(void **)(*(void *)a1 + 8 * v12);
            **(void **)(*(void *)a1 + 8 * v12) = i;
          }
          else
          {
            *(void *)(*(void *)a1 + 8 * v12) = v7;
            uint64_t v7 = i;
            unint64_t v8 = v12;
          }
        }
      }
    }
  }
  else
  {
    BOOL v10 = *(void **)a1;
    *(void *)a1 = 0;
    if (v10) {
      operator delete(v10);
    }
    *(void *)(a1 + 8) = 0;
  }
}

uint64_t sub_20DB7A84C(uint64_t a1)
{
  sub_20DB7A888(a1, *(void **)(a1 + 16));
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void sub_20DB7A888(int a1, void *__p)
{
  if (__p)
  {
    uint64_t v2 = __p;
    do
    {
      int8x8_t v3 = (void *)*v2;
      int8x8_t v4 = (std::__shared_weak_count *)v2[3];
      if (v4) {
        sub_20DB5E6A0(v4);
      }
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
}

uint64_t sub_20DB7A8D0(void *a1, void *a2)
{
  int8x8_t v3 = sub_20DB7A928(a1, (uint64_t)a2);
  if (!v3) {
    return 0;
  }
  uint64_t v4 = 1;
  do
  {
    uint64_t v5 = v4;
    int8x8_t v3 = (void *)*v3;
    if (!v3) {
      break;
    }
    ++v4;
  }
  while (v3[2] == *a2);
  return v5;
}

void *sub_20DB7A928(void *a1, uint64_t a2)
{
  unint64_t v4 = (*(uint64_t (**)(void))(**(void **)a2 + 40))();
  int8x8_t v5 = (int8x8_t)a1[1];
  if (!*(void *)&v5) {
    return 0;
  }
  uint8x8_t v6 = (uint8x8_t)vcnt_s8(v5);
  v6.i16[0] = vaddlv_u8(v6);
  if (v6.u32[0] > 1uLL)
  {
    unint64_t v7 = v4;
    if (v4 >= *(void *)&v5) {
      unint64_t v7 = v4 % *(void *)&v5;
    }
  }
  else
  {
    unint64_t v7 = (*(void *)&v5 - 1) & v4;
  }
  uint64_t i = *(void **)(*a1 + 8 * v7);
  if (i)
  {
    for (uint64_t i = (void *)*i; i; uint64_t i = (void *)*i)
    {
      unint64_t v9 = i[1];
      if (v4 == v9)
      {
        if (i[2] == *(void *)a2) {
          return i;
        }
      }
      else
      {
        if (v6.u32[0] > 1uLL)
        {
          if (v9 >= *(void *)&v5) {
            v9 %= *(void *)&v5;
          }
        }
        else
        {
          v9 &= *(void *)&v5 - 1;
        }
        if (v9 != v7) {
          return 0;
        }
      }
    }
  }
  return i;
}

void sub_20DB7AA28(void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (void **)**a1;
  if (v2)
  {
    unint64_t v4 = (void **)v1[1];
    int8x8_t v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        v4 -= 3;
        uint8x8_t v6 = v4;
        sub_20DB5E714(&v6);
      }
      while (v4 != v2);
      int8x8_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void *sub_20DB7AA9C(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    sub_20DB5DACC();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    uint8x8_t v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    uint8x8_t v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

char *sub_20DB7AB50(char *result, long long *a2, long long *a3, unint64_t a4)
{
  if (a4)
  {
    uint8x8_t v6 = result;
    sub_20DB6225C(result, a4);
    uint64_t result = sub_20DB70448((uint64_t)(v6 + 16), a2, a3, *((char **)v6 + 1));
    *((void *)v6 + 1) = result;
  }
  return result;
}

void sub_20DB7ABB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  *(void *)(v9 + 8) = v10;
  sub_20DB7ABD8(&a9);
  _Unwind_Resume(a1);
}

void sub_20DB7ABD8(void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    sub_20DB705E8((uint64_t *)v2);
    int8x8_t v3 = **a1;
    operator delete(v3);
  }
}

void *sub_20DB7AC2C(void *a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x210564A10](v13, a1);
  if (v13[0])
  {
    uint64_t v6 = (uint64_t)a1 + *(void *)(*a1 - 24);
    uint64_t v7 = *(void *)(v6 + 40);
    int v8 = *(_DWORD *)(v6 + 8);
    int v9 = *(_DWORD *)(v6 + 144);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
      uint64_t v10 = std::locale::use_facet(&v14, MEMORY[0x263F8C108]);
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
    if (!sub_20DB7ADD0(v7, a2, v11, a2 + a3, v6, (char)v9)) {
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | 5);
    }
  }
  MEMORY[0x210564A20](v13);
  return a1;
}

void sub_20DB7AD68(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  MEMORY[0x210564A20](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(void *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x20DB7AD48);
}

void sub_20DB7ADBC(_Unwind_Exception *a1)
{
}

uint64_t sub_20DB7ADD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
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
      sub_20DB65918(__p, v12, __c);
      size_t v13 = v18 >= 0 ? __p : (void **)__p[0];
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

void sub_20DB7AF3C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_20DB7AF58(void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = **a1;
  if (v2)
  {
    uint64_t v4 = (uint64_t)v1[1];
    size_t v5 = **a1;
    if ((void *)v4 != v2)
    {
      do
      {
        v4 -= 120;
        sub_20DB70EE4((uint64_t)(v1 + 2), v4);
      }
      while ((void *)v4 != v2);
      size_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void sub_20DB7AFF0(void **a1)
{
  uint64_t v1 = *a1;
  if (*a1)
  {
    uint64_t v3 = (uint64_t)a1[1];
    uint64_t v4 = *a1;
    if ((void *)v3 != v1)
    {
      do
      {
        v3 -= 120;
        sub_20DB70EE4((uint64_t)(a1 + 2), v3);
      }
      while ((void *)v3 != v1);
      uint64_t v4 = *a1;
    }
    a1[1] = v1;
    operator delete(v4);
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
  }
}

void sub_20DB7B060(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_20DB7B060(a1, *a2);
    sub_20DB7B060(a1, a2[1]);
    sub_20DB7B0BC((uint64_t)(a2 + 4));
    operator delete(a2);
  }
}

void sub_20DB7B0BC(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 24);
  if (v2 == 4)
  {
    uint64_t v3 = (void **)(a1 + 32);
    sub_20DB7ABD8(&v3);
  }
  else if (v2 == 3 && *(char *)(a1 + 55) < 0)
  {
    operator delete(*(void **)(a1 + 32));
  }
  if (*(char *)(a1 + 23) < 0) {
    operator delete(*(void **)a1);
  }
}

uint64_t *sub_20DB7B12C(uint64_t **a1, const void **a2, uint64_t a3, long long **a4)
{
  uint64_t v6 = (uint64_t **)sub_20DB7B1D8((uint64_t)a1, &v11, a2);
  uint64_t v7 = *v6;
  if (!*v6)
  {
    int v8 = v6;
    sub_20DB7B278((uint64_t)a1, a4, (uint64_t)v10);
    sub_20DB7B30C(a1, v11, v8, v10[0]);
    uint64_t v7 = v10[0];
    v10[0] = 0;
    sub_20DB7B568((uint64_t)v10, 0);
  }
  return v7;
}

void *sub_20DB7B1D8(uint64_t a1, void *a2, const void **a3)
{
  size_t v5 = (void *)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 8);
  if (v4)
  {
    uint64_t v7 = a1 + 16;
    do
    {
      while (1)
      {
        int v8 = (void *)v4;
        int v9 = (const void **)(v4 + 32);
        if (!sub_20DB7B364(v7, a3, (const void **)(v4 + 32))) {
          break;
        }
        uint64_t v4 = *v8;
        size_t v5 = v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }
      if (!sub_20DB7B364(v7, v9, a3)) {
        break;
      }
      size_t v5 = v8 + 1;
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

unsigned char *sub_20DB7B278@<X0>(uint64_t a1@<X0>, long long **a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v5 = a1 + 8;
  uint64_t v6 = (char *)operator new(0x58uLL);
  *(void *)a3 = v6;
  *(void *)(a3 + 8) = v5;
  *(unsigned char *)(a3 + 16) = 0;
  uint64_t result = v6 + 32;
  int v8 = *a2;
  if (*((char *)*a2 + 23) < 0)
  {
    uint64_t result = sub_20DB66FF4(result, *(void **)v8, *((void *)v8 + 1));
  }
  else
  {
    long long v9 = *v8;
    *((void *)v6 + 6) = *((void *)v8 + 2);
    *(_OWORD *)uint64_t result = v9;
  }
  *((_DWORD *)v6 + 14) = 0;
  *(unsigned char *)(a3 + 16) = 1;
  return result;
}

void sub_20DB7B2F4(_Unwind_Exception *a1)
{
  sub_20DB7B568(v1, 0);
  _Unwind_Resume(a1);
}

uint64_t *sub_20DB7B30C(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
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
  uint64_t result = sub_20DB7B3D0(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

BOOL sub_20DB7B364(uint64_t a1, const void **a2, const void **a3)
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

uint64_t *sub_20DB7B3D0(uint64_t *result, uint64_t *a2)
{
  *((unsigned char *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      int v2 = (uint64_t *)a2[2];
      if (*((unsigned char *)v2 + 24)) {
        return result;
      }
      int v3 = (uint64_t *)v2[2];
      int v4 = (uint64_t *)*v3;
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
            void *v9 = v2;
            v2[2] = (uint64_t)v9;
            int v3 = v9[2];
            int v2 = (uint64_t *)*v3;
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
          uint64_t *v2 = v11;
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
        int v2 = (uint64_t *)v3[1];
        uint64_t v12 = *v2;
        v3[1] = *v2;
        if (v12) {
          *(void *)(v12 + 16) = v3;
        }
        v2[2] = v3[2];
        *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
        uint64_t *v2 = (uint64_t)v3;
LABEL_27:
        _OWORD v3[2] = (uint64_t)v2;
        return result;
      }
      *((unsigned char *)v2 + 24) = 1;
      a2 = v3;
      *((unsigned char *)v3 + 24) = v3 == result;
      unsigned char *v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

void sub_20DB7B568(uint64_t a1, uint64_t a2)
{
  int v2 = *(void **)a1;
  *(void *)a1 = a2;
  if (v2)
  {
    if (*(unsigned char *)(a1 + 16)) {
      sub_20DB7B0BC((uint64_t)v2 + 32);
    }
    operator delete(v2);
  }
}

dispatch_time_t applesauce::dispatch::v1::walltime(std::chrono::duration<long long, std::ratio<1, 1000000>>::rep a1)
{
  __t.__d_.__rep_ = a1;
  time_t v1 = std::chrono::system_clock::to_time_t(&__t);
  v2.__d_.__rep_ = std::chrono::system_clock::from_time_t(v1).__d_.__rep_;
  uint64_t v3 = 1000 * (__t.__d_.__rep_ - v2.__d_.__rep_);
  if (__t.__d_.__rep_ < v2.__d_.__rep_) {
    v3 += 1000000000;
  }
  when.tv_sec = v1 + ((__t.__d_.__rep_ - v2.__d_.__rep_) >> 63);
  when.tv_nsec = v3;
  return dispatch_walltime(&when, 0);
}

void applesauce::xpc::object::to_string(void **this@<X0>, void *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  v2[0] = a2;
  v2[1] = 0;
  sub_20DB7B688((uint64_t)v2, *this);
}

void sub_20DB7B66C(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_20DB7B688(uint64_t a1, void *a2)
{
  uint64_t v4 = MEMORY[0x210564E30](a2);
  if (v4 == MEMORY[0x263EF8708])
  {
    std::string::push_back(*(std::string **)a1, 123);
    if (xpc_dictionary_get_count(a2))
    {
      ++*(void *)(a1 + 8);
      applier.__r_.__value_.__r.__words[0] = MEMORY[0x263EF8330];
      applier.__r_.__value_.__l.__size_ = 0x40000000;
      applier.__r_.__value_.__r.__words[2] = (std::string::size_type)sub_20DB7C050;
      unint64_t v48 = &unk_264127350;
      uint64_t v49 = a1;
      xpc_dictionary_apply(a2, &applier);
      size_t v5 = *(std::string **)a1;
      --*(void *)(a1 + 8);
      if (SHIBYTE(v5->__r_.__value_.__r.__words[2]) < 0) {
        std::string::size_type size = v5->__r_.__value_.__l.__size_;
      }
      else {
        std::string::size_type size = HIBYTE(v5->__r_.__value_.__r.__words[2]);
      }
      std::string::resize(v5, size - 1, 0);
      std::string::push_back(*(std::string **)a1, 10);
      std::string::append(*(std::string **)a1, *(void *)(a1 + 8), 9);
    }
    char v23 = *(std::string **)a1;
    std::string::value_type v24 = 125;
    goto LABEL_47;
  }
  if (v4 == MEMORY[0x263EF8798])
  {
    string_ptr = xpc_string_get_string_ptr(a2);
    std::string::size_type length = xpc_string_get_length(a2);
    std::string::push_back(*(std::string **)a1, 34);
    std::string::append(*(std::string **)a1, string_ptr, length);
    size_t v9 = *(std::string **)a1;
    std::string::value_type v10 = 34;
LABEL_19:
    std::string::push_back(v9, v10);
    return;
  }
  if (v4 == MEMORY[0x263EF8738])
  {
    int64_t value = xpc_int64_get_value(a2);
    uint64_t v12 = *(std::string **)a1;
    std::to_string(&applier, value);
    if ((applier.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      p_std::string applier = &applier;
    }
    else {
      p_std::string applier = (std::string *)applier.__r_.__value_.__r.__words[0];
    }
    if ((applier.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v14 = HIBYTE(applier.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v14 = applier.__r_.__value_.__l.__size_;
    }
LABEL_28:
    std::string::append(v12, (const std::string::value_type *)p_applier, v14);
    if (SHIBYTE(applier.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(applier.__r_.__value_.__l.__data_);
    }
    return;
  }
  if (v4 == MEMORY[0x263EF86D8])
  {
    std::string::push_back(*(std::string **)a1, 91);
    size_t count = xpc_array_get_count(a2);
    if (count)
    {
      size_t v16 = count;
      unint64_t v17 = 0;
      ++*(void *)(a1 + 8);
      do
      {
        if (v17) {
          std::string::push_back(*(std::string **)a1, 44);
        }
        std::string::push_back(*(std::string **)a1, 10);
        std::string::append(*(std::string **)a1, *(void *)(a1 + 8), 9);
        char v18 = *(std::string **)a1;
        std::to_string(&applier, v17);
        if ((applier.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          unint64_t v19 = &applier;
        }
        else {
          unint64_t v19 = (std::string *)applier.__r_.__value_.__r.__words[0];
        }
        if ((applier.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          std::string::size_type v20 = HIBYTE(applier.__r_.__value_.__r.__words[2]);
        }
        else {
          std::string::size_type v20 = applier.__r_.__value_.__l.__size_;
        }
        std::string::append(v18, (const std::string::value_type *)v19, v20);
        if (SHIBYTE(applier.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(applier.__r_.__value_.__l.__data_);
        }
        std::string::append(*(std::string **)a1, ": ");
        xpc_object_t v21 = xpc_array_get_value(a2, v17);
        sub_20DB7B688(a1, v21);
        ++v17;
      }
      while (v16 != v17);
      int v22 = *(std::string **)a1;
      --*(void *)(a1 + 8);
      std::string::push_back(v22, 10);
      std::string::append(*(std::string **)a1, *(void *)(a1 + 8), 9);
      char v23 = *(std::string **)a1;
      std::string::value_type v24 = 93;
      goto LABEL_47;
    }
    size_t v9 = *(std::string **)a1;
    std::string::value_type v10 = 93;
    goto LABEL_19;
  }
  if (v4 != MEMORY[0x263EF86F8])
  {
    if (v4 == MEMORY[0x263EF86E0])
    {
      if (xpc_BOOL_get_value(a2)) {
        uint64_t v37 = "true";
      }
      else {
        uint64_t v37 = "false";
      }
      uint64_t v38 = *(std::string **)a1;
LABEL_85:
      std::string::append(v38, v37);
      return;
    }
    if (v4 != MEMORY[0x263EF87A0])
    {
      if (v4 != MEMORY[0x263EF8758])
      {
        if (v4 == MEMORY[0x263EF8710])
        {
          sub_20DB7BDE0((std::string **)a1, a2);
        }
        else if (v4 == MEMORY[0x263EF8700])
        {
          sub_20DB7BE6C((std::string **)a1, a2);
        }
        else if (v4 == MEMORY[0x263EF87A8])
        {
          sub_20DB7BF18((std::string **)a1, a2);
        }
        else if (v4 == MEMORY[0x263EF8720])
        {
          sub_20DB7BF94((std::string **)a1, a2);
        }
        else
        {
          xpc_object_t object = a2;
          if (a2) {
            xpc_retain(a2);
          }
          else {
            xpc_object_t object = xpc_null_create();
          }
          uint64_t v43 = *(std::string **)a1;
          sub_20DB7C004(&object, &applier);
          if ((applier.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            char v44 = &applier;
          }
          else {
            char v44 = (std::string *)applier.__r_.__value_.__r.__words[0];
          }
          if ((applier.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            std::string::size_type v45 = HIBYTE(applier.__r_.__value_.__r.__words[2]);
          }
          else {
            std::string::size_type v45 = applier.__r_.__value_.__l.__size_;
          }
          std::string::append(v43, (const std::string::value_type *)v44, v45);
          if (SHIBYTE(applier.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(applier.__r_.__value_.__l.__data_);
          }
          xpc_release(object);
        }
        return;
      }
      uint64_t v38 = *(std::string **)a1;
      uint64_t v37 = "null";
      goto LABEL_85;
    }
    uint64_t v39 = xpc_uint64_get_value(a2);
    uint64_t v40 = *(std::string **)a1;
    std::to_string(&applier, v39);
    if ((applier.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      long long v41 = &applier;
    }
    else {
      long long v41 = (std::string *)applier.__r_.__value_.__r.__words[0];
    }
    if ((applier.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v42 = HIBYTE(applier.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v42 = applier.__r_.__value_.__l.__size_;
    }
    std::string::append(v40, (const std::string::value_type *)v41, v42);
    if (SHIBYTE(applier.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(applier.__r_.__value_.__l.__data_);
    }
    char v23 = *(std::string **)a1;
    std::string::value_type v24 = 117;
LABEL_47:
    std::string::push_back(v23, v24);
    return;
  }
  bytes_ptr = xpc_data_get_bytes_ptr(a2);
  int64_t v26 = xpc_data_get_length(a2);
  std::string::append(*(std::string **)a1, "[");
  int v27 = *(std::string **)a1;
  std::to_string(&applier, v26);
  if ((applier.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    BOOL v28 = &applier;
  }
  else {
    BOOL v28 = (std::string *)applier.__r_.__value_.__r.__words[0];
  }
  if ((applier.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v29 = HIBYTE(applier.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v29 = applier.__r_.__value_.__l.__size_;
  }
  std::string::append(v27, (const std::string::value_type *)v28, v29);
  if (SHIBYTE(applier.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(applier.__r_.__value_.__l.__data_);
  }
  std::string::append(*(std::string **)a1, " bytes]");
  if (v26)
  {
    std::string::append(*(std::string **)a1, " ");
    uint64_t v12 = *(std::string **)a1;
    memset(&applier, 0, sizeof(applier));
    if (v26 < 1)
    {
      unsigned __int8 v34 = 0;
    }
    else
    {
      uint64_t v30 = &bytes_ptr[v26];
      do
      {
        if (*bytes_ptr >= 0xA0u) {
          char v31 = 87;
        }
        else {
          char v31 = 48;
        }
        std::string::push_back(&applier, v31 + (*bytes_ptr >> 4));
        unsigned int v32 = *bytes_ptr & 0xF;
        if (v32 >= 0xA) {
          char v33 = 87;
        }
        else {
          char v33 = 48;
        }
        std::string::push_back(&applier, v33 + v32);
        std::string::push_back(&applier, 32);
        ++bytes_ptr;
      }
      while (bytes_ptr < v30);
      unsigned __int8 v34 = HIBYTE(applier.__r_.__value_.__r.__words[2]);
      if (SHIBYTE(applier.__r_.__value_.__r.__words[2]) < 0)
      {
        std::string::size_type v35 = applier.__r_.__value_.__l.__size_;
        if (applier.__r_.__value_.__l.__size_)
        {
          std::string::size_type v36 = applier.__r_.__value_.__r.__words[0];
          goto LABEL_94;
        }
      }
      else if (*((unsigned char *)&applier.__r_.__value_.__s + 23))
      {
        std::string::size_type v35 = HIBYTE(applier.__r_.__value_.__r.__words[2]);
        std::string::size_type v36 = (std::string::size_type)&applier;
LABEL_94:
        std::string::erase(&applier, ~v36 + v36 + v35, 1uLL);
        unsigned __int8 v34 = HIBYTE(applier.__r_.__value_.__r.__words[2]);
      }
    }
    if ((v34 & 0x80u) == 0) {
      p_std::string applier = &applier;
    }
    else {
      p_std::string applier = (std::string *)applier.__r_.__value_.__r.__words[0];
    }
    if ((v34 & 0x80u) == 0) {
      std::string::size_type v14 = v34;
    }
    else {
      std::string::size_type v14 = applier.__r_.__value_.__l.__size_;
    }
    goto LABEL_28;
  }
}

void sub_20DB7BD7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, xpc_object_t object, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  xpc_release(object);
  _Unwind_Resume(a1);
}

void sub_20DB7BDE0(std::string **a1, xpc_object_t xdouble)
{
  double value = xpc_double_get_value(xdouble);
  uint64_t v4 = *a1;
  std::to_string(&v7, value);
  if ((v7.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    size_t v5 = &v7;
  }
  else {
    size_t v5 = (std::string *)v7.__r_.__value_.__r.__words[0];
  }
  if ((v7.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type size = HIBYTE(v7.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type size = v7.__r_.__value_.__l.__size_;
  }
  std::string::append(v4, (const std::string::value_type *)v5, size);
  if (SHIBYTE(v7.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v7.__r_.__value_.__l.__data_);
  }
}

void sub_20DB7BE50(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

std::string *sub_20DB7BE6C(std::string **a1, xpc_object_t xdate)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  time_t v5 = xpc_date_get_value(xdate) / 0x3B9ACA00uLL;
  localtime_r(&v5, &v4);
  strftime(__s, 0x1EuLL, "%F %T %Z", &v4);
  return std::string::append(*a1, __s);
}

std::string *sub_20DB7BF18(std::string **a1, xpc_object_t xuuid)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  memset(v5, 0, sizeof(v5));
  bytes = xpc_uuid_get_bytes(xuuid);
  uuid_unparse_lower(bytes, v5);
  return std::string::append(*a1, v5);
}

void sub_20DB7BF94(std::string **a1, xpc_object_t xdict)
{
  string = xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x263EF86B0]);
  std::string::append(*a1, "XPC_ERROR(");
  std::string::append(*a1, string);
  tm v4 = *a1;

  std::string::push_back(v4, 41);
}

void sub_20DB7C004(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (char *)MEMORY[0x210564D90](*a1);
  sub_20DB7AA9C(a2, v3);

  free(v3);
}

uint64_t sub_20DB7C050(uint64_t a1, const std::string::value_type *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  std::string::push_back(*(std::string **)v5, 10);
  std::string::append(*(std::string **)v5, *(void *)(v5 + 8), 9);
  std::string::push_back(*(std::string **)v5, 34);
  std::string::append(*(std::string **)v5, a2);
  std::string::append(*(std::string **)v5, "\": ");
  sub_20DB7B688(v5, a3);
  std::string::push_back(*(std::string **)v5, 44);
  return 1;
}

uint64_t applesauce::xpc::dyn_cast_or_default(xpc_object_t *a1, unsigned int a2)
{
  return applesauce::xpc::dyn_cast_or_default(a1, a2);
}

char *applesauce::xpc::dyn_cast_or_default@<X0>(xpc_object_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = MEMORY[0x210564E30](*a1);
  uint64_t v7 = MEMORY[0x263EF86F8];
  *(void *)(a3 + 8) = 0;
  *(void *)(a3 + 16) = 0;
  *(void *)a3 = 0;
  if (v6 == v7)
  {
    bytes_ptr = (char *)xpc_data_get_bytes_ptr(*a1);
    size_t length = xpc_data_get_length(*a1);
    return sub_20DB7C2D4(a3, *(char **)a3, bytes_ptr, &bytes_ptr[length], length);
  }
  else
  {
    int v8 = *(const void **)a2;
    uint64_t v9 = *(void *)(a2 + 8);
    size_t v10 = v9 - *(void *)a2;
    return (char *)sub_20DB7C4C0((void *)a3, v8, v9, v10);
  }
}

void sub_20DB7C1A4(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void *applesauce::xpc::dyn_cast_or_default@<X0>(xpc_object_t *a1@<X0>, char *a2@<X1>, void *a3@<X8>)
{
  if (MEMORY[0x210564E30](*a1) == MEMORY[0x263EF8798])
  {
    string_ptr = (char *)xpc_string_get_string_ptr(*a1);
    size_t length = xpc_string_get_length(*a1);
    return sub_20DB5B6DC(a3, string_ptr, length);
  }
  else
  {
    return sub_20DB7AA9C(a3, a2);
  }
}

double applesauce::xpc::dyn_cast_or_default(void *a1, double a2)
{
  if (MEMORY[0x210564E30](*a1) != MEMORY[0x263EF8710]) {
    return a2;
  }
  uint64_t v5 = (void *)*a1;

  return xpc_double_get_value(v5);
}

char *sub_20DB7C2D4(uint64_t a1, char *__dst, char *__src, char *a4, int64_t a5)
{
  uint64_t v5 = __dst;
  if (a5 < 1) {
    return v5;
  }
  size_t v10 = *(char **)(a1 + 8);
  uint64_t v9 = *(void *)(a1 + 16);
  if (v9 - (uint64_t)v10 < a5)
  {
    uint64_t v11 = *(char **)a1;
    uint64_t v12 = (uint64_t)&v10[a5 - *(void *)a1];
    if (v12 < 0) {
      sub_20DB5E168();
    }
    uint64_t v13 = (char *)(__dst - v11);
    unint64_t v14 = v9 - (void)v11;
    if (2 * v14 > v12) {
      uint64_t v12 = 2 * v14;
    }
    if (v14 >= 0x3FFFFFFFFFFFFFFFLL) {
      size_t v15 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      size_t v15 = v12;
    }
    if (v15)
    {
      size_t v16 = v15;
      unint64_t v17 = (char *)operator new(v15);
    }
    else
    {
      size_t v16 = 0;
      unint64_t v17 = 0;
    }
    int v27 = &v13[(void)v17];
    memcpy(&v13[(void)v17], __src, a5);
    BOOL v28 = &v13[(void)v17];
    size_t v29 = v16;
    if (v11 != v5)
    {
      do
      {
        v13[(void)v17 - 1] = v13[(void)(v11 - 1)];
        --v13;
      }
      while (v13);
      size_t v10 = *(char **)(a1 + 8);
      BOOL v28 = v17;
    }
    uint64_t v30 = &v27[a5];
    char v31 = &v17[v29];
    if (v10 != v5) {
      memmove(v30, v5, v10 - v5);
    }
    unsigned int v32 = *(char **)a1;
    *(void *)a1 = v28;
    *(void *)(a1 + 8) = &v30[v10 - v5];
    *(void *)(a1 + 16) = v31;
    if (v32) {
      operator delete(v32);
    }
    return v27;
  }
  uint64_t v18 = v10 - __dst;
  if (v10 - __dst >= a5)
  {
    unint64_t v19 = &__src[a5];
    xpc_object_t v21 = *(char **)(a1 + 8);
LABEL_17:
    int v22 = &v5[a5];
    char v23 = &v21[-a5];
    std::string::value_type v24 = v21;
    if (&v21[-a5] < v10)
    {
      int64_t v25 = &v10[a5] - v21;
      std::string::value_type v24 = v21;
      do
      {
        char v26 = *v23++;
        *v24++ = v26;
        --v25;
      }
      while (v25);
    }
    *(void *)(a1 + 8) = v24;
    if (v21 != v22) {
      memmove(&v5[a5], v5, v21 - v22);
    }
    if (v19 != __src) {
      memmove(v5, __src, v19 - __src);
    }
    return v5;
  }
  unint64_t v19 = &__src[v18];
  int64_t v20 = a4 - &__src[v18];
  if (a4 != &__src[v18]) {
    memmove(*(void **)(a1 + 8), &__src[v18], a4 - &__src[v18]);
  }
  xpc_object_t v21 = &v10[v20];
  *(void *)(a1 + 8) = &v10[v20];
  if (v18 >= 1) {
    goto LABEL_17;
  }
  return v5;
}

void *sub_20DB7C4C0(void *result, const void *a2, uint64_t a3, size_t __sz)
{
  if (__sz)
  {
    uint64_t v6 = result;
    uint64_t result = sub_20DB7C53C(result, __sz);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      uint64_t result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_20DB7C520(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *sub_20DB7C53C(void *a1, size_t __sz)
{
  if ((__sz & 0x8000000000000000) != 0) {
    sub_20DB5E168();
  }
  uint64_t result = (char *)operator new(__sz);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[__sz];
  return result;
}

void applesauce::xpc::auto_reply::create_from_request(xpc_object_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = MEMORY[0x210564E30](*a1);
  uint64_t v5 = MEMORY[0x263EF8708];
  if (v4 != MEMORY[0x263EF8708])
  {
    *a2 = 0;
    a2[1] = 0;
    return;
  }
  xpc_object_t reply = xpc_dictionary_create_reply(*a1);
  xpc_object_t v7 = reply;
  if (reply)
  {
    xpc_object_t v9 = reply;
  }
  else
  {
    xpc_object_t v7 = xpc_null_create();
    xpc_object_t v9 = v7;
    if (!v7)
    {
      size_t v8 = 0;
      goto LABEL_10;
    }
  }
  if (MEMORY[0x210564E30](v7) != v5)
  {
    size_t v8 = v7;
LABEL_10:
    xpc_object_t v7 = xpc_null_create();
    xpc_object_t v9 = v7;
    goto LABEL_11;
  }
  xpc_retain(v7);
  size_t v8 = v7;
LABEL_11:
  applesauce::xpc::auto_reply::create_from_reply(&v9, a2);
  xpc_release(v7);
  xpc_object_t v9 = 0;
  xpc_release(v8);
}

void applesauce::xpc::auto_reply::create_from_reply(xpc_object_t *a1@<X0>, void *a2@<X8>)
{
  if (MEMORY[0x210564E30](*a1) != MEMORY[0x263EF8708])
  {
    *a2 = 0;
    a2[1] = 0;
    return;
  }
  xpc_connection_t remote_connection = xpc_dictionary_get_remote_connection(*a1);
  xpc_object_t v5 = remote_connection;
  uint64_t v6 = MEMORY[0x263EF86F0];
  if (remote_connection)
  {
    xpc_retain(remote_connection);
    xpc_object_t v8 = v5;
  }
  else
  {
    xpc_object_t v5 = xpc_null_create();
    xpc_object_t v8 = v5;
    if (!v5) {
      goto LABEL_7;
    }
  }
  if (MEMORY[0x210564E30](v5) == v6)
  {
    xpc_retain(v5);
    goto LABEL_9;
  }
LABEL_7:
  xpc_object_t v8 = xpc_null_create();
LABEL_9:
  xpc_release(v5);
  xpc_object_t v7 = v8;
  if (MEMORY[0x210564E30](v8) == v6)
  {
    applesauce::xpc::auto_reply::create_from_dict((std::__shared_weak_count_vtbl **)a1, (uint64_t *)&v8, a2);
  }
  else
  {
    *a2 = 0;
    a2[1] = 0;
  }
  xpc_release(v7);
}

void applesauce::xpc::auto_reply::create_from_dict(std::__shared_weak_count_vtbl **a1@<X0>, uint64_t *a2@<X1>, void *a3@<X8>)
{
  if (MEMORY[0x210564E30](*a1) == MEMORY[0x263EF8708] && MEMORY[0x210564E30](*a2) == MEMORY[0x263EF86F0])
  {
    uint64_t v6 = (std::__shared_weak_count *)operator new(0x28uLL);
    v6->__shared_owners_ = 0;
    v6->__shared_weak_owners_ = 0;
    v6->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C244F70;
    xpc_object_t v7 = *a1;
    v6[1].__vftable = *a1;
    xpc_object_t v8 = &v6[1].__vftable;
    if (v7) {
      xpc_retain(v7);
    }
    else {
      *xpc_object_t v8 = xpc_null_create();
    }
    xpc_object_t v9 = (void *)*a2;
    v6[1].__shared_owners_ = *a2;
    if (v9) {
      xpc_retain(v9);
    }
    else {
      v6[1].__shared_owners_ = (uint64_t)xpc_null_create();
    }
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
    *a3 = v8;
    a3[1] = v6;
    sub_20DB5E6A0(v6);
  }
  else
  {
    *a3 = 0;
    a3[1] = 0;
  }
}

void sub_20DB7C874(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C244F70;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_20DB7C894(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C244F70;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x210564B70);
}

void sub_20DB7C8E8(uint64_t a1)
{
  if (MEMORY[0x210564E30](*(void *)(a1 + 32)) == MEMORY[0x263EF86F0]
    && MEMORY[0x210564E30](*(void *)(a1 + 24)) == MEMORY[0x263EF8708])
  {
    xpc_connection_send_message(*(xpc_connection_t *)(a1 + 32), *(xpc_object_t *)(a1 + 24));
  }
  xpc_release(*(xpc_object_t *)(a1 + 32));
  *(void *)(a1 + 32) = 0;
  xpc_release(*(xpc_object_t *)(a1 + 24));
  *(void *)(a1 + 24) = 0;
}

uint64_t sub_20DB7C978(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 8))();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::string::size_type std::string::find(const std::string *this, std::string::value_type __c, std::string::size_type __pos)
{
  return MEMORY[0x270F98238](this, __c, __pos);
}

std::string *__cdecl std::locale::name(std::string *__return_ptr retstr, const std::locale *this)
{
  return (std::string *)MEMORY[0x270F982D8](retstr, this);
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

{
  return (std::runtime_error *)MEMORY[0x270F983C8](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const std::string *a2)
{
  return (std::runtime_error *)MEMORY[0x270F983B8](this, a2);
}

{
  return (std::runtime_error *)MEMORY[0x270F983D0](this, a2);
}

void std::runtime_error::~runtime_error(std::runtime_error *this)
{
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

std::regex_error *__cdecl std::regex_error::regex_error(std::regex_error *this, std::regex_constants::error_type __ecode)
{
  return (std::regex_error *)MEMORY[0x270F98440](this, *(void *)&__ecode);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x270F98458](__n);
}

std::string *__cdecl std::string::erase(std::string *this, std::string::size_type __pos, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F98480](this, __pos, __n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x270F98498](this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984A0](this, __s, __n);
}

std::string *__cdecl std::string::append(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  return (std::string *)MEMORY[0x270F984B0](this, __n, __c);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x270F984E0](this, __pos, __s);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
}

std::string *__cdecl std::string::basic_string(std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n, std::allocator<char> *__a)
{
  return (std::string *)MEMORY[0x270F98548](this, __str, __pos, __n, __a);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x270F98560](this, __str);
}

std::string *__cdecl std::string::operator=(std::string *this, std::string::value_type __c)
{
  return (std::string *)MEMORY[0x270F98568](this, __c);
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
  return MEMORY[0x270F987B8]();
}

std::regex_traits<char>::char_class_type std::__get_classname(const char *__s, BOOL __icase)
{
  return MEMORY[0x270F98890](__s, __icase);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

std::string *__cdecl std::__get_collation_name(std::string *__return_ptr retstr, const char *__s)
{
  return (std::string *)MEMORY[0x270F98A00](retstr, __s);
}

uint64_t std::stol(const std::string *__str, size_t *__idx, int __base)
{
  return MEMORY[0x270F98B80](__str, __idx, *(void *)&__base);
}

std::chrono::system_clock::time_point std::chrono::system_clock::from_time_t(time_t __t)
{
  return (std::chrono::system_clock::time_point)MEMORY[0x270F98C20](__t);
}

time_t std::chrono::system_clock::to_time_t(const std::chrono::system_clock::time_point *__t)
{
  return MEMORY[0x270F98C30](__t);
}

std::locale *__cdecl std::locale::locale(std::locale *this, const std::locale *a2)
{
  return (std::locale *)MEMORY[0x270F98C70](this, a2);
}

std::locale *__cdecl std::locale::locale(std::locale *this)
{
  return (std::locale *)MEMORY[0x270F98C78](this);
}

void std::locale::~locale(std::locale *this)
{
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, double __val)
{
  return (std::string *)MEMORY[0x270F98DF8](retstr, __val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unint64_t __val)
{
  return (std::string *)MEMORY[0x270F98E20](retstr, __val);
}

{
  return (std::string *)MEMORY[0x270F98E30](retstr, __val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, uint64_t __val)
{
  return (std::string *)MEMORY[0x270F98E28](retstr, __val);
}

uint64_t std::operator+<char>()
{
  return MEMORY[0x270F98E38]();
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

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x270F98EC0](thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x270ED7DA0](lpfunc, obj, lpdso_handle);
}

void __cxa_bad_typeid(void)
{
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

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

void *__dynamic_cast(const void *lpsrc, const struct __class_type_info *lpstype, const struct __class_type_info *lpdtype, ptrdiff_t s2d)
{
  return (void *)MEMORY[0x270F98F30](lpsrc, lpstype, lpdtype, s2d);
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x270ED7E28](*(void *)&a1, a2);
}

void bzero(void *a1, size_t a2)
{
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return MEMORY[0x270ED95B8](when, delta);
}

void exit(int a1)
{
}

void free(void *a1)
{
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x270EDA0A0](a1, a2);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x270EDA458](__s, *(void *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
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

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return MEMORY[0x270EDB5F0](a1, a2, a3, a4);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

void uuid_unparse_lower(const uuid_t uu, uuid_string_t out)
{
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x270EDBD38](xarray);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x270EDBD88](xarray, index);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x270EDBDE0](xBOOL);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x270EDBF40](object);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x270EDBFA8](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x270EDBFB8](xdata);
}

int64_t xpc_date_get_value(xpc_object_t xdate)
{
  return MEMORY[0x270EDBFD8](xdate);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x270EDBFE8](xdict, applier);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x270EDC020](original);
}

size_t xpc_dictionary_get_count(xpc_object_t xdict)
{
  return MEMORY[0x270EDC058](xdict);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return (xpc_connection_t)MEMORY[0x270EDC098](xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x270EDC0A8](xdict, key);
}

double xpc_double_get_value(xpc_object_t xdouble)
{
  MEMORY[0x270EDC170](xdouble);
  return result;
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x270EDC218](xint);
}

xpc_object_t xpc_null_create(void)
{
  return (xpc_object_t)MEMORY[0x270EDC290]();
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x270EDC2B8](object);
}

size_t xpc_string_get_length(xpc_object_t xstring)
{
  return MEMORY[0x270EDC3F0](xstring);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x270EDC3F8](xstring);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x270EDC440](xuint);
}