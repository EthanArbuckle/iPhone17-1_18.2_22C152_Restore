void sub_10000432C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16, void *a17, void *a18, void *a19, void *a20)
{
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;

  _Unwind_Resume(a1);
}

void sub_1000045E4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    v10 = sub_100005780();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10000F14C((uint64_t)v9, v10);
    }
  }
  if ([v8 count])
  {
    v11 = [objc_alloc((Class)NSDateInterval) initWithStartDate:*(void *)(a1 + 32) endDate:*(void *)(a1 + 40)];
    v12 = sub_100005780();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = [v8 count];
      v14 = [v11 description];
      int v16 = 134349314;
      id v17 = v13;
      __int16 v18 = 2114;
      v19 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Attempting to write %{public}lu breathing disturbance samples for interval of %{public}@ to a file", (uint8_t *)&v16, 0x16u);
    }
    v15 = +[BABreathingDisturbanceAnalyzerFileHandler filePath:*(void *)(a1 + 48) withPrefixFilename:@"queried-samples"];
    +[BABreathingDisturbanceAnalyzerFileHandler writeSamplesToJsonFile:v8 withDateInterval:v11 withOutputFilePath:v15];
  }
  else
  {
    v11 = sub_100005780();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "No breathing disturbance samples returned", (uint8_t *)&v16, 2u);
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
}

void sub_1000047D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100005280(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, id *a11, void *a12, void *a13, uint64_t a14, void *a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *__p,uint64_t a27)
{
  if (__p) {
    operator delete(__p);
  }
  sub_1000055F4(a11);

  _Unwind_Resume(a1);
}

void sub_100005504(void **a1, unint64_t a2)
{
  v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (0xAAAAAAAAAAAAAAABLL * ((v4 - (unsigned char *)*a1) >> 3) < a2)
  {
    if (a2 >= 0xAAAAAAAAAAAAAABLL) {
      sub_100005628();
    }
    uint64_t v5 = ((unsigned char *)a1[1] - (unsigned char *)*a1) / 24;
    v6 = (char *)sub_1000056D0(v3, a2);
    id v7 = &v6[24 * v5];
    id v9 = &v6[24 * v8];
    v11 = (char *)*a1;
    v10 = (char *)a1[1];
    v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        long long v13 = *(_OWORD *)(v10 - 24);
        *((void *)v12 - 1) = *((void *)v10 - 1);
        *(_OWORD *)(v12 - 24) = v13;
        v12 -= 24;
        v10 -= 24;
      }
      while (v10 != v11);
      v10 = (char *)*a1;
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

id *sub_1000055F4(id *a1)
{
  return a1;
}

void sub_100005628()
{
}

void sub_100005640(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_10000569C(exception, a1);
}

void sub_100005688(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_10000569C(std::logic_error *a1, const char *a2)
{
  result = std::logic_error::logic_error(a1, a2);
  return result;
}

void *sub_1000056D0(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    sub_100005718();
  }
  return operator new(24 * a2);
}

void sub_100005718()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

void sub_10000574C(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_fault_impl(a1, log, OS_LOG_TYPE_FAULT, a4, a5, 0xCu);
}

uint64_t sub_100005768(uint64_t result, uint64_t a2, float a3)
{
  *(float *)a2 = a3;
  *(void *)(a2 + 4) = result;
  return result;
}

id sub_100005780()
{
  if (qword_100018488 != -1) {
    dispatch_once(&qword_100018488, &stru_1000144F0);
  }
  v0 = (void *)qword_100018490;
  return v0;
}

void sub_1000057D4(id a1)
{
  qword_100018490 = (uint64_t)os_log_create("com.apple.BreathingAlgorithms", "breathing_disturbance_analyzer_diagnostic");
  _objc_release_x1();
}

void sub_100005988(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100005A28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100006020(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t *a41)
{
  sub_100006448(&a41);

  _Unwind_Resume(a1);
}

uint64_t *sub_1000062A0(unsigned __int8 *a1, char *__s)
{
  int v4 = *a1;
  if (!*a1)
  {
    *a1 = 1;
    uint64_t v5 = operator new(0x18uLL);
    v5[2] = 0;
    v5[1] = 0;
    *uint64_t v5 = v5 + 1;
    *((void *)a1 + 1) = v5;
    sub_10000AB94((uint64_t)a1);
    int v4 = *a1;
  }
  if (v4 != 1)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    v10 = (char *)sub_10000B74C((char *)a1);
    sub_100009DD8(&v11, v10);
    sub_100009B98("cannot use operator[] with a string argument with ", &v11, &__p);
    sub_1000099F4(305, (uint64_t)&__p, exception);
  }
  v6 = (uint64_t **)*((void *)a1 + 1);
  sub_100009DD8(&__p, __s);
  v11.__r_.__value_.__r.__words[0] = (std::string::size_type)&__p;
  id v7 = sub_10000B774(v6, (void **)&__p.__r_.__value_.__l.__data_, (uint64_t)&std::piecewise_construct, &v11);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  return v7 + 7;
}

void sub_1000063D0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t **sub_100006448(uint64_t **a1)
{
  return a1;
}

uint64_t sub_10000647C(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)a1)
  {
    if (*(unsigned char *)a1 != 2)
    {
      exception = __cxa_allocate_exception(0x20uLL);
      uint64_t v8 = (char *)sub_10000B74C((char *)a1);
      sub_100009DD8(&v9, v8);
      sub_100009B98("cannot use push_back() with ", &v9, &v10);
      sub_1000099F4(308, (uint64_t)&v10, exception);
    }
  }
  else
  {
    *(unsigned char *)a1 = 2;
    int v4 = operator new(0x18uLL);
    v4[1] = 0;
    v4[2] = 0;
    void *v4 = 0;
    *(void *)(a1 + 8) = v4;
    sub_10000AB94(a1);
  }
  uint64_t v5 = *(uint64_t **)(a1 + 8);
  return sub_10000CF60(v5, a2);
}

void sub_100006570(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0) {
    operator delete(__p);
  }
  if (a14 < 0)
  {
    operator delete(a9);
    if ((v21 & 1) == 0) {
LABEL_8:
    }
      _Unwind_Resume(a1);
  }
  else if (!v21)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v20);
  goto LABEL_8;
}

void sub_1000065D0(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = sub_100005780();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&buf[4] = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "writing to %{public}@", buf, 0xCu);
  }

  id v5 = v3;
  [v5 UTF8String];
  sub_100007238((void (__cdecl ***)(std::ofstream *__hidden))buf);
  *(void *)&buf[*(void *)(*(void *)buf - 24) + 24] = 4;
  v6 = sub_1000073F8((uint64_t *)buf, a1);
  char v7 = 10;
  sub_1000076EC(v6, (uint64_t)&v7, 1);
  if (!std::filebuf::close()) {
    std::ios_base::clear((std::ios_base *)&buf[*(void *)(*(void *)buf - 24)], *(_DWORD *)&buf[*(void *)(*(void *)buf - 24) + 32] | 4);
  }
  std::filebuf::~filebuf();
  std::ostream::~ostream();
  std::ios::~ios();
}

void sub_1000067DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100007110(_Unwind_Exception *a1)
{
  sub_100006448((uint64_t **)(v3 - 80));

  sub_1000055F4(v1);
  _Unwind_Resume(a1);
}

void (__cdecl ***sub_100007238(void (__cdecl ***a1)(std::ofstream *__hidden this)))(std::ofstream *__hidden this)
{
  *a1 = v3;
  *(void *)((char *)*(v3 - 3) + (void)a1) = v2;
  int v4 = (std::ios_base *)((char *)*(*a1 - 3) + (void)a1);
  std::ios_base::init(v4, a1 + 1);
  v4[1].__vftable = 0;
  v4[1].__fmtflags_ = -1;
  std::filebuf::basic_filebuf();
  if (!std::filebuf::open()) {
    std::ios_base::clear((std::ios_base *)((char *)*(*a1 - 3) + (void)a1), *(_DWORD *)((char *)*(*a1 - 3) + (void)a1 + 32) | 4);
  }
  return a1;
}

void sub_1000073C0(_Unwind_Exception *a1)
{
}

uint64_t *sub_1000073F8(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  id v5 = (char *)a1 + *(void *)(*a1 - 24);
  uint64_t v6 = *((void *)v5 + 3);
  *((void *)v5 + 3) = 0;
  char v7 = (std::__shared_weak_count *)operator new(0x28uLL);
  v7->__shared_owners_ = 0;
  v7->__vftable = (std::__shared_weak_count_vtbl *)off_100014520;
  v7->__shared_weak_owners_ = 0;
  v7[1].__vftable = (std::__shared_weak_count_vtbl *)off_100014570;
  v7[1].__shared_owners_ = (uint64_t)a1;
  v12 = v7 + 1;
  long long v13 = v7;
  atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  uint64_t v8 = (const std::ios_base *)((char *)a1 + *(void *)(v4 - 24));
  std::ios_base::fmtflags fmtflags = v8[1].__fmtflags_;
  if (fmtflags == -1)
  {
    std::ios_base::getloc(v8);
    std::string v10 = std::locale::use_facet(&v14, &std::ctype<char>::id);
    std::ios_base::fmtflags fmtflags = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
    std::locale::~locale(&v14);
    v8[1].__fmtflags_ = fmtflags;
  }
  sub_100008C7C((uint64_t)v15, (uint64_t)&v12, (char)fmtflags, 0);
  if (v13) {
    sub_100008C08(v13);
  }
  sub_100008C08(v7);
  sub_100007AF0(v15, a2, v6 > 0, 0, v6 & ~(v6 >> 63), 0);
  sub_10000AB54((uint64_t)v15);
  return a1;
}

void sub_1000075DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::locale a11, char a12)
{
  std::locale::~locale(&a11);
  sub_100008C08(v12);
  sub_100008C08(v12);
  _Unwind_Resume(a1);
}

void *sub_100007620(void *a1)
{
  std::filebuf::~filebuf();
  std::ostream::~ostream();
  std::ios::~ios();
  return a1;
}

void *sub_1000076EC(void *a1, uint64_t a2, uint64_t a3)
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
      std::string v10 = std::locale::use_facet(&v14, &std::ctype<char>::id);
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
    if (!sub_100007890(v7, a2, v11, a2 + a3, v6, (char)v9)) {
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | 5);
    }
  }
  std::ostream::sentry::~sentry();
  return a1;
}

void sub_100007828(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  std::ostream::sentry::~sentry();
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(void *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x100007808);
}

void sub_10000787C(_Unwind_Exception *a1)
{
}

uint64_t sub_100007890(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
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
      sub_100007A2C(__p, v12, __c);
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

void sub_1000079FC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_100007A18(void *a1)
{
}

void *sub_100007A2C(void *__b, size_t __len, int __c)
{
  if (__len >= 0x7FFFFFFFFFFFFFF8) {
    sub_100007AD8();
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

void sub_100007AD8()
{
}

uint64_t sub_100007AF0(void ***a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6)
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
        uint64_t v14 = a1 + 76;
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
            int v16 = *(void **)(a2 + 8);
            id v17 = (void *)*v16;
            if (v16[2] == 1)
            {
              char v18 = (void *)*v16;
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
                sub_100008DC4((uint64_t)a1, v17 + 4, a4);
                ((void (*)(void, const char *, uint64_t))(**a1)[1])(*a1, "\": ", 3);
                sub_100007AF0(a1, v17 + 7, 1, a4, a5, (a6 + a5));
                ((void (*)(void, const char *, uint64_t))(**a1)[1])(*a1, ",\n", 2);
                v69 = (void *)v17[1];
                if (v69)
                {
                  do
                  {
                    char v18 = v69;
                    v69 = (void *)*v69;
                  }
                  while (v69);
                }
                else
                {
                  do
                  {
                    char v18 = (void *)v17[2];
                    BOOL v51 = *v18 == (void)v17;
                    id v17 = v18;
                  }
                  while (!v51);
                }
                ++v67;
                int v16 = *(void **)(a2 + 8);
                id v17 = v18;
              }
              while (v67 < v16[2] - 1);
            }
            v70 = v16 + 1;
            if (v18 == v70) {
              sub_10000F47C();
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
              sub_10000F4A8();
            }
            v75 = a1 + 76;
            if (*((char *)a1 + 631) < 0) {
              v75 = (void ***)*v14;
            }
            ((void (*)(void, void ***, void))(**a1)[1])(*a1, v75, (a6 + a5));
            ((void (*)(void))***a1)();
            sub_100008DC4((uint64_t)a1, v18 + 4, a4);
            ((void (*)(void, const char *, uint64_t))(**a1)[1])(*a1, "\": ", 3);
            sub_100007AF0(a1, v18 + 7, 1, a4, a5, (a6 + a5));
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
          sub_100008DC4((uint64_t)a1, v47 + 4, a4);
          ((void (*)(void, const char *, uint64_t))(**a1)[1])(*a1, "\":", 2);
          sub_100007AF0(a1, v47 + 7, 0, a4, a5, a6);
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
        sub_10000F4D4();
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
        sub_10000F500();
      }
      ((void (*)(void, uint64_t))***a1)(*a1, 34);
      sub_100008DC4((uint64_t)a1, v47 + 4, a4);
      ((void (*)(void, const char *, uint64_t))(**a1)[1])(*a1, "\":", 2);
      sub_100007AF0(a1, v47 + 7, 0, a4, a5, a6);
LABEL_122:
      uint64_t v11 = (uint64_t (*)(void))***a1;
LABEL_123:
      return v11();
    case 2:
      v19 = (void (**)(void))**a1;
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
              sub_100007AF0(a1, v58, 0, a4, a5, a6);
              ((void (*)(void))***a1)();
              v58 += 16;
              v59 = *(uint64_t **)(a2 + 8);
              uint64_t v56 = v59[1];
            }
            while (v58 != v56 - 16);
            uint64_t v57 = *v59;
          }
          if (v57 == v56) {
            sub_10000F558();
          }
          sub_100007AF0(a1, v58, 0, a4, a5, a6);
          goto LABEL_108;
        }
        v19[1]();
        unsigned int v20 = a6 + a5;
        int v21 = a1 + 76;
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
            v23 = *(uint64_t **)(a2 + 8);
            uint64_t v25 = *v23;
            uint64_t v24 = v23[1];
            if (v25 != v24 - 16)
            {
              do
              {
                v26 = a1 + 76;
                if (*((char *)a1 + 631) < 0) {
                  v26 = (void ***)*v21;
                }
                ((void (*)(void, void ***, void))(**a1)[1])(*a1, v26, (a6 + a5));
                sub_100007AF0(a1, v25, 1, a4, a5, (a6 + a5));
                ((void (*)(void, const char *, uint64_t))(**a1)[1])(*a1, ",\n", 2);
                v25 += 16;
                v27 = *(uint64_t **)(a2 + 8);
                uint64_t v24 = v27[1];
              }
              while (v25 != v24 - 16);
              uint64_t v25 = *v27;
            }
            if (v25 == v24) {
              sub_10000F52C();
            }
            v28 = a1 + 76;
            if (*((char *)a1 + 631) < 0) {
              v28 = (void ***)*v21;
            }
            ((void (*)(void, void ***, void))(**a1)[1])(*a1, v28, (a6 + a5));
            sub_100007AF0(a1, *(void *)(*(void *)(a2 + 8) + 8) - 16, 1, a4, a5, (a6 + a5));
            ((void (*)(void))***a1)();
            if (*((char *)a1 + 631) < 0) {
              int v21 = (void *)*v21;
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
      sub_100008DC4((uint64_t)a1, *(uint64_t **)(a2 + 8), a4);
      uint64_t v11 = (uint64_t (*)(void))***a1;
      goto LABEL_123;
    case 4:
      uint64_t v11 = (uint64_t (*)(void))(**a1)[1];
      goto LABEL_83;
    case 5:
      unint64_t v29 = *(void *)(a2 + 8);
      return sub_1000094F4((uint64_t (****)(void))a1, v29);
    case 6:
      unint64_t v31 = *(void *)(a2 + 8);
      return sub_100009724((uint64_t (****)(void))a1, v31);
    case 7:
      double v32 = *(double *)(a2 + 8);
      return sub_1000098B4((char *)a1, v32);
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
                sub_100009418((uint64_t)a1, v63);
                ((void (*)(void, const char *, uint64_t))(**a1)[1])(*a1, ", ", 2);
              }
              while (v62 != (unsigned __int8 *)(*(void *)(*(void *)(a2 + 8) + 8) - 1));
            }
            sub_100009418((uint64_t)a1, *v62);
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
            sub_100009418((uint64_t)a1, *(unsigned __int8 *)(v65 + 24));
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
          sub_100009418((uint64_t)a1, v42);
          ((void (*)(void, uint64_t))***a1)(*a1, 44);
          v40 = *(unsigned __int8 **)(*(void *)(a2 + 8) + 8);
        }
        sub_100009418((uint64_t)a1, *v41);
      }
      ((void (*)(void, const char *, uint64_t))(**a1)[1])(*a1, "],\"subtype\":", 12);
      uint64_t v43 = *(void *)(a2 + 8);
      if (*(unsigned char *)(v43 + 25))
      {
        sub_100009418((uint64_t)a1, *(unsigned __int8 *)(v43 + 24));
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
      sub_10000F450();
  }
}

void sub_100008B44(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_100014520;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_100008B64(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)off_100014520;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete();
}

uint64_t sub_100008BB8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 24) + 16))();
}

uint64_t sub_100008BE0(uint64_t a1)
{
  return std::ostream::put(*(void *)(a1 + 8));
}

uint64_t sub_100008BE8(uint64_t a1)
{
  return std::ostream::write(*(void *)(a1 + 8));
}

void sub_100008BF4()
{
}

void sub_100008C08(std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

uint64_t sub_100008C7C(uint64_t a1, uint64_t a2, unsigned int a3, int a4)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  size_t v7 = localeconv();
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
  std::string v10 = (int8x16_t *)operator new(0x208uLL);
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

void sub_100008DAC(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(std::__shared_weak_count **)(v1 + 8);
  if (v3) {
    sub_100008C08(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_100008DC4(uint64_t result, uint64_t *a2, int a3)
{
  char v42 = 0;
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
  v43[0] = 0;
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
    result = sub_100009964(&v42, v43, v14);
    if (result == 1)
    {
      int v16 = *((_DWORD *)v7 + 158);
      if ((v16 - 1) >= 2)
      {
        if (!v16)
        {
          char v41 = 3;
          *(_DWORD *)__str = 0;
          snprintf(__str, 3uLL, "%.2X", v14);
          exception = __cxa_allocate_exception(0x20uLL);
          std::to_string(&v34, v8);
          sub_100009B98("invalid UTF-8 byte at index ", &v34, &v35);
          sub_100009B38(": 0x", &v35, &v36);
          if (v41 >= 0) {
            v28 = __str;
          }
          else {
            v28 = *(char **)__str;
          }
          if (v41 >= 0) {
            std::string::size_type v29 = v41;
          }
          else {
            std::string::size_type v29 = v40;
          }
          v30 = std::string::append(&v36, v28, v29);
          long long v31 = *(_OWORD *)&v30->__r_.__value_.__l.__data_;
          std::string::size_type v38 = v30->__r_.__value_.__r.__words[2];
          long long v37 = v31;
          v30->__r_.__value_.__l.__size_ = 0;
          v30->__r_.__value_.__r.__words[2] = 0;
          v30->__r_.__value_.__r.__words[0] = 0;
          sub_1000099F4(316, (uint64_t)&v37, exception);
        }
        sub_10000F5B0();
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
          result = (*(uint64_t (**)(void, uint64_t, uint64_t))(*(void *)*v7 + 8))(*v7, v12, v10);
          uint64_t v10 = 0;
        }
      }
      uint64_t v9 = 0;
      v8 -= v17;
      char v42 = 0;
      uint64_t v11 = v10;
    }
    else if (result)
    {
      if ((a3 & 1) == 0)
      {
        if (*((char *)a2 + 23) >= 0) {
          v19 = a2;
        }
        else {
          v19 = (uint64_t *)*a2;
        }
        *(unsigned char *)(v12 + v11++) = *((unsigned char *)v19 + v8);
      }
      ++v9;
    }
    else
    {
      switch(v43[0])
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
          if (v43[0] == 34)
          {
            __int16 v15 = 8796;
            goto LABEL_43;
          }
          if (v43[0] == 92)
          {
            __int16 v15 = 23644;
LABEL_43:
            *(_WORD *)(v12 + v11) = v15;
            v11 += 2;
            goto LABEL_44;
          }
LABEL_29:
          if (v43[0] > 0x7E) {
            int v20 = a3;
          }
          else {
            int v20 = 0;
          }
          if (v43[0] < 0x20 || v20)
          {
            uint64_t v24 = (char *)(v12 + v11);
            if (HIWORD(v43[0]))
            {
              result = snprintf(v24, 0xDuLL, "\\u%04x\\u%04x", (unsigned __int16)((v43[0] >> 10) - 10304), v43[0] & 0x3FF | 0xDC00);
              v11 += 12;
            }
            else
            {
              result = snprintf(v24, 7uLL, "\\u%04x", v43[0]);
              v11 += 6;
            }
          }
          else
          {
            if (*((char *)a2 + 23) >= 0) {
              int v21 = a2;
            }
            else {
              int v21 = (uint64_t *)*a2;
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
            result = (*(uint64_t (**)(void, uint64_t, uint64_t))(*(void *)*v7 + 8))(*v7, v12, v11);
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
  if (v42)
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
        char v41 = 3;
        *(_DWORD *)__str = 0;
        double v32 = (uint64_t *)*a2;
        if (v22 >= 0) {
          double v32 = a2;
        }
        snprintf(__str, 3uLL, "%.2X", *((unsigned __int8 *)v32 + v23 - 1));
        v33 = __cxa_allocate_exception(0x20uLL);
        std::operator+<char>();
        sub_1000099F4(316, (uint64_t)&v37, v33);
      default:
        sub_10000F584();
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

void sub_100009340(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25,void *a26,uint64_t a27,int a28,__int16 a29,char a30,char a31,void *__p,uint64_t a33,int a34,__int16 a35,char a36,char a37)
{
  if (a37 < 0)
  {
    operator delete(__p);
    if ((v38 & 1) == 0)
    {
LABEL_6:
      if (*(char *)(v39 - 97) < 0) {
        operator delete(*(void **)(v39 - 120));
      }
      _Unwind_Resume(a1);
    }
  }
  else if (!v38)
  {
    goto LABEL_6;
  }
  __cxa_free_exception(v37);
  goto LABEL_6;
}

uint64_t sub_100009418(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return (***(uint64_t (****)(void, uint64_t))a1)(*(void *)a1, 48);
  }
  LOBYTE(v2) = a2;
  if (a2 >= 0xA)
  {
    if (a2 >= 0x64)
    {
      *(_WORD *)(a1 + 17) = word_100010E10[(a2 - 100 * ((41 * a2) >> 12))];
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
  *(_WORD *)(v5 - 2) = word_100010E10[a2];
  return (*(uint64_t (**)(void))(**(void **)a1 + 8))();
}

uint64_t sub_1000094F4(uint64_t (****a1)(void), unint64_t a2)
{
  if (a2)
  {
    unint64_t v2 = a2;
    uint64_t v3 = a1 + 2;
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
      sub_10000F5DC();
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
        *((_WORD *)v4 - 1) = word_100010ED8[v2 % 0x64];
        v4 -= 2;
        unint64_t v13 = v2 >> 4;
        v2 /= 0x64uLL;
      }
      while (v13 > 0x270);
    }
    if (v12 >= 0xA)
    {
      *((_WORD *)v4 - 1) = word_100010ED8[v12];
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

uint64_t sub_100009724(uint64_t (****a1)(void), unint64_t a2)
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
        sub_10000F5DC();
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
          *(_WORD *)(v3 - 2) = word_100010FA0[v2 % 0x64];
          v3 -= 2;
          unint64_t v10 = v2 >> 4;
          v2 /= 0x64uLL;
        }
        while (v10 > 0x270);
      }
      if (v9 >= 0xA)
      {
        *(_WORD *)(v3 - 2) = word_100010FA0[v9];
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

uint64_t sub_1000098B4(char *a1, double a2)
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
    uint64_t v3 = sub_10000A01C(a1 + 16, (uint64_t)(a1 + 80), a2) - (a1 + 16);
    uint64_t v4 = *(uint64_t (**)(uint64_t, const char *, uint64_t))(**(void **)a1 + 8);
    uint64_t v5 = *(void *)a1;
    unsigned int v6 = a1 + 16;
  }
  return v4(v5, v6, v3);
}

uint64_t sub_100009964(unsigned char *a1, unsigned int *a2, int a3)
{
  unsigned int v3 = byte_100010C80[a3];
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
  uint64_t v6 = byte_100010C80[v5];
  *a1 = v6;
  return v6;
}

void sub_1000099F4(int a1@<W0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  sub_100009DD8(&__p, "type_error");
  sub_100009C4C(a1, &v14);
  int v6 = *(char *)(a2 + 23);
  if (v6 >= 0) {
    unint64_t v7 = (const std::string::value_type *)a2;
  }
  else {
    unint64_t v7 = *(const std::string::value_type **)a2;
  }
  if (v6 >= 0) {
    std::string::size_type v8 = *(unsigned __int8 *)(a2 + 23);
  }
  else {
    std::string::size_type v8 = *(void *)(a2 + 8);
  }
  unint64_t v9 = std::string::append(&v14, v7, v8);
  long long v10 = *(_OWORD *)&v9->__r_.__value_.__l.__data_;
  int64_t v16 = v9->__r_.__value_.__r.__words[2];
  *(_OWORD *)__int16 v15 = v10;
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
    unint64_t v11 = (char *)v15;
  }
  else {
    unint64_t v11 = (char *)v15[0];
  }
  sub_100009E8C((uint64_t)a3, a1, v11);
  *a3 = off_1000145F8;
  if (SHIBYTE(v16) < 0) {
    operator delete(v15[0]);
  }
}

void sub_100009AF0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  if (a26 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

__n128 sub_100009B38@<Q0>(char *__s@<X1>, std::string *a2@<X0>, std::string *a3@<X8>)
{
  std::string::size_type v6 = strlen(__s);
  unint64_t v7 = (__n128 *)std::string::append(a2, __s, v6);
  __n128 result = *v7;
  *a3 = *(std::string *)v7->n128_u8;
  v7->n128_u64[0] = 0;
  v7->n128_u64[1] = 0;
  v7[1].n128_u64[0] = 0;
  return result;
}

__n128 sub_100009B98@<Q0>(const char *a1@<X0>, std::string *a2@<X1>, std::string *a3@<X8>)
{
  std::string::size_type v6 = strlen(a1);
  unint64_t v7 = (__n128 *)std::string::insert(a2, 0, a1, v6);
  __n128 result = *v7;
  *a3 = *(std::string *)v7->n128_u8;
  v7->n128_u64[0] = 0;
  v7->n128_u64[1] = 0;
  v7[1].n128_u64[0] = 0;
  return result;
}

void sub_100009BF8(std::runtime_error *a1)
{
  a1->__vftable = (std::runtime_error_vtbl *)off_100014620;
  std::runtime_error::~runtime_error(a1 + 1);
  std::exception::~exception(a1);
}

void sub_100009C4C(int a1@<W1>, std::string *a2@<X8>)
{
  std::operator+<char>();
  unsigned int v4 = std::string::append(&v12, ".", 1uLL);
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
  std::string::size_type v8 = std::string::append(&v13, (const std::string::value_type *)p_p, size);
  long long v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
  v14.__r_.__value_.__r.__words[2] = v8->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v14.__r_.__value_.__l.__data_ = v9;
  v8->__r_.__value_.__l.__size_ = 0;
  v8->__r_.__value_.__r.__words[2] = 0;
  v8->__r_.__value_.__r.__words[0] = 0;
  long long v10 = std::string::append(&v14, "] ", 2uLL);
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

void sub_100009D74(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26)
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

void *sub_100009DD8(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    sub_100007AD8();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    std::string::size_type v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    std::string::size_type v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

uint64_t sub_100009E8C(uint64_t a1, int a2, char *a3)
{
  *(void *)a1 = off_100014620;
  *(_DWORD *)(a1 + 8) = a2;
  std::runtime_error::runtime_error((std::runtime_error *)(a1 + 16), a3);
  return a1;
}

void sub_100009EDC(_Unwind_Exception *a1)
{
  std::exception::~exception(v1);
  _Unwind_Resume(a1);
}

void sub_100009EF0(std::runtime_error *a1)
{
  a1->__vftable = (std::runtime_error_vtbl *)off_100014620;
  std::runtime_error::~runtime_error(a1 + 1);
  std::exception::~exception(a1);
  operator delete();
}

const char *sub_100009F58(const std::runtime_error *a1)
{
  return std::runtime_error::what(a1 + 1);
}

void sub_100009F60(std::runtime_error *a1)
{
  a1->__vftable = (std::runtime_error_vtbl *)off_100014620;
  std::runtime_error::~runtime_error(a1 + 1);
  std::exception::~exception(a1);
}

void sub_100009FB4(std::runtime_error *a1)
{
  a1->__vftable = (std::runtime_error_vtbl *)off_100014620;
  std::runtime_error::~runtime_error(a1 + 1);
  std::exception::~exception(a1);
  operator delete();
}

char *sub_10000A01C(char *a1, uint64_t a2, double a3)
{
  if ((*(void *)&a3 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000) {
    sub_10000F6B8();
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
    __n128 result = v3 + 3;
    v3[2] = 48;
  }
  else
  {
    unint64_t v5 = a2 - (void)v3;
    if (a2 - (uint64_t)v3 <= 16) {
      sub_10000F608();
    }
    uint64_t v6 = 0;
    sub_10000A0F0((uint64_t)v3, (int *)&v6 + 1, &v6, a3);
    if (SHIDWORD(v6) >= 18) {
      sub_10000F634();
    }
    if (v5 <= 0x15) {
      sub_10000F660();
    }
    if (v5 == 22) {
      sub_10000F68C();
    }
    return sub_10000A174(v3, SHIDWORD(v6), v6, -4, 15);
  }
  return result;
}

uint64_t sub_10000A0F0(uint64_t a1, int *a2, _DWORD *a3, double a4)
{
  if ((*(void *)&a4 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000) {
    sub_10000F710();
  }
  if (a4 <= 0.0) {
    sub_10000F6E4();
  }
  sub_10000A3A4((uint64_t)v9, a4);
  return sub_10000A4CC(a1, a2, a3, v9[2], v9[3], v9[0], v9[1], v7, v9[4], v9[5]);
}

char *sub_10000A174(char *__src, int a2, int a3, int a4, int a5)
{
  if ((a4 & 0x80000000) == 0) {
    sub_10000F73C();
  }
  if (a5 <= 0) {
    sub_10000F768();
  }
  uint64_t v7 = a3 + (uint64_t)a2;
  if ((a3 & 0x80000000) == 0 && (int)v7 <= a5)
  {
    memset(&__src[a2], 48, a3);
    __src[v7] = 46;
    __n128 result = &__src[v7 + 2];
    __src[(int)v7 + 1] = 48;
    return result;
  }
  if ((int)v7 < 1 || (int)v7 > a5)
  {
    if ((int)v7 > a4 && (int)v7 <= 0)
    {
      size_t v10 = -(int)v7;
      memmove(&__src[v10 + 2], __src, a2);
      *(_WORD *)__src = 11824;
      memset(__src + 2, 48, v10);
      return &__src[v10 + 2 + a2];
    }
    if (a2 == 1)
    {
      uint64_t v11 = 1;
    }
    else
    {
      memmove(__src + 2, __src + 1, a2 - 1);
      __src[1] = 46;
      uint64_t v11 = a2 + 1;
    }
    std::string v12 = &__src[v11];
    char *v12 = 101;
    if ((int)v7 <= -999) {
      sub_10000F794();
    }
    if ((int)v7 >= 1001) {
      sub_10000F7C0();
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
    sub_10000F7EC();
  }
  long long v9 = &__src[v7];
  memmove(v9 + 1, v9, a2 - (unint64_t)v7);
  *long long v9 = 46;
  return &__src[a2 + 1];
}

uint64_t sub_10000A3A4@<X0>(uint64_t a1@<X8>, double a2@<D0>)
{
  if ((*(void *)&a2 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000) {
    sub_10000F844();
  }
  if (a2 <= 0.0) {
    sub_10000F818();
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
  uint64_t v16 = sub_10000A5B8(v6 | 1, v13);
  int v18 = v17;
  unint64_t v19 = sub_10000A610(&v24, v17);
  int v21 = v20;
  uint64_t result = sub_10000A5B8(v15, v14);
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v23;
  *(void *)(a1 + 16) = v19;
  *(_DWORD *)(a1 + 24) = v21;
  *(void *)(a1 + 32) = v16;
  *(_DWORD *)(a1 + 40) = v18;
  return result;
}

uint64_t sub_10000A4CC(uint64_t a1, int *a2, _DWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  v31[0] = a4;
  v31[1] = a5;
  v30[0] = a6;
  v30[1] = a7;
  v29[0] = a9;
  v29[1] = a10;
  if (a10 != a5) {
    sub_10000F89C();
  }
  if (a10 != a7) {
    sub_10000F870();
  }
  uint64_t v13 = sub_10000A680(a10);
  int v15 = v14;
  uint64_t v27 = v13;
  int v28 = v16;
  unint64_t v17 = sub_10000A738(v30, &v27);
  uint64_t v19 = v18;
  unint64_t v20 = sub_10000A738(v31, &v27);
  unsigned int v22 = v21;
  unint64_t v23 = sub_10000A738(v29, &v27);
  *a3 = -v15;
  return sub_10000A798(a1, a2, a3, v20 + 1, v22, v17, v19, v25, v23 - 1, v24);
}

uint64_t sub_10000A5B8(uint64_t result, unint64_t a2)
{
  if (!result) {
    __assert_rtn("normalize", "to_chars.hpp", 143, "x.f != 0");
  }
  for (; (result & 0x8000000000000000) == 0; a2 = (a2 - 1) | a2 & 0xFFFFFFFF00000000)
    result *= 2;
  return result;
}

unint64_t sub_10000A610(uint64_t *a1, int a2)
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

uint64_t sub_10000A680(int a1)
{
  if (a1 <= -1501) {
    sub_10000F8C8();
  }
  if (a1 >= 1501) {
    sub_10000F8F4();
  }
  int v1 = 78913 * (-61 - a1) / 0x40000;
  if (a1 < -61) {
    ++v1;
  }
  if (v1 <= -315) {
    sub_10000F920();
  }
  unsigned int v2 = (int)((v1 + 307 + (((__int16)(v1 + 307) >> 28) & 7)) << 16) >> 19;
  if (v2 >= 0x4F) {
    sub_10000F9A4();
  }
  uint64_t v3 = (void *)((char *)&unk_100011068 + 16 * (unsigned __int16)v2);
  int v4 = v3[1] + a1;
  if (v4 <= -125) {
    sub_10000F94C();
  }
  if (v4 >= -95) {
    sub_10000F978();
  }
  return *v3;
}

unint64_t sub_10000A738(void *a1, void *a2)
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

uint64_t sub_10000A798(uint64_t a1, int *a2, _DWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unint64_t a9, uint64_t a10)
{
  v47[0] = a4;
  v47[1] = a5;
  v46[0] = a6;
  v46[1] = a7;
  unint64_t v44 = a9;
  uint64_t v45 = a10;
  if ((int)a10 <= -61) {
    sub_10000F9D0();
  }
  if ((int)a10 >= -31) {
    sub_10000F9FC();
  }
  unint64_t v13 = sub_10000AA34((uint64_t)&v44, (uint64_t)v47);
  uint64_t v14 = sub_10000AA34((uint64_t)&v44, (uint64_t)v46);
  int v15 = -(int)v45;
  unint64_t v16 = v44 >> -(char)v45;
  if (!v16) {
    sub_10000FA28();
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
      sub_10000FA54();
    }
    unint64_t v16 = v16 % v21;
    uint64_t v35 = *a2;
    *a2 = v35 + 1;
    *(unsigned char *)(a1 + v35) = v34 + 48;
    if ((v16 << v15) + v20 <= v13)
    {
      *a3 = *a3 + v33 - 2;
      unint64_t v18 = (unint64_t)v21 << v15;
      int v40 = *a2;
      uint64_t v41 = a1;
      unint64_t v42 = v13;
      v20 += v16 << v15;
      return sub_10000AAA4(v41, v40, v17, v42, v20, v18);
    }
    v21 /= 0xAu;
    --v33;
  }
  while (v33 > 1);
  if (v20 <= v13) {
    sub_10000FAD8();
  }
  int v36 = 0;
  do
  {
    if (v20 >= 0x199999999999999ALL) {
      sub_10000FA80();
    }
    unint64_t v37 = (10 * v20) >> v15;
    if (v37 >= 0xA) {
      sub_10000FAAC();
    }
    uint64_t v38 = *a2;
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
  int v40 = *a2;
  uint64_t v41 = a1;
  unint64_t v42 = v13;
  return sub_10000AAA4(v41, v40, v17, v42, v20, v18);
}

uint64_t sub_10000AA34(uint64_t a1, uint64_t a2)
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

uint64_t sub_10000AAA4(uint64_t result, int a2, unint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6)
{
  if (a2 <= 0) {
    sub_10000FB04();
  }
  if (a3 > a4) {
    sub_10000FB30();
  }
  if (a4 < a5) {
    sub_10000FB5C();
  }
  if (!a6) {
    sub_10000FB88();
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
      int v9 = *(unsigned __int8 *)(result + v6);
      if (v9 == 48) {
        sub_10000FBB4();
      }
      *(unsigned char *)(result + v6) = v9 - 1;
      if (v8 >= a3) {
        break;
      }
      unint64_t v10 = a4 - a6 + v7;
      v7 -= a6;
      v8 += a6;
    }
    while (v10 >= a6);
  }
  return result;
}

uint64_t sub_10000AB54(uint64_t a1)
{
  if (*(char *)(a1 + 631) < 0) {
    operator delete(*(void **)(a1 + 608));
  }
  BOOL v2 = *(std::__shared_weak_count **)(a1 + 8);
  if (v2) {
    sub_100008C08(v2);
  }
  return a1;
}

uint64_t sub_10000AB94(uint64_t result)
{
  switch(*(unsigned char *)result)
  {
    case 1:
      if (*(void *)(result + 8)) {
        return result;
      }
      int v1 = "m_type != value_t::object or m_value.object != nullptr";
      int v2 = 1220;
      break;
    case 2:
      if (*(void *)(result + 8)) {
        return result;
      }
      int v1 = "m_type != value_t::array or m_value.array != nullptr";
      int v2 = 1221;
      break;
    case 3:
      if (*(void *)(result + 8)) {
        return result;
      }
      int v1 = "m_type != value_t::string or m_value.string != nullptr";
      int v2 = 1222;
      break;
    case 8:
      if (*(void *)(result + 8)) {
        return result;
      }
      int v1 = "m_type != value_t::binary or m_value.binary != nullptr";
      int v2 = 1223;
      break;
    default:
      return result;
  }
  __assert_rtn("assert_invariant", "json.hpp", v2, v1);
}

void sub_10000AC70(uint64_t **a1, int a2)
{
  uint64_t v24 = 0;
  unint64_t v25 = 0;
  unint64_t v26 = 0;
  int v3 = a2 - 1;
  if (a2 == 1)
  {
    sub_10000AFC0(&v24, (*a1)[2]);
    uint64_t v4 = (uint64_t)(*a1 + 1);
    int v5 = (void *)**a1;
    if (v5 != (void *)v4)
    {
      unint64_t v6 = v25;
      do
      {
        if (v6 >= v26)
        {
          unint64_t v6 = sub_10000B47C(&v24, (uint64_t)(v5 + 7));
        }
        else
        {
          *(unsigned char *)unint64_t v6 = *((unsigned char *)v5 + 56);
          *(void *)(v6 + 8) = v5[8];
          sub_10000AB94((uint64_t)(v5 + 7));
          *((unsigned char *)v5 + 56) = 0;
          v5[8] = 0;
          sub_10000AB94(v6);
          v6 += 16;
        }
        unint64_t v25 = v6;
        uint64_t v7 = (void *)v5[1];
        if (v7)
        {
          do
          {
            unint64_t v8 = v7;
            uint64_t v7 = (void *)*v7;
          }
          while (v7);
        }
        else
        {
          do
          {
            unint64_t v8 = (void *)v5[2];
            BOOL v9 = *v8 == (void)v5;
            int v5 = v8;
          }
          while (!v9);
        }
        int v5 = v8;
      }
      while (v8 != (void *)v4);
    }
  }
  else if (a2 == 2)
  {
    sub_10000AFC0(&v24, ((*a1)[1] - **a1) >> 4);
    sub_10000B3D8((uint64_t)&v22, **a1, (*a1)[1], &v24);
  }
  for (unint64_t i = v25; v24 != v25; unint64_t i = v25)
  {
    char v12 = *(unsigned char *)(i - 16);
    uint64_t v11 = i - 16;
    LOBYTE(v22) = v12;
    unsigned int v23 = *(uint64_t **)(v11 + 8);
    sub_10000AB94(v11);
    *(unsigned char *)uint64_t v11 = 0;
    *(void *)(v11 + 8) = 0;
    sub_10000AB94((uint64_t)&v22);
    sub_10000B570((uint64_t)&v24, v25 - 16);
    if (v22 == 1)
    {
      unint64_t v13 = v23;
      uint64_t v14 = v23 + 1;
      int v15 = (void *)*v23;
      if ((uint64_t *)*v23 != v23 + 1)
      {
        unint64_t v16 = v25;
        do
        {
          if (v16 >= v26)
          {
            unint64_t v16 = sub_10000B47C(&v24, (uint64_t)(v15 + 7));
          }
          else
          {
            *(unsigned char *)unint64_t v16 = *((unsigned char *)v15 + 56);
            *(void *)(v16 + 8) = v15[8];
            sub_10000AB94((uint64_t)(v15 + 7));
            *((unsigned char *)v15 + 56) = 0;
            v15[8] = 0;
            sub_10000AB94(v16);
            v16 += 16;
          }
          unint64_t v25 = v16;
          unint64_t v17 = (void *)v15[1];
          if (v17)
          {
            do
            {
              unint64_t v18 = v17;
              unint64_t v17 = (void *)*v17;
            }
            while (v17);
          }
          else
          {
            do
            {
              unint64_t v18 = (void *)v15[2];
              BOOL v9 = *v18 == (void)v15;
              int v15 = v18;
            }
            while (!v9);
          }
          int v15 = v18;
        }
        while (v18 != v14);
        unint64_t v13 = v23;
      }
      sub_10000B5D4((uint64_t)v13, (char *)v13[1]);
      *unint64_t v13 = (uint64_t)(v13 + 1);
      v13[2] = 0;
      v13[1] = 0;
    }
    else if (v22 == 2)
    {
      sub_10000B3D8((uint64_t)&v27, *v23, v23[1], &v24);
      sub_10000B054(v23);
    }
    sub_10000AB94((uint64_t)&v22);
    sub_10000AC70(&v23, v22);
  }
  switch(v3)
  {
    case 0:
      sub_10000B5D4((uint64_t)*a1, (char *)(*a1)[1]);
      goto LABEL_41;
    case 1:
      int v22 = (void **)*a1;
      sub_10000B6A8(&v22);
      goto LABEL_41;
    case 2:
      uint64_t v19 = *a1;
      if ((*((char *)*a1 + 23) & 0x80000000) == 0) {
        goto LABEL_42;
      }
      unint64_t v20 = (void *)*v19;
      break;
    case 7:
      uint64_t v19 = *a1;
      unsigned int v21 = (void *)**a1;
      if (!v21) {
        goto LABEL_42;
      }
      v19[1] = (uint64_t)v21;
      unint64_t v20 = v21;
      break;
    default:
      goto LABEL_43;
  }
  operator delete(v20);
LABEL_41:
  uint64_t v19 = *a1;
LABEL_42:
  operator delete(v19);
LABEL_43:
  int v22 = (void **)&v24;
  sub_10000B6A8(&v22);
}

uint64_t sub_10000AFC0(void *a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t result = (uint64_t)(a1 + 2);
  if (a2 > (v4 - *a1) >> 4)
  {
    if (a2 >> 60) {
      sub_100005628();
    }
    uint64_t v5 = a1[1] - *a1;
    v7[4] = result;
    v7[0] = sub_10000B12C(result, a2);
    v7[1] = v7[0] + v5;
    v7[2] = v7[0] + v5;
    v7[3] = v7[0] + 16 * v6;
    sub_10000B0B4(a1, v7);
    return sub_10000B344((uint64_t)v7);
  }
  return result;
}

void sub_10000B040(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_10000B344((uint64_t)va);
  _Unwind_Resume(a1);
}

void *sub_10000B054(void *result)
{
  int v1 = result;
  uint64_t v3 = *result;
  uint64_t v2 = result[1];
  if (v2 != *result)
  {
    uint64_t v4 = v2 - 16;
    uint64_t v5 = (unsigned __int8 *)(v2 - 16);
    do
    {
      sub_10000AB94(v4);
      unsigned int v6 = *v5;
      v5 -= 16;
      uint64_t result = (void *)sub_10000AC70(v4 + 8, v6);
      BOOL v7 = v4 == v3;
      uint64_t v4 = (uint64_t)v5;
    }
    while (!v7);
  }
  v1[1] = v3;
  return result;
}

uint64_t sub_10000B0B4(uint64_t *a1, void *a2)
{
  uint64_t result = sub_10000B164((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
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

void *sub_10000B12C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60) {
    sub_100005718();
  }
  return operator new(16 * a2);
}

uint64_t sub_10000B164(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
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
      sub_10000AB94(v9);
      *(unsigned char *)uint64_t v9 = 0;
      *(void *)(v9 + 8) = 0;
      sub_10000AB94(v10);
      uint64_t v7 = *((void *)&v17 + 1) - 16;
      *((void *)&v17 + 1) -= 16;
      BOOL v11 = v9 == a5;
      v9 -= 16;
    }
    while (!v11);
    uint64_t v12 = v17;
  }
  char v15 = 1;
  sub_10000B22C((uint64_t)v14);
  return v12;
}

uint64_t sub_10000B22C(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    sub_10000B264((uint64_t *)a1);
  }
  return a1;
}

void sub_10000B264(uint64_t *a1)
{
  int v1 = (uint64_t *)a1[2];
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
  sub_10000B2DC(v4, (uint64_t)v13, (uint64_t)v8);
}

void sub_10000B2DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  for (unint64_t i = *(uint64_t ***)(a2 + 32); i != *(uint64_t ***)(a3 + 32); *(void *)(a2 + 32) = i)
  {
    sub_10000AB94((uint64_t)i);
    sub_10000AC70(i + 1, *(unsigned __int8 *)i);
    unint64_t i = (uint64_t **)(*(void *)(a2 + 32) + 16);
  }
}

uint64_t sub_10000B344(uint64_t a1)
{
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

uint64_t sub_10000B37C(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 16);
  if (v2 != a2)
  {
    uint64_t v4 = result;
    do
    {
      *(void *)(v4 + 16) = v2 - 16;
      sub_10000AB94(v2 - 16);
      uint64_t result = sub_10000AC70(v2 - 8, *(unsigned __int8 *)(v2 - 16));
      uint64_t v2 = *(void *)(v4 + 16);
    }
    while (v2 != a2);
  }
  return result;
}

uint64_t sub_10000B3D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v5 = a2;
  if (a2 != a3)
  {
    unint64_t v7 = a4[1];
    do
    {
      if (v7 >= a4[2])
      {
        unint64_t v7 = sub_10000B47C(a4, v5);
      }
      else
      {
        *(unsigned char *)unint64_t v7 = *(unsigned char *)v5;
        *(void *)(v7 + 8) = *(void *)(v5 + 8);
        sub_10000AB94(v5);
        *(unsigned char *)uint64_t v5 = 0;
        *(void *)(v5 + 8) = 0;
        sub_10000AB94(v7);
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

uint64_t sub_10000B47C(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = (a1[1] - *a1) >> 4;
  unint64_t v5 = v4 + 1;
  if ((unint64_t)(v4 + 1) >> 60) {
    sub_100005628();
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
  uint64_t v10 = (char *)sub_10000B12C(v7, v9);
  uint64_t v11 = (uint64_t)&v10[16 * v4];
  v15[0] = v10;
  v15[1] = v11;
  v15[3] = &v10[16 * v12];
  *(unsigned char *)uint64_t v11 = *(unsigned char *)a2;
  *(void *)(v11 + 8) = *(void *)(a2 + 8);
  sub_10000AB94(a2);
  *(unsigned char *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  sub_10000AB94(v11);
  v15[2] = v11 + 16;
  sub_10000B0B4(a1, v15);
  uint64_t v13 = a1[1];
  sub_10000B344((uint64_t)v15);
  return v13;
}

void sub_10000B55C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_10000B344((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_10000B570(uint64_t result, uint64_t a2)
{
  uint64_t v3 = result;
  uint64_t v4 = *(void *)(result + 8);
  if (v4 != a2)
  {
    uint64_t v5 = v4 - 16;
    uint64_t v6 = (unsigned __int8 *)(v4 - 16);
    do
    {
      sub_10000AB94(v5);
      unsigned int v7 = *v6;
      v6 -= 16;
      uint64_t result = sub_10000AC70(v5 + 8, v7);
      BOOL v8 = v5 == a2;
      uint64_t v5 = (uint64_t)v6;
    }
    while (!v8);
  }
  *(void *)(v3 + 8) = a2;
  return result;
}

void sub_10000B5D4(uint64_t a1, char *a2)
{
  if (a2)
  {
    sub_10000B5D4(a1, *(void *)a2);
    sub_10000B5D4(a1, *((void *)a2 + 1));
    sub_10000AB94((uint64_t)(a2 + 56));
    sub_10000AC70(a2 + 64, a2[56]);
    if (a2[55] < 0) {
      operator delete(*((void **)a2 + 4));
    }
    operator delete(a2);
  }
}

void sub_10000B64C(uint64_t a1, uint64_t a2)
{
  sub_10000AB94(a2 + 24);
  sub_10000AC70((uint64_t **)(a2 + 32), *(unsigned __int8 *)(a2 + 24));
  if (*(char *)(a2 + 23) < 0)
  {
    uint64_t v3 = *(void **)a2;
    operator delete(v3);
  }
}

void sub_10000B6A8(void ***a1)
{
  int v1 = *a1;
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
        sub_10000AB94(v6);
        unsigned int v8 = *v7;
        v7 -= 16;
        sub_10000AC70(v6 + 8, v8);
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

const char *sub_10000B74C(char *a1)
{
  unint64_t v1 = *a1;
  if (v1 > 9) {
    return "number";
  }
  else {
    return (&off_100014638)[v1];
  }
}

uint64_t *sub_10000B774(uint64_t **a1, void **a2, uint64_t a3, _OWORD **a4)
{
  uint64_t v6 = (uint64_t **)sub_10000B80C((uint64_t)a1, &v9, a2);
  uint64_t result = *v6;
  if (!*v6)
  {
    sub_10000B8A0((uint64_t)a1, a4, (uint64_t)&v8);
    sub_10000B91C(a1, v9, v6, v8);
    return v8;
  }
  return result;
}

void *sub_10000B80C(uint64_t a1, void *a2, void **a3)
{
  uint64_t v5 = (void *)(a1 + 8);
  uint64_t v4 = *(void **)(a1 + 8);
  if (v4)
  {
    do
    {
      while (1)
      {
        unsigned int v7 = v4;
        unsigned int v8 = v4 + 4;
        if ((sub_10000B974(a3, (void **)v4 + 4) & 0x80) == 0) {
          break;
        }
        uint64_t v4 = (void *)*v7;
        uint64_t v5 = v7;
        if (!*v7) {
          goto LABEL_9;
        }
      }
      if ((sub_10000B974(v8, a3) & 0x80) == 0) {
        break;
      }
      uint64_t v5 = v7 + 1;
      uint64_t v4 = (void *)v7[1];
    }
    while (v4);
  }
  else
  {
    unsigned int v7 = (void *)(a1 + 8);
  }
LABEL_9:
  *a2 = v7;
  return v5;
}

uint64_t sub_10000B8A0@<X0>(uint64_t a1@<X0>, _OWORD **a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v5 = a1 + 8;
  uint64_t v6 = operator new(0x48uLL);
  *(void *)a3 = v6;
  *(void *)(a3 + 8) = v5;
  unsigned int v7 = *a2;
  uint64_t v8 = *((void *)*a2 + 2);
  v6[2] = **a2;
  *((void *)v6 + 6) = v8;
  *unsigned int v7 = 0;
  v7[1] = 0;
  v7[2] = 0;
  *((void *)v6 + 8) = 0;
  *((unsigned char *)v6 + 56) = 0;
  uint64_t v9 = (uint64_t)v6 + 56;
  sub_10000AB94((uint64_t)v6 + 56);
  uint64_t result = sub_10000AB94(v9);
  *(unsigned char *)(a3 + 16) = 1;
  return result;
}

uint64_t *sub_10000B91C(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
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
  uint64_t result = sub_10000BA0C(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

uint64_t sub_10000B974(void *a1, void **a2)
{
  size_t v2 = *((unsigned __int8 *)a1 + 23);
  size_t v3 = a1[1];
  if ((v2 & 0x80u) != 0)
  {
    a1 = (void *)*a1;
    size_t v2 = v3;
  }
  int v4 = *((char *)a2 + 23);
  if (v4 >= 0) {
    uint64_t v5 = a2;
  }
  else {
    uint64_t v5 = *a2;
  }
  if (v4 >= 0) {
    size_t v6 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    size_t v6 = (size_t)a2[1];
  }
  return sub_10000B9AC(a1, v2, v5, v6);
}

uint64_t sub_10000B9AC(const void *a1, size_t a2, void *__s2, size_t a4)
{
  if (a4 >= a2) {
    size_t v7 = a2;
  }
  else {
    size_t v7 = a4;
  }
  int v8 = memcmp(a1, __s2, v7);
  if (v8)
  {
    if ((v8 & 0x80000000) == 0) {
      return 1;
    }
  }
  else
  {
    if (a2 == a4) {
      return 0;
    }
    if (a2 >= a4) {
      return 1;
    }
  }
  return 255;
}

uint64_t *sub_10000BA0C(uint64_t *result, uint64_t *a2)
{
  *((unsigned char *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      size_t v2 = (uint64_t *)a2[2];
      if (*((unsigned char *)v2 + 24)) {
        return result;
      }
      size_t v3 = (uint64_t *)v2[2];
      int v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (int v8 = *(unsigned __int8 *)(v7 + 24), v5 = (unsigned char *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            uint64_t v9 = (uint64_t **)a2[2];
          }
          else
          {
            uint64_t v9 = (uint64_t **)v2[1];
            uint64_t v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              size_t v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = v9;
            *uint64_t v9 = v2;
            v2[2] = (uint64_t)v9;
            size_t v3 = v9[2];
            size_t v2 = (uint64_t *)*v3;
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
      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), uint64_t v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          uint64_t v11 = a2[1];
          uint64_t *v2 = v11;
          if (v11)
          {
            *(void *)(v11 + 16) = v2;
            size_t v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          size_t v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((unsigned char *)a2 + 24) = 1;
        *((unsigned char *)v3 + 24) = 0;
        size_t v2 = (uint64_t *)v3[1];
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
      *uint64_t v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

void sub_10000BBA4(uint64_t a1, void *__p)
{
  if (*(unsigned char *)(a1 + 8)) {
    sub_10000B64C(*(void *)a1, (uint64_t)__p + 32);
  }
  if (__p)
  {
    operator delete(__p);
  }
}

uint64_t sub_10000BC00(uint64_t a1, char **a2)
{
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)a1 = 3;
  *(void *)(a1 + 8) = sub_10000BC4C(a2);
  sub_10000AB94(a1);
  sub_10000AB94(a1);
  return a1;
}

void *sub_10000BC4C(char **a1)
{
  size_t v2 = operator new(0x18uLL);
  sub_100009DD8(v2, *a1);
  return v2;
}

void sub_10000BC84(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_10000BC98(uint64_t a1, char *a2)
{
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)a1 = 3;
  *(void *)(a1 + 8) = sub_10000BCE4(a2);
  sub_10000AB94(a1);
  sub_10000AB94(a1);
  return a1;
}

void *sub_10000BCE4(char *a1)
{
  size_t v2 = operator new(0x18uLL);
  sub_100009DD8(v2, a1);
  return v2;
}

void sub_10000BD1C(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_10000BD30(uint64_t a1, char *a2)
{
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)a1 = 3;
  *(void *)(a1 + 8) = sub_10000BD7C(a2);
  sub_10000AB94(a1);
  sub_10000AB94(a1);
  return a1;
}

void *sub_10000BD7C(char *a1)
{
  size_t v2 = operator new(0x18uLL);
  sub_100009DD8(v2, a1);
  return v2;
}

void sub_10000BDB4(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_10000BDC8(uint64_t a1, char *a2)
{
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)a1 = 3;
  *(void *)(a1 + 8) = sub_10000BE14(a2);
  sub_10000AB94(a1);
  sub_10000AB94(a1);
  return a1;
}

void *sub_10000BE14(char *a1)
{
  size_t v2 = operator new(0x18uLL);
  sub_100009DD8(v2, a1);
  return v2;
}

void sub_10000BE4C(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_10000BE60(uint64_t a1, uint64_t a2, uint64_t a3, char a4, int a5)
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
    uint64_t v12 = *v11;
    if (**v11 != 2
      || *(void *)(*((void *)v12 + 1) + 8) - **((void **)v12 + 1) != 32
      || *(unsigned char *)sub_10000C14C((uint64_t)v12, 0) != 3)
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
      exception = __cxa_allocate_exception(0x20uLL);
      sub_100009DD8(v20, "cannot create object from initializer list");
      sub_1000099F4(301, (uint64_t)v20, exception);
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
    sub_10000C02C(a2, v15, a1);
  }
  else
  {
    *(unsigned char *)a1 = 2;
    uint64_t v19 = v15;
    v20[0] = a2;
    *(void *)(a1 + 8) = sub_10000C0E0(v20, &v19);
  }
  sub_10000AB94(a1);
  return a1;
}

void sub_10000BFF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
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

uint64_t sub_10000C02C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v5 = a1;
    do
    {
      sub_10000C264(v5, (uint64_t)v7);
      sub_10000CCA4(*(uint64_t ***)(a3 + 8), *(void ***)(*v8 + 8), *(void *)(*v8 + 8), *v8 + 16);
      sub_10000AB94((uint64_t)v7);
      sub_10000AC70(&v8, v7[0]);
      v5 += 32;
    }
    while (v5 != a2);
  }
  return a3;
}

void sub_10000C0C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned __int8 a9)
{
  sub_10000AB94((uint64_t)&a9);
  sub_10000AC70(v9, a9);
  _Unwind_Resume(a1);
}

void *sub_10000C0E0(uint64_t *a1, uint64_t *a2)
{
  int v4 = operator new(0x18uLL);
  uint64_t v5 = *a1;
  uint64_t v6 = *a2;
  unint64_t v7 = (*a2 - *a1) >> 5;
  v4[1] = 0;
  v4[2] = 0;
  void *v4 = 0;
  sub_10000CDB8(v4, v5, v6, v7);
  return v4;
}

void sub_10000C138(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_10000C14C(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)a1 != 2)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    uint64_t v5 = (char *)sub_10000B74C((char *)a1);
    sub_100009DD8(&v6, v5);
    sub_100009B98("cannot use operator[] with a numeric argument with ", &v6, &v7);
    sub_1000099F4(305, (uint64_t)&v7, exception);
  }
  return **(void **)(a1 + 8) + 16 * a2;
}

void sub_10000C204(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0) {
    operator delete(__p);
  }
  if (a14 < 0)
  {
    operator delete(a9);
    if ((v21 & 1) == 0) {
LABEL_8:
    }
      _Unwind_Resume(a1);
  }
  else if (!v21)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v20);
  goto LABEL_8;
}

uint64_t sub_10000C264@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (*(unsigned char *)(a1 + 24))
  {
    *(unsigned char *)a2 = *(unsigned char *)v3;
    *(void *)(a2 + 8) = *(void *)(v3 + 8);
    sub_10000AB94(v3);
    *(unsigned char *)uint64_t v3 = 0;
    *(void *)(v3 + 8) = 0;
    return sub_10000AB94(a2);
  }
  else
  {
    return sub_10000C2E8(a2, v3);
  }
}

uint64_t sub_10000C2E8(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = 0;
  sub_10000AB94(a2);
  switch(*(unsigned char *)a1)
  {
    case 1:
      int v4 = sub_10000C3BC(*(void *)(a2 + 8));
      goto LABEL_8;
    case 2:
      int v4 = sub_10000C8A4(*(uint64_t **)(a2 + 8));
      goto LABEL_8;
    case 3:
      int v4 = sub_10000CB18(*(void *)(a2 + 8));
      goto LABEL_8;
    case 4:
      int v4 = (uint64_t *)*(unsigned __int8 *)(a2 + 8);
      goto LABEL_8;
    case 5:
    case 6:
    case 7:
      int v4 = *(uint64_t **)(a2 + 8);
      goto LABEL_8;
    case 8:
      int v4 = sub_10000CB84(*(void *)(a2 + 8));
LABEL_8:
      *(void *)(a1 + 8) = v4;
      break;
    default:
      break;
  }
  sub_10000AB94(a1);
  return a1;
}

uint64_t *sub_10000C3BC(uint64_t a1)
{
  size_t v2 = (uint64_t *)operator new(0x18uLL);
  sub_10000C408(v2, a1);
  return v2;
}

void sub_10000C3F4(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t *sub_10000C408(uint64_t *a1, uint64_t a2)
{
  a1[2] = 0;
  a1[1] = 0;
  *a1 = (uint64_t)(a1 + 1);
  sub_10000C460(a1, *(void ***)a2, (void **)(a2 + 8));
  return a1;
}

void sub_10000C448(_Unwind_Exception *a1)
{
  sub_10000B5D4(v1, *(char **)(v1 + 8));
  _Unwind_Resume(a1);
}

uint64_t *sub_10000C460(uint64_t *result, void **a2, void **a3)
{
  if (a2 != a3)
  {
    int v4 = a2;
    uint64_t v5 = (uint64_t **)result;
    uint64_t v6 = (uint64_t)(result + 1);
    do
    {
      uint64_t result = sub_10000C4EC(v5, v6, v4 + 4, (long long *)v4 + 2);
      std::string v7 = (void **)v4[1];
      if (v7)
      {
        do
        {
          int v8 = v7;
          std::string v7 = (void **)*v7;
        }
        while (v7);
      }
      else
      {
        do
        {
          int v8 = (void **)v4[2];
          BOOL v9 = *v8 == v4;
          int v4 = v8;
        }
        while (!v9);
      }
      int v4 = v8;
    }
    while (v8 != a3);
  }
  return result;
}

uint64_t *sub_10000C4EC(uint64_t **a1, uint64_t a2, void **a3, long long *a4)
{
  uint64_t v6 = (uint64_t **)sub_10000C570(a1, a2, &v10, &v9, a3);
  uint64_t result = *v6;
  if (!*v6)
  {
    sub_10000C708((uint64_t)a1, a4, (uint64_t)&v8);
    sub_10000B91C(a1, (uint64_t)v10, v6, v8);
    return v8;
  }
  return result;
}

void **sub_10000C570(void *a1, uint64_t a2, void ***a3, uint64_t *a4, void **a5)
{
  uint64_t v9 = (void **)(a1 + 1);
  if (a1 + 1 == (void *)a2 || (sub_10000B974(a5, (void **)(a2 + 32)) & 0x80) != 0)
  {
    if (*a1 == a2)
    {
      uint64_t v12 = (void *)a2;
    }
    else
    {
      uint64_t v11 = *(void **)a2;
      if (*(void *)a2)
      {
        do
        {
          uint64_t v12 = v11;
          uint64_t v11 = (void *)v11[1];
        }
        while (v11);
      }
      else
      {
        int v16 = (void *)a2;
        do
        {
          uint64_t v12 = (void *)v16[2];
          BOOL v17 = *v12 == (void)v16;
          int v16 = v12;
        }
        while (v17);
      }
      if ((sub_10000B974(v12 + 4, a5) & 0x80) == 0) {
        goto LABEL_17;
      }
    }
    if (*(void *)a2)
    {
      *a3 = (void **)v12;
      return (void **)(v12 + 1);
    }
    else
    {
      *a3 = (void **)a2;
      return (void **)a2;
    }
  }
  if ((sub_10000B974((void *)(a2 + 32), a5) & 0x80) == 0)
  {
    *a3 = (void **)a2;
    *a4 = a2;
    return (void **)a4;
  }
  a4 = (uint64_t *)(a2 + 8);
  uint64_t v13 = *(void *)(a2 + 8);
  if (v13)
  {
    int v14 = *(void ***)(a2 + 8);
    do
    {
      uint64_t v15 = v14;
      int v14 = (void **)*v14;
    }
    while (v14);
  }
  else
  {
    uint64_t v19 = (void **)a2;
    do
    {
      uint64_t v15 = (void **)v19[2];
      BOOL v17 = *v15 == v19;
      uint64_t v19 = v15;
    }
    while (!v17);
  }
  if (v15 == v9)
  {
LABEL_29:
    if (v13)
    {
      *a3 = v15;
      return v15;
    }
    else
    {
      *a3 = (void **)a2;
    }
    return (void **)a4;
  }
  if ((sub_10000B974(a5, v15 + 4) & 0x80) != 0)
  {
    uint64_t v13 = *a4;
    goto LABEL_29;
  }
LABEL_17:
  return (void **)sub_10000B80C((uint64_t)a1, a3, a5);
}

char *sub_10000C708@<X0>(uint64_t a1@<X0>, long long *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = a1 + 8;
  uint64_t v6 = (char *)operator new(0x48uLL);
  *(void *)a3 = v6;
  *(void *)(a3 + 8) = v5;
  *(unsigned char *)(a3 + 16) = 0;
  uint64_t result = sub_10000C78C(v6 + 32, a2);
  *(unsigned char *)(a3 + 16) = 1;
  return result;
}

void sub_10000C770(_Unwind_Exception *a1)
{
  void *v1 = 0;
  sub_10000BBA4(v3, v2);
  _Unwind_Resume(a1);
}

char *sub_10000C78C(char *__dst, long long *a2)
{
  if (*((char *)a2 + 23) < 0)
  {
    sub_10000C804(__dst, *(void **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v4 = *a2;
    *((void *)__dst + 2) = *((void *)a2 + 2);
    *(_OWORD *)__dst = v4;
  }
  sub_10000C2E8(__dst + 24, (char *)a2 + 24);
  return __dst;
}

void sub_10000C7E8(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void *sub_10000C804(unsigned char *__dst, void *__src, unint64_t a3)
{
  uint64_t v5 = __dst;
  if (a3 > 0x16)
  {
    if (a3 >= 0x7FFFFFFFFFFFFFF8) {
      sub_100007AD8();
    }
    uint64_t v6 = (a3 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a3 | 7) != 0x17) {
      uint64_t v6 = a3 | 7;
    }
    uint64_t v7 = v6 + 1;
    int v8 = operator new(v6 + 1);
    v5[1] = a3;
    v5[2] = v7 | 0x8000000000000000;
    *uint64_t v5 = v8;
    uint64_t v5 = v8;
  }
  else
  {
    __dst[23] = a3;
  }
  return memmove(v5, __src, a3 + 1);
}

void *sub_10000C8A4(uint64_t *a1)
{
  size_t v2 = operator new(0x18uLL);
  v2[1] = 0;
  v2[2] = 0;
  void *v2 = 0;
  sub_10000C900(v2, *a1, a1[1], (a1[1] - *a1) >> 4);
  return v2;
}

void sub_10000C8EC(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *sub_10000C900(void *result, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    sub_10000C988(result, a4);
    uint64_t result = (void *)sub_10000C9CC((uint64_t)(v6 + 2), a2, a3, v6[1]);
    v6[1] = result;
  }
  return result;
}

void sub_10000C968(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  *(void *)(v9 + 8) = v10;
  sub_10000B6A8(&a9);
  _Unwind_Resume(a1);
}

char *sub_10000C988(void *a1, unint64_t a2)
{
  if (a2 >> 60) {
    sub_100005628();
  }
  uint64_t result = (char *)sub_10000B12C((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[16 * v4];
  return result;
}

uint64_t sub_10000C9CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
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
      sub_10000C2E8(v4, v6);
      v6 += 16;
      uint64_t v4 = v11 + 16;
      v11 += 16;
    }
    while (v6 != a3);
  }
  char v9 = 1;
  sub_10000CA70((uint64_t)v8);
  return v4;
}

void sub_10000CA5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t sub_10000CA70(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    sub_10000CABC(*(void *)a1, **(void **)(a1 + 16), **(void **)(a1 + 16), **(void **)(a1 + 8), **(void **)(a1 + 8));
  }
  return a1;
}

void sub_10000CABC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a3 != a5)
  {
    uint64_t v6 = a3 - 16;
    uint64_t v7 = (unsigned __int8 *)(a3 - 16);
    do
    {
      sub_10000AB94(v6);
      int v8 = *v7;
      v7 -= 16;
      sub_10000AC70((uint64_t **)(v6 + 8), v8);
      BOOL v9 = v6 == a5;
      uint64_t v6 = (uint64_t)v7;
    }
    while (!v9);
  }
}

void *sub_10000CB18(uint64_t a1)
{
  size_t v2 = operator new(0x18uLL);
  uint64_t v3 = v2;
  if (*(char *)(a1 + 23) < 0)
  {
    sub_10000C804(v2, *(void **)a1, *(void *)(a1 + 8));
  }
  else
  {
    *(_OWORD *)size_t v2 = *(_OWORD *)a1;
    v2[2] = *(void *)(a1 + 16);
  }
  return v3;
}

void sub_10000CB70(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *sub_10000CB84(uint64_t a1)
{
  size_t v2 = operator new(0x20uLL);
  v2[1] = 0;
  v2[2] = 0;
  void *v2 = 0;
  sub_10000CBE4(v2, *(const void **)a1, *(void *)(a1 + 8), *(void *)(a1 + 8) - *(void *)a1);
  *((_WORD *)v2 + 12) = *(_WORD *)(a1 + 24);
  return v2;
}

void sub_10000CBD0(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *sub_10000CBE4(void *result, const void *a2, uint64_t a3, size_t __sz)
{
  if (__sz)
  {
    uint64_t v6 = result;
    uint64_t result = sub_10000CC60(result, __sz);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      uint64_t result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_10000CC44(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *sub_10000CC60(void *a1, size_t __sz)
{
  if ((__sz & 0x8000000000000000) != 0) {
    sub_100005628();
  }
  uint64_t result = (char *)operator new(__sz);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[__sz];
  return result;
}

uint64_t *sub_10000CCA4(uint64_t **a1, void **a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = (uint64_t **)sub_10000B80C((uint64_t)a1, &v10, a2);
  uint64_t result = *v7;
  if (!*v7)
  {
    sub_10000CD2C((uint64_t)a1, a3, a4, (uint64_t)&v9);
    sub_10000B91C(a1, v10, v7, v9);
    return v9;
  }
  return result;
}

uint64_t sub_10000CD2C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
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
  sub_10000AB94(a3);
  *(unsigned char *)a3 = 0;
  *(void *)(a3 + 8) = 0;
  uint64_t result = sub_10000AB94(v10);
  *(unsigned char *)(a4 + 16) = 1;
  return result;
}

void *sub_10000CDB8(void *result, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    sub_10000C988(result, a4);
    uint64_t result = (void *)sub_10000CE40((uint64_t)(v6 + 2), a2, a3, v6[1]);
    v6[1] = result;
  }
  return result;
}

void sub_10000CE20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  *(void *)(v9 + 8) = v10;
  sub_10000B6A8(&a9);
  _Unwind_Resume(a1);
}

uint64_t sub_10000CE40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
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
      sub_10000CEE4(v4, v6);
      v6 += 32;
      uint64_t v4 = v11 + 16;
      v11 += 16;
    }
    while (v6 != a3);
  }
  char v9 = 1;
  sub_10000CA70((uint64_t)v8);
  return v4;
}

void sub_10000CED0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t sub_10000CEE4(uint64_t a1, uint64_t a2)
{
  sub_10000C264(a2, (uint64_t)v4);
  *(unsigned char *)a1 = v4[0];
  *(void *)(a1 + 8) = v5;
  sub_10000AB94((uint64_t)v4);
  v4[0] = 0;
  uint64_t v5 = 0;
  sub_10000AB94(a1);
  sub_10000AB94((uint64_t)v4);
  sub_10000AC70(&v5, v4[0]);
  return a1;
}

uint64_t sub_10000CF60(uint64_t *a1, uint64_t a2)
{
  unint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  unint64_t v5 = v6;
  unint64_t v7 = *(void *)(v4 - 8);
  if (v7 >= v6)
  {
    uint64_t v10 = (uint64_t)(v7 - *a1) >> 4;
    if ((unint64_t)(v10 + 1) >> 60) {
      sub_100005628();
    }
    uint64_t v11 = v5 - *a1;
    uint64_t v12 = v11 >> 3;
    if (v11 >> 3 <= (unint64_t)(v10 + 1)) {
      uint64_t v12 = v10 + 1;
    }
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v13 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v13 = v12;
    }
    uint64_t v19 = v4;
    if (v13) {
      int v14 = (char *)sub_10000B12C(v4, v13);
    }
    else {
      int v14 = 0;
    }
    uint64_t v15 = v14;
    int v16 = &v14[16 * v10];
    unint64_t v18 = &v14[16 * v13];
    sub_10000C2E8((uint64_t)v16, a2);
    BOOL v17 = v16 + 16;
    sub_10000B0B4(a1, &v15);
    uint64_t v9 = a1[1];
    uint64_t result = sub_10000B344((uint64_t)&v15);
  }
  else
  {
    uint64_t result = sub_10000C2E8(*(void *)(v4 - 8), a2);
    uint64_t v9 = v7 + 16;
    a1[1] = v7 + 16;
  }
  a1[1] = v9;
  return result;
}

void sub_10000D054(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  *(void *)(v10 + 8) = v11;
  _Unwind_Resume(exception_object);
}

void NebulaNotification::Processor::Processor(NebulaNotification::Processor *this)
{
}

void sub_10000D0D0(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *v1;
  uint64_t *v1 = 0;
  if (v3) {
    operator delete();
  }
  _Unwind_Resume(exception_object);
}

void NebulaNotification::Processor::~Processor(NebulaNotification::Processor *this)
{
  uint64_t v2 = *(void *)this;
  *(void *)this = 0;
  if (v2) {
    operator delete();
  }
}

{
  uint64_t v2;

  uint64_t v2 = *(void *)this;
  *(void *)this = 0;
  if (v2) {
    operator delete();
  }
}

void NebulaNotification::Processor::process(int **a1@<X1>, uint64_t a2@<X8>)
{
}

void NebulaNotification::Processor::Impl::process(int **a1@<X1>, uint64_t a2@<X8>)
{
  memset(v21, 0, 44);
  NebulaNotification::Processor::Impl::get_coreanalytics(a1, (uint64_t)v21);
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * (((char *)a1[1] - (char *)*a1) >> 3);
  log = NebulaNotification::algs_get_log(v5);
  BOOL v7 = os_log_type_enabled(log, OS_LOG_TYPE_DEBUG);
  if (v4 > 9)
  {
    if (v7) {
      sub_10000D90C();
    }
    std::string __p = 0;
    uint64_t v19 = 0;
    uint64_t v20 = 0;
    uint64_t v10 = *a1;
    uint64_t v9 = a1[1];
    p_p = &__p;
    if (v10 == v9)
    {
      unint64_t v13 = 0;
      uint64_t v12 = 0;
    }
    else
    {
      do
      {
        if (*(float *)v10 < 11.0) {
          float v11 = 0.0;
        }
        else {
          float v11 = 1.0;
        }
        float v22 = v11;
        sub_10000D618((uint64_t *)&p_p, &v22);
        v10 += 6;
      }
      while (v10 != v9);
      uint64_t v12 = (const float *)__p;
      unint64_t v13 = v19;
    }
    float v14 = NebulaNotification::mean<float>(v12, (v13 - (unsigned char *)v12) >> 2);
    LOBYTE(v21[0]) = v14 < 0.5;
    int v16 = NebulaNotification::algs_get_log(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      sub_10000D86C(v14 >= 0.5, v16, v14);
    }
    *(unsigned char *)a2 = v14 >= 0.5;
    long long v17 = v21[1];
    *(_OWORD *)(a2 + 4) = v21[0];
    *(_OWORD *)(a2 + 20) = v17;
    *(_OWORD *)(a2 + 32) = *(_OWORD *)((char *)&v21[1] + 12);
    if (__p)
    {
      uint64_t v19 = __p;
      operator delete(__p);
    }
  }
  else
  {
    if (v7) {
      sub_10000D7FC();
    }
    LOBYTE(v21[0]) = 2;
    *(unsigned char *)a2 = 0;
    long long v8 = v21[0];
    *(_OWORD *)(a2 + 20) = v21[1];
    *(_OWORD *)(a2 + 32) = *(_OWORD *)((char *)&v21[1] + 12);
    *(_OWORD *)(a2 + 4) = v8;
  }
}

void sub_10000D34C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void NebulaNotification::Processor::Impl::get_coreanalytics(int **a1@<X1>, uint64_t a2@<X8>)
{
  *(_OWORD *)(a2 + 28) = 0u;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  *(unsigned char *)a2 = 2;
  unint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  if (v3 == *a1) {
    return;
  }
  unint64_t v37 = 0;
  uint64_t v38 = 0;
  uint64_t v39 = 0;
  uint64_t v41 = (const float **)&v37;
  do
  {
    int v40 = *v4;
    sub_10000D618((uint64_t *)&v41, &v40);
    v4 += 6;
  }
  while (v4 != v3);
  unint64_t v5 = v37;
  unint64_t v6 = (float *)v38;
  if (v37 == v38)
  {
    unint64_t v10 = v38 - v37;
    float v11 = (float)v10;
    *(float *)(a2 + 4) = (float)(0.0 / (float)v10) * 100.0;
  }
  else
  {
    uint64_t v7 = 0;
    long long v8 = v37;
    do
    {
      float v9 = *v8++;
      if (v9 >= 10.0) {
        ++v7;
      }
    }
    while (v8 != v38);
    unint64_t v10 = v38 - v37;
    float v11 = (float)v10;
    *(float *)(a2 + 4) = (float)((float)v7 / (float)v10) * 100.0;
    if (v6 != v5)
    {
      uint64_t v12 = 0;
      unint64_t v13 = v5;
      do
      {
        float v14 = *v13++;
        if (v14 >= 11.0) {
          ++v12;
        }
      }
      while (v13 != v6);
      uint64_t v15 = 0;
      *(float *)(a2 + 8) = (float)((float)v12 / v11) * 100.0;
      int v16 = v5;
      do
      {
        float v17 = *v16++;
        if (v17 >= 12.0) {
          ++v15;
        }
      }
      while (v16 != v6);
      uint64_t v18 = 0;
      *(float *)(a2 + 12) = (float)((float)v15 / v11) * 100.0;
      uint64_t v19 = v5;
      do
      {
        float v20 = *v19++;
        if (v20 >= 13.0) {
          ++v18;
        }
      }
      while (v19 != v6);
      float v21 = (float)v18;
      goto LABEL_25;
    }
  }
  float v21 = 0.0;
  float v22 = (float)(0.0 / v11) * 100.0;
  *(float *)(a2 + 8) = v22;
  *(float *)(a2 + 12) = v22;
LABEL_25:
  *(float *)(a2 + 16) = (float)(v21 / v11) * 100.0;
  *(_DWORD *)(a2 + 20) = v10;
  *(float *)(a2 + 24) = NebulaNotification::median<float>(v5, v10);
  *(float *)(a2 + 28) = NebulaNotification::mean<float>(v37, v38 - v37);
  *(float *)(a2 + 32) = NebulaNotification::standard_deviation<float>(v37, v38 - v37, 1);
  unsigned int v23 = v37;
  uint64_t v24 = (float *)v38;
  unint64_t v25 = v37 + 1;
  float v26 = *v37;
  if (v37 == v38 || v25 == v38)
  {
    *(float *)(a2 + 36) = v26;
  }
  else
  {
    float v27 = *v37;
    int v28 = v37 + 1;
    int v29 = v37;
    int v30 = v37 + 1;
    do
    {
      float v31 = *v30++;
      float v32 = v31;
      if (v27 < v31)
      {
        float v27 = v32;
        int v29 = v28;
      }
      int v28 = v30;
    }
    while (v30 != v38);
    *(float *)(a2 + 36) = *v29;
    unsigned int v33 = v23;
    unsigned int v34 = (float *)v25;
    do
    {
      float v35 = *v34++;
      float v36 = v35;
      if (v35 < v26)
      {
        float v26 = v36;
        unsigned int v33 = (float *)v25;
      }
      unint64_t v25 = v34;
    }
    while (v34 != v24);
    float v26 = *v33;
  }
  *(float *)(a2 + 40) = v26;
  uint64_t v38 = v23;
  operator delete(v23);
}

void sub_10000D5F8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t *sub_10000D618(uint64_t *a1, _DWORD *a2)
{
  uint64_t v4 = *a1;
  unint64_t v5 = *(_DWORD **)(*a1 + 8);
  unint64_t v6 = (void *)(*a1 + 16);
  if ((unint64_t)v5 >= *v6)
  {
    long long v8 = *(_DWORD **)v4;
    uint64_t v9 = ((uint64_t)v5 - *(void *)v4) >> 2;
    unint64_t v10 = v9 + 1;
    if ((unint64_t)(v9 + 1) >> 62) {
      sub_100005628();
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
      unint64_t v13 = (char *)sub_10000D708((uint64_t)v6, v12);
      long long v8 = *(_DWORD **)v4;
      unint64_t v5 = *(_DWORD **)(v4 + 8);
    }
    else
    {
      unint64_t v13 = 0;
    }
    float v14 = &v13[4 * v9];
    uint64_t v15 = &v13[4 * v12];
    *(_DWORD *)float v14 = *a2;
    uint64_t v7 = v14 + 4;
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
    *unint64_t v5 = *a2;
    uint64_t v7 = v5 + 1;
  }
  *(void *)(v4 + 8) = v7;
  return a1;
}

void *sub_10000D708(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    sub_100005718();
  }
  return operator new(4 * a2);
}

void sub_10000D740(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_10000D758(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0xCu);
}

void sub_10000D778(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "1.0.3";
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Nebula Notification Algs Version: %s", (uint8_t *)&v1, 0xCu);
}

void sub_10000D7FC()
{
  sub_10000D740(__stack_chk_guard);
  LODWORD(v4) = 134217984;
  *(void *)((char *)&v4 + 4) = v0 / v1;
  sub_10000D758((void *)&_mh_execute_header, v2, v3, "Nebula Notification BD length lower than 10: %zu", (size_t)v4);
}

void sub_10000D86C(char a1, NSObject *a2, float a3)
{
  os_log_t v3 = "false";
  double v4 = a3;
  if (a1) {
    os_log_t v3 = "true";
  }
  int v5 = 134218242;
  double v6 = v4;
  __int16 v7 = 2080;
  long long v8 = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Nebula Notification BD Portion: %f, Result: %s", (uint8_t *)&v5, 0x16u);
}

void sub_10000D90C()
{
  sub_10000D740(__stack_chk_guard);
  LODWORD(v4) = 134217984;
  *(void *)((char *)&v4 + 4) = v0 / v1;
  sub_10000D758((void *)&_mh_execute_header, v2, v3, "Nebula Notification BD length: %zu", (size_t)v4);
}

uint64_t NebulaNotification::algs_get_log(NebulaNotification *this)
{
  if (qword_100018498 != -1) {
    dispatch_once(&qword_100018498, &stru_1000146A8);
  }
  return qword_1000184A0;
}

void sub_10000D9C0(id a1)
{
  qword_1000184A0 = (uint64_t)os_log_create("com.apple.BreathingAlgorithms", "nebula_notification_algs");
}

float NebulaNotification::mean<float>(const float *a1, vDSP_Length __N)
{
  if (!__N) {
    sub_10000EE9C();
  }
  if (!a1) {
    sub_10000EEC8();
  }
  float __C = 0.0;
  vDSP_meanv(a1, 1, &__C, __N);
  return __C;
}

{
  return NebulaNotification::mean<float>(a1, __N);
}

double NebulaNotification::mean<double>(const double *a1, vDSP_Length __N)
{
  if (!__N) {
    sub_10000EE9C();
  }
  if (!a1) {
    sub_10000EEC8();
  }
  double __C = 0.0;
  vDSP_meanvD(a1, 1, &__C, __N);
  return __C;
}

float NebulaNotification::auc<float>(const float *a1, vDSP_Length __N, float a3)
{
  float __C = 0.0;
  vDSP_sve(a1, 1, &__C, __N);
  return __C * a3;
}

double NebulaNotification::auc<double>(const double *a1, vDSP_Length __N, double a3)
{
  double __C = 0.0;
  vDSP_sveD(a1, 1, &__C, __N);
  return __C * a3;
}

float NebulaNotification::variance<float>(const float *a1, unint64_t a2, int a3)
{
  if (!a2) {
    sub_10000EEF4();
  }
  if (!a1) {
    sub_10000EF20();
  }
  uint64_t __C = 0;
  sub_10000E3E4(__B, a2);
  vDSP_meanv(a1, 1, (float *)&__C + 1, a2);
  vDSP_vsub(a1, 1, (const float *)&__C + 1, 0, __B[0], 1, a2);
  vDSP_dotpr(__B[0], 1, __B[0], 1, (float *)&__C, a2);
  float v6 = *(float *)&__C / (float)(a2 - (a3 ^ 1));
  *(float *)&uint64_t __C = v6;
  if (__B[0])
  {
    __B[1] = __B[0];
    operator delete(__B[0]);
  }
  return v6;
}

{
  return NebulaNotification::variance<float>(a1, a2, a3);
}

void sub_10000DBD8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

double NebulaNotification::variance<double>(const double *a1, unint64_t a2, int a3)
{
  if (!a2) {
    sub_10000EEF4();
  }
  if (!a1) {
    sub_10000EF20();
  }
  double v9 = 0.0;
  double __C = 0.0;
  sub_10000E4A0(__B, a2);
  vDSP_meanvD(a1, 1, &__C, a2);
  vDSP_vsubD(a1, 1, &__C, 0, __B[0], 1, a2);
  vDSP_dotprD(__B[0], 1, __B[0], 1, &v9, a2);
  double v6 = v9 / (double)(a2 - (a3 ^ 1u));
  double v9 = v6;
  if (__B[0])
  {
    __B[1] = __B[0];
    operator delete(__B[0]);
  }
  return v6;
}

{
  return NebulaNotification::variance<double>(a1, a2, a3);
}

void sub_10000DCCC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

float NebulaNotification::standard_deviation<float>(const float *a1, unint64_t a2, int a3)
{
  if (!a2) {
    sub_10000EF4C();
  }
  if (!a1) {
    sub_10000EF78();
  }
  return sqrtf(NebulaNotification::variance<float>(a1, a2, a3));
}

{
  return NebulaNotification::standard_deviation<float>(a1, a2, a3);
}

double NebulaNotification::standard_deviation<double>(const double *a1, unint64_t a2, int a3)
{
  if (!a2) {
    sub_10000EF4C();
  }
  if (!a1) {
    sub_10000EF78();
  }
  return sqrt(NebulaNotification::variance<double>(a1, a2, a3));
}

float NebulaNotification::range<float>(const float *__A, vDSP_Length __N)
{
  if (!__N) {
    sub_10000EFA4();
  }
  if (!__A) {
    sub_10000EFD0();
  }
  uint64_t __C = 0;
  vDSP_maxv(__A, 1, (float *)&__C + 1, __N);
  vDSP_minv(__A, 1, (float *)&__C, __N);
  return *((float *)&__C + 1) - *(float *)&__C;
}

double NebulaNotification::range<double>(const double *__A, vDSP_Length __N)
{
  if (!__N) {
    sub_10000EFA4();
  }
  if (!__A) {
    sub_10000EFD0();
  }
  double v5 = 0.0;
  double __C = 0.0;
  vDSP_maxvD(__A, 1, &__C, __N);
  vDSP_minvD(__A, 1, &v5, __N);
  return __C - v5;
}

float NebulaNotification::median<float>(_DWORD *a1, unint64_t a2)
{
  if (!a2) {
    sub_10000EFFC();
  }
  if (!a1) {
    sub_10000F028();
  }
  std::string __p = 0;
  float v17 = 0;
  uint64_t v18 = 0;
  sub_10000DF58(&__p, a2);
  sub_10000E594(a1, &a1[a2], (uint64_t)&__p);
  double v5 = (float *)__p;
  double v6 = v17;
  unint64_t v7 = ((char *)v17 - (unsigned char *)__p) >> 2;
  if (a2)
  {
    unint64_t v13 = (2 * v7 - 2) & 0xFFFFFFFFFFFFFFFCLL;
    float v14 = (float *)((char *)__p + v13);
    if ((char *)__p + v13 != (char *)v17) {
      sub_10000E5F8((float *)__p, (float *)((char *)__p + v13), v17, v4);
    }
    float v12 = *v14;
  }
  else
  {
    unint64_t v8 = v7 >> 1;
    double v9 = (float *)((char *)__p + 4 * v8 - 4);
    if (v9 != v17)
    {
      float v4 = sub_10000E5F8((float *)__p, (float *)__p + v8 - 1, v17, v4);
      double v5 = (float *)__p;
      double v6 = v17;
      unint64_t v8 = (unint64_t)(((char *)v17 - (unsigned char *)__p) >> 2) >> 1;
    }
    float v10 = *v9;
    uint64_t v11 = &v5[v8];
    if (v11 != v6) {
      sub_10000E5F8(v5, &v5[v8], v6, v4);
    }
    float v12 = (float)(v10 + *v11) * 0.5;
  }
  if (__p)
  {
    float v17 = (float *)__p;
    operator delete(__p);
  }
  return v12;
}

{
  return NebulaNotification::median<float>(a1, a2);
}

void sub_10000DF30(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_10000DF58(void **a1, unint64_t a2)
{
  float v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (unsigned char *)*a1) >> 2)
  {
    if (a2 >> 62) {
      sub_100005628();
    }
    int64_t v5 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    double v6 = (char *)sub_10000D708(v3, a2);
    unint64_t v7 = &v6[v5 & 0xFFFFFFFFFFFFFFFCLL];
    double v9 = &v6[4 * v8];
    float v10 = (char *)*a1;
    uint64_t v11 = (char *)a1[1];
    float v12 = v7;
    if (v11 != *a1)
    {
      float v12 = v7;
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

double NebulaNotification::median<double>(void *a1, unint64_t a2)
{
  if (!a2) {
    sub_10000EFFC();
  }
  if (!a1) {
    sub_10000F028();
  }
  std::string __p = 0;
  float v17 = 0;
  uint64_t v18 = 0;
  sub_10000E138(&__p, a2);
  sub_10000E9A0(a1, &a1[a2], (uint64_t)&__p);
  int64_t v5 = (double *)__p;
  double v6 = v17;
  unint64_t v7 = ((char *)v17 - (unsigned char *)__p) >> 3;
  if (a2)
  {
    unint64_t v13 = (4 * v7 - 4) & 0xFFFFFFFFFFFFFFF8;
    float v14 = (double *)((char *)__p + v13);
    if ((char *)__p + v13 != (char *)v17) {
      sub_10000EAF4((double *)__p, (double *)((char *)__p + v13), v17, v4);
    }
    double v12 = *v14;
  }
  else
  {
    unint64_t v8 = v7 >> 1;
    double v9 = (double *)((char *)__p + 8 * v8 - 8);
    if (v9 != v17)
    {
      double v4 = sub_10000EAF4((double *)__p, (double *)__p + v8 - 1, v17, v4);
      int64_t v5 = (double *)__p;
      double v6 = v17;
      unint64_t v8 = (unint64_t)(((char *)v17 - (unsigned char *)__p) >> 3) >> 1;
    }
    double v10 = *v9;
    uint64_t v11 = &v5[v8];
    if (v11 != v6) {
      sub_10000EAF4(v5, &v5[v8], v6, v4);
    }
    double v12 = (v10 + *v11) * 0.5;
  }
  if (__p)
  {
    float v17 = (double *)__p;
    operator delete(__p);
  }
  return v12;
}

void sub_10000E110(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_10000E138(void **a1, unint64_t a2)
{
  double v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (unsigned char *)*a1) >> 3)
  {
    if (a2 >> 61) {
      sub_100005628();
    }
    int64_t v5 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    double v6 = (char *)sub_10000E55C(v3, a2);
    unint64_t v7 = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
    double v9 = &v6[8 * v8];
    double v10 = (char *)*a1;
    uint64_t v11 = (char *)a1[1];
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

float NebulaNotification::percentile<float>(uint64_t a1, unint64_t a2, float a3)
{
  if (!a2) {
    return NAN;
  }
  if (!a1) {
    sub_10000F054();
  }
  if (a2 == 1) {
    return *(float *)a1;
  }
  double v4 = a3 / 100.0 * ((float)a2 + -1.0);
  int v5 = vcvtmd_s64_f64(v4);
  return *(float *)(a1 + 4 * v5)
       + (float)((float)(*(float *)(a1 + 4 * v5 + 4) - *(float *)(a1 + 4 * v5)) * (float)(int)(v4 - (double)v5));
}

double NebulaNotification::percentile<double>(uint64_t a1, unint64_t a2, double a3)
{
  if (!a2) {
    return NAN;
  }
  if (!a1) {
    sub_10000F054();
  }
  if (a2 == 1) {
    return *(double *)a1;
  }
  double v4 = a3 / 100.0 * ((double)a2 + -1.0);
  int v5 = vcvtmd_s64_f64(v4);
  return *(double *)(a1 + 8 * v5)
       + (*(double *)(a1 + 8 * v5 + 8) - *(double *)(a1 + 8 * v5)) * (double)(int)(v4 - (double)v5);
}

float NebulaNotification::percentile<float>(uint64_t *a1, float a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  if (*a1 == v3) {
    return NAN;
  }
  uint64_t v4 = v3 - v2;
  if (v4 == 4) {
    return *(float *)v2;
  }
  double v6 = a2 / 100.0 * ((float)(unint64_t)(v4 >> 2) + -1.0);
  double v7 = floor(v6);
  float v8 = *(float *)(v2 + 4 * vcvtmd_u64_f64(v6));
  return v8 + (float)(*(float *)(v2 + 4 * (unint64_t)(v7 + 1.0)) - v8) * (v6 - v7);
}

double NebulaNotification::percentile<double>(uint64_t *a1, double a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  if (*a1 == v3) {
    return NAN;
  }
  uint64_t v4 = v3 - v2;
  if (v4 == 8) {
    return *(double *)v2;
  }
  double v6 = a2 / 100.0 * ((double)(unint64_t)(v4 >> 3) + -1.0);
  double v7 = floor(v6);
  unint64_t v8 = vcvtmd_u64_f64(v6);
  return *(double *)(v2 + 8 * v8)
       + (*(double *)(v2 + 8 * (unint64_t)(v7 + 1.0)) - *(double *)(v2 + 8 * v8)) * (v6 - v7);
}

void *sub_10000E3E4(void *a1, unint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    sub_10000E45C(a1, a2);
    uint64_t v4 = (char *)a1[1];
    bzero(v4, 4 * a2);
    a1[1] = &v4[4 * a2];
  }
  return a1;
}

void sub_10000E440(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *sub_10000E45C(void *a1, unint64_t a2)
{
  if (a2 >> 62) {
    sub_100005628();
  }
  uint64_t result = (char *)sub_10000D708((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[4 * v4];
  return result;
}

void *sub_10000E4A0(void *a1, unint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    sub_10000E518(a1, a2);
    uint64_t v4 = (char *)a1[1];
    bzero(v4, 8 * a2);
    a1[1] = &v4[8 * a2];
  }
  return a1;
}

void sub_10000E4FC(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *sub_10000E518(void *a1, unint64_t a2)
{
  if (a2 >> 61) {
    sub_100005628();
  }
  uint64_t result = (char *)sub_10000E55C((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

void *sub_10000E55C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    sub_100005718();
  }
  return operator new(8 * a2);
}

_DWORD *sub_10000E594(_DWORD *a1, _DWORD *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  uint64_t v6 = a3;
  if (a1 == a2) {
    return a1;
  }
  uint64_t v4 = a2;
  do
    sub_10000D618(&v6, v3++);
  while (v3 != v4);
  return v4;
}

float sub_10000E5F8(float *a1, float *a2, float *a3, float result)
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
        sub_10000E8A4(a1, a1 + 1, v4 - 1);
        return result;
      }
      if (v7 == 2)
      {
        uint64_t result = *(v4 - 1);
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
        return sub_10000E92C(a1, v4, result);
      }
      unint64_t v8 = &a1[v7 >> 1];
      double v9 = v4 - 1;
      int v10 = sub_10000E8A4(a1, v8, v4 - 1);
      uint64_t result = *a1;
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
        float v21 = a1 + 1;
        if (result >= *v9)
        {
          while (v21 != v9)
          {
            float v22 = *v21;
            if (result < *v21)
            {
              *v21++ = *v9;
              *double v9 = v22;
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
            uint64_t result = v26;
          }
          while (v25 >= v26);
          float v27 = v21 - 1;
          do
          {
            float v28 = *--v9;
            float v29 = v28;
          }
          while (v25 < v28);
          if (v27 >= v9) {
            break;
          }
          float *v27 = v29;
          *double v9 = result;
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
        double v12 = a1 + 1;
        if (a1 + 1 >= v11)
        {
          int v16 = a1 + 1;
        }
        else
        {
          uint64_t v13 = a1 + 1;
          while (1)
          {
            float v14 = *v8;
            do
            {
              float v15 = *v13++;
              uint64_t result = v15;
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
              unint64_t v8 = v11;
            }
          }
        }
        if (v16 != v8)
        {
          uint64_t result = *v8;
          float v19 = *v16;
          if (*v8 < *v16)
          {
            *int v16 = result;
            *unint64_t v8 = v19;
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
            unsigned int v23 = v16 + 1;
            while (v23 != v4)
            {
              float v24 = *(v23 - 1);
              uint64_t result = *v23++;
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
              uint64_t result = *v12++;
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

uint64_t sub_10000E8A4(float *a1, float *a2, float *a3)
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

float sub_10000E92C(float *a1, float *a2, float result)
{
  while (a1 != a2 - 1)
  {
    float v3 = a1++;
    if (v3 != a2 && a1 != a2)
    {
      uint64_t result = *v3;
      float v4 = a1;
      float v5 = v3;
      float v6 = a1;
      do
      {
        float v7 = *v6++;
        float v8 = v7;
        if (v7 < result)
        {
          uint64_t result = v8;
          float v5 = v4;
        }
        float v4 = v6;
      }
      while (v6 != a2);
      if (v5 != v3)
      {
        uint64_t result = *v3;
        float *v3 = *v5;
        *float v5 = result;
      }
    }
  }
  return result;
}

void *sub_10000E9A0(void *a1, void *a2, uint64_t a3)
{
  float v3 = a1;
  uint64_t v6 = a3;
  if (a1 == a2) {
    return a1;
  }
  float v4 = a2;
  do
    sub_10000EA04(&v6, v3++);
  while (v3 != v4);
  return v4;
}

uint64_t *sub_10000EA04(uint64_t *a1, void *a2)
{
  uint64_t v4 = *a1;
  float v5 = *(void **)(*a1 + 8);
  uint64_t v6 = (void *)(*a1 + 16);
  if ((unint64_t)v5 >= *v6)
  {
    float v8 = *(void **)v4;
    uint64_t v9 = ((uint64_t)v5 - *(void *)v4) >> 3;
    unint64_t v10 = v9 + 1;
    if ((unint64_t)(v9 + 1) >> 61) {
      sub_100005628();
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
      uint64_t v13 = (char *)sub_10000E55C((uint64_t)v6, v12);
      float v8 = *(void **)v4;
      float v5 = *(void **)(v4 + 8);
    }
    else
    {
      uint64_t v13 = 0;
    }
    float v14 = &v13[8 * v9];
    float v15 = &v13[8 * v12];
    *(void *)float v14 = *a2;
    float v7 = v14 + 8;
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
    *float v5 = *a2;
    float v7 = v5 + 1;
  }
  *(void *)(v4 + 8) = v7;
  return a1;
}

double sub_10000EAF4(double *a1, double *a2, double *a3, double result)
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
        sub_10000EDA0(a1, a1 + 1, v4 - 1);
        return result;
      }
      if (v7 == 2)
      {
        uint64_t result = *(v4 - 1);
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
        return sub_10000EE28(a1, v4, result);
      }
      float v8 = &a1[v7 >> 1];
      uint64_t v9 = v4 - 1;
      int v10 = sub_10000EDA0(a1, v8, v4 - 1);
      uint64_t result = *a1;
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
        float v21 = a1 + 1;
        if (result >= *v9)
        {
          while (v21 != v9)
          {
            double v22 = *v21;
            if (result < *v21)
            {
              *v21++ = *v9;
              *uint64_t v9 = v22;
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
            uint64_t result = v26;
          }
          while (v25 >= v26);
          float v27 = v21 - 1;
          do
          {
            double v28 = *--v9;
            double v29 = v28;
          }
          while (v25 < v28);
          if (v27 >= v9) {
            break;
          }
          double *v27 = v29;
          *uint64_t v9 = result;
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
          uint64_t v13 = a1 + 1;
          while (1)
          {
            double v14 = *v8;
            do
            {
              double v15 = *v13++;
              uint64_t result = v15;
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
              float v8 = v11;
            }
          }
        }
        if (v16 != v8)
        {
          uint64_t result = *v8;
          double v19 = *v16;
          if (*v8 < *v16)
          {
            *uint64_t v16 = result;
            *float v8 = v19;
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
            unsigned int v23 = v16 + 1;
            while (v23 != v4)
            {
              double v24 = *(v23 - 1);
              uint64_t result = *v23++;
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
              uint64_t result = *v12++;
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

uint64_t sub_10000EDA0(double *a1, double *a2, double *a3)
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

double sub_10000EE28(double *a1, double *a2, double result)
{
  while (a1 != a2 - 1)
  {
    double v3 = a1++;
    if (v3 != a2 && a1 != a2)
    {
      uint64_t result = *v3;
      double v4 = a1;
      double v5 = v3;
      double v6 = a1;
      do
      {
        double v7 = *v6++;
        double v8 = v7;
        if (v7 < result)
        {
          uint64_t result = v8;
          double v5 = v4;
        }
        double v4 = v6;
      }
      while (v6 != a2);
      if (v5 != v3)
      {
        uint64_t result = *v3;
        double *v3 = *v5;
        *double v5 = result;
      }
    }
  }
  return result;
}

void sub_10000EE9C()
{
}

void sub_10000EEC8()
{
  __assert_rtn("mean", "statistics.cpp", 21, "x != NULL");
}

void sub_10000EEF4()
{
}

void sub_10000EF20()
{
  __assert_rtn("variance", "statistics.cpp", 35, "x != NULL");
}

void sub_10000EF4C()
{
}

void sub_10000EF78()
{
  __assert_rtn("standard_deviation", "statistics.cpp", 150, "x != NULL");
}

void sub_10000EFA4()
{
}

void sub_10000EFD0()
{
  __assert_rtn("range", "statistics.cpp", 135, "x != NULL");
}

void sub_10000EFFC()
{
}

void sub_10000F028()
{
  __assert_rtn("median", "statistics.cpp", 55, "x != NULL");
}

void sub_10000F054()
{
  __assert_rtn("percentile", "statistics.cpp", 119, "x != NULL");
}

void sub_10000F080(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "failed to instantiate an HKSHSleepApneaControl for BreathingDisturbanceAnalyzerDiagnosticExtension", v1, 2u);
}

void sub_10000F0C4(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "Failed to create directory at path: %{public}@ error: %{public}@ No logging will be written to files", (uint8_t *)&v3, 0x16u);
}

void sub_10000F14C(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error fetching samples: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_10000F1C4(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a1 = 134349056;
  *(void *)(a1 + 4) = a2;
  sub_10000574C((void *)&_mh_execute_header, a2, a3, "Invalid number (%{public}lu) of BD samples, more than expected.", (uint8_t *)a1);
}

void sub_10000F200(void *a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "Invalid query interval (%{public}@ - %{public}@) with a duration of zero.", buf, 0x16u);
}

void sub_10000F270()
{
  sub_100005774();
  sub_100005768(v1, v2, 5.8381e-34);
  sub_10000574C((void *)&_mh_execute_header, v3, v4, "Invalid BD sample %{public}@ has NAN.", v5);
}

void sub_10000F2B4()
{
  sub_100005774();
  sub_100005768(v1, v2, 5.8381e-34);
  sub_10000574C((void *)&_mh_execute_header, v3, v4, "Invalid BD sample %{public}@, less than minimum.", v5);
}

void sub_10000F2F8()
{
  sub_100005774();
  sub_100005768(v1, v2, 5.8381e-34);
  sub_10000574C((void *)&_mh_execute_header, v3, v4, "Invalid BD sample %{public}@, greater than limit.", v5);
}

void sub_10000F33C()
{
  sub_100005774();
  sub_100005768(v1, v2, 5.8381e-34);
  sub_10000574C((void *)&_mh_execute_header, v3, v4, "Invalid BD sample %{public}@ with end date after end of query interval.", v5);
}

void sub_10000F380()
{
  sub_100005774();
  sub_100005768(v1, v2, 5.8381e-34);
  sub_10000574C((void *)&_mh_execute_header, v3, v4, "Invalid BD sample %{public}@ with end date prior to or equal to start of query interval.", v5);
}

void sub_10000F3C4(uint64_t a1, NSObject *a2)
{
  int v2 = 138543618;
  CFStringRef v3 = @"/var/mobile/Library/Logs/HealthAlgorithms/BreathingAlgorithms";
  __int16 v4 = 2114;
  uint64_t v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "failed to delete %{public}@ with error: %{public}@", (uint8_t *)&v2, 0x16u);
}

void sub_10000F450()
{
}

void sub_10000F47C()
{
  __assert_rtn("dump", "serializer.hpp", 138, "i != val.m_value.object->cend()");
}

void sub_10000F4A8()
{
  __assert_rtn("dump", "serializer.hpp", 139, "std::next(i) == val.m_value.object->cend()");
}

void sub_10000F4D4()
{
  __assert_rtn("dump", "serializer.hpp", 166, "i != val.m_value.object->cend()");
}

void sub_10000F500()
{
  __assert_rtn("dump", "serializer.hpp", 167, "std::next(i) == val.m_value.object->cend()");
}

void sub_10000F52C()
{
}

void sub_10000F558()
{
}

void sub_10000F584()
{
}

void sub_10000F5B0()
{
}

void sub_10000F5DC()
{
}

void sub_10000F608()
{
  __assert_rtn("to_chars", "to_chars.hpp", 1082, "last - first >= std::numeric_limits<FloatType>::max_digits10");
}

void sub_10000F634()
{
  __assert_rtn("to_chars", "to_chars.hpp", 1092, "len <= std::numeric_limits<FloatType>::max_digits10");
}

void sub_10000F660()
{
  __assert_rtn("to_chars", "to_chars.hpp", 1100, "last - first >= 2 + (-kMinExp - 1) + std::numeric_limits<FloatType>::max_digits10");
}

void sub_10000F68C()
{
  __assert_rtn("to_chars", "to_chars.hpp", 1101, "last - first >= std::numeric_limits<FloatType>::max_digits10 + 6");
}

void sub_10000F6B8()
{
}

void sub_10000F6E4()
{
}

void sub_10000F710()
{
}

void sub_10000F73C()
{
}

void sub_10000F768()
{
}

void sub_10000F794()
{
}

void sub_10000F7C0()
{
}

void sub_10000F7EC()
{
}

void sub_10000F818()
{
}

void sub_10000F844()
{
}

void sub_10000F870()
{
  __assert_rtn("grisu2", "to_chars.hpp", 828, "m_plus.e == v.e");
}

void sub_10000F89C()
{
  __assert_rtn("grisu2", "to_chars.hpp", 827, "m_plus.e == m_minus.e");
}

void sub_10000F8C8()
{
  __assert_rtn("get_cached_power_for_binary_exponent", "to_chars.hpp", 466, "e >= -1500");
}

void sub_10000F8F4()
{
  __assert_rtn("get_cached_power_for_binary_exponent", "to_chars.hpp", 467, "e <= 1500");
}

void sub_10000F920()
{
  __assert_rtn("get_cached_power_for_binary_exponent", "to_chars.hpp", 472, "index >= 0");
}

void sub_10000F94C()
{
  __assert_rtn("get_cached_power_for_binary_exponent", "to_chars.hpp", 476, "kAlpha <= cached.e + e + 64");
}

void sub_10000F978()
{
  __assert_rtn("get_cached_power_for_binary_exponent", "to_chars.hpp", 477, "kGamma >= cached.e + e + 64");
}

void sub_10000F9A4()
{
}

void sub_10000F9D0()
{
  __assert_rtn("grisu2_digit_gen", "to_chars.hpp", 601, "M_plus.e >= kAlpha");
}

void sub_10000F9FC()
{
  __assert_rtn("grisu2_digit_gen", "to_chars.hpp", 602, "M_plus.e <= kGamma");
}

void sub_10000FA28()
{
}

void sub_10000FA54()
{
  __assert_rtn("grisu2_digit_gen", "to_chars.hpp", 659, "d <= 9");
}

void sub_10000FA80()
{
  __assert_rtn("grisu2_digit_gen", "to_chars.hpp", 757, "p2 <= (std::numeric_limits<std::uint64_t>::max)() / 10");
}

void sub_10000FAAC()
{
  __assert_rtn("grisu2_digit_gen", "to_chars.hpp", 766, "d <= 9");
}

void sub_10000FAD8()
{
}

void sub_10000FB04()
{
  __assert_rtn("grisu2_round", "to_chars.hpp", 545, "len >= 1");
}

void sub_10000FB30()
{
  __assert_rtn("grisu2_round", "to_chars.hpp", 546, "dist <= delta");
}

void sub_10000FB5C()
{
  __assert_rtn("grisu2_round", "to_chars.hpp", 547, "rest <= delta");
}

void sub_10000FB88()
{
}

void sub_10000FBB4()
{
  __assert_rtn("grisu2_round", "to_chars.hpp", 573, "buf[len - 1] != '0'");
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

const char *__cdecl std::runtime_error::what(const std::runtime_error *this)
{
  return std::runtime_error::what(this);
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

void std::runtime_error::~runtime_error(std::runtime_error *this)
{
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return std::bad_array_new_length::bad_array_new_length(this);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return std::string::append(this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return std::string::insert(this, __pos, __s, __n);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
}

uint64_t std::filebuf::open()
{
  return std::filebuf::open();
}

uint64_t std::filebuf::close()
{
  return std::filebuf::close();
}

uint64_t std::filebuf::basic_filebuf()
{
  return std::filebuf::basic_filebuf();
}

uint64_t std::filebuf::~filebuf()
{
  return std::filebuf::~filebuf();
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
  return std::ios::~ios();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return std::to_string(retstr, __val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unint64_t __val)
{
  return std::to_string(retstr, __val);
}

uint64_t std::operator+<char>()
{
  return std::operator+<char>();
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

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

lconv *localeconv(void)
{
  return _localeconv();
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

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

void vDSP_dotpr(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Length __N)
{
}

void vDSP_dotprD(const double *__A, vDSP_Stride __IA, const double *__B, vDSP_Stride __IB, double *__C, vDSP_Length __N)
{
}

void vDSP_maxv(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
}

void vDSP_maxvD(const double *__A, vDSP_Stride __I, double *__C, vDSP_Length __N)
{
}

void vDSP_meanv(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
}

void vDSP_meanvD(const double *__A, vDSP_Stride __IA, double *__C, vDSP_Length __N)
{
}

void vDSP_minv(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
}

void vDSP_minvD(const double *__A, vDSP_Stride __IA, double *__C, vDSP_Length __N)
{
}

void vDSP_sve(const float *__A, vDSP_Stride __I, float *__C, vDSP_Length __N)
{
}

void vDSP_sveD(const double *__A, vDSP_Stride __I, double *__C, vDSP_Length __N)
{
}

void vDSP_vsub(const float *__B, vDSP_Stride __IB, const float *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vsubD(const double *__B, vDSP_Stride __IB, const double *__A, vDSP_Stride __IA, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_countUnit(void *a1, const char *a2, ...)
{
  return [a1 countUnit];
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return [a1 currentCalendar];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_deleteLogsForLiveOnUsers(void *a1, const char *a2, ...)
{
  return [a1 deleteLogsForLiveOnUsers];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_endDate(void *a1, const char *a2, ...)
{
  return [a1 endDate];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_getDateIntervalOfLastAnalysis(void *a1, const char *a2, ...)
{
  return [a1 getDateIntervalOfLastAnalysis];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_predicateFormat(void *a1, const char *a2, ...)
{
  return [a1 predicateFormat];
}

id objc_msgSend_quantity(void *a1, const char *a2, ...)
{
  return [a1 quantity];
}

id objc_msgSend_quantityType(void *a1, const char *a2, ...)
{
  return [a1 quantityType];
}

id objc_msgSend_startDate(void *a1, const char *a2, ...)
{
  return [a1 startDate];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_writeSamplesToJsonFile_withDateInterval_withOutputFilePath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeSamplesToJsonFile:withDateInterval:withOutputFilePath:");
}