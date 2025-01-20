void sub_100001924(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, std::locale a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24,uint64_t a25,int a26,__int16 a27,char a28,char a29,void *a30,uint64_t a31,int a32,__int16 a33,char a34,char a35,uint64_t a36,void *a37,uint64_t a38,int a39,__int16 a40,char a41,char a42,uint64_t a43,char *__p,uint64_t a45,int a46,__int16 a47,char a48,char a49)
{
  void *v49;
  void *v50;
  void *v51;

  if (a49 < 0) {
    operator delete(__p);
  }
  __p = &a13;
  sub_10000B184((void ***)&__p);
  sub_100001C6C(&a16);
  if (a29 < 0) {
    operator delete(a24);
  }
  if (a35 < 0) {
    operator delete(a30);
  }

  _Unwind_Resume(a1);
}

void *sub_100001A40()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1000203F0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1000203F0))
  {
    sub_100015B44(&unk_100020100);
    __cxa_atexit((void (*)(void *))sub_100001CAC, &unk_100020100, (void *)&_mh_execute_header);
    __cxa_guard_release(&qword_1000203F0);
  }
  return &unk_100020100;
}

void sub_100001AC4(_Unwind_Exception *a1)
{
}

double sub_100001ADC@<D0>(const std::__fs::filesystem::path *a1@<X0>, uint64_t a2@<X8>)
{
  std::__fs::filesystem::path::__string_view v3 = std::__fs::filesystem::path::__filename(a1);
  if (v3.__size_ >= 0x7FFFFFFFFFFFFFF8) {
    sub_100001FE4();
  }
  if (v3.__size_ >= 0x17)
  {
    std::basic_string_view<_CharT, _Traits>::size_type v5 = (v3.__size_ & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v3.__size_ | 7) != 0x17) {
      std::basic_string_view<_CharT, _Traits>::size_type v5 = v3.__size_ | 7;
    }
    std::basic_string_view<_CharT, _Traits>::size_type v6 = v5 + 1;
    p_dst = (long long *)operator new(v5 + 1);
    *((void *)&__dst + 1) = v3.__size_;
    unint64_t v9 = v6 | 0x8000000000000000;
    *(void *)&long long __dst = p_dst;
  }
  else
  {
    HIBYTE(v9) = v3.__size_;
    p_dst = &__dst;
    if (!v3.__size_) {
      goto LABEL_9;
    }
  }
  memmove(p_dst, v3.__data_, v3.__size_);
LABEL_9:
  *((unsigned char *)p_dst + v3.__size_) = 0;
  double result = *(double *)&__dst;
  *(_OWORD *)a2 = __dst;
  *(void *)(a2 + 16) = v9;
  return result;
}

uint64_t sub_100001BA0@<X0>(const void **a1@<X0>, const void **a2@<X1>, uint64_t a3@<X8>)
{
  if (*((char *)a1 + 23) >= 0) {
    size_t v5 = *((unsigned __int8 *)a1 + 23);
  }
  else {
    size_t v5 = (size_t)a1[1];
  }
  if (*((char *)a2 + 23) >= 0) {
    size_t v6 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    size_t v6 = (size_t)a2[1];
  }
  uint64_t result = sub_10000DBF4(a3, v6 + v5);
  if (*(char *)(result + 23) >= 0) {
    v8 = (char *)result;
  }
  else {
    v8 = *(char **)result;
  }
  if (v5)
  {
    if (*((char *)a1 + 23) >= 0) {
      unint64_t v9 = a1;
    }
    else {
      unint64_t v9 = *a1;
    }
    uint64_t result = (uint64_t)memmove(v8, v9, v5);
  }
  v10 = &v8[v5];
  if (v6)
  {
    if (*((char *)a2 + 23) >= 0) {
      v11 = a2;
    }
    else {
      v11 = *a2;
    }
    uint64_t result = (uint64_t)memmove(v10, v11, v6);
  }
  v10[v6] = 0;
  return result;
}

void sub_100001C6C(std::locale *this)
{
  locale = this[6].__locale_;
  if (locale) {
    sub_100001F70((std::__shared_weak_count *)locale);
  }
  std::locale::~locale(this);
}

uint64_t sub_100001CAC(uint64_t a1)
{
  sub_100001D00((void *)(a1 + 712));
  std::mutex::~mutex((std::mutex *)(a1 + 648));
  std::mutex::~mutex((std::mutex *)(a1 + 584));
  sub_100001D84(a1 + 216);
  return sub_100001EE0(a1);
}

void *sub_100001D00(void *a1)
{
  v2 = (void *)a1[3];
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

uint64_t sub_100001D84(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 352))
  {
    v7 = (void **)(a1 + 328);
    sub_100001E3C(&v7);
    if (*(unsigned char *)(a1 + 312))
    {
      v2 = *(void **)(a1 + 288);
      if (v2)
      {
        *(void *)(a1 + 296) = v2;
        operator delete(v2);
      }
    }
    if (*(unsigned char *)(a1 + 248))
    {
      std::__fs::filesystem::path::__string_view v3 = *(void **)(a1 + 224);
      if (v3)
      {
        *(void *)(a1 + 232) = v3;
        operator delete(v3);
      }
    }
    if (*(unsigned char *)(a1 + 184))
    {
      v4 = *(void **)(a1 + 160);
      if (v4)
      {
        *(void *)(a1 + 168) = v4;
        operator delete(v4);
      }
    }
    if (*(unsigned char *)(a1 + 120))
    {
      size_t v5 = *(void **)(a1 + 96);
      if (v5)
      {
        *(void *)(a1 + 104) = v5;
        operator delete(v5);
      }
    }
  }
  return a1;
}

void sub_100001E28(void *a1)
{
}

void sub_100001E3C(void ***a1)
{
  v2 = *a1;
  if (*v2)
  {
    sub_100001E90((uint64_t *)v2);
    std::__fs::filesystem::path::__string_view v3 = **a1;
    operator delete(v3);
  }
}

void sub_100001E90(uint64_t *a1)
{
  uint64_t v2 = *a1;
  for (uint64_t i = a1[1]; i != v2; i -= 40)
  {
    v4 = *(void **)(i - 24);
    if (v4)
    {
      *(void *)(i - 16) = v4;
      operator delete(v4);
    }
  }
  a1[1] = v2;
}

uint64_t sub_100001EE0(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 112))
  {
    sub_100001F24(a1 + 32);
    if (*(char *)(a1 + 23) < 0) {
      operator delete(*(void **)a1);
    }
  }
  return a1;
}

uint64_t sub_100001F24(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 64))
  {
    if (*(char *)(a1 + 63) < 0) {
      operator delete(*(void **)(a1 + 40));
    }
    if (*(char *)(a1 + 31) < 0) {
      operator delete(*(void **)(a1 + 8));
    }
  }
  return a1;
}

void sub_100001F70(std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

void sub_100001FE4()
{
}

void sub_100001FFC(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_100002058(exception, a1);
}

void sub_100002044(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_100002058(std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  return result;
}

void sub_10000208C()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

void *sub_1000020C0(unsigned char *__dst, void *__src, unint64_t a3)
{
  size_t v5 = __dst;
  if (a3 > 0x16)
  {
    if (a3 >= 0x7FFFFFFFFFFFFFF8) {
      sub_100001FE4();
    }
    uint64_t v6 = (a3 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a3 | 7) != 0x17) {
      uint64_t v6 = a3 | 7;
    }
    uint64_t v7 = v6 + 1;
    v8 = operator new(v6 + 1);
    v5[1] = a3;
    v5[2] = v7 | 0x8000000000000000;
    *size_t v5 = v8;
    size_t v5 = v8;
  }
  else
  {
    __dst[23] = a3;
  }
  return memmove(v5, __src, a3 + 1);
}

BOOL sub_100002160(uint64_t a1, const void **a2, const void **a3)
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
    v8 = a3;
  }
  else {
    v8 = *a3;
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

void *sub_1000021CC(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    sub_100001FE4();
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

void sub_100002280(std::locale *a1, uint64_t a2, int a3)
{
  size_t v4 = sub_100002320(a1);
  LODWORD(v4[3].__locale_) = a3;
  *(_OWORD *)((char *)&v4[3].__locale_ + 4) = 0u;
  *(_OWORD *)((char *)&v4[5].__locale_ + 4) = 0u;
  HIDWORD(v4[7].__locale_) = 0;
  sub_100002380();
}

void sub_100002300(_Unwind_Exception *a1)
{
  locale = (std::__shared_weak_count *)v1[6].__locale_;
  if (locale) {
    sub_100001F70(locale);
  }
  std::locale::~locale(v1);
  _Unwind_Resume(a1);
}

std::locale *sub_100002320(std::locale *a1)
{
  uint64_t v2 = std::locale::locale(a1);
  a1[1].__locale_ = (std::locale::__imp *)std::locale::use_facet(v2, &std::ctype<char>::id);
  a1[2].__locale_ = (std::locale::__imp *)std::locale::use_facet(a1, &std::collate<char>::id);
  return a1;
}

void sub_10000236C(_Unwind_Exception *a1)
{
  std::locale::~locale(v1);
  _Unwind_Resume(a1);
}

void sub_100002380()
{
}

void sub_100002540(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

void sub_100002574()
{
  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, __re_err_parse);
}

void sub_1000025B8(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_1000025CC(uint64_t a1, uint64_t a2)
{
  sub_100002BF4(&v2, a2);
}

unsigned __int8 *sub_100002614(uint64_t a1, unsigned __int8 *a2, char *a3)
{
  uint64_t v6 = sub_100002F78(a1, a2, a3);
  if (v6 == a2) {
    operator new();
  }
  if (v6 == (unsigned __int8 *)a3) {
    return (unsigned __int8 *)a3;
  }
  if (*v6 == 124)
  {
    if (v6 + 1 == sub_100002F78(a1, v6 + 1, a3)) {
      operator new();
    }
    sub_100002FC4();
  }
  return v6;
}

unsigned __int8 *sub_10000274C(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  int v3 = a2;
  if (a2 == a3) {
    return a2;
  }
  size_t v4 = a3;
  if (*a2 == 94) {
    sub_100003890();
  }
  if (a2 != a3)
  {
    do
    {
      uint64_t v6 = v3;
      int v3 = sub_10000A704(a1, v3, v4);
    }
    while (v6 != v3);
    if (v6 != v4)
    {
      if (v6 + 1 == v4 && *v6 == 36) {
        sub_100003914();
      }
      sub_10000A6AC();
    }
  }
  return v4;
}

char *sub_1000027FC(uint64_t a1, char *a2, char *a3)
{
  uint64_t v6 = sub_10000ADA4(a1, a2, a3);
  if (v6 == (unsigned __int8 *)a2) {
LABEL_8:
  }
    sub_10000A6AC();
  uint64_t v7 = v6;
  if (v6 == (unsigned __int8 *)a3) {
    return a3;
  }
  if (*v6 == 124)
  {
    if (v6 + 1 != sub_10000ADA4(a1, (char *)v6 + 1, a3)) {
      sub_100002FC4();
    }
    goto LABEL_8;
  }
  return (char *)v7;
}

unsigned __int8 *sub_1000028A0(uint64_t a1, unsigned __int8 *__s, unsigned __int8 *a3)
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
  sub_10000274C(a1, __s, v7);
  if (v7 == a3) {
    int v10 = v7;
  }
  else {
    int v10 = v7 + 1;
  }
  if (v10 != a3)
  {
    uint64_t v8 = (unsigned __int8 *)memchr(v10, 10, a3 - v10);
    if (v8) {
      size_t v9 = v8;
    }
    else {
      size_t v9 = a3;
    }
    if (v9 != v10)
    {
      sub_10000274C(a1, v10, v9);
      sub_100002FC4();
    }
    operator new();
  }
  return a3;
}

char *sub_100002A08(uint64_t a1, char *__s, char *a3)
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
  sub_1000027FC(a1, __s, v7);
  if (v7 == a3) {
    int v10 = v7;
  }
  else {
    int v10 = v7 + 1;
  }
  if (v10 != a3)
  {
    uint64_t v8 = (char *)memchr(v10, 10, a3 - v10);
    if (v8) {
      size_t v9 = v8;
    }
    else {
      size_t v9 = a3;
    }
    if (v9 != v10)
    {
      sub_1000027FC(a1, v10, v9);
      sub_100002FC4();
    }
    operator new();
  }
  return a3;
}

void sub_100002B70()
{
  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, __re_err_grammar);
}

void sub_100002BB4(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_100002BCC()
{
}

void sub_100002BE0(uint64_t a1, _DWORD *a2)
{
  *a2 = -1000;
}

void sub_100002BF4(void *a1, uint64_t a2)
{
  *a1 = a2;
  operator new();
}

void sub_100002C5C(_Unwind_Exception *exception_object)
{
  if (v1) {
    sub_100016E98(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_100002C78(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete();
}

uint64_t sub_100002CB0(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

uint64_t sub_100002CE0(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

BOOL sub_100002D24(uint64_t a1, uint64_t a2)
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

void *sub_100002D74(void *a1)
{
  *a1 = off_10001C5D8;
  uint64_t v2 = a1[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  return a1;
}

void sub_100002DE0(void *a1)
{
  *a1 = off_10001C5D8;
  uint64_t v1 = a1[1];
  if (v1) {
    (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  }
  operator delete();
}

uint64_t sub_100002E6C(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -994;
  *(void *)(a2 + 80) = *(void *)(result + 8);
  return result;
}

void *sub_100002E80(void *a1)
{
  *a1 = off_10001C5D8;
  uint64_t v2 = a1[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  return a1;
}

void sub_100002EEC(void *a1)
{
  *a1 = off_10001C5D8;
  uint64_t v1 = a1[1];
  if (v1) {
    (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  }
  operator delete();
}

unsigned __int8 *sub_100002F78(uint64_t a1, unsigned __int8 *a2, char *a3)
{
  do
  {
    size_t v5 = a2;
    a2 = sub_1000030CC(a1, (char *)a2, a3);
  }
  while (v5 != a2);
  return v5;
}

void sub_100002FC4()
{
}

unsigned __int8 *sub_1000030CC(uint64_t a1, char *a2, char *a3)
{
  uint64_t result = (unsigned __int8 *)sub_100003174(a1, a2, a3);
  if (result == (unsigned __int8 *)a2)
  {
    uint64_t v7 = sub_10000338C(a1, (unsigned __int8 *)a2, a3);
    uint64_t result = (unsigned __int8 *)a2;
    if (v7 != (unsigned __int8 *)a2)
    {
      return sub_100003584(a1, v7, (unsigned __int8 *)a3);
    }
  }
  return result;
}

char *sub_100003174(uint64_t a1, char *a2, char *a3)
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
            sub_100003998();
          }
        }
      }
      else if (v6 == 94)
      {
        sub_100003890();
      }
    }
    else
    {
      if (v6 == 36) {
        sub_100003914();
      }
      if (v6 == 40 && a2 + 1 != a3 && a2[1] == 63 && a2 + 2 != a3)
      {
        int v7 = a2[2];
        if (v7 == 33)
        {
          sub_100002320(v10);
          long long v11 = 0u;
          uint64_t v13 = 0;
          long long v12 = 0u;
          LODWORD(v11) = *(_DWORD *)(a1 + 24);
          sub_100002380(v10, a2 + 3, a3);
          sub_100003A2C();
        }
        if (v7 == 61)
        {
          sub_100002320(v10);
          long long v11 = 0u;
          uint64_t v13 = 0;
          long long v12 = 0u;
          LODWORD(v11) = *(_DWORD *)(a1 + 24);
          sub_100002380(v10, a2 + 3, a3);
          sub_100003A2C();
        }
      }
    }
  }
  return a2;
}

void sub_10000336C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9)
{
}

unsigned __int8 *sub_10000338C(uint64_t a1, unsigned __int8 *a2, char *a3)
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
          return sub_100005818(a1, a2, a3);
        }
LABEL_28:
        sub_1000057C0();
      }
      uint64_t v8 = a2 + 1;
      if (a2 + 1 != (unsigned __int8 *)a3)
      {
        if (a2 + 2 != (unsigned __int8 *)a3 && *v8 == 63 && a2[2] == 58)
        {
          ++*(_DWORD *)(a1 + 36);
          int v9 = (char *)sub_100002614(a1, a2 + 3, a3);
          if (v9 != a3 && *v9 == 41)
          {
            --*(_DWORD *)(a1 + 36);
            return (unsigned __int8 *)(v9 + 1);
          }
        }
        else
        {
          sub_1000056C0(a1);
          ++*(_DWORD *)(a1 + 36);
          int v10 = (char *)sub_100002614(a1, v8, a3);
          if (v10 != a3)
          {
            long long v11 = v10;
            if (*v10 == 41)
            {
              sub_100005744(a1);
              --*(_DWORD *)(a1 + 36);
              return (unsigned __int8 *)(v11 + 1);
            }
          }
        }
      }
      sub_100003AD4();
    }
    if (v6 > 91)
    {
      if (v6 == 92) {
        return sub_100005508(a1, a2, (unsigned __int8 *)a3);
      }
      if (v6 == 123) {
        goto LABEL_28;
      }
    }
    else
    {
      if (v6 == 91) {
        return sub_1000055AC(a1, a2, a3);
      }
      if (v6 == 63) {
        goto LABEL_28;
      }
    }
    return sub_100005818(a1, a2, a3);
  }
  return v3;
}

unsigned __int8 *sub_100003584(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
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
      sub_10000A058();
    return v6;
  }
  if (v5 == 63) {
    goto LABEL_18;
  }
  int v6 = a2;
  if (v5 == 123)
  {
    int v7 = a2 + 1;
    uint64_t v8 = sub_10000A1E8(a1, a2 + 1, a3, &v14);
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
        sub_10000A288();
      }
      int v10 = v8 + 1;
      if (v8 + 1 == a3) {
        goto LABEL_24;
      }
      if (*v10 == 125) {
        goto LABEL_18;
      }
      int v13 = -1;
      long long v12 = sub_10000A1E8(a1, v10, a3, &v13);
      if (v10 != v12 && v12 != a3 && *v12 == 125)
      {
        if (v13 >= v14) {
          goto LABEL_18;
        }
        goto LABEL_24;
      }
    }
    sub_10000A2E0();
  }
  return v6;
}

void sub_100003890()
{
}

void sub_100003914()
{
}

void sub_100003998()
{
}

void sub_100003A2C()
{
}

void sub_100003AB0()
{
}

void sub_100003AD4()
{
  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_paren);
}

void sub_100003B18(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void *sub_100003B2C(void *a1)
{
  *a1 = off_10001C5D8;
  uint64_t v2 = a1[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  return a1;
}

void sub_100003B98(void *a1)
{
  *a1 = off_10001C5D8;
  uint64_t v1 = a1[1];
  if (v1) {
    (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  }
  operator delete();
}

uint64_t sub_100003C24(uint64_t result, uint64_t a2)
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

void *sub_100003C84(void *a1)
{
  *a1 = off_10001C5D8;
  uint64_t v2 = a1[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  return a1;
}

void sub_100003CF0(void *a1)
{
  *a1 = off_10001C5D8;
  uint64_t v1 = a1[1];
  if (v1) {
    (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  }
  operator delete();
}

uint64_t sub_100003D7C(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(unsigned __int8 **)(a2 + 16);
  if (v2 == *(unsigned __int8 **)(a2 + 24) && (*(unsigned char *)(a2 + 88) & 2) == 0
    || *(unsigned char *)(result + 16) && ((int v3 = *v2, v3 != 13) ? (v4 = v3 == 10) : (v4 = 1), v4))
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

std::locale *sub_100003DCC(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)off_10001C698;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)off_10001C5D8;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  return a1;
}

void sub_100003E58(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)off_10001C698;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)off_10001C5D8;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  operator delete();
}

uint64_t sub_100003F04(uint64_t result, uint64_t a2)
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

uint64_t sub_100004018(uint64_t a1, uint64_t a2, char a3, uint64_t a4, int a5)
{
  *(void *)a1 = off_10001C6E0;
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

std::locale *sub_1000040A8(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)off_10001C6E0;
  uint64_t v2 = a1 + 2;
  locale = (std::__shared_weak_count *)a1[8].__locale_;
  if (locale) {
    sub_100001F70(locale);
  }
  std::locale::~locale(v2);
  a1->__locale_ = (std::locale::__imp *)off_10001C5D8;
  BOOL v4 = a1[1].__locale_;
  if (v4) {
    (*(void (**)(std::locale::__imp *))(*(void *)v4 + 8))(v4);
  }
  return a1;
}

void sub_100004148(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)off_10001C6E0;
  uint64_t v2 = a1 + 2;
  locale = (std::__shared_weak_count *)a1[8].__locale_;
  if (locale) {
    sub_100001F70(locale);
  }
  std::locale::~locale(v2);
  a1->__locale_ = (std::locale::__imp *)off_10001C5D8;
  BOOL v4 = a1[1].__locale_;
  if (v4) {
    (*(void (**)(std::locale::__imp *))(*(void *)v4 + 8))(v4);
  }
  operator delete();
}

void sub_100004208(uint64_t a1, uint64_t a2)
{
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  char v25 = 0;
  long long v26 = 0uLL;
  char v27 = 0;
  char v28 = 0;
  uint64_t v29 = 0;
  __p = 0;
  v19 = 0;
  unint64_t v4 = (*(_DWORD *)(a1 + 44) + 1);
  uint64_t v6 = *(void *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 24);
  uint64_t v20 = 0;
  *(void *)&long long v21 = v5;
  *((void *)&v21 + 1) = v5;
  char v22 = 0;
  sub_100004878((char **)&__p, v4, &v21);
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
  if (*(unsigned __int8 *)(a1 + 84) == sub_100004408(a1 + 16, v7, *(void *)(a2 + 24), (uint64_t *)&__p, *(_DWORD *)(a2 + 88) & 0xFBF | 0x40u, v9))
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
    v16 = &v10[24 * v15];
    uint64_t v17 = v14 + 24 * (v13 + v12);
    *(_OWORD *)uint64_t v17 = *(_OWORD *)v16;
    *(unsigned char *)(v17 + 16) = v16[16];
    unint64_t v15 = (v12 + 2);
    ++v12;
  }
  while (v11 > v15);
LABEL_14:
  v19 = v10;
  operator delete(v10);
}

void sub_100004374(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

char *sub_100004394(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, char a5)
{
  *(void *)(a1 + 24) = a4;
  BOOL v8 = (_OWORD *)(a1 + 24);
  *(void *)(a1 + 32) = a4;
  *(unsigned char *)(a1 + 40) = 0;
  uint64_t result = sub_100004878((char **)a1, a2, (long long *)(a1 + 24));
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

uint64_t sub_100004408(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, int a5, char a6)
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
    *(_DWORD *)v37 = 0;
    memset(&v37[8], 0, 48);
    *(_OWORD *)__p = 0u;
    memset(v39, 0, 21);
    v43 = (_OWORD *)sub_100004C04((uint64_t *)&v42, (uint64_t)v37);
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
    sub_100004AE8((uint64_t)(v12 - 4), *(unsigned int *)(a1 + 28), &v40);
    sub_100004B24((uint64_t)v43 - 40, *(unsigned int *)(a1 + 32));
    int v13 = v43;
    *((void *)v43 - 2) = v6;
    *((_DWORD *)v13 - 2) = a5;
    *((unsigned char *)v13 - 4) = a6;
    unsigned int v14 = 1;
    while (2)
    {
      if ((v14 & 0xFFF) == 0 && (int)(v14 >> 12) >= (int)a3 - (int)a2) {
        sub_100004B54();
      }
      v16 = v13 - 1;
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
          v19 = v43 - 6;
          sub_100004F84((uint64_t)&v44, (void *)v43 - 12);
          v43 = v19;
          goto LABEL_23;
        case 0xFFFFFC20:
          long long v20 = *(v13 - 5);
          *(_OWORD *)v37 = *v17;
          *(_OWORD *)&v37[16] = v20;
          memset(&v37[32], 0, 24);
          sub_100005338(&v37[32], *((long long **)v13 - 8), *((long long **)v13 - 7), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)v13 - 7) - *((void *)v13 - 8)) >> 3));
          __p[0] = 0;
          __p[1] = 0;
          v39[0] = 0;
          sub_1000053B8((char *)__p, *((long long **)v13 - 5), *((long long **)v13 - 4), (uint64_t)(*((void *)v13 - 4) - *((void *)v13 - 5)) >> 4);
          uint64_t v21 = *v16;
          *(void *)((char *)&v39[1] + 5) = *(void *)((char *)v13 - 11);
          v39[1] = v21;
          (*(void (**)(void, uint64_t, _OWORD *))(*(void *)*v16 + 24))(*v16, 1, v13 - 6);
          (*(void (**)(void, void, unsigned char *))(*(void *)v39[1] + 24))(v39[1], 0, v37);
          char v22 = v43;
          if ((unint64_t)v43 >= v44)
          {
            v43 = (_OWORD *)sub_100004C04((uint64_t *)&v42, (uint64_t)v37);
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
          sub_100004BAC();
      }
      break;
    }
  }
  *(void *)v37 = &v42;
  sub_100005470((void ***)v37);
  return v6;
}

void sub_1000047F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18)
{
  sub_100004AA4(&a13);
  a13 = v18 - 112;
  sub_100005470((void ***)&a13);
  _Unwind_Resume(a1);
}

char *sub_100004878(char **a1, unint64_t a2, long long *a3)
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
      v19 = &v15[24 * (a2 - v16)];
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
      sub_100004A44();
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
    uint64_t result = sub_1000049F0(a1, v10);
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

char *sub_1000049F0(void *a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    sub_100004A44();
  }
  uint64_t result = (char *)sub_100004A5C((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[24 * v4];
  return result;
}

void sub_100004A44()
{
}

void *sub_100004A5C(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    sub_10000208C();
  }
  return operator new(24 * a2);
}

void *sub_100004AA4(void *a1)
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

void sub_100004AE8(uint64_t a1, unint64_t a2, long long *a3)
{
  unint64_t v3 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 3);
  BOOL v4 = a2 >= v3;
  unint64_t v5 = a2 - v3;
  if (v5 != 0 && v4)
  {
    sub_100005058((void **)a1, v5, a3);
  }
  else if (!v4)
  {
    *(void *)(a1 + 8) = *(void *)a1 + 24 * a2;
  }
}

void sub_100004B24(uint64_t a1, unint64_t a2)
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
    sub_1000051E0((void **)a1, a2 - v2);
  }
}

void sub_100004B54()
{
  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_complexity);
}

void sub_100004B98(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_100004BAC()
{
  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, __re_err_unknown);
}

void sub_100004BF0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_100004C04(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 5);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0x2AAAAAAAAAAAAAALL) {
    sub_100004A44();
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
    unint64_t v10 = (char *)sub_100004DCC(v7, v9);
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
  sub_100004D54(a1, v16);
  uint64_t v14 = a1[1];
  sub_100004FDC(v16);
  return v14;
}

void sub_100004D40(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_100004FDC((void **)va);
  _Unwind_Resume(a1);
}

uint64_t sub_100004D54(uint64_t *a1, void *a2)
{
  uint64_t result = sub_100004E14((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
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

void *sub_100004DCC(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x2AAAAAAAAAAAAABLL) {
    sub_10000208C();
  }
  return operator new(96 * a2);
}

uint64_t sub_100004E14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
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
  sub_100004EF8((uint64_t)v12);
  return v10;
}

uint64_t sub_100004EF8(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    sub_100004F30((uint64_t *)a1);
  }
  return a1;
}

void sub_100004F30(uint64_t *a1)
{
  uint64_t v1 = *(void **)(a1[2] + 8);
  unint64_t v2 = *(void **)(a1[1] + 8);
  if (v1 != v2)
  {
    uint64_t v3 = *a1;
    do
    {
      sub_100004F84(v3, v1);
      v1 += 12;
    }
    while (v1 != v2);
  }
}

void sub_100004F84(uint64_t a1, void *a2)
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

void **sub_100004FDC(void **a1)
{
  if (*a1) {
    operator delete(*a1);
  }
  return a1;
}

void sub_100005010(void *a1)
{
  uint64_t v2 = a1[1];
  for (uint64_t i = a1[2]; i != v2; uint64_t i = a1[2])
  {
    uint64_t v4 = a1[4];
    a1[2] = i - 96;
    sub_100004F84(v4, (void *)(i - 96));
  }
}

void sub_100005058(void **a1, unint64_t a2, long long *a3)
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
      sub_100004A44();
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
      long long v14 = (char *)sub_100004A5C(v6, v13);
    }
    else {
      long long v14 = 0;
    }
    uint64_t v18 = &v14[24 * v10];
    v19 = &v18[24 * a2];
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

void sub_1000051E0(void **a1, unint64_t a2)
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
      sub_100004A44();
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
      unint64_t v13 = (char *)sub_100005300(v4, v12);
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

void *sub_100005300(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60) {
    sub_10000208C();
  }
  return operator new(16 * a2);
}

char *sub_100005338(char *result, long long *a2, long long *a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    uint64_t result = sub_1000049F0(result, a4);
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

void sub_10000539C(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *sub_1000053B8(char *result, long long *a2, long long *a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    uint64_t result = sub_10000542C(result, a4);
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

void sub_100005410(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *sub_10000542C(void *a1, unint64_t a2)
{
  if (a2 >> 60) {
    sub_100004A44();
  }
  uint64_t result = (char *)sub_100005300((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[16 * v4];
  return result;
}

void sub_100005470(void ***a1)
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
        sub_100004F84((uint64_t)(v1 + 2), v4);
      }
      while (v4 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

unsigned __int8 *sub_100005508(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  if (a2 == a3 || *a2 != 92) {
    return a2;
  }
  uint64_t v5 = a2 + 1;
  if (a2 + 1 == a3) {
    sub_100005984();
  }
  uint64_t result = sub_1000059DC(a1, a2 + 1, a3);
  if (v5 == result)
  {
    uint64_t result = (unsigned __int8 *)sub_100005A94(a1, (char *)a2 + 1, (char *)a3);
    if (v5 == result)
    {
      uint64_t result = sub_100005B64(a1, (char *)a2 + 1, (char *)a3, 0);
      if (v5 == result) {
        return a2;
      }
    }
  }
  return result;
}

unsigned char *sub_1000055AC(uint64_t a1, unsigned char *a2, unsigned char *a3)
{
  if (a2 != a3 && *a2 == 91)
  {
    if (a2 + 1 != a3) {
      sub_100006C70();
    }
    sub_1000080B0();
  }
  return a2;
}

uint64_t sub_1000056C0(uint64_t result)
{
  if ((*(unsigned char *)(result + 24) & 2) == 0) {
    operator new();
  }
  return result;
}

uint64_t sub_100005744(uint64_t result)
{
  if ((*(unsigned char *)(result + 24) & 2) == 0) {
    operator new();
  }
  return result;
}

void sub_1000057C0()
{
  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_badrepeat);
}

void sub_100005804(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

unsigned char *sub_100005818(uint64_t a1, unsigned char *a2, unsigned char *a3)
{
  if (a2 != a3)
  {
    int v3 = (char)*a2;
    BOOL v4 = (v3 - 36) > 0x3A || ((1 << (*a2 - 36)) & 0x7800000080004F1) == 0;
    if (v4 && (v3 - 123) >= 3) {
      sub_100005E78(a1);
    }
  }
  return a2;
}

void *sub_10000588C(void *a1)
{
  *a1 = off_10001C5D8;
  uint64_t v2 = a1[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  return a1;
}

void sub_1000058F8(void *a1)
{
  *a1 = off_10001C5D8;
  uint64_t v1 = a1[1];
  if (v1) {
    (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  }
  operator delete();
}

void sub_100005984()
{
  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_escape);
}

void sub_1000059C8(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *sub_1000059DC(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  if (a2 != a3)
  {
    int v4 = *a2;
    unsigned int v5 = v4 - 48;
    if (v4 == 48) {
      sub_100005E78(a1);
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
          sub_100006010(a1);
        }
      }
LABEL_13:
      sub_100005FB8();
    }
  }
  return a2;
}

char *sub_100005A94(uint64_t a1, char *a2, char *a3)
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
      sub_100006C70();
    if (v3 != 100) {
      return a2;
    }
LABEL_10:
    sub_100006C70();
  }
  switch(v3)
  {
    case 'D':
      goto LABEL_10;
    case 'S':
      goto LABEL_13;
    case 'W':
LABEL_12:
      sub_100006C70();
  }
  return a2;
}

unsigned __int8 *sub_100005B64(uint64_t a1, char *a2, char *a3, std::string *this)
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
          sub_100005E78(a1);
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
    sub_100005E78(a1);
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
    sub_100005984();
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
    sub_100005E78(a1);
  }
  std::string::operator=(this, v16 & 0x1F);
  v4 += 2;
  return (unsigned __int8 *)v4;
}

void sub_100005E78(uint64_t a1)
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

void sub_100005F94()
{
}

void sub_100005FB8()
{
  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_backref);
}

void sub_100005FFC(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_100006010(uint64_t a1)
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

uint64_t sub_100006140(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)a1 = off_10001C770;
  *(void *)(a1 + 8) = a4;
  std::locale::locale((std::locale *)(a1 + 16), (const std::locale *)a2);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 8);
  *(unsigned char *)(a1 + 40) = (*(uint64_t (**)(void, uint64_t))(**(void **)(a2 + 8) + 40))(*(void *)(a2 + 8), a3);
  return a1;
}

void sub_1000061D4(_Unwind_Exception *a1)
{
  std::locale::~locale(v2);
  void *v1 = off_10001C5D8;
  uint64_t v4 = v1[1];
  if (v4) {
    sub_100016E98(v4);
  }
  _Unwind_Resume(a1);
}

std::locale *sub_100006214(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)off_10001C770;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)off_10001C5D8;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  return a1;
}

void sub_1000062A0(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)off_10001C770;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)off_10001C5D8;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  operator delete();
}

uint64_t sub_10000634C(uint64_t result, uint64_t a2)
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

std::locale *sub_1000063E0(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)off_10001C7B8;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)off_10001C5D8;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  return a1;
}

void sub_10000646C(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)off_10001C7B8;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)off_10001C5D8;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  operator delete();
}

uint64_t sub_100006518(uint64_t result, uint64_t a2)
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

void *sub_100006560(void *a1)
{
  *a1 = off_10001C5D8;
  uint64_t v2 = a1[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  return a1;
}

void sub_1000065CC(void *a1)
{
  *a1 = off_10001C5D8;
  uint64_t v1 = a1[1];
  if (v1) {
    (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  }
  operator delete();
}

uint64_t sub_100006658(uint64_t result, uint64_t a2)
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

std::locale *sub_1000066A0(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)off_10001C848;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)off_10001C5D8;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  return a1;
}

void sub_10000672C(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)off_10001C848;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)off_10001C5D8;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  operator delete();
}

uint64_t sub_1000067D8(uint64_t result, uint64_t a2)
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

std::locale *sub_1000068F0(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)off_10001C890;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)off_10001C5D8;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  return a1;
}

void sub_10000697C(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)off_10001C890;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)off_10001C5D8;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  operator delete();
}

uint64_t sub_100006A28(uint64_t result, uint64_t a2)
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

void *sub_100006AB8(void *a1)
{
  *a1 = off_10001C5D8;
  uint64_t v2 = a1[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  return a1;
}

void sub_100006B24(void *a1)
{
  *a1 = off_10001C5D8;
  uint64_t v1 = a1[1];
  if (v1) {
    (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  }
  operator delete();
}

unsigned int *sub_100006BB0(unsigned int *result, uint64_t a2)
{
  unint64_t v2 = result[4];
  uint64_t v3 = *(void *)(a2 + 32);
  if (0xAAAAAAAAAAAAAAABLL * ((*(void *)(a2 + 40) - v3) >> 3) < v2) {
    sub_100005FB8();
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

void sub_100006C70()
{
}

void sub_100006CE8()
{
}

void sub_100006D0C(uint64_t a1, uint64_t a2)
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
      sub_100004A44();
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
    *unsigned int v5 = v2;
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

uint64_t sub_100006F54(uint64_t a1, uint64_t a2, uint64_t a3, char a4, char a5, char a6)
{
  *(void *)a1 = off_10001C920;
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

void sub_10000709C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10)
{
  std::locale::~locale((std::locale *)&a9);
  a10 = v10 + 17;
  sub_10000B184((void ***)&a10);
  std::string v15 = (void *)v10[14];
  if (v15)
  {
    v10[15] = v15;
    operator delete(v15);
  }
  sub_100007A74((void ***)&a10);
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
  void *v10 = v11;
  uint64_t v18 = v10[1];
  if (v18) {
    (*(void (**)(uint64_t))(*(void *)v18 + 8))(v18);
  }
  _Unwind_Resume(a1);
}

void sub_100007138(std::locale *a1)
{
  sub_100007BA8(a1);
  operator delete();
}

void sub_100007170(uint64_t a1, uint64_t a2)
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
  sub_100007D48(a1 + 16, (char *)&v125, (char *)&v127, (uint64_t)&__p);
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
    sub_100007C90(a1 + 16, (char *)&v125, (char *)&v127);
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
  sub_100007FA0(v8, (char *)&v125, (char *)&v127, (uint64_t)&__p);
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
    v47 = v46 ? v46 : v45;
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
      sub_100007C90(a1 + 16, (char *)&v125, (char *)&v126);
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
  sub_100007FA0(a1 + 16, (char *)&v125, (char *)&v126, (uint64_t)&__p);
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

void sub_100007A74(void ***a1)
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
        sub_100007B0C((uint64_t)(v1 + 2), v4);
      }
      while ((void *)v4 != v2);
      unsigned int v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void sub_100007B0C(uint64_t a1, uint64_t a2)
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

uint64_t sub_100007B64(uint64_t a1)
{
  if (*(char *)(a1 + 47) < 0) {
    operator delete(*(void **)(a1 + 24));
  }
  if (*(char *)(a1 + 23) < 0) {
    operator delete(*(void **)a1);
  }
  return a1;
}

std::locale *sub_100007BA8(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)off_10001C920;
  signed __int8 v7 = a1 + 17;
  sub_10000B184((void ***)&v7);
  locale = a1[14].__locale_;
  if (locale)
  {
    a1[15].__locale_ = locale;
    operator delete(locale);
  }
  signed __int8 v7 = a1 + 11;
  sub_100007A74((void ***)&v7);
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
  a1->__locale_ = (std::locale::__imp *)off_10001C5D8;
  unsigned int v5 = a1[1].__locale_;
  if (v5) {
    (*(void (**)(std::locale::__imp *))(*(void *)v5 + 8))(v5);
  }
  return a1;
}

void sub_100007C90(uint64_t a1, char *a2, char *a3)
{
  sub_100007EF8(__p, a2, a3, a3 - a2);
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

void sub_100007D2C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_100007D48(uint64_t a1@<X0>, char *a2@<X1>, char *a3@<X2>, uint64_t a4@<X8>)
{
  sub_100007EF8(&__s, a2, a3, a3 - a2);
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

void sub_100007EC4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (*(char *)(v17 + 23) < 0) {
    operator delete(*(void **)v17);
  }
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *sub_100007EF8(void *result, char *a2, char *a3, unint64_t a4)
{
  unint64_t v4 = result;
  if (a4 >= 0x7FFFFFFFFFFFFFF8) {
    sub_100001FE4();
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
    void *v4 = result;
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

void sub_100007FA0(uint64_t a1@<X0>, char *a2@<X1>, char *a3@<X2>, uint64_t a4@<X8>)
{
  sub_100007EF8(__p, a2, a3, a3 - a2);
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

void sub_100008094(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_1000080B0()
{
  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_brack);
}

void sub_1000080F4(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

char *sub_100008108(uint64_t a1, char *a2, char *a3, uint64_t *a4)
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
      char v10 = sub_1000086B0(a1, a2 + 2, a3, (uint64_t)a4);
      goto LABEL_38;
    }
    if (v9 == 61)
    {
      char v10 = sub_1000084D0(a1, a2 + 2, a3, a4);
LABEL_38:
      uint64_t v6 = (uint64_t)v10;
      char v21 = 0;
      goto LABEL_42;
    }
    goto LABEL_9;
  }
  size_t v19 = sub_100008764(a1, a2 + 2, a3, (uint64_t)&v26);
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
          uint64_t v14 = sub_100008974(a1, v13, a3, &v26);
        }
        else
        {
          uint64_t v14 = (char *)sub_10000884C(a1, v13, a3, &v26, v6);
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
          sub_100008FA4(v6, v16->__r_.__value_.__s.__data_[0], v16->__r_.__value_.__s.__data_[1]);
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
      sub_100006D0C(v6, v16->__r_.__value_.__s.__data_[0]);
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
    unint64_t v18 = sub_100008764(a1, v14 + 3, a3, (uint64_t)&v25);
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
        unint64_t v18 = sub_100008974(a1, v14 + 2, a3, &v25);
      }
      else {
        unint64_t v18 = (char *)sub_10000884C(a1, v14 + 2, a3, &v25, v6);
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
  sub_100008B7C(v6, (char *)&v24, (char *)&__p);
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

void sub_100008458(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  if (a28 < 0) {
    operator delete(__p);
  }
  if (*(char *)(v28 - 49) < 0) {
    operator delete(*(void **)(v28 - 72));
  }
  _Unwind_Resume(exception_object);
}

char *sub_1000084D0(uint64_t a1, char *a2, char *a3, uint64_t *a4)
{
  if (a3 - a2 < 2 || a3 - 1 == a2) {
    goto LABEL_33;
  }
  uint64_t v6 = a3 - 2;
  unint64_t v7 = a2;
  uint64_t v8 = a2;
  for (uint64_t i = a2; ; v8 = i)
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
    sub_1000080B0();
  sub_10000929C(a1, a2, v7, (uint64_t)&v20);
  if (((char)v22 & 0x80000000) == 0)
  {
    uint64_t v11 = v22;
    if (v22)
    {
      int v12 = (char *)&v20;
      goto LABEL_14;
    }
LABEL_34:
    sub_100009200();
  }
  uint64_t v11 = v21;
  if (!v21) {
    goto LABEL_34;
  }
  int v12 = (char *)v20;
LABEL_14:
  sub_10000944C(a1, v12, &v12[v11], (uint64_t)__p);
  unint64_t v13 = v19;
  if ((v19 & 0x80u) != 0) {
    unint64_t v13 = (unint64_t)__p[1];
  }
  if (v13)
  {
    sub_100009258(a4, (long long *)__p);
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
      sub_100008FA4((uint64_t)a4, *v16, v16[1]);
    }
    else
    {
      if (v14 != 1) {
        sub_100009200();
      }
      int v15 = (char *)&v20;
      if ((v22 & 0x80u) != 0) {
        int v15 = (char *)v20;
      }
      sub_100006D0C((uint64_t)a4, *v15);
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

void sub_100008678(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

char *sub_1000086B0(uint64_t a1, char *a2, char *a3, uint64_t a4)
{
  if (a3 - a2 < 2 || a3 - 1 == a2) {
    goto LABEL_11;
  }
  int v5 = a3 - 2;
  uint64_t v6 = a2;
  unint64_t v7 = a2;
  for (uint64_t i = a2; ; v7 = i)
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
    sub_1000080B0();
  int v10 = sub_1000095B4(a1, a2, v6, *(_DWORD *)(a1 + 24) & 1);
  if (!v10) {
    sub_10000955C();
  }
  *(_DWORD *)(a4 + 160) |= v10;
  return v6 + 2;
}

char *sub_100008764(uint64_t a1, char *a2, char *a3, uint64_t a4)
{
  if (a3 - a2 < 2 || a3 - 1 == a2) {
    goto LABEL_15;
  }
  int v5 = a3 - 2;
  uint64_t v6 = a2;
  unint64_t v7 = a2;
  for (uint64_t i = a2; ; v7 = i)
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
    sub_1000080B0();
  sub_10000929C(a1, a2, v6, (uint64_t)&v13);
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
    sub_100009200();
  }
  return v6 + 2;
}

unsigned __int8 *sub_10000884C(uint64_t a1, char *a2, char *a3, std::string *this, uint64_t a5)
{
  if (a2 == a3) {
    sub_100005984();
  }
  int v6 = *a2;
  if (v6 > 97)
  {
    if (v6 > 114)
    {
      if (v6 != 115)
      {
        if (v6 != 119) {
          return sub_100005B64(a1, a2, a3, this);
        }
        *(_DWORD *)(a5 + 160) |= 0x500u;
        sub_100006D0C(a5, 95);
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
        return sub_100005B64(a1, a2, a3, this);
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
      return sub_100005B64(a1, a2, a3, this);
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
    sub_100009688(a5, 95);
    return (unsigned __int8 *)(a2 + 1);
  }
  return sub_100005B64(a1, a2, a3, this);
}

char *sub_100008974(uint64_t a1, char *a2, char *a3, std::string *this)
{
  if (a2 == a3) {
LABEL_45:
  }
    sub_100005984();
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
      sub_100005E78(a1);
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
    sub_100005E78(a1);
  }
  std::string::operator=(this, v7);
  return v11;
}

void sub_100008B7C(uint64_t a1, char *a2, char *a3)
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
    sub_100009A3C(a1 + 16, v4, &v4[v25]);
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
    sub_100009A3C(a1 + 16, v3, &v3[v27]);
    *(_OWORD *)long long v40 = v38;
    uint64_t v41 = v39;
    *(_OWORD *)std::string __p = *(_OWORD *)v36;
    uint64_t v43 = v37;
    sub_1000098D0((uint64_t *)(a1 + 88), (long long *)v40);
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
      sub_100009AF4();
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
    sub_1000098D0((uint64_t *)(a1 + 88), (long long *)v40);
    if (SHIBYTE(v43) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v41) < 0) {
      operator delete(v40[0]);
    }
  }
}

void sub_100008F58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,char a21)
{
}

void sub_100008FA4(uint64_t a1, uint64_t a2, uint64_t a3)
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
          uint64_t v25 = (char *)sub_100009DCC(v18, v24);
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
          uint64_t v37 = (char *)sub_100009DCC(v18, v36);
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
    sub_100004A44();
  }
  unsigned __int8 v5 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), a2);
  __int16 v6 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), a3);
  unint64_t v7 = *(void *)(a1 + 128);
  __int16 v8 = v5 | (unsigned __int16)(v6 << 8);
  char v9 = *(_WORD **)(a1 + 120);
  if ((unint64_t)v9 < v7)
  {
LABEL_24:
    *char v9 = v8;
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
    uint64_t v17 = (char *)sub_100009DCC(a1 + 128, v16);
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

void sub_100009200()
{
  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_collate);
}

void sub_100009244(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_100009258(uint64_t *a1, long long *a2)
{
  uint64_t v3 = a1 + 17;
  unint64_t v4 = a1[18];
  if (v4 >= a1[19])
  {
    uint64_t result = sub_10000D8A8(v3, a2);
  }
  else
  {
    sub_10000D848(v3, a2);
    uint64_t result = v4 + 24;
  }
  a1[18] = result;
  return result;
}

void sub_10000929C(uint64_t a1@<X0>, char *a2@<X1>, char *a3@<X2>, uint64_t a4@<X8>)
{
  sub_100007EF8(&__s, a2, a3, a3 - a2);
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

void sub_100009418(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (*(char *)(v17 + 23) < 0) {
    operator delete(*(void **)v17);
  }
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_10000944C(uint64_t a1@<X0>, char *a2@<X1>, char *a3@<X2>, uint64_t a4@<X8>)
{
  sub_100007EF8(__p, a2, a3, a3 - a2);
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

void sub_100009540(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_10000955C()
{
  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_ctype);
}

void sub_1000095A0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1000095B4(uint64_t a1, char *a2, char *a3, BOOL a4)
{
  sub_100007EF8(__p, a2, a3, a3 - a2);
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

void sub_10000966C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_100009688(uint64_t a1, uint64_t a2)
{
  char v2 = a2;
  if (*(unsigned char *)(a1 + 169))
  {
    char v2 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), a2);
    unsigned __int8 v5 = *(unsigned char **)(a1 + 72);
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
          unsigned __int8 v5 = (unsigned char *)*v6;
          goto LABEL_47;
        }
        goto LABEL_46;
      }
LABEL_50:
      sub_100004A44();
    }
    goto LABEL_22;
  }
  unint64_t v6 = (unint64_t *)(a1 + 64);
  unsigned __int8 v5 = *(unsigned char **)(a1 + 72);
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
    *unsigned __int8 v5 = v2;
    uint64_t v19 = (uint64_t)(v5 + 1);
    goto LABEL_49;
  }
  if ((unint64_t)v5 < v13) {
    goto LABEL_22;
  }
  unint64_t v14 = *v6;
  unint64_t v15 = &v5[-*v6];
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

void **sub_1000098D0(uint64_t *a1, long long *a2)
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
      sub_100004A44();
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
      unint64_t v15 = (char *)sub_100009BC4((uint64_t)result, v14);
    }
    else {
      unint64_t v15 = 0;
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
    sub_100009B4C(a1, v19);
    uint64_t v10 = a1[1];
    uint64_t result = sub_100009D50(v19);
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

void sub_100009A28(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_100009D50((void **)va);
  _Unwind_Resume(a1);
}

void sub_100009A3C(uint64_t a1, char *a2, char *a3)
{
  sub_100007EF8(__p, a2, a3, a3 - a2);
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

void sub_100009AD8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_100009AF4()
{
  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_range);
}

void sub_100009B38(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_100009B4C(uint64_t *a1, void *a2)
{
  uint64_t result = sub_100009C0C((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
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

void *sub_100009BC4(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x555555555555556) {
    sub_10000208C();
  }
  return operator new(48 * a2);
}

uint64_t sub_100009C0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
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
  sub_100009CC4((uint64_t)v13);
  return a6;
}

uint64_t sub_100009CC4(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    sub_100009CFC((uint64_t *)a1);
  }
  return a1;
}

void sub_100009CFC(uint64_t *a1)
{
  uint64_t v1 = *(void *)(a1[2] + 8);
  uint64_t v2 = *(void *)(a1[1] + 8);
  if (v1 != v2)
  {
    uint64_t v3 = *a1;
    do
    {
      sub_100007B0C(v3, v1);
      v1 += 48;
    }
    while (v1 != v2);
  }
}

void **sub_100009D50(void **a1)
{
  if (*a1) {
    operator delete(*a1);
  }
  return a1;
}

void sub_100009D84(void *a1)
{
  uint64_t v2 = a1[1];
  for (uint64_t i = a1[2]; i != v2; uint64_t i = a1[2])
  {
    uint64_t v4 = a1[4];
    a1[2] = i - 48;
    sub_100007B0C(v4, i - 48);
  }
}

void *sub_100009DCC(uint64_t a1, uint64_t a2)
{
  if (a2 < 0) {
    sub_10000208C();
  }
  return operator new(2 * a2);
}

void *sub_100009E00(void *a1)
{
  *a1 = off_10001C5D8;
  uint64_t v2 = a1[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  return a1;
}

void sub_100009E6C(void *a1)
{
  *a1 = off_10001C5D8;
  uint64_t v1 = a1[1];
  if (v1) {
    (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  }
  operator delete();
}

uint64_t sub_100009EF8(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -994;
  *(void *)(*(void *)(a2 + 32) + 24 * (*(_DWORD *)(result + 16) - 1)) = *(void *)(a2 + 16);
  *(void *)(a2 + 80) = *(void *)(result + 8);
  return result;
}

void *sub_100009F28(void *a1)
{
  *a1 = off_10001C5D8;
  uint64_t v2 = a1[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  return a1;
}

void sub_100009F94(void *a1)
{
  *a1 = off_10001C5D8;
  uint64_t v1 = a1[1];
  if (v1) {
    (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  }
  operator delete();
}

uint64_t sub_10000A020(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -994;
  uint64_t v2 = *(void *)(a2 + 32) + 24 * (*(_DWORD *)(result + 16) - 1);
  *(void *)(v2 + 8) = *(void *)(a2 + 16);
  *(unsigned char *)(v2 + 16) = 1;
  *(void *)(a2 + 80) = *(void *)(result + 8);
  return result;
}

void sub_10000A058()
{
}

void sub_10000A1B0(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *sub_10000A1E8(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3, int *a4)
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
            sub_10000A288();
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

void sub_10000A288()
{
  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_badbrace);
}

void sub_10000A2CC(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_10000A2E0()
{
  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_brace);
}

void sub_10000A324(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_10000A33C(void *a1)
{
  sub_10000A494(a1);
  operator delete();
}

unsigned int *sub_10000A374(unsigned int *result, void *a2)
{
  uint64_t v2 = result[10];
  uint64_t v3 = a2[7];
  int v4 = (unint64_t *)(v3 + 16 * v2);
  if (*(_DWORD *)a2 == -991)
  {
    unint64_t v5 = *v4 + 1;
    unint64_t *v4 = v5;
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
      return sub_10000A548(result, a2);
    }
    goto LABEL_23;
  }
  unint64_t *v4 = 0;
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

unsigned int *sub_10000A428(unsigned int *result, int a2, void *a3)
{
  *(_DWORD *)a3 = -994;
  if (*((unsigned __int8 *)result + 52) == a2)
  {
    a3[10] = *((void *)result + 2);
  }
  else
  {
    a3[10] = *((void *)result + 1);
    return sub_10000A548(result, a3);
  }
  return result;
}

void sub_10000A45C(void *a1)
{
  sub_10000A494(a1);
  operator delete();
}

void *sub_10000A494(void *a1)
{
  *a1 = off_10001CA58;
  uint64_t v2 = a1[2];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  *a1 = off_10001C5D8;
  uint64_t v3 = a1[1];
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
  }
  return a1;
}

unsigned int *sub_10000A548(unsigned int *result, void *a2)
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

void sub_10000A5A0()
{
}

uint64_t sub_10000A5B4(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -991;
  *(void *)(a2 + 80) = *(void *)(result + 8);
  return result;
}

void sub_10000A5CC(void *a1)
{
  sub_10000A494(a1);
  operator delete();
}

void sub_10000A604(uint64_t a1, _DWORD *a2)
{
  *a2 = -992;
}

uint64_t sub_10000A610(uint64_t result, int a2, uint64_t a3)
{
  *(_DWORD *)a3 = -994;
  uint64_t v3 = 8;
  if (a2) {
    uint64_t v3 = 16;
  }
  *(void *)(a3 + 80) = *(void *)(result + v3);
  return result;
}

void sub_10000A638()
{
}

uint64_t sub_10000A64C(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -994;
  *(void *)(a2 + 80) = *(void *)(result + 8);
  return result;
}

uint64_t sub_10000A660(uint64_t a1, uint64_t a2, uint64_t a3)
{
  do
  {
    uint64_t v5 = a2;
    a2 = sub_10000A704(a1, a2, a3);
  }
  while (v5 != a2);
  return v5;
}

void sub_10000A6AC()
{
  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, __re_err_empty);
}

void sub_10000A6F0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *sub_10000A704(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  if (a2 == a3) {
    return a2;
  }
  uint64_t v6 = sub_10000A7A0(a1, a2, a3);
  if (v6 == a2) {
    return a2;
  }
  return sub_10000A8B4(a1, v6, a3);
}

unsigned char *sub_10000A7A0(uint64_t a1, unsigned char *a2, unsigned char *a3)
{
  uint64_t v6 = sub_10000AA58(a1, a2, a3);
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
        int v11 = sub_10000AD44(a1, a2[1]);
        uint64_t v12 = 2;
        if (!v11) {
          uint64_t v12 = 0;
        }
        return &a2[v12];
      }
    }
    else
    {
      sub_1000056C0(a1);
      uint64_t v10 = (unsigned char *)sub_10000A660(a1, v9, (uint64_t)a3);
      if (v10 == a3 || v10 + 1 == a3 || *v10 != 92 || v10[1] != 41) {
        sub_100003AD4();
      }
      uint64_t v7 = v10 + 2;
      sub_100005744(a1);
    }
  }
  return v7;
}

unsigned __int8 *sub_10000A8B4(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  if (a2 != a3)
  {
    int v4 = *a2;
    if (v4 == 42) {
      sub_10000A058();
    }
    if (a2 + 1 != a3 && v4 == 92 && a2[1] == 123)
    {
      uint64_t v6 = a2 + 2;
      int v13 = 0;
      uint64_t v7 = sub_10000A1E8(a1, a2 + 2, a3, &v13);
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
          uint64_t v10 = sub_10000A1E8(a1, v8, a3, &v12);
          if (v10 != a3 && v10 + 1 != a3 && *v10 == 92 && v10[1] == 125)
          {
            if (v12 != -1 && v12 < v13) {
LABEL_16:
            }
              sub_10000A288();
LABEL_20:
            sub_10000A058();
          }
        }
        else if (v8 != a3 && v9 == 92 && *v8 == 125)
        {
          goto LABEL_20;
        }
      }
      sub_10000A2E0();
    }
  }
  return a2;
}

unsigned char *sub_10000AA58(uint64_t a1, unsigned char *a2, unsigned char *a3)
{
  if (a2 == a3)
  {
    uint64_t result = sub_10000AB90(a1, a2, a3);
    if (result != a2) {
      return result;
    }
    goto LABEL_12;
  }
  int v6 = *a2;
  if ((a2 + 1 != a3 || v6 != 36)
    && ((v6 - 46) > 0x2E || ((1 << (v6 - 46)) & 0x600000000001) == 0))
  {
    sub_100005E78(a1);
  }
  uint64_t result = sub_10000AB90(a1, a2, a3);
  if (result == a2)
  {
    if (*a2 == 46) {
      operator new();
    }
LABEL_12:
    return sub_1000055AC(a1, a2, a3);
  }
  return result;
}

unsigned char *sub_10000AB90(uint64_t a1, unsigned char *a2, unsigned char *a3)
{
  if (a2 != a3
    && a2 + 1 != a3
    && *a2 == 92
    && ((char)a2[1] - 36) <= 0x3A
    && ((1 << (a2[1] - 36)) & 0x580000000000441) != 0)
  {
    sub_100005E78(a1);
  }
  return a2;
}

void *sub_10000AC0C(void *a1)
{
  *a1 = off_10001C5D8;
  uint64_t v2 = a1[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  return a1;
}

void sub_10000AC78(void *a1)
{
  *a1 = off_10001C5D8;
  uint64_t v1 = a1[1];
  if (v1) {
    (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  }
  operator delete();
}

uint64_t sub_10000AD04(uint64_t result, uint64_t a2)
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

uint64_t sub_10000AD44(uint64_t a1, unsigned __int8 a2)
{
  if (((a2 & 0xF8) == 0x30 || (a2 & 0xFE) == 0x38) && a2 - 49 <= 8)
  {
    if (a2 - 48 <= *(_DWORD *)(a1 + 28)) {
      sub_100006010(a1);
    }
    sub_100005FB8();
  }
  return 0;
}

unsigned __int8 *sub_10000ADA4(uint64_t a1, char *a2, char *a3)
{
  int v6 = sub_10000AE04(a1, a2, a3);
  if (v6 == (unsigned __int8 *)a2) {
    sub_10000A6AC();
  }
  do
  {
    uint64_t v7 = v6;
    int v6 = sub_10000AE04(a1, (char *)v6, a3);
  }
  while (v7 != v6);
  return v7;
}

unsigned __int8 *sub_10000AE04(uint64_t a1, char *a2, char *a3)
{
  int v6 = sub_10000AF48(a1, a2, a3);
  uint64_t v7 = (unsigned __int8 *)v6;
  if (v6 == a2 && v6 != a3)
  {
    int v8 = *a2;
    if (v8 == 36) {
      sub_100003914();
    }
    if (v8 != 40)
    {
      if (v8 == 94) {
        sub_100003890();
      }
      return (unsigned __int8 *)a2;
    }
    sub_1000056C0(a1);
    ++*(_DWORD *)(a1 + 36);
    int v9 = (char *)sub_1000027FC(a1, a2 + 1, a3);
    if (v9 == a3 || (uint64_t v10 = v9, *v9 != 41)) {
      sub_100003AD4();
    }
    sub_100005744(a1);
    --*(_DWORD *)(a1 + 36);
    uint64_t v7 = (unsigned __int8 *)(v10 + 1);
  }
  if (v7 == (unsigned __int8 *)a2) {
    return (unsigned __int8 *)a2;
  }
  return sub_100003584(a1, v7, (unsigned __int8 *)a3);
}

char *sub_10000AF48(uint64_t a1, char *a2, char *a3)
{
  uint64_t result = sub_10000B030(a1, a2, a3);
  if (result == a2)
  {
    uint64_t result = sub_10000B0BC(a1, a2, a3);
    if (result == a2)
    {
      if (a2 != a3 && *a2 == 46) {
        operator new();
      }
      return sub_1000055AC(a1, a2, a3);
    }
  }
  return result;
}

char *sub_10000B030(uint64_t a1, char *a2, char *a3)
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
    sub_100005E78(a1);
  }
  return a2;
}

char *sub_10000B0BC(uint64_t a1, char *a2, char *a3)
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
        sub_100005E78(a1);
      }
      if ((*(_DWORD *)(a1 + 24) & 0x1F0) == 0x40)
      {
        return sub_100008974(a1, v4, a3, 0);
      }
      else
      {
        int v8 = sub_10000AD44(a1, *v4);
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

void sub_10000B184(void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    sub_10000B1D8((uint64_t *)v2);
    int v3 = **a1;
    operator delete(v3);
  }
}

void sub_10000B1D8(uint64_t *a1)
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

std::string *sub_10000B228(std::string *a1, char *a2)
{
  a1->__r_.__value_.__r.__words[0] = 0;
  a1->__r_.__value_.__l.__size_ = 0;
  a1->__r_.__value_.__r.__words[2] = 0;
  LODWORD(v3) = a2[23];
  BOOL v4 = (int)v3 < 0;
  uint64_t v5 = *((void *)a2 + 1);
  if ((int)v3 < 0) {
    a2 = *(char **)a2;
  }
  uint64_t v3 = v3;
  if (v4) {
    uint64_t v3 = v5;
  }
  sub_10000B290(a1, a2, &a2[v3]);
  return a1;
}

void sub_10000B274(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

std::string *sub_10000B290(std::string *this, char *a2, char *a3)
{
  BOOL v4 = a2;
  LODWORD(v6) = SHIBYTE(this->__r_.__value_.__r.__words[2]);
  unint64_t v7 = a3 - a2;
  if ((v6 & 0x80000000) != 0)
  {
    if (a3 == a2) {
      return this;
    }
    std::string::size_type size = this->__r_.__value_.__l.__size_;
    unint64_t v11 = this->__r_.__value_.__r.__words[2];
    std::string::size_type v9 = (v11 & 0x7FFFFFFFFFFFFFFFLL) - 1;
    uint64_t v10 = (std::string *)this->__r_.__value_.__r.__words[0];
    unint64_t v6 = HIBYTE(v11);
  }
  else
  {
    if (a3 == a2) {
      return this;
    }
    std::string::size_type size = HIBYTE(this->__r_.__value_.__r.__words[2]);
    std::string::size_type v9 = 22;
    uint64_t v10 = this;
  }
  if (v10 > (std::string *)v4 || (char *)&v10->__r_.__value_.__l.__data_ + size + 1 <= v4)
  {
    if (v9 - size < v7)
    {
      std::string::__grow_by(this, v9, size - v9 + v7, size, size, 0, 0);
      this->__r_.__value_.__l.__size_ = size;
      LOBYTE(v6) = *((unsigned char *)&this->__r_.__value_.__s + 23);
    }
    char v14 = this;
    if ((v6 & 0x80) != 0) {
      char v14 = (std::string *)this->__r_.__value_.__r.__words[0];
    }
    for (uint64_t i = (char *)v14 + size; v4 != a3; ++i)
    {
      char v16 = *v4++;
      *uint64_t i = v16;
    }
    *uint64_t i = 0;
    std::string::size_type v17 = v7 + size;
    if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0) {
      this->__r_.__value_.__l.__size_ = v17;
    }
    else {
      *((unsigned char *)&this->__r_.__value_.__s + 23) = v17 & 0x7F;
    }
  }
  else
  {
    sub_100007EF8(__p, v4, a3, v7);
    if ((v20 & 0x80u) == 0) {
      int v12 = __p;
    }
    else {
      int v12 = (void **)__p[0];
    }
    if ((v20 & 0x80u) == 0) {
      std::string::size_type v13 = v20;
    }
    else {
      std::string::size_type v13 = (std::string::size_type)__p[1];
    }
    std::string::append(this, (const std::string::value_type *)v12, v13);
    if ((char)v20 < 0) {
      operator delete(__p[0]);
    }
  }
  return this;
}

void sub_10000B3EC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_10000B408(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  __int16 v5 = a5;
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
  int v9 = sub_10000B500(a4, a1, a2, (uint64_t)__p, a5 | 0x1040u);
  sub_10000B6DC(a3, a1, a2, (uint64_t *)__p, (v5 & 0x800) != 0);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if (!v9) {
    return 0;
  }
  if (!*(unsigned char *)(a3 + 88)) {
    return 1;
  }
  uint64_t result = 0;
  *(void *)(a3 + 8) = *(void *)a3;
  return result;
}

void sub_10000B4E4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_10000B500(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  if ((a5 & 0x80) != 0) {
    int v9 = a5 & 0xFFA;
  }
  else {
    int v9 = a5;
  }
  sub_100004394(a4, *(_DWORD *)(a1 + 28) + 1, a2, a3, (unsigned __int16)(v9 & 0x800) >> 11);
  if (sub_10000B86C(a1, a2, a3, (uint64_t *)a4, v9, (v9 & 0x800) == 0))
  {
    if (*(void *)(a4 + 8) == *(void *)a4) {
      uint64_t v10 = (uint64_t *)(a4 + 24);
    }
    else {
      uint64_t v10 = *(uint64_t **)a4;
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
        sub_100004878((char **)a4, 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a4 + 8) - *(void *)a4) >> 3), (long long *)(a4 + 24));
        int v16 = sub_10000B86C(a1, v15, a3, (uint64_t *)a4, v14, 0);
        uint64_t v18 = *(void *)a4;
        uint64_t v17 = *(void *)(a4 + 8);
        if (v16) {
          break;
        }
        sub_100004878((char **)a4, 0xAAAAAAAAAAAAAAABLL * ((v17 - v18) >> 3), (long long *)(a4 + 24));
        if (++v15 == a3) {
          goto LABEL_14;
        }
      }
      if (v17 == v18) {
        uint64_t v10 = (uint64_t *)(a4 + 24);
      }
      else {
        uint64_t v10 = *(uint64_t **)a4;
      }
      goto LABEL_8;
    }
LABEL_14:
    sub_100004878((char **)a4, 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a4 + 8) - *(void *)a4) >> 3), (long long *)(a4 + 24));
    if (sub_10000B86C(a1, a3, a3, (uint64_t *)a4, v14, 0))
    {
      if (*(void *)(a4 + 8) == *(void *)a4) {
        uint64_t v10 = (uint64_t *)(a4 + 24);
      }
      else {
        uint64_t v10 = *(uint64_t **)a4;
      }
      goto LABEL_8;
    }
  }
  uint64_t result = 0;
  *(void *)(a4 + 8) = *(void *)a4;
  return result;
}

void sub_10000B6DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, char a5)
{
  uint64_t v10 = a4[6];
  sub_10000D690(a1, 0xAAAAAAAAAAAAAAABLL * ((a4[1] - *a4) >> 3));
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
        char v19 = a4 + 3;
      }
      else {
        char v19 = (uint64_t *)(*a4 + v12);
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

uint64_t sub_10000B86C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, int a5, char a6)
{
  if ((*(_WORD *)(a1 + 24) & 0x1F0) == 0) {
    return sub_100004408(a1, a2, a3, a4, a5, a6);
  }
  if (*(_DWORD *)(a1 + 28)) {
    return sub_10000BE3C(a1, a2, a3, a4, a5, a6);
  }
  return sub_10000B88C(a1, a2, a3, a4, a5, a6);
}

uint64_t sub_10000B88C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, int a5, char a6)
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
    sub_10000C404(&v61, (uint64_t)v57);
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
    sub_100004B24(*(void *)(v12 + 8 * v14) + 32 * v16 + 56, *(unsigned int *)(a1 + 32));
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
        sub_100004B54();
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
            sub_10000C508(&v61);
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
                sub_100004F84((uint64_t)&v63 + 8, v42);
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
          sub_10000C59C((uint64_t)&v61, v28 + 96 * v29);
          goto LABEL_37;
        case 0xFFFFFC1F:
LABEL_37:
          sub_10000C508(&v61);
          goto LABEL_38;
        case 0xFFFFFC20:
          long long v45 = *(_OWORD *)(v30 + 16);
          *(_OWORD *)int v57 = *(_OWORD *)v30;
          *(_OWORD *)&v57[16] = v45;
          long long v58 = 0uLL;
          *(void *)&v57[32] = 0;
          sub_100005338(&v57[32], *(long long **)(v28 + 96 * v29 + 32), *(long long **)(v28 + 96 * v29 + 40), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(v28 + 96 * v29 + 40) - *(void *)(v28 + 96 * v29 + 32)) >> 3));
          __p[0] = 0;
          __p[1] = 0;
          v60[0] = 0;
          sub_1000053B8((char *)__p, *(long long **)(v28 + 96 * v29 + 56), *(long long **)(v28 + 96 * v29 + 64), (uint64_t)(*(void *)(v28 + 96 * v29 + 64) - *(void *)(v28 + 96 * v29 + 56)) >> 4);
          uint64_t v46 = *v32;
          *(void *)((char *)&v60[1] + 5) = *(void *)(v30 + 85);
          v60[1] = v46;
          (*(void (**)(void, uint64_t, unint64_t))(*(void *)*v32 + 24))(*v32, 1, v28 + 96 * v29);
          (*(void (**)(void, void, unsigned char *))(*(void *)v60[1] + 24))(v60[1], 0, v57);
          sub_10000C404(&v61, (uint64_t)v57);
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
          sub_100004BAC();
      }
      break;
    }
  }
  else
  {
LABEL_56:
    uint64_t v50 = 0;
  }
  sub_10000D1E0(&v61);
  return v50;
}

void sub_10000BDC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,void *__p,uint64_t a22)
{
  sub_10000D1E0((void *)(v22 - 144));
  _Unwind_Resume(a1);
}

uint64_t sub_10000BE3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, int a5, char a6)
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
    BOOL v56 = (_OWORD *)sub_100004C04((uint64_t *)&v55, (uint64_t)v47);
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
    sub_100004AE8((uint64_t)(v11 - 4), *(unsigned int *)(a1 + 28), &v50);
    sub_100004B24((uint64_t)v56 - 40, *(unsigned int *)(a1 + 32));
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
        sub_100004B54();
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
              sub_10000D388(&v52[32], *((long long **)v15 - 8), *((long long **)v15 - 7), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)v15 - 7) - *((void *)v15 - 8)) >> 3));
              sub_10000D540(v54, *((uint64_t **)v15 - 5), *((uint64_t **)v15 - 4), (uint64_t)(*((void *)v15 - 4) - *((void *)v15 - 5)) >> 4);
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
              sub_100004F84((uint64_t)v57, v32);
            }
            BOOL v56 = (_OWORD *)v33;
            char v12 = 1;
            uint64_t v44 = v14;
          }
          else
          {
            uint64_t v44 = v29;
            unint64_t v34 = v56 - 6;
            sub_100004F84((uint64_t)v57, (void *)v56 - 12);
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
          sub_100004F84((uint64_t)v57, (void *)v56 - 12);
          BOOL v56 = v21;
          break;
        case 0xFFFFFC20:
          long long v22 = *(v15 - 5);
          *(_OWORD *)unint64_t v47 = *(_OWORD *)v19;
          *(_OWORD *)&v47[16] = v22;
          memset(&v47[32], 0, 24);
          sub_100005338(&v47[32], *((long long **)v15 - 8), *((long long **)v15 - 7), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)v15 - 7) - *((void *)v15 - 8)) >> 3));
          __p[0] = 0;
          __p[1] = 0;
          v49[0] = 0;
          sub_1000053B8((char *)__p, *((long long **)v15 - 5), *((long long **)v15 - 4), (uint64_t)(*((void *)v15 - 4) - *((void *)v15 - 5)) >> 4);
          unint64_t v23 = (void *)*v18;
          *(void *)((char *)&v49[1] + 5) = *(void *)((char *)v15 - 11);
          v49[1] = v23;
          (*(void (**)(void, uint64_t, _OWORD *))(*(void *)*v18 + 24))(*v18, 1, v15 - 6);
          (*(void (**)(void, void, unsigned char *))(*(void *)v49[1] + 24))(v49[1], 0, v47);
          unint64_t v24 = v56;
          if ((unint64_t)v56 >= v57[0])
          {
            BOOL v56 = (_OWORD *)sub_100004C04((uint64_t *)&v55, (uint64_t)v47);
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
          sub_100004BAC();
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
  sub_100005470((void ***)v52);
  return v6;
}

void sub_10000C37C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *__p,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33)
{
  sub_100004AA4(&a17);
  sub_100004AA4(&a33);
  a33 = v33 - 120;
  sub_100005470((void ***)&a33);
  _Unwind_Resume(a1);
}

__n128 sub_10000C404(void *a1, uint64_t a2)
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
    sub_10000C690(a1);
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

uint64_t sub_10000C508(void *a1)
{
  uint64_t v2 = a1 + 5;
  unint64_t v3 = a1[5] + a1[4] - 1;
  sub_100004F84((uint64_t)(a1 + 5), (void *)(*(void *)(a1[1] + 8 * (v3 / 0x2A)) + 96 * (v3 % 0x2A)));
  --*v2;
  return sub_10000CE4C(a1, 1);
}

int64x2_t sub_10000C59C(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = *(void *)(a1 + 32);
  if (!v4)
  {
    sub_10000CEC4((void **)a1);
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
  int64x2_t result = vaddq_s64(*(int64x2_t *)(a1 + 32), (int64x2_t)xmmword_100017F70);
  *(int64x2_t *)(a1 + 32) = result;
  return result;
}

void sub_10000C690(void *a1)
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
      unint64_t v34 = (char *)sub_10000CE14(v5, v33);
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
      sub_10000C9A8(a1, &v54);
      return;
    }
    *(void *)&long long v54 = operator new(0xFC0uLL);
    sub_10000CAC0((uint64_t)a1, &v54);
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
      unint64_t v34 = (char *)sub_10000CE14((uint64_t)(a1 + 3), v46);
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
  *(void *)&long long v54 = sub_10000CE14((uint64_t)(a1 + 3), v25);
  *((void *)&v54 + 1) = v54 + 8 * v22;
  *(void *)&long long v55 = *((void *)&v54 + 1);
  *((void *)&v55 + 1) = v54 + 8 * v26;
  long long v53 = operator new(0xFC0uLL);
  sub_10000CBE0(&v54, &v53);
  char v27 = (void *)a1[2];
  uint64_t v28 = -7 - (void)v27;
  while (v27 != (void *)a1[1])
  {
    --v27;
    v28 += 8;
    sub_10000CCF8((uint64_t)&v54, v27);
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

void sub_10000C95C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13)
{
  operator delete(v13);
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void sub_10000C9A8(void *a1, void *a2)
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
      uint64_t v19 = (char *)sub_10000CE14(v4, v18);
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

void sub_10000CAC0(uint64_t a1, void *a2)
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
      uint64_t v14 = (char *)sub_10000CE14(v6, v12);
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

void sub_10000CBE0(void *a1, void *a2)
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
      uint64_t v17 = (char *)sub_10000CE14(a1[4], v16);
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

void sub_10000CCF8(uint64_t a1, void *a2)
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
      uint64_t v13 = (char *)sub_10000CE14(*(void *)(a1 + 32), v11);
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

void *sub_10000CE14(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    sub_10000208C();
  }
  return operator new(8 * a2);
}

uint64_t sub_10000CE4C(void *a1, int a2)
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

void sub_10000CEC4(void **a1)
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
      std::string __p = sub_10000CE14(v7, v11);
      uint64_t v43 = (char *)__p;
      uint64_t v44 = (char *)__p;
      uint64_t v45 = (char *)__p + 8 * v12;
      __int16 v41 = operator new(0xFC0uLL);
      sub_10000CBE0(&__p, &v41);
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
              uint64_t v24 = (char *)sub_10000CE14((uint64_t)v46, v23);
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
        sub_10000C9A8(a1, &__p);
        unint64_t v34 = a1[2];
        std::string __p = (void *)*(v34 - 1);
        a1[2] = v34 - 1;
      }
      else
      {
        std::string __p = operator new(0xFC0uLL);
      }
      sub_10000CAC0((uint64_t)a1, &__p);
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
    sub_10000CAC0((uint64_t)a1, &__p);
  }
}

void sub_10000D194(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  operator delete(v12);
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_10000D1E0(void *a1)
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
        sub_100004F84((uint64_t)v2, v7);
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
  return sub_10000D338((uint64_t)a1);
}

uint64_t sub_10000D338(uint64_t a1)
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

char *sub_10000D388(void *a1, long long *a2, long long *a3, unint64_t a4)
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
      sub_100004A44();
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
    int64x2_t result = sub_1000049F0(a1, v12);
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

char *sub_10000D540(void *a1, uint64_t *a2, uint64_t *a3, unint64_t a4)
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
      sub_100004A44();
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
    int64x2_t result = sub_10000542C(a1, v11);
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

void sub_10000D690(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 3);
  BOOL v3 = a2 >= v2;
  unint64_t v4 = a2 - v2;
  if (v4 != 0 && v3)
  {
    sub_10000D6CC((void **)a1, v4);
  }
  else if (!v3)
  {
    *(void *)(a1 + 8) = *(void *)a1 + 24 * a2;
  }
}

void sub_10000D6CC(void **a1, unint64_t a2)
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
      sub_100004A44();
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
      unint64_t v12 = (char *)sub_100004A5C(v4, v11);
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

void *sub_10000D848(void *result, long long *a2)
{
  unint64_t v2 = result;
  uint64_t v3 = result[1];
  if (*((char *)a2 + 23) < 0)
  {
    int64x2_t result = sub_1000020C0((unsigned char *)result[1], *(void **)a2, *((void *)a2 + 1));
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

void sub_10000D8A0(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t sub_10000D8A8(uint64_t *a1, long long *a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0xAAAAAAAAAAAAAAALL) {
    sub_100004A44();
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
  int64_t v18 = a1 + 2;
  if (v9) {
    unint64_t v10 = (char *)sub_100004A5C(v7, v9);
  }
  else {
    unint64_t v10 = 0;
  }
  unint64_t v11 = &v10[24 * v4];
  v15[0] = v10;
  v15[1] = v11;
  long long v16 = v11;
  uint64_t v17 = &v10[24 * v9];
  if (*((char *)a2 + 23) < 0)
  {
    sub_1000020C0(v11, *(void **)a2, *((void *)a2 + 1));
    unint64_t v11 = v16;
  }
  else
  {
    long long v12 = *a2;
    *((void *)v11 + 2) = *((void *)a2 + 2);
    *(_OWORD *)unint64_t v11 = v12;
  }
  long long v16 = v11 + 24;
  sub_10000D9CC(a1, v15);
  uint64_t v13 = a1[1];
  sub_10000DB64((uint64_t)v15);
  return v13;
}

void sub_10000D9B8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_10000DB64((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_10000D9CC(uint64_t *a1, void *a2)
{
  uint64_t result = sub_10000DA44((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
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

uint64_t sub_10000DA44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
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
  sub_10000DAE4((uint64_t)v12);
  return a6;
}

uint64_t sub_10000DAE4(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    sub_10000DB1C(a1);
  }
  return a1;
}

void sub_10000DB1C(uint64_t a1)
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

uint64_t sub_10000DB64(uint64_t a1)
{
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void sub_10000DB9C(uint64_t a1, void **a2)
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

uint64_t sub_10000DBF4(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x7FFFFFFFFFFFFFF8) {
    sub_100001FE4();
  }
  if (a2 > 0x16)
  {
    uint64_t v4 = (a2 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a2 | 7) != 0x17) {
      uint64_t v4 = a2 | 7;
    }
    uint64_t v5 = v4 + 1;
    uint64_t v6 = operator new(v4 + 1);
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

uint64_t sub_10000DC7C()
{
  sub_10000DE00((uint64_t)v2);
  std::ostream::operator<<();
  std::stringbuf::str();
  *(void *)((char *)v2
  v2[2] = v0;
  if (v3 < 0) {
    operator delete((void *)v2[11]);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return std::ios::~ios();
}

void sub_10000DDEC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_10000E0D8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_10000DE00(uint64_t a1)
{
  uint64_t v2 = a1 + 16;
  *(void *)a1 = v4;
  *(void *)(a1 + *(void *)(v4 - 24)) = v3;
  *(void *)(a1 + 8) = 0;
  uint64_t v5 = (std::ios_base *)(a1 + *(void *)(*(void *)a1 - 24));
  std::ios_base::init(v5, (void *)(a1 + 24));
  v5[1].__vftable = 0;
  v5[1].__fmtflags_ = -1;
  *(void *)(a1 + 16) = v7;
  *(void *)(v2 + *(void *)(v7 - 24)) = v6;
  *(void *)a1 = v8;
  std::streambuf::basic_streambuf();
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_DWORD *)(a1 + 120) = 24;
  return a1;
}

void sub_10000E0B0(_Unwind_Exception *a1)
{
}

uint64_t sub_10000E0D8(uint64_t a1)
{
  *(void *)(a1 + 16) = v3;
  if (*(char *)(a1 + 111) < 0) {
    operator delete(*(void **)(a1 + 88));
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  std::ios::~ios();
  return a1;
}

BOOL sub_10000E210(int a1)
{
  return ((a1 - 997) & 0xFFFFFFFD) != 0;
}

uint64_t sub_10000E220(int a1)
{
  uint64_t result = 1;
  if (a1 > 199)
  {
    if ((a1 - 200) >= 2 && a1 != 999 && a1 != 997) {
      return result;
    }
    return 0;
  }
  if ((a1 - 100) < 0x16 || (a1 - 11) < 0xD) {
    return 0;
  }
  return result;
}

uint64_t sub_10000E270(int a1)
{
  uint64_t result = 1;
  if (a1 > 199)
  {
    if ((a1 - 200) >= 2 && a1 != 999 && a1 != 997) {
      return result;
    }
    return 0;
  }
  if ((a1 - 100) < 0x16 || (a1 - 7) < 0x11) {
    return 0;
  }
  return result;
}

uint64_t sub_10000E2C0(int a1)
{
  uint64_t result = 1;
  if (a1 <= 99)
  {
    if (a1 >= 0x18) {
      return result;
    }
    return 0;
  }
  if (a1 <= 199)
  {
    if ((a1 - 100) >= 0xD) {
      return result;
    }
    return 0;
  }
  if ((a1 - 200) < 2 || a1 == 999 || a1 == 997) {
    return 0;
  }
  return result;
}

BOOL sub_10000E318(int a1)
{
  return (a1 - 100) < 0x16 || (a1 - 3) <= 0x14;
}

BOOL sub_10000E340(int a1)
{
  return (a1 - 100) >= 0x16 && (a1 - 200) >= 2 && a1 != 999 && a1 != 997;
}

BOOL sub_10000E378(unsigned int a1)
{
  return a1 >= 0x18 && a1 - 200 >= 2 && a1 != 999 && a1 != 997;
}

uint64_t sub_10000E3AC(int a1)
{
  uint64_t result = 1;
  if (a1 <= 99)
  {
    if (a1 >= 0x18) {
      return result;
    }
    return 0;
  }
  if (a1 > 199)
  {
    if ((a1 - 200) < 2 || a1 == 999 || a1 == 997) {
      return 0;
    }
  }
  else
  {
    unsigned int v3 = a1 - 100;
    if (v3 <= 0x13 && ((1 << v3) & 0xC6333) != 0) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_10000E41C(int a1)
{
  uint64_t result = 1;
  if (a1 <= 99)
  {
    if (a1 >= 0x18) {
      return result;
    }
    return 0;
  }
  if ((a1 - 100) < 0x16 || a1 == 999 || a1 == 997) {
    return 0;
  }
  return result;
}

BOOL sub_10000E460(unsigned int a1)
{
  return a1 >= 0x17 && a1 != 997 && a1 != 999;
}

uint64_t sub_10000E488(int a1)
{
  uint64_t result = 1;
  if (a1 > 199)
  {
    if ((a1 - 200) >= 2 && a1 != 999 && a1 != 997) {
      return result;
    }
    return 0;
  }
  if ((a1 - 100) < 0x16 || a1 < 0x11) {
    return 0;
  }
  return result;
}

uint64_t sub_10000E4D4(int a1)
{
  uint64_t result = 1;
  if (a1 <= 99)
  {
    if (a1 >= 0x18) {
      return result;
    }
    return 0;
  }
  if (a1 <= 199)
  {
    if ((a1 - 100) >= 0x16) {
      return result;
    }
    return 0;
  }
  if (a1 == 200 || a1 == 999 || a1 == 997) {
    return 0;
  }
  return result;
}

uint64_t sub_10000E528(int a1)
{
  if (a1 == 201) {
    unsigned int v1 = 2;
  }
  else {
    unsigned int v1 = a1 == 200;
  }
  if (a1 == 999) {
    return 999;
  }
  else {
    return v1;
  }
}

uint64_t sub_10000E550(uint64_t result)
{
  if (result >= 3) {
    return 999;
  }
  else {
    return result;
  }
}

uint64_t sub_10000E568()
{
  sub_10000DE00((uint64_t)v2);
  std::ostream::operator<<();
  std::stringbuf::str();
  *(void *)((char *)v2
  v2[2] = v0;
  if (v3 < 0) {
    operator delete((void *)v2[11]);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return std::ios::~ios();
}

void sub_10000E6D8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_10000E0D8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_10000E6EC(uint64_t result)
{
  if (result == 998) {
    unsigned int v1 = 998;
  }
  else {
    unsigned int v1 = 999;
  }
  if (result >= 0xE) {
    return v1;
  }
  else {
    return result;
  }
}

double sub_10000E704@<D0>(int a1@<W0>, void *a2@<X8>)
{
  if (a1 > 99)
  {
LABEL_3:
    *a2 = 0;
    a2[1] = 0;
    a2[2] = 0;
    char v3 = operator new(4uLL);
    *a2 = v3;
    *char v3 = 0;
    uint64_t v5 = v3 + 1;
  }
  else
  {
    switch(a1)
    {
      case 1:
        *a2 = 0;
        a2[1] = 0;
        a2[2] = 0;
        uint64_t v8 = operator new(8uLL);
        *a2 = v8;
        uint64_t v9 = 0x200000000;
        goto LABEL_11;
      case 2:
        *a2 = 0;
        a2[1] = 0;
        a2[2] = 0;
        uint64_t v8 = operator new(8uLL);
        *a2 = v8;
        uint64_t v9 = 0x300000000;
        goto LABEL_11;
      case 3:
      case 4:
      case 5:
      case 6:
        *a2 = 0;
        a2[1] = 0;
        a2[2] = 0;
        uint64_t v6 = operator new(0x20uLL);
        a2[1] = v6 + 2;
        a2[2] = v6 + 2;
        *(void *)&double result = 0x400000000;
        *uint64_t v6 = xmmword_100018420;
        v6[1] = unk_100018430;
        *a2 = v6;
        return result;
      case 7:
      case 8:
      case 9:
      case 10:
        *a2 = 0;
        a2[1] = 0;
        a2[2] = 0;
        uint64_t v7 = operator new(0x10uLL);
        *a2 = v7;
        *(void *)&double result = 0xB00000000;
        *uint64_t v7 = xmmword_100018410;
        uint64_t v5 = v7 + 1;
        break;
      case 11:
      case 12:
      case 13:
      case 14:
      case 15:
      case 16:
      case 17:
      case 18:
      case 19:
      case 20:
      case 21:
      case 22:
      case 23:
        goto LABEL_3;
      default:
        *a2 = 0;
        a2[1] = 0;
        a2[2] = 0;
        uint64_t v8 = operator new(8uLL);
        *a2 = v8;
        uint64_t v9 = (uint64_t)&_mh_execute_header;
LABEL_11:
        void *v8 = v9;
        uint64_t v5 = v8 + 1;
        break;
    }
  }
  a2[1] = v5;
  a2[2] = v5;
  return result;
}

_DWORD *sub_10000E88C@<X0>(_DWORD *result@<X0>, void *a2@<X8>)
{
  if ((int)result > 99)
  {
LABEL_3:
    *a2 = 0;
    a2[1] = 0;
    a2[2] = 0;
  }
  else
  {
    switch((int)result)
    {
      case 1:
        *a2 = 0;
        a2[1] = 0;
        a2[2] = 0;
        char v3 = operator new(4uLL);
        *a2 = v3;
        int v4 = 2;
        break;
      case 2:
        *a2 = 0;
        a2[1] = 0;
        a2[2] = 0;
        char v3 = operator new(4uLL);
        *a2 = v3;
        int v4 = 3;
        break;
      case 3:
        *a2 = 0;
        a2[1] = 0;
        a2[2] = 0;
        char v3 = operator new(4uLL);
        *a2 = v3;
        int v4 = 7;
        break;
      case 4:
      case 5:
      case 6:
      case 7:
      case 8:
      case 9:
      case 10:
      case 11:
      case 12:
      case 13:
      case 14:
      case 15:
      case 16:
      case 17:
      case 18:
      case 19:
      case 20:
      case 21:
      case 22:
      case 23:
        goto LABEL_3;
      default:
        *a2 = 0;
        a2[1] = 0;
        a2[2] = 0;
        char v3 = operator new(4uLL);
        *a2 = v3;
        int v4 = 1;
        break;
    }
    *char v3 = v4;
    double result = v3 + 1;
    a2[1] = result;
    a2[2] = result;
  }
  return result;
}

uint64_t sub_10000E9CC(uint64_t a1, int a2, int a3, int a4, int a5, uint64_t a6)
{
  *(_DWORD *)a1 = a2;
  *(_DWORD *)(a1 + 4) = a3;
  *(_DWORD *)(a1 + 8) = a4;
  *(_DWORD *)(a1 + 12) = a5;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(void *)(a1 + 48) = 0;
  sub_10000FED8((void *)(a1 + 32), *(const void **)a6, *(void *)(a6 + 8), (uint64_t)(*(void *)(a6 + 8) - *(void *)a6) >> 1);
  if (a3 < a2)
  {
    long long v14 = "maxAzDeg >= minAzDeg";
    int v15 = 20;
    goto LABEL_8;
  }
  if (a5 < a4)
  {
    long long v14 = "maxElDeg >= minElDeg";
    int v15 = 21;
    goto LABEL_8;
  }
  uint64_t v11 = a3 - a2 + 1;
  uint64_t v12 = a5 - a4 + 1;
  *(void *)(a1 + 16) = v11;
  *(void *)(a1 + 24) = v12;
  if (v12 * v11 != (uint64_t)(*(void *)(a1 + 40) - *(void *)(a1 + 32)) >> 1)
  {
    long long v14 = "fNumRows * fNumCols == fPDOATable.size()";
    int v15 = 24;
LABEL_8:
    __assert_rtn("AOAtoPDOAMapping", "RoseAOAtoPDOAMapping.cpp", v15, v14);
  }
  return a1;
}

void sub_10000EABC(_Unwind_Exception *exception_object)
{
  int v4 = *v2;
  if (*v2)
  {
    *(void *)(v1 + 40) = v4;
    operator delete(v4);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_10000EADC(uint64_t result, int a2, int a3, int a4, int a5, uint64_t a6)
{
  *(_DWORD *)double result = a2;
  *(_DWORD *)(result + 4) = a3;
  *(_DWORD *)(result + 8) = a4;
  *(_DWORD *)(result + 12) = a5;
  *(_OWORD *)(result + 16) = 0u;
  *(_OWORD *)(result + 32) = 0u;
  *(void *)(result + 48) = 0;
  *(_OWORD *)(result + 32) = *(_OWORD *)a6;
  *(void *)(result + 48) = *(void *)(a6 + 16);
  *(void *)a6 = 0;
  *(void *)(a6 + 8) = 0;
  *(void *)(a6 + 16) = 0;
  if (a3 < a2)
  {
    uint64_t v8 = "maxAzDeg >= minAzDeg";
    int v9 = 30;
    goto LABEL_8;
  }
  if (a5 < a4)
  {
    uint64_t v8 = "maxElDeg >= minElDeg";
    int v9 = 31;
    goto LABEL_8;
  }
  uint64_t v6 = a3 - a2 + 1;
  uint64_t v7 = a5 - a4 + 1;
  *(void *)(result + 16) = v6;
  *(void *)(result + 24) = v7;
  if (v7 * v6 != (uint64_t)(*(void *)(result + 40) - *(void *)(result + 32)) >> 1)
  {
    uint64_t v8 = "fNumRows * fNumCols == fPDOATable.size()";
    int v9 = 34;
LABEL_8:
    __assert_rtn("AOAtoPDOAMapping", "RoseAOAtoPDOAMapping.cpp", v9, v8);
  }
  return result;
}

void sub_10000EBA8(_Unwind_Exception *exception_object)
{
  char v3 = *(void **)(v1 + 32);
  if (v3)
  {
    *(void *)(v1 + 40) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_10000EBC8(uint64_t a1, int a2, int a3)
{
  if (a2 < *(_DWORD *)a1) {
    sub_100016EBC();
  }
  if (*(_DWORD *)(a1 + 4) < a2) {
    sub_100016EE8();
  }
  int v3 = *(_DWORD *)(a1 + 8);
  BOOL v4 = __OFSUB__(a3, v3);
  int v5 = a3 - v3;
  if (v5 < 0 != v4) {
    sub_100016F14();
  }
  if (*(_DWORD *)(a1 + 12) < a3) {
    sub_100016F40();
  }
  return *(__int16 *)(*(void *)(a1 + 32) + 2 * (*(void *)(a1 + 24) * (a2 - *(_DWORD *)a1) + v5));
}

uint64_t sub_10000EC30(uint64_t a1, int a2, int a3)
{
  if (a2 < *(_DWORD *)a1) {
    sub_100016F6C();
  }
  if (*(_DWORD *)(a1 + 4) < a2) {
    sub_100016F98();
  }
  int v3 = *(_DWORD *)(a1 + 8);
  BOOL v4 = __OFSUB__(a3, v3);
  int v5 = a3 - v3;
  if (v5 < 0 != v4) {
    sub_100016FC4();
  }
  if (*(_DWORD *)(a1 + 12) < a3) {
    sub_100016FF0();
  }
  return *(void *)(a1 + 32) + 2 * (*(void *)(a1 + 24) * (a2 - *(_DWORD *)a1) + v5);
}

unsigned char *sub_10000EC98(unsigned char *a1, uint64_t a2)
{
  *a1 = 0;
  a1[8] = 0;
  a1[64] = 0;
  a1[72] = 0;
  a1[136] = 0;
  a1[128] = 0;
  a1[192] = 0;
  a1[200] = 0;
  a1[256] = 0;
  if (sub_1000117FC(a2))
  {
    unint64_t v11 = sub_1000107AC();
    if (!v12) {
      sub_10000FE8C();
    }
    unint64_t v13 = v11;
    if (v11 < 0x2009E) {
      __assert_rtn("CalBlob", "RoseAOAtoPDOAMapping.cpp", 101, "fileSize >= kHeaderSize + kBytesPerChan");
    }
    sub_10000F644(v38);
    uint64_t v21 = (char *)v38 + (unint64_t)*(v38[0] - 3);
    if (*((_DWORD *)v21 + 8))
    {
      if (*(char *)(a2 + 23) >= 0) {
        uint64_t v22 = a2;
      }
      else {
        uint64_t v22 = *(void *)a2;
      }
      sub_100014F7C("CalBlob: error opening %s", v14, v15, v16, v17, v18, v19, v20, v22);
    }
    else
    {
      *((_DWORD *)v21 + 2) &= ~0x1000u;
      std::istream::seekg();
      std::string __p = 0;
      uint64_t v35 = 0;
      uint64_t v36 = 0;
      sub_10000F814(&__p, 0x7FF9uLL);
      long long v24 = (void *)std::istream::read();
      if ((*((unsigned char *)v24 + *(void *)(*v24 - 24) + 32) & 5) == 0)
      {
        std::istream::tellg();
        if (v37 != -1)
        {
          std::istream::tellg();
          if (v37 + 131052 <= v13 + 4)
          {
            std::istream::read();
            __assert_rtn("CalBlob", "RoseAOAtoPDOAMapping.cpp", 127, "length == kCh5Length");
          }
          __assert_rtn("CalBlob", "RoseAOAtoPDOAMapping.cpp", 123, "static_cast<size_t>(f.tellg()) + kBytesPerChan <= fileSize + sizeof(tag)");
        }
        sub_100014F7C("Current position in the file stream is -1, return", v25, v26, v27, v28, v29, v30, v31, v33);
      }
      if (__p)
      {
        uint64_t v35 = __p;
        operator delete(__p);
      }
    }
    std::filebuf::~filebuf();
    std::istream::~istream();
    std::ios::~ios();
  }
  else
  {
    if (*(char *)(a2 + 23) >= 0) {
      uint64_t v23 = a2;
    }
    else {
      uint64_t v23 = *(void *)a2;
    }
    sub_100014F7C("CalBlob: file %s integrity check fails ", v4, v5, v6, v7, v8, v9, v10, v23);
  }
  return a1;
}

void sub_10000F53C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35)
{
  if (__p) {
    operator delete(__p);
  }
  sub_10000F924(&a35);
  if (*(unsigned char *)(v35 + 256))
  {
    uint64_t v37 = *(void **)(v35 + 232);
    if (v37)
    {
      *(void *)(v35 + 240) = v37;
      operator delete(v37);
    }
  }
  if (*(unsigned char *)(v35 + 192))
  {
    unsigned int v38 = *(void **)(v35 + 168);
    if (v38)
    {
      *(void *)(v35 + 176) = v38;
      operator delete(v38);
    }
  }
  if (*(unsigned char *)(v35 + 128))
  {
    uint64_t v39 = *(void **)(v35 + 104);
    if (v39)
    {
      *(void *)(v35 + 112) = v39;
      operator delete(v39);
    }
  }
  if (*(unsigned char *)(v35 + 64))
  {
    uint64_t v40 = *(void **)(v35 + 40);
    if (v40)
    {
      *(void *)(v35 + 48) = v40;
      operator delete(v40);
    }
  }
  _Unwind_Resume(a1);
}

void (__cdecl ***sub_10000F644(void (__cdecl ***a1)(std::ifstream *__hidden this)))(std::ifstream *__hidden this)
{
  *a1 = v3;
  *(void *)((char *)*(v3 - 3) + (void)a1) = v2;
  a1[1] = 0;
  uint64_t v4 = (std::ios_base *)((char *)*(*a1 - 3) + (void)a1);
  std::ios_base::init(v4, a1 + 2);
  v4[1].__vftable = 0;
  v4[1].__fmtflags_ = -1;
  std::filebuf::basic_filebuf();
  if (!std::filebuf::open()) {
    std::ios_base::clear((std::ios_base *)((char *)*(*a1 - 3) + (void)a1), *(_DWORD *)((char *)*(*a1 - 3) + (void)a1 + 32) | 4);
  }
  return a1;
}

void sub_10000F7DC(_Unwind_Exception *a1)
{
}

void sub_10000F814(void **a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (unsigned char *)*a1) >> 1)
  {
    if ((a2 & 0x8000000000000000) != 0) {
      sub_100004A44();
    }
    int64_t v5 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    uint64_t v6 = (char *)sub_100009DCC(v3, a2);
    uint64_t v7 = &v6[v5 & 0xFFFFFFFFFFFFFFFELL];
    uint64_t v9 = &v6[2 * v8];
    uint64_t v10 = (char *)*a1;
    unint64_t v11 = (char *)a1[1];
    char v12 = v7;
    if (v11 != *a1)
    {
      char v12 = v7;
      do
      {
        __int16 v13 = *((_WORD *)v11 - 1);
        v11 -= 2;
        *((_WORD *)v12 - 1) = v13;
        v12 -= 2;
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

uint64_t sub_10000F8B8(uint64_t a1, uint64_t a2)
{
  int v3 = *(unsigned __int8 *)(a1 + 56);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  int64_t v5 = (void *)(a1 + 32);
  if (v3)
  {
    sub_10000FF94((uint64_t)v5, (__n128 *)(a2 + 32));
  }
  else
  {
    *int64_t v5 = 0;
    v5[1] = 0;
    v5[2] = 0;
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    *(void *)(a1 + 48) = *(void *)(a2 + 48);
    *(void *)(a2 + 32) = 0;
    *(void *)(a2 + 40) = 0;
    *(void *)(a2 + 48) = 0;
    *(unsigned char *)(a1 + 56) = 1;
  }
  return a1;
}

void *sub_10000F924(void *a1)
{
  std::filebuf::~filebuf();
  std::istream::~istream();
  std::ios::~ios();
  return a1;
}

unsigned char *sub_10000F9F4(unsigned char *result, char a2)
{
  *double result = a2;
  return result;
}

uint64_t sub_10000F9FC(unsigned __int8 *a1)
{
  return *a1;
}

uint64_t sub_10000FA04(unsigned __int8 *a1)
{
  unsigned int v1 = *a1;
  return (v1 >> sub_1000138C4(5, 1)) & 1;
}

uint64_t sub_10000FA38(unsigned __int8 *a1)
{
  unsigned int v1 = *a1;
  return (v1 >> sub_1000138C4(9, 1)) & 1;
}

BOOL sub_10000FA6C(unsigned __int8 *a1)
{
  BOOL result = 0;
  if (*a1)
  {
    unsigned int v1 = *a1;
    if ((v1 >> sub_1000138C4(9, 1)))
    {
      if (a1[192])
      {
        if (a1[256])
        {
          if (*((void *)a1 + 19) == 181
            && *((void *)a1 + 20) == 181
            && *((void *)a1 + 27) == 181
            && *((void *)a1 + 28) == 181)
          {
            unsigned int v3 = *a1;
            if (((v3 >> sub_1000138C4(5, 1)) & 1) == 0
              || a1[64]
              && a1[128]
              && *((void *)a1 + 3) == 181
              && *((void *)a1 + 4) == 181
              && *((void *)a1 + 11) == 181
              && *((void *)a1 + 12) == 181)
            {
              return 1;
            }
          }
        }
      }
    }
  }
  return result;
}

unsigned __int8 *sub_10000FB4C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  if (!sub_10000FA6C(a1) || !sub_10000FA6C(a2) || (unsigned int v4 = *a1, v4 != *a2)) {
    sub_100017048();
  }
  if (((v4 >> sub_1000138C4(9, 1)) & 1) == 0 || (unsigned int v5 = *a2, ((v5 >> sub_1000138C4(9, 1)) & 1) == 0)) {
    sub_10001701C();
  }
  int v6 = *a2;
  int v7 = 0;
  int v31 = (1 << sub_1000138C4(5, 1)) & v6;
  uint64_t v32 = (uint64_t)(a1 + 8);
  do
  {
    for (int i = 0; i != 181; ++i)
    {
      if (!a1[192]) {
        goto LABEL_56;
      }
      uint64_t v9 = (unsigned __int16 *)sub_10000EC30((uint64_t)(a1 + 136), v7, i);
      if (!a2[192]) {
        goto LABEL_56;
      }
      int v10 = *v9;
      int v11 = sub_10000EBC8((uint64_t)(a2 + 136), v7, i);
      __int16 v12 = v11 + v10;
      if ((__int16)(v11 + v10) > 180) {
        __int16 v12 = v11 + v10 - 360;
      }
      if (v12 < -179) {
        v12 += 360;
      }
      BOOL v13 = v10 == 0x7FFF || v11 == 0x7FFF;
      __int16 v14 = v13 ? 0x7FFF : v12;
      if (!a1[192]) {
        goto LABEL_56;
      }
      *(_WORD *)sub_10000EC30((uint64_t)(a1 + 136), v7, i) = v14;
      if (!a1[256]) {
        goto LABEL_56;
      }
      uint64_t v15 = (unsigned __int16 *)sub_10000EC30((uint64_t)(a1 + 200), v7, i);
      if (!a2[256]) {
        goto LABEL_56;
      }
      int v16 = *v15;
      int v17 = sub_10000EBC8((uint64_t)(a2 + 200), v7, i);
      __int16 v18 = 0x7FFF;
      if (v16 != 0x7FFF && v17 != 0x7FFF)
      {
        __int16 v19 = v17 + v16;
        if ((__int16)(v17 + v16) > 180) {
          __int16 v19 = v17 + v16 - 360;
        }
        if (v19 >= -179) {
          __int16 v18 = v19;
        }
        else {
          __int16 v18 = v19 + 360;
        }
      }
      if (!a1[256]) {
LABEL_56:
      }
        sub_10000FE8C();
      *(_WORD *)sub_10000EC30((uint64_t)(a1 + 200), v7, i) = v18;
      if (v31)
      {
        if (!a1[64]) {
          goto LABEL_56;
        }
        uint64_t v20 = (unsigned __int16 *)sub_10000EC30(v32, v7, i);
        if (!a2[64]) {
          goto LABEL_56;
        }
        int v21 = *v20;
        int v22 = sub_10000EBC8((uint64_t)(a2 + 8), v7, i);
        __int16 v23 = 0x7FFF;
        if (v21 != 0x7FFF && v22 != 0x7FFF)
        {
          __int16 v24 = v22 + v21;
          if ((__int16)(v22 + v21) > 180) {
            __int16 v24 = v22 + v21 - 360;
          }
          if (v24 >= -179) {
            __int16 v23 = v24;
          }
          else {
            __int16 v23 = v24 + 360;
          }
        }
        if (!a1[64]) {
          goto LABEL_56;
        }
        *(_WORD *)sub_10000EC30(v32, v7, i) = v23;
        if (!a1[128]) {
          goto LABEL_56;
        }
        uint64_t v25 = (unsigned __int16 *)sub_10000EC30((uint64_t)(a1 + 72), v7, i);
        if (!a2[128]) {
          goto LABEL_56;
        }
        int v26 = *v25;
        int v27 = sub_10000EBC8((uint64_t)(a2 + 72), v7, i);
        __int16 v28 = 0x7FFF;
        if (v26 != 0x7FFF && v27 != 0x7FFF)
        {
          __int16 v29 = v27 + v26;
          if ((__int16)(v27 + v26) > 180) {
            __int16 v29 = v27 + v26 - 360;
          }
          if (v29 >= -179) {
            __int16 v28 = v29;
          }
          else {
            __int16 v28 = v29 + 360;
          }
        }
        if (!a1[128]) {
          goto LABEL_56;
        }
        *(_WORD *)sub_10000EC30((uint64_t)(a1 + 72), v7, i) = v28;
      }
    }
    ++v7;
  }
  while (v7 != 181);
  return a1;
}

void sub_10000FE8C()
{
  exception = __cxa_allocate_exception(8uLL);
}

void *sub_10000FED8(void *result, const void *a2, uint64_t a3, uint64_t a4)
{
  if (a4)
  {
    int v6 = result;
    BOOL result = sub_10000FF54(result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      BOOL result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_10000FF38(_Unwind_Exception *exception_object)
{
  unsigned int v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *sub_10000FF54(void *a1, uint64_t a2)
{
  if (a2 < 0) {
    sub_100004A44();
  }
  BOOL result = (char *)sub_100009DCC((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[2 * v4];
  return result;
}

__n128 sub_10000FF94(uint64_t a1, __n128 *a2)
{
  uint64_t v4 = *(void **)a1;
  if (v4)
  {
    *(void *)(a1 + 8) = v4;
    operator delete(v4);
    *(void *)a1 = 0;
    *(void *)(a1 + 8) = 0;
    *(void *)(a1 + 16) = 0;
  }
  __n128 result = *a2;
  *(__n128 *)a1 = *a2;
  *(void *)(a1 + 16) = a2[1].n128_u64[0];
  a2->n128_u64[0] = 0;
  a2->n128_u64[1] = 0;
  a2[1].n128_u64[0] = 0;
  return result;
}

uint64_t sub_10000FFE8()
{
  sub_10000E568();
  uint64_t v0 = std::string::insert(&v37, 0, "reverseLUT_A");
  long long v1 = *(_OWORD *)&v0->__r_.__value_.__l.__data_;
  v38.__r_.__value_.__r.__words[2] = v0->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v38.__r_.__value_.__l.__data_ = v1;
  v0->__r_.__value_.__l.__size_ = 0;
  v0->__r_.__value_.__r.__words[2] = 0;
  v0->__r_.__value_.__r.__words[0] = 0;
  uint64_t v2 = std::string::append(&v38, ".bin");
  long long v3 = *(_OWORD *)&v2->__r_.__value_.__l.__data_;
  qword_1000204A8 = v2->__r_.__value_.__r.__words[2];
  xmmword_100020498 = v3;
  v2->__r_.__value_.__l.__size_ = 0;
  v2->__r_.__value_.__r.__words[2] = 0;
  v2->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v38.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v38.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v37.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v37.__r_.__value_.__l.__data_);
  }
  __cxa_atexit((void (*)(void *))&std::string::~string, &xmmword_100020498, (void *)&_mh_execute_header);
  sub_10000E568();
  uint64_t v4 = std::string::insert(&v37, 0, "reverseLUT_A");
  long long v5 = *(_OWORD *)&v4->__r_.__value_.__l.__data_;
  v38.__r_.__value_.__r.__words[2] = v4->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v38.__r_.__value_.__l.__data_ = v5;
  v4->__r_.__value_.__l.__size_ = 0;
  v4->__r_.__value_.__r.__words[2] = 0;
  v4->__r_.__value_.__r.__words[0] = 0;
  int v6 = std::string::append(&v38, ".bin");
  long long v7 = *(_OWORD *)&v6->__r_.__value_.__l.__data_;
  qword_1000204C0 = v6->__r_.__value_.__r.__words[2];
  xmmword_1000204B0 = v7;
  v6->__r_.__value_.__l.__size_ = 0;
  v6->__r_.__value_.__r.__words[2] = 0;
  v6->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v38.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v38.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v37.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v37.__r_.__value_.__l.__data_);
  }
  __cxa_atexit((void (*)(void *))&std::string::~string, &xmmword_1000204B0, (void *)&_mh_execute_header);
  sub_10000E568();
  size_t v8 = std::string::insert(&v37, 0, "reverseLUT_A");
  long long v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
  v38.__r_.__value_.__r.__words[2] = v8->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v38.__r_.__value_.__l.__data_ = v9;
  v8->__r_.__value_.__l.__size_ = 0;
  v8->__r_.__value_.__r.__words[2] = 0;
  v8->__r_.__value_.__r.__words[0] = 0;
  int v10 = std::string::append(&v38, ".bin");
  long long v11 = *(_OWORD *)&v10->__r_.__value_.__l.__data_;
  qword_1000204D8 = v10->__r_.__value_.__r.__words[2];
  xmmword_1000204C8 = v11;
  v10->__r_.__value_.__l.__size_ = 0;
  v10->__r_.__value_.__r.__words[2] = 0;
  v10->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v38.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v38.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v37.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v37.__r_.__value_.__l.__data_);
  }
  __cxa_atexit((void (*)(void *))&std::string::~string, &xmmword_1000204C8, (void *)&_mh_execute_header);
  sub_10000E568();
  __int16 v12 = std::string::insert(&v37, 0, "reverseLUT_A");
  long long v13 = *(_OWORD *)&v12->__r_.__value_.__l.__data_;
  v38.__r_.__value_.__r.__words[2] = v12->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v38.__r_.__value_.__l.__data_ = v13;
  v12->__r_.__value_.__l.__size_ = 0;
  v12->__r_.__value_.__r.__words[2] = 0;
  v12->__r_.__value_.__r.__words[0] = 0;
  __int16 v14 = std::string::append(&v38, ".bin");
  long long v15 = *(_OWORD *)&v14->__r_.__value_.__l.__data_;
  qword_1000204F0 = v14->__r_.__value_.__r.__words[2];
  xmmword_1000204E0 = v15;
  v14->__r_.__value_.__l.__size_ = 0;
  v14->__r_.__value_.__r.__words[2] = 0;
  v14->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v38.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v38.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v37.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v37.__r_.__value_.__l.__data_);
  }
  __cxa_atexit((void (*)(void *))&std::string::~string, &xmmword_1000204E0, (void *)&_mh_execute_header);
  sub_10000E568();
  int v16 = std::string::insert(&v37, 0, "reverseLUT_A");
  long long v17 = *(_OWORD *)&v16->__r_.__value_.__l.__data_;
  v38.__r_.__value_.__r.__words[2] = v16->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v38.__r_.__value_.__l.__data_ = v17;
  v16->__r_.__value_.__l.__size_ = 0;
  v16->__r_.__value_.__r.__words[2] = 0;
  v16->__r_.__value_.__r.__words[0] = 0;
  __int16 v18 = std::string::append(&v38, ".bin");
  long long v19 = *(_OWORD *)&v18->__r_.__value_.__l.__data_;
  qword_100020508 = v18->__r_.__value_.__r.__words[2];
  xmmword_1000204F8 = v19;
  v18->__r_.__value_.__l.__size_ = 0;
  v18->__r_.__value_.__r.__words[2] = 0;
  v18->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v38.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v38.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v37.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v37.__r_.__value_.__l.__data_);
  }
  __cxa_atexit((void (*)(void *))&std::string::~string, &xmmword_1000204F8, (void *)&_mh_execute_header);
  sub_10000E568();
  uint64_t v20 = std::string::insert(&v37, 0, "reverseLUT_A");
  long long v21 = *(_OWORD *)&v20->__r_.__value_.__l.__data_;
  v38.__r_.__value_.__r.__words[2] = v20->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v38.__r_.__value_.__l.__data_ = v21;
  v20->__r_.__value_.__l.__size_ = 0;
  v20->__r_.__value_.__r.__words[2] = 0;
  v20->__r_.__value_.__r.__words[0] = 0;
  int v22 = std::string::append(&v38, ".bin");
  long long v23 = *(_OWORD *)&v22->__r_.__value_.__l.__data_;
  qword_100020520 = v22->__r_.__value_.__r.__words[2];
  xmmword_100020510 = v23;
  v22->__r_.__value_.__l.__size_ = 0;
  v22->__r_.__value_.__r.__words[2] = 0;
  v22->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v38.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v38.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v37.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v37.__r_.__value_.__l.__data_);
  }
  __cxa_atexit((void (*)(void *))&std::string::~string, &xmmword_100020510, (void *)&_mh_execute_header);
  sub_10000E568();
  __int16 v24 = std::string::insert(&v37, 0, "reverseLUT_A");
  long long v25 = *(_OWORD *)&v24->__r_.__value_.__l.__data_;
  v38.__r_.__value_.__r.__words[2] = v24->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v38.__r_.__value_.__l.__data_ = v25;
  v24->__r_.__value_.__l.__size_ = 0;
  v24->__r_.__value_.__r.__words[2] = 0;
  v24->__r_.__value_.__r.__words[0] = 0;
  int v26 = std::string::append(&v38, ".bin");
  long long v27 = *(_OWORD *)&v26->__r_.__value_.__l.__data_;
  qword_100020538 = v26->__r_.__value_.__r.__words[2];
  xmmword_100020528 = v27;
  v26->__r_.__value_.__l.__size_ = 0;
  v26->__r_.__value_.__r.__words[2] = 0;
  v26->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v38.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v38.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v37.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v37.__r_.__value_.__l.__data_);
  }
  __cxa_atexit((void (*)(void *))&std::string::~string, &xmmword_100020528, (void *)&_mh_execute_header);
  sub_10000E568();
  __int16 v28 = std::string::insert(&v37, 0, "reverseLUT_A");
  long long v29 = *(_OWORD *)&v28->__r_.__value_.__l.__data_;
  v38.__r_.__value_.__r.__words[2] = v28->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v38.__r_.__value_.__l.__data_ = v29;
  v28->__r_.__value_.__l.__size_ = 0;
  v28->__r_.__value_.__r.__words[2] = 0;
  v28->__r_.__value_.__r.__words[0] = 0;
  uint64_t v30 = std::string::append(&v38, ".bin");
  long long v31 = *(_OWORD *)&v30->__r_.__value_.__l.__data_;
  qword_100020550 = v30->__r_.__value_.__r.__words[2];
  xmmword_100020540 = v31;
  v30->__r_.__value_.__l.__size_ = 0;
  v30->__r_.__value_.__r.__words[2] = 0;
  v30->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v38.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v38.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v37.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v37.__r_.__value_.__l.__data_);
  }
  __cxa_atexit((void (*)(void *))&std::string::~string, &xmmword_100020540, (void *)&_mh_execute_header);
  sub_10000E568();
  uint64_t v32 = std::string::insert(&v37, 0, "reverseLUT_A");
  long long v33 = *(_OWORD *)&v32->__r_.__value_.__l.__data_;
  v38.__r_.__value_.__r.__words[2] = v32->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v38.__r_.__value_.__l.__data_ = v33;
  v32->__r_.__value_.__l.__size_ = 0;
  v32->__r_.__value_.__r.__words[2] = 0;
  v32->__r_.__value_.__r.__words[0] = 0;
  unint64_t v34 = std::string::append(&v38, ".bin");
  long long v35 = *(_OWORD *)&v34->__r_.__value_.__l.__data_;
  qword_100020568 = v34->__r_.__value_.__r.__words[2];
  xmmword_100020558 = v35;
  v34->__r_.__value_.__l.__size_ = 0;
  v34->__r_.__value_.__r.__words[2] = 0;
  v34->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v38.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v38.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v37.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v37.__r_.__value_.__l.__data_);
  }
  return __cxa_atexit((void (*)(void *))&std::string::~string, &xmmword_100020558, (void *)&_mh_execute_header);
}

void sub_100010618(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a15 < 0) {
    operator delete(a10);
  }
  _Unwind_Resume(exception_object);
}

void sub_10001068C(unsigned __int8 *a1)
{
  uint64_t v2 = qword_1000205A0;
  if (os_log_type_enabled((os_log_t)qword_1000205A0, OS_LOG_TYPE_DEFAULT))
  {
    long long v3 = a1 + 8;
    if ((char)a1[31] < 0) {
      long long v3 = (void *)*v3;
    }
    int v4 = *a1;
    int v5 = a1[1];
    int v6 = *((unsigned __int16 *)a1 + 16);
    long long v7 = a1 + 40;
    if ((char)a1[63] < 0) {
      long long v7 = (void *)*v7;
    }
    int v8 = *((_DWORD *)a1 + 16);
    int v9 = *((_DWORD *)a1 + 17);
    int v10 = *((_DWORD *)a1 + 18);
    int v11 = *((_DWORD *)a1 + 19);
    v12[0] = 67176707;
    v12[1] = v4;
    __int16 v13 = 1025;
    int v14 = v5;
    __int16 v15 = 2081;
    int v16 = v3;
    __int16 v17 = 1025;
    int v18 = v6;
    __int16 v19 = 2081;
    uint64_t v20 = v7;
    __int16 v21 = 1025;
    int v22 = v8;
    __int16 v23 = 1025;
    int v24 = v9;
    __int16 v25 = 1025;
    int v26 = v10;
    __int16 v27 = 1025;
    int v28 = v11;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "#fu,endian,%{private}d,headerVersion,%{private}d,type,%{private}s,version,%{private}d,copyright,%{private}s,timestamp,%{private}u,expiration,%{private}u,dataSizeBytes,%{private}u,crc,%{private}u", (uint8_t *)v12, 0x40u);
  }
}

unint64_t sub_1000107AC()
{
  sub_10000F644(v4);
  if ((*((unsigned char *)&v4[4] + (unint64_t)*(v4[0] - 3)) & 5) != 0)
  {
    uint64_t v0 = 0;
    unint64_t v1 = 0;
  }
  else
  {
    std::istream::tellg();
    unint64_t v1 = v3 & 0xFFFFFFFFFFFFFF00;
    uint64_t v0 = v3;
  }
  std::filebuf::~filebuf();
  std::istream::~istream();
  std::ios::~ios();
  return v1 | v0;
}

void sub_100010928(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
}

BOOL sub_100010944(const char *a1)
{
  if (a1[23] < 0) {
    a1 = *(const char **)a1;
  }
  return stat(a1, &v2) >= 0;
}

void sub_100010980(const char *a1)
{
  if (a1[23] < 0) {
    a1 = *(const char **)a1;
  }
  if ((stat(a1, &v1) & 0x80000000) == 0) {
    CFAbsoluteTimeGetCurrent();
  }
}

uint64_t sub_1000109FC(uint64_t a1, uint64_t a2)
{
  if (!*(void *)(a1 + 128))
  {
    int v4 = qword_1000205A0;
    if (os_log_type_enabled((os_log_t)qword_1000205A0, OS_LOG_TYPE_ERROR)) {
      sub_100017074(v4);
    }
    return 0;
  }
  uint64_t v2 = *(unsigned __int8 *)(a2 + 31);
  if ((v2 & 0x80u) != 0) {
    uint64_t v2 = *(void *)(a2 + 16);
  }
  if (v2 != 30)
  {
    if (os_log_type_enabled((os_log_t)qword_1000205A0, OS_LOG_TYPE_ERROR)) {
      sub_10001712C();
    }
    return 0;
  }
  if ((*(char *)(a2 + 63) & 0x80000000) == 0 || *(void *)(a2 + 48) != 128)
  {
    if (os_log_type_enabled((os_log_t)qword_1000205A0, OS_LOG_TYPE_ERROR)) {
      sub_1000170B8();
    }
    return 0;
  }
  uint64_t v3 = 1;
  std::ostream::write();
  std::ostream::write();
  std::ostream::write();
  std::ostream::write();
  std::ostream::write();
  std::ostream::write();
  std::ostream::write();
  std::ostream::write();
  std::ostream::write();
  std::ostream::flush();
  return v3;
}

BOOL sub_100010BCC(FILE *__stream, uint64_t a2)
{
  if (!__stream)
  {
    int v8 = qword_1000205A0;
    if (os_log_type_enabled((os_log_t)qword_1000205A0, OS_LOG_TYPE_ERROR)) {
      sub_1000171A0(v8);
    }
    return 0;
  }
  size_t v3 = fread(&__ptr, 1uLL, 0xB2uLL, __stream);
  if (v3 != 178)
  {
    uint64_t v9 = v3;
    int v10 = qword_1000205A0;
    if (os_log_type_enabled((os_log_t)qword_1000205A0, OS_LOG_TYPE_ERROR)) {
      sub_100017334(v9, v10);
    }
    return 0;
  }
  int v4 = __ptr;
  *(unsigned char *)a2 = __ptr;
  if ((v4 - 1) >= 2)
  {
    int v11 = qword_1000205A0;
    if (os_log_type_enabled((os_log_t)qword_1000205A0, OS_LOG_TYPE_ERROR)) {
      sub_1000172C4(a2, v11, v12, v13, v14, v15, v16, v17);
    }
    return 0;
  }
  int v5 = v44;
  *(unsigned char *)(a2 + 1) = v44;
  uint64_t v6 = a2 + 1;
  if (!v5)
  {
    int v18 = qword_1000205A0;
    if (os_log_type_enabled((os_log_t)qword_1000205A0, OS_LOG_TYPE_ERROR)) {
      sub_1000171E4(v6, v18, v19, v20, v21, v22, v23, v24);
    }
    return 0;
  }
  char v42 = 0;
  *(_OWORD *)std::string __s = *(_OWORD *)v45;
  *(_OWORD *)&__s[14] = *(_OWORD *)&v45[14];
  std::string::assign((std::string *)(a2 + 8), __s);
  if (*(unsigned char *)a2 == 2) {
    unsigned int v7 = bswap32(v46) >> 16;
  }
  else {
    unsigned int v7 = v46;
  }
  *(_WORD *)(a2 + 32) = v7;
  uint64_t v27 = a2 + 32;
  BOOL v25 = v7 != 0;
  if (v7)
  {
    char v40 = 0;
    void v39[4] = v51;
    v39[5] = v52;
    v39[6] = v53;
    v39[7] = v54;
    v39[0] = v47;
    v39[1] = v48;
    v39[2] = v49;
    v39[3] = v50;
    std::string::assign((std::string *)(a2 + 40), (const std::string::value_type *)v39);
    if (*(unsigned char *)a2 == 2)
    {
      unsigned int v28 = bswap32(v55);
      unsigned int v29 = bswap32(v56);
      unsigned int v30 = bswap32(v57);
      unsigned int v31 = bswap32(v58);
    }
    else
    {
      unsigned int v28 = v55;
      unsigned int v29 = v56;
      unsigned int v30 = v57;
      unsigned int v31 = v58;
    }
    *(_DWORD *)(a2 + 64) = v28;
    *(_DWORD *)(a2 + 68) = v29;
    *(_DWORD *)(a2 + 72) = v30;
    *(_DWORD *)(a2 + 76) = v31;
  }
  else
  {
    uint64_t v32 = qword_1000205A0;
    if (os_log_type_enabled((os_log_t)qword_1000205A0, OS_LOG_TYPE_ERROR)) {
      sub_100017254(v27, v32, v33, v34, v35, v36, v37, v38);
    }
  }
  return v25;
}

BOOL sub_100010E3C(const char *a1, uint64_t a2)
{
  size_t v3 = a1;
  if (a1[23] < 0) {
    a1 = *(const char **)a1;
  }
  if (stat(a1, &v14) < 0)
  {
    if (os_log_type_enabled((os_log_t)qword_1000205A0, OS_LOG_TYPE_ERROR)) {
      sub_10001749C();
    }
    return 0;
  }
  unint64_t v4 = sub_1000107AC();
  if (!v5)
  {
    if (os_log_type_enabled((os_log_t)qword_1000205A0, OS_LOG_TYPE_ERROR)) {
      sub_1000173BC();
    }
    return 0;
  }
  __darwin_ino64_t v6 = v4;
  if (v4 <= 0xB1)
  {
    unsigned int v7 = qword_1000205A0;
    if (os_log_type_enabled((os_log_t)qword_1000205A0, OS_LOG_TYPE_ERROR))
    {
      if (v3[23] >= 0) {
        uint64_t v13 = v3;
      }
      else {
        uint64_t v13 = *(const char **)v3;
      }
      v14.st_dev = 136315650;
      *(void *)&v14.st_mode = v13;
      WORD2(v14.st_ino) = 2048;
      *(__darwin_ino64_t *)((char *)&v14.st_ino + 6) = v6;
      HIWORD(v14.st_gid) = 1024;
      v14.st_rdev = 178;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "#fu,getHeader,failed,file,%s,fileTooSmall,size,%lu,expected,%d", (uint8_t *)&v14, 0x1Cu);
    }
  }
  if (v3[23] >= 0) {
    int v8 = v3;
  }
  else {
    int v8 = *(const char **)v3;
  }
  uint64_t v9 = fopen(v8, "rb");
  int v10 = v9;
  if (!v9)
  {
    if (os_log_type_enabled((os_log_t)qword_1000205A0, OS_LOG_TYPE_ERROR)) {
      sub_10001742C();
    }
    return 0;
  }
  BOOL v11 = sub_100010BCC(v9, a2);
  fclose(v10);
  return v11;
}

BOOL sub_100011038(const char *a1)
{
  __int16 v8 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  std::string __p = 0;
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v9 = 0;
  __int16 v12 = 0;
  long long v16 = xmmword_100018480;
  BOOL v1 = sub_100010E3C(a1, (uint64_t)&v8);
  if (v16) {
    BOOL v2 = v1;
  }
  else {
    BOOL v2 = 0;
  }
  if (v2)
  {
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    LODWORD(v5) = DWORD1(v16);
    LODWORD(v4) = v16;
    BOOL v6 = Current - (double)v4 > (double)v5;
  }
  else
  {
    BOOL v6 = 0;
  }
  if (SHIBYTE(v15) < 0) {
    operator delete(__p);
  }
  if (SHIBYTE(v11) < 0) {
    operator delete(v9);
  }
  return v6;
}

void sub_1000110E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t sub_1000110F8(uint64_t a1)
{
  if (*(char *)(a1 + 63) < 0) {
    operator delete(*(void **)(a1 + 40));
  }
  if (*(char *)(a1 + 31) < 0) {
    operator delete(*(void **)(a1 + 8));
  }
  return a1;
}

BOOL sub_10001113C(uint64_t a1, int *a2)
{
  sub_10000F644(v9);
  uint64_t v3 = v10;
  if (v10)
  {
    unint64_t v4 = v9[0];
    *(_DWORD *)((char *)&v9[1] + (unint64_t)*(v9[0] - 3)) &= ~0x1000u;
    int v5 = -1;
    *a2 = -1;
    if ((*((unsigned char *)&v9[4] + (void)*(v4 - 3)) & 2) == 0)
    {
      uint64_t v6 = -174;
      while (1)
      {
        std::istream::read();
        unsigned int v7 = v9[0];
        if ((*((unsigned char *)&v9[4] + (unint64_t)*(v9[0] - 3)) & 2) != 0) {
          break;
        }
        int v5 = dword_100018490[*a2] ^ (*a2 >> 8);
        *a2 = v5;
        ++v6;
        if ((*((unsigned char *)&v9[4] + (void)*(v7 - 3)) & 2) != 0) {
          goto LABEL_11;
        }
      }
      int v5 = *a2;
    }
LABEL_11:
    *a2 = ~v5;
  }
  else if (os_log_type_enabled((os_log_t)qword_1000205A0, OS_LOG_TYPE_ERROR))
  {
    sub_10001750C();
  }
  std::filebuf::~filebuf();
  std::istream::~istream();
  std::ios::~ios();
  return v3 != 0;
}

void sub_1000113E0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
}

BOOL sub_1000113FC(uint64_t a1, int *a2)
{
  sub_1000021CC(&__p, "generateCrc");
  BOOL v4 = sub_10001113C(a1, a2);
  if (v7 < 0) {
    operator delete(__p);
  }
  return v4;
}

void sub_100011460(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_10001147C(uint64_t a1)
{
  *(_WORD *)uint64_t v10 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  std::string __p = 0;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  uint64_t v11 = 0;
  __int16 v14 = 0;
  long long v18 = xmmword_100018480;
  if (!sub_100010E3C((const char *)a1, (uint64_t)v10))
  {
    if (os_log_type_enabled((os_log_t)qword_1000205A0, OS_LOG_TYPE_ERROR)) {
      sub_100017590();
    }
    goto LABEL_11;
  }
  sub_10001068C(v10);
  int v9 = 0;
  sub_1000021CC(buf, "isCrcOkay");
  BOOL v2 = sub_10001113C(a1, &v9);
  BOOL v3 = v2;
  if (SHIBYTE(v23) < 0)
  {
    operator delete(*(void **)buf);
    if (!v3) {
      goto LABEL_11;
    }
  }
  else if (!v2)
  {
    goto LABEL_11;
  }
  int v4 = v9;
  if (HIDWORD(v18) == v9)
  {
    uint64_t v5 = 1;
    goto LABEL_12;
  }
  uint64_t v6 = qword_1000205A0;
  if (os_log_type_enabled((os_log_t)qword_1000205A0, OS_LOG_TYPE_ERROR))
  {
    if (*(char *)(a1 + 23) >= 0) {
      uint64_t v8 = a1;
    }
    else {
      uint64_t v8 = *(void *)a1;
    }
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = v8;
    __int16 v20 = 1024;
    int v21 = HIDWORD(v18);
    __int16 v22 = 1024;
    int v23 = v4;
    _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "#fu,isCrcOkay,file,%s,crcMismatch,onFile,%08x,calculated,%08x", buf, 0x18u);
  }
LABEL_11:
  uint64_t v5 = 0;
LABEL_12:
  if (SHIBYTE(v17) < 0) {
    operator delete(__p);
  }
  if (SHIBYTE(v13) < 0) {
    operator delete(v11);
  }
  return v5;
}

void sub_10001163C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11)
{
}

BOOL sub_100011674(const char *a1, int a2)
{
  __int16 v8 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  std::string __p = 0;
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  int v9 = 0;
  unsigned __int16 v12 = 0;
  long long v16 = xmmword_100018480;
  BOOL v4 = sub_100010E3C(a1, (uint64_t)&v8);
  if (v4)
  {
    if (v12 != a2)
    {
      uint64_t v5 = qword_1000205A0;
      if (os_log_type_enabled((os_log_t)qword_1000205A0, OS_LOG_TYPE_DEFAULT))
      {
        if (a1[23] >= 0) {
          uint64_t v6 = (uint64_t *)a1;
        }
        else {
          uint64_t v6 = *(uint64_t **)a1;
        }
        *(_DWORD *)buf = 67109634;
        int v18 = v12;
        __int16 v19 = 1024;
        int v20 = a2;
        __int16 v21 = 2080;
        __int16 v22 = v6;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#fu,isVersionOkay, Incorrect file version %d, expected %d, file %s", buf, 0x18u);
      }
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_1000205A0, OS_LOG_TYPE_ERROR))
  {
    sub_1000175FC();
  }
  if (SHIBYTE(v15) < 0) {
    operator delete(__p);
  }
  if (SHIBYTE(v11) < 0) {
    operator delete(v9);
  }
  return v4;
}

void sub_1000117E0(_Unwind_Exception *exception_object)
{
}

BOOL sub_1000117FC(uint64_t a1)
{
  sub_1000107AC();
  if (!v2)
  {
    BOOL v4 = qword_1000205A0;
    BOOL v5 = os_log_type_enabled((os_log_t)qword_1000205A0, OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v5) {
      return result;
    }
    if (*(char *)(a1 + 23) >= 0) {
      uint64_t v6 = a1;
    }
    else {
      uint64_t v6 = *(void *)a1;
    }
    int v7 = 136315138;
    uint64_t v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#fu,%s does not exist", (uint8_t *)&v7, 0xCu);
    return 0;
  }
  if (sub_10001147C(a1)) {
    return 1;
  }
  BOOL result = os_log_type_enabled((os_log_t)qword_1000205A0, OS_LOG_TYPE_ERROR);
  if (result)
  {
    sub_100017668();
    return 0;
  }
  return result;
}

BOOL sub_10001190C(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_1000107AC();
  if (!v5)
  {
    uint64_t v8 = qword_1000205A0;
    BOOL v9 = os_log_type_enabled((os_log_t)qword_1000205A0, OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v9) {
      return result;
    }
    if (*(char *)(a1 + 23) >= 0) {
      uint64_t v10 = a1;
    }
    else {
      uint64_t v10 = *(void *)a1;
    }
    int v12 = 136315138;
    uint64_t v13 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#fu,%s does not exist", (uint8_t *)&v12, 0xCu);
    return 0;
  }
  uint64_t v6 = v4;
  if (v4 != a2)
  {
    uint64_t v11 = qword_1000205A0;
    BOOL result = os_log_type_enabled((os_log_t)qword_1000205A0, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    sub_1000176D4(a2, v6, v11);
    return 0;
  }
  if (sub_10001147C(a1)) {
    return 1;
  }
  BOOL result = os_log_type_enabled((os_log_t)qword_1000205A0, OS_LOG_TYPE_ERROR);
  if (result)
  {
    sub_100017668();
    return 0;
  }
  return result;
}

void sub_100011A64(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_100011A7C(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_100011AA0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_100011AB8(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_100011AD0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_100011B00(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_100011B20(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x12u);
}

void sub_100011B40(void *a1, __int16 **a2)
{
  char v2 = a1 + 1;
  BOOL v3 = (unsigned char *)a1[1];
  a1[2] = v3;
  uint64_t v4 = *a2;
  uint64_t v5 = a2[1];
  if (*a2 != v5)
  {
    do
    {
      __int16 v7 = *v4;
      unint64_t v8 = a1[3];
      if ((unint64_t)v3 >= v8)
      {
        unint64_t v10 = *v2;
        uint64_t v11 = &v3[-*v2];
        unint64_t v12 = (unint64_t)(v11 + 1);
        if ((uint64_t)(v11 + 1) < 0) {
          goto LABEL_39;
        }
        unint64_t v13 = v8 - v10;
        if (2 * v13 > v12) {
          unint64_t v12 = 2 * v13;
        }
        if (v13 >= 0x3FFFFFFFFFFFFFFFLL) {
          size_t v14 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          size_t v14 = v12;
        }
        if (v14) {
          uint64_t v15 = (char *)operator new(v14);
        }
        else {
          uint64_t v15 = 0;
        }
        long long v16 = &v11[(void)v15];
        uint64_t v17 = &v11[(void)v15];
        *uint64_t v17 = v7;
        uint64_t v9 = v17 + 1;
        if (v3 != (unsigned char *)v10)
        {
          int v18 = &v3[~v10];
          do
          {
            char v19 = *--v3;
            (v18--)[(void)v15] = v19;
          }
          while (v3 != (unsigned char *)v10);
          BOOL v3 = (unsigned char *)*v2;
          long long v16 = v15;
        }
        a1[1] = v16;
        a1[2] = v9;
        a1[3] = &v15[v14];
        if (v3) {
          operator delete(v3);
        }
      }
      else
      {
        *BOOL v3 = v7;
        uint64_t v9 = v3 + 1;
      }
      a1[2] = v9;
      unint64_t v20 = a1[3];
      if ((unint64_t)v9 >= v20)
      {
        unint64_t v21 = *v2;
        __int16 v22 = &v9[-*v2];
        unint64_t v23 = (unint64_t)(v22 + 1);
        if ((uint64_t)(v22 + 1) < 0) {
LABEL_39:
        }
          sub_100004A44();
        unint64_t v24 = v20 - v21;
        if (2 * v24 > v23) {
          unint64_t v23 = 2 * v24;
        }
        if (v24 >= 0x3FFFFFFFFFFFFFFFLL) {
          size_t v25 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          size_t v25 = v23;
        }
        if (v25) {
          int v26 = operator new(v25);
        }
        else {
          int v26 = 0;
        }
        uint64_t v27 = (char *)v26 + v25;
        v22[(void)v26] = HIBYTE(v7);
        BOOL v3 = &v22[(void)v26 + 1];
        if (v9 == (unsigned char *)v21)
        {
          a1[1] = &v22[(void)v26];
          a1[2] = v3;
          a1[3] = v27;
        }
        else
        {
          unsigned int v28 = &v9[~v21];
          do
          {
            char v29 = *--v9;
            (v28--)[(void)v26] = v29;
          }
          while (v9 != (unsigned char *)v21);
          uint64_t v9 = (unsigned char *)a1[1];
          a1[1] = v26;
          a1[2] = v3;
          a1[3] = v27;
          if (!v9) {
            goto LABEL_37;
          }
        }
        operator delete(v9);
      }
      else
      {
        *uint64_t v9 = HIBYTE(v7);
        BOOL v3 = v9 + 1;
      }
LABEL_37:
      a1[2] = v3;
      ++v4;
    }
    while (v4 != v5);
  }
}

uint64_t sub_100011D1C(unsigned __int8 *a1)
{
  sub_100012008((uint64_t)v15);
  sub_1000121A0(*a1, &v12);
  char v2 = std::string::append(&v12, ": [");
  long long v3 = *(_OWORD *)&v2->__r_.__value_.__l.__data_;
  int64_t v14 = v2->__r_.__value_.__r.__words[2];
  *(_OWORD *)std::string __p = v3;
  v2->__r_.__value_.__l.__size_ = 0;
  v2->__r_.__value_.__r.__words[2] = 0;
  v2->__r_.__value_.__r.__words[0] = 0;
  if (v14 >= 0) {
    uint64_t v4 = __p;
  }
  else {
    uint64_t v4 = (void **)__p[0];
  }
  if (v14 >= 0) {
    uint64_t v5 = HIBYTE(v14);
  }
  else {
    uint64_t v5 = (uint64_t)__p[1];
  }
  sub_100014748(v15, (uint64_t)v4, v5);
  if (SHIBYTE(v14) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v12.__r_.__value_.__l.__data_);
  }
  LOBYTE(__p[0]) = 48;
  uint64_t v6 = sub_1000121D4(v15, (char *)__p);
  *(_DWORD *)((char *)v6 + *(void *)(*v6 - 24) + 8) = *(_DWORD *)((unsigned char *)v6 + *(void *)(*v6 - 24) + 8) & 0xFFFFFFB5 | 8;
  if (*((void *)a1 + 2) != *((void *)a1 + 1))
  {
    unint64_t v7 = 0;
    do
    {
      unint64_t v8 = sub_100014748(v15, (uint64_t)"0x", 2);
      *(void *)((char *)v8 + *(void *)(*v8 - 24) + 24) = 2;
      std::ostream::operator<<();
      uint64_t v10 = *((void *)a1 + 1);
      uint64_t v9 = *((void *)a1 + 2);
      if (v7 != ~v10 + v9)
      {
        sub_100014748(v15, (uint64_t)", ", 2);
        uint64_t v10 = *((void *)a1 + 1);
        uint64_t v9 = *((void *)a1 + 2);
      }
      ++v7;
    }
    while (v7 < v9 - v10);
  }
  sub_100014748(v15, (uint64_t)"]", 1);
  std::stringbuf::str();
  if (v16 < 0) {
    operator delete((void *)v15[9]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return std::ios::~ios();
}

void sub_100011FB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,char a22)
{
}

uint64_t sub_100012008(uint64_t a1)
{
  *(void *)a1 = v3;
  *(void *)(a1 + *(void *)(v3 - 24)) = v2;
  uint64_t v4 = (std::ios_base *)(a1 + *(void *)(*(void *)a1 - 24));
  std::ios_base::init(v4, (void *)(a1 + 8));
  v4[1].__vftable = 0;
  v4[1].__fmtflags_ = -1;
  std::streambuf::basic_streambuf();
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_DWORD *)(a1 + 104) = 16;
  return a1;
}

void sub_100012178(_Unwind_Exception *a1)
{
}

void *sub_1000121A0@<X0>(int a1@<W0>, void *a2@<X8>)
{
  if ((a1 - 1) > 0x35) {
    uint64_t v2 = "Unknown";
  }
  else {
    uint64_t v2 = (&off_10001CB98)[(char)(a1 - 1)];
  }
  return sub_1000021CC(a2, v2);
}

void *sub_1000121D4(void *a1, char *a2)
{
  uint64_t v3 = (char *)a1 + *(void *)(*a1 - 24);
  int v4 = *a2;
  if (*((_DWORD *)v3 + 36) == -1)
  {
    std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
    uint64_t v5 = std::locale::use_facet(&v8, &std::ctype<char>::id);
    int v6 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v5->__vftable[2].~facet_0)(v5, 32);
    std::locale::~locale(&v8);
    *((_DWORD *)v3 + 36) = v6;
  }
  *((_DWORD *)v3 + 36) = v4;
  return a1;
}

void sub_100012288(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::locale a10)
{
}

uint64_t sub_10001229C(uint64_t a1)
{
  if (*(char *)(a1 + 95) < 0) {
    operator delete(*(void **)(a1 + 72));
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  std::ios::~ios();
  return a1;
}

uint64_t sub_1000123A0(uint64_t a1, int a2)
{
  int v2 = 0;
  if (a2 < 0)
  {
    int v4 = 0;
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 8);
    int v4 = 0;
    if (*(void *)(a1 + 16) - v3 > (unint64_t)a2)
    {
      int v4 = *(unsigned __int8 *)(v3 + a2);
      int v2 = 1;
    }
  }
  return v4 | (v2 << 8);
}

BOOL sub_1000123D8(uint64_t a1, int a2, char a3)
{
  uint64_t v3 = *(void *)(a1 + 8);
  unint64_t v4 = *(void *)(a1 + 16) - v3;
  if (v4 > a2) {
    *(unsigned char *)(v3 + a2) = a3;
  }
  return v4 > a2;
}

BOOL sub_1000123FC(int a1)
{
  return (a1 - 9) < 4;
}

uint64_t sub_10001240C(unsigned int a1, int a2)
{
  if (a2 == 2)
  {
    if (a1 < 0x21 && ((0x1FFFFFE01uLL >> a1) & 1) != 0) {
      return byte_100018890[(char)a1];
    }
LABEL_9:
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    sub_1000124C0(exception, "Invalid raw value for extended preamble");
  }
  if (a2 != 1 || a1 >= 4) {
    goto LABEL_9;
  }
  return (a1 + 9);
}

void sub_1000124AC(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::runtime_error *sub_1000124C0(std::runtime_error *a1, const char *a2)
{
  BOOL result = std::runtime_error::runtime_error(a1, a2);
  return result;
}

void sub_1000124F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2 == 1)
  {
    sub_100014F7C("Preambles not supported in HSI 1.x", a2, a3, a4, a5, a6, a7, a8, v9);
    goto LABEL_5;
  }
  if (a2 != 2)
  {
    if (!a2)
    {
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      sub_1000124C0(exception, "Unknown HSI version");
LABEL_6:
    }
LABEL_5:
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    sub_1000124C0(exception, "Invalid extended preamble");
    goto LABEL_6;
  }
}

void sub_1000125CC(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_100012668(char a1)
{
  sub_10000DE00((uint64_t)v5);
  int v2 = sub_100014748(v6, (uint64_t)"Preamble_", 9);
  char v8 = a1;
  sub_100014748(v2, (uint64_t)&v8, 1);
  std::stringbuf::str();
  *(void *)((char *)v5
  v6[0] = v3;
  if (v7 < 0) {
    operator delete((void *)v6[9]);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return std::ios::~ios();
}

void sub_1000127F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t sub_100012808(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if ((result | 2) != 2)
  {
    sub_100014F7C("Exception: %s - 0x%x", a2, a3, a4, a5, a6, a7, a8, (uint64_t)"Invalid SFD code");
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    sub_1000124C0(exception, "Invalid sfd code");
  }
  return result;
}

void sub_10001288C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void *sub_1000128A0@<X0>(int a1@<W0>, void *a2@<X8>)
{
  if (a1) {
    int v2 = "Binary";
  }
  else {
    int v2 = "Ternary";
  }
  return sub_1000021CC(a2, v2);
}

uint64_t sub_1000128C0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (result > 0x1B || ((1 << result) & 0xFDB548F) == 0)
  {
    sub_100014F7C("Exception: %s - 0x%x", a2, a3, a4, a5, a6, a7, a8, (uint64_t)"Invalid session type");
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    sub_1000124C0(exception, "Invalid session type");
  }
  return result;
}

void sub_100012954(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void *sub_100012968@<X0>(unsigned int a1@<W0>, void *a2@<X8>)
{
  if (a1 > 0x1B) {
    int v2 = "UNKNOWN";
  }
  else {
    int v2 = (&off_10001CD48)[(char)a1];
  }
  return sub_1000021CC(a2, v2);
}

uint64_t sub_100012998(unsigned int a1)
{
  return (a1 > 0x1B) | (0x24FFFFu >> a1) & 1;
}

uint64_t sub_1000129B4(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (result > 4)
  {
    sub_100014F7C("Exception: %s - 0x%x", a2, a3, a4, a5, a6, a7, a8, (uint64_t)"Invalid gr superframe format");
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    sub_1000124C0(exception, "Invalid session type");
  }
  return result;
}

void sub_100012A34(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void *sub_100012A48@<X0>(unsigned int a1@<W0>, void *a2@<X8>)
{
  if (a1 > 4) {
    int v2 = "UNKNOWN";
  }
  else {
    int v2 = (&off_10001CE28)[(char)a1];
  }
  return sub_1000021CC(a2, v2);
}

uint64_t sub_100012A78(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (result > 1)
  {
    sub_100014F7C("Exception: %s - 0x%x", a2, a3, a4, a5, a6, a7, a8, (uint64_t)"Invalid session role");
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    sub_1000124C0(exception, "Invalid session role");
  }
  return result;
}

void sub_100012AF4(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void *sub_100012B08@<X0>(int a1@<W0>, void *a2@<X8>)
{
  int v2 = "UNKNOWN";
  if (a1 == 1) {
    int v2 = "Responder";
  }
  if (a1) {
    uint64_t v3 = (char *)v2;
  }
  else {
    uint64_t v3 = "Initiator";
  }
  return sub_1000021CC(a2, v3);
}

uint64_t sub_100012B38(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (result > 0x36 || ((1 << result) & 0x49E3C884FAA1F2) == 0)
  {
    sub_100014F7C("Exception: Invalid config parameter ID %d", a2, a3, a4, a5, a6, a7, a8, result);
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    sub_1000124C0(exception, "Invalid config parameter ID");
  }
  return result;
}

void sub_100012BD0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

_WORD *sub_100012BE4@<X0>(_WORD *result@<X0>, int a2@<W1>, uint64_t a3@<X8>)
{
  if (result < 0x33 && (__int16 v4 = a2, (a2 - 1) > 0xFFFFFFCC))
  {
    __int16 v6 = (__int16)result;
    char v7 = operator new(2uLL);
    *(void *)a3 = v7;
    *char v7 = v6 | (v4 << 8);
    BOOL result = v7 + 1;
    *(void *)(a3 + 8) = result;
    *(void *)(a3 + 16) = result;
    char v5 = 1;
  }
  else
  {
    char v5 = 0;
    *(unsigned char *)a3 = 0;
  }
  *(unsigned char *)(a3 + 24) = v5;
  return result;
}

uint64_t sub_100012C54(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if ((result - 1) > 2)
  {
    sub_100014F7C("Exception: %s - 0x%x", a2, a3, a4, a5, a6, a7, a8, (uint64_t)"Invalid range debug level");
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    sub_1000124C0(exception, "Invalid range debug level");
  }
  return result;
}

void sub_100012CD4(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void *sub_100012CE8@<X0>(int a1@<W0>, void *a2@<X8>)
{
  if ((a1 - 1) > 2) {
    int v2 = "UNKNOWN";
  }
  else {
    int v2 = (&off_10001CE50)[(char)(a1 - 1)];
  }
  return sub_1000021CC(a2, v2);
}

uint64_t sub_100012D1C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (result >= 0x62 && result != 16398 && result != 0xFFFF)
  {
    sub_100015140("Fault: %s - 0x%x", a2, a3, a4, a5, a6, a7, a8, (uint64_t)"Unknown error code");
    return 0xFFFFLL;
  }
  return result;
}

void *sub_100012D80@<X0>(int a1@<W0>, void *a2@<X8>)
{
  int v2 = "SUCCESS";
  switch(a1)
  {
    case 0:
      return sub_1000021CC(a2, v2);
    case 1:
      int v2 = "INVALID_CMD_PARAM";
      break;
    case 2:
      int v2 = "UNKNOWN_CMD";
      break;
    case 3:
      int v2 = "INVALID_CMD_LEN";
      break;
    case 4:
      int v2 = "MEMORY_FAILURE";
      break;
    case 5:
      int v2 = "INTERNAL";
      break;
    case 6:
      int v2 = "BUSY";
      break;
    case 7:
      int v2 = "CMD_DISALLOWED";
      break;
    case 8:
      int v2 = "SES_MAX_LIMIT_REACHED";
      break;
    case 9:
      int v2 = "SES_NOT_FOUND";
      break;
    case 10:
      int v2 = "TBD3";
      break;
    case 11:
      int v2 = "TBD4";
      break;
    case 12:
      int v2 = "SES_TIMEOUT";
      break;
    case 13:
      int v2 = "SES_SYNC_TIMEOUT";
      break;
    case 14:
      int v2 = "MISSED_RANGING_CYCLE";
      break;
    case 15:
      int v2 = "LOCAL_SES_REMOVE_SUCCESS";
      break;
    case 16:
      int v2 = "LOCAL_SES_DISABLE_SUCCESS";
      break;
    case 17:
      int v2 = "SES_COMPLETED";
      break;
    case 18:
      int v2 = "SES_ALREADY_ACTIVE";
      break;
    case 19:
      int v2 = "SES_ALREADY_DISABLED";
      break;
    case 20:
      int v2 = "SES_SCHEDULING_CONFLICT";
      break;
    case 21:
      int v2 = "SES_COEX_CONFLICT";
      break;
    case 22:
      int v2 = "SES_WRONG_SYNC";
      break;
    case 23:
      int v2 = "START_TIME_ELAPSED";
      break;
    case 24:
      int v2 = "SES_UAP_ALREADY_PENDING";
      break;
    case 25:
      int v2 = "COEX_UNSUPPORTED";
      break;
    case 26:
      int v2 = "INVALID_TX_MINI_SLOT_SIZE";
      break;
    case 27:
      int v2 = "INVALID_RX_MINI_SLOT_SIZE";
      break;
    case 28:
      int v2 = "INVALID_SES_ROLE";
      break;
    case 29:
      int v2 = "INVALID_ANTENNA_CFG";
      break;
    case 30:
      int v2 = "INVALID_NACCESS_SLOTS";
      break;
    case 31:
      int v2 = "INVALID_PREAMBLE";
      break;
    case 32:
      int v2 = "INVALID_FEM_CFG";
      break;
    case 33:
      int v2 = "SUPERFRAMES_OVERLAP";
      break;
    case 34:
      int v2 = "INVALID_INTERVAL";
      break;
    case 35:
      int v2 = "INVALID_PKT_TYPE";
      break;
    case 36:
      int v2 = "INVALID_MAC_ADDR";
      break;
    case 37:
      int v2 = "MUTE_UNMUTE_DISALLOWED";
      break;
    case 38:
      int v2 = "SES_MUTED";
      break;
    case 39:
      int v2 = "INVALID_CHANNEL";
      break;
    case 40:
      int v2 = "DTM_CMD_UNSUPPORTED";
      break;
    case 41:
      int v2 = "DTM_SES_NOT_READY";
      break;
    case 42:
      int v2 = "DTM_SES_BUSY";
      break;
    case 43:
      int v2 = "DTM_PAYLOAD_INVALID_LEN";
      break;
    case 44:
      int v2 = "DTM_INVALID_SES_TO";
      break;
    case 45:
      int v2 = "MP_CMD_INTERLEAVED";
      break;
    case 46:
      int v2 = "MP_CMD_LEN_OVERFLOW";
      break;
    case 47:
      int v2 = "INVALID_SES_TYPE";
      break;
    case 48:
      int v2 = "INVALID_ALISHA_UWB_CFG_ID";
      break;
    case 49:
      int v2 = "INVALID_ALISHA_RAN_MULTIPLIER";
      break;
    case 50:
      int v2 = "INVALID_ALISHA_NRESPONDERS";
      break;
    case 51:
      int v2 = "INVALID_ALISHA_NCHAPS_PER_SLOT";
      break;
    case 52:
      int v2 = "INVALID_ALISHA_NSLOTS_PER_ROUND";
      break;
    case 53:
      int v2 = "INVALID_ALISHA_RBLOCK_CFG";
      break;
    case 54:
      int v2 = "ALISHA_UWB_SES_ID_NOT_FOUND";
      break;
    case 55:
      int v2 = "ALISHA_UWB_SES_ID_ALREADY_IN_USE";
      break;
    case 56:
      int v2 = "ALISHA_KEY_STORE_FULL";
      break;
    case 57:
      int v2 = "INVALID_ALISHA_RESPONDER_IDX";
      break;
    case 58:
      int v2 = "SES_GRUAP_ALREADY_PENDING";
      break;
    case 59:
      int v2 = "INVALID_CHANNEL_HOP_PATTERN";
      break;
    case 60:
      int v2 = "INVALID_ACCESS_SLOT_IDX";
      break;
    case 61:
      int v2 = "INVALID_GR_TYPE";
      break;
    case 62:
      int v2 = "SLOT_TIME_ELAPSED";
      break;
    case 63:
      int v2 = "INVALID_ALISHA_PULSE_SHAPE_COMBO";
      break;
    case 64:
      int v2 = "INVALID_ALISHA_HOP_MODE";
      break;
    case 65:
      int v2 = "INVALID_ALISHA_HOP_SEQUENCE";
      break;
    case 66:
      int v2 = "INVALID_SUBRATE";
      break;
    case 67:
      int v2 = "SES_NOT_ACTIVE";
      break;
    case 68:
      int v2 = "SES_SUBRATE_ALREADY_PENDING";
      break;
    case 69:
      int v2 = "SES_SUBRATE_ALREADY_EFFECTIVE";
      break;
    case 70:
      int v2 = "UAP_RX_FAILED";
      break;
    case 71:
      int v2 = "ALISHA_URSK_RETRIEVAL_FAILED";
      break;
    case 72:
      int v2 = "ALISHA_GET_KEY_ALREADY_PENDING";
      break;
    case 73:
      int v2 = "ALISHA_STS_INDEX_EXHAUSTED";
      break;
    case 74:
      int v2 = "ALISHA_BLOCK_IDX_EXHAUSTED";
      break;
    case 75:
      int v2 = "ALISHA_URSK_TTL_EXPIRED";
      break;
    case 76:
      int v2 = "INVALID_ALISHA_STS_INDEX_0";
      break;
    case 77:
      int v2 = "ALISHA_RESPONSE_TIMEOUT";
      break;
    case 78:
      int v2 = "ALISHA_TOTAL_TIMEOUT";
      break;
    case 79:
      int v2 = "UNAUTHENTICATED_CAL_BLOB";
      break;
    case 80:
      int v2 = "INVALID_SFD";
      break;
    case 81:
      int v2 = "INVALID_ALISHA_NSIMRESPONDERS";
      break;
    case 82:
      int v2 = "DUPLICATE";
      break;
    case 83:
      int v2 = "NMI_NAP_RX_FAILED";
      break;
    case 84:
      int v2 = "NMI_NAR_RX_FAILED";
      break;
    case 85:
      int v2 = "NMI_SOR_RX_FAILED";
      break;
    case 86:
      int v2 = "NMI_NAP_WRONG_SYNC";
      break;
    case 87:
      int v2 = "NMI_WRONG_IRK";
      break;
    case 88:
      int v2 = "NMI_RNG_DIS_BOTH_SIDES";
      break;
    case 89:
      int v2 = "NMI_POLL_RSP_RX_OTHER_FAILURE";
      break;
    case 90:
      int v2 = "NMI_DATA_RX_OTHER_FAILURE";
      break;
    case 91:
      int v2 = "NMI_POLL_RSP_WRONG_SYNC";
      break;
    case 92:
      int v2 = "NMI_DATA_WRONG_SYNC";
      break;
    case 93:
      int v2 = "SES_EXCLUSIVE_MAC_DISALLOWED";
      break;
    case 94:
      int v2 = "NMI_NAR_WRONG_SYNC";
      break;
    case 95:
      int v2 = "NMI_SOR_WRONG_SYNC";
      break;
    case 96:
      int v2 = "NMI_INVALID_RTT_TAT";
      break;
    case 97:
      int v2 = "NMI_POLL_RSP_MISSED_CYCLE";
      break;
    default:
      uint64_t v3 = "UNKNOWN";
      if (a1 == 0xFFFF) {
        uint64_t v3 = "UNKNOWN_ERROR";
      }
      if (a1 == 16398) {
        int v2 = "FACTORY_STOP_TEST";
      }
      else {
        int v2 = (char *)v3;
      }
      break;
  }
  return sub_1000021CC(a2, v2);
}

uint64_t sub_100013404(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (result > 6)
  {
    sub_100014F7C("Exception: %s - 0x%x", a2, a3, a4, a5, a6, a7, a8, (uint64_t)"Invalid Rose hardware version");
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    sub_1000124C0(exception, "Invalid Rose hardware version");
  }
  return result;
}

void sub_100013480(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void *sub_100013494@<X0>(unsigned int a1@<W0>, void *a2@<X8>)
{
  if (a1 > 6) {
    int v2 = "UNKNOWN";
  }
  else {
    int v2 = (&off_10001CE68)[(__int16)a1];
  }
  return sub_1000021CC(a2, v2);
}

uint64_t sub_1000134C4(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (((result - 208) > 0x2E || ((1 << (result + 48)) & 0x7FFF47FF1FFFLL) == 0)
    && (result > 0x18 || ((1 << result) & 0x116003F) == 0))
  {
    sub_100014F7C("Exception: %s - 0x%x", a2, a3, a4, a5, a6, a7, a8, (uint64_t)"Invalid rx status.");
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    sub_1000124C0(exception, "Invalid rx status.");
  }
  return result;
}

void sub_100013580(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_100013594(unsigned __int8 **a1)
{
  uint64_t v1 = *a1;
  int v2 = a1[1];
  if (*a1 == v2)
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    int v3 = 0;
    int v4 = 0;
    do
    {
      int v5 = *v1++;
      unsigned int v6 = v5 - 2;
      int v7 = v3 | 2;
      if (v5 == 1) {
        v3 |= 1u;
      }
      if (v6 < 4)
      {
        ++v4;
        int v3 = v7;
      }
    }
    while (v1 != v2);
    if ((v4 & 0xFFFFFFFB) != 0) {
      sub_10001774C();
    }
  }
  return v3;
}

uint64_t sub_1000135FC(unsigned int a1)
{
  if (a1 >= 4) {
    sub_100017778();
  }
  return a1 & 1;
}

uint64_t sub_10001361C(unsigned int a1)
{
  if (a1 >= 4) {
    sub_1000177A4();
  }
  return (a1 >> 1) & 1;
}

void *sub_10001363C@<X0>(int a1@<W0>, void *a2@<X8>)
{
  if ((a1 - 1) > 4) {
    int v2 = "UNKNOWN";
  }
  else {
    int v2 = (&off_10001CEA0)[(char)(a1 - 1)];
  }
  return sub_1000021CC(a2, v2);
}

void *sub_100013670@<X0>(int a1@<W0>, void *a2@<X8>)
{
  int v2 = "UNKNOWN";
  if (a1 == 9) {
    int v2 = "CHANNEL9";
  }
  if (a1 == 5) {
    int v3 = "CHANNEL5";
  }
  else {
    int v3 = (char *)v2;
  }
  return sub_1000021CC(a2, v3);
}

void *sub_1000136A0@<X0>(unsigned int a1@<W0>, void *a2@<X8>)
{
  if (a1 > 6) {
    int v2 = "UNKNOWN";
  }
  else {
    int v2 = (&off_10001CEC8)[(char)a1];
  }
  return sub_1000021CC(a2, v2);
}

unsigned char *sub_1000136D0(unsigned char *result, int a2)
{
  if (a2 == 5)
  {
    char v2 = 1;
  }
  else
  {
    if (a2 != 9) {
      return result;
    }
    char v2 = 2;
  }
  *result |= v2;
  return result;
}

_WORD *sub_1000136FC(_WORD *result, int a2)
{
  if ((a2 - 1) <= 5) {
    *result |= word_1000188B2[(char)(a2 - 1)];
  }
  return result;
}

uint64_t sub_100013728(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned __int8 v8 = a1;
  switch(a2)
  {
    case 1:
      if (a1)
      {
        if (a1 != 1)
        {
          sub_100014F7C("Exception: %s - %d", a2, a3, a4, a5, a6, a7, a8, (uint64_t)"Invalid Rose channel config for HSI V1");
          exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
          sub_1000124C0(exception, "Invalid Rose channel config");
LABEL_12:
        }
        return 9;
      }
      else
      {
        return 5;
      }
    case 2:
      sub_100013828(a1, a2, a3, a4, a5, a6, a7, a8);
      break;
    case 0:
      sub_100014F7C("Exception: %s", a2, a3, a4, a5, a6, a7, a8, (uint64_t)"Unknown HSI version");
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      sub_1000124C0(exception, "Unknown HSI version");
      goto LABEL_12;
  }
  return v8;
}

void sub_100013810(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_100013828(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (result != 9 && result != 5)
  {
    sub_100014F7C("Exception: %s - %d", a2, a3, a4, a5, a6, a7, a8, (uint64_t)"Invalid Rose channel config for HSI V2");
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    sub_1000124C0(exception, "Invalid Rose channel config");
  }
  return result;
}

void sub_1000138B0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1000138C4(int a1, int a2)
{
  if (a2 == 2)
  {
    if (a1 == 5) {
      return 5;
    }
    else {
      return 9;
    }
  }
  else
  {
    if (a2 != 1)
    {
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      sub_1000124C0(exception, "Unknown HSI version");
    }
    return a1 != 5;
  }
}

void sub_100013940(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

unint64_t sub_100013954(unsigned int a1)
{
  unsigned int v1 = a1 >> 11;
  if ((a1 >> 11) - 1 >= 6)
  {
    if (!v1 && (a1 == 9 || a1 == 5))
    {
      LOBYTE(v1) = 0;
      unint64_t v2 = ((unint64_t)a1 << 8) | 0x10000;
    }
    else
    {
      LOBYTE(v1) = 0;
      unint64_t v2 = 0;
    }
  }
  else
  {
    unint64_t v2 = ((unint64_t)(a1 & 0x7FF) << 32) | 0x1000000000000;
  }
  return v2 | v1;
}

uint64_t sub_1000139BC(unsigned __int8 *a1)
{
  int v1 = *a1;
  __int16 v2 = (_WORD)v1 << 11;
  unsigned __int16 v3 = v1 - 1;
  if ((v1 - 1) >= 6)
  {
    if (*a1) {
      return v3;
    }
    if (a1[2]) {
      return (unsigned __int16)(v2 | a1[1]);
    }
LABEL_8:
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    sub_1000124C0(exception, "Missing channel-select for band");
  }
  if (!a1[6]) {
    goto LABEL_8;
  }
  return (unsigned __int16)(*((_WORD *)a1 + 2) | v2);
}

void sub_100013A6C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_100013A84(int a1)
{
  if ((*(void *)&a1 & 0xFF0000) != 0 && (unint64_t v1 = sub_100013954((unsigned __int16)a1), v2))
  {
    BOOL v3 = v1 == 0;
    unint64_t v4 = v1 >> 16;
    if ((_BYTE)v1) {
      unsigned __int8 v5 = 0;
    }
    else {
      unsigned __int8 v5 = BYTE1(v1);
    }
    if (v3) {
      int v6 = v4;
    }
    else {
      int v6 = 0;
    }
  }
  else
  {
    unsigned __int8 v5 = 0;
    int v6 = 0;
  }
  return v5 | (v6 << 8);
}

uint64_t sub_100013AD8(unsigned __int8 *a1)
{
  sub_10000DE00((uint64_t)v9);
  int v2 = *a1;
  switch(*a1)
  {
    case 0u:
      BOOL v3 = v10;
      unint64_t v4 = "UWB";
      uint64_t v5 = 3;
      goto LABEL_10;
    case 1u:
      uint64_t v5 = 3;
      BOOL v3 = sub_100014748(v10, (uint64_t)"UNI", 3);
      unint64_t v4 = "I-3";
      goto LABEL_10;
    case 2u:
      BOOL v3 = sub_100014748(v10, (uint64_t)"UNI", 3);
      unint64_t v4 = "I-5a";
      goto LABEL_9;
    case 3u:
      BOOL v3 = sub_100014748(v10, (uint64_t)"UNI", 3);
      unint64_t v4 = "I-5b";
      goto LABEL_9;
    case 4u:
      BOOL v3 = sub_100014748(v10, (uint64_t)"UNI", 3);
      unint64_t v4 = "I-5c";
      goto LABEL_9;
    case 5u:
      BOOL v3 = sub_100014748(v10, (uint64_t)"UNI", 3);
      unint64_t v4 = "I-5d";
      goto LABEL_9;
    case 6u:
      BOOL v3 = sub_100014748(v10, (uint64_t)"UNI", 3);
      unint64_t v4 = "I-35";
LABEL_9:
      uint64_t v5 = 4;
LABEL_10:
      sub_100014748(v3, (uint64_t)v4, v5);
      int v2 = *a1;
      break;
    default:
      break;
  }
  if ((v2 - 1) < 6)
  {
    if (a1[6])
    {
      sub_100014748(v10, (uint64_t)" Ch", 3);
      if (a1[6])
      {
LABEL_14:
        std::ostream::operator<<();
        goto LABEL_15;
      }
LABEL_21:
      sub_10000FE8C();
    }
    goto LABEL_22;
  }
  if (!v2)
  {
    if (a1[2])
    {
      sub_100014748(v10, (uint64_t)" Ch", 3);
      if (a1[2]) {
        goto LABEL_14;
      }
      goto LABEL_21;
    }
LABEL_22:
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Missing channel-select for band");
  }
LABEL_15:
  std::stringbuf::str();
  *(void *)((char *)v9
  v10[0] = v6;
  if (v11 < 0) {
    operator delete((void *)v10[9]);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return std::ios::~ios();
}

void sub_100013E4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  __cxa_free_exception(v10);
  sub_10000E0D8((uint64_t)&a10);
  _Unwind_Resume(a1);
}

BOOL sub_100013E90(unsigned __int8 *a1, unsigned __int8 *a2)
{
  unsigned int v2 = *a1;
  unsigned int v3 = *a2;
  if (v2 < v3) {
    return 1;
  }
  if (v2 == v3) {
    return a1[1] < a2[1];
  }
  return 0;
}

BOOL sub_100013EC8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2 && a1[1] == a2[1];
}

BOOL sub_100013EE8(unsigned char *a1)
{
  return *a1 == 0;
}

uint64_t sub_100013EF8(unsigned int a1)
{
  unsigned int v1 = a1 >> 8;
  unsigned __int8 v2 = __rev16(a1);
  unsigned int v3 = bswap32(a1) >> 24;
  if (((1 << SBYTE1(a1)) & 0x101F7) == 0)
  {
    unsigned __int8 v2 = 0;
    unsigned int v3 = a1 >> 8;
  }
  BOOL v4 = v1 > 0x10;
  int v5 = v1 <= 0x10 && ((1 << SBYTE1(a1)) & 0x101F7) != 0;
  if (v4)
  {
    unsigned __int8 v2 = 0;
    LOWORD(v3) = v5;
  }
  return (unsigned __int16)(v2 | (unsigned __int16)((_WORD)v3 << 8)) | (v5 << 16);
}

uint64_t sub_100013F4C(unsigned __int16 *a1)
{
  return bswap32(*a1) >> 16;
}

uint64_t sub_100013F5C(unsigned __int8 *a1)
{
  int v1 = a1[1];
  int v2 = *a1;
  if (*a1)
  {
    if (v2 == 16 && v1 == 1)
    {
      int v1 = 1;
      int v2 = 16;
    }
  }
  else
  {
    unsigned int v3 = v1 - 1;
    if (v3 >= 0xD)
    {
      int v1 = 0;
      int v2 = 0;
    }
    else
    {
      int v2 = 0;
      int v1 = byte_1000188BE[(char)v3];
    }
  }
  return v1 | (v2 << 8);
}

uint64_t sub_100013FC0(unsigned char *a1)
{
  sub_10000DE00((uint64_t)v13);
  switch(*a1)
  {
    case 0:
      int v2 = v14;
      unsigned int v3 = "Legacy_";
      uint64_t v4 = 7;
      goto LABEL_7;
    case 1:
      int v2 = v14;
      unsigned int v3 = "IEEE_";
      uint64_t v4 = 5;
      goto LABEL_7;
    case 2:
      int v5 = v14;
      uint64_t v6 = "IEEE_";
      uint64_t v7 = 5;
      goto LABEL_9;
    case 4:
      int v5 = v14;
      uint64_t v6 = "Proprietary_";
      uint64_t v7 = 12;
      goto LABEL_9;
    case 5:
      int v2 = sub_100014748(v14, (uint64_t)"Split", 5);
      unsigned int v3 = "ND_";
      uint64_t v4 = 3;
LABEL_7:
      unsigned __int8 v8 = sub_100014748(v2, (uint64_t)v3, v4);
      uint64_t v9 = "BPRF";
      goto LABEL_10;
    case 6:
      int v5 = sub_100014748(v14, (uint64_t)"Split", 5);
      uint64_t v6 = "ND_";
      uint64_t v7 = 3;
LABEL_9:
      unsigned __int8 v8 = sub_100014748(v5, (uint64_t)v6, v7);
      uint64_t v9 = "HPRF";
LABEL_10:
      uint64_t v10 = 4;
      goto LABEL_15;
    case 7:
      unsigned __int8 v8 = v14;
      goto LABEL_13;
    case 8:
      unsigned __int8 v8 = sub_100014748(v14, (uint64_t)"Mixed_", 6);
LABEL_13:
      uint64_t v9 = "MMS";
      uint64_t v10 = 3;
      goto LABEL_15;
    case 0x10:
      unsigned __int8 v8 = v14;
      uint64_t v9 = "NB";
      uint64_t v10 = 2;
LABEL_15:
      sub_100014748(v8, (uint64_t)v9, v10);
      break;
    default:
      break;
  }
  sub_100014748(v14, (uint64_t)" PktIdx ", 8);
  std::ostream::operator<<();
  std::stringbuf::str();
  *(void *)((char *)v13
  v14[0] = v11;
  if (v15 < 0) {
    operator delete((void *)v14[9]);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return std::ios::~ios();
}

void sub_100014288(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_10000E0D8((uint64_t)va);
  _Unwind_Resume(a1);
}

void *sub_1000142E0@<X0>(int a1@<W0>, char *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void *a9@<X8>)
{
  switch(a1)
  {
    case 208:
      a2 = "SW_PADDING_VAL_MISMATCH";
      break;
    case 209:
      a2 = "SW_SC_MISMATCH";
      break;
    case 210:
      a2 = "SW_IE_HDR_MISMATCH";
      break;
    case 211:
      a2 = "SW_VENDOR_OUI_MISMATCH";
      break;
    case 212:
      a2 = "SW_HDR_TERM_IE_MISMATCH";
      break;
    case 213:
      a2 = "SW_UWB_SES_ID_MISMATCH";
      break;
    case 214:
      a2 = "SW_STS_INDEX_MISMATCH";
      break;
    case 215:
      a2 = "SW_INVALID_PLD_HDR_CONTENTS";
      break;
    case 216:
      a2 = "SW_INVALID_RDM_CONTENTS";
      break;
    case 217:
      a2 = "SW_ROUND_IDX_MISMATCH";
      break;
    case 218:
      a2 = "SW_INVALID_RCM_CONTENTS";
      break;
    case 219:
      a2 = "SW_INVALID_MRM_CONTENTS";
      break;
    case 220:
      a2 = "SW_INVALID_RRRM_CONTENTS";
      break;
    case 221:
    case 222:
    case 223:
    case 235:
    case 236:
    case 237:
    case 239:
LABEL_55:
      sub_100014F7C("Exception: %s - 0x%hhx", (uint64_t)a2, a3, a4, a5, a6, a7, a8, (uint64_t)"Invalid rx status.");
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      sub_1000124C0(exception, "Invalid rx status.");
    case 224:
      a2 = "SW_SUPERFRAMES_OVERLAP";
      break;
    case 225:
      a2 = "SW_INVALID_SRC_ADDR";
      break;
    case 226:
      a2 = "SW_SKIPPED";
      break;
    case 227:
      a2 = "SW_AOA_UNCERTAIN";
      break;
    case 228:
      a2 = "SW_NEG_SOF_TS_ERROR";
      break;
    case 229:
      a2 = "SW_BUSY";
      break;
    case 230:
      a2 = "INVALID_FEM_CFG";
      break;
    case 231:
      a2 = "DECRYPTION_FAILED";
      break;
    case 232:
      a2 = "INVALID_CHANNEL_HOP_PATTERN";
      break;
    case 233:
      a2 = "INVALID_CHANNEL";
      break;
    case 234:
      a2 = "INVALID_CURRENT_CHANNEL";
      break;
    case 238:
      a2 = "SW_TIME_ELAPSED";
      break;
    case 240:
      a2 = "SW_ABORT";
      break;
    case 241:
      a2 = "SW_STS_MISMATCH";
      break;
    case 242:
      a2 = "SW_VERSION_PREFIX_MISMATCH";
      break;
    case 243:
      a2 = "SW_FC_MISMATCH";
      break;
    case 244:
      a2 = "SW_SEQN_MISMATCH";
      break;
    case 245:
      a2 = "SW_WRONG_SYNC";
      break;
    case 246:
      a2 = "SW_PDU_LEN_MISMATCH";
      break;
    case 247:
      a2 = "SW_PDU_ID_MISMATCH";
      break;
    case 248:
      a2 = "SW_UNSUPPORTED_VERSION";
      break;
    case 249:
      a2 = "SW_UAP_OFFSET_ELAPSED";
      break;
    case 250:
      a2 = "SW_INVALID_TX_MSLOT_SZ";
      break;
    case 251:
      a2 = "SW_INVALID_RX_MSLOT_SZ";
      break;
    case 252:
      a2 = "SW_INVALID_NACCESS_SLOTS";
      break;
    case 253:
      a2 = "SW_INVALID_INTERVAL";
      break;
    case 254:
      a2 = "SW_INVALID_PREAMBLE";
      break;
    default:
      a2 = "SUCCESS";
      switch(a1)
      {
        case 0:
          goto LABEL_52;
        case 1:
          a2 = "TIMEOUT";
          goto LABEL_52;
        case 2:
          a2 = "PHR_ERROR";
          goto LABEL_52;
        case 3:
          a2 = "SECDED_ERROR";
          goto LABEL_52;
        case 4:
          a2 = "STS_ERROR";
          goto LABEL_52;
        case 5:
          a2 = "CRC_ERROR";
          goto LABEL_52;
        case 17:
          a2 = "PHY_INVALID_CONFIG";
          goto LABEL_52;
        case 18:
          a2 = "PHY_FINGER_LOSS";
          goto LABEL_52;
        case 20:
          a2 = "PHY_SFD_FAILURE";
          goto LABEL_52;
        case 24:
          a2 = "PHY_SECDED_FAILURE";
          goto LABEL_52;
        default:
          goto LABEL_55;
      }
  }
LABEL_52:
  return sub_1000021CC(a9, a2);
}

void sub_100014614(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void *sub_100014748(void *a1, uint64_t a2, uint64_t a3)
{
  std::ostream::sentry::sentry();
  if (v13)
  {
    uint64_t v6 = (uint64_t)a1 + *(void *)(*a1 - 24);
    uint64_t v7 = *(void *)(v6 + 40);
    int v8 = *(_DWORD *)(v6 + 8);
    int v9 = *(_DWORD *)(v6 + 144);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
      uint64_t v10 = std::locale::use_facet(&v14, &std::ctype<char>::id);
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
    if (!sub_1000148EC(v7, a2, v11, a2 + a3, v6, (char)v9)) {
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | 5);
    }
  }
  std::ostream::sentry::~sentry();
  return a1;
}

void sub_100014884(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  std::ostream::sentry::~sentry();
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(void *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x100014864);
}

void sub_1000148D8(_Unwind_Exception *a1)
{
}

uint64_t sub_1000148EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
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
      sub_100014A74(__p, v12, __c);
      char v13 = v18 >= 0 ? __p : (void **)__p[0];
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

void sub_100014A58(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *sub_100014A74(void *__b, size_t __len, int __c)
{
  if (__len >= 0x7FFFFFFFFFFFFFF8) {
    sub_100001FE4();
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

void sub_100014B20(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  va_list v18 = (va_list)&a9;
  uint64_t v10 = sub_100014C04();
  sub_100014CB4((uint64_t)v10);
  sub_1000021CC(&v15, a1);
  uint64_t v11 = std::string::append(&v15, "\n");
  long long v12 = *(_OWORD *)&v11->__r_.__value_.__l.__data_;
  int64_t v17 = v11->__r_.__value_.__r.__words[2];
  *(_OWORD *)std::string __p = v12;
  v11->__r_.__value_.__l.__size_ = 0;
  v11->__r_.__value_.__r.__words[2] = 0;
  v11->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v15.__r_.__value_.__l.__data_);
  }
  char v13 = (std::mutex *)sub_100014D2C();
  if (v17 >= 0) {
    uint64_t v14 = __p;
  }
  else {
    uint64_t v14 = (void **)__p[0];
  }
  sub_100014DBC(v13, (const char *)v14, v18);
  if (SHIBYTE(v17) < 0) {
    operator delete(__p[0]);
  }
}

void sub_100014BD4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t *sub_100014C04()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_100020440, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_100020440))
  {
    qword_100020400 = 850045863;
    xmmword_100020408 = 0u;
    unk_100020418 = 0u;
    xmmword_100020428 = 0u;
    qword_100020438 = 0;
    qword_1000203F8 = (uint64_t)os_log_create("com.apple.librose", "client");
    __cxa_atexit((void (*)(void *))sub_10001529C, &qword_1000203F8, (void *)&_mh_execute_header);
    __cxa_guard_release(&qword_100020440);
  }
  return &qword_1000203F8;
}

void sub_100014CB4(uint64_t a1)
{
  int v1 = (std::mutex *)(a1 + 8);
  std::mutex::lock((std::mutex *)(a1 + 8));
  os_log_with_args();
  std::mutex::unlock(v1);
}

uint64_t *sub_100014D2C()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_100020488, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_100020488))
  {
    qword_100020448 = 850045863;
    *(_OWORD *)algn_100020450 = 0u;
    *(_OWORD *)&algn_100020450[16] = 0u;
    *(_OWORD *)&algn_100020450[32] = 0u;
    qword_100020480 = 0;
    __cxa_atexit((void (*)(void *))std::mutex::~mutex, &qword_100020448, (void *)&_mh_execute_header);
    __cxa_guard_release(&qword_100020488);
  }
  return &qword_100020448;
}

void sub_100014DBC(std::mutex *a1, const char *a2, va_list a3)
{
  std::mutex::lock(a1);
  vprintf(a2, a3);
  fflush(__stdoutp);
  std::mutex::unlock(a1);
}

void sub_100014E20(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  va_list v18 = (va_list)&a9;
  uint64_t v10 = sub_100014C04();
  sub_100014F04((uint64_t)v10);
  sub_1000021CC(&v15, a1);
  uint64_t v11 = std::string::append(&v15, "\n");
  long long v12 = *(_OWORD *)&v11->__r_.__value_.__l.__data_;
  int64_t v17 = v11->__r_.__value_.__r.__words[2];
  *(_OWORD *)std::string __p = v12;
  v11->__r_.__value_.__l.__size_ = 0;
  v11->__r_.__value_.__r.__words[2] = 0;
  v11->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v15.__r_.__value_.__l.__data_);
  }
  char v13 = (std::mutex *)sub_100014D2C();
  if (v17 >= 0) {
    uint64_t v14 = __p;
  }
  else {
    uint64_t v14 = (void **)__p[0];
  }
  sub_100014DBC(v13, (const char *)v14, v18);
  if (SHIBYTE(v17) < 0) {
    operator delete(__p[0]);
  }
}

void sub_100014ED4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_100014F04(uint64_t a1)
{
  int v1 = (std::mutex *)(a1 + 8);
  std::mutex::lock((std::mutex *)(a1 + 8));
  os_log_with_args();
  std::mutex::unlock(v1);
}

void sub_100014F7C(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  va_list v18 = (va_list)&a9;
  uint64_t v10 = sub_100014C04();
  sub_100015060((uint64_t)v10);
  sub_1000021CC(&v15, a1);
  uint64_t v11 = std::string::append(&v15, "\n");
  long long v12 = *(_OWORD *)&v11->__r_.__value_.__l.__data_;
  int64_t v17 = v11->__r_.__value_.__r.__words[2];
  *(_OWORD *)std::string __p = v12;
  v11->__r_.__value_.__l.__size_ = 0;
  v11->__r_.__value_.__r.__words[2] = 0;
  v11->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v15.__r_.__value_.__l.__data_);
  }
  char v13 = (std::mutex *)sub_100014D2C();
  if (v17 >= 0) {
    uint64_t v14 = __p;
  }
  else {
    uint64_t v14 = (void **)__p[0];
  }
  sub_1000150D8(v13, (const char *)v14, v18);
  if (SHIBYTE(v17) < 0) {
    operator delete(__p[0]);
  }
}

void sub_100015030(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_100015060(uint64_t a1)
{
  int v1 = (std::mutex *)(a1 + 8);
  std::mutex::lock((std::mutex *)(a1 + 8));
  os_log_with_args();
  std::mutex::unlock(v1);
}

void sub_1000150D8(std::mutex *a1, const char *a2, va_list a3)
{
  std::mutex::lock(a1);
  vfprintf(__stderrp, a2, a3);
  fflush(__stderrp);
  std::mutex::unlock(a1);
}

void sub_100015140(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  va_list v18 = (va_list)&a9;
  uint64_t v10 = sub_100014C04();
  sub_100015224((uint64_t)v10);
  sub_1000021CC(&v15, a1);
  uint64_t v11 = std::string::append(&v15, "\n");
  long long v12 = *(_OWORD *)&v11->__r_.__value_.__l.__data_;
  int64_t v17 = v11->__r_.__value_.__r.__words[2];
  *(_OWORD *)std::string __p = v12;
  v11->__r_.__value_.__l.__size_ = 0;
  v11->__r_.__value_.__r.__words[2] = 0;
  v11->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v15.__r_.__value_.__l.__data_);
  }
  char v13 = (std::mutex *)sub_100014D2C();
  if (v17 >= 0) {
    uint64_t v14 = __p;
  }
  else {
    uint64_t v14 = (void **)__p[0];
  }
  sub_1000150D8(v13, (const char *)v14, v18);
  if (SHIBYTE(v17) < 0) {
    operator delete(__p[0]);
  }
}

void sub_1000151F4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_100015224(uint64_t a1)
{
  int v1 = (std::mutex *)(a1 + 8);
  std::mutex::lock((std::mutex *)(a1 + 8));
  os_log_with_args();
  std::mutex::unlock(v1);
}

uint64_t sub_1000152A0(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000152DC()
{
  if (qword_100020570 != -1) {
    dispatch_once(&qword_100020570, &stru_10001CF20);
  }
  return dword_100020490;
}

void sub_100015320(id a1)
{
  int v1 = (const void *)MGCopyAnswer();
  if (v1)
  {
    int v9 = v1;
    CFTypeID v10 = CFGetTypeID(v1);
    if (v10 == CFNumberGetTypeID())
    {
      unsigned int valuePtr = 0;
      if (CFNumberGetValue((CFNumberRef)v9, kCFNumberSInt32Type, &valuePtr))
      {
        if (valuePtr == 8228)
        {
          dword_100020490 = 1;
          va_list v18 = "Chip type 2";
          goto LABEL_13;
        }
        if (valuePtr == 8198)
        {
          dword_100020490 = 0;
          va_list v18 = "Chip type 1";
LABEL_13:
          sub_100014E20(v18, v11, v12, v13, v14, v15, v16, v17, v20);
LABEL_16:
          CFRelease(v9);
          return;
        }
        uint64_t v20 = valuePtr;
        char v19 = "Unrecognized ChipID 0x%x";
      }
      else
      {
        char v19 = "Failed to extract ChipID as a number";
      }
    }
    else
    {
      char v19 = "ChipID has unexpected type";
    }
    sub_100014F7C(v19, v11, v12, v13, v14, v15, v16, v17, v20);
    goto LABEL_16;
  }
  sub_100014F7C("Failed to get ChipID", v2, v3, v4, v5, v6, v7, v8, v23);
}

uint64_t sub_10001542C()
{
  qword_1000205A0 = (uint64_t)os_log_create("com.apple.nearbyd", "general");
  return _objc_release_x1();
}

uint64_t sub_100015470(uint64_t a1)
{
  *(unsigned char *)a1 = 0;
  *(unsigned char *)(a1 + 112) = 0;
  *(unsigned char *)(a1 + 120) = 0;
  *(unsigned char *)(a1 + 213) = 0;
  *(unsigned char *)(a1 + 216) = 0;
  *(unsigned char *)(a1 + 568) = 0;
  *(_DWORD *)(a1 + 576) = 999;
  *(void *)(a1 + 584) = 850045863;
  *(_OWORD *)(a1 + 592) = 0u;
  *(_OWORD *)(a1 + 608) = 0u;
  *(_OWORD *)(a1 + 624) = 0u;
  *(void *)(a1 + 640) = 0;
  *(void *)(a1 + 648) = 850045863;
  *(_OWORD *)(a1 + 656) = 0u;
  *(_OWORD *)(a1 + 672) = 0u;
  *(_OWORD *)(a1 + 688) = 0u;
  *(void *)(a1 + 704) = 0;
  *(void *)(a1 + 736) = 0;
  sub_100015558(a1);
  unsigned int v2 = sub_1000152DC();
  *(_DWORD *)(a1 + 744) = v2;
  if (v2 <= 2) {
    *(_DWORD *)(a1 + 748) = dword_1000188E8[v2];
  }
  return a1;
}

void sub_100015524(_Unwind_Exception *a1)
{
  sub_100001D00((void *)(v1 + 712));
  std::mutex::~mutex(v4);
  std::mutex::~mutex(v3);
  sub_100001D84(v2);
  sub_100001EE0(v1);
  _Unwind_Resume(a1);
}

void sub_100015558(uint64_t a1)
{
  uint64_t v2 = MGGetProductType();
  if (v2 > 2625074842)
  {
    if (v2 > 3571532205)
    {
      if (v2 > 3825599859)
      {
        if (v2 > 3885279869)
        {
          switch(v2)
          {
            case 3885279870:
              uint64_t v10 = 3;
              goto LABEL_113;
            case 4068102502:
              uint64_t v10 = 120;
              goto LABEL_113;
            case 4201643249:
              uint64_t v10 = 6;
              goto LABEL_113;
          }
        }
        else
        {
          switch(v2)
          {
            case 3825599860:
              uint64_t v10 = 16;
              goto LABEL_113;
            case 3839750255:
              uint64_t v10 = 117;
              goto LABEL_113;
            case 3867318491:
              uint64_t v10 = 113;
              goto LABEL_113;
          }
        }
      }
      else if (v2 > 3742999857)
      {
        switch(v2)
        {
          case 3742999858:
            uint64_t v10 = 110;
            goto LABEL_113;
          case 3767261006:
            uint64_t v10 = 104;
            goto LABEL_113;
          case 3819635030:
            uint64_t v10 = 112;
            goto LABEL_113;
        }
      }
      else
      {
        switch(v2)
        {
          case 3571532206:
            uint64_t v10 = 102;
            goto LABEL_113;
          case 3585085679:
            uint64_t v10 = 8;
            goto LABEL_113;
          case 3663011141:
            uint64_t v10 = 109;
            goto LABEL_113;
        }
      }
    }
    else if (v2 > 2941181570)
    {
      if (v2 > 3001488777)
      {
        switch(v2)
        {
          case 3001488778:
            uint64_t v10 = 5;
            goto LABEL_113;
          case 3143587592:
            uint64_t v10 = 118;
            goto LABEL_113;
          case 3348380076:
            uint64_t v10 = 200;
            goto LABEL_113;
        }
      }
      else
      {
        switch(v2)
        {
          case 2941181571:
            uint64_t v10 = 18;
            goto LABEL_113;
          case 2943112657:
            uint64_t v10 = 100;
            goto LABEL_113;
          case 2979575960:
            uint64_t v10 = 106;
            goto LABEL_113;
        }
      }
    }
    else if (v2 > 2793418700)
    {
      switch(v2)
      {
        case 2793418701:
          uint64_t v10 = 15;
          goto LABEL_113;
        case 2795618603:
          uint64_t v10 = 21;
          goto LABEL_113;
        case 2940697645:
          uint64_t v10 = 13;
          goto LABEL_113;
      }
    }
    else
    {
      switch(v2)
      {
        case 2625074843:
          uint64_t v10 = 114;
          goto LABEL_113;
        case 2688879999:
          uint64_t v10 = 14;
          goto LABEL_113;
        case 2722529672:
          uint64_t v10 = 2;
          goto LABEL_113;
      }
    }
LABEL_112:
    uint64_t v10 = 997;
    goto LABEL_113;
  }
  if (v2 > 1408738133)
  {
    if (v2 > 2021146988)
    {
      if (v2 > 2085054104)
      {
        switch(v2)
        {
          case 2085054105:
            uint64_t v10 = 111;
            goto LABEL_113;
          case 2132302344:
            uint64_t v10 = 101;
            goto LABEL_113;
          case 2309863438:
            uint64_t v10 = 10;
            goto LABEL_113;
        }
      }
      else
      {
        switch(v2)
        {
          case 2021146989:
            uint64_t v10 = 12;
            goto LABEL_113;
          case 2080700391:
            uint64_t v10 = 0;
            goto LABEL_113;
          case 2084894489:
            uint64_t v10 = 115;
            goto LABEL_113;
        }
      }
    }
    else if (v2 > 1554479184)
    {
      switch(v2)
      {
        case 1554479185:
          uint64_t v10 = 121;
          goto LABEL_113;
        case 1602181456:
          uint64_t v10 = 107;
          goto LABEL_113;
        case 1770142589:
          uint64_t v10 = 116;
          goto LABEL_113;
      }
    }
    else
    {
      switch(v2)
      {
        case 1408738134:
          uint64_t v10 = 103;
          goto LABEL_113;
        case 1434404433:
          uint64_t v10 = 11;
          goto LABEL_113;
        case 1540760353:
          uint64_t v10 = 201;
          goto LABEL_113;
      }
    }
    goto LABEL_112;
  }
  if (v2 > 749116820)
  {
    if (v2 > 1169082143)
    {
      switch(v2)
      {
        case 1169082144:
          uint64_t v10 = 4;
          goto LABEL_113;
        case 1280909812:
          uint64_t v10 = 105;
          goto LABEL_113;
        case 1371389549:
          uint64_t v10 = 1;
          goto LABEL_113;
      }
    }
    else
    {
      switch(v2)
      {
        case 749116821:
          uint64_t v10 = 119;
          goto LABEL_113;
        case 851437781:
          uint64_t v10 = 19;
          goto LABEL_113;
        case 1060988941:
          uint64_t v10 = 7;
          goto LABEL_113;
      }
    }
    goto LABEL_112;
  }
  if (v2 > 425046864)
  {
    switch(v2)
    {
      case 425046865:
        uint64_t v10 = 108;
        goto LABEL_113;
      case 574536383:
        uint64_t v10 = 20;
        goto LABEL_113;
      case 689804742:
        uint64_t v10 = 9;
        goto LABEL_113;
    }
    goto LABEL_112;
  }
  if (v2 == -1)
  {
    uint64_t v10 = 999;
    goto LABEL_113;
  }
  if (v2 == 133314240)
  {
    uint64_t v10 = 17;
    goto LABEL_113;
  }
  if (v2 != 330877086) {
    goto LABEL_112;
  }
  uint64_t v10 = 22;
LABEL_113:
  *(_DWORD *)(a1 + 576) = v10;
  sub_100014E20("RoseParameterCache: device type %d", v3, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_100015B04(uint64_t a1)
{
  uint64_t result = sub_1000152DC();
  *(_DWORD *)(a1 + 744) = result;
  if (result <= 2) {
    *(_DWORD *)(a1 + 748) = dword_1000188E8[(int)result];
  }
  return result;
}

void sub_100015B48(uint64_t a1, long long *a2)
{
  uint64_t v4 = (std::mutex *)(a1 + 648);
  std::mutex::lock((std::mutex *)(a1 + 648));
  sub_1000167FC(a1);
  sub_100016840((void *)a1, a2);
  *(unsigned char *)(a1 + 112) = 1;
  sub_100014E20("RoseParameterCache::cacheHelloResponse", v5, v6, v7, v8, v9, v10, v11, v19);
  sub_100015BD8((unsigned char *)a1, v12, v13, v14, v15, v16, v17, v18);
  std::mutex::unlock(v4);
}

void sub_100015BC4(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_100015BD8(unsigned char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1[112]) {
    uint64_t v9 = "cached";
  }
  else {
    uint64_t v9 = "not cached";
  }
  sub_100014E20("RoseParameterCache: HelloResponse %s", a2, a3, a4, a5, a6, a7, a8, (uint64_t)v9);
  if (a1[213]) {
    uint64_t v17 = "cached";
  }
  else {
    uint64_t v17 = "not cached";
  }
  sub_100014E20("RoseParameterCache: AlishaCapabilities %s", v10, v11, v12, v13, v14, v15, v16, (uint64_t)v17);
  if (a1[568]) {
    size_t v25 = "cached";
  }
  else {
    size_t v25 = "not cached";
  }
  sub_100014E20("RoseParameterCache: RoseCalFileParser %s", v18, v19, v20, v21, v22, v23, v24, (uint64_t)v25);
  if (a1[568])
  {
    int v26 = sub_1000021CC(__p, "AOAtoPDOAMapping_CV_Ch5");
    sub_100016304((uint64_t)v26, (uint64_t)(a1 + 280), (uint64_t)__p, v27, v28, v29, v30, v31);
    if (v51 < 0) {
      operator delete(__p[0]);
    }
    if (!a1[568]) {
      goto LABEL_23;
    }
    uint64_t v32 = sub_1000021CC(__p, "AOAtoPDOAMapping_CH_Ch5");
    sub_100016304((uint64_t)v32, (uint64_t)(a1 + 344), (uint64_t)__p, v33, v34, v35, v36, v37);
    if (v51 < 0) {
      operator delete(__p[0]);
    }
    if (!a1[568]) {
      goto LABEL_23;
    }
    uint64_t v38 = sub_1000021CC(__p, "AOAtoPDOAMapping_CV_Ch9");
    sub_100016304((uint64_t)v38, (uint64_t)(a1 + 408), (uint64_t)__p, v39, v40, v41, v42, v43);
    if (v51 < 0) {
      operator delete(__p[0]);
    }
    if (!a1[568]) {
LABEL_23:
    }
      sub_10000FE8C();
    unsigned __int8 v44 = sub_1000021CC(__p, "AOAtoPDOAMapping_CH_Ch9");
    sub_100016304((uint64_t)v44, (uint64_t)(a1 + 472), (uint64_t)__p, v45, v46, v47, v48, v49);
    if (v51 < 0) {
      operator delete(__p[0]);
    }
  }
}

void sub_100015D50(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_100015D78(uint64_t a1, long long *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(unsigned char *)(a1 + 213)) {
    *(unsigned char *)(a1 + 213) = 0;
  }
  long long v9 = *a2;
  *(_OWORD *)(a1 + 136) = a2[1];
  *(_OWORD *)(a1 + 120) = v9;
  long long v10 = a2[2];
  long long v11 = a2[3];
  long long v12 = a2[4];
  *(_OWORD *)(a1 + 197) = *(long long *)((char *)a2 + 77);
  *(_OWORD *)(a1 + 184) = v12;
  *(_OWORD *)(a1 + 168) = v11;
  *(_OWORD *)(a1 + 152) = v10;
  *(unsigned char *)(a1 + 213) = 1;
  sub_100014E20("RoseParameterCache::cacheAlishaCapabilities", (uint64_t)a2, a3, a4, a5, a6, a7, a8, v20);
  sub_100015BD8((unsigned char *)a1, v13, v14, v15, v16, v17, v18, v19);
}

void sub_100015DF4(uint64_t a1, long long *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (*(unsigned char *)(a1 + 568))
  {
    sub_100014E20("RoseParameterCache::cacheRoseCalFileParser: returning because roseCalFileParser is already cached", (uint64_t)a2, a3, a4, a5, a6, a7, a8, a9);
  }
  else
  {
    sub_100015EC8(a1 + 216, a2);
    sub_100014E20("RoseParameterCache::cacheRoseCalFileParser", v10, v11, v12, v13, v14, v15, v16, v32);
    sub_100015BD8((unsigned char *)a1, v17, v18, v19, v20, v21, v22, v23);
    std::mutex::lock((std::mutex *)(a1 + 584));
    if (*(void *)(a1 + 736))
    {
      sub_100014E20("RoseParameterCache::cacheRoseCalFileParser: start executing CalFileParsingDone callback function", v24, v25, v26, v27, v28, v29, v30, v33);
      if (*(unsigned char *)(a1 + 568)) {
        char v31 = sub_10000FA6C((unsigned __int8 *)(a1 + 272));
      }
      else {
        char v31 = 0;
      }
      sub_100015F48(a1 + 712, v31);
    }
    std::mutex::unlock((std::mutex *)(a1 + 584));
  }
}

void sub_100015EB4(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_100015EC8(uint64_t a1, long long *a2)
{
  sub_100016480(a1);
  long long v4 = *a2;
  long long v5 = a2[1];
  long long v6 = a2[2];
  *(unsigned char *)(a1 + 48) = *((unsigned char *)a2 + 48);
  *(_OWORD *)(a1 + 16) = v5;
  *(_OWORD *)(a1 + 32) = v6;
  *(_OWORD *)a1 = v4;
  sub_1000169E0(a1 + 56, (uint64_t)a2 + 56);
  *(_WORD *)(a1 + 320) = *((_WORD *)a2 + 160);
  *(void *)(a1 + 336) = 0;
  *(void *)(a1 + 344) = 0;
  *(void *)(a1 + 328) = 0;
  uint64_t v7 = *((void *)a2 + 42);
  *(void *)(a1 + 328) = *((void *)a2 + 41);
  *(void *)(a1 + 336) = v7;
  *(void *)(a1 + 344) = *((void *)a2 + 43);
  *((void *)a2 + 41) = 0;
  *((void *)a2 + 42) = 0;
  *((void *)a2 + 43) = 0;
  *(unsigned char *)(a1 + 352) = 1;
  return a1;
}

uint64_t sub_100015F48(uint64_t a1, char a2)
{
  char v4 = a2;
  uint64_t v2 = *(void *)(a1 + 24);
  if (!v2) {
    sub_100016B0C();
  }
  return (*(uint64_t (**)(uint64_t, char *))(*(void *)v2 + 48))(v2, &v4);
}

void sub_100015F9C(uint64_t a1@<X8>)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_100020590, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_100020590))
  {
    xmmword_100020578 = 0uLL;
    unk_100020588 = 0;
    __cxa_atexit((void (*)(void *))&std::string::~string, &xmmword_100020578, (void *)&_mh_execute_header);
    __cxa_guard_release(&qword_100020590);
  }
  if (qword_100020598 != -1) {
    dispatch_once(&qword_100020598, &stru_10001CF60);
  }
  if (byte_10002058F < 0)
  {
    long long v2 = xmmword_100020578;
    sub_1000020C0((unsigned char *)a1, (void *)v2, *((unint64_t *)&v2 + 1));
  }
  else
  {
    *(_OWORD *)a1 = xmmword_100020578;
    *(void *)(a1 + 16) = unk_100020588;
  }
}

void sub_100016090(id a1)
{
  uint64_t v25 = 1;
  uint64_t v8 = (char *)container_system_group_path_for_identifier();
  if (!v8) {
    sub_1000177D0(&v25, v1, v2, v3, v4, v5, v6, v7);
  }
  sub_1000021CC(&v24, v8);
  sub_1000021CC(__p, "/Library/");
  if ((v23 & 0x80u) == 0) {
    long long v9 = __p;
  }
  else {
    long long v9 = (void **)__p[0];
  }
  if ((v23 & 0x80u) == 0) {
    std::string::size_type v10 = v23;
  }
  else {
    std::string::size_type v10 = (std::string::size_type)__p[1];
  }
  uint64_t v11 = std::string::append(&v24, (const std::string::value_type *)v9, v10);
  std::string::size_type v19 = v11->__r_.__value_.__r.__words[0];
  v26[0] = v11->__r_.__value_.__l.__size_;
  *(void *)((char *)v26 + 7) = *(std::string::size_type *)((char *)&v11->__r_.__value_.__r.__words[1] + 7);
  char v20 = HIBYTE(v11->__r_.__value_.__r.__words[2]);
  v11->__r_.__value_.__l.__size_ = 0;
  v11->__r_.__value_.__r.__words[2] = 0;
  v11->__r_.__value_.__r.__words[0] = 0;
  if (byte_10002058F < 0) {
    operator delete((void *)xmmword_100020578);
  }
  *(void *)&xmmword_100020578 = v19;
  *((void *)&xmmword_100020578 + 1) = v26[0];
  *(void *)((char *)&xmmword_100020578 + 15) = *(void *)((char *)v26 + 7);
  byte_10002058F = v20;
  if ((char)v23 < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v24.__r_.__value_.__l.__data_);
  }
  if (byte_10002058F >= 0) {
    uint64_t v21 = &xmmword_100020578;
  }
  else {
    uint64_t v21 = (long long *)xmmword_100020578;
  }
  sub_100014E20("system group container path: %s", v12, v13, v14, v15, v16, v17, v18, (uint64_t)v21);
  free(v8);
}

void sub_1000161F0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  if (a22 < 0) {
    operator delete(a17);
  }
  _Unwind_Resume(exception_object);
}

void sub_10001622C(char *a1@<X1>, std::string *a2@<X8>)
{
  sub_100015F9C((uint64_t)&v9);
  sub_1000021CC(__p, a1);
  if ((v8 & 0x80u) == 0) {
    uint64_t v4 = __p;
  }
  else {
    uint64_t v4 = (void **)__p[0];
  }
  if ((v8 & 0x80u) == 0) {
    std::string::size_type v5 = v8;
  }
  else {
    std::string::size_type v5 = (std::string::size_type)__p[1];
  }
  uint64_t v6 = std::string::append(&v9, (const std::string::value_type *)v4, v5);
  *a2 = *v6;
  v6->__r_.__value_.__l.__size_ = 0;
  v6->__r_.__value_.__r.__words[2] = 0;
  v6->__r_.__value_.__r.__words[0] = 0;
  if ((char)v8 < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v9.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v9.__r_.__value_.__l.__data_);
  }
}

void sub_1000162D0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a20 < 0) {
    operator delete(a15);
  }
  _Unwind_Resume(exception_object);
}

void sub_100016304(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(char *)(a3 + 23) >= 0) {
    uint64_t v8 = a3;
  }
  else {
    uint64_t v8 = *(void *)a3;
  }
  if (*(unsigned char *)(a2 + 56)) {
    sub_100014E20("RoseParameterCache: mapping %s cached (%zu x %zu)", a2, a3, a4, a5, a6, a7, a8, v8);
  }
  else {
    sub_100014E20("RoseParameterCache: mapping %s not cached", a2, a3, a4, a5, a6, a7, a8, v8);
  }
}

void sub_100016360(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (std::mutex *)(a1 + 584);
  std::mutex::lock((std::mutex *)(a1 + 584));
  sub_100014E20("RoseParameterCache: CalFileParsingDone callback function is registered", v5, v6, v7, v8, v9, v10, v11, v12);
  sub_1000163D8((void *)(a1 + 712), a2);
  std::mutex::unlock(v4);
}

void sub_1000163C4(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void *sub_1000163D8(void *a1, uint64_t a2)
{
  sub_100016B94((uint64_t)v4, a2);
  sub_100016C2C(v4, a1);
  sub_100001D00(v4);
  return a1;
}

void sub_10001644C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_100016480(a1 + 216);
  sub_100014E20("RoseParameterCache::deleteRoseCalFileParser", v9, v10, v11, v12, v13, v14, v15, a9);
}

void sub_100016480(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 352))
  {
    uint64_t v6 = (void **)(a1 + 328);
    sub_100001E3C(&v6);
    if (*(unsigned char *)(a1 + 312))
    {
      uint64_t v2 = *(void **)(a1 + 288);
      if (v2)
      {
        *(void *)(a1 + 296) = v2;
        operator delete(v2);
      }
    }
    if (*(unsigned char *)(a1 + 248))
    {
      uint64_t v3 = *(void **)(a1 + 224);
      if (v3)
      {
        *(void *)(a1 + 232) = v3;
        operator delete(v3);
      }
    }
    if (*(unsigned char *)(a1 + 184))
    {
      uint64_t v4 = *(void **)(a1 + 160);
      if (v4)
      {
        *(void *)(a1 + 168) = v4;
        operator delete(v4);
      }
    }
    if (*(unsigned char *)(a1 + 120))
    {
      uint64_t v5 = *(void **)(a1 + 96);
      if (v5)
      {
        *(void *)(a1 + 104) = v5;
        operator delete(v5);
      }
    }
    *(unsigned char *)(a1 + 352) = 0;
  }
}

uint64_t sub_100016524(uint64_t a1)
{
  uint64_t v2 = (std::mutex *)(a1 + 648);
  std::mutex::lock((std::mutex *)(a1 + 648));
  if (*(unsigned char *)(a1 + 112))
  {
    __int16 v3 = *(_WORD *)(a1 + 26);
    int v4 = v3 & 0xFF00;
    int v5 = v3;
    int v6 = 0x10000;
  }
  else
  {
    int v6 = 0;
    int v5 = 0;
    int v4 = 0;
  }
  std::mutex::unlock(v2);
  return v5 | v6 | v4;
}

BOOL sub_100016590(uint64_t a1)
{
  return sub_10000E210(*(_DWORD *)(a1 + 576));
}

uint64_t sub_100016598(uint64_t a1)
{
  return sub_10000E220(*(_DWORD *)(a1 + 576));
}

uint64_t sub_1000165A0(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 744);
  if (v1 == 1) {
    return 0;
  }
  if (v1 == 2)
  {
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::logic_error::logic_error(exception, "Chip type error");
  }
  return 1;
}

void sub_100016614(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

BOOL sub_100016628(uint64_t a1)
{
  return sub_10000E318(*(_DWORD *)(a1 + 576));
}

uint64_t sub_100016630(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 744);
  if (v1 == 1) {
    return 0;
  }
  if (v1 == 2)
  {
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::logic_error::logic_error(exception, "Chip type error");
  }
  return 1;
}

void sub_1000166A4(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1000166B8(uint64_t a1)
{
  return sub_10000E2C0(*(_DWORD *)(a1 + 576));
}

BOOL sub_1000166C0(uint64_t a1)
{
  return (*(_DWORD *)(a1 + 744) & 0xFFFFFFFD) != 0;
}

uint64_t sub_1000166D0(uint64_t a1)
{
  uint64_t result = sub_10000E2C0(*(_DWORD *)(a1 + 576));
  if (result)
  {
    uint64_t v3 = sub_100016524(a1);
    return (v3 & 0xFF0000) != 0 && (unsigned __int16)v3 == 6;
  }
  return result;
}

BOOL sub_100016718(uint64_t a1)
{
  return *(_DWORD *)(a1 + 744) == 1;
}

BOOL sub_100016728(uint64_t a1)
{
  return sub_10000E460(*(_DWORD *)(a1 + 576));
}

BOOL sub_100016730(uint64_t a1)
{
  BOOL result = sub_10000E340(*(_DWORD *)(a1 + 576));
  if (result)
  {
    uint64_t v3 = sub_100016524(a1);
    return (v3 & 0xFF0000) != 0 && (unsigned __int16)v3 == 6;
  }
  return result;
}

uint64_t sub_100016778(uint64_t a1)
{
  return sub_10000E488(*(_DWORD *)(a1 + 576));
}

BOOL sub_100016780(uint64_t a1)
{
  return *(_DWORD *)(a1 + 744) == 1 && sub_10000E340(*(_DWORD *)(a1 + 576));
}

BOOL sub_10001679C(uint64_t a1)
{
  uint64_t v1 = sub_100016524(a1);
  return (v1 & 0xFF0000) != 0 && (unsigned __int16)v1 == 6;
}

uint64_t sub_1000167C4(uint64_t a1)
{
  uint64_t v1 = sub_100016524(a1);
  if ((unsigned __int16)v1 - 5 >= 2) {
    unsigned int v2 = 295;
  }
  else {
    unsigned int v2 = 310;
  }
  if ((v1 & 0xFF0000) != 0) {
    return v2;
  }
  else {
    return 0;
  }
}

void sub_1000167FC(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 112))
  {
    sub_100001F24(a1 + 32);
    if (*(char *)(a1 + 23) < 0) {
      operator delete(*(void **)a1);
    }
    *(unsigned char *)(a1 + 112) = 0;
  }
}

void *sub_100016840(void *__dst, long long *a2)
{
  if (*((char *)a2 + 23) < 0)
  {
    sub_1000020C0(__dst, *(void **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v4 = *a2;
    __dst[2] = *((void *)a2 + 2);
    *(_OWORD *)long long __dst = v4;
  }
  *((_DWORD *)__dst + 6) = *((_DWORD *)a2 + 6);
  sub_1000168C8((unsigned char *)__dst + 32, (uint64_t)(a2 + 2));
  __dst[13] = *((void *)a2 + 13);
  return __dst;
}

void sub_1000168AC(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

unsigned char *sub_1000168C8(unsigned char *a1, uint64_t a2)
{
  *a1 = 0;
  a1[64] = 0;
  if (*(unsigned char *)(a2 + 64))
  {
    sub_100016920((uint64_t)a1, (int *)a2);
    a1[64] = 1;
  }
  return a1;
}

void sub_10001690C(_Unwind_Exception *a1)
{
  sub_100001F24(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_100016920(uint64_t a1, int *a2)
{
  int v4 = *a2;
  *(_WORD *)(a1 + 4) = *((_WORD *)a2 + 2);
  *(_DWORD *)a1 = v4;
  if (*((char *)a2 + 31) < 0)
  {
    sub_1000020C0((unsigned char *)(a1 + 8), *((void **)a2 + 1), *((void *)a2 + 2));
  }
  else
  {
    long long v5 = *(_OWORD *)(a2 + 2);
    *(void *)(a1 + 24) = *((void *)a2 + 3);
    *(_OWORD *)(a1 + 8) = v5;
  }
  *(void *)(a1 + 32) = *((void *)a2 + 4);
  int v6 = (unsigned char *)(a1 + 40);
  if (*((char *)a2 + 63) < 0)
  {
    sub_1000020C0(v6, *((void **)a2 + 5), *((void *)a2 + 6));
  }
  else
  {
    long long v7 = *(_OWORD *)(a2 + 10);
    *(void *)(a1 + 56) = *((void *)a2 + 7);
    *(_OWORD *)int v6 = v7;
  }
  return a1;
}

void sub_1000169C4(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 31) < 0) {
    operator delete(*v2);
  }
  _Unwind_Resume(exception_object);
}

__n128 sub_1000169E0(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 64) = 0;
  if (*(unsigned char *)(a2 + 64))
  {
    long long v2 = *(_OWORD *)(a2 + 24);
    *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
    *(_OWORD *)(a1 + 24) = v2;
    *(void *)(a1 + 48) = 0;
    *(void *)(a1 + 56) = 0;
    *(void *)(a1 + 40) = 0;
    __n128 result = *(__n128 *)(a2 + 40);
    *(__n128 *)(a1 + 40) = result;
    *(void *)(a1 + 56) = *(void *)(a2 + 56);
    *(void *)(a2 + 40) = 0;
    *(void *)(a2 + 48) = 0;
    *(void *)(a2 + 56) = 0;
    *(unsigned char *)(a1 + 64) = 1;
  }
  *(unsigned char *)(a1 + 72) = 0;
  *(unsigned char *)(a1 + 128) = 0;
  if (*(unsigned char *)(a2 + 128))
  {
    long long v4 = *(_OWORD *)(a2 + 88);
    *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
    *(_OWORD *)(a1 + 88) = v4;
    *(void *)(a1 + 112) = 0;
    *(void *)(a1 + 120) = 0;
    *(void *)(a1 + 104) = 0;
    __n128 result = *(__n128 *)(a2 + 104);
    *(__n128 *)(a1 + 104) = result;
    *(void *)(a1 + 120) = *(void *)(a2 + 120);
    *(void *)(a2 + 104) = 0;
    *(void *)(a2 + 112) = 0;
    *(void *)(a2 + 120) = 0;
    *(unsigned char *)(a1 + 128) = 1;
  }
  *(unsigned char *)(a1 + 136) = 0;
  *(unsigned char *)(a1 + 192) = 0;
  if (*(unsigned char *)(a2 + 192))
  {
    long long v5 = *(_OWORD *)(a2 + 152);
    *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
    *(_OWORD *)(a1 + 152) = v5;
    *(void *)(a1 + 176) = 0;
    *(void *)(a1 + 184) = 0;
    *(void *)(a1 + 168) = 0;
    __n128 result = *(__n128 *)(a2 + 168);
    *(__n128 *)(a1 + 168) = result;
    *(void *)(a1 + 184) = *(void *)(a2 + 184);
    *(void *)(a2 + 168) = 0;
    *(void *)(a2 + 176) = 0;
    *(void *)(a2 + 184) = 0;
    *(unsigned char *)(a1 + 192) = 1;
  }
  *(unsigned char *)(a1 + 200) = 0;
  *(unsigned char *)(a1 + 256) = 0;
  if (*(unsigned char *)(a2 + 256))
  {
    long long v6 = *(_OWORD *)(a2 + 216);
    *(_OWORD *)(a1 + 200) = *(_OWORD *)(a2 + 200);
    *(_OWORD *)(a1 + 216) = v6;
    *(void *)(a1 + 240) = 0;
    *(void *)(a1 + 248) = 0;
    *(void *)(a1 + 232) = 0;
    __n128 result = *(__n128 *)(a2 + 232);
    *(__n128 *)(a1 + 232) = result;
    *(void *)(a1 + 248) = *(void *)(a2 + 248);
    *(void *)(a2 + 232) = 0;
    *(void *)(a2 + 240) = 0;
    *(void *)(a2 + 248) = 0;
    *(unsigned char *)(a1 + 256) = 1;
  }
  return result;
}

void sub_100016B0C()
{
  exception = __cxa_allocate_exception(8uLL);
  void *exception = &off_10001CFA8;
}

void sub_100016B5C(std::exception *a1)
{
  std::exception::~exception(a1);
  operator delete();
}

uint64_t sub_100016B94(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 24);
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

void *sub_100016C2C(void *result, void *a2)
{
  if (a2 != result)
  {
    uint64_t v3 = result;
    long long v4 = (void *)result[3];
    long long v5 = (void *)a2[3];
    if (v4 == result)
    {
      if (v5 == a2)
      {
        (*(void (**)(void *, void *))(*result + 24))(result, v6);
        (*(void (**)(void))(*(void *)v3[3] + 32))(v3[3]);
        v3[3] = 0;
        (*(void (**)(void, void *))(*(void *)a2[3] + 24))(a2[3], v3);
        (*(void (**)(void))(*(void *)a2[3] + 32))(a2[3]);
        a2[3] = 0;
        v3[3] = v3;
        (*(void (**)(void *, void *))(v6[0] + 24))(v6, a2);
        __n128 result = (void *)(*(uint64_t (**)(void *))(v6[0] + 32))(v6);
      }
      else
      {
        (*(void (**)(void *, void *))(*result + 24))(result, a2);
        __n128 result = (void *)(*(uint64_t (**)(void))(*(void *)v3[3] + 32))(v3[3]);
        v3[3] = a2[3];
      }
      a2[3] = a2;
    }
    else if (v5 == a2)
    {
      (*(void (**)(void *, void *))(*a2 + 24))(a2, result);
      __n128 result = (void *)(*(uint64_t (**)(void))(*(void *)a2[3] + 32))(a2[3]);
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

void sub_100016E8C(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  sub_100001E28(a1);
}

uint64_t sub_100016E98(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 8))();
}

void sub_100016EBC()
{
  __assert_rtn("operator()", "RoseAOAtoPDOAMapping.cpp", 39, "azDeg >= fMinAzDeg");
}

void sub_100016EE8()
{
  __assert_rtn("operator()", "RoseAOAtoPDOAMapping.cpp", 40, "azDeg <= fMaxAzDeg");
}

void sub_100016F14()
{
  __assert_rtn("operator()", "RoseAOAtoPDOAMapping.cpp", 41, "elDeg >= fMinElDeg");
}

void sub_100016F40()
{
  __assert_rtn("operator()", "RoseAOAtoPDOAMapping.cpp", 42, "elDeg <= fMaxElDeg");
}

void sub_100016F6C()
{
  __assert_rtn("operator()", "RoseAOAtoPDOAMapping.cpp", 50, "azDeg >= fMinAzDeg");
}

void sub_100016F98()
{
  __assert_rtn("operator()", "RoseAOAtoPDOAMapping.cpp", 51, "azDeg <= fMaxAzDeg");
}

void sub_100016FC4()
{
  __assert_rtn("operator()", "RoseAOAtoPDOAMapping.cpp", 52, "elDeg >= fMinElDeg");
}

void sub_100016FF0()
{
  __assert_rtn("operator()", "RoseAOAtoPDOAMapping.cpp", 53, "elDeg <= fMaxElDeg");
}

void sub_10001701C()
{
  __assert_rtn("operator+=", "RoseAOAtoPDOAMapping.cpp", 248, "ch9CalAvailable() && rhs.ch9CalAvailable()");
}

void sub_100017048()
{
  __assert_rtn("operator+=", "RoseAOAtoPDOAMapping.cpp", 247, "checkCalBlobIntegrity() && rhs.checkCalBlobIntegrity() && fChannelAvailabilityMask == rhs.getChannelAvailabilityMask()");
}

void sub_100017074(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#fu,writeHeader failed, file not open.", v1, 2u);
}

void sub_1000170B8()
{
  sub_100011AB8(__stack_chk_guard);
  sub_100011AEC();
  sub_100011B20((void *)&_mh_execute_header, v0, v1, "#fu,writeHeader failed, header copyright size %zu, expected %d", v2, v3);
}

void sub_10001712C()
{
  sub_100011AB8(__stack_chk_guard);
  sub_100011AEC();
  sub_100011B20((void *)&_mh_execute_header, v0, v1, "#fu,writeHeader failed, header typeStr size %zu, expected %d", v2, v3);
}

void sub_1000171A0(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#fu,getHeader,failed,attemptOnInvalidFileHandle", v1, 2u);
}

void sub_1000171E4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100017254(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000172C4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100017334(uint64_t a1, NSObject *a2)
{
  int v2 = 134218240;
  uint64_t v3 = a1;
  __int16 v4 = 1024;
  int v5 = 178;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "#fu,getHeader,failed,fileToSmall,size,%lu,expected,%d", (uint8_t *)&v2, 0x12u);
}

void sub_1000173BC()
{
  sub_100011A7C(__stack_chk_guard);
  sub_100011A94();
  sub_100011AA0((void *)&_mh_execute_header, v0, (uint64_t)v0, "#fu,getHeader,failed,file,%s,notFound", v1);
}

void sub_10001742C()
{
  sub_100011A7C(__stack_chk_guard);
  sub_100011A94();
  sub_100011AA0((void *)&_mh_execute_header, v0, (uint64_t)v0, "#fu,getHeader,failed,file,%s,failedToOpen", v1);
}

void sub_10001749C()
{
  sub_100011A7C(__stack_chk_guard);
  sub_100011A94();
  sub_100011AA0((void *)&_mh_execute_header, v0, (uint64_t)v0, "#fu,getHeader,failed,doesNotExist,%s", v1);
}

void sub_10001750C()
{
  sub_100011A64(__stack_chk_guard);
  sub_100011A94();
  WORD2(v4) = 2080;
  HIWORD(v4) = v0;
  sub_100011B00((void *)&_mh_execute_header, v1, v2, "#fu,calcCrc called from %s,file,%s,cantOpen", v3, v4);
}

void sub_100017590()
{
  sub_100011A64(__stack_chk_guard);
  sub_100011A94();
  sub_100011AA0((void *)&_mh_execute_header, v0, v1, "#fu,isCrcOkay,getHeaderFailed,%s", v2);
}

void sub_1000175FC()
{
  sub_100011A64(__stack_chk_guard);
  sub_100011A94();
  sub_100011AA0((void *)&_mh_execute_header, v0, v1, "#fu,isVersionOkay, couldn't getHeader, file %s", v2);
}

void sub_100017668()
{
  sub_100011A64(__stack_chk_guard);
  sub_100011A94();
  sub_100011AA0((void *)&_mh_execute_header, v0, v1, "#fu,crc check fails for %s", v2);
}

void sub_1000176D4(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 134349312;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2050;
  *(void *)&v3[14] = a2;
  sub_100011B00((void *)&_mh_execute_header, a2, a3, "#fu,expected file size %{public}zu, actual file size %{public}zu", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16]);
}

void sub_10001774C()
{
  __assert_rtn("getNBMaskOOB", "roseSharedTypes.cpp", 1012, "unii5_subbands == 0 || unii5_subbands == 4");
}

void sub_100017778()
{
  __assert_rtn("nbMaskAllowsUNII3", "roseSharedTypes.cpp", 1019, "nb_mask <= 3");
}

void sub_1000177A4()
{
  __assert_rtn("nbMaskAllowsUNII5", "roseSharedTypes.cpp", 1025, "nb_mask <= 3");
}

void sub_1000177D0(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFTypeID CFNumberGetTypeID(void)
{
  return _CFNumberGetTypeID();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t MGGetProductType()
{
  return _MGGetProductType();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t std::stringbuf::str()
{
  return std::stringbuf::str();
}

const std::__fs::filesystem::directory_entry *__cdecl std::__fs::filesystem::directory_iterator::__dereference(const std::__fs::filesystem::directory_iterator *this)
{
  return std::__fs::filesystem::directory_iterator::__dereference(this);
}

std::__fs::filesystem::path::__string_view std::__fs::filesystem::path::__filename(const std::__fs::filesystem::path *this)
{
  std::__fs::filesystem::path::__string_view v3 = std::__fs::filesystem::path::__filename(this);
  std::basic_string_view<_CharT, _Traits>::size_type size = v3.__size_;
  data = v3.__data_;
  result.__size_ = size;
  result.__data_ = data;
  return result;
}

std::string *__cdecl std::locale::name(std::string *__return_ptr retstr, const std::locale *this)
{
  return std::locale::name(retstr, this);
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

{
  return std::logic_error::logic_error(this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return std::runtime_error::runtime_error(this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return std::bad_array_new_length::bad_array_new_length(this);
}

std::regex_error *__cdecl std::regex_error::regex_error(std::regex_error *this, std::regex_constants::error_type __ecode)
{
  return std::regex_error::regex_error(this, __ecode);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return std::string::append(this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return std::string::append(this, __s, __n);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return std::string::assign(this, __s);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s)
{
  return std::string::insert(this, __pos, __s);
}

void std::string::__grow_by(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add)
{
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return std::string::operator=(this, __str);
}

std::string *__cdecl std::string::operator=(std::string *this, std::string::value_type __c)
{
  return std::string::operator=(this, __c);
}

uint64_t std::filebuf::open()
{
  return std::filebuf::open();
}

uint64_t std::filebuf::basic_filebuf()
{
  return std::filebuf::basic_filebuf();
}

uint64_t std::filebuf::~filebuf()
{
  return std::filebuf::~filebuf();
}

uint64_t std::istream::read()
{
  return std::istream::read();
}

uint64_t std::istream::seekg()
{
  return std::istream::seekg();
}

uint64_t std::istream::tellg()
{
  return std::istream::tellg();
}

uint64_t std::istream::~istream()
{
  return std::istream::~istream();
}

uint64_t std::ostream::flush()
{
  return std::ostream::flush();
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

uint64_t std::ostream::operator<<()
{
  return std::ostream::operator<<();
}

{
  return std::ostream::operator<<();
}

uint64_t std::iostream::~basic_iostream()
{
  return std::iostream::~basic_iostream();
}

std::regex_traits<char>::char_class_type std::__get_classname(const char *__s, BOOL __icase)
{
  return std::__get_classname(__s, __icase);
}

uint64_t std::streambuf::basic_streambuf()
{
  return std::streambuf::basic_streambuf();
}

uint64_t std::streambuf::~streambuf()
{
  return std::streambuf::~streambuf();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

std::string *__cdecl std::__get_collation_name(std::string *__return_ptr retstr, const char *__s)
{
  return std::__get_collation_name(retstr, __s);
}

std::__fs::filesystem::directory_iterator *__cdecl std::__fs::filesystem::directory_iterator::__increment(std::__fs::filesystem::directory_iterator *this, std::error_code *__ec)
{
  return std::__fs::filesystem::directory_iterator::__increment(this, __ec);
}

std::__fs::filesystem::directory_iterator *__cdecl std::__fs::filesystem::directory_iterator::directory_iterator(std::__fs::filesystem::directory_iterator *this, const std::__fs::filesystem::path *a2, std::error_code *a3, std::__fs::filesystem::directory_options a4)
{
  return std::__fs::filesystem::directory_iterator::directory_iterator(this, a2, a3, a4);
}

std::__fs::filesystem::file_status std::__fs::filesystem::__status(const std::__fs::filesystem::path *a1, std::error_code *__ec)
{
  return std::__fs::filesystem::__status(a1, __ec);
}

void std::mutex::lock(std::mutex *this)
{
}

void std::mutex::unlock(std::mutex *this)
{
}

void std::mutex::~mutex(std::mutex *this)
{
}

std::locale *__cdecl std::locale::locale(std::locale *this, const std::locale *a2)
{
  return std::locale::locale(this, a2);
}

std::locale *__cdecl std::locale::locale(std::locale *this)
{
  return std::locale::locale(this);
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

void __cxa_guard_abort(__guard *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return ___cxa_guard_acquire((uint64_t *)a1);
}

void __cxa_guard_release(__guard *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

void bzero(void *a1, size_t a2)
{
}

uint64_t container_system_group_path_for_identifier()
{
  return _container_system_group_path_for_identifier();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

int fclose(FILE *a1)
{
  return _fclose(a1);
}

int fflush(FILE *a1)
{
  return _fflush(a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return _fopen(__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fread(__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return _memchr(__s, __c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return _memset(__b, __c, __len);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_log_with_args()
{
  return _os_log_with_args();
}

void os_release(void *object)
{
}

int stat(const char *a1, stat *a2)
{
  return _stat(a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int vfprintf(FILE *a1, const char *a2, va_list a3)
{
  return _vfprintf(a1, a2, a3);
}

int vprintf(const char *a1, va_list a2)
{
  return _vprintf(a1, a2);
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}