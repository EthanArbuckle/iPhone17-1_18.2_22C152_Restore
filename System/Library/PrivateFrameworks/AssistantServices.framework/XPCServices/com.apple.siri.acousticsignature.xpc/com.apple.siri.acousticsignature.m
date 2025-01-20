void sub_100003454(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100003598(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_1000036E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100003860(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

int main(int argc, const char **argv, const char **envp)
{
  v3 = objc_alloc_init(ASXListenerDelegate);
  v4 = +[NSXPCListener serviceListener];
  [v4 setDelegate:v3];
  [v4 resume];
  exit(1);
}

std::logic_error *sub_100003BC8(std::logic_error *a1, const char *a2)
{
  result = std::logic_error::logic_error(a1, a2);
  return result;
}

uint64_t sub_100003BFC(uint64_t a1, uint64_t a2)
{
  if (*(char *)(a1 + 23) < 0)
  {
    sub_100003F54(__dst, *(void **)a1, *(void *)(a1 + 8));
  }
  else
  {
    *(_OWORD *)__dst = *(_OWORD *)a1;
    uint64_t v31 = *(void *)(a1 + 16);
  }
  if (sub_100003FF0((const char *)__dst))
  {
    if (*(char *)(a2 + 23) < 0)
    {
      sub_100003F54(__p, *(void **)a2, *(void *)(a2 + 8));
    }
    else
    {
      *(_OWORD *)__p = *(_OWORD *)a2;
      uint64_t v29 = *(void *)(a2 + 16);
    }
    BOOL v4 = !sub_100003FF0((const char *)__p);
    if (SHIBYTE(v29) < 0) {
      operator delete(__p[0]);
    }
  }
  else
  {
    BOOL v4 = 1;
  }
  if (SHIBYTE(v31) < 0)
  {
    operator delete(__dst[0]);
    if (v4) {
      goto LABEL_13;
    }
  }
  else if (v4)
  {
LABEL_13:
    sub_100004064(&std::cerr, (uint64_t)"Invalid version string\n", 23);
    return 0;
  }
  std::string::size_type v6 = std::string::find((const std::string *)a1, 46, 0);
  std::string::size_type v7 = std::string::find((const std::string *)a1, 46, v6 + 1);
  std::string::size_type v8 = std::string::find((const std::string *)a2, 46, 0);
  std::string::size_type v9 = std::string::find((const std::string *)a2, 46, v8 + 1);
  std::string::basic_string(&v27, (const std::string *)a1, 0, v6, (std::allocator<char> *)&v32);
  if ((v27.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v10 = &v27;
  }
  else {
    v10 = (std::string *)v27.__r_.__value_.__r.__words[0];
  }
  int v11 = strtoul((const char *)v10, 0, 10);
  if (SHIBYTE(v27.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v27.__r_.__value_.__l.__data_);
  }
  int v12 = v11 << 25;
  std::string::basic_string(&v27, (const std::string *)a1, v6 + 1, v7 + ~v6, (std::allocator<char> *)&v32);
  if ((v27.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v13 = &v27;
  }
  else {
    v13 = (std::string *)v27.__r_.__value_.__r.__words[0];
  }
  int v14 = strtoul((const char *)v13, 0, 10);
  if (SHIBYTE(v27.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v27.__r_.__value_.__l.__data_);
  }
  int v15 = v12 + (v14 << 20);
  std::string::basic_string(&v27, (const std::string *)a1, v7 + 1, 0xFFFFFFFFFFFFFFFFLL, (std::allocator<char> *)&v32);
  if ((v27.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v16 = &v27;
  }
  else {
    v16 = (std::string *)v27.__r_.__value_.__r.__words[0];
  }
  int v17 = strtoul((const char *)v16, 0, 10);
  if (SHIBYTE(v27.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v27.__r_.__value_.__l.__data_);
  }
  int v18 = v15 + (v17 << 15);
  std::string::basic_string(&v27, (const std::string *)a2, 0, v8, (std::allocator<char> *)&v32);
  if ((v27.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v19 = &v27;
  }
  else {
    v19 = (std::string *)v27.__r_.__value_.__r.__words[0];
  }
  int v20 = strtoul((const char *)v19, 0, 10);
  if (SHIBYTE(v27.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v27.__r_.__value_.__l.__data_);
  }
  int v21 = v18 + (v20 << 10);
  std::string::basic_string(&v27, (const std::string *)a2, v8 + 1, v9 + ~v8, (std::allocator<char> *)&v32);
  if ((v27.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v22 = &v27;
  }
  else {
    v22 = (std::string *)v27.__r_.__value_.__r.__words[0];
  }
  int v23 = strtoul((const char *)v22, 0, 10);
  if (SHIBYTE(v27.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v27.__r_.__value_.__l.__data_);
  }
  int v24 = v21 + 32 * v23;
  std::string::basic_string(&v27, (const std::string *)a2, v9 + 1, 0xFFFFFFFFFFFFFFFFLL, (std::allocator<char> *)&v32);
  if ((v27.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v25 = &v27;
  }
  else {
    v25 = (std::string *)v27.__r_.__value_.__r.__words[0];
  }
  int v26 = strtoul((const char *)v25, 0, 10);
  if (SHIBYTE(v27.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v27.__r_.__value_.__l.__data_);
  }
  return (v24 + v26) ^ 0x80000000;
}

void sub_100003F38(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  if (a22 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *sub_100003F54(unsigned char *__dst, void *__src, unint64_t a3)
{
  v5 = __dst;
  if (a3 > 0x16)
  {
    if (a3 >= 0x7FFFFFFFFFFFFFF8) {
      sub_100004380();
    }
    uint64_t v6 = (a3 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a3 | 7) != 0x17) {
      uint64_t v6 = a3 | 7;
    }
    uint64_t v7 = v6 + 1;
    std::string::size_type v8 = operator new(v6 + 1);
    v5[1] = a3;
    v5[2] = v7 | 0x8000000000000000;
    void *v5 = v8;
    v5 = v8;
  }
  else
  {
    __dst[23] = a3;
  }
  return memmove(v5, __src, a3 + 1);
}

BOOL sub_100003FF0(const char *a1)
{
  int v6 = -1;
  int v7 = -1;
  int v5 = -1;
  if (a1[23] < 0) {
    a1 = *(const char **)a1;
  }
  return sscanf(a1, "%d.%d.%d", &v7, &v6, &v5) == 3 && v7 >= 0 && v6 >= 0 && v5 >= 0;
}

void *sub_100004064(void *a1, uint64_t a2, uint64_t a3)
{
  std::ostream::sentry::sentry();
  if (v23)
  {
    int v6 = (char *)a1 + *(void *)(*a1 - 24);
    uint64_t v7 = *((void *)v6 + 5);
    int v8 = *((_DWORD *)v6 + 2);
    int v9 = *((_DWORD *)v6 + 36);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
      v10 = std::locale::use_facet(&__b, &std::ctype<char>::id);
      int v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
      std::locale::~locale(&__b);
      *((_DWORD *)v6 + 36) = v9;
    }
    uint64_t v11 = a2 + a3;
    if ((v8 & 0xB0) == 0x20) {
      uint64_t v12 = a2 + a3;
    }
    else {
      uint64_t v12 = a2;
    }
    if (!v7) {
      goto LABEL_29;
    }
    uint64_t v13 = *((void *)v6 + 3);
    BOOL v14 = v13 <= a3;
    uint64_t v15 = v13 - a3;
    size_t v16 = v14 ? 0 : v15;
    if (v12 - a2 >= 1
      && (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v7 + 96))(v7, a2, v12 - a2) != v12 - a2)
    {
      goto LABEL_29;
    }
    if ((uint64_t)v16 >= 1)
    {
      if (v16 >= 0x7FFFFFFFFFFFFFF8) {
        sub_100004380();
      }
      if (v16 >= 0x17)
      {
        uint64_t v18 = (v16 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v16 | 7) != 0x17) {
          uint64_t v18 = v16 | 7;
        }
        uint64_t v19 = v18 + 1;
        p_b = (std::locale::__imp *)operator new(v18 + 1);
        size_t v25 = v16;
        int64_t v26 = v19 | 0x8000000000000000;
        __b.__locale_ = p_b;
      }
      else
      {
        HIBYTE(v26) = v16;
        p_b = (std::locale::__imp *)&__b;
      }
      memset(p_b, v9, v16);
      *((unsigned char *)p_b + v16) = 0;
      int v20 = v26 >= 0 ? &__b : (std::locale *)__b.__locale_;
      uint64_t v21 = (*(uint64_t (**)(uint64_t, std::locale *, size_t))(*(void *)v7 + 96))(v7, v20, v16);
      if (SHIBYTE(v26) < 0) {
        operator delete(__b.__locale_);
      }
      if (v21 != v16) {
        goto LABEL_29;
      }
    }
    if (v11 - v12 < 1
      || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v7 + 96))(v7, v12, v11 - v12) == v11 - v12)
    {
      *((void *)v6 + 3) = 0;
    }
    else
    {
LABEL_29:
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | 5);
    }
  }
  std::ostream::sentry::~sentry();
  return a1;
}

void sub_100004300(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  std::ostream::sentry::~sentry();
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v17 + *(void *)(*v17 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x1000042D4);
}

void sub_10000436C(_Unwind_Exception *a1)
{
}

void sub_100004380()
{
}

void sub_100004398(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_1000043F4(exception, a1);
}

void sub_1000043E0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_1000043F4(std::logic_error *a1, const char *a2)
{
  result = std::logic_error::logic_error(a1, a2);
  return result;
}

void sub_100004428(void *a1)
{
}

uint64_t sub_10000443C(uint64_t a1)
{
  *(void *)a1 = v3;
  *(void *)(a1 + *(void *)(v3 - 24)) = v2;
  BOOL v4 = (std::ios_base *)(a1 + *(void *)(*(void *)a1 - 24));
  std::ios_base::init(v4, (void *)(a1 + 8));
  v4[1].__vftable = 0;
  v4[1].__fmtflags_ = -1;
  std::streambuf::basic_streambuf();
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_DWORD *)(a1 + 104) = 16;
  return a1;
}

void sub_1000045AC(_Unwind_Exception *a1)
{
}

uint64_t sub_1000045D4(uint64_t a1)
{
  if (*(char *)(a1 + 95) < 0) {
    operator delete(*(void **)(a1 + 72));
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  std::ios::~ios();
  return a1;
}

uint64_t sub_1000046D8(uint64_t result, uint64_t a2)
{
  unint64_t v2 = 0;
  int v3 = *(unsigned __int8 *)(a2 + 36);
  *(_DWORD *)(result + 8) = *(_DWORD *)(a2 + 12);
  unint64_t v4 = *(unsigned int *)(a2 + 40) | ((unint64_t)*(unsigned __int16 *)(a2 + 44) << 32);
  int v5 = *(_DWORD *)(a2 + 32);
  int v6 = (*(_DWORD *)(a2 + 28) >> 27) & 0xF;
  uint64_t v7 = dword_100014C50;
  while (1)
  {
    int v8 = *v7;
    v7 += 2;
    if (v8 == v6) {
      break;
    }
    if (++v2 == 7) {
      goto LABEL_6;
    }
  }
  if (v2 > 2) {
    goto LABEL_17;
  }
LABEL_6:
  uint64_t v9 = 0;
  v10 = dword_100014C50;
  while (1)
  {
    int v11 = *v10;
    v10 += 2;
    if (v11 == v6) {
      break;
    }
    if (++v9 == 7) {
      goto LABEL_17;
    }
  }
  if (v9)
  {
    uint64_t v12 = 0;
    uint64_t v13 = dword_100014C50;
    while (1)
    {
      int v14 = *v13;
      v13 += 2;
      if (v14 == v6) {
        break;
      }
      if (++v12 == 7)
      {
        unsigned int v15 = 0;
        goto LABEL_16;
      }
    }
    unsigned int v15 = dword_100014C50[2 * v12 + 1];
LABEL_16:
    v4 *= 0x3E80 / v15;
  }
LABEL_17:
  uint64_t v16 = 0;
  int v17 = dword_100014C50;
  while (1)
  {
    int v18 = *v17;
    v17 += 2;
    if (v18 == v6) {
      break;
    }
    if (++v16 == 7)
    {
      int v19 = 0;
      goto LABEL_22;
    }
  }
  int v19 = dword_100014C50[2 * v16 + 1];
LABEL_22:
  uint64_t v20 = 0;
  *(_DWORD *)(result + 20) = 0;
  *(void *)(result + 12) = 0;
  *(void *)result = 0xFACADE990BE5E519;
  uint64_t v21 = &dword_100014C8C;
  while (1)
  {
    int v22 = *v21;
    v21 += 2;
    if (v22 == v19) {
      break;
    }
    if (++v20 == 4)
    {
      int v23 = 252706816;
      goto LABEL_27;
    }
  }
  int v23 = ((dword_100014C88[2 * v20] & 0xF) << 16) | 0xF100000;
LABEL_27:
  *(_DWORD *)(result + 24) = v23;
  *(_DWORD *)(result + 12) = *(_DWORD *)(a2 + 32);
  *(_DWORD *)(result + 16) = *(unsigned __int8 *)(a2 + 36);
  *(_DWORD *)(result + 20) = v4;
  *(_DWORD *)(result + 24) = v23 & 0xFFF0000 | WORD2(v4);
  *(_DWORD *)(result + 24) = v23 & 0xFF0000 | WORD2(v4) | ((*(_DWORD *)(a2 + 44) >> 19) << 24);
  *(_DWORD *)(result + 12) = v5;
  *(_DWORD *)(result + 16) = v3;
  return result;
}

float sub_100004864(int a1, unsigned int a2)
{
  uint64_t v2 = 0;
  int v3 = dword_100014C88;
  while (1)
  {
    int v4 = *v3;
    v3 += 2;
    if (v4 == (HIWORD(a2) & 0xF)) {
      break;
    }
    if (++v2 == 4)
    {
      float v5 = 0.0;
      return (float)(a1 | ((unint64_t)(unsigned __int16)a2 << 32)) / v5;
    }
  }
  float v5 = (float)dword_100014C88[2 * v2 + 1];
  return (float)(a1 | ((unint64_t)(unsigned __int16)a2 << 32)) / v5;
}

uint64_t sub_1000048BC(uint64_t result, uint64_t a2)
{
  uint64_t v2 = 0;
  unsigned int v3 = *(_DWORD *)(result + 24);
  int v4 = dword_100014C88;
  while (1)
  {
    int v5 = *v4;
    v4 += 2;
    if (v5 == (HIWORD(v3) & 0xF)) {
      break;
    }
    if (++v2 == 4)
    {
      uint64_t v6 = 0;
      goto LABEL_6;
    }
  }
  uint64_t v6 = dword_100014C88[2 * v2 + 1];
LABEL_6:
  uint64_t v7 = (unsigned __int128)(v6 * (a2 + 45) * (__int128)(uint64_t)0xDF3B645A1CAC0831) >> 64;
  unint64_t v8 = (*(unsigned int *)(result + 20) | ((unint64_t)(unsigned __int16)*(_DWORD *)(result + 24) << 32))
     + (v7 >> 4)
     + ((unint64_t)v7 >> 63);
  *(_DWORD *)(result + 20) += (v7 >> 4) + ((unint64_t)v7 >> 63);
  *(_DWORD *)(result + 24) = v3 & 0xFFFF0000 | WORD2(v8);
  return result;
}

void sub_100004940(uint64_t a1, unint64_t a2)
{
  int v4 = *(void **)a1;
  unsigned int v3 = *(void **)(a1 + 8);
  unint64_t v5 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v3 - *(void *)a1) >> 3);
  unint64_t v6 = a2 - v5;
  if (a2 > v5)
  {
    uint64_t v7 = *(void *)(a1 + 16);
    if (0xAAAAAAAAAAAAAAABLL * ((v7 - (uint64_t)v3) >> 3) >= v6)
    {
      bzero(*(void **)(a1 + 8), 24 * ((24 * v6 - 24) / 0x18) + 24);
      *(void *)(a1 + 8) = &v3[3 * ((24 * v6 - 24) / 0x18) + 3];
      return;
    }
    if (a2 > 0xAAAAAAAAAAAAAAALL) {
      sub_100004C0C();
    }
    unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((v7 - (uint64_t)v4) >> 3);
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
    if (v10 > 0xAAAAAAAAAAAAAAALL) {
      sub_100004C24();
    }
    uint64_t v11 = 3 * v10;
    uint64_t v12 = (char *)operator new(24 * v10);
    uint64_t v13 = &v12[24 * v5];
    int v14 = &v12[8 * v11];
    size_t v15 = 24 * ((24 * v6 - 24) / 0x18) + 24;
    bzero(v13, v15);
    uint64_t v16 = &v13[v15];
    if (v3 == v4)
    {
      *(void *)a1 = v13;
      *(void *)(a1 + 8) = v16;
      *(void *)(a1 + 16) = v14;
      if (!v3) {
        return;
      }
    }
    else
    {
      do
      {
        int v17 = v13;
        *((void *)v13 - 1) = 0;
        long long v18 = *(_OWORD *)(v3 - 3);
        v3 -= 3;
        *(_OWORD *)(v13 - 24) = v18;
        v13 -= 24;
        *((void *)v17 - 1) = v3[2];
        void *v3 = 0;
        v3[1] = 0;
        v3[2] = 0;
      }
      while (v3 != v4);
      int v19 = *(void **)a1;
      unsigned int v3 = *(void **)(a1 + 8);
      *(void *)a1 = v13;
      *(void *)(a1 + 8) = v16;
      *(void *)(a1 + 16) = v14;
      if (v3 != v19)
      {
        uint64_t v20 = v3;
        do
        {
          int v22 = (void *)*(v20 - 3);
          v20 -= 3;
          uint64_t v21 = v22;
          if (v22)
          {
            *(v3 - 2) = v21;
            operator delete(v21);
          }
          unsigned int v3 = v20;
        }
        while (v20 != v19);
        unsigned int v3 = v19;
      }
      if (!v3) {
        return;
      }
    }
    operator delete(v3);
    return;
  }
  if (a2 < v5)
  {
    int v23 = &v4[3 * a2];
    if (v3 != v23)
    {
      int v24 = *(void **)(a1 + 8);
      do
      {
        int64_t v26 = (void *)*(v24 - 3);
        v24 -= 3;
        size_t v25 = v26;
        if (v26)
        {
          *(v3 - 2) = v25;
          operator delete(v25);
        }
        unsigned int v3 = v24;
      }
      while (v24 != v23);
    }
    *(void *)(a1 + 8) = v23;
  }
}

void *sub_100004B5C(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    sub_100004380();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    unint64_t v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    unint64_t v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

void sub_100004C0C()
{
}

void sub_100004C24()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

void sub_100004C5C(uint64_t a1)
{
  sub_100004C94(a1);
  operator delete();
}

uint64_t sub_100004C94(uint64_t a1)
{
  *(void *)a1 = off_100038380;
  vDSP_destroy_fftsetup(*(FFTSetup *)(a1 + 8));
  if (*(void *)(a1 + 16)) {
    operator delete[]();
  }
  if (*(void *)(a1 + 24)) {
    operator delete[]();
  }
  return a1;
}

void sub_100004D1C(uint64_t a1, DSPComplex *__C, float *a3, uint64_t a4)
{
  uint64_t v7 = (const DSPSplitComplex *)(a1 + 16);
  vDSP_ctoz(__C, 2, (const DSPSplitComplex *)(a1 + 16), 1, 0x400uLL);
  vDSP_fft_zrip(*(FFTSetup *)(a1 + 8), v7, 1, 0xBuLL, 1);
  uint64_t v8 = 0;
  uint64_t v10 = *(void *)(a1 + 16);
  uint64_t v9 = *(_DWORD **)(a1 + 24);
  *(_DWORD *)(v10 + 4096) = *v9;
  v9[1024] = 0;
  *uint64_t v9 = 0;
  uint64_t v11 = (_DWORD *)(a4 + 4);
  do
  {
    int v12 = v9[v8];
    *(v11 - 1) = *(_DWORD *)(v10 + 4 * v8);
    _DWORD *v11 = v12;
    ++v8;
    v11 += 2;
  }
  while (v8 != 1025);
  sub_100004DD0((const DSPSplitComplex *)a1, a3);
}

void sub_100004DD0(const DSPSplitComplex *a1, float *__C)
{
  vDSP_zvmags(a1 + 1, 1, __C, 1, 0x401uLL);
  float __B = 0.0000019073;
  vDSP_vsmul(__C, 1, &__B, __C, 1, 0x401uLL);
}

void sub_100004E34(uint64_t a1, DSPComplex *__C, float *a3)
{
  size_t v5 = (const DSPSplitComplex *)(a1 + 16);
  vDSP_ctoz(__C, 2, (const DSPSplitComplex *)(a1 + 16), 1, 0x400uLL);
  vDSP_fft_zrip(*(FFTSetup *)(a1 + 8), v5, 1, 0xBuLL, 1);
  unint64_t v6 = *(_DWORD **)(a1 + 24);
  *(_DWORD *)(*(void *)(a1 + 16) + 4096) = *v6;
  v6[1024] = 0;
  *unint64_t v6 = 0;
  sub_100004DD0((const DSPSplitComplex *)a1, a3);
}

void sub_10000543C(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  if (*(char *)(v28 - 65) < 0) {
    operator delete(*(void **)(v28 - 88));
  }
  sub_100009ED0((uint64_t)&a9);
  if (a2 == 4)
  {
    uint64_t v31 = __cxa_begin_catch(a1);
    if (v26)
    {
      char v32 = [v27 ConvertSigxException:v31];
LABEL_14:
      *int64_t v26 = v32;
    }
  }
  else if (a2 == 3)
  {
    v33 = __cxa_begin_catch(a1);
    if (v26)
    {
      char v32 = [v27 ConvertSigException:v33];
      goto LABEL_14;
    }
  }
  else
  {
    v34 = __cxa_begin_catch(a1);
    if (a2 == 2)
    {
      if (v26)
      {
        char v32 = [v27 ConvertGenericException:v34];
        goto LABEL_14;
      }
    }
    else if (v26)
    {
      char v32 = [v27 FillUnknownError];
      goto LABEL_14;
    }
  }
  __cxa_end_catch();
  JUMPOUT(0x1000051FCLL);
}

void sub_100005574(_Unwind_Exception *a1)
{
}

void sub_100006698(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, void **a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,uint64_t a27,uint64_t a28,void *a29,uint64_t a30,int a31,__int16 a32,char a33,char a34,uint64_t a35,void *__p,uint64_t a37,int a38,__int16 a39,char a40,char a41)
{
  if (a41 < 0) {
    operator delete(__p);
  }
  if (*(char *)(v44 - 97) < 0) {
    operator delete(*(void **)(v44 - 120));
  }
  if (a26 < 0) {
    operator delete(a21);
  }
  uint64_t v45 = v42[50];
  v42[50] = 0;
  if (v45) {
    (*(void (**)(uint64_t))(*(void *)v45 + 24))(v45);
  }
  if (v42[46]) {
    operator delete[]();
  }
  if (v42[44]) {
    operator delete[]();
  }
  if (v42[42]) {
    operator delete[]();
  }
  if (v42[34]) {
    operator delete[]();
  }
  if (v42[32]) {
    operator delete[]();
  }
  v46 = (void *)v42[27];
  if (v46)
  {
    v42[28] = v46;
    operator delete(v46);
  }
  sub_10000BE24(a10);
  v47 = *a11;
  if (*a11)
  {
    v42[17] = v47;
    operator delete(v47);
  }
  v48 = *v41;
  if (*v41)
  {
    v42[14] = v48;
    operator delete(v48);
  }
  sub_100009DE0(v43);
  a21 = v42 + 6;
  sub_100009E7C((void ***)&a21);
  operator delete();
}

void sub_100006D00(_Unwind_Exception *a1)
{
  __cxa_end_catch();

  _Unwind_Resume(a1);
}

void sub_100006DD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100006EC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100006FCC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000070D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000715C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_100007178(uint64_t result)
{
  if (*(void *)(result + 24))
  {
    sub_100007178();
    operator delete();
  }
  if (*(unsigned char *)(result + 8))
  {
    if (*(void *)(result + 16)) {
      operator delete[]();
    }
  }
  return result;
}

uint64_t sub_1000071E0(unsigned int *a1, uint64_t a2)
{
  uint64_t v10 = a2;
  if (a1)
  {
    unsigned int v2 = *a1;
    unsigned int v3 = &v10;
    do
    {
LABEL_3:
      size_t v4 = v3;
      size_t v5 = (unsigned int *)*v3;
      if (!*v3) {
        break;
      }
      unsigned int v3 = (uint64_t *)(v5 + 6);
    }
    while (*v5 <= v2);
    unint64_t v6 = a1;
    while (1)
    {
      uint64_t v7 = v6;
      unint64_t v6 = (unsigned int *)*((void *)v6 + 3);
      if (!v6) {
        break;
      }
      unsigned int v8 = *v6;
      if (*v6 != v2)
      {
        *((void *)v7 + 3) = v5;
        unsigned int v3 = (uint64_t *)(v7 + 6);
        void *v4 = a1;
        unsigned int v2 = v8;
        a1 = v6;
        goto LABEL_3;
      }
    }
    *((void *)v7 + 3) = v5;
    void *v4 = a1;
    return v10;
  }
  return a2;
}

void sub_100007258()
{
}

uint64_t sub_10000730C(uint64_t a1, unsigned int a2)
{
  if (a1)
  {
    uint64_t v2 = a1;
    do
    {
      if (!((*(_DWORD *)v2 ^ a2) >> 16)) {
        operator new();
      }
      uint64_t v2 = *(void *)(v2 + 24);
    }
    while (v2);
  }
  return 0;
}

void sub_1000073A0(_DWORD *a1, uint64_t a2)
{
  if (*a1 == 0x40000000)
  {
    uint64_t v2 = a1[1];
    if (a2 == v2 || (a2 & 7) == 0 && (unint64_t)(a2 - v2) < 8) {
      operator new();
    }
    exception = __cxa_allocate_exception(0x20uLL);
    *(void *)&v4.__val_ = 112;
    v4.__cat_ = (const std::error_category *)&off_10003CB28;
    sub_10000E93C((uint64_t)exception, &v4);
  }
  else
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *(void *)&v4.__val_ = 111;
    v4.__cat_ = (const std::error_category *)&off_10003CB28;
    sub_10000E93C((uint64_t)exception, &v4);
  }
}

void sub_1000075A0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1000075C0(int *a1, uint64_t a2)
{
  unsigned int v3 = a1;
  if (a2)
  {
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
    *(void *)(a2 + 16) = 0;
    *(_DWORD *)(a2 + 4) = 0x40000000;
  }
  if (!a1)
  {
    uint64_t v5 = 24;
    if (!a2) {
      return v5;
    }
    goto LABEL_21;
  }
  int v4 = 0;
  uint64_t v5 = 24;
  uint64_t v6 = a2;
  do
  {
    int v7 = *v3;
    int v8 = v3[1];
    int v9 = (unsigned __int16)*v3;
    if (*v3 != v4 && v9 != 0)
    {
      if (a2)
      {
        uint64_t v6 = a2 + v5;
        *(void *)uint64_t v6 = 0;
        *(void *)(v6 + 8) = 0;
        *(void *)(v6 + 16) = 0;
        *(_DWORD *)(v6 + 4) = v7;
        int v7 = *v3;
        int v9 = (unsigned __int16)*v3;
      }
      uint64_t v5 = (v5 + 24);
      int v4 = v7;
    }
    if (v9)
    {
      int v11 = v8 + 3;
      int v12 = v11 & 0xFFFFFFFC;
      if (a2)
      {
        if (v7 == 1610874935) {
          int v12 = sub_10000EA54(v3[1], *((void *)v3 + 2), a2 + v5);
        }
        else {
          memcpy((void *)(a2 + v5), *((const void **)v3 + 2), v11 & 0xFFFFFFFC);
        }
        *(_DWORD *)(v6 + 8) = v12;
      }
      uint64_t v5 = (v12 + v5);
    }
    unsigned int v3 = (int *)*((void *)v3 + 3);
  }
  while (v3);
  if (a2) {
LABEL_21:
  }
    *(_DWORD *)(a2 + 8) = v5;
  return v5;
}

uint64_t sub_1000076C8(int *a1, _DWORD *a2)
{
  unsigned int v3 = a1;
  if (a2) {
    *(void *)a2 = 0x40000000;
  }
  if (a1)
  {
    int v4 = 0;
    uint64_t v5 = 8;
    uint64_t v6 = a2;
    while (1)
    {
      int v8 = *v3;
      unsigned int v7 = v3[1];
      if (*v3 != v4 && (unsigned __int16)*v3 != 0) {
        break;
      }
      if ((unsigned __int16)*v3) {
        goto LABEL_15;
      }
LABEL_21:
      unsigned int v3 = (int *)*((void *)v3 + 3);
      if (!v3)
      {
        if (a2) {
          goto LABEL_23;
        }
        return v5;
      }
    }
    if (a2)
    {
      uint64_t v6 = (_DWORD *)((char *)a2 + v5);
      *uint64_t v6 = v8;
      v6[1] = 0;
    }
    LODWORD(v5) = v5 + 8;
    int v4 = v8;
LABEL_15:
    int v10 = (v7 + 3) & 0xFFFFFFFC;
    if (a2)
    {
      if (v8 == 1610874935) {
        int v10 = sub_10000EA54(v7, *((void *)v3 + 2), (uint64_t)a2 + v5);
      }
      else {
        memcpy((char *)a2 + v5, *((const void **)v3 + 2), (v7 + 3) & 0xFFFFFFFC);
      }
      v6[1] = v10;
    }
    uint64_t v5 = (v10 + v5);
    goto LABEL_21;
  }
  uint64_t v5 = 8;
  if (a2) {
LABEL_23:
  }
    a2[1] = v5;
  return v5;
}

void *sub_1000077BC@<X0>(int a1@<W1>, void *a2@<X8>)
{
  switch(a1)
  {
    case 500:
      uint64_t v2 = "Unknown Error";
      break;
    case 501:
      uint64_t v2 = "Can't checkpoint a fatsig stream that has already been checkpointed. Must call rewind() before.";
      break;
    case 502:
      uint64_t v2 = "Can't rewind() a fatsig stream that hasn't been checkpointed. Must call checkpoint() before.";
      break;
    case 503:
      uint64_t v2 = "Can't checkpoint a fft stream that has already been checkpointed. Must call rewind() before.";
      break;
    case 504:
      uint64_t v2 = "Can't rewind() a fft stream that hasn't been checkpointed. Must call checkpoint() before.";
      break;
    case 505:
      uint64_t v2 = "Unkonwn pipeline error - could not construct pipeline";
      break;
    case 506:
      uint64_t v2 = "Unallocated buffer for vizualize received";
      break;
    case 507:
      uint64_t v2 = "Invalid last_n value";
      break;
    case 508:
      uint64_t v2 = "Error checkpointing the ring buffer";
      break;
    case 509:
      uint64_t v2 = "Error rewinding the ring buffer";
      break;
    case 510:
      uint64_t v2 = "Error writing to the ring buffer";
      break;
    case 511:
      uint64_t v2 = "Error getting frame from ring buffer";
      break;
    case 512:
      uint64_t v2 = "Error - Aligned Buffer is not actually aligned";
      break;
    case 513:
      uint64_t v2 = "Error - count flowed into fft stream not equal to SHZ_SIGX_FFT_STEPSIZE";
      break;
    case 514:
      uint64_t v2 = "Error - sample count after resample less than SHZ_SIGX_FFT_STEPSIZE";
      break;
    case 515:
      uint64_t v2 = "Error - internal sample rate is not 16k";
      break;
    case 516:
      uint64_t v2 = "Error - resampling given too many samples";
      break;
    case 517:
      uint64_t v2 = "Error - resample function not set correctly";
      break;
    default:
      if (a1) {
        uint64_t v2 = "unknown";
      }
      else {
        uint64_t v2 = "Success";
      }
      break;
  }
  return sub_100004B5C(a2, v2);
}

const char *sub_100007928()
{
  return "sigx";
}

void sub_100007934(std::error_category *a1)
{
  std::error_category::~error_category(a1);
  operator delete();
}

void sub_100007970(std::runtime_error *a1)
{
  std::runtime_error::~runtime_error(a1);
  operator delete();
}

uint64_t sub_1000079AC(uint64_t a1, std::error_code *this)
{
  std::error_code::message(&v5, this);
  std::runtime_error::runtime_error((std::runtime_error *)a1, &v5);
  if (SHIBYTE(v5.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v5.__r_.__value_.__l.__data_);
  }
  *(void *)a1 = &off_100038420;
  *(std::error_code *)(a1 + 16) = *this;
  return a1;
}

void sub_100007A28(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_100007A44(uint64_t a1, int *a2, unint64_t a3)
{
  uint64_t v42 = a1 + 40;
  *(void *)(a1 + 72) = 0;
  *(unsigned char *)(a1 + 80) = 0;
  *(_DWORD *)(a1 + 84) = 0;
  *(unsigned char *)(a1 + 88) = 0;
  *(void *)a1 = 0;
  *(_OWORD *)(a1 + 12) = 0u;
  unsigned int v3 = (_OWORD *)(a1 + 12);
  *(_OWORD *)(a1 + 28) = 0u;
  *(_OWORD *)(a1 + 44) = 0u;
  *(void *)(a1 + 57) = 0;
  if (a3)
  {
    if (a3 <= 0x2B)
    {
      exception = __cxa_allocate_exception(0x20uLL);
      *(void *)&v44.__val_ = 105;
      v44.__cat_ = (const std::error_category *)&off_10003CB28;
      sub_10000E93C((uint64_t)exception, &v44);
    }
    else
    {
      int v6 = *a2;
      if (*a2 == 199615769)
      {
        sub_100004940(v42, 1uLL);
        long long v8 = *(_OWORD *)(a2 + 3);
        _OWORD *v3 = *(_OWORD *)a2;
        *(_OWORD *)((char *)v3 + 12) = v8;
        if (*(_DWORD *)v3 == 199615769)
        {
          int v9 = crc32(dword_10003CB30, (const Bytef *)a2 + 8, (int)a3 - 8);
          int v10 = *(_DWORD *)(a1 + 16);
          if (v10 == v9 || v10 == -87368039)
          {
            sub_10000443C((uint64_t)&v44);
            unsigned int v11 = a3 - 28;
            if ((a3 - 28) < 0x10)
            {
              v38 = __cxa_allocate_exception(0x20uLL);
              *(void *)&v43.__val_ = 131;
              v43.__cat_ = (const std::error_category *)&off_10003CB28;
              sub_10000E93C((uint64_t)v38, &v43);
            }
            uint64_t v12 = 0;
            v41 = a2 + 7;
            do
            {
              LOBYTE(v48.__val_) = *((unsigned char *)v41 + v12);
              sub_100004064(&v44, (uint64_t)&v48, 1);
              ++v12;
            }
            while (v12 != 16);
            if (v11 < 0x11)
            {
              unsigned int v14 = 16;
LABEL_49:
              if (v14 == v11) {
                operator new[]();
              }
            }
            else
            {
              int v13 = 0;
              unsigned int v14 = 16;
              int v15 = 16;
              while (1)
              {
                uint64_t v16 = (unsigned __int8 *)v41 + v14;
                int v17 = *v16;
                int v39 = v15;
                if (v17 == 255)
                {
                  int v17 = v16[1] | (unsigned __int16)(v16[2] << 8) | (v16[3] << 16) | (v16[4] << 24);
                  int v18 = 5;
                }
                else
                {
                  int v18 = 1;
                }
                v13 += v17;
                LOBYTE(v48.__val_) = v13;
                sub_100004064(&v44, (uint64_t)&v48, 1);
                LOBYTE(v48.__val_) = BYTE1(v13);
                sub_100004064(&v44, (uint64_t)&v48, 1);
                LOBYTE(v48.__val_) = BYTE2(v13);
                sub_100004064(&v44, (uint64_t)&v48, 1);
                LOBYTE(v48.__val_) = HIBYTE(v13);
                sub_100004064(&v44, (uint64_t)&v48, 1);
                unsigned int v19 = v18 + v14;
                LOBYTE(v48.__val_) = *((unsigned char *)v41 + v19);
                sub_100004064(&v44, (uint64_t)&v48, 1);
                LOBYTE(v48.__val_) = *((unsigned char *)v41 + v19 + 1);
                sub_100004064(&v44, (uint64_t)&v48, 1);
                LOBYTE(v48.__val_) = *((unsigned char *)v41 + v19 + 2);
                sub_100004064(&v44, (uint64_t)&v48, 1);
                LOBYTE(v48.__val_) = *((unsigned char *)v41 + v19 + 3);
                sub_100004064(&v44, (uint64_t)&v48, 1);
                unsigned int v20 = v19 + 4;
                if (v19 + 4 > v11) {
                  break;
                }
                unint64_t v21 = 0;
                unint64_t v22 = 0;
                unsigned int v23 = 0;
                unint64_t v47 = 0;
                do
                {
                  int v24 = sub_10000E9D4(v21, v22, &v47, (unint64_t *)&v48);
                  float v25 = 0.0;
                  if (v24)
                  {
                    int64_t v26 = (_WORD *)((char *)v41 + v20 + v23);
                    LOWORD(v25) = *v26;
                    HIWORD(v27) = -14464;
                    float v25 = (float)((float)((float)LODWORD(v25) * 0.000015259) * 131070.0) + -65536.0;
                    LOWORD(v27) = v26[1];
                    float v28 = (float)((float)((float)v27 * 0.000015259) * 6.2832) + -3.1416;
                    v23 += 4;
                  }
                  else
                  {
                    float v28 = 0.0;
                  }
                  flt_10003CB34[5 * v21 + v22] = v25;
                  flt_10003CB98[5 * v21 + v22] = v28;
                  BOOL v29 = v22 == 4;
                  if (v22 == 4) {
                    unint64_t v22 = 0;
                  }
                  else {
                    ++v22;
                  }
                  if (v29) {
                    ++v21;
                  }
                }
                while (v21 < 5);
                std::ostream::write();
                std::ostream::write();
                unsigned int v14 = v23 + v20;
                int v15 = v39 + 208;
                if (v14 >= v11) {
                  goto LABEL_49;
                }
              }
            }
            v35 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
            std::runtime_error::runtime_error(v35, "Sumo decoding read more bytes than expected! Can't unpack this sig.");
          }
          sub_100004064(&std::cerr, (uint64_t)"WRONG CRC!!\n", 12);
          *(void *)a1 = 0;
          exception = __cxa_allocate_exception(0x20uLL);
          *(void *)&v44.__val_ = 107;
          v44.__cat_ = (const std::error_category *)&off_10003CB28;
          sub_10000E93C((uint64_t)exception, &v44);
        }
        else
        {
          exception = __cxa_allocate_exception(0x20uLL);
          *(void *)&v44.__val_ = 103;
          v44.__cat_ = (const std::error_category *)&off_10003CB28;
          sub_10000E93C((uint64_t)exception, &v44);
        }
      }
      else
      {
        if (v6 != -889313920)
        {
          if (a3 >= 0xB0)
          {
            uint64_t v30 = a2[5];
            BOOL v31 = a3 - 32 == v30 || a3 - 32 - ((a3 / 0x8001) & 0x1FFFFFFFFFFE0) == v30;
            BOOL v32 = v31 && a3 - 32 >= v6;
            BOOL v33 = !v32 || v6 == 0;
            if (!v33 && v30 == (a2[6] ^ 0x789ABC13)) {
              operator new[]();
            }
          }
          *(void *)a1 = 0;
          v34 = __cxa_allocate_exception(0x20uLL);
          *(void *)&v43.__val_ = 108;
          v43.__cat_ = (const std::error_category *)&off_10003CB28;
          sub_10000E93C((uint64_t)v34, &v43);
        }
        sub_100004940(v42, 1uLL);
        long long v7 = *((_OWORD *)a2 + 1);
        std::error_code v44 = *(std::error_code *)a2;
        long long v45 = v7;
        long long v46 = *((_OWORD *)a2 + 2);
        if (a3 - 48 != LODWORD(v44.__cat_))
        {
LABEL_55:
          *(void *)a1 = 0;
          v37 = __cxa_allocate_exception(0x20uLL);
          *(void *)&v43.__val_ = 106;
          v43.__cat_ = (const std::error_category *)&off_10003CB28;
          sub_10000E93C((uint64_t)v37, &v43);
        }
        if (v44.__val_ == -889313920)
        {
          if (*(&v44.__val_ + 1) == crc32(dword_10003CB30, (const Bytef *)a2 + 8, (int)a3 - 8)|| *(&v44.__val_ + 1) == -87368039)
          {
            operator new[]();
          }
          goto LABEL_55;
        }
        exception = __cxa_allocate_exception(0x20uLL);
        *(void *)&v48.__val_ = 103;
        v48.__cat_ = (const std::error_category *)&off_10003CB28;
        sub_10000E93C((uint64_t)exception, &v48);
      }
    }
  }
  else
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *(void *)&v44.__val_ = 101;
    v44.__cat_ = (const std::error_category *)&off_10003CB28;
    sub_10000E93C((uint64_t)exception, &v44);
  }
}

void sub_100009AF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t *a11, uint64_t a12, uint64_t *a13, const std::error_code a14, uint64_t *a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19)
{
  unint64_t v22 = v19;
  unsigned int v23 = a1;
  __cxa_free_exception(v22);
  if (a2 == 2)
  {
    int v24 = (const std::error_code *)__cxa_begin_catch(v23);
    a15 = 0;
    a16 = 0;
    a17 = 0;
    sub_100009DE0(a11);
    sub_100009E24(a13);
    exception = __cxa_allocate_exception(0x20uLL);
    sub_10000E720((uint64_t)exception, v24 + 1, (const void **)&a15);
  }
  if (a2 == 1)
  {
    int64_t v26 = __cxa_begin_catch(v23);
    unsigned int v27 = (char *)(*(uint64_t (**)(void *))(*(void *)v26 + 16))(v26);
    sub_100004B5C(&a15, v27);
    sub_100009DE0(a11);
    sub_100009E24(a13);
    float v28 = __cxa_allocate_exception(0x20uLL);
    *(void *)&a14.__val_ = 100;
    a14.__cat_ = (const std::error_category *)&off_10003CB28;
    sub_10000E720((uint64_t)v28, &a14, (const void **)&a15);
  }
  a15 = a13;
  sub_100009E7C((void ***)&a15);
  _Unwind_Resume(v23);
}

void sub_100009D78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  __cxa_end_catch();
  __p = a13;
  sub_100009E7C((void ***)&__p);
  _Unwind_Resume(a1);
}

void sub_100009DAC()
{
}

uint64_t sub_100009DE0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result)
  {
    sub_100007178(result);
    operator delete();
  }
  *a1 = 0;
  return result;
}

void sub_100009E24(uint64_t *a1)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  if (v2 != *a1)
  {
    uint64_t v4 = a1[1];
    do
    {
      int v6 = *(void **)(v4 - 24);
      v4 -= 24;
      std::string v5 = v6;
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

void sub_100009E7C(void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    sub_100009E24((uint64_t *)v2);
    uint64_t v3 = **a1;
    operator delete(v3);
  }
}

uint64_t sub_100009ED0(uint64_t a1)
{
  sub_100009DE0((uint64_t *)a1);
  uint64_t v3 = (void **)(a1 + 40);
  sub_100009E7C(&v3);
  return a1;
}

uint64_t *sub_100009F10(uint64_t *result)
{
  uint64_t v1 = *result;
  uint64_t v2 = (unsigned __int16 *)result[1];
  if ((unint64_t)v2 - *result >= 9)
  {
    uint64_t v3 = result;
    unint64_t v4 = 1;
    do
    {
      std::string v5 = (unsigned __int16 *)(v1 + 8 * v4);
      unint64_t v6 = v4 - 1;
      unsigned int v7 = *(_DWORD *)(v1 + 8 * (v4 - 1));
      if (v7 == *(_DWORD *)v5
        && (uint64_t v8 = v1 + 8 * v6, *(unsigned __int16 *)(v8 + 4) == v5[2])
        && *(unsigned __int16 *)(v8 + 6) == *(unsigned __int16 *)(v1 + 8 * v4 + 6))
      {
        int v9 = v5 - 4;
        int64_t v10 = (char *)v2 - (char *)v5;
        if (v2 != v5)
        {
          uint64_t result = (uint64_t *)memmove(v5 - 4, v5, (char *)v2 - (char *)v5);
          uint64_t v1 = *v3;
        }
        uint64_t v2 = (unsigned __int16 *)((char *)v9 + v10);
        v3[1] = (uint64_t)v9 + v10;
        unint64_t v4 = v6;
      }
      else if (*(_DWORD *)v5 < v7)
      {
        exception = __cxa_allocate_exception(0x20uLL);
        *(void *)&v12.__val_ = 200;
        v12.__cat_ = (const std::error_category *)&off_10003CB28;
        sub_10000E93C((uint64_t)exception, &v12);
      }
      ++v4;
    }
    while (v4 < ((uint64_t)v2 - v1) >> 3);
  }
  return result;
}

void sub_10000A024(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void *sub_10000A038(void *a1, unint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    if (a2 >> 61) {
      sub_100004C0C();
    }
    uint64_t v4 = 8 * a2;
    std::string v5 = (char *)operator new(8 * a2);
    *a1 = v5;
    a1[2] = &v5[8 * a2];
    bzero(v5, 8 * a2);
    a1[1] = &v5[v4];
  }
  return a1;
}

void sub_10000A0B0(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_10000A0CC(uint64_t result, uint64_t *a2, uint64_t (**a3)(uint64_t *, uint64_t *), uint64_t a4, char a5)
{
  unsigned int v11 = (uint64_t *)result;
  while (2)
  {
    v65 = a2;
    v66 = a2 - 1;
    v63 = a2 - 3;
    v64 = a2 - 2;
    std::error_code v12 = v11;
    while (1)
    {
      while (1)
      {
        while (1)
        {
          unsigned int v11 = v12;
          uint64_t v13 = (char *)a2 - (char *)v12;
          unint64_t v14 = a2 - v12;
          if (v6 || !v5)
          {
            switch(v14)
            {
              case 0uLL:
              case 1uLL:
                return result;
              case 2uLL:
                uint64_t result = (*a3)(v66, v12);
                if (result)
                {
                  uint64_t v28 = *v12;
                  *std::error_code v12 = *v66;
                  uint64_t *v66 = v28;
                }
                break;
              case 3uLL:
                uint64_t result = sub_10000B6D4(v12, v12 + 1, v66, a3);
                break;
              case 4uLL:
                uint64_t result = sub_10000B7B8(v12, v12 + 1, v12 + 2, v66, a3);
                break;
              case 5uLL:
                uint64_t result = sub_10000B86C(v12, v12 + 1, v12 + 2, v12 + 3, v66, a3);
                break;
              default:
                JUMPOUT(0);
            }
            return result;
          }
          if (v13 <= 191)
          {
            BOOL v29 = v12 + 1;
            BOOL v31 = v12 == a2 || v29 == a2;
            if (a5)
            {
              if (!v31)
              {
                uint64_t v32 = 0;
                BOOL v33 = v12;
                do
                {
                  v34 = v33;
                  BOOL v33 = v29;
                  uint64_t result = (*a3)(v29, v34);
                  if (result)
                  {
                    uint64_t v69 = *v33;
                    uint64_t v35 = v32;
                    while (1)
                    {
                      *(uint64_t *)((char *)v12 + v35 + 8) = *(uint64_t *)((char *)v12 + v35);
                      if (!v35) {
                        break;
                      }
                      v35 -= 8;
                      uint64_t result = (*a3)(&v69, (uint64_t *)((char *)v12 + v35));
                      if ((result & 1) == 0)
                      {
                        v36 = (uint64_t *)((char *)v12 + v35 + 8);
                        goto LABEL_79;
                      }
                    }
                    v36 = v12;
LABEL_79:
                    uint64_t *v36 = v69;
                    a2 = v65;
                  }
                  BOOL v29 = v33 + 1;
                  v32 += 8;
                }
                while (v33 + 1 != a2);
              }
            }
            else if (!v31)
            {
              do
              {
                v59 = v11;
                unsigned int v11 = v29;
                uint64_t result = (*a3)(v29, v59);
                if (result)
                {
                  uint64_t v69 = *v11;
                  v60 = v11;
                  do
                  {
                    v61 = v60;
                    uint64_t v62 = *--v60;
                    uint64_t *v61 = v62;
                    uint64_t result = (*a3)(&v69, v61 - 2);
                  }
                  while ((result & 1) != 0);
                  uint64_t *v60 = v69;
                }
                BOOL v29 = v11 + 1;
              }
              while (v11 + 1 != a2);
            }
            return result;
          }
          if (!a4)
          {
            if (v12 != a2)
            {
              int64_t v37 = (v14 - 2) >> 1;
              int64_t v67 = v37;
              do
              {
                int64_t v38 = v37;
                if (v67 >= v37)
                {
                  uint64_t v39 = (2 * v37) | 1;
                  v40 = &v11[v39];
                  if (2 * v37 + 2 < (uint64_t)v14 && (*a3)(&v11[v39], v40 + 1))
                  {
                    ++v40;
                    uint64_t v39 = 2 * v38 + 2;
                  }
                  v41 = &v11[v38];
                  uint64_t result = (*a3)(v40, v41);
                  if ((result & 1) == 0)
                  {
                    uint64_t v69 = *v41;
                    do
                    {
                      uint64_t v42 = v40;
                      uint64_t *v41 = *v40;
                      if (v67 < v39) {
                        break;
                      }
                      uint64_t v43 = (2 * v39) | 1;
                      v40 = &v11[v43];
                      uint64_t v44 = 2 * v39 + 2;
                      if (v44 < (uint64_t)v14 && (*a3)(&v11[v43], v40 + 1))
                      {
                        ++v40;
                        uint64_t v43 = v44;
                      }
                      uint64_t result = (*a3)(v40, &v69);
                      v41 = v42;
                      uint64_t v39 = v43;
                    }
                    while (!result);
                    uint64_t *v42 = v69;
                  }
                }
                int64_t v37 = v38 - 1;
              }
              while (v38);
              uint64_t v45 = (unint64_t)v13 >> 3;
              long long v46 = v65;
              do
              {
                uint64_t v47 = 0;
                uint64_t v68 = *v11;
                std::error_code v48 = v11;
                do
                {
                  v49 = &v48[v47 + 1];
                  uint64_t v50 = (2 * v47) | 1;
                  uint64_t v51 = 2 * v47 + 2;
                  if (v51 < v45)
                  {
                    uint64_t result = (*a3)(&v48[v47 + 1], &v48[v47 + 2]);
                    if (result)
                    {
                      ++v49;
                      uint64_t v50 = v51;
                    }
                  }
                  uint64_t *v48 = *v49;
                  std::error_code v48 = v49;
                  uint64_t v47 = v50;
                }
                while (v50 <= (uint64_t)((unint64_t)(v45 - 2) >> 1));
                v52 = v46 - 1;
                if (v49 == v52)
                {
                  v53 = v52;
                  uint64_t *v49 = v68;
                }
                else
                {
                  uint64_t *v49 = *v52;
                  v53 = v52;
                  uint64_t *v52 = v68;
                  uint64_t v54 = (char *)v49 - (char *)v11 + 8;
                  if (v54 >= 9)
                  {
                    unint64_t v55 = (unint64_t)((v54 >> 3) - 2) >> 1;
                    v56 = &v11[v55];
                    uint64_t result = (*a3)(v56, v49);
                    if (result)
                    {
                      uint64_t v69 = *v49;
                      do
                      {
                        v57 = v56;
                        uint64_t *v49 = *v56;
                        if (!v55) {
                          break;
                        }
                        unint64_t v55 = (v55 - 1) >> 1;
                        v56 = &v11[v55];
                        uint64_t result = (*a3)(v56, &v69);
                        v49 = v57;
                      }
                      while ((result & 1) != 0);
                      uint64_t *v57 = v69;
                    }
                  }
                }
                BOOL v58 = v45-- <= 2;
                long long v46 = v53;
              }
              while (!v58);
            }
            return result;
          }
          int v15 = &v12[v14 >> 1];
          if ((unint64_t)v13 >= 0x401)
          {
            sub_10000B6D4(v12, &v12[v14 >> 1], v66, a3);
            sub_10000B6D4(v12 + 1, v15 - 1, v64, a3);
            sub_10000B6D4(v12 + 2, &v12[(v14 >> 1) + 1], v63, a3);
            sub_10000B6D4(v15 - 1, &v12[v14 >> 1], &v12[(v14 >> 1) + 1], a3);
            uint64_t v16 = *v12;
            *std::error_code v12 = *v15;
            *int v15 = v16;
          }
          else
          {
            sub_10000B6D4(&v12[v14 >> 1], v12, v66, a3);
          }
          --a4;
          a2 = v65;
          if (a5 & 1) != 0 || ((*a3)(v12 - 1, v12)) {
            break;
          }
          uint64_t v69 = *v12;
          uint64_t result = (*a3)(&v69, v66);
          if (result)
          {
            do
              uint64_t result = (*a3)(&v69, ++v12);
            while ((result & 1) == 0);
          }
          else
          {
            int v24 = v12 + 1;
            do
            {
              std::error_code v12 = v24;
              if (v24 >= v65) {
                break;
              }
              uint64_t result = (*a3)(&v69, v24);
              int v24 = v12 + 1;
            }
            while (!result);
          }
          float v25 = v65;
          if (v12 < v65)
          {
            float v25 = v65;
            do
              uint64_t result = (*a3)(&v69, --v25);
            while ((result & 1) != 0);
          }
          while (v12 < v25)
          {
            uint64_t v26 = *v12;
            *std::error_code v12 = *v25;
            uint64_t *v25 = v26;
            do
              ++v12;
            while (!(*a3)(&v69, v12));
            do
              uint64_t result = (*a3)(&v69, --v25);
            while ((result & 1) != 0);
          }
          unsigned int v27 = v12 - 1;
          BOOL v5 = v12 - 1 >= v11;
          BOOL v6 = v12 - 1 == v11;
          if (v12 - 1 != v11) {
            uint64_t *v11 = *v27;
          }
          a5 = 0;
          *unsigned int v27 = v69;
        }
        uint64_t v69 = *v12;
        int v17 = v12;
        do
          int v18 = v17++;
        while (((*a3)(v17, &v69) & 1) != 0);
        unsigned int v19 = v65;
        if (v18 == v12)
        {
          unsigned int v19 = v65;
          do
          {
            if (v17 >= v19) {
              break;
            }
            --v19;
          }
          while (((*a3)(v19, &v69) & 1) == 0);
        }
        else
        {
          do
            --v19;
          while (!(*a3)(v19, &v69));
        }
        if (v17 < v19)
        {
          unsigned int v20 = v17;
          unint64_t v21 = v19;
          do
          {
            uint64_t v22 = *v20;
            *unsigned int v20 = *v21;
            *unint64_t v21 = v22;
            do
              int v18 = v20++;
            while (((*a3)(v20, &v69) & 1) != 0);
            do
              --v21;
            while (!(*a3)(v21, &v69));
          }
          while (v20 < v21);
        }
        if (v18 != v11) {
          uint64_t *v11 = *v18;
        }
        *int v18 = v69;
        if (v17 >= v19) {
          break;
        }
LABEL_31:
        uint64_t result = sub_10000A0CC(v11, v18, a3, a4, a5 & 1);
        a5 = 0;
        std::error_code v12 = v18 + 1;
      }
      BOOL v23 = sub_10000B948(v11, v18, a3);
      std::error_code v12 = v18 + 1;
      uint64_t result = sub_10000B948(v18 + 1, v65, a3);
      if (result) {
        break;
      }
      if (!v23) {
        goto LABEL_31;
      }
    }
    a2 = v18;
    if (!v23) {
      continue;
    }
    return result;
  }
}

unint64_t sub_10000A8D4(unint64_t result, unsigned int *a2, uint64_t a3, char a4)
{
  unint64_t v9 = result;
  while (2)
  {
    int64_t v10 = (uint64_t *)(a2 - 2);
    unint64_t v11 = v9;
    while (1)
    {
      while (1)
      {
        while (1)
        {
          unint64_t v9 = v11;
          uint64_t v12 = (uint64_t)a2 - v11;
          unint64_t v13 = (uint64_t)((uint64_t)a2 - v11) >> 3;
          if (v5 || !v4)
          {
            switch(v13)
            {
              case 0uLL:
              case 1uLL:
                return result;
              case 2uLL:
                unsigned int v58 = *(a2 - 2);
                BOOL v5 = v58 == *(_DWORD *)v11;
                BOOL v59 = v58 < *(_DWORD *)v11;
                if (v5) {
                  BOOL v59 = *((unsigned __int16 *)a2 - 2) < *(unsigned __int16 *)(v11 + 4);
                }
                if (v59)
                {
                  uint64_t v60 = *(void *)v11;
                  *(void *)unint64_t v11 = *v10;
                  uint64_t *v10 = v60;
                }
                break;
              case 3uLL:
                uint64_t result = (unint64_t)sub_10000B1E0((uint64_t *)v11, (unsigned int *)(v11 + 8), (uint64_t *)a2 - 1);
                break;
              case 4uLL:
                uint64_t result = (unint64_t)sub_10000B2D0(v11, (uint64_t *)(v11 + 8), (uint64_t *)(v11 + 16), (uint64_t *)a2 - 1);
                break;
              case 5uLL:
                uint64_t result = (unint64_t)sub_10000B3BC(v11, v11 + 8, v11 + 16, v11 + 24, (uint64_t)(a2 - 2));
                break;
              default:
                JUMPOUT(0);
            }
            return result;
          }
          if (v12 <= 191)
          {
            v61 = (unsigned int *)(v11 + 8);
            BOOL v63 = (unsigned int *)v11 == a2 || v61 == a2;
            if (a4)
            {
              if (!v63)
              {
                uint64_t v64 = 0;
                v65 = (void *)v11;
                do
                {
                  unsigned int v66 = *((_DWORD *)v65 + 2);
                  unsigned int v67 = *(_DWORD *)v65;
                  unsigned int v68 = *((unsigned __int16 *)v65 + 6);
                  unsigned int v69 = *((unsigned __int16 *)v65 + 2);
                  v65 = v61;
                  BOOL v70 = v68 < v69;
                  BOOL v5 = v66 == v67;
                  BOOL v71 = v66 < v67;
                  if (!v5) {
                    BOOL v70 = v71;
                  }
                  if (v70)
                  {
                    uint64_t v72 = *v65;
                    uint64_t v73 = v64;
                    while (1)
                    {
                      uint64_t v74 = v11 + v73;
                      *(void *)(v11 + v73 + 8) = *(void *)(v11 + v73);
                      if (!v73) {
                        break;
                      }
                      unsigned int v75 = *(_DWORD *)(v74 - 8);
                      BOOL v76 = *(unsigned __int16 *)(v74 - 4) > WORD2(v72);
                      if (v75 != v72) {
                        BOOL v76 = v75 > v72;
                      }
                      v73 -= 8;
                      if (!v76)
                      {
                        v77 = (void *)(v11 + v73 + 8);
                        goto LABEL_110;
                      }
                    }
                    v77 = (void *)v11;
LABEL_110:
                    void *v77 = v72;
                  }
                  v61 = (unsigned int *)(v65 + 1);
                  v64 += 8;
                }
                while (v65 + 1 != (void *)a2);
              }
            }
            else if (!v63)
            {
              do
              {
                unsigned int v112 = *(_DWORD *)(v9 + 8);
                unsigned int v113 = *(_DWORD *)v9;
                unsigned int v114 = *(unsigned __int16 *)(v9 + 12);
                unsigned int v115 = *(unsigned __int16 *)(v9 + 4);
                unint64_t v9 = (unint64_t)v61;
                BOOL v5 = v112 == v113;
                BOOL v116 = v112 < v113;
                if (v5) {
                  BOOL v116 = v114 < v115;
                }
                if (v116)
                {
                  uint64_t v117 = *(void *)v61;
                  v118 = v61;
                  do
                  {
                    v119 = v118;
                    uint64_t v120 = *((void *)v118 - 1);
                    v118 -= 2;
                    *(void *)v119 = v120;
                    unsigned int v121 = *(v119 - 4);
                    BOOL v122 = *((unsigned __int16 *)v119 - 6) > WORD2(v117);
                    if (v121 != v117) {
                      BOOL v122 = v121 > v117;
                    }
                  }
                  while (v122);
                  *(void *)v118 = v117;
                }
                v61 = (unsigned int *)(v9 + 8);
              }
              while ((unsigned int *)(v9 + 8) != a2);
            }
            return result;
          }
          if (!a3)
          {
            if ((unsigned int *)v11 != a2)
            {
              int64_t v78 = (v13 - 2) >> 1;
              int64_t v79 = v78;
              do
              {
                int64_t v80 = v79;
                if (v78 >= v79)
                {
                  uint64_t v81 = (2 * v79) | 1;
                  unint64_t v82 = v11 + 8 * v81;
                  if (2 * v80 + 2 < (uint64_t)v13)
                  {
                    unsigned int v84 = *(_DWORD *)(v82 + 8);
                    BOOL v83 = *(unsigned __int16 *)(v82 + 4) < *(unsigned __int16 *)(v82 + 12);
                    if (*(_DWORD *)v82 != v84) {
                      BOOL v83 = *(_DWORD *)v82 < v84;
                    }
                    if (v83) {
                      v82 += 8;
                    }
                    else {
                      unsigned int v84 = *(_DWORD *)v82;
                    }
                    if (v83) {
                      uint64_t v81 = 2 * v80 + 2;
                    }
                  }
                  else
                  {
                    unsigned int v84 = *(_DWORD *)v82;
                  }
                  unint64_t v85 = v11 + 8 * v80;
                  uint64_t result = *(unsigned __int16 *)(v85 + 4);
                  BOOL v5 = v84 == *(_DWORD *)v85;
                  BOOL v86 = v84 < *(_DWORD *)v85;
                  if (v5) {
                    BOOL v86 = *(unsigned __int16 *)(v82 + 4) < result;
                  }
                  if (!v86)
                  {
                    uint64_t v87 = *(void *)v85;
                    do
                    {
                      v88 = (void *)v85;
                      unint64_t v85 = v82;
                      void *v88 = *(void *)v82;
                      if (v78 < v81) {
                        break;
                      }
                      uint64_t v89 = (2 * v81) | 1;
                      unint64_t v82 = v11 + 8 * v89;
                      uint64_t v81 = 2 * v81 + 2;
                      if (v81 < (uint64_t)v13)
                      {
                        unsigned int v91 = *(_DWORD *)(v82 + 8);
                        BOOL v90 = *(unsigned __int16 *)(v82 + 4) < *(unsigned __int16 *)(v82 + 12);
                        if (*(_DWORD *)v82 != v91) {
                          BOOL v90 = *(_DWORD *)v82 < v91;
                        }
                        if (v90) {
                          v82 += 8;
                        }
                        else {
                          unsigned int v91 = *(_DWORD *)v82;
                        }
                        if (!v90) {
                          uint64_t v81 = v89;
                        }
                      }
                      else
                      {
                        unsigned int v91 = *(_DWORD *)v82;
                        uint64_t v81 = v89;
                      }
                      uint64_t result = *(unsigned __int16 *)(v82 + 4);
                      BOOL v92 = result < WORD2(v87);
                      BOOL v5 = v91 == v87;
                      BOOL v93 = v91 < v87;
                      if (!v5) {
                        BOOL v92 = v93;
                      }
                    }
                    while (!v92);
                    *(void *)unint64_t v85 = v87;
                  }
                }
                int64_t v79 = v80 - 1;
              }
              while (v80);
              uint64_t v94 = (unint64_t)v12 >> 3;
              do
              {
                uint64_t v95 = 0;
                uint64_t v96 = *(void *)v11;
                uint64_t v97 = v94 - 2;
                if (v94 < 2) {
                  uint64_t v97 = v94 - 1;
                }
                uint64_t v98 = v97 >> 1;
                v99 = (void *)v11;
                do
                {
                  v100 = &v99[v95 + 1];
                  uint64_t v101 = (2 * v95) | 1;
                  uint64_t v102 = 2 * v95 + 2;
                  if (v102 < v94)
                  {
                    uint64_t result = *((unsigned int *)v100 + 2);
                    if (*(_DWORD *)v100 == result
                       ? *((unsigned __int16 *)v100 + 2) < *((unsigned __int16 *)v100 + 6)
                       : *(_DWORD *)v100 < result)
                    {
                      ++v100;
                      uint64_t v101 = v102;
                    }
                  }
                  void *v99 = *v100;
                  v99 = v100;
                  uint64_t v95 = v101;
                }
                while (v101 <= v98);
                a2 -= 2;
                if (v100 == (void *)a2)
                {
                  void *v100 = v96;
                }
                else
                {
                  void *v100 = *(void *)a2;
                  *(void *)a2 = v96;
                  uint64_t v104 = (uint64_t)v100 - v11 + 8;
                  if (v104 >= 9)
                  {
                    unint64_t v105 = (unint64_t)((v104 >> 3) - 2) >> 1;
                    unint64_t v106 = v11 + 8 * v105;
                    BOOL v107 = *(_DWORD *)v106 < *(_DWORD *)v100;
                    if (*(_DWORD *)v106 == *(_DWORD *)v100) {
                      BOOL v107 = *(unsigned __int16 *)(v106 + 4) < *((unsigned __int16 *)v100 + 2);
                    }
                    if (v107)
                    {
                      uint64_t v108 = *v100;
                      do
                      {
                        v109 = v100;
                        v100 = (void *)v106;
                        void *v109 = *(void *)v106;
                        if (!v105) {
                          break;
                        }
                        unint64_t v105 = (v105 - 1) >> 1;
                        unint64_t v106 = v11 + 8 * v105;
                        BOOL v110 = *(unsigned __int16 *)(v106 + 4) < WORD2(v108);
                        if (*(_DWORD *)v106 != v108) {
                          BOOL v110 = *(_DWORD *)v106 < v108;
                        }
                      }
                      while (v110);
                      void *v100 = v108;
                    }
                  }
                }
              }
              while (v94-- > 2);
            }
            return result;
          }
          unint64_t v14 = v13 >> 1;
          int v15 = (unsigned int *)(v11 + 8 * (v13 >> 1));
          if ((unint64_t)v12 >= 0x401)
          {
            sub_10000B1E0((uint64_t *)v9, (unsigned int *)(v9 + 8 * (v13 >> 1)), (uint64_t *)a2 - 1);
            sub_10000B1E0((uint64_t *)(v9 + 8), v15 - 2, (uint64_t *)a2 - 2);
            sub_10000B1E0((uint64_t *)(v9 + 16), (unsigned int *)(v9 + 8 + 8 * v14), (uint64_t *)a2 - 3);
            uint64_t result = (unint64_t)sub_10000B1E0((uint64_t *)v15 - 1, v15, (uint64_t *)(v9 + 8 + 8 * v14));
            uint64_t v16 = *(void *)v9;
            *(void *)unint64_t v9 = *(void *)v15;
            *(void *)int v15 = v16;
          }
          else
          {
            uint64_t result = (unint64_t)sub_10000B1E0((uint64_t *)(v9 + 8 * (v13 >> 1)), (unsigned int *)v9, (uint64_t *)a2 - 1);
          }
          --a3;
          if (a4) {
            break;
          }
          unsigned int v17 = *(_DWORD *)(v9 - 8);
          BOOL v5 = v17 == *(_DWORD *)v9;
          BOOL v18 = v17 < *(_DWORD *)v9;
          if (v5) {
            BOOL v18 = *(unsigned __int16 *)(v9 - 4) < *(unsigned __int16 *)(v9 + 4);
          }
          if (v18) {
            break;
          }
          uint64_t v38 = *(void *)v9;
          unsigned int v39 = (unsigned __int16)WORD2(*(void *)v9);
          unsigned int v40 = *(a2 - 2);
          BOOL v41 = *((unsigned __int16 *)a2 - 2) > v39;
          BOOL v5 = v40 == *(void *)v9;
          BOOL v42 = v40 > *(void *)v9;
          if (!v5) {
            BOOL v41 = v42;
          }
          if (v41)
          {
            unint64_t v11 = v9;
            do
            {
              unsigned int v43 = *(_DWORD *)(v11 + 8);
              v11 += 8;
              BOOL v44 = v43 > v38;
              if (v43 == v38) {
                BOOL v44 = *(unsigned __int16 *)(v11 + 4) > v39;
              }
            }
            while (!v44);
          }
          else
          {
            uint64_t v45 = (unsigned int *)(v9 + 8);
            do
            {
              unint64_t v11 = (unint64_t)v45;
              if (v45 >= a2) {
                break;
              }
              unsigned int v46 = *v45;
              BOOL v47 = *(unsigned __int16 *)(v11 + 4) > v39;
              BOOL v5 = v46 == v38;
              BOOL v48 = v46 > v38;
              if (!v5) {
                BOOL v47 = v48;
              }
              uint64_t v45 = (unsigned int *)(v11 + 8);
            }
            while (!v47);
          }
          v49 = a2;
          if (v11 < (unint64_t)a2)
          {
            v49 = a2;
            do
            {
              unsigned int v50 = *((_DWORD *)v49-- - 2);
              BOOL v51 = v50 > v38;
              if (v50 == v38) {
                BOOL v51 = *((unsigned __int16 *)v49 + 2) > v39;
              }
            }
            while (v51);
          }
          while (v11 < (unint64_t)v49)
          {
            uint64_t v52 = *(void *)v11;
            *(void *)unint64_t v11 = *v49;
            void *v49 = v52;
            do
            {
              unsigned int v53 = *(_DWORD *)(v11 + 8);
              v11 += 8;
              BOOL v54 = v53 > v38;
              if (v53 == v38) {
                BOOL v54 = *(unsigned __int16 *)(v11 + 4) > v39;
              }
            }
            while (!v54);
            do
            {
              unsigned int v55 = *((_DWORD *)v49-- - 2);
              BOOL v56 = v55 > v38;
              if (v55 == v38) {
                BOOL v56 = *((unsigned __int16 *)v49 + 2) > v39;
              }
            }
            while (v56);
          }
          v57 = (uint64_t *)(v11 - 8);
          BOOL v4 = v11 - 8 >= v9;
          BOOL v5 = v11 - 8 == v9;
          if (v11 - 8 != v9) {
            *(void *)unint64_t v9 = *v57;
          }
          a4 = 0;
          uint64_t *v57 = v38;
        }
        uint64_t v19 = *(void *)v9;
        unsigned int v20 = (unsigned __int16)WORD2(*(void *)v9);
        unint64_t v21 = v9;
        do
        {
          uint64_t v22 = v21;
          unsigned int v23 = *(_DWORD *)(v21 + 8);
          v21 += 8;
          BOOL v24 = v23 < v19;
          if (v23 == v19) {
            BOOL v24 = *(unsigned __int16 *)(v22 + 12) < v20;
          }
        }
        while (v24);
        float v25 = a2;
        if (v22 == v9)
        {
          float v25 = a2;
          do
          {
            if (v21 >= (unint64_t)v25) {
              break;
            }
            unsigned int v28 = *(v25 - 2);
            v25 -= 2;
            BOOL v29 = v28 < v19;
            if (v28 == v19) {
              BOOL v29 = *((unsigned __int16 *)v25 + 2) < v20;
            }
          }
          while (!v29);
        }
        else
        {
          do
          {
            unsigned int v26 = *(v25 - 2);
            v25 -= 2;
            BOOL v27 = v26 < v19;
            if (v26 == v19) {
              BOOL v27 = *((unsigned __int16 *)v25 + 2) < v20;
            }
          }
          while (!v27);
        }
        if (v21 < (unint64_t)v25)
        {
          unint64_t v30 = v21;
          BOOL v31 = v25;
          do
          {
            uint64_t v32 = *(void *)v30;
            *(void *)unint64_t v30 = *(void *)v31;
            *(void *)BOOL v31 = v32;
            do
            {
              uint64_t v22 = v30;
              unsigned int v33 = *(_DWORD *)(v30 + 8);
              v30 += 8;
              BOOL v34 = v33 < v19;
              if (v33 == v19) {
                BOOL v34 = *(unsigned __int16 *)(v22 + 12) < v20;
              }
            }
            while (v34);
            do
            {
              unsigned int v35 = *(v31 - 2);
              v31 -= 2;
              BOOL v36 = v35 < v19;
              if (v35 == v19) {
                BOOL v36 = *((unsigned __int16 *)v31 + 2) < v20;
              }
            }
            while (!v36);
          }
          while (v30 < (unint64_t)v31);
        }
        if (v22 != v9) {
          *(void *)unint64_t v9 = *(void *)v22;
        }
        *(void *)uint64_t v22 = v19;
        if (v21 >= (unint64_t)v25) {
          break;
        }
LABEL_43:
        uint64_t result = sub_10000A8D4(v9, v22, a3, a4 & 1);
        a4 = 0;
        unint64_t v11 = v22 + 8;
      }
      BOOL v37 = sub_10000B4F0(v9, v22);
      unint64_t v11 = v22 + 8;
      uint64_t result = sub_10000B4F0(v22 + 8, (uint64_t)a2);
      if (result) {
        break;
      }
      if (!v37) {
        goto LABEL_43;
      }
    }
    a2 = (unsigned int *)v22;
    if (!v37) {
      continue;
    }
    return result;
  }
}

uint64_t *sub_10000B1E0(uint64_t *result, unsigned int *a2, uint64_t *a3)
{
  unsigned int v3 = *a2;
  unsigned int v4 = *((unsigned __int16 *)a2 + 2);
  BOOL v5 = v4 < *((unsigned __int16 *)result + 2);
  if (*a2 != *(_DWORD *)result) {
    BOOL v5 = *a2 < *(_DWORD *)result;
  }
  BOOL v6 = *((unsigned __int16 *)a3 + 2) < v4;
  BOOL v7 = *(_DWORD *)a3 == v3;
  BOOL v8 = *(_DWORD *)a3 < v3;
  if (v7) {
    BOOL v9 = v6;
  }
  else {
    BOOL v9 = v8;
  }
  if (v5)
  {
    uint64_t v10 = *result;
    if (v9)
    {
      std::logic_error *result = *a3;
LABEL_18:
      *a3 = v10;
      return result;
    }
    std::logic_error *result = *(void *)a2;
    *(void *)a2 = v10;
    BOOL v14 = *(_DWORD *)a3 < v10;
    if (*(_DWORD *)a3 == v10) {
      BOOL v14 = *((unsigned __int16 *)a3 + 2) < WORD2(v10);
    }
    if (v14)
    {
      *(void *)a2 = *a3;
      goto LABEL_18;
    }
  }
  else if (v9)
  {
    uint64_t v11 = *(void *)a2;
    *(void *)a2 = *a3;
    *a3 = v11;
    BOOL v12 = *a2 < *(_DWORD *)result;
    if (*a2 == *(_DWORD *)result) {
      BOOL v12 = *((unsigned __int16 *)a2 + 2) < *((unsigned __int16 *)result + 2);
    }
    if (v12)
    {
      uint64_t v13 = *result;
      std::logic_error *result = *(void *)a2;
      *(void *)a2 = v13;
    }
  }
  return result;
}

uint64_t *sub_10000B2D0(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t *a4)
{
  uint64_t result = sub_10000B1E0((uint64_t *)a1, (unsigned int *)a2, a3);
  BOOL v9 = *(_DWORD *)a4 < *(_DWORD *)a3;
  if (*(_DWORD *)a4 == *(_DWORD *)a3) {
    BOOL v9 = *((unsigned __int16 *)a4 + 2) < *((unsigned __int16 *)a3 + 2);
  }
  if (v9)
  {
    uint64_t v10 = *a3;
    *a3 = *a4;
    *a4 = v10;
    BOOL v11 = *(_DWORD *)a3 < *(_DWORD *)a2;
    if (*(_DWORD *)a3 == *(_DWORD *)a2) {
      BOOL v11 = *((unsigned __int16 *)a3 + 2) < *((unsigned __int16 *)a2 + 2);
    }
    if (v11)
    {
      uint64_t v12 = *a2;
      *a2 = *a3;
      *a3 = v12;
      BOOL v13 = *(_DWORD *)a2 < *(_DWORD *)a1;
      if (*(_DWORD *)a2 == *(_DWORD *)a1) {
        BOOL v13 = *((unsigned __int16 *)a2 + 2) < *(unsigned __int16 *)(a1 + 4);
      }
      if (v13)
      {
        uint64_t v14 = *(void *)a1;
        *(void *)a1 = *a2;
        *a2 = v14;
      }
    }
  }
  return result;
}

uint64_t *sub_10000B3BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result = sub_10000B2D0(a1, (uint64_t *)a2, (uint64_t *)a3, (uint64_t *)a4);
  BOOL v11 = *(_DWORD *)a5 < *(_DWORD *)a4;
  if (*(_DWORD *)a5 == *(_DWORD *)a4) {
    BOOL v11 = *(unsigned __int16 *)(a5 + 4) < *(unsigned __int16 *)(a4 + 4);
  }
  if (v11)
  {
    uint64_t v12 = *(void *)a4;
    *(void *)a4 = *(void *)a5;
    *(void *)a5 = v12;
    BOOL v13 = *(_DWORD *)a4 < *(_DWORD *)a3;
    if (*(_DWORD *)a4 == *(_DWORD *)a3) {
      BOOL v13 = *(unsigned __int16 *)(a4 + 4) < *(unsigned __int16 *)(a3 + 4);
    }
    if (v13)
    {
      uint64_t v14 = *(void *)a3;
      *(void *)a3 = *(void *)a4;
      *(void *)a4 = v14;
      BOOL v15 = *(_DWORD *)a3 < *(_DWORD *)a2;
      if (*(_DWORD *)a3 == *(_DWORD *)a2) {
        BOOL v15 = *(unsigned __int16 *)(a3 + 4) < *(unsigned __int16 *)(a2 + 4);
      }
      if (v15)
      {
        uint64_t v16 = *(void *)a2;
        *(void *)a2 = *(void *)a3;
        *(void *)a3 = v16;
        BOOL v17 = *(_DWORD *)a2 < *(_DWORD *)a1;
        if (*(_DWORD *)a2 == *(_DWORD *)a1) {
          BOOL v17 = *(unsigned __int16 *)(a2 + 4) < *(unsigned __int16 *)(a1 + 4);
        }
        if (v17)
        {
          uint64_t v18 = *(void *)a1;
          *(void *)a1 = *(void *)a2;
          *(void *)a2 = v18;
        }
      }
    }
  }
  return result;
}

BOOL sub_10000B4F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (a2 - a1) >> 3;
  BOOL result = 1;
  switch(v4)
  {
    case 0:
    case 1:
      return result;
    case 2:
      unsigned int v6 = *(_DWORD *)(a2 - 8);
      BOOL v7 = v6 == *(_DWORD *)a1;
      BOOL v8 = v6 < *(_DWORD *)a1;
      if (v7) {
        BOOL v8 = *(unsigned __int16 *)(a2 - 4) < *(unsigned __int16 *)(a1 + 4);
      }
      if (v8)
      {
        uint64_t v9 = *(void *)a1;
        *(void *)a1 = *(void *)(a2 - 8);
        *(void *)(a2 - 8) = v9;
      }
      return result;
    case 3:
      sub_10000B1E0((uint64_t *)a1, (unsigned int *)(a1 + 8), (uint64_t *)(a2 - 8));
      return 1;
    case 4:
      sub_10000B2D0(a1, (uint64_t *)(a1 + 8), (uint64_t *)(a1 + 16), (uint64_t *)(a2 - 8));
      return 1;
    case 5:
      sub_10000B3BC(a1, a1 + 8, a1 + 16, a1 + 24, a2 - 8);
      return 1;
    default:
      uint64_t v10 = a1 + 16;
      sub_10000B1E0((uint64_t *)a1, (unsigned int *)(a1 + 8), (uint64_t *)(a1 + 16));
      uint64_t v11 = a1 + 24;
      if (a1 + 24 == a2) {
        return 1;
      }
      uint64_t v12 = 0;
      int v13 = 0;
      break;
  }
  while (1)
  {
    BOOL v14 = *(_DWORD *)v11 < *(_DWORD *)v10;
    if (*(_DWORD *)v11 == *(_DWORD *)v10) {
      BOOL v14 = *(unsigned __int16 *)(v11 + 4) < *(unsigned __int16 *)(v10 + 4);
    }
    if (v14)
    {
      uint64_t v15 = *(void *)v11;
      uint64_t v16 = v12;
      while (1)
      {
        uint64_t v17 = a1 + v16;
        *(void *)(a1 + v16 + 24) = *(void *)(a1 + v16 + 16);
        if (v16 == -16) {
          break;
        }
        unsigned int v18 = *(_DWORD *)(v17 + 8);
        BOOL v19 = *(unsigned __int16 *)(v17 + 12) > WORD2(v15);
        if (v18 != v15) {
          BOOL v19 = v18 > v15;
        }
        v16 -= 8;
        if (!v19)
        {
          unsigned int v20 = (void *)(a1 + v16 + 24);
          goto LABEL_18;
        }
      }
      unsigned int v20 = (void *)a1;
LABEL_18:
      *unsigned int v20 = v15;
      if (++v13 == 8) {
        return v11 + 8 == a2;
      }
    }
    uint64_t v10 = v11;
    v12 += 8;
    v11 += 8;
    if (v11 == a2) {
      return 1;
    }
  }
}

uint64_t sub_10000B6D4(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t (**a4)(uint64_t *, uint64_t *))
{
  char v8 = (*a4)(a2, a1);
  uint64_t result = (*a4)(a3, a2);
  if (v8)
  {
    uint64_t v10 = *a1;
    if (result)
    {
      *a1 = *a3;
    }
    else
    {
      *a1 = *a2;
      *a2 = v10;
      uint64_t result = (*a4)(a3, a2);
      if (!result) {
        return result;
      }
      uint64_t v10 = *a2;
      *a2 = *a3;
    }
    *a3 = v10;
  }
  else if (result)
  {
    uint64_t v11 = *a2;
    *a2 = *a3;
    *a3 = v11;
    uint64_t result = (*a4)(a2, a1);
    if (result)
    {
      uint64_t v12 = *a1;
      *a1 = *a2;
      *a2 = v12;
    }
  }
  return result;
}

uint64_t sub_10000B7B8(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, uint64_t (**a5)(uint64_t *, uint64_t *))
{
  sub_10000B6D4(a1, a2, a3, a5);
  uint64_t result = (*a5)(a4, a3);
  if (result)
  {
    uint64_t v11 = *a3;
    *a3 = *a4;
    *a4 = v11;
    uint64_t result = (*a5)(a3, a2);
    if (result)
    {
      uint64_t v12 = *a2;
      *a2 = *a3;
      *a3 = v12;
      uint64_t result = (*a5)(a2, a1);
      if (result)
      {
        uint64_t v13 = *a1;
        *a1 = *a2;
        *a2 = v13;
      }
    }
  }
  return result;
}

uint64_t sub_10000B86C(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, uint64_t *a5, uint64_t (**a6)(uint64_t *, uint64_t *))
{
  sub_10000B7B8(a1, a2, a3, a4, a6);
  uint64_t result = (*a6)(a5, a4);
  if (result)
  {
    uint64_t v13 = *a4;
    *a4 = *a5;
    *a5 = v13;
    uint64_t result = (*a6)(a4, a3);
    if (result)
    {
      uint64_t v14 = *a3;
      *a3 = *a4;
      *a4 = v14;
      uint64_t result = (*a6)(a3, a2);
      if (result)
      {
        uint64_t v15 = *a2;
        *a2 = *a3;
        *a3 = v15;
        uint64_t result = (*a6)(a2, a1);
        if (result)
        {
          uint64_t v16 = *a1;
          *a1 = *a2;
          *a2 = v16;
        }
      }
    }
  }
  return result;
}

BOOL sub_10000B948(uint64_t *a1, uint64_t *a2, uint64_t (**a3)(uint64_t *, uint64_t *))
{
  uint64_t v6 = a2 - a1;
  BOOL result = 1;
  switch(v6)
  {
    case 0:
    case 1:
      return result;
    case 2:
      char v8 = a2 - 1;
      if ((*a3)(a2 - 1, a1))
      {
        uint64_t v9 = *a1;
        *a1 = *v8;
        *char v8 = v9;
      }
      return 1;
    case 3:
      sub_10000B6D4(a1, a1 + 1, a2 - 1, a3);
      return 1;
    case 4:
      sub_10000B7B8(a1, a1 + 1, a1 + 2, a2 - 1, a3);
      return 1;
    case 5:
      sub_10000B86C(a1, a1 + 1, a1 + 2, a1 + 3, a2 - 1, a3);
      return 1;
    default:
      uint64_t v10 = a1 + 2;
      sub_10000B6D4(a1, a1 + 1, a1 + 2, a3);
      uint64_t v11 = a1 + 3;
      if (a1 + 3 == a2) {
        return 1;
      }
      uint64_t v12 = 0;
      int v13 = 0;
      break;
  }
  while (1)
  {
    if ((*a3)(v11, v10))
    {
      uint64_t v17 = *v11;
      uint64_t v14 = v12;
      while (1)
      {
        uint64_t v15 = (uint64_t *)((char *)a1 + v14);
        *(uint64_t *)((char *)a1 + v14 + 24) = *(uint64_t *)((char *)a1 + v14 + 16);
        if (v14 == -16) {
          break;
        }
        v14 -= 8;
        if (((*a3)(&v17, v15 + 1) & 1) == 0)
        {
          uint64_t v16 = (uint64_t *)((char *)a1 + v14 + 24);
          goto LABEL_12;
        }
      }
      uint64_t v16 = a1;
LABEL_12:
      uint64_t *v16 = v17;
      if (++v13 == 8) {
        return v11 + 1 == a2;
      }
    }
    uint64_t v10 = v11;
    v12 += 8;
    if (++v11 == a2) {
      return 1;
    }
  }
}

BOOL sub_10000BB24(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = *(unsigned __int16 *)(a1 + 6);
  unsigned int v3 = *(unsigned __int16 *)(a2 + 6);
  BOOL v4 = v2 == v3;
  BOOL v5 = v2 > v3;
  if (v4) {
    return *(unsigned __int16 *)(a1 + 4) > *(unsigned __int16 *)(a2 + 4);
  }
  else {
    return v5;
  }
}

void *sub_10000BB4C(unint64_t a1)
{
  if (a1 >> 61) {
    sub_100004C24();
  }
  return operator new(8 * a1);
}

double sub_10000BB84(uint64_t a1)
{
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = 0;
  *(unsigned char *)(a1 + 64) = 1;
  *(void *)a1 = 0;
  *(_DWORD *)(a1 + 8) = 0;
  *(void *)(a1 + 28) = 0;
  *(void *)(a1 + 20) = 0;
  double result = -3.12151834e283;
  *(void *)(a1 + 12) = 0xFACADE990BE5E519;
  *(unsigned char *)(a1 + 88) = 1;
  *(_DWORD *)(a1 + 84) = 0;
  *(unsigned char *)(a1 + 80) = 0;
  *(void *)(a1 + 72) = 0;
  *(_DWORD *)(a1 + 36) = 252706816;
  return result;
}

void *sub_10000BBCC(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    double result = sub_10000BC48(result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      double result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_10000BC2C(_Unwind_Exception *exception_object)
{
  unsigned int v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *sub_10000BC48(void *a1, unint64_t a2)
{
  if (a2 >> 61) {
    sub_100004C0C();
  }
  double result = (char *)sub_10000BB4C(a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

void *sub_10000BC88(unint64_t a1)
{
  if (a1 >> 62) {
    sub_100004C24();
  }
  return operator new(4 * a1);
}

void sub_10000BCC0()
{
}

void sub_10000BDDC()
{
}

void *sub_10000BE24(void *result)
{
  uint64_t v1 = result[4];
  if (v1)
  {
    unsigned int v2 = *(void **)(v1 + 8);
    if (v2)
    {
      *(void *)(v1 + 16) = v2;
      operator delete(v2);
    }
    operator delete();
  }
  if (*result) {
    operator delete[]();
  }
  return result;
}

void *sub_10000BE94(void *result)
{
  if (result[3] != -1)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *(void *)&v3.__val_ = 501;
    v3.__cat_ = (const std::error_category *)&off_10003CB20;
    sub_1000079AC((uint64_t)exception, &v3);
    goto LABEL_6;
  }
  result[3] = result[2];
  uint64_t v1 = result[4];
  if (*(_DWORD *)(v1 + 44) != -1)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *(void *)&v3.__val_ = 508;
    v3.__cat_ = (const std::error_category *)&off_10003CB20;
    sub_1000079AC((uint64_t)exception, &v3);
LABEL_6:
  }
  *(_DWORD *)(v1 + 44) = *(_DWORD *)(v1 + 40);
  return result;
}

void sub_10000BF50(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

float *sub_10000BF68(float *result)
{
  uint64_t v1 = *((void *)result + 3);
  if (v1 == -1)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *(void *)&v23.__val_ = 502;
    v23.__cat_ = (const std::error_category *)&off_10003CB20;
    sub_1000079AC((uint64_t)exception, &v23);
    goto LABEL_36;
  }
  unsigned int v2 = result;
  uint64_t v3 = *((void *)result + 4);
  int v4 = *(_DWORD *)(v3 + 44);
  if (v4 == -1)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *(void *)&v23.__val_ = 509;
    v23.__cat_ = (const std::error_category *)&off_10003CB20;
    sub_1000079AC((uint64_t)exception, &v23);
LABEL_36:
  }
  *(_DWORD *)(v3 + 40) = v4;
  *(_DWORD *)(v3 + 44) = -1;
  if (v1 >= 7) {
    int v5 = 7;
  }
  else {
    int v5 = v1;
  }
  if (v1 >= 7) {
    uint64_t v6 = v1 - 7;
  }
  else {
    uint64_t v6 = 0;
  }
  *((void *)result + 2) = v6;
  if (v5 >= 1)
  {
    for (unsigned int i = 0; i != v5; ++i)
    {
      double result = (float *)sub_10000C164(*((int **)v2 + 4), i - v5 + 1);
      uint64_t v8 = 0;
      uint64_t v10 = *((void *)v2 + 1);
      uint64_t v9 = *((void *)v2 + 2);
      uint64_t v11 = (float *)(v10 + 4100 * v9);
      do
      {
        v11[v8] = result[v8];
        ++v8;
      }
      while (v8 != 1025);
      uint64_t v12 = 0;
      float v13 = *v11;
      float v14 = v11[1];
      do
      {
        uint64_t v15 = &v11[v12];
        if (v13 <= v14) {
          float v16 = v14;
        }
        else {
          float v16 = v13;
        }
        float v13 = v14;
        float v14 = v15[2];
        if (v16 <= v14) {
          float v16 = v15[2];
        }
        *uint64_t v15 = v16;
        ++v12;
      }
      while (v12 != 1023);
      uint64_t v17 = 0;
      uint64_t v18 = v10 + 4100 * (v9 - 1);
      uint64_t v19 = v10 + 4100 * (v9 - 3);
      uint64_t v20 = v10 + 4100 * (v9 - 6);
      do
      {
        if (i)
        {
          float v21 = *(float *)(v18 + 4 * v17);
          if (v21 <= v11[v17]) {
            float v21 = v11[v17];
          }
          *(float *)(v18 + 4 * v17) = v21;
          if (i >= 3)
          {
            if (*(float *)(v19 + 4 * v17) > v21) {
              float v21 = *(float *)(v19 + 4 * v17);
            }
            *(float *)(v19 + 4 * v17) = v21;
            if (i >= 6)
            {
              if (*(float *)(v20 + 4 * v17) > v21) {
                float v21 = *(float *)(v20 + 4 * v17);
              }
              *(float *)(v20 + 4 * v17) = v21;
            }
          }
        }
        ++v17;
      }
      while (v17 != 1025);
      *((void *)v2 + 2) = v9 + 1;
    }
  }
  *((void *)v2 + 3) = -1;
  return result;
}

void sub_10000C14C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_10000C164(int *a1, int a2)
{
  if (a1[10] <= 0)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *(void *)&v5.__val_ = 510;
    v5.__cat_ = (const std::error_category *)&off_10003CB20;
    sub_1000079AC((uint64_t)exception, &v5);
  }
  int v2 = a2 - 1;
  return sub_10000C200(a1, v2);
}

void sub_10000C1EC(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_10000C200(int *a1, int a2)
{
  if (a2 > 0 || (int v2 = a1[1], 2 - v2 > a2))
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *(void *)&v5.__val_ = 511;
    v5.__cat_ = (const std::error_category *)&off_10003CB20;
    sub_1000079AC((uint64_t)exception, &v5);
  }
  return *((void *)a1 + 4) + 4 * *a1 * (uint64_t)((a1[10] + a2) & (v2 - 1));
}

void sub_10000C2A4(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_10000C2B8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = a1;
  int v4 = *(int **)(a1 + 32);
  ++v4[10];
  uint64_t v5 = sub_10000C164(v4, 0);
  uint64_t v6 = 0;
  uint64_t v8 = *(void *)(v3 + 8);
  uint64_t v7 = *(void *)(v3 + 16);
  uint64_t v9 = (float *)(v8 + 4100 * v7);
  do
  {
    v9[v6] = *(float *)(v5 + 4 * v6);
    ++v6;
  }
  while (v6 != 1025);
  uint64_t v10 = 0;
  float v11 = *v9;
  float v12 = v9[1];
  do
  {
    float v13 = &v9[v10];
    if (v11 <= v12) {
      float v14 = v12;
    }
    else {
      float v14 = v11;
    }
    float v11 = v12;
    float v12 = v13[2];
    if (v14 <= v12) {
      float v14 = v13[2];
    }
    float *v13 = v14;
    ++v10;
  }
  while (v10 != 1023);
  uint64_t v15 = 0;
  uint64_t v16 = v8 + 4100 * (v7 - 1);
  uint64_t v17 = v8 + 4100 * (v7 - 3);
  uint64_t v18 = v8 + 4100 * (v7 - 6);
  do
  {
    float v19 = *(float *)(v16 + 4 * v15);
    if (v19 <= v9[v15]) {
      float v19 = v9[v15];
    }
    *(float *)(v16 + 4 * v15) = v19;
    if (*(float *)(v17 + 4 * v15) > v19) {
      float v19 = *(float *)(v17 + 4 * v15);
    }
    *(float *)(v17 + 4 * v15) = v19;
    if (*(float *)(v18 + 4 * v15) > v19) {
      float v19 = *(float *)(v18 + 4 * v15);
    }
    *(float *)(v18 + 4 * v15++) = v19;
  }
  while (v15 != 1025);
  if (v7 >= 45)
  {
    uint64_t v79 = sub_10000C164(*(int **)(v3 + 32), -45);
    v80[2] = v79;
    uint64_t v78 = sub_10000C164(*(int **)(v3 + 32), -47);
    v80[0] = v78;
    uint64_t v77 = sub_10000C164(*(int **)(v3 + 32), -46);
    v80[1] = v77;
    uint64_t v76 = sub_10000C164(*(int **)(v3 + 32), -44);
    v80[3] = v76;
    uint64_t v75 = sub_10000C164(*(int **)(v3 + 32), -43);
    v80[4] = v75;
    uint64_t v20 = *(void *)(v3 + 8) + 4100 * (*(_DWORD *)(v3 + 16) - 48);
    BOOL v70 = a2 + 2;
    float v21 = (char *)&v81[6] + 12;
    uint64_t v22 = (float *)(v20 + 24);
    uint64_t v23 = v20 + 48;
    uint64_t v24 = 10;
    uint64_t v71 = v20;
    uint64_t v72 = v3;
    uint64_t v73 = a2;
    while (1)
    {
      float v25 = *(float *)(v79 + 4 * v24);
      if (v25 >= 0.015625 && v25 >= *(float *)(v20 + 4 * (v24 - 1)))
      {
        unint64_t v26 = 0;
        uint64_t v27 = v20 + 4 * v24;
        float v28 = *(float *)(v27 - 12);
        if (v28 <= *(float *)(v27 + 4)) {
          float v28 = *(float *)(v27 + 4);
        }
        BOOL v29 = v22;
        do
        {
          if (v28 <= *(float *)(v23 + 4 * v26)) {
            float v28 = *(float *)(v23 + 4 * v26);
          }
          float v30 = *v29;
          v29 -= 3;
          float v31 = v30;
          if (v28 <= v30) {
            float v28 = v31;
          }
          v26 += 3;
        }
        while (v26 < 7);
        if (v25 > v28)
        {
          unint64_t v32 = 0;
          uint64_t v33 = *(void *)(v3 + 16);
          uint64_t v34 = *(void *)(v3 + 8) + 4 * (v24 - 1);
          if (v28 <= *(float *)(v34 + 4100 * (v33 - 52))) {
            float v28 = *(float *)(v34 + 4100 * (v33 - 52));
          }
          if (v28 <= *(float *)(v34 + 4100 * (v33 - 44))) {
            float v28 = *(float *)(v34 + 4100 * (v33 - 44));
          }
          unsigned __int8 v35 = v33 - 55;
          char v36 = v33 - 41;
          do
          {
            if (v28 <= *(float *)(v34 + 4100 * (v36 + v32))) {
              float v28 = *(float *)(v34 + 4100 * (v36 + v32));
            }
            if (v28 <= *(float *)(v34 + 4100 * v35)) {
              float v28 = *(float *)(v34 + 4100 * v35);
            }
            v32 += 7;
            v35 -= 7;
          }
          while (v32 < 0x26);
          if (v25 > v28) {
            break;
          }
        }
      }
LABEL_65:
      ++v24;
      ++v22;
      v23 += 4;
      if (v24 == 1015)
      {
        uint64_t v7 = *(void *)(v3 + 16);
        goto LABEL_67;
      }
    }
    int v74 = v33 - 45;
    float v37 = fmaxf(*(float *)(v79 + 4 * v24), 0.015625);
    memset(v81, 0, sizeof(v81));
    uint64_t v38 = 0;
    float v39 = (float)(logf(v37) + 4.1589) * 1477.3;
    uint64_t v40 = v24 + 2;
    while (1)
    {
      BOOL v41 = (float *)v81 + v38 + 2;
      float *v41 = v39 - (float)((float)(logf(fmaxf(*(float *)(v78 + 4 * (v40 - v38)), 0.015625)) + 4.1589) * 1477.3);
      BOOL v42 = (float *)v81 + v38;
      v42[7] = v39 - (float)((float)(logf(fmaxf(*(float *)(v77 + 4 * (v40 - v38)), 0.015625)) + 4.1589) * 1477.3);
      unsigned int v43 = v42 + 7;
      v43[5] = v39 - (float)((float)(logf(fmaxf(*(float *)(v79 + 4 * (v40 - v38)), 0.015625)) + 4.1589) * 1477.3);
      v43[10] = v39 - (float)((float)(logf(fmaxf(*(float *)(v76 + 4 * (v40 - v38)), 0.015625)) + 4.1589) * 1477.3);
      float v44 = logf(fmaxf(*(float *)(v75 + 4 * (v40 - v38)), 0.015625));
      uint64_t v45 = 0;
      v43[15] = v39 - (float)((float)(v44 + 4.1589) * 1477.3);
      unsigned int v46 = v43 + 15;
      do
      {
        *(_DWORD *)&v21[v45] = 0;
        v45 += 20;
      }
      while (v45 != 100);
      if ((v38 & 0x7FFFFFFFFFFFFFFBLL) != 0)
      {
        if ((v38 & 0x7FFFFFFFFFFFFFFDLL) != 1) {
          goto LABEL_50;
        }
      }
      else
      {
        _DWORD *v46 = 0;
        float *v41 = 0.0;
        unsigned int v46 = v43 + 10;
        BOOL v41 = v43;
      }
      _DWORD *v46 = 0;
      float *v41 = 0.0;
LABEL_50:
      ++v38;
      v21 += 4;
      if (v38 == 5)
      {
        sub_10000ECA4(v74, v24, v80, v81, (_WORD *)v81 + 2, (_WORD *)v81 + 3, v83, &v82);
        unint64_t v47 = v73[1];
        unint64_t v48 = v73[2];
        if (v47 >= v48)
        {
          uint64_t v57 = 0x4EC4EC4EC4EC4EC5 * ((uint64_t)(v47 - *v73) >> 4);
          unint64_t v58 = v57 + 1;
          float v21 = (char *)&v81[6] + 12;
          if ((unint64_t)(v57 + 1) > 0x13B13B13B13B13BLL) {
            sub_100004C0C();
          }
          unint64_t v59 = 0x4EC4EC4EC4EC4EC5 * ((uint64_t)(v48 - *v73) >> 4);
          if (2 * v59 > v58) {
            unint64_t v58 = 2 * v59;
          }
          if (v59 >= 0x9D89D89D89D89DLL) {
            unint64_t v60 = 0x13B13B13B13B13BLL;
          }
          else {
            unint64_t v60 = v58;
          }
          v83[4] = v70;
          uint64_t v3 = v72;
          if (v60) {
            unint64_t v60 = (unint64_t)sub_10000C930(v60);
          }
          else {
            uint64_t v61 = 0;
          }
          long long v62 = *(_OWORD *)((char *)&v81[2] + 8);
          BOOL v63 = (_DWORD *)(v60 + 208 * v57);
          *(_OWORD *)(v63 + 14) = *(_OWORD *)((char *)&v81[3] + 8);
          long long v64 = *(_OWORD *)((char *)&v81[5] + 8);
          *(_OWORD *)(v63 + 18) = *(_OWORD *)((char *)&v81[4] + 8);
          *(_OWORD *)(v63 + 22) = v64;
          long long v65 = *(_OWORD *)((char *)&v81[1] + 8);
          *(_OWORD *)(v63 + 2) = *(_OWORD *)((char *)v81 + 8);
          *(_OWORD *)(v63 + 6) = v65;
          *(_OWORD *)(v63 + 10) = v62;
          long long v66 = *(_OWORD *)((char *)&v81[10] + 12);
          *(_OWORD *)(v63 + 47) = *(_OWORD *)((char *)&v81[11] + 12);
          *(_OWORD *)(v63 + 43) = v66;
          long long v67 = *(_OWORD *)((char *)&v81[8] + 12);
          *(_OWORD *)(v63 + 39) = *(_OWORD *)((char *)&v81[9] + 12);
          *(_OWORD *)(v63 + 35) = v67;
          long long v68 = *(_OWORD *)((char *)&v81[6] + 12);
          *(_OWORD *)(v63 + 31) = *(_OWORD *)((char *)&v81[7] + 12);
          v83[0] = (void *)v60;
          v83[1] = v63;
          int v69 = DWORD1(v81[0]);
          _DWORD *v63 = v81[0];
          v63[1] = v69;
          v63[26] = DWORD2(v81[6]);
          v63[51] = HIDWORD(v81[12]);
          *(_OWORD *)(v63 + 27) = v68;
          v83[2] = v63 + 52;
          v83[3] = (void *)(v60 + 208 * v61);
          sub_10000C97C(v73, v83);
          uint64_t v56 = v73[1];
          if (v83[0]) {
            operator delete(v83[0]);
          }
        }
        else
        {
          long long v49 = *(_OWORD *)((char *)&v81[2] + 8);
          *(_OWORD *)(v47 + 56) = *(_OWORD *)((char *)&v81[3] + 8);
          long long v50 = *(_OWORD *)((char *)&v81[5] + 8);
          *(_OWORD *)(v47 + 72) = *(_OWORD *)((char *)&v81[4] + 8);
          *(_OWORD *)(v47 + 88) = v50;
          long long v51 = *(_OWORD *)((char *)&v81[1] + 8);
          *(_OWORD *)(v47 + 8) = *(_OWORD *)((char *)v81 + 8);
          *(_OWORD *)(v47 + 24) = v51;
          *(_OWORD *)(v47 + 40) = v49;
          float v21 = (char *)&v81[6] + 12;
          long long v52 = *(_OWORD *)((char *)&v81[10] + 12);
          *(_OWORD *)(v47 + 188) = *(_OWORD *)((char *)&v81[11] + 12);
          *(_OWORD *)(v47 + 172) = v52;
          long long v53 = *(_OWORD *)((char *)&v81[8] + 12);
          *(_OWORD *)(v47 + 156) = *(_OWORD *)((char *)&v81[9] + 12);
          *(_OWORD *)(v47 + 140) = v53;
          long long v54 = *(_OWORD *)((char *)&v81[6] + 12);
          *(_OWORD *)(v47 + 124) = *(_OWORD *)((char *)&v81[7] + 12);
          int v55 = DWORD1(v81[0]);
          *(_DWORD *)unint64_t v47 = v81[0];
          *(_DWORD *)(v47 + 4) = v55;
          *(_DWORD *)(v47 + 104) = DWORD2(v81[6]);
          *(_DWORD *)(v47 + 204) = HIDWORD(v81[12]);
          uint64_t v56 = v47 + 208;
          *(_OWORD *)(v47 + 108) = v54;
          uint64_t v3 = v72;
        }
        uint64_t v20 = v71;
        v73[1] = v56;
        goto LABEL_65;
      }
    }
  }
LABEL_67:
  *(void *)(v3 + 16) = v7 + 1;
}

void *sub_10000C930(unint64_t a1)
{
  if (a1 >= 0x13B13B13B13B13CLL) {
    sub_100004C24();
  }
  return operator new(208 * a1);
}

uint64_t *sub_10000C97C(uint64_t *result, void *a2)
{
  uint64_t v3 = *result;
  uint64_t v2 = result[1];
  uint64_t v4 = a2[1];
  if (v2 != *result)
  {
    uint64_t v5 = 0;
    do
    {
      uint64_t v6 = v4 + v5;
      int v7 = *(_DWORD *)(v2 + v5 - 204);
      *(_DWORD *)(v6 - 208) = *(_DWORD *)(v2 + v5 - 208);
      *(_DWORD *)(v6 - 204) = v7;
      long long v8 = *(_OWORD *)(v2 + v5 - 200);
      long long v9 = *(_OWORD *)(v2 + v5 - 184);
      *(_OWORD *)(v6 - 168) = *(_OWORD *)(v2 + v5 - 168);
      *(_OWORD *)(v6 - 184) = v9;
      *(_OWORD *)(v6 - 200) = v8;
      long long v10 = *(_OWORD *)(v2 + v5 - 152);
      long long v11 = *(_OWORD *)(v2 + v5 - 136);
      long long v12 = *(_OWORD *)(v2 + v5 - 120);
      *(_DWORD *)(v6 - 104) = *(_DWORD *)(v2 + v5 - 104);
      *(_OWORD *)(v6 - 120) = v12;
      *(_OWORD *)(v6 - 136) = v11;
      *(_OWORD *)(v6 - 152) = v10;
      long long v13 = *(_OWORD *)(v2 + v5 - 36);
      long long v14 = *(_OWORD *)(v2 + v5 - 20);
      int v15 = *(_DWORD *)(v2 + v5 - 4);
      *(_OWORD *)(v6 - 52) = *(_OWORD *)(v2 + v5 - 52);
      *(_DWORD *)(v6 - 4) = v15;
      *(_OWORD *)(v6 - 20) = v14;
      *(_OWORD *)(v6 - 36) = v13;
      long long v16 = *(_OWORD *)(v2 + v5 - 100);
      long long v17 = *(_OWORD *)(v2 + v5 - 84);
      *(_OWORD *)(v6 - 68) = *(_OWORD *)(v2 + v5 - 68);
      *(_OWORD *)(v6 - 84) = v17;
      *(_OWORD *)(v6 - 100) = v16;
      v5 -= 208;
    }
    while (v2 + v5 != v3);
    v4 += v5;
  }
  a2[1] = v4;
  uint64_t v18 = *result;
  char *result = v4;
  a2[1] = v18;
  uint64_t v19 = result[1];
  result[1] = a2[2];
  a2[2] = v19;
  uint64_t v20 = result[2];
  result[2] = a2[3];
  a2[3] = v20;
  *a2 = a2[1];
  return result;
}

void sub_10000CA60(uint64_t a1, char **a2)
{
  uint64_t v4 = *(int **)(a1 + 32);
  ++v4[10];
  uint64_t v5 = sub_10000C164(v4, 0);
  uint64_t v6 = 0;
  uint64_t v8 = *(void *)(a1 + 8);
  uint64_t v7 = *(void *)(a1 + 16);
  long long v9 = (float *)(v8 + 4100 * v7);
  do
  {
    v9[v6] = *(float *)(v5 + 4 * v6);
    ++v6;
  }
  while (v6 != 1025);
  uint64_t v10 = 0;
  float v11 = *v9;
  float v12 = v9[1];
  do
  {
    long long v13 = &v9[v10];
    if (v11 <= v12) {
      float v14 = v12;
    }
    else {
      float v14 = v11;
    }
    float v11 = v12;
    float v12 = v13[2];
    if (v14 <= v12) {
      float v14 = v13[2];
    }
    float *v13 = v14;
    ++v10;
  }
  while (v10 != 1023);
  uint64_t v15 = 0;
  uint64_t v16 = v8 + 4100 * (v7 - 1);
  uint64_t v17 = v8 + 4100 * (v7 - 3);
  uint64_t v18 = v8 + 4100 * (v7 - 6);
  do
  {
    float v19 = *(float *)(v16 + 4 * v15);
    if (v19 <= v9[v15]) {
      float v19 = v9[v15];
    }
    *(float *)(v16 + 4 * v15) = v19;
    if (*(float *)(v17 + 4 * v15) > v19) {
      float v19 = *(float *)(v17 + 4 * v15);
    }
    *(float *)(v17 + 4 * v15) = v19;
    if (*(float *)(v18 + 4 * v15) > v19) {
      float v19 = *(float *)(v18 + 4 * v15);
    }
    *(float *)(v18 + 4 * v15++) = v19;
  }
  while (v15 != 1025);
  if (v7 >= 45)
  {
    uint64_t v20 = sub_10000C164(*(int **)(a1 + 32), -45);
    v52[2] = v20;
    v52[0] = sub_10000C164(*(int **)(a1 + 32), -47);
    v52[1] = sub_10000C164(*(int **)(a1 + 32), -46);
    v52[3] = sub_10000C164(*(int **)(a1 + 32), -44);
    uint64_t v21 = sub_10000C164(*(int **)(a1 + 32), -43);
    uint64_t v22 = *(void *)(a1 + 8) + 4100 * (*(_DWORD *)(a1 + 16) - 48);
    v52[4] = v21;
    uint64_t v23 = (float *)(v22 + 24);
    uint64_t v24 = v22 + 48;
    for (uint64_t i = 10; i != 1015; ++i)
    {
      float v26 = *(float *)(v20 + 4 * i);
      if (v26 >= 0.015625 && v26 >= *(float *)(v22 + 4 * (i - 1)))
      {
        unint64_t v27 = 0;
        uint64_t v28 = v22 + 4 * i;
        float v29 = *(float *)(v28 - 12);
        if (v29 <= *(float *)(v28 + 4)) {
          float v29 = *(float *)(v28 + 4);
        }
        float v30 = v23;
        do
        {
          if (v29 <= *(float *)(v24 + 4 * v27)) {
            float v29 = *(float *)(v24 + 4 * v27);
          }
          float v31 = *v30;
          v30 -= 3;
          float v32 = v31;
          if (v29 <= v31) {
            float v29 = v32;
          }
          v27 += 3;
        }
        while (v27 < 7);
        if (v26 > v29)
        {
          unint64_t v33 = 0;
          uint64_t v34 = *(void *)(a1 + 16);
          uint64_t v35 = *(void *)(a1 + 8) + 4 * (i - 1);
          if (v29 <= *(float *)(v35 + 4100 * (v34 - 52))) {
            float v29 = *(float *)(v35 + 4100 * (v34 - 52));
          }
          if (v29 <= *(float *)(v35 + 4100 * (v34 - 44))) {
            float v29 = *(float *)(v35 + 4100 * (v34 - 44));
          }
          unsigned __int8 v36 = v34 - 55;
          char v37 = v34 - 41;
          do
          {
            if (v29 <= *(float *)(v35 + 4100 * (v37 + v33))) {
              float v29 = *(float *)(v35 + 4100 * (v37 + v33));
            }
            if (v29 <= *(float *)(v35 + 4100 * v36)) {
              float v29 = *(float *)(v35 + 4100 * v36);
            }
            v33 += 7;
            v36 -= 7;
          }
          while (v33 < 0x26);
          if (v26 > v29)
          {
            memset(v53, 0, 12);
            sub_10000ECA4(v34 - 45, i, v52, v53, (_WORD *)v53 + 2, (_WORD *)v53 + 3, (_WORD *)&v53[1] + 1, &v53[1]);
            unint64_t v39 = (unint64_t)a2[1];
            unint64_t v38 = (unint64_t)a2[2];
            if (v39 >= v38)
            {
              unint64_t v41 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v39 - (void)*a2) >> 2);
              unint64_t v42 = v41 + 1;
              if (v41 + 1 > 0x1555555555555555) {
                sub_100004C0C();
              }
              unint64_t v43 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v38 - (void)*a2) >> 2);
              if (2 * v43 > v42) {
                unint64_t v42 = 2 * v43;
              }
              if (v43 >= 0xAAAAAAAAAAAAAAALL) {
                unint64_t v44 = 0x1555555555555555;
              }
              else {
                unint64_t v44 = v42;
              }
              uint64_t v45 = (char *)sub_10000CE48(v44);
              unint64_t v47 = &v45[12 * v41];
              *(_DWORD *)unint64_t v47 = v53[0];
              *(void *)(v47 + 4) = *(void *)((char *)v53 + 4);
              long long v49 = *a2;
              unint64_t v48 = a2[1];
              long long v50 = v47;
              if (v48 != *a2)
              {
                do
                {
                  int v51 = *((_DWORD *)v48 - 3);
                  v48 -= 12;
                  *((_DWORD *)v50 - 3) = v51;
                  v50 -= 12;
                  *(void *)(v50 + 4) = *(void *)(v48 + 4);
                }
                while (v48 != v49);
                unint64_t v48 = *a2;
              }
              uint64_t v40 = v47 + 12;
              *a2 = v50;
              a2[1] = v47 + 12;
              a2[2] = &v45[12 * v46];
              if (v48) {
                operator delete(v48);
              }
            }
            else
            {
              *(_DWORD *)unint64_t v39 = v53[0];
              *(void *)(v39 + 4) = *(void *)((char *)v53 + 4);
              uint64_t v40 = (char *)(v39 + 12);
            }
            a2[1] = v40;
          }
        }
      }
      ++v23;
      v24 += 4;
    }
    uint64_t v7 = *(void *)(a1 + 16);
  }
  *(void *)(a1 + 16) = v7 + 1;
}

void *sub_10000CE48(unint64_t a1)
{
  if (a1 >= 0x1555555555555556) {
    sub_100004C24();
  }
  return operator new(12 * a1);
}

void sub_10000CE90(uint64_t a1, void **a2)
{
  uint64_t v4 = *(int **)(a1 + 32);
  ++v4[10];
  uint64_t v5 = sub_10000C164(v4, 0);
  uint64_t v6 = 0;
  uint64_t v8 = *(void *)(a1 + 8);
  uint64_t v7 = *(void *)(a1 + 16);
  long long v9 = (float *)(v8 + 4100 * v7);
  do
  {
    v9[v6] = *(float *)(v5 + 4 * v6);
    ++v6;
  }
  while (v6 != 1025);
  uint64_t v10 = 0;
  float v11 = *v9;
  float v12 = v9[1];
  do
  {
    long long v13 = &v9[v10];
    if (v11 <= v12) {
      float v14 = v12;
    }
    else {
      float v14 = v11;
    }
    float v11 = v12;
    float v12 = v13[2];
    if (v14 <= v12) {
      float v14 = v13[2];
    }
    float *v13 = v14;
    ++v10;
  }
  while (v10 != 1023);
  uint64_t v15 = 0;
  uint64_t v16 = v8 + 4100 * (v7 - 1);
  uint64_t v17 = v8 + 4100 * (v7 - 3);
  uint64_t v18 = v8 + 4100 * (v7 - 6);
  do
  {
    float v19 = *(float *)(v16 + 4 * v15);
    if (v19 <= v9[v15]) {
      float v19 = v9[v15];
    }
    *(float *)(v16 + 4 * v15) = v19;
    if (*(float *)(v17 + 4 * v15) > v19) {
      float v19 = *(float *)(v17 + 4 * v15);
    }
    *(float *)(v17 + 4 * v15) = v19;
    if (*(float *)(v18 + 4 * v15) > v19) {
      float v19 = *(float *)(v18 + 4 * v15);
    }
    *(float *)(v18 + 4 * v15++) = v19;
  }
  while (v15 != 1025);
  if (v7 >= 45)
  {
    uint64_t v50 = sub_10000C164(*(int **)(a1 + 32), -45);
    v49[0] = sub_10000C164(*(int **)(a1 + 32), -47);
    v49[1] = sub_10000C164(*(int **)(a1 + 32), -46);
    uint64_t v51 = sub_10000C164(*(int **)(a1 + 32), -44);
    uint64_t v20 = sub_10000C164(*(int **)(a1 + 32), -43);
    uint64_t v21 = *(void *)(a1 + 8) + 4100 * (*(_DWORD *)(a1 + 16) - 48);
    uint64_t v52 = v20;
    uint64_t v22 = (float *)(v21 + 24);
    uint64_t v23 = v21 + 48;
    for (uint64_t i = 10; i != 1015; ++i)
    {
      float v25 = *(float *)(v50 + 4 * i);
      if (v25 >= 0.015625 && v25 >= *(float *)(v21 + 4 * (i - 1)))
      {
        unint64_t v26 = 0;
        uint64_t v27 = v21 + 4 * i;
        float v28 = *(float *)(v27 - 12);
        if (v28 <= *(float *)(v27 + 4)) {
          float v28 = *(float *)(v27 + 4);
        }
        float v29 = v22;
        do
        {
          if (v28 <= *(float *)(v23 + 4 * v26)) {
            float v28 = *(float *)(v23 + 4 * v26);
          }
          float v30 = *v29;
          v29 -= 3;
          float v31 = v30;
          if (v28 <= v30) {
            float v28 = v31;
          }
          v26 += 3;
        }
        while (v26 < 7);
        if (v25 > v28)
        {
          unint64_t v32 = 0;
          uint64_t v33 = *(void *)(a1 + 16);
          uint64_t v34 = *(void *)(a1 + 8) + 4 * (i - 1);
          if (v28 <= *(float *)(v34 + 4100 * (v33 - 52))) {
            float v28 = *(float *)(v34 + 4100 * (v33 - 52));
          }
          if (v28 <= *(float *)(v34 + 4100 * (v33 - 44))) {
            float v28 = *(float *)(v34 + 4100 * (v33 - 44));
          }
          unsigned __int8 v35 = v33 - 55;
          char v36 = v33 - 41;
          do
          {
            if (v28 <= *(float *)(v34 + 4100 * (v36 + v32))) {
              float v28 = *(float *)(v34 + 4100 * (v36 + v32));
            }
            if (v28 <= *(float *)(v34 + 4100 * v35)) {
              float v28 = *(float *)(v34 + 4100 * v35);
            }
            v32 += 7;
            v35 -= 7;
          }
          while (v32 < 0x26);
          if (v25 > v28)
          {
            uint64_t v53 = 0;
            sub_10000ECA4(v33 - 45, i, v49, &v53, (_WORD *)&v53 + 2, (_WORD *)&v53 + 3, &v55, &v54);
            unint64_t v38 = a2[1];
            unint64_t v37 = (unint64_t)a2[2];
            if ((unint64_t)v38 >= v37)
            {
              uint64_t v40 = ((char *)v38 - (unsigned char *)*a2) >> 3;
              if ((unint64_t)(v40 + 1) >> 61) {
                sub_100004C0C();
              }
              uint64_t v41 = v37 - (void)*a2;
              uint64_t v42 = v41 >> 2;
              if (v41 >> 2 <= (unint64_t)(v40 + 1)) {
                uint64_t v42 = v40 + 1;
              }
              if ((unint64_t)v41 >= 0x7FFFFFFFFFFFFFF8) {
                unint64_t v43 = 0x1FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v43 = v42;
              }
              if (v43) {
                unint64_t v43 = (unint64_t)sub_10000BB4C(v43);
              }
              else {
                uint64_t v44 = 0;
              }
              uint64_t v45 = (void *)(v43 + 8 * v40);
              *uint64_t v45 = v53;
              unint64_t v39 = v45 + 1;
              unint64_t v47 = (char *)*a2;
              uint64_t v46 = (char *)a2[1];
              if (v46 != *a2)
              {
                do
                {
                  uint64_t v48 = *((void *)v46 - 1);
                  v46 -= 8;
                  *--uint64_t v45 = v48;
                }
                while (v46 != v47);
                uint64_t v46 = (char *)*a2;
              }
              *a2 = v45;
              a2[1] = v39;
              a2[2] = (void *)(v43 + 8 * v44);
              if (v46) {
                operator delete(v46);
              }
            }
            else
            {
              void *v38 = v53;
              unint64_t v39 = v38 + 1;
            }
            a2[1] = v39;
          }
        }
      }
      ++v22;
      v23 += 4;
    }
    uint64_t v7 = *(void *)(a1 + 16);
  }
  *(void *)(a1 + 16) = v7 + 1;
}

void sub_10000D238(char **a1, unint64_t a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  unint64_t v5 = (v4 - *a1) >> 3;
  if (a2 <= v5)
  {
    if (a2 >= v5) {
      return;
    }
    float v19 = &v3[8 * a2];
    goto LABEL_19;
  }
  unint64_t v6 = a2 - v5;
  uint64_t v7 = a1[2];
  if (a2 - v5 <= (v7 - v4) >> 3)
  {
    bzero(a1[1], 8 * v6);
    float v19 = &v4[8 * v6];
LABEL_19:
    a1[1] = v19;
    return;
  }
  if (a2 >> 61) {
    sub_100004C0C();
  }
  uint64_t v8 = v7 - v3;
  uint64_t v9 = v8 >> 2;
  if (v8 >> 2 <= a2) {
    uint64_t v9 = a2;
  }
  if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFF8) {
    unint64_t v10 = 0x1FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v10 = v9;
  }
  float v11 = (char *)sub_10000BB4C(v10);
  float v12 = &v11[8 * v5];
  float v14 = &v11[8 * v13];
  bzero(v12, 8 * v6);
  uint64_t v15 = &v12[8 * v6];
  uint64_t v17 = *a1;
  uint64_t v16 = a1[1];
  if (v16 != *a1)
  {
    do
    {
      uint64_t v18 = *((void *)v16 - 1);
      v16 -= 8;
      *((void *)v12 - 1) = v18;
      v12 -= 8;
    }
    while (v16 != v17);
    uint64_t v16 = *a1;
  }
  *a1 = v12;
  a1[1] = v15;
  a1[2] = v14;
  if (v16)
  {
    operator delete(v16);
  }
}

void sub_10000D344(void **a1, unint64_t a2)
{
  if (a2 > ((unsigned char *)a1[2] - (unsigned char *)*a1) >> 2)
  {
    int64_t v3 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    uint64_t v4 = (char *)sub_10000BC88(a2);
    unint64_t v5 = &v4[v3 & 0xFFFFFFFFFFFFFFFCLL];
    uint64_t v7 = &v4[4 * v6];
    uint64_t v8 = (char *)*a1;
    uint64_t v9 = (char *)a1[1];
    unint64_t v10 = v5;
    if (v9 != *a1)
    {
      unint64_t v10 = v5;
      do
      {
        int v11 = *((_DWORD *)v9 - 1);
        v9 -= 4;
        *((_DWORD *)v10 - 1) = v11;
        v10 -= 4;
      }
      while (v9 != v8);
    }
    *a1 = v10;
    a1[1] = v5;
    a1[2] = v7;
    if (v8)
    {
      operator delete(v8);
    }
  }
}

double sub_10000D3E0(uint64_t a1)
{
  bzero(*(void **)a1, 0x20CuLL);
  uint64_t v2 = *(_OWORD **)(a1 + 8);
  if ((v2 & 0xF) != 0)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *(void *)&v5.__val_ = 512;
    v5.__cat_ = (const std::error_category *)&off_10003CB20;
    sub_1000079AC((uint64_t)exception, &v5);
  }
  double result = 0.0;
  v2[30] = 0u;
  v2[31] = 0u;
  v2[28] = 0u;
  v2[29] = 0u;
  v2[26] = 0u;
  v2[27] = 0u;
  v2[24] = 0u;
  v2[25] = 0u;
  v2[22] = 0u;
  v2[23] = 0u;
  v2[20] = 0u;
  v2[21] = 0u;
  v2[18] = 0u;
  v2[19] = 0u;
  v2[16] = 0u;
  v2[17] = 0u;
  v2[14] = 0u;
  v2[15] = 0u;
  v2[12] = 0u;
  v2[13] = 0u;
  v2[10] = 0u;
  v2[11] = 0u;
  v2[8] = 0u;
  v2[9] = 0u;
  v2[6] = 0u;
  v2[7] = 0u;
  v2[4] = 0u;
  v2[5] = 0u;
  v2[2] = 0u;
  v2[3] = 0u;
  _OWORD *v2 = 0u;
  v2[1] = 0u;
  return result;
}

void sub_10000D4A8(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_10000D4BC(uint64_t a1)
{
  bzero(*(void **)a1, 0x80CuLL);
  uint64_t v2 = *(void **)(a1 + 8);
  if ((v2 & 0xF) != 0)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *(void *)&v4.__val_ = 512;
    v4.__cat_ = (const std::error_category *)&off_10003CB20;
    sub_1000079AC((uint64_t)exception, &v4);
  }
  bzero(v2, 0x800uLL);
}

void sub_10000D554(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_10000D568(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  if (a3 >= 1)
  {
    uint64_t v7 = 0;
    uint64_t v8 = a3;
    int v9 = *(_DWORD *)(a1 + 40);
    int v10 = *(_DWORD *)(a1 + 48);
    do
    {
      int v11 = *(_DWORD *)(a2 + 4 * v7);
      uint64_t v12 = *(void *)(a1 + 80);
      uint64_t v13 = (_DWORD *)(v12 + 4 * v9);
      v13[256] = v11;
      _DWORD *v13 = v11;
      int v14 = v10 + 1;
      *(_DWORD *)(a1 + 48) = v10 + 1;
      if (!v10)
      {
        uint64_t v15 = 0;
        uint64_t v16 = v12 + 4 * (v9 - 127);
        float v17 = 0.0;
        do
        {
          float32x4_t v18 = vmulq_f32(*(float32x4_t *)(v16 + v15 * 16), (float32x4_t)xmmword_100016D20[v15]);
          float v17 = (float)((float)((float)(v17 + v18.f32[0]) + v18.f32[1]) + v18.f32[2]) + v18.f32[3];
          ++v15;
        }
        while (v15 != 32);
        uint64_t v20 = *(float **)(a4 + 8);
        unint64_t v19 = *(void *)(a4 + 16);
        if ((unint64_t)v20 >= v19)
        {
          uint64_t v22 = *(float **)a4;
          uint64_t v23 = ((uint64_t)v20 - *(void *)a4) >> 2;
          unint64_t v24 = v23 + 1;
          if ((unint64_t)(v23 + 1) >> 62) {
            sub_100004C0C();
          }
          uint64_t v25 = v19 - (void)v22;
          if (v25 >> 1 > v24) {
            unint64_t v24 = v25 >> 1;
          }
          if ((unint64_t)v25 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v26 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v26 = v24;
          }
          if (v26)
          {
            unint64_t v26 = (unint64_t)sub_10000BC88(v26);
            uint64_t v22 = *(float **)a4;
            uint64_t v20 = *(float **)(a4 + 8);
          }
          else
          {
            uint64_t v27 = 0;
          }
          float v28 = (float *)(v26 + 4 * v23);
          *float v28 = v17;
          uint64_t v21 = v28 + 1;
          while (v20 != v22)
          {
            int v29 = *((_DWORD *)v20-- - 1);
            *((_DWORD *)v28-- - 1) = v29;
          }
          *(void *)a4 = v28;
          *(void *)(a4 + 8) = v21;
          *(void *)(a4 + 16) = v26 + 4 * v27;
          if (v22) {
            operator delete(v22);
          }
        }
        else
        {
          *uint64_t v20 = v17;
          uint64_t v21 = v20 + 1;
        }
        *(void *)(a4 + 8) = v21;
        int v14 = *(_DWORD *)(a1 + 48);
      }
      if (v14 >= 3)
      {
        int v14 = 0;
        *(_DWORD *)(a1 + 48) = 0;
      }
      int v9 = *(_DWORD *)(a1 + 40) + 1;
      *(_DWORD *)(a1 + 40) = v9;
      ++v7;
      int v10 = v14;
    }
    while (v7 != v8);
  }
}

void sub_10000D71C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  if (a3 >= 1)
  {
    uint64_t v6 = 0;
    uint64_t v7 = *(_DWORD **)(a4 + 8);
    uint64_t v8 = a3;
    do
    {
      unint64_t v9 = *(void *)(a4 + 16);
      if ((unint64_t)v7 >= v9)
      {
        int v11 = *(_DWORD **)a4;
        uint64_t v12 = ((uint64_t)v7 - *(void *)a4) >> 2;
        unint64_t v13 = v12 + 1;
        if ((unint64_t)(v12 + 1) >> 62) {
          sub_100004C0C();
        }
        uint64_t v14 = v9 - (void)v11;
        if (v14 >> 1 > v13) {
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
          unint64_t v15 = (unint64_t)sub_10000BC88(v15);
          int v11 = *(_DWORD **)a4;
          uint64_t v7 = *(_DWORD **)(a4 + 8);
        }
        else
        {
          uint64_t v16 = 0;
        }
        float v17 = (_DWORD *)(v15 + 4 * v12);
        *float v17 = *(_DWORD *)(a2 + 4 * v6);
        int v10 = v17 + 1;
        while (v7 != v11)
        {
          int v18 = *--v7;
          *--float v17 = v18;
        }
        *(void *)a4 = v17;
        *(void *)(a4 + 8) = v10;
        *(void *)(a4 + 16) = v15 + 4 * v16;
        if (v11) {
          operator delete(v11);
        }
      }
      else
      {
        *uint64_t v7 = *(_DWORD *)(a2 + 4 * v6);
        int v10 = v7 + 1;
      }
      *(void *)(a4 + 8) = v10;
      ++v6;
      uint64_t v7 = v10;
    }
    while (v6 != v8);
  }
}

void sub_10000D82C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  if (a3 >= 1)
  {
    uint64_t v7 = 0;
    uint64_t v8 = a3;
    int v9 = *(_DWORD *)(a1 + 40);
    do
    {
      int v10 = *(_DWORD *)(a2 + 4 * v7);
      uint64_t v11 = *(void *)(a1 + 80);
      uint64_t v12 = (_DWORD *)(v11 + 4 * v9);
      v12[256] = v10;
      *uint64_t v12 = v10;
      if ((v9 & 1) == 0)
      {
        uint64_t v13 = 0;
        uint64_t v14 = v11 + 4 * (v9 - 95);
        float v15 = 0.0;
        do
        {
          float32x4_t v16 = vmulq_f32(*(float32x4_t *)(v14 + v13 * 16), (float32x4_t)xmmword_100016F80[v13]);
          float v15 = (float)((float)((float)(v15 + v16.f32[0]) + v16.f32[1]) + v16.f32[2]) + v16.f32[3];
          ++v13;
        }
        while (v13 != 24);
        int v18 = *(float **)(a4 + 8);
        unint64_t v17 = *(void *)(a4 + 16);
        if ((unint64_t)v18 >= v17)
        {
          uint64_t v20 = *(float **)a4;
          uint64_t v21 = ((uint64_t)v18 - *(void *)a4) >> 2;
          unint64_t v22 = v21 + 1;
          if ((unint64_t)(v21 + 1) >> 62) {
            sub_100004C0C();
          }
          uint64_t v23 = v17 - (void)v20;
          if (v23 >> 1 > v22) {
            unint64_t v22 = v23 >> 1;
          }
          if ((unint64_t)v23 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v24 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v24 = v22;
          }
          if (v24)
          {
            unint64_t v24 = (unint64_t)sub_10000BC88(v24);
            uint64_t v20 = *(float **)a4;
            int v18 = *(float **)(a4 + 8);
          }
          else
          {
            uint64_t v25 = 0;
          }
          unint64_t v26 = (float *)(v24 + 4 * v21);
          *unint64_t v26 = v15;
          unint64_t v19 = v26 + 1;
          while (v18 != v20)
          {
            int v27 = *((_DWORD *)v18-- - 1);
            *((_DWORD *)v26-- - 1) = v27;
          }
          *(void *)a4 = v26;
          *(void *)(a4 + 8) = v19;
          *(void *)(a4 + 16) = v24 + 4 * v25;
          if (v20) {
            operator delete(v20);
          }
        }
        else
        {
          *int v18 = v15;
          unint64_t v19 = v18 + 1;
        }
        *(void *)(a4 + 8) = v19;
        int v9 = *(_DWORD *)(a1 + 40);
      }
      *(_DWORD *)(a1 + 40) = ++v9;
      ++v7;
    }
    while (v7 != v8);
  }
}

void sub_10000D9BC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  if (a3 >= 1)
  {
    uint64_t v6 = 0;
    uint64_t v7 = a3;
    int v8 = *(_DWORD *)(a1 + 44);
    uint64_t v35 = a2;
    do
    {
      int v9 = *(_DWORD *)(a2 + 4 * v6);
      uint64_t v10 = *(void *)(a1 + 64);
      uint64_t v11 = (_DWORD *)(v10 + 4 * (v8 & 0x3F));
      v11[64] = v9;
      _DWORD *v11 = v9;
      if ((v8 & 1) == 0)
      {
        uint64_t v12 = 0;
        uint64_t v13 = v10 + 4 * (((_BYTE)v8 + 41) & 0x3F);
        float v14 = 0.0;
        do
        {
          float32x4_t v15 = vmulq_f32(*(float32x4_t *)(v13 + v12 * 16), (float32x4_t)xmmword_100016F20[v12]);
          float v14 = (float)((float)((float)(v14 + v15.f32[0]) + v15.f32[1]) + v15.f32[2]) + v15.f32[3];
          ++v12;
        }
        while (v12 != 6);
        int v16 = *(_DWORD *)(a1 + 48);
        int v17 = *(_DWORD *)(a1 + 52);
        int v18 = *(_DWORD *)(a1 + 40);
        unint64_t v19 = (float *)(*(void *)(a1 + 80) + 4 * v18);
        v19[256] = v14;
        float *v19 = v14;
        if (v17 - v16 <= 319)
        {
          do
          {
            uint64_t v20 = 0;
            uint64_t v21 = (char *)&unk_100017100 + 384 * (v16 - v17) + 122496;
            float v22 = 0.0;
            do
            {
              float32x4_t v23 = vmulq_f32(*(float32x4_t *)(*(void *)(a1 + 80) + 4 * (*(_DWORD *)(a1 + 40) - 95) + v20), *(float32x4_t *)&v21[v20]);
              float v22 = (float)((float)((float)(v22 + v23.f32[0]) + v23.f32[1]) + v23.f32[2]) + v23.f32[3];
              v20 += 16;
            }
            while (v20 != 384);
            uint64_t v25 = *(float **)(a4 + 8);
            unint64_t v24 = *(void *)(a4 + 16);
            if ((unint64_t)v25 >= v24)
            {
              int v27 = *(float **)a4;
              uint64_t v28 = ((uint64_t)v25 - *(void *)a4) >> 2;
              unint64_t v29 = v28 + 1;
              if ((unint64_t)(v28 + 1) >> 62) {
                sub_100004C0C();
              }
              uint64_t v30 = v24 - (void)v27;
              if (v30 >> 1 > v29) {
                unint64_t v29 = v30 >> 1;
              }
              if ((unint64_t)v30 >= 0x7FFFFFFFFFFFFFFCLL) {
                unint64_t v31 = 0x3FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v31 = v29;
              }
              if (v31)
              {
                unint64_t v31 = (unint64_t)sub_10000BC88(v31);
                int v27 = *(float **)a4;
                uint64_t v25 = *(float **)(a4 + 8);
              }
              else
              {
                uint64_t v32 = 0;
              }
              uint64_t v33 = (float *)(v31 + 4 * v28);
              float *v33 = v22;
              unint64_t v26 = v33 + 1;
              while (v25 != v27)
              {
                int v34 = *((_DWORD *)v25-- - 1);
                *((_DWORD *)v33-- - 1) = v34;
              }
              *(void *)a4 = v33;
              *(void *)(a4 + 8) = v26;
              *(void *)(a4 + 16) = v31 + 4 * v32;
              if (v27) {
                operator delete(v27);
              }
            }
            else
            {
              float *v25 = v22;
              unint64_t v26 = v25 + 1;
            }
            *(void *)(a4 + 8) = v26;
            int v16 = *(_DWORD *)(a1 + 48);
            int v17 = *(_DWORD *)(a1 + 52) + 441;
            *(_DWORD *)(a1 + 52) = v17;
          }
          while (v17 - v16 < 320);
          int v18 = *(_DWORD *)(a1 + 40);
          int v8 = *(_DWORD *)(a1 + 44);
        }
        *(_DWORD *)(a1 + 48) = v16 + 320;
        *(_DWORD *)(a1 + 40) = v18 + 1;
        a2 = v35;
      }
      *(_DWORD *)(a1 + 44) = ++v8;
      ++v6;
    }
    while (v6 != v7);
  }
}

void sub_10000DC0C(void *a1)
{
  a1[2] = 0;
  a1[3] = 0;
  a1[4] = 0;
  operator new[]();
}

void sub_10000DDC4(_Unwind_Exception *a1)
{
  __cxa_free_exception(v5);
  if (*v4) {
    operator delete[]();
  }
  if (*v3) {
    operator delete[]();
  }
  uint64_t v7 = *v2;
  if (*v2)
  {
    *(void *)(v1 + 24) = v7;
    operator delete(v7);
  }
  _Unwind_Resume(a1);
}

void sub_10000DE38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = a1 + 16;
  *(void *)(a1 + 24) = *(void *)(a1 + 16);
  uint64_t v7 = *(void (**)(void *, uint64_t, uint64_t, uint64_t))a1;
  uint64_t v8 = *(void *)(a1 + 8);
  int v9 = (void *)(a1 + (v8 >> 1));
  if (v8) {
    uint64_t v7 = *(void (**)(void *, uint64_t, uint64_t, uint64_t))(*v9 + v7);
  }
  v7(v9, a2, a3, v6);
  uint64_t v10 = *(char **)(a4 + 8);
  uint64_t v11 = *(char **)(a1 + 16);
  uint64_t v12 = *(char **)(a1 + 24);
  sub_10000DEB0(a4, v10, v11, v12, (v12 - v11) >> 2);
}

void sub_10000DEB0(uint64_t a1, char *__dst, char *__src, char *a4, uint64_t a5)
{
  if (a5 < 1) {
    return;
  }
  uint64_t v6 = __src;
  unint64_t v10 = *(void *)(a1 + 8);
  uint64_t v9 = *(void *)(a1 + 16);
  if (a5 > (uint64_t)(v9 - v10) >> 2)
  {
    uint64_t v11 = *(char **)a1;
    unint64_t v12 = a5 + ((uint64_t)(v10 - *(void *)a1) >> 2);
    if (v12 >> 62) {
      sub_100004C0C();
    }
    uint64_t v13 = (__dst - v11) >> 2;
    uint64_t v14 = v9 - (void)v11;
    if (v14 >> 1 > v12) {
      unint64_t v12 = v14 >> 1;
    }
    if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v15 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v15 = v12;
    }
    if (v15) {
      unint64_t v15 = (unint64_t)sub_10000BC88(v15);
    }
    else {
      uint64_t v16 = 0;
    }
    unint64_t v26 = (_DWORD *)(v15 + 4 * v13);
    int v27 = (char *)&v26[a5];
    uint64_t v28 = 4 * a5;
    unint64_t v29 = v26;
    do
    {
      int v30 = *(_DWORD *)v6;
      v6 += 4;
      *v29++ = v30;
      v28 -= 4;
    }
    while (v28);
    unint64_t v31 = *(char **)a1;
    if (*(char **)a1 != __dst)
    {
      uint64_t v32 = __dst;
      do
      {
        int v33 = *((_DWORD *)v32 - 1);
        v32 -= 4;
        *--unint64_t v26 = v33;
      }
      while (v32 != v31);
    }
    unint64_t v34 = v15 + 4 * v16;
    uint64_t v35 = *(unsigned char **)(a1 + 8);
    uint64_t v36 = v35 - __dst;
    if (v35 != __dst) {
      memmove(v27, __dst, v35 - __dst);
    }
    unint64_t v37 = *(char **)a1;
    *(void *)a1 = v26;
    *(void *)(a1 + 8) = &v27[v36];
    *(void *)(a1 + 16) = v34;
    if (v37)
    {
      operator delete(v37);
    }
    return;
  }
  uint64_t v17 = v10 - (void)__dst;
  uint64_t v18 = (uint64_t)(v10 - (void)__dst) >> 2;
  if (v18 >= a5)
  {
    unint64_t v19 = &__src[4 * a5];
    uint64_t v21 = *(char **)(a1 + 8);
LABEL_17:
    float v22 = &__dst[4 * a5];
    float32x4_t v23 = &v21[-4 * a5];
    unint64_t v24 = v21;
    if ((unint64_t)v23 < v10)
    {
      unint64_t v24 = v21;
      do
      {
        int v25 = *(_DWORD *)v23;
        v23 += 4;
        *(_DWORD *)unint64_t v24 = v25;
        v24 += 4;
      }
      while ((unint64_t)v23 < v10);
    }
    *(void *)(a1 + 8) = v24;
    if (v21 != v22) {
      memmove(&v21[-4 * ((v21 - v22) >> 2)], __dst, v21 - v22);
    }
    if (v19 != v6)
    {
      memmove(__dst, v6, v19 - v6);
    }
    return;
  }
  unint64_t v19 = &__src[4 * v18];
  int64_t v20 = a4 - v19;
  if (a4 != v19) {
    memmove(*(void **)(a1 + 8), &__src[4 * v18], a4 - v19);
  }
  uint64_t v21 = (char *)(v10 + v20);
  *(void *)(a1 + 8) = v10 + v20;
  if (v17 >= 1) {
    goto LABEL_17;
  }
}

void sub_10000E0C0(void *a1, uint64_t a2, int a3, uint64_t a4)
{
  if (a1[1]) {
    BOOL v4 = (a1[1] & 1 | *a1) == 0;
  }
  else {
    BOOL v4 = 1;
  }
  int v5 = v4;
  if (*a1) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v5 == 0;
  }
  if (!v6)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *(void *)&v15.__val_ = 517;
    v15.__cat_ = (const std::error_category *)&off_10003CB20;
    sub_1000079AC((uint64_t)exception, &v15);
  }
  int v7 = a3;
  if (a3 >= 1)
  {
    do
    {
      uint64_t v11 = 0;
      if (v7 >= 64) {
        uint64_t v12 = 64;
      }
      else {
        uint64_t v12 = v7;
      }
      do
      {
        *((float *)&v15.__val_ + v11) = (float)*(__int16 *)(a2 + 2 * v11);
        ++v11;
      }
      while (v12 != v11);
      sub_10000DE38((uint64_t)a1, (uint64_t)&v15, v12, a4);
      a2 += 2 * v12;
      BOOL v13 = __OFSUB__(v7, v12);
      v7 -= v12;
    }
    while (!((v7 < 0) ^ v13 | (v7 == 0)));
  }
}

void sub_10000E1F8(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_10000E214(void *a1, char *__src, int a3, uint64_t a4)
{
  if (a1[1]) {
    BOOL v4 = (a1[1] & 1 | *a1) == 0;
  }
  else {
    BOOL v4 = 1;
  }
  int v5 = v4;
  if (*a1) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v5 == 0;
  }
  if (!v6)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *(void *)&__dst[0].__val_ = 517;
    __dst[0].__cat_ = (const std::error_category *)&off_10003CB20;
    sub_1000079AC((uint64_t)exception, __dst);
  }
  int v7 = a3;
  if (a3 >= 1)
  {
    do
    {
      if (v7 >= 64) {
        uint64_t v11 = 64;
      }
      else {
        uint64_t v11 = v7;
      }
      if ((int)v11 <= 1) {
        unsigned int v12 = 1;
      }
      else {
        unsigned int v12 = v11;
      }
      memcpy(__dst, __src, 4 * v12);
      sub_10000DE38((uint64_t)a1, (uint64_t)__dst, v11, a4);
      __src += 4 * v11;
      BOOL v13 = __OFSUB__(v7, v11);
      v7 -= v11;
    }
    while (!((v7 < 0) ^ v13 | (v7 == 0)));
  }
}

void sub_10000E344(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void *sub_10000E360@<X0>(int a1@<W1>, void *a2@<X8>)
{
  if (a1 > 199)
  {
    switch(a1)
    {
      case 300:
        uint64_t v2 = "Invalid - No audio in signature";
        break;
      case 301:
        uint64_t v2 = "Invalid - No peaks in signature";
        break;
      case 302:
        uint64_t v2 = "Invalid - Sig header has 0 length";
        break;
      case 303:
        uint64_t v2 = "Invalid - First peak and last peak less than 0.5 seconds apart";
        break;
      default:
        if (a1 == 400) {
          uint64_t v2 = "Invalid - Peak Density is too high";
        }
        else {
LABEL_45:
        }
          uint64_t v2 = "unknown";
        break;
    }
  }
  else
  {
    switch(a1)
    {
      case 100:
        uint64_t v2 = "Unknown Error";
        break;
      case 101:
        uint64_t v2 = "Invalid - Zero byte sig";
        break;
      case 102:
        uint64_t v2 = "Invalid - Could not parse binary sig data";
        break;
      case 103:
        uint64_t v2 = "Invalid - Magic key doesn't match expected";
        break;
      case 104:
        uint64_t v2 = "Invalid - Sumo sig info block has the wrong size";
        break;
      case 105:
        uint64_t v2 = "Invalid - Sig smaller than smallest possible sig";
        break;
      case 106:
        uint64_t v2 = "Invalid - Unable to dump legacy sig";
        break;
      case 107:
        uint64_t v2 = "Invalid - Unable to dump sumo sig";
        break;
      case 108:
        uint64_t v2 = "Invalid - Unable to dump banded sig";
        break;
      case 109:
        uint64_t v2 = "Invalid - Number of Bands not equal between rv and bands";
        break;
      case 110:
        uint64_t v2 = "Invalid - Wrong number of bands.";
        break;
      case 111:
        uint64_t v2 = "Invalid - Size in start header not found";
        break;
      case 112:
        uint64_t v2 = "Invalid - Fp data header pkt size incorrect";
        break;
      case 113:
        uint64_t v2 = "Invalid - Leftover bytes smaller than EXT_HEADER_TYPE";
        break;
      case 114:
        uint64_t v2 = "Invalid - Malformed header chain";
        break;
      case 115:
        uint64_t v2 = "Invalid - no header to extract sumo peaks from";
        break;
      case 116:
        uint64_t v2 = "Invalid - Can only extract sumo peaks from a sumo signature";
        break;
      case 117:
        uint64_t v2 = "Invalid - no header to extract fat peaks from";
        break;
      case 118:
        uint64_t v2 = "Invalid - Can only extract fat peaks from a sumo/fat signature";
        break;
      case 119:
        uint64_t v2 = "Invalid - Unpacked sig has no header to extract peaks from";
        break;
      case 120:
        uint64_t v2 = "Invalid - Payload type of fat/sumo doesn't match sig header";
        break;
      case 121:
        uint64_t v2 = "Invalid - Unknown header error";
        break;
      case 122:
        uint64_t v2 = "Invalid - Legacy sig info missing";
        break;
      case 123:
        uint64_t v2 = "Invalid - Legacy sig info size mismatch";
        break;
      case 124:
        uint64_t v2 = "Invalid - Error decompressing signature, could not get header of each band";
        break;
      case 125:
        uint64_t v2 = "Invalid - Could not get ancient sig fp data header";
        break;
      case 126:
        uint64_t v2 = "Error when reducing density of the signature";
        break;
      case 127:
        uint64_t v2 = "Error when calculating freq curvature: non positive value";
        break;
      case 128:
        uint64_t v2 = "Error when calculating time curvature: negative value";
        break;
      case 129:
        uint64_t v2 = "Error when filling sumo patch: patch size must be 5";
        break;
      case 130:
        uint64_t v2 = "Error when filling sumo patch: invalid position into patch";
        break;
      case 131:
        uint64_t v2 = "Error when decoding sumo peaks: sumo peak too small";
        break;
      default:
        if (a1) {
          goto LABEL_45;
        }
        uint64_t v2 = "Success";
        break;
    }
  }
  return sub_100004B5C(a2, v2);
}

const char *sub_10000E6A0()
{
  return "signature validation";
}

void sub_10000E6AC(std::error_category *a1)
{
  std::error_category::~error_category(a1);
  operator delete();
}

void sub_10000E6E8(std::runtime_error *a1)
{
  std::runtime_error::~runtime_error(a1);
  operator delete();
}

uint64_t sub_10000E720(uint64_t a1, const std::error_code *a2, const void **a3)
{
  sub_100004B5C(&__p, (char *)&unk_100037001);
  int v6 = *((char *)a3 + 23);
  if (v6 >= 0) {
    size_t v7 = *((unsigned __int8 *)a3 + 23);
  }
  else {
    size_t v7 = (size_t)a3[1];
  }
  if (v7)
  {
    unint64_t v8 = v7 + 1;
    if (v7 + 1 >= 0x7FFFFFFFFFFFFFF8) {
      sub_100004380();
    }
    if (v8 > 0x16)
    {
      uint64_t v10 = (v8 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v8 | 7) != 0x17) {
        uint64_t v10 = v8 | 7;
      }
      uint64_t v11 = v10 + 1;
      uint64_t v9 = (char *)operator new(v10 + 1);
      v19.__r_.__value_.__l.__size_ = v7 + 1;
      v19.__r_.__value_.__r.__words[2] = v11 | 0x8000000000000000;
      v19.__r_.__value_.__r.__words[0] = (std::string::size_type)v9;
    }
    else
    {
      memset(&v19, 0, sizeof(v19));
      *((unsigned char *)&v19.__r_.__value_.__s + 23) = v7 + 1;
      if ((v8 & 0x80u) == 0) {
        uint64_t v9 = (char *)&v19;
      }
      else {
        uint64_t v9 = 0;
      }
    }
    if (v6 >= 0) {
      unsigned int v12 = a3;
    }
    else {
      unsigned int v12 = *a3;
    }
    memmove(v9, v12, v7);
    *(_WORD *)&v9[v7] = 32;
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    std::string __p = v19;
  }
  std::error_code::message(&v19, a2);
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
  std::error_code v15 = std::string::insert(&v19, 0, (const std::string::value_type *)p_p, size);
  long long v16 = *(_OWORD *)&v15->__r_.__value_.__l.__data_;
  v18.__r_.__value_.__r.__words[2] = v15->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v18.__r_.__value_.__l.__data_ = v16;
  v15->__r_.__value_.__l.__size_ = 0;
  v15->__r_.__value_.__r.__words[2] = 0;
  v15->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v19.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v19.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  std::runtime_error::runtime_error((std::runtime_error *)a1, &v18);
  if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v18.__r_.__value_.__l.__data_);
  }
  *(void *)a1 = &off_1000384A8;
  *(std::error_code *)(a1 + 16) = *a2;
  return a1;
}

void sub_10000E8F0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  if (a26 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_10000E93C(uint64_t a1, std::error_code *this)
{
  std::error_code::message(&v5, this);
  std::runtime_error::runtime_error((std::runtime_error *)a1, &v5);
  if (SHIBYTE(v5.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v5.__r_.__value_.__l.__data_);
  }
  *(void *)a1 = &off_1000384A8;
  *(std::error_code *)(a1 + 16) = *this;
  return a1;
}

void sub_10000E9B8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_10000E9D4(unint64_t a1, unint64_t a2, unint64_t *a3, unint64_t *a4)
{
  if (a1 == 2 && a2 == 2 || (a1 & 0xFFFFFFFFFFFFFFFBLL) == 0 && a2 != 2 || a1 != 2 && (a2 & 0xFFFFFFFFFFFFFFFBLL) == 0) {
    return 0;
  }
  *a3 = a1;
  *a4 = a2;
  if (a1 == 2)
  {
    unint64_t v5 = a2 - 1;
    if (a2 <= 1) {
      unint64_t v5 = a2 + 1;
    }
    *a4 = v5;
  }
  else
  {
    unint64_t v6 = *a3;
    if (a1 > 1) {
      unint64_t v7 = v6 - 1;
    }
    else {
      unint64_t v7 = v6 + 1;
    }
    *a3 = v7;
  }
  return 1;
}

uint64_t sub_10000EA54(unsigned int a1, uint64_t a2, uint64_t a3)
{
  if (a1 < 0xD0) {
    return 0;
  }
  uint64_t v4 = 0;
  unint64_t v5 = 0;
  LODWORD(v3) = 0;
  unint64_t v22 = a1 / 0xD0uLL;
  uint64_t v6 = a2;
  uint64_t v23 = a2;
  do
  {
    unint64_t v7 = (unsigned int *)(a2 + 208 * v4);
    unint64_t v8 = *v7;
    if (v5 > v8)
    {
      sub_100004064(&std::cerr, (uint64_t)"\nError: time must be greater or equal than previous_time.\n", 58);
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "time must be greater or equal than previous_time.");
    }
    uint64_t v9 = a3 + v3;
    unsigned int v10 = v8 - v5;
    if (v10 > 0xFE)
    {
      *(_DWORD *)(v9 + 1) = v10;
      unsigned int v11 = 5;
      LOBYTE(v10) = -1;
    }
    else
    {
      unsigned int v11 = 1;
    }
    unint64_t v12 = 0;
    unsigned int v13 = 0;
    *(unsigned char *)uint64_t v9 = v10;
    *(_WORD *)(v9 + v11) = *((_WORD *)v7 + 2);
    *(_WORD *)(v9 + (v11 | 2)) = *((_WORD *)v7 + 3);
    uint64_t v25 = v11 + 4;
    uint64_t v14 = v9 + v25;
    uint64_t v15 = v6;
    do
    {
      for (unint64_t i = 0; i != 5; ++i)
      {
        unint64_t v27 = 0;
        if (sub_10000E9D4(v12, i, &v27, &v26))
        {
          uint64_t v17 = v15 + 4 * i;
          std::string v18 = (_WORD *)(v14 + v13);
          *std::string v18 = (int)fmaxf(fminf((float)((float)(*(float *)(v17 + 8) + 65536.0) * 0.0000076294) * 65536.0, 65535.0), 0.0);
          v18[1] = (int)fmaxf(fminf((float)((float)(*(float *)(v17 + 108) + 3.1416) / 6.2832) * 65536.0, 65535.0), 0.0);
          int v19 = 4;
        }
        else
        {
          int v19 = 0;
        }
        v13 += v19;
      }
      ++v12;
      v15 += 20;
    }
    while (v12 != 5);
    uint64_t v3 = v13 + v25 + v3;
    unint64_t v5 = *v7;
    ++v4;
    v6 += 208;
    a2 = v23;
  }
  while (v4 != v22);
  return v3;
}

void sub_10000EC90(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

float sub_10000ECA4(int a1, unsigned int a2, void *a3, _DWORD *a4, _WORD *a5, _WORD *a6, _WORD *a7, _WORD *a8)
{
  __int16 v13 = a2;
  uint64_t v15 = a3[2];
  float v16 = fmaxf(*(float *)(v15 + 4 * a2), 0.015625);
  float v17 = fmaxf(*(float *)(v15 + 4 * (a2 + 1)), 0.015625);
  float v18 = fmaxf(*(float *)(a3[1] + 4 * a2), 0.015625);
  float v19 = fmaxf(*(float *)(a3[3] + 4 * a2), 0.015625);
  float v20 = (float)(logf(fmaxf(*(float *)(v15 + 4 * (a2 - 1)), 0.015625)) + 4.1589) * 1477.3;
  float v21 = (float)(logf(v16) + 4.1589) * 1477.3;
  float v22 = (float)(logf(v17) + 4.1589) * 1477.3;
  float v23 = logf(v18);
  float v24 = logf(v19);
  float v25 = -(float)((float)(v20 + v22) - (float)(v21 * 2.0));
  if (v25 <= 0.0)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *(void *)&v29.__val_ = 127;
    v29.__cat_ = (const std::error_category *)&off_10003CB28;
    sub_10000E93C((uint64_t)exception, &v29);
    goto LABEL_6;
  }
  float v26 = -(float)((float)((float)((float)(v23 + 4.1589) * 1477.3) + (float)((float)(v24 + 4.1589) * 1477.3))
               - (float)(v21 * 2.0));
  if (v26 < 0.0)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *(void *)&v29.__val_ = 128;
    v29.__cat_ = (const std::error_category *)&off_10003CB28;
    sub_10000E93C((uint64_t)exception, &v29);
LABEL_6:
  }
  *a4 = a1;
  *a6 = (int)v21;
  *a5 = (int)(float)((float)((float)(v22 - v20) * 32.0) / v25) + (v13 << 6);
  float result = v26 + v26;
  *a7 = (int)v25;
  *a8 = (int)result;
  return result;
}

void sub_10000EE88(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void *sub_10000EEA0(unint64_t a1)
{
  if (a1 >= 0x3333333333333334) {
    sub_100004C24();
  }
  return operator new(5 * a1);
}

void sub_10000EEE0()
{
}

void sub_10000EF64()
{
}

uint64_t sub_10000EFE8(uint64_t *a1, unint64_t a2, int a3, unint64_t a4)
{
  unint64_t v39 = 0;
  uint64_t v40 = 0;
  uint64_t v41 = 0;
  sub_100004940((uint64_t)&v39, a4);
  sub_10000F3E4(a1, (uint64_t *)&v39, a2, a3, v7);
  uint64_t v42 = 0;
  if (0xAAAAAAAAAAAAAAABLL * (v40 - v39) - 5 >= 0xFFFFFFFFFFFFFFFELL && v40 != v39)
  {
    uint64_t v9 = 0;
    unsigned int v10 = 0;
    uint64_t v12 = *v39;
    uint64_t v11 = v39[1];
    uint64_t v13 = v11 - *v39;
    if (v11 != *v39)
    {
      uint64_t v38 = *v39;
      if (v13 >> 2)
      {
        if (v13 < 0) {
          sub_100004C0C();
        }
        uint64_t v14 = (char *)sub_10000EEA0(v13 >> 2);
        unsigned int v10 = &v14[5 * v15];
        uint64_t v9 = v14;
        uint64_t v12 = v38;
      }
      unsigned int v16 = 0;
      unint64_t v17 = 0;
      unint64_t v18 = v13 >> 3;
      float v19 = v9;
      uint64_t v37 = v13 >> 3;
      do
      {
        unsigned int v20 = v16;
        unsigned int v16 = *(_DWORD *)(v12 + 8 * v17);
        char v21 = v16 - v20;
        if (v16 - v20 >= 0xFF)
        {
          unsigned int v24 = v16 >> 8;
          unsigned int v25 = HIWORD(v16);
          char v21 = -1;
          unsigned int v23 = *(_DWORD *)(v12 + 8 * v17);
          unsigned int v26 = HIBYTE(v16);
        }
        else
        {
          uint64_t v22 = v12 + 8 * v17;
          unsigned int v23 = *(unsigned __int16 *)(v22 + 6);
          unsigned int v24 = v23 >> 8;
          unsigned int v25 = *(unsigned __int16 *)(v22 + 4);
          unsigned int v26 = v25 >> 8;
          ++v17;
        }
        if (v19 >= v10)
        {
          unint64_t v27 = 0xCCCCCCCCCCCCCCCDLL * (v19 - v9) + 1;
          if (v27 >= 0x3333333333333334) {
            sub_100004C0C();
          }
          if (0x999999999999999ALL * (v10 - v9) > v27) {
            unint64_t v27 = 0x999999999999999ALL * (v10 - v9);
          }
          if (0xCCCCCCCCCCCCCCCDLL * (v10 - v9) >= 0x1999999999999999) {
            unint64_t v28 = 0x3333333333333333;
          }
          else {
            unint64_t v28 = v27;
          }
          if (v28) {
            unint64_t v28 = (unint64_t)sub_10000EEA0(v28);
          }
          else {
            uint64_t v29 = 0;
          }
          int v30 = (char *)(v28 + v19 - v9);
          *int v30 = v21;
          v30[1] = v23;
          v30[2] = v24;
          v30[3] = v25;
          v30[4] = v26;
          unint64_t v31 = v30;
          while (v19 != v9)
          {
            int v32 = *(_DWORD *)(v19 - 5);
            v19 -= 5;
            char v33 = v19[4];
            *(_DWORD *)(v31 - 5) = v32;
            v31 -= 5;
            v31[4] = v33;
          }
          unsigned int v10 = (char *)(v28 + 5 * v29);
          float v19 = v30 + 5;
          if (v9)
          {
            unint64_t v34 = v9;
            uint64_t v35 = v10;
            operator delete(v34);
            unsigned int v10 = v35;
          }
          uint64_t v9 = v31;
          unint64_t v18 = v37;
          uint64_t v12 = v38;
        }
        else
        {
          char *v19 = v21;
          v19[1] = v23;
          v19[2] = v24;
          v19[3] = v25;
          v19[4] = v26;
          v19 += 5;
        }
      }
      while (v17 < v18);
    }
    operator new[]();
  }
  uint64_t v42 = (void **)&v39;
  sub_100009E7C(&v42);
  return 0;
}

void sub_10000F3A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, void **a16)
{
  a16 = (void **)&a13;
  sub_100009E7C(&a16);
  _Unwind_Resume(a1);
}

void sub_10000F3E4(uint64_t *a1, uint64_t *a2, unint64_t a3, int a4, float a5)
{
  uint64_t v5 = -45;
  if (!a4) {
    uint64_t v5 = 0;
  }
  unint64_t v81 = v5;
  uint64_t v7 = *a2;
  uint64_t v6 = a2[1];
  if (0xAAAAAAAAAAAAAAABLL * ((v6 - *a2) >> 3) - 3 >= 2)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *(void *)&v82.__val_ = 110;
    v82.__cat_ = (const std::error_category *)&off_10003CB28;
    sub_10000E93C((uint64_t)exception, &v82);
  }
  unint64_t v8 = a3;
  unsigned int v10 = a1;
  uint64_t v11 = 0;
  if (v6 == v7)
  {
    uint64_t v7 = a2[1];
  }
  else
  {
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    unint64_t v14 = 0;
    do
    {
      if (v12 >= v13)
      {
        uint64_t v16 = (v12 - v11) >> 2;
        unint64_t v17 = v16 + 1;
        if ((unint64_t)(v16 + 1) >> 62) {
          sub_100004C0C();
        }
        if ((v13 - v11) >> 1 > v17) {
          unint64_t v17 = (v13 - v11) >> 1;
        }
        if ((unint64_t)(v13 - v11) >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v18 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v18 = v17;
        }
        if (v18)
        {
          if (v18 >> 62) {
            sub_100004C24();
          }
          float v19 = (char *)operator new(4 * v18);
          unsigned int v10 = a1;
        }
        else
        {
          float v19 = 0;
        }
        unsigned int v20 = &v19[4 * v16];
        *(_DWORD *)unsigned int v20 = 0;
        uint64_t v15 = v20 + 4;
        while (v12 != v11)
        {
          int v21 = *((_DWORD *)v12 - 1);
          v12 -= 4;
          *((_DWORD *)v20 - 1) = v21;
          v20 -= 4;
        }
        uint64_t v13 = &v19[4 * v18];
        if (v11)
        {
          operator delete(v11);
          unsigned int v10 = a1;
          uint64_t v7 = *a2;
          uint64_t v6 = a2[1];
        }
        uint64_t v11 = v20;
        unint64_t v8 = a3;
      }
      else
      {
        *(_DWORD *)uint64_t v12 = 0;
        uint64_t v15 = v12 + 4;
      }
      ++v14;
      uint64_t v12 = v15;
    }
    while (v14 < 0xAAAAAAAAAAAAAAABLL * ((v6 - v7) >> 3));
  }
  uint64_t v22 = *v10;
  uint64_t v23 = v10[1];
  if (v23 != *v10)
  {
    unint64_t v24 = 0;
    uint64_t v25 = 0;
    do
    {
      unsigned int v26 = (unsigned int *)(v22 + 8 * v24);
      unint64_t v27 = *v26;
      v81 += 256;
      if (v81 > v27)
      {
        do
        {
          if (v25 > (uint64_t)v27)
          {
            uint64_t v76 = __cxa_allocate_exception(0x20uLL);
            *(void *)&v82.__val_ = 201;
            v82.__cat_ = (const std::error_category *)&off_10003CB28;
            sub_10000E93C((uint64_t)v76, &v82);
          }
          uint64_t v28 = *a2;
          unint64_t v29 = 0xAAAAAAAAAAAAAAABLL * ((a2[1] - *a2) >> 3);
          if (v29 - 3 >= 2)
          {
            uint64_t v77 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
            std::runtime_error::runtime_error(v77, "Wrong number of bands.");
          }
          uint64_t v30 = 0;
          LOWORD(a5) = *((_WORD *)v26 + 2);
          a5 = (float)((float)LODWORD(a5) * 7.8125) * 0.015625;
          while (a5 >= flt_100035100[v30])
          {
            if (++v30 > v29)
            {
              if (a5 != flt_100035100[0xEAAAAAAAAAAAAAABLL * ((a2[1] - *a2) >> 3)]) {
                goto LABEL_71;
              }
              uint64_t v31 = v28 + 8 * ((a2[1] - *a2) >> 3);
              unint64_t v34 = *(void *)(v31 - 8);
              char v33 = (void *)(v31 - 8);
              unint64_t v32 = v34;
              uint64_t v35 = (void **)(v33 - 1);
              uint64_t v36 = (void *)*(v33 - 1);
              if ((unint64_t)v36 >= v34)
              {
                uint64_t v37 = (void **)(v33 - 2);
                uint64_t v38 = *(v33 - 2);
                uint64_t v39 = ((uint64_t)v36 - v38) >> 3;
                if (!((unint64_t)(v39 + 1) >> 61))
                {
                  uint64_t v40 = v32 - v38;
                  uint64_t v41 = v40 >> 2;
                  if (v40 >> 2 <= (unint64_t)(v39 + 1)) {
                    uint64_t v41 = v39 + 1;
                  }
                  if ((unint64_t)v40 >= 0x7FFFFFFFFFFFFFF8) {
                    unint64_t v42 = 0x1FFFFFFFFFFFFFFFLL;
                  }
                  else {
                    unint64_t v42 = v41;
                  }
                  if (v42) {
                    unint64_t v42 = (unint64_t)sub_10000BB4C(v42);
                  }
                  else {
                    uint64_t v43 = 0;
                  }
                  uint64_t v52 = (void *)(v42 + 8 * v39);
                  void *v52 = *(void *)v26;
                  unint64_t v47 = v52 + 1;
                  uint64_t v53 = (char *)*v35;
                  uint64_t v56 = (char *)*v37;
                  if (*v35 != *v37)
                  {
                    unint64_t v8 = a3;
                    do
                    {
                      uint64_t v57 = *((void *)v53 - 1);
                      v53 -= 8;
                      *--uint64_t v52 = v57;
                    }
                    while (v53 != v56);
                    goto LABEL_65;
                  }
LABEL_66:
                  unint64_t v8 = a3;
                  goto LABEL_67;
                }
LABEL_98:
                sub_100004C0C();
              }
LABEL_47:
              void *v36 = *(void *)v26;
              unint64_t v47 = v36 + 1;
              goto LABEL_70;
            }
          }
          if (!v30) {
            goto LABEL_71;
          }
          uint64_t v44 = v28 + 24 * v30;
          unint64_t v46 = *(void *)(v44 - 8);
          char v33 = (void *)(v44 - 8);
          unint64_t v45 = v46;
          uint64_t v35 = (void **)(v33 - 1);
          uint64_t v36 = (void *)*(v33 - 1);
          if ((unint64_t)v36 < v46) {
            goto LABEL_47;
          }
          uint64_t v37 = (void **)(v33 - 2);
          uint64_t v48 = *(v33 - 2);
          uint64_t v49 = ((uint64_t)v36 - v48) >> 3;
          if ((unint64_t)(v49 + 1) >> 61) {
            goto LABEL_98;
          }
          uint64_t v50 = v45 - v48;
          uint64_t v51 = v50 >> 2;
          if (v50 >> 2 <= (unint64_t)(v49 + 1)) {
            uint64_t v51 = v49 + 1;
          }
          if ((unint64_t)v50 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v42 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v42 = v51;
          }
          if (v42) {
            unint64_t v42 = (unint64_t)sub_10000BB4C(v42);
          }
          else {
            uint64_t v43 = 0;
          }
          uint64_t v52 = (void *)(v42 + 8 * v49);
          void *v52 = *(void *)v26;
          unint64_t v47 = v52 + 1;
          uint64_t v53 = (char *)*v35;
          __int16 v54 = (char *)*v37;
          if (*v35 == *v37) {
            goto LABEL_66;
          }
          unint64_t v8 = a3;
          do
          {
            uint64_t v55 = *((void *)v53 - 1);
            v53 -= 8;
            *--uint64_t v52 = v55;
          }
          while (v53 != v54);
LABEL_65:
          uint64_t v53 = (char *)*v37;
LABEL_67:
          char *v37 = v52;
          char *v35 = v47;
          void *v33 = v42 + 8 * v43;
          if (v53) {
            operator delete(v53);
          }
          unsigned int v10 = a1;
LABEL_70:
          char *v35 = v47;
LABEL_71:
          uint64_t v22 = *v10;
          uint64_t v23 = v10[1];
          uint64_t v25 = *(unsigned int *)(*v10 + 8 * v24++);
          if (v24 >= (v23 - *v10) >> 3) {
            break;
          }
          unsigned int v26 = (unsigned int *)(v22 + 8 * v24);
          unint64_t v27 = *v26;
        }
        while (v81 > v27);
        uint64_t v7 = *a2;
        uint64_t v6 = a2[1];
      }
      if (v6 == v7)
      {
        uint64_t v6 = v7;
      }
      else
      {
        uint64_t v58 = 0;
        unint64_t v59 = 0;
        do
        {
          uint64_t v61 = *(void *)(v7 + v58);
          unint64_t v60 = *(uint64_t **)(v7 + v58 + 8);
          unint64_t v62 = (unint64_t)v60 - v61;
          unint64_t v63 = ((uint64_t)v60 - v61) >> 3;
          unint64_t v64 = *(unsigned int *)&v11[4 * v59];
          BOOL v65 = v63 >= v64;
          unint64_t v66 = v63 - v64;
          if (!v65)
          {
            uint64_t v75 = __cxa_allocate_exception(0x20uLL);
            *(void *)&v82.__val_ = 126;
            v82.__cat_ = (const std::error_category *)&off_10003CB28;
            sub_10000E93C((uint64_t)v75, &v82);
          }
          if (v8 && v66 > v8)
          {
            uint64_t v67 = v61 + 8 * (int)v64;
            unint64_t v68 = 126 - 2 * __clz(((uint64_t)v60 - v67) >> 3);
            *(void *)&v82.__val_ = sub_10000BB24;
            if (v60 == (uint64_t *)v67) {
              uint64_t v69 = 0;
            }
            else {
              uint64_t v69 = v68;
            }
            sub_10000A0CC(v67, v60, (uint64_t (**)(uint64_t *, uint64_t *))&v82, v69, 1);
            sub_10000D238((char **)(*a2 + v58), *(unsigned int *)&v11[4 * v59] + v8);
            BOOL v70 = (void *)(*a2 + v58);
            uint64_t v71 = (unsigned int *)v70[1];
            unint64_t v72 = *v70 + 8 * *(int *)&v11[4 * v59];
            unint64_t v73 = 126 - 2 * __clz((uint64_t)((uint64_t)v71 - v72) >> 3);
            if (v71 == (unsigned int *)v72) {
              uint64_t v74 = 0;
            }
            else {
              uint64_t v74 = v73;
            }
            sub_10000A8D4(v72, v71, v74, 1);
            uint64_t v7 = *a2;
            uint64_t v6 = a2[1];
            unint64_t v62 = *(void *)(*a2 + v58 + 8) - *(void *)(*a2 + v58);
          }
          *(_DWORD *)&v11[4 * v59++] = v62 >> 3;
          v58 += 24;
        }
        while (v59 < 0xAAAAAAAAAAAAAAABLL * ((v6 - v7) >> 3));
        unsigned int v10 = a1;
        uint64_t v22 = *a1;
        uint64_t v23 = a1[1];
      }
    }
    while (v24 < (v23 - v22) >> 3);
  }
  if (v11)
  {
    operator delete(v11);
  }
}

void sub_10000FA34(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_10000FAA4(void **a1, unint64_t a2)
{
  if (a2 > ((unsigned char *)a1[2] - (unsigned char *)*a1) >> 3)
  {
    if (a2 >> 61) {
      sub_100004C0C();
    }
    int64_t v3 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    uint64_t v4 = (char *)sub_10000BB4C(a2);
    uint64_t v5 = &v4[v3 & 0xFFFFFFFFFFFFFFF8];
    uint64_t v7 = &v4[8 * v6];
    uint64_t v9 = (char *)*a1;
    unint64_t v8 = (char *)a1[1];
    unsigned int v10 = v5;
    if (v8 != *a1)
    {
      do
      {
        uint64_t v11 = *((void *)v8 - 1);
        v8 -= 8;
        *((void *)v10 - 1) = v11;
        v10 -= 8;
      }
      while (v8 != v9);
      unint64_t v8 = (char *)*a1;
    }
    *a1 = v10;
    a1[1] = v5;
    a1[2] = v7;
    if (v8)
    {
      operator delete(v8);
    }
  }
}

uint64_t sub_10000FB4C(int *a1, unint64_t a2)
{
  if ((a2 & 3) != 0)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Checksum Alignment Error");
  }
  if (a2 < 4) {
    return 0;
  }
  LODWORD(v2) = 0;
  unint64_t v3 = a2 >> 2;
  do
  {
    int v4 = *a1++;
    uint64_t v2 = (v4 + v2);
    --v3;
  }
  while (v3);
  return v2;
}

void sub_10000FBD4(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_10000FBE8(uint64_t a1)
{
  *(void *)(a1 + 32) = 0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  operator new[]();
}

void sub_10000FE0C(_Unwind_Exception *exception_object)
{
  uint64_t v3 = v1[13];
  v1[13] = 0;
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 24))(v3);
  }
  if (v1[9]) {
    operator delete[]();
  }
  if (v1[7]) {
    operator delete[]();
  }
  if (v1[5]) {
    operator delete[]();
  }
  _Unwind_Resume(exception_object);
}

float sub_10000FEE4(void *a1)
{
  if (a1[12] != -1)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *(void *)&v6.__val_ = 503;
    v6.__cat_ = (const std::error_category *)&off_10003CB20;
    sub_1000079AC((uint64_t)exception, &v6);
  }
  int v1 = 0;
  a1[12] = a1[11];
  uint64_t v2 = a1[6];
  uint64_t v3 = a1[8];
  do
  {
    float result = *(float *)(v2 + 4 * (v1 & 0x7FF));
    *(float *)(v3 + 4 * (v1++ & 0x7FF)) = result;
  }
  while (v1 != 2051);
  return result;
}

void sub_10000FF84(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_10000FF98(void *a1)
{
  uint64_t v1 = a1[12];
  if (v1 == -1)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *(void *)&v7.__val_ = 504;
    v7.__cat_ = (const std::error_category *)&off_10003CB20;
    sub_1000079AC((uint64_t)exception, &v7);
  }
  int v2 = 0;
  a1[11] = v1;
  uint64_t v3 = a1[8];
  uint64_t v4 = a1[6];
  do
  {
    *(_DWORD *)(v4 + 4 * (v2 & 0x7FF)) = *(_DWORD *)(v3 + 4 * (v2 & 0x7FF));
    ++v2;
  }
  while (v2 != 2051);
  a1[12] = -1;
  uint64_t v5 = (void *)a1[7];
  bzero(v5, 0x200CuLL);
}

void sub_100010054(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_100010068(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = 0;
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 88);
  do
  {
    *(_DWORD *)(v6 + 4 * (((_WORD)v7 + (_WORD)v5) & 0x7FF)) = *(_DWORD *)(a2 + 4 * v5);
    ++v5;
  }
  while (v5 != 128);
  uint64_t v8 = 0;
  uint64_t v9 = v7 + 128;
  *(void *)(a1 + 88) = v9;
  uint64_t v10 = *(void *)(a1 + 80);
  do
  {
    *(_DWORD *)(v10 + 4 * v8) = *(_DWORD *)(v6 + 4 * (((_WORD)v9 + (_WORD)v8) & 0x7FF));
    ++v8;
  }
  while (v8 != 2048);
  uint64_t v11 = 0;
  uint64_t v12 = *(void *)(a1 + 8560);
  do
  {
    *(float *)(v12 + v11 * 4) = *(float *)(v10 + v11 * 4) * *(float *)&dword_100014CFC[v11];
    ++v11;
  }
  while (v11 != 2048);
  (***(void (****)(void))(a1 + 104))(*(void *)(a1 + 104));
  for (uint64_t i = 0; i != 1025; ++i)
  {
    float v14 = *(float *)(a3 + 4 * i);
    if (v14 <= 1.0e-10) {
      float v14 = 1.0e-10;
    }
    *(float *)(a3 + 4 * i) = v14;
  }
  uint64_t v15 = *(void *)(a1 + 16);
  if (v15 && (*(_DWORD *)(a1 + 8568) & ~(-1 << *(_DWORD *)(a1 + 28))) == 0)
  {
    unsigned int v16 = *(_DWORD *)(a1 + 32);
    unsigned int v17 = *(_DWORD *)(a1 + 24);
    if (v17 <= 0xA)
    {
      uint64_t v18 = 0;
      uint64_t v19 = v15 + 4 * (((*(_DWORD *)(a1 + 36) - 1) & v16) << (10 - v17));
      do
      {
        uint64_t v20 = 0;
        float v21 = 0.0;
        do
          float v21 = v21 + (float)(logf(*(float *)(a3 + 4 * v20++) + 1.0) * 1477.3);
        while (1 << v17 != v20);
        *(_DWORD *)(v19 + 4 * v18++) = (int)v21 >> v17;
        a3 += 4 * (1 << v17);
      }
      while (v18 != 0x401u >> v17);
      unsigned int v16 = *(_DWORD *)(a1 + 32);
    }
    *(_DWORD *)(a1 + 32) = v16 + 1;
  }
  ++*(_DWORD *)(a1 + 8568);
}

uint64_t sub_100010264(uint64_t a1)
{
  uint64_t result = *(void *)a1;
  if (!result)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Can't write a sig without keeping the header.  When constructing the unpacked sig, make sure keepHeader is True!!");
    goto LABEL_16;
  }
  int v3 = *(_DWORD *)(a1 + 8);
  switch(v3)
  {
    case 1:
      uint64_t v5 = sub_10000730C(result, 0x60020000u);
      if (v5)
      {
        sub_100007178(v5);
        operator delete();
      }
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "Can't write a fat sig without a fat fp data header.");
LABEL_16:
    case 2:
      uint64_t v6 = sub_10000730C(result, 0x60030000u);
      if (v6)
      {
        sub_100007178(v6);
        operator delete();
      }
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "Can't write a normal sig without a normal fp data header.");
      goto LABEL_16;
    case 4:
      uint64_t v4 = sub_10000730C(result, 0x60040000u);
      if (v4)
      {
        sub_100007178(v4);
        operator delete();
      }
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "Can't write a sumo sig without a sumo fp data header.");
      goto LABEL_16;
  }
  return result;
}

void sub_1000108C0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_1000108E4(unint64_t *a1, size_t a2)
{
  uint64_t v5 = (char *)a1[1];
  uint64_t v4 = (char *)a1[2];
  if (v4 - v5 >= a2)
  {
    if (a2)
    {
      bzero((void *)a1[1], a2);
      v5 += a2;
    }
    a1[1] = (unint64_t)v5;
  }
  else
  {
    unint64_t v6 = *a1;
    uint64_t v7 = &v5[-*a1];
    unint64_t v8 = (unint64_t)&v7[a2];
    if ((uint64_t)&v7[a2] < 0) {
      sub_100004C0C();
    }
    unint64_t v9 = (unint64_t)&v4[-v6];
    if (2 * v9 > v8) {
      unint64_t v8 = 2 * v9;
    }
    if (v9 >= 0x3FFFFFFFFFFFFFFFLL) {
      size_t v10 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      size_t v10 = v8;
    }
    if (v10) {
      unint64_t v11 = (unint64_t)operator new(v10);
    }
    else {
      unint64_t v11 = 0;
    }
    uint64_t v12 = &v7[v11];
    uint64_t v13 = (char *)(v11 + v10);
    bzero(v12, a2);
    if (v5 == (char *)v6)
    {
      unint64_t v11 = (unint64_t)v12;
    }
    else
    {
      float v14 = &v5[~v6];
      do
      {
        char v15 = *--v5;
        (v14--)[v11] = v15;
      }
      while (v5 != (char *)v6);
      uint64_t v5 = (char *)*a1;
    }
    *a1 = v11;
    a1[1] = (unint64_t)&v12[a2];
    a1[2] = (unint64_t)v13;
    if (v5)
    {
      operator delete(v5);
    }
  }
}

uint64_t sub_100010A1C(uint64_t a1)
{
  return a1 + 296;
}

uint64_t sub_100010A24(uint64_t a1)
{
  *(void *)(a1 + 8880) = 0;
  *(void *)(a1 + 152) = 0;
  *(_OWORD *)(a1 + 176) = xmmword_100014C40;
  bzero(*(void **)(a1 + 160), 0x10040CuLL);
  uint64_t v2 = *(void *)(a1 + 192);
  bzero(*(void **)(v2 + 8), 4 * (*(_DWORD *)v2 * *(_DWORD *)(v2 + 4) + 3));
  *(_DWORD *)(v2 + 40) = 0;
  if (*(_DWORD *)(a1 + 8876) == 3) {
    *(void *)(a1 + 152) = *(void *)(a1 + 176) - 45;
  }
  *(void *)(a1 + 112) = *(void *)(a1 + 104);
  *(void *)(a1 + 136) = *(void *)(a1 + 128);
  *(void *)(a1 + 240) = 0;
  *(void *)(a1 + 248) = 0;
  sub_10000D3E0(a1 + 256);
  sub_10000D4BC(a1 + 272);
  bzero(*(void **)(a1 + 336), 0x200CuLL);
  bzero(*(void **)(a1 + 368), 0x201CuLL);
  *(void *)(a1 + 384) = 0;
  *(_DWORD *)(a1 + 8864) = 0;
  int v3 = *(void **)(a1 + 312);
  if (v3) {
    bzero(v3, (unint64_t)*(unsigned int *)(a1 + 332) << (12 - *(unsigned char *)(a1 + 320)));
  }
  uint64_t result = sub_100009DE0((uint64_t *)(a1 + 8));
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a1 + 8888);
  return result;
}

void sub_100010B18(uint64_t a1, uint64_t a2, int a3)
{
  int v3 = a3;
  switch(a3)
  {
    case -1:
      int v5 = *(_DWORD *)(a1 + 16);
      goto LABEL_13;
    case 2:
      int v5 = 4;
      goto LABEL_7;
    case 1:
      int v5 = 1;
LABEL_7:
      *(_DWORD *)(a1 + 16) = v5;
      goto LABEL_13;
  }
  *(_DWORD *)(a1 + 16) = 2;
  if (a3 == 5 || a3 == 3) {
    uint64_t v6 = 16;
  }
  else {
    uint64_t v6 = 24;
  }
  *(void *)(a1 + 80) = v6;
  int v5 = 2;
LABEL_13:
  int v7 = *(_DWORD *)(a1 + 8888);
  if (v7 == v5)
  {
    unsigned int v8 = *(_DWORD *)(a1 + 36) & 0xFFFFFF00;
    *(_DWORD *)(a1 + 32) = 0;
    *(_DWORD *)(a1 + 36) = v8;
    uint64_t v9 = *(void *)(a1 + 8880);
    unint64_t v10 = v9 + (uint64_t)((double)*(int *)(a1 + 292) * 0.24);
    unint64_t v11 = HIDWORD(v10);
    *(_DWORD *)(a1 + 40) = v10;
    int v12 = *(_DWORD *)(a1 + 44);
    *(_WORD *)(a1 + 44) = v11;
    int v13 = *(_DWORD *)(a1 + 8876);
    if (v13 == 3)
    {
      *(_DWORD *)(a1 + 40) = v9;
      *(_DWORD *)(a1 + 44) = v12 & 0xFF0000 | WORD2(v9);
      uint64_t v34 = *(void *)(a1 + 152);
      if (v34 >= -44)
      {
        uint64_t v35 = a1 + 20;
        if (v34 >= 1)
        {
          uint64_t v36 = *(_DWORD **)(a1 + 128);
          uint64_t v37 = *(_DWORD **)(a1 + 136);
          while (v36 != v37)
          {
            *v36 -= v34;
            v36 += 52;
          }
        }
        sub_1000048BC(v35, v34);
      }
      sub_10000EEE0();
    }
    float v14 = (uint64_t *)(a1 + 128);
    if (v13 == 2)
    {
      sub_100011534(a1, v14);
      sub_10000EEE0();
    }
    if (v13 == 1)
    {
      sub_100011534(a1, v14);
      sub_10000EEE0();
    }
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    sub_100003BC8(exception, "Invalid signature type");
LABEL_84:
  }
  if (v5 == 1)
  {
    if (v7 != 4) {
      goto LABEL_82;
    }
    uint64_t v67 = 0;
    uint64_t v68 = 0;
    unint64_t v66 = 0;
    sub_10001141C((char *)&v66, *(void *)(a1 + 128), *(void *)(a1 + 136), 0x4EC4EC4EC4EC4EC5 * ((uint64_t)(*(void *)(a1 + 136) - *(void *)(a1 + 128)) >> 4));
    uint64_t v22 = v66;
    uint64_t v23 = v67;
    unint64_t v24 = 0x4EC4EC4EC4EC4EC5 * (((char *)v67 - (char *)v66) >> 4);
    sub_1000117C8(&__p, v24);
    if (v23 == v22)
    {
      uint64_t v22 = v23;
      if (!v23) {
        goto LABEL_54;
      }
    }
    else
    {
      if (v24 <= 1) {
        uint64_t v25 = 1;
      }
      else {
        uint64_t v25 = v24;
      }
      uint64_t v26 = 10;
      unint64_t v27 = v22;
      do
      {
        unsigned __int16 v28 = *((_WORD *)v27 + 2);
        unsigned int v29 = *((unsigned __int16 *)v27 + 3);
        float v30 = (float)(int)(2 * v29);
        float v31 = v30 - (float)((float)((float)v29 - v27[13]) + (float)((float)v29 - v27[15]));
        float v32 = v30 - (float)((float)((float)v29 - v27[9]) + (float)((float)v29 - v27[19]));
        char v33 = (char *)__p + v26;
        *(float *)(v33 - 5) = *v27;
        *(v33 - 3) = v28;
        *(v33 - 2) = v29;
        *(v33 - 1) = (int)(float)(v32 + v32);
        _WORD *v33 = (int)v31;
        v26 += 12;
        v27 += 52;
        --v25;
      }
      while (v25);
    }
    operator delete(v22);
LABEL_54:
    unsigned int v46 = *(_DWORD *)(a1 + 36) & 0xFFFFFF00;
    *(_DWORD *)(a1 + 32) = 0;
    *(_DWORD *)(a1 + 36) = v46;
    uint64_t v47 = *(void *)(a1 + 8880);
    unint64_t v48 = v47 + (uint64_t)((double)*(int *)(a1 + 292) * 0.24);
    unint64_t v49 = HIDWORD(v48);
    *(_DWORD *)(a1 + 40) = v48;
    int v50 = *(_DWORD *)(a1 + 44);
    *(_WORD *)(a1 + 44) = v49;
    int v51 = *(_DWORD *)(a1 + 8876);
    if (v51 != 3)
    {
      if (v51 != 2)
      {
        if (v51 == 1)
        {
          sub_100011650(a1, (char **)&__p);
          sub_10000EF64();
        }
        BOOL v65 = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
        std::logic_error::logic_error(v65, "Invalid signature type");
      }
      sub_100011650(a1, (char **)&__p);
      sub_10000EF64();
    }
    *(_DWORD *)(a1 + 40) = v47;
    *(_DWORD *)(a1 + 44) = v50 & 0xFF0000 | WORD2(v47);
    uint64_t v57 = *(void *)(a1 + 152);
    if (v57 >= -44)
    {
      if (v57 >= 1)
      {
        uint64_t v58 = __p;
        unint64_t v59 = v73;
        while (v58 != v59)
        {
          *v58 -= v57;
          v58 += 3;
        }
      }
      sub_1000048BC(a1 + 20, v57);
    }
    sub_10000EF64();
  }
  if (v5 != 2)
  {
LABEL_82:
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    sub_100003BC8(exception, "Invalid combination of pipeline sig options and get signature sig options.");
    goto LABEL_84;
  }
  BOOL v70 = 0;
  uint64_t v71 = 0;
  uint64_t v69 = 0;
  sub_10001141C((char *)&v69, *(void *)(a1 + 128), *(void *)(a1 + 136), 0x4EC4EC4EC4EC4EC5 * ((uint64_t)(*(void *)(a1 + 136) - *(void *)(a1 + 128)) >> 4));
  char v15 = v69;
  unsigned int v16 = v70;
  unint64_t v17 = 0x4EC4EC4EC4EC4EC5 * (((char *)v70 - (char *)v69) >> 4);
  sub_1000119D0(&__p, v17);
  if (v16 == v15)
  {
    char v15 = v16;
    if (!v16) {
      goto LABEL_43;
    }
  }
  else
  {
    uint64_t v18 = 0;
    if (v17 <= 1) {
      uint64_t v19 = 1;
    }
    else {
      uint64_t v19 = v17;
    }
    uint64_t v20 = v15;
    do
    {
      uint64_t v21 = *v20;
      v20 += 26;
      *((void *)__p + v18++) = v21;
    }
    while (v19 != v18);
  }
  operator delete(v15);
LABEL_43:
  unsigned int v38 = *(_DWORD *)(a1 + 36) & 0xFFFFFF00;
  *(_DWORD *)(a1 + 32) = 0;
  *(_DWORD *)(a1 + 36) = v38;
  uint64_t v39 = *(void *)(a1 + 8880);
  unint64_t v40 = v39 + (uint64_t)((double)*(int *)(a1 + 292) * 0.24);
  unint64_t v41 = HIDWORD(v40);
  *(_DWORD *)(a1 + 40) = v40;
  int v42 = *(_DWORD *)(a1 + 44);
  *(_WORD *)(a1 + 44) = v41;
  if (v3 == -1) {
    int v3 = *(_DWORD *)(a1 + 8892);
  }
  uint64_t v43 = (uint64_t *)(a1 + 8);
  if ((v3 & 0xFFFFFFFE) == 4) {
    unint64_t v44 = 3;
  }
  else {
    unint64_t v44 = 4;
  }
  int v45 = *(_DWORD *)(a1 + 8876);
  switch(v45)
  {
    case 3:
      *(_DWORD *)(a1 + 40) = v39;
      *(_DWORD *)(a1 + 44) = v42 & 0xFF0000 | WORD2(v39);
      uint64_t v54 = *(void *)(a1 + 152);
      if (v54 >= -44)
      {
        if (v54 >= 1)
        {
          uint64_t v55 = __p;
          uint64_t v56 = v73;
          while (v55 != v56)
          {
            *v55 -= v54;
            v55 += 2;
          }
        }
        sub_1000048BC(a1 + 20, v54);
      }
      *(void *)(a1 + 8) = sub_10000EFE8((uint64_t *)&__p, *(void *)(a1 + 80), 0, v44);
      unint64_t v73 = (char *)__p;
      uint64_t v60 = *(void *)(a1 + 152);
      *(_DWORD *)(a1 + 32) = v60;
      int v61 = *(_DWORD *)(a1 + 36);
      *(unsigned char *)(a1 + 36) = BYTE4(v60);
      uint64_t v62 = *(void *)(a1 + 176) - 45;
      *(void *)(a1 + 152) = v62;
      if (*(_DWORD *)(a1 + 16) == 4)
      {
        *(_DWORD *)(a1 + 32) = v62;
        *(_DWORD *)(a1 + 36) = v61 & 0xFFFFFF00 | BYTE4(v62);
      }
      break;
    case 2:
      uint64_t v53 = __p;
      uint64_t v52 = v73;
      sub_1000118B4(a1, &__p);
      uint64_t *v43 = sub_10000EFE8((uint64_t *)&__p, *(void *)(a1 + 80), 1, v44);
      if ((char *)__p + 8 * ((v52 - v53) >> 3) != v73) {
        unint64_t v73 = (char *)__p + 8 * ((v52 - v53) >> 3);
      }
      break;
    case 1:
      sub_1000118B4(a1, &__p);
      uint64_t *v43 = sub_10000EFE8((uint64_t *)&__p, *(void *)(a1 + 80), 1, v44);
      break;
    default:
      unint64_t v64 = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
      std::logic_error::logic_error(v64, "Invalid signature type");
  }
  sub_100010264(a1 + 8);
  sub_100009DE0(v43);
  if (__p)
  {
    unint64_t v73 = (char *)__p;
    operator delete(__p);
  }
}

void sub_1000113C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17)
{
  __cxa_free_exception(v17);
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

char *sub_10001141C(char *result, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v4 = result;
    if (a4 >= 0x13B13B13B13B13CLL) {
      sub_100004C0C();
    }
    uint64_t result = (char *)sub_10000C930(a4);
    void *v4 = result;
    v4[1] = result;
    v4[2] = &result[208 * v7];
    while (a2 != a3)
    {
      int v8 = *(_DWORD *)(a2 + 4);
      *(_DWORD *)uint64_t result = *(_DWORD *)a2;
      *((_DWORD *)result + 1) = v8;
      long long v9 = *(_OWORD *)(a2 + 8);
      long long v10 = *(_OWORD *)(a2 + 24);
      *(_OWORD *)(result + 40) = *(_OWORD *)(a2 + 40);
      *(_OWORD *)(result + 24) = v10;
      *(_OWORD *)(result + 8) = v9;
      long long v11 = *(_OWORD *)(a2 + 56);
      long long v12 = *(_OWORD *)(a2 + 72);
      long long v13 = *(_OWORD *)(a2 + 88);
      *((_DWORD *)result + 26) = *(_DWORD *)(a2 + 104);
      *(_OWORD *)(result + 88) = v13;
      *(_OWORD *)(result + 72) = v12;
      *(_OWORD *)(result + 56) = v11;
      long long v14 = *(_OWORD *)(a2 + 172);
      long long v15 = *(_OWORD *)(a2 + 188);
      int v16 = *(_DWORD *)(a2 + 204);
      *(_OWORD *)(result + 156) = *(_OWORD *)(a2 + 156);
      *((_DWORD *)result + 51) = v16;
      *(_OWORD *)(result + 188) = v15;
      *(_OWORD *)(result + 172) = v14;
      long long v17 = *(_OWORD *)(a2 + 108);
      long long v18 = *(_OWORD *)(a2 + 124);
      *(_OWORD *)(result + 140) = *(_OWORD *)(a2 + 140);
      *(_OWORD *)(result + 124) = v18;
      *(_OWORD *)(result + 108) = v17;
      result += 208;
      a2 += 208;
    }
    v4[1] = result;
  }
  return result;
}

void sub_100011518(_Unwind_Exception *exception_object)
{
  int v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void sub_100011534(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = (float *)(a1 + 160);
  sub_10000BE94((void *)(a1 + 160));
  sub_10000FEE4((void *)(a1 + 296));
  unint64_t v5 = -128;
  memset(v7, 0, sizeof(v7));
  do
  {
    uint64_t v6 = sub_10000C200(*(int **)(a1 + 192), 0);
    sub_100010068(a1 + 296, (uint64_t)v7, v6);
    sub_10000C2B8((uint64_t)v4, a2);
    v5 += 128;
  }
  while (v5 >> 9 < 0xF);
  sub_10000BF68(v4);
  sub_10000FF98((void *)(a1 + 296));
}

void sub_100011650(uint64_t a1, char **a2)
{
  uint64_t v4 = (float *)(a1 + 160);
  sub_10000BE94((void *)(a1 + 160));
  sub_10000FEE4((void *)(a1 + 296));
  unint64_t v5 = -128;
  memset(v7, 0, sizeof(v7));
  do
  {
    uint64_t v6 = sub_10000C200(*(int **)(a1 + 192), 0);
    sub_100010068(a1 + 296, (uint64_t)v7, v6);
    sub_10000CA60((uint64_t)v4, a2);
    v5 += 128;
  }
  while (v5 >> 9 < 0xF);
  sub_10000BF68(v4);
  sub_10000FF98((void *)(a1 + 296));
}

uint64_t sub_10001176C(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a2 != a3)
  {
    uint64_t v3 = *(void *)(result + 8);
    if (a3 != v3)
    {
      uint64_t v4 = 4 * ((a3 - a2) >> 2);
      do
      {
        uint64_t v5 = *(void *)(a2 + v4);
        *(_DWORD *)(a2 + 8) = *(_DWORD *)(a2 + v4 + 8);
        *(void *)a2 = v5;
        a2 += 12;
      }
      while (a2 + v4 != v3);
    }
    *(void *)(result + 8) = a2;
  }
  return result;
}

void *sub_1000117C8(void *a1, unint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    sub_100011864(a1, a2);
    uint64_t v4 = (char *)a1[1];
    size_t v5 = 12 * ((12 * a2 - 12) / 0xC) + 12;
    bzero(v4, v5);
    a1[1] = &v4[v5];
  }
  return a1;
}

void sub_100011848(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *sub_100011864(void *a1, unint64_t a2)
{
  if (a2 >= 0x1555555555555556) {
    sub_100004C0C();
  }
  uint64_t result = (char *)sub_10000CE48(a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[12 * v4];
  return result;
}

void sub_1000118B4(uint64_t a1, void **a2)
{
  uint64_t v4 = (float *)(a1 + 160);
  sub_10000BE94((void *)(a1 + 160));
  sub_10000FEE4((void *)(a1 + 296));
  unint64_t v5 = -128;
  memset(v7, 0, sizeof(v7));
  do
  {
    uint64_t v6 = sub_10000C200(*(int **)(a1 + 192), 0);
    sub_100010068(a1 + 296, (uint64_t)v7, v6);
    sub_10000CE90((uint64_t)v4, a2);
    v5 += 128;
  }
  while (v5 >> 9 < 0xF);
  sub_10000BF68(v4);
  sub_10000FF98((void *)(a1 + 296));
}

void *sub_1000119D0(void *a1, unint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    sub_10000BC48(a1, a2);
    uint64_t v4 = (char *)a1[1];
    bzero(v4, 8 * a2);
    a1[1] = &v4[8 * a2];
  }
  return a1;
}

void sub_100011A2C(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void sub_100011A48(uint64_t a1, char *a2, int a3)
{
  *(void *)(a1 + 8880) += a3;
  int v6 = *(_DWORD *)(a1 + 292);
  int v7 = *(_DWORD *)(a1 + 288);
  if (v6 == v7)
  {
    int v8 = 128;
  }
  else
  {
    unsigned int v9 = vcvtps_u32_f32((float)((float)v6 / (float)v7) * 128.0);
    if (v6 == 44100) {
      int v8 = v9 + 1;
    }
    else {
      int v8 = v9;
    }
  }
  long long v10 = *(const void **)(a1 + 104);
  uint64_t v11 = *(void *)(a1 + 112);
  uint64_t v23 = 0;
  unint64_t v24 = 0;
  uint64_t v25 = 0;
  sub_100011CD4(&v23, v10, v11, (v11 - (uint64_t)v10) >> 2);
  sub_10000D344((void **)&v23, 0x180uLL);
  long long v12 = &a2[4 * a3];
  for (unint64_t i = (unint64_t)&v12[-4 * v8]; (unint64_t)a2 <= i; a2 += 4 * v8)
  {
    sub_10000E214((void *)(a1 + 200), a2, v8, (uint64_t)&v23);
    long long v14 = (char *)v23;
    sub_100011D6C(a1, v23);
    if ((unint64_t)(v24 - v14) <= 0x1FF)
    {
      exception = __cxa_allocate_exception(0x20uLL);
      *(void *)&v22.__val_ = 514;
      v22.__cat_ = (const std::error_category *)&off_10003CB20;
      sub_1000079AC((uint64_t)exception, &v22);
    }
    unint64_t v15 = v24 - (v14 + 512);
    if (v24 != v14 + 512) {
      memmove(v14, v14 + 512, v24 - (v14 + 512));
    }
    unint64_t v24 = &v14[v15];
    if (v15 >= 0x201)
    {
      sub_100011D6C(a1, (uint64_t)v14);
      size_t v16 = v15 - 512;
      memmove(v14, v14 + 512, v16);
      unint64_t v24 = &v14[v16];
    }
  }
  if (a2 >= v12)
  {
    long long v17 = (char *)v23;
    long long v18 = v24;
  }
  else
  {
    sub_10000E214((void *)(a1 + 200), a2, (unint64_t)(v12 - a2) >> 2, (uint64_t)&v23);
    long long v17 = (char *)v23;
    long long v18 = v24;
    if ((unint64_t)&v24[-v23] >= 0x1FD)
    {
      sub_100011D6C(a1, v23);
      size_t v19 = v18 - (v17 + 512);
      if (v19) {
        memmove(v17, v17 + 512, v19);
      }
      long long v18 = &v17[v19];
    }
  }
  uint64_t v20 = *(char **)(a1 + 104);
  *(void *)(a1 + 112) = v20;
  sub_10000DEB0(a1 + 104, v20, v17, v18, (v18 - v17) >> 2);
  if (v17) {
    operator delete(v17);
  }
}

void sub_100011C9C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *sub_100011CD4(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v4 = result;
    if (a4 >> 62) {
      sub_100004C0C();
    }
    uint64_t result = sub_10000BC88(a4);
    int v7 = result;
    void *v4 = result;
    v4[1] = result;
    v4[2] = (char *)result + 4 * v8;
    size_t v9 = a3 - (void)a2;
    if (v9) {
      uint64_t result = memmove(result, a2, v9);
    }
    v4[1] = (char *)v7 + v9;
  }
  return result;
}

void sub_100011D50(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void sub_100011D6C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a1 + 296;
  uint64_t v5 = a1 + 160;
  uint64_t v6 = sub_10000C200(*(int **)(a1 + 192), 0);
  sub_100010068(v4, a2, v6);
  sub_10000C2B8(v5, (uint64_t *)(a1 + 128));
}

void sub_100011DD4(uint64_t a1, unint64_t a2, int a3)
{
  *(void *)(a1 + 8880) += a3;
  int v6 = *(_DWORD *)(a1 + 292);
  int v7 = *(_DWORD *)(a1 + 288);
  if (v6 == v7)
  {
    int v8 = 128;
  }
  else
  {
    unsigned int v9 = vcvtps_u32_f32((float)((float)v6 / (float)v7) * 128.0);
    if (v6 == 44100) {
      int v8 = v9 + 1;
    }
    else {
      int v8 = v9;
    }
  }
  long long v10 = *(const void **)(a1 + 104);
  uint64_t v11 = *(void *)(a1 + 112);
  uint64_t v23 = 0;
  unint64_t v24 = 0;
  uint64_t v25 = 0;
  sub_100011CD4(&v23, v10, v11, (v11 - (uint64_t)v10) >> 2);
  sub_10000D344((void **)&v23, 0x180uLL);
  unint64_t v12 = a2 + 2 * a3;
  for (unint64_t i = v12 - 2 * v8; a2 <= i; a2 += 2 * v8)
  {
    sub_10000E0C0((void *)(a1 + 200), a2, v8, (uint64_t)&v23);
    long long v14 = (char *)v23;
    sub_100011D6C(a1, v23);
    if ((unint64_t)(v24 - v14) <= 0x1FF)
    {
      exception = __cxa_allocate_exception(0x20uLL);
      *(void *)&v22.__val_ = 514;
      v22.__cat_ = (const std::error_category *)&off_10003CB20;
      sub_1000079AC((uint64_t)exception, &v22);
    }
    unint64_t v15 = v24 - (v14 + 512);
    if (v24 != v14 + 512) {
      memmove(v14, v14 + 512, v24 - (v14 + 512));
    }
    unint64_t v24 = &v14[v15];
    if (v15 >= 0x201)
    {
      sub_100011D6C(a1, (uint64_t)v14);
      size_t v16 = v15 - 512;
      memmove(v14, v14 + 512, v16);
      unint64_t v24 = &v14[v16];
    }
  }
  if (a2 >= v12)
  {
    long long v17 = (char *)v23;
    long long v18 = v24;
  }
  else
  {
    sub_10000E0C0((void *)(a1 + 200), a2, (v12 - a2) >> 1, (uint64_t)&v23);
    long long v17 = (char *)v23;
    long long v18 = v24;
    if ((unint64_t)&v24[-v23] >= 0x1FD)
    {
      sub_100011D6C(a1, v23);
      size_t v19 = v18 - (v17 + 512);
      if (v19) {
        memmove(v17, v17 + 512, v19);
      }
      long long v18 = &v17[v19];
    }
  }
  uint64_t v20 = *(char **)(a1 + 104);
  *(void *)(a1 + 112) = v20;
  sub_10000DEB0(a1 + 104, v20, v17, v18, (v18 - v17) >> 2);
  if (v17) {
    operator delete(v17);
  }
}

void sub_100012028(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_100012060(uint64_t a1)
{
  sub_100012098(a1);
  operator delete();
}

uint64_t sub_100012098(uint64_t a1)
{
  *(void *)a1 = off_100038500;
  uint64_t v2 = *(void *)(a1 + 400);
  *(void *)(a1 + 400) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 24))(v2);
  }
  if (*(void *)(a1 + 368)) {
    operator delete[]();
  }
  if (*(void *)(a1 + 352)) {
    operator delete[]();
  }
  if (*(void *)(a1 + 336)) {
    operator delete[]();
  }
  if (*(void *)(a1 + 272)) {
    operator delete[]();
  }
  if (*(void *)(a1 + 256)) {
    operator delete[]();
  }
  uint64_t v3 = *(void **)(a1 + 216);
  if (v3)
  {
    *(void *)(a1 + 224) = v3;
    operator delete(v3);
  }
  sub_10000BE24((void *)(a1 + 160));
  uint64_t v4 = *(void **)(a1 + 128);
  if (v4)
  {
    *(void *)(a1 + 136) = v4;
    operator delete(v4);
  }
  uint64_t v5 = *(void **)(a1 + 104);
  if (v5)
  {
    *(void *)(a1 + 112) = v5;
    operator delete(v5);
  }
  sub_100009DE0((uint64_t *)(a1 + 8));
  int v7 = (void **)(a1 + 48);
  sub_100009E7C(&v7);
  return a1;
}

uint64_t sub_1000121F0(uint64_t a1)
{
  return a1 + 296;
}

uint64_t sub_1000121F8(uint64_t a1)
{
  *(void *)(a1 + 8880) = 0;
  *(void *)(a1 + 152) = 0;
  *(_OWORD *)(a1 + 176) = xmmword_100014C40;
  bzero(*(void **)(a1 + 160), 0x10040CuLL);
  uint64_t v2 = *(void *)(a1 + 192);
  bzero(*(void **)(v2 + 8), 4 * (*(_DWORD *)v2 * *(_DWORD *)(v2 + 4) + 3));
  *(_DWORD *)(v2 + 40) = 0;
  if (*(_DWORD *)(a1 + 8876) == 3) {
    *(void *)(a1 + 152) = *(void *)(a1 + 176) - 45;
  }
  *(void *)(a1 + 112) = *(void *)(a1 + 104);
  *(void *)(a1 + 136) = *(void *)(a1 + 128);
  *(void *)(a1 + 240) = 0;
  *(void *)(a1 + 248) = 0;
  sub_10000D3E0(a1 + 256);
  sub_10000D4BC(a1 + 272);
  bzero(*(void **)(a1 + 336), 0x200CuLL);
  bzero(*(void **)(a1 + 368), 0x201CuLL);
  *(void *)(a1 + 384) = 0;
  *(_DWORD *)(a1 + 8864) = 0;
  uint64_t v3 = *(void **)(a1 + 312);
  if (v3) {
    bzero(v3, (unint64_t)*(unsigned int *)(a1 + 332) << (12 - *(unsigned char *)(a1 + 320)));
  }
  uint64_t result = sub_100009DE0((uint64_t *)(a1 + 8));
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a1 + 8888);
  return result;
}

void sub_1000122EC(uint64_t a1, uint64_t a2, int a3)
{
  int v3 = a3;
  switch(a3)
  {
    case -1:
      int v5 = *(_DWORD *)(a1 + 16);
      goto LABEL_13;
    case 2:
      int v5 = 4;
      goto LABEL_7;
    case 1:
      int v5 = 1;
LABEL_7:
      *(_DWORD *)(a1 + 16) = v5;
      goto LABEL_13;
  }
  *(_DWORD *)(a1 + 16) = 2;
  if (a3 == 5 || a3 == 3) {
    uint64_t v6 = 16;
  }
  else {
    uint64_t v6 = 24;
  }
  *(void *)(a1 + 80) = v6;
  int v5 = 2;
LABEL_13:
  int v7 = *(_DWORD *)(a1 + 8888);
  if (v7 == v5)
  {
    sub_100012884(a1, (char **)(a1 + 128));
  }
  if (v5 == 1)
  {
    if (v7 == 4)
    {
      uint64_t v37 = 0;
      uint64_t v38 = 0;
      uint64_t v36 = 0;
      sub_100012800((char *)&v36, *(void *)(a1 + 128), *(void *)(a1 + 136), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a1 + 136) - *(void *)(a1 + 128)) >> 2));
      unint64_t v15 = v36;
      size_t v16 = v37;
      sub_1000117C8(&__p, 0xAAAAAAAAAAAAAAABLL * (((unsigned char *)v37 - (unsigned char *)v36) >> 2));
      if (v16 == v15)
      {
        if (v16) {
          operator delete(v16);
        }
        sub_100012884(a1, (char **)&__p);
      }
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "Cannot convert fat peak to fat peak");
    }
LABEL_55:
    char v33 = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    sub_100003BC8(v33, "Invalid combination of pipeline sig options and get signature sig options.");
  }
  if (v5 != 2) {
    goto LABEL_55;
  }
  unint64_t v40 = 0;
  uint64_t v41 = 0;
  uint64_t v39 = 0;
  sub_100012800((char *)&v39, *(void *)(a1 + 128), *(void *)(a1 + 136), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a1 + 136) - *(void *)(a1 + 128)) >> 2));
  int v8 = v39;
  unsigned int v9 = v40;
  unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * (((char *)v40 - (char *)v39) >> 2);
  sub_1000119D0(&__p, v10);
  if (v9 == v8)
  {
    int v8 = v9;
    if (!v9) {
      goto LABEL_33;
    }
  }
  else
  {
    uint64_t v11 = 0;
    if (v10 <= 1) {
      uint64_t v12 = 1;
    }
    else {
      uint64_t v12 = v10;
    }
    long long v13 = v8;
    do
    {
      uint64_t v14 = *v13;
      long long v13 = (uint64_t *)((char *)v13 + 12);
      *((void *)__p + v11++) = v14;
    }
    while (v12 != v11);
  }
  operator delete(v8);
LABEL_33:
  unsigned int v17 = *(_DWORD *)(a1 + 36) & 0xFFFFFF00;
  *(_DWORD *)(a1 + 32) = 0;
  *(_DWORD *)(a1 + 36) = v17;
  uint64_t v18 = *(void *)(a1 + 8880);
  unint64_t v19 = v18 + (uint64_t)((double)*(int *)(a1 + 292) * 0.24);
  unint64_t v20 = HIDWORD(v19);
  *(_DWORD *)(a1 + 40) = v19;
  int v21 = *(_DWORD *)(a1 + 44);
  *(_WORD *)(a1 + 44) = v20;
  if (v3 == -1) {
    int v3 = *(_DWORD *)(a1 + 8892);
  }
  std::error_code v22 = (uint64_t *)(a1 + 8);
  if ((v3 & 0xFFFFFFFE) == 4) {
    unint64_t v23 = 3;
  }
  else {
    unint64_t v23 = 4;
  }
  int v24 = *(_DWORD *)(a1 + 8876);
  switch(v24)
  {
    case 3:
      *(_DWORD *)(a1 + 40) = v18;
      *(_DWORD *)(a1 + 44) = v21 & 0xFF0000 | WORD2(v18);
      uint64_t v27 = *(void *)(a1 + 152);
      if (v27 >= -44)
      {
        if (v27 >= 1)
        {
          unsigned __int16 v28 = __p;
          unsigned int v29 = v43;
          while (v28 != v29)
          {
            *v28 -= v27;
            v28 += 2;
          }
        }
        sub_1000048BC(a1 + 20, v27);
      }
      *(void *)(a1 + 8) = sub_10000EFE8((uint64_t *)&__p, *(void *)(a1 + 80), 0, v23);
      uint64_t v43 = (char *)__p;
      uint64_t v30 = *(void *)(a1 + 152);
      *(_DWORD *)(a1 + 32) = v30;
      int v31 = *(_DWORD *)(a1 + 36);
      *(unsigned char *)(a1 + 36) = BYTE4(v30);
      uint64_t v32 = *(void *)(a1 + 176) - 45;
      *(void *)(a1 + 152) = v32;
      if (*(_DWORD *)(a1 + 16) == 4)
      {
        *(_DWORD *)(a1 + 32) = v32;
        *(_DWORD *)(a1 + 36) = v31 & 0xFFFFFF00 | BYTE4(v32);
      }
      break;
    case 2:
      uint64_t v26 = __p;
      uint64_t v25 = v43;
      sub_1000118B4(a1, &__p);
      uint64_t *v22 = sub_10000EFE8((uint64_t *)&__p, *(void *)(a1 + 80), 1, v23);
      if ((char *)__p + 8 * ((v25 - v26) >> 3) != v43) {
        uint64_t v43 = (char *)__p + 8 * ((v25 - v26) >> 3);
      }
      break;
    case 1:
      sub_1000118B4(a1, &__p);
      uint64_t *v22 = sub_10000EFE8((uint64_t *)&__p, *(void *)(a1 + 80), 1, v23);
      break;
    default:
      uint64_t v35 = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
      std::logic_error::logic_error(v35, "Invalid signature type");
  }
  sub_100010264(a1 + 8);
  sub_100009DE0((uint64_t *)(a1 + 8));
  if (__p)
  {
    uint64_t v43 = (char *)__p;
    operator delete(__p);
  }
}

void sub_100012764(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17)
{
  __cxa_free_exception(v17);
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

char *sub_100012800(char *result, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    uint64_t result = sub_100011864(result, a4);
    uint64_t v7 = *((void *)v6 + 1);
    while (a2 != a3)
    {
      *(_DWORD *)uint64_t v7 = *(_DWORD *)a2;
      *(void *)(v7 + 4) = *(void *)(a2 + 4);
      v7 += 12;
      a2 += 12;
    }
    *((void *)v6 + 1) = v7;
  }
  return result;
}

void sub_100012868(_Unwind_Exception *exception_object)
{
  int v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void sub_100012884(uint64_t a1, char **a2)
{
  unsigned int v3 = *(_DWORD *)(a1 + 36) & 0xFFFFFF00;
  *(_DWORD *)(a1 + 32) = 0;
  *(_DWORD *)(a1 + 36) = v3;
  uint64_t v4 = *(void *)(a1 + 8880);
  unint64_t v5 = v4 + (uint64_t)((double)*(int *)(a1 + 292) * 0.24);
  unint64_t v6 = HIDWORD(v5);
  *(_DWORD *)(a1 + 40) = v5;
  int v7 = *(_DWORD *)(a1 + 44);
  *(_WORD *)(a1 + 44) = v6;
  int v8 = *(_DWORD *)(a1 + 8876);
  if (v8 != 3)
  {
    if (v8 != 2)
    {
      if (v8 == 1)
      {
        sub_100011650(a1, a2);
        sub_10000EF64();
      }
      exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
      sub_100003BC8(exception, "Invalid signature type");
    }
    sub_100011650(a1, a2);
    sub_10000EF64();
  }
  *(_DWORD *)(a1 + 40) = v4;
  *(_DWORD *)(a1 + 44) = v7 & 0xFF0000 | WORD2(v4);
  uint64_t v9 = *(void *)(a1 + 152);
  if (v9 >= -44)
  {
    uint64_t v10 = a1 + 20;
    if (v9 >= 1)
    {
      uint64_t v11 = *a2;
      uint64_t v12 = a2[1];
      while (v11 != v12)
      {
        *(_DWORD *)v11 -= v9;
        v11 += 12;
      }
    }
    sub_1000048BC(v10, v9);
  }
  sub_10000EF64();
}

void sub_100012A50(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_100012A64(uint64_t a1, char *a2, int a3)
{
  *(void *)(a1 + 8880) += a3;
  int v6 = *(_DWORD *)(a1 + 292);
  int v7 = *(_DWORD *)(a1 + 288);
  if (v6 == v7)
  {
    int v8 = 128;
  }
  else
  {
    unsigned int v9 = vcvtps_u32_f32((float)((float)v6 / (float)v7) * 128.0);
    if (v6 == 44100) {
      int v8 = v9 + 1;
    }
    else {
      int v8 = v9;
    }
  }
  uint64_t v10 = *(const void **)(a1 + 104);
  uint64_t v11 = *(void *)(a1 + 112);
  uint64_t v23 = 0;
  int v24 = 0;
  uint64_t v25 = 0;
  sub_100011CD4(&v23, v10, v11, (v11 - (uint64_t)v10) >> 2);
  sub_10000D344((void **)&v23, 0x180uLL);
  uint64_t v12 = &a2[4 * a3];
  for (unint64_t i = (unint64_t)&v12[-4 * v8]; (unint64_t)a2 <= i; a2 += 4 * v8)
  {
    sub_10000E214((void *)(a1 + 200), a2, v8, (uint64_t)&v23);
    uint64_t v14 = (char *)v23;
    sub_100012CF0(a1, v23);
    if ((unint64_t)(v24 - v14) <= 0x1FF)
    {
      exception = __cxa_allocate_exception(0x20uLL);
      *(void *)&v22.__val_ = 514;
      v22.__cat_ = (const std::error_category *)&off_10003CB20;
      sub_1000079AC((uint64_t)exception, &v22);
    }
    unint64_t v15 = v24 - (v14 + 512);
    if (v24 != v14 + 512) {
      memmove(v14, v14 + 512, v24 - (v14 + 512));
    }
    int v24 = &v14[v15];
    if (v15 >= 0x201)
    {
      sub_100012CF0(a1, (uint64_t)v14);
      size_t v16 = v15 - 512;
      memmove(v14, v14 + 512, v16);
      int v24 = &v14[v16];
    }
  }
  if (a2 >= v12)
  {
    unsigned int v17 = (char *)v23;
    uint64_t v18 = v24;
  }
  else
  {
    sub_10000E214((void *)(a1 + 200), a2, (unint64_t)(v12 - a2) >> 2, (uint64_t)&v23);
    unsigned int v17 = (char *)v23;
    uint64_t v18 = v24;
    if ((unint64_t)&v24[-v23] >= 0x1FD)
    {
      sub_100012CF0(a1, v23);
      size_t v19 = v18 - (v17 + 512);
      if (v19) {
        memmove(v17, v17 + 512, v19);
      }
      uint64_t v18 = &v17[v19];
    }
  }
  unint64_t v20 = *(char **)(a1 + 104);
  *(void *)(a1 + 112) = v20;
  sub_10000DEB0(a1 + 104, v20, v17, v18, (v18 - v17) >> 2);
  if (v17) {
    operator delete(v17);
  }
}

void sub_100012CB8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_100012CF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a1 + 296;
  uint64_t v5 = a1 + 160;
  uint64_t v6 = sub_10000C200(*(int **)(a1 + 192), 0);
  sub_100010068(v4, a2, v6);
  sub_10000CA60(v5, (char **)(a1 + 128));
}

void sub_100012D58(uint64_t a1, unint64_t a2, int a3)
{
  *(void *)(a1 + 8880) += a3;
  int v6 = *(_DWORD *)(a1 + 292);
  int v7 = *(_DWORD *)(a1 + 288);
  if (v6 == v7)
  {
    int v8 = 128;
  }
  else
  {
    unsigned int v9 = vcvtps_u32_f32((float)((float)v6 / (float)v7) * 128.0);
    if (v6 == 44100) {
      int v8 = v9 + 1;
    }
    else {
      int v8 = v9;
    }
  }
  uint64_t v10 = *(const void **)(a1 + 104);
  uint64_t v11 = *(void *)(a1 + 112);
  uint64_t v23 = 0;
  int v24 = 0;
  uint64_t v25 = 0;
  sub_100011CD4(&v23, v10, v11, (v11 - (uint64_t)v10) >> 2);
  sub_10000D344((void **)&v23, 0x180uLL);
  unint64_t v12 = a2 + 2 * a3;
  for (unint64_t i = v12 - 2 * v8; a2 <= i; a2 += 2 * v8)
  {
    sub_10000E0C0((void *)(a1 + 200), a2, v8, (uint64_t)&v23);
    uint64_t v14 = (char *)v23;
    sub_100012CF0(a1, v23);
    if ((unint64_t)(v24 - v14) <= 0x1FF)
    {
      exception = __cxa_allocate_exception(0x20uLL);
      *(void *)&v22.__val_ = 514;
      v22.__cat_ = (const std::error_category *)&off_10003CB20;
      sub_1000079AC((uint64_t)exception, &v22);
    }
    unint64_t v15 = v24 - (v14 + 512);
    if (v24 != v14 + 512) {
      memmove(v14, v14 + 512, v24 - (v14 + 512));
    }
    int v24 = &v14[v15];
    if (v15 >= 0x201)
    {
      sub_100012CF0(a1, (uint64_t)v14);
      size_t v16 = v15 - 512;
      memmove(v14, v14 + 512, v16);
      int v24 = &v14[v16];
    }
  }
  if (a2 >= v12)
  {
    unsigned int v17 = (char *)v23;
    uint64_t v18 = v24;
  }
  else
  {
    sub_10000E0C0((void *)(a1 + 200), a2, (v12 - a2) >> 1, (uint64_t)&v23);
    unsigned int v17 = (char *)v23;
    uint64_t v18 = v24;
    if ((unint64_t)&v24[-v23] >= 0x1FD)
    {
      sub_100012CF0(a1, v23);
      size_t v19 = v18 - (v17 + 512);
      if (v19) {
        memmove(v17, v17 + 512, v19);
      }
      uint64_t v18 = &v17[v19];
    }
  }
  unint64_t v20 = *(char **)(a1 + 104);
  *(void *)(a1 + 112) = v20;
  sub_10000DEB0(a1 + 104, v20, v17, v18, (v18 - v17) >> 2);
  if (v17) {
    operator delete(v17);
  }
}

void sub_100012FAC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_100012FE4(uint64_t a1)
{
  sub_10001301C(a1);
  operator delete();
}

uint64_t sub_10001301C(uint64_t a1)
{
  *(void *)a1 = off_100038548;
  uint64_t v2 = *(void *)(a1 + 400);
  *(void *)(a1 + 400) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 24))(v2);
  }
  if (*(void *)(a1 + 368)) {
    operator delete[]();
  }
  if (*(void *)(a1 + 352)) {
    operator delete[]();
  }
  if (*(void *)(a1 + 336)) {
    operator delete[]();
  }
  if (*(void *)(a1 + 272)) {
    operator delete[]();
  }
  if (*(void *)(a1 + 256)) {
    operator delete[]();
  }
  unsigned int v3 = *(void **)(a1 + 216);
  if (v3)
  {
    *(void *)(a1 + 224) = v3;
    operator delete(v3);
  }
  sub_10000BE24((void *)(a1 + 160));
  uint64_t v4 = *(void **)(a1 + 128);
  if (v4)
  {
    *(void *)(a1 + 136) = v4;
    operator delete(v4);
  }
  uint64_t v5 = *(void **)(a1 + 104);
  if (v5)
  {
    *(void *)(a1 + 112) = v5;
    operator delete(v5);
  }
  sub_100009DE0((uint64_t *)(a1 + 8));
  int v7 = (void **)(a1 + 48);
  sub_100009E7C(&v7);
  return a1;
}

uint64_t sub_100013174(uint64_t a1)
{
  return a1 + 296;
}

uint64_t sub_10001317C(uint64_t a1)
{
  *(void *)(a1 + 8880) = 0;
  *(void *)(a1 + 152) = 0;
  *(_OWORD *)(a1 + 176) = xmmword_100014C40;
  bzero(*(void **)(a1 + 160), 0x10040CuLL);
  uint64_t v2 = *(void *)(a1 + 192);
  bzero(*(void **)(v2 + 8), 4 * (*(_DWORD *)v2 * *(_DWORD *)(v2 + 4) + 3));
  *(_DWORD *)(v2 + 40) = 0;
  if (*(_DWORD *)(a1 + 8876) == 3) {
    *(void *)(a1 + 152) = *(void *)(a1 + 176) - 45;
  }
  *(void *)(a1 + 112) = *(void *)(a1 + 104);
  *(void *)(a1 + 136) = *(void *)(a1 + 128);
  *(void *)(a1 + 240) = 0;
  *(void *)(a1 + 248) = 0;
  sub_10000D3E0(a1 + 256);
  sub_10000D4BC(a1 + 272);
  bzero(*(void **)(a1 + 336), 0x200CuLL);
  bzero(*(void **)(a1 + 368), 0x201CuLL);
  *(void *)(a1 + 384) = 0;
  *(_DWORD *)(a1 + 8864) = 0;
  unsigned int v3 = *(void **)(a1 + 312);
  if (v3) {
    bzero(v3, (unint64_t)*(unsigned int *)(a1 + 332) << (12 - *(unsigned char *)(a1 + 320)));
  }
  uint64_t result = sub_100009DE0((uint64_t *)(a1 + 8));
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a1 + 8888);
  return result;
}

void sub_100013270(uint64_t a1, uint64_t a2, int a3)
{
  switch(a3)
  {
    case 2:
      int v6 = 4;
      goto LABEL_7;
    case 1:
      int v6 = 1;
LABEL_7:
      *(_DWORD *)(a1 + 16) = v6;
      break;
    case -1:
      int v6 = *(_DWORD *)(a1 + 16);
      break;
    default:
      *(_DWORD *)(a1 + 16) = 2;
      if (a3 == 5 || a3 == 3) {
        uint64_t v7 = 16;
      }
      else {
        uint64_t v7 = 24;
      }
      *(void *)(a1 + 80) = v7;
      int v6 = 2;
      break;
  }
  int v8 = *(_DWORD *)(a1 + 8888);
  if (v8 == v6)
  {
    sub_100013780(a1, (uint64_t *)(a1 + 128), a2, a3);
    return;
  }
  if (v6 == 1)
  {
    if (v8 == 4)
    {
      unsigned int v29 = 0;
      uint64_t v30 = 0;
      unsigned __int16 v28 = 0;
      sub_10000BBCC(&v28, *(const void **)(a1 + 128), *(void *)(a1 + 136), (uint64_t)(*(void *)(a1 + 136) - *(void *)(a1 + 128)) >> 3);
      uint64_t v14 = v28;
      unint64_t v15 = v29;
      sub_1000117C8(&__p, ((unsigned char *)v29 - (unsigned char *)v28) >> 3);
      if (v15 == v14)
      {
        if (v15) {
          operator delete(v15);
        }
        unsigned int v16 = *(_DWORD *)(a1 + 36) & 0xFFFFFF00;
        *(_DWORD *)(a1 + 32) = 0;
        *(_DWORD *)(a1 + 36) = v16;
        uint64_t v17 = *(void *)(a1 + 8880);
        unint64_t v18 = v17 + (uint64_t)((double)*(int *)(a1 + 292) * 0.24);
        unint64_t v19 = HIDWORD(v18);
        *(_DWORD *)(a1 + 40) = v18;
        int v20 = *(_DWORD *)(a1 + 44);
        *(_WORD *)(a1 + 44) = v19;
        int v21 = *(_DWORD *)(a1 + 8876);
        if (v21 != 3)
        {
          if (v21 != 2)
          {
            if (v21 == 1)
            {
              sub_100011650(a1, (char **)&__p);
              sub_10000EF64();
            }
            exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
            std::logic_error::logic_error(exception, "Invalid signature type");
          }
          sub_100011650(a1, (char **)&__p);
          sub_10000EF64();
        }
        *(_DWORD *)(a1 + 40) = v17;
        *(_DWORD *)(a1 + 44) = v20 & 0xFF0000 | WORD2(v17);
        uint64_t v22 = *(void *)(a1 + 152);
        if (v22 >= -44)
        {
          if (v22 >= 1)
          {
            uint64_t v23 = __p;
            int v24 = v35;
            while (v23 != v24)
            {
              *v23 -= v22;
              v23 += 3;
            }
          }
          sub_1000048BC(a1 + 20, v22);
        }
        sub_10000EF64();
      }
      uint64_t v26 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(v26, "Cannot convert normal peak to fat peak");
    }
LABEL_47:
    uint64_t v25 = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    sub_100003BC8(v25, "Invalid combination of pipeline sig options and get signature sig options.");
  }
  if (v6 != 2) {
    goto LABEL_47;
  }
  uint64_t v32 = 0;
  uint64_t v33 = 0;
  int v31 = 0;
  sub_10000BBCC(&v31, *(const void **)(a1 + 128), *(void *)(a1 + 136), (uint64_t)(*(void *)(a1 + 136) - *(void *)(a1 + 128)) >> 3);
  unsigned int v9 = v31;
  uint64_t v10 = v32;
  unint64_t v11 = v32 - v31;
  sub_1000119D0(&__p, v11);
  if (v10 != v9)
  {
    uint64_t v12 = 0;
    if (v11 <= 1) {
      uint64_t v13 = 1;
    }
    else {
      uint64_t v13 = v11;
    }
    do
    {
      *((void *)__p + v12) = v9[v12];
      ++v12;
    }
    while (v13 != v12);
    goto LABEL_34;
  }
  unsigned int v9 = v10;
  if (v10) {
LABEL_34:
  }
    operator delete(v9);
  sub_100013780(a1, (uint64_t *)&__p, a2, a3);
  if (__p)
  {
    uint64_t v35 = __p;
    operator delete(__p);
  }
}

void sub_1000136E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17)
{
  __cxa_free_exception(v17);
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_100013780(uint64_t a1, uint64_t *a2, uint64_t a3, int a4)
{
  unsigned int v6 = *(_DWORD *)(a1 + 36) & 0xFFFFFF00;
  *(_DWORD *)(a1 + 32) = 0;
  *(_DWORD *)(a1 + 36) = v6;
  uint64_t v7 = *(void *)(a1 + 8880);
  unint64_t v8 = v7 + (uint64_t)((double)*(int *)(a1 + 292) * 0.24);
  unint64_t v9 = HIDWORD(v8);
  *(_DWORD *)(a1 + 40) = v8;
  int v10 = *(_DWORD *)(a1 + 44);
  *(_WORD *)(a1 + 44) = v9;
  if (a4 == -1) {
    a4 = *(_DWORD *)(a1 + 8892);
  }
  if ((a4 & 0xFFFFFFFE) == 4) {
    unint64_t v11 = 3;
  }
  else {
    unint64_t v11 = 4;
  }
  int v12 = *(_DWORD *)(a1 + 8876);
  switch(v12)
  {
    case 3:
      *(_DWORD *)(a1 + 40) = v7;
      *(_DWORD *)(a1 + 44) = v10 & 0xFF0000 | WORD2(v7);
      uint64_t v13 = *(void *)(a1 + 152);
      if (v13 >= -44)
      {
        uint64_t v14 = a1 + 20;
        if (v13 >= 1)
        {
          unint64_t v15 = (_DWORD *)*a2;
          unsigned int v16 = (_DWORD *)a2[1];
          while (v15 != v16)
          {
            *v15 -= v13;
            v15 += 2;
          }
        }
        sub_1000048BC(v14, v13);
      }
      *(void *)(a1 + 8) = sub_10000EFE8(a2, *(void *)(a1 + 80), 0, v11);
      a2[1] = *a2;
      uint64_t v19 = *(void *)(a1 + 152);
      *(_DWORD *)(a1 + 32) = v19;
      int v20 = *(_DWORD *)(a1 + 36);
      *(unsigned char *)(a1 + 36) = BYTE4(v19);
      uint64_t v21 = *(void *)(a1 + 176) - 45;
      *(void *)(a1 + 152) = v21;
      if (*(_DWORD *)(a1 + 16) == 4)
      {
        *(_DWORD *)(a1 + 32) = v21;
        *(_DWORD *)(a1 + 36) = v20 & 0xFFFFFF00 | BYTE4(v21);
      }
      break;
    case 2:
      uint64_t v17 = a2[1] - *a2;
      sub_1000118B4(a1, (void **)a2);
      *(void *)(a1 + 8) = sub_10000EFE8(a2, *(void *)(a1 + 80), 1, v11);
      uint64_t v18 = *a2 + v17;
      if (v18 != a2[1]) {
        a2[1] = v18;
      }
      break;
    case 1:
      sub_1000118B4(a1, (void **)a2);
      *(void *)(a1 + 8) = sub_10000EFE8(a2, *(void *)(a1 + 80), 1, v11);
      break;
    default:
      exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
      sub_100003BC8(exception, "Invalid signature type");
  }
  uint64_t v22 = (uint64_t *)(a1 + 8);
  sub_100010264((uint64_t)v22);
  return sub_100009DE0(v22);
}

void sub_10001399C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_1000139B0(uint64_t a1, char *a2, int a3)
{
  *(void *)(a1 + 8880) += a3;
  int v6 = *(_DWORD *)(a1 + 292);
  int v7 = *(_DWORD *)(a1 + 288);
  if (v6 == v7)
  {
    int v8 = 128;
  }
  else
  {
    unsigned int v9 = vcvtps_u32_f32((float)((float)v6 / (float)v7) * 128.0);
    if (v6 == 44100) {
      int v8 = v9 + 1;
    }
    else {
      int v8 = v9;
    }
  }
  int v10 = *(const void **)(a1 + 104);
  uint64_t v11 = *(void *)(a1 + 112);
  uint64_t v23 = 0;
  int v24 = 0;
  uint64_t v25 = 0;
  sub_100011CD4(&v23, v10, v11, (v11 - (uint64_t)v10) >> 2);
  sub_10000D344((void **)&v23, 0x180uLL);
  int v12 = &a2[4 * a3];
  for (unint64_t i = (unint64_t)&v12[-4 * v8]; (unint64_t)a2 <= i; a2 += 4 * v8)
  {
    sub_10000E214((void *)(a1 + 200), a2, v8, (uint64_t)&v23);
    uint64_t v14 = (char *)v23;
    sub_100013C3C(a1, v23);
    if ((unint64_t)(v24 - v14) <= 0x1FF)
    {
      exception = __cxa_allocate_exception(0x20uLL);
      *(void *)&v22.__val_ = 514;
      v22.__cat_ = (const std::error_category *)&off_10003CB20;
      sub_1000079AC((uint64_t)exception, &v22);
    }
    unint64_t v15 = v24 - (v14 + 512);
    if (v24 != v14 + 512) {
      memmove(v14, v14 + 512, v24 - (v14 + 512));
    }
    int v24 = &v14[v15];
    if (v15 >= 0x201)
    {
      sub_100013C3C(a1, (uint64_t)v14);
      size_t v16 = v15 - 512;
      memmove(v14, v14 + 512, v16);
      int v24 = &v14[v16];
    }
  }
  if (a2 >= v12)
  {
    uint64_t v17 = (char *)v23;
    uint64_t v18 = v24;
  }
  else
  {
    sub_10000E214((void *)(a1 + 200), a2, (unint64_t)(v12 - a2) >> 2, (uint64_t)&v23);
    uint64_t v17 = (char *)v23;
    uint64_t v18 = v24;
    if ((unint64_t)&v24[-v23] >= 0x1FD)
    {
      sub_100013C3C(a1, v23);
      size_t v19 = v18 - (v17 + 512);
      if (v19) {
        memmove(v17, v17 + 512, v19);
      }
      uint64_t v18 = &v17[v19];
    }
  }
  int v20 = *(char **)(a1 + 104);
  *(void *)(a1 + 112) = v20;
  sub_10000DEB0(a1 + 104, v20, v17, v18, (v18 - v17) >> 2);
  if (v17) {
    operator delete(v17);
  }
}

void sub_100013C04(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_100013C3C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a1 + 296;
  uint64_t v5 = a1 + 160;
  uint64_t v6 = sub_10000C200(*(int **)(a1 + 192), 0);
  sub_100010068(v4, a2, v6);
  sub_10000CE90(v5, (void **)(a1 + 128));
}

void sub_100013CA4(uint64_t a1, unint64_t a2, int a3)
{
  *(void *)(a1 + 8880) += a3;
  int v6 = *(_DWORD *)(a1 + 292);
  int v7 = *(_DWORD *)(a1 + 288);
  if (v6 == v7)
  {
    int v8 = 128;
  }
  else
  {
    unsigned int v9 = vcvtps_u32_f32((float)((float)v6 / (float)v7) * 128.0);
    if (v6 == 44100) {
      int v8 = v9 + 1;
    }
    else {
      int v8 = v9;
    }
  }
  int v10 = *(const void **)(a1 + 104);
  uint64_t v11 = *(void *)(a1 + 112);
  uint64_t v23 = 0;
  int v24 = 0;
  uint64_t v25 = 0;
  sub_100011CD4(&v23, v10, v11, (v11 - (uint64_t)v10) >> 2);
  sub_10000D344((void **)&v23, 0x180uLL);
  unint64_t v12 = a2 + 2 * a3;
  for (unint64_t i = v12 - 2 * v8; a2 <= i; a2 += 2 * v8)
  {
    sub_10000E0C0((void *)(a1 + 200), a2, v8, (uint64_t)&v23);
    uint64_t v14 = (char *)v23;
    sub_100013C3C(a1, v23);
    if ((unint64_t)(v24 - v14) <= 0x1FF)
    {
      exception = __cxa_allocate_exception(0x20uLL);
      *(void *)&v22.__val_ = 514;
      v22.__cat_ = (const std::error_category *)&off_10003CB20;
      sub_1000079AC((uint64_t)exception, &v22);
    }
    unint64_t v15 = v24 - (v14 + 512);
    if (v24 != v14 + 512) {
      memmove(v14, v14 + 512, v24 - (v14 + 512));
    }
    int v24 = &v14[v15];
    if (v15 >= 0x201)
    {
      sub_100013C3C(a1, (uint64_t)v14);
      size_t v16 = v15 - 512;
      memmove(v14, v14 + 512, v16);
      int v24 = &v14[v16];
    }
  }
  if (a2 >= v12)
  {
    uint64_t v17 = (char *)v23;
    uint64_t v18 = v24;
  }
  else
  {
    sub_10000E0C0((void *)(a1 + 200), a2, (v12 - a2) >> 1, (uint64_t)&v23);
    uint64_t v17 = (char *)v23;
    uint64_t v18 = v24;
    if ((unint64_t)&v24[-v23] >= 0x1FD)
    {
      sub_100013C3C(a1, v23);
      size_t v19 = v18 - (v17 + 512);
      if (v19) {
        memmove(v17, v17 + 512, v19);
      }
      uint64_t v18 = &v17[v19];
    }
  }
  int v20 = *(char **)(a1 + 104);
  *(void *)(a1 + 112) = v20;
  sub_10000DEB0(a1 + 104, v20, v17, v18, (v18 - v17) >> 2);
  if (v17) {
    operator delete(v17);
  }
}

void sub_100013EF8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_100013F30(uint64_t a1)
{
  sub_100013F68(a1);
  operator delete();
}

uint64_t sub_100013F68(uint64_t a1)
{
  *(void *)a1 = off_100038590;
  uint64_t v2 = *(void *)(a1 + 400);
  *(void *)(a1 + 400) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 24))(v2);
  }
  if (*(void *)(a1 + 368)) {
    operator delete[]();
  }
  if (*(void *)(a1 + 352)) {
    operator delete[]();
  }
  if (*(void *)(a1 + 336)) {
    operator delete[]();
  }
  if (*(void *)(a1 + 272)) {
    operator delete[]();
  }
  if (*(void *)(a1 + 256)) {
    operator delete[]();
  }
  unsigned int v3 = *(void **)(a1 + 216);
  if (v3)
  {
    *(void *)(a1 + 224) = v3;
    operator delete(v3);
  }
  sub_10000BE24((void *)(a1 + 160));
  uint64_t v4 = *(void **)(a1 + 128);
  if (v4)
  {
    *(void *)(a1 + 136) = v4;
    operator delete(v4);
  }
  uint64_t v5 = *(void **)(a1 + 104);
  if (v5)
  {
    *(void *)(a1 + 112) = v5;
    operator delete(v5);
  }
  sub_100009DE0((uint64_t *)(a1 + 8));
  int v7 = (void **)(a1 + 48);
  sub_100009E7C(&v7);
  return a1;
}

uLong sub_1000140C0()
{
  uLong result = crc32(0, 0, 0);
  dword_10003CB30 = result;
  return result;
}

uint64_t sub_1000140EC()
{
  return __cxa_atexit((void (*)(void *))std::error_category::~error_category, &off_10003CB20, (void *)&_mh_execute_header);
}

uint64_t sub_100014110()
{
  return __cxa_atexit((void (*)(void *))std::error_category::~error_category, &off_10003CB28, (void *)&_mh_execute_header);
}

uLong sub_100014134()
{
  uLong result = crc32(0, 0, 0);
  dword_10003CBFC = result;
  return result;
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::string *__cdecl std::error_code::message(std::string *__return_ptr retstr, const std::error_code *this)
{
  return std::error_code::message(retstr, this);
}

std::string::size_type std::string::find(const std::string *this, std::string::value_type __c, std::string::size_type __pos)
{
  return std::string::find(this, __c, __pos);
}

uint64_t std::stringbuf::str()
{
  return std::stringbuf::str();
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return std::locale::use_facet(this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return std::ios_base::getloc(this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return std::logic_error::logic_error(this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return std::runtime_error::runtime_error(this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const std::string *a2)
{
  return std::runtime_error::runtime_error(this, a2);
}

void std::runtime_error::~runtime_error(std::runtime_error *this)
{
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return std::bad_array_new_length::bad_array_new_length(this);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return std::string::append(this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return std::string::append(this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return std::string::insert(this, __pos, __s, __n);
}

std::string *__cdecl std::string::basic_string(std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n, std::allocator<char> *__a)
{
  return std::string::basic_string(this, __str, __pos, __n, __a);
}

uint64_t std::ostream::write()
{
  return std::ostream::write();
}

uint64_t std::ostream::sentry::sentry()
{
  return std::ostream::sentry::sentry();
}

uint64_t std::ostream::sentry::~sentry()
{
  return std::ostream::sentry::~sentry();
}

uint64_t std::ostream::~ostream()
{
  return std::ostream::~ostream();
}

void std::error_category::~error_category(std::error_category *this)
{
}

uint64_t std::streambuf::basic_streambuf()
{
  return std::streambuf::basic_streambuf();
}

uint64_t std::streambuf::~streambuf()
{
  return std::streambuf::~streambuf();
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
  return std::ios::~ios();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unint64_t __val)
{
  return std::to_string(retstr, __val);
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
  return ___cxa_allocate_exception(thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return ___cxa_atexit(lpfunc, obj, lpdso_handle);
}

void *__cxa_begin_catch(void *a1)
{
  return ___cxa_begin_catch(a1);
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

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

uLong crc32(uLong crc, const Bytef *buf, uInt len)
{
  return _crc32(crc, buf, len);
}

void exit(int a1)
{
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

float logf(float a1)
{
  return _logf(a1);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return _memset(__b, __c, __len);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

void objc_release(id a1)
{
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return _sscanf(a1, a2);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return _strtoul(__str, __endptr, __base);
}

FFTSetup vDSP_create_fftsetup(vDSP_Length __Log2n, FFTRadix __Radix)
{
  return _vDSP_create_fftsetup(__Log2n, __Radix);
}

void vDSP_ctoz(const DSPComplex *__C, vDSP_Stride __IC, const DSPSplitComplex *__Z, vDSP_Stride __IZ, vDSP_Length __N)
{
}

void vDSP_destroy_fftsetup(FFTSetup __setup)
{
}

void vDSP_fft_zrip(FFTSetup __Setup, const DSPSplitComplex *__C, vDSP_Stride __IC, vDSP_Length __Log2N, FFTDirection __Direction)
{
}

void vDSP_vsmul(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_zvmags(const DSPSplitComplex *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

id objc_msgSend_FillUnknownError(void *a1, const char *a2, ...)
{
  return [a1 FillUnknownError];
}

id objc_msgSend__extractor(void *a1, const char *a2, ...)
{
  return [a1 _extractor];
}

id objc_msgSend__sigx(void *a1, const char *a2, ...)
{
  return [a1 _sigx];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_currentSignature(void *a1, const char *a2, ...)
{
  return [a1 currentSignature];
}

id objc_msgSend_defaultCStringEncoding(void *a1, const char *a2, ...)
{
  return [a1 defaultCStringEncoding];
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return [a1 reset];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForEntitlement:");
}