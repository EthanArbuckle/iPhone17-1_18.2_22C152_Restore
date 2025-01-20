uint64_t TestCommConfig::castBaudRateToEnum(TestCommConfig *this)
{
  if ((int)this > 2399999)
  {
    if ((int)this > 3199999)
    {
      if (this == 3200000) {
        return 6;
      }
      if (this == 4800000) {
        return 7;
      }
    }
    else
    {
      if (this == 2400000) {
        return 4;
      }
      if (this == 3000000) {
        return 5;
      }
    }
    return 2;
  }
  if (this == 9600) {
    return 0;
  }
  if (this != 921600)
  {
    if (this == 1000000) {
      return 3;
    }
    return 2;
  }
  return 1;
}

uint64_t convertToHardwareEnum(char *a1)
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  std::string::basic_string[abi:ne180100]<0>(__p, "2");
  v52[0] = 10401;
  std::string::basic_string[abi:ne180100]<0>(v53, "fire3");
  int v54 = 10401;
  std::string::basic_string[abi:ne180100]<0>(v55, "5");
  int v56 = 10606;
  std::string::basic_string[abi:ne180100]<0>(v57, "fire6");
  int v58 = 10606;
  std::string::basic_string[abi:ne180100]<0>(v59, "6");
  int v60 = 10618;
  std::string::basic_string[abi:ne180100]<0>(v61, "fire7");
  int v62 = 10618;
  std::string::basic_string[abi:ne180100]<0>(v63, "3");
  int v64 = 21102;
  std::string::basic_string[abi:ne180100]<0>(v65, "ice18");
  int v66 = 21102;
  std::string::basic_string[abi:ne180100]<0>(v67, "4");
  __s = a1;
  int v68 = 21203;
  std::string::basic_string[abi:ne180100]<0>(v69, "ice19");
  v2 = 0;
  uint64_t v3 = 0;
  int v70 = 21203;
  v46 = 0;
  uint64_t v47 = 0;
  v45 = &v46;
  v4 = &v46;
  while (1)
  {
    v5 = &__p[32 * v3];
    v6 = &v46;
    if (v4 == &v46) {
      goto LABEL_8;
    }
    v7 = v2;
    v8 = &v46;
    if (v2)
    {
      do
      {
        v6 = (char **)v7;
        v7 = (char *)*((void *)v7 + 1);
      }
      while (v7);
    }
    else
    {
      do
      {
        v6 = (char **)v8[2];
        BOOL v9 = *v6 == (char *)v8;
        v8 = v6;
      }
      while (v9);
    }
    if (std::less<std::string>::operator()[abi:ne180100](v6 + 4, &__p[32 * v3]))
    {
LABEL_8:
      if (v2) {
        v10 = v6;
      }
      else {
        v10 = &v46;
      }
      if (v2) {
        v11 = (char ***)v6;
      }
      else {
        v11 = &v45;
      }
      if (v2) {
        v12 = v6 + 1;
      }
      else {
        v12 = &v46;
      }
      if (v11[1]) {
        goto LABEL_60;
      }
LABEL_27:
      v15 = (char *)operator new(0x40uLL);
      v16 = (std::string *)(v15 + 32);
      if ((char)v5[23] < 0)
      {
        std::string::__init_copy_ctor_external(v16, *(const std::string::value_type **)v5, *((void *)v5 + 1));
      }
      else
      {
        *(_OWORD *)&v16->__r_.__value_.__l.__data_ = *(_OWORD *)v5;
        *((void *)v15 + 6) = *((void *)v5 + 2);
      }
      *((_DWORD *)v15 + 14) = v52[8 * v3];
      *(void *)v15 = 0;
      *((void *)v15 + 1) = 0;
      *((void *)v15 + 2) = v10;
      *v12 = v15;
      if (*v45)
      {
        v45 = (char **)*v45;
        v15 = *v12;
      }
      v17 = v46;
      BOOL v9 = v15 == v46;
      v15[24] = v15 == v46;
      if (!v9)
      {
        do
        {
          uint64_t v18 = *((void *)v15 + 2);
          if (*(unsigned char *)(v18 + 24)) {
            break;
          }
          v19 = *(char **)(v18 + 16);
          uint64_t v20 = *(void *)v19;
          if (*(void *)v19 == v18)
          {
            uint64_t v23 = *((void *)v19 + 1);
            if (!v23 || (int v24 = *(unsigned __int8 *)(v23 + 24), v21 = (unsigned char *)(v23 + 24), v24))
            {
              if (*(char **)v18 == v15)
              {
                v25 = (uint64_t *)*((void *)v15 + 2);
              }
              else
              {
                v25 = *(uint64_t **)(v18 + 8);
                uint64_t v26 = *v25;
                *(void *)(v18 + 8) = *v25;
                if (v26)
                {
                  *(void *)(v26 + 16) = v18;
                  v19 = *(char **)(v18 + 16);
                }
                v25[2] = (uint64_t)v19;
                *(void *)(*(void *)(v18 + 16) + 8 * (**(void **)(v18 + 16) != v18)) = v25;
                uint64_t *v25 = v18;
                *(void *)(v18 + 16) = v25;
                v19 = (char *)v25[2];
                uint64_t v18 = *(void *)v19;
              }
              *((unsigned char *)v25 + 24) = 1;
              v19[24] = 0;
              uint64_t v29 = *(void *)(v18 + 8);
              *(void *)v19 = v29;
              if (v29) {
                *(void *)(v29 + 16) = v19;
              }
              *(void *)(v18 + 16) = *((void *)v19 + 2);
              *(void *)(*((void *)v19 + 2) + 8 * (**((void **)v19 + 2) != (void)v19)) = v18;
              *(void *)(v18 + 8) = v19;
              goto LABEL_58;
            }
          }
          else if (!v20 || (int v22 = *(unsigned __int8 *)(v20 + 24), v21 = (unsigned char *)(v20 + 24), v22))
          {
            if (*(char **)v18 == v15)
            {
              uint64_t v27 = *((void *)v15 + 1);
              *(void *)uint64_t v18 = v27;
              if (v27)
              {
                *(void *)(v27 + 16) = v18;
                v19 = *(char **)(v18 + 16);
              }
              *((void *)v15 + 2) = v19;
              *(void *)(*(void *)(v18 + 16) + 8 * (**(void **)(v18 + 16) != v18)) = v15;
              *((void *)v15 + 1) = v18;
              *(void *)(v18 + 16) = v15;
              v19 = (char *)*((void *)v15 + 2);
            }
            else
            {
              v15 = (char *)*((void *)v15 + 2);
            }
            v15[24] = 1;
            v19[24] = 0;
            uint64_t v18 = *((void *)v19 + 1);
            v28 = *(char **)v18;
            *((void *)v19 + 1) = *(void *)v18;
            if (v28) {
              *((void *)v28 + 2) = v19;
            }
            *(void *)(v18 + 16) = *((void *)v19 + 2);
            *(void *)(*((void *)v19 + 2) + 8 * (**((void **)v19 + 2) != (void)v19)) = v18;
            *(void *)uint64_t v18 = v19;
LABEL_58:
            *((void *)v19 + 2) = v18;
            break;
          }
          *(unsigned char *)(v18 + 24) = 1;
          v15 = v19;
          v19[24] = v19 == v17;
          unsigned char *v21 = 1;
        }
        while (v19 != v17);
      }
      ++v47;
      goto LABEL_60;
    }
    v12 = &v46;
    v10 = &v46;
    if (!v2) {
      goto LABEL_27;
    }
    v13 = v2;
    while (1)
    {
      while (1)
      {
        v10 = (char **)v13;
        v14 = v13 + 32;
        if (!std::less<std::string>::operator()[abi:ne180100](&__p[32 * v3], (void *)v13 + 4)) {
          break;
        }
        v13 = *v10;
        v12 = v10;
        if (!*v10) {
          goto LABEL_27;
        }
      }
      if (!std::less<std::string>::operator()[abi:ne180100](v14, &__p[32 * v3])) {
        break;
      }
      v13 = v10[1];
      if (!v13)
      {
        v12 = v10 + 1;
        goto LABEL_27;
      }
    }
LABEL_60:
    if (++v3 == 10) {
      break;
    }
    v4 = v45;
    v2 = v46;
  }
  uint64_t v30 = 40;
  v31 = __s;
  do
  {
    if (*((char *)&v46 + v30 * 8 + 7) < 0) {
      operator delete((&__s)[v30]);
    }
    v30 -= 4;
  }
  while (v30 * 8);
  std::string::basic_string[abi:ne180100]<0>(__p, v31);
  v32 = v46;
  if (!v46) {
    goto LABEL_76;
  }
  v33 = &v46;
  do
  {
    v34 = v33;
    v35 = v32 + 32;
    BOOL v36 = std::less<std::string>::operator()[abi:ne180100]((void *)v32 + 4, __p);
    v37 = v32 + 8;
    if (!v36)
    {
      v37 = v32;
      v33 = (char **)v32;
    }
    v32 = *(char **)v37;
  }
  while (*(void *)v37);
  if (v33 == &v46
    || (!v36 ? (v38 = v35) : (v38 = (char *)(v34 + 4)), std::less<std::string>::operator()[abi:ne180100](__p, v38)))
  {
LABEL_76:
    v33 = &v46;
  }
  if (v51 < 0) {
    operator delete(*(void **)__p);
  }
  v39 = GpsdLogObjectGeneral;
  if (&v46 == v33)
  {
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__p = 136315138;
      *(void *)&__p[4] = v31;
      _os_log_error_impl(&dword_237AFF000, v39, OS_LOG_TYPE_ERROR, "Failed to convert hardware type %s to hardware enum", __p, 0xCu);
    }
    uint64_t v42 = 0;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      v40 = v33 + 4;
      if (*((char *)v33 + 55) < 0) {
        v40 = (void *)*v40;
      }
      int v41 = *((_DWORD *)v33 + 14);
      *(_DWORD *)__p = 136315394;
      *(void *)&__p[4] = v40;
      __int16 v49 = 1024;
      int v50 = v41;
      _os_log_impl(&dword_237AFF000, v39, OS_LOG_TYPE_DEFAULT, "Converted hardware type %s to hardware enum %d", __p, 0x12u);
    }
    uint64_t v42 = *((unsigned int *)v33 + 14);
  }
  std::__tree<std::__value_type<std::string,GpsdPlatformInfoHardware::Hardware>,std::__map_value_compare<std::string,std::__value_type<std::string,GpsdPlatformInfoHardware::Hardware>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,GpsdPlatformInfoHardware::Hardware>>>::destroy(v46);
  return v42;
}

void sub_237B01728(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char *a11)
{
}

void GpsFactoryTest::GpsFactoryTest(GpsFactoryTest *this, const GpsFactoryTest::Options *a2)
{
  uint64_t v3 = GpsFactoryTest::Options::Options((std::string *)this, a2);
  *(_OWORD *)&v3[9].__r_.__value_.__r.__words[1] = xmmword_237B2FB20;
  v3[18].__r_.__value_.__r.__words[0] = 850045863;
  *(_OWORD *)&v3[10].__r_.__value_.__l.__data_ = 0u;
  *(_OWORD *)&v3[10].__r_.__value_.__r.__words[2] = 0u;
  v3[11].__r_.__value_.__l.__size_ = 0;
  v3[11].__r_.__value_.__r.__words[2] = 850045863;
  v3[14].__r_.__value_.__r.__words[2] = 0;
  *(_OWORD *)&v3[12].__r_.__value_.__l.__data_ = 0u;
  *(_OWORD *)&v3[12].__r_.__value_.__r.__words[2] = 0u;
  *(_OWORD *)&v3[13].__r_.__value_.__r.__words[1] = 0u;
  *(_OWORD *)((char *)&v3[13].__r_.__value_.__r.__words[2] + 1) = 0u;
  LODWORD(v3[15].__r_.__value_.__l.__data_) = 0;
  v3[15].__r_.__value_.__s.__data_[4] = 0;
  LODWORD(v3[15].__r_.__value_.__r.__words[1]) = 0;
  *(_OWORD *)&v3[15].__r_.__value_.__r.__words[2] = xmmword_237B2FB30;
  *(_OWORD *)&v3[16].__r_.__value_.__r.__words[1] = 0u;
  *(_OWORD *)&v3[17].__r_.__value_.__l.__data_ = 0u;
  v3[17].__r_.__value_.__r.__words[2] = 0;
  v3[33].__r_.__value_.__l.__size_ = 0;
  v3[22].__r_.__value_.__l.__size_ = 0;
  *(_OWORD *)&v3[21].__r_.__value_.__r.__words[2] = 0u;
  *(_OWORD *)&v3[21].__r_.__value_.__l.__data_ = 0u;
  *(_OWORD *)&v3[20].__r_.__value_.__r.__words[1] = 0u;
  *(_OWORD *)&v3[19].__r_.__value_.__r.__words[2] = 0u;
  *(_OWORD *)&v3[19].__r_.__value_.__l.__data_ = 0u;
  *(_OWORD *)&v3[18].__r_.__value_.__r.__words[1] = 0u;
  v4 = (id *)GpsdPreferences::instance(0);
  dispatch_qos_class_t v5 = GpsdPreferences::maxSchedulerQos(v4);
  v6 = dispatch_queue_attr_make_with_qos_class(0, v5, 0);
  if (!v6)
  {
    v7 = GpsdLogObjectWarning;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectWarning, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_237AFF000, v7, OS_LOG_TYPE_DEFAULT, "#spi,queue,nullattr", v8, 2u);
    }
  }
  *((void *)this + 100) = dispatch_queue_create("com.apple.gpsfactorytest", v6);
}

void sub_237B01914(_Unwind_Exception *a1)
{
  std::unique_ptr<VendorLogger>::reset[abi:ne180100]((VendorLogger **)(v1 + 536), 0);
  uint64_t v5 = *(void *)(v1 + 528);
  *(void *)(v1 + 528) = 0;
  if (v5) {
    (*(void (**)(uint64_t))(*(void *)v5 + 16))(v5);
  }
  if (*(char *)(v1 + 519) < 0) {
    operator delete(*(void **)(v1 + 496));
  }
  std::mutex::~mutex(v2);
  std::condition_variable::~condition_variable((std::condition_variable *)(v1 + 384));
  std::mutex::~mutex(v3);
  std::condition_variable::~condition_variable((std::condition_variable *)(v1 + 232));
  GpsFactoryTest::Options::~Options((void **)v1);
  _Unwind_Resume(a1);
}

void GpsFactoryTest::Options::~Options(void **this)
{
  if (*((char *)this + 223) < 0) {
    operator delete(this[25]);
  }
  if (*((char *)this + 199) < 0) {
    operator delete(this[22]);
  }
  if (*((char *)this + 167) < 0) {
    operator delete(this[18]);
  }
  if (*((char *)this + 47) < 0) {
    operator delete(this[3]);
  }
  if (*((char *)this + 23) < 0) {
    operator delete(*this);
  }
}

void GpsFactoryTest::~GpsFactoryTest(GpsFactoryTest *this)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v2 = (void *)*((void *)this + 65);
  if (v2)
  {
    int v3 = dlclose(v2);
    if (v3)
    {
      v4 = GpsdLogObjectGeneral;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
      {
        v6[0] = 67109120;
        v6[1] = v3;
        _os_log_error_impl(&dword_237AFF000, v4, OS_LOG_TYPE_ERROR, "dlclose failed with code %d", (uint8_t *)v6, 8u);
      }
    }
  }
  std::unique_ptr<VendorLogger>::reset[abi:ne180100]((VendorLogger **)this + 67, 0);
  uint64_t v5 = *((void *)this + 66);
  *((void *)this + 66) = 0;
  if (v5) {
    (*(void (**)(uint64_t))(*(void *)v5 + 16))(v5);
  }
  if (*((char *)this + 519) < 0) {
    operator delete(*((void **)this + 62));
  }
  std::mutex::~mutex((std::mutex *)((char *)this + 432));
  std::condition_variable::~condition_variable((std::condition_variable *)this + 8);
  std::mutex::~mutex((std::mutex *)((char *)this + 280));
  std::condition_variable::~condition_variable((std::condition_variable *)((char *)this + 232));
  if (*((char *)this + 223) < 0) {
    operator delete(*((void **)this + 25));
  }
  if (*((char *)this + 199) < 0) {
    operator delete(*((void **)this + 22));
  }
  if (*((char *)this + 167) < 0) {
    operator delete(*((void **)this + 18));
  }
  if (*((char *)this + 47) < 0) {
    operator delete(*((void **)this + 3));
  }
  if (*((char *)this + 23) < 0) {
    operator delete(*(void **)this);
  }
}

void sub_237B01B98(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  __clang_call_terminate(a1);
}

void __clang_call_terminate(void *a1)
{
}

void GpsFactoryTest::stop(GpsFactoryTest *this)
{
  v2 = (VendorLogger *)*((void *)this + 67);
  if (v2) {
    VendorLogger::flush(v2);
  }
  atomic_store(0, (unsigned __int8 *)this + 364);
  GpsFactoryTest::BasicTimer::wakeNow((GpsFactoryTest *)((char *)this + 224));
}

void GpsFactoryTest::flushLogs(GpsFactoryTest *this)
{
  uint64_t v1 = (VendorLogger *)*((void *)this + 67);
  if (v1) {
    VendorLogger::flush(v1);
  }
}

void GpsFactoryTest::BasicTimer::wakeNow(GpsFactoryTest::BasicTimer *this)
{
  v2 = (std::mutex *)((char *)this + 56);
  std::mutex::lock((std::mutex *)((char *)this + 56));
  *((unsigned char *)this + 120) = 1;
  std::condition_variable::notify_all((std::condition_variable *)((char *)this + 8));
  std::mutex::unlock(v2);
}

void GpsFactoryTest::deviceInterfaceCallback(uint64_t a1, unsigned int a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v4 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG))
  {
    unint64_t v5 = atomic_load((unint64_t *)(a1 + 376));
    if ((v5 & 0xFF00000000) == 0) {
      std::__throw_bad_optional_access[abi:ne180100]();
    }
    GpsFactoryTest::stringify(v5, v12);
    int v6 = v13;
    uint64_t v7 = (void **)v12[0];
    GpsFactoryTest::stringify(a2, __p);
    v8 = v12;
    if (v6 < 0) {
      v8 = v7;
    }
    if (v11 >= 0) {
      BOOL v9 = __p;
    }
    else {
      BOOL v9 = (void **)__p[0];
    }
    *(_DWORD *)buf = 136446466;
    v15 = v8;
    __int16 v16 = 2082;
    v17 = v9;
    _os_log_debug_impl(&dword_237AFF000, v4, OS_LOG_TYPE_DEBUG, "deviceInterfaceCallback,results,curent:%{public}s,new:%{public}s", buf, 0x16u);
    if (v11 < 0) {
      operator delete(__p[0]);
    }
    if (v13 < 0) {
      operator delete(v12[0]);
    }
  }
  atomic_store(a2 | 0x100000000, (unint64_t *)(a1 + 376));
  std::mutex::lock((std::mutex *)(a1 + 432));
  atomic_store(0, (unsigned int *)(a1 + 368));
  std::condition_variable::notify_all((std::condition_variable *)(a1 + 384));
  std::mutex::unlock((std::mutex *)(a1 + 432));
}

void sub_237B01DD4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *GpsFactoryTest::stringify@<X0>(unsigned int a1@<W1>, void *a2@<X8>)
{
  if (a1 > 8) {
    v2 = "unknown";
  }
  else {
    v2 = off_264CF0038[a1];
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

void GpsFactoryTest::mutateState(uint64_t a1, unsigned int a2)
{
  v4 = (std::mutex *)(a1 + 432);
  std::mutex::lock((std::mutex *)(a1 + 432));
  atomic_store(a2, (unsigned int *)(a1 + 368));
  std::condition_variable::notify_all((std::condition_variable *)(a1 + 384));
  std::mutex::unlock(v4);
}

void GpsFactoryTest::waitForIdle(GpsFactoryTest *this)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  int v2 = *((_DWORD *)this + 90);
  if (v2)
  {
    if (v2 < -1500) {
      return;
    }
    unsigned int v3 = (v2 + 2500) / 0x3E8u;
  }
  else
  {
    unsigned int v3 = 60;
  }
  signed int v4 = 0;
  uint64_t v20 = (void *)((char *)this + 496);
  double v5 = 0.0;
  do
  {
    __lk.__m_ = (std::unique_lock<std::mutex>::mutex_type *)((char *)this + 432);
    __lk.__owns_ = 1;
    std::mutex::lock((std::mutex *)((char *)this + 432));
    v6.__d_.__rep_ = std::chrono::steady_clock::now().__d_.__rep_ + 1000000000;
    while (atomic_load((unsigned int *)this + 92))
    {
      if (std::chrono::steady_clock::now().__d_.__rep_ >= v6.__d_.__rep_) {
        goto LABEL_23;
      }
      v8.__d_.__rep_ = v6.__d_.__rep_ - std::chrono::steady_clock::now().__d_.__rep_;
      if (v8.__d_.__rep_ >= 1)
      {
        std::chrono::steady_clock::now();
        v9.__d_.__rep_ = std::chrono::system_clock::now().__d_.__rep_;
        if (!v9.__d_.__rep_)
        {
          std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v10 = 0;
          goto LABEL_18;
        }
        if (v9.__d_.__rep_ < 1)
        {
          if ((unint64_t)v9.__d_.__rep_ >= 0xFFDF3B645A1CAC09) {
            goto LABEL_17;
          }
          std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v10 = 0x8000000000000000;
        }
        else
        {
          if ((unint64_t)v9.__d_.__rep_ > 0x20C49BA5E353F7)
          {
            std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v10 = 0x7FFFFFFFFFFFFFFFLL;
            goto LABEL_18;
          }
LABEL_17:
          std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v10 = 1000 * v9.__d_.__rep_;
LABEL_18:
          if (v10 > (v8.__d_.__rep_ ^ 0x7FFFFFFFFFFFFFFFLL))
          {
            v11.__d_.__rep_ = 0x7FFFFFFFFFFFFFFFLL;
LABEL_21:
            std::condition_variable::__do_timed_wait((std::condition_variable *)this + 8, &__lk, v11);
            std::chrono::steady_clock::now();
            goto LABEL_22;
          }
        }
        v11.__d_.__rep_ = v10 + v8.__d_.__rep_;
        goto LABEL_21;
      }
LABEL_22:
      if (std::chrono::steady_clock::now().__d_.__rep_ >= v6.__d_.__rep_)
      {
LABEL_23:
        if (atomic_load((unsigned int *)this + 92))
        {
          double v13 = (double)(std::chrono::steady_clock::now().__d_.__rep_ - *((void *)this + 28)) / 1000000000.0;
          double v14 = *((double *)this + 44);
          if (v5 >= v14) {
            double v14 = v5;
          }
          if (v13 > v14 + 60.0)
          {
            v15 = GpsdLogObjectGeneral;
            if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
            {
              __int16 v16 = v20;
              if (*((char *)this + 519) < 0) {
                __int16 v16 = (void *)*v20;
              }
              unsigned int v17 = atomic_load((unsigned int *)this + 92);
              uint64_t v18 = *((void *)this + 44);
              *(_DWORD *)buf = 136316162;
              uint64_t v23 = v16;
              __int16 v24 = 1024;
              int v25 = v4 + 1;
              __int16 v26 = 1024;
              unsigned int v27 = v3;
              __int16 v28 = 1024;
              unsigned int v29 = v17;
              __int16 v30 = 2048;
              uint64_t v31 = v18;
              _os_log_impl(&dword_237AFF000, v15, OS_LOG_TYPE_DEFAULT, "[TOOL  ] Running: %s,%d/%d,state,%d,lastHeartbeat,%.1f", buf, 0x28u);
            }
            double v5 = (double)(std::chrono::steady_clock::now().__d_.__rep_ - *((void *)this + 28)) / 1000000000.0;
          }
          if (v4 >= (int)(v3 - 1)) {
            atomic_store(0x100000006uLL, (unint64_t *)this + 47);
          }
          goto LABEL_36;
        }
        break;
      }
    }
    v19 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_237AFF000, v19, OS_LOG_TYPE_INFO, "waitForIdle,done", buf, 2u);
    }
LABEL_36:
    if (__lk.__owns_) {
      std::mutex::unlock(__lk.__m_);
    }
    ++v4;
  }
  while (v4 != v3);
}

double GpsFactoryTest::BasicTimer::get(GpsFactoryTest::BasicTimer *this)
{
  return (double)(std::chrono::steady_clock::now().__d_.__rep_ - *(void *)this) / 1000000000.0;
}

double GpsFactoryTest::BasicTimer::lastHeartbeat(GpsFactoryTest::BasicTimer *this)
{
  return *((double *)this + 16);
}

void GpsFactoryTest::waitForInit(GpsFactoryTest *this)
{
  v4.__m_ = (std::unique_lock<std::mutex>::mutex_type *)((char *)this + 432);
  v4.__owns_ = 1;
  std::mutex::lock((std::mutex *)((char *)this + 432));
  unsigned int v2 = atomic_load((unsigned int *)this + 92);
  if (v2 != 2)
  {
    do
    {
      std::condition_variable::wait((std::condition_variable *)this + 8, &v4);
      unsigned int v3 = atomic_load((unsigned int *)this + 92);
    }
    while (v3 != 2);
  }
  if (v4.__owns_) {
    std::mutex::unlock(v4.__m_);
  }
}

void GpsFactoryTest::printResult(GpsFactoryTest *this, const char *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  unint64_t v3 = atomic_load((unint64_t *)this + 47);
  if ((v3 & 0xFF00000000) != 0) {
    unsigned int v4 = v3;
  }
  else {
    unsigned int v4 = 7;
  }
  unint64_t v5 = atomic_load((unint64_t *)this + 47);
  if ((v5 & 0xFF00000000) != 0)
  {
    std::chrono::steady_clock::time_point v6 = GpsdLogObjectGeneral;
    if (v4 == 1)
    {
      if (!os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      std::string::basic_string[abi:ne180100]<0>(__p, "Success");
      if (v14 >= 0) {
        uint64_t v7 = __p;
      }
      else {
        uint64_t v7 = *(unsigned char **)__p;
      }
      std::chrono::steady_clock::time_point v8 = "unknown";
      if (a2) {
        std::chrono::steady_clock::time_point v8 = a2;
      }
      *(_DWORD *)buf = 136315394;
      __int16 v16 = v7;
      __int16 v17 = 2080;
      uint64_t v18 = v8;
      _os_log_impl(&dword_237AFF000, v6, OS_LOG_TYPE_DEFAULT, "[TOOL  ] %s, %s", buf, 0x16u);
    }
    else
    {
      if (!os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR)) {
        return;
      }
      GpsFactoryTest::stringify(v4, __p);
      if (v14 >= 0) {
        std::chrono::time_point<std::chrono::system_clock, std::chrono::duration<long long, std::ratio<1, 1000000000>>> v11 = __p;
      }
      else {
        std::chrono::time_point<std::chrono::system_clock, std::chrono::duration<long long, std::ratio<1, 1000000000>>> v11 = *(unsigned char **)__p;
      }
      v12 = "unknown";
      if (a2) {
        v12 = a2;
      }
      *(_DWORD *)buf = 136315394;
      __int16 v16 = v11;
      __int16 v17 = 2080;
      uint64_t v18 = v12;
      _os_log_error_impl(&dword_237AFF000, v6, OS_LOG_TYPE_ERROR, "[TOOL  ] %s, %s", buf, 0x16u);
    }
    if (v14 < 0) {
      operator delete(*(void **)__p);
    }
  }
  else
  {
    std::chrono::system_clock::time_point v9 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v10 = "unknown";
      if (a2) {
        std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v10 = a2;
      }
      *(_DWORD *)__p = 136315138;
      *(void *)&__p[4] = v10;
      _os_log_impl(&dword_237AFF000, v9, OS_LOG_TYPE_DEFAULT, "[TOOL  ] %s", __p, 0xCu);
    }
  }
}

void GpsFactoryTest::waitForIdleAndPrintResult(GpsFactoryTest *this, const char *a2)
{
  GpsFactoryTest::waitForIdle(this);
  GpsFactoryTest::printResult(this, a2);
}

void GpsFactoryTest::constructDevice(GpsFactoryTest *this)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  unsigned int v2 = GpsdLogObjectGeneral;
  BOOL v3 = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    int buf = 136315394;
    double buf_4 = COERCE_DOUBLE("constructDevice");
    __int16 v21 = 2048;
    double v22 = COERCE_DOUBLE(gpsd::util::getMachContinuousTimeNs((gpsd::util *)v3));
    _os_log_impl(&dword_237AFF000, v2, OS_LOG_TYPE_DEFAULT, "#gpsd,%s,timesync,machContNs,%llu", (uint8_t *)&buf, 0x16u);
  }
  if (!*((void *)this + 66))
  {
    unint64_t v5 = (void *)*((void *)this + 65);
    if (!v5)
    {
      std::chrono::steady_clock::time_point v6 = (const char **)((char *)this + 24);
      uint64_t v7 = (char *)this + 24;
      if (*((char *)this + 47) < 0) {
        uint64_t v7 = *v6;
      }
      unint64_t v5 = dlopen(v7, 4);
      *((void *)this + 65) = v5;
      if (!v5)
      {
        std::chrono::steady_clock::time_point v8 = GpsdLogObjectGeneral;
        if (!os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_31;
        }
        if (*((char *)this + 47) < 0) {
          std::chrono::steady_clock::time_point v6 = (const char **)*v6;
        }
        std::chrono::system_clock::time_point v9 = dlerror();
        int buf = 136315394;
        double buf_4 = *(double *)&v6;
        __int16 v21 = 2080;
        double v22 = *(double *)&v9;
        _os_log_impl(&dword_237AFF000, v8, OS_LOG_TYPE_DEFAULT, "could not dlopen %s due to %s", (uint8_t *)&buf, 0x16u);
        unint64_t v5 = (void *)*((void *)this + 65);
        if (!v5) {
LABEL_31:
        }
          __assert_rtn("constructDevice", "GpsFactoryTest.mm", 239, "fGnssDeviceLibraryHandle && \"Could not open dylib\"");
      }
    }
    if (dlsym(v5, "newGnssDeviceTest"))
    {
      int v18 = 0;
      v16[0] = 0;
      v16[1] = 0;
      uint64_t v17 = 0;
      if (gpsd::util::getVersionNumberFromDylib(*((gpsd::util **)this + 65), &v18, v10)
        && gpsd::util::getVersionStringFromDylib(*((void **)this + 65), (uint64_t)v16))
      {
        std::chrono::time_point<std::chrono::system_clock, std::chrono::duration<long long, std::ratio<1, 1000000000>>> v11 = GpsdLogObjectGeneral;
        if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
        {
          v12 = v16;
          if (v17 < 0) {
            v12 = (void **)v16[0];
          }
          int buf = 134218242;
          double buf_4 = (double)v18 * 0.01;
          __int16 v21 = 2080;
          double v22 = *(double *)&v12;
          _os_log_impl(&dword_237AFF000, v11, OS_LOG_TYPE_DEFAULT, "[TOOL] gnss::Device version %.2f, %s", (uint8_t *)&buf, 0x16u);
        }
        int v13 = v18;
        if (v18 == 2502) {
          operator new();
        }
        v15 = GpsdLogObjectGeneral;
        if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
        {
          int buf = 134218240;
          double buf_4 = 25.02;
          __int16 v21 = 2048;
          double v22 = (double)v13 * 0.01;
          _os_log_error_impl(&dword_237AFF000, v15, OS_LOG_TYPE_ERROR, "[TOOL] gnss::Device version mismatch: local=%.2f, dylib=%.2f", (uint8_t *)&buf, 0x16u);
        }
        exit(-1);
      }
      char v14 = GpsdLogObjectGeneral;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf) = 0;
        _os_log_error_impl(&dword_237AFF000, v14, OS_LOG_TYPE_ERROR, "[TOOL] version number/string dlsym failed", (uint8_t *)&buf, 2u);
      }
      exit(-1);
    }
    __assert_rtn("constructDevice", "GpsFactoryTest.mm", 244, "newGnssDeviceTest && \"newGnssDeviceTest is null\"");
  }
  unsigned int v4 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    int buf = 136315138;
    double buf_4 = COERCE_DOUBLE("constructDevice");
    _os_log_impl(&dword_237AFF000, v4, OS_LOG_TYPE_DEFAULT, "%s, already constructed", (uint8_t *)&buf, 0xCu);
  }
}

void sub_237B039C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,void *a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,void *a41,void *__p,uint64_t a43,int a44,__int16 a45,char a46,char a47)
{
  MEMORY[0x237E29950](v47, 0x10B3C408487180ALL);
  if (a47 < 0) {
    operator delete(__p);
  }
  JUMPOUT(0x237B03E7CLL);
}

void sub_237B03BD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47)
{
}

void sub_237B03C04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47)
{
  std::__function::__value_func<void ()(int,std::string)>::~__value_func[abi:ne180100]((void *)(v47 + 40));
  std::__function::__value_func<void ()(GnssHal::ExtensionsOlaf::LtlInfoRequest const&,std::function<void ()(GnssHal::ExtensionsOlaf::LtlInfo const&)>)>::~__value_func[abi:ne180100]((void *)(v47 + 8));
  std::__function::__value_func<void ()(int,std::string)>::~__value_func[abi:ne180100](&a41);
  std::__function::__value_func<void ()(GnssHal::ExtensionsOlaf::LtlInfoRequest const&,std::function<void ()(GnssHal::ExtensionsOlaf::LtlInfo const&)>)>::~__value_func[abi:ne180100](&a47);
  MEMORY[0x237E29950](v47, 0x10A1C406C057149);
  JUMPOUT(0x237B03EA8);
}

void sub_237B03C4C()
{
  MEMORY[0x237E29950](v0, 0x10B3C4086D85886);
  JUMPOUT(0x237B03EFCLL);
}

void sub_237B03CF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,void *a33,uint64_t a34,int a35,__int16 a36,char a37,char a38)
{
  MEMORY[0x237E29950](v38, 0x10F2C4084379287);
  if (a38 < 0) {
    operator delete(a33);
  }
  _Unwind_Resume(a1);
}

void sub_237B03D14()
{
}

void sub_237B03D1C()
{
}

void sub_237B03D64(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,void *a24,uint64_t a25,int a26,__int16 a27,char a28,char a29)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  if (a23 < 0) {
    operator delete(a18);
  }
  if (a29 < 0) {
    operator delete(a24);
  }
  JUMPOUT(0x237B03E54);
}

void sub_237B03D7C(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,void *__p,uint64_t a42,int a43,__int16 a44,char a45,char a46)
{
  if (a2)
  {
    __cxa_begin_catch(a1);
    if (a46 < 0) {
      operator delete(__p);
    }
    __cxa_rethrow();
  }
  JUMPOUT(0x237B03F4CLL);
}

void sub_237B03DA4()
{
}

void sub_237B03DC8(void *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  JUMPOUT(0x237B03F4CLL);
}

void sub_237B03DF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *__p,uint64_t a25,int a26,__int16 a27,char a28,char a29,void *a30,uint64_t a31,int a32,__int16 a33,char a34,char a35,void *a36,uint64_t a37,int a38,__int16 a39,char a40,char a41,void *a42,uint64_t a43,int a44,__int16 a45,char a46,char a47)
{
  if (a29 < 0) {
    operator delete(__p);
  }
  if (a35 < 0) {
    operator delete(a30);
  }
  if (a41 < 0) {
    operator delete(a36);
  }
  if (a47 < 0) {
    operator delete(a42);
  }
  _Unwind_Resume(a1);
}

void sub_237B03E50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,void *__p,uint64_t a34,int a35,__int16 a36,char a37,char a38)
{
  (*(void (**)(uint64_t))(*(void *)v41 + 8))(v41);
  if (v40) {
    (*(void (**)(uint64_t))(*(void *)v40 + 8))(v40);
  }
  if (a10) {
    (*(void (**)(uint64_t))(*(void *)a10 + 8))(a10);
  }
  (*(void (**)(uint64_t))(*(void *)v39 + 8))(v39);
  (*(void (**)(uint64_t))(*(void *)v38 + 8))(v38);
  if (a38 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void sub_237B03F30()
{
}

uint64_t *std::ifstream::basic_ifstream(uint64_t *a1)
{
  uint64_t v2 = MEMORY[0x263F8C308] + 64;
  a1[53] = MEMORY[0x263F8C308] + 64;
  BOOL v3 = a1 + 2;
  uint64_t v4 = *(void *)(MEMORY[0x263F8C2A8] + 16);
  uint64_t v5 = *(void *)(MEMORY[0x263F8C2A8] + 8);
  *a1 = v5;
  *(uint64_t *)((char *)a1 + *(void *)(v5 - 24)) = v4;
  a1[1] = 0;
  std::chrono::steady_clock::time_point v6 = (std::ios_base *)((char *)a1 + *(void *)(*a1 - 24));
  std::ios_base::init(v6, a1 + 2);
  uint64_t v7 = MEMORY[0x263F8C308] + 24;
  v6[1].__vftable = 0;
  v6[1].__fmtflags_ = -1;
  *a1 = v7;
  a1[53] = v2;
  MEMORY[0x237E29680](v3);
  if (!std::filebuf::open()) {
    std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | 4);
  }
  return a1;
}

void sub_237B040E0(_Unwind_Exception *a1)
{
  std::istream::~istream();
  MEMORY[0x237E298C0](v1);
  _Unwind_Resume(a1);
}

void *std::ifstream::~ifstream(void *a1)
{
  uint64_t v2 = MEMORY[0x263F8C2A8];
  uint64_t v3 = *MEMORY[0x263F8C2A8];
  *a1 = *MEMORY[0x263F8C2A8];
  *(void *)((char *)a1 + *(void *)(v3 - 24)) = *(void *)(v2 + 24);
  MEMORY[0x237E29690](a1 + 2);
  std::istream::~istream();
  MEMORY[0x237E298C0](a1 + 53);
  return a1;
}

uint64_t GpsFactoryTest::getDylibInterfaceVersion(GpsFactoryTest *this)
{
  return (***((uint64_t (****)(void))this + 66))(*((void *)this + 66));
}

void GpsFactoryTest::destructDevice(GpsFactoryTest *this)
{
  uint64_t v2 = (VendorLogger *)*((void *)this + 67);
  if (v2) {
    VendorLogger::prepareForTermination(v2);
  }
  std::mutex::lock((std::mutex *)((char *)this + 432));
  atomic_store(0, (unsigned int *)this + 92);
  std::condition_variable::notify_all((std::condition_variable *)this + 8);
  std::mutex::unlock((std::mutex *)((char *)this + 432));
  atomic_store(0x100000001uLL, (unint64_t *)this + 47);
}

void GpsFactoryTest::fixCallback(uint64_t a1, uint64_t *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a2;
  uint64_t v4 = GpsdLogObjectGeneral;
  BOOL v5 = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      GpsFactoryTest::stringify(a1, v3, &__p);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        p_p = &__p;
      }
      else {
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      }
      *(_DWORD *)int buf = 136315138;
      std::chrono::system_clock::time_point v9 = p_p;
      _os_log_impl(&dword_237AFF000, v4, OS_LOG_TYPE_DEFAULT, "[FIX   ] %s", buf, 0xCu);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
    }
    GpsFactoryTest::BasicTimer::heartbeat((GpsFactoryTest::BasicTimer *)(a1 + 224));
  }
  else if (v5)
  {
    LOWORD(__p.__r_.__value_.__l.__data_) = 0;
    _os_log_impl(&dword_237AFF000, v4, OS_LOG_TYPE_DEFAULT, "[WARN  ] null gnss::Fix", (uint8_t *)&__p, 2u);
  }
}

void GpsFactoryTest::stringify(uint64_t a1@<X0>, uint64_t a2@<X1>, std::string *a3@<X8>)
{
  GpsFactoryTest::stringify(a1, a2, &v21);
  std::chrono::steady_clock::time_point v6 = std::string::append(&v21, ", ");
  long long v7 = *(_OWORD *)&v6->__r_.__value_.__l.__data_;
  v22.__r_.__value_.__r.__words[2] = v6->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v22.__r_.__value_.__l.__data_ = v7;
  v6->__r_.__value_.__l.__size_ = 0;
  v6->__r_.__value_.__r.__words[2] = 0;
  v6->__r_.__value_.__r.__words[0] = 0;
  GpsFactoryTest::stringify(a1, a2 + 48, v19);
  if ((v20 & 0x80u) == 0) {
    std::chrono::steady_clock::time_point v8 = v19;
  }
  else {
    std::chrono::steady_clock::time_point v8 = (void **)v19[0];
  }
  if ((v20 & 0x80u) == 0) {
    std::string::size_type v9 = v20;
  }
  else {
    std::string::size_type v9 = (std::string::size_type)v19[1];
  }
  uint64_t v10 = std::string::append(&v22, (const std::string::value_type *)v8, v9);
  long long v11 = *(_OWORD *)&v10->__r_.__value_.__l.__data_;
  v23.__r_.__value_.__r.__words[2] = v10->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v23.__r_.__value_.__l.__data_ = v11;
  v10->__r_.__value_.__l.__size_ = 0;
  v10->__r_.__value_.__r.__words[2] = 0;
  v10->__r_.__value_.__r.__words[0] = 0;
  v12 = std::string::append(&v23, ", ");
  long long v13 = *(_OWORD *)&v12->__r_.__value_.__l.__data_;
  v24.__r_.__value_.__r.__words[2] = v12->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v24.__r_.__value_.__l.__data_ = v13;
  v12->__r_.__value_.__l.__size_ = 0;
  v12->__r_.__value_.__r.__words[2] = 0;
  v12->__r_.__value_.__r.__words[0] = 0;
  GpsFactoryTest::stringify(a1, (double *)(a2 + 136), __p);
  if ((v18 & 0x80u) == 0) {
    char v14 = __p;
  }
  else {
    char v14 = (void **)__p[0];
  }
  if ((v18 & 0x80u) == 0) {
    std::string::size_type v15 = v18;
  }
  else {
    std::string::size_type v15 = (std::string::size_type)__p[1];
  }
  __int16 v16 = std::string::append(&v24, (const std::string::value_type *)v14, v15);
  *a3 = *v16;
  v16->__r_.__value_.__l.__size_ = 0;
  v16->__r_.__value_.__r.__words[2] = 0;
  v16->__r_.__value_.__r.__words[0] = 0;
  if ((char)v18 < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v24.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v23.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v23.__r_.__value_.__l.__data_);
  }
  if ((char)v20 < 0) {
    operator delete(v19[0]);
  }
  if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v22.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v21.__r_.__value_.__l.__data_);
  }
}

void sub_237B04514(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (*(char *)(v33 - 41) < 0) {
    operator delete(*(void **)(v33 - 64));
  }
  if (*(char *)(v33 - 73) < 0) {
    operator delete(*(void **)(v33 - 96));
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (a33 < 0) {
    operator delete(a28);
  }
  if (a27 < 0) {
    operator delete(a22);
  }
  _Unwind_Resume(exception_object);
}

void GpsFactoryTest::BasicTimer::heartbeat(GpsFactoryTest::BasicTimer *this)
{
  uint64_t v2 = (std::mutex *)((char *)this + 56);
  std::mutex::lock((std::mutex *)((char *)this + 56));
  *((double *)this + 16) = (double)(std::chrono::steady_clock::now().__d_.__rep_ - *(void *)this) / 1000000000.0;
  std::mutex::unlock(v2);
}

void GpsFactoryTest::rfMeasurementCallback(uint64_t a1, unsigned __int8 **a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  if (*a2 != v4)
  {
    do
    {
      BOOL v5 = GpsdLogObjectGeneral;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      {
        GpsFactoryTest::stringify(*v3, __p);
        if (v12 >= 0) {
          std::chrono::steady_clock::time_point v6 = __p;
        }
        else {
          std::chrono::steady_clock::time_point v6 = (void **)__p[0];
        }
        int v7 = *((_DWORD *)v3 + 1);
        uint64_t v8 = *((void *)v3 + 1);
        uint64_t v9 = *((void *)v3 + 2);
        uint64_t v10 = *((void *)v3 + 3);
        *(_DWORD *)int buf = 136316162;
        char v14 = v6;
        __int16 v15 = 1024;
        int v16 = v7;
        __int16 v17 = 2048;
        uint64_t v18 = v8;
        __int16 v19 = 2048;
        uint64_t v20 = v9;
        __int16 v21 = 2048;
        uint64_t v22 = v10;
        _os_log_impl(&dword_237AFF000, v5, OS_LOG_TYPE_DEFAULT, "[RFMEAS] %s.%d, %.2f dB-Hz, %.2f dBm, %.2f Hz offset", buf, 0x30u);
        if (v12 < 0) {
          operator delete(__p[0]);
        }
      }
      v3 += 40;
    }
    while (v3 != v4);
  }
  GpsFactoryTest::BasicTimer::heartbeat((GpsFactoryTest::BasicTimer *)(a1 + 224));
}

void *GpsFactoryTest::stringify@<X0>(int a1@<W1>, void *a2@<X8>)
{
  if ((a1 - 1) > 9) {
    uint64_t v2 = "unknown";
  }
  else {
    uint64_t v2 = off_264CF0080[(char)(a1 - 1)];
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

void GpsFactoryTest::loobackResultCallback()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  uint64_t v0 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136315138;
    uint64_t v2 = "loobackResultCallback";
    _os_log_impl(&dword_237AFF000, v0, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v1, 0xCu);
  }
}

void GpsFactoryTest::EventNotificationCb()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  uint64_t v0 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136315138;
    uint64_t v2 = "EventNotificationCb";
    _os_log_impl(&dword_237AFF000, v0, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v1, 0xCu);
  }
}

void GpsFactoryTest::commPingCallback(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  BOOL v5 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    if (*((char *)a2 + 23) >= 0) {
      std::chrono::steady_clock::time_point v6 = a2;
    }
    else {
      std::chrono::steady_clock::time_point v6 = (uint64_t *)*a2;
    }
    if (*((char *)a3 + 23) >= 0) {
      int v7 = a3;
    }
    else {
      int v7 = (uint64_t *)*a3;
    }
    int v8 = 136315394;
    uint64_t v9 = v6;
    __int16 v10 = 2080;
    long long v11 = v7;
    _os_log_impl(&dword_237AFF000, v5, OS_LOG_TYPE_DEFAULT, "[EVENT ] commPing result: version %s, serial %s", (uint8_t *)&v8, 0x16u);
  }
}

uint64_t GpsFactoryTest::run(GpsFactoryTest *this)
{
  uint64_t v2 = *((void *)this + 100);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = ___ZN14GpsFactoryTest3runEv_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = this;
  dispatch_sync(v2, block);
  uint64_t v3 = (char *)this + 496;
  if (*((char *)this + 519) < 0) {
    uint64_t v3 = *(const char **)v3;
  }
  GpsFactoryTest::waitForIdle(this);
  GpsFactoryTest::printResult(this, v3);
  sleep(1u);
  unint64_t v4 = atomic_load((unint64_t *)this + 47);
  if ((v4 & 0xFF00000000) != 0) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 7;
  }
  GpsFactoryTest::destructDevice(this);
  return v5;
}

void *___ZN14GpsFactoryTest3runEv_block_invoke(uint64_t a1)
{
  return GpsFactoryTest::runInternal(*(GpsFactoryTest **)(a1 + 32));
}

void *GpsFactoryTest::runInternal(GpsFactoryTest *this)
{
  v97[4] = *MEMORY[0x263EF8340];
  atomic_store(1u, (unsigned __int8 *)this + 364);
  *((std::chrono::steady_clock::time_point *)this + 28) = std::chrono::steady_clock::now();
  *((void *)this + 44) = 0;
  GpsFactoryTest::constructDevice(this);
  v97[0] = &unk_26EAA7170;
  v97[1] = this;
  v97[3] = v97;
  if (*((unsigned char *)this + 74))
  {
    std::mutex::lock((std::mutex *)((char *)this + 432));
    atomic_store(1u, (unsigned int *)this + 92);
    std::condition_variable::notify_all((std::condition_variable *)this + 8);
    std::mutex::unlock((std::mutex *)((char *)this + 432));
    *((unsigned char *)this + 74) = 0;
    uint64_t v2 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int buf = 0;
      _os_log_impl(&dword_237AFF000, v2, OS_LOG_TYPE_DEFAULT, "[EVENT ] starting test: commPing", buf, 2u);
    }
    uint64_t v3 = *((void *)this + 66);
    uint64_t v4 = *((unsigned int *)this + 33);
    v96[0] = &unk_26EAA71F0;
    v96[1] = this;
    v96[3] = v96;
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v95, (uint64_t)v97);
    (*(void (**)(uint64_t, uint64_t, void *, void *))(*(void *)v3 + 88))(v3, v4, v96, v95);
    std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v95);
    std::__function::__value_func<void ()(std::string const&,std::string const&)>::~__value_func[abi:ne180100](v96);
    *((_DWORD *)this + 90) = *((_DWORD *)this + 33);
    MEMORY[0x237E295A0]((char *)this + 496, "commPing");
    return std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v97);
  }
  if (*((unsigned char *)this + 65))
  {
    uint64_t v5 = (id *)GpsdPreferences::instance(0);
    if (!GpsdPreferences::nmeaMaskOverride(v5)
      && (*(_DWORD *)(GpsdPlatformInfo::instance(0) + 8) - 201) >= 2)
    {
      GpsdPlatformInfo::instance(0);
    }
    uint64_t v6 = *((void *)this + 66);
    v94[0] = &unk_26EAA7280;
    v94[3] = v94;
    v93[0] = &unk_26EAA7310;
    v93[3] = v93;
    (*(void (**)(uint64_t))(*(void *)v6 + 96))(v6);
    std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v93);
    std::__function::__value_func<void ()(std::vector<std::string> &&)>::~__value_func[abi:ne180100](v94);
    GpsFactoryTest::waitForIdle(this);
  }
  unsigned int v7 = *(_DWORD *)(GpsdPlatformInfo::instance(0) + 8) - 103;
  BOOL v8 = v7 > 4;
  int v9 = (1 << v7) & 0x19;
  if (!v8 && v9 != 0)
  {
    if (*((unsigned char *)this + 80))
    {
      int v11 = *((_DWORD *)this + 19);
      if (v11 == 13)
      {
        unsigned int v12 = 1;
        goto LABEL_27;
      }
      if (v11 == 14)
      {
        unsigned int v12 = 2;
        goto LABEL_27;
      }
      __int16 v15 = GpsdLogObjectGeneral;
      unsigned int v12 = 0;
      if (!os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      {
LABEL_27:
        if (*((unsigned char *)this + 87)) {
          unsigned int v14 = *((unsigned __int8 *)this + 86);
        }
        else {
          unsigned int v14 = 0;
        }
        goto LABEL_30;
      }
      *(_DWORD *)int buf = 67109120;
      LODWORD(v79) = v11;
      _os_log_impl(&dword_237AFF000, v15, OS_LOG_TYPE_DEFAULT, "[EVENT ] Unknown LTE filter band %d", buf, 8u);
    }
    unsigned int v12 = 0;
    goto LABEL_27;
  }
  if (*((unsigned char *)this + 80) || *((unsigned char *)this + 87))
  {
    long long v13 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int buf = 0;
      _os_log_error_impl(&dword_237AFF000, v13, OS_LOG_TYPE_ERROR, "[EVENT ] LTE filter / blanking only supported in FIRE", buf, 2u);
    }
  }
  unsigned int v14 = 0;
  unsigned int v12 = 0;
LABEL_30:
  if (v12 | ((unint64_t)v14 << 8))
  {
    int v16 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)int buf = 134218752;
      *(void *)&long long v79 = v12 | ((unint64_t)v14 << 8);
      WORD4(v79) = 1024;
      *(_DWORD *)((char *)&v79 + 10) = v12;
      HIWORD(v79) = 1024;
      *(_DWORD *)v80 = v14;
      *(_WORD *)&v80[4] = 1024;
      v81[0] = 0;
      _os_log_impl(&dword_237AFF000, v16, OS_LOG_TYPE_DEFAULT, "[TOOL  ] coexConfig,val,0x%llx,lte,%d,blanking,%d,bitmask,0x%x", buf, 0x1Eu);
    }
    uint64_t v17 = *((void *)this + 66);
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v92, (uint64_t)v97);
    (*(void (**)(uint64_t, unint64_t, void *))(*(void *)v17 + 104))(v17, v12 | ((unint64_t)v14 << 8), v92);
    std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v92);
    GpsFactoryTest::waitForIdle(this);
  }
  if (*((unsigned char *)this + 68) || *((unsigned char *)this + 69))
  {
    uint64_t v18 = GpsdPlatformInfo::instance(0);
    uint64_t NoiseFigure = GpsdPlatformInfo::getNoiseFigure(v18, *((unsigned __int8 *)this + 104));
    uint64_t v20 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int buf = 0;
      _os_log_impl(&dword_237AFF000, v20, OS_LOG_TYPE_DEFAULT, "[INFO  ] C/N0 measured at correlator; RSSI referred to antenna port: C/N0 - 174 + NF",
        buf,
        2u);
      uint64_t v20 = GpsdLogObjectGeneral;
    }
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
    if ((NoiseFigure & 0xFF00000000) != 0)
    {
      if (!v21) {
        goto LABEL_44;
      }
      *(_DWORD *)int buf = 134217984;
      *(double *)&long long v79 = *(float *)&NoiseFigure;
      uint64_t v22 = "[INFO  ] Noise Figure: %.1f dB";
      uint64_t v23 = v20;
      uint32_t v24 = 12;
    }
    else
    {
      if (!v21) {
        goto LABEL_44;
      }
      *(_WORD *)int buf = 0;
      uint64_t v22 = "[INFO  ] Noise Figure: unknown";
      uint64_t v23 = v20;
      uint32_t v24 = 2;
    }
    _os_log_impl(&dword_237AFF000, v23, OS_LOG_TYPE_DEFAULT, v22, buf, v24);
  }
LABEL_44:
  if (*((unsigned char *)this + 67))
  {
    std::mutex::lock((std::mutex *)((char *)this + 432));
    atomic_store(1u, (unsigned int *)this + 92);
    std::condition_variable::notify_all((std::condition_variable *)this + 8);
    std::mutex::unlock((std::mutex *)((char *)this + 432));
    *((unsigned char *)this + 67) = 0;
    int v25 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int buf = 0;
      _os_log_impl(&dword_237AFF000, v25, OS_LOG_TYPE_DEFAULT, "[EVENT ] starting test: PERIODIC", buf, 2u);
    }
    uint64_t v26 = *((void *)this + 66);
    uint64_t v27 = *((unsigned int *)this + 22);
    v91[0] = &unk_26EAA7390;
    v91[1] = this;
    v91[3] = v91;
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v90, (uint64_t)v97);
    (*(void (**)(uint64_t, uint64_t, void *, void *))(*(void *)v26 + 24))(v26, v27, v91, v90);
    std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v90);
    std::__function::__value_func<void ()(std::unique_ptr<gnss::Fix>)>::~__value_func[abi:ne180100](v91);
    int v28 = *((_DWORD *)this + 22);
    if (v28 < 1)
    {
      if (v28 == -1)
      {
        std::mutex::lock((std::mutex *)((char *)this + 432));
        atomic_store(1u, (unsigned int *)this + 92);
        std::condition_variable::notify_all((std::condition_variable *)this + 8);
        std::mutex::unlock((std::mutex *)((char *)this + 432));
      }
    }
    else if ((*(_DWORD *)(GpsdPlatformInfo::instance(0) + 8) - 201) <= 1)
    {
      sleep(*((_DWORD *)this + 22) + 1);
    }
    *((_DWORD *)this + 90) = 1000 * *((_DWORD *)this + 22);
    uint64_t v32 = "periodic";
    goto LABEL_64;
  }
  if (*((unsigned char *)this + 68))
  {
    std::mutex::lock((std::mutex *)((char *)this + 432));
    atomic_store(1u, (unsigned int *)this + 92);
    std::condition_variable::notify_all((std::condition_variable *)this + 8);
    std::mutex::unlock((std::mutex *)((char *)this + 432));
    *((unsigned char *)this + 68) = 0;
    unsigned int v29 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int buf = 0;
      _os_log_impl(&dword_237AFF000, v29, OS_LOG_TYPE_DEFAULT, "[EVENT ] starting test: CW", buf, 2u);
    }
    uint64_t v30 = *((unsigned __int8 *)this + 104);
    if (v30 == 4)
    {
      uint64_t v31 = *((unsigned int *)this + 27);
    }
    else
    {
      uint64_t v31 = 0;
      *((_DWORD *)this + 27) = 0;
    }
    uint64_t v39 = *((void *)this + 66);
    uint64_t v40 = *((unsigned int *)this + 23);
    int v41 = *((_DWORD *)this + 24);
    uint64_t v42 = *((unsigned int *)this + 25);
    v89[0] = &unk_26EAA7420;
    v89[1] = this;
    v89[3] = v89;
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v88, (uint64_t)v97);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void *, void *, double))(*(void *)v39 + 32))(v39, v40, v30, v31, v42, v89, v88, (double)v41);
    std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v88);
    std::__function::__value_func<void ()(std::vector<gnssTest::RfMeasurement>)>::~__value_func[abi:ne180100](v89);
    *((_DWORD *)this + 90) = 1000 * *((_DWORD *)this + 23);
    uint64_t v32 = "cw";
    goto LABEL_64;
  }
  if (*((unsigned char *)this + 69))
  {
    std::mutex::lock((std::mutex *)((char *)this + 432));
    atomic_store(1u, (unsigned int *)this + 92);
    std::condition_variable::notify_all((std::condition_variable *)this + 8);
    std::mutex::unlock((std::mutex *)((char *)this + 432));
    *((unsigned char *)this + 69) = 0;
    uint64_t v33 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int buf = 0;
      _os_log_impl(&dword_237AFF000, v33, OS_LOG_TYPE_DEFAULT, "[EVENT ] *** starting test: modulated", buf, 2u);
    }
    uint64_t v34 = *((void *)this + 66);
    uint64_t v35 = *((unsigned __int8 *)this + 104);
    uint64_t v36 = *((unsigned int *)this + 27);
    uint64_t v37 = *((unsigned int *)this + 28);
    uint64_t v38 = *((unsigned int *)this + 25);
    v87[0] = &unk_26EAA74B0;
    v87[1] = this;
    v87[3] = v87;
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v86, (uint64_t)v97);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void *, void *))(*(void *)v34 + 40))(v34, v37, v35, v36, v38, v87, v86);
    std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v86);
    std::__function::__value_func<void ()(std::vector<gnssTest::RfMeasurement>)>::~__value_func[abi:ne180100](v87);
    *((_DWORD *)this + 90) = 1000 * *((_DWORD *)this + 28);
    uint64_t v32 = "modulated";
    goto LABEL_64;
  }
  if (*((unsigned char *)this + 70))
  {
    *((unsigned char *)this + 70) = 0;
    GpsFactoryTest::mutateState((uint64_t)this, 1u);
    v44 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int buf = 0;
      _os_log_impl(&dword_237AFF000, v44, OS_LOG_TYPE_DEFAULT, "[EVENT ] *** starting test: record IQ", buf, 2u);
    }
    uint64_t v45 = *((void *)this + 66);
    uint64_t v46 = *((unsigned int *)this + 29);
    uint64_t v47 = *((unsigned __int8 *)this + 104);
    uint64_t v48 = *((unsigned int *)this + 27);
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v85, (uint64_t)v97);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, void *))(*(void *)v45 + 48))(v45, v46, v47, v48, v85);
    std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v85);
    *((_DWORD *)this + 90) = 1000 * *((_DWORD *)this + 29);
    uint64_t v32 = "recordIQ";
    goto LABEL_64;
  }
  if (*((unsigned char *)this + 71))
  {
    *((unsigned char *)this + 71) = 0;
    uint64_t v49 = *((void *)this + 66);
    uint64_t v50 = *((unsigned int *)this + 30);
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v84, (uint64_t)v97);
    (*(void (**)(uint64_t, uint64_t, void *))(*(void *)v49 + 64))(v49, v50, v84);
    std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v84);
    uint64_t v32 = "powerMode";
LABEL_64:
    MEMORY[0x237E295A0]((char *)this + 496, v32);
    return std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v97);
  }
  if (*((unsigned char *)this + 72))
  {
    GpsFactoryTest::mutateState((uint64_t)this, 1u);
    *((unsigned char *)this + 72) = 0;
    uint64_t v51 = *((void *)this + 66);
    uint64_t v52 = *((unsigned int *)this + 31);
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v83, (uint64_t)v97);
    (*(void (**)(uint64_t, uint64_t, void *))(*(void *)v51 + 72))(v51, v52, v83);
    std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v83);
    uint64_t v32 = "HostWakeGpio";
    goto LABEL_64;
  }
  if (*((unsigned char *)this + 73))
  {
    v53 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int buf = 0;
      _os_log_impl(&dword_237AFF000, v53, OS_LOG_TYPE_DEFAULT, "[EVENT ] starting test: TimeMark", buf, 2u);
    }
    GpsFactoryTest::mutateState((uint64_t)this, 1u);
    *((unsigned char *)this + 73) = 0;
    uint64_t v54 = *((void *)this + 66);
    uint64_t v55 = *((unsigned int *)this + 32);
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v82, (uint64_t)v97);
    (*(void (**)(uint64_t, uint64_t, void *))(*(void *)v54 + 80))(v54, v55, v82);
    std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v82);
    *((_DWORD *)this + 90) = *((_DWORD *)this + 32);
    uint64_t v32 = "TimeMarkGpio";
    goto LABEL_64;
  }
  if (*((unsigned char *)this + 75))
  {
    GpsFactoryTest::mutateState((uint64_t)this, 1u);
    *((unsigned char *)this + 75) = 0;
    int v56 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int buf = 0;
      _os_log_impl(&dword_237AFF000, v56, OS_LOG_TYPE_DEFAULT, "[EVENT ] starting test: commLoopback", buf, 2u);
    }
    uint64_t v57 = *((unsigned int *)this + 34);
    int v74 = 1;
    int v75 = 8;
    int v72 = 9;
    int v73 = 1;
    if (*((char *)this + 167) < 0) {
      uint64_t v58 = *((void *)this + 19);
    }
    else {
      uint64_t v58 = *((unsigned __int8 *)this + 167);
    }
    if (v58)
    {
      std::istringstream::basic_istringstream[abi:ne180100]((uint64_t)buf, (const std::string *)this + 6);
      v59 = (void *)MEMORY[0x237E296E0](buf, &v74);
      int v60 = std::operator>>[abi:ne180100]<char,std::char_traits<char>>(v59, &v71);
      v61 = (void *)MEMORY[0x237E296E0](v60, &v73);
      int v62 = std::operator>>[abi:ne180100]<char,std::char_traits<char>>(v61, &v71);
      v63 = (void *)MEMORY[0x237E296E0](v62, &v75);
      int v64 = std::operator>>[abi:ne180100]<char,std::char_traits<char>>(v63, &v71);
      MEMORY[0x237E296E0](v64, &v72);
      std::istringstream::~istringstream((uint64_t)buf);
      int v66 = v74;
      int v65 = v75;
      int v67 = v72;
      int v68 = v73;
    }
    else
    {
      int v65 = 8;
      int v68 = 1;
      int v67 = 9;
      int v66 = 1;
    }
    v69 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)int buf = 67110144;
      LODWORD(v79) = v57;
      WORD2(v79) = 1024;
      *(_DWORD *)((char *)&v79 + 6) = v66;
      WORD5(v79) = 1024;
      HIDWORD(v79) = v68;
      *(_WORD *)v80 = 1024;
      *(_DWORD *)&v80[2] = v65;
      LOWORD(v81[0]) = 1024;
      *(_DWORD *)((char *)v81 + 2) = v67;
      _os_log_impl(&dword_237AFF000, v69, OS_LOG_TYPE_DEFAULT, "[INFO  ] Options: duration,%d,sec,min,%d,step,%d,max,%d,kB,loops,%d", buf, 0x20u);
      int v66 = v74;
      int v65 = v75;
      int v67 = v72;
      int v68 = v73;
    }
    *(_DWORD *)int buf = v66 << 10;
    LODWORD(v79) = v65 << 10;
    DWORD1(v79) = v68 << 10;
    DWORD2(v79) = v67;
    uint64_t v70 = *((void *)this + 66);
    v77[0] = &unk_26EAA7530;
    v77[1] = this;
    v77[3] = v77;
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v76, (uint64_t)v97);
    (*(void (**)(uint64_t, uint64_t, uint8_t *, void *, void *))(*(void *)v70 + 56))(v70, v57, buf, v77, v76);
    std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v76);
    std::__function::__value_func<void ()(gnssTest::CommLoopbackResult const&)>::~__value_func[abi:ne180100](v77);
    *((_DWORD *)this + 90) = 1000 * v57;
    MEMORY[0x237E295A0]((char *)this + 496, "CommLoopback");
  }
  return std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v97);
}

void sub_237B0589C(_Unwind_Exception *a1)
{
  std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100]((void *)(v1 - 120));
  _Unwind_Resume(a1);
}

std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep GpsFactoryTest::BasicTimer::reset(GpsFactoryTest::BasicTimer *this)
{
  std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep result = std::chrono::steady_clock::now().__d_.__rep_;
  *(void *)this = result;
  *((void *)this + 16) = 0;
  return result;
}

uint64_t std::istringstream::basic_istringstream[abi:ne180100](uint64_t a1, const std::string *a2)
{
  uint64_t v4 = MEMORY[0x263F8C338] + 64;
  *(void *)(a1 + 120) = MEMORY[0x263F8C338] + 64;
  uint64_t v5 = *(void *)(MEMORY[0x263F8C2C0] + 16);
  uint64_t v6 = *(void *)(MEMORY[0x263F8C2C0] + 8);
  *(void *)a1 = v6;
  *(void *)(a1 + *(void *)(v6 - 24)) = v5;
  *(void *)(a1 + 8) = 0;
  unsigned int v7 = (std::ios_base *)(a1 + *(void *)(*(void *)a1 - 24));
  std::ios_base::init(v7, (void *)(a1 + 16));
  uint64_t v8 = MEMORY[0x263F8C338] + 24;
  v7[1].__vftable = 0;
  v7[1].__fmtflags_ = -1;
  *(void *)a1 = v8;
  *(void *)(a1 + 120) = v4;
  std::streambuf::basic_streambuf();
  uint64_t v9 = MEMORY[0x263F8C318] + 16;
  *(_OWORD *)(a1 + 80) = 0u;
  *(void *)(a1 + 16) = v9;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_DWORD *)(a1 + 112) = 8;
  std::string::operator=((std::string *)(a1 + 80), a2);
  *(void *)(a1 + 104) = 0;
  char v10 = *(unsigned char *)(a1 + 103);
  if (v10 < 0)
  {
    uint64_t v11 = *(void *)(a1 + 80);
    unint64_t v12 = *(void *)(a1 + 88);
  }
  else
  {
    uint64_t v11 = a1 + 80;
    unint64_t v12 = *(unsigned __int8 *)(a1 + 103);
  }
  int v13 = *(_DWORD *)(a1 + 112);
  if ((v13 & 8) != 0)
  {
    *(void *)(a1 + 104) = v11 + v12;
    *(void *)(a1 + 32) = v11;
    *(void *)(a1 + 40) = v11;
    *(void *)(a1 + 48) = v11 + v12;
  }
  if ((v13 & 0x10) != 0)
  {
    *(void *)(a1 + 104) = v11 + v12;
    std::string::size_type v14 = v10 < 0 ? (*(void *)(a1 + 96) & 0x7FFFFFFFFFFFFFFFLL) - 1 : 22;
    std::string::resize((std::string *)(a1 + 80), v14, 0);
    uint64_t v15 = *(char *)(a1 + 103) < 0 ? *(void *)(a1 + 88) : *(unsigned __int8 *)(a1 + 103);
    *(void *)(a1 + 56) = v11;
    *(void *)(a1 + 64) = v11;
    *(void *)(a1 + 72) = v11 + v15;
    if ((*(unsigned char *)(a1 + 112) & 3) != 0)
    {
      if (v12 >> 31)
      {
        uint64_t v16 = ((v12 - 0x80000000) * (unsigned __int128)0x200000005uLL) >> 64;
        unint64_t v17 = 0x7FFFFFFF * ((v16 + ((v12 - 0x80000000 - v16) >> 1)) >> 30);
        v11 += v17 + 0x7FFFFFFF;
        unint64_t v12 = v12 - v17 - 0x7FFFFFFF;
        *(void *)(a1 + 64) = v11;
      }
      if (v12) {
        *(void *)(a1 + 64) = v11 + v12;
      }
    }
  }
  return a1;
}

void sub_237B05C70(_Unwind_Exception *a1)
{
  std::istream::~istream();
  MEMORY[0x237E298C0](v1);
  _Unwind_Resume(a1);
}

void *std::operator>>[abi:ne180100]<char,std::char_traits<char>>(void *a1, unsigned char *a2)
{
  MEMORY[0x237E296C0](&v8, a1, 0);
  if (v8)
  {
    uint64_t v4 = *(void **)((char *)a1 + *(void *)(*a1 - 24) + 40);
    uint64_t v5 = (unsigned char *)v4[3];
    if (v5 == (unsigned char *)v4[4])
    {
      LODWORD(v4) = (*(uint64_t (**)(void *))(*v4 + 80))(v4);
      if (v4 == -1)
      {
        int v6 = 6;
        goto LABEL_6;
      }
    }
    else
    {
      v4[3] = v5 + 1;
      LOBYTE(v4) = *v5;
    }
    int v6 = 0;
    *a2 = (_BYTE)v4;
LABEL_6:
    std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | v6);
  }
  return a1;
}

void sub_237B05D98(void *a1)
{
  __cxa_begin_catch(a1);
  uint64_t v2 = *v1;
  *(_DWORD *)((char *)v1 + *(void *)(*v1 - 24) + 32) |= 1u;
  if ((*((unsigned char *)v1 + *(void *)(v2 - 24) + 36) & 1) == 0)
  {
    __cxa_end_catch();
    JUMPOUT(0x237B05D58);
  }
  __cxa_rethrow();
}

void sub_237B05E10(_Unwind_Exception *a1)
{
}

uint64_t std::istringstream::~istringstream(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263F8C2C0];
  uint64_t v3 = *MEMORY[0x263F8C2C0];
  *(void *)a1 = *MEMORY[0x263F8C2C0];
  *(void *)(a1 + *(void *)(v3 - 24)) = *(void *)(v2 + 24);
  *(void *)(a1 + 16) = MEMORY[0x263F8C318] + 16;
  if (*(char *)(a1 + 103) < 0) {
    operator delete(*(void **)(a1 + 80));
  }
  std::streambuf::~streambuf();
  std::istream::~istream();
  MEMORY[0x237E298C0](a1 + 120);
  return a1;
}

uint64_t GpsFactoryTest::testInitialize(GpsFactoryTest *this)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    int v6 = "testInitialize";
    _os_log_impl(&dword_237AFF000, v2, OS_LOG_TYPE_DEFAULT, "+%s", (uint8_t *)&v5, 0xCu);
  }
  atomic_store(1u, (unsigned __int8 *)this + 364);
  *((std::chrono::steady_clock::time_point *)this + 28) = std::chrono::steady_clock::now();
  *((void *)this + 44) = 0;
  GpsFactoryTest::constructDevice(this);
  uint64_t v3 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    int v6 = "testInitialize";
    _os_log_impl(&dword_237AFF000, v3, OS_LOG_TYPE_DEFAULT, "-%s", (uint8_t *)&v5, 0xCu);
  }
  usleep(0x4E20u);
  return 1;
}

unint64_t GpsFactoryTest::testPeriodicFix(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  int v5 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)int buf = 136315138;
    unint64_t v12 = "testPeriodicFix";
    _os_log_debug_impl(&dword_237AFF000, v5, OS_LOG_TYPE_DEBUG, "+%s", buf, 0xCu);
  }
  unsigned __int8 v6 = atomic_load((unsigned __int8 *)(a1 + 364));
  if ((v6 & 1) == 0) {
    return 7;
  }
  std::mutex::lock((std::mutex *)(a1 + 432));
  atomic_store(1u, (unsigned int *)(a1 + 368));
  std::condition_variable::notify_all((std::condition_variable *)(a1 + 384));
  std::mutex::unlock((std::mutex *)(a1 + 432));
  uint64_t v8 = *(void *)(a1 + 528);
  v10[0] = &unk_26EAA75C0;
  v10[1] = a1;
  v10[3] = v10;
  v9[0] = &unk_26EAA7640;
  v9[1] = a1;
  v9[3] = v9;
  (*(void (**)(uint64_t, uint64_t, void *, void *))(*(void *)v8 + 24))(v8, a3, v10, v9);
  std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v9);
  std::__function::__value_func<void ()(std::unique_ptr<gnss::Fix>)>::~__value_func[abi:ne180100](v10);
  if ((*(_DWORD *)(GpsdPlatformInfo::instance(0) + 8) - 201) <= 1) {
    sleep(a3 + 1);
  }
  GpsFactoryTest::waitForIdle((GpsFactoryTest *)a1);
  GpsFactoryTest::printResult((GpsFactoryTest *)a1, "testPeriodicFix");
  unint64_t result = atomic_load((unint64_t *)(a1 + 376));
  if ((result & 0xFF00000000) == 0) {
    std::__throw_bad_optional_access[abi:ne180100]();
  }
  return result;
}

void sub_237B06228(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
}

unint64_t GpsFactoryTest::testCw(uint64_t a1, double a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6, uint64_t a7)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v13 = GpsdLogObjectGeneral;
  BOOL v14 = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT);
  if (v14)
  {
    *(_DWORD *)int buf = 136315394;
    BOOL v21 = "testCw";
    __int16 v22 = 2048;
    unint64_t MachContinuousTimeNs = gpsd::util::getMachContinuousTimeNs((gpsd::util *)v14);
    _os_log_impl(&dword_237AFF000, v13, OS_LOG_TYPE_DEFAULT, "#gpsd,%s,timesync,machContNs,%llu", buf, 0x16u);
  }
  unsigned __int8 v15 = atomic_load((unsigned __int8 *)(a1 + 364));
  if ((v15 & 1) == 0) {
    return 7;
  }
  std::mutex::lock((std::mutex *)(a1 + 432));
  atomic_store(1u, (unsigned int *)(a1 + 368));
  std::condition_variable::notify_all((std::condition_variable *)(a1 + 384));
  std::mutex::unlock((std::mutex *)(a1 + 432));
  uint64_t v17 = *(void *)(a1 + 528);
  v19[0] = &unk_26EAA76C0;
  v19[1] = a1;
  v19[3] = v19;
  v18[0] = &unk_26EAA7740;
  v18[1] = a1;
  v18[3] = v18;
  (*(void (**)(uint64_t, uint64_t, uint64_t, void, uint64_t, void *, void *, double))(*(void *)v17 + 32))(v17, a4, a5, a6, a7, v19, v18, a2);
  std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v18);
  std::__function::__value_func<void ()(std::vector<gnssTest::RfMeasurement>)>::~__value_func[abi:ne180100](v19);
  if ((*(_DWORD *)(GpsdPlatformInfo::instance(0) + 8) - 201) <= 1) {
    sleep(a4 + 1);
  }
  GpsFactoryTest::waitForIdle((GpsFactoryTest *)a1);
  GpsFactoryTest::printResult((GpsFactoryTest *)a1, "testCw");
  unint64_t result = atomic_load((unint64_t *)(a1 + 376));
  if ((result & 0xFF00000000) == 0) {
    std::__throw_bad_optional_access[abi:ne180100]();
  }
  return result;
}

void sub_237B0645C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
}

unint64_t GpsFactoryTest::testModulated(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v9 = GpsdLogObjectGeneral;
  BOOL v10 = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    *(_DWORD *)int buf = 136315394;
    uint64_t v17 = "testModulated";
    __int16 v18 = 2048;
    unint64_t MachContinuousTimeNs = gpsd::util::getMachContinuousTimeNs((gpsd::util *)v10);
    _os_log_impl(&dword_237AFF000, v9, OS_LOG_TYPE_DEFAULT, "#gpsd,%s,timesync,machContNs,%llu", buf, 0x16u);
  }
  unsigned __int8 v11 = atomic_load((unsigned __int8 *)(a1 + 364));
  if ((v11 & 1) == 0) {
    return 7;
  }
  std::mutex::lock((std::mutex *)(a1 + 432));
  atomic_store(1u, (unsigned int *)(a1 + 368));
  std::condition_variable::notify_all((std::condition_variable *)(a1 + 384));
  std::mutex::unlock((std::mutex *)(a1 + 432));
  uint64_t v13 = *(void *)(a1 + 528);
  v15[0] = &unk_26EAA77C0;
  v15[1] = a1;
  v15[3] = v15;
  v14[0] = &unk_26EAA7840;
  v14[1] = a1;
  v14[3] = v14;
  (*(void (**)(uint64_t, uint64_t, uint64_t, void, uint64_t, void *, void *))(*(void *)v13 + 40))(v13, a3, a4, a5, 0xFFFFFFFFLL, v15, v14);
  std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v14);
  std::__function::__value_func<void ()(std::vector<gnssTest::RfMeasurement>)>::~__value_func[abi:ne180100](v15);
  if ((*(_DWORD *)(GpsdPlatformInfo::instance(0) + 8) - 201) <= 1) {
    sleep(a3 + 1);
  }
  GpsFactoryTest::waitForIdle((GpsFactoryTest *)a1);
  GpsFactoryTest::printResult((GpsFactoryTest *)a1, "testModulated");
  unint64_t result = atomic_load((unint64_t *)(a1 + 376));
  if ((result & 0xFF00000000) == 0) {
    std::__throw_bad_optional_access[abi:ne180100]();
  }
  return result;
}

void sub_237B0667C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
}

unint64_t GpsFactoryTest::testApSignal(GpsFactoryTest *this)
{
  v24[4] = *MEMORY[0x263EF8340];
  uint64_t v2 = GpsdLogObjectGeneral;
  BOOL v3 = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    int v18 = 136315394;
    __int16 v19 = "testApSignal";
    __int16 v20 = 2048;
    unint64_t MachContinuousTimeNs = gpsd::util::getMachContinuousTimeNs((gpsd::util *)v3);
    _os_log_impl(&dword_237AFF000, v2, OS_LOG_TYPE_DEFAULT, "#gpsd,%s,timesync,machContNs,%llu", (uint8_t *)&v18, 0x16u);
  }
  unsigned __int8 v4 = atomic_load((unsigned __int8 *)this + 364);
  if ((v4 & 1) == 0) {
    return 7;
  }
  std::mutex::lock((std::mutex *)((char *)this + 432));
  atomic_store(1u, (unsigned int *)this + 92);
  std::condition_variable::notify_all((std::condition_variable *)this + 8);
  std::mutex::unlock((std::mutex *)((char *)this + 432));
  uint64_t v7 = GnssHal::GpioEmbedded::GpioBackend::instance(v6);
  std::mutex::lock(&GnssHal::sMutex);
  *(_DWORD *)(v7 + 20) = 0;
  *(_DWORD *)(v7 + 24) = 0;
  std::mutex::unlock(&GnssHal::sMutex);
  uint64_t v8 = *((void *)this + 66);
  v24[0] = &unk_26EAA78C0;
  v24[1] = this;
  v24[3] = v24;
  (*(void (**)(uint64_t, uint64_t, void *))(*(void *)v8 + 72))(v8, 1500, v24);
  std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v24);
  GpsFactoryTest::waitForIdle(this);
  GpsFactoryTest::printResult(this, "testApSignal");
  uint64_t v9 = (GnssHal::GpioEmbedded::GpioBackend *)sleep(1u);
  uint64_t v10 = GnssHal::GpioEmbedded::GpioBackend::instance(v9);
  std::mutex::lock(&GnssHal::sMutex);
  unint64_t v11 = *(int *)(v10 + 20);
  std::mutex::unlock(&GnssHal::sMutex);
  uint64_t v13 = GnssHal::GpioEmbedded::GpioBackend::instance(v12);
  std::mutex::lock(&GnssHal::sMutex);
  uint64_t v14 = *(int *)(v13 + 24);
  std::mutex::unlock(&GnssHal::sMutex);
  unsigned __int8 v15 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 136315650;
    __int16 v19 = "testApSignal";
    __int16 v20 = 2048;
    unint64_t MachContinuousTimeNs = v11;
    __int16 v22 = 2048;
    uint64_t v23 = v14;
    _os_log_impl(&dword_237AFF000, v15, OS_LOG_TYPE_DEFAULT, "%s,zero transitions, %llu, one transitions, %llu,", (uint8_t *)&v18, 0x20u);
  }
  unint64_t v16 = atomic_load((unint64_t *)this + 47);
  if ((v16 & 0xFF00000000) != 0 && v16 == 1)
  {
    if (v14) {
      BOOL v17 = v11 == 0;
    }
    else {
      BOOL v17 = 1;
    }
    if (v17) {
      return 8;
    }
    else {
      return 1;
    }
  }
  else
  {
    unint64_t result = atomic_load((unint64_t *)this + 47);
    if ((result & 0xFF00000000) == 0) {
      std::__throw_bad_optional_access[abi:ne180100]();
    }
  }
  return result;
}

void sub_237B06934(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

unint64_t GpsFactoryTest::testTimeMark(GpsFactoryTest *this)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v2 = GpsdLogObjectGeneral;
  BOOL v3 = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    *(_DWORD *)int buf = 136315394;
    uint64_t v9 = "testTimeMark";
    __int16 v10 = 2048;
    unint64_t MachContinuousTimeNs = gpsd::util::getMachContinuousTimeNs((gpsd::util *)v3);
    _os_log_impl(&dword_237AFF000, v2, OS_LOG_TYPE_DEFAULT, "#gpsd,%s,timesync,machContNs,%llu", buf, 0x16u);
  }
  unsigned __int8 v4 = atomic_load((unsigned __int8 *)this + 364);
  if ((v4 & 1) == 0) {
    return 7;
  }
  std::mutex::lock((std::mutex *)((char *)this + 432));
  atomic_store(1u, (unsigned int *)this + 92);
  std::condition_variable::notify_all((std::condition_variable *)this + 8);
  std::mutex::unlock((std::mutex *)((char *)this + 432));
  uint64_t v6 = *((void *)this + 66);
  v7[0] = &unk_26EAA7940;
  v7[1] = this;
  v7[3] = v7;
  (*(void (**)(uint64_t, uint64_t, void *))(*(void *)v6 + 80))(v6, 1500, v7);
  std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v7);
  GpsFactoryTest::waitForIdle(this);
  GpsFactoryTest::printResult(this, "testTimeMark");
  sleep(1u);
  unint64_t result = atomic_load((unint64_t *)this + 47);
  if ((result & 0xFF00000000) == 0) {
    std::__throw_bad_optional_access[abi:ne180100]();
  }
  return result;
}

void sub_237B06ADC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

unint64_t GpsFactoryTest::testCommPing(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v2 = GpsdLogObjectGeneral;
  BOOL v3 = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    *(_DWORD *)int buf = 136315394;
    __int16 v10 = "testCommPing";
    __int16 v11 = 2048;
    unint64_t MachContinuousTimeNs = gpsd::util::getMachContinuousTimeNs((gpsd::util *)v3);
    _os_log_impl(&dword_237AFF000, v2, OS_LOG_TYPE_DEFAULT, "#gpsd,%s,timesync,machContNs,%llu", buf, 0x16u);
  }
  unsigned __int8 v4 = atomic_load((unsigned __int8 *)(a1 + 364));
  if ((v4 & 1) == 0) {
    return 7;
  }
  std::mutex::lock((std::mutex *)(a1 + 432));
  atomic_store(1u, (unsigned int *)(a1 + 368));
  std::condition_variable::notify_all((std::condition_variable *)(a1 + 384));
  std::mutex::unlock((std::mutex *)(a1 + 432));
  uint64_t v6 = *(void *)(a1 + 528);
  v8[0] = &unk_26EAA79C0;
  v8[1] = a1;
  v8[3] = v8;
  v7[0] = &unk_26EAA7A40;
  v7[1] = a1;
  v7[3] = v7;
  (*(void (**)(uint64_t, uint64_t, void *, void *))(*(void *)v6 + 88))(v6, 1500, v8, v7);
  std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v7);
  std::__function::__value_func<void ()(std::string const&,std::string const&)>::~__value_func[abi:ne180100](v8);
  GpsFactoryTest::waitForIdle((GpsFactoryTest *)a1);
  GpsFactoryTest::printResult((GpsFactoryTest *)a1, "testCommPing");
  sleep(1u);
  unint64_t result = atomic_load((unint64_t *)(a1 + 376));
  if ((result & 0xFF00000000) == 0) {
    std::__throw_bad_optional_access[abi:ne180100]();
  }
  return result;
}

void sub_237B06CB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
}

unint64_t GpsFactoryTest::testPowerMode(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  unsigned __int8 v4 = GpsdLogObjectGeneral;
  BOOL v5 = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    *(_DWORD *)int buf = 136315394;
    __int16 v11 = "testPowerMode";
    __int16 v12 = 2048;
    unint64_t MachContinuousTimeNs = gpsd::util::getMachContinuousTimeNs((gpsd::util *)v5);
    _os_log_impl(&dword_237AFF000, v4, OS_LOG_TYPE_DEFAULT, "#gpsd,%s,timesync,machContNs,%llu", buf, 0x16u);
  }
  unsigned __int8 v6 = atomic_load((unsigned __int8 *)(a1 + 364));
  if ((v6 & 1) == 0) {
    return 7;
  }
  std::mutex::lock((std::mutex *)(a1 + 432));
  atomic_store(1u, (unsigned int *)(a1 + 368));
  std::condition_variable::notify_all((std::condition_variable *)(a1 + 384));
  std::mutex::unlock((std::mutex *)(a1 + 432));
  uint64_t v8 = *(void *)(a1 + 528);
  v9[0] = &unk_26EAA7AC0;
  v9[1] = a1;
  v9[3] = v9;
  (*(void (**)(uint64_t, uint64_t, void *))(*(void *)v8 + 64))(v8, a2, v9);
  std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](v9);
  GpsFactoryTest::waitForIdle((GpsFactoryTest *)a1);
  GpsFactoryTest::printResult((GpsFactoryTest *)a1, "testPowerMode");
  sleep(1u);
  unint64_t result = atomic_load((unint64_t *)(a1 + 376));
  if ((result & 0xFF00000000) == 0) {
    std::__throw_bad_optional_access[abi:ne180100]();
  }
  return result;
}

void sub_237B06E70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void *GpsFactoryTest::stringify@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  unsigned __int8 v4 = (char *)(a1 + 544);
  snprintf((char *)(a1 + 544), 0x100uLL, "rxTimeNs=%12llu, gpsTimeNs=%12llu(%4.1f)", *(void *)(a2 + 24), *(void *)a2, *(float *)(a2 + 8));
  return std::string::basic_string[abi:ne180100]<0>(a3, v4);
}

{
  char *v5;
  void **v6;
  void *__p[2];
  char v9;

  BOOL v5 = (char *)(a1 + 544);
  GpsFactoryTest::stringify((int *)(a2 + 68), __p);
  if (v9 >= 0) {
    unsigned __int8 v6 = __p;
  }
  else {
    unsigned __int8 v6 = (void **)__p[0];
  }
  snprintf(v5, 0x100uLL, "%s, ll=%6.3f,%6.3f, hUnc=%6.3f, alt=%6.3f(%6.3f), undul=%6.3f", (const char *)v6, *(double *)a2, *(double *)(a2 + 8), *(double *)(a2 + 40), *(double *)(a2 + 16), *(double *)(a2 + 32), *(double *)(a2 + 24));
  if (v9 < 0) {
    operator delete(__p[0]);
  }
  return std::string::basic_string[abi:ne180100]<0>(a3, v5);
}

void *GpsFactoryTest::stringify@<X0>(uint64_t a1@<X0>, double *a2@<X1>, void *a3@<X8>)
{
  unsigned __int8 v4 = (char *)(a1 + 544);
  snprintf((char *)(a1 + 544), 0x100uLL, "hSpeed=%4.2f(%5.2f), vVel=%4.2f(%5.2f)", *a2, a2[1], a2[2], a2[3]);
  return std::string::basic_string[abi:ne180100]<0>(a3, v4);
}

void GpsFactoryTest::stringify_json(uint64_t a1@<X0>, uint64_t a2@<X1>, std::string *a3@<X8>)
{
  GpsFactoryTest::stringify_json(a1, a2, &v25);
  unsigned __int8 v6 = std::string::insert(&v25, 0, "{\"fix\": {");
  long long v7 = *(_OWORD *)&v6->__r_.__value_.__l.__data_;
  v26.__r_.__value_.__r.__words[2] = v6->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v26.__r_.__value_.__l.__data_ = v7;
  v6->__r_.__value_.__l.__size_ = 0;
  v6->__r_.__value_.__r.__words[2] = 0;
  v6->__r_.__value_.__r.__words[0] = 0;
  uint64_t v8 = std::string::append(&v26, ", ");
  long long v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
  v27.__r_.__value_.__r.__words[2] = v8->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v27.__r_.__value_.__l.__data_ = v9;
  v8->__r_.__value_.__l.__size_ = 0;
  v8->__r_.__value_.__r.__words[2] = 0;
  v8->__r_.__value_.__r.__words[0] = 0;
  GpsFactoryTest::stringify_json(a1, a2 + 48, v23);
  if ((v24 & 0x80u) == 0) {
    __int16 v10 = v23;
  }
  else {
    __int16 v10 = (void **)v23[0];
  }
  if ((v24 & 0x80u) == 0) {
    std::string::size_type v11 = v24;
  }
  else {
    std::string::size_type v11 = (std::string::size_type)v23[1];
  }
  __int16 v12 = std::string::append(&v27, (const std::string::value_type *)v10, v11);
  long long v13 = *(_OWORD *)&v12->__r_.__value_.__l.__data_;
  v28.__r_.__value_.__r.__words[2] = v12->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v28.__r_.__value_.__l.__data_ = v13;
  v12->__r_.__value_.__l.__size_ = 0;
  v12->__r_.__value_.__r.__words[2] = 0;
  v12->__r_.__value_.__r.__words[0] = 0;
  uint64_t v14 = std::string::append(&v28, ", ");
  long long v15 = *(_OWORD *)&v14->__r_.__value_.__l.__data_;
  v29.__r_.__value_.__r.__words[2] = v14->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v29.__r_.__value_.__l.__data_ = v15;
  v14->__r_.__value_.__l.__size_ = 0;
  v14->__r_.__value_.__r.__words[2] = 0;
  v14->__r_.__value_.__r.__words[0] = 0;
  GpsFactoryTest::stringify_json(a1, (double *)(a2 + 136), __p);
  if ((v22 & 0x80u) == 0) {
    unint64_t v16 = __p;
  }
  else {
    unint64_t v16 = (void **)__p[0];
  }
  if ((v22 & 0x80u) == 0) {
    std::string::size_type v17 = v22;
  }
  else {
    std::string::size_type v17 = (std::string::size_type)__p[1];
  }
  int v18 = std::string::append(&v29, (const std::string::value_type *)v16, v17);
  long long v19 = *(_OWORD *)&v18->__r_.__value_.__l.__data_;
  v30.__r_.__value_.__r.__words[2] = v18->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v30.__r_.__value_.__l.__data_ = v19;
  v18->__r_.__value_.__l.__size_ = 0;
  v18->__r_.__value_.__r.__words[2] = 0;
  v18->__r_.__value_.__r.__words[0] = 0;
  __int16 v20 = std::string::append(&v30, "}}");
  *a3 = *v20;
  v20->__r_.__value_.__l.__size_ = 0;
  v20->__r_.__value_.__r.__words[2] = 0;
  v20->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v30.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v30.__r_.__value_.__l.__data_);
  }
  if ((char)v22 < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v29.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v29.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v28.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v28.__r_.__value_.__l.__data_);
  }
  if ((char)v24 < 0) {
    operator delete(v23[0]);
  }
  if (SHIBYTE(v27.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v27.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v26.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v25.__r_.__value_.__l.__data_);
  }
}

void sub_237B07210(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33,uint64_t a34,void *a35,uint64_t a36,int a37,__int16 a38,char a39,char a40,uint64_t a41,void *a42,uint64_t a43,int a44,__int16 a45,char a46,char a47)
{
  if (*(char *)(v47 - 57) < 0) {
    operator delete(*(void **)(v47 - 80));
  }
  if (a15 < 0) {
    operator delete(__p);
  }
  if (*(char *)(v47 - 89) < 0) {
    operator delete(*(void **)(v47 - 112));
  }
  if (a47 < 0) {
    operator delete(a42);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (a40 < 0) {
    operator delete(a35);
  }
  if (a33 < 0) {
    operator delete(a28);
  }
  if (a27 < 0) {
    operator delete(a22);
  }
  _Unwind_Resume(exception_object);
}

void *GpsFactoryTest::stringify_json@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  unsigned __int8 v4 = (char *)(a1 + 544);
  snprintf((char *)(a1 + 544), 0x100uLL, "\"time\":{\"mClockNanoSeconds\":%12llu,\"mGpsNanoSeconds\":%12llu, \"mGpsTimeUncertaintyNanoSeconds\":%4.1f}", *(void *)(a2 + 24), *(void *)a2, *(float *)(a2 + 8));
  return std::string::basic_string[abi:ne180100]<0>(a3, v4);
}

{
  char *v5;
  void **v6;
  void *__p[2];
  char v9;

  BOOL v5 = (char *)(a1 + 544);
  GpsFactoryTest::stringify((int *)(a2 + 68), __p);
  if (v9 >= 0) {
    unsigned __int8 v6 = __p;
  }
  else {
    unsigned __int8 v6 = (void **)__p[0];
  }
  snprintf(v5, 0x100uLL, "\"position\":{\"mReliability\":\"%s\",\"mLatitude\":%6.3f, \"mLongitude\":%6.3f,\"mSemiMajorHorizontalUncertainty\":%6.3f,\"mAltWgs84\":%6.3f,\"mVerticalUncertainty\":%6.3f,\"mUndulation\":%6.3f}", (const char *)v6, *(double *)a2, *(double *)(a2 + 8), *(double *)(a2 + 40), *(double *)(a2 + 16), *(double *)(a2 + 32), *(double *)(a2 + 24));
  if (v9 < 0) {
    operator delete(__p[0]);
  }
  return std::string::basic_string[abi:ne180100]<0>(a3, v5);
}

void *GpsFactoryTest::stringify_json@<X0>(uint64_t a1@<X0>, double *a2@<X1>, void *a3@<X8>)
{
  unsigned __int8 v4 = (char *)(a1 + 544);
  snprintf((char *)(a1 + 544), 0x100uLL, "\"velocity\":{\"mHorizSpeed\":%4.2f,\"mHorizSpeedUnc\":%5.2f, \"mVertVelocity\":%4.2f,\"mVertVelocityUnc\":%5.2f}", *a2, a2[1], a2[2], a2[3]);
  return std::string::basic_string[abi:ne180100]<0>(a3, v4);
}

uint64_t GpsFactoryTest::stringify@<X0>(int *a1@<X1>, void *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  int v3 = *a1;
  if (*a1 <= 24)
  {
    if (!v3)
    {
      unsigned __int8 v4 = "NotSet";
      return MEMORY[0x237E295A0](a2, v4);
    }
    if (v3 == 10)
    {
      unsigned __int8 v4 = "VeryLow";
      return MEMORY[0x237E295A0](a2, v4);
    }
LABEL_12:
    unsigned __int8 v4 = "Error";
    return MEMORY[0x237E295A0](a2, v4);
  }
  if (v3 == 25)
  {
    unsigned __int8 v4 = "Low";
    return MEMORY[0x237E295A0](a2, v4);
  }
  if (v3 == 50)
  {
    unsigned __int8 v4 = "Medium";
    return MEMORY[0x237E295A0](a2, v4);
  }
  if (v3 != 75) {
    goto LABEL_12;
  }
  unsigned __int8 v4 = "High";
  return MEMORY[0x237E295A0](a2, v4);
}

void sub_237B074F4(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void GpsFactoryTest::BasicTimer::waitUntil(GpsFactoryTest::BasicTimer *this, double a2)
{
  int v3 = (std::condition_variable *)((char *)this + 8);
  double v4 = (a2 * 1000000000.0 + (double)*(uint64_t *)this) / 1000000000.0;
  v12.__m_ = (std::unique_lock<std::mutex>::mutex_type *)((char *)this + 56);
  v12.__owns_ = 1;
  std::mutex::lock((std::mutex *)((char *)this + 56));
  double v5 = v4 * 1000000000.0;
  double v6 = -9.22337204e18;
  if (v4 * 1000000000.0 > -9.22337204e18) {
    double v6 = v4 * 1000000000.0;
  }
  if (v5 < 9.22337204e18) {
    uint64_t v7 = (uint64_t)v6;
  }
  else {
    uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }
  while (!*((unsigned char *)this + 120) && v5 > (double)std::chrono::steady_clock::now().__d_.__rep_)
  {
    v8.__d_.__rep_ = v7 - std::chrono::steady_clock::now().__d_.__rep_;
    if (v8.__d_.__rep_ >= 1)
    {
      std::chrono::steady_clock::now();
      v9.__d_.__rep_ = std::chrono::system_clock::now().__d_.__rep_;
      if (!v9.__d_.__rep_)
      {
        std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v10 = 0;
        goto LABEL_17;
      }
      if (v9.__d_.__rep_ < 1)
      {
        if ((unint64_t)v9.__d_.__rep_ >= 0xFFDF3B645A1CAC09) {
          goto LABEL_16;
        }
        std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v10 = 0x8000000000000000;
      }
      else
      {
        if ((unint64_t)v9.__d_.__rep_ > 0x20C49BA5E353F7)
        {
          std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v10 = 0x7FFFFFFFFFFFFFFFLL;
          goto LABEL_17;
        }
LABEL_16:
        std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v10 = 1000 * v9.__d_.__rep_;
LABEL_17:
        if (v10 > (v8.__d_.__rep_ ^ 0x7FFFFFFFFFFFFFFFLL))
        {
          v11.__d_.__rep_ = 0x7FFFFFFFFFFFFFFFLL;
LABEL_20:
          std::condition_variable::__do_timed_wait(v3, &v12, v11);
          std::chrono::steady_clock::now();
          goto LABEL_21;
        }
      }
      v11.__d_.__rep_ = v10 + v8.__d_.__rep_;
      goto LABEL_20;
    }
LABEL_21:
    if (v5 <= (double)std::chrono::steady_clock::now().__d_.__rep_) {
      break;
    }
  }
  if (v12.__owns_) {
    std::mutex::unlock(v12.__m_);
  }
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
    double v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    double v6 = a1;
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

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_264CEFF28, MEMORY[0x263F8C060]);
}

void sub_237B077A0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  unint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

std::string *GpsFactoryTest::Options::Options(std::string *this, const GpsFactoryTest::Options *a2)
{
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v4 = *(_OWORD *)a2;
    this->__r_.__value_.__r.__words[2] = *((void *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v4;
  }
  if (*((char *)a2 + 47) < 0)
  {
    std::string::__init_copy_ctor_external(this + 1, *((const std::string::value_type **)a2 + 3), *((void *)a2 + 4));
  }
  else
  {
    long long v5 = *(_OWORD *)((char *)a2 + 24);
    this[1].__r_.__value_.__r.__words[2] = *((void *)a2 + 5);
    *(_OWORD *)&this[1].__r_.__value_.__l.__data_ = v5;
  }
  long long v6 = *((_OWORD *)a2 + 4);
  *(_OWORD *)&this[2].__r_.__value_.__l.__data_ = *((_OWORD *)a2 + 3);
  *(_OWORD *)&this[2].__r_.__value_.__r.__words[2] = v6;
  long long v7 = *((_OWORD *)a2 + 5);
  long long v8 = *((_OWORD *)a2 + 6);
  long long v9 = *((_OWORD *)a2 + 7);
  *(_OWORD *)((char *)this[5].__r_.__value_.__r.__words + 4) = *(_OWORD *)((char *)a2 + 124);
  *(_OWORD *)&this[4].__r_.__value_.__l.__data_ = v8;
  *(_OWORD *)&this[4].__r_.__value_.__r.__words[2] = v9;
  *(_OWORD *)&this[3].__r_.__value_.__r.__words[1] = v7;
  if (*((char *)a2 + 167) < 0)
  {
    std::string::__init_copy_ctor_external(this + 6, *((const std::string::value_type **)a2 + 18), *((void *)a2 + 19));
  }
  else
  {
    long long v10 = *((_OWORD *)a2 + 9);
    this[6].__r_.__value_.__r.__words[2] = *((void *)a2 + 20);
    *(_OWORD *)&this[6].__r_.__value_.__l.__data_ = v10;
  }
  LODWORD(this[7].__r_.__value_.__l.__data_) = *((_DWORD *)a2 + 42);
  if (*((char *)a2 + 199) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)((char *)this + 176), *((const std::string::value_type **)a2 + 22), *((void *)a2 + 23));
  }
  else
  {
    long long v11 = *((_OWORD *)a2 + 11);
    this[8].__r_.__value_.__r.__words[0] = *((void *)a2 + 24);
    *(_OWORD *)&this[7].__r_.__value_.__r.__words[1] = v11;
  }
  std::unique_lock<std::mutex> v12 = (std::string *)((char *)this + 200);
  if (*((char *)a2 + 223) < 0)
  {
    std::string::__init_copy_ctor_external(v12, *((const std::string::value_type **)a2 + 25), *((void *)a2 + 26));
  }
  else
  {
    long long v13 = *(_OWORD *)((char *)a2 + 200);
    this[9].__r_.__value_.__r.__words[0] = *((void *)a2 + 27);
    *(_OWORD *)&v12->__r_.__value_.__l.__data_ = v13;
  }
  return this;
}

void sub_237B07960(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 199) < 0) {
    operator delete(*v4);
  }
  if (*(char *)(v1 + 167) < 0) {
    operator delete(*v3);
  }
  if (*(char *)(v1 + 47) < 0) {
    operator delete(*v2);
  }
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  long long v5 = this;
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
    long long v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    long long v5 = v8;
  }
  else
  {
    *((unsigned char *)&this->__r_.__value_.__s + 23) = __sz;
  }
  memmove(v5, __s, __sz + 1);
}

void std::__throw_bad_optional_access[abi:ne180100]()
{
  exception = __cxa_allocate_exception(8uLL);
  void *exception = MEMORY[0x263F8C3B0] + 16;
  __cxa_throw(exception, MEMORY[0x263F8C200], MEMORY[0x263F8C088]);
}

BOOL std::less<std::string>::operator()[abi:ne180100](void *a1, void *a2)
{
  int v2 = *((char *)a2 + 23);
  int v3 = *((char *)a1 + 23);
  if (v3 >= 0) {
    size_t v4 = *((unsigned __int8 *)a1 + 23);
  }
  else {
    size_t v4 = a1[1];
  }
  if (v3 < 0) {
    a1 = (void *)*a1;
  }
  if (v2 >= 0) {
    size_t v5 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    size_t v5 = a2[1];
  }
  if (v2 < 0) {
    a2 = (void *)*a2;
  }
  if (v5 >= v4) {
    size_t v6 = v4;
  }
  else {
    size_t v6 = v5;
  }
  int v7 = memcmp(a1, a2, v6);
  if (v7) {
    return v7 < 0;
  }
  else {
    return v4 < v5;
  }
}

void std::__tree<std::__value_type<std::string,GpsdPlatformInfoHardware::Hardware>,std::__map_value_compare<std::string,std::__value_type<std::string,GpsdPlatformInfoHardware::Hardware>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,GpsdPlatformInfoHardware::Hardware>>>::destroy(char *a1)
{
  if (a1)
  {
    std::__tree<std::__value_type<std::string,GpsdPlatformInfoHardware::Hardware>,std::__map_value_compare<std::string,std::__value_type<std::string,GpsdPlatformInfoHardware::Hardware>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,GpsdPlatformInfoHardware::Hardware>>>::destroy(*(void *)a1);
    std::__tree<std::__value_type<std::string,GpsdPlatformInfoHardware::Hardware>,std::__map_value_compare<std::string,std::__value_type<std::string,GpsdPlatformInfoHardware::Hardware>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,GpsdPlatformInfoHardware::Hardware>>>::destroy(*((void *)a1 + 1));
    if (a1[55] < 0) {
      operator delete(*((void **)a1 + 4));
    }
    operator delete(a1);
  }
}

VendorLogger *std::unique_ptr<VendorLogger>::reset[abi:ne180100](VendorLogger **a1, VendorLogger *a2)
{
  unint64_t result = *a1;
  *a1 = a2;
  if (result)
  {
    VendorLogger::~VendorLogger(result);
    JUMPOUT(0x237E29950);
  }
  return result;
}

void *std::__function::__value_func<void ()(GnssHal::TimeTransferPulseMark)>::~__value_func[abi:ne180100](void *a1)
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

void *std::__function::__value_func<void ()(int,std::string)>::~__value_func[abi:ne180100](void *a1)
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

void *std::__function::__value_func<void ()(GnssHal::ExtensionsOlaf::LtlInfoRequest const&,std::function<void ()(GnssHal::ExtensionsOlaf::LtlInfo const&)>)>::~__value_func[abi:ne180100](void *a1)
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

void std::__function::__func<GpsFactoryTest::constructDevice(void)::$_0,std::allocator<GpsFactoryTest::constructDevice(void)::$_0>,std::string ()(void)>::~__func()
{
}

void *std::__function::__func<GpsFactoryTest::constructDevice(void)::$_0,std::allocator<GpsFactoryTest::constructDevice(void)::$_0>,std::string ()(void)>::__clone(uint64_t a1)
{
  unint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *unint64_t result = &unk_26EAA6FD0;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<GpsFactoryTest::constructDevice(void)::$_0,std::allocator<GpsFactoryTest::constructDevice(void)::$_0>,std::string ()(void)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_26EAA6FD0;
  a2[1] = v2;
  return result;
}

void std::__function::__func<GpsFactoryTest::constructDevice(void)::$_0,std::allocator<GpsFactoryTest::constructDevice(void)::$_0>,std::string ()(void)>::operator()(uint64_t a1@<X0>, std::string *a2@<X8>)
{
  uint64_t v2 = *(long long **)(a1 + 8);
  if (*((char *)v2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(a2, *(const std::string::value_type **)v2, *((void *)v2 + 1));
  }
  else
  {
    long long v3 = *v2;
    a2->__r_.__value_.__r.__words[2] = *((void *)v2 + 2);
    *(_OWORD *)&a2->__r_.__value_.__l.__data_ = v3;
  }
}

uint64_t std::__function::__func<GpsFactoryTest::constructDevice(void)::$_0,std::allocator<GpsFactoryTest::constructDevice(void)::$_0>,std::string ()(void)>::target(uint64_t a1, uint64_t a2)
{
    return a1 + 8;
  else {
    return 0;
  }
}

void *std::__function::__func<GpsFactoryTest::constructDevice(void)::$_0,std::allocator<GpsFactoryTest::constructDevice(void)::$_0>,std::string ()(void)>::target_type()
{
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

void std::__function::__func<GpsFactoryTest::constructDevice(void)::$_1,std::allocator<GpsFactoryTest::constructDevice(void)::$_1>,std::string ()(void)>::~__func()
{
}

void *std::__function::__func<GpsFactoryTest::constructDevice(void)::$_1,std::allocator<GpsFactoryTest::constructDevice(void)::$_1>,std::string ()(void)>::__clone(uint64_t a1)
{
  unint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *unint64_t result = &unk_26EAA7060;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<GpsFactoryTest::constructDevice(void)::$_1,std::allocator<GpsFactoryTest::constructDevice(void)::$_1>,std::string ()(void)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_26EAA7060;
  a2[1] = v2;
  return result;
}

void std::__function::__func<GpsFactoryTest::constructDevice(void)::$_1,std::allocator<GpsFactoryTest::constructDevice(void)::$_1>,std::string ()(void)>::operator()(uint64_t a1@<X0>, std::string *a2@<X8>)
{
  uint64_t v2 = *(void *)(a1 + 8);
  if (*(char *)(v2 + 223) < 0)
  {
    std::string::__init_copy_ctor_external(a2, *(const std::string::value_type **)(v2 + 200), *(void *)(v2 + 208));
  }
  else
  {
    long long v3 = *(_OWORD *)(v2 + 200);
    a2->__r_.__value_.__r.__words[2] = *(void *)(v2 + 216);
    *(_OWORD *)&a2->__r_.__value_.__l.__data_ = v3;
  }
}

uint64_t std::__function::__func<GpsFactoryTest::constructDevice(void)::$_1,std::allocator<GpsFactoryTest::constructDevice(void)::$_1>,std::string ()(void)>::target(uint64_t a1, uint64_t a2)
{
    return a1 + 8;
  else {
    return 0;
  }
}

void *std::__function::__func<GpsFactoryTest::constructDevice(void)::$_1,std::allocator<GpsFactoryTest::constructDevice(void)::$_1>,std::string ()(void)>::target_type()
{
}

uint64_t std::__function::__value_func<void ()(void)>::__value_func[abi:ne180100](uint64_t a1, uint64_t a2)
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

uint64_t std::__function::__value_func<std::string ()(void)>::__value_func[abi:ne180100](uint64_t a1, uint64_t a2)
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

void *std::__function::__value_func<void ()(GnssHal::ExtensionsFire::CntinStatus)>::~__value_func[abi:ne180100](void *a1)
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

void *std::__function::__value_func<std::string ()(void)>::~__value_func[abi:ne180100](void *a1)
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

void *std::__function::__value_func<void ()(gnss::L5GroupDelayAnalyticsData const&)>::~__value_func[abi:ne180100](void *a1)
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

void *std::__function::__value_func<void ()(gnss::RtcClockAnalyticsData const&)>::~__value_func[abi:ne180100](void *a1)
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

void *std::__function::__value_func<void ()(gnss::ReceiverClockAnalyticsData const&)>::~__value_func[abi:ne180100](void *a1)
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

void *std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](void *a1)
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

void *std::__function::__value_func<void ()(std::function<void ()(GnssHal::ExtensionsFire::CntinStatus)>)>::~__value_func[abi:ne180100](void *a1)
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

void *std::__function::__value_func<void ()(GnssHal::ExtensionsFire::RecoveryStatistics const&)>::~__value_func[abi:ne180100](void *a1)
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

void *std::__function::__value_func<void ()(std::string)>::~__value_func[abi:ne180100](void *a1)
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

void std::__function::__func<GpsFactoryTest::constructDevice(void)::$_2,std::allocator<GpsFactoryTest::constructDevice(void)::$_2>,void ()(gnss::Result)>::~__func()
{
}

void *std::__function::__func<GpsFactoryTest::constructDevice(void)::$_2,std::allocator<GpsFactoryTest::constructDevice(void)::$_2>,void ()(gnss::Result)>::__clone(uint64_t a1)
{
  unint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *unint64_t result = &unk_26EAA70E0;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<GpsFactoryTest::constructDevice(void)::$_2,std::allocator<GpsFactoryTest::constructDevice(void)::$_2>,void ()(gnss::Result)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_26EAA70E0;
  a2[1] = v2;
  return result;
}

void std::__function::__func<GpsFactoryTest::constructDevice(void)::$_2,std::allocator<GpsFactoryTest::constructDevice(void)::$_2>,void ()(gnss::Result)>::operator()(uint64_t a1, unsigned int *a2)
{
}

uint64_t std::__function::__func<GpsFactoryTest::constructDevice(void)::$_2,std::allocator<GpsFactoryTest::constructDevice(void)::$_2>,void ()(gnss::Result)>::target(uint64_t a1, uint64_t a2)
{
    return a1 + 8;
  else {
    return 0;
  }
}

void *std::__function::__func<GpsFactoryTest::constructDevice(void)::$_2,std::allocator<GpsFactoryTest::constructDevice(void)::$_2>,void ()(gnss::Result)>::target_type()
{
}

void *std::__function::__value_func<void ()(gnss::Result)>::~__value_func[abi:ne180100](void *a1)
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

void std::__function::__func<GpsFactoryTest::runInternal(void)::$_0,std::allocator<GpsFactoryTest::runInternal(void)::$_0>,void ()(gnss::Result)>::~__func()
{
}

void *std::__function::__func<GpsFactoryTest::runInternal(void)::$_0,std::allocator<GpsFactoryTest::runInternal(void)::$_0>,void ()(gnss::Result)>::__clone(uint64_t a1)
{
  unint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *unint64_t result = &unk_26EAA7170;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<GpsFactoryTest::runInternal(void)::$_0,std::allocator<GpsFactoryTest::runInternal(void)::$_0>,void ()(gnss::Result)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_26EAA7170;
  a2[1] = v2;
  return result;
}

void std::__function::__func<GpsFactoryTest::runInternal(void)::$_0,std::allocator<GpsFactoryTest::runInternal(void)::$_0>,void ()(gnss::Result)>::operator()(uint64_t a1, unsigned int *a2)
{
}

uint64_t std::__function::__func<GpsFactoryTest::runInternal(void)::$_0,std::allocator<GpsFactoryTest::runInternal(void)::$_0>,void ()(gnss::Result)>::target(uint64_t a1, uint64_t a2)
{
    return a1 + 8;
  else {
    return 0;
  }
}

void *std::__function::__func<GpsFactoryTest::runInternal(void)::$_0,std::allocator<GpsFactoryTest::runInternal(void)::$_0>,void ()(gnss::Result)>::target_type()
{
}

void std::__function::__func<GpsFactoryTest::runInternal(void)::$_1,std::allocator<GpsFactoryTest::runInternal(void)::$_1>,void ()(std::string const&,std::string const&)>::~__func()
{
}

void *std::__function::__func<GpsFactoryTest::runInternal(void)::$_1,std::allocator<GpsFactoryTest::runInternal(void)::$_1>,void ()(std::string const&,std::string const&)>::__clone(uint64_t a1)
{
  unint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *unint64_t result = &unk_26EAA71F0;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<GpsFactoryTest::runInternal(void)::$_1,std::allocator<GpsFactoryTest::runInternal(void)::$_1>,void ()(std::string const&,std::string const&)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_26EAA71F0;
  a2[1] = v2;
  return result;
}

uint64_t std::__function::__func<GpsFactoryTest::runInternal(void)::$_1,std::allocator<GpsFactoryTest::runInternal(void)::$_1>,void ()(std::string const&,std::string const&)>::target(uint64_t a1, uint64_t a2)
{
    return a1 + 8;
  else {
    return 0;
  }
}

void *std::__function::__func<GpsFactoryTest::runInternal(void)::$_1,std::allocator<GpsFactoryTest::runInternal(void)::$_1>,void ()(std::string const&,std::string const&)>::target_type()
{
}

void *std::__function::__value_func<void ()(std::string const&,std::string const&)>::~__value_func[abi:ne180100](void *a1)
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

uint64_t std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100](uint64_t a1, uint64_t a2)
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

void std::__function::__func<GpsFactoryTest::runInternal(void)::$_2,std::allocator<GpsFactoryTest::runInternal(void)::$_2>,void ()(std::vector<std::string> &&)>::~__func()
{
}

void *std::__function::__func<GpsFactoryTest::runInternal(void)::$_2,std::allocator<GpsFactoryTest::runInternal(void)::$_2>,void ()(std::vector<std::string> &&)>::__clone()
{
  unint64_t result = operator new(0x10uLL);
  *unint64_t result = &unk_26EAA7280;
  return result;
}

void std::__function::__func<GpsFactoryTest::runInternal(void)::$_2,std::allocator<GpsFactoryTest::runInternal(void)::$_2>,void ()(std::vector<std::string> &&)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_26EAA7280;
}

void std::__function::__func<GpsFactoryTest::runInternal(void)::$_2,std::allocator<GpsFactoryTest::runInternal(void)::$_2>,void ()(std::vector<std::string> &&)>::operator()(uint64_t a1, std::string **a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a2;
  uint64_t v3 = (char *)a2[1];
  if (*a2 != (std::string *)v3)
  {
    do
    {
      uint64_t v4 = HIBYTE(v2->__r_.__value_.__r.__words[2]);
      if (SHIBYTE(v2->__r_.__value_.__r.__words[2]) < 0)
      {
        size_t v5 = (std::string *)v2->__r_.__value_.__r.__words[0];
        size_t size = v2->__r_.__value_.__l.__size_;
      }
      else
      {
        size_t v5 = v2;
        size_t size = HIBYTE(v2->__r_.__value_.__r.__words[2]);
      }
      int v7 = memchr(v5, 13, size);
      if (v7) {
        unint64_t v8 = (unint64_t)v7;
      }
      else {
        unint64_t v8 = (unint64_t)v5 + size;
      }
      long long v9 = (char *)(v8 + 1);
      if (v8 - (void)v5 != size && v9 != (char *)v5 + size)
      {
        long long v11 = (char *)v5 + size + ~v8;
        do
        {
          int v12 = *v9;
          if (v12 != 13) {
            *(unsigned char *)v8++ = v12;
          }
          ++v9;
          --v11;
        }
        while (v11);
        uint64_t v4 = HIBYTE(v2->__r_.__value_.__r.__words[2]);
      }
      if ((v4 & 0x80) != 0)
      {
        uint64_t v14 = (std::string *)v2->__r_.__value_.__r.__words[0];
        long long v13 = (char *)(v2->__r_.__value_.__r.__words[0] + v2->__r_.__value_.__l.__size_);
      }
      else
      {
        long long v13 = (char *)v2 + v4;
        uint64_t v14 = v2;
      }
      std::string::erase(v2, v8 - (void)v14, (std::string::size_type)&v13[-v8]);
      long long v15 = GpsdLogObjectGeneral;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v16 = v2;
        if (SHIBYTE(v2->__r_.__value_.__r.__words[2]) < 0) {
          unint64_t v16 = (std::string *)v2->__r_.__value_.__r.__words[0];
        }
        *(_DWORD *)int buf = 136315138;
        int v18 = v16;
        _os_log_impl(&dword_237AFF000, v15, OS_LOG_TYPE_DEFAULT, "[NMEA  ] %s", buf, 0xCu);
      }
      ++v2;
    }
    while (v2 != (std::string *)v3);
  }
}

uint64_t std::__function::__func<GpsFactoryTest::runInternal(void)::$_2,std::allocator<GpsFactoryTest::runInternal(void)::$_2>,void ()(std::vector<std::string> &&)>::target(uint64_t a1, uint64_t a2)
{
    return a1 + 8;
  else {
    return 0;
  }
}

void *std::__function::__func<GpsFactoryTest::runInternal(void)::$_2,std::allocator<GpsFactoryTest::runInternal(void)::$_2>,void ()(std::vector<std::string> &&)>::target_type()
{
}

void *std::__function::__value_func<void ()(std::vector<std::string> &&)>::~__value_func[abi:ne180100](void *a1)
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

void std::__function::__func<GpsFactoryTest::runInternal(void)::$_3,std::allocator<GpsFactoryTest::runInternal(void)::$_3>,void ()(gnss::Result)>::~__func()
{
}

void *std::__function::__func<GpsFactoryTest::runInternal(void)::$_3,std::allocator<GpsFactoryTest::runInternal(void)::$_3>,void ()(gnss::Result)>::__clone()
{
  unint64_t result = operator new(0x10uLL);
  *unint64_t result = &unk_26EAA7310;
  return result;
}

void std::__function::__func<GpsFactoryTest::runInternal(void)::$_3,std::allocator<GpsFactoryTest::runInternal(void)::$_3>,void ()(gnss::Result)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_26EAA7310;
}

void std::__function::__func<GpsFactoryTest::runInternal(void)::$_3,std::allocator<GpsFactoryTest::runInternal(void)::$_3>,void ()(gnss::Result)>::operator()(uint64_t a1, int *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v2 = *a2;
  uint64_t v3 = GpsdLogObjectGeneral;
  BOOL v4 = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT);
  if (v2 == 1)
  {
    if (!v4) {
      return;
    }
    LOWORD(v8[0]) = 0;
    size_t v5 = "[EVENT ] Succeed to set NMEA handler";
    size_t v6 = v3;
    uint32_t v7 = 2;
  }
  else
  {
    if (!v4) {
      return;
    }
    v8[0] = 67109120;
    v8[1] = v2;
    size_t v5 = "[EVENT ] Failed to set NMEA handler %d";
    size_t v6 = v3;
    uint32_t v7 = 8;
  }
  _os_log_impl(&dword_237AFF000, v6, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)v8, v7);
}

uint64_t std::__function::__func<GpsFactoryTest::runInternal(void)::$_3,std::allocator<GpsFactoryTest::runInternal(void)::$_3>,void ()(gnss::Result)>::target(uint64_t a1, uint64_t a2)
{
    return a1 + 8;
  else {
    return 0;
  }
}

void *std::__function::__func<GpsFactoryTest::runInternal(void)::$_3,std::allocator<GpsFactoryTest::runInternal(void)::$_3>,void ()(gnss::Result)>::target_type()
{
}

void std::__function::__func<GpsFactoryTest::runInternal(void)::$_4,std::allocator<GpsFactoryTest::runInternal(void)::$_4>,void ()(std::unique_ptr<gnss::Fix>)>::~__func()
{
}

void *std::__function::__func<GpsFactoryTest::runInternal(void)::$_4,std::allocator<GpsFactoryTest::runInternal(void)::$_4>,void ()(std::unique_ptr<gnss::Fix>)>::__clone(uint64_t a1)
{
  unint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *unint64_t result = &unk_26EAA7390;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<GpsFactoryTest::runInternal(void)::$_4,std::allocator<GpsFactoryTest::runInternal(void)::$_4>,void ()(std::unique_ptr<gnss::Fix>)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_26EAA7390;
  a2[1] = v2;
  return result;
}

void std::__function::__func<GpsFactoryTest::runInternal(void)::$_4,std::allocator<GpsFactoryTest::runInternal(void)::$_4>,void ()(std::unique_ptr<gnss::Fix>)>::operator()(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a2 = 0;
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v4 = v2;
  GpsFactoryTest::fixCallback(v3, &v4);
  if (v2)
  {
    JUMPOUT(0x237E29950);
  }
}

void sub_237B08F44(_Unwind_Exception *exception_object)
{
  if (v1) {
    MEMORY[0x237E29950](v1, 0x1000C4043D32D5CLL);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::__function::__func<GpsFactoryTest::runInternal(void)::$_4,std::allocator<GpsFactoryTest::runInternal(void)::$_4>,void ()(std::unique_ptr<gnss::Fix>)>::target(uint64_t a1, uint64_t a2)
{
    return a1 + 8;
  else {
    return 0;
  }
}

void *std::__function::__func<GpsFactoryTest::runInternal(void)::$_4,std::allocator<GpsFactoryTest::runInternal(void)::$_4>,void ()(std::unique_ptr<gnss::Fix>)>::target_type()
{
}

void *std::__function::__value_func<void ()(std::unique_ptr<gnss::Fix>)>::~__value_func[abi:ne180100](void *a1)
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

void std::__function::__func<GpsFactoryTest::runInternal(void)::$_5,std::allocator<GpsFactoryTest::runInternal(void)::$_5>,void ()(std::vector<gnssTest::RfMeasurement>)>::~__func()
{
}

void *std::__function::__func<GpsFactoryTest::runInternal(void)::$_5,std::allocator<GpsFactoryTest::runInternal(void)::$_5>,void ()(std::vector<gnssTest::RfMeasurement>)>::__clone(uint64_t a1)
{
  unint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *unint64_t result = &unk_26EAA7420;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<GpsFactoryTest::runInternal(void)::$_5,std::allocator<GpsFactoryTest::runInternal(void)::$_5>,void ()(std::vector<gnssTest::RfMeasurement>)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_26EAA7420;
  a2[1] = v2;
  return result;
}

void std::__function::__func<GpsFactoryTest::runInternal(void)::$_5,std::allocator<GpsFactoryTest::runInternal(void)::$_5>,void ()(std::vector<gnssTest::RfMeasurement>)>::operator()(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v2 = *(void *)(a2 + 8);
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)a2 = 0;
  uint64_t v4 = *(void *)(a1 + 8);
  memset(__p, 0, sizeof(__p));
  std::vector<gnssTest::RfMeasurement>::__init_with_size[abi:ne180100]<gnssTest::RfMeasurement*,gnssTest::RfMeasurement*>(__p, v3, v2, 0xCCCCCCCCCCCCCCCDLL * ((v2 - (uint64_t)v3) >> 3));
  GpsFactoryTest::rfMeasurementCallback(v4, (unsigned __int8 **)__p);
  if (__p[0]) {
    operator delete(__p[0]);
  }
  if (v3)
  {
    operator delete(v3);
  }
}

void sub_237B09164(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p)
{
  if (__p) {
    operator delete(__p);
  }
  if (v10) {
    operator delete(v10);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::__function::__func<GpsFactoryTest::runInternal(void)::$_5,std::allocator<GpsFactoryTest::runInternal(void)::$_5>,void ()(std::vector<gnssTest::RfMeasurement>)>::target(uint64_t a1, uint64_t a2)
{
    return a1 + 8;
  else {
    return 0;
  }
}

void *std::__function::__func<GpsFactoryTest::runInternal(void)::$_5,std::allocator<GpsFactoryTest::runInternal(void)::$_5>,void ()(std::vector<gnssTest::RfMeasurement>)>::target_type()
{
}

void *std::vector<gnssTest::RfMeasurement>::__init_with_size[abi:ne180100]<gnssTest::RfMeasurement*,gnssTest::RfMeasurement*>(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    size_t v5 = result;
    if (a4 >= 0x666666666666667) {
      std::vector<gnssTest::RfMeasurement>::__throw_length_error[abi:ne180100]();
    }
    unint64_t result = operator new(40 * a4);
    unint64_t v8 = result;
    void *v5 = result;
    v5[1] = result;
    v5[2] = &result[5 * a4];
    size_t v9 = a3 - (void)a2;
    if (v9) {
      unint64_t result = memcpy(result, a2, v9);
    }
    v5[1] = (char *)v8 + v9;
  }
  return result;
}

void sub_237B09278(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void std::vector<gnssTest::RfMeasurement>::__throw_length_error[abi:ne180100]()
{
}

void *std::__function::__value_func<void ()(std::vector<gnssTest::RfMeasurement>)>::~__value_func[abi:ne180100](void *a1)
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

void std::__function::__func<GpsFactoryTest::runInternal(void)::$_6,std::allocator<GpsFactoryTest::runInternal(void)::$_6>,void ()(std::vector<gnssTest::RfMeasurement>)>::~__func()
{
}

void *std::__function::__func<GpsFactoryTest::runInternal(void)::$_6,std::allocator<GpsFactoryTest::runInternal(void)::$_6>,void ()(std::vector<gnssTest::RfMeasurement>)>::__clone(uint64_t a1)
{
  unint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *unint64_t result = &unk_26EAA74B0;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<GpsFactoryTest::runInternal(void)::$_6,std::allocator<GpsFactoryTest::runInternal(void)::$_6>,void ()(std::vector<gnssTest::RfMeasurement>)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_26EAA74B0;
  a2[1] = v2;
  return result;
}

void std::__function::__func<GpsFactoryTest::runInternal(void)::$_6,std::allocator<GpsFactoryTest::runInternal(void)::$_6>,void ()(std::vector<gnssTest::RfMeasurement>)>::operator()(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v2 = *(void *)(a2 + 8);
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)a2 = 0;
  uint64_t v4 = *(void *)(a1 + 8);
  memset(__p, 0, sizeof(__p));
  std::vector<gnssTest::RfMeasurement>::__init_with_size[abi:ne180100]<gnssTest::RfMeasurement*,gnssTest::RfMeasurement*>(__p, v3, v2, 0xCCCCCCCCCCCCCCCDLL * ((v2 - (uint64_t)v3) >> 3));
  GpsFactoryTest::rfMeasurementCallback(v4, (unsigned __int8 **)__p);
  if (__p[0]) {
    operator delete(__p[0]);
  }
  if (v3)
  {
    operator delete(v3);
  }
}

void sub_237B09458(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p)
{
  if (__p) {
    operator delete(__p);
  }
  if (v10) {
    operator delete(v10);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::__function::__func<GpsFactoryTest::runInternal(void)::$_6,std::allocator<GpsFactoryTest::runInternal(void)::$_6>,void ()(std::vector<gnssTest::RfMeasurement>)>::target(uint64_t a1, uint64_t a2)
{
    return a1 + 8;
  else {
    return 0;
  }
}

void *std::__function::__func<GpsFactoryTest::runInternal(void)::$_6,std::allocator<GpsFactoryTest::runInternal(void)::$_6>,void ()(std::vector<gnssTest::RfMeasurement>)>::target_type()
{
}

void std::__function::__func<GpsFactoryTest::runInternal(void)::$_7,std::allocator<GpsFactoryTest::runInternal(void)::$_7>,void ()(gnssTest::CommLoopbackResult const&)>::~__func()
{
}

void *std::__function::__func<GpsFactoryTest::runInternal(void)::$_7,std::allocator<GpsFactoryTest::runInternal(void)::$_7>,void ()(gnssTest::CommLoopbackResult const&)>::__clone(uint64_t a1)
{
  unint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *unint64_t result = &unk_26EAA7530;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<GpsFactoryTest::runInternal(void)::$_7,std::allocator<GpsFactoryTest::runInternal(void)::$_7>,void ()(gnssTest::CommLoopbackResult const&)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_26EAA7530;
  a2[1] = v2;
  return result;
}

void std::__function::__func<GpsFactoryTest::runInternal(void)::$_7,std::allocator<GpsFactoryTest::runInternal(void)::$_7>,void ()(gnssTest::CommLoopbackResult const&)>::operator()(uint64_t a1, uint64_t a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v4 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)a2 >> 10;
    uint64_t v6 = *(void *)(a2 + 8) >> 10;
    int v7 = *(_DWORD *)(a2 + 16) >> 10;
    int v8 = *(_DWORD *)(a2 + 20) >> 10;
    int v9 = 134218752;
    uint64_t v10 = v5;
    __int16 v11 = 2048;
    uint64_t v12 = v6;
    __int16 v13 = 1024;
    int v14 = v7;
    __int16 v15 = 1024;
    int v16 = v8;
    _os_log_impl(&dword_237AFF000, v4, OS_LOG_TYPE_DEFAULT, "[EVENT ] loopback results: Tx %lld kB, Rx %lld kB, Tx %d KB/s, Rx %d KB/s", (uint8_t *)&v9, 0x22u);
  }
  GpsFactoryTest::BasicTimer::heartbeat((GpsFactoryTest::BasicTimer *)(v3 + 224));
}

uint64_t std::__function::__func<GpsFactoryTest::runInternal(void)::$_7,std::allocator<GpsFactoryTest::runInternal(void)::$_7>,void ()(gnssTest::CommLoopbackResult const&)>::target(uint64_t a1, uint64_t a2)
{
    return a1 + 8;
  else {
    return 0;
  }
}

void *std::__function::__func<GpsFactoryTest::runInternal(void)::$_7,std::allocator<GpsFactoryTest::runInternal(void)::$_7>,void ()(gnssTest::CommLoopbackResult const&)>::target_type()
{
}

void *std::__function::__value_func<void ()(gnssTest::CommLoopbackResult const&)>::~__value_func[abi:ne180100](void *a1)
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

void std::__function::__func<GpsFactoryTest::testPeriodicFix(std::string *,int)::$_0,std::allocator<GpsFactoryTest::testPeriodicFix(std::string *,int)::$_0>,void ()(std::unique_ptr<gnss::Fix>)>::~__func()
{
}

void *std::__function::__func<GpsFactoryTest::testPeriodicFix(std::string *,int)::$_0,std::allocator<GpsFactoryTest::testPeriodicFix(std::string *,int)::$_0>,void ()(std::unique_ptr<gnss::Fix>)>::__clone(uint64_t a1)
{
  unint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *unint64_t result = &unk_26EAA75C0;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<GpsFactoryTest::testPeriodicFix(std::string *,int)::$_0,std::allocator<GpsFactoryTest::testPeriodicFix(std::string *,int)::$_0>,void ()(std::unique_ptr<gnss::Fix>)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_26EAA75C0;
  a2[1] = v2;
  return result;
}

void std::__function::__func<GpsFactoryTest::testPeriodicFix(std::string *,int)::$_0,std::allocator<GpsFactoryTest::testPeriodicFix(std::string *,int)::$_0>,void ()(std::unique_ptr<gnss::Fix>)>::operator()(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a2 = 0;
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v4 = v2;
  GpsFactoryTest::fixCallback(v3, &v4);
  if (v2)
  {
    JUMPOUT(0x237E29950);
  }
}

void sub_237B0981C(_Unwind_Exception *exception_object)
{
  if (v1) {
    MEMORY[0x237E29950](v1, 0x1000C4043D32D5CLL);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::__function::__func<GpsFactoryTest::testPeriodicFix(std::string *,int)::$_0,std::allocator<GpsFactoryTest::testPeriodicFix(std::string *,int)::$_0>,void ()(std::unique_ptr<gnss::Fix>)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<GpsFactoryTest::testPeriodicFix(std::string *,int)::$_0,std::allocator<GpsFactoryTest::testPeriodicFix(std::string *,int)::$_0>,void ()(std::unique_ptr<gnss::Fix>)>::target_type()
{
}

void std::__function::__func<GpsFactoryTest::testPeriodicFix(std::string *,int)::$_1,std::allocator<GpsFactoryTest::testPeriodicFix(std::string *,int)::$_1>,void ()(gnss::Result)>::~__func()
{
}

void *std::__function::__func<GpsFactoryTest::testPeriodicFix(std::string *,int)::$_1,std::allocator<GpsFactoryTest::testPeriodicFix(std::string *,int)::$_1>,void ()(gnss::Result)>::__clone(uint64_t a1)
{
  unint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *unint64_t result = &unk_26EAA7640;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<GpsFactoryTest::testPeriodicFix(std::string *,int)::$_1,std::allocator<GpsFactoryTest::testPeriodicFix(std::string *,int)::$_1>,void ()(gnss::Result)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_26EAA7640;
  a2[1] = v2;
  return result;
}

void std::__function::__func<GpsFactoryTest::testPeriodicFix(std::string *,int)::$_1,std::allocator<GpsFactoryTest::testPeriodicFix(std::string *,int)::$_1>,void ()(gnss::Result)>::operator()(uint64_t a1, unsigned int *a2)
{
}

uint64_t std::__function::__func<GpsFactoryTest::testPeriodicFix(std::string *,int)::$_1,std::allocator<GpsFactoryTest::testPeriodicFix(std::string *,int)::$_1>,void ()(gnss::Result)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<GpsFactoryTest::testPeriodicFix(std::string *,int)::$_1,std::allocator<GpsFactoryTest::testPeriodicFix(std::string *,int)::$_1>,void ()(gnss::Result)>::target_type()
{
}

void std::__function::__func<GpsFactoryTest::testCw(std::string *,int,gnss::Band,gnssTest::Subband,double,int)::$_0,std::allocator<GpsFactoryTest::testCw(std::string *,int,gnss::Band,gnssTest::Subband,double,int)::$_0>,void ()(std::vector<gnssTest::RfMeasurement>)>::~__func()
{
}

void *std::__function::__func<GpsFactoryTest::testCw(std::string *,int,gnss::Band,gnssTest::Subband,double,int)::$_0,std::allocator<GpsFactoryTest::testCw(std::string *,int,gnss::Band,gnssTest::Subband,double,int)::$_0>,void ()(std::vector<gnssTest::RfMeasurement>)>::__clone(uint64_t a1)
{
  unint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *unint64_t result = &unk_26EAA76C0;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<GpsFactoryTest::testCw(std::string *,int,gnss::Band,gnssTest::Subband,double,int)::$_0,std::allocator<GpsFactoryTest::testCw(std::string *,int,gnss::Band,gnssTest::Subband,double,int)::$_0>,void ()(std::vector<gnssTest::RfMeasurement>)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_26EAA76C0;
  a2[1] = v2;
  return result;
}

void std::__function::__func<GpsFactoryTest::testCw(std::string *,int,gnss::Band,gnssTest::Subband,double,int)::$_0,std::allocator<GpsFactoryTest::testCw(std::string *,int,gnss::Band,gnssTest::Subband,double,int)::$_0>,void ()(std::vector<gnssTest::RfMeasurement>)>::operator()(uint64_t a1, long long *a2)
{
  uint64_t v2 = *((void *)a2 + 2);
  long long v3 = *a2;
  *((void *)a2 + 1) = 0;
  *((void *)a2 + 2) = 0;
  *(void *)a2 = 0;
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v5 = (void *)v3;
  long long v6 = v3;
  uint64_t v7 = v2;
  GpsFactoryTest::rfMeasurementCallback(v4, (unsigned __int8 **)&v6);
  if (v5)
  {
    operator delete(v5);
  }
}

void sub_237B09A74(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, long long a9)
{
  if ((void)a9) {
    operator delete((void *)a9);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::__function::__func<GpsFactoryTest::testCw(std::string *,int,gnss::Band,gnssTest::Subband,double,int)::$_0,std::allocator<GpsFactoryTest::testCw(std::string *,int,gnss::Band,gnssTest::Subband,double,int)::$_0>,void ()(std::vector<gnssTest::RfMeasurement>)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<GpsFactoryTest::testCw(std::string *,int,gnss::Band,gnssTest::Subband,double,int)::$_0,std::allocator<GpsFactoryTest::testCw(std::string *,int,gnss::Band,gnssTest::Subband,double,int)::$_0>,void ()(std::vector<gnssTest::RfMeasurement>)>::target_type()
{
}

void std::__function::__func<GpsFactoryTest::testCw(std::string *,int,gnss::Band,gnssTest::Subband,double,int)::$_1,std::allocator<GpsFactoryTest::testCw(std::string *,int,gnss::Band,gnssTest::Subband,double,int)::$_1>,void ()(gnss::Result)>::~__func()
{
}

void *std::__function::__func<GpsFactoryTest::testCw(std::string *,int,gnss::Band,gnssTest::Subband,double,int)::$_1,std::allocator<GpsFactoryTest::testCw(std::string *,int,gnss::Band,gnssTest::Subband,double,int)::$_1>,void ()(gnss::Result)>::__clone(uint64_t a1)
{
  unint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *unint64_t result = &unk_26EAA7740;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<GpsFactoryTest::testCw(std::string *,int,gnss::Band,gnssTest::Subband,double,int)::$_1,std::allocator<GpsFactoryTest::testCw(std::string *,int,gnss::Band,gnssTest::Subband,double,int)::$_1>,void ()(gnss::Result)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_26EAA7740;
  a2[1] = v2;
  return result;
}

void std::__function::__func<GpsFactoryTest::testCw(std::string *,int,gnss::Band,gnssTest::Subband,double,int)::$_1,std::allocator<GpsFactoryTest::testCw(std::string *,int,gnss::Band,gnssTest::Subband,double,int)::$_1>,void ()(gnss::Result)>::operator()(uint64_t a1, unsigned int *a2)
{
}

uint64_t std::__function::__func<GpsFactoryTest::testCw(std::string *,int,gnss::Band,gnssTest::Subband,double,int)::$_1,std::allocator<GpsFactoryTest::testCw(std::string *,int,gnss::Band,gnssTest::Subband,double,int)::$_1>,void ()(gnss::Result)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<GpsFactoryTest::testCw(std::string *,int,gnss::Band,gnssTest::Subband,double,int)::$_1,std::allocator<GpsFactoryTest::testCw(std::string *,int,gnss::Band,gnssTest::Subband,double,int)::$_1>,void ()(gnss::Result)>::target_type()
{
}

void std::__function::__func<GpsFactoryTest::testModulated(std::string *,int,gnss::Band,gnssTest::Subband)::$_0,std::allocator<GpsFactoryTest::testModulated(std::string *,int,gnss::Band,gnssTest::Subband)::$_0>,void ()(std::vector<gnssTest::RfMeasurement>)>::~__func()
{
}

void *std::__function::__func<GpsFactoryTest::testModulated(std::string *,int,gnss::Band,gnssTest::Subband)::$_0,std::allocator<GpsFactoryTest::testModulated(std::string *,int,gnss::Band,gnssTest::Subband)::$_0>,void ()(std::vector<gnssTest::RfMeasurement>)>::__clone(uint64_t a1)
{
  unint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *unint64_t result = &unk_26EAA77C0;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<GpsFactoryTest::testModulated(std::string *,int,gnss::Band,gnssTest::Subband)::$_0,std::allocator<GpsFactoryTest::testModulated(std::string *,int,gnss::Band,gnssTest::Subband)::$_0>,void ()(std::vector<gnssTest::RfMeasurement>)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_26EAA77C0;
  a2[1] = v2;
  return result;
}

void std::__function::__func<GpsFactoryTest::testModulated(std::string *,int,gnss::Band,gnssTest::Subband)::$_0,std::allocator<GpsFactoryTest::testModulated(std::string *,int,gnss::Band,gnssTest::Subband)::$_0>,void ()(std::vector<gnssTest::RfMeasurement>)>::operator()(uint64_t a1, long long *a2)
{
  uint64_t v2 = *((void *)a2 + 2);
  long long v3 = *a2;
  *((void *)a2 + 1) = 0;
  *((void *)a2 + 2) = 0;
  *(void *)a2 = 0;
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v5 = (void *)v3;
  long long v6 = v3;
  uint64_t v7 = v2;
  GpsFactoryTest::rfMeasurementCallback(v4, (unsigned __int8 **)&v6);
  if (v5)
  {
    operator delete(v5);
  }
}

void sub_237B09CC0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, long long a9)
{
  if ((void)a9) {
    operator delete((void *)a9);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::__function::__func<GpsFactoryTest::testModulated(std::string *,int,gnss::Band,gnssTest::Subband)::$_0,std::allocator<GpsFactoryTest::testModulated(std::string *,int,gnss::Band,gnssTest::Subband)::$_0>,void ()(std::vector<gnssTest::RfMeasurement>)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<GpsFactoryTest::testModulated(std::string *,int,gnss::Band,gnssTest::Subband)::$_0,std::allocator<GpsFactoryTest::testModulated(std::string *,int,gnss::Band,gnssTest::Subband)::$_0>,void ()(std::vector<gnssTest::RfMeasurement>)>::target_type()
{
}

void std::__function::__func<GpsFactoryTest::testModulated(std::string *,int,gnss::Band,gnssTest::Subband)::$_1,std::allocator<GpsFactoryTest::testModulated(std::string *,int,gnss::Band,gnssTest::Subband)::$_1>,void ()(gnss::Result)>::~__func()
{
}

void *std::__function::__func<GpsFactoryTest::testModulated(std::string *,int,gnss::Band,gnssTest::Subband)::$_1,std::allocator<GpsFactoryTest::testModulated(std::string *,int,gnss::Band,gnssTest::Subband)::$_1>,void ()(gnss::Result)>::__clone(uint64_t a1)
{
  unint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *unint64_t result = &unk_26EAA7840;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<GpsFactoryTest::testModulated(std::string *,int,gnss::Band,gnssTest::Subband)::$_1,std::allocator<GpsFactoryTest::testModulated(std::string *,int,gnss::Band,gnssTest::Subband)::$_1>,void ()(gnss::Result)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_26EAA7840;
  a2[1] = v2;
  return result;
}

void std::__function::__func<GpsFactoryTest::testModulated(std::string *,int,gnss::Band,gnssTest::Subband)::$_1,std::allocator<GpsFactoryTest::testModulated(std::string *,int,gnss::Band,gnssTest::Subband)::$_1>,void ()(gnss::Result)>::operator()(uint64_t a1, unsigned int *a2)
{
}

uint64_t std::__function::__func<GpsFactoryTest::testModulated(std::string *,int,gnss::Band,gnssTest::Subband)::$_1,std::allocator<GpsFactoryTest::testModulated(std::string *,int,gnss::Band,gnssTest::Subband)::$_1>,void ()(gnss::Result)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<GpsFactoryTest::testModulated(std::string *,int,gnss::Band,gnssTest::Subband)::$_1,std::allocator<GpsFactoryTest::testModulated(std::string *,int,gnss::Band,gnssTest::Subband)::$_1>,void ()(gnss::Result)>::target_type()
{
}

void std::__function::__func<GpsFactoryTest::testApSignal(void)::$_0,std::allocator<GpsFactoryTest::testApSignal(void)::$_0>,void ()(gnss::Result)>::~__func()
{
}

void *std::__function::__func<GpsFactoryTest::testApSignal(void)::$_0,std::allocator<GpsFactoryTest::testApSignal(void)::$_0>,void ()(gnss::Result)>::__clone(uint64_t a1)
{
  unint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *unint64_t result = &unk_26EAA78C0;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<GpsFactoryTest::testApSignal(void)::$_0,std::allocator<GpsFactoryTest::testApSignal(void)::$_0>,void ()(gnss::Result)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_26EAA78C0;
  a2[1] = v2;
  return result;
}

void std::__function::__func<GpsFactoryTest::testApSignal(void)::$_0,std::allocator<GpsFactoryTest::testApSignal(void)::$_0>,void ()(gnss::Result)>::operator()(uint64_t a1, unsigned int *a2)
{
}

uint64_t std::__function::__func<GpsFactoryTest::testApSignal(void)::$_0,std::allocator<GpsFactoryTest::testApSignal(void)::$_0>,void ()(gnss::Result)>::target(uint64_t a1, uint64_t a2)
{
    return a1 + 8;
  else {
    return 0;
  }
}

void *std::__function::__func<GpsFactoryTest::testApSignal(void)::$_0,std::allocator<GpsFactoryTest::testApSignal(void)::$_0>,void ()(gnss::Result)>::target_type()
{
}

void std::__function::__func<GpsFactoryTest::testTimeMark(void)::$_0,std::allocator<GpsFactoryTest::testTimeMark(void)::$_0>,void ()(gnss::Result)>::~__func()
{
}

void *std::__function::__func<GpsFactoryTest::testTimeMark(void)::$_0,std::allocator<GpsFactoryTest::testTimeMark(void)::$_0>,void ()(gnss::Result)>::__clone(uint64_t a1)
{
  unint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *unint64_t result = &unk_26EAA7940;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<GpsFactoryTest::testTimeMark(void)::$_0,std::allocator<GpsFactoryTest::testTimeMark(void)::$_0>,void ()(gnss::Result)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_26EAA7940;
  a2[1] = v2;
  return result;
}

void std::__function::__func<GpsFactoryTest::testTimeMark(void)::$_0,std::allocator<GpsFactoryTest::testTimeMark(void)::$_0>,void ()(gnss::Result)>::operator()(uint64_t a1, unsigned int *a2)
{
}

uint64_t std::__function::__func<GpsFactoryTest::testTimeMark(void)::$_0,std::allocator<GpsFactoryTest::testTimeMark(void)::$_0>,void ()(gnss::Result)>::target(uint64_t a1, uint64_t a2)
{
    return a1 + 8;
  else {
    return 0;
  }
}

void *std::__function::__func<GpsFactoryTest::testTimeMark(void)::$_0,std::allocator<GpsFactoryTest::testTimeMark(void)::$_0>,void ()(gnss::Result)>::target_type()
{
}

void std::__function::__func<GpsFactoryTest::testCommPing(std::string *)::$_0,std::allocator<GpsFactoryTest::testCommPing(std::string *)::$_0>,void ()(std::string const&,std::string const&)>::~__func()
{
}

void *std::__function::__func<GpsFactoryTest::testCommPing(std::string *)::$_0,std::allocator<GpsFactoryTest::testCommPing(std::string *)::$_0>,void ()(std::string const&,std::string const&)>::__clone(uint64_t a1)
{
  unint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *unint64_t result = &unk_26EAA79C0;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<GpsFactoryTest::testCommPing(std::string *)::$_0,std::allocator<GpsFactoryTest::testCommPing(std::string *)::$_0>,void ()(std::string const&,std::string const&)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_26EAA79C0;
  a2[1] = v2;
  return result;
}

uint64_t std::__function::__func<GpsFactoryTest::testCommPing(std::string *)::$_0,std::allocator<GpsFactoryTest::testCommPing(std::string *)::$_0>,void ()(std::string const&,std::string const&)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<GpsFactoryTest::testCommPing(std::string *)::$_0,std::allocator<GpsFactoryTest::testCommPing(std::string *)::$_0>,void ()(std::string const&,std::string const&)>::target_type()
{
}

void std::__function::__func<GpsFactoryTest::testCommPing(std::string *)::$_1,std::allocator<GpsFactoryTest::testCommPing(std::string *)::$_1>,void ()(gnss::Result)>::~__func()
{
}

void *std::__function::__func<GpsFactoryTest::testCommPing(std::string *)::$_1,std::allocator<GpsFactoryTest::testCommPing(std::string *)::$_1>,void ()(gnss::Result)>::__clone(uint64_t a1)
{
  unint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *unint64_t result = &unk_26EAA7A40;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<GpsFactoryTest::testCommPing(std::string *)::$_1,std::allocator<GpsFactoryTest::testCommPing(std::string *)::$_1>,void ()(gnss::Result)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_26EAA7A40;
  a2[1] = v2;
  return result;
}

void std::__function::__func<GpsFactoryTest::testCommPing(std::string *)::$_1,std::allocator<GpsFactoryTest::testCommPing(std::string *)::$_1>,void ()(gnss::Result)>::operator()(uint64_t a1, unsigned int *a2)
{
}

uint64_t std::__function::__func<GpsFactoryTest::testCommPing(std::string *)::$_1,std::allocator<GpsFactoryTest::testCommPing(std::string *)::$_1>,void ()(gnss::Result)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<GpsFactoryTest::testCommPing(std::string *)::$_1,std::allocator<GpsFactoryTest::testCommPing(std::string *)::$_1>,void ()(gnss::Result)>::target_type()
{
}

void std::__function::__func<GpsFactoryTest::testPowerMode(gnssTest::PowerMode)::$_0,std::allocator<GpsFactoryTest::testPowerMode(gnssTest::PowerMode)::$_0>,void ()(gnss::Result)>::~__func()
{
}

void *std::__function::__func<GpsFactoryTest::testPowerMode(gnssTest::PowerMode)::$_0,std::allocator<GpsFactoryTest::testPowerMode(gnssTest::PowerMode)::$_0>,void ()(gnss::Result)>::__clone(uint64_t a1)
{
  unint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *unint64_t result = &unk_26EAA7AC0;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<GpsFactoryTest::testPowerMode(gnssTest::PowerMode)::$_0,std::allocator<GpsFactoryTest::testPowerMode(gnssTest::PowerMode)::$_0>,void ()(gnss::Result)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_26EAA7AC0;
  a2[1] = v2;
  return result;
}

void std::__function::__func<GpsFactoryTest::testPowerMode(gnssTest::PowerMode)::$_0,std::allocator<GpsFactoryTest::testPowerMode(gnssTest::PowerMode)::$_0>,void ()(gnss::Result)>::operator()(uint64_t a1, unsigned int *a2)
{
}

uint64_t std::__function::__func<GpsFactoryTest::testPowerMode(gnssTest::PowerMode)::$_0,std::allocator<GpsFactoryTest::testPowerMode(gnssTest::PowerMode)::$_0>,void ()(gnss::Result)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<GpsFactoryTest::testPowerMode(gnssTest::PowerMode)::$_0,std::allocator<GpsFactoryTest::testPowerMode(gnssTest::PowerMode)::$_0>,void ()(gnss::Result)>::target_type()
{
}

void CoreGPSTestPreflight(void)
{
  std::string::basic_string[abi:ne180100]<0>(&__p, "gpstool");
  isProcessRunning();
}

void sub_237B0A384(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

__CFString *stringifyTest(unsigned int a1)
{
  if (a1 > 8) {
    return @"Success";
  }
  else {
    return off_264CF00D0[a1];
  }
}

uint64_t errorCodeTranslator(unsigned int a1)
{
  if (a1 > 8) {
    return 0;
  }
  else {
    return dword_237B310BC[a1];
  }
}

uint64_t factTestReturnCodeTranslator(uint64_t a1)
{
  if (a1 < 9) {
    return dword_237B31098[(int)a1];
  }
  NSLog(&cfstr_Unknownretrunc.isa, a1);
  return 8;
}

uint64_t powerModeTranslator(int a1)
{
  return 4 * (a1 != 0);
}

uint64_t isEnableGpsTestForkProcess(void)
{
  unsigned int v0 = *(_DWORD *)(GpsdPlatformInfo::instance(0) + 8) - 103;
  return (v0 < 5) & (0x19u >> v0);
}

uint64_t forkProcessGpsTest(uint64_t a1, void *a2)
{
  unsigned int v4 = *(_DWORD *)(GpsdPlatformInfo::instance(0) + 8) - 103;
  BOOL v5 = v4 > 4;
  int v6 = (1 << v4) & 0x19;
  if (v5 || v6 == 0)
  {
    MEMORY[0x237E295A0](a1, "isEnableGpsTestForkProcess,0");
    return 2;
  }
  else
  {
    id v8 = objc_alloc_init(MEMORY[0x263F08B50]);
    [v8 setLaunchPath:@"/usr/local/bin/gpsfactorytest"];
    [v8 setArguments:a2];
    NSLog(&cfstr_Commandargumen.isa, [a2 componentsJoinedByString:@","]);
    int v9 = (void *)[MEMORY[0x263F08A80] pipe];
    [v8 setStandardOutput:v9];
    uint64_t v10 = (void *)[v9 fileHandleForReading];
    [v8 launch];
    [v8 waitUntilExit];
    uint64_t v11 = [v8 terminationStatus];
    uint64_t v12 = [v10 readDataToEndOfFile];
    __int16 v13 = (void *)[[NSString alloc] initWithData:v12 encoding:4];
    std::string::basic_string[abi:ne180100]<0>(&v15, (char *)[v13 UTF8String]);
    if (*(char *)(a1 + 23) < 0) {
      operator delete(*(void **)a1);
    }
    *(_OWORD *)a1 = v15;
    *(void *)(a1 + 16) = v16;
    NSLog(&cfstr_TestresultD.isa, v11);
    NSLog(&cfstr_Testoutput.isa, v13);

    return factTestReturnCodeTranslator(v11);
  }
}

void sub_237B0ABCC(_Unwind_Exception *a1)
{
  MEMORY[0x237E29950](v1, 0x10B2C4012DFF3E0);
  _Unwind_Resume(a1);
}

void sub_237B0AF20(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_237B0B028(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_237B0B56C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25,uint64_t a26,void *a27,uint64_t a28,int a29,__int16 a30,char a31,char a32,uint64_t a33,void *a34,uint64_t a35,int a36,__int16 a37,char a38,char a39)
{
  if (a19 < 0) {
    operator delete(__p);
  }
  if (a25 < 0) {
    operator delete(a20);
  }
  if (a32 < 0) {
    operator delete(a27);
  }
  if (a39 < 0) {
    operator delete(a34);
  }
  _Unwind_Resume(exception_object);
}

void sub_237B0B7A4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (a23 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_237B0B944(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_237B0BAB4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_237B0BBEC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_237B0BD10(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

std::string *__assign_helper_atomic_property_(uint64_t a1, uint64_t a2)
{
  std::string::operator=((std::string *)a1, (const std::string *)a2);
  std::string::operator=((std::string *)(a1 + 24), (const std::string *)(a2 + 24));
  long long v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  long long v6 = *(_OWORD *)(a2 + 96);
  long long v5 = *(_OWORD *)(a2 + 112);
  long long v7 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 124) = *(_OWORD *)(a2 + 124);
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 112) = v5;
  *(_OWORD *)(a1 + 80) = v7;
  std::string::operator=((std::string *)(a1 + 144), (const std::string *)(a2 + 144));
  *(_DWORD *)(a1 + 168) = *(_DWORD *)(a2 + 168);
  std::string::operator=((std::string *)(a1 + 176), (const std::string *)(a2 + 176));
  return std::string::operator=((std::string *)(a1 + 200), (const std::string *)(a2 + 200));
}

void std::string::__throw_out_of_range[abi:ne180100]()
{
}

void std::__throw_out_of_range[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::out_of_range::out_of_range[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_264CEFF30, MEMORY[0x263F8C068]);
}

void sub_237B0C018(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::out_of_range::out_of_range[abi:ne180100](std::logic_error *a1, const char *a2)
{
  unint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C390] + 16);
  return result;
}

void executeCommand(const char *a1@<X0>, void *a2@<X8>)
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  popen(a1, "r");
  operator new();
}

void sub_237B0C180(_Unwind_Exception *exception_object, int a2)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __cxa_begin_catch(exception_object);
  pclose(v2);
  __cxa_rethrow();
}

void sub_237B0C1A0(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(a1);
}

void isProcessRunning()
{
  std::operator+<char>();
  unsigned int v0 = std::string::append(&v3, "'");
  long long v1 = *(_OWORD *)&v0->__r_.__value_.__l.__data_;
  int64_t v5 = v0->__r_.__value_.__r.__words[2];
  *(_OWORD *)std::string __p = v1;
  v0->__r_.__value_.__l.__size_ = 0;
  v0->__r_.__value_.__r.__words[2] = 0;
  v0->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v3.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v3.__r_.__value_.__l.__data_);
  }
  if (v5 >= 0) {
    uint64_t v2 = __p;
  }
  else {
    uint64_t v2 = (void **)__p[0];
  }
  executeCommand((const char *)v2, &v3);
}

void sub_237B0C364(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::__shared_ptr_pointer<__sFILE *,int (*)(__sFILE *),std::allocator<__sFILE>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x237E29950);
}

uint64_t std::__shared_ptr_pointer<__sFILE *,int (*)(__sFILE *),std::allocator<__sFILE>>::__on_zero_shared(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))(*(void *)(a1 + 24));
}

uint64_t std::__shared_ptr_pointer<__sFILE *,int (*)(__sFILE *),std::allocator<__sFILE>>::__get_deleter(uint64_t a1, uint64_t a2)
{
    return a1 + 32;
  else {
    return 0;
  }
}

void std::__shared_weak_count::__release_shared[abi:ne180100](std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

void *GnssHal::ExtensionsFire::ExtensionsFire(void *this)
{
  *this = &unk_26EAA7BC0;
  return this;
}

double GnssHal::ExtensionsFireImpl::getGpsCrossCorrelationMaxThreshold_dBHz(GnssHal::ExtensionsFireImpl *this)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  GpsdPlatformInfo::instance(0);
  long long v1 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG))
  {
    int v3 = 134217984;
    uint64_t v4 = 0x4042000000000000;
    _os_log_debug_impl(&dword_237AFF000, v1, OS_LOG_TYPE_DEBUG, "HalExtensions,getGpsCrossCorrelationMaxThreshold_dBHz,%f", (uint8_t *)&v3, 0xCu);
  }
  return 36.0;
}

double GnssHal::ExtensionsFireImpl::getGpsCrossCorrelationMinThreshold_dBHz(GnssHal::ExtensionsFireImpl *this)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  long long v1 = (GpsdPlatformInfo *)GpsdPlatformInfo::instance(0);
  double GpsCrossCorrelationMinThreshold_dBHz = GpsdPlatformInfo::getGpsCrossCorrelationMinThreshold_dBHz(v1);
  int v3 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 134217984;
    double v6 = GpsCrossCorrelationMinThreshold_dBHz;
    _os_log_debug_impl(&dword_237AFF000, v3, OS_LOG_TYPE_DEBUG, "HalExtensions,getGpsCrossCorrelationMinThreshold_dBHz,%f", (uint8_t *)&v5, 0xCu);
  }
  return GpsCrossCorrelationMinThreshold_dBHz;
}

uint64_t GnssHal::ExtensionsFireImpl::externalToChipL5GroupDelayMeters(GnssHal::ExtensionsFireImpl *this)
{
  long long v1 = (id *)GpsdPreferences::instance(0);
  return GpsdPreferences::externalToChipL5GroupDelayMeters(v1);
}

void GnssHal::ExtensionsFireImpl::glonassPerFrequencyGroupDelayMeters(char **a1@<X8>)
{
  int v3 = (id *)GpsdPreferences::instance(0);
  GpsdPreferences::glonassPerFrequencyGroupDelayMeters(v3, a1);
}

uint64_t GnssHal::ExtensionsFireImpl::submitSoftwareRecoveryStatistics(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 48))();
  }
  return result;
}

uint64_t GnssHal::ExtensionsFireImpl::isCntinAvailable(GnssHal::ExtensionsFireImpl *this)
{
  long long v1 = (GpsdPlatformInfo *)GpsdPlatformInfo::instance(0);
  unsigned int v2 = *((_DWORD *)v1 + 2) - 103;
  BOOL v3 = v2 >= 4;
  BOOL v5 = v2 == 4;
  int v4 = (1 << v2) & 0x19;
  BOOL v5 = !v5 && v3 || v4 == 0;
  if (v5) {
    return 0;
  }
  return GpsdPlatformInfo::isPhone(v1);
}

void *GnssHal::ExtensionsFireImpl::setCntinEnable(GnssHal::ExtensionsFireImpl *this)
{
  v5[4] = *MEMORY[0x263EF8340];
  unsigned int v2 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl(&dword_237AFF000, v2, OS_LOG_TYPE_INFO, "#cntin,setCntinEnable", v4, 2u);
  }
  uint64_t result = (void *)*((void *)this + 8);
  if (result)
  {
    v5[0] = &unk_26EAA7D18;
    v5[1] = this;
    v5[3] = v5;
    (*(void (**)(void *, void *))(*result + 48))(result, v5);
    return std::__function::__value_func<void ()(GnssHal::ExtensionsFire::CntinStatus)>::~__value_func[abi:ne180100](v5);
  }
  return result;
}

void sub_237B0C834(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__function::__value_func<void ()(GnssHal::ExtensionsFire::CntinStatus)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

uint64_t GnssHal::ExtensionsFireImpl::setCntinDisable(GnssHal::ExtensionsFireImpl *this)
{
  unsigned int v2 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl(&dword_237AFF000, v2, OS_LOG_TYPE_INFO, "#cntin,setCntinDisable", v4, 2u);
  }
  uint64_t result = *((void *)this + 12);
  if (result) {
    return (*(uint64_t (**)(uint64_t))(*(void *)result + 48))(result);
  }
  return result;
}

void *GnssHal::ExtensionsFireImpl::setCntinStatusCb(uint64_t a1, void *a2)
{
  v12[3] = *MEMORY[0x263EF8340];
  int v4 = GpsdLogObjectWarning;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectWarning, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl(&dword_237AFF000, v4, OS_LOG_TYPE_DEFAULT, "#cntin,setCntinStatusCb", v10, 2u);
  }
  BOOL v5 = (void *)a2[3];
  if (v5)
  {
    if (v5 == a2)
    {
      uint64_t v11 = v10;
      (*(void (**)(void *, uint8_t *))(*a2 + 24))(a2, v10);
    }
    else
    {
      uint64_t v11 = (uint8_t *)(*(uint64_t (**)(void *))(*v5 + 16))(v5);
    }
  }
  else
  {
    uint64_t v11 = 0;
  }
  uint64_t v6 = a1 + 104;
  if (v10 != (uint8_t *)(a1 + 104))
  {
    uint64_t v7 = v11;
    uint64_t v8 = *(void *)(a1 + 128);
    if (v11 == v10)
    {
      if (v8 == v6)
      {
        (*(void (**)(uint8_t *, void *))(*(void *)v10 + 24))(v10, v12);
        (*(void (**)(uint8_t *))(*(void *)v11 + 32))(v11);
        uint64_t v11 = 0;
        (*(void (**)(void, uint8_t *))(**(void **)(a1 + 128) + 24))(*(void *)(a1 + 128), v10);
        (*(void (**)(void))(**(void **)(a1 + 128) + 32))(*(void *)(a1 + 128));
        *(void *)(a1 + 128) = 0;
        uint64_t v11 = v10;
        (*(void (**)(void *, uint64_t))(v12[0] + 24))(v12, a1 + 104);
        (*(void (**)(void *))(v12[0] + 32))(v12);
      }
      else
      {
        (*(void (**)(uint8_t *, uint64_t))(*(void *)v10 + 24))(v10, a1 + 104);
        (*(void (**)(uint8_t *))(*(void *)v11 + 32))(v11);
        uint64_t v11 = *(uint8_t **)(a1 + 128);
      }
      *(void *)(a1 + 128) = v6;
    }
    else if (v8 == v6)
    {
      (*(void (**)(uint64_t, uint8_t *))(*(void *)v6 + 24))(a1 + 104, v10);
      (*(void (**)(void))(**(void **)(a1 + 128) + 32))(*(void *)(a1 + 128));
      *(void *)(a1 + 128) = v11;
      uint64_t v11 = v10;
    }
    else
    {
      uint64_t v11 = *(uint8_t **)(a1 + 128);
      *(void *)(a1 + 128) = v7;
    }
  }
  return std::__function::__value_func<void ()(GnssHal::ExtensionsFire::CntinStatus)>::~__value_func[abi:ne180100](v10);
}

void sub_237B0CC24(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

uint64_t GnssHal::ExtensionsFireImpl::factoryTestXml@<X0>(GnssHal::ExtensionsFireImpl *this@<X0>, void *a2@<X8>)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t result = *((void *)this + 32);
  if (result)
  {
    (*(void (**)(void **__return_ptr))(*(void *)result + 48))(__p);
    BOOL v3 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = __p;
      if (v6 < 0) {
        int v4 = (void **)__p[0];
      }
      *(_DWORD *)int buf = 136315138;
      uint64_t v8 = v4;
      _os_log_impl(&dword_237AFF000, v3, OS_LOG_TYPE_DEFAULT, "factoryTestXml,%s", buf, 0xCu);
    }
    operator new();
  }
  *a2 = 0;
  return result;
}

void sub_237B0CD7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  MEMORY[0x237E29950](v15, 0x1012C40EC159624);
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

uint64_t GnssHal::ExtensionsFireImpl::factoryTestJob@<X0>(GnssHal::ExtensionsFireImpl *this@<X0>, void *a2@<X8>)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t result = *((void *)this + 36);
  if (result)
  {
    (*(void (**)(void **__return_ptr))(*(void *)result + 48))(__p);
    BOOL v3 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = __p;
      if (v6 < 0) {
        int v4 = (void **)__p[0];
      }
      *(_DWORD *)int buf = 136315138;
      uint64_t v8 = v4;
      _os_log_impl(&dword_237AFF000, v3, OS_LOG_TYPE_DEFAULT, "factoryTestJob,%s", buf, 0xCu);
    }
    operator new();
  }
  *a2 = 0;
  return result;
}

void sub_237B0CF0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  MEMORY[0x237E29950](v15, 0x1012C40EC159624);
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void GnssHal::ExtensionsFireImpl::bundleName(GnssHal::ExtensionsFireImpl *this)
{
  long long v1 = (GpsdPreferences *)GpsdPreferences::instance(0);
  GpsdPreferences::bundleName(v1, &v2);
  operator new();
}

void sub_237B0CFB4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void GnssHal::ExtensionsFireImpl::nvStorePath(GnssHal::ExtensionsFireImpl *this)
{
  long long v1 = (id *)GpsdPreferences::instance(0);
  GpsdPreferences::nvStorePath(v1, &v2);
  operator new();
}

void sub_237B0D034(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

char *GnssHal::ExtensionsFireImpl::getGpsWeekFromBuildDate(GnssHal::ExtensionsFireImpl *this)
{
  if (*((unsigned char *)this + 296)) {
    return (char *)2049;
  }
  else {
    return gpsd::util::getGpsWeekFromBuildDate(this);
  }
}

void GnssHal::ExtensionsFireImpl::setGnssChipInfo(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  BOOL v5 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    if (*((char *)a2 + 23) >= 0) {
      char v6 = a2;
    }
    else {
      char v6 = (uint64_t *)*a2;
    }
    if (*((char *)a3 + 23) >= 0) {
      uint64_t v7 = a3;
    }
    else {
      uint64_t v7 = (uint64_t *)*a3;
    }
    int v8 = 136446467;
    uint64_t v9 = v6;
    __int16 v10 = 2081;
    uint64_t v11 = v7;
    _os_log_impl(&dword_237AFF000, v5, OS_LOG_TYPE_DEFAULT, "#gdm,chipVersion,%{public}s,serial,%{private}s", (uint8_t *)&v8, 0x16u);
  }
}

BOOL GnssHal::ExtensionsFireImpl::supportsL5(GnssHal::ExtensionsFireImpl *this)
{
  long long v1 = (id *)GpsdPreferences::instance(0);
  int v2 = GpsdPreferences::enableL5(v1);
  BOOL result = 0;
  if (v2) {
    return *(unsigned char *)(GpsdPlatformInfo::instance(0) + 24) != 0;
  }
  return result;
}

uint64_t GnssHal::ExtensionsFireImpl::debugFeaturesBitmask(GnssHal::ExtensionsFireImpl *this)
{
  long long v1 = (id *)GpsdPreferences::instance(0);
  return GpsdPreferences::debugFeaturesBitmask(v1);
}

uint64_t GnssHal::ExtensionsFireImpl::platformSpecificFeaturesBitmask(GnssHal::ExtensionsFireImpl *this)
{
  long long v1 = (id *)GpsdPreferences::instance(0);
  return GpsdPreferences::platformSpecificFeaturesBitmask(v1);
}

void *GnssHal::ExtensionsFireImpl::debugSettingsString@<X0>(void *a1@<X8>)
{
  BOOL v3 = (id *)GpsdPreferences::instance(0);
  return GpsdPreferences::debugSettingsString(v3, a1);
}

uint64_t GnssHal::ExtensionsFireImpl::updateReceiverClockAnalyticsData(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 160);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 48))();
  }
  return result;
}

uint64_t GnssHal::ExtensionsFireImpl::updateRtcClockAnalyticsData(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 192);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 48))();
  }
  return result;
}

uint64_t GnssHal::ExtensionsFireImpl::updateL5GroupDelayAnalyticsData(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 224);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 48))();
  }
  return result;
}

uint64_t GnssHal::ExtensionsFireImpl::platform(GnssHal::ExtensionsFireImpl *this)
{
  long long v1 = (id *)GpsdPreferences::instance(0);
  unsigned int v2 = GpsdPreferences::forceFireExtensionsPlatform(v1) + 1;
  if (v2 < 9 && ((0x199u >> v2) & 1) != 0) {
    return dword_237B312C8[v2];
  }
  if (*(_DWORD *)(GpsdPlatformInfo::instance(0) + 8) == 103) {
    return 2;
  }
  if (*(_DWORD *)(GpsdPlatformInfo::instance(0) + 8) == 106) {
    return 3;
  }
  if (*(_DWORD *)(GpsdPlatformInfo::instance(0) + 8) == 107) {
    return 4;
  }
  int v4 = GpsdLogObjectGeneral;
  uint64_t result = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_FAULT);
  if (result)
  {
    *(_WORD *)BOOL v5 = 0;
    _os_log_fault_impl(&dword_237AFF000, v4, OS_LOG_TYPE_FAULT, "UnknownPlatformExtensionFire", v5, 2u);
    return 0;
  }
  return result;
}

void GnssHal::ExtensionsFireImpl::~ExtensionsFireImpl(GnssHal::ExtensionsFireImpl *this)
{
  *(void *)this = &unk_26EAA7DA8;
  unsigned int v2 = (void *)((char *)this + 8);
  std::__function::__value_func<std::string ()(void)>::~__value_func[abi:ne180100]((void *)this + 33);
  std::__function::__value_func<std::string ()(void)>::~__value_func[abi:ne180100]((void *)this + 29);
  std::__function::__value_func<void ()(gnss::L5GroupDelayAnalyticsData const&)>::~__value_func[abi:ne180100]((void *)this + 25);
  std::__function::__value_func<void ()(gnss::RtcClockAnalyticsData const&)>::~__value_func[abi:ne180100]((void *)this + 21);
  std::__function::__value_func<void ()(gnss::ReceiverClockAnalyticsData const&)>::~__value_func[abi:ne180100]((void *)this + 17);
  std::__function::__value_func<void ()(GnssHal::ExtensionsFire::CntinStatus)>::~__value_func[abi:ne180100]((void *)this + 13);
  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100]((void *)this + 9);
  std::__function::__value_func<void ()(std::function<void ()(GnssHal::ExtensionsFire::CntinStatus)>)>::~__value_func[abi:ne180100]((void *)this + 5);
  std::__function::__value_func<void ()(GnssHal::ExtensionsFire::RecoveryStatistics const&)>::~__value_func[abi:ne180100](v2);
}

{
  void *v2;
  uint64_t vars8;

  *(void *)this = &unk_26EAA7DA8;
  unsigned int v2 = (void *)((char *)this + 8);
  std::__function::__value_func<std::string ()(void)>::~__value_func[abi:ne180100]((void *)this + 33);
  std::__function::__value_func<std::string ()(void)>::~__value_func[abi:ne180100]((void *)this + 29);
  std::__function::__value_func<void ()(gnss::L5GroupDelayAnalyticsData const&)>::~__value_func[abi:ne180100]((void *)this + 25);
  std::__function::__value_func<void ()(gnss::RtcClockAnalyticsData const&)>::~__value_func[abi:ne180100]((void *)this + 21);
  std::__function::__value_func<void ()(gnss::ReceiverClockAnalyticsData const&)>::~__value_func[abi:ne180100]((void *)this + 17);
  std::__function::__value_func<void ()(GnssHal::ExtensionsFire::CntinStatus)>::~__value_func[abi:ne180100]((void *)this + 13);
  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100]((void *)this + 9);
  std::__function::__value_func<void ()(std::function<void ()(GnssHal::ExtensionsFire::CntinStatus)>)>::~__value_func[abi:ne180100]((void *)this + 5);
  std::__function::__value_func<void ()(GnssHal::ExtensionsFire::RecoveryStatistics const&)>::~__value_func[abi:ne180100](v2);
  JUMPOUT(0x237E29950);
}

void std::__throw_bad_function_call[abi:ne180100]()
{
  exception = __cxa_allocate_exception(8uLL);
}

void std::bad_function_call::~bad_function_call(std::bad_function_call *this)
{
  std::exception::~exception(this);
  JUMPOUT(0x237E29950);
}

void std::__function::__func<GnssHal::ExtensionsFireImpl::setCntinEnable(void)::$_0,std::allocator<GnssHal::ExtensionsFireImpl::setCntinEnable(void)::$_0>,void ()(GnssHal::ExtensionsFire::CntinStatus)>::~__func()
{
}

void *std::__function::__func<GnssHal::ExtensionsFireImpl::setCntinEnable(void)::$_0,std::allocator<GnssHal::ExtensionsFireImpl::setCntinEnable(void)::$_0>,void ()(GnssHal::ExtensionsFire::CntinStatus)>::__clone(uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *uint64_t result = &unk_26EAA7D18;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<GnssHal::ExtensionsFireImpl::setCntinEnable(void)::$_0,std::allocator<GnssHal::ExtensionsFireImpl::setCntinEnable(void)::$_0>,void ()(GnssHal::ExtensionsFire::CntinStatus)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_26EAA7D18;
  a2[1] = v2;
  return result;
}

void std::__function::__func<GnssHal::ExtensionsFireImpl::setCntinEnable(void)::$_0,std::allocator<GnssHal::ExtensionsFireImpl::setCntinEnable(void)::$_0>,void ()(GnssHal::ExtensionsFire::CntinStatus)>::operator()(uint64_t a1, int *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v2 = *a2;
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v4 = *(void *)(v3 + 128);
  BOOL v5 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
  {
    v7[0] = 67240448;
    v7[1] = v2;
    __int16 v8 = 1026;
    BOOL v9 = v4 != 0;
    _os_log_impl(&dword_237AFF000, v5, OS_LOG_TYPE_INFO, "#cntin,status,%{public}d,hasHandler,%{public}d", (uint8_t *)v7, 0xEu);
  }
  if (v4)
  {
    uint64_t v6 = *(void *)(v3 + 128);
    v7[0] = v2;
    if (!v6) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    (*(void (**)(uint64_t, _DWORD *))(*(void *)v6 + 48))(v6, v7);
  }
}

uint64_t std::__function::__func<GnssHal::ExtensionsFireImpl::setCntinEnable(void)::$_0,std::allocator<GnssHal::ExtensionsFireImpl::setCntinEnable(void)::$_0>,void ()(GnssHal::ExtensionsFire::CntinStatus)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<GnssHal::ExtensionsFireImpl::setCntinEnable(void)::$_0,std::allocator<GnssHal::ExtensionsFireImpl::setCntinEnable(void)::$_0>,void ()(GnssHal::ExtensionsFire::CntinStatus)>::target_type()
{
}

void *GnssHal::ExtensionsOlaf::ExtensionsOlaf(void *this)
{
  *this = &unk_26EAA7E80;
  return this;
}

void *GnssHal::ExtensionsOlafImpl::requestLtlInfo(void *result, uint64_t a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (result[4])
  {
    uint64_t v4 = result;
    BOOL v5 = (void *)a3[3];
    if (v5)
    {
      if (v5 == a3)
      {
        __int16 v8 = v7;
        (*(void (**)(void *, void *))(*a3 + 24))(a3, v7);
      }
      else
      {
        __int16 v8 = (void *)(*(uint64_t (**)(void *))(*v5 + 16))(v5);
      }
    }
    else
    {
      __int16 v8 = 0;
    }
    uint64_t v6 = v4[4];
    if (!v6) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    (*(void (**)(uint64_t, uint64_t, void *))(*(void *)v6 + 48))(v6, a2, v7);
    return std::__function::__value_func<void ()(GnssHal::ExtensionsOlaf::LtlInfo const&)>::~__value_func[abi:ne180100](v7);
  }
  return result;
}

void sub_237B0D880(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
}

double GnssHal::ExtensionsOlafImpl::groupDelayL1InCAChips(GnssHal::ExtensionsOlafImpl *this)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  long long v1 = (id *)GpsdPreferences::instance(0);
  GpsdPreferences::groupDelayL1InCAChips(v1);
  double v3 = v2;
  uint64_t v4 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
  {
    int v6 = 134217984;
    double v7 = v3;
    _os_log_impl(&dword_237AFF000, v4, OS_LOG_TYPE_INFO, "ExtensionsOlafImpl,groupDelayL1InCAChips,%f", (uint8_t *)&v6, 0xCu);
  }
  return v3;
}

uint64_t GnssHal::ExtensionsOlafImpl::enableInertialFusion(GnssHal::ExtensionsOlafImpl *this)
{
  long long v1 = (id *)GpsdPreferences::instance(0);
  return GpsdPreferences::isRavenExpected(v1) ^ 1;
}

BOOL GnssHal::ExtensionsOlafImpl::platform(GnssHal::ExtensionsOlafImpl *this)
{
  uint64_t v1 = GpsdPlatformInfo::instance(0);
  BOOL result = 0;
  if (*(_DWORD *)(v1 + 8) != 201)
  {
    if (*(_DWORD *)(GpsdPlatformInfo::instance(0) + 8) == 202)
    {
      return 1;
    }
    else
    {
      double v3 = GpsdLogObjectGeneral;
      BOOL result = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_FAULT);
      if (result)
      {
        *(_WORD *)uint64_t v4 = 0;
        _os_log_fault_impl(&dword_237AFF000, v3, OS_LOG_TYPE_FAULT, "Unhandled platform in ExtensionsOlaf", v4, 2u);
        return 0;
      }
    }
  }
  return result;
}

char *GnssHal::ExtensionsOlafImpl::getGpsWeekFromBuildDate(GnssHal::ExtensionsOlafImpl *this)
{
  if (*((unsigned char *)this + 104)) {
    return (char *)2049;
  }
  else {
    return gpsd::util::getGpsWeekFromBuildDate(this);
  }
}

uint64_t GnssHal::ExtensionsOlafImpl::supportsL5(GnssHal::ExtensionsOlafImpl *this)
{
  return *(unsigned __int8 *)(GpsdPlatformInfo::instance(0) + 24);
}

void GnssHal::ExtensionsOlafImpl::requestBasebandReset(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  int v6 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    double v7 = (const std::string::value_type *)a3;
    if (*(char *)(a3 + 23) < 0) {
      double v7 = *(const std::string::value_type **)a3;
    }
    *(_DWORD *)int buf = 67240451;
    *(_DWORD *)uint64_t v15 = a2;
    *(_WORD *)&void v15[4] = 2081;
    *(void *)&v15[6] = v7;
    _os_log_impl(&dword_237AFF000, v6, OS_LOG_TYPE_DEFAULT, "#bbReset,extensionsOlaf,%{public}d,%{private}s", buf, 0x12u);
  }
  uint64_t v8 = *(void *)(a1 + 64);
  if (!v8)
  {
    uint64_t v9 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int buf = 0;
      _os_log_error_impl(&dword_237AFF000, v9, OS_LOG_TYPE_ERROR, "requestBasebandReset invoked without a handler", buf, 2u);
      uint64_t v9 = GpsdLogObjectGeneral;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 136446722;
      *(void *)uint64_t v15 = "/Library/Caches/com.apple.xbs/Sources/CoreGPS/Sources/HAL/Implementation/GnssHalExtensionsOlafImpl.mm";
      *(_WORD *)&v15[8] = 1026;
      *(_DWORD *)&v15[10] = 58;
      __int16 v16 = 2082;
      uint64_t v17 = "requestBasebandReset";
      _os_log_error_impl(&dword_237AFF000, v9, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: assertion failure in %{public}s", buf, 0x1Cu);
    }
    std::string::basic_string[abi:ne180100]<0>(&v13, "assert");
    std::string::basic_string[abi:ne180100]<0>(&v12, "requestBasebandReset");
    std::string::basic_string[abi:ne180100]<0>(&v11, "requestBasebandReset invoked without a handler");
    gpsd::util::triggerDiagnosticReport((uint64_t)&v13, (uint64_t)&v12, (uint64_t)&v11);
    std::string::~string(&v11);
    std::string::~string(&v12);
    std::string::~string(&v13);
    __assert_rtn("requestBasebandReset", "GnssHalExtensionsOlafImpl.mm", 58, "false && \"requestBasebandReset invoked without a handler\"");
  }
  if (*(char *)(a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a3, *(void *)(a3 + 8));
    uint64_t v8 = *(void *)(a1 + 64);
    *(_DWORD *)int buf = a2;
    if (!v8) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
  }
  else
  {
    std::string __p = *(std::string *)a3;
    *(_DWORD *)int buf = a2;
  }
  (*(void (**)(uint64_t, uint8_t *, std::string *))(*(void *)v8 + 48))(v8, buf, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
}

void sub_237B0DCE0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,char a27,uint64_t a28,int a29,__int16 a30,char a31,char a32)
{
  if (a14 < 0) {
    operator delete(a9);
  }
  _Unwind_Resume(exception_object);
}

void GnssHal::ExtensionsOlafImpl::~ExtensionsOlafImpl(GnssHal::ExtensionsOlafImpl *this)
{
  *(void *)this = &unk_26EAA7F18;
  uint64_t v1 = (void *)((char *)this + 8);
  std::__function::__value_func<void ()(int,std::string)>::~__value_func[abi:ne180100]((void *)this + 5);
  std::__function::__value_func<void ()(GnssHal::ExtensionsOlaf::LtlInfoRequest const&,std::function<void ()(GnssHal::ExtensionsOlaf::LtlInfo const&)>)>::~__value_func[abi:ne180100](v1);
}

{
  void *v1;
  uint64_t vars8;

  *(void *)this = &unk_26EAA7F18;
  uint64_t v1 = (void *)((char *)this + 8);
  std::__function::__value_func<void ()(int,std::string)>::~__value_func[abi:ne180100]((void *)this + 5);
  std::__function::__value_func<void ()(GnssHal::ExtensionsOlaf::LtlInfoRequest const&,std::function<void ()(GnssHal::ExtensionsOlaf::LtlInfo const&)>)>::~__value_func[abi:ne180100](v1);
  JUMPOUT(0x237E29950);
}

uint64_t GnssHal::ExtensionsOlafImpl::debugFeaturesBitmask(GnssHal::ExtensionsOlafImpl *this)
{
  return 0;
}

uint64_t GnssHal::ExtensionsOlafImpl::platformSpecificFeaturesBitmask(GnssHal::ExtensionsOlafImpl *this)
{
  return 0;
}

void GnssHal::ExtensionsOlafImpl::debugSettingsString(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
}

double GnssHal::ExtensionsOlafImpl::crossCorrelationSettings(GnssHal::ExtensionsOlafImpl *this)
{
  return *((double *)this + 9);
}

void *std::__function::__value_func<void ()(GnssHal::ExtensionsOlaf::LtlInfo const&)>::~__value_func[abi:ne180100](void *a1)
{
  double v2 = (void *)a1[3];
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

void proto::gnsshal::protobuf_AssignDesc_GnssHalNvStore_2eproto(proto::gnsshal *this, uint64_t a2, uint64_t a3, const char *a4)
{
  proto::gnsshal::protobuf_AddDesc_GnssHalNvStore_2eproto(this, a2, a3, a4);
  wireless_diagnostics::google::protobuf::DescriptorPool::generated_pool(v4);
  std::string::basic_string[abi:ne180100]<0>(__p, "GnssHalNvStore.proto");
  uint64_t FileByName = wireless_diagnostics::google::protobuf::DescriptorPool::FindFileByName();
  uint64_t v6 = FileByName;
  if (v8 < 0)
  {
    operator delete(__p[0]);
    if (v6) {
      goto LABEL_6;
    }
  }
  else if (FileByName)
  {
    goto LABEL_6;
  }
  wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
  wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
  wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)__p);
LABEL_6:
  _MergedGlobals = *(void *)(v6 + 80);
  operator new();
}

void sub_237B0E080(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
}

void proto::gnsshal::protobuf_AddDesc_GnssHalNvStore_2eproto(proto::gnsshal *this, uint64_t a2, uint64_t a3, const char *a4)
{
  if ((proto::gnsshal::protobuf_AddDesc_GnssHalNvStore_2eproto(void)::already_here & 1) == 0)
  {
    proto::gnsshal::protobuf_AddDesc_GnssHalNvStore_2eproto(void)::already_here = 1;
    wireless_diagnostics::google::protobuf::internal::VerifyVersion((wireless_diagnostics::google::protobuf::internal *)0x1E9808, 2005000, (uint64_t)"Sources/Protobuf/Generated/GnssHalNvStore.pb.cc", a4);
    wireless_diagnostics::google::protobuf::DescriptorPool::InternalAddGeneratedFile((wireless_diagnostics::google::protobuf::DescriptorPool *)"\n\x14GnssHalNvStore.proto\x12\rproto.gnsshal\"I\n\aNvStore\x12\x13\n\aversion\x18\x01 \x01(\x05:\x02-1\x12)\n\x05items\x18\x02 \x03(\v2\x1A.proto.gnsshal.NvStoreItem\"\xB9\x01\n\vNvStoreItem\x12\n\n\x02id\x18\x01 \x01(\x03\x12\f\n\x04blob\x18\x02 \x01(\f\x12 \n\x15blob_truncated_sha256\x18\x03 \x01(\r:\x010\x12\x1E\n\x12modification_count\x18\x04 \x01(\x03:\x02-1\x12$\n\x18creation_cf_time_seconds\x18\x05 \x01(\x01:\x02-1\x12(\n\x1Cmodification_cf_time_seconds\x18\x06 \x01(\x01:\x02-1", (const void *)0x12C);
    wireless_diagnostics::google::protobuf::MessageFactory::InternalRegisterGeneratedFile();
    operator new();
  }
}

void sub_237B0E1D0(_Unwind_Exception *a1)
{
  uint64_t v2 = v1;
  MEMORY[0x237E29950](v2, 0x10A1C40F05C313FLL);
  _Unwind_Resume(a1);
}

uint64_t proto::gnsshal::protobuf_ShutdownFile_GnssHalNvStore_2eproto(proto::gnsshal *this)
{
  if (proto::gnsshal::NvStore::default_instance_) {
    (*(void (**)(uint64_t))(*(void *)proto::gnsshal::NvStore::default_instance_ + 8))(proto::gnsshal::NvStore::default_instance_);
  }
  if (qword_2689430B8) {
    (*(void (**)(uint64_t))(*(void *)qword_2689430B8 + 8))(qword_2689430B8);
  }
  if (proto::gnsshal::NvStoreItem::default_instance_) {
    (*(void (**)(uint64_t))(*(void *)proto::gnsshal::NvStoreItem::default_instance_ + 8))(proto::gnsshal::NvStoreItem::default_instance_);
  }
  uint64_t result = qword_2689430C8;
  if (qword_2689430C8)
  {
    uint64_t v2 = *(uint64_t (**)(void))(*(void *)qword_2689430C8 + 8);
    return v2();
  }
  return result;
}

uint64_t proto::gnsshal::anonymous namespace'::protobuf_RegisterTypes(proto::gnsshal *a1)
{
  uint64_t v1 = qword_2689430D0;
  __dmb(0xBu);
  if (v1 != 2)
  {
    v4[0] = MEMORY[0x263F8C768] + 16;
    v4[1] = proto::gnsshal::protobuf_AssignDesc_GnssHalNvStore_2eproto;
    char v5 = 0;
    wireless_diagnostics::google::protobuf::GoogleOnceInitImpl();
    wireless_diagnostics::google::protobuf::internal::FunctionClosure0::~FunctionClosure0((wireless_diagnostics::google::protobuf::internal::FunctionClosure0 *)v4);
  }
  if (!proto::gnsshal::NvStore::default_instance_) {
    proto::gnsshal::protobuf_AddDesc_GnssHalNvStore_2eproto(a1);
  }
  uint64_t v2 = (proto::gnsshal *)wireless_diagnostics::google::protobuf::MessageFactory::InternalRegisterGeneratedMessage();
  if (!proto::gnsshal::NvStoreItem::default_instance_) {
    proto::gnsshal::protobuf_AddDesc_GnssHalNvStore_2eproto(v2);
  }
  return wireless_diagnostics::google::protobuf::MessageFactory::InternalRegisterGeneratedMessage();
}

void sub_237B0E3C4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  wireless_diagnostics::google::protobuf::internal::FunctionClosure0::~FunctionClosure0((wireless_diagnostics::google::protobuf::internal::FunctionClosure0 *)va);
  _Unwind_Resume(a1);
}

proto::gnsshal::NvStore *proto::gnsshal::NvStore::NvStore(proto::gnsshal::NvStore *this)
{
  *(void *)this = &unk_26EAA7FE0;
  wireless_diagnostics::google::protobuf::UnknownFieldSet::UnknownFieldSet((proto::gnsshal::NvStore *)((char *)this + 8));
  *((void *)this + 2) = 0;
  *((void *)this + 3) = 0;
  *((_DWORD *)this + 8) = 0;
  *((void *)this + 5) = 0xFFFFFFFFLL;
  *((_DWORD *)this + 12) = 0;
  return this;
}

double proto::gnsshal::NvStore::SharedCtor(proto::gnsshal::NvStore *this)
{
  *(void *)&double result = 0xFFFFFFFFLL;
  *((void *)this + 5) = 0xFFFFFFFFLL;
  *((_DWORD *)this + 12) = 0;
  return result;
}

proto::gnsshal::NvStore *proto::gnsshal::NvStore::NvStore(proto::gnsshal::NvStore *this, const proto::gnsshal::NvStore *a2)
{
  *(void *)this = &unk_26EAA7FE0;
  wireless_diagnostics::google::protobuf::UnknownFieldSet::UnknownFieldSet((proto::gnsshal::NvStore *)((char *)this + 8));
  *((void *)this + 2) = 0;
  *((void *)this + 3) = 0;
  *((_DWORD *)this + 8) = 0;
  *((void *)this + 5) = 0xFFFFFFFFLL;
  *((_DWORD *)this + 12) = 0;
  proto::gnsshal::NvStore::MergeFrom(this, a2);
  return this;
}

void sub_237B0E4E4(_Unwind_Exception *a1)
{
  wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Destroy<wireless_diagnostics::google::protobuf::RepeatedPtrField<proto::gnsshal::NvStoreItem>::TypeHandler>(v3);
  MEMORY[0x237E29280](v2);
  MEMORY[0x237E29360](v1);
  _Unwind_Resume(a1);
}

uint64_t proto::gnsshal::NvStore::MergeFrom(proto::gnsshal::NvStore *this, const proto::gnsshal::NvStore *a2)
{
  if (a2 == this)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)v11);
  }
  wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((proto::gnsshal::NvStore *)((char *)this + 16));
  if (*((int *)a2 + 6) >= 1)
  {
    uint64_t v4 = 0;
    do
    {
      char v5 = *(const proto::gnsshal::NvStoreItem **)(*((void *)a2 + 2) + 8 * v4);
      int v6 = *((_DWORD *)this + 7);
      uint64_t v7 = *((int *)this + 6);
      if ((int)v7 >= v6)
      {
        if (v6 == *((_DWORD *)this + 8))
        {
          wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((proto::gnsshal::NvStore *)((char *)this + 16));
          int v6 = *((_DWORD *)this + 7);
        }
        *((_DWORD *)this + 7) = v6 + 1;
        wireless_diagnostics::google::protobuf::internal::GenericTypeHandler<proto::gnsshal::NvStoreItem>::New();
      }
      uint64_t v8 = *((void *)this + 2);
      *((_DWORD *)this + 6) = v7 + 1;
      proto::gnsshal::NvStoreItem::MergeFrom(*(proto::gnsshal::NvStoreItem **)(v8 + 8 * v7), v5);
      ++v4;
    }
    while (v4 < *((int *)a2 + 6));
  }
  if (*((unsigned char *)a2 + 48))
  {
    int v9 = *((_DWORD *)a2 + 10);
    *((_DWORD *)this + 12) |= 1u;
    *((_DWORD *)this + 10) = v9;
  }
  return wireless_diagnostics::google::protobuf::UnknownFieldSet::MergeFrom();
}

void sub_237B0E664(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)va);
  _Unwind_Resume(a1);
}

void proto::gnsshal::NvStore::~NvStore(proto::gnsshal::NvStore *this)
{
  *(void *)this = &unk_26EAA7FE0;
  wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Destroy<wireless_diagnostics::google::protobuf::RepeatedPtrField<proto::gnsshal::NvStoreItem>::TypeHandler>((uint64_t *)this + 2);
  MEMORY[0x237E29280]((char *)this + 8);
  JUMPOUT(0x237E29360);
}

{
  uint64_t vars8;

  proto::gnsshal::NvStore::~NvStore(this);
  JUMPOUT(0x237E29950);
}

uint64_t proto::gnsshal::NvStore::SetCachedSize(uint64_t this, int a2)
{
  *(_DWORD *)(this + 44) = a2;
  return this;
}

uint64_t proto::gnsshal::NvStore::descriptor(proto::gnsshal::NvStore *this)
{
  uint64_t v1 = qword_2689430D0;
  __dmb(0xBu);
  if (v1 != 2)
  {
    v3[0] = MEMORY[0x263F8C768] + 16;
    v3[1] = proto::gnsshal::protobuf_AssignDesc_GnssHalNvStore_2eproto;
    char v4 = 0;
    wireless_diagnostics::google::protobuf::GoogleOnceInitImpl();
    wireless_diagnostics::google::protobuf::internal::FunctionClosure0::~FunctionClosure0((wireless_diagnostics::google::protobuf::internal::FunctionClosure0 *)v3);
  }
  return _MergedGlobals;
}

void sub_237B0E7B4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  wireless_diagnostics::google::protobuf::internal::FunctionClosure0::~FunctionClosure0((wireless_diagnostics::google::protobuf::internal::FunctionClosure0 *)va);
  _Unwind_Resume(a1);
}

uint64_t proto::gnsshal::NvStore::default_instance(proto::gnsshal::NvStore *this, uint64_t a2, uint64_t a3, const char *a4)
{
  uint64_t result = proto::gnsshal::NvStore::default_instance_;
  if (!proto::gnsshal::NvStore::default_instance_)
  {
    proto::gnsshal::protobuf_AddDesc_GnssHalNvStore_2eproto(0, a2, a3, a4);
    return proto::gnsshal::NvStore::default_instance_;
  }
  return result;
}

void proto::gnsshal::NvStore::New(proto::gnsshal::NvStore *this)
{
}

void sub_237B0E838(_Unwind_Exception *a1)
{
  MEMORY[0x237E29950](v1, 0x10A1C407FBCBAABLL);
  _Unwind_Resume(a1);
}

uint64_t proto::gnsshal::NvStore::Clear(proto::gnsshal::NvStore *this)
{
  if (*((unsigned char *)this + 48)) {
    *((_DWORD *)this + 10) = -1;
  }
  uint64_t result = wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Clear<wireless_diagnostics::google::protobuf::RepeatedPtrField<proto::gnsshal::NvStoreItem>::TypeHandler>((uint64_t)this + 16);
  uint64_t v4 = *((void *)this + 1);
  double v3 = (char *)this + 8;
  *((_DWORD *)v3 + 10) = 0;
  if (v4)
  {
    return MEMORY[0x270F9B140](v3);
  }
  return result;
}

uint64_t proto::gnsshal::NvStore::MergePartialFromCodedStream(proto::gnsshal::NvStore *this, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2, uint64_t a3, wireless_diagnostics::google::protobuf::UnknownFieldSet *a4)
{
  int v6 = (proto::gnsshal::NvStore *)((char *)this + 16);
  uint64_t v7 = (char *)this + 8;
  while (1)
  {
    while (1)
    {
      while (1)
      {
        uint64_t v8 = (char *)*((void *)a2 + 1);
        if ((unint64_t)v8 >= *((void *)a2 + 2) || *v8 < 0)
        {
          unint64_t TagFallback = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadTagFallback(a2);
          *((_DWORD *)a2 + 8) = TagFallback;
          if (!TagFallback) {
            return 1;
          }
        }
        else
        {
          unint64_t TagFallback = *v8;
          *((_DWORD *)a2 + 8) = TagFallback;
          *((void *)a2 + 1) = v8 + 1;
          if (!TagFallback) {
            return 1;
          }
        }
        if (TagFallback >> 3 != 1) {
          break;
        }
        int v10 = TagFallback & 7;
        if ((TagFallback & 7) != 0) {
          goto LABEL_16;
        }
        unsigned int v29 = 0;
        std::string v11 = (char *)*((void *)a2 + 1);
        unint64_t v12 = *((void *)a2 + 2);
        if ((unint64_t)v11 >= v12 || *v11 < 0)
        {
          uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, &v29);
          if (!result) {
            return result;
          }
          unsigned int v13 = v29;
          int v14 = (unsigned char *)*((void *)a2 + 1);
          unint64_t v12 = *((void *)a2 + 2);
        }
        else
        {
          unsigned int v13 = *v11;
          int v14 = v11 + 1;
          *((void *)a2 + 1) = v14;
        }
        *((_DWORD *)this + 10) = v13;
        *((_DWORD *)this + 12) |= 1u;
        if ((unint64_t)v14 < v12 && *v14 == 18) {
          goto LABEL_23;
        }
      }
      if (TagFallback >> 3 != 2) {
        break;
      }
      int v10 = TagFallback & 7;
      if (v10 != 2) {
        goto LABEL_16;
      }
      while (1)
      {
        int v16 = *((_DWORD *)this + 7);
        uint64_t v17 = *((int *)this + 6);
        if ((int)v17 >= v16)
        {
          if (v16 == *((_DWORD *)this + 8))
          {
            wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve(v6);
            int v16 = *((_DWORD *)this + 7);
          }
          *((_DWORD *)this + 7) = v16 + 1;
          wireless_diagnostics::google::protobuf::internal::GenericTypeHandler<proto::gnsshal::NvStoreItem>::New();
        }
        uint64_t v18 = *((void *)this + 2);
        *((_DWORD *)this + 6) = v17 + 1;
        uint64_t v19 = *(proto::gnsshal::NvStoreItem **)(v18 + 8 * v17);
        unsigned int v30 = 0;
        __int16 v20 = (char *)*((void *)a2 + 1);
        if ((unint64_t)v20 >= *((void *)a2 + 2) || *v20 < 0)
        {
          if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, &v30))return 0; {
        }
          }
        else
        {
          unsigned int v30 = *v20;
          *((void *)a2 + 1) = v20 + 1;
        }
        int v21 = *((_DWORD *)a2 + 14);
        int v22 = *((_DWORD *)a2 + 15);
        *((_DWORD *)a2 + 14) = v21 + 1;
        if (v21 >= v22) {
          return 0;
        }
        wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(a2);
        if (!proto::gnsshal::NvStoreItem::MergePartialFromCodedStream(v19, a2, v23, v24)
          || !*((unsigned char *)a2 + 36))
        {
          return 0;
        }
        wireless_diagnostics::google::protobuf::io::CodedInputStream::PopLimit(a2);
        int v25 = *((_DWORD *)a2 + 14);
        BOOL v26 = __OFSUB__(v25, 1);
        int v27 = v25 - 1;
        if (v27 < 0 == v26) {
          *((_DWORD *)a2 + 14) = v27;
        }
        int v14 = (unsigned char *)*((void *)a2 + 1);
        std::string v28 = (unsigned char *)*((void *)a2 + 2);
        if (v14 >= v28 || *v14 != 18) {
          break;
        }
LABEL_23:
        *((void *)a2 + 1) = v14 + 1;
      }
      if (v14 == v28 && (*((_DWORD *)a2 + 11) || *((_DWORD *)a2 + 6) == *((_DWORD *)a2 + 10)))
      {
        *((_DWORD *)a2 + 8) = 0;
        uint64_t result = 1;
        *((unsigned char *)a2 + 36) = 1;
        return result;
      }
    }
    int v10 = TagFallback & 7;
LABEL_16:
    if (v10 == 4) {
      return 1;
    }
    if ((wireless_diagnostics::google::protobuf::internal::WireFormat::SkipField(a2, (wireless_diagnostics::google::protobuf::io::CodedInputStream *)TagFallback, (uint64_t)v7, a4) & 1) == 0)return 0; {
  }
    }
}

uint64_t proto::gnsshal::NvStore::SerializeWithCachedSizes(uint64_t this, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a2, uint64_t a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  uint64_t v5 = this;
  if (*(unsigned char *)(this + 48)) {
    this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteInt32((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)1, *(unsigned int *)(this + 40), (uint64_t)a2, a4);
  }
  if (*(int *)(v5 + 24) >= 1)
  {
    uint64_t v6 = 0;
    do
    {
      this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteMessageMaybeToArray();
      ++v6;
    }
    while (v6 < *(int *)(v5 + 24));
  }
  int v9 = *(void **)(v5 + 8);
  uint64_t v8 = v5 + 8;
  uint64_t v7 = v9;
  if (v9 && *v7 != v7[1])
  {
    return MEMORY[0x270F9B178](v8, a2);
  }
  return this;
}

unsigned __int8 *proto::gnsshal::NvStore::SerializeWithCachedSizesToArray(proto::gnsshal::NvStore *this, unsigned __int8 *a2, unsigned __int8 *a3, unsigned __int8 *a4)
{
  uint64_t v4 = a2;
  if (*((unsigned char *)this + 48))
  {
    uint64_t v6 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*((int *)this + 10);
    *a2 = 8;
    uint64_t v7 = a2 + 1;
    if ((v6 & 0x80000000) != 0)
    {
      uint64_t v8 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint64ToArray(v6, (uint64_t)v7, a3);
    }
    else
    {
      if (v6 <= 0x7F)
      {
        v4[1] = v6;
        v4 += 2;
        goto LABEL_8;
      }
      uint64_t v8 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32FallbackToArray(v6, (uint64_t)v7, a3);
    }
    uint64_t v4 = (unsigned __int8 *)v8;
  }
LABEL_8:
  if (*((int *)this + 6) >= 1)
  {
    uint64_t v9 = 0;
    do
    {
      int v10 = *(unsigned int **)(*((void *)this + 2) + 8 * v9);
      unsigned __int8 *v4 = 18;
      std::string v11 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)v10[15];
      if (v11 > 0x7F)
      {
        unint64_t v12 = (unsigned __int8 *)wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32FallbackToArray(v11, (uint64_t)(v4 + 1), a3);
      }
      else
      {
        v4[1] = v11;
        unint64_t v12 = v4 + 2;
      }
      uint64_t v4 = proto::gnsshal::NvStoreItem::SerializeWithCachedSizesToArray((proto::gnsshal::NvStoreItem *)v10, v12, a3, a4);
      ++v9;
    }
    while (v9 < *((int *)this + 6));
  }
  uint64_t v15 = (void *)*((void *)this + 1);
  int v14 = (char *)this + 8;
  unsigned int v13 = v15;
  if (!v15 || *v13 == v13[1]) {
    return v4;
  }
  return (unsigned __int8 *)MEMORY[0x270F9B188](v14, v4);
}

uint64_t proto::gnsshal::NvStore::ByteSize(proto::gnsshal::NvStore *this, const wireless_diagnostics::google::protobuf::UnknownFieldSet *a2)
{
  if (*((unsigned char *)this + 48))
  {
    uint64_t v4 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*((unsigned int *)this + 10);
    if ((v4 & 0x80000000) != 0)
    {
      int v3 = 11;
    }
    else if (v4 >= 0x80)
    {
      int v3 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v4) + 1;
    }
    else
    {
      int v3 = 2;
    }
  }
  else
  {
    int v3 = 0;
  }
  int v5 = *((_DWORD *)this + 6);
  uint64_t v6 = (v5 + v3);
  if (v5 >= 1)
  {
    uint64_t v7 = 0;
    do
    {
      uint64_t v8 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)proto::gnsshal::NvStoreItem::ByteSize(*(proto::gnsshal::NvStoreItem **)(*((void *)this + 2) + 8 * v7), a2);
      int v9 = (int)v8;
      if (v8 >= 0x80) {
        int v10 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v8);
      }
      else {
        int v10 = 1;
      }
      uint64_t v6 = (v9 + v6 + v10);
      ++v7;
    }
    while (v7 < *((int *)this + 6));
  }
  std::string v11 = (void *)*((void *)this + 1);
  if (v11 && *v11 != v11[1]) {
    uint64_t v6 = wireless_diagnostics::google::protobuf::internal::WireFormat::ComputeUnknownFieldsSize((proto::gnsshal::NvStore *)((char *)this + 8), a2)+ v6;
  }
  *((_DWORD *)this + 11) = v6;
  return v6;
}

uint64_t proto::gnsshal::NvStore::MergeFrom(proto::gnsshal::NvStore *this, const wireless_diagnostics::google::protobuf::Message *lpsrc)
{
  if (lpsrc == this)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)v7);
  }
  if (v4) {
    return proto::gnsshal::NvStore::MergeFrom(this, v4);
  }
  else {
    return wireless_diagnostics::google::protobuf::internal::ReflectionOps::Merge(lpsrc, this, v5);
  }
}

void sub_237B0EEB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)va);
  _Unwind_Resume(a1);
}

uint64_t proto::gnsshal::NvStore::CopyFrom(uint64_t result, uint64_t a2)
{
  if (a2 != result)
  {
    uint64_t v4 = result;
    (*(void (**)(uint64_t))(*(void *)result + 32))(result);
    int v5 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)v4 + 112);
    return v5(v4, a2);
  }
  return result;
}

const proto::gnsshal::NvStore *proto::gnsshal::NvStore::CopyFrom(const proto::gnsshal::NvStore *this, const proto::gnsshal::NvStore *a2)
{
  if (a2 != this)
  {
    uint64_t v4 = this;
    (*(void (**)(const proto::gnsshal::NvStore *))(*(void *)this + 32))(this);
    return (const proto::gnsshal::NvStore *)proto::gnsshal::NvStore::MergeFrom(v4, a2);
  }
  return this;
}

uint64_t proto::gnsshal::NvStore::IsInitialized(proto::gnsshal::NvStore *this)
{
  return 1;
}

proto::gnsshal::NvStore *proto::gnsshal::NvStore::Swap(proto::gnsshal::NvStore *this, proto::gnsshal::NvStore *a2)
{
  if (a2 != this)
  {
    int v3 = this;
    int v4 = *((_DWORD *)this + 10);
    *((_DWORD *)this + 10) = *((_DWORD *)a2 + 10);
    *((_DWORD *)a2 + 10) = v4;
    this = (proto::gnsshal::NvStore *)wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Swap();
    int v5 = *((_DWORD *)v3 + 12);
    *((_DWORD *)v3 + 12) = *((_DWORD *)a2 + 12);
    *((_DWORD *)a2 + 12) = v5;
    uint64_t v6 = *((void *)v3 + 1);
    *((void *)v3 + 1) = *((void *)a2 + 1);
    *((void *)a2 + 1) = v6;
    LODWORD(v6) = *((_DWORD *)v3 + 11);
    *((_DWORD *)v3 + 11) = *((_DWORD *)a2 + 11);
    *((_DWORD *)a2 + 11) = v6;
  }
  return this;
}

uint64_t proto::gnsshal::NvStore::GetMetadata(proto::gnsshal::NvStore *this)
{
  uint64_t v1 = qword_2689430D0;
  __dmb(0xBu);
  if (v1 != 2)
  {
    v3[0] = MEMORY[0x263F8C768] + 16;
    v3[1] = proto::gnsshal::protobuf_AssignDesc_GnssHalNvStore_2eproto;
    char v4 = 0;
    wireless_diagnostics::google::protobuf::GoogleOnceInitImpl();
    wireless_diagnostics::google::protobuf::internal::FunctionClosure0::~FunctionClosure0((wireless_diagnostics::google::protobuf::internal::FunctionClosure0 *)v3);
  }
  return _MergedGlobals;
}

void sub_237B0F0DC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  wireless_diagnostics::google::protobuf::internal::FunctionClosure0::~FunctionClosure0((wireless_diagnostics::google::protobuf::internal::FunctionClosure0 *)va);
  _Unwind_Resume(a1);
}

proto::gnsshal::NvStoreItem *proto::gnsshal::NvStoreItem::NvStoreItem(proto::gnsshal::NvStoreItem *this)
{
  *(void *)this = &unk_26EAA8090;
  wireless_diagnostics::google::protobuf::UnknownFieldSet::UnknownFieldSet((proto::gnsshal::NvStoreItem *)((char *)this + 8));
  uint64_t v2 = MEMORY[0x263F8C740];
  *((void *)this + 2) = 0;
  *((void *)this + 3) = v2;
  *((void *)this + 7) = 0;
  *((void *)this + 4) = -1;
  __asm { FMOV            V0.2D, #-1.0 }
  *(_OWORD *)((char *)this + 40) = _Q0;
  *((_DWORD *)this + 16) = 0;
  return this;
}

__n128 proto::gnsshal::NvStoreItem::SharedCtor(proto::gnsshal::NvStoreItem *this)
{
  uint64_t v1 = MEMORY[0x263F8C740];
  *((void *)this + 2) = 0;
  *((void *)this + 3) = v1;
  *((void *)this + 7) = 0;
  *((void *)this + 4) = -1;
  __asm { FMOV            V0.2D, #-1.0 }
  *(__n128 *)((char *)this + 40) = result;
  *((_DWORD *)this + 16) = 0;
  return result;
}

proto::gnsshal::NvStoreItem *proto::gnsshal::NvStoreItem::NvStoreItem(proto::gnsshal::NvStoreItem *this, const proto::gnsshal::NvStoreItem *a2)
{
  *(void *)this = &unk_26EAA8090;
  wireless_diagnostics::google::protobuf::UnknownFieldSet::UnknownFieldSet((proto::gnsshal::NvStoreItem *)((char *)this + 8));
  uint64_t v4 = MEMORY[0x263F8C740];
  *((void *)this + 2) = 0;
  *((void *)this + 3) = v4;
  *((void *)this + 7) = 0;
  *((void *)this + 4) = -1;
  __asm { FMOV            V0.2D, #-1.0 }
  *(_OWORD *)((char *)this + 40) = _Q0;
  *((_DWORD *)this + 16) = 0;
  proto::gnsshal::NvStoreItem::MergeFrom(this, a2);
  return this;
}

uint64_t proto::gnsshal::NvStoreItem::MergeFrom(proto::gnsshal::NvStoreItem *this, const proto::gnsshal::NvStoreItem *a2)
{
  if (a2 == this)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)v13);
  }
  LOBYTE(v4) = *((unsigned char *)a2 + 64);
  if (!(_BYTE)v4) {
    return wireless_diagnostics::google::protobuf::UnknownFieldSet::MergeFrom();
  }
  if (*((unsigned char *)a2 + 64))
  {
    uint64_t v7 = *((void *)a2 + 2);
    *((_DWORD *)this + 16) |= 1u;
    *((void *)this + 2) = v7;
    int v4 = *((_DWORD *)a2 + 16);
    if ((v4 & 2) == 0)
    {
LABEL_6:
      if ((v4 & 4) == 0) {
        goto LABEL_7;
      }
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)a2 + 64) & 2) == 0)
  {
    goto LABEL_6;
  }
  uint64_t v8 = (const std::string *)*((void *)a2 + 3);
  *((_DWORD *)this + 16) |= 2u;
  int v9 = (std::string *)*((void *)this + 3);
  if (v9 == (std::string *)MEMORY[0x263F8C740]) {
    operator new();
  }
  std::string::operator=(v9, v8);
  int v4 = *((_DWORD *)a2 + 16);
  if ((v4 & 4) == 0)
  {
LABEL_7:
    if ((v4 & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
LABEL_16:
  int v10 = *((_DWORD *)a2 + 14);
  *((_DWORD *)this + 16) |= 4u;
  *((_DWORD *)this + 14) = v10;
  int v4 = *((_DWORD *)a2 + 16);
  if ((v4 & 8) == 0)
  {
LABEL_8:
    if ((v4 & 0x10) == 0) {
      goto LABEL_9;
    }
LABEL_18:
    uint64_t v12 = *((void *)a2 + 5);
    *((_DWORD *)this + 16) |= 0x10u;
    *((void *)this + 5) = v12;
    if ((*((_DWORD *)a2 + 16) & 0x20) == 0) {
      return wireless_diagnostics::google::protobuf::UnknownFieldSet::MergeFrom();
    }
    goto LABEL_10;
  }
LABEL_17:
  uint64_t v11 = *((void *)a2 + 4);
  *((_DWORD *)this + 16) |= 8u;
  *((void *)this + 4) = v11;
  int v4 = *((_DWORD *)a2 + 16);
  if ((v4 & 0x10) != 0) {
    goto LABEL_18;
  }
LABEL_9:
  if ((v4 & 0x20) != 0)
  {
LABEL_10:
    uint64_t v5 = *((void *)a2 + 6);
    *((_DWORD *)this + 16) |= 0x20u;
    *((void *)this + 6) = v5;
  }
  return wireless_diagnostics::google::protobuf::UnknownFieldSet::MergeFrom();
}

void sub_237B0F3C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)va);
  _Unwind_Resume(a1);
}

void proto::gnsshal::NvStoreItem::~NvStoreItem(proto::gnsshal::NvStoreItem *this)
{
  *(void *)this = &unk_26EAA8090;
  uint64_t v1 = (char *)this + 8;
  proto::gnsshal::NvStoreItem::SharedDtor((uint64_t)this);
  MEMORY[0x237E29280](v1);
  JUMPOUT(0x237E29360);
}

{
  uint64_t vars8;

  proto::gnsshal::NvStoreItem::~NvStoreItem(this);
  JUMPOUT(0x237E29950);
}

uint64_t proto::gnsshal::NvStoreItem::SharedDtor(uint64_t this)
{
  uint64_t v1 = *(void *)(this + 24);
  if (v1 != MEMORY[0x263F8C740] && v1 != 0)
  {
    if (*(char *)(v1 + 23) < 0) {
      operator delete(*(void **)v1);
    }
    JUMPOUT(0x237E29950);
  }
  return this;
}

uint64_t proto::gnsshal::NvStoreItem::SetCachedSize(uint64_t this, int a2)
{
  *(_DWORD *)(this + 60) = a2;
  return this;
}

uint64_t proto::gnsshal::NvStoreItem::descriptor(proto::gnsshal::NvStoreItem *this)
{
  uint64_t v1 = qword_2689430D0;
  __dmb(0xBu);
  if (v1 != 2)
  {
    v3[0] = MEMORY[0x263F8C768] + 16;
    v3[1] = proto::gnsshal::protobuf_AssignDesc_GnssHalNvStore_2eproto;
    char v4 = 0;
    wireless_diagnostics::google::protobuf::GoogleOnceInitImpl();
    wireless_diagnostics::google::protobuf::internal::FunctionClosure0::~FunctionClosure0((wireless_diagnostics::google::protobuf::internal::FunctionClosure0 *)v3);
  }
  return qword_2689430C0;
}

void sub_237B0F584(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  wireless_diagnostics::google::protobuf::internal::FunctionClosure0::~FunctionClosure0((wireless_diagnostics::google::protobuf::internal::FunctionClosure0 *)va);
  _Unwind_Resume(a1);
}

uint64_t proto::gnsshal::NvStoreItem::default_instance(proto::gnsshal::NvStoreItem *this, uint64_t a2, uint64_t a3, const char *a4)
{
  uint64_t result = proto::gnsshal::NvStoreItem::default_instance_;
  if (!proto::gnsshal::NvStoreItem::default_instance_)
  {
    proto::gnsshal::protobuf_AddDesc_GnssHalNvStore_2eproto(0, a2, a3, a4);
    return proto::gnsshal::NvStoreItem::default_instance_;
  }
  return result;
}

void proto::gnsshal::NvStoreItem::New(proto::gnsshal::NvStoreItem *this)
{
}

void sub_237B0F608(_Unwind_Exception *a1)
{
  MEMORY[0x237E29950](v1, 0x10A1C40F05C313FLL);
  _Unwind_Resume(a1);
}

uint64_t proto::gnsshal::NvStoreItem::Clear(proto::gnsshal::NvStoreItem *this)
{
  char v1 = *((unsigned char *)this + 64);
  if (v1)
  {
    *((void *)this + 2) = 0;
    if ((v1 & 2) != 0)
    {
      uint64_t v2 = *((void *)this + 3);
      if (v2 != MEMORY[0x263F8C740])
      {
        if (*(char *)(v2 + 23) < 0)
        {
          **(unsigned char **)uint64_t v2 = 0;
          *(void *)(v2 + 8) = 0;
        }
        else
        {
          *(unsigned char *)uint64_t v2 = 0;
          *(unsigned char *)(v2 + 23) = 0;
        }
      }
    }
    *((_DWORD *)this + 14) = 0;
    *((void *)this + 4) = -1;
    __asm { FMOV            V0.2D, #-1.0 }
    *(_OWORD *)((char *)this + 40) = _Q0;
  }
  uint64_t v9 = *((void *)this + 1);
  uint64_t result = (uint64_t)this + 8;
  *(_DWORD *)(result + 56) = 0;
  if (v9) {
    return MEMORY[0x270F9B140]();
  }
  return result;
}

uint64_t proto::gnsshal::NvStoreItem::MergePartialFromCodedStream(proto::gnsshal::NvStoreItem *this, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2, uint64_t a3, wireless_diagnostics::google::protobuf::UnknownFieldSet *a4)
{
  uint64_t v6 = (unsigned int *)((char *)this + 56);
  uint64_t v7 = (char *)this + 8;
  uint64_t v8 = MEMORY[0x263F8C740];
  while (2)
  {
    uint64_t v9 = (char *)*((void *)a2 + 1);
    if ((unint64_t)v9 >= *((void *)a2 + 2) || *v9 < 0)
    {
      unint64_t TagFallback = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadTagFallback(a2);
      *((_DWORD *)a2 + 8) = TagFallback;
      if (!TagFallback) {
        return 1;
      }
    }
    else
    {
      unint64_t TagFallback = *v9;
      *((_DWORD *)a2 + 8) = TagFallback;
      *((void *)a2 + 1) = v9 + 1;
      if (!TagFallback) {
        return 1;
      }
    }
    switch(TagFallback >> 3)
    {
      case 1u:
        int v11 = TagFallback & 7;
        if ((TagFallback & 7) != 0) {
          goto LABEL_22;
        }
        unint64_t v26 = 0;
        unsigned int v13 = (char *)*((void *)a2 + 1);
        unint64_t v12 = *((void *)a2 + 2);
        if ((unint64_t)v13 >= v12 || *v13 < 0)
        {
          uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Fallback(a2, &v26);
          if (!result) {
            return result;
          }
          unint64_t v14 = v26;
          uint64_t v15 = (unsigned char *)*((void *)a2 + 1);
          unint64_t v12 = *((void *)a2 + 2);
        }
        else
        {
          unint64_t v14 = *v13;
          uint64_t v15 = v13 + 1;
          *((void *)a2 + 1) = v15;
        }
        *((void *)this + 2) = v14;
        int v16 = *((_DWORD *)this + 16) | 1;
        *((_DWORD *)this + 16) = v16;
        if ((unint64_t)v15 < v12 && *v15 == 18)
        {
          *((void *)a2 + 1) = v15 + 1;
          goto LABEL_30;
        }
        continue;
      case 2u:
        int v11 = TagFallback & 7;
        if (v11 != 2) {
          goto LABEL_22;
        }
        int v16 = *((_DWORD *)this + 16);
LABEL_30:
        *((_DWORD *)this + 16) = v16 | 2;
        if (*((void *)this + 3) == v8) {
          operator new();
        }
        uint64_t result = wireless_diagnostics::google::protobuf::internal::WireFormatLite::ReadBytes();
        if (!result) {
          return result;
        }
        int v21 = (unsigned char *)*((void *)a2 + 1);
        unint64_t v17 = *((void *)a2 + 2);
        if ((unint64_t)v21 >= v17 || *v21 != 24) {
          continue;
        }
        uint64_t v18 = v21 + 1;
        *((void *)a2 + 1) = v18;
LABEL_36:
        if ((unint64_t)v18 >= v17 || *v18 < 0)
        {
          uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, v6);
          if (!result) {
            return result;
          }
          int v22 = (unsigned char *)*((void *)a2 + 1);
          unint64_t v17 = *((void *)a2 + 2);
        }
        else
        {
          unsigned int *v6 = *v18;
          int v22 = v18 + 1;
          *((void *)a2 + 1) = v22;
        }
        *((_DWORD *)this + 16) |= 4u;
        if ((unint64_t)v22 >= v17 || *v22 != 32) {
          continue;
        }
        uint64_t v19 = v22 + 1;
        *((void *)a2 + 1) = v19;
LABEL_44:
        unint64_t v26 = 0;
        if ((unint64_t)v19 >= v17 || *v19 < 0)
        {
          uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Fallback(a2, &v26);
          if (!result) {
            return result;
          }
          unint64_t v23 = v26;
          unsigned __int8 v24 = (unsigned char *)*((void *)a2 + 1);
          unint64_t v17 = *((void *)a2 + 2);
        }
        else
        {
          unint64_t v23 = *v19;
          unsigned __int8 v24 = v19 + 1;
          *((void *)a2 + 1) = v24;
        }
        *((void *)this + 4) = v23;
        *((_DWORD *)this + 16) |= 8u;
        if ((unint64_t)v24 >= v17 || *v24 != 41) {
          continue;
        }
        *((void *)a2 + 1) = v24 + 1;
LABEL_52:
        unint64_t v26 = 0;
        if ((wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian64Fallback(a2, &v26) & 1) == 0) {
          return 0;
        }
        *((void *)this + 5) = v26;
        *((_DWORD *)this + 16) |= 0x10u;
        int v25 = (unsigned char *)*((void *)a2 + 1);
        if ((unint64_t)v25 >= *((void *)a2 + 2) || *v25 != 49) {
          continue;
        }
        *((void *)a2 + 1) = v25 + 1;
LABEL_56:
        unint64_t v26 = 0;
        if (wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian64Fallback(a2, &v26))
        {
          *((void *)this + 6) = v26;
          *((_DWORD *)this + 16) |= 0x20u;
          if (*((void *)a2 + 1) == *((void *)a2 + 2)
            && (*((_DWORD *)a2 + 11) || *((_DWORD *)a2 + 6) == *((_DWORD *)a2 + 10)))
          {
            *((_DWORD *)a2 + 8) = 0;
            uint64_t result = 1;
            *((unsigned char *)a2 + 36) = 1;
            return result;
          }
          continue;
        }
        return 0;
      case 3u:
        int v11 = TagFallback & 7;
        if ((TagFallback & 7) != 0) {
          goto LABEL_22;
        }
        uint64_t v18 = (char *)*((void *)a2 + 1);
        unint64_t v17 = *((void *)a2 + 2);
        goto LABEL_36;
      case 4u:
        int v11 = TagFallback & 7;
        if ((TagFallback & 7) != 0) {
          goto LABEL_22;
        }
        uint64_t v19 = (char *)*((void *)a2 + 1);
        unint64_t v17 = *((void *)a2 + 2);
        goto LABEL_44;
      case 5u:
        int v11 = TagFallback & 7;
        if (v11 == 1) {
          goto LABEL_52;
        }
        goto LABEL_22;
      case 6u:
        int v11 = TagFallback & 7;
        if (v11 != 1) {
          goto LABEL_22;
        }
        goto LABEL_56;
      default:
        int v11 = TagFallback & 7;
LABEL_22:
        if (v11 == 4) {
          return 1;
        }
        if ((wireless_diagnostics::google::protobuf::internal::WireFormat::SkipField(a2, (wireless_diagnostics::google::protobuf::io::CodedInputStream *)TagFallback, (uint64_t)v7, a4) & 1) == 0)return 0; {
        continue;
        }
    }
  }
}

uint64_t proto::gnsshal::NvStoreItem::SerializeWithCachedSizes(uint64_t this, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a2, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  uint64_t v5 = this;
  int v6 = *(_DWORD *)(this + 64);
  if (v6)
  {
    this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteInt64((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)1, *(void *)(this + 16), (uint64_t)a2, a4);
    int v6 = *(_DWORD *)(v5 + 64);
    if ((v6 & 2) == 0)
    {
LABEL_3:
      if ((v6 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_3;
  }
  this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteBytes();
  int v6 = *(_DWORD *)(v5 + 64);
  if ((v6 & 4) == 0)
  {
LABEL_4:
    if ((v6 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt32((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)3, *(unsigned int *)(v5 + 56), (uint64_t)a2, a4);
  int v6 = *(_DWORD *)(v5 + 64);
  if ((v6 & 8) == 0)
  {
LABEL_5:
    if ((v6 & 0x10) == 0) {
      goto LABEL_6;
    }
LABEL_18:
    this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteDouble((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)5, (uint64_t)a2, *(double *)(v5 + 40), a3);
    if ((*(_DWORD *)(v5 + 64) & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_17:
  this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteInt64((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)4, *(void *)(v5 + 32), (uint64_t)a2, a4);
  int v6 = *(_DWORD *)(v5 + 64);
  if ((v6 & 0x10) != 0) {
    goto LABEL_18;
  }
LABEL_6:
  if ((v6 & 0x20) != 0) {
LABEL_7:
  }
    this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteDouble((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)6, (uint64_t)a2, *(double *)(v5 + 48), a3);
LABEL_8:
  uint64_t v9 = *(void **)(v5 + 8);
  uint64_t v8 = v5 + 8;
  uint64_t v7 = v9;
  if (v9 && *v7 != v7[1])
  {
    return MEMORY[0x270F9B178](v8, a2);
  }
  return this;
}

unsigned __int8 *proto::gnsshal::NvStoreItem::SerializeWithCachedSizesToArray(proto::gnsshal::NvStoreItem *this, unsigned __int8 *a2, unsigned __int8 *a3, unsigned __int8 *a4)
{
  int v5 = *((_DWORD *)this + 16);
  if (v5)
  {
    int v6 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*((void *)this + 2);
    *a2 = 8;
    a2 = (unsigned __int8 *)wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint64ToArray(v6, (uint64_t)(a2 + 1), a3);
    int v5 = *((_DWORD *)this + 16);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_22;
      }
      goto LABEL_19;
    }
  }
  else if ((v5 & 2) == 0)
  {
    goto LABEL_3;
  }
  uint64_t v7 = *((void *)this + 3);
  *a2 = 18;
  if (*(char *)(v7 + 23) < 0) {
    uint64_t v8 = *(wireless_diagnostics::google::protobuf::io::CodedOutputStream **)(v7 + 8);
  }
  else {
    uint64_t v8 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*(unsigned __int8 *)(v7 + 23);
  }
  if (v8 > 0x7F)
  {
    uint64_t v9 = (unsigned __int8 *)wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32FallbackToArray(v8, (uint64_t)(a2 + 1), a3);
  }
  else
  {
    a2[1] = v8;
    uint64_t v9 = a2 + 2;
  }
  int v10 = *(char *)(v7 + 23);
  if (v10 >= 0) {
    int v11 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)v7;
  }
  else {
    int v11 = *(wireless_diagnostics::google::protobuf::io::CodedOutputStream **)v7;
  }
  if (v10 >= 0) {
    unint64_t v12 = (const void *)*(unsigned __int8 *)(v7 + 23);
  }
  else {
    unint64_t v12 = (const void *)*(unsigned int *)(v7 + 8);
  }
  a2 = (unsigned __int8 *)wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteRawToArray(v11, v12, (uint64_t)v9, a4);
  if ((*((_DWORD *)this + 16) & 4) != 0)
  {
LABEL_19:
    unsigned int v13 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*((unsigned int *)this + 14);
    *a2 = 24;
    if (v13 > 0x7F)
    {
      a2 = (unsigned __int8 *)wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32FallbackToArray(v13, (uint64_t)(a2 + 1), a3);
    }
    else
    {
      a2[1] = v13;
      a2 += 2;
    }
  }
LABEL_22:
  int v14 = *((_DWORD *)this + 16);
  if ((v14 & 8) == 0)
  {
    if ((v14 & 0x10) == 0) {
      goto LABEL_24;
    }
LABEL_33:
    uint64_t v20 = *((void *)this + 5);
    *a2 = 41;
    *(void *)(a2 + 1) = v20;
    a2 += 9;
    if ((*((_DWORD *)this + 16) & 0x20) == 0) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
  uint64_t v19 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*((void *)this + 4);
  *a2 = 32;
  a2 = (unsigned __int8 *)wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint64ToArray(v19, (uint64_t)(a2 + 1), a3);
  int v14 = *((_DWORD *)this + 16);
  if ((v14 & 0x10) != 0) {
    goto LABEL_33;
  }
LABEL_24:
  if ((v14 & 0x20) != 0)
  {
LABEL_25:
    uint64_t v15 = *((void *)this + 6);
    *a2 = 49;
    *(void *)(a2 + 1) = v15;
    a2 += 9;
  }
LABEL_26:
  uint64_t v18 = (void *)*((void *)this + 1);
  unint64_t v17 = (char *)this + 8;
  int v16 = v18;
  if (!v18 || *v16 == v16[1]) {
    return a2;
  }
  return (unsigned __int8 *)MEMORY[0x270F9B188](v17, a2);
}

uint64_t proto::gnsshal::NvStoreItem::ByteSize(proto::gnsshal::NvStoreItem *this, const wireless_diagnostics::google::protobuf::UnknownFieldSet *a2)
{
  LOBYTE(v3) = *((unsigned char *)this + 64);
  if (!(_BYTE)v3)
  {
    uint64_t v5 = 0;
    goto LABEL_24;
  }
  if (*((unsigned char *)this + 64))
  {
    unsigned int v4 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize64(*((wireless_diagnostics::google::protobuf::io::CodedOutputStream **)this
                                                                                     + 2))
       + 1;
    int v3 = *((_DWORD *)this + 16);
    if ((v3 & 2) == 0) {
      goto LABEL_16;
    }
  }
  else
  {
    unsigned int v4 = 0;
    if ((*((unsigned char *)this + 64) & 2) == 0) {
      goto LABEL_16;
    }
  }
  uint64_t v6 = *((void *)this + 3);
  int v7 = *(unsigned __int8 *)(v6 + 23);
  char v8 = v7;
  uint64_t v9 = *(void *)(v6 + 8);
  if ((v7 & 0x80u) == 0) {
    unint64_t v10 = *(unsigned __int8 *)(v6 + 23);
  }
  else {
    unint64_t v10 = v9;
  }
  if (v10 >= 0x80)
  {
    int v11 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback((wireless_diagnostics::google::protobuf::io::CodedOutputStream *)v10);
    int v7 = *(unsigned __int8 *)(v6 + 23);
    uint64_t v9 = *(void *)(v6 + 8);
    int v3 = *((_DWORD *)this + 16);
    char v8 = *(unsigned char *)(v6 + 23);
  }
  else
  {
    int v11 = 1;
  }
  if (v8 < 0) {
    int v7 = v9;
  }
  v4 += v11 + v7 + 1;
LABEL_16:
  if ((v3 & 4) != 0)
  {
    uint64_t v15 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*((unsigned int *)this + 14);
    if (v15 >= 0x80)
    {
      int v16 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v15) + 1;
      int v3 = *((_DWORD *)this + 16);
    }
    else
    {
      int v16 = 2;
    }
    v4 += v16;
    if ((v3 & 8) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if ((v3 & 8) != 0)
  {
LABEL_18:
    v4 += wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize64(*((wireless_diagnostics::google::protobuf::io::CodedOutputStream **)this
                                                                                      + 4))
        + 1;
    int v3 = *((_DWORD *)this + 16);
  }
LABEL_19:
  unsigned int v12 = v4 + 9;
  if ((v3 & 0x10) == 0) {
    unsigned int v12 = v4;
  }
  if ((v3 & 0x20) != 0) {
    uint64_t v5 = v12 + 9;
  }
  else {
    uint64_t v5 = v12;
  }
LABEL_24:
  unsigned int v13 = (void *)*((void *)this + 1);
  if (v13 && *v13 != v13[1]) {
    uint64_t v5 = wireless_diagnostics::google::protobuf::internal::WireFormat::ComputeUnknownFieldsSize((proto::gnsshal::NvStoreItem *)((char *)this + 8), a2)+ v5;
  }
  *((_DWORD *)this + 15) = v5;
  return v5;
}

uint64_t proto::gnsshal::NvStoreItem::MergeFrom(proto::gnsshal::NvStoreItem *this, const wireless_diagnostics::google::protobuf::Message *lpsrc)
{
  if (lpsrc == this)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)v7);
  }
  if (v4) {
    return proto::gnsshal::NvStoreItem::MergeFrom(this, v4);
  }
  else {
    return wireless_diagnostics::google::protobuf::internal::ReflectionOps::Merge(lpsrc, this, v5);
  }
}

void sub_237B0FF3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)va);
  _Unwind_Resume(a1);
}

uint64_t proto::gnsshal::NvStoreItem::CopyFrom(uint64_t result, uint64_t a2)
{
  if (a2 != result)
  {
    uint64_t v4 = result;
    (*(void (**)(uint64_t))(*(void *)result + 32))(result);
    uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)v4 + 112);
    return v5(v4, a2);
  }
  return result;
}

const proto::gnsshal::NvStoreItem *proto::gnsshal::NvStoreItem::CopyFrom(const proto::gnsshal::NvStoreItem *this, const proto::gnsshal::NvStoreItem *a2)
{
  if (a2 != this)
  {
    uint64_t v4 = this;
    (*(void (**)(const proto::gnsshal::NvStoreItem *))(*(void *)this + 32))(this);
    return (const proto::gnsshal::NvStoreItem *)proto::gnsshal::NvStoreItem::MergeFrom(v4, a2);
  }
  return this;
}

uint64_t proto::gnsshal::NvStoreItem::IsInitialized(proto::gnsshal::NvStoreItem *this)
{
  return 1;
}

double proto::gnsshal::NvStoreItem::Swap(proto::gnsshal::NvStoreItem *this, proto::gnsshal::NvStoreItem *a2)
{
  if (a2 != this)
  {
    uint64_t v2 = *((void *)this + 3);
    *((void *)this + 3) = *((void *)a2 + 3);
    *((void *)a2 + 3) = v2;
    LODWORD(v2) = *((_DWORD *)this + 14);
    *((_DWORD *)this + 14) = *((_DWORD *)a2 + 14);
    *((_DWORD *)a2 + 14) = v2;
    uint64_t v4 = *((void *)this + 1);
    uint64_t v3 = *((void *)this + 2);
    uint64_t v5 = *((void *)a2 + 2);
    *((void *)this + 1) = *((void *)a2 + 1);
    *((void *)this + 2) = v5;
    *((void *)a2 + 2) = v3;
    uint64_t v6 = *((void *)this + 4);
    *((void *)this + 4) = *((void *)a2 + 4);
    *((void *)a2 + 4) = v6;
    LODWORD(v6) = *((_DWORD *)this + 16);
    *((_DWORD *)this + 16) = *((_DWORD *)a2 + 16);
    uint64_t v7 = *((void *)this + 5);
    *((void *)this + 5) = *((void *)a2 + 5);
    *((void *)a2 + 5) = v7;
    double result = *((double *)this + 6);
    *((void *)this + 6) = *((void *)a2 + 6);
    *((double *)a2 + 6) = result;
    *((_DWORD *)a2 + 16) = v6;
    *((void *)a2 + 1) = v4;
    LODWORD(v6) = *((_DWORD *)this + 15);
    *((_DWORD *)this + 15) = *((_DWORD *)a2 + 15);
    *((_DWORD *)a2 + 15) = v6;
  }
  return result;
}

uint64_t proto::gnsshal::NvStoreItem::GetMetadata(proto::gnsshal::NvStoreItem *this)
{
  uint64_t v1 = qword_2689430D0;
  __dmb(0xBu);
  if (v1 != 2)
  {
    v3[0] = MEMORY[0x263F8C768] + 16;
    v3[1] = proto::gnsshal::protobuf_AssignDesc_GnssHalNvStore_2eproto;
    char v4 = 0;
    wireless_diagnostics::google::protobuf::GoogleOnceInitImpl();
    wireless_diagnostics::google::protobuf::internal::FunctionClosure0::~FunctionClosure0((wireless_diagnostics::google::protobuf::internal::FunctionClosure0 *)v3);
  }
  return qword_2689430C0;
}

void sub_237B10174(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  wireless_diagnostics::google::protobuf::internal::FunctionClosure0::~FunctionClosure0((wireless_diagnostics::google::protobuf::internal::FunctionClosure0 *)va);
  _Unwind_Resume(a1);
}

uint64_t proto::gnsshal::NvStore::GetCachedSize(proto::gnsshal::NvStore *this)
{
  return *((unsigned int *)this + 11);
}

uint64_t wireless_diagnostics::google::protobuf::Message::GetReflection(wireless_diagnostics::google::protobuf::Message *this)
{
  (*(void (**)(wireless_diagnostics::google::protobuf::Message *))(*(void *)this + 152))(this);
  return v1;
}

uint64_t proto::gnsshal::NvStoreItem::GetCachedSize(proto::gnsshal::NvStoreItem *this)
{
  return *((unsigned int *)this + 15);
}

void wireless_diagnostics::google::protobuf::internal::GenericTypeHandler<proto::gnsshal::NvStoreItem>::New()
{
}

void sub_237B10214(_Unwind_Exception *a1)
{
  MEMORY[0x237E29950](v1, 0x10A1C40F05C313FLL);
  _Unwind_Resume(a1);
}

uint64_t wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Clear<wireless_diagnostics::google::protobuf::RepeatedPtrField<proto::gnsshal::NvStoreItem>::TypeHandler>(uint64_t result)
{
  uint64_t v1 = result;
  if (*(int *)(result + 8) >= 1)
  {
    uint64_t v2 = 0;
    do
    {
      double result = (*(uint64_t (**)(void))(**(void **)(*(void *)v1 + 8 * v2) + 32))(*(void *)(*(void *)v1 + 8 * v2));
      ++v2;
    }
    while (v2 < *(int *)(v1 + 8));
  }
  *(_DWORD *)(v1 + 8) = 0;
  return result;
}

uint64_t wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Destroy<wireless_diagnostics::google::protobuf::RepeatedPtrField<proto::gnsshal::NvStoreItem>::TypeHandler>(uint64_t *a1)
{
  int v2 = *((_DWORD *)a1 + 3);
  if (v2 >= 1)
  {
    for (uint64_t i = 0; i < v2; ++i)
    {
      uint64_t v4 = *(void *)(*a1 + 8 * i);
      if (v4)
      {
        (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
        int v2 = *((_DWORD *)a1 + 3);
      }
    }
  }
  uint64_t result = *a1;
  if (*a1)
  {
    JUMPOUT(0x237E29930);
  }
  return result;
}

uint64_t GnssHal::PlatformTimer::PlatformTimer(uint64_t a1, dispatch_queue_t queue)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  *(void *)a1 = &unk_26EAA8170;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 48) = queue;
  *(_WORD *)(a1 + 56) = 0;
  uint64_t v3 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, queue);
  *(void *)(a1 + 40) = v3;
  if (!v3)
  {
    uint64_t v5 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int buf = 0;
      _os_log_error_impl(&dword_237AFF000, v5, OS_LOG_TYPE_ERROR, "timer,nullptr", buf, 2u);
      uint64_t v5 = GpsdLogObjectGeneral;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 136446722;
      int v14 = "/Library/Caches/com.apple.xbs/Sources/CoreGPS/Sources/HAL/Implementation/GnssHalTimerImpl.mm";
      __int16 v15 = 1026;
      int v16 = 15;
      __int16 v17 = 2082;
      uint64_t v18 = "PlatformTimer";
      _os_log_error_impl(&dword_237AFF000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: assertion failure in %{public}s", buf, 0x1Cu);
    }
    std::string::basic_string[abi:ne180100]<0>(v11, "assert");
    std::string::basic_string[abi:ne180100]<0>(v9, "PlatformTimer");
    std::string::basic_string[abi:ne180100]<0>(__p, "timer,nullptr");
    gpsd::util::triggerDiagnosticReport((uint64_t)v11, (uint64_t)v9, (uint64_t)__p);
    if (v8 < 0) {
      operator delete(__p[0]);
    }
    if (v10 < 0) {
      operator delete(v9[0]);
    }
    if (v12 < 0) {
      operator delete(v11[0]);
    }
    __assert_rtn("PlatformTimer", "GnssHalTimerImpl.mm", 15, "false && \"timer,nullptr\"");
  }
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  _DWORD v6[2] = ___ZN7GnssHal13PlatformTimerC2EPU28objcproto17OS_dispatch_queue8NSObject_block_invoke;
  v6[3] = &__block_descriptor_40_e5_v8__0l;
  v6[4] = a1;
  dispatch_source_set_event_handler(v3, v6);
  return a1;
}

void sub_237B10594(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25,void *a26,uint64_t a27,int a28,__int16 a29,char a30,char a31)
{
  if (a19 < 0) {
    operator delete(__p);
  }
  if (a25 < 0) {
    operator delete(a20);
  }
  if (a31 < 0) {
    operator delete(a26);
  }
  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100]((void *)(v31 + 8));
  _Unwind_Resume(a1);
}

void ___ZN7GnssHal13PlatformTimerC2EPU28objcproto17OS_dispatch_queue8NSObject_block_invoke(uint64_t a1)
{
}

void GnssHal::PlatformTimer::handleEvent(GnssHal::PlatformTimer *this)
{
  if (!*((unsigned char *)this + 57)) {
    (*(void (**)(GnssHal::PlatformTimer *))(*(void *)this + 32))(this);
  }
  uint64_t v2 = *((void *)this + 4);
  if (v2)
  {
    uint64_t v3 = *(void (**)(void))(*(void *)v2 + 48);
    v3();
  }
  else
  {
    uint64_t v4 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_error_impl(&dword_237AFF000, v4, OS_LOG_TYPE_ERROR, "timer,handleEvent,callback,nullptr", v5, 2u);
    }
  }
}

void GnssHal::PlatformTimer::~PlatformTimer(GnssHal::PlatformTimer *this)
{
  *(void *)this = &unk_26EAA8170;
  if (*((void *)this + 5))
  {
    uint64_t v2 = (char *)this + 8;
    uint64_t v3 = (GnssHal::PlatformTimer *)*((void *)this + 4);
    *((void *)this + 4) = 0;
    if (v3 == (GnssHal::PlatformTimer *)((char *)this + 8))
    {
      (*(void (**)(char *))(*(void *)v2 + 32))((char *)this + 8);
    }
    else if (v3)
    {
      (*(void (**)(GnssHal::PlatformTimer *))(*(void *)v3 + 40))(v3);
    }
    uint64_t v4 = *((void *)this + 5);
    if (!*((unsigned char *)this + 56))
    {
      dispatch_resume(v4);
      uint64_t v4 = *((void *)this + 5);
    }
    dispatch_source_cancel(v4);

    *((void *)this + 5) = 0;
  }
  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100]((void *)this + 1);
}

{
  uint64_t vars8;

  GnssHal::PlatformTimer::~PlatformTimer(this);
  JUMPOUT(0x237E29950);
}

void GnssHal::PlatformTimer::startInternal(GnssHal::PlatformTimer *this, int a2, char a3)
{
  uint64_t v4 = 1000000 * a2;
  *((unsigned char *)this + 57) = a3;
  uint64_t v5 = *((void *)this + 5);
  dispatch_time_t v6 = dispatch_walltime(0, v4);
  dispatch_source_set_timer(v5, v6, v4, 0x989680uLL);
  if (!*((unsigned char *)this + 56))
  {
    dispatch_resume(*((dispatch_object_t *)this + 5));
    *((unsigned char *)this + 56) = 1;
  }
}

void GnssHal::PlatformTimer::stopInternal(GnssHal::PlatformTimer *this)
{
  if (*((unsigned char *)this + 56))
  {
    *((unsigned char *)this + 56) = 0;
    dispatch_suspend(*((dispatch_object_t *)this + 5));
  }
}

double GnssHal::PlatformTimer::getContinuousSystemTimeSeconds(GnssHal::PlatformTimer *this)
{
  return (double)gpsd::util::getMachContinuousTimeNs(this) * 0.000000001;
}

void *GnssHal::PlatformTimer::setCallback(uint64_t a1, uint64_t a2)
{
  v5[4] = *MEMORY[0x263EF8340];
  uint64_t v2 = *(NSObject **)(a1 + 48);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3321888768;
  void v4[2] = ___ZN7GnssHal13PlatformTimer11setCallbackENSt3__18functionIFvvEEE_block_invoke;
  v4[3] = &__block_descriptor_72_e8_40c27_ZTSNSt3__18functionIFvvEEE_e5_v8__0l;
  v4[4] = a1;
  std::__function::__value_func<void ()(void)>::__value_func[abi:ne180100]((uint64_t)v5, a2);
  dispatch_async(v2, v4);
  return std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](v5);
}

void GnssHal::PlatformTimer::start(GnssHal::PlatformTimer *this, int a2, char a3)
{
  uint64_t v3 = *((void *)this + 6);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  void v4[2] = ___ZN7GnssHal13PlatformTimer5startEib_block_invoke;
  v4[3] = &__block_descriptor_45_e5_v8__0l;
  v4[4] = this;
  int v5 = a2;
  char v6 = a3;
  dispatch_async(v3, v4);
}

void GnssHal::PlatformTimer::stop(GnssHal::PlatformTimer *this)
{
  uint64_t v1 = *((void *)this + 6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = ___ZN7GnssHal13PlatformTimer4stopEv_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = this;
  dispatch_async(v1, block);
}

void *___ZN7GnssHal13PlatformTimer11setCallbackENSt3__18functionIFvvEEE_block_invoke(uint64_t a1)
{
  v8[3] = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  std::__function::__value_func<void ()(void)>::__value_func[abi:ne180100]((uint64_t)v6, a1 + 40);
  uint64_t v2 = v1 + 8;
  if (v6 != (void *)(v1 + 8))
  {
    uint64_t v3 = v7;
    uint64_t v4 = *(void *)(v1 + 32);
    if (v7 == v6)
    {
      if (v4 == v2)
      {
        (*(void (**)(void *, void *))(v6[0] + 24))(v6, v8);
        (*(void (**)(void *))(*v7 + 32))(v7);
        uint64_t v7 = 0;
        (*(void (**)(void, void *))(**(void **)(v1 + 32) + 24))(*(void *)(v1 + 32), v6);
        (*(void (**)(void))(**(void **)(v1 + 32) + 32))(*(void *)(v1 + 32));
        *(void *)(v1 + 32) = 0;
        uint64_t v7 = v6;
        (*(void (**)(void *, uint64_t))(v8[0] + 24))(v8, v1 + 8);
        (*(void (**)(void *))(v8[0] + 32))(v8);
      }
      else
      {
        (*(void (**)(void *, uint64_t))(v6[0] + 24))(v6, v1 + 8);
        (*(void (**)(void *))(*v7 + 32))(v7);
        uint64_t v7 = *(void **)(v1 + 32);
      }
      *(void *)(v1 + 32) = v2;
    }
    else if (v4 == v2)
    {
      (*(void (**)(uint64_t, void *))(*(void *)v2 + 24))(v1 + 8, v6);
      (*(void (**)(void))(**(void **)(v1 + 32) + 32))(*(void *)(v1 + 32));
      *(void *)(v1 + 32) = v7;
      uint64_t v7 = v6;
    }
    else
    {
      uint64_t v7 = *(void **)(v1 + 32);
      *(void *)(v1 + 32) = v3;
    }
  }
  return std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](v6);
}

void sub_237B10CF8(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

uint64_t __copy_helper_block_e8_40c27_ZTSNSt3__18functionIFvvEEE(uint64_t a1, uint64_t a2)
{
  return std::__function::__value_func<void ()(void)>::__value_func[abi:ne180100](a1 + 40, a2 + 40);
}

void *__destroy_helper_block_e8_40c27_ZTSNSt3__18functionIFvvEEE(uint64_t a1)
{
  return std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100]((void *)(a1 + 40));
}

void ___ZN7GnssHal13PlatformTimer5startEib_block_invoke(uint64_t a1)
{
}

void ___ZN7GnssHal13PlatformTimer4stopEv_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 56))
  {
    *(unsigned char *)(v1 + 56) = 0;
    dispatch_suspend(*(dispatch_object_t *)(v1 + 40));
  }
}

uint64_t GnssHal::InterfacesImpl::InterfacesImpl(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, uint64_t *a5, uint64_t *a6, uint64_t *a7)
{
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 8) = 0u;
  uint64_t v13 = *a2;
  *a2 = 0;
  uint64_t v14 = *(void *)(a1 + 8);
  *(void *)a1 = &unk_26EAA8208;
  *(void *)(a1 + 8) = v13;
  if (v14) {
    (*(void (**)(uint64_t))(*(void *)v14 + 8))(v14);
  }
  uint64_t v15 = *a3;
  *a3 = 0;
  uint64_t v16 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v15;
  if (v16) {
    (*(void (**)(uint64_t))(*(void *)v16 + 8))(v16);
  }
  uint64_t v17 = *a4;
  *a4 = 0;
  uint64_t v18 = *(void *)(a1 + 24);
  *(void *)(a1 + 24) = v17;
  if (v18) {
    (*(void (**)(uint64_t))(*(void *)v18 + 8))(v18);
  }
  uint64_t v19 = *a5;
  *a5 = 0;
  uint64_t v20 = *(void *)(a1 + 32);
  *(void *)(a1 + 32) = v19;
  if (v20) {
    (*(void (**)(uint64_t))(*(void *)v20 + 8))(v20);
  }
  uint64_t v21 = *a6;
  *a6 = 0;
  uint64_t v22 = *(void *)(a1 + 40);
  *(void *)(a1 + 40) = v21;
  if (v22) {
    (*(void (**)(uint64_t))(*(void *)v22 + 8))(v22);
  }
  uint64_t v23 = *a7;
  *a7 = 0;
  uint64_t v24 = *(void *)(a1 + 48);
  *(void *)(a1 + 48) = v23;
  if (v24) {
    (*(void (**)(uint64_t))(*(void *)v24 + 8))(v24);
  }
  return a1;
}

void GnssHal::InterfacesImpl::~InterfacesImpl(GnssHal::InterfacesImpl *this)
{
  GnssHal::Interfaces::~Interfaces(this);
  JUMPOUT(0x237E29950);
}

void GnssHal::Interfaces::~Interfaces(GnssHal::Interfaces *this)
{
  GnssHal::Interfaces::~Interfaces(this);
  JUMPOUT(0x237E29950);
}

{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(void *)this = &unk_26EAA8250;
  uint64_t v2 = *((void *)this + 6);
  *((void *)this + 6) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  uint64_t v3 = *((void *)this + 5);
  *((void *)this + 5) = 0;
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
  }
  uint64_t v4 = *((void *)this + 4);
  *((void *)this + 4) = 0;
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
  }
  int v5 = *((void *)this + 3);
  *((void *)this + 3) = 0;
  if (v5) {
    (*(void (**)(uint64_t))(*(void *)v5 + 8))(v5);
  }
  char v6 = *((void *)this + 2);
  *((void *)this + 2) = 0;
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
  }
  uint64_t v7 = *((void *)this + 1);
  *((void *)this + 1) = 0;
  if (v7) {
    (*(void (**)(uint64_t))(*(void *)v7 + 8))(v7);
  }
}

uint64_t GnssHal::CommUart::CommUart(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = &unk_26EAA8270;
  uint64_t v4 = (id *)GpsdPreferences::instance(0);
  *(unsigned char *)(a1 + 8) = GpsdPreferences::verboseCommDataSniffer(v4);
  *(_WORD *)(a1 + 16) = *(_WORD *)a2;
  if (*(char *)(a2 + 31) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)(a1 + 24), *(const std::string::value_type **)(a2 + 8), *(void *)(a2 + 16));
  }
  else
  {
    long long v5 = *(_OWORD *)(a2 + 8);
    *(void *)(a1 + 40) = *(void *)(a2 + 24);
    *(_OWORD *)(a1 + 24) = v5;
  }
  *(void *)(a1 + 48) = *(void *)(a2 + 32);
  *(_DWORD *)(a1 + 56) = -1;
  *(_WORD *)(a1 + 60) = 1;
  *(void *)(a1 + 64) = 0;
  if ((*(unsigned int (**)(uint64_t))(*(void *)a1 + 72))(a1)) {
    operator new();
  }
  return a1;
}

void sub_237B11224(_Unwind_Exception *a1)
{
  uint64_t v6 = *(void *)(v4 + 8);
  *(void *)(v4 + 8) = 0;
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
  }
  MEMORY[0x237E29950](v4, 0x10F0C40764F7215);
  std::unique_ptr<GnssHal::CommUart::AsyncReader>::reset[abi:ne180100](v3, 0);
  if (*(char *)(v1 + 47) < 0) {
    operator delete(*v2);
  }
  _Unwind_Resume(a1);
}

void GnssHal::CommUart::~CommUart(GnssHal::CommUart *this)
{
  *(void *)this = &unk_26EAA8270;
  GnssHal::CommUart::close(this);
  std::unique_ptr<GnssHal::CommUart::AsyncReader>::reset[abi:ne180100]((GnssHal::CommUart::AsyncReader **)this + 8, 0);
  if (*((char *)this + 47) < 0) {
    operator delete(*((void **)this + 3));
  }
}

{
  uint64_t vars8;

  GnssHal::CommUart::~CommUart(this);
  JUMPOUT(0x237E29950);
}

BOOL GnssHal::CommUart::open(GnssHal::CommUart *this)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if ((*(unsigned int (**)(GnssHal::CommUart *))(*(void *)this + 32))(this))
  {
    uint64_t v2 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(__p.__r_.__value_.__l.__data_) = 0;
      _os_log_debug_impl(&dword_237AFF000, v2, OS_LOG_TYPE_DEBUG, "#comm,already open", (uint8_t *)&__p, 2u);
    }
    return *((unsigned char *)this + 60) != 0;
  }
  uint64_t v4 = (const std::string::value_type **)((char *)this + 24);
  if (*((char *)this + 47) < 0)
  {
    std::string::size_type v5 = *((void *)this + 4);
    if (v5)
    {
      std::string::__init_copy_ctor_external(&__p, *v4, v5);
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)this + 47))
  {
    *(_OWORD *)&__p.__r_.__value_.__l.__data_ = *(_OWORD *)v4;
    __p.__r_.__value_.__r.__words[2] = *((void *)this + 5);
    goto LABEL_11;
  }
  GpsdPlatformInfo::instance(0);
  std::string::basic_string[abi:ne180100]<0>(&__p, "/dev/cu.gps");
LABEL_11:
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  int v7 = open((const char *)p_p, 131074, __p.__r_.__value_.__r.__words[0], __p.__r_.__value_.__l.__size_, __p.__r_.__value_.__r.__words[2]);
  *((_DWORD *)this + 14) = v7;
  char v8 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG))
  {
    char v12 = &__p;
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      char v12 = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    *(_DWORD *)int buf = 136315394;
    uint64_t v16 = v12;
    __int16 v17 = 1026;
    int v18 = 131074;
    _os_log_debug_impl(&dword_237AFF000, v8, OS_LOG_TYPE_DEBUG, "#comm,open,%s,flag,0x%{public}X", buf, 0x12u);
    int v7 = *((_DWORD *)this + 14);
  }
  if (v7 == -1)
  {
    char v10 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      int v13 = *__error();
      *(_DWORD *)int buf = 67240192;
      LODWORD(v16) = v13;
      _os_log_error_impl(&dword_237AFF000, v10, OS_LOG_TYPE_ERROR, "#comm,open,errno,%{public}d", buf, 8u);
    }
  }
  else if ((*(unsigned int (**)(GnssHal::CommUart *))(*(void *)this + 112))(this) {
         && GnssHal::CommUart::configure(this))
  }
  {
    uint64_t v9 = (dispatch_queue_t *)*((void *)this + 8);
    if (v9) {
      GnssHal::CommUart::AsyncReader::open(v9);
    }
    uint64_t v3 = 1;
    goto LABEL_24;
  }
  uint64_t v3 = 0;
LABEL_24:
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  return v3;
}

void sub_237B115D4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t GnssHal::CommUart::configure(GnssHal::CommUart *this)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (tcgetattr(*((_DWORD *)this + 14), &v29) == -1)
  {
    uint64_t v9 = GpsdLogObjectGeneral;
    if (!os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    int v21 = *__error();
    *(_DWORD *)int buf = 67240192;
    *(_DWORD *)int v27 = v21;
    uint64_t v6 = "#comm,configure,tcgetattr failed,%{public}d";
LABEL_27:
    int v7 = v9;
    uint32_t v8 = 8;
    goto LABEL_28;
  }
  cfmakeraw(&v29);
  v29.c_cc[16] = 0;
  v29.c_cc[17] = *((unsigned char *)this + 17);
  if (v29.c_cc[17])
  {
    unint64_t v24 = 115200;
    speed_t v25 = 115200;
    int v2 = GnssHal::CommUart::Config::lookupBaudRate((GnssHal::CommUart *)((char *)this + 16), &v25, &v24);
    speed_t v3 = v25;
    if (cfsetspeed(&v29, v25))
    {
      uint64_t v4 = GpsdLogObjectGeneral;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
      {
        int v5 = *__error();
        *(_DWORD *)int buf = 134349312;
        *(void *)int v27 = v3;
        *(_WORD *)&v27[8] = 1026;
        LODWORD(v28[0]) = v5;
        uint64_t v6 = "#comm,configure,cfsetspeed failed,%{public}lu,%{public}d";
        int v7 = v4;
LABEL_6:
        uint32_t v8 = 18;
LABEL_28:
        _os_log_error_impl(&dword_237AFF000, v7, OS_LOG_TYPE_ERROR, v6, buf, v8);
      }
LABEL_8:
      uint64_t v10 = 0;
      *((unsigned char *)this + 60) = 0;
      return v10;
    }
    tcflag_t v13 = v29.c_cflag | 0x30300;
    if (!*((unsigned char *)this + 16)) {
      tcflag_t v13 = v29.c_cflag & 0xFFFFFFFFFFFCFCFFLL | 0x300;
    }
    v29.c_cflag = v13;
    if (tcsetattr(*((_DWORD *)this + 14), 0, &v29))
    {
      uint64_t v9 = GpsdLogObjectGeneral;
      if (!os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR)) {
        goto LABEL_8;
      }
      int v14 = *__error();
      *(_DWORD *)int buf = 67240192;
      *(_DWORD *)int v27 = v14;
      uint64_t v6 = "#comm,configure,tcsetattr failed,%{public}d";
      goto LABEL_27;
    }
    if (v2)
    {
      int v15 = ioctl(*((_DWORD *)this + 14), 0x80085402uLL, &v24);
      uint64_t v16 = GpsdLogObjectGeneral;
      if (v15 == -1)
      {
        if (!os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR)) {
          goto LABEL_8;
        }
        unint64_t v22 = v24;
        int v23 = *__error();
        *(_DWORD *)int buf = 134349312;
        *(void *)int v27 = v22;
        *(_WORD *)&v27[8] = 1026;
        LODWORD(v28[0]) = v23;
        uint64_t v6 = "#comm,configure,IOSSIOSPEED failed,%{public}lu,%{public}d";
        int v7 = v16;
        goto LABEL_6;
      }
      if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)int buf = 134218240;
        *(void *)int v27 = v24;
        *(_WORD *)&v27[8] = 2048;
        v28[0] = v3;
        _os_log_debug_impl(&dword_237AFF000, v16, OS_LOG_TYPE_DEBUG, "#comm,configure,IOSSIOSPEED,%lu,standardSpeed,%lu", buf, 0x16u);
      }
    }
    __int16 v17 = GpsdLogObjectGeneral;
    uint64_t v10 = 1;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
    {
      int v18 = *((unsigned __int8 *)this + 16);
      int v19 = *((unsigned __int8 *)this + 17);
      unint64_t v20 = v24;
      if (!v2) {
        unint64_t v20 = v3;
      }
      *(_DWORD *)int buf = 67240704;
      *(_DWORD *)int v27 = v18;
      *(_WORD *)&v27[4] = 1026;
      *(_DWORD *)&v27[6] = v19;
      LOWORD(v28[0]) = 2050;
      *(void *)((char *)v28 + 2) = v20;
      _os_log_impl(&dword_237AFF000, v17, OS_LOG_TYPE_INFO, "#comm,configured,flowCtrl,%{public}d,timeoutTenths,%{public}d,baud,%{public}lu", buf, 0x18u);
    }
  }
  else
  {
    int v11 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int buf = 0;
      _os_log_error_impl(&dword_237AFF000, v11, OS_LOG_TYPE_ERROR, "#comm,configure,timeoutTenthsOfSeconds is 0", buf, 2u);
    }
    return 0;
  }
  return v10;
}

void GnssHal::CommUart::AsyncReader::open(dispatch_queue_t *this)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  int v2 = (*((uint64_t (**)(dispatch_queue_t))(*this)->isa + 5))(*this);
  dispatch_source_t v3 = dispatch_source_create(MEMORY[0x263EF83E8], v2, 0, this[2]);
  this[7] = v3;
  if (!v3)
  {
    int v7 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int buf = 0;
      _os_log_error_impl(&dword_237AFF000, v7, OS_LOG_TYPE_ERROR, "#comm,async,readSrc,nullptr", buf, 2u);
      int v7 = GpsdLogObjectGeneral;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 136446722;
      tcflag_t v13 = "/Library/Caches/com.apple.xbs/Sources/CoreGPS/Sources/HAL/Implementation/GnssHalCommUart.mm";
      __int16 v14 = 1026;
      int v15 = 456;
      __int16 v16 = 2082;
      __int16 v17 = "open";
      _os_log_error_impl(&dword_237AFF000, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: assertion failure in %{public}s", buf, 0x1Cu);
    }
    std::string::basic_string[abi:ne180100]<0>(&v11, "assert");
    std::string::basic_string[abi:ne180100]<0>(&v10, "open");
    std::string::basic_string[abi:ne180100]<0>(&v9, "#comm,async,readSrc,nullptr");
    gpsd::util::triggerDiagnosticReport((uint64_t)&v11, (uint64_t)&v10, (uint64_t)&v9);
    std::string::~string(&v9);
    std::string::~string(&v10);
    std::string::~string(&v11);
    __assert_rtn("open", "GnssHalCommUart.mm", 456, "false && \"#comm,async,readSrc,nullptr\"");
  }
  std::vector<unsigned char>::reserve((unint64_t *)this + 8, 0x1000uLL);
  uint64_t v4 = this[7];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  _DWORD v8[2] = ___ZN7GnssHal8CommUart11AsyncReader4openEv_block_invoke;
  v8[3] = &__block_descriptor_40_e5_v8__0l;
  void v8[4] = this;
  dispatch_source_set_event_handler(v4, v8);
  dispatch_resume(this[7]);
  if (this[1])
  {
    unsigned int v5 = *(_DWORD *)(GpsdPlatformInfo::instance(0) + 8) - 103;
    if (v5 <= 4 && ((1 << v5) & 0x19) != 0)
    {
      (*((void (**)(dispatch_queue_t))this[1]->isa + 2))(this[1]);
      usleep(0x4E20u);
      (*((void (**)(void))this[1]->isa + 3))();
      usleep(0x186A0u);
      uint64_t v6 = GpsdLogObjectGeneral;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)int buf = 0;
        _os_log_debug_impl(&dword_237AFF000, v6, OS_LOG_TYPE_DEBUG, "#comm,async,powerOnChip", buf, 2u);
      }
    }
  }
}

void sub_237B11CDC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25,void *a26,uint64_t a27,int a28,__int16 a29,char a30,char a31)
{
  if (a19 < 0) {
    operator delete(__p);
  }
  if (a25 < 0) {
    operator delete(a20);
  }
  if (a31 < 0) {
    operator delete(a26);
  }
  _Unwind_Resume(exception_object);
}

void GnssHal::CommUart::close(GnssHal::CommUart *this)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if ((*(unsigned int (**)(GnssHal::CommUart *))(*(void *)this + 32))(this))
  {
    int v2 = (GnssHal::CommUart::AsyncReader *)*((void *)this + 8);
    if (v2) {
      GnssHal::CommUart::AsyncReader::close(v2);
    }
    if (close(*((_DWORD *)this + 14)) < 0)
    {
      uint64_t v9 = GpsdLogObjectWarning;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectWarning, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = *__error();
        v11[0] = 67240192;
        v11[1] = v10;
        uint64_t v4 = "#comm,close,errno,%{public}d";
        unsigned int v5 = v9;
        os_log_type_t v6 = OS_LOG_TYPE_DEFAULT;
        uint32_t v7 = 8;
        goto LABEL_11;
      }
    }
    else
    {
      uint64_t v3 = GpsdLogObjectGeneral;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
      {
        LOWORD(v11[0]) = 0;
        uint64_t v4 = "#comm,close,completed";
        unsigned int v5 = v3;
        os_log_type_t v6 = OS_LOG_TYPE_INFO;
        uint32_t v7 = 2;
LABEL_11:
        _os_log_impl(&dword_237AFF000, v5, v6, v4, (uint8_t *)v11, v7);
      }
    }
    *((_DWORD *)this + 14) = -1;
    return;
  }
  uint32_t v8 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
  {
    LOWORD(v11[0]) = 0;
    _os_log_impl(&dword_237AFF000, v8, OS_LOG_TYPE_INFO, "#comm,close,not open", (uint8_t *)v11, 2u);
  }
}

void GnssHal::CommUart::AsyncReader::close(GnssHal::CommUart::AsyncReader *this)
{
  if (*((void *)this + 1))
  {
    unsigned int v2 = *(_DWORD *)(GpsdPlatformInfo::instance(0) + 8) - 103;
    BOOL v3 = v2 > 4;
    int v4 = (1 << v2) & 0x19;
    if (!v3 && v4 != 0) {
      (*(void (**)(void))(**((void **)this + 1) + 16))(*((void *)this + 1));
    }
  }
  dispatch_release(*((dispatch_object_t *)this + 7));
  os_log_type_t v6 = (void *)*((void *)this + 8);
  *((void *)this + 7) = 0;
  *((void *)this + 8) = 0;
  *((void *)this + 9) = 0;
  *((void *)this + 10) = 0;
  if (v6)
  {
    operator delete(v6);
  }
}

BOOL GnssHal::CommUart::waitForDataAvailable(GnssHal::CommUart *this)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if ((*(uint64_t (**)(GnssHal::CommUart *))(*(void *)this + 32))(this))
  {
    int v2 = *((_DWORD *)this + 14);
    memset(&v16, 0, sizeof(v16));
    if (__darwin_check_fd_set_overflow(v2, &v16, 0)) {
      *(__int32_t *)((char *)v16.fds_bits + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << v2;
    }
    int v3 = select(v2 + 1, &v16, 0, 0, 0);
    BOOL v4 = v3 >= 0;
    if (v3 < 0)
    {
      int v11 = *__error();
      uint64_t v12 = GpsdLogObjectGeneral;
      if (v11 == 9)
      {
        if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)int buf = 67240192;
          int v18 = v2;
          _os_log_impl(&dword_237AFF000, v12, OS_LOG_TYPE_INFO, "#comm,select,interrupted,fd,%{public}d", buf, 8u);
        }
      }
      else if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
      {
        int v13 = *__error();
        __int16 v14 = __error();
        int v15 = strerror(*v14);
        *(_DWORD *)int buf = 67240706;
        int v18 = v13;
        __int16 v19 = 2082;
        unint64_t v20 = v15;
        __int16 v21 = 1026;
        int v22 = v2;
        os_log_type_t v6 = "#comm,select,errno,%{public}d,%{public}s,fd,%{public}d";
        uint32_t v7 = v12;
        uint32_t v8 = 24;
        goto LABEL_17;
      }
    }
    else if (*((unsigned char *)this + 61))
    {
      uint64_t v5 = GpsdLogObjectGeneral;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)int buf = 0;
        os_log_type_t v6 = "#comm,rx data while in sleep";
        uint32_t v7 = v5;
        uint32_t v8 = 2;
LABEL_17:
        _os_log_error_impl(&dword_237AFF000, v7, OS_LOG_TYPE_ERROR, v6, buf, v8);
      }
    }
  }
  else
  {
    uint64_t v9 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v16.fds_bits[0]) = 0;
      _os_log_error_impl(&dword_237AFF000, v9, OS_LOG_TYPE_ERROR, "#comm,waitForDataAvailable,portNotOpen", (uint8_t *)&v16, 2u);
    }
    return 0;
  }
  return v4;
}

uint64_t GnssHal::CommUart::readTimeout(GnssHal::CommUart *this, unsigned __int8 *a2, size_t a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (!*((unsigned char *)this + 60)
    || ((*(uint64_t (**)(GnssHal::CommUart *))(*(void *)this + 32))(this) & 1) == 0)
  {
    int v10 = GpsdLogObjectWarning;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectWarning, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = *((unsigned __int8 *)this + 60);
      int v12 = (*(uint64_t (**)(GnssHal::CommUart *))(*(void *)this + 32))(this);
      int v14 = 67240448;
      int v15 = v11;
      __int16 v16 = 1026;
      LODWORD(v17) = v12;
      _os_log_impl(&dword_237AFF000, v10, OS_LOG_TYPE_DEFAULT, "#comm,read,unavailable,good,%{public}d,open,%{public}d", (uint8_t *)&v14, 0xEu);
    }
    return -1;
  }
  uint32_t v7 = (const unsigned __int8 *)read(*((_DWORD *)this + 14), a2, a3);
  if (*((unsigned char *)this + 8)) {
    gpsd::util::logBinaryBytes((gpsd::util *)a2, v7, (uint64_t)"#comm,read", v6);
  }
  if (v7 == (const unsigned __int8 *)-1)
  {
    int v8 = *__error();
    uint64_t v9 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 67240450;
      int v15 = v8;
      __int16 v16 = 2082;
      __int16 v17 = strerror(v8);
      _os_log_debug_impl(&dword_237AFF000, v9, OS_LOG_TYPE_DEBUG, "#comm,read,errno,%{public}d,%{public}s", (uint8_t *)&v14, 0x12u);
    }
    if (v8 == 35) {
      return 0;
    }
    *((unsigned char *)this + 60) = 0;
    return -1;
  }
  return (uint64_t)v7;
}

uint64_t GnssHal::CommUart::isReadCallbackSupported(GnssHal::CommUart *this)
{
  uint64_t v1 = (id *)GpsdPreferences::instance(0);
  return GpsdPreferences::usesAsyncCommRead(v1);
}

BOOL GnssHal::CommUart::setReadCallback(uint64_t a1, uint64_t a2)
{
  v4[4] = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 64);
  if (v2)
  {
    std::__function::__value_func<void ()(unsigned char *,unsigned long)>::__value_func[abi:ne180100]((uint64_t)v4, a2);
    GnssHal::CommUart::AsyncReader::setReadCallback(v2, (uint64_t)v4);
    std::__function::__value_func<void ()(unsigned char *,unsigned long)>::~__value_func[abi:ne180100](v4);
  }
  return v2 != 0;
}

void sub_237B1245C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__function::__value_func<void ()(unsigned char *,unsigned long)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

uint64_t GnssHal::CommUart::AsyncReader::setReadCallback(uint64_t a1, uint64_t a2)
{
  int v3 = (void *)(a1 + 24);
  if (*(void *)(a1 + 48))
  {
    BOOL v4 = GpsdLogObjectWarning;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectWarning, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int buf = 0;
      _os_log_impl(&dword_237AFF000, v4, OS_LOG_TYPE_DEFAULT, "#comm,setReadCallback,alreadySet", buf, 2u);
    }
  }
  std::function<void ()(unsigned char *,unsigned long)>::operator=(v3, a2);
  uint64_t v5 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint32_t v7 = 0;
    _os_log_debug_impl(&dword_237AFF000, v5, OS_LOG_TYPE_DEBUG, "#comm,setReadCallback", v7, 2u);
  }
  return 1;
}

BOOL GnssHal::CommUart::readComplete(GnssHal::CommUart *this, unsigned __int8 *a2, unint64_t a3)
{
  unint64_t v6 = 0;
  do
  {
    unint64_t v7 = v6;
    if (a3 <= v6) {
      break;
    }
    uint64_t v8 = (*(uint64_t (**)(GnssHal::CommUart *, unsigned __int8 *, unint64_t))(*(void *)this + 56))(this, &a2[v6], a3 - v6);
    unint64_t v6 = v8 + v7;
  }
  while ((v8 & 0x8000000000000000) == 0);
  return a3 == v7;
}

unint64_t GnssHal::CommUart::write(GnssHal::CommUart *this, gpsd::util *a2, unsigned __int8 *a3, const char *a4)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (*((unsigned char *)this + 8)) {
    gpsd::util::logBinaryBytes(a2, a3, (uint64_t)"#comm,write", a4);
  }
  if (!*((unsigned char *)this + 60)
    || ((*(uint64_t (**)(GnssHal::CommUart *))(*(void *)this + 32))(this) & 1) == 0)
  {
    int v10 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG))
    {
      int v15 = *((unsigned __int8 *)this + 60);
      int v16 = (*(uint64_t (**)(GnssHal::CommUart *))(*(void *)this + 32))(this);
      int v17 = 67240448;
      *(_DWORD *)uint64_t v18 = v15;
      *(_WORD *)&void v18[4] = 1026;
      *(_DWORD *)&v18[6] = v16;
      _os_log_debug_impl(&dword_237AFF000, v10, OS_LOG_TYPE_DEBUG, "#comm,write,unavailable,good,%{public}d,open,%{public}d", (uint8_t *)&v17, 0xEu);
    }
    return -1;
  }
  unint64_t v7 = write(*((_DWORD *)this + 14), a2, (size_t)a3);
  if (v7 != -1)
  {
    unint64_t v8 = v7;
    if (v7 < (unint64_t)a3)
    {
      uint64_t v9 = GpsdLogObjectGeneral;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG))
      {
        int v17 = 134349312;
        *(void *)uint64_t v18 = a3;
        *(_WORD *)&v18[8] = 1026;
        int v19 = v8;
        _os_log_debug_impl(&dword_237AFF000, v9, OS_LOG_TYPE_DEBUG, "#comm,write,overflow,toWrite,%{public}zu,done,%{public}d,retry", (uint8_t *)&v17, 0x12u);
      }
    }
    return v8;
  }
  int v12 = *__error();
  if (v12 != 35)
  {
    *((unsigned char *)this + 60) = 0;
    int v14 = GpsdLogObjectWarning;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectWarning, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 67240192;
      *(_DWORD *)uint64_t v18 = v12;
      _os_log_impl(&dword_237AFF000, v14, OS_LOG_TYPE_DEFAULT, "#comm,write,errno,%{public}d", (uint8_t *)&v17, 8u);
    }
    return -1;
  }
  int v13 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG))
  {
    int v17 = 67240192;
    *(_DWORD *)uint64_t v18 = 35;
    _os_log_debug_impl(&dword_237AFF000, v13, OS_LOG_TYPE_DEBUG, "#comm,write,errno,%{public}d", (uint8_t *)&v17, 8u);
  }
  return 0;
}

BOOL GnssHal::CommUart::writeComplete(GnssHal::CommUart *this, const unsigned __int8 *a2, unint64_t a3)
{
  unint64_t v6 = 0;
  do
  {
    unint64_t v7 = v6;
    if (a3 <= v6) {
      break;
    }
    uint64_t v8 = (*(uint64_t (**)(GnssHal::CommUart *, const unsigned __int8 *, unint64_t))(*(void *)this + 88))(this, &a2[v6], a3 - v6);
    unint64_t v6 = v8 + v7;
  }
  while ((v8 & 0x8000000000000000) == 0);
  return a3 == v7;
}

BOOL GnssHal::CommUart::enterLowPowerMode(GnssHal::CommUart *this)
{
  BOOL v2 = GnssHal::CommUart::setRtsState((uint64_t)this, 0);
  int v3 = GpsdLogObjectGeneral;
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int buf = 0;
      _os_log_impl(&dword_237AFF000, v3, OS_LOG_TYPE_DEFAULT, "#comm,enterLowPowerMode,success", buf, 2u);
    }
    *((unsigned char *)this + 61) = 1;
  }
  else if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_error_impl(&dword_237AFF000, v3, OS_LOG_TYPE_ERROR, "#comm,enterLowPowerMode,failure", v5, 2u);
  }
  return v2;
}

BOOL GnssHal::CommUart::setRtsState(uint64_t a1, int a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  BOOL v4 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)int buf = 67240192;
    int v11 = a2;
    _os_log_impl(&dword_237AFF000, v4, OS_LOG_TYPE_INFO, "#comm,setRtsState,%{public}d", buf, 8u);
  }
  int v9 = 4;
  if (a2 != 1)
  {
    if (!a2 && ioctl(*(_DWORD *)(a1 + 56), 0x8004746BuLL, &v9) < 0)
    {
      uint64_t v5 = GpsdLogObjectGeneral;
      BOOL result = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR);
      if (result)
      {
        int v7 = *__error();
        *(_DWORD *)int buf = 67240448;
        int v11 = 0;
        __int16 v12 = 1026;
        int v13 = v7;
LABEL_13:
        _os_log_error_impl(&dword_237AFF000, v5, OS_LOG_TYPE_ERROR, "#comm,setRtsState,%{public}d,ioctl error,%{public}d", buf, 0xEu);
        return 0;
      }
      return result;
    }
    return 1;
  }
  if ((ioctl(*(_DWORD *)(a1 + 56), 0x8004746CuLL, &v9) & 0x80000000) == 0) {
    return 1;
  }
  uint64_t v5 = GpsdLogObjectGeneral;
  BOOL result = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR);
  if (result)
  {
    int v8 = *__error();
    *(_DWORD *)int buf = 67240448;
    int v11 = 1;
    __int16 v12 = 1026;
    int v13 = v8;
    goto LABEL_13;
  }
  return result;
}

BOOL GnssHal::CommUart::exitLowPowerMode(GnssHal::CommUart *this)
{
  BOOL v2 = GnssHal::CommUart::setRtsState((uint64_t)this, 1);
  int v3 = GpsdLogObjectGeneral;
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int buf = 0;
      _os_log_impl(&dword_237AFF000, v3, OS_LOG_TYPE_DEFAULT, "#comm,exitLowPowerMode,success", buf, 2u);
    }
    *((unsigned char *)this + 61) = 0;
  }
  else if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_error_impl(&dword_237AFF000, v3, OS_LOG_TYPE_ERROR, "#comm,exitLowPowerMode,failure", v5, 2u);
  }
  return v2;
}

BOOL GnssHal::CommUart::readWriteFlush(GnssHal::CommUart *this)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if ((*(uint64_t (**)(GnssHal::CommUart *))(*(void *)this + 32))(this))
  {
    if (tcflush(*((_DWORD *)this + 14), 3))
    {
      BOOL v2 = GpsdLogObjectWarning;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectWarning, OS_LOG_TYPE_DEFAULT))
      {
        int v3 = *__error();
        v7[0] = 67240192;
        v7[1] = v3;
        _os_log_impl(&dword_237AFF000, v2, OS_LOG_TYPE_DEFAULT, "#comm,readWriteFlush,TCIOFLUSH error,%{public}d", (uint8_t *)v7, 8u);
      }
      BOOL result = 0;
      *((unsigned char *)this + 60) = 0;
    }
    else
    {
      unint64_t v6 = GpsdLogObjectGeneral;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v7[0]) = 0;
        _os_log_debug_impl(&dword_237AFF000, v6, OS_LOG_TYPE_DEBUG, "#comm,readWriteFlush,success", (uint8_t *)v7, 2u);
      }
      return 1;
    }
  }
  else
  {
    uint64_t v5 = GpsdLogObjectGeneral;
    BOOL result = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO);
    if (result)
    {
      LOWORD(v7[0]) = 0;
      _os_log_impl(&dword_237AFF000, v5, OS_LOG_TYPE_INFO, "#comm,readWriteFlush,not open", (uint8_t *)v7, 2u);
      return 0;
    }
  }
  return result;
}

BOOL GnssHal::CommUart::readFlush(GnssHal::CommUart *this)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if ((*(uint64_t (**)(GnssHal::CommUart *))(*(void *)this + 32))(this))
  {
    int v2 = tcflush(*((_DWORD *)this + 14), 1);
    int v3 = GpsdLogObjectGeneral;
    if (v2)
    {
      if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
      {
        int v4 = *__error();
        v7[0] = 67240192;
        v7[1] = v4;
        _os_log_impl(&dword_237AFF000, v3, OS_LOG_TYPE_INFO, "#comm,readFlush,TCIFLUSH error,%{public}d", (uint8_t *)v7, 8u);
      }
      BOOL result = 0;
      *((unsigned char *)this + 60) = 0;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v7[0]) = 0;
        _os_log_debug_impl(&dword_237AFF000, v3, OS_LOG_TYPE_DEBUG, "#comm,readFlush,success", (uint8_t *)v7, 2u);
      }
      return 1;
    }
  }
  else
  {
    unint64_t v6 = GpsdLogObjectGeneral;
    BOOL result = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO);
    if (result)
    {
      LOWORD(v7[0]) = 0;
      _os_log_impl(&dword_237AFF000, v6, OS_LOG_TYPE_INFO, "#comm,readFlush,not open", (uint8_t *)v7, 2u);
      return 0;
    }
  }
  return result;
}

uint64_t GnssHal::CommUart::Config::lookupBaudRate(GnssHal::CommUart::Config *this, unint64_t *a2, unint64_t *a3)
{
  if (*((unsigned char *)this + 36)) {
    int v5 = *((_DWORD *)this + 8);
  }
  else {
    int v5 = GnssHal::CommUart::Config::platformDefaultBaudRate(this);
  }
  uint64_t result = 0;
  *a2 = 115200;
  switch(v5)
  {
    case 0:
      uint64_t result = 0;
      *a2 = 9600;
      return result;
    case 1:
      unint64_t v7 = 921600;
      goto LABEL_12;
    case 3:
      unint64_t v7 = 1000000;
      goto LABEL_12;
    case 4:
      unint64_t v7 = 2400000;
      goto LABEL_12;
    case 5:
      unint64_t v7 = 3000000;
      goto LABEL_12;
    case 6:
      unint64_t v7 = 3200000;
      goto LABEL_12;
    case 7:
      unint64_t v7 = 4800000;
LABEL_12:
      *a3 = v7;
      uint64_t result = 1;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t GnssHal::CommUart::Config::platformDefaultBaudRate(GnssHal::CommUart::Config *this)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (*(_DWORD *)(GpsdPlatformInfo::instance(0) + 8) == 201)
  {
    uint64_t v1 = (id *)GpsdPreferences::instance(0);
    if (GpsdPreferences::baudRate4M8(v1)) {
      return 7;
    }
    else {
      return 4;
    }
  }
  else if (*(_DWORD *)(GpsdPlatformInfo::instance(0) + 8) == 103 {
         || *(_DWORD *)(GpsdPlatformInfo::instance(0) + 8) == 106)
  }
  {
    return 6;
  }
  else
  {
    int v3 = GpsdLogObjectGeneral;
    uint64_t v2 = 1;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_FAULT))
    {
      v5[0] = 67109120;
      v5[1] = 1;
      _os_log_fault_impl(&dword_237AFF000, v3, OS_LOG_TYPE_FAULT, "UnsupportedHardware,defaultRate,%d,used", (uint8_t *)v5, 8u);
    }
  }
  return v2;
}

void GnssHal::CommUart::pulseTimeMarkStrobe(GnssHal::CommUart *this@<X0>, uint64_t a2@<X8>)
{
  int v4 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v7) = 0;
    _os_log_debug_impl(&dword_237AFF000, v4, OS_LOG_TYPE_DEBUG, "#comm,CommUart::pulseTimeMarkStrobe", (uint8_t *)&v7, 2u);
  }
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  *(unsigned char *)(a2 + 16) = 0;
  int v5 = (GnssHal::CommUart::AsyncReader *)*((void *)this + 8);
  if (v5)
  {
    GnssHal::CommUart::AsyncReader::pulseTimeMarkStrobe(v5, (uint64_t)&v7);
    *(_OWORD *)a2 = v7;
    *(unsigned char *)(a2 + 16) = v8;
  }
  else
  {
    uint64_t v6 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v7) = 0;
      _os_log_error_impl(&dword_237AFF000, v6, OS_LOG_TYPE_ERROR, "#comm,fAsyncReader,null", (uint8_t *)&v7, 2u);
    }
  }
}

void GnssHal::CommUart::AsyncReader::pulseTimeMarkStrobe(GnssHal::CommUart::AsyncReader *this@<X0>, uint64_t a2@<X8>)
{
  int v4 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v7) = 0;
    _os_log_debug_impl(&dword_237AFF000, v4, OS_LOG_TYPE_DEBUG, "#comm,CommUart::AsyncReader::pulseTimeMarkStrobe", (uint8_t *)&v7, 2u);
  }
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  *(unsigned char *)(a2 + 16) = 0;
  uint64_t v5 = *((void *)this + 1);
  if (v5)
  {
    (*(void (**)(long long *__return_ptr))(*(void *)v5 + 48))(&v7);
    *(_OWORD *)a2 = v7;
    *(unsigned char *)(a2 + 16) = v8;
  }
  else
  {
    uint64_t v6 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v7) = 0;
      _os_log_error_impl(&dword_237AFF000, v6, OS_LOG_TYPE_ERROR, "#comm,fGpio,null", (uint8_t *)&v7, 2u);
    }
  }
}

dispatch_queue_t GnssHal::CommUart::AsyncReader::createDispatchQueue(GnssHal::CommUart::AsyncReader *this)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v1 = (id *)GpsdPreferences::instance(0);
  dispatch_qos_class_t v2 = GpsdPreferences::maxSchedulerQos(v1);
  int v3 = dispatch_queue_attr_make_with_qos_class(0, v2, 0);
  if (!v3)
  {
    int v4 = GpsdLogObjectWarning;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectWarning, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int buf = 0;
      _os_log_impl(&dword_237AFF000, v4, OS_LOG_TYPE_DEFAULT, "#comm,async,nullattr", buf, 2u);
    }
  }
  dispatch_queue_t result = dispatch_queue_create("com.apple.gpsd.comm", v3);
  if (!result)
  {
    uint64_t v6 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int buf = 0;
      _os_log_error_impl(&dword_237AFF000, v6, OS_LOG_TYPE_ERROR, "#comm,async,createQ,nullptr", buf, 2u);
      uint64_t v6 = GpsdLogObjectGeneral;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 136446722;
      int v11 = "/Library/Caches/com.apple.xbs/Sources/CoreGPS/Sources/HAL/Implementation/GnssHalCommUart.mm";
      __int16 v12 = 1026;
      int v13 = 439;
      __int16 v14 = 2082;
      int v15 = "createDispatchQueue";
      _os_log_error_impl(&dword_237AFF000, v6, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: assertion failure in %{public}s", buf, 0x1Cu);
    }
    std::string::basic_string[abi:ne180100]<0>(&v9, "assert");
    std::string::basic_string[abi:ne180100]<0>(&v8, "createDispatchQueue");
    std::string::basic_string[abi:ne180100]<0>(&v7, "#comm,async,createQ,nullptr");
    gpsd::util::triggerDiagnosticReport((uint64_t)&v9, (uint64_t)&v8, (uint64_t)&v7);
    std::string::~string(&v7);
    std::string::~string(&v8);
    std::string::~string(&v9);
    __assert_rtn("createDispatchQueue", "GnssHalCommUart.mm", 439, "false && \"#comm,async,createQ,nullptr\"");
  }
  return result;
}

void sub_237B13528(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (a27 < 0) {
    operator delete(a22);
  }
  _Unwind_Resume(exception_object);
}

void *std::function<void ()(unsigned char *,unsigned long)>::operator=(void *a1, uint64_t a2)
{
  v4[4] = *MEMORY[0x263EF8340];
  std::__function::__value_func<void ()(unsigned char *,unsigned long)>::__value_func[abi:ne180100]((uint64_t)v4, a2);
  std::__function::__value_func<void ()(unsigned char *,unsigned long)>::swap[abi:ne180100](v4, a1);
  std::__function::__value_func<void ()(unsigned char *,unsigned long)>::~__value_func[abi:ne180100](v4);
  return a1;
}

void std::vector<unsigned char>::reserve(unint64_t *a1, size_t __sz)
{
  unint64_t v2 = *a1;
  if (a1[2] - *a1 < __sz)
  {
    if ((__sz & 0x8000000000000000) != 0) {
      std::vector<gnssTest::RfMeasurement>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v5 = (char *)a1[1];
    uint64_t v6 = operator new(__sz);
    std::string v7 = &v5[(void)v6 - v2];
    std::string v8 = v7;
    if (v5 != (char *)v2)
    {
      std::string v9 = &v5[~v2];
      do
      {
        char v10 = *--v5;
        (v9--)[(void)v6] = v10;
      }
      while (v5 != (char *)v2);
      std::string v8 = v6;
    }
    *a1 = (unint64_t)v8;
    a1[1] = (unint64_t)v7;
    a1[2] = (unint64_t)&v6[__sz];
    if (v2)
    {
      operator delete((void *)v2);
    }
  }
}

uint64_t ___ZN7GnssHal8CommUart11AsyncReader4openEv_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t result = (*(uint64_t (**)(void, void, void))(*(void *)*v1 + 56))(*v1, v1[8], v1[10] - v1[8]);
  if (result >= 1 && v1[6])
  {
    uint64_t v3 = v1[8];
    return std::function<void ()(unsigned char *,unsigned long)>::operator()((uint64_t)(v1 + 3), v3, result);
  }
  return result;
}

uint64_t std::function<void ()(unsigned char *,unsigned long)>::operator()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = a3;
  uint64_t v6 = a2;
  uint64_t v3 = *(void *)(a1 + 24);
  if (!v3) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t *))(*(void *)v3 + 48))(v3, &v6, &v5);
}

BOOL GnssHal::CommUart::isOpen(GnssHal::CommUart *this)
{
  return *((_DWORD *)this + 14) != -1;
}

uint64_t GnssHal::CommUart::getFileDescriptor(GnssHal::CommUart *this)
{
  return *((unsigned int *)this + 14);
}

double GnssHal::CommUart::getTimeoutValueSeconds(GnssHal::CommUart *this, double a2)
{
  LOBYTE(a2) = *((unsigned char *)this + 17);
  return (double)*(unint64_t *)&a2 * 10.0;
}

void *std::__function::__value_func<void ()(unsigned char *,unsigned long)>::~__value_func[abi:ne180100](void *a1)
{
  unint64_t v2 = (void *)a1[3];
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

GnssHal::CommUart::AsyncReader **std::unique_ptr<GnssHal::CommUart::AsyncReader>::reset[abi:ne180100](GnssHal::CommUart::AsyncReader **result, GnssHal::CommUart::AsyncReader *a2)
{
  unint64_t v2 = *result;
  *uint64_t result = a2;
  if (v2)
  {
    GnssHal::CommUart::AsyncReader::close(v2);
    uint64_t v3 = (void *)*((void *)v2 + 8);
    if (v3)
    {
      *((void *)v2 + 9) = v3;
      operator delete(v3);
    }
    std::__function::__value_func<void ()(unsigned char *,unsigned long)>::~__value_func[abi:ne180100]((void *)v2 + 3);
    uint64_t v4 = *((void *)v2 + 1);
    *((void *)v2 + 1) = 0;
    if (v4) {
      (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
    }
    JUMPOUT(0x237E29950);
  }
  return result;
}

uint64_t std::__function::__value_func<void ()(unsigned char *,unsigned long)>::__value_func[abi:ne180100](uint64_t a1, uint64_t a2)
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

void *std::__function::__value_func<void ()(unsigned char *,unsigned long)>::swap[abi:ne180100](void *result, void *a2)
{
  void v6[3] = *MEMORY[0x263EF8340];
  if (a2 != result)
  {
    uint64_t v3 = result;
    uint64_t v4 = (void *)result[3];
    uint64_t v5 = (void *)a2[3];
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
        uint64_t result = (void *)(*(uint64_t (**)(void *))(v6[0] + 32))(v6);
      }
      else
      {
        (*(void (**)(void *, void *))(*result + 24))(result, a2);
        uint64_t result = (void *)(*(uint64_t (**)(void))(*(void *)v3[3] + 32))(v3[3]);
        v3[3] = a2[3];
      }
      a2[3] = a2;
    }
    else if (v5 == a2)
    {
      (*(void (**)(void *, void *))(*a2 + 24))(a2, result);
      uint64_t result = (void *)(*(uint64_t (**)(void))(*(void *)a2[3] + 32))(a2[3]);
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

void sub_237B13BE4(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  __clang_call_terminate(a1);
}

uint64_t GnssHal::CommPcie::CommPcie(uint64_t a1, void *a2, uint64_t a3)
{
  v12[3] = *MEMORY[0x263EF8340];
  *(void *)a1 = &unk_26EAA8340;
  *(unsigned char *)(a1 + 96) = 0;
  std::__function::__value_func<void ()(GnssHal::TimeTransferPulseMark)>::__value_func[abi:ne180100](a1 + 104, a3);
  if (qword_2689430F0)
  {
    uint64_t v5 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)char v10 = 0;
      _os_log_error_impl(&dword_237AFF000, v5, OS_LOG_TYPE_ERROR, "#pcie,sReadCallbackFunction collision", v10, 2u);
    }
  }
  uint64_t v6 = (void *)a2[3];
  if (!v6)
  {
    int v11 = 0;
    uint64_t v8 = qword_268943110;
    if ((uint64_t *)qword_268943110 != &qword_2689430F8)
    {
      std::string v7 = 0;
LABEL_12:
      int v11 = (uint8_t *)v8;
      qword_268943110 = (uint64_t)v7;
      goto LABEL_18;
    }
LABEL_13:
    (*(void (**)(void))(qword_2689430F8 + 24))();
    (*(void (**)(uint64_t))(*(void *)qword_268943110 + 32))(qword_268943110);
    qword_268943110 = (uint64_t)v11;
    int v11 = v10;
    goto LABEL_18;
  }
  if (v6 == a2)
  {
    int v11 = v10;
    (*(void (**)(void *, uint8_t *))(*a2 + 24))(a2, v10);
    std::string v7 = v11;
  }
  else
  {
    std::string v7 = (uint8_t *)(*(uint64_t (**)(void *))(*v6 + 16))(v6);
    int v11 = v7;
  }
  uint64_t v8 = qword_268943110;
  if (v7 != v10)
  {
    if ((uint64_t *)qword_268943110 != &qword_2689430F8) {
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  if ((uint64_t *)qword_268943110 == &qword_2689430F8)
  {
    (*(void (**)(uint8_t *, void *))(*(void *)v10 + 24))(v10, v12);
    (*(void (**)(uint8_t *))(*(void *)v11 + 32))(v11);
    int v11 = 0;
    (*(void (**)(uint64_t, uint8_t *))(*(void *)qword_268943110 + 24))(qword_268943110, v10);
    (*(void (**)(uint64_t))(*(void *)qword_268943110 + 32))(qword_268943110);
    qword_268943110 = 0;
    int v11 = v10;
    (*(void (**)(void *, uint64_t *))(v12[0] + 24))(v12, &qword_2689430F8);
    (*(void (**)(void *))(v12[0] + 32))(v12);
  }
  else
  {
    (*(void (**)(uint8_t *, uint64_t *))(*(void *)v10 + 24))(v10, &qword_2689430F8);
    (*(void (**)(uint8_t *))(*(void *)v11 + 32))(v11);
    int v11 = (uint8_t *)qword_268943110;
  }
  qword_268943110 = (uint64_t)&qword_2689430F8;
LABEL_18:
  std::__function::__value_func<void ()(std::string)>::~__value_func[abi:ne180100](v10);
  return a1;
}

void sub_237B13FA4(_Unwind_Exception *a1)
{
  std::__function::__value_func<void ()(GnssHal::TimeTransferPulseMark)>::~__value_func[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

void GnssHal::CommPcie::~CommPcie(GnssHal::CommPcie *this)
{
  *(void *)this = &unk_26EAA8340;
  GnssHal::CommPcie::close(this);
  std::__function::__value_func<void ()(std::string)>::operator=[abi:ne180100]();
  if (*((unsigned char *)this + 96))
  {
    unint64_t v2 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int buf = 0;
      _os_log_impl(&dword_237AFF000, v2, OS_LOG_TYPE_INFO, "#pcie,freeInternal", buf, 2u);
    }
    int v3 = TelephonyUtilTransportFree();
    uint64_t v4 = GpsdLogObjectGeneral;
    if (v3)
    {
      if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v6 = 0;
        _os_log_impl(&dword_237AFF000, v4, OS_LOG_TYPE_DEFAULT, "#pcie,freeInternal,success", v6, 2u);
      }
    }
    else if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_error_impl(&dword_237AFF000, v4, OS_LOG_TYPE_ERROR, "#pcie,freeInternal,failure", v5, 2u);
    }
    *((unsigned char *)this + 96) = 0;
  }
  std::__function::__value_func<void ()(GnssHal::TimeTransferPulseMark)>::~__value_func[abi:ne180100]((void *)this + 13);
}

{
  uint64_t vars8;

  GnssHal::CommPcie::~CommPcie(this);
  JUMPOUT(0x237E29950);
}

uint64_t GnssHal::CommPcie::setReadCallback(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  std::function<void ()(unsigned char *,unsigned long)>::operator=(_MergedGlobals_0, a2);
  int v3 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v4 = *(void *)(a2 + 24) != 0;
    v6[0] = 67240192;
    v6[1] = v4;
    _os_log_impl(&dword_237AFF000, v3, OS_LOG_TYPE_DEFAULT, "#pcie,setReadCallback,%{public}d", (uint8_t *)v6, 8u);
  }
  return 1;
}

uint64_t GnssHal::CommPcie::open(GnssHal::CommPcie *this)
{
  return GnssHal::CommPcie::openInternal(this, 30);
}

uint64_t GnssHal::CommPcie::openInternal(GnssHal::CommPcie *this, int a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  unint64_t v2 = GpsdLogObjectGeneral;
  if (*((unsigned char *)this + 96))
  {
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int buf = 0;
      _os_log_impl(&dword_237AFF000, v2, OS_LOG_TYPE_DEFAULT, "#pcie,open,already open", buf, 2u);
    }
    return 1;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)int buf = 67240192;
      int v12 = a2;
      _os_log_impl(&dword_237AFF000, v2, OS_LOG_TYPE_INFO, "#pcie,open,creating,timeout,%{public}d", buf, 8u);
    }
    TelephonyBasebandPCITransportInitParameters();
    *(_DWORD *)int buf = 14;
    int v14 = 1000 * a2;
    v15 |= 5u;
    uint64_t v16 = 0x100000000004;
    int v19 = 25;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = ___ZN7GnssHal8CommPcie12openInternalEi_block_invoke;
    v10[3] = &__block_descriptor_40_e16_v28__0i8_v12_v20l;
    void v10[4] = this;
    int v13 = v10;
    int v17 = &__block_literal_global;
    uint64_t v18 = &__block_literal_global_8;
    uint64_t v3 = TelephonyBasebandPCITransportCreate();
    uint64_t v6 = GpsdLogObjectGeneral;
    if (v3)
    {
      if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)std::string v9 = 0;
        _os_log_impl(&dword_237AFF000, v6, OS_LOG_TYPE_DEFAULT, "#pcie,open,success", v9, 2u);
      }
      char v7 = 1;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)std::string v9 = 0;
        _os_log_error_impl(&dword_237AFF000, v6, OS_LOG_TYPE_ERROR, "#pcie,open,failure", v9, 2u);
      }
      char v7 = 0;
    }
    *((unsigned char *)this + 96) = v7;
  }
  return v3;
}

void ___ZN7GnssHal8CommPcie12openInternalEi_block_invoke(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v6 = *(void *)(a1 + 32);
  memset(&v15, 0, sizeof(v15));
  if (a2)
  {
    if (a2 == 1)
    {
      uint64_t v8 = GpsdLogObjectGeneral;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)int buf = 134283777;
        *(void *)int v17 = a3;
        *(_WORD *)&v17[8] = 2049;
        *(void *)&v17[10] = a4;
        _os_log_error_impl(&dword_237AFF000, v8, OS_LOG_TYPE_ERROR, "#pcie,statusBlock,PCITransportStatusError,%{private}p,%{private}p", buf, 0x16u);
      }
      std::string v9 = "#pcie_TransportStatusError";
    }
    else
    {
      int v11 = GpsdLogObjectGeneral;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)int buf = 67240705;
        *(_DWORD *)int v17 = a2;
        *(_WORD *)&v17[4] = 2049;
        *(void *)&v17[6] = a3;
        *(_WORD *)&v17[14] = 2049;
        *(void *)&v17[16] = a4;
        _os_log_error_impl(&dword_237AFF000, v11, OS_LOG_TYPE_ERROR, "#pcie,statusBlock,Unrecognized status 0x%{public}08x,%{private}p,%{private}p", buf, 0x1Cu);
      }
      std::string v9 = "#pcie_UnknownStatus";
    }
  }
  else
  {
    char v10 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 134283777;
      *(void *)int v17 = a3;
      *(_WORD *)&v17[8] = 2049;
      *(void *)&v17[10] = a4;
      _os_log_error_impl(&dword_237AFF000, v10, OS_LOG_TYPE_ERROR, "#pcie,statusBlock,PCITransportStatusNotReady,%{private}p,%{private}p", buf, 0x16u);
    }
    std::string v9 = "#pcie_TransportStatusNotReady";
  }
  MEMORY[0x237E295A0](&v15, v9);
  (*(void (**)(uint64_t))(*(void *)v6 + 24))(v6);
  if (!qword_268943110) {
    exit(-1);
  }
  int v12 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = &v15;
    if ((v15.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      int v13 = (std::string *)v15.__r_.__value_.__r.__words[0];
    }
    *(_DWORD *)int buf = 136446210;
    *(void *)int v17 = v13;
    _os_log_impl(&dword_237AFF000, v12, OS_LOG_TYPE_DEFAULT, "#pcie,invoking exit callback,%{public}s", buf, 0xCu);
  }
  if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&__p, v15.__r_.__value_.__l.__data_, v15.__r_.__value_.__l.__size_);
  }
  else {
    std::string __p = v15;
  }
  if (!qword_268943110) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  (*(void (**)(uint64_t, std::string *))(*(void *)qword_268943110 + 48))(qword_268943110, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  std::__function::__value_func<void ()(std::string)>::operator=[abi:ne180100]();
  if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v15.__r_.__value_.__l.__data_);
  }
}

void sub_237B1472C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a20 < 0) {
    operator delete(a15);
  }
  _Unwind_Resume(exception_object);
}

void ___ZN7GnssHal8CommPcie12openInternalEi_block_invoke_5(uint64_t a1, int a2, void *a3, unsigned int a4)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v7 = qword_2689430F0;
  if (!a2 && a4 && qword_2689430F0)
  {
    std::function<void ()(unsigned char *,unsigned long)>::operator()((uint64_t)_MergedGlobals_0, (uint64_t)a3, a4);
  }
  else
  {
    uint64_t v8 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 67241216;
      v9[1] = a2;
      __int16 v10 = 1026;
      BOOL v11 = a2 == -536870165;
      __int16 v12 = 1026;
      BOOL v13 = a2 == -536870168;
      __int16 v14 = 1026;
      unsigned int v15 = a4;
      __int16 v16 = 1026;
      BOOL v17 = v7 != 0;
      _os_log_impl(&dword_237AFF000, v8, OS_LOG_TYPE_DEFAULT, "#pcie,async read failure,0x%{public}08x,is_aborted,%{public}d,is_overrun,%{public}d,sz,%{public}u,callback,%{public}d", (uint8_t *)v9, 0x20u);
    }
    free(a3);
  }
}

void ___ZN7GnssHal8CommPcie12openInternalEi_block_invoke_2(uint64_t a1, int a2, uint64_t a3, int a4)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (a2)
  {
    uint64_t v6 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 67240448;
      int v11 = a2;
      __int16 v12 = 1026;
      int v13 = a4;
      _os_log_error_impl(&dword_237AFF000, v6, OS_LOG_TYPE_ERROR, "#pcie,write error,0x%{public}08x,sz,%{public}u", buf, 0xEu);
    }
    if (!qword_268943110) {
      exit(-2);
    }
    uint64_t v7 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int buf = 0;
      _os_log_impl(&dword_237AFF000, v7, OS_LOG_TYPE_DEFAULT, "#pcie,invoking exit callback,#pcie_writeError", buf, 2u);
    }
    std::string::basic_string[abi:ne180100]<0>(__p, "#pcie_writeError");
    if (!qword_268943110) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    (*(void (**)(uint64_t, void **))(*(void *)qword_268943110 + 48))(qword_268943110, __p);
    if (v9 < 0) {
      operator delete(__p[0]);
    }
    std::__function::__value_func<void ()(std::string)>::operator=[abi:ne180100]();
  }
}

void sub_237B14A44(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t *GnssHal::CommPcie::close(GnssHal::CommPcie *this)
{
  uint64_t v1 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_error_impl(&dword_237AFF000, v1, OS_LOG_TYPE_ERROR, "#pcie,ignoring close", v3, 2u);
  }
  uint64_t result = (uint64_t *)qword_2689430F0;
  qword_2689430F0 = 0;
  if (result == &_MergedGlobals_0) {
    return (uint64_t *)(*(uint64_t (**)(uint64_t *))(_MergedGlobals_0 + 32))(&_MergedGlobals_0);
  }
  if (result) {
    return (uint64_t *)(*(uint64_t (**)(uint64_t *))(*result + 40))(result);
  }
  return result;
}

uint64_t GnssHal::CommPcie::openWithRetries(GnssHal::CommPcie *this, int a2)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  unint64_t MachContinuousTimeNs = (gpsd::util *)gpsd::util::getMachContinuousTimeNs(this);
  double v5 = (double)(unint64_t)MachContinuousTimeNs * 0.000000001;
  double v6 = (double)a2;
  double v7 = (double)gpsd::util::getMachContinuousTimeNs(MachContinuousTimeNs) * 0.000000001;
  double v8 = v5 - v7 + (double)a2;
  int v9 = llround(v8);
  if (v9 >= 30) {
    int v10 = 30;
  }
  else {
    int v10 = v9;
  }
  if (v10 >= 1)
  {
    do
    {
      int v11 = GpsdLogObjectGeneral;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)int buf = 67240448;
        int v27 = v10;
        __int16 v28 = 2050;
        double v29 = v8;
        _os_log_impl(&dword_237AFF000, v11, OS_LOG_TYPE_INFO, "#pcie,thisOpen,start,thisTimeoutSec,%{public}d,timeLeftSec,%{public}.3f", buf, 0x12u);
      }
      __int16 v12 = (gpsd::util *)GnssHal::CommPcie::openInternal(this, v10);
      int v13 = (int)v12;
      double v14 = (double)gpsd::util::getMachContinuousTimeNs(v12) * 0.000000001;
      double v15 = v14 - v7;
      double v16 = v5 - v14 + v6;
      BOOL v17 = GpsdLogObjectGeneral;
      uint64_t v18 = (gpsd::util *)os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT);
      if (v18)
      {
        *(_DWORD *)int buf = 67240704;
        int v27 = v13;
        __int16 v28 = 2050;
        double v29 = v15;
        __int16 v30 = 2050;
        double v31 = v16;
        _os_log_impl(&dword_237AFF000, v17, OS_LOG_TYPE_DEFAULT, "#pcie,thisOpen,success,%{public}d,durationSec,%{public}.3f,timeLeftSec,%{public}.3f", buf, 0x1Cu);
      }
      if (v16 < 5.0) {
        char v19 = 1;
      }
      else {
        char v19 = v13;
      }
      if (v19) {
        break;
      }
      if (v15 < 5.0) {
        uint64_t v18 = (gpsd::util *)sleep(5u);
      }
      double v7 = (double)gpsd::util::getMachContinuousTimeNs(v18) * 0.000000001;
      double v8 = v5 - v7 + v6;
      int v20 = llround(v8);
      int v10 = v20 >= 30 ? 30 : v20;
    }
    while (v10 > 0);
  }
  uint64_t v21 = (*(uint64_t (**)(GnssHal::CommPcie *))(*(void *)this + 32))(this);
  int v22 = GpsdLogObjectGeneral;
  BOOL v23 = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT);
  if (v23)
  {
    unint64_t v24 = gpsd::util::getMachContinuousTimeNs((gpsd::util *)v23);
    *(_DWORD *)int buf = 67240448;
    int v27 = v21;
    __int16 v28 = 2050;
    double v29 = (double)v24 * 0.000000001 - v5;
    _os_log_impl(&dword_237AFF000, v22, OS_LOG_TYPE_DEFAULT, "#pcie,overallOpen,success,%{public}d,durationSeconds,%{public}.3f", buf, 0x12u);
  }
  return v21;
}

uint64_t GnssHal::CommPcie::waitForDataAvailable(GnssHal::CommPcie *this)
{
  return 0;
}

uint64_t GnssHal::CommPcie::readTimeout(GnssHal::CommPcie *this, unsigned __int8 *a2)
{
  return -1;
}

uint64_t GnssHal::CommPcie::readComplete(GnssHal::CommPcie *this, unsigned __int8 *a2)
{
  return 0;
}

uint64_t GnssHal::CommPcie::write(GnssHal::CommPcie *this, const unsigned __int8 *a2, uint64_t a3)
{
  int v10 = 0;
  double v5 = (uint64_t (*)(char *, const unsigned __int8 *, uint64_t, int *, uint64_t, uint64_t, void))*((void *)this + 1);
  uint64_t v3 = (char *)this + 8;
  BOOL v4 = v5;
  if (!v5 || (uint64_t v6 = a3, (v4(v3, a2, a3, &v10, 1, 1000, 0) & 1) == 0))
  {
    double v7 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int v9 = 0;
      _os_log_error_impl(&dword_237AFF000, v7, OS_LOG_TYPE_ERROR, "#pcie, TelephonyUtilTransportWrite failure", v9, 2u);
    }
    return -1;
  }
  return v6;
}

BOOL GnssHal::CommPcie::writeComplete(GnssHal::CommPcie *this, const unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v4 = (*(uint64_t (**)(GnssHal::CommPcie *, const unsigned __int8 *))(*(void *)this + 88))(this, a2);
  return v4 >= 0 && v4 == a3;
}

uint64_t GnssHal::CommPcie::enterLowPowerMode(GnssHal::CommPcie *this)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v1 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
  {
    int v3 = 136315138;
    uint64_t v4 = "enterLowPowerMode";
    _os_log_error_impl(&dword_237AFF000, v1, OS_LOG_TYPE_ERROR, "#pcie, %s, interface not available on PCIe platform", (uint8_t *)&v3, 0xCu);
  }
  return 0;
}

uint64_t GnssHal::CommPcie::exitLowPowerMode(GnssHal::CommPcie *this)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v1 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
  {
    int v3 = 136315138;
    uint64_t v4 = "exitLowPowerMode";
    _os_log_error_impl(&dword_237AFF000, v1, OS_LOG_TYPE_ERROR, "#pcie, %s, interface not available on PCIe platform", (uint8_t *)&v3, 0xCu);
  }
  return 1;
}

uint64_t GnssHal::CommPcie::readWriteFlush(GnssHal::CommPcie *this)
{
  uint64_t v1 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int v3 = 0;
    _os_log_impl(&dword_237AFF000, v1, OS_LOG_TYPE_INFO, "#pcie,readWriteFlush not available on PCIe", v3, 2u);
  }
  return 1;
}

uint64_t GnssHal::CommPcie::readFlush(GnssHal::CommPcie *this)
{
  uint64_t v1 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int v3 = 0;
    _os_log_impl(&dword_237AFF000, v1, OS_LOG_TYPE_INFO, "#pcie,readFlush not available on PCIe", v3, 2u);
  }
  return 1;
}

void GnssHal::CommPcie::pulseTimeMarkStrobe(GnssHal::CommPcie *this@<X0>, uint64_t a2@<X8>)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  *(unsigned char *)(a2 + 16) = 0;
  int v3 = *(_DWORD *)(GpsdPlatformInfo::instance(0) + 8);
  if (v3 == 107 || v3 == 202)
  {
    if (*((unsigned char *)this + 96))
    {
      v5[0] = 0;
      v5[1] = v5;
      _DWORD v5[2] = 0x3812000000;
      v5[3] = __Block_byref_object_copy_;
      v5[4] = __Block_byref_object_dispose_;
      void v5[5] = &unk_237B3C9D3;
      operator new();
    }
  }
  else
  {
    uint64_t v4 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      LOWORD(__lk.__m_) = 0;
      _os_log_error_impl(&dword_237AFF000, v4, OS_LOG_TYPE_ERROR, "#pcie,#tt,pulseTimemarkStrobe not supported", (uint8_t *)&__lk, 2u);
    }
  }
}

void sub_237B159E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,std::exception_ptr a28,std::mutex *a29,char a30)
{
  _Block_object_dispose(&a21, 8);
  std::promise<std::variant<PCITransportTimesyncMeasurement,PCITransportTimeEvent,BOOL>>::~promise(v30);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 48) = *(void *)(a2 + 48);
  *(void *)(a2 + 48) = 0;
  return result;
}

uint64_t *__Block_byref_object_dispose_(uint64_t a1)
{
  return std::promise<std::variant<PCITransportTimesyncMeasurement,PCITransportTimeEvent,BOOL>>::~promise((uint64_t *)(a1 + 48));
}

void ___ZN7GnssHal8CommPcie19pulseTimeMarkStrobeEv_block_invoke(uint64_t a1, int a2, uint64_t a3, long long *a4)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (a2 || !a4)
  {
    double v8 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v10) = 67240192;
      DWORD1(v10) = a2;
      _os_log_error_impl(&dword_237AFF000, v8, OS_LOG_TYPE_ERROR, "#pcie,#tt,completion failure,0x%{public}08x", (uint8_t *)&v10, 8u);
    }
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
    LOBYTE(v10) = 0;
    int v12 = 2;
    std::promise<std::variant<PCITransportTimesyncMeasurement,PCITransportTimeEvent,BOOL>>::set_value(*(void *)(v9 + 48), &v10);
  }
  else
  {
    GpsdPlatformInfo::instance(0);
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    long long v10 = *a4;
    uint64_t v11 = *((void *)a4 + 2);
    int v12 = 0;
    std::promise<std::variant<PCITransportTimesyncMeasurement,PCITransportTimeEvent,BOOL>>::set_value(*(void *)(v7 + 48), &v10);
  }
}

void std::promise<std::variant<PCITransportTimesyncMeasurement,PCITransportTimeEvent,BOOL>>::set_value(uint64_t a1, _OWORD *a2)
{
  if (!a1) {
    std::__throw_future_error[abi:ne180100](3u);
  }
  uint64_t v4 = (std::mutex *)(a1 + 24);
  std::mutex::lock((std::mutex *)(a1 + 24));
  if ((*(unsigned char *)(a1 + 136) & 1) != 0
    || (v7.__ptr_ = 0, uint64_t v5 = *(void *)(a1 + 16), std::exception_ptr::~exception_ptr(&v7), v5))
  {
    std::__throw_future_error[abi:ne180100](2u);
  }
  long long v6 = a2[1];
  *(_OWORD *)(a1 + 144) = *a2;
  *(_OWORD *)(a1 + 160) = v6;
  *(_DWORD *)(a1 + 136) |= 5u;
  std::condition_variable::notify_all((std::condition_variable *)(a1 + 88));
  std::mutex::unlock(v4);
}

void sub_237B15C88(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void ___ZN7GnssHal8CommPcie19pulseTimeMarkStrobeEv_block_invoke_11(uint64_t a1, _OWORD *a2)
{
  if (a2)
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
    *(_OWORD *)long long v6 = *a2;
    int v4 = 1;
  }
  else
  {
    uint64_t v5 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long v6 = 0;
      _os_log_error_impl(&dword_237AFF000, v5, OS_LOG_TYPE_ERROR, "#pcie,#tt-ptm,completion failure", v6, 2u);
    }
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
    v6[0] = 0;
    int v4 = 2;
  }
  int v7 = v4;
  std::promise<std::variant<PCITransportTimesyncMeasurement,PCITransportTimeEvent,BOOL>>::set_value(*(void *)(v3 + 48), v6);
}

uint64_t std::function<void ()(GnssHal::TimeTransferPulseMark)>::operator()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v5[0] = a2;
  v5[1] = a3;
  uint64_t v3 = *(void *)(a1 + 24);
  if (!v3) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  return (*(uint64_t (**)(uint64_t, void *))(*(void *)v3 + 48))(v3, v5);
}

uint64_t GnssHal::CommPcie::isOpen(GnssHal::CommPcie *this)
{
  return *((unsigned __int8 *)this + 96);
}

uint64_t GnssHal::CommPcie::getFileDescriptor(GnssHal::CommPcie *this)
{
  return 0xFFFFFFFFLL;
}

uint64_t GnssHal::CommPcie::isReadCallbackSupported(GnssHal::CommPcie *this)
{
  return 1;
}

double GnssHal::CommPcie::getTimeoutValueSeconds(GnssHal::CommPcie *this)
{
  return 0.0;
}

void GnssHal::CommPcie::getPortString(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
}

uint64_t std::__function::__value_func<void ()(GnssHal::TimeTransferPulseMark)>::__value_func[abi:ne180100](uint64_t a1, uint64_t a2)
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

uint64_t *std::__function::__value_func<void ()(std::string)>::operator=[abi:ne180100]()
{
  uint64_t result = (uint64_t *)qword_268943110;
  qword_268943110 = 0;
  if (result == &qword_2689430F8) {
    return (uint64_t *)(*(uint64_t (**)(uint64_t *))(qword_2689430F8 + 32))(&qword_2689430F8);
  }
  if (result) {
    return (uint64_t *)(*(uint64_t (**)(void))(*result + 40))();
  }
  return result;
}

void std::__assoc_state<std::variant<PCITransportTimesyncMeasurement,PCITransportTimeEvent,BOOL>>::~__assoc_state(uint64_t a1)
{
  *(void *)a1 = MEMORY[0x263F8C320] + 16;
  unint64_t v2 = (std::exception_ptr *)(a1 + 16);
  std::condition_variable::~condition_variable((std::condition_variable *)(a1 + 88));
  std::mutex::~mutex((std::mutex *)(a1 + 24));
  std::exception_ptr::~exception_ptr(v2);
  std::__shared_count::~__shared_count((std::__shared_count *)a1);
}

{
  std::exception_ptr *v2;
  uint64_t vars8;

  *(void *)a1 = MEMORY[0x263F8C320] + 16;
  unint64_t v2 = (std::exception_ptr *)(a1 + 16);
  std::condition_variable::~condition_variable((std::condition_variable *)(a1 + 88));
  std::mutex::~mutex((std::mutex *)(a1 + 24));
  std::exception_ptr::~exception_ptr(v2);
  std::__shared_count::~__shared_count((std::__shared_count *)a1);
  JUMPOUT(0x237E29950);
}

uint64_t std::__assoc_state<std::variant<PCITransportTimesyncMeasurement,PCITransportTimeEvent,BOOL>>::__on_zero_shared(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 8))();
}

uint64_t *std::promise<std::variant<PCITransportTimesyncMeasurement,PCITransportTimeEvent,BOOL>>::~promise(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if (v2)
  {
    if ((*(unsigned char *)(v2 + 136) & 1) == 0)
    {
      v10.__ptr_ = 0;
      uint64_t v3 = *(void *)(v2 + 16);
      std::exception_ptr::~exception_ptr(&v10);
      uint64_t v2 = *a1;
      if (!v3 && *(uint64_t *)(v2 + 8) >= 1)
      {
        uint64_t v5 = std::future_category();
        MEMORY[0x237E29640](&v8, 4, v5);
        exception = (std::logic_error *)__cxa_allocate_exception(0x20uLL);
        int v7 = std::logic_error::logic_error(exception, &v8);
        v7->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C2E0] + 16);
        v7[1] = v9;
        __cxa_throw(v7, MEMORY[0x263F8C1A0], MEMORY[0x263F8C0C0]);
      }
    }
    if (!atomic_fetch_add((atomic_ullong *volatile)(v2 + 8), 0xFFFFFFFFFFFFFFFFLL)) {
      (*(void (**)(uint64_t))(*(void *)v2 + 16))(v2);
    }
  }
  return a1;
}

void sub_237B160DC(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__assoc_sub_state *a10, char a11)
{
  __cxa_begin_catch(a1);
  std::current_exception();
  __cxa_end_catch();
  v12.__ptr_ = (void *)(v11 - 32);
  std::__assoc_sub_state::set_exception(a10, v12);
  std::exception_ptr::~exception_ptr((std::exception_ptr *)(v11 - 32));
  MEMORY[0x237E29650](&a11);
  JUMPOUT(0x237B16028);
}

void std::__throw_future_error[abi:ne180100](unsigned int a1)
{
  exception = __cxa_allocate_exception(0x20uLL);
  uint64_t v3 = std::future_category();
  MEMORY[0x237E29640](exception, a1, v3);
  __cxa_throw(exception, MEMORY[0x263F8C1A0], MEMORY[0x263F8C0C0]);
}

void sub_237B1616C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t _GLOBAL__sub_I_GnssHalCommPcie_mm()
{
  qword_2689430F0 = 0;
  __cxa_atexit((void (*)(void *))std::function<void ()(unsigned char *,unsigned long)>::~function, _MergedGlobals_0, &dword_237AFF000);
  qword_268943110 = 0;
  return __cxa_atexit((void (*)(void *))std::function<void ()(std::string)>::~function, &qword_2689430F8, &dword_237AFF000);
}

uint64_t GnssHal::PlatformLog::PlatformLog(uint64_t result, uint64_t a2, int a3, int a4, uint64_t a5)
{
  *(void *)uint64_t result = &unk_26EAA8490;
  *(_DWORD *)(result + 8) = a3;
  *(_DWORD *)(result + 12) = a4;
  *(void *)(result + 16) = a5;
  *(void *)(result + 24) = a2;
  *(unsigned char *)(result + 32) = 0;
  return result;
}

{
  *(void *)uint64_t result = &unk_26EAA8490;
  *(_DWORD *)(result + 8) = a3;
  *(_DWORD *)(result + 12) = a4;
  *(void *)(result + 16) = a5;
  *(void *)(result + 24) = a2;
  *(unsigned char *)(result + 32) = 0;
  return result;
}

uint64_t GnssHal::PlatformLog::getPrimaryPathLogLevel(GnssHal::PlatformLog *this)
{
  return *((unsigned int *)this + 2);
}

uint64_t GnssHal::PlatformLog::getSecondaryPathLogLevel(GnssHal::PlatformLog *this)
{
  return *((unsigned int *)this + 3);
}

uint64_t GnssHal::PlatformLog::getLogMask(GnssHal::PlatformLog *this)
{
  return *((void *)this + 2);
}

void GnssHal::PlatformLog::logSystemException(uint64_t a1, uint64_t *a2, void *a3)
{
  v108[20] = *MEMORY[0x263EF8340];
  int v6 = *((char *)a2 + 23);
  if (v6 >= 0) {
    int v7 = a2;
  }
  else {
    int v7 = (void *)*a2;
  }
  if (v6 >= 0) {
    unint64_t v8 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    unint64_t v8 = a2[1];
  }
  if (v8 > 0x20)
  {
    if (v8 <= 0x40)
    {
      std::exception_ptr v12 = (char *)v7 + v8;
      uint64_t v13 = *(void *)((char *)v7 + v8 - 16);
      uint64_t v14 = *(void *)((char *)v7 + v8 - 8);
      uint64_t v15 = *v7 - 0x3C5A37A36834CED9 * (v13 + v8);
      uint64_t v17 = v7[2];
      uint64_t v16 = v7[3];
      uint64_t v18 = __ROR8__(v15 + v16, 52);
      uint64_t v19 = __ROR8__(v15, 37);
      uint64_t v20 = v15 + v7[1];
      uint64_t v21 = __ROR8__(v20, 7);
      uint64_t v22 = v20 + v17;
      uint64_t v23 = v21 + v19;
      uint64_t v24 = *((void *)v12 - 4) + v17;
      uint64_t v25 = v14 + v16;
      uint64_t v26 = __ROR8__(v25 + v24, 52);
      uint64_t v27 = v23 + v18;
      uint64_t v28 = __ROR8__(v24, 37);
      uint64_t v29 = *((void *)v12 - 3) + v24;
      uint64_t v30 = __ROR8__(v29, 7);
      uint64_t v31 = v27 + __ROR8__(v22, 31);
      uint64_t v32 = v29 + v13;
      uint64_t v33 = v32 + v25;
      uint64_t v34 = v22 + v16 + v28 + v30 + v26 + __ROR8__(v32, 31);
      unint64_t v35 = 0x9AE16A3B2F90404FLL;
      unint64_t v36 = v31
          - 0x3C5A37A36834CED9
          * ((0xC3A5C85C97CB3127 * (v33 + v31) - 0x651E95C4D06FBFB1 * v34) ^ ((0xC3A5C85C97CB3127 * (v33 + v31)
                                                                                 - 0x651E95C4D06FBFB1 * v34) >> 47));
LABEL_15:
      unint64_t v11 = (v36 ^ (v36 >> 47)) * v35;
      goto LABEL_19;
    }
    uint64_t v44 = *(void *)((char *)v7 + v8 - 48);
    uint64_t v43 = *(void *)((char *)v7 + v8 - 40);
    uint64_t v45 = *(void *)((char *)v7 + v8 - 24);
    uint64_t v46 = *(void *)((char *)v7 + v8 - 56);
    uint64_t v47 = *(void *)((char *)v7 + v8 - 16);
    uint64_t v48 = *(void *)((char *)v7 + v8 - 8);
    unint64_t v49 = v46 + v47;
    unint64_t v50 = 0x9DDFEA08EB382D69
        * (v45 ^ ((0x9DDFEA08EB382D69 * (v45 ^ (v44 + v8))) >> 47) ^ (0x9DDFEA08EB382D69 * (v45 ^ (v44 + v8))));
    unint64_t v51 = 0x9DDFEA08EB382D69 * (v50 ^ (v50 >> 47));
    unint64_t v52 = *(void *)((char *)v7 + v8 - 64) + v8;
    unint64_t v53 = v44 + v46 + v52;
    uint64_t v54 = v53 + v43;
    uint64_t v55 = __ROR8__(v53, 44) + v52 + __ROR8__(v52 + v43 + v51, 21);
    uint64_t v56 = v46 + v47 + *(void *)((char *)v7 + v8 - 32) - 0x4B6D499041670D8DLL;
    uint64_t v57 = v45 + v47 + v56;
    uint64_t v58 = v57 + v48;
    uint64_t v59 = __ROR8__(v57, 44) + v56 + __ROR8__(v56 + v43 + v48, 21);
    int v60 = v7 + 4;
    uint64_t v61 = *v7 - 0x4B6D499041670D8DLL * v43;
    uint64_t v62 = -(uint64_t)((v8 - 1) & 0xFFFFFFFFFFFFFFC0);
    do
    {
      uint64_t v63 = *(v60 - 3);
      uint64_t v64 = v61 + v54 + v49 + v63;
      uint64_t v65 = v60[2];
      uint64_t v66 = v60[3];
      uint64_t v67 = v60[1];
      unint64_t v49 = v67 + v54 - 0x4B6D499041670D8DLL * __ROR8__(v49 + v55 + v65, 42);
      uint64_t v68 = v51 + v58;
      uint64_t v69 = *(v60 - 2);
      uint64_t v70 = *(v60 - 1);
      uint64_t v71 = *(v60 - 4) - 0x4B6D499041670D8DLL * v55;
      uint64_t v72 = v71 + v58 + v70;
      uint64_t v73 = v71 + v63 + v69;
      uint64_t v54 = v73 + v70;
      uint64_t v74 = __ROR8__(v73, 44) + v71;
      unint64_t v75 = (0xB492B66FBE98F273 * __ROR8__(v64, 37)) ^ v59;
      uint64_t v61 = 0xB492B66FBE98F273 * __ROR8__(v68, 33);
      uint64_t v55 = v74 + __ROR8__(v72 + v75, 21);
      uint64_t v76 = v61 + v59 + *v60;
      uint64_t v58 = v67 + v65 + v76 + v66;
      uint64_t v59 = __ROR8__(v67 + v65 + v76, 44) + v76 + __ROR8__(v49 + v69 + v76 + v66, 21);
      v60 += 8;
      unint64_t v51 = v75;
      v62 += 64;
    }
    while (v62);
    unint64_t v77 = 0x9DDFEA08EB382D69
        * (v58 ^ ((0x9DDFEA08EB382D69 * (v58 ^ v54)) >> 47) ^ (0x9DDFEA08EB382D69 * (v58 ^ v54)));
    uint64_t v78 = v75 - 0x4B6D499041670D8DLL * (v49 ^ (v49 >> 47)) - 0x622015F714C7D297 * (v77 ^ (v77 >> 47));
    unint64_t v79 = v61
        - 0x622015F714C7D297
        * ((0x9DDFEA08EB382D69
          * (v59 ^ ((0x9DDFEA08EB382D69 * (v59 ^ v55)) >> 47) ^ (0x9DDFEA08EB382D69 * (v59 ^ v55)))) ^ ((0x9DDFEA08EB382D69 * (v59 ^ ((0x9DDFEA08EB382D69 * (v59 ^ v55)) >> 47) ^ (0x9DDFEA08EB382D69 * (v59 ^ v55)))) >> 47));
    unint64_t v11 = 0x9DDFEA08EB382D69
        * ((0x9DDFEA08EB382D69
          * (v79 ^ ((0x9DDFEA08EB382D69 * (v79 ^ v78)) >> 47) ^ (0x9DDFEA08EB382D69 * (v79 ^ v78)))) ^ ((0x9DDFEA08EB382D69 * (v79 ^ ((0x9DDFEA08EB382D69 * (v79 ^ v78)) >> 47) ^ (0x9DDFEA08EB382D69 * (v79 ^ v78)))) >> 47));
  }
  else
  {
    if (v8 > 0x10)
    {
      uint64_t v37 = v7[1];
      unint64_t v38 = 0xB492B66FBE98F273 * *v7;
      uint64_t v39 = __ROR8__(0x9AE16A3B2F90404FLL * *(void *)((char *)v7 + v8 - 8), 30) + __ROR8__(v38 - v37, 43);
      unint64_t v40 = v38
          + v8
          + __ROR8__(v37 ^ 0xC949D7C7509E6557, 20)
          - 0x9AE16A3B2F90404FLL * *(void *)((char *)v7 + v8 - 8);
      uint64_t v41 = (v39 - 0x3C5A37A36834CED9 * *(void *)((char *)v7 + v8 - 16)) ^ v40;
      unint64_t v35 = 0x9DDFEA08EB382D69;
      unint64_t v42 = v40 ^ ((0x9DDFEA08EB382D69 * v41) >> 47) ^ (0x9DDFEA08EB382D69 * v41);
LABEL_14:
      unint64_t v36 = 0x9DDFEA08EB382D69 * v42;
      goto LABEL_15;
    }
    if (v8 >= 9)
    {
      uint64_t v9 = *(void *)((char *)v7 + v8 - 8);
      uint64_t v10 = __ROR8__(v9 + v8, v8);
      unint64_t v11 = (0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69
             * (v10 ^ ((0x9DDFEA08EB382D69 * (v10 ^ *v7)) >> 47) ^ (0x9DDFEA08EB382D69 * (v10 ^ *v7)))) ^ ((0x9DDFEA08EB382D69 * (v10 ^ ((0x9DDFEA08EB382D69 * (v10 ^ *v7)) >> 47) ^ (0x9DDFEA08EB382D69 * (v10 ^ *v7)))) >> 47))) ^ v9;
      goto LABEL_19;
    }
    if (v8 >= 4)
    {
      uint64_t v92 = *(unsigned int *)((char *)v7 + v8 - 4);
      unint64_t v93 = (v8 + (8 * *(_DWORD *)v7)) ^ v92;
      unint64_t v35 = 0x9DDFEA08EB382D69;
      unint64_t v42 = v92 ^ ((0x9DDFEA08EB382D69 * v93) >> 47) ^ (0x9DDFEA08EB382D69 * v93);
      goto LABEL_14;
    }
    unint64_t v11 = 0x9AE16A3B2F90404FLL;
    if (v8)
    {
      unint64_t v94 = v8 + 4 * *((unsigned __int8 *)v7 + v8 - 1);
      unint64_t v95 = 0x9AE16A3B2F90404FLL
          * (*(unsigned __int8 *)v7 | ((unint64_t)*((unsigned __int8 *)v7 + (v8 >> 1)) << 8));
      unint64_t v11 = 0x9AE16A3B2F90404FLL * ((0xC949D7C7509E6557 * v94) ^ v95 ^ (((0xC949D7C7509E6557 * v94) ^ v95) >> 47));
    }
  }
LABEL_19:
  if (*(unsigned char *)(a1 + 32))
  {
    v80 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      uint64_t v81 = a3[1] - *a3;
      LODWORD(buf.__r_.__value_.__l.__data_) = 136381187;
      *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v7;
      WORD2(buf.__r_.__value_.__r.__words[1]) = 2050;
      *(std::string::size_type *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = v11;
      HIWORD(buf.__r_.__value_.__r.__words[2]) = 2050;
      uint64_t v106 = v81;
      _os_log_error_impl(&dword_237AFF000, v80, OS_LOG_TYPE_ERROR, "logSystemException,%{private}s,%{public}zu,size,%{public}zu", (uint8_t *)&buf, 0x20u);
    }
  }
  else
  {
    v82 = (id *)GpsdPreferences::instance(0);
    GpsdPreferences::vendorLogDirectory(v82, &buf);
    v83 = std::string::append(&buf, "/gnss_hw_exception.bin");
    std::string __p = *v83;
    v83->__r_.__value_.__l.__size_ = 0;
    v83->__r_.__value_.__r.__words[2] = 0;
    v83->__r_.__value_.__r.__words[0] = 0;
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(buf.__r_.__value_.__l.__data_);
    }
    uint64_t v84 = MEMORY[0x263F8C310] + 64;
    v108[0] = MEMORY[0x263F8C310] + 64;
    v85 = (std::string::size_type *)MEMORY[0x263F8C2B0];
    std::string::size_type v86 = *(void *)(MEMORY[0x263F8C2B0] + 16);
    buf.__r_.__value_.__r.__words[0] = *(void *)(MEMORY[0x263F8C2B0] + 8);
    *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words
                              + *(void *)(buf.__r_.__value_.__r.__words[0] - 24)) = v86;
    v87 = (std::ios_base *)((char *)&buf + *(void *)(buf.__r_.__value_.__r.__words[0] - 24));
    std::ios_base::init(v87, &buf.__r_.__value_.__r.__words[1]);
    uint64_t v88 = MEMORY[0x263F8C310] + 24;
    v87[1].__vftable = 0;
    v87[1].__fmtflags_ = -1;
    buf.__r_.__value_.__r.__words[0] = v88;
    v108[0] = v84;
    MEMORY[0x237E29680](&buf.__r_.__value_.__r.__words[1]);
    if (!std::filebuf::open()) {
      std::ios_base::clear((std::ios_base *)((char *)&buf + *(void *)(buf.__r_.__value_.__r.__words[0] - 24)), *(_DWORD *)&v107[*(void *)(buf.__r_.__value_.__r.__words[0] - 24)] | 4);
    }
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&buf, (uint64_t)"logSystemException(", 19);
    v89 = (void *)std::ostream::operator<<();
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v89, (uint64_t)",", 1);
    v90 = (void *)std::ostream::operator<<();
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v90, (uint64_t)")\n", 2);
    std::ostream::write();
    if (!std::filebuf::close()) {
      std::ios_base::clear((std::ios_base *)((char *)&buf + *(void *)(buf.__r_.__value_.__r.__words[0] - 24)), *(_DWORD *)&v107[*(void *)(buf.__r_.__value_.__r.__words[0] - 24)] | 4);
    }
    v91 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_FAULT))
    {
      if (*((char *)a2 + 23) >= 0) {
        v96 = a2;
      }
      else {
        v96 = (uint64_t *)*a2;
      }
      uint64_t v97 = a3[1] - *a3;
      *(_DWORD *)v99 = 136381187;
      v100 = v96;
      __int16 v101 = 2050;
      unint64_t v102 = v11;
      __int16 v103 = 2050;
      uint64_t v104 = v97;
      _os_log_fault_impl(&dword_237AFF000, v91, OS_LOG_TYPE_FAULT, "logSystemException,%{private}s,%{public}zu,size,%{public}zu", v99, 0x20u);
    }
    *(unsigned char *)(a1 + 32) = 1;
    buf.__r_.__value_.__r.__words[0] = *v85;
    *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words
                              + *(void *)(buf.__r_.__value_.__r.__words[0] - 24)) = v85[3];
    MEMORY[0x237E29690](&buf.__r_.__value_.__r.__words[1]);
    std::ostream::~ostream();
    MEMORY[0x237E298C0](v108);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
}

void sub_237B16B24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  std::ostream::~ostream();
  MEMORY[0x237E298C0](v25);
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void *std::ofstream::~ofstream(void *a1)
{
  uint64_t v2 = MEMORY[0x263F8C2B0];
  uint64_t v3 = *MEMORY[0x263F8C2B0];
  *a1 = *MEMORY[0x263F8C2B0];
  *(void *)((char *)a1 + *(void *)(v3 - 24)) = *(void *)(v2 + 24);
  MEMORY[0x237E29690](a1 + 1);
  std::ostream::~ostream();
  MEMORY[0x237E298C0](a1 + 52);
  return a1;
}

void GnssHal::PlatformLog::flush(VendorLogger **this)
{
}

void GnssHal::PlatformLog::~PlatformLog(GnssHal::PlatformLog *this)
{
}

void GnssHal::PlatformLog::log(uint64_t a1, unsigned int a2, std::string::value_type *a3)
{
}

void GnssHal::PlatformLog::log(uint64_t a1, int a2, uint64_t a3)
{
}

void GnssHal::PlatformLog::log(uint64_t a1, int a2, const void *a3, size_t a4)
{
}

void *std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(void *a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x237E29710](v13, a1);
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
    if (!std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(v7, a2, v11, a2 + a3, v6, (char)v9)) {
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | 5);
    }
  }
  MEMORY[0x237E29720](v13);
  return a1;
}

void sub_237B16DE4(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  MEMORY[0x237E29720](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(void *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x237B16DC4);
}

void sub_237B16E38(_Unwind_Exception *a1)
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
      uint64_t v13 = v18 >= 0 ? __p : (void **)__p[0];
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

void sub_237B16FB8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
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

void *GnssHal::GpioEmbedded::GpioEmbedded(void *a1, uint64_t a2)
{
  *a1 = &unk_26EAA8518;
  a1[4] = 0;
  std::__function::__value_func<void ()(GnssHal::TimeTransferPulseMark)>::__value_func[abi:ne180100]((uint64_t)(a1 + 5), a2);
  uint64_t v3 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)std::string buf = 0;
    _os_log_impl(&dword_237AFF000, v3, OS_LOG_TYPE_INFO, "#gpio,frontend,ctor,start", buf, 2u);
  }
  std::mutex::lock(&GnssHal::sMutex);
  uint64_t v5 = (void *)GnssHal::GpioEmbedded::GpioBackend::instance(v4);
  GnssHal::GpioEmbedded::GpioBackend::setFrontend(v5, (uint64_t)a1);
  uint64_t v6 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)size_t v8 = 0;
    _os_log_impl(&dword_237AFF000, v6, OS_LOG_TYPE_INFO, "#gpio,frontend,ctor,end", v8, 2u);
  }
  std::mutex::unlock(&GnssHal::sMutex);
  return a1;
}

void sub_237B17190(_Unwind_Exception *a1)
{
  std::mutex::unlock(&GnssHal::sMutex);
  std::__function::__value_func<void ()(GnssHal::TimeTransferPulseMark)>::~__value_func[abi:ne180100](v2);
  std::__function::__value_func<void ()(GnssHal::GpioNotification)>::~__value_func[abi:ne180100]((void *)(v1 + 8));
  _Unwind_Resume(a1);
}

uint64_t GnssHal::GpioEmbedded::GpioBackend::instance(GnssHal::GpioEmbedded::GpioBackend *this)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (GnssHal::GpioEmbedded::GpioBackend::instance(void)::pred != -1) {
    dispatch_once(&GnssHal::GpioEmbedded::GpioBackend::instance(void)::pred, &__block_literal_global_0);
  }
  uint64_t result = GnssHal::GpioEmbedded::GpioBackend::fInstance;
  if (!GnssHal::GpioEmbedded::GpioBackend::fInstance)
  {
    uint64_t v2 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)std::string buf = 0;
      _os_log_error_impl(&dword_237AFF000, v2, OS_LOG_TYPE_ERROR, "null GpioBackend", buf, 2u);
      uint64_t v2 = GpsdLogObjectGeneral;
    }
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)std::string buf = 136446722;
      size_t v7 = "/Library/Caches/com.apple.xbs/Sources/CoreGPS/Sources/HAL/Implementation/GnssHalGpioImpl.mm";
      __int16 v8 = 1026;
      int v9 = 299;
      __int16 v10 = 2082;
      uint64_t v11 = "instance";
      _os_log_error_impl(&dword_237AFF000, v2, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: assertion failure in %{public}s", buf, 0x1Cu);
    }
    std::string::basic_string[abi:ne180100]<0>(&v5, "assert");
    std::string::basic_string[abi:ne180100]<0>(&v4, "instance");
    std::string::basic_string[abi:ne180100]<0>(&v3, "null GpioBackend");
    gpsd::util::triggerDiagnosticReport((uint64_t)&v5, (uint64_t)&v4, (uint64_t)&v3);
    std::string::~string(&v3);
    std::string::~string(&v4);
    std::string::~string(&v5);
    __assert_rtn("instance", "GnssHalGpioImpl.mm", 299, "false && \"null GpioBackend\"");
  }
  return result;
}

void sub_237B17380(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (a27 < 0) {
    operator delete(a22);
  }
  _Unwind_Resume(exception_object);
}

void GnssHal::GpioEmbedded::GpioBackend::setFrontend(void *a1, uint64_t a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  *a1 = a2;
  std::string v3 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
  {
    v4[0] = 67240192;
    v4[1] = a2 == 0;
    _os_log_impl(&dword_237AFF000, v3, OS_LOG_TYPE_INFO, "#gpio,set frontend,isNull,%{public}d", (uint8_t *)v4, 8u);
  }
}

void GnssHal::GpioEmbedded::~GpioEmbedded(GnssHal::GpioEmbedded *this)
{
  *(void *)this = &unk_26EAA8518;
  uint64_t v2 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)std::string buf = 0;
    _os_log_impl(&dword_237AFF000, v2, OS_LOG_TYPE_INFO, "#gpio,frontend,dtor,start", buf, 2u);
  }
  std::mutex::lock(&GnssHal::sMutex);
  std::string v4 = (void *)GnssHal::GpioEmbedded::GpioBackend::instance(v3);
  GnssHal::GpioEmbedded::GpioBackend::setFrontend(v4, 0);
  uint64_t v5 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_237AFF000, v5, OS_LOG_TYPE_INFO, "#gpio,frontend,dtor,end", v6, 2u);
  }
  std::mutex::unlock(&GnssHal::sMutex);
  std::__function::__value_func<void ()(GnssHal::TimeTransferPulseMark)>::~__value_func[abi:ne180100]((void *)this + 5);
  std::__function::__value_func<void ()(GnssHal::GpioNotification)>::~__value_func[abi:ne180100]((void *)this + 1);
}

{
  uint64_t vars8;

  GnssHal::GpioEmbedded::~GpioEmbedded(this);
  JUMPOUT(0x237E29950);
}

void GnssHal::GpioEmbedded::setResetLow(GnssHal::GpioEmbedded *this)
{
  int v1 = *(_DWORD *)(GpsdPlatformInfo::instance(0) + 8);
  if (v1 == 103 || v1 == 201 || v1 == 106)
  {
    uint64_t v2 = GpsdLogObjectGeneral;
    BOOL v3 = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      *(_WORD *)std::string buf = 0;
      _os_log_impl(&dword_237AFF000, v2, OS_LOG_TYPE_DEFAULT, "#gpio,setResetLow", buf, 2u);
    }
    uint64_t v4 = GnssHal::GpioEmbedded::GpioBackend::instance((GnssHal::GpioEmbedded::GpioBackend *)v3);
    GnssHal::GpioEmbedded::GpioBackend::setGpioState(v4, 1u, 0);
  }
  else
  {
    uint64_t v5 = GpsdLogObjectWarning;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectWarning, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_237AFF000, v5, OS_LOG_TYPE_DEFAULT, "#gpio,not supported on platform", v6, 2u);
    }
  }
}

void GnssHal::GpioEmbedded::GpioBackend::setGpioState(uint64_t a1, uint32_t a2, uint64_t a3)
{
  int v3 = a3;
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t input = a3;
  std::mutex::lock(&GnssHal::sMutex);
  if (*(unsigned char *)(a1 + 8))
  {
    IOConnectCallScalarMethod(*(_DWORD *)(a1 + 12), a2, &input, 1u, 0, 0);
  }
  else
  {
    uint64_t v6 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)std::string buf = 67240448;
      uint32_t v9 = a2;
      __int16 v10 = 1026;
      int v11 = v3;
      _os_log_error_impl(&dword_237AFF000, v6, OS_LOG_TYPE_ERROR, "#gpio,setGpioState failed,selector,%{public}d,input,%{public}d", buf, 0xEu);
    }
  }
  std::mutex::unlock(&GnssHal::sMutex);
}

void sub_237B177B8(_Unwind_Exception *a1)
{
}

void GnssHal::GpioEmbedded::setResetHigh(GnssHal::GpioEmbedded *this)
{
  int v1 = *(_DWORD *)(GpsdPlatformInfo::instance(0) + 8);
  if (v1 == 103 || v1 == 201 || v1 == 106)
  {
    uint64_t v2 = GpsdLogObjectGeneral;
    BOOL v3 = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      *(_WORD *)std::string buf = 0;
      _os_log_impl(&dword_237AFF000, v2, OS_LOG_TYPE_DEFAULT, "#gpio,setResetHigh", buf, 2u);
    }
    uint64_t v4 = GnssHal::GpioEmbedded::GpioBackend::instance((GnssHal::GpioEmbedded::GpioBackend *)v3);
    GnssHal::GpioEmbedded::GpioBackend::setGpioState(v4, 1u, 1uLL);
  }
  else
  {
    uint64_t v5 = GpsdLogObjectWarning;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectWarning, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_237AFF000, v5, OS_LOG_TYPE_DEFAULT, "#gpio,not supported on platform", v6, 2u);
    }
  }
}

void GnssHal::GpioEmbedded::setDeviceWakeLow(GnssHal::GpioEmbedded *this)
{
  int v1 = *(_DWORD *)(GpsdPlatformInfo::instance(0) + 8);
  if (v1 == 106 || v1 == 103)
  {
    uint64_t v2 = GpsdLogObjectGeneral;
    BOOL v3 = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      *(_WORD *)std::string buf = 0;
      _os_log_impl(&dword_237AFF000, v2, OS_LOG_TYPE_DEFAULT, "#gpio,setDeviceWakeLow", buf, 2u);
    }
    uint64_t v4 = GnssHal::GpioEmbedded::GpioBackend::instance((GnssHal::GpioEmbedded::GpioBackend *)v3);
    GnssHal::GpioEmbedded::GpioBackend::setGpioState(v4, 3u, 1uLL);
  }
  else
  {
    uint64_t v5 = GpsdLogObjectWarning;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectWarning, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_237AFF000, v5, OS_LOG_TYPE_DEFAULT, "#gpio,not supported on platform", v6, 2u);
    }
  }
}

void GnssHal::GpioEmbedded::setDeviceWakeHigh(GnssHal::GpioEmbedded *this)
{
  int v1 = *(_DWORD *)(GpsdPlatformInfo::instance(0) + 8);
  if (v1 == 106 || v1 == 103)
  {
    uint64_t v2 = GpsdLogObjectGeneral;
    BOOL v3 = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      *(_WORD *)std::string buf = 0;
      _os_log_impl(&dword_237AFF000, v2, OS_LOG_TYPE_DEFAULT, "#gpio,setDeviceWakeHigh", buf, 2u);
    }
    uint64_t v4 = GnssHal::GpioEmbedded::GpioBackend::instance((GnssHal::GpioEmbedded::GpioBackend *)v3);
    GnssHal::GpioEmbedded::GpioBackend::setGpioState(v4, 3u, 0);
  }
  else
  {
    uint64_t v5 = GpsdLogObjectWarning;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectWarning, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_237AFF000, v5, OS_LOG_TYPE_DEFAULT, "#gpio,not supported on platform", v6, 2u);
    }
  }
}

void GnssHal::GpioEmbedded::pulseTimeMarkStrobe(GnssHal::GpioEmbedded *this@<X0>, uint64_t a2@<X8>)
{
  kern_return_t v8;
  BOOL CurrentMachContinuousMinusMachAbsoluteNanoseconds;
  unint64_t MachContinuousTimeNs;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  NSObject *v19;
  const char *v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  uint32_t outputCnt;
  uint64_t output;
  gpsd::util *v26;
  mach_port_t connection;
  void v28[3];
  void *v29;
  unsigned char buf[12];
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  unsigned char *v34;
  __int16 v35;
  unint64_t v36;
  __int16 v37;
  unint64_t v38;
  __int16 v39;
  unint64_t v40;
  void v41[4];

  v41[3] = *MEMORY[0x263EF8340];
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  *(unsigned char *)(a2 + 16) = 0;
  uint64_t v4 = (GnssHal::GpioEmbedded::GpioBackend *)GpsdPlatformInfo::instance(0);
  int v5 = *((_DWORD *)v4 + 2);
  if (v5 != 103 && v5 != 106 && v5 != 201)
  {
    uint64_t v19 = GpsdLogObjectGeneral;
    if (!os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR)) {
      return;
    }
    *(_WORD *)std::string buf = 0;
    uint64_t v20 = "#gpio,pulseTimeMarkStrobe not supported";
    goto LABEL_17;
  }
  connection = 0;
  uint64_t v6 = (GnssHal::GpioEmbedded::GpioBackend *)GnssHal::GpioEmbedded::GpioBackend::instance(v4);
  if (!GnssHal::GpioEmbedded::GpioBackend::controlConnect(v6, &connection))
  {
    uint64_t v19 = GpsdLogObjectGeneral;
    if (!os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR)) {
      return;
    }
    *(_WORD *)std::string buf = 0;
    uint64_t v20 = "#gpio,#tt,GPSControlConnect failed";
LABEL_17:
    _os_log_error_impl(&dword_237AFF000, v19, OS_LOG_TYPE_ERROR, v20, buf, 2u);
    return;
  }
  outputCnt = 2;
  __int16 v8 = IOConnectCallScalarMethod(connection, 5u, 0, 0, &output, &outputCnt);
  if (v8 || outputCnt != 2)
  {
    uint64_t v21 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)std::string buf = 67240192;
      *(_DWORD *)&uint8_t buf[4] = v8;
      _os_log_error_impl(&dword_237AFF000, v21, OS_LOG_TYPE_ERROR, "#gpio,#tt,TogglePIN,failed,Result,%{public}08x", buf, 8u);
    }
  }
  else
  {
    uint64_t v23 = 0;
    CurrentMachContinuousMinusMachAbsoluteNanoseconds = gpsd::util::getCurrentMachContinuousMinusMachAbsoluteNanoseconds((gpsd::util *)&v23, v7);
    if (CurrentMachContinuousMinusMachAbsoluteNanoseconds)
    {
      unint64_t MachContinuousTimeNs = gpsd::util::getMachContinuousTimeNs((gpsd::util *)CurrentMachContinuousMinusMachAbsoluteNanoseconds);
      *(unsigned char *)(a2 + 16) = 1;
      int v11 = gpsd::util::convertMachTimeInTicksToNs(output);
      uint64_t v12 = v23;
      uint64_t v13 = v23 + v11;
      *(void *)a2 = v23 + v11;
      uint64_t v14 = gpsd::util::convertMachTimeInTicksToNs((unint64_t)v26) + v12;
      *(void *)(a2 + 8) = v14;
      uint64_t v15 = GpsdLogObjectGeneral;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
      {
        uint64_t v16 = gpsd::util::convertMachTimeInTicksToNs(output);
        uint64_t v17 = gpsd::util::convertMachTimeInTicksToNs((unint64_t)v26);
        *(_DWORD *)std::string buf = 134350336;
        *(void *)&uint8_t buf[4] = v13;
        uint64_t v31 = 2050;
        uint64_t v32 = v14;
        uint64_t v33 = 2050;
        uint64_t v34 = (unsigned char *)(v14 - v13);
        unint64_t v35 = 2050;
        unint64_t v36 = MachContinuousTimeNs;
        uint64_t v37 = 2050;
        unint64_t v38 = v16;
        uint64_t v39 = 2050;
        unint64_t v40 = v17;
        _os_log_impl(&dword_237AFF000, v15, OS_LOG_TYPE_INFO, "#gpio,#tt,TogglePIN,beforeContNs,%{public}llu,afterContNs,%{public}llu,widthNs,%{public}llu,nowContNs,%{public}llu,beforeMachNs,%{public}llu,afterMachNs,%{public}llu", buf, 0x3Eu);
      }
      uint64_t v29 = 0;
      std::mutex::lock(&GnssHal::sMutex);
      std::__function::__value_func<void ()(GnssHal::TimeTransferPulseMark)>::__value_func[abi:ne180100]((uint64_t)buf, (uint64_t)this + 40);
      char v18 = v34;
      if (v34 == buf)
      {
        if (v29 == v28)
        {
          (*(void (**)(unsigned char *, void *))(*(void *)buf + 24))(buf, v41);
          (*(void (**)(unsigned char *))(*(void *)v34 + 32))(v34);
          uint64_t v34 = 0;
          (*(void (**)(void *, unsigned char *))(*v29 + 24))(v29, buf);
          (*(void (**)(void *))(*v29 + 32))(v29);
          uint64_t v29 = 0;
          uint64_t v34 = buf;
          (*(void (**)(void *, void *))(v41[0] + 24))(v41, v28);
          (*(void (**)(void *))(v41[0] + 32))(v41);
        }
        else
        {
          (*(void (**)(unsigned char *, void *))(*(void *)buf + 24))(buf, v28);
          (*(void (**)(unsigned char *))(*(void *)v34 + 32))(v34);
          uint64_t v34 = v29;
        }
        uint64_t v29 = v28;
      }
      else if (v29 == v28)
      {
        (*(void (**)(void *, unsigned char *))(v28[0] + 24))(v28, buf);
        (*(void (**)(void *))(*v29 + 32))(v29);
        uint64_t v29 = v34;
        uint64_t v34 = buf;
      }
      else
      {
        uint64_t v34 = v29;
        uint64_t v29 = v18;
      }
      std::__function::__value_func<void ()(GnssHal::TimeTransferPulseMark)>::~__value_func[abi:ne180100](buf);
      std::mutex::unlock(&GnssHal::sMutex);
      if (v29) {
        std::function<void ()(GnssHal::TimeTransferPulseMark)>::operator()((uint64_t)v28, output, (uint64_t)v26);
      }
      std::__function::__value_func<void ()(GnssHal::TimeTransferPulseMark)>::~__value_func[abi:ne180100](v28);
    }
    else
    {
      uint64_t v22 = GpsdLogObjectGeneral;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)std::string buf = 0;
        _os_log_error_impl(&dword_237AFF000, v22, OS_LOG_TYPE_ERROR, "#gpio,#tt,machCont timestamping failed", buf, 2u);
      }
    }
  }
  IOServiceClose(connection);
}

void sub_237B17FC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  std::__function::__value_func<void ()(GnssHal::TimeTransferPulseMark)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

BOOL GnssHal::GpioEmbedded::GpioBackend::controlConnect(GnssHal::GpioEmbedded::GpioBackend *this, unsigned int *a2)
{
  kern_return_t MatchingServices;
  kern_return_t v10;
  const char *v11;
  uint64_t v12;
  NSObject *v13;
  uint32_t v14;
  io_service_t v15;
  kern_return_t v16;
  kern_return_t v17;
  uint64_t v18;
  io_iterator_t existing;
  mach_port_t mainPort;
  uint8_t buf[4];
  const char *v22;
  uint64_t v23;

  uint64_t v23 = *MEMORY[0x263EF8340];
  mainPort = 0;
  int v4 = MEMORY[0x237E290A0](0, &mainPort);
  if (v4)
  {
    int v5 = v4;
    uint64_t v6 = GpsdLogObjectGeneral;
    BOOL result = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    *(_DWORD *)std::string buf = 67240192;
    LODWORD(v22) = v5;
    int v11 = "#gpio,IOMasterPort failed,%{public}d";
    goto LABEL_15;
  }
  CFDictionaryRef v8 = IOServiceMatching("AppleEmbeddedGPSControl");
  if (v8)
  {
    existing = 0;
    MatchingServices = IOServiceGetMatchingServices(mainPort, v8, &existing);
    if (MatchingServices)
    {
      __int16 v10 = MatchingServices;
      uint64_t v6 = GpsdLogObjectGeneral;
      BOOL result = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR);
      if (result)
      {
        *(_DWORD *)std::string buf = 67240192;
        LODWORD(v22) = v10;
        int v11 = "#gpio,IOServiceGetMatchingServices failed,%{public}d";
LABEL_15:
        uint64_t v13 = v6;
        uint64_t v14 = 8;
        goto LABEL_16;
      }
    }
    else
    {
      *((_DWORD *)this + 4) = IOIteratorNext(existing);
      IOObjectRelease(existing);
      uint64_t v15 = *((_DWORD *)this + 4);
      if (v15)
      {
        uint64_t v16 = IOServiceOpen(v15, *MEMORY[0x263EF8960], 0, a2);
        if (!v16) {
          return 1;
        }
        uint64_t v17 = v16;
        uint64_t v6 = GpsdLogObjectGeneral;
        BOOL result = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR);
        if (result)
        {
          *(_DWORD *)std::string buf = 67240192;
          LODWORD(v22) = v17;
          int v11 = "#gpio,IOServiceOpen failed,%{public}d";
          goto LABEL_15;
        }
      }
      else
      {
        char v18 = GpsdLogObjectGeneral;
        BOOL result = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR);
        if (result)
        {
          *(_WORD *)std::string buf = 0;
          int v11 = "#gpio,No fServiceObject";
          uint64_t v13 = v18;
          uint64_t v14 = 2;
          goto LABEL_16;
        }
      }
    }
  }
  else
  {
    uint64_t v12 = GpsdLogObjectGeneral;
    BOOL result = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR);
    if (result)
    {
      *(_DWORD *)std::string buf = 136315138;
      uint64_t v22 = "AppleEmbeddedGPSControl";
      int v11 = "#gpio,IOServiceMatching failed,%s";
      uint64_t v13 = v12;
      uint64_t v14 = 12;
LABEL_16:
      _os_log_error_impl(&dword_237AFF000, v13, OS_LOG_TYPE_ERROR, v11, buf, v14);
      return 0;
    }
  }
  return result;
}

void GnssHal::GpioEmbedded::GpioBackend::callback(GnssHal::GpioEmbedded::GpioBackend *this, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (*(void *)this)
  {
    int v4 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
    {
      LOWORD(v7) = 0;
      _os_log_impl(&dword_237AFF000, v4, OS_LOG_TYPE_INFO, "#gpio,callback,locked", (uint8_t *)&v7, 2u);
    }
    if (a2)
    {
      if (a2 == 1)
      {
        GnssHal::GpioEmbedded::notifyDevice(*(void *)this, 0);
        ++*((_DWORD *)this + 6);
      }
      else
      {
        uint64_t v6 = GpsdLogObjectGeneral;
        if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
        {
          int v7 = 134349056;
          uint64_t v8 = a2;
          _os_log_error_impl(&dword_237AFF000, v6, OS_LOG_TYPE_ERROR, "#gpio,Unrecognized messageArg,%{public}llu", (uint8_t *)&v7, 0xCu);
        }
      }
    }
    else
    {
      GnssHal::GpioEmbedded::notifyDevice(*(void *)this, 1);
      ++*((_DWORD *)this + 5);
    }
  }
  else
  {
    int v5 = GpsdLogObjectWarning;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectWarning, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 134349056;
      uint64_t v8 = a2;
      _os_log_impl(&dword_237AFF000, v5, OS_LOG_TYPE_DEFAULT, "#gpio,pGpioObject null,%{public}llu", (uint8_t *)&v7, 0xCu);
    }
  }
}

void GnssHal::GpioEmbedded::notifyDevice(uint64_t a1, int a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(a1 + 32);
  int v5 = GpsdLogObjectGeneral;
  BOOL v6 = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v6)
    {
      int v8 = 67240192;
      int v9 = a2;
      _os_log_impl(&dword_237AFF000, v5, OS_LOG_TYPE_INFO, "#gpio,notifyDevice,int,sending,%{public}d,", (uint8_t *)&v8, 8u);
      uint64_t v4 = *(void *)(a1 + 32);
      int v8 = a2;
      if (!v4) {
        std::__throw_bad_function_call[abi:ne180100]();
      }
    }
    else
    {
      int v8 = a2;
    }
    (*(void (**)(uint64_t, int *))(*(void *)v4 + 48))(v4, &v8);
  }
  else if (v6)
  {
    int v8 = 67240192;
    int v9 = a2;
    _os_log_impl(&dword_237AFF000, v5, OS_LOG_TYPE_INFO, "#gpio,notifyDevice,int,no callback,%{public}d,", (uint8_t *)&v8, 8u);
  }
  int v7 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
  {
    LOWORD(v8) = 0;
    _os_log_impl(&dword_237AFF000, v7, OS_LOG_TYPE_INFO, "#gpio,notifyDevice,done", (uint8_t *)&v8, 2u);
  }
}

uint64_t GnssHal::GpioEmbedded::GpioBackend::incrementApGpioTransitionCount(uint64_t this, int a2, int a3)
{
  if (!a2)
  {
    if (!a3) {
      return this;
    }
LABEL_5:
    ++*(_DWORD *)(this + 24);
    return this;
  }
  ++*(_DWORD *)(this + 20);
  if (a3) {
    goto LABEL_5;
  }
  return this;
}

BOOL GnssHal::GpioEmbedded::GpioBackend::registerForNotifications(GnssHal::GpioEmbedded::GpioBackend *this)
{
  kern_return_t v5;
  BOOL v6;
  kern_return_t v7;
  NSObject *v8;
  NSObject *v9;
  io_object_t notification;
  uint8_t buf[4];
  kern_return_t v13;
  uint64_t v14;

  uint64_t v14 = *MEMORY[0x263EF8340];
  IONotificationPortRef v2 = IONotificationPortCreate(*MEMORY[0x263F0EC88]);
  if (v2)
  {
    BOOL v3 = v2;
    global_queue = dispatch_get_global_queue(2, 0);
    IONotificationPortSetDispatchQueue(v3, global_queue);
    notification = 0;
    int v5 = IOServiceAddInterestNotification(v3, *((_DWORD *)this + 4), "IOGeneralInterest", (IOServiceInterestCallback)GnssHal::GPSControlInterestCallback, 0, &notification);
    BOOL v6 = v5 == 0;
    if (v5)
    {
      int v7 = v5;
      int v8 = GpsdLogObjectGeneral;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)std::string buf = 67240192;
        uint64_t v13 = v7;
        _os_log_error_impl(&dword_237AFF000, v8, OS_LOG_TYPE_ERROR, "#gpio,failed to register interest in notification,%{public}d", buf, 8u);
      }
    }
  }
  else
  {
    int v9 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)std::string buf = 0;
      _os_log_error_impl(&dword_237AFF000, v9, OS_LOG_TYPE_ERROR, "#gpio,failed to create notification port", buf, 2u);
    }
    return 0;
  }
  return v6;
}

void GnssHal::GPSControlInterestCallback(GnssHal *this, void *a2, int a3, uint64_t a4, void *a5)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  int v7 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
  {
    v11[0] = 67240448;
    v11[1] = a3;
    __int16 v12 = 2050;
    uint64_t v13 = a4;
    _os_log_impl(&dword_237AFF000, v7, OS_LOG_TYPE_INFO, "#gpio,callback,begin,%{public}u,%{public}llu", (uint8_t *)v11, 0x12u);
  }
  std::mutex::lock(&GnssHal::sMutex);
  int v9 = (GnssHal::GpioEmbedded::GpioBackend *)GnssHal::GpioEmbedded::GpioBackend::instance(v8);
  GnssHal::GpioEmbedded::GpioBackend::callback(v9, a4);
  uint64_t v10 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
  {
    LOWORD(v11[0]) = 0;
    _os_log_impl(&dword_237AFF000, v10, OS_LOG_TYPE_INFO, "#gpio,callback,end", (uint8_t *)v11, 2u);
  }
  std::mutex::unlock(&GnssHal::sMutex);
}

void sub_237B18820(_Unwind_Exception *exception_object)
{
}

void GnssHal::GpioEmbedded::setGpioNotifier(uint64_t a1, void *a2)
{
  v12[3] = *MEMORY[0x263EF8340];
  uint64_t v4 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
  {
    BOOL v5 = a2[3] == 0;
    LODWORD(v10[0]) = 67240192;
    HIDWORD(v10[0]) = v5;
    _os_log_impl(&dword_237AFF000, v4, OS_LOG_TYPE_INFO, "#gpio,setGpioNotifier,int,isNull,%{public}d", (uint8_t *)v10, 8u);
  }
  std::mutex::lock(&GnssHal::sMutex);
  uint64_t v6 = a2[3];
  if (!v6) {
    goto LABEL_6;
  }
  if ((void *)v6 != a2)
  {
    uint64_t v6 = (*(uint64_t (**)(uint64_t))(*(void *)v6 + 16))(v6);
LABEL_6:
    int v11 = (void *)v6;
    goto LABEL_8;
  }
  int v11 = v10;
  (*(void (**)(void *, void *))(*a2 + 24))(a2, v10);
LABEL_8:
  uint64_t v7 = a1 + 8;
  if (v10 != (void *)(a1 + 8))
  {
    int v8 = v11;
    uint64_t v9 = *(void *)(a1 + 32);
    if (v11 == v10)
    {
      if (v9 == v7)
      {
        (*(void (**)(void *, void *))(v10[0] + 24))(v10, v12);
        (*(void (**)(void *))(*v11 + 32))(v11);
        int v11 = 0;
        (*(void (**)(void, void *))(**(void **)(a1 + 32) + 24))(*(void *)(a1 + 32), v10);
        (*(void (**)(void))(**(void **)(a1 + 32) + 32))(*(void *)(a1 + 32));
        *(void *)(a1 + 32) = 0;
        int v11 = v10;
        (*(void (**)(void *, uint64_t))(v12[0] + 24))(v12, a1 + 8);
        (*(void (**)(void *))(v12[0] + 32))(v12);
      }
      else
      {
        (*(void (**)(void *, uint64_t))(v10[0] + 24))(v10, a1 + 8);
        (*(void (**)(void *))(*v11 + 32))(v11);
        int v11 = *(void **)(a1 + 32);
      }
      *(void *)(a1 + 32) = v7;
    }
    else if (v9 == v7)
    {
      (*(void (**)(uint64_t, void *))(*(void *)v7 + 24))(a1 + 8, v10);
      (*(void (**)(void))(**(void **)(a1 + 32) + 32))(*(void *)(a1 + 32));
      *(void *)(a1 + 32) = v11;
      int v11 = v10;
    }
    else
    {
      int v11 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v8;
    }
  }
  std::__function::__value_func<void ()(GnssHal::GpioNotification)>::~__value_func[abi:ne180100](v10);
  std::mutex::unlock(&GnssHal::sMutex);
}

void sub_237B18BAC(_Unwind_Exception *exception_object, int a2)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

uint64_t GnssHal::GpioEmbedded::GpioBackend::getApGpioZeroTransitionCount(GnssHal::GpioEmbedded::GpioBackend *this)
{
  std::mutex::lock(&GnssHal::sMutex);
  uint64_t v2 = *((unsigned int *)this + 5);
  std::mutex::unlock(&GnssHal::sMutex);
  return v2;
}

uint64_t GnssHal::GpioEmbedded::GpioBackend::getApGpioOneTransitionCount(GnssHal::GpioEmbedded::GpioBackend *this)
{
  std::mutex::lock(&GnssHal::sMutex);
  uint64_t v2 = *((unsigned int *)this + 6);
  std::mutex::unlock(&GnssHal::sMutex);
  return v2;
}

void GnssHal::GpioEmbedded::GpioBackend::clearApGpioTransitionCounts(GnssHal::GpioEmbedded::GpioBackend *this)
{
  std::mutex::lock(&GnssHal::sMutex);
  *((_DWORD *)this + 5) = 0;
  *((_DWORD *)this + 6) = 0;
  std::mutex::unlock(&GnssHal::sMutex);
}

void ___ZN7GnssHal12GpioEmbedded11GpioBackend8instanceEv_block_invoke()
{
}

void sub_237B18CE8(_Unwind_Exception *a1)
{
  MEMORY[0x237E29950](v1, 0x1020C405901AD1DLL);
  _Unwind_Resume(a1);
}

GnssHal::GpioEmbedded::GpioBackend *GnssHal::GpioEmbedded::GpioBackend::GpioBackend(GnssHal::GpioEmbedded::GpioBackend *this)
{
  *(void *)this = 0;
  *((unsigned char *)this + 8) = 0;
  *((_DWORD *)this + 5) = 0;
  *((_DWORD *)this + 6) = 0;
  uint64_t v2 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)std::string buf = 0;
    _os_log_impl(&dword_237AFF000, v2, OS_LOG_TYPE_INFO, "#gpio,backend,ctor,start", buf, 2u);
  }
  BOOL v3 = GnssHal::GpioEmbedded::GpioBackend::controlConnect(this, (unsigned int *)this + 3);
  *((unsigned char *)this + 8) = v3;
  if (v3)
  {
    GnssHal::GpioEmbedded::GpioBackend::registerForNotifications(this);
    uint64_t v4 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_237AFF000, v4, OS_LOG_TYPE_INFO, "#gpio,controlConnect,success", v10, 2u);
    }
  }
  else
  {
    BOOL v5 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_error_impl(&dword_237AFF000, v5, OS_LOG_TYPE_ERROR, "#gpio,controlConnect,failure", v9, 2u);
    }
  }
  uint64_t v6 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int v8 = 0;
    _os_log_impl(&dword_237AFF000, v6, OS_LOG_TYPE_INFO, "#gpio,backend,ctor,end", v8, 2u);
  }
  return this;
}

void *std::__function::__value_func<void ()(GnssHal::GpioNotification)>::~__value_func[abi:ne180100](void *a1)
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

uint64_t _GLOBAL__sub_I_GnssHalGpioImpl_mm()
{
  return __cxa_atexit(MEMORY[0x263F8C118], &GnssHal::sMutex, &dword_237AFF000);
}

BOOL deleteFile(const char *a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v2 = unlink(a1);
  if (v2)
  {
    BOOL v3 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      int v5 = *__error();
      int v6 = 136446466;
      uint64_t v7 = a1;
      __int16 v8 = 1026;
      int v9 = v5;
      _os_log_error_impl(&dword_237AFF000, v3, OS_LOG_TYPE_ERROR, "VendorLogger,deleteFile could not unlink,%{public}s,%{public}d", (uint8_t *)&v6, 0x12u);
    }
  }
  return v2 == 0;
}

BOOL getFileModificationTimeAndSize(const char *a1, timespec *a2, uint64_t *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  int v6 = stat(a1, &v10);
  if (v6)
  {
    uint64_t v7 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      int v8 = *__error();
      *(_DWORD *)std::string buf = 136446466;
      __int16 v12 = a1;
      __int16 v13 = 1026;
      int v14 = v8;
      _os_log_error_impl(&dword_237AFF000, v7, OS_LOG_TYPE_ERROR, "VendorLogger,getFileModificationTime could not stat,%{public}s,%{public}d", buf, 0x12u);
    }
  }
  else
  {
    *a2 = v10.st_mtimespec;
    *a3 = v10.st_size;
  }
  return v6 == 0;
}

uint64_t copyFile(const char *a1, const char *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v3 = [NSString stringWithUTF8String:a1];
  uint64_t v4 = [NSString stringWithUTF8String:a2];
  id v9 = 0;
  uint64_t v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F08850], "defaultManager"), "copyItemAtPath:toPath:error:", v3, v4, &v9);
  if ((v5 & 1) == 0)
  {
    int v6 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = objc_msgSend((id)objc_msgSend(v9, "localizedDescription"), "UTF8String");
      *(_DWORD *)std::string buf = 136446210;
      uint64_t v11 = v8;
      _os_log_error_impl(&dword_237AFF000, v6, OS_LOG_TYPE_ERROR, "VendorLogger,copyFile,error:%{public}s", buf, 0xCu);
    }
  }
  return v5;
}

void VendorLogger::copyLatestLogsToPath(uint64_t a1, uint64_t a2, int a3, int a4)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  uint64_t v8 = (id *)GpsdPreferences::instance(0);
  GpsdPreferences::vendorLogDirectory(v8, &v33);
  std::string::size_type size = HIBYTE(v33.__r_.__value_.__r.__words[2]);
  if ((v33.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    std::string::size_type size = v33.__r_.__value_.__l.__size_;
  }
  if (!size)
  {
    uint64_t v11 = GpsdLogObjectGeneral;
    if (!os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR)) {
      goto LABEL_42;
    }
    *(_WORD *)std::string buf = 0;
    uint64_t v12 = "VendorLogger,copyLatestLogsToPath, null source dirpath, cannot copy latest logs";
LABEL_21:
    char v18 = v11;
    uint32_t v19 = 2;
LABEL_22:
    _os_log_error_impl(&dword_237AFF000, v18, OS_LOG_TYPE_ERROR, v12, buf, v19);
    goto LABEL_42;
  }
  if (*(char *)(a2 + 23) < 0)
  {
    if (!*(void *)(a2 + 8))
    {
LABEL_19:
      uint64_t v11 = GpsdLogObjectGeneral;
      if (!os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR)) {
        goto LABEL_42;
      }
      *(_WORD *)std::string buf = 0;
      uint64_t v12 = "VendorLogger,copyLatestLogsToPath, null destination dirpath, cannot copy latest logs";
      goto LABEL_21;
    }
    stat v10 = *(const char **)a2;
  }
  else
  {
    stat v10 = (const char *)a2;
    if (!*(unsigned char *)(a2 + 23)) {
      goto LABEL_19;
    }
  }
  if (!mkdir(v10, 0x1F8u))
  {
    uint64_t v20 = GpsdLogObjectGeneral;
    if (!os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
    {
LABEL_36:
      uint64_t v27 = *(NSObject **)(a1 + 880);
      if (v27)
      {
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3321888768;
        block[2] = ___ZN12VendorLogger20copyLatestLogsToPathERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEEij_block_invoke;
        block[3] = &__block_descriptor_80_e8_40c67_ZTSKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE_e5_v8__0l;
        block[4] = a1;
        if (SHIBYTE(v33.__r_.__value_.__r.__words[2]) < 0) {
          std::string::__init_copy_ctor_external(&__p, v33.__r_.__value_.__l.__data_, v33.__r_.__value_.__l.__size_);
        }
        else {
          std::string __p = v33;
        }
        uint64_t v30 = a2;
        int v31 = a4;
        int v32 = a3;
        dispatch_sync(v27, block);
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__p.__r_.__value_.__l.__data_);
        }
      }
      goto LABEL_42;
    }
    if (*(char *)(a2 + 23) >= 0) {
      uint64_t v21 = (const char *)a2;
    }
    else {
      uint64_t v21 = *(const char **)a2;
    }
    *(_DWORD *)std::string buf = 136446466;
    unint64_t v35 = v21;
    __int16 v36 = 1024;
    int v37 = 504;
    uint64_t v22 = "VendorLogger,copyLatestLogsToPath,created directory,%{public}s,permissions,%x";
    uint64_t v23 = v20;
    uint32_t v24 = 18;
LABEL_35:
    _os_log_impl(&dword_237AFF000, v23, OS_LOG_TYPE_INFO, v22, buf, v24);
    goto LABEL_36;
  }
  int v13 = *__error();
  if (v13 == 17)
  {
    if (*(char *)(a2 + 23) >= 0) {
      int v14 = (const char *)a2;
    }
    else {
      int v14 = *(const char **)a2;
    }
    int v15 = chmod(v14, 0x1F8u);
    uint64_t v16 = GpsdLogObjectGeneral;
    if (v15)
    {
      if (!os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR)) {
        goto LABEL_42;
      }
      int v17 = *__error();
      *(_DWORD *)std::string buf = 67240192;
      LODWORD(v35) = v17;
      uint64_t v12 = "VendorLogger,copyLatestLogsToPath,chmod failed,%{public}d";
      char v18 = v16;
      uint32_t v19 = 8;
      goto LABEL_22;
    }
    if (!os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO)) {
      goto LABEL_36;
    }
    *(_DWORD *)std::string buf = 67109120;
    LODWORD(v35) = 504;
    uint64_t v22 = "VendorLogger,copyLatestLogsToPath,directory exists,permissions,%x";
    uint64_t v23 = v16;
    uint32_t v24 = 8;
    goto LABEL_35;
  }
  uint64_t v25 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
  {
    if (*(char *)(a2 + 23) >= 0) {
      uint64_t v26 = (const char *)a2;
    }
    else {
      uint64_t v26 = *(const char **)a2;
    }
    *(_DWORD *)std::string buf = 136446466;
    unint64_t v35 = v26;
    __int16 v36 = 1026;
    int v37 = v13;
    uint64_t v12 = "VendorLogger,copyLatestLogsToPath,could not create directory,%{public}s, error,%{public}d";
    char v18 = v25;
    uint32_t v19 = 18;
    goto LABEL_22;
  }
LABEL_42:
  if (SHIBYTE(v33.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v33.__r_.__value_.__l.__data_);
  }
}

void sub_237B19584(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  if (a25 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void ___ZN12VendorLogger20copyLatestLogsToPathERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEEij_block_invoke(uint64_t a1)
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  int v2 = *(VendorLogger **)(a1 + 32);
  VendorLogger::closeLogFile(v2);
  uint64_t v47 = 0;
  uint64_t v48 = 0;
  uint64_t v49 = 0;
  if (*(char *)(a1 + 63) < 0) {
    uint64_t v3 = *(void *)(a1 + 40);
  }
  else {
    uint64_t v3 = a1 + 40;
  }
  VendorLogger::enumerateFiles(v3, (const void **)v2, (uint64_t *)&v47);
  unint64_t v4 = 126 - 2 * __clz(0xAAAAAAAAAAAAAAABLL * (v48 - v47));
  if (v48 == v47) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = v4;
  }
  std::__introsort<std::_ClassicAlgPolicy,std::greater<void> &,std::string *,false>((unint64_t)v47, v48, v5, 1);
  uint64_t v45 = 0;
  int v6 = v47;
  uint64_t v7 = v48;
  uint64_t v8 = (os_log_t *)&GpsdLogObjectGeneral;
  if (v47 != v48)
  {
    int v44 = 0;
    while (1)
    {
      if (*(char *)(a1 + 63) >= 0) {
        size_t v9 = *(unsigned __int8 *)(a1 + 63);
      }
      else {
        size_t v9 = *(void *)(a1 + 48);
      }
      std::string::basic_string[abi:ne180100]((uint64_t)&v51, v9 + 1);
      if ((v51.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        stat v10 = &v51;
      }
      else {
        stat v10 = (std::string *)v51.__r_.__value_.__r.__words[0];
      }
      if (v9)
      {
        if (*(char *)(a1 + 63) >= 0) {
          uint64_t v11 = (const void *)(a1 + 40);
        }
        else {
          uint64_t v11 = *(const void **)(a1 + 40);
        }
        memmove(v10, v11, v9);
      }
      *(_WORD *)((char *)&v10->__r_.__value_.__l.__data_ + v9) = 47;
      int v12 = *((char *)v6 + 23);
      if (v12 >= 0) {
        int v13 = (const std::string::value_type *)v6;
      }
      else {
        int v13 = (const std::string::value_type *)*v6;
      }
      if (v12 >= 0) {
        std::string::size_type v14 = *((unsigned __int8 *)v6 + 23);
      }
      else {
        std::string::size_type v14 = (std::string::size_type)v6[1];
      }
      int v15 = std::string::append(&v51, v13, v14);
      long long v16 = *(_OWORD *)&v15->__r_.__value_.__l.__data_;
      int64_t v53 = v15->__r_.__value_.__r.__words[2];
      *(_OWORD *)std::string buf = v16;
      v15->__r_.__value_.__l.__size_ = 0;
      v15->__r_.__value_.__r.__words[2] = 0;
      v15->__r_.__value_.__r.__words[0] = 0;
      if (SHIBYTE(v51.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v51.__r_.__value_.__l.__data_);
      }
      if (v53 >= 0) {
        int v17 = buf;
      }
      else {
        int v17 = *(uint8_t **)buf;
      }
      if (!getFileModificationTimeAndSize((const char *)v17, &v46, &v45)) {
        goto LABEL_74;
      }
      if (v45 <= *(unsigned int *)(a1 + 72))
      {
        int v37 = *v8;
        if (os_log_type_enabled(*v8, OS_LOG_TYPE_INFO))
        {
          if (v53 >= 0) {
            uint64_t v38 = buf;
          }
          else {
            uint64_t v38 = *(uint8_t **)buf;
          }
          LODWORD(v51.__r_.__value_.__l.__data_) = 136446210;
          *(std::string::size_type *)((char *)v51.__r_.__value_.__r.__words + 4) = (std::string::size_type)v38;
          _os_log_impl(&dword_237AFF000, v37, OS_LOG_TYPE_INFO, "VendorLogger,copyLatestLogsToPath, skipped file,%{public}s", (uint8_t *)&v51, 0xCu);
        }
        int v36 = 3;
        goto LABEL_75;
      }
      char v18 = v8;
      uint32_t v19 = *(const void ***)(a1 + 64);
      if (*((char *)v19 + 23) >= 0) {
        size_t v20 = *((unsigned __int8 *)v19 + 23);
      }
      else {
        size_t v20 = (size_t)v19[1];
      }
      std::string::basic_string[abi:ne180100]((uint64_t)&v50, v20 + 1);
      if ((v50.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        uint64_t v21 = &v50;
      }
      else {
        uint64_t v21 = (std::string *)v50.__r_.__value_.__r.__words[0];
      }
      if (v20)
      {
        if (*((char *)v19 + 23) >= 0) {
          uint64_t v22 = v19;
        }
        else {
          uint64_t v22 = *v19;
        }
        memmove(v21, v22, v20);
      }
      *(_WORD *)((char *)&v21->__r_.__value_.__l.__data_ + v20) = 47;
      int v23 = *((char *)v6 + 23);
      if (v23 >= 0) {
        uint32_t v24 = (const std::string::value_type *)v6;
      }
      else {
        uint32_t v24 = (const std::string::value_type *)*v6;
      }
      if (v23 >= 0) {
        std::string::size_type v25 = *((unsigned __int8 *)v6 + 23);
      }
      else {
        std::string::size_type v25 = (std::string::size_type)v6[1];
      }
      uint64_t v26 = std::string::append(&v50, v24, v25);
      long long v27 = *(_OWORD *)&v26->__r_.__value_.__l.__data_;
      v51.__r_.__value_.__r.__words[2] = v26->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v51.__r_.__value_.__l.__data_ = v27;
      v26->__r_.__value_.__l.__size_ = 0;
      v26->__r_.__value_.__r.__words[2] = 0;
      v26->__r_.__value_.__r.__words[0] = 0;
      uint64_t v8 = v18;
      if (SHIBYTE(v50.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v50.__r_.__value_.__l.__data_);
      }
      uint64_t v28 = v53 >= 0 ? (const char *)buf : *(const char **)buf;
      uint64_t v29 = (v51.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
          ? &v51
          : (std::string *)v51.__r_.__value_.__r.__words[0];
      char v30 = copyFile(v28, (const char *)v29);
      int v31 = *v18;
      if (v30)
      {
        if (os_log_type_enabled(*v18, OS_LOG_TYPE_DEBUG))
        {
          if ((v51.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            uint64_t v39 = &v51;
          }
          else {
            uint64_t v39 = (std::string *)v51.__r_.__value_.__r.__words[0];
          }
          LODWORD(v50.__r_.__value_.__l.__data_) = 136446210;
          *(std::string::size_type *)((char *)v50.__r_.__value_.__r.__words + 4) = (std::string::size_type)v39;
          _os_log_debug_impl(&dword_237AFF000, v31, OS_LOG_TYPE_DEBUG, "VendorLogger,copyLatestLogsToPath, copied %{public}s", (uint8_t *)&v50, 0xCu);
        }
        int v32 = *(_DWORD *)(a1 + 76);
        BOOL v33 = ++v44 < v32;
        BOOL v34 = v44 >= v32;
        BOOL v35 = v33;
        int v36 = 2 * v34;
      }
      else
      {
        if (os_log_type_enabled(*v18, OS_LOG_TYPE_ERROR))
        {
          if (v53 >= 0) {
            unint64_t v40 = buf;
          }
          else {
            unint64_t v40 = *(uint8_t **)buf;
          }
          if ((v51.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            uint64_t v41 = &v51;
          }
          else {
            uint64_t v41 = (std::string *)v51.__r_.__value_.__r.__words[0];
          }
          LODWORD(v50.__r_.__value_.__l.__data_) = 136446466;
          *(std::string::size_type *)((char *)v50.__r_.__value_.__r.__words + 4) = (std::string::size_type)v40;
          WORD2(v50.__r_.__value_.__r.__words[1]) = 2082;
          *(std::string::size_type *)((char *)&v50.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v41;
          _os_log_error_impl(&dword_237AFF000, v31, OS_LOG_TYPE_ERROR, "VendorLogger,copyLatestLogsToPath, failed src,%{public}s, dest,%{public}s", (uint8_t *)&v50, 0x16u);
        }
        BOOL v35 = 0;
        int v36 = 2;
      }
      if (SHIBYTE(v51.__r_.__value_.__r.__words[2]) < 0) {
        break;
      }
      if (v35) {
        goto LABEL_74;
      }
LABEL_75:
      if (SHIBYTE(v53) < 0) {
        operator delete(*(void **)buf);
      }
      if (v36 == 3 || !v36)
      {
        v6 += 3;
        if (v6 != v7) {
          continue;
        }
      }
      goto LABEL_95;
    }
    operator delete(v51.__r_.__value_.__l.__data_);
    if (!v35) {
      goto LABEL_75;
    }
LABEL_74:
    int v36 = 0;
    goto LABEL_75;
  }
  int v44 = 0;
LABEL_95:
  unint64_t v42 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    int v43 = *(_DWORD *)(a1 + 76);
    *(_DWORD *)std::string buf = 67109376;
    *(_DWORD *)&uint8_t buf[4] = v44;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = v43;
    _os_log_impl(&dword_237AFF000, v42, OS_LOG_TYPE_DEFAULT, "VendorLogger,copyLatestLogsToPath, Copied,%d, RequestedMax,%d", buf, 0xEu);
  }
  *(void *)std::string buf = &v47;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
}

void sub_237B19A90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,uint64_t a27,void *__p,uint64_t a29,int a30,__int16 a31,char a32,char a33)
{
  *(void *)(v33 - 128) = &a17;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)(v33 - 128));
  _Unwind_Resume(a1);
}

void VendorLogger::closeLogFile(VendorLogger *this)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  VendorLogger::flushCompression(this);
  if (*((void *)this + 52))
  {
    std::ostream::flush();
    if (!std::filebuf::close()) {
      std::ios_base::clear((std::ios_base *)((char *)this + *(void *)(*((void *)this + 36) - 24) + 288), *(_DWORD *)((char *)this + *(void *)(*((void *)this + 36) - 24) + 320) | 4);
    }
    int v2 = (const std::__fs::filesystem::path *)((char *)this + 856);
    if (*((char *)this + 879) < 0)
    {
      std::string::__init_copy_ctor_external(&buf, *((const std::string::value_type **)this + 107), *((void *)this + 108));
    }
    else
    {
      *(_OWORD *)&buf.__r_.__value_.__l.__data_ = *(_OWORD *)&v2->__pn_.__r_.__value_.__l.__data_;
      buf.__r_.__value_.__r.__words[2] = *((void *)this + 109);
    }
    std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>((uint64_t)v28, (const void **)this + 3, (const void **)this + 9);
    std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>((uint64_t)__p, (const void **)this + 6, (const void **)this + 9);
    int64_t size = HIBYTE(buf.__r_.__value_.__r.__words[2]);
    if ((buf.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      p_std::string buf = &buf;
    }
    else {
      p_std::string buf = (std::string *)buf.__r_.__value_.__r.__words[0];
    }
    if ((v29 & 0x80u) == 0) {
      int v6 = v28;
    }
    else {
      int v6 = (void **)v28[0];
    }
    if ((v29 & 0x80u) == 0) {
      int64_t v7 = v29;
    }
    else {
      int64_t v7 = (int64_t)v28[1];
    }
    if (v7)
    {
      if ((buf.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        int64_t size = buf.__r_.__value_.__l.__size_;
      }
      if (size >= v7)
      {
        uint32_t v19 = (char *)p_buf + size;
        int v20 = *(char *)v6;
        uint64_t v21 = p_buf;
        do
        {
          int64_t v22 = size - v7;
          if (v22 == -1) {
            break;
          }
          int v23 = (char *)memchr(v21, v20, v22 + 1);
          if (!v23) {
            break;
          }
          uint32_t v24 = v23;
          if (!memcmp(v23, v6, v7))
          {
            if (v24 != v19)
            {
              std::string::size_type v9 = v24 - (char *)p_buf;
              if (v24 - (char *)p_buf != -1) {
                goto LABEL_25;
              }
            }
            break;
          }
          uint64_t v21 = (std::string *)(v24 + 1);
          int64_t size = v19 - (v24 + 1);
        }
        while (size >= v7);
      }
      uint64_t v8 = GpsdLogObjectWarning;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectWarning, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)int v31 = 136315138;
        int v32 = p_buf;
        _os_log_impl(&dword_237AFF000, v8, OS_LOG_TYPE_DEFAULT, "VendorLogger,closeLogFile,Could not archive,%s", v31, 0xCu);
      }
    }
    else
    {
      std::string::size_type v9 = 0;
LABEL_25:
      if ((v27 & 0x80u) == 0) {
        stat v10 = __p;
      }
      else {
        stat v10 = (void **)__p[0];
      }
      if ((v27 & 0x80u) == 0) {
        std::string::size_type v11 = v27;
      }
      else {
        std::string::size_type v11 = (std::string::size_type)__p[1];
      }
      std::string::replace(&buf, v9, v7, (const std::string::value_type *)v10, v11);
      int v12 = GpsdLogObjectGeneral;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
      {
        std::string::size_type v14 = (std::string *)((char *)this + 856);
        if (*((char *)this + 879) < 0) {
          std::string::size_type v14 = (std::string *)v2->__pn_.__r_.__value_.__r.__words[0];
        }
        int v15 = &buf;
        if ((buf.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
          int v15 = (std::string *)buf.__r_.__value_.__r.__words[0];
        }
        *(_DWORD *)int v31 = 136315394;
        int v32 = v14;
        __int16 v33 = 2080;
        BOOL v34 = v15;
        _os_log_impl(&dword_237AFF000, v12, OS_LOG_TYPE_INFO, "VendorLogger,closeLogFile,Archiving,Old name,%s,New name,%s", v31, 0x16u);
      }
      if (*((char *)this + 879) < 0) {
        int v2 = (const std::__fs::filesystem::path *)v2->__pn_.__r_.__value_.__r.__words[0];
      }
      if ((buf.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        long long v16 = (const std::__fs::filesystem::path *)&buf;
      }
      else {
        long long v16 = (const std::__fs::filesystem::path *)buf.__r_.__value_.__r.__words[0];
      }
      rename(v2, v16, v13);
      if (v17)
      {
        char v18 = GpsdLogObjectGeneral;
        if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
        {
          int v25 = *__error();
          *(_DWORD *)int v31 = 67240192;
          LODWORD(v32) = v25;
          _os_log_error_impl(&dword_237AFF000, v18, OS_LOG_TYPE_ERROR, "VendorLogger,closeLogFile,rename failed,%{public}d", v31, 8u);
        }
      }
    }
    if (*((char *)this + 879) < 0)
    {
      **((unsigned char **)this + 107) = 0;
      *((void *)this + 108) = 0;
    }
    else
    {
      *((unsigned char *)this + 856) = 0;
      *((unsigned char *)this + 879) = 0;
    }
    if ((char)v27 < 0) {
      operator delete(__p[0]);
    }
    if ((char)v29 < 0) {
      operator delete(v28[0]);
    }
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(buf.__r_.__value_.__l.__data_);
    }
  }
  else
  {
    uint64_t v3 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf.__r_.__value_.__l.__data_) = 0;
      _os_log_debug_impl(&dword_237AFF000, v3, OS_LOG_TYPE_DEBUG, "VendorLogger,closeLogFile,No output to close", (uint8_t *)&buf, 2u);
    }
  }
  *((unsigned char *)this + 892) = 0;
}

void sub_237B19EE4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a20 < 0) {
    operator delete(a15);
  }
  if (a26 < 0) {
    operator delete(a21);
  }
  _Unwind_Resume(exception_object);
}

uint64_t VendorLogger::enumerateFiles(uint64_t a1, const void **a2, uint64_t *a3)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  int v6 = (void *)[MEMORY[0x263F08850] defaultManager];
  int64_t v7 = objc_msgSend(v6, "contentsOfDirectoryAtPath:error:", objc_msgSend(NSString, "stringWithUTF8String:", a1), 0);
  std::vector<std::string>::__clear[abi:ne180100](a3);
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  uint64_t v8 = (void *)[v7 reverseObjectEnumerator];
  uint64_t result = [v8 countByEnumeratingWithState:&v45 objects:v50 count:16];
  uint64_t v10 = result;
  if (result)
  {
    uint64_t v11 = *(void *)v46;
    uint64_t v38 = (std::allocator<std::string> *)(a3 + 2);
    do
    {
      uint64_t v12 = 0;
      uint64_t v39 = v10;
      do
      {
        if (*(void *)v46 != v11) {
          objc_enumerationMutation(v8);
        }
        int v13 = (char *)objc_msgSend(*(id *)(*((void *)&v45 + 1) + 8 * v12), "UTF8String", v38);
        if (v13)
        {
          std::string::basic_string[abi:ne180100]<0>(&v42, v13);
          int v14 = *((char *)a2 + 23);
          if (v14 >= 0) {
            unint64_t v15 = *((unsigned __int8 *)a2 + 23);
          }
          else {
            unint64_t v15 = (unint64_t)a2[1];
          }
          unsigned __int8 v16 = v44;
          if ((char)v44 < 0)
          {
            if (v15 == -1) {
LABEL_55:
            }
              std::string::__throw_out_of_range[abi:ne180100]();
            char v18 = v42;
            if (v43 >= v15) {
              size_t v17 = v15;
            }
            else {
              size_t v17 = v43;
            }
          }
          else
          {
            if (v15 == -1) {
              goto LABEL_55;
            }
            if (v44 >= v15) {
              size_t v17 = v15;
            }
            else {
              size_t v17 = v44;
            }
            char v18 = &v42;
          }
          if (v14 >= 0) {
            int v20 = a2;
          }
          else {
            int v20 = *a2;
          }
          if (!memcmp(v18, v20, v17) && v17 == v15)
          {
            std::string::basic_string[abi:ne180100]<0>(__p, v13);
            unint64_t v22 = a3[1];
            int v23 = (std::string *)a3[2];
            if (v22 >= (unint64_t)v23)
            {
              uint64_t v25 = *a3;
              unint64_t v26 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v22 - *a3) >> 3);
              unint64_t v27 = v26 + 1;
              if (v26 + 1 > 0xAAAAAAAAAAAAAAALL) {
                std::vector<gnssTest::RfMeasurement>::__throw_length_error[abi:ne180100]();
              }
              uint64_t v28 = v11;
              unsigned __int8 v29 = v8;
              if (0x5555555555555556 * (((uint64_t)v23 - v25) >> 3) > v27) {
                unint64_t v27 = 0x5555555555555556 * (((uint64_t)v23 - v25) >> 3);
              }
              if (0xAAAAAAAAAAAAAAABLL * (((uint64_t)v23 - v25) >> 3) >= 0x555555555555555) {
                unint64_t v30 = 0xAAAAAAAAAAAAAAALL;
              }
              else {
                unint64_t v30 = v27;
              }
              buf.__end_cap_.__value_ = v38;
              if (v30)
              {
                if (v30 > 0xAAAAAAAAAAAAAAALL) {
                  std::__throw_bad_array_new_length[abi:ne180100]();
                }
                int v31 = (std::string *)operator new(24 * v30);
              }
              else
              {
                int v31 = 0;
              }
              int v32 = v31 + v26;
              buf.__first_ = v31;
              buf.__begin_ = v32;
              value = &v31[v30];
              *(_OWORD *)&v32->__r_.__value_.__l.__data_ = *(_OWORD *)__p;
              v32->__r_.__value_.__r.__words[2] = v41;
              __p[0] = 0;
              __p[1] = 0;
              std::string::size_type v41 = 0;
              std::__split_buffer<std::string>::pointer end = v32 + 1;
              buf.__end_ = v32 + 1;
              buf.__end_cap_.__value_ = value;
              if (v22 == v25)
              {
                int64x2_t v36 = vdupq_n_s64(v22);
                uint64_t v8 = v29;
              }
              else
              {
                uint64_t v8 = v29;
                do
                {
                  long long v35 = *(_OWORD *)(v22 - 24);
                  v32[-1].__r_.__value_.__r.__words[2] = *(void *)(v22 - 8);
                  *(_OWORD *)&v32[-1].__r_.__value_.__l.__data_ = v35;
                  --v32;
                  *(void *)(v22 - 16) = 0;
                  *(void *)(v22 - 8) = 0;
                  *(void *)(v22 - 24) = 0;
                  v22 -= 24;
                }
                while (v22 != v25);
                int64x2_t v36 = *(int64x2_t *)a3;
                int v23 = (std::string *)a3[2];
                std::__split_buffer<std::string>::pointer end = buf.__end_;
                value = buf.__end_cap_.__value_;
              }
              uint64_t v11 = v28;
              *a3 = (uint64_t)v32;
              a3[1] = (uint64_t)end;
              *(int64x2_t *)&buf.__begin_ = v36;
              a3[2] = (uint64_t)value;
              buf.__end_cap_.__value_ = v23;
              buf.__first_ = (std::__split_buffer<std::string>::pointer)v36.i64[0];
              std::__split_buffer<std::string>::~__split_buffer(&buf);
              int v37 = SHIBYTE(v41);
              a3[1] = (uint64_t)end;
              uint64_t v10 = v39;
              if (v37 < 0) {
                operator delete(__p[0]);
              }
            }
            else
            {
              long long v24 = *(_OWORD *)__p;
              *(void *)(v22 + 16) = v41;
              *(_OWORD *)unint64_t v22 = v24;
              a3[1] = v22 + 24;
            }
            unsigned __int8 v16 = v44;
          }
          if ((v16 & 0x80) != 0) {
            operator delete(v42);
          }
        }
        else
        {
          uint32_t v19 = GpsdLogObjectGeneral;
          if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
          {
            LOWORD(buf.__first_) = 0;
            _os_log_error_impl(&dword_237AFF000, v19, OS_LOG_TYPE_ERROR, "VendorLogger,pruneLogFiles,null filename from reverseEnumerateFiles", (uint8_t *)&buf, 2u);
          }
        }
        ++v12;
      }
      while (v12 != v10);
      uint64_t result = [v8 countByEnumeratingWithState:&v45 objects:v50 count:16];
      uint64_t v10 = result;
    }
    while (result);
  }
  return result;
}

void sub_237B1A2F4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  if (a22 < 0) {
    operator delete(a17);
  }
  _Unwind_Resume(exception_object);
}

void __copy_helper_block_e8_40c67_ZTSKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE(uint64_t a1, uint64_t a2)
{
  int v2 = (std::string *)(a1 + 40);
  if (*(char *)(a2 + 63) < 0)
  {
    std::string::__init_copy_ctor_external(v2, *(const std::string::value_type **)(a2 + 40), *(void *)(a2 + 48));
  }
  else
  {
    long long v3 = *(_OWORD *)(a2 + 40);
    v2->__r_.__value_.__r.__words[2] = *(void *)(a2 + 56);
    *(_OWORD *)&v2->__r_.__value_.__l.__data_ = v3;
  }
}

void __destroy_helper_block_e8_40c67_ZTSKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE(uint64_t a1)
{
  if (*(char *)(a1 + 63) < 0) {
    operator delete(*(void **)(a1 + 40));
  }
}

const char *algorithmName(int a1)
{
  if (a1 > 773)
  {
    if (a1 != 774)
    {
      if (a1 == 2049) {
        return "lzfse";
      }
      return "unk";
    }
    return "lzma";
  }
  else
  {
    if (a1 != 256)
    {
      if (a1 == 517) {
        return "zlib";
      }
      return "unk";
    }
    return "lz4";
  }
}

void VendorLogger::VendorLogger(VendorLogger *this)
{
  VendorLogger::generateDefaultConfig((uint64_t)v2);
  VendorLogger::VendorLogger((std::string *)this, (const VendorLogger::Config *)v2);
  if (v11 < 0) {
    operator delete(__p);
  }
  if (v9 < 0) {
    operator delete(v8);
  }
  if (v7 < 0) {
    operator delete(v6);
  }
  if (v5 < 0) {
    operator delete(v4);
  }
  if (v3 < 0) {
    operator delete(v2[0]);
  }
}

{
  void *v2[2];
  char v3;
  void *v4;
  char v5;
  void *v6;
  char v7;
  void *v8;
  char v9;
  void *__p;
  char v11;

  VendorLogger::generateDefaultConfig((uint64_t)v2);
  VendorLogger::VendorLogger((std::string *)this, (const VendorLogger::Config *)v2);
  if (v11 < 0) {
    operator delete(__p);
  }
  if (v9 < 0) {
    operator delete(v8);
  }
  if (v7 < 0) {
    operator delete(v6);
  }
  if (v5 < 0) {
    operator delete(v4);
  }
  if (v3 < 0) {
    operator delete(v2[0]);
  }
}

void sub_237B1A474(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
}

void VendorLogger::generateDefaultConfig(uint64_t a1@<X8>)
{
  std::string::basic_string[abi:ne180100]<0>((void *)a1, "gpsd");
  std::string::basic_string[abi:ne180100]<0>((void *)(a1 + 24), "o");
  std::string::basic_string[abi:ne180100]<0>((void *)(a1 + 48), "");
  std::string::basic_string[abi:ne180100]<0>((void *)(a1 + 72), "log");
  *(_OWORD *)(a1 + 96) = 0u;
  char v3 = (void **)(a1 + 96);
  *(void *)(a1 + 152) = 0;
  *(unsigned char *)(a1 + 196) = 0;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_DWORD *)(a1 + 144) = 0;
  *(_DWORD *)(a1 + 200) = 2;
  memset_pattern16((void *)(a1 + 160), &unk_237B315E0, 0x24uLL);
  unint64_t v4 = (id *)GpsdPreferences::instance(0);
  GpsdPreferences::vendorLogRetentionDays(v4);
  *(double *)(a1 + 120) = (float)((float)(v5 * 24.0) * 3600.0);
  int v6 = (GpsdPreferences *)GpsdPreferences::instance(0);
  *(void *)(a1 + 128) = (uint64_t)(int)GpsdPreferences::vendorLogRotationSizeMB(v6) << 20;
  char v7 = (id *)GpsdPreferences::instance(0);
  *(void *)(a1 + 136) = (uint64_t)(int)GpsdPreferences::vendorLogMaxDirectorySizeMB(v7) << 20;
  uint64_t v8 = (id *)GpsdPreferences::instance(0);
  *(_DWORD *)(a1 + 144) = GpsdPreferences::vendorLogMaxNumberOfFiles(v8);
  char v9 = (id *)GpsdPreferences::instance(0);
  *(unsigned char *)(a1 + 196) = GpsdPreferences::vendorLogPrefixWithTimestamp(v9);
  uint64_t v10 = (id *)GpsdPreferences::instance(0);
  GpsdPreferences::vendorLogDirectory(v10, &v20);
  if (*(char *)(a1 + 119) < 0) {
    operator delete(*v3);
  }
  *(_OWORD *)char v3 = v20;
  *(void *)(a1 + 112) = v21;
  *(void *)(a1 + 152) &= 0xFFFFFFFFFFFFFE00;
  char v11 = (id *)GpsdPreferences::instance(0);
  unsigned int LogLevel = GpsdPreferences::getLogLevel(v11);
  uint64_t v13 = 0;
  uint64_t v14 = *(void *)(a1 + 152);
  if (LogLevel >= 8) {
    int v15 = 8;
  }
  else {
    int v15 = LogLevel;
  }
  uint64_t v16 = (v15 + 1);
  do
  {
    if (v13)
    {
      v14 |= 1 << v13;
      *(void *)(a1 + 152) = v14;
    }
    ++v13;
  }
  while (v16 != v13);
  size_t v17 = (id *)GpsdPreferences::instance(0);
  int v18 = GpsdPreferences::vendorLogAllToOsLog(v17);
  memset_pattern16((void *)(a1 + 160), &unk_237B315E0, 0x24uLL);
  if (v18)
  {
    *(_OWORD *)(a1 + 164) = xmmword_237B315D0;
    *(void *)(a1 + 180) = 0x400000003;
    *(_DWORD *)(a1 + 192) = 4;
  }
  else
  {
    *(void *)(a1 + 164) = 0x100000000;
    unsigned int v19 = *(_DWORD *)(GpsdPlatformInfo::instance(0) + 8) - 103;
    if (v19 <= 4 && ((1 << v19) & 0x19) != 0)
    {
      *(_DWORD *)(a1 + 176) = 2;
    }
    else
    {
      GpsdPlatformInfo::instance(0);
      *(_DWORD *)(a1 + 172) = 2;
    }
  }
}

void sub_237B1A6CC(_Unwind_Exception *a1)
{
  VendorLogger::Config::~Config(v1);
  _Unwind_Resume(a1);
}

void VendorLogger::VendorLogger(std::string *this, const VendorLogger::Config *a2)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v4 = *(_OWORD *)a2;
    this->__r_.__value_.__r.__words[2] = *((void *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v4;
  }
  if (*((char *)a2 + 47) < 0)
  {
    std::string::__init_copy_ctor_external(this + 1, *((const std::string::value_type **)a2 + 3), *((void *)a2 + 4));
  }
  else
  {
    long long v5 = *(_OWORD *)((char *)a2 + 24);
    this[1].__r_.__value_.__r.__words[2] = *((void *)a2 + 5);
    *(_OWORD *)&this[1].__r_.__value_.__l.__data_ = v5;
  }
  if (*((char *)a2 + 71) < 0)
  {
    std::string::__init_copy_ctor_external(this + 2, *((const std::string::value_type **)a2 + 6), *((void *)a2 + 7));
  }
  else
  {
    long long v6 = *((_OWORD *)a2 + 3);
    this[2].__r_.__value_.__r.__words[2] = *((void *)a2 + 8);
    *(_OWORD *)&this[2].__r_.__value_.__l.__data_ = v6;
  }
  if (*((char *)a2 + 95) < 0)
  {
    std::string::__init_copy_ctor_external(this + 3, *((const std::string::value_type **)a2 + 9), *((void *)a2 + 10));
  }
  else
  {
    long long v7 = *(_OWORD *)((char *)a2 + 72);
    this[3].__r_.__value_.__r.__words[2] = *((void *)a2 + 11);
    *(_OWORD *)&this[3].__r_.__value_.__l.__data_ = v7;
  }
  uint64_t v8 = this + 4;
  if (*((char *)a2 + 119) < 0)
  {
    std::string::__init_copy_ctor_external(v8, *((const std::string::value_type **)a2 + 12), *((void *)a2 + 13));
  }
  else
  {
    long long v9 = *((_OWORD *)a2 + 6);
    this[4].__r_.__value_.__r.__words[2] = *((void *)a2 + 14);
    *(_OWORD *)&v8->__r_.__value_.__l.__data_ = v9;
  }
  long long v10 = *(_OWORD *)((char *)a2 + 152);
  long long v11 = *(_OWORD *)((char *)a2 + 168);
  long long v12 = *(_OWORD *)((char *)a2 + 184);
  int v13 = *((_DWORD *)a2 + 50);
  long long v14 = *(_OWORD *)((char *)a2 + 120);
  long long v15 = *(_OWORD *)((char *)a2 + 136);
  this[8].__r_.__value_.__r.__words[2] = 0;
  *(_OWORD *)&this[5].__r_.__value_.__r.__words[2] = v15;
  *(_OWORD *)&this[5].__r_.__value_.__l.__data_ = v14;
  LODWORD(this[8].__r_.__value_.__r.__words[1]) = v13;
  *(_OWORD *)&this[7].__r_.__value_.__r.__words[2] = v12;
  *(_OWORD *)&this[7].__r_.__value_.__l.__data_ = v11;
  *(_OWORD *)&this[6].__r_.__value_.__r.__words[1] = v10;
  this[9].__r_.__value_.__r.__words[0] = 0;
  this[9].__r_.__value_.__l.__size_ = 0;
  LODWORD(this[11].__r_.__value_.__r.__words[1]) = 2049;
  WORD2(this[11].__r_.__value_.__r.__words[1]) = 0;
  this[11].__r_.__value_.__r.__words[2] = 0;
  std::string::size_type v16 = MEMORY[0x263F8C310] + 64;
  this[29].__r_.__value_.__l.__size_ = MEMORY[0x263F8C310] + 64;
  std::string::size_type v17 = *(void *)(MEMORY[0x263F8C2B0] + 16);
  std::string::size_type v18 = *(void *)(MEMORY[0x263F8C2B0] + 8);
  this[12].__r_.__value_.__r.__words[0] = v18;
  *(std::string::size_type *)((char *)this[12].__r_.__value_.__r.__words + *(void *)(v18 - 24)) = v17;
  unsigned int v19 = (std::ios_base *)((char *)&this[12] + *(void *)(this[12].__r_.__value_.__r.__words[0] - 24));
  std::ios_base::init(v19, &this[12].__r_.__value_.__r.__words[1]);
  uint64_t v20 = MEMORY[0x263F8C310] + 24;
  v19[1].__vftable = 0;
  v19[1].__fmtflags_ = -1;
  this[12].__r_.__value_.__r.__words[0] = v20;
  this[29].__r_.__value_.__l.__size_ = v16;
  MEMORY[0x237E29680](&this[12].__r_.__value_.__r.__words[1]);
  LODWORD(this[37].__r_.__value_.__r.__words[1]) = 0;
  *(_OWORD *)&this[35].__r_.__value_.__r.__words[2] = 0u;
  *(_OWORD *)&this[36].__r_.__value_.__r.__words[1] = 0u;
  *(std::string::size_type *)((char *)&this[36].__r_.__value_.__r.__words[2] + 5) = 0;
  if ((this[6].__r_.__value_.__r.__words[1] & 0x1FF) == 0) {
    goto LABEL_39;
  }
  uint64_t v21 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
  dispatch_queue_t v22 = dispatch_queue_create("com.apple.gpsd.vendor_log", v21);
  this[36].__r_.__value_.__r.__words[2] = (std::string::size_type)v22;
  if (!v22)
  {
    unint64_t v30 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)std::__split_buffer<std::string> buf = 0;
      _os_log_error_impl(&dword_237AFF000, v30, OS_LOG_TYPE_ERROR, "null fInternalWorkerQueue", buf, 2u);
      unint64_t v30 = GpsdLogObjectGeneral;
    }
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)std::__split_buffer<std::string> buf = 136446722;
      uint64_t v38 = "/Library/Caches/com.apple.xbs/Sources/CoreGPS/Sources/Daemon/GpsdVendorLogger.mm";
      __int16 v39 = 1026;
      int v40 = 174;
      __int16 v41 = 2082;
      unint64_t v42 = "VendorLogger";
      _os_log_error_impl(&dword_237AFF000, v30, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: assertion failure in %{public}s", buf, 0x1Cu);
    }
    std::string::basic_string[abi:ne180100]<0>(v35, "assert");
    std::string::basic_string[abi:ne180100]<0>(v33, "VendorLogger");
    std::string::basic_string[abi:ne180100]<0>(__p, "null fInternalWorkerQueue");
    gpsd::util::triggerDiagnosticReport((uint64_t)v35, (uint64_t)v33, (uint64_t)__p);
    if (v32 < 0) {
      operator delete(__p[0]);
    }
    if (v34 < 0) {
      operator delete(v33[0]);
    }
    if (v36 < 0) {
      operator delete(v35[0]);
    }
    __assert_rtn("VendorLogger", "GpsdVendorLogger.mm", 174, "false && \"null fInternalWorkerQueue\"");
  }
  int v23 = (id *)GpsdPreferences::instance(0);
  if (GpsdPreferences::vendorLogLz4(v23))
  {
    int v24 = 256;
LABEL_24:
    this[11].__r_.__value_.__s.__data_[12] = 1;
    LODWORD(this[11].__r_.__value_.__r.__words[1]) = v24;
    goto LABEL_25;
  }
  uint64_t v25 = (id *)GpsdPreferences::instance(0);
  if (GpsdPreferences::vendorLogLzfse(v25))
  {
    int v24 = 2049;
    goto LABEL_24;
  }
  unint64_t v26 = (id *)GpsdPreferences::instance(0);
  if (GpsdPreferences::vendorLogZlib(v26))
  {
    int v24 = 517;
    goto LABEL_24;
  }
  if (!this[11].__r_.__value_.__s.__data_[12]) {
    goto LABEL_39;
  }
LABEL_25:
  unint64_t v27 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
  {
    int v28 = this[11].__r_.__value_.__r.__words[1];
    if (v28 > 773)
    {
      if (v28 == 774)
      {
        unsigned __int8 v29 = "lzma";
        goto LABEL_38;
      }
      if (v28 == 2049)
      {
        unsigned __int8 v29 = "lzfse";
        goto LABEL_38;
      }
    }
    else
    {
      if (v28 == 256)
      {
        unsigned __int8 v29 = "lz4";
        goto LABEL_38;
      }
      if (v28 == 517)
      {
        unsigned __int8 v29 = "zlib";
LABEL_38:
        *(_DWORD *)std::__split_buffer<std::string> buf = 136446210;
        uint64_t v38 = v29;
        _os_log_impl(&dword_237AFF000, v27, OS_LOG_TYPE_INFO, "VendorLogger,compression enabled,%{public}s", buf, 0xCu);
        goto LABEL_39;
      }
    }
    unsigned __int8 v29 = "unk";
    goto LABEL_38;
  }
LABEL_39:
  VendorLogger::openNewLogFile((VendorLogger *)this);
}

void sub_237B1AC94(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  if (*(char *)(v27 + 95) < 0) {
    operator delete(*v30);
  }
  if (*(char *)(v27 + 71) < 0) {
    operator delete(*v29);
  }
  if (*(char *)(v27 + 47) < 0) {
    operator delete(*v28);
  }
  if (*(char *)(v27 + 23) < 0) {
    operator delete(*(void **)v27);
  }
  _Unwind_Resume(exception_object);
}

void VendorLogger::Config::~Config(void **this)
{
  if (*((char *)this + 119) < 0) {
    operator delete(this[12]);
  }
  if (*((char *)this + 95) < 0) {
    operator delete(this[9]);
  }
  if (*((char *)this + 71) < 0) {
    operator delete(this[6]);
  }
  if (*((char *)this + 47) < 0) {
    operator delete(this[3]);
  }
  if (*((char *)this + 23) < 0) {
    operator delete(*this);
  }
}

void sub_237B1AEA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
}

void VendorLogger::openNewLogFile(VendorLogger *this)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if ((*((_WORD *)this + 76) & 0x1FF) != 0)
  {
    VendorLogger::ensureDirectoryExists(this);
    VendorLogger::ensureLogFileIsClosed(this);
    VendorLogger::initCompression(this);
    VendorLogger::generateFilename(this, (uint64_t)&v5);
    int v2 = (void **)((char *)this + 856);
    if (*((char *)this + 879) < 0) {
      operator delete(*v2);
    }
    *(_OWORD *)int v2 = v5;
    *((void *)this + 109) = v6;
    std::ofstream::open();
    char v3 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      if (*((char *)this + 879) < 0) {
        int v2 = (void **)*v2;
      }
      LODWORD(v5) = 136446210;
      *(void *)((char *)&v5 + 4) = v2;
      _os_log_impl(&dword_237AFF000, v3, OS_LOG_TYPE_DEFAULT, "VendorLogger,opening,%{public}s", (uint8_t *)&v5, 0xCu);
    }
    if (!*((void *)this + 52))
    {
      long long v4 = GpsdLogObjectGeneral;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v5) = 0;
        _os_log_error_impl(&dword_237AFF000, v4, OS_LOG_TYPE_ERROR, "VendorLogger,failed to open", (uint8_t *)&v5, 2u);
      }
    }
    *((_DWORD *)this + 224) = 0;
    *((unsigned char *)this + 892) = 1;
  }
}

void VendorLogger::~VendorLogger(VendorLogger *this)
{
  int v2 = *((void *)this + 110);
  if (v2)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = ___ZN12VendorLoggerD2Ev_block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = this;
    dispatch_sync(v2, block);
  }
  if (*((char *)this + 879) < 0) {
    operator delete(*((void **)this + 107));
  }
  uint64_t v3 = MEMORY[0x263F8C2B0];
  uint64_t v4 = *MEMORY[0x263F8C2B0];
  *((void *)this + 36) = *MEMORY[0x263F8C2B0];
  *(void *)((char *)this + *(void *)(v4 - 24) + 288) = *(void *)(v3 + 24);
  MEMORY[0x237E29690]((char *)this + 296);
  std::ostream::~ostream();
  MEMORY[0x237E298C0]((char *)this + 704);
  long long v5 = (void *)*((void *)this + 26);
  if (v5)
  {
    *((void *)this + 27) = v5;
    operator delete(v5);
  }
  if (*((char *)this + 119) < 0) {
    operator delete(*((void **)this + 12));
  }
  if (*((char *)this + 95) < 0) {
    operator delete(*((void **)this + 9));
  }
  if (*((char *)this + 71) < 0) {
    operator delete(*((void **)this + 6));
  }
  if (*((char *)this + 47) < 0) {
    operator delete(*((void **)this + 3));
  }
  if (*((char *)this + 23) < 0) {
    operator delete(*(void **)this);
  }
}

void ___ZN12VendorLoggerD2Ev_block_invoke(uint64_t a1)
{
}

void VendorLogger::flushCompression(VendorLogger *this)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (*((unsigned char *)this + 276) && *((unsigned char *)this + 277))
  {
    int v2 = GpsdLogObjectGeneral;
    do
    {
      while (1)
      {
        char v15 = 0;
        *((void *)this + 31) = &v15;
        *((void *)this + 32) = 0;
        uint64_t v3 = *((void *)this + 26);
        uint64_t v4 = *((void *)this + 27) - v3;
        *((void *)this + 29) = v3;
        *((void *)this + 30) = v4;
        if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)std::__split_buffer<std::string> buf = 134218752;
          std::string::size_type v17 = &v15;
          __int16 v18 = 2048;
          uint64_t v19 = 0;
          __int16 v20 = 2048;
          uint64_t v21 = v3;
          __int16 v22 = 2048;
          uint64_t v23 = v4;
          _os_log_debug_impl(&dword_237AFF000, v2, OS_LOG_TYPE_DEBUG, "VendorLogger,flushCompression,before,%p,%zu,%p,%zu", buf, 0x2Au);
        }
        compression_status v5 = compression_stream_process((compression_stream *)((char *)this + 232), 1);
        if (v5 > COMPRESSION_STATUS_END)
        {
          long long v9 = GpsdLogObjectGeneral;
          if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)std::__split_buffer<std::string> buf = 0;
            _os_log_error_impl(&dword_237AFF000, v9, OS_LOG_TYPE_ERROR, "VendorLogger,flushCompression,failed to finalize stream", buf, 2u);
          }
        }
        else
        {
          uint64_t v6 = *((void *)this + 27) - *((void *)this + 26);
          uint64_t v7 = *((void *)this + 30);
          uint64_t v8 = GpsdLogObjectGeneral;
          if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)std::__split_buffer<std::string> buf = 134217984;
            std::string::size_type v17 = (char *)(v6 - v7);
            _os_log_debug_impl(&dword_237AFF000, v8, OS_LOG_TYPE_DEBUG, "VendorLogger,flushCompression,flushed bytes,%zu", buf, 0xCu);
          }
          if (v6 != v7) {
            std::ostream::write();
          }
        }
        int v2 = GpsdLogObjectGeneral;
        if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG)) {
          break;
        }
        if (v5) {
          goto LABEL_17;
        }
      }
      long long v10 = (char *)*((void *)this + 31);
      uint64_t v11 = *((void *)this + 32);
      uint64_t v12 = *((void *)this + 29);
      uint64_t v13 = *((void *)this + 30);
      *(_DWORD *)std::__split_buffer<std::string> buf = 134219008;
      std::string::size_type v17 = v10;
      __int16 v18 = 2048;
      uint64_t v19 = v11;
      __int16 v20 = 2048;
      uint64_t v21 = v12;
      __int16 v22 = 2048;
      uint64_t v23 = v13;
      __int16 v24 = 1024;
      compression_status v25 = v5;
      _os_log_debug_impl(&dword_237AFF000, v2, OS_LOG_TYPE_DEBUG, "VendorLogger,flushCompression,after,%p,%zu,%p,%zu,status,%d", buf, 0x30u);
      int v2 = GpsdLogObjectGeneral;
    }
    while (v5 == COMPRESSION_STATUS_OK);
LABEL_17:
    *((unsigned char *)this + 277) = 0;
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)std::__split_buffer<std::string> buf = 0;
      _os_log_debug_impl(&dword_237AFF000, v2, OS_LOG_TYPE_DEBUG, "VendorLogger,flushCompression,destroying", buf, 2u);
    }
    if (compression_stream_destroy((compression_stream *)((char *)this + 232)))
    {
      long long v14 = GpsdLogObjectGeneral;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)std::__split_buffer<std::string> buf = 0;
        _os_log_error_impl(&dword_237AFF000, v14, OS_LOG_TYPE_ERROR, "VendorLogger,flushCompression,failed to destroy stream", buf, 2u);
      }
    }
  }
}

uint64_t std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(uint64_t a1, const void **a2, const void **a3)
{
  if (*((char *)a2 + 23) >= 0) {
    size_t v5 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    size_t v5 = (size_t)a2[1];
  }
  if (*((char *)a3 + 23) >= 0) {
    size_t v6 = *((unsigned __int8 *)a3 + 23);
  }
  else {
    size_t v6 = (size_t)a3[1];
  }
  uint64_t result = std::string::basic_string[abi:ne180100](a1, v6 + v5);
  if (*(char *)(result + 23) >= 0) {
    uint64_t v8 = (char *)result;
  }
  else {
    uint64_t v8 = *(char **)result;
  }
  if (v5)
  {
    if (*((char *)a2 + 23) >= 0) {
      long long v9 = a2;
    }
    else {
      long long v9 = *a2;
    }
    uint64_t result = (uint64_t)memmove(v8, v9, v5);
  }
  long long v10 = &v8[v5];
  if (v6)
  {
    if (*((char *)a3 + 23) >= 0) {
      uint64_t v11 = a3;
    }
    else {
      uint64_t v11 = *a3;
    }
    uint64_t result = (uint64_t)memmove(v10, v11, v6);
  }
  v10[v6] = 0;
  return result;
}

void VendorLogger::pruneLogFiles(VendorLogger *this)
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  if (clock_gettime(_CLOCK_REALTIME, &__tp))
  {
    uint64_t v1 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      int v45 = *__error();
      LODWORD(v58.__r_.__value_.__l.__data_) = 67240192;
      HIDWORD(v58.__r_.__value_.__r.__words[0]) = v45;
      _os_log_error_impl(&dword_237AFF000, v1, OS_LOG_TYPE_ERROR, "VendorLogger,pruneLogFiles,clock_gettime failed,%{public}d", (uint8_t *)&v58, 8u);
    }
  }
  __darwin_time_t tv_sec = __tp.tv_sec;
  double v3 = (double)__tp.tv_sec;
  double v4 = *((double *)this + 15);
  if (v4 >= (double)__tp.tv_sec)
  {
    size_t v5 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v58.__r_.__value_.__l.__data_) = 134349056;
      *(std::string::size_type *)((char *)v58.__r_.__value_.__r.__words + 4) = tv_sec;
      _os_log_error_impl(&dword_237AFF000, v5, OS_LOG_TYPE_ERROR, "VendorLogger,pruneLogFiles,timespecNow too small to use,%{public}ld", (uint8_t *)&v58, 0xCu);
      double v4 = *((double *)this + 15);
    }
  }
  size_t v6 = (id *)GpsdPreferences::instance(0);
  GpsdPreferences::vendorLogDirectory(v6, &v54);
  if ((char)v56 < 0)
  {
    if (v55)
    {
      uint64_t v51 = 0;
      unint64_t v52 = 0;
      uint64_t v53 = 0;
      uint64_t v7 = v54;
      goto LABEL_12;
    }
LABEL_90:
    unsigned __int8 v44 = GpsdLogObjectWarning;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectWarning, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v58.__r_.__value_.__l.__data_) = 0;
      _os_log_impl(&dword_237AFF000, v44, OS_LOG_TYPE_DEFAULT, "VendorLogger.pruneLogFiles: null path, cannot delete old logs", (uint8_t *)&v58, 2u);
    }
    goto LABEL_92;
  }
  if (!v56) {
    goto LABEL_90;
  }
  uint64_t v51 = 0;
  unint64_t v52 = 0;
  uint64_t v7 = &v54;
  uint64_t v53 = 0;
LABEL_12:
  VendorLogger::enumerateFiles((uint64_t)v7, (const void **)this, (uint64_t *)&v51);
  unint64_t v8 = 126 - 2 * __clz(0xAAAAAAAAAAAAAAABLL * (v52 - v51));
  if (v52 == v51) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = v8;
  }
  std::__introsort<std::_ClassicAlgPolicy,std::greater<void> &,std::string *,false>((unint64_t)v51, v52, v9, 1);
  uint64_t v49 = 0;
  long long v10 = v51;
  uint64_t v11 = v52;
  if (v51 != v52)
  {
    int v12 = 0;
    uint64_t v13 = 0;
    while (1)
    {
      if ((v56 & 0x80u) == 0) {
        size_t v14 = v56;
      }
      else {
        size_t v14 = v55;
      }
      std::string::basic_string[abi:ne180100]((uint64_t)&v58, v14 + 1);
      if ((v58.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        char v15 = &v58;
      }
      else {
        char v15 = (std::string *)v58.__r_.__value_.__r.__words[0];
      }
      if (v14)
      {
        if ((v56 & 0x80u) == 0) {
          std::string::size_type v16 = &v54;
        }
        else {
          std::string::size_type v16 = v54;
        }
        memmove(v15, v16, v14);
      }
      *(_WORD *)((char *)&v15->__r_.__value_.__l.__data_ + v14) = 47;
      int v17 = *((char *)v10 + 23);
      if (v17 >= 0) {
        __int16 v18 = (const std::string::value_type *)v10;
      }
      else {
        __int16 v18 = (const std::string::value_type *)*v10;
      }
      if (v17 >= 0) {
        std::string::size_type v19 = *((unsigned __int8 *)v10 + 23);
      }
      else {
        std::string::size_type v19 = (std::string::size_type)v10[1];
      }
      __int16 v20 = std::string::append(&v58, v18, v19);
      long long v21 = *(_OWORD *)&v20->__r_.__value_.__l.__data_;
      int64_t v48 = v20->__r_.__value_.__r.__words[2];
      *(_OWORD *)std::string __p = v21;
      v20->__r_.__value_.__l.__size_ = 0;
      v20->__r_.__value_.__r.__words[2] = 0;
      v20->__r_.__value_.__r.__words[0] = 0;
      if (SHIBYTE(v58.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v58.__r_.__value_.__l.__data_);
      }
      if (v48 >= 0) {
        __int16 v22 = __p;
      }
      else {
        __int16 v22 = (void **)__p[0];
      }
      if (!getFileModificationTimeAndSize((const char *)v22, &v50, &v49)) {
        goto LABEL_76;
      }
      uint64_t v23 = v49;
      uint64_t v24 = v49 + v13;
      compression_status v25 = GpsdLogObjectGeneral;
      BOOL v26 = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG);
      __darwin_time_t v27 = v50.tv_sec;
      if (v26)
      {
        if (v48 >= 0) {
          unint64_t v42 = __p;
        }
        else {
          unint64_t v42 = (void **)__p[0];
        }
        LODWORD(v58.__r_.__value_.__l.__data_) = 136316162;
        *(std::string::size_type *)((char *)v58.__r_.__value_.__r.__words + 4) = (std::string::size_type)v42;
        WORD2(v58.__r_.__value_.__r.__words[1]) = 2048;
        *(std::string::size_type *)((char *)&v58.__r_.__value_.__r.__words[1] + 6) = v50.tv_sec;
        HIWORD(v58.__r_.__value_.__r.__words[2]) = 2048;
        uint64_t v59 = (uint64_t)(v3 - v4);
        __int16 v60 = 2048;
        uint64_t v61 = v23;
        __int16 v62 = 2048;
        uint64_t v63 = v24;
        _os_log_debug_impl(&dword_237AFF000, v25, OS_LOG_TYPE_DEBUG, "VendorLogger,pruneLogFiles,looking at,%s,modTime,%ld,floorTime,%ld,size,%lld,new total,%lld", (uint8_t *)&v58, 0x34u);
      }
      if (v27 < (uint64_t)(v3 - v4))
      {
        if (v48 >= 0) {
          int v28 = __p;
        }
        else {
          int v28 = (void **)__p[0];
        }
        deleteFile((const char *)v28);
        uint64_t v29 = GpsdLogObjectGeneral;
        if (!os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_75;
        }
        if (v48 >= 0) {
          unint64_t v30 = __p;
        }
        else {
          unint64_t v30 = (void **)__p[0];
        }
        LODWORD(v58.__r_.__value_.__l.__data_) = 136315650;
        *(std::string::size_type *)((char *)v58.__r_.__value_.__r.__words + 4) = (std::string::size_type)v30;
        WORD2(v58.__r_.__value_.__r.__words[1]) = 2048;
        *(std::string::size_type *)((char *)&v58.__r_.__value_.__r.__words[1] + 6) = v27;
        HIWORD(v58.__r_.__value_.__r.__words[2]) = 2048;
        uint64_t v59 = (uint64_t)(v3 - v4);
        int v31 = v29;
        char v32 = "VendorLogger,pruneLogFiles,deleted due to age,%s,fileTime,%ld,targetTime,%ld";
        uint32_t v33 = 32;
        goto LABEL_74;
      }
      if (v12 >= *((_DWORD *)this + 36)) {
        break;
      }
      if (!v23)
      {
        if (v48 >= 0) {
          __int16 v39 = __p;
        }
        else {
          __int16 v39 = (void **)__p[0];
        }
        deleteFile((const char *)v39);
        uint64_t v40 = GpsdLogObjectGeneral;
        if (!os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_75;
        }
        if (v48 >= 0) {
          __int16 v41 = __p;
        }
        else {
          __int16 v41 = (void **)__p[0];
        }
        LODWORD(v58.__r_.__value_.__l.__data_) = 136315138;
        *(std::string::size_type *)((char *)v58.__r_.__value_.__r.__words + 4) = (std::string::size_type)v41;
        int v31 = v40;
        char v32 = "VendorLogger,pruneLogFiles,deleted due to zero size,%s";
        uint32_t v33 = 12;
        goto LABEL_74;
      }
      if (v24 <= *((void *)this + 17))
      {
        uint64_t v13 = v24;
        ++v12;
        goto LABEL_76;
      }
      if (v48 >= 0) {
        char v34 = __p;
      }
      else {
        char v34 = (void **)__p[0];
      }
      deleteFile((const char *)v34);
      long long v35 = GpsdLogObjectGeneral;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG))
      {
        if (v48 >= 0) {
          uint64_t v43 = __p;
        }
        else {
          uint64_t v43 = (void **)__p[0];
        }
        LODWORD(v58.__r_.__value_.__l.__data_) = 136315138;
        *(std::string::size_type *)((char *)v58.__r_.__value_.__r.__words + 4) = (std::string::size_type)v43;
        _os_log_debug_impl(&dword_237AFF000, v35, OS_LOG_TYPE_DEBUG, "VendorLogger,pruneLogFiles,deleted due to size,%s", (uint8_t *)&v58, 0xCu);
      }
      uint64_t v13 = v24;
LABEL_75:
      ++v12;
LABEL_76:
      if (SHIBYTE(v48) < 0) {
        operator delete(__p[0]);
      }
      v10 += 3;
      if (v10 == v11) {
        goto LABEL_89;
      }
    }
    if (v48 >= 0) {
      char v36 = __p;
    }
    else {
      char v36 = (void **)__p[0];
    }
    deleteFile((const char *)v36);
    uint64_t v37 = GpsdLogObjectGeneral;
    if (!os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_75;
    }
    if (v48 >= 0) {
      uint64_t v38 = __p;
    }
    else {
      uint64_t v38 = (void **)__p[0];
    }
    LODWORD(v58.__r_.__value_.__l.__data_) = 136315394;
    *(std::string::size_type *)((char *)v58.__r_.__value_.__r.__words + 4) = (std::string::size_type)v38;
    WORD2(v58.__r_.__value_.__r.__words[1]) = 1024;
    *(_DWORD *)((char *)&v58.__r_.__value_.__r.__words[1] + 6) = v12 + 1;
    int v31 = v37;
    char v32 = "VendorLogger,pruneLogFiles,deleted due to num files,%s,num files,%d";
    uint32_t v33 = 18;
LABEL_74:
    _os_log_debug_impl(&dword_237AFF000, v31, OS_LOG_TYPE_DEBUG, v32, (uint8_t *)&v58, v33);
    goto LABEL_75;
  }
LABEL_89:
  v58.__r_.__value_.__r.__words[0] = (std::string::size_type)&v51;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v58);
LABEL_92:
  if ((char)v56 < 0) {
    operator delete(v54);
  }
}

void sub_237B1BC34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,int a21,__int16 a22,char a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,void *__p,uint64_t a33,int a34,__int16 a35,char a36,char a37)
{
  *(void *)(v37 - 176) = &a29;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)(v37 - 176));
  if (a37 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

uint64_t VendorLogger::isLogFileOpen(VendorLogger *this)
{
  return *((unsigned __int8 *)this + 892);
}

void VendorLogger::ensureLogFileIsOpen(VendorLogger *this)
{
  if (!*((unsigned char *)this + 892) && (*((_WORD *)this + 76) & 0x1FF) != 0) {
    VendorLogger::openNewLogFile(this);
  }
}

void VendorLogger::ensureLogFileIsClosed(VendorLogger *this)
{
  if (*((unsigned char *)this + 892))
  {
    VendorLogger::closeLogFile(this);
    VendorLogger::pruneLogFiles(this);
  }
}

void VendorLogger::ensureDirectoryExists(VendorLogger *this)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if ((*((_WORD *)this + 76) & 0x1FF) != 0)
  {
    int v2 = (char *)this + 96;
    int v3 = *((char *)this + 119);
    double v4 = (char *)this + 96;
    if (v3 < 0) {
      double v4 = *(const char **)v2;
    }
    if (mkdir(v4, 0x1F8u))
    {
      int v5 = *__error();
      if (v5 != 17)
      {
        uint64_t v13 = GpsdLogObjectGeneral;
        if (!os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR)) {
          return;
        }
        if (*((char *)this + 119) < 0) {
          int v2 = *(const char **)v2;
        }
        int v14 = 136446466;
        char v15 = v2;
        __int16 v16 = 1026;
        int v17 = v5;
        uint64_t v9 = "VendorLogger,could not create directory,%{public}s,%{public}d";
        long long v10 = v13;
        uint32_t v11 = 18;
        goto LABEL_19;
      }
      if (*((char *)this + 119) < 0) {
        int v2 = *(const char **)v2;
      }
      int v6 = chmod(v2, 0x1F8u);
      uint64_t v7 = GpsdLogObjectGeneral;
      if (v6)
      {
        if (!os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR)) {
          return;
        }
        int v8 = *__error();
        int v14 = 67240192;
        LODWORD(v15) = v8;
        uint64_t v9 = "VendorLogger,chmod failed,%{public}d";
        long long v10 = v7;
        uint32_t v11 = 8;
LABEL_19:
        _os_log_error_impl(&dword_237AFF000, v10, OS_LOG_TYPE_ERROR, v9, (uint8_t *)&v14, v11);
        return;
      }
      if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG))
      {
        int v14 = 67109120;
        LODWORD(v15) = 504;
        _os_log_debug_impl(&dword_237AFF000, v7, OS_LOG_TYPE_DEBUG, "VendorLogger,directory exists,permissions,%x", (uint8_t *)&v14, 8u);
      }
    }
    else
    {
      int v12 = GpsdLogObjectGeneral;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
      {
        if (*((char *)this + 119) < 0) {
          int v2 = *(const char **)v2;
        }
        int v14 = 136446466;
        char v15 = v2;
        __int16 v16 = 1024;
        int v17 = 504;
        _os_log_impl(&dword_237AFF000, v12, OS_LOG_TYPE_INFO, "VendorLogger,created directory,%{public}s,permissions,%x", (uint8_t *)&v14, 0x12u);
      }
    }
  }
}

void VendorLogger::initCompression(VendorLogger *this)
{
  if (*((unsigned char *)this + 276))
  {
    *((void *)this + 35) = 0;
    uint64_t v2 = *((void *)this + 26);
    unint64_t v3 = *((void *)this + 27) - v2;
    if (v3 >> 15)
    {
      if (v3 != 0x8000) {
        *((void *)this + 27) = v2 + 0x8000;
      }
    }
    else
    {
      std::vector<unsigned char>::__append((unint64_t *)this + 26, 0x8000 - v3);
    }
    double v4 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)std::__split_buffer<std::string> buf = 0;
      _os_log_debug_impl(&dword_237AFF000, v4, OS_LOG_TYPE_DEBUG, "VendorLogger,initCompression", buf, 2u);
    }
    if (compression_stream_init((compression_stream *)((char *)this + 232), COMPRESSION_STREAM_ENCODE, *((compression_algorithm *)this + 68)))
    {
      int v5 = GpsdLogObjectGeneral;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)int v6 = 0;
        _os_log_error_impl(&dword_237AFF000, v5, OS_LOG_TYPE_ERROR, "VendorLogger,initCompression,Could not init stream", v6, 2u);
      }
      *((unsigned char *)this + 276) = 0;
      *((void *)this + 27) = *((void *)this + 26);
    }
    else
    {
      *((unsigned char *)this + 277) = 1;
    }
  }
}

void VendorLogger::generateFilename(VendorLogger *this@<X0>, uint64_t a2@<X8>)
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  snprintf(__str, 8uLL, "%03d", *((_DWORD *)this + 222));
  ++*((_DWORD *)this + 222);
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)a2 = 0;
  VendorLogger::isoTimestampString(v51);
  std::string::basic_string[abi:ne180100]<0>(v49, __str);
  if (*(_DWORD *)(GpsdPreferences::instance(0) + 8) == 3)
  {
    MEMORY[0x237E295A0](v51, "unittest");
    MEMORY[0x237E295A0](v49, "000");
  }
  if (*((char *)this + 119) >= 0) {
    size_t v4 = *((unsigned __int8 *)this + 119);
  }
  else {
    size_t v4 = *((void *)this + 13);
  }
  int v5 = &v42;
  std::string::basic_string[abi:ne180100]((uint64_t)&v42, v4 + 1);
  if ((v42.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    int v5 = (std::string *)v42.__r_.__value_.__r.__words[0];
  }
  if (v4)
  {
    if (*((char *)this + 119) >= 0) {
      int v6 = (char *)this + 96;
    }
    else {
      int v6 = (char *)*((void *)this + 12);
    }
    memmove(v5, v6, v4);
  }
  *(_WORD *)((char *)&v5->__r_.__value_.__l.__data_ + v4) = 47;
  int v7 = *((char *)this + 23);
  if (v7 >= 0) {
    int v8 = (const std::string::value_type *)this;
  }
  else {
    int v8 = *(const std::string::value_type **)this;
  }
  if (v7 >= 0) {
    std::string::size_type v9 = *((unsigned __int8 *)this + 23);
  }
  else {
    std::string::size_type v9 = *((void *)this + 1);
  }
  long long v10 = std::string::append(&v42, v8, v9);
  long long v11 = *(_OWORD *)&v10->__r_.__value_.__l.__data_;
  v43.__r_.__value_.__r.__words[2] = v10->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v43.__r_.__value_.__l.__data_ = v11;
  v10->__r_.__value_.__l.__size_ = 0;
  v10->__r_.__value_.__r.__words[2] = 0;
  v10->__r_.__value_.__r.__words[0] = 0;
  if ((v52 & 0x80u) == 0) {
    int v12 = (const std::string::value_type *)v51;
  }
  else {
    int v12 = (const std::string::value_type *)v51[0];
  }
  if ((v52 & 0x80u) == 0) {
    std::string::size_type v13 = v52;
  }
  else {
    std::string::size_type v13 = (std::string::size_type)v51[1];
  }
  int v14 = std::string::append(&v43, v12, v13);
  long long v15 = *(_OWORD *)&v14->__r_.__value_.__l.__data_;
  v44.__r_.__value_.__r.__words[2] = v14->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v44.__r_.__value_.__l.__data_ = v15;
  v14->__r_.__value_.__l.__size_ = 0;
  v14->__r_.__value_.__r.__words[2] = 0;
  v14->__r_.__value_.__r.__words[0] = 0;
  __int16 v16 = std::string::append(&v44, "_");
  long long v17 = *(_OWORD *)&v16->__r_.__value_.__l.__data_;
  v45.__r_.__value_.__r.__words[2] = v16->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v45.__r_.__value_.__l.__data_ = v17;
  v16->__r_.__value_.__l.__size_ = 0;
  v16->__r_.__value_.__r.__words[2] = 0;
  v16->__r_.__value_.__r.__words[0] = 0;
  if (v50 >= 0) {
    uint64_t v18 = (char *)v49;
  }
  else {
    uint64_t v18 = (char *)v49[0];
  }
  std::string::basic_string[abi:ne180100]<0>(__p, v18);
  if ((v41 & 0x80u) == 0) {
    std::string::size_type v19 = __p;
  }
  else {
    std::string::size_type v19 = (void **)__p[0];
  }
  if ((v41 & 0x80u) == 0) {
    std::string::size_type v20 = v41;
  }
  else {
    std::string::size_type v20 = (std::string::size_type)__p[1];
  }
  long long v21 = std::string::append(&v45, (const std::string::value_type *)v19, v20);
  long long v22 = *(_OWORD *)&v21->__r_.__value_.__l.__data_;
  v46.__r_.__value_.__r.__words[2] = v21->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v46.__r_.__value_.__l.__data_ = v22;
  v21->__r_.__value_.__l.__size_ = 0;
  v21->__r_.__value_.__r.__words[2] = 0;
  v21->__r_.__value_.__r.__words[0] = 0;
  uint64_t v23 = std::string::append(&v46, ".");
  long long v24 = *(_OWORD *)&v23->__r_.__value_.__l.__data_;
  v47.__r_.__value_.__r.__words[2] = v23->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v47.__r_.__value_.__l.__data_ = v24;
  v23->__r_.__value_.__l.__size_ = 0;
  v23->__r_.__value_.__r.__words[2] = 0;
  v23->__r_.__value_.__r.__words[0] = 0;
  int v25 = *((char *)this + 47);
  if (v25 >= 0) {
    BOOL v26 = (char *)this + 24;
  }
  else {
    BOOL v26 = (const std::string::value_type *)*((void *)this + 3);
  }
  if (v25 >= 0) {
    std::string::size_type v27 = *((unsigned __int8 *)this + 47);
  }
  else {
    std::string::size_type v27 = *((void *)this + 4);
  }
  int v28 = std::string::append(&v47, v26, v27);
  long long v29 = *(_OWORD *)&v28->__r_.__value_.__l.__data_;
  v48.__r_.__value_.__r.__words[2] = v28->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v48.__r_.__value_.__l.__data_ = v29;
  v28->__r_.__value_.__l.__size_ = 0;
  v28->__r_.__value_.__r.__words[2] = 0;
  v28->__r_.__value_.__r.__words[0] = 0;
  int v30 = *((char *)this + 95);
  if (v30 >= 0) {
    int v31 = (char *)this + 72;
  }
  else {
    int v31 = (const std::string::value_type *)*((void *)this + 9);
  }
  if (v30 >= 0) {
    std::string::size_type v32 = *((unsigned __int8 *)this + 95);
  }
  else {
    std::string::size_type v32 = *((void *)this + 10);
  }
  uint32_t v33 = std::string::append(&v48, v31, v32);
  std::string::size_type v34 = v33->__r_.__value_.__r.__words[0];
  v53[0] = v33->__r_.__value_.__l.__size_;
  *(void *)((char *)v53 + 7) = *(std::string::size_type *)((char *)&v33->__r_.__value_.__r.__words[1] + 7);
  char v35 = HIBYTE(v33->__r_.__value_.__r.__words[2]);
  v33->__r_.__value_.__l.__size_ = 0;
  v33->__r_.__value_.__r.__words[2] = 0;
  v33->__r_.__value_.__r.__words[0] = 0;
  int v36 = SHIBYTE(v48.__r_.__value_.__r.__words[2]);
  *(void *)(a2 + 15) = *(void *)((char *)v53 + 7);
  uint64_t v37 = v53[0];
  *(void *)a2 = v34;
  *(void *)(a2 + 8) = v37;
  *(unsigned char *)(a2 + 23) = v35;
  if (v36 < 0) {
    operator delete(v48.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v47.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v47.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v46.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v46.__r_.__value_.__l.__data_);
  }
  if ((char)v41 < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v45.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v45.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v44.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v44.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v43.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v43.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v42.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v42.__r_.__value_.__l.__data_);
  }
  if (*((unsigned char *)this + 276))
  {
    std::string::append((std::string *)a2, ".");
    int v38 = *((_DWORD *)this + 68);
    if (v38 > 773)
    {
      if (v38 == 774)
      {
        __int16 v39 = "lzma";
        goto LABEL_73;
      }
      if (v38 == 2049)
      {
        __int16 v39 = "lzfse";
        goto LABEL_73;
      }
    }
    else
    {
      if (v38 == 256)
      {
        __int16 v39 = "lz4";
        goto LABEL_73;
      }
      if (v38 == 517)
      {
        __int16 v39 = "zlib";
LABEL_73:
        std::string::append((std::string *)a2, v39);
        goto LABEL_74;
      }
    }
    __int16 v39 = "unk";
    goto LABEL_73;
  }
LABEL_74:
  if (v50 < 0) {
    operator delete(v49[0]);
  }
  if ((char)v52 < 0) {
    operator delete(v51[0]);
  }
}

void sub_237B1C484(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28,uint64_t a29,void *a30,uint64_t a31,int a32,__int16 a33,char a34,char a35,uint64_t a36,void *a37,uint64_t a38,int a39,__int16 a40,char a41,char a42,uint64_t a43,void *a44,uint64_t a45,int a46,__int16 a47,char a48,char a49,uint64_t a50,void *__p,uint64_t a52,int a53,__int16 a54,char a55,char a56)
{
  if (*(char *)(v57 - 137) < 0) {
    operator delete(*(void **)(v57 - 160));
  }
  if (a56 < 0) {
    operator delete(__p);
  }
  if (a49 < 0) {
    operator delete(a44);
  }
  if (a16 < 0) {
    operator delete(a11);
  }
  if (a42 < 0) {
    operator delete(a37);
  }
  if (a35 < 0) {
    operator delete(a30);
  }
  if (a28 < 0) {
    operator delete(a23);
  }
  if (a22 < 0) {
    operator delete(a17);
  }
  if (*(char *)(v57 - 105) < 0) {
    operator delete(*(void **)(v57 - 128));
  }
  if (*(char *)(v57 - 81) < 0) {
    operator delete(*(void **)(v57 - 104));
  }
  if (*(char *)(v56 + 23) < 0) {
    operator delete(*(void **)v56);
  }
  _Unwind_Resume(exception_object);
}

void VendorLogger::notifyStart(VendorLogger *this)
{
  uint64_t v2 = *((void *)this + 110);
  if (v2)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = ___ZN12VendorLogger11notifyStartEv_block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = this;
    dispatch_async(v2, block);
  }
}

void ___ZN12VendorLogger11notifyStartEv_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v3 = (void *)(v1 + 856);
    if (*(char *)(v1 + 879) < 0) {
      unint64_t v3 = (void *)*v3;
    }
    int v4 = 136446210;
    int v5 = v3;
    _os_log_impl(&dword_237AFF000, v2, OS_LOG_TYPE_DEFAULT, "VendorLogger,notifyStart,activeFilename,%{public}s", (uint8_t *)&v4, 0xCu);
  }
  if (!*(unsigned char *)(v1 + 892) && (*(_WORD *)(v1 + 152) & 0x1FF) != 0) {
    VendorLogger::openNewLogFile((VendorLogger *)v1);
  }
}

void VendorLogger::notifyStop(VendorLogger *this)
{
  uint64_t v1 = *((void *)this + 110);
  if (v1)
  {
    unint64_t v3 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)std::__split_buffer<std::string> buf = 0;
      _os_log_impl(&dword_237AFF000, v3, OS_LOG_TYPE_INFO, "VendorLogger,notifyStop,received", buf, 2u);
      uint64_t v1 = *((void *)this + 110);
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = ___ZN12VendorLogger10notifyStopEv_block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = this;
    dispatch_sync(v1, block);
  }
}

void ___ZN12VendorLogger10notifyStopEv_block_invoke(uint64_t a1)
{
}

void VendorLogger::flush(VendorLogger *this)
{
  uint64_t v1 = *((void *)this + 110);
  if (v1)
  {
    unint64_t v3 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)std::__split_buffer<std::string> buf = 0;
      _os_log_impl(&dword_237AFF000, v3, OS_LOG_TYPE_DEFAULT, "VendorLogger,flush,received", buf, 2u);
      uint64_t v1 = *((void *)this + 110);
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = ___ZN12VendorLogger5flushEv_block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = this;
    dispatch_sync(v1, block);
  }
}

uint64_t ___ZN12VendorLogger5flushEv_block_invoke(uint64_t result)
{
  uint64_t v1 = *(VendorLogger **)(result + 32);
  if ((*((_WORD *)v1 + 76) & 0x1FF) != 0)
  {
    VendorLogger::flushCompression(*(VendorLogger **)(result + 32));
    VendorLogger::initCompression(v1);
    return std::ostream::flush();
  }
  return result;
}

void VendorLogger::prepareForTermination(VendorLogger *this)
{
  uint64_t v1 = *((void *)this + 110);
  if (v1)
  {
    unint64_t v3 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)std::__split_buffer<std::string> buf = 0;
      _os_log_impl(&dword_237AFF000, v3, OS_LOG_TYPE_DEFAULT, "VendorLogger,prepareForTermination,received", buf, 2u);
      uint64_t v1 = *((void *)this + 110);
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = ___ZN12VendorLogger21prepareForTerminationEv_block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = this;
    dispatch_sync(v1, block);
  }
}

void ___ZN12VendorLogger21prepareForTerminationEv_block_invoke(uint64_t a1)
{
}

void VendorLogger::restart(VendorLogger *this)
{
  VendorLogger::notifyStop(this);
  VendorLogger::notifyStart(this);
}

uint64_t fillPrefixBufferWithTimestamp(char *a1, double a2)
{
  return snprintf(a1, 0x10uLL, "%.3f,", a2);
}

void VendorLogger::log(uint64_t a1, unsigned int a2, std::string::value_type *a3)
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  double v6 = (double)gpsd::util::getMachContinuousTimeNs((gpsd::util *)a1) * 0.000000001;
  switch(*(_DWORD *)(a1 + 4 * a2 + 160))
  {
    case 0:
      int v7 = *(unsigned __int8 *)(a1 + 196);
      uint64_t v8 = GpsdLogObjectDevice;
      BOOL v9 = os_log_type_enabled((os_log_t)GpsdLogObjectDevice, OS_LOG_TYPE_FAULT);
      if (v7)
      {
        if (!v9) {
          goto LABEL_34;
        }
        if (a3[23] >= 0) {
          long long v10 = a3;
        }
        else {
          long long v10 = *(const std::string::value_type **)a3;
        }
        *(_DWORD *)std::__split_buffer<std::string> buf = 134349315;
        *(double *)&uint8_t buf[4] = v6;
        *(_WORD *)&buf[12] = 2081;
        *(void *)&buf[14] = v10;
        long long v11 = "%{public}.3f,%{private}s";
        int v12 = v8;
        uint32_t v13 = 22;
      }
      else
      {
        if (!v9) {
          goto LABEL_34;
        }
        if (a3[23] >= 0) {
          std::string v47 = a3;
        }
        else {
          std::string v47 = *(std::string::value_type **)a3;
        }
        *(_DWORD *)std::__split_buffer<std::string> buf = 136380675;
        *(void *)&uint8_t buf[4] = v47;
        long long v11 = "%{private}s";
        int v12 = v8;
        uint32_t v13 = 12;
      }
      _os_log_fault_impl(&dword_237AFF000, v12, OS_LOG_TYPE_FAULT, v11, buf, v13);
LABEL_34:
      std::string::basic_string[abi:ne180100]<0>(buf, "Vendor");
      std::string::basic_string[abi:ne180100]<0>(v51, "assert");
      if (a3[23] < 0)
      {
        std::string::__init_copy_ctor_external((std::string *)&v52[8], *(const std::string::value_type **)a3, *((void *)a3 + 1));
      }
      else
      {
        *(_OWORD *)&v52[8] = *(_OWORD *)a3;
        *(void *)&v52[24] = *((void *)a3 + 2);
      }
      char v53 = 1;
      gpsd::util::triggerDiagnosticReport((gpsd::util *)buf, v40);
      if ((v52[31] & 0x80000000) != 0) {
        operator delete(*(void **)&v52[8]);
      }
      if ((v52[7] & 0x80000000) != 0) {
        operator delete(v51[0]);
      }
      if ((buf[23] & 0x80000000) != 0) {
        operator delete(*(void **)buf);
      }
LABEL_67:
      if (*(void *)(a1 + 880))
      {
        *(void *)std::__split_buffer<std::string> buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&uint8_t buf[16] = 0x4812000000;
        v51[0] = __Block_byref_object_copy__0;
        v51[1] = __Block_byref_object_dispose__0;
        *(_OWORD *)&v52[16] = 0u;
        *(_OWORD *)unsigned __int8 v52 = 0u;
        long long v45 = *(_OWORD *)&v52[8];
        *(void *)&v52[24] = *((void *)a3 + 2);
        *(_OWORD *)&v52[8] = *(_OWORD *)a3;
        *(_OWORD *)a3 = v45;
        *((void *)a3 + 2) = 0;
        std::string v46 = *(NSObject **)(a1 + 880);
        v48[0] = MEMORY[0x263EF8330];
        v48[1] = 3221225472;
        v48[2] = ___ZN12VendorLogger3logEN7GnssHal8LogLevelERKNSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEE_block_invoke;
        v48[3] = &unk_264CF01F0;
        v48[4] = buf;
        v48[5] = a1;
        *(double *)&v48[6] = v6;
        unsigned int v49 = a2;
        dispatch_async(v46, v48);
        _Block_object_dispose(buf, 8);
        if ((v52[31] & 0x80000000) != 0) {
          operator delete(*(void **)&v52[8]);
        }
      }
      return;
    case 1:
      int v14 = *(unsigned __int8 *)(a1 + 196);
      uint64_t v15 = GpsdLogObjectDevice;
      BOOL v16 = os_log_type_enabled((os_log_t)GpsdLogObjectDevice, OS_LOG_TYPE_ERROR);
      if (v14)
      {
        if (!v16) {
          goto LABEL_67;
        }
        if (a3[23] >= 0) {
          long long v17 = a3;
        }
        else {
          long long v17 = *(const std::string::value_type **)a3;
        }
        *(_DWORD *)std::__split_buffer<std::string> buf = 134349315;
        *(double *)&uint8_t buf[4] = v6;
        *(_WORD *)&buf[12] = 2081;
        *(void *)&buf[14] = v17;
        uint64_t v18 = "%{public}.3f,%{private}s";
        std::string::size_type v19 = v15;
        uint32_t v20 = 22;
      }
      else
      {
        if (!v16) {
          goto LABEL_67;
        }
        if (a3[23] >= 0) {
          unsigned __int8 v41 = a3;
        }
        else {
          unsigned __int8 v41 = *(const std::string::value_type **)a3;
        }
        *(_DWORD *)std::__split_buffer<std::string> buf = 136380675;
        *(void *)&uint8_t buf[4] = v41;
        uint64_t v18 = "%{private}s";
        std::string::size_type v19 = v15;
        uint32_t v20 = 12;
      }
      _os_log_error_impl(&dword_237AFF000, v19, OS_LOG_TYPE_ERROR, v18, buf, v20);
      goto LABEL_67;
    case 2:
      int v21 = *(unsigned __int8 *)(a1 + 196);
      uint64_t v22 = GpsdLogObjectDevice;
      BOOL v23 = os_log_type_enabled((os_log_t)GpsdLogObjectDevice, OS_LOG_TYPE_DEFAULT);
      if (v21)
      {
        if (v23)
        {
          if (a3[23] >= 0) {
            long long v24 = a3;
          }
          else {
            long long v24 = *(const std::string::value_type **)a3;
          }
          *(_DWORD *)std::__split_buffer<std::string> buf = 134349315;
          *(double *)&uint8_t buf[4] = v6;
          *(_WORD *)&buf[12] = 2081;
          *(void *)&buf[14] = v24;
          int v25 = "%{public}.3f,%{private}s";
          BOOL v26 = v22;
          os_log_type_t v27 = OS_LOG_TYPE_DEFAULT;
          goto LABEL_26;
        }
      }
      else if (v23)
      {
        if (a3[23] >= 0) {
          std::string v42 = a3;
        }
        else {
          std::string v42 = *(const std::string::value_type **)a3;
        }
        *(_DWORD *)std::__split_buffer<std::string> buf = 136380675;
        *(void *)&uint8_t buf[4] = v42;
        int v25 = "%{private}s";
        BOOL v26 = v22;
        os_log_type_t v27 = OS_LOG_TYPE_DEFAULT;
        goto LABEL_52;
      }
      goto LABEL_67;
    case 3:
      int v28 = *(unsigned __int8 *)(a1 + 196);
      uint64_t v29 = GpsdLogObjectDevice;
      BOOL v30 = os_log_type_enabled((os_log_t)GpsdLogObjectDevice, OS_LOG_TYPE_INFO);
      if (v28)
      {
        if (!v30) {
          goto LABEL_67;
        }
        if (a3[23] >= 0) {
          int v31 = a3;
        }
        else {
          int v31 = *(const std::string::value_type **)a3;
        }
        *(_DWORD *)std::__split_buffer<std::string> buf = 134349315;
        *(double *)&uint8_t buf[4] = v6;
        *(_WORD *)&buf[12] = 2081;
        *(void *)&buf[14] = v31;
        int v25 = "%{public}.3f,%{private}s";
        BOOL v26 = v29;
        os_log_type_t v27 = OS_LOG_TYPE_INFO;
LABEL_26:
        uint32_t v32 = 22;
      }
      else
      {
        if (!v30) {
          goto LABEL_67;
        }
        if (a3[23] >= 0) {
          std::string v43 = a3;
        }
        else {
          std::string v43 = *(const std::string::value_type **)a3;
        }
        *(_DWORD *)std::__split_buffer<std::string> buf = 136380675;
        *(void *)&uint8_t buf[4] = v43;
        int v25 = "%{private}s";
        BOOL v26 = v29;
        os_log_type_t v27 = OS_LOG_TYPE_INFO;
LABEL_52:
        uint32_t v32 = 12;
      }
      _os_log_impl(&dword_237AFF000, v26, v27, v25, buf, v32);
      goto LABEL_67;
    case 4:
      int v33 = *(unsigned __int8 *)(a1 + 196);
      uint64_t v34 = GpsdLogObjectDevice;
      BOOL v35 = os_log_type_enabled((os_log_t)GpsdLogObjectDevice, OS_LOG_TYPE_DEBUG);
      if (v33)
      {
        if (!v35) {
          goto LABEL_67;
        }
        if (a3[23] >= 0) {
          int v36 = a3;
        }
        else {
          int v36 = *(const std::string::value_type **)a3;
        }
        *(_DWORD *)std::__split_buffer<std::string> buf = 134349315;
        *(double *)&uint8_t buf[4] = v6;
        *(_WORD *)&buf[12] = 2081;
        *(void *)&buf[14] = v36;
        uint64_t v37 = "%{public}.3f,%{private}s";
        int v38 = v34;
        uint32_t v39 = 22;
      }
      else
      {
        if (!v35) {
          goto LABEL_67;
        }
        if (a3[23] >= 0) {
          std::string v44 = a3;
        }
        else {
          std::string v44 = *(const std::string::value_type **)a3;
        }
        *(_DWORD *)std::__split_buffer<std::string> buf = 136380675;
        *(void *)&uint8_t buf[4] = v44;
        uint64_t v37 = "%{private}s";
        int v38 = v34;
        uint32_t v39 = 12;
      }
      _os_log_debug_impl(&dword_237AFF000, v38, OS_LOG_TYPE_DEBUG, v37, buf, v39);
      goto LABEL_67;
    default:
      goto LABEL_67;
  }
}

void sub_237B1D014(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,void *__p,uint64_t a28,int a29,__int16 a30,char a31,char a32)
{
  if (a32 < 0) {
    operator delete(__p);
  }
  if (a26 < 0) {
    operator delete(a21);
  }
  _Unwind_Resume(exception_object);
}

void gpsd::util::DiagnosticReportParameters::~DiagnosticReportParameters(void **this)
{
  if (*((char *)this + 71) < 0) {
    operator delete(this[6]);
  }
  if (*((char *)this + 47) < 0) {
    operator delete(this[3]);
  }
  if (*((char *)this + 23) < 0) {
    operator delete(*this);
  }
}

__n128 __Block_byref_object_copy__0(__n128 *a1, __n128 *a2)
{
  __n128 result = a2[3];
  a1[4].n128_u64[0] = a2[4].n128_u64[0];
  a1[3] = result;
  a2[3].n128_u64[1] = 0;
  a2[4].n128_u64[0] = 0;
  a2[3].n128_u64[0] = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
  if (*(char *)(a1 + 71) < 0) {
    operator delete(*(void **)(a1 + 48));
  }
}

void ___ZN12VendorLogger3logEN7GnssHal8LogLevelERKNSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEE_block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 40);
  VendorLogger::textLogWorker(v2, *(void *)(*(void *)(a1 + 32) + 8) + 48, *(double *)(a1 + 48));
  unsigned int v3 = *(_DWORD *)(a1 + 56);
  if (v3 >= 9) {
    std::__throw_out_of_range[abi:ne180100]("bitset test argument out of range");
  }
  if (((*(void *)(v2 + 152) >> v3) & 1) == 0
    && _ZZZN12VendorLogger3logEN7GnssHal8LogLevelERKNSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEEEUb_E17levelWarningCount <= 9)
  {
    int v4 = ++_ZZZN12VendorLogger3logEN7GnssHal8LogLevelERKNSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEEEUb_E17levelWarningCount;
    int v5 = GpsdLogObjectWarning;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectWarning, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
      int v7 = (void *)(v6 + 48);
      if (*(char *)(v6 + 71) < 0) {
        int v7 = (void *)*v7;
      }
      v8[0] = 67240707;
      v8[1] = v4;
      __int16 v9 = 1026;
      unsigned int v10 = v3;
      __int16 v11 = 2081;
      int v12 = v7;
      _os_log_impl(&dword_237AFF000, v5, OS_LOG_TYPE_DEFAULT, "VendorLogger,outOfLevel,text,%{public}d,level,%{public}d,%{private}s", (uint8_t *)v8, 0x18u);
    }
  }
}

void VendorLogger::textLogWorker(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  VendorLogger::checkLogAge((VendorLogger *)a1, a3);
  if (*(unsigned char *)(a1 + 276))
  {
    if (*(unsigned char *)(a1 + 196))
    {
      int v6 = snprintf(__str, 0x10uLL, "%.3f,", a3);
      if (v6 >= 1) {
        VendorLogger::writeCompressed((VendorLogger *)a1, (const unsigned __int8 *)__str, v6);
      }
    }
    int v7 = *(char *)(a2 + 23);
    if (v7 >= 0) {
      uint64_t v8 = (const unsigned __int8 *)a2;
    }
    else {
      uint64_t v8 = *(const unsigned __int8 **)a2;
    }
    if (v7 >= 0) {
      uint64_t v9 = *(unsigned __int8 *)(a2 + 23);
    }
    else {
      uint64_t v9 = *(void *)(a2 + 8);
    }
    VendorLogger::writeCompressed((VendorLogger *)a1, v8, v9);
    if (*(char *)(a2 + 23) < 0)
    {
      uint64_t v10 = *(void *)(a2 + 8);
      if (!v10) {
        return;
      }
      a2 = *(void *)a2;
    }
    else
    {
      uint64_t v10 = *(unsigned __int8 *)(a2 + 23);
      if (!*(unsigned char *)(a2 + 23)) {
        return;
      }
    }
    if (*(unsigned char *)(a2 + v10 - 1) != 10)
    {
      __str[0] = 10;
      VendorLogger::writeCompressed((VendorLogger *)a1, (const unsigned __int8 *)__str, 1);
    }
  }
  else if ((*(unsigned char *)(a1 + 288 + *(void *)(*(void *)(a1 + 288) - 24) + 32) & 5) != 0)
  {
    __int16 v11 = GpsdLogObjectWarning;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectWarning, OS_LOG_TYPE_DEFAULT))
    {
      if (*(char *)(a2 + 23) >= 0) {
        int v12 = (const unsigned __int8 *)a2;
      }
      else {
        int v12 = *(const unsigned __int8 **)a2;
      }
      *(_DWORD *)__str = 134349315;
      double v19 = a3;
      __int16 v20 = 2081;
      int v21 = v12;
      _os_log_impl(&dword_237AFF000, v11, OS_LOG_TYPE_DEFAULT, "VendorLogger,unserviced textLogWorker,%{public}.3f,%{private}s", (uint8_t *)__str, 0x16u);
    }
  }
  else
  {
    if (*(unsigned char *)(a1 + 196) && snprintf(__str, 0x10uLL, "%.3f,", a3) >= 1)
    {
      size_t v13 = strlen(__str);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>((void *)(a1 + 288), (uint64_t)__str, v13);
    }
    int v14 = *(char *)(a2 + 23);
    if (v14 >= 0) {
      uint64_t v15 = a2;
    }
    else {
      uint64_t v15 = *(void *)a2;
    }
    if (v14 >= 0) {
      uint64_t v16 = *(unsigned __int8 *)(a2 + 23);
    }
    else {
      uint64_t v16 = *(void *)(a2 + 8);
    }
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>((void *)(a1 + 288), v15, v16);
    if (*(char *)(a2 + 23) < 0)
    {
      uint64_t v17 = *(void *)(a2 + 8);
      if (!v17) {
        return;
      }
      a2 = *(void *)a2;
    }
    else
    {
      uint64_t v17 = *(unsigned __int8 *)(a2 + 23);
      if (!*(unsigned char *)(a2 + 23)) {
        return;
      }
    }
    if (*(unsigned char *)(a2 + v17 - 1) != 10) {
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>((void *)(a1 + 288), (uint64_t)"\n", 1);
    }
  }
}

void VendorLogger::checkLogAge(VendorLogger *this, double a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  signed int v3 = vcvtmd_s64_f64((double)gpsd::util::getMachContinuousTimeNs(this) * 0.000000001 - a2);
  if (*((_DWORD *)this + 224) < v3 && *((_DWORD *)this + 50) <= v3)
  {
    int v4 = GpsdLogObjectWarning;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectWarning, OS_LOG_TYPE_DEFAULT))
    {
      v5[0] = 67240192;
      v5[1] = v3;
      _os_log_impl(&dword_237AFF000, v4, OS_LOG_TYPE_DEFAULT, "VendorLogger,addtl memory use is induced by queue backup,%{public}d", (uint8_t *)v5, 8u);
    }
    *((_DWORD *)this + 224) = v3;
  }
}

void VendorLogger::writeCompressed(VendorLogger *this, const unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (!*((unsigned char *)this + 276)) {
    return;
  }
  if (*((unsigned char *)this + 277))
  {
    uint64_t v4 = *((void *)this + 26);
    *((void *)this + 29) = v4;
    *((void *)this + 31) = a2;
    *((void *)this + 32) = a3;
    *((void *)this + 30) = *((void *)this + 27) - v4;
    int v5 = (void *)((char *)this + 288);
    while (1)
    {
      compression_status v6 = compression_stream_process((compression_stream *)((char *)this + 232), 0);
      if (v6) {
        break;
      }
      unint64_t v7 = *((void *)this + 27) - *((void *)this + 26);
      unint64_t v8 = *((void *)this + 30);
      unint64_t v9 = v7 - v8;
      if (v7 == v8)
      {
        if (!*((void *)this + 32)) {
          goto LABEL_25;
        }
      }
      else
      {
        if (v7 < v8)
        {
          uint64_t v10 = GpsdLogObjectGeneral;
          if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)std::__split_buffer<std::string> buf = 134349312;
            unint64_t v18 = v9;
            __int16 v19 = 2050;
            unint64_t v20 = v7;
            _os_log_error_impl(&dword_237AFF000, v10, OS_LOG_TYPE_ERROR, "VendorLogger,Excessive bytes_to_print,%{public}zu,limit,%{public}zu", buf, 0x16u);
            unint64_t v9 = *((void *)this + 27) - *((void *)this + 26);
          }
          else
          {
            unint64_t v9 = v7;
          }
        }
        if ((*((unsigned char *)this + *(void *)(*v5 - 24) + 320) & 5) != 0)
        {
          __int16 v11 = GpsdLogObjectGeneral;
          if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)std::__split_buffer<std::string> buf = 0;
            _os_log_impl(&dword_237AFF000, v11, OS_LOG_TYPE_INFO, "VendorLogger,stream unavailable for compressed output", buf, 2u);
          }
        }
        else
        {
          std::ostream::write();
        }
        *((void *)this + 35) += v9;
        uint64_t v12 = *((void *)this + 26);
        uint64_t v13 = *((void *)this + 27) - v12;
        *((void *)this + 29) = v12;
        *((void *)this + 30) = v13;
      }
    }
    if (v6 == COMPRESSION_STATUS_END)
    {
      int v14 = GpsdLogObjectGeneral;
      if (!os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR)) {
        goto LABEL_25;
      }
      *(_WORD *)std::__split_buffer<std::string> buf = 0;
      uint64_t v15 = "VendorLogger,writeCompressed,unexpected COMPRESSION_STATUS_END";
    }
    else
    {
      int v14 = GpsdLogObjectGeneral;
      if (!os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR)) {
        goto LABEL_25;
      }
      *(_WORD *)std::__split_buffer<std::string> buf = 0;
      uint64_t v15 = "VendorLogger,writeCompressed,unexpected COMPRESSION_STATUS_ERROR";
    }
    _os_log_error_impl(&dword_237AFF000, v14, OS_LOG_TYPE_ERROR, v15, buf, 2u);
LABEL_25:
    if (*((void *)this + 35) > *((void *)this + 16)) {
      VendorLogger::openNewLogFile(this);
    }
    return;
  }
  if ((VendorLogger::writeCompressed(unsigned char const*,unsigned long)::kWarningPrinted & 1) == 0)
  {
    uint64_t v16 = GpsdLogObjectWarning;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectWarning, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)std::__split_buffer<std::string> buf = 0;
      _os_log_impl(&dword_237AFF000, v16, OS_LOG_TYPE_DEFAULT, "VendorLogger,log dropped since compression spun down", buf, 2u);
    }
    VendorLogger::writeCompressed(unsigned char const*,unsigned long)::kWarningPrinted = 1;
  }
}

void VendorLogger::log(gpsd::util *a1, int a2, uint64_t a3)
{
}

void VendorLogger::log(gpsd::util *a1, int a2, const void *a3, size_t a4)
{
  if (*((void *)a1 + 110))
  {
    unint64_t MachContinuousTimeNs = gpsd::util::getMachContinuousTimeNs(a1);
    v13[0] = 0;
    v13[1] = v13;
    v13[2] = 0x4812000000;
    v13[3] = __Block_byref_object_copy__17;
    v13[4] = __Block_byref_object_dispose__18;
    v13[5] = &unk_237B3C9D3;
    __dst = 0;
    uint64_t v16 = 0;
    std::string __p = 0;
    if (a4)
    {
      std::vector<unsigned char>::__vallocate[abi:ne180100](&__p, a4);
      unint64_t v9 = (char *)__dst;
      memmove(__dst, a3, a4);
      __dst = &v9[a4];
    }
    uint64_t v10 = *((void *)a1 + 110);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = ___ZN12VendorLogger3logEN7GnssHal8LogLevelEPKhm_block_invoke;
    block[3] = &unk_264CF01F0;
    block[4] = v13;
    void block[5] = a1;
    *(double *)&block[6] = (double)MachContinuousTimeNs * 0.000000001;
    int v12 = a2;
    dispatch_async(v10, block);
    _Block_object_dispose(v13, 8);
    if (__p)
    {
      __dst = __p;
      operator delete(__p);
    }
  }
}

void sub_237B1D9B4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *__p,uint64_t a25)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *__Block_byref_object_copy__17(void *result, uint64_t a2)
{
  result[6] = 0;
  result[7] = 0;
  result[8] = 0;
  signed int v3 = *(unsigned char **)(a2 + 48);
  uint64_t v2 = *(unsigned char **)(a2 + 56);
  size_t v4 = v2 - v3;
  if (v2 != v3)
  {
    int v5 = result;
    std::vector<unsigned char>::__vallocate[abi:ne180100](result + 6, v2 - v3);
    compression_status v6 = (char *)v5[7];
    __n128 result = memmove(v6, v3, v4);
    void v5[7] = &v6[v4];
  }
  return result;
}

void sub_237B1DA38(_Unwind_Exception *exception_object)
{
  size_t v4 = *v2;
  if (*v2)
  {
    *(void *)(v1 + 56) = v4;
    operator delete(v4);
  }
  _Unwind_Resume(exception_object);
}

void __Block_byref_object_dispose__18(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 48);
  if (v2)
  {
    *(void *)(a1 + 56) = v2;
    operator delete(v2);
  }
}

void ___ZN12VendorLogger3logEN7GnssHal8LogLevelEPKhm_block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 40);
  VendorLogger::binaryLogWorker(v2, *(void *)(*(void *)(a1 + 32) + 8) + 48, *(double *)(a1 + 48));
  unsigned int v3 = *(_DWORD *)(a1 + 56);
  if (v3 >= 9) {
    std::__throw_out_of_range[abi:ne180100]("bitset test argument out of range");
  }
  if (((*(void *)(v2 + 152) >> v3) & 1) == 0
    && _ZZZN12VendorLogger3logEN7GnssHal8LogLevelEPKhmEUb0_E17levelWarningCount <= 9)
  {
    int v4 = ++_ZZZN12VendorLogger3logEN7GnssHal8LogLevelEPKhmEUb0_E17levelWarningCount;
    int v5 = GpsdLogObjectWarning;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectWarning, OS_LOG_TYPE_DEFAULT))
    {
      v6[0] = 67240448;
      v6[1] = v4;
      __int16 v7 = 1026;
      unsigned int v8 = v3;
      _os_log_impl(&dword_237AFF000, v5, OS_LOG_TYPE_DEFAULT, "VendorLogger,outOfLevel,binary,%{public}d,level,%{public}d", (uint8_t *)v6, 0xEu);
    }
  }
}

void VendorLogger::binaryLogWorker(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  VendorLogger::checkLogAge((VendorLogger *)a1, a3);
  if (*(unsigned char *)(a1 + 276))
  {
    if (*(unsigned char *)(a1 + 196))
    {
      int v6 = snprintf(__str, 0x10uLL, "%.3f,", a3);
      if (v6 >= 1) {
        VendorLogger::writeCompressed((VendorLogger *)a1, (const unsigned __int8 *)__str, v6);
      }
    }
    VendorLogger::writeCompressed((VendorLogger *)a1, *(const unsigned __int8 **)a2, *(void *)(a2 + 8) - *(void *)a2);
  }
  else
  {
    if (*(unsigned char *)(a1 + 196) && snprintf(__str, 0x10uLL, "%.3f,", a3) >= 1)
    {
      size_t v7 = strlen(__str);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>((void *)(a1 + 288), (uint64_t)__str, v7);
    }
    std::ostream::write();
  }
}

void *VendorLogger::isoTimestampString@<X0>(void *a1@<X8>)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  time_t v5 = time(0);
  unsigned int v3 = gmtime(&v5);
  if (v5 < 0 || !v3) {
    strcpy(__s, "unknown_time");
  }
  else {
    strftime(__s, 0x20uLL, "%Y%m%dT_%H-%M-%SZ", v3);
  }
  return std::string::basic_string[abi:ne180100]<0>(a1, __s);
}

void std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    std::vector<std::string>::__clear[abi:ne180100]((uint64_t *)v2);
    unsigned int v3 = **a1;
    operator delete(v3);
  }
}

void std::vector<std::string>::__clear[abi:ne180100](uint64_t *a1)
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

void std::__introsort<std::_ClassicAlgPolicy,std::greater<void> &,std::string *,false>(unint64_t a1, const void **a2, uint64_t a3, char a4)
{
  uint64_t v105 = *MEMORY[0x263EF8340];
  while (2)
  {
    uint64_t v10 = a2 - 3;
    v98 = a2 - 6;
    uint64_t v100 = (uint64_t)a2;
    __int16 v11 = a2 - 9;
    unint64_t v12 = a1;
    while (1)
    {
      while (1)
      {
        while (1)
        {
          a1 = v12;
          uint64_t v13 = (uint64_t)a2 - v12;
          uint64_t v14 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)((uint64_t)a2 - v12) >> 3);
          if (v5 || !v4)
          {
            switch(v14)
            {
              case 0:
              case 1:
                return;
              case 2:
                if (std::greater<void>::operator()[abi:ne180100]<std::string &,std::string &>(v10, (const void **)a1))
                {
                  long long v43 = *(_OWORD *)a1;
                  unint64_t v102 = *(const void **)(a1 + 16);
                  long long v101 = v43;
                  long long v44 = *(_OWORD *)v10;
                  *(void *)(a1 + 16) = v10[2];
                  *(_OWORD *)a1 = v44;
                  long long v45 = v101;
                  v10[2] = v102;
                  *(_OWORD *)uint64_t v10 = v45;
                }
                break;
              case 3:
                std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<void> &,std::string *>((const void **)a1, (const void **)(a1 + 24), v10);
                break;
              case 4:
                std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<void> &,std::string *>(a1, (const void **)(a1 + 24), (const void **)(a1 + 48), (long long *)v10);
                break;
              case 5:
                std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<void> &,std::string *>(a1, (const void **)(a1 + 24), (const void **)(a1 + 48), (long long *)(a1 + 72), (long long *)v10);
                break;
              default:
                JUMPOUT(0);
            }
            return;
          }
          if (v13 <= 575)
          {
            std::string v46 = (const void **)(a1 + 24);
            BOOL v48 = (const void **)a1 == a2 || v46 == a2;
            if (a4)
            {
              if (!v48)
              {
                uint64_t v49 = 0;
                unint64_t v50 = a1;
                do
                {
                  uint64_t v51 = (const void **)v50;
                  unint64_t v50 = (unint64_t)v46;
                  if (std::greater<void>::operator()[abi:ne180100]<std::string &,std::string &>(v46, v51))
                  {
                    long long v52 = *(_OWORD *)v50;
                    unint64_t v102 = *(const void **)(v50 + 16);
                    long long v101 = v52;
                    *(void *)(v50 + 8) = 0;
                    *(void *)(v50 + 16) = 0;
                    *(void *)unint64_t v50 = 0;
                    uint64_t v53 = v49;
                    while (1)
                    {
                      uint64_t v54 = a1 + v53;
                      *(_OWORD *)(v54 + 24) = *(_OWORD *)(a1 + v53);
                      *(void *)(v54 + 40) = *(void *)(a1 + v53 + 16);
                      *(unsigned char *)(v54 + 23) = 0;
                      *(unsigned char *)uint64_t v54 = 0;
                      if (!v53) {
                        break;
                      }
                      v53 -= 24;
                      if (!std::greater<void>::operator()[abi:ne180100]<std::string &,std::string &>((const void **)&v101, (const void **)(v53 + a1)))
                      {
                        uint64_t v55 = a1 + v53 + 24;
                        goto LABEL_88;
                      }
                    }
                    uint64_t v55 = a1;
LABEL_88:
                    long long v56 = v101;
                    *(void *)(v55 + 16) = v102;
                    *(_OWORD *)uint64_t v55 = v56;
                  }
                  std::string v46 = (const void **)(v50 + 24);
                  v49 += 24;
                }
                while ((const void **)(v50 + 24) != a2);
              }
            }
            else if (!v48)
            {
              unint64_t v91 = a1 - 24;
              do
              {
                uint64_t v92 = (const void **)a1;
                a1 = (unint64_t)v46;
                if (std::greater<void>::operator()[abi:ne180100]<std::string &,std::string &>(v46, v92))
                {
                  long long v93 = *(_OWORD *)a1;
                  unint64_t v102 = *(const void **)(a1 + 16);
                  long long v101 = v93;
                  *(void *)(a1 + 8) = 0;
                  *(void *)(a1 + 16) = 0;
                  *(void *)a1 = 0;
                  unint64_t v94 = v91;
                  do
                  {
                    *(_OWORD *)(v94 + 48) = *(_OWORD *)(v94 + 24);
                    *(void *)(v94 + 64) = *(void *)(v94 + 40);
                    *(unsigned char *)(v94 + 47) = 0;
                    *(unsigned char *)(v94 + 24) = 0;
                    BOOL v95 = std::greater<void>::operator()[abi:ne180100]<std::string &,std::string &>((const void **)&v101, (const void **)v94);
                    v94 -= 24;
                  }
                  while (v95);
                  long long v96 = v101;
                  *(void *)(v94 + 64) = v102;
                  *(_OWORD *)(v94 + 48) = v96;
                }
                std::string v46 = (const void **)(a1 + 24);
                v91 += 24;
              }
              while ((const void **)(a1 + 24) != a2);
            }
            return;
          }
          if (!a3)
          {
            if ((const void **)a1 != a2)
            {
              int64_t v57 = (unint64_t)(v14 - 2) >> 1;
              int64_t v58 = v57;
              do
              {
                int64_t v59 = v58;
                if (v57 >= v58)
                {
                  uint64_t v60 = (2 * v58) | 1;
                  unint64_t v61 = a1 + 24 * v60;
                  if (2 * v58 + 2 < v14
                    && std::greater<void>::operator()[abi:ne180100]<std::string &,std::string &>((const void **)(a1 + 24 * v60), (const void **)(v61 + 24)))
                  {
                    v61 += 24;
                    uint64_t v60 = 2 * v59 + 2;
                  }
                  unint64_t v62 = a1 + 24 * v59;
                  if (!std::greater<void>::operator()[abi:ne180100]<std::string &,std::string &>((const void **)v61, (const void **)v62))
                  {
                    long long v63 = *(_OWORD *)v62;
                    unint64_t v102 = *(const void **)(v62 + 16);
                    long long v101 = v63;
                    *(void *)(v62 + 8) = 0;
                    *(void *)(v62 + 16) = 0;
                    *(void *)unint64_t v62 = 0;
                    do
                    {
                      unint64_t v64 = v61;
                      long long v65 = *(_OWORD *)v61;
                      *(void *)(v62 + 16) = *(void *)(v61 + 16);
                      *(_OWORD *)unint64_t v62 = v65;
                      *(unsigned char *)(v61 + 23) = 0;
                      *(unsigned char *)unint64_t v61 = 0;
                      if (v57 < v60) {
                        break;
                      }
                      uint64_t v66 = (2 * v60) | 1;
                      unint64_t v61 = a1 + 24 * v66;
                      uint64_t v67 = 2 * v60 + 2;
                      if (v67 < v14
                        && std::greater<void>::operator()[abi:ne180100]<std::string &,std::string &>((const void **)(a1 + 24 * v66), (const void **)(v61 + 24)))
                      {
                        v61 += 24;
                        uint64_t v66 = v67;
                      }
                      unint64_t v62 = v64;
                      uint64_t v60 = v66;
                    }
                    while (!std::greater<void>::operator()[abi:ne180100]<std::string &,std::string &>((const void **)v61, (const void **)&v101));
                    long long v68 = v101;
                    *(void *)(v64 + 16) = v102;
                    *(_OWORD *)unint64_t v64 = v68;
                  }
                }
                int64_t v58 = v59 - 1;
              }
              while (v59);
              int64_t v69 = v13 / 0x18uLL;
              uint64_t v70 = (_OWORD *)v100;
              do
              {
                uint64_t v71 = 0;
                uint64_t v72 = v70;
                uint64_t v97 = *(void **)a1;
                *(void *)&long long v103 = *(void *)(a1 + 8);
                *(void *)((char *)&v103 + 7) = *(void *)(a1 + 15);
                char v99 = *(unsigned char *)(a1 + 23);
                *(void *)(a1 + 8) = 0;
                *(void *)(a1 + 16) = 0;
                *(void *)a1 = 0;
                uint64_t v73 = v69 - 2;
                if (v69 < 2) {
                  uint64_t v73 = v69 - 1;
                }
                uint64_t v74 = v73 >> 1;
                unint64_t v75 = a1;
                do
                {
                  uint64_t v76 = v75 + 24 * v71 + 24;
                  uint64_t v77 = 2 * v71;
                  uint64_t v71 = (2 * v71) | 1;
                  uint64_t v78 = v77 + 2;
                  if (v77 + 2 < v69
                    && std::greater<void>::operator()[abi:ne180100]<std::string &,std::string &>((const void **)v76, (const void **)(v76 + 24)))
                  {
                    v76 += 24;
                    uint64_t v71 = v78;
                  }
                  if (*(char *)(v75 + 23) < 0) {
                    operator delete(*(void **)v75);
                  }
                  long long v79 = *(_OWORD *)v76;
                  *(void *)(v75 + 16) = *(void *)(v76 + 16);
                  *(_OWORD *)unint64_t v75 = v79;
                  *(unsigned char *)(v76 + 23) = 0;
                  *(unsigned char *)uint64_t v76 = 0;
                  unint64_t v75 = v76;
                }
                while (v71 <= v74);
                uint64_t v70 = (_OWORD *)((char *)v72 - 24);
                if ((_OWORD *)v76 == (_OWORD *)((char *)v72 - 24))
                {
                  *(void *)uint64_t v76 = v97;
                  uint64_t v89 = *(void *)((char *)&v103 + 7);
                  *(void *)(v76 + 8) = v103;
                  *(void *)(v76 + 15) = v89;
                  *(unsigned char *)(v76 + 23) = v99;
                }
                else
                {
                  long long v80 = *v70;
                  *(void *)(v76 + 16) = *((void *)v72 - 1);
                  *(_OWORD *)uint64_t v76 = v80;
                  *((void *)v72 - 3) = v97;
                  uint64_t v81 = v103;
                  *(void *)((char *)v72 - 9) = *(void *)((char *)&v103 + 7);
                  *((void *)v72 - 2) = v81;
                  *((unsigned char *)v72 - 1) = v99;
                  uint64_t v82 = v76 - a1 + 24;
                  if (v82 >= 25)
                  {
                    unint64_t v83 = (v82 / 0x18uLL - 2) >> 1;
                    unint64_t v84 = a1 + 24 * v83;
                    if (std::greater<void>::operator()[abi:ne180100]<std::string &,std::string &>((const void **)v84, (const void **)v76))
                    {
                      long long v85 = *(_OWORD *)v76;
                      unint64_t v102 = *(const void **)(v76 + 16);
                      long long v101 = v85;
                      *(void *)(v76 + 8) = 0;
                      *(void *)(v76 + 16) = 0;
                      *(void *)uint64_t v76 = 0;
                      do
                      {
                        uint64_t v86 = v84;
                        long long v87 = *(_OWORD *)v84;
                        *(void *)(v76 + 16) = *(void *)(v84 + 16);
                        *(_OWORD *)uint64_t v76 = v87;
                        *(unsigned char *)(v84 + 23) = 0;
                        *(unsigned char *)unint64_t v84 = 0;
                        if (!v83) {
                          break;
                        }
                        unint64_t v83 = (v83 - 1) >> 1;
                        unint64_t v84 = a1 + 24 * v83;
                        uint64_t v76 = v86;
                      }
                      while (std::greater<void>::operator()[abi:ne180100]<std::string &,std::string &>((const void **)v84, (const void **)&v101));
                      long long v88 = v101;
                      *(void *)(v86 + 16) = v102;
                      *(_OWORD *)uint64_t v86 = v88;
                    }
                  }
                }
              }
              while (v69-- > 2);
            }
            return;
          }
          unint64_t v15 = (unint64_t)v14 >> 1;
          unint64_t v16 = a1 + 24 * ((unint64_t)v14 >> 1);
          if ((unint64_t)v13 < 0xC01)
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<void> &,std::string *>((const void **)v16, (const void **)a1, v10);
          }
          else
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<void> &,std::string *>((const void **)a1, (const void **)v16, v10);
            uint64_t v17 = 3 * v15;
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<void> &,std::string *>((const void **)(a1 + 24), (const void **)(a1 + 8 * v17 - 24), v98);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<void> &,std::string *>((const void **)(a1 + 48), (const void **)(a1 + 24 + 8 * v17), v11);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<void> &,std::string *>((const void **)(a1 + 8 * v17 - 24), (const void **)v16, (const void **)(a1 + 24 + 8 * v17));
            long long v18 = *(_OWORD *)a1;
            unint64_t v102 = *(const void **)(a1 + 16);
            long long v101 = v18;
            uint64_t v19 = *(void *)(v16 + 16);
            *(_OWORD *)a1 = *(_OWORD *)v16;
            *(void *)(a1 + 16) = v19;
            long long v20 = v101;
            *(void *)(v16 + 16) = v102;
            *(_OWORD *)unint64_t v16 = v20;
          }
          --a3;
          if ((a4 & 1) != 0
            || std::greater<void>::operator()[abi:ne180100]<std::string &,std::string &>((const void **)(a1 - 24), (const void **)a1))
          {
            break;
          }
          long long v33 = *(_OWORD *)a1;
          uint64_t v104 = *(void *)(a1 + 16);
          long long v103 = v33;
          *(void *)(a1 + 8) = 0;
          *(void *)(a1 + 16) = 0;
          *(void *)a1 = 0;
          if (std::greater<void>::operator()[abi:ne180100]<std::string &,std::string &>((const void **)&v103, v10))
          {
            unint64_t v12 = a1;
            do
              v12 += 24;
            while (!std::greater<void>::operator()[abi:ne180100]<std::string &,std::string &>((const void **)&v103, (const void **)v12));
          }
          else
          {
            uint64_t v34 = (const void **)(a1 + 24);
            do
            {
              unint64_t v12 = (unint64_t)v34;
              if (v34 >= a2) {
                break;
              }
              BOOL v35 = std::greater<void>::operator()[abi:ne180100]<std::string &,std::string &>((const void **)&v103, v34);
              uint64_t v34 = (const void **)(v12 + 24);
            }
            while (!v35);
          }
          unint64_t v36 = (unint64_t)a2;
          if (v12 < (unint64_t)a2)
          {
            unint64_t v36 = (unint64_t)a2;
            do
              v36 -= 24;
            while (std::greater<void>::operator()[abi:ne180100]<std::string &,std::string &>((const void **)&v103, (const void **)v36));
          }
          while (v12 < v36)
          {
            long long v37 = *(_OWORD *)v12;
            unint64_t v102 = *(const void **)(v12 + 16);
            long long v101 = v37;
            long long v38 = *(_OWORD *)v36;
            *(void *)(v12 + 16) = *(void *)(v36 + 16);
            *(_OWORD *)unint64_t v12 = v38;
            long long v39 = v101;
            *(void *)(v36 + 16) = v102;
            *(_OWORD *)unint64_t v36 = v39;
            do
              v12 += 24;
            while (!std::greater<void>::operator()[abi:ne180100]<std::string &,std::string &>((const void **)&v103, (const void **)v12));
            do
              v36 -= 24;
            while (std::greater<void>::operator()[abi:ne180100]<std::string &,std::string &>((const void **)&v103, (const void **)v36));
          }
          uint64_t v40 = (long long *)(v12 - 24);
          BOOL v4 = v12 - 24 >= a1;
          BOOL v5 = v12 - 24 == a1;
          if (v12 - 24 == a1)
          {
            if (*(char *)(v12 - 1) < 0) {
              operator delete(*(void **)a1);
            }
          }
          else
          {
            if (*(char *)(a1 + 23) < 0) {
              operator delete(*(void **)a1);
            }
            long long v41 = *v40;
            *(void *)(a1 + 16) = *(void *)(v12 - 8);
            *(_OWORD *)a1 = v41;
            *(unsigned char *)(v12 - 1) = 0;
            *(unsigned char *)(v12 - 24) = 0;
          }
          a4 = 0;
          long long v42 = v103;
          *(void *)(v12 - 8) = v104;
          long long *v40 = v42;
        }
        uint64_t v21 = 0;
        long long v22 = *(_OWORD *)a1;
        uint64_t v104 = *(void *)(a1 + 16);
        long long v103 = v22;
        *(void *)(a1 + 8) = 0;
        *(void *)(a1 + 16) = 0;
        *(void *)a1 = 0;
        do
          v21 += 24;
        while (std::greater<void>::operator()[abi:ne180100]<std::string &,std::string &>((const void **)(v21 + a1), (const void **)&v103));
        unint64_t v23 = a1 + v21;
        long long v24 = (const void **)v100;
        if (v21 == 24)
        {
          long long v24 = (const void **)v100;
          do
          {
            if (v23 >= (unint64_t)v24) {
              break;
            }
            v24 -= 3;
          }
          while (!std::greater<void>::operator()[abi:ne180100]<std::string &,std::string &>(v24, (const void **)&v103));
        }
        else
        {
          do
            v24 -= 3;
          while (!std::greater<void>::operator()[abi:ne180100]<std::string &,std::string &>(v24, (const void **)&v103));
        }
        unint64_t v12 = a1 + v21;
        if (v23 < (unint64_t)v24)
        {
          int v25 = v24;
          do
          {
            long long v26 = *(_OWORD *)v12;
            unint64_t v102 = *(const void **)(v12 + 16);
            long long v101 = v26;
            long long v27 = *(_OWORD *)v25;
            *(void *)(v12 + 16) = v25[2];
            *(_OWORD *)unint64_t v12 = v27;
            long long v28 = v101;
            v25[2] = v102;
            *(_OWORD *)int v25 = v28;
            do
              v12 += 24;
            while (std::greater<void>::operator()[abi:ne180100]<std::string &,std::string &>((const void **)v12, (const void **)&v103));
            do
              v25 -= 3;
            while (!std::greater<void>::operator()[abi:ne180100]<std::string &,std::string &>(v25, (const void **)&v103));
          }
          while (v12 < (unint64_t)v25);
        }
        uint64_t v29 = (long long *)(v12 - 24);
        if (v12 - 24 == a1)
        {
          if (*(char *)(v12 - 1) < 0) {
            operator delete(*(void **)a1);
          }
        }
        else
        {
          if (*(char *)(a1 + 23) < 0) {
            operator delete(*(void **)a1);
          }
          long long v30 = *v29;
          *(void *)(a1 + 16) = *(void *)(v12 - 8);
          *(_OWORD *)a1 = v30;
          *(unsigned char *)(v12 - 1) = 0;
          *(unsigned char *)(v12 - 24) = 0;
        }
        long long v31 = v103;
        *(void *)(v12 - 8) = v104;
        *uint64_t v29 = v31;
        BOOL v4 = v23 >= (unint64_t)v24;
        a2 = (const void **)v100;
        if (v4) {
          break;
        }
LABEL_36:
        std::__introsort<std::_ClassicAlgPolicy,std::greater<void> &,std::string *,false>(a1, v12 - 24, a3, a4 & 1);
        a4 = 0;
      }
      BOOL v32 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<void> &,std::string *>(a1, v12 - 24);
      if (std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<void> &,std::string *>(v12, v100))
      {
        break;
      }
      if (!v32) {
        goto LABEL_36;
      }
    }
    a2 = (const void **)(v12 - 24);
    if (!v32) {
      continue;
    }
    break;
  }
}

BOOL std::greater<void>::operator()[abi:ne180100]<std::string &,std::string &>(const void **a1, const void **a2)
{
  int v2 = *((char *)a1 + 23);
  int v3 = *((char *)a2 + 23);
  if (v3 >= 0) {
    size_t v4 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    size_t v4 = (size_t)a2[1];
  }
  if (v3 >= 0) {
    BOOL v5 = a2;
  }
  else {
    BOOL v5 = *a2;
  }
  if (v2 >= 0) {
    size_t v6 = *((unsigned __int8 *)a1 + 23);
  }
  else {
    size_t v6 = (size_t)a1[1];
  }
  if (v2 >= 0) {
    uint64_t v7 = a1;
  }
  else {
    uint64_t v7 = *a1;
  }
  if (v6 >= v4) {
    size_t v8 = v4;
  }
  else {
    size_t v8 = v6;
  }
  int v9 = memcmp(v5, v7, v8);
  if (v9) {
    return v9 < 0;
  }
  else {
    return v4 < v6;
  }
}

BOOL std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<void> &,std::string *>(const void **a1, const void **a2, const void **a3)
{
  BOOL v6 = std::greater<void>::operator()[abi:ne180100]<std::string &,std::string &>(a2, a1);
  BOOL result = std::greater<void>::operator()[abi:ne180100]<std::string &,std::string &>(a3, a2);
  if (v6)
  {
    if (result)
    {
      size_t v8 = a1[2];
      long long v9 = *(_OWORD *)a1;
      uint64_t v10 = a3[2];
      *(_OWORD *)a1 = *(_OWORD *)a3;
      a1[2] = v10;
    }
    else
    {
      uint64_t v17 = a1[2];
      long long v18 = *(_OWORD *)a1;
      uint64_t v19 = a2[2];
      *(_OWORD *)a1 = *(_OWORD *)a2;
      a1[2] = v19;
      *(_OWORD *)a2 = v18;
      a2[2] = v17;
      BOOL result = std::greater<void>::operator()[abi:ne180100]<std::string &,std::string &>(a3, a2);
      if (!result) {
        return result;
      }
      size_t v8 = a2[2];
      long long v9 = *(_OWORD *)a2;
      long long v20 = a3[2];
      *(_OWORD *)a2 = *(_OWORD *)a3;
      a2[2] = v20;
    }
    *(_OWORD *)a3 = v9;
    a3[2] = v8;
  }
  else if (result)
  {
    __int16 v11 = a2[2];
    long long v12 = *(_OWORD *)a2;
    uint64_t v13 = a3[2];
    *(_OWORD *)a2 = *(_OWORD *)a3;
    a2[2] = v13;
    *(_OWORD *)a3 = v12;
    a3[2] = v11;
    BOOL result = std::greater<void>::operator()[abi:ne180100]<std::string &,std::string &>(a2, a1);
    if (result)
    {
      uint64_t v14 = a1[2];
      long long v15 = *(_OWORD *)a1;
      unint64_t v16 = a2[2];
      *(_OWORD *)a1 = *(_OWORD *)a2;
      a1[2] = v16;
      *(_OWORD *)a2 = v15;
      a2[2] = v14;
    }
  }
  return result;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<void> &,std::string *>(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (a2 - a1) >> 3;
  BOOL result = 1;
  switch(0xAAAAAAAAAAAAAAABLL * v4)
  {
    case 0uLL:
    case 1uLL:
      return result;
    case 2uLL:
      uint64_t v6 = a2 - 24;
      if (std::greater<void>::operator()[abi:ne180100]<std::string &,std::string &>((const void **)(a2 - 24), (const void **)a1))
      {
        uint64_t v7 = *(void *)(a1 + 16);
        long long v8 = *(_OWORD *)a1;
        uint64_t v9 = *(void *)(v6 + 16);
        *(_OWORD *)a1 = *(_OWORD *)v6;
        *(void *)(a1 + 16) = v9;
        *(_OWORD *)uint64_t v6 = v8;
        *(void *)(v6 + 16) = v7;
      }
      return 1;
    case 3uLL:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<void> &,std::string *>((const void **)a1, (const void **)(a1 + 24), (const void **)(a2 - 24));
      return 1;
    case 4uLL:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<void> &,std::string *>(a1, (const void **)(a1 + 24), (const void **)(a1 + 48), (long long *)(a2 - 24));
      return 1;
    case 5uLL:
      std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<void> &,std::string *>(a1, (const void **)(a1 + 24), (const void **)(a1 + 48), (long long *)(a1 + 72), (long long *)(a2 - 24));
      return 1;
    default:
      uint64_t v10 = (const void **)(a1 + 48);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<void> &,std::string *>((const void **)a1, (const void **)(a1 + 24), (const void **)(a1 + 48));
      uint64_t v11 = a1 + 72;
      if (a1 + 72 == a2) {
        return 1;
      }
      uint64_t v12 = 0;
      int v13 = 0;
      break;
  }
  while (1)
  {
    if (std::greater<void>::operator()[abi:ne180100]<std::string &,std::string &>((const void **)v11, v10))
    {
      long long v17 = *(_OWORD *)v11;
      uint64_t v18 = *(void *)(v11 + 16);
      *(void *)(v11 + 8) = 0;
      *(void *)(v11 + 16) = 0;
      *(void *)uint64_t v11 = 0;
      uint64_t v14 = v12;
      while (1)
      {
        uint64_t v15 = a1 + v14;
        *(_OWORD *)(v15 + 72) = *(_OWORD *)(a1 + v14 + 48);
        *(void *)(v15 + 88) = *(void *)(a1 + v14 + 64);
        *(unsigned char *)(v15 + 71) = 0;
        *(unsigned char *)(v15 + 48) = 0;
        if (v14 == -48) {
          break;
        }
        v14 -= 24;
        if (!std::greater<void>::operator()[abi:ne180100]<std::string &,std::string &>((const void **)&v17, (const void **)(v15 + 24)))
        {
          uint64_t v16 = a1 + v14 + 72;
          goto LABEL_12;
        }
      }
      uint64_t v16 = a1;
LABEL_12:
      *(_OWORD *)uint64_t v16 = v17;
      *(void *)(v16 + 16) = v18;
      if (++v13 == 8) {
        return v11 + 24 == a2;
      }
    }
    uint64_t v10 = (const void **)v11;
    v12 += 24;
    v11 += 24;
    if (v11 == a2) {
      return 1;
    }
  }
}

__n128 std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<void> &,std::string *>(uint64_t a1, const void **a2, const void **a3, long long *a4)
{
  std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<void> &,std::string *>((const void **)a1, a2, a3);
  if (std::greater<void>::operator()[abi:ne180100]<std::string &,std::string &>((const void **)a4, a3))
  {
    uint64_t v9 = a3[2];
    long long v10 = *(_OWORD *)a3;
    uint64_t v11 = (const void *)*((void *)a4 + 2);
    *(_OWORD *)a3 = *a4;
    a3[2] = v11;
    *a4 = v10;
    *((void *)a4 + 2) = v9;
    if (std::greater<void>::operator()[abi:ne180100]<std::string &,std::string &>(a3, a2))
    {
      uint64_t v12 = a2[2];
      long long v13 = *(_OWORD *)a2;
      uint64_t v14 = a3[2];
      *(_OWORD *)a2 = *(_OWORD *)a3;
      a2[2] = v14;
      *(_OWORD *)a3 = v13;
      a3[2] = v12;
      if (std::greater<void>::operator()[abi:ne180100]<std::string &,std::string &>(a2, (const void **)a1))
      {
        uint64_t v15 = *(const void **)(a1 + 16);
        __n128 result = *(__n128 *)a1;
        uint64_t v16 = a2[2];
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(void *)(a1 + 16) = v16;
        *(__n128 *)a2 = result;
        a2[2] = v15;
      }
    }
  }
  return result;
}

__n128 std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<void> &,std::string *>(uint64_t a1, const void **a2, const void **a3, long long *a4, long long *a5)
{
  std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<void> &,std::string *>(a1, a2, a3, a4);
  if (std::greater<void>::operator()[abi:ne180100]<std::string &,std::string &>((const void **)a5, (const void **)a4))
  {
    uint64_t v11 = *((void *)a4 + 2);
    long long v12 = *a4;
    uint64_t v13 = *((void *)a5 + 2);
    *a4 = *a5;
    *((void *)a4 + 2) = v13;
    *a5 = v12;
    *((void *)a5 + 2) = v11;
    if (std::greater<void>::operator()[abi:ne180100]<std::string &,std::string &>((const void **)a4, a3))
    {
      uint64_t v14 = a3[2];
      long long v15 = *(_OWORD *)a3;
      uint64_t v16 = (const void *)*((void *)a4 + 2);
      *(_OWORD *)a3 = *a4;
      a3[2] = v16;
      *a4 = v15;
      *((void *)a4 + 2) = v14;
      if (std::greater<void>::operator()[abi:ne180100]<std::string &,std::string &>(a3, a2))
      {
        long long v17 = a2[2];
        long long v18 = *(_OWORD *)a2;
        uint64_t v19 = a3[2];
        *(_OWORD *)a2 = *(_OWORD *)a3;
        a2[2] = v19;
        *(_OWORD *)a3 = v18;
        a3[2] = v17;
        if (std::greater<void>::operator()[abi:ne180100]<std::string &,std::string &>(a2, (const void **)a1))
        {
          long long v20 = *(const void **)(a1 + 16);
          __n128 result = *(__n128 *)a1;
          uint64_t v21 = a2[2];
          *(_OWORD *)a1 = *(_OWORD *)a2;
          *(void *)(a1 + 16) = v21;
          *(__n128 *)a2 = result;
          a2[2] = v20;
        }
      }
    }
  }
  return result;
}

uint64_t std::string::basic_string[abi:ne180100](uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
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

void std::__split_buffer<std::string>::~__split_buffer(std::__split_buffer<std::string> *this)
{
  std::__split_buffer<std::string>::pointer begin = this->__begin_;
  std::__split_buffer<std::string>::pointer end = this->__end_;
  if (end != begin)
  {
    do
    {
      std::__split_buffer<std::string>::pointer v4 = end - 1;
      this->__end_ = end - 1;
      if (SHIBYTE(end[-1].__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(v4->__r_.__value_.__l.__data_);
        std::__split_buffer<std::string>::pointer v4 = this->__end_;
      }
      std::__split_buffer<std::string>::pointer end = v4;
    }
    while (v4 != begin);
  }
  if (this->__first_) {
    operator delete(this->__first_);
  }
}

char *std::vector<unsigned char>::__vallocate[abi:ne180100](void *a1, size_t __sz)
{
  if ((__sz & 0x8000000000000000) != 0) {
    std::vector<gnssTest::RfMeasurement>::__throw_length_error[abi:ne180100]();
  }
  __n128 result = (char *)operator new(__sz);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[__sz];
  return result;
}

void std::vector<unsigned char>::__append(unint64_t *a1, size_t a2)
{
  uint64_t v5 = (char *)a1[1];
  std::__split_buffer<std::string>::pointer v4 = (char *)a1[2];
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
      std::vector<gnssTest::RfMeasurement>::__throw_length_error[abi:ne180100]();
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
    long long v12 = &v7[v11];
    uint64_t v13 = (char *)(v11 + v10);
    bzero(v12, a2);
    if (v5 == (char *)v6)
    {
      unint64_t v11 = (unint64_t)v12;
    }
    else
    {
      uint64_t v14 = &v5[~v6];
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

uint64_t GpsdPlatformInfoHardware::detectHardware(GpsdPlatformInfoHardware *this)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  long long v3 = xmmword_237B315F0;
  int v4 = 710807826;
  if (MGIsDeviceOfType()) {
    return 10401;
  }
  int v4 = 470738981;
  long long v3 = xmmword_237B31604;
  if (MGIsDeviceOfType()) {
    return 10401;
  }
  int v4 = -2085056298;
  long long v3 = xmmword_237B31618;
  if (MGIsDeviceOfType()) {
    return 10403;
  }
  int v4 = 1860682089;
  long long v3 = xmmword_237B3162C;
  if (MGIsDeviceOfType()) {
    return 10403;
  }
  int v4 = -338255497;
  long long v3 = xmmword_237B31640;
  if (MGIsDeviceOfType()) {
    return 10509;
  }
  int v4 = 152704997;
  long long v3 = xmmword_237B31654;
  if (MGIsDeviceOfType()) {
    return 10509;
  }
  int v4 = 283967174;
  long long v3 = xmmword_237B31668;
  if (MGIsDeviceOfType()) {
    return 10511;
  }
  int v4 = -1040127899;
  long long v3 = xmmword_237B3167C;
  if (MGIsDeviceOfType()) {
    return 10511;
  }
  int v4 = -1742178852;
  long long v3 = xmmword_237B31690;
  if (MGIsDeviceOfType()) {
    return 10501;
  }
  int v4 = 2146530832;
  long long v3 = xmmword_237B316A4;
  if (MGIsDeviceOfType()) {
    return 10501;
  }
  int v4 = 1330813729;
  long long v3 = xmmword_237B316B8;
  if (MGIsDeviceOfType()) {
    return 10503;
  }
  int v4 = 617174804;
  long long v3 = xmmword_237B316CC;
  if (MGIsDeviceOfType()) {
    return 10503;
  }
  int v4 = -871113647;
  long long v3 = xmmword_237B316E0;
  if (MGIsDeviceOfType()) {
    return 10601;
  }
  int v4 = 1530707451;
  long long v3 = xmmword_237B316F4;
  if (MGIsDeviceOfType()) {
    return 10601;
  }
  int v4 = 1472775220;
  long long v3 = xmmword_237B31708;
  if (MGIsDeviceOfType()) {
    return 10603;
  }
  int v4 = 483476120;
  long long v3 = xmmword_237B3171C;
  if (MGIsDeviceOfType()) {
    return 10603;
  }
  int v4 = 282158961;
  long long v3 = xmmword_237B31730;
  if (MGIsDeviceOfType()) {
    return 10606;
  }
  int v4 = 56502976;
  long long v3 = xmmword_237B31744;
  if (MGIsDeviceOfType()) {
    return 10606;
  }
  int v4 = -961843768;
  long long v3 = xmmword_237B31758;
  if (MGIsDeviceOfType()) {
    return 10608;
  }
  int v4 = 1282132887;
  long long v3 = xmmword_237B3176C;
  if (MGIsDeviceOfType()) {
    return 10608;
  }
  int v4 = -441172408;
  long long v3 = xmmword_237B31780;
  if (MGIsDeviceOfType()) {
    return 10610;
  }
  int v4 = 1326690998;
  long long v3 = xmmword_237B31794;
  if (MGIsDeviceOfType()) {
    return 10610;
  }
  int v4 = 1756484512;
  long long v3 = xmmword_237B317A8;
  if (MGIsDeviceOfType()) {
    return 10612;
  }
  int v4 = -126099363;
  long long v3 = xmmword_237B317BC;
  if (MGIsDeviceOfType()) {
    return 10612;
  }
  int v4 = -1092155788;
  long long v3 = xmmword_237B317D0;
  if (MGIsDeviceOfType()) {
    return 10614;
  }
  int v4 = 763775061;
  long long v3 = xmmword_237B317E4;
  if (MGIsDeviceOfType()) {
    return 10614;
  }
  int v4 = -63049871;
  long long v3 = xmmword_237B317F8;
  if (MGIsDeviceOfType()) {
    return 10616;
  }
  int v4 = -557458837;
  long long v3 = xmmword_237B3180C;
  if (MGIsDeviceOfType()) {
    return 10616;
  }
  int v4 = 1730000236;
  long long v3 = xmmword_237B31820;
  if (MGIsDeviceOfType()) {
    return 10618;
  }
  int v4 = 1530338216;
  long long v3 = xmmword_237B31834;
  if (MGIsDeviceOfType()) {
    return 10701;
  }
  int v4 = 406601745;
  long long v3 = xmmword_237B31848;
  if (MGIsDeviceOfType()) {
    return 10701;
  }
  int v4 = 1654218604;
  long long v3 = xmmword_237B3185C;
  if (MGIsDeviceOfType()) {
    return 10703;
  }
  int v4 = -1930811061;
  long long v3 = xmmword_237B31870;
  if (MGIsDeviceOfType()) {
    return 10703;
  }
  int v4 = -182498503;
  long long v3 = xmmword_237B31884;
  if (MGIsDeviceOfType()) {
    return 10705;
  }
  int v4 = 841005628;
  long long v3 = xmmword_237B31898;
  if (MGIsDeviceOfType()) {
    return 10708;
  }
  int v4 = -2030489149;
  long long v3 = xmmword_237B318AC;
  if (MGIsDeviceOfType()) {
    return 10708;
  }
  int v4 = 1219348060;
  long long v3 = xmmword_237B318C0;
  if (MGIsDeviceOfType()) {
    return 10710;
  }
  int v4 = 223445260;
  long long v3 = xmmword_237B318D4;
  if (MGIsDeviceOfType()) {
    return 10710;
  }
  int v4 = -232427879;
  long long v3 = xmmword_237B318E8;
  if (MGIsDeviceOfType()) {
    return 21102;
  }
  int v4 = -427474227;
  long long v3 = xmmword_237B318FC;
  if (MGIsDeviceOfType()) {
    return 21106;
  }
  int v4 = 1477534141;
  long long v3 = xmmword_237B31910;
  if (MGIsDeviceOfType()) {
    return 21106;
  }
  int v4 = -1843102369;
  long long v3 = xmmword_237B31924;
  if (MGIsDeviceOfType()) {
    return 21108;
  }
  int v4 = -61007701;
  long long v3 = xmmword_237B31938;
  if (MGIsDeviceOfType()) {
    return 21203;
  }
  int v4 = -235416490;
  long long v3 = xmmword_237B3194C;
  if (MGIsDeviceOfType()) {
    return 21205;
  }
  int v4 = -820493242;
  long long v3 = xmmword_237B31960;
  if (MGIsDeviceOfType()) {
    return 21201;
  }
  int v4 = -121925081;
  long long v3 = xmmword_237B31974;
  if (MGIsDeviceOfType()) {
    return 21210;
  }
  int v4 = -1820426635;
  long long v3 = xmmword_237B31988;
  if (MGIsDeviceOfType()) {
    return 21502;
  }
  int v4 = -937652876;
  long long v3 = xmmword_237B3199C;
  if (MGIsDeviceOfType()) {
    return 21503;
  }
  int v4 = 1874287171;
  long long v3 = xmmword_237B319B0;
  if (MGIsDeviceOfType()) {
    return 21603;
  }
  int v4 = -781324731;
  long long v3 = xmmword_237B319C4;
  if (MGIsDeviceOfType()) {
    return 21602;
  }
  int v4 = 1214880059;
  long long v3 = xmmword_237B319D8;
  if (MGIsDeviceOfType()) {
    return 21701;
  }
  int v4 = 426359977;
  long long v3 = xmmword_237B319EC;
  if (MGIsDeviceOfType()) {
    return 21702;
  }
  int v4 = -1841712216;
  long long v3 = xmmword_237B31A00;
  if (MGIsDeviceOfType()) {
    return 31102;
  }
  int v4 = 213746202;
  long long v3 = xmmword_237B31A14;
  if (MGIsDeviceOfType()) {
    return 31104;
  }
  int v4 = 300442574;
  long long v3 = xmmword_237B31A28;
  if (MGIsDeviceOfType()) {
    return 30808;
  }
  int v4 = 440949464;
  long long v3 = xmmword_237B31A3C;
  if (MGIsDeviceOfType()) {
    return 31302;
  }
  int v4 = -762483149;
  long long v3 = xmmword_237B31A50;
  if (MGIsDeviceOfType()) {
    return 30804;
  }
  int v4 = -1294188889;
  long long v3 = xmmword_237B31A64;
  if (MGIsDeviceOfType()) {
    return 30808;
  }
  int v4 = -1926937532;
  long long v3 = xmmword_237B31A78;
  if (MGIsDeviceOfType()) {
    return 30804;
  }
  int v4 = -2132668294;
  long long v3 = xmmword_237B31A8C;
  if (MGIsDeviceOfType()) {
    return 30712;
  }
  int v4 = -858079590;
  long long v3 = xmmword_237B31AA0;
  if (MGIsDeviceOfType()) {
    return 31107;
  }
  int v4 = -1675932945;
  long long v3 = xmmword_237B31AB4;
  if (MGIsDeviceOfType()) {
    return 30812;
  }
  int v4 = 300130091;
  long long v3 = xmmword_237B31AC8;
  if (MGIsDeviceOfType()) {
    return 30810;
  }
  int v4 = 646100384;
  long long v3 = xmmword_237B31ADC;
  if (MGIsDeviceOfType()) {
    return 31202;
  }
  int v2 = GpsdLogObjectGeneral;
  uint64_t result = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR);
  if (result)
  {
    LODWORD(v3) = 67109120;
    DWORD1(v3) = MGGetProductType();
    _os_log_error_impl(&dword_237AFF000, v2, OS_LOG_TYPE_ERROR, "GpsdPlatformInfo,Unknown or unsupported hardware,%x", (uint8_t *)&v3, 8u);
    return 0;
  }
  return result;
}

void gnss::stringify(int a1@<W0>, void *a2@<X8>)
{
  switch(a1)
  {
    case 0:
      long long v3 = "kDropped";
      goto LABEL_11;
    case 1:
      long long v3 = "kSuccess";
      goto LABEL_11;
    case 2:
      long long v3 = "kAborted";
      goto LABEL_11;
    case 3:
      long long v3 = "kInUse";
      goto LABEL_11;
    case 4:
      long long v3 = "kInvalidArgument";
      goto LABEL_11;
    case 5:
      long long v3 = "kPermissionDenied";
      goto LABEL_11;
    case 6:
      long long v3 = "kTimeout";
      goto LABEL_11;
    case 7:
      long long v3 = "kUnavailable";
      goto LABEL_11;
    case 8:
      long long v3 = "kCompletedWithFailure";
LABEL_11:
      std::string::basic_string[abi:ne180100]<0>(a2, v3);
      break;
    default:
      std::to_string(&v6, a1);
      int v4 = std::string::insert(&v6, 0, "unknown ");
      long long v5 = *(_OWORD *)&v4->__r_.__value_.__l.__data_;
      a2[2] = *((void *)&v4->__r_.__value_.__l + 2);
      *(_OWORD *)a2 = v5;
      v4->__r_.__value_.__l.__size_ = 0;
      v4->__r_.__value_.__r.__words[2] = 0;
      v4->__r_.__value_.__r.__words[0] = 0;
      if (SHIBYTE(v6.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v6.__r_.__value_.__l.__data_);
      }
      break;
  }
}

void sub_237B1FD1C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t gnss::MeasurementData::fillIsUsableFlag(gnss::MeasurementData *this)
{
  uint64_t result = GpsdPlatformInfo::instance(0);
  unsigned int v3 = *(_DWORD *)(result + 8) - 103;
  BOOL v4 = v3 > 4;
  int v5 = (1 << v3) & 0x19;
  if (!v4 && v5 != 0)
  {
    uint64_t v7 = *((void *)this + 19);
    for (uint64_t i = *((void *)this + 20); v7 != i; v7 += 176)
    {
      if (*(double *)(v7 + 48) < 0.0
        || (float v9 = *(float *)(v7 + 56), v9 <= 0.0)
        || (*(void *)(v7 + 64) & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FEFFFFFFFFFFFFFLL)
      {
        BOOL v11 = 0;
      }
      else
      {
        double v10 = *(double *)(v7 + 72);
        BOOL v11 = v9 < 5000.0;
        if (v10 <= 0.0) {
          BOOL v11 = 0;
        }
        if (v10 >= 50.0) {
          BOOL v11 = 0;
        }
      }
      *(unsigned char *)(v7 + 173) = v11;
    }
  }
  return result;
}

uint64_t calculateGcd(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    return a1;
  }
  do
  {
    uint64_t v2 = a2;
    a2 = a1 % a2;
    LODWORD(a1) = v2;
  }
  while (a2);
  return v2;
}

unint64_t gpsd::util::getMachContinuousTimeNs(gpsd::util *this)
{
  {
    getTickToNsInfo();
  }
  uint64_t v1 = mach_continuous_time();
  char v2 = 8;
  if (!getTickToNsInfo(void)::info) {
    char v2 = 0;
  }
  return ((v1 >> v2) * getTickToNsInfo(void)::info / getTickToNsInfo(void)::info) << v2;
}

void sub_237B1FED4(_Unwind_Exception *a1)
{
}

void getTickToNsInfo(void)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (!getTickToNsInfo(void)::info)
  {
    mach_timebase_info(&info);
    if (info.denom)
    {
      uint32_t denom = info.denom;
      uint32_t numer = info.numer;
      do
      {
        uint32_t v2 = denom;
        uint32_t denom = numer % denom;
        uint32_t numer = v2;
      }
      while (denom);
    }
    else
    {
      uint32_t v2 = info.numer;
      if (!info.numer)
      {
        float v9 = GpsdLogObjectGeneral;
        if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)std::__split_buffer<std::string> buf = 0;
          _os_log_error_impl(&dword_237AFF000, v9, OS_LOG_TYPE_ERROR, "gcd result is zero", buf, 2u);
          float v9 = GpsdLogObjectGeneral;
        }
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)std::__split_buffer<std::string> buf = 136446722;
          uint64_t v21 = "/Library/Caches/com.apple.xbs/Sources/CoreGPS/Sources/Daemon/GpsdUtil.mm";
          __int16 v22 = 1026;
          *(_DWORD *)unint64_t v23 = 86;
          *(_WORD *)&v23[4] = 2082;
          *(void *)&v23[6] = "getTickToNsInfo";
          _os_log_error_impl(&dword_237AFF000, v9, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: assertion failure in %{public}s", buf, 0x1Cu);
        }
        std::string::basic_string[abi:ne180100]<0>(&v18, "assert");
        std::string::basic_string[abi:ne180100]<0>(&v17, "getTickToNsInfo");
        std::string::basic_string[abi:ne180100]<0>(&v16, "gcd result is zero");
        gpsd::util::triggerDiagnosticReport((uint64_t)&v18, (uint64_t)&v17, (uint64_t)&v16);
        std::string::~string(&v16);
        std::string::~string(&v17);
        std::string::~string(&v18);
        __assert_rtn("getTickToNsInfo", "GpsdUtil.mm", 86, "false && \"gcd result is zero\"");
      }
    }
    getTickToNsInfo(void)::mach_timebase_info info = info.denom / v2;
    getTickToNsInfo(void)::mach_timebase_info info = info.numer / v2;
    if (v2 > info.denom)
    {
      uint64_t v7 = GpsdLogObjectGeneral;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)std::__split_buffer<std::string> buf = 0;
        _os_log_error_impl(&dword_237AFF000, v7, OS_LOG_TYPE_ERROR, "info.denominator is zero", buf, 2u);
        uint64_t v7 = GpsdLogObjectGeneral;
      }
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)std::__split_buffer<std::string> buf = 136446722;
        uint64_t v21 = "/Library/Caches/com.apple.xbs/Sources/CoreGPS/Sources/Daemon/GpsdUtil.mm";
        __int16 v22 = 1026;
        *(_DWORD *)unint64_t v23 = 89;
        *(_WORD *)&v23[4] = 2082;
        *(void *)&v23[6] = "getTickToNsInfo";
        _os_log_error_impl(&dword_237AFF000, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: assertion failure in %{public}s", buf, 0x1Cu);
      }
      std::string::basic_string[abi:ne180100]<0>(&v15, "assert");
      std::string::basic_string[abi:ne180100]<0>(&v14, "getTickToNsInfo");
      std::string::basic_string[abi:ne180100]<0>(&v13, "info.denominator is zero");
      gpsd::util::triggerDiagnosticReport((uint64_t)&v15, (uint64_t)&v14, (uint64_t)&v13);
      std::string::~string(&v13);
      std::string::~string(&v14);
      std::string::~string(&v15);
      __assert_rtn("getTickToNsInfo", "GpsdUtil.mm", 89, "false && \"info.denominator is zero\"");
    }
    if (v2 > info.numer)
    {
      unint64_t v8 = GpsdLogObjectGeneral;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)std::__split_buffer<std::string> buf = 0;
        _os_log_error_impl(&dword_237AFF000, v8, OS_LOG_TYPE_ERROR, "info.numerator is zero", buf, 2u);
        unint64_t v8 = GpsdLogObjectGeneral;
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)std::__split_buffer<std::string> buf = 136446722;
        uint64_t v21 = "/Library/Caches/com.apple.xbs/Sources/CoreGPS/Sources/Daemon/GpsdUtil.mm";
        __int16 v22 = 1026;
        *(_DWORD *)unint64_t v23 = 90;
        *(_WORD *)&v23[4] = 2082;
        *(void *)&v23[6] = "getTickToNsInfo";
        _os_log_error_impl(&dword_237AFF000, v8, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: assertion failure in %{public}s", buf, 0x1Cu);
      }
      std::string::basic_string[abi:ne180100]<0>(&v12, "assert");
      std::string::basic_string[abi:ne180100]<0>(&v11, "getTickToNsInfo");
      std::string::basic_string[abi:ne180100]<0>(&v10, "info.numerator is zero");
      gpsd::util::triggerDiagnosticReport((uint64_t)&v12, (uint64_t)&v11, (uint64_t)&v10);
      std::string::~string(&v10);
      std::string::~string(&v11);
      std::string::~string(&v12);
      __assert_rtn("getTickToNsInfo", "GpsdUtil.mm", 90, "false && \"info.numerator is zero\"");
    }
    unint64_t v3 = info.numer / v2 * (unint64_t)(info.denom / v2);
    if (v3 >= 0x17D)
    {
      getTickToNsInfo(void)::mach_timebase_info info = 1;
      BOOL v4 = GpsdLogObjectGeneral;
      if (v3 >> 10 > 0x5E)
      {
        if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)std::__split_buffer<std::string> buf = 0;
          _os_log_error_impl(&dword_237AFF000, v4, OS_LOG_TYPE_ERROR, "#gpsdUtil,Cannot protect against overflow in tick to ns", buf, 2u);
        }
      }
      else if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)std::__split_buffer<std::string> buf = 0;
        _os_log_impl(&dword_237AFF000, v4, OS_LOG_TYPE_INFO, "#gpsdUtil,Reducing tick to ns precision to avoid overflow risk", buf, 2u);
      }
    }
    int v5 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG))
    {
      if (getTickToNsInfo(void)::info) {
        int v6 = 8;
      }
      else {
        int v6 = 0;
      }
      *(_DWORD *)std::__split_buffer<std::string> buf = 134218496;
      uint64_t v21 = (const char *)getTickToNsInfo(void)::info;
      __int16 v22 = 2048;
      *(void *)unint64_t v23 = getTickToNsInfo(void)::info;
      *(_WORD *)&v23[8] = 1024;
      *(_DWORD *)&v23[10] = v6;
      _os_log_debug_impl(&dword_237AFF000, v5, OS_LOG_TYPE_DEBUG, "#gpsdUtil,Tick to ns info,Numerator,%llu,Denominator,%llu,PrecisionReductionBits,%d", buf, 0x1Cu);
    }
  }
}

void sub_237B20478(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,char a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,void *a27,uint64_t a28,int a29,__int16 a30,char a31,char a32,void *a33,uint64_t a34,int a35,__int16 a36,char a37,char a38,char a39,uint64_t a40,int a41,__int16 a42,char a43,char a44,void *__p,uint64_t a46,int a47,__int16 a48,char a49,char a50)
{
  if (a50 < 0) {
    operator delete(__p);
  }
  if (*(char *)(v50 - 129) < 0) {
    operator delete(*(void **)(v50 - 152));
  }
  if (*(char *)(v50 - 105) < 0) {
    operator delete(*(void **)(v50 - 128));
  }
  _Unwind_Resume(exception_object);
}

double gpsd::util::getMachContinuousTimeSeconds(gpsd::util *this)
{
  return (double)gpsd::util::getMachContinuousTimeNs(this) * 0.000000001;
}

unint64_t gpsd::util::getMachAbsoluteTimeNs(gpsd::util *this)
{
  {
    getTickToNsInfo();
  }
  uint64_t v1 = mach_absolute_time();
  char v2 = 8;
  if (!getTickToNsInfo(void)::info) {
    char v2 = 0;
  }
  return ((v1 >> v2) * getTickToNsInfo(void)::info / getTickToNsInfo(void)::info) << v2;
}

void sub_237B20608(_Unwind_Exception *a1)
{
}

unint64_t gpsd::util::convertMachTimeInTicksToNs(unint64_t this)
{
  {
    getTickToNsInfo();
  }
  char v2 = 8;
  if (!getTickToNsInfo(void)::info) {
    char v2 = 0;
  }
  return ((this >> v2) * getTickToNsInfo(void)::info / getTickToNsInfo(void)::info) << v2;
}

void sub_237B206A8(_Unwind_Exception *a1)
{
}

unint64_t gpsd::util::convertNsToMachTimeInTicks(unint64_t this)
{
  {
    getTickToNsInfo();
  }
  char v2 = 8;
  if (!getTickToNsInfo(void)::info) {
    char v2 = 0;
  }
  return ((this >> v2) * getTickToNsInfo(void)::info / getTickToNsInfo(void)::info) << v2;
}

void sub_237B20748(_Unwind_Exception *a1)
{
}

BOOL gpsd::util::getCurrentMachContinuousMinusMachAbsoluteTicks(gpsd::util *this, unint64_t *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (mach_get_times())
  {
    unint64_t v3 = GpsdLogObjectGeneral;
    BOOL result = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR);
    if (result)
    {
      *(_WORD *)std::__split_buffer<std::string> buf = 0;
      _os_log_error_impl(&dword_237AFF000, v3, OS_LOG_TYPE_ERROR, "#gpsdUtil,mach_get_times failed", buf, 2u);
      return 0;
    }
  }
  else
  {
    *(void *)this = 0;
    return 1;
  }
  return result;
}

BOOL gpsd::util::getCurrentMachContinuousMinusMachAbsoluteNanoseconds(gpsd::util *this, unint64_t *a2)
{
  int v5 = 0;
  BOOL CurrentMachContinuousMinusMachAbsoluteTicks = gpsd::util::getCurrentMachContinuousMinusMachAbsoluteTicks((gpsd::util *)&v5, a2);
  if (CurrentMachContinuousMinusMachAbsoluteTicks) {
    *(void *)this = gpsd::util::convertMachTimeInTicksToNs((unint64_t)v5);
  }
  return CurrentMachContinuousMinusMachAbsoluteTicks;
}

CFAbsoluteTime gpsd::util::getInaccurateGpsTimeSeconds(gpsd::util *this)
{
  return CFAbsoluteTimeGetCurrent() + -5.0 + 662342413.0;
}

double gpsd::util::getProcessUptimeSec(gpsd::util *this)
{
  if (!gpsd::util::getProcessUptimeSec(void)::sMachContTimeStartNs)
  {
    this = (gpsd::util *)gpsd::util::getMachContinuousTimeNs(this);
    gpsd::util::getProcessUptimeSec(void)::sMachContTimeStartNs = (uint64_t)this;
  }
  return (double)(gpsd::util::getMachContinuousTimeNs(this) - gpsd::util::getProcessUptimeSec(void)::sMachContTimeStartNs)
       * 0.000000001;
}

void gpsd::util::stringify(unsigned int __val@<W0>, uint64_t a2@<X8>)
{
  _DWORD v9[2] = *MEMORY[0x263EF8340];
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  if (__val >= 0x1B || ((0x7FFFE3Fu >> __val) & 1) == 0) {
    goto LABEL_6;
  }
  MEMORY[0x237E295A0](a2, off_264CF0238[__val]);
  uint64_t v4 = *(unsigned __int8 *)(a2 + 23);
  if (*(char *)(a2 + 23) < 0) {
    uint64_t v4 = *(void *)(a2 + 8);
  }
  if (!v4)
  {
LABEL_6:
    std::to_string(&__p, __val);
    int v5 = std::string::insert(&__p, 0, "unknown_");
    std::string::size_type v6 = v5->__r_.__value_.__r.__words[0];
    v9[0] = v5->__r_.__value_.__l.__size_;
    *(void *)((char *)v9 + 7) = *(std::string::size_type *)((char *)&v5->__r_.__value_.__r.__words[1] + 7);
    char v7 = HIBYTE(v5->__r_.__value_.__r.__words[2]);
    v5->__r_.__value_.__l.__size_ = 0;
    v5->__r_.__value_.__r.__words[2] = 0;
    v5->__r_.__value_.__r.__words[0] = 0;
    if (*(char *)(a2 + 23) < 0) {
      operator delete(*(void **)a2);
    }
    *(void *)a2 = v6;
    *(void *)(a2 + 8) = v9[0];
    *(void *)(a2 + 15) = *(void *)((char *)v9 + 7);
    *(unsigned char *)(a2 + 23) = v7;
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
}

void sub_237B20A7C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (*(char *)(v14 + 23) < 0) {
    operator delete(*(void **)v14);
  }
  _Unwind_Resume(exception_object);
}

void gpsd::util::stringify(int __val@<W0>, uint64_t a2@<X8>)
{
  v10[2] = *MEMORY[0x263EF8340];
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  uint64_t v4 = "START";
  switch(__val)
  {
    case 0:
      uint64_t v4 = "PROTO_DEFAULT";
      goto LABEL_62;
    case 1:
      goto LABEL_62;
    case 2:
      uint64_t v4 = "STOP";
      goto LABEL_62;
    case 3:
      uint64_t v4 = "RESET";
      goto LABEL_62;
    case 4:
      uint64_t v4 = "CLEAR";
      goto LABEL_62;
    case 5:
      uint64_t v4 = "DELETE_GNSS_DATA";
      goto LABEL_62;
    case 6:
      uint64_t v4 = "SET_PVTM_REPORT";
      goto LABEL_62;
    case 7:
      uint64_t v4 = "SET_NMEA_HANDLER";
      goto LABEL_62;
    case 8:
      uint64_t v4 = "INJECT_ASSISTANCE_POSITION";
      goto LABEL_62;
    case 9:
      uint64_t v4 = "INJECT_ASSISTANCE_TIME";
      goto LABEL_62;
    case 10:
      uint64_t v4 = "INJECT_ASSISTANCE_FILE";
      goto LABEL_62;
    case 11:
      uint64_t v4 = "INJECT_RTI_FILE";
      goto LABEL_62;
    case 12:
      uint64_t v4 = "INJECT_SVID_BLOCKLIST";
      goto LABEL_62;
    case 13:
      uint64_t v4 = "SET_ASSISTANCE_PRESSURE";
      goto LABEL_62;
    case 14:
      uint64_t v4 = "SET_ASSISTANCE_ACCEL";
      goto LABEL_62;
    case 15:
      uint64_t v4 = "SET_ASSISTANCE_GYRO";
      goto LABEL_62;
    case 16:
      uint64_t v4 = "SET_ASSISTANCE_DEM";
      goto LABEL_62;
    case 17:
      uint64_t v4 = "SET_ASSISTANCE_MAP_VECTOR";
      goto LABEL_62;
    case 18:
      uint64_t v4 = "SET_ASSISTANCE_MOTION_ACTIVITY_CONTEXT";
      goto LABEL_62;
    case 19:
      uint64_t v4 = "SET_ASSISTANCE_MOUNT_STATE";
      goto LABEL_62;
    case 20:
      uint64_t v4 = "SET_ASSISTANCE_SIGNAL_ENVIRONMENT";
      goto LABEL_62;
    case 21:
      uint64_t v4 = "SET_ASSISTANCE_SPEED_CONSTRAINT";
      goto LABEL_62;
    case 22:
      uint64_t v4 = "SET_ASSISTANCE_ALONG_TRACK_VELOCITY";
      goto LABEL_62;
    case 23:
      uint64_t v4 = "SET_POWER_REPORT";
      goto LABEL_62;
    case 24:
      uint64_t v4 = "SET_CONFIG_SIMULATOR_MODE";
      goto LABEL_62;
    case 25:
      uint64_t v4 = "SET_CONFIG_ENABLE_GNSS_CONSTELLATIONS";
      goto LABEL_62;
    case 26:
      uint64_t v4 = "SET_CONFIG_DUTY_CYCLING";
      goto LABEL_62;
    case 27:
      uint64_t v4 = "SET_TIME_TRANSFER_PULSE";
      goto LABEL_62;
    case 28:
      uint64_t v4 = "CLEAN_TIME_TRANSFER_PULSE";
      goto LABEL_62;
    case 29:
      uint64_t v4 = "INJECT_LTL_INFO";
      goto LABEL_62;
    case 30:
      uint64_t v4 = "CNTIN_STATUS_UPDATE";
      goto LABEL_62;
    case 31:
      uint64_t v4 = "SET_THERMAL_RISK_STATE";
      goto LABEL_62;
    case 32:
      uint64_t v4 = "PING";
      goto LABEL_62;
    case 34:
      uint64_t v4 = "BUILD_DEVICE";
      goto LABEL_62;
    case 35:
      uint64_t v4 = "TERMINATION_IMMINENT";
      goto LABEL_62;
    case 36:
      uint64_t v4 = "EXIT";
      goto LABEL_62;
    case 37:
      uint64_t v4 = "FORCE_CLEAR_ALL_NV";
      goto LABEL_62;
    case 38:
      uint64_t v4 = "SET_CONFIG_RF_BAND_ENABLE";
      goto LABEL_62;
    case 51:
      uint64_t v4 = "START_EMERGENCY_PREEMPTIVE_SESSION";
      goto LABEL_62;
    case 52:
      uint64_t v4 = "STOP_EMERGENCY_PREEMPTIVE_SESSION";
      goto LABEL_62;
    case 53:
      uint64_t v4 = "SET_EMERGENCY_CONFIG";
      goto LABEL_62;
    case 54:
      uint64_t v4 = "SET_EMERGENCY_SESSION_SUMMARY_REPORT";
      goto LABEL_62;
    case 55:
      uint64_t v4 = "ENTER_EMERGENCY_MODE";
      goto LABEL_62;
    case 56:
      uint64_t v4 = "EXIT_EMERGENCY_MODE";
      goto LABEL_62;
    case 60:
      uint64_t v4 = "START_EMERGENCY_POSITION";
      goto LABEL_62;
    case 61:
      uint64_t v4 = "STOP_EMERGENCY_POSITION";
      goto LABEL_62;
    case 62:
      uint64_t v4 = "SET_EMERGENCY_POSITION_REPORT";
      goto LABEL_62;
    case 63:
      uint64_t v4 = "SET_EMERGENCY_MEASUREMENT_REPORT";
      goto LABEL_62;
    case 64:
      uint64_t v4 = "SET_NW_ASSISTANCE_NEEDED_REPORT";
      goto LABEL_62;
    case 65:
      uint64_t v4 = "SET_NW_ASSISTANCE_GPS_REF_TIME";
      goto LABEL_62;
    case 66:
      uint64_t v4 = "SET_NW_ASSISTANCE_REF_POSITION";
      goto LABEL_62;
    case 67:
      uint64_t v4 = "SET_NW_ASSISTANCE_GPS_EPHEMERIS";
      goto LABEL_62;
    case 68:
      uint64_t v4 = "SET_NW_ASSISTANCE_GPS_ACQUISITION";
      goto LABEL_62;
    case 69:
      uint64_t v4 = "INJECT_FT_ASSISTANCE";
      goto LABEL_62;
    case 70:
      uint64_t v4 = "DECODE_SUPL_INIT";
      goto LABEL_62;
    case 71:
      uint64_t v4 = "SET_SUPL_INIT";
      goto LABEL_62;
    case 72:
      uint64_t v4 = "SET_SUPL_LOCATIONID_NEEDED_REPORT";
      goto LABEL_62;
    case 73:
      uint64_t v4 = "SET_SUPL_LOCATIONID";
      goto LABEL_62;
    case 74:
      uint64_t v4 = "ABORT_SUPL_SESSION";
      goto LABEL_62;
    case 75:
      uint64_t v4 = "SET_SUPL_SESSION_STATUS_REPORT";
      goto LABEL_62;
    case 76:
      uint64_t v4 = "SET_SUPL_WLAN_MEAS";
LABEL_62:
      MEMORY[0x237E295A0](a2, v4);
      uint64_t v5 = *(unsigned __int8 *)(a2 + 23);
      if (*(char *)(a2 + 23) < 0) {
        uint64_t v5 = *(void *)(a2 + 8);
      }
      if (!v5) {
        goto LABEL_65;
      }
      return;
    default:
LABEL_65:
      std::to_string(&__p, __val);
      std::string::size_type v6 = std::string::insert(&__p, 0, "unknown_");
      std::string::size_type v7 = v6->__r_.__value_.__r.__words[0];
      v10[0] = v6->__r_.__value_.__l.__size_;
      *(void *)((char *)v10 + 7) = *(std::string::size_type *)((char *)&v6->__r_.__value_.__r.__words[1] + 7);
      char v8 = HIBYTE(v6->__r_.__value_.__r.__words[2]);
      v6->__r_.__value_.__l.__size_ = 0;
      v6->__r_.__value_.__r.__words[2] = 0;
      v6->__r_.__value_.__r.__words[0] = 0;
      if (*(char *)(a2 + 23) < 0) {
        operator delete(*(void **)a2);
      }
      *(void *)a2 = v7;
      *(void *)(a2 + 8) = v10[0];
      *(void *)(a2 + 15) = *(void *)((char *)v10 + 7);
      *(unsigned char *)(a2 + 23) = v8;
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      return;
  }
}

void sub_237B20EB8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (*(char *)(v14 + 23) < 0) {
    operator delete(*(void **)v14);
  }
  _Unwind_Resume(exception_object);
}

void gpsd::util::shorthandStringify(int a1@<W0>, void *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  unint64_t v3 = "INJECT_TIME";
  switch(a1)
  {
    case 8:
      unint64_t v3 = "INJECT_POSITION";
      goto LABEL_45;
    case 9:
      goto LABEL_45;
    case 10:
      unint64_t v3 = "INJECT_FILE";
      goto LABEL_45;
    case 11:
      unint64_t v3 = "INJECT_RTI";
      goto LABEL_45;
    case 12:
      unint64_t v3 = "INJECT_BLOCKLIST";
      goto LABEL_45;
    case 14:
      unint64_t v3 = "ACCEL";
      goto LABEL_45;
    case 15:
      unint64_t v3 = "GYRO";
      goto LABEL_45;
    case 16:
      unint64_t v3 = "DEM";
      goto LABEL_45;
    case 17:
      unint64_t v3 = "MAP_VECTOR";
      goto LABEL_45;
    case 18:
      unint64_t v3 = "MOTION_CONTEXT";
      goto LABEL_45;
    case 19:
      unint64_t v3 = "MOUNT_STATE";
      goto LABEL_45;
    case 20:
      unint64_t v3 = "SIGNAL_ENV";
      goto LABEL_45;
    case 21:
      unint64_t v3 = "SPEED_CONSTRAINT";
      goto LABEL_45;
    case 22:
      unint64_t v3 = "ALONG_TRACK_VEL";
      goto LABEL_45;
    case 23:
      unint64_t v3 = "SET_POWER_REPORT";
      goto LABEL_45;
    case 24:
      unint64_t v3 = "CONFIG_SIM";
      goto LABEL_45;
    case 25:
      unint64_t v3 = "CONFIG_CONSTELL";
      goto LABEL_45;
    case 26:
      unint64_t v3 = "CONFIG_DUTY";
      goto LABEL_45;
    case 27:
      unint64_t v3 = "SET_TT_PULSE";
      goto LABEL_45;
    case 28:
      unint64_t v3 = "CLEAN_TT_PULSE";
      goto LABEL_45;
    case 31:
      unint64_t v3 = "THERMAL_RISK";
      goto LABEL_45;
    case 35:
      unint64_t v3 = "TERM_IMMINENT";
      goto LABEL_45;
    case 37:
      unint64_t v3 = "FORCE_CLEAR";
      goto LABEL_45;
    case 38:
      unint64_t v3 = "CONFIG_BANDS";
      goto LABEL_45;
    case 51:
      unint64_t v3 = "START_PREEMPT";
      goto LABEL_45;
    case 52:
      unint64_t v3 = "STOP_PREEMPT";
      goto LABEL_45;
    case 53:
      unint64_t v3 = "EMERG_CONFIG";
      goto LABEL_45;
    case 54:
      unint64_t v3 = "EMERG_SUMMARY";
      goto LABEL_45;
    case 60:
      unint64_t v3 = "START_EMERG";
      goto LABEL_45;
    case 61:
      unint64_t v3 = "STOP_EMERG";
      goto LABEL_45;
    case 62:
      unint64_t v3 = "EMERG_POS_RPT";
      goto LABEL_45;
    case 64:
      unint64_t v3 = "NW_NEEDED_RPT";
      goto LABEL_45;
    case 65:
      unint64_t v3 = "NW_REF_TIME";
      goto LABEL_45;
    case 66:
      unint64_t v3 = "NW_REF_POS";
      goto LABEL_45;
    case 67:
      unint64_t v3 = "NW_EPHEM";
      goto LABEL_45;
    case 68:
      unint64_t v3 = "NW_GPS_ACQUISITION";
      goto LABEL_45;
    case 69:
      unint64_t v3 = "INJECT_FTA_1x";
      goto LABEL_45;
    case 70:
      unint64_t v3 = "DEC_SUPL_INIT";
      goto LABEL_45;
    case 71:
      unint64_t v3 = "SUPL_INIT";
      goto LABEL_45;
    case 72:
      unint64_t v3 = "SUPL_LOCID_NEED";
      goto LABEL_45;
    case 73:
      unint64_t v3 = "SUPL_LOCID";
      goto LABEL_45;
    case 74:
      unint64_t v3 = "ABORT_SUPL";
      goto LABEL_45;
    case 75:
      unint64_t v3 = "SUPL_STATUS";
LABEL_45:
      MEMORY[0x237E295A0](a2, v3);
      break;
    default:
      gpsd::util::stringify(a1, (uint64_t)&v4);
      *(_OWORD *)a2 = v4;
      a2[2] = v5;
      break;
  }
}

void sub_237B212A0(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

BOOL gpsd::util::isRequestTypeHighRate(int a1)
{
  return (a1 & 0xFFFFFFFE) == 14;
}

uint64_t gpsd::util::fletcher16(unsigned __int8 **a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = a1[1] - *a1;
  if (v2)
  {
    __int16 v3 = 0;
    __int16 v4 = 0;
    do
    {
      __int16 v5 = *v1++;
      v4 += v5;
      v3 += v4;
      --v2;
    }
    while (v2);
  }
  else
  {
    LOBYTE(v4) = 0;
    __int16 v3 = 0;
  }
  return (unsigned __int16)(v4 | (unsigned __int16)(v3 << 8));
}

uint64_t gpsd::util::fletcher16(gpsd::util *this, const unsigned __int8 *a2)
{
  if (a2)
  {
    __int16 v2 = 0;
    __int16 v3 = 0;
    do
    {
      __int16 v4 = *(unsigned __int8 *)this;
      this = (gpsd::util *)((char *)this + 1);
      v3 += v4;
      v2 += v3;
      --a2;
    }
    while (a2);
  }
  else
  {
    LOBYTE(v3) = 0;
    __int16 v2 = 0;
  }
  return (unsigned __int16)(v3 | (unsigned __int16)(v2 << 8));
}

uint64_t gpsd::util::fletcher16(unsigned __int8 *a1)
{
  uint64_t v1 = a1[23];
  if ((v1 & 0x80u) == 0) {
    __int16 v2 = a1;
  }
  else {
    __int16 v2 = *(unsigned __int8 **)a1;
  }
  if ((v1 & 0x80u) != 0) {
    uint64_t v1 = *((void *)a1 + 1);
  }
  if (v1)
  {
    __int16 v3 = 0;
    __int16 v4 = 0;
    do
    {
      __int16 v5 = *v2++;
      v4 += v5;
      v3 += v4;
      --v1;
    }
    while (v1);
  }
  else
  {
    LOBYTE(v4) = 0;
    __int16 v3 = 0;
  }
  return (unsigned __int16)(v4 | (unsigned __int16)(v3 << 8));
}

uint64_t gpsd::util::truncatedSha256(uint64_t a1)
{
  return gpsd::util::truncatedSha256(*(gpsd::util **)a1, (const void *)(*(void *)(a1 + 8) - *(void *)a1));
}

{
  if (*(char *)(a1 + 23) >= 0) {
    return gpsd::util::truncatedSha256((gpsd::util *)a1, (const void *)*(unsigned __int8 *)(a1 + 23));
  }
  else {
    return gpsd::util::truncatedSha256(*(gpsd::util **)a1, *(const void **)(a1 + 8));
  }
}

uint64_t gpsd::util::truncatedSha256(gpsd::util *this, const void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (CC_SHA256(this, (CC_LONG)a2, md)) {
    return bswap32(*(unsigned int *)md);
  }
  __int16 v5 = GpsdLogObjectGeneral;
  uint64_t result = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR);
  if (result)
  {
    int v6 = 134218240;
    std::string::size_type v7 = this;
    __int16 v8 = 2048;
    float v9 = a2;
    _os_log_error_impl(&dword_237AFF000, v5, OS_LOG_TYPE_ERROR, "#gpsdUtil,CC_SHA256 failed on,%p,%zu", (uint8_t *)&v6, 0x16u);
    return 0;
  }
  return result;
}

BOOL gpsd::util::getVersionNumberFromDylib(gpsd::util *this, _DWORD *a2, int *a3)
{
  __int16 v4 = (uint64_t (*)(void))dlsym(this, "getGnssDeviceVersion");
  __int16 v5 = v4;
  if (v4)
  {
    *a2 = v4();
  }
  else
  {
    int v6 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__int16 v8 = 0;
      _os_log_error_impl(&dword_237AFF000, v6, OS_LOG_TYPE_ERROR, "gpsdUtil,Could not dlsym for version number", v8, 2u);
    }
  }
  return v5 != 0;
}

BOOL gpsd::util::getVersionStringFromDylib(void *a1, uint64_t a2)
{
  __int16 v3 = (uint64_t (*)(void))dlsym(a1, "getVersionString");
  __int16 v4 = v3;
  if (v3)
  {
    uint64_t v5 = v3();
    if (v5) {
      int v6 = (const char *)v5;
    }
    else {
      int v6 = "(null)";
    }
    MEMORY[0x237E295A0](a2, v6);
  }
  else
  {
    std::string::size_type v7 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)float v9 = 0;
      _os_log_error_impl(&dword_237AFF000, v7, OS_LOG_TYPE_ERROR, "gpsdUtil,Could not dlsym for version string", v9, 2u);
    }
  }
  return v4 != 0;
}

BOOL gpsd::util::readFileIntoVector(uint64_t a1, uint64_t a2)
{
  v38[19] = *MEMORY[0x263EF8340];
  std::ifstream::basic_ifstream(v35);
  uint64_t v4 = v37;
  if (v37)
  {
    uint64_t v28 = a1;
    uint64_t v5 = *(void **)&v36[*(void *)(v35[0] - 24) + 24];
    uint64_t v34 = 0;
    long long buf = 0uLL;
    if (v5)
    {
      int v6 = 0;
      while (1)
      {
        std::string::size_type v7 = (char *)v5[3];
        __int16 v8 = (char *)v5[4];
        if (v7 == v8)
        {
          if ((*(unsigned int (**)(void *))(*v5 + 72))(v5) == -1)
          {
            uint64_t v22 = buf;
            unint64_t v23 = v34;
            goto LABEL_35;
          }
          std::string::size_type v7 = (char *)v5[3];
          __int16 v8 = (char *)v5[4];
        }
        if (v7 == v8) {
          char v9 = (*(uint64_t (**)(void *))(*v5 + 72))(v5);
        }
        else {
          char v9 = *v7;
        }
        if (v6 >= v34)
        {
          unint64_t v10 = buf;
          uint64_t v11 = &v6[-buf];
          uint64_t v12 = (uint64_t)&v6[-buf + 1];
          if (v12 < 0) {
            std::vector<gnssTest::RfMeasurement>::__throw_length_error[abi:ne180100]();
          }
          unint64_t v13 = (unint64_t)&v34[-buf];
          if (2 * (uint64_t)&v34[-buf] > (unint64_t)v12) {
            uint64_t v12 = 2 * v13;
          }
          if (v13 >= 0x3FFFFFFFFFFFFFFFLL) {
            size_t v14 = 0x7FFFFFFFFFFFFFFFLL;
          }
          else {
            size_t v14 = v12;
          }
          if (v14) {
            std::string v15 = (char *)operator new(v14);
          }
          else {
            std::string v15 = 0;
          }
          std::string v16 = &v11[(void)v15];
          std::string v17 = &v11[(void)v15];
          char *v17 = v9;
          std::string v18 = v17 + 1;
          if (v6 != (char *)v10)
          {
            uint64_t v19 = &v6[~v10];
            do
            {
              char v20 = *--v6;
              (v19--)[(void)v15] = v20;
            }
            while (v6 != (char *)v10);
            int v6 = (char *)buf;
            std::string v16 = v15;
          }
          *(void *)&long long buf = v16;
          *((void *)&buf + 1) = v18;
          uint64_t v34 = &v15[v14];
          if (v6) {
            operator delete(v6);
          }
          int v6 = v18;
        }
        else
        {
          *v6++ = v9;
        }
        *((void *)&buf + 1) = v6;
        uint64_t v21 = v5[3];
        if (v21 == v5[4]) {
          (*(void (**)(void *))(*v5 + 80))(v5);
        }
        else {
          v5[3] = v21 + 1;
        }
      }
    }
    unint64_t v23 = 0;
    int v6 = 0;
    uint64_t v22 = 0;
LABEL_35:
    int v25 = *(void **)a2;
    *(void *)a2 = v22;
    *(void *)(a2 + 8) = v6;
    *(void *)(a2 + 16) = v23;
    long long v26 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)uint64_t v29 = 136315394;
      uint64_t v30 = v28;
      __int16 v31 = 2048;
      BOOL v32 = &v6[-v22];
      _os_log_debug_impl(&dword_237AFF000, v26, OS_LOG_TYPE_DEBUG, "readFileIntoVector,%s,size,%zu", v29, 0x16u);
      if (!v25) {
        goto LABEL_38;
      }
      goto LABEL_37;
    }
    if (v25) {
LABEL_37:
    }
      operator delete(v25);
  }
  else
  {
    uint64_t v24 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = a1;
      _os_log_impl(&dword_237AFF000, v24, OS_LOG_TYPE_DEFAULT, "readFileIntoVector,failed to open %{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
LABEL_38:
  v35[0] = *MEMORY[0x263F8C2A8];
  *(uint64_t *)((char *)v35 + *(void *)(v35[0] - 24)) = *(void *)(MEMORY[0x263F8C2A8] + 24);
  MEMORY[0x237E29690](v36);
  std::istream::~istream();
  MEMORY[0x237E298C0](v38);
  return v4 != 0;
}

void sub_237B21AD8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
}

uint64_t gpsd::util::writeVectorToClassDFileWithRename(uint64_t a1, uint64_t a2)
{
  __int16 v2 = (const void **)a2;
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (*(char *)(a2 + 23) >= 0) {
    size_t v4 = *(unsigned __int8 *)(a2 + 23);
  }
  else {
    size_t v4 = *(void *)(a2 + 8);
  }
  uint64_t v5 = __p;
  std::string::basic_string[abi:ne180100]((uint64_t)__p, v4 + 4);
  if (v19 < 0) {
    uint64_t v5 = (void **)__p[0];
  }
  if (v4)
  {
    if (*((char *)v2 + 23) >= 0) {
      int v6 = v2;
    }
    else {
      int v6 = *v2;
    }
    memmove(v5, v6, v4);
  }
  strcpy((char *)v5 + v4, ".tmp");
  if (!gpsd::util::writeVectorToClassDFile(a1, (uint64_t)__p)) {
    goto LABEL_20;
  }
  if (v19 >= 0) {
    __int16 v8 = (const std::__fs::filesystem::path *)__p;
  }
  else {
    __int16 v8 = (const std::__fs::filesystem::path *)__p[0];
  }
  if (*((char *)v2 + 23) >= 0) {
    char v9 = (const std::__fs::filesystem::path *)v2;
  }
  else {
    char v9 = (const std::__fs::filesystem::path *)*v2;
  }
  rename(v8, v9, v7);
  unint64_t v10 = GpsdLogObjectGeneral;
  if (v11)
  {
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      if (*((char *)v2 + 23) < 0) {
        __int16 v2 = (const void **)*v2;
      }
      int v14 = *__error();
      std::string v15 = __error();
      std::string v16 = strerror(*v15);
      *(_DWORD *)long long buf = 136446722;
      uint64_t v21 = v2;
      __int16 v22 = 1026;
      int v23 = v14;
      __int16 v24 = 2082;
      int v25 = v16;
      _os_log_error_impl(&dword_237AFF000, v10, OS_LOG_TYPE_ERROR, "writeVectorToClassDFileWithRename,renameFailed,%{public}s,err,%{public}d,%{public}s", buf, 0x1Cu);
    }
LABEL_20:
    uint64_t v12 = 0;
    goto LABEL_21;
  }
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG))
  {
    if (*((char *)v2 + 23) >= 0) {
      std::string v17 = v2;
    }
    else {
      std::string v17 = (const void **)*v2;
    }
    *(_DWORD *)long long buf = 136446210;
    uint64_t v21 = v17;
    _os_log_debug_impl(&dword_237AFF000, v10, OS_LOG_TYPE_DEBUG, "writeVectorToClassDFileWithRename,success,%{public}s", buf, 0xCu);
  }
  uint64_t v12 = 1;
LABEL_21:
  if (v19 < 0) {
    operator delete(__p[0]);
  }
  return v12;
}

void sub_237B21D1C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

BOOL gpsd::util::writeVectorToClassDFile(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (*(char *)(a2 + 23) >= 0) {
    __int16 v3 = (const char *)a2;
  }
  else {
    __int16 v3 = *(const char **)a2;
  }
  size_t v4 = fopen(v3, "wb+");
  if (!v4)
  {
    unint64_t v10 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      int v14 = *__error();
      int v16 = 67240192;
      int v17 = v14;
      uint64_t v12 = "#utilWriteVector,open failed,%{public}d";
      goto LABEL_15;
    }
    return 0;
  }
  int v6 = v4;
  gpsd::util::changeFileToClassD(v4, v5);
  size_t v7 = fwrite(*(const void **)a1, *(void *)(a1 + 8) - *(void *)a1, 1uLL, v6);
  BOOL v8 = v7 == 1;
  if (v7 != 1)
  {
    char v9 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      int v15 = *__error();
      int v16 = 67240192;
      int v17 = v15;
      _os_log_error_impl(&dword_237AFF000, v9, OS_LOG_TYPE_ERROR, "#utilWriteVector,write failed,%{public}d", (uint8_t *)&v16, 8u);
    }
  }
  if (fclose(v6))
  {
    unint64_t v10 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      int v11 = *__error();
      int v16 = 67240192;
      int v17 = v11;
      uint64_t v12 = "#utilWriteVector,close failed,%{public}d";
LABEL_15:
      _os_log_error_impl(&dword_237AFF000, v10, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v16, 8u);
      return 0;
    }
    return 0;
  }
  return v8;
}

void gpsd::util::changeFileToClassD(FILE *this, __sFILE *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (this)
  {
    int v2 = fileno(this);
    if (v2 == -1)
    {
      uint64_t v4 = GpsdLogObjectGeneral;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
      {
        int v10 = *__error();
        *(_DWORD *)long long buf = 67240192;
        int v12 = v10;
        int v6 = "#utilFileClass,fileno failed,%{public}d";
        goto LABEL_12;
      }
    }
    else
    {
      int v3 = v2;
      if (fcntl(v2, 63) != 4)
      {
        if (fcntl(v3, 64, 4))
        {
          uint64_t v4 = GpsdLogObjectGeneral;
          if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
          {
            int v5 = *__error();
            *(_DWORD *)long long buf = 67240192;
            int v12 = v5;
            int v6 = "#utilFileClass,set class failed,%{public}d";
LABEL_12:
            BOOL v8 = v4;
            uint32_t v9 = 8;
            goto LABEL_13;
          }
        }
      }
    }
  }
  else
  {
    uint64_t v7 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      int v6 = "#utilFileClass,nullptr";
      BOOL v8 = v7;
      uint32_t v9 = 2;
LABEL_13:
      _os_log_error_impl(&dword_237AFF000, v8, OS_LOG_TYPE_ERROR, v6, buf, v9);
    }
  }
}

void gpsd::util::triggerDiagnosticReport(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(char *)(a1 + 23) < 0) {
    std::string::__init_copy_ctor_external(&v5, *(const std::string::value_type **)a1, *(void *)(a1 + 8));
  }
  else {
    std::string v5 = *(std::string *)a1;
  }
  if (*(char *)(a2 + 23) < 0) {
    std::string::__init_copy_ctor_external(&v6, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
  }
  else {
    std::string v6 = *(std::string *)a2;
  }
  if (*(char *)(a3 + 23) < 0) {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a3, *(void *)(a3 + 8));
  }
  else {
    std::string __p = *(std::string *)a3;
  }
  char v8 = 0;
  gpsd::util::triggerDiagnosticReport((gpsd::util *)&v5, (const gpsd::util::DiagnosticReportParameters *)a2);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v6.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v6.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v5.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v5.__r_.__value_.__l.__data_);
  }
}

void sub_237B22150(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0) {
    operator delete(__p);
  }
  if (a14 < 0) {
    operator delete(a9);
  }
  _Unwind_Resume(exception_object);
}

void gpsd::util::triggerDiagnosticReport(gpsd::util *this, const gpsd::util::DiagnosticReportParameters *a2)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  if (objc_opt_class())
  {
    id v3 = objc_alloc_init(MEMORY[0x263F7C078]);
    if (*((char *)this + 23) >= 0) {
      uint64_t v4 = this;
    }
    else {
      uint64_t v4 = *(gpsd::util **)this;
    }
    uint64_t v5 = [NSString stringWithUTF8String:v4];
    if (*((char *)this + 47) >= 0) {
      std::string v6 = (char *)this + 24;
    }
    else {
      std::string v6 = (char *)*((void *)this + 3);
    }
    uint64_t v7 = [NSString stringWithUTF8String:v6];
    if (*((char *)this + 71) >= 0) {
      char v8 = (char *)this + 48;
    }
    else {
      char v8 = (char *)*((void *)this + 6);
    }
    uint64_t v9 = objc_msgSend(v3, "signatureWithDomain:type:subType:subtypeContext:detectedProcess:triggerThresholdValues:", @"GPSDaemon", v5, v7, objc_msgSend(NSString, "stringWithUTF8String:", v8), @"com.apple.gpsd", 0);
    int v10 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      if (*((char *)this + 23) >= 0) {
        int v11 = this;
      }
      else {
        int v11 = *(gpsd::util **)this;
      }
      if (*((char *)this + 47) >= 0) {
        int v12 = (char *)this + 24;
      }
      else {
        int v12 = (char *)*((void *)this + 3);
      }
      if (*((char *)this + 71) >= 0) {
        uint64_t v13 = (char *)this + 48;
      }
      else {
        uint64_t v13 = (char *)*((void *)this + 6);
      }
      LODWORD(buf.__m_.__sig) = 136315650;
      *(uint64_t *)((char *)&buf.__m_.__sig + 4) = (uint64_t)v11;
      *(_WORD *)&buf.__m_.__opaque[4] = 2080;
      *(void *)&buf.__m_.__opaque[6] = v12;
      *(_WORD *)&buf.__m_.__opaque[14] = 2080;
      *(void *)&buf.__m_.__opaque[16] = v13;
      _os_log_impl(&dword_237AFF000, v10, OS_LOG_TYPE_DEFAULT, "#gsdr,type,%s,subtype,%s,context,%s", (uint8_t *)&buf, 0x20u);
    }
    memset(v33.__cv_.__opaque, 0, sizeof(v33.__cv_.__opaque));
    v33.__cv_.__sig = 1018212795;
    uint64_t v25 = 0;
    uint64_t v26 = &v25;
    uint64_t v27 = 0x3812000000;
    uint64_t v28 = __Block_byref_object_copy__1;
    uint64_t v30 = 0;
    __int16 v31 = 0;
    uint64_t v29 = __Block_byref_object_dispose__1;
    if (*((unsigned char *)this + 72)) {
      operator new();
    }
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = ___ZN4gpsd4util23triggerDiagnosticReportERKNS0_26DiagnosticReportParametersE_block_invoke;
    v24[3] = &unk_264CF0218;
    v24[4] = &v25;
    if ([v3 snapshotWithSignature:v9 duration:0 events:0 payload:0 actions:v24 reply:0.0])
    {
      if (*((unsigned char *)this + 72))
      {
        memset(buf.__m_.__opaque, 0, sizeof(buf.__m_.__opaque));
        buf.__m_.__sig = 850045863;
        __lk.__m_ = &buf;
        __lk.__owns_ = 1;
        std::mutex::lock(&buf);
        int v14 = (std::condition_variable *)v26[6];
        v15.__d_.__rep_ = std::chrono::steady_clock::now().__d_.__rep_;
        v16.__d_.__rep_ = std::chrono::system_clock::now().__d_.__rep_;
        if (v16.__d_.__rep_)
        {
          if (v16.__d_.__rep_ < 1)
          {
            if ((unint64_t)v16.__d_.__rep_ >= 0xFFDF3B645A1CAC09) {
              v17.__d_.__rep_ = 1000 * v16.__d_.__rep_ + 5000000000;
            }
            else {
              v17.__d_.__rep_ = 0x800000012A05F200;
            }
          }
          else if ((unint64_t)v16.__d_.__rep_ < 0x20C49BA59708B8)
          {
            v17.__d_.__rep_ = 1000 * v16.__d_.__rep_ + 5000000000;
          }
          else
          {
            v17.__d_.__rep_ = 0x7FFFFFFFFFFFFFFFLL;
          }
        }
        else
        {
          v17.__d_.__rep_ = 5000000000;
        }
        std::condition_variable::__do_timed_wait(v14, &__lk, v17);
        if (std::chrono::steady_clock::now().__d_.__rep_ - v15.__d_.__rep_ > 0x12A05F1FFLL)
        {
          char v19 = GpsdLogObjectGeneral;
          if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)__int16 v22 = 0;
            _os_log_error_impl(&dword_237AFF000, v19, OS_LOG_TYPE_ERROR, "#gsdr,wait timeout", v22, 2u);
          }
        }
        if (__lk.__owns_) {
          std::mutex::unlock(__lk.__m_);
        }
        std::mutex::~mutex(&buf);
      }
    }
    else
    {
      uint64_t v18 = GpsdLogObjectGeneral;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf.__m_.__sig) = 0;
        _os_log_error_impl(&dword_237AFF000, v18, OS_LOG_TYPE_ERROR, "#gsdr,return failure", (uint8_t *)&buf, 2u);
      }
    }
    char v20 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf.__m_.__sig) = 0;
      _os_log_impl(&dword_237AFF000, v20, OS_LOG_TYPE_DEFAULT, "#gsdr,exit", (uint8_t *)&buf, 2u);
    }

    _Block_object_dispose(&v25, 8);
    uint64_t v21 = v31;
    __int16 v31 = 0;
    if (v21)
    {
      std::condition_variable::~condition_variable(v21);
      MEMORY[0x237E29950]();
    }
    std::condition_variable::~condition_variable(&v33);
  }
}

void sub_237B22668(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, std::mutex *a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25)
{
  std::mutex::~mutex((std::mutex *)&a25);
  _Block_object_dispose(&a18, 8);
  std::unique_ptr<std::condition_variable>::reset[abi:ne180100]((std::condition_variable **)(v25 + 48), 0);
  std::condition_variable::~condition_variable((std::condition_variable *)(v26 - 136));
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  *(void *)(a2 + 48) = 0;
  *(void *)(result + 48) = v2;
  return result;
}

std::condition_variable *__Block_byref_object_dispose__1(uint64_t a1)
{
  return std::unique_ptr<std::condition_variable>::reset[abi:ne180100]((std::condition_variable **)(a1 + 48), 0);
}

void ___ZN4gpsd4util23triggerDiagnosticReportERKNS0_26DiagnosticReportParametersE_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x263F7C158]), "BOOLValue"))
  {
    uint64_t v4 = (void *)[a2 objectForKeyedSubscript:*MEMORY[0x263F7C148]];
    uint64_t v5 = GpsdLogObjectGeneral;
    if (!os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    int v12 = 136315138;
    uint64_t v13 = [v4 UTF8String];
    std::string v6 = "#gsdr,accepted,%s";
    uint64_t v7 = v5;
    uint32_t v8 = 12;
  }
  else
  {
    uint64_t v9 = (void *)[a2 objectForKeyedSubscript:*MEMORY[0x263F7C130]];
    uint64_t v10 = GpsdLogObjectGeneral;
    if (!os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    int v12 = 67109120;
    LODWORD(v13) = [v9 intValue];
    std::string v6 = "#gsdr,rejected,reason,%d";
    uint64_t v7 = v10;
    uint32_t v8 = 8;
  }
  _os_log_impl(&dword_237AFF000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v12, v8);
LABEL_7:
  int v11 = *(std::condition_variable **)(*(void *)(*(void *)(a1 + 32) + 8) + 48);
  if (v11) {
    std::condition_variable::notify_one(v11);
  }
}

char *gpsd::util::getGpsWeekFromBuildDate(gpsd::util *this)
{
  uint64_t result = (char *)gpsd::util::getGpsWeekFromBuildDate(void)::buildWeek;
  if (gpsd::util::getGpsWeekFromBuildDate(void)::buildWeek <= 0)
  {
    memset(&v4, 0, sizeof(v4));
    uint64_t result = strptime("Nov 10 2024 02:27:50", "%b %d %Y %H:%M:%S", &v4);
    if (result)
    {
      time_t v2 = mktime(&v4);
      if (v2 < 0)
      {
        return 0;
      }
      else
      {
        double v3 = ((double)v2 + -315964800.0 + -259200.0) / 604800.0;
        uint64_t result = (char *)(int)v3;
        gpsd::util::getGpsWeekFromBuildDate(void)::buildWeek = (int)v3;
      }
    }
  }
  return result;
}

void gpsd::util::charToHex(gpsd::util *this@<X0>, const unsigned __int8 *a2@<X1>, int __c@<W2>, std::string *a4@<X8>)
{
  if (a2)
  {
    uint32_t v8 = 0;
    a4->__r_.__value_.__r.__words[0] = 0;
    a4->__r_.__value_.__l.__size_ = 0;
    a4->__r_.__value_.__r.__words[2] = 0;
    do
    {
      if (__c)
      {
        if (v8) {
          std::string::push_back(a4, __c);
        }
      }
      std::string::push_back(a4, __const__ZN4gpsd4util9charToHexEPKhmc_charmap[(unint64_t)v8[(void)this] >> 4]);
      std::string::push_back(a4, __const__ZN4gpsd4util9charToHexEPKhmc_charmap[(v8++)[(void)this] & 0xF]);
    }
    while (a2 != v8);
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(a4, "EmptyBuffer");
  }
}

void sub_237B229AC(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void gpsd::util::charToHex(gpsd::util *this@<X0>, const unsigned __int8 *a2@<X1>, int a3@<W2>, std::string *a4@<X8>)
{
  if (((unint64_t)a2 & 0x8000000000000000) != 0) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  gpsd::util::charToHex(this, a2, a3, a4);
}

void gpsd::util::logBinaryBytes(gpsd::util *this, const unsigned __int8 *a2, uint64_t a3, const char *a4)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (a2)
  {
    unint64_t v7 = 0;
    uint32_t v8 = a2;
    do
    {
      uint64_t v9 = GpsdLogObjectGeneral;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG))
      {
        if ((unint64_t)v8 >= 0x40) {
          uint64_t v10 = 64;
        }
        else {
          uint64_t v10 = (uint64_t)v8;
        }
        gpsd::util::charToHex((gpsd::util *)((char *)this + v7), (const unsigned __int8 *)v10, 0, &__p);
        p_p = &__p;
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
          p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
        }
        *(_DWORD *)std::mutex buf = 136315906;
        uint64_t v14 = a3;
        __int16 v15 = 2048;
        std::chrono::system_clock::time_point v16 = a2;
        __int16 v17 = 2048;
        unint64_t v18 = v7;
        __int16 v19 = 2080;
        char v20 = p_p;
        _os_log_debug_impl(&dword_237AFF000, v9, OS_LOG_TYPE_DEBUG, "%s,%zu,%zu,%s", buf, 0x2Au);
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__p.__r_.__value_.__l.__data_);
        }
      }
      v7 += 64;
      v8 -= 64;
    }
    while (v7 < (unint64_t)a2);
  }
}

void gpsd::util::dispatchQueueInit(dispatch_queue_t *a1, dispatch_qos_class_t a2, const std::string::value_type *a3)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  std::string v6 = (std::string *)std::string::basic_string[abi:ne180100]<0>(buf, "com.apple.gpsd.");
  unint64_t v7 = std::string::append(v6, a3);
  long long v8 = *(_OWORD *)&v7->__r_.__value_.__l.__data_;
  int64_t v23 = v7->__r_.__value_.__r.__words[2];
  *(_OWORD *)std::string __p = v8;
  v7->__r_.__value_.__l.__size_ = 0;
  v7->__r_.__value_.__r.__words[2] = 0;
  v7->__r_.__value_.__r.__words[0] = 0;
  if (SBYTE3(v28) < 0) {
    operator delete(*(void **)buf);
  }
  uint64_t v9 = dispatch_queue_attr_make_with_qos_class(0, a2, 0);
  if (!v9)
  {
    uint64_t v10 = GpsdLogObjectWarning;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectWarning, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = __p;
      if (v23 < 0) {
        int v11 = (void **)__p[0];
      }
      *(_DWORD *)std::mutex buf = 136446210;
      *(void *)&uint8_t buf[4] = v11;
      _os_log_impl(&dword_237AFF000, v10, OS_LOG_TYPE_DEFAULT, "dispatchQueueInit,nullattr,%{public}s", buf, 0xCu);
    }
  }
  if (v23 >= 0) {
    int v12 = __p;
  }
  else {
    int v12 = (void **)__p[0];
  }
  dispatch_queue_t v13 = dispatch_queue_create((const char *)v12, v9);
  *a1 = v13;
  if (!v13)
  {
    uint64_t v14 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      __int16 v15 = __p;
      if (v23 < 0) {
        __int16 v15 = (void **)__p[0];
      }
      *(_DWORD *)std::mutex buf = 136446210;
      *(void *)&uint8_t buf[4] = v15;
      _os_log_error_impl(&dword_237AFF000, v14, OS_LOG_TYPE_ERROR, "dispatchQueueInit,queue,null,%{public}s", buf, 0xCu);
      uint64_t v14 = GpsdLogObjectGeneral;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)std::mutex buf = 136446722;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/CoreGPS/Sources/Daemon/GpsdUtil.mm";
      __int16 v25 = 1026;
      int v26 = 636;
      __int16 v27 = 2082;
      uint64_t v28 = "dispatchQueueInit";
      _os_log_error_impl(&dword_237AFF000, v14, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: assertion failure in %{public}s", buf, 0x1Cu);
    }
    std::string::basic_string[abi:ne180100]<0>(v20, "assert");
    std::string::basic_string[abi:ne180100]<0>(v18, "dispatchQueueInit");
    std::string::basic_string[abi:ne180100]<0>(v16, "dispatchQueueInit,queue,null,%{public}s");
    gpsd::util::triggerDiagnosticReport((uint64_t)v20, (uint64_t)v18, (uint64_t)v16);
    if (v17 < 0) {
      operator delete(v16[0]);
    }
    if (v19 < 0) {
      operator delete(v18[0]);
    }
    if (v21 < 0) {
      operator delete(v20[0]);
    }
    __assert_rtn("dispatchQueueInit", "GpsdUtil.mm", 636, "false && \"dispatchQueueInit,queue,null,%{public}s\"");
  }
  if (SHIBYTE(v23) < 0) {
    operator delete(__p[0]);
  }
}

void sub_237B22E14(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33)
{
  if (*(char *)(v33 - 57) < 0) {
    operator delete(*(void **)(v33 - 80));
  }
  _Unwind_Resume(exception_object);
}

std::condition_variable *std::unique_ptr<std::condition_variable>::reset[abi:ne180100](std::condition_variable **a1, std::condition_variable *a2)
{
  uint64_t result = *a1;
  *a1 = a2;
  if (result)
  {
    std::condition_variable::~condition_variable(result);
    JUMPOUT(0x237E29950);
  }
  return result;
}

uint64_t GpsdHardwareConfig::GpsdHardwareConfig(uint64_t a1, int a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  *(_DWORD *)a1 = 0;
  *(unsigned char *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 0;
  *(unsigned char *)(a1 + 24) = 0;
  *(unsigned char *)(a1 + 32) = 0;
  if (a2 > 21101)
  {
    if (a2 > 21704)
    {
      if (a2 <= 31101)
      {
        switch(a2)
        {
          case 30804:
          case 30808:
            goto LABEL_45;
          case 30805:
          case 30806:
          case 30807:
          case 30809:
          case 30811:
            return a1;
          case 30810:
          case 30812:
            goto LABEL_32;
          default:
            if (a2 == 21705) {
              goto LABEL_51;
            }
            if (a2 == 30712) {
              goto LABEL_45;
            }
            return a1;
        }
      }
      if (a2 <= 31201)
      {
        if ((a2 - 31102) > 5 || ((1 << (a2 - 126)) & 0x25) == 0) {
          return a1;
        }
      }
      else
      {
        if (a2 > 31701)
        {
          if (a2 == 31702) {
            goto LABEL_51;
          }
          int v5 = 31704;
LABEL_50:
          if (a2 != v5) {
            return a1;
          }
          goto LABEL_51;
        }
        if (a2 != 31202)
        {
          if (a2 != 31302) {
            return a1;
          }
          goto LABEL_32;
        }
      }
    }
    else
    {
      if (a2 > 21501)
      {
        if ((a2 - 21502) >= 2)
        {
          if ((a2 - 21602) >= 2 && (a2 - 21701) >= 2) {
            return a1;
          }
          *(unsigned char *)(a1 + 16) = 1;
          *(void *)(a1 + 8) = 0x401799999999999ALL;
          *(unsigned char *)(a1 + 32) = 1;
          *(void *)(a1 + 24) = 0x4039000000000000;
          goto LABEL_42;
        }
        *(unsigned char *)(a1 + 16) = 1;
        uint64_t v7 = 0x401799999999999ALL;
        goto LABEL_41;
      }
      if ((a2 - 21201) <= 9 && ((1 << (a2 + 47)) & 0x215) != 0)
      {
LABEL_32:
        int v4 = 202;
        goto LABEL_46;
      }
      if ((a2 - 21102) > 6 || ((1 << (a2 - 110)) & 0x51) == 0)
      {
        int v5 = 21409;
        goto LABEL_50;
      }
    }
LABEL_45:
    int v4 = 201;
    goto LABEL_46;
  }
  if (a2 > 10700)
  {
    if ((a2 - 10701) > 0x12) {
      return a1;
    }
    int v6 = 1 << (a2 + 51);
    if ((v6 & 0x552E5) != 0) {
      goto LABEL_42;
    }
    if ((v6 & 0x810) == 0) {
      return a1;
    }
LABEL_21:
    *(unsigned char *)(a1 + 16) = 1;
    uint64_t v7 = 0x3FF3333333333333;
LABEL_41:
    *(void *)(a1 + 8) = v7;
LABEL_42:
    int v4 = 107;
    goto LABEL_46;
  }
  if (a2 > 10600)
  {
    switch(a2)
    {
      case 10601:
      case 10603:
        goto LABEL_25;
      case 10606:
      case 10608:
        int v4 = 106;
        goto LABEL_46;
      case 10610:
      case 10612:
      case 10614:
      case 10616:
        goto LABEL_42;
      case 10618:
        goto LABEL_21;
      default:
        return a1;
    }
    return a1;
  }
  if (a2 > 10500)
  {
    if ((a2 - 10501) > 0xA || ((1 << (a2 - 5)) & 0x505) == 0) {
      return a1;
    }
LABEL_25:
    int v4 = 103;
LABEL_46:
    *(_DWORD *)a1 = v4;
    return a1;
  }
  if (a2)
  {
    if (a2 != 10401 && a2 != 10403) {
      return a1;
    }
    goto LABEL_25;
  }
LABEL_51:
  uint64_t v9 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
  {
    v10[0] = 67240192;
    v10[1] = a2;
    _os_log_error_impl(&dword_237AFF000, v9, OS_LOG_TYPE_ERROR, "GpsdPlatformInfo,device,%{public}d,unknown/unsupported", (uint8_t *)v10, 8u);
  }
  return a1;
}

uint64_t GpsdHardwareConfig::getEarliestBornYear(GpsdHardwareConfig *this)
{
  int v1 = *(_DWORD *)this;
  uint64_t v2 = 0x100000000;
  uint64_t v3 = 2017;
  uint64_t v4 = 2021;
  uint64_t v5 = 2018;
  if (*(_DWORD *)this != 202) {
    uint64_t v5 = 2017;
  }
  if (v1 != 107) {
    uint64_t v4 = v5;
  }
  if (v1 == 106)
  {
    uint64_t v2 = 0x100000000;
    uint64_t v3 = 2020;
  }
  if (!v1)
  {
    uint64_t v2 = 0;
    uint64_t v3 = 1792;
  }
  BOOL v6 = v1 <= 106;
  if (v1 <= 106) {
    uint64_t v7 = v2;
  }
  else {
    uint64_t v7 = 0x100000000;
  }
  if (v6) {
    uint64_t v8 = v3;
  }
  else {
    uint64_t v8 = v4;
  }
  return v8 | v7;
}

uint64_t GpsdPlatformInfo::isGpsdSupported(GpsdPlatformInfo *this)
{
  unsigned int v1 = *((_DWORD *)this + 2);
  unsigned int v2 = v1 - 201;
  v1 -= 103;
  BOOL v3 = v1 > 4;
  unsigned int v4 = (0x19u >> v1) & 1;
  if (v3) {
    unsigned int v4 = 0;
  }
  if (v2 >= 2) {
    return v4;
  }
  else {
    return 1;
  }
}

BOOL GpsdPlatformInfo::isKaroo(GpsdPlatformInfo *this)
{
  return (*((_DWORD *)this + 2) - 201) < 2;
}

uint64_t GpsdPlatformInfo::isFire(GpsdPlatformInfo *this)
{
  return ((*((_DWORD *)this + 2) - 103) < 5) & (0x19u >> (*((unsigned char *)this + 8) - 103));
}

uint64_t GpsdPlatformInfo::isWatch(GpsdPlatformInfo *this)
{
  return 0;
}

uint64_t GpsdPlatformInfo::isPhone(GpsdPlatformInfo *this)
{
  if (qword_268943148 != -1) {
    dispatch_once(&qword_268943148, &__block_literal_global_1);
  }
  return _MergedGlobals_1;
}

void ___ZN16GpsdPlatformInfo7isPhoneEv_block_invoke()
{
  unsigned int v0 = (const void *)MGCopyAnswer();
  if (v0)
  {
    unsigned int v1 = v0;
    if (CFEqual(v0, @"iPhone")) {
      _MergedGlobals_1 = 1;
    }
    CFRelease(v1);
  }
}

void GpsdPlatformInfo::vendorDylibFullPathName(GpsdPlatformInfo *this@<X0>, void *a2@<X8>)
{
  int v3 = *((_DWORD *)this + 2);
  if ((v3 - 201) <= 1)
  {
    unsigned int v4 = "/usr/lib/libolaf.dylib";
LABEL_9:
    std::string::basic_string[abi:ne180100]<0>(a2, v4);
    return;
  }
  if (v3 == 107)
  {
    unsigned int v4 = "/usr/lib/libfire7.dylib";
    goto LABEL_9;
  }
  if (GpsdPlatformInfo::isLibgll6(this))
  {
    unsigned int v4 = "/usr/lib/libfire6.dylib";
    goto LABEL_9;
  }
  if (GpsdPlatformInfo::isLibgll3(this))
  {
    unsigned int v4 = "/usr/lib/libfire3.dylib";
    goto LABEL_9;
  }
  BOOL v6 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_fault_impl(&dword_237AFF000, v6, OS_LOG_TYPE_FAULT, "PlatformInfo,unknown vendorDylibFullPathName", v7, 2u);
  }
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
}

BOOL GpsdPlatformInfo::isLibolaf(GpsdPlatformInfo *this)
{
  return (*((_DWORD *)this + 2) - 201) < 2;
}

BOOL GpsdPlatformInfo::isLibgll7(GpsdPlatformInfo *this)
{
  return *((_DWORD *)this + 2) == 107;
}

BOOL GpsdPlatformInfo::isLibgll6(GpsdPlatformInfo *this)
{
  if (*((_DWORD *)this + 2) == 106) {
    return 1;
  }
  int v3 = (id *)GpsdPreferences::instance(0);
  int isRavenExpected = GpsdPreferences::isRavenExpected(v3);
  BOOL result = 0;
  if (isRavenExpected) {
    return *((_DWORD *)this + 2) == 103;
  }
  return result;
}

uint64_t GpsdPlatformInfo::isLibgll3(GpsdPlatformInfo *this)
{
  if (*((_DWORD *)this + 2) != 103) {
    return 0;
  }
  unsigned int v1 = (id *)GpsdPreferences::instance(0);
  return GpsdPreferences::isRavenExpected(v1) ^ 1;
}

uint64_t GpsdPlatformInfo::isLibindus(GpsdPlatformInfo *this)
{
  return 0;
}

void *GpsdPlatformInfo::serialPortPath@<X0>(void *a1@<X8>)
{
  return std::string::basic_string[abi:ne180100]<0>(a1, "/dev/cu.gps");
}

uint64_t GpsdPlatformInfo::expectedToHaveRaven(GpsdPlatformInfo *this)
{
  int v1 = *((_DWORD *)this + 2);
  if ((v1 - 201) <= 1)
  {
    if (qword_268943148 != -1) {
      dispatch_once(&qword_268943148, &__block_literal_global_1);
    }
    if (_MergedGlobals_1) {
      return 1;
    }
    int v1 = *((_DWORD *)this + 2);
  }
  unsigned int v3 = v1 - 103;
  BOOL v4 = v3 > 4;
  int v5 = (1 << v3) & 0x19;
  if (!v4 && v5 != 0)
  {
    if (qword_268943148 != -1) {
      dispatch_once(&qword_268943148, &__block_literal_global_1);
    }
    if (_MergedGlobals_1) {
      return 1;
    }
  }
  return 0;
}

uint64_t GpsdPlatformInfo::supportsL5(GpsdPlatformInfo *this)
{
  return *((unsigned __int8 *)this + 24);
}

BOOL GpsdPlatformInfo::supportsBeidou(GpsdPlatformInfo *this)
{
  int v1 = *((_DWORD *)this + 2);
  return v1 != 103 && v1 != 201;
}

BOOL GpsdPlatformInfo::supportsNavic(GpsdPlatformInfo *this)
{
  if (qword_268943148 != -1) {
    dispatch_once(&qword_268943148, &__block_literal_global_1);
  }
  return _MergedGlobals_1 == 1 && *((_DWORD *)this + 2) == 107;
}

double GpsdPlatformInfo::groupDelayL1InCAChips(GpsdPlatformInfo *this)
{
  int v1 = *((_DWORD *)this + 2);
  double result = 0.036;
  if (v1 != 202) {
    double result = 0.0;
  }
  if (v1 == 201) {
    return -7.149;
  }
  return result;
}

double GpsdPlatformInfo::externalToChipL5GroupDelayMeters(GpsdPlatformInfo *this)
{
  if (*((unsigned char *)this + 24)) {
    return *((double *)this + 2);
  }
  else {
    return 0.0;
  }
}

void GpsdPlatformInfo::glonassPerFrequencyGroupDelayMeters(GpsdPlatformInfo *this@<X0>, float64x2_t **a2@<X8>)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (*((_DWORD *)this + 2) == 107)
  {
    if (*((unsigned char *)this + 40)) {
      double v3 = *((double *)this + 4);
    }
    else {
      double v3 = 15.0;
    }
    *a2 = 0;
    a2[1] = 0;
    a2[2] = 0;
    BOOL v4 = (float64x2_t *)operator new(0x70uLL);
    double v5 = v3 + -520.569214 + 0.1;
    float64x2_t v6 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(v3 + -520.569214), 0);
    a2[2] = v4 + 7;
    float64x2_t *v4 = vaddq_f64(v6, (float64x2_t)xmmword_237B31BA0);
    v4[1] = vaddq_f64(v6, (float64x2_t)xmmword_237B31BB0);
    _DWORD v4[2] = vaddq_f64(v6, (float64x2_t)xmmword_237B31BC0);
    v4[3] = vaddq_f64(v6, (float64x2_t)xmmword_237B31BD0);
    v4[4] = vaddq_f64(v6, (float64x2_t)xmmword_237B31BE0);
    v4[5].f64[0] = v3 + -520.569214;
    v4[5].f64[1] = v5;
    v4[6].f64[0] = v5;
    v4[6].f64[1] = v5;
    *a2 = v4;
    a2[1] = v4 + 7;
    uint64_t v7 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 134349056;
      double v9 = v3;
      _os_log_impl(&dword_237AFF000, v7, OS_LOG_TYPE_DEFAULT, "glonassExternalCalMeters,%{public}.2f", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    *a2 = 0;
    a2[1] = 0;
    a2[2] = 0;
  }
}

double GpsdPlatformInfo::getGpsCrossCorrelationMaxThreshold_dBHz(GpsdPlatformInfo *this)
{
  return 36.0;
}

double GpsdPlatformInfo::getGpsCrossCorrelationMinThreshold_dBHz(GpsdPlatformInfo *this)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (qword_268943148 != -1) {
    dispatch_once(&qword_268943148, &__block_literal_global_1);
  }
  double v2 = 24.0;
  if ((_MergedGlobals_1 & 1) == 0)
  {
    double v3 = GpsdLogObjectGeneral;
    double v2 = -1.0;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      int v5 = *(_DWORD *)this;
      v6[0] = 67240192;
      v6[1] = v5;
      _os_log_error_impl(&dword_237AFF000, v3, OS_LOG_TYPE_ERROR, "HalExtensions,Unexpected hardware,%{public}d", (uint8_t *)v6, 8u);
    }
  }
  return v2;
}

BOOL GpsdPlatformInfo::supportsInternalEmergencyStack(GpsdPlatformInfo *this)
{
  return *((_DWORD *)this + 2) == 107;
}

BOOL GpsdPlatformInfo::usesPcie(GpsdPlatformInfo *this)
{
  return *((_DWORD *)this + 2) == 202;
}

uint64_t GpsdPlatformInfo::usesPreciseTimeMeasurement(GpsdPlatformInfo *this)
{
  return 0;
}

BOOL GpsdPlatformInfo::usesSpi(GpsdPlatformInfo *this)
{
  return *((_DWORD *)this + 2) == 107;
}

BOOL GpsdPlatformInfo::usesResetGpio(GpsdPlatformInfo *this)
{
  int v1 = *((_DWORD *)this + 2);
  BOOL v2 = v1 == 201;
  if (v1 == 106) {
    BOOL v2 = 1;
  }
  return v1 == 103 || v2;
}

BOOL GpsdPlatformInfo::usesDeviceWakeGpio(GpsdPlatformInfo *this)
{
  int v1 = *((_DWORD *)this + 2);
  return v1 == 103 || v1 == 106;
}

BOOL GpsdPlatformInfo::usesTimeMarkGpio(GpsdPlatformInfo *this)
{
  int v1 = *((_DWORD *)this + 2);
  BOOL v2 = v1 == 201;
  if (v1 == 106) {
    BOOL v2 = 1;
  }
  return v1 == 103 || v2;
}

BOOL GpsdPlatformInfo::usesAsyncCommRead(GpsdPlatformInfo *this)
{
  int v1 = *((_DWORD *)this + 2);
  return v1 == 202 || v1 == 107;
}

BOOL GpsdPlatformInfo::usesTimeMarkPciDoorbell(GpsdPlatformInfo *this)
{
  int v1 = *((_DWORD *)this + 2);
  return v1 == 202 || v1 == 107;
}

BOOL GpsdPlatformInfo::usesGpio(GpsdPlatformInfo *this)
{
  int v1 = *((_DWORD *)this + 2);
  BOOL v2 = v1 == 201;
  if (v1 == 106) {
    BOOL v2 = 1;
  }
  return v1 == 103 || v2;
}

uint64_t GpsdPlatformInfo::isLibgll(GpsdPlatformInfo *this)
{
  return ((*((_DWORD *)this + 2) - 103) < 5) & (0x19u >> (*((unsigned char *)this + 8) - 103));
}

uint64_t GpsdPlatformInfo::getLibindusPlatformCoExConfigDefault(GpsdPlatformInfo *this)
{
  return 0;
}

BOOL GpsdPlatformInfo::hasXtalFreqJumpRisk(GpsdPlatformInfo *this)
{
  return *((_DWORD *)this + 2) == 107;
}

double GpsdPlatformInfo::olafCrossCorrelationSettings(GpsdPlatformInfo *this)
{
  return 35.0;
}

double GpsdPlatformInfo::indusCrossCorrelationSettings(GpsdPlatformInfo *this)
{
  return 35.0;
}

uint64_t GpsdPlatformInfo::isInternalInstall(GpsdPlatformInfo *this)
{
  return os_variant_has_internal_diagnostics();
}

uint64_t GpsdPlatformInfo::instance(int a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = ___ZN16GpsdPlatformInfo8instanceEN24GpsdPlatformInfoHardware8HardwareE_block_invoke;
  block[3] = &__block_descriptor_36_e5_v8__0l;
  int v3 = a1;
  if (GpsdPlatformInfo::instance(GpsdPlatformInfoHardware::Hardware)::pred != -1) {
    dispatch_once(&GpsdPlatformInfo::instance(GpsdPlatformInfoHardware::Hardware)::pred, block);
  }
  return GpsdPlatformInfo::fInstance;
}

void ___ZN16GpsdPlatformInfo8instanceEN24GpsdPlatformInfoHardware8HardwareE_block_invoke(GpsdPlatformInfoHardware *a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (!*((_DWORD *)a1 + 8))
  {
    int v1 = GpsdPlatformInfoHardware::detectHardware(a1);
    BOOL v2 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      v3[0] = 67240448;
      v3[1] = v1;
      __int16 v4 = 1026;
      int has_internal_diagnostics = os_variant_has_internal_diagnostics();
      _os_log_impl(&dword_237AFF000, v2, OS_LOG_TYPE_DEFAULT, "PlatformInfo,Product type detected,%{public}d,isInternal,%{public}d", (uint8_t *)v3, 0xEu);
    }
  }
  operator new();
}

void sub_237B23D04(_Unwind_Exception *a1)
{
  MEMORY[0x237E29950](v1, 0x1000C405B242E63);
  _Unwind_Resume(a1);
}

GpsdPlatformInfo *GpsdPlatformInfo::GpsdPlatformInfo(GpsdPlatformInfo *a1, int a2)
{
  *(_DWORD *)a1 = a2;
  GpsdHardwareConfig::GpsdHardwareConfig((uint64_t)a1 + 8, a2);
  *((unsigned char *)a1 + 48) = 0;
  *((unsigned char *)a1 + 52) = 0;
  *((unsigned char *)a1 + 56) = 0;
  *((unsigned char *)a1 + 60) = 0;
  GpsdPlatformInfo::checkVendorLibs(a1);
  GpsdPlatformInfo::readMlbBornOnYww(a1);
  return a1;
}

void GpsdPlatformInfo::checkVendorLibs(GpsdPlatformInfo *this)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v2 = *((_DWORD *)this + 2);
  if ((v2 - 103) > 4 || ((1 << (v2 - 103)) & 0x19) == 0)
  {
    __int16 v4 = GpsdLogObjectGeneral;
    if ((v2 - 203) <= 0xFFFFFFFD
      && os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v6[0]) = 0;
      _os_log_error_impl(&dword_237AFF000, v4, OS_LOG_TYPE_ERROR, "GpsdPlatformInfo,invoked on platform that does not have a supported vendor lib", (uint8_t *)v6, 2u);
      __int16 v4 = GpsdLogObjectGeneral;
    }
  }
  else
  {
    __int16 v4 = GpsdLogObjectGeneral;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = *(_DWORD *)this;
    v6[0] = 67109120;
    v6[1] = v5;
    _os_log_impl(&dword_237AFF000, v4, OS_LOG_TYPE_INFO, "GpsdPlatformInfo,hardware,%d", (uint8_t *)v6, 8u);
  }
}

void GpsdPlatformInfo::readMlbBornOnYww(GpsdPlatformInfo *this)
{
  GpsdPlatformInfo::readMlbSerialNumber((uint64_t *)&__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::size_type size = __p.__r_.__value_.__l.__size_;
    if (__p.__r_.__value_.__l.__size_)
    {
LABEL_3:
      if (size < 0x12) {
        GpsdPlatformInfo::parseWeekFromYwwMlbSerialNumber((uint64_t)this, (std::string::size_type)&__p);
      }
      else {
        GpsdPlatformInfo::parseWeekFromDomMlbSerialNumber((uint64_t)this, &__p);
      }
      goto LABEL_9;
    }
  }
  else
  {
    std::string::size_type size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    if (*((unsigned char *)&__p.__r_.__value_.__s + 23)) {
      goto LABEL_3;
    }
  }
  int v3 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)__int16 v4 = 0;
    _os_log_impl(&dword_237AFF000, v3, OS_LOG_TYPE_INFO, "MlbSn,aborted,empty", v4, 2u);
  }
LABEL_9:
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
}

void sub_237B23F70(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t GpsdPlatformInfo::getNoiseFigure(uint64_t a1, int a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  __int16 v4 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG))
  {
    v10[0] = 67109120;
    v10[1] = a2;
    _os_log_debug_impl(&dword_237AFF000, v4, OS_LOG_TYPE_DEBUG, "GpsdPlatformInfo,getNoiseFigure,band,%d", (uint8_t *)v10, 8u);
  }
  int v5 = *(_DWORD *)(a1 + 8);
  if ((v5 - 201) >= 2)
  {
    int v8 = v5 - 103;
    if ((v5 - 103) > 4)
    {
      uint64_t v6 = 0;
      uint64_t v7 = 0;
    }
    else
    {
      uint64_t v6 = qword_237B31BF0[v8];
      uint64_t v7 = qword_237B31C18[v8];
    }
  }
  else
  {
    uint64_t v6 = 0x100000000;
    uint64_t v7 = 1078355558;
  }
  return v7 | v6;
}

void GpsdPlatformInfo::readMlbSerialNumber(uint64_t *a1@<X8>)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  CFStringRef v3 = (const __CFString *)MGCopyAnswer();
  CFStringRef v4 = v3;
  if (v3)
  {
    CStringPtr = CFStringGetCStringPtr(v3, 0x8000100u);
    MEMORY[0x237E295A0](a1, CStringPtr);
    CFRelease(v4);
    uint64_t v6 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
    {
      if (*((char *)a1 + 23) >= 0) {
        uint64_t v7 = a1;
      }
      else {
        uint64_t v7 = (uint64_t *)*a1;
      }
      int v9 = 136315138;
      uint64_t v10 = v7;
      _os_log_impl(&dword_237AFF000, v6, OS_LOG_TYPE_INFO, "MlbSn,%s", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    int v8 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v9) = 0;
      _os_log_error_impl(&dword_237AFF000, v8, OS_LOG_TYPE_ERROR, "MlbSn,readSN,failed", (uint8_t *)&v9, 2u);
    }
  }
}

void sub_237B241D8(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void GpsdPlatformInfo::parseWeekFromDomMlbSerialNumber(uint64_t a1, const std::string *a2)
{
  uint64_t v4 = 0;
  int v5 = 0;
  uint64_t v31 = *MEMORY[0x263EF8340];
  if ((a2->__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    uint64_t v6 = a2;
  }
  else {
    uint64_t v6 = (const std::string *)a2->__r_.__value_.__r.__words[0];
  }
  uint64_t v7 = (uint64_t)v6->__r_.__value_.__r.__words + 3;
  do
  {
    int v8 = *(char *)(v7 + v4);
    int v9 = charToIntBase34(v8);
    if (v9 < 0)
    {
      uint64_t v14 = GpsdLogObjectGeneral;
      if (!os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR)) {
        return;
      }
      LODWORD(__p.__r_.__value_.__l.__data_) = 67174657;
      HIDWORD(__p.__r_.__value_.__r.__words[0]) = v8;
      __int16 v15 = "MlbSn,dom,unexpectedCh,%{private}c";
      std::chrono::system_clock::time_point v16 = v14;
      uint32_t v17 = 8;
LABEL_28:
      _os_log_error_impl(&dword_237AFF000, v16, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&__p, v17);
      return;
    }
    int v5 = v9 + 34 * v5;
    ++v4;
  }
  while (v4 != 3);
  uint64_t v10 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    std::string::basic_string(&__p, a2, 3uLL, 3uLL, (std::allocator<char> *)buf);
    uint64_t v11 = (__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
        ? &__p
        : (std::string *)__p.__r_.__value_.__r.__words[0];
    *(_DWORD *)std::mutex buf = 136380931;
    uint64_t v28 = v11;
    __int16 v29 = 1025;
    int v30 = v5;
    _os_log_impl(&dword_237AFF000, v10, OS_LOG_TYPE_DEFAULT, "MlbSn,dom,%{private}s,%{private}d", buf, 0x12u);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
  int v12 = *(_DWORD *)(a1 + 8);
  double v13 = 13514.25;
  if (v12 <= 106)
  {
    if (v12)
    {
      if (v12 == 106) {
        double v13 = 14610.0;
      }
      goto LABEL_25;
    }
    uint64_t v18 = GpsdLogObjectWarning;
    if (!os_log_type_enabled((os_log_t)GpsdLogObjectWarning, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    LOWORD(__p.__r_.__value_.__l.__data_) = 0;
    char v19 = "MlbSn,dom,EarliestBornYear,unknown";
    char v20 = v18;
    uint32_t v21 = 2;
LABEL_31:
    _os_log_impl(&dword_237AFF000, v20, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)&__p, v21);
    return;
  }
  if (v12 == 107)
  {
    double v13 = 14975.25;
  }
  else if (v12 == 202)
  {
    double v13 = 13879.5;
  }
LABEL_25:
  int v22 = (int)(v13 / 7.0);
  int v23 = (v5 - 3657) / 7;
  if (v23 < v22)
  {
    uint64_t v24 = GpsdLogObjectGeneral;
    if (!os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR)) {
      return;
    }
    LODWORD(__p.__r_.__value_.__l.__data_) = 67174913;
    HIDWORD(__p.__r_.__value_.__r.__words[0]) = (v5 - 3657) / 7;
    LOWORD(__p.__r_.__value_.__r.__words[1]) = 1026;
    *(_DWORD *)((char *)&__p.__r_.__value_.__r.__words[1] + 2) = v22;
    __int16 v15 = "MlbSn,dom,weekOutOfRange,mlb,%{private}d,earliest,%{public}d";
    std::chrono::system_clock::time_point v16 = v24;
    uint32_t v17 = 14;
    goto LABEL_28;
  }
  *(_DWORD *)(a1 + 56) = v23;
  *(unsigned char *)(a1 + 60) = 1;
  uint64_t v25 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(__p.__r_.__value_.__l.__data_) = 67174657;
    HIDWORD(__p.__r_.__value_.__r.__words[0]) = (v5 - 3657) / 7;
    char v19 = "MlbSn,dom,bornOnGpsWeek,%{private}d";
    char v20 = v25;
    uint32_t v21 = 8;
    goto LABEL_31;
  }
}

void GpsdPlatformInfo::parseWeekFromYwwMlbSerialNumber(uint64_t a1, std::string::size_type a2)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (*(char *)(a2 + 23) < 0)
  {
    std::string::size_type v4 = *(void *)(a2 + 8);
    int v5 = GpsdLogObjectGeneral;
    if (!os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_5;
    }
    std::string::size_type v6 = *(void *)a2;
  }
  else
  {
    std::string::size_type v4 = *(unsigned __int8 *)(a2 + 23);
    int v5 = GpsdLogObjectGeneral;
    if (!os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_5;
    }
    std::string::size_type v6 = a2;
  }
  LODWORD(v29.__r_.__value_.__l.__data_) = 136380931;
  *(std::string::size_type *)((char *)v29.__r_.__value_.__r.__words + 4) = v6;
  WORD2(v29.__r_.__value_.__r.__words[1]) = 2049;
  *(std::string::size_type *)((char *)&v29.__r_.__value_.__r.__words[1] + 6) = v4;
  _os_log_debug_impl(&dword_237AFF000, v5, OS_LOG_TYPE_DEBUG, "MlbSn,parse,%{private}s,sz,%{private}zu", (uint8_t *)&v29, 0x16u);
LABEL_5:
  if (v4 == 11 || v4 == 13)
  {
    std::string::size_type v8 = 2;
  }
  else
  {
    if ((v4 & 0xFFFFFFFFFFFFFFFELL) != 0x10)
    {
      uint64_t v25 = GpsdLogObjectGeneral;
      if (!os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR)) {
        return;
      }
      LODWORD(v29.__r_.__value_.__l.__data_) = 134283521;
      *(std::string::size_type *)((char *)v29.__r_.__value_.__r.__words + 4) = v4;
      std::chrono::system_clock::time_point v16 = "MlbSn,unexpectedSize,%{private}zu";
      int v23 = v25;
      uint32_t v24 = 12;
      goto LABEL_47;
    }
    std::string::size_type v8 = 3;
  }
  std::string::basic_string(&v29, (const std::string *)a2, v8, 3uLL, (std::allocator<char> *)&v28);
  if (SHIBYTE(v29.__r_.__value_.__r.__words[2]) < 0)
  {
    uint64_t v10 = (void *)v29.__r_.__value_.__r.__words[0];
    *(_DWORD *)(a1 + 48) = atoi(v29.__r_.__value_.__l.__data_);
    int v9 = (int *)(a1 + 48);
    *(unsigned char *)(a1 + 52) = 1;
    operator delete(v10);
  }
  else
  {
    *(_DWORD *)(a1 + 48) = atoi((const char *)&v29);
    int v9 = (int *)(a1 + 48);
    *(unsigned char *)(a1 + 52) = 1;
  }
  uint64_t v11 = GpsdLogObjectGeneral;
  BOOL v12 = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    if (!*(unsigned char *)(a1 + 52)) {
      std::__throw_bad_optional_access[abi:ne180100]();
    }
    int v13 = *v9;
    LODWORD(v29.__r_.__value_.__l.__data_) = 134283777;
    *(std::string::size_type *)((char *)v29.__r_.__value_.__r.__words + 4) = v4;
    WORD2(v29.__r_.__value_.__r.__words[1]) = 1025;
    *(_DWORD *)((char *)&v29.__r_.__value_.__r.__words[1] + 6) = v13;
    _os_log_impl(&dword_237AFF000, v11, OS_LOG_TYPE_DEFAULT, "MlbSn,sz,%{private}zu,yww,%{private}d", (uint8_t *)&v29, 0x12u);
  }
  if (!*(unsigned char *)(a1 + 52)) {
    std::__throw_bad_optional_access[abi:ne180100]();
  }
  int v14 = *v9 % 100;
  if ((v14 - 54) <= 0xFFFFFFCA)
  {
    uint64_t v15 = GpsdLogObjectGeneral;
    if (!os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR)) {
      return;
    }
    LODWORD(v29.__r_.__value_.__l.__data_) = 67174657;
    HIDWORD(v29.__r_.__value_.__r.__words[0]) = v14;
    std::chrono::system_clock::time_point v16 = "MlbSn,invalid,ww,%{private}d";
LABEL_40:
    int v23 = v15;
    uint32_t v24 = 8;
LABEL_47:
    _os_log_error_impl(&dword_237AFF000, v23, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&v29, v24);
    return;
  }
  int v17 = *(_DWORD *)(a1 + 8);
  if (v17 > 106)
  {
    if (v17 == 202) {
      int v19 = 2018;
    }
    else {
      int v19 = 2017;
    }
    if (v17 == 107) {
      int v18 = 2021;
    }
    else {
      int v18 = v19;
    }
  }
  else
  {
    if (!v17)
    {
      uint64_t v27 = GpsdLogObjectGeneral;
      if (!os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR)) {
        return;
      }
      LOWORD(v29.__r_.__value_.__l.__data_) = 0;
      std::chrono::system_clock::time_point v16 = "MlbSn,EarliestBornYear,unknown";
      int v23 = v27;
      uint32_t v24 = 2;
      goto LABEL_47;
    }
    if (v17 == 106) {
      int v18 = 2020;
    }
    else {
      int v18 = 2017;
    }
  }
  int v20 = v18 - (unsigned __int16)(v18 - 10 * ((6554 * v18) >> 16)) + *v9 / 100;
  if (v20 >= v18) {
    int v21 = v18 - (unsigned __int16)(v18 - 10 * ((6554 * v18) >> 16)) + *v9 / 100;
  }
  else {
    int v21 = v20 + 10;
  }
  int v22 = v14 + (int)((double)(v21 - 1980) * 365.25 / 7.0);
  if (v22 > (int)gpsd::util::getGpsWeekFromBuildDate((gpsd::util *)v12))
  {
    uint64_t v15 = GpsdLogObjectGeneral;
    if (!os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR)) {
      return;
    }
    LODWORD(v29.__r_.__value_.__l.__data_) = 67174657;
    HIDWORD(v29.__r_.__value_.__r.__words[0]) = v22;
    std::chrono::system_clock::time_point v16 = "MlbSn,weekOutOfRange,mlb,%{private}d";
    goto LABEL_40;
  }
  *(_DWORD *)(a1 + 56) = v22;
  *(unsigned char *)(a1 + 60) = 1;
  int v26 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v29.__r_.__value_.__l.__data_) = 67174657;
    HIDWORD(v29.__r_.__value_.__r.__words[0]) = v22;
    _os_log_impl(&dword_237AFF000, v26, OS_LOG_TYPE_DEFAULT, "MlbSn,bornOnGpsWeek,%{private}d", (uint8_t *)&v29, 8u);
  }
}

uint64_t charToIntBase34(int a1)
{
  if ((a1 - 97) >= 0x1A) {
    char v1 = a1;
  }
  else {
    char v1 = a1 - 32;
  }
  int v2 = v1;
  unsigned int v3 = (v1 - 48);
  if ((v2 - 80) >= 0xB) {
    int v4 = -1;
  }
  else {
    int v4 = v2 - 57;
  }
  if ((v2 - 74) <= 4) {
    int v5 = v2 - 56;
  }
  else {
    int v5 = v4;
  }
  if ((v2 - 65) <= 7u) {
    unsigned int v6 = v2 - 55;
  }
  else {
    unsigned int v6 = v5;
  }
  unsigned int v7 = v2 - 48;
  if (v3 <= 9) {
    return v7;
  }
  else {
    return v6;
  }
}

void *vectorToNSArray(double **a1)
{
  int v2 = (void *)[MEMORY[0x263EFF980] arrayWithCapacity:a1[1] - *a1];
  int v4 = *a1;
  unsigned int v3 = a1[1];
  while (v4 != v3)
  {
    double v5 = *v4++;
    objc_msgSend(v2, "addObject:", objc_msgSend(NSNumber, "numberWithDouble:", v5));
  }
  return v2;
}

uint64_t GpsdPreferences::GpsdPreferences(uint64_t a1, int a2)
{
  v51[70] = *MEMORY[0x263EF8340];
  *(void *)a1 = 0;
  *(_DWORD *)(a1 + 8) = a2;
  unsigned int v3 = (void *)[MEMORY[0x263EFFA40] standardUserDefaults];
  *(void *)a1 = v3;
  [v3 addSuiteNamed:@"gpsd"];
  uint64_t v4 = MEMORY[0x263EFFA80];
  v51[0] = MEMORY[0x263EFFA80];
  v50[0] = @"ForceDisableGpsd";
  v50[1] = @"BigPowerSwitch";
  uint64_t v5 = GpsdPlatformInfo::instance(0);
  uint64_t v6 = MEMORY[0x263EFFA88];
  if (*(_DWORD *)(v5 + 8) == 201) {
    uint64_t v7 = MEMORY[0x263EFFA88];
  }
  else {
    uint64_t v7 = v4;
  }
  v51[1] = v7;
  v50[2] = @"BaudRate4M8";
  if (*(_DWORD *)(GpsdPlatformInfo::instance(0) + 8) == 201) {
    uint64_t v8 = v6;
  }
  else {
    uint64_t v8 = v4;
  }
  v51[2] = v8;
  v50[3] = @"UsesAsyncCommRead";
  int v9 = *(_DWORD *)(GpsdPlatformInfo::instance(0) + 8);
  if (v9 == 107 || v9 == 202) {
    uint64_t v11 = v6;
  }
  else {
    uint64_t v11 = v4;
  }
  v51[3] = v11;
  v51[4] = &stru_26EAA8F28;
  v50[4] = @"ForceGnssDeviceLibraryName";
  v50[5] = @"EnableMeasurementApi";
  v51[5] = v6;
  v51[6] = v6;
  v50[6] = @"EnableXocalRequests";
  v50[7] = @"ForceEnableXocalLearning";
  v51[7] = v4;
  v51[8] = &unk_26EAA9AB8;
  v50[8] = @"MaxSchedulerQos";
  v50[9] = @"EnableBasebandReset";
  if (*(_DWORD *)(GpsdPlatformInfo::instance(0) + 8) == 202) {
    uint64_t v12 = v6;
  }
  else {
    uint64_t v12 = v4;
  }
  v51[9] = v12;
  v50[10] = @"LogLevel";
  v51[10] = [NSNumber numberWithInt:0];
  v50[11] = @"SecondaryLogLevel";
  v51[11] = [NSNumber numberWithInt:0];
  v51[12] = &unk_26EAA9AD0;
  v50[12] = @"LogMask";
  v50[13] = @"PvtmTimeOut";
  v51[13] = &unk_26EAA9AE8;
  v51[14] = @"0x0";
  v50[14] = @"NmeaMaskOverride";
  v50[15] = @"VendorLogQA";
  v51[15] = v4;
  v51[16] = v4;
  v50[16] = @"VendorLogRestrictedCarry";
  v50[17] = @"VendorLogAllToOsLog";
  v51[17] = v4;
  v51[18] = v4;
  v50[18] = @"VendorLogForceCustomer";
  v50[19] = @"VendorLogLz4";
  v51[19] = v6;
  v51[20] = v4;
  v50[20] = @"VendorLogLzfse";
  v50[21] = @"VendorLogZlib";
  v51[21] = v4;
  v51[22] = @"/var/mobile/Library/Logs/gpsd";
  v50[22] = @"VendorLogDirectory";
  v50[23] = @"VendorLogPrefixWithTimestamp";
  v51[23] = v4;
  v51[24] = &unk_26EAA9B00;
  v50[24] = @"VendorLogMaxDirectorySizeMB";
  v50[25] = @"VendorLogRotationSizeMB";
  v51[25] = &unk_26EAA9B18;
  v51[26] = &unk_26EAA9B30;
  v50[26] = @"VendorLogMaxNumberOfFiles";
  v50[27] = @"VendorLogRetentionDays";
  v51[27] = &unk_26EAA9B90;
  v51[28] = v4;
  v50[28] = @"EnableProtobufBinaryLog";
  v50[29] = @"ProtobufLogDirectory";
  v51[29] = @"/var/mobile/Library/Logs/gpsd";
  v51[30] = &unk_26EAA9BA0;
  v50[30] = @"ProtobufLogRetentionDays";
  v50[31] = @"EnableProtobufTextLog";
  v51[31] = v4;
  v51[32] = v4;
  v50[32] = @"EnableInterfaceTelemetry";
  v50[33] = @"NvStoreFile";
  v51[33] = @"/var/db/gpsd/gps_nvstore.bin";
  v51[34] = v4;
  v50[34] = @"VerboseNvStore";
  v50[35] = @"VerboseCommDataSize";
  v51[35] = v4;
  v51[36] = v4;
  v50[36] = @"VerboseCommDataSniffer";
  v50[37] = @"PerformanceReportIntervalSeconds";
  v51[37] = &unk_26EAA9AE8;
  v51[38] = &unk_26EAA9AD0;
  v50[38] = @"RecoveryTestCase";
  v50[39] = @"GenericTestCase";
  v51[39] = &unk_26EAA9AD0;
  v51[40] = v6;
  v50[40] = @"EnableGps";
  v50[41] = @"EnableQzss";
  v51[41] = v6;
  v51[42] = v6;
  v50[42] = @"EnableGlonass";
  v50[43] = @"EnableGalileo";
  v51[43] = v6;
  v50[44] = @"EnableBeidou";
  int v13 = *(_DWORD *)(GpsdPlatformInfo::instance(0) + 8);
  if (v13 == 201 || v13 == 103) {
    uint64_t v15 = v4;
  }
  else {
    uint64_t v15 = v6;
  }
  v51[44] = v15;
  v50[45] = @"EnableNavic";
  std::chrono::system_clock::time_point v16 = (GpsdPlatformInfo *)GpsdPlatformInfo::instance(0);
  if (GpsdPlatformInfo::supportsNavic(v16)) {
    uint64_t v17 = v6;
  }
  else {
    uint64_t v17 = v4;
  }
  v51[45] = v17;
  v50[46] = @"EnableL5";
  if (*(unsigned char *)(GpsdPlatformInfo::instance(0) + 24)) {
    uint64_t v18 = v6;
  }
  else {
    uint64_t v18 = v4;
  }
  v51[46] = v18;
  v50[47] = @"EnableCoexL5NotchFilter";
  uint64_t v19 = GpsdPlatformInfo::instance(0);
  uint64_t v20 = v4;
  if (*(_DWORD *)(v19 + 8) == 107)
  {
    int v21 = (GpsdPlatformInfo *)GpsdPlatformInfo::instance(0);
    if (GpsdPlatformInfo::isPhone(v21)) {
      uint64_t v20 = v6;
    }
    else {
      uint64_t v20 = v4;
    }
  }
  v51[47] = v20;
  v51[48] = v6;
  v50[48] = @"EnableCoexBitEnhancedFreqAsst";
  v50[49] = @"EnableCoexBitCdmaFineTimeAsst";
  v51[49] = v6;
  v51[50] = v6;
  v50[50] = @"EnableCoexBitBlankingGpsL1";
  v50[51] = @"EnableCoexBitBlankingGloL1";
  v51[51] = v4;
  v51[52] = v4;
  v50[52] = @"EnableCoexBitBlankingBdsB1I";
  v50[53] = @"CoexForceGpsL1Filter";
  v51[53] = &unk_26EAA9AD0;
  v51[54] = &unk_26EAA9AD0;
  v50[54] = @"CoexForceGloL1Filter";
  v50[55] = @"CoexForceB1IFilter";
  v51[55] = &unk_26EAA9AD0;
  v50[56] = @"CoexUseB14LteFilterSettingsForB13";
  if (*(_DWORD *)(GpsdPlatformInfo::instance(0) + 8) == 107) {
    uint64_t v22 = v6;
  }
  else {
    uint64_t v22 = v4;
  }
  v51[56] = v22;
  v51[57] = v6;
  v50[57] = @"EnableCoexBitStaticSpur";
  v50[58] = @"EnableCoexBitDynamicNotch";
  v51[58] = v4;
  v51[59] = v6;
  v50[59] = @"EnableCoexBitJammer";
  v50[60] = @"GroupDelayL1InCAChips";
  int v23 = NSNumber;
  int v24 = *(_DWORD *)(GpsdPlatformInfo::instance(0) + 8);
  LODWORD(v25) = 1024685244;
  if (v24 != 202) {
    *(float *)&double v25 = 0.0;
  }
  if (v24 == 201) {
    *(float *)&double v25 = -7.149;
  }
  v51[60] = [v23 numberWithFloat:v25];
  v50[61] = @"ExternalToChipL5GroupDelayMeters";
  int v26 = NSNumber;
  uint64_t v27 = GpsdPlatformInfo::instance(0);
  if (*(unsigned char *)(v27 + 24)) {
    double v28 = *(double *)(v27 + 16);
  }
  else {
    double v28 = 0.0;
  }
  v51[61] = [v26 numberWithDouble:v28];
  v50[62] = @"GlonassPerFrequencyGroupDelayMeters";
  std::string v29 = (GpsdPlatformInfo *)GpsdPlatformInfo::instance(0);
  GpsdPlatformInfo::glonassPerFrequencyGroupDelayMeters(v29, (float64x2_t **)__p);
  v51[62] = vectorToNSArray((double **)__p);
  v50[63] = @"RavenExpected";
  uint64_t v30 = (GpsdPlatformInfo *)GpsdPlatformInfo::instance(0);
  if (GpsdPlatformInfo::expectedToHaveRaven(v30)) {
    uint64_t v31 = v6;
  }
  else {
    uint64_t v31 = v4;
  }
  v50[64] = @"ForceFireExtensionsPlatform";
  v51[63] = v31;
  v51[64] = &unk_26EAA9AD0;
  v50[65] = @"UseInternalEmergencyStack";
  if (*(_DWORD *)(GpsdPlatformInfo::instance(0) + 8) == 107) {
    uint64_t v32 = v6;
  }
  else {
    uint64_t v32 = v4;
  }
  v51[65] = v32;
  v50[66] = @"HasXtalFreqJumpRisk";
  if (*(_DWORD *)(GpsdPlatformInfo::instance(0) + 8) == 107) {
    uint64_t v33 = v6;
  }
  else {
    uint64_t v33 = v4;
  }
  v51[66] = v33;
  v50[67] = @"AllowAssistanceTimeTo10Milliseconds";
  GpsdPlatformInfo::instance(0);
  v51[67] = v4;
  v50[68] = @"DebugFeaturesBitmask";
  v51[68] = &unk_26EAA9AD0;
  v50[69] = @"DebugSettingsString";
  v51[69] = &stru_26EAA8F28;
  uint64_t v34 = [NSDictionary dictionaryWithObjects:v51 forKeys:v50 count:70];
  if (*(void *)__p)
  {
    *(void *)&__p[8] = *(void *)__p;
    operator delete(*(void **)__p);
  }
  [*(id *)a1 registerDefaults:v34];
  if (([*(id *)a1 BOOLForKey:@"VendorLogForceCustomer"] & 1) == 0)
  {
    if (*(_DWORD *)(a1 + 8))
    {
      v47[0] = @"LogLevel";
      v48[0] = [NSNumber numberWithInt:8];
      v48[1] = &unk_26EAA9B48;
      v47[1] = @"VendorLogMaxDirectorySizeMB";
      v47[2] = @"VendorLogRotationSizeMB";
      v48[2] = &unk_26EAA9B48;
      v48[3] = &unk_26EAA9B60;
      v47[3] = @"VendorLogMaxNumberOfFiles";
      v47[4] = @"VendorLogAllToOsLog";
      if (*(_DWORD *)(a1 + 8) == 1) {
        uint64_t v35 = v4;
      }
      else {
        uint64_t v35 = v6;
      }
      v48[4] = v35;
      v48[5] = v4;
      v47[5] = @"VendorLogLz4";
      v47[6] = @"VendorLogLzfse";
      v48[6] = v4;
      void v48[7] = v4;
      v47[7] = @"VendorLogZlib";
      v47[8] = @"VerboseCommDataSize";
      v48[8] = v6;
      uint64_t v36 = [NSDictionary dictionaryWithObjects:v48 forKeys:v47 count:9];
      goto LABEL_62;
    }
    if (([*(id *)a1 BOOLForKey:@"VendorLogQA"] & 1) != 0
      || [*(id *)a1 BOOLForKey:@"VendorLogAllToOsLog"])
    {
      v45[0] = @"LogLevel";
      v46[0] = [NSNumber numberWithInt:6];
      v46[1] = &unk_26EAA9B48;
      v45[1] = @"VendorLogMaxDirectorySizeMB";
      v45[2] = @"VendorLogRotationSizeMB";
      v46[2] = &unk_26EAA9B48;
      v46[3] = &unk_26EAA9B60;
      v45[3] = @"VendorLogMaxNumberOfFiles";
      v45[4] = @"EnableProtobufBinaryLog";
      v46[4] = v6;
      v46[5] = &unk_26EAA9B90;
      v45[5] = @"ProtobufLogRetentionDays";
      v45[6] = @"EnableInterfaceTelemetry";
      v46[6] = v6;
      uint64_t v36 = [NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:7];
LABEL_62:
      [*(id *)a1 registerDefaults:v36];
      goto LABEL_63;
    }
    if ([*(id *)a1 BOOLForKey:@"VendorLogRestrictedCarry"])
    {
      v43[0] = @"LogLevel";
      v44[0] = [NSNumber numberWithInt:6];
      v44[1] = v6;
      v43[1] = @"EnableInterfaceTelemetry";
      v43[2] = @"EnableProtobufBinaryLog";
      v43[3] = @"VendorLogMaxDirectorySizeMB";
      v44[2] = v6;
      v44[3] = &unk_26EAA9B78;
      uint64_t v36 = [NSDictionary dictionaryWithObjects:v44 forKeys:v43 count:4];
      goto LABEL_62;
    }
    if (os_variant_has_internal_diagnostics())
    {
      v42[0] = objc_msgSend(NSNumber, "numberWithInt:", 5, @"LogLevel");
      v42[1] = v6;
      v41[1] = @"EnableInterfaceTelemetry";
      v41[2] = @"EnableProtobufBinaryLog";
      v42[2] = v6;
      uint64_t v36 = [NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:3];
      goto LABEL_62;
    }
  }
LABEL_63:
  uint64_t v37 = [NSDictionary dictionaryWithContentsOfFile:@"Library/Managed Preferences/mobile/gpsd.plist"];
  long long v38 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)std::string __p = 138412546;
    *(void *)&__p[4] = @"Library/Managed Preferences/mobile/gpsd.plist";
    *(_WORD *)&unsigned char __p[12] = 2112;
    *(void *)&__p[14] = v37;
    _os_log_impl(&dword_237AFF000, v38, OS_LOG_TYPE_DEFAULT, "gpsd_plistpath: %@ defaults %@", __p, 0x16u);
  }
  if (v37)
  {
    long long v39 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)std::string __p = 0;
      _os_log_impl(&dword_237AFF000, v39, OS_LOG_TYPE_DEFAULT, "Configure defaults from the gpsd.plist on the device", __p, 2u);
    }
    [*(id *)a1 registerDefaults:v37];
  }
  GpsdPreferences::dumpSettingsToLog((id *)a1);
  return a1;
}

void sub_237B25438(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,void *__p,uint64_t a56)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t GpsdPreferences::vendorLogForceCustomer(id *this)
{
  return [*this BOOLForKey:@"VendorLogForceCustomer"];
}

uint64_t GpsdPreferences::vendorLogQA(id *this)
{
  return [*this BOOLForKey:@"VendorLogQA"];
}

uint64_t GpsdPreferences::vendorLogAllToOsLog(id *this)
{
  return [*this BOOLForKey:@"VendorLogAllToOsLog"];
}

uint64_t GpsdPreferences::vendorLogRestrictedCarry(id *this)
{
  return [*this BOOLForKey:@"VendorLogRestrictedCarry"];
}

uint64_t GpsdPreferences::dumpSettingsToLog(id *this)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v11 = (void *)[*this dictionaryRepresentation];
  char v1 = objc_msgSend((id)objc_msgSend(v11, "allKeys"), "sortedArrayUsingSelector:", sel_compare_);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t result = [v1 countByEnumeratingWithState:&v12 objects:v20 count:16];
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(void *)v13;
    *(void *)&long long v3 = 138412546;
    long long v10 = v3;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v1);
        }
        uint64_t v7 = *(void **)(*((void *)&v12 + 1) + 8 * v6);
        if ((objc_msgSend(v7, "isEqualToString:", @"AppleLanguages", v10) & 1) == 0
          && ([v7 isEqualToString:@"NSLanguages"] & 1) == 0
          && ([v7 isEqualToString:@"NSInterfaceStyle"] & 1) == 0)
        {
          uint64_t v8 = [v11 objectForKeyedSubscript:v7];
          int v9 = GpsdLogObjectGeneral;
          if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)std::mutex buf = v10;
            uint64_t v17 = v7;
            __int16 v18 = 2112;
            uint64_t v19 = v8;
            _os_log_impl(&dword_237AFF000, v9, OS_LOG_TYPE_INFO, "Pref: %@ = %@", buf, 0x16u);
          }
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t result = [v1 countByEnumeratingWithState:&v12 objects:v20 count:16];
      uint64_t v4 = result;
    }
    while (result);
  }
  return result;
}

uint64_t GpsdPreferences::setMode(int a1)
{
  uint64_t result = GpsdPreferences::instance(a1);
  if (result) {
    return *(_DWORD *)(result + 8) == a1;
  }
  return result;
}

uint64_t GpsdPreferences::instance(int a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = ___ZN15GpsdPreferences8instanceENS_4ModeE_block_invoke;
  block[3] = &__block_descriptor_36_e5_v8__0l;
  int v3 = a1;
  if (GpsdPreferences::instance(GpsdPreferences::Mode)::pred != -1) {
    dispatch_once(&GpsdPreferences::instance(GpsdPreferences::Mode)::pred, block);
  }
  return GpsdPreferences::fInstance;
}

uint64_t GpsdPreferences::instance(GpsdPreferences *this)
{
  return GpsdPreferences::instance(0);
}

void ___ZN15GpsdPreferences8instanceENS_4ModeE_block_invoke()
{
}

void sub_237B2577C(_Unwind_Exception *a1)
{
  MEMORY[0x237E29950](v1, 0x1080C409227ACB4);
  _Unwind_Resume(a1);
}

uint64_t GpsdPreferences::vendorLogLz4(id *this)
{
  return [*this BOOLForKey:@"VendorLogLz4"];
}

uint64_t GpsdPreferences::vendorLogLzfse(id *this)
{
  return [*this BOOLForKey:@"VendorLogLzfse"];
}

uint64_t GpsdPreferences::vendorLogZlib(id *this)
{
  return [*this BOOLForKey:@"VendorLogZlib"];
}

void *GpsdPreferences::vendorLogDirectory@<X0>(id *this@<X0>, void *a2@<X8>)
{
  switch(*((_DWORD *)this + 2))
  {
    case 1:
      int v3 = "/var/root/gpstool_logs";
      break;
    case 2:
      int v3 = "/var/root/gpsfactorytest_logs";
      break;
    case 3:
      int v3 = "/var/root/gps_unittest_logs";
      break;
    case 4:
      int v3 = "/private/var/logs/BurnIn/gps";
      break;
    default:
      int v3 = (char *)objc_msgSend((id)objc_msgSend(*this, "stringForKey:", @"VendorLogDirectory"), "UTF8String");
      break;
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v3);
}

void *GpsdPreferences::vendorLogDirectoryAssumingGpsd@<X0>(id *this@<X0>, void *a2@<X8>)
{
  int v3 = (char *)objc_msgSend((id)objc_msgSend(*this, "stringForKey:", @"VendorLogDirectory"), "UTF8String");
  return std::string::basic_string[abi:ne180100]<0>(a2, v3);
}

uint64_t GpsdPreferences::vendorLogPrefixWithTimestamp(id *this)
{
  if (*((_DWORD *)this + 2) == 3) {
    return 0;
  }
  else {
    return [*this BOOLForKey:@"VendorLogPrefixWithTimestamp"];
  }
}

uint64_t GpsdPreferences::vendorLogMaxDirectorySizeMB(id *this)
{
  uint64_t v2 = [*this integerForKey:@"VendorLogMaxDirectorySizeMB"];
  if (![*this BOOLForKey:@"VendorLogQA"]) {
    return v2;
  }
  LODWORD(result) = [&unk_26EAA9B48 intValue];
  if ((int)result <= (int)v2) {
    return v2;
  }
  else {
    return result;
  }
}

uint64_t GpsdPreferences::vendorLogRotationSizeMB(GpsdPreferences *this)
{
  if (*((_DWORD *)this + 2) == 3) {
    return 2000;
  }
  uint64_t v1 = [*(id *)this integerForKey:@"VendorLogRotationSizeMB"];
  if (![*(id *)this BOOLForKey:@"VendorLogQA"]) {
    return v1;
  }
  LODWORD(result) = [&unk_26EAA9B48 intValue];
  if ((int)result <= (int)v1) {
    return v1;
  }
  else {
    return result;
  }
}

uint64_t GpsdPreferences::vendorLogMaxNumberOfFiles(id *this)
{
  uint64_t v2 = [*this integerForKey:@"VendorLogMaxNumberOfFiles"];
  if (![*this BOOLForKey:@"VendorLogQA"]) {
    return v2;
  }
  LODWORD(result) = [&unk_26EAA9B60 intValue];
  if ((int)result <= (int)v2) {
    return v2;
  }
  else {
    return result;
  }
}

uint64_t GpsdPreferences::vendorLogRetentionDays(id *this)
{
  return [*this floatForKey:@"VendorLogRetentionDays"];
}

BOOL GpsdPreferences::isInUnitTestMode(GpsdPreferences *this)
{
  return *((_DWORD *)this + 2) == 3;
}

uint64_t GpsdPreferences::bigPowerSwitch(id *this)
{
  return [*this BOOLForKey:@"BigPowerSwitch"];
}

uint64_t GpsdPreferences::baudRate4M8(id *this)
{
  return [*this BOOLForKey:@"BaudRate4M8"];
}

uint64_t GpsdPreferences::usesAsyncCommRead(id *this)
{
  return [*this BOOLForKey:@"UsesAsyncCommRead"];
}

void *GpsdPreferences::forceGnssDeviceLibraryName@<X0>(id *this@<X0>, void *a2@<X8>)
{
  int v3 = (char *)objc_msgSend((id)objc_msgSend(*this, "stringForKey:", @"ForceGnssDeviceLibraryName"), "UTF8String");
  return std::string::basic_string[abi:ne180100]<0>(a2, v3);
}

uint64_t integerToHalLogLevel(unsigned int a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (a1 < 9) {
    return dword_237B31C60[a1];
  }
  int v3 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
  {
    v4[0] = 67240192;
    v4[1] = a1;
    _os_log_error_impl(&dword_237AFF000, v3, OS_LOG_TYPE_ERROR, "Invalid LogLevel preference %{public}d", (uint8_t *)v4, 8u);
  }
  return 3;
}

uint64_t GpsdPreferences::getLogLevel(id *this)
{
  unsigned int v1 = [*this integerForKey:@"LogLevel"];
  return integerToHalLogLevel(v1);
}

uint64_t GpsdPreferences::getSecondaryLogLevel(id *this)
{
  unsigned int v1 = [*this integerForKey:@"SecondaryLogLevel"];
  return integerToHalLogLevel(v1);
}

uint64_t GpsdPreferences::getLogMask(id *this)
{
  uint64_t v1 = [*this integerForKey:@"LogMask"];
  return v1 & ~(v1 >> 63);
}

uint64_t GpsdPreferences::getPvtmTimeOut(id *this)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v1 = [*this integerForKey:@"PvtmTimeOut"];
  uint64_t v2 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG))
  {
    v4[0] = 67109120;
    v4[1] = v1;
    _os_log_debug_impl(&dword_237AFF000, v2, OS_LOG_TYPE_DEBUG, "Pref: kPvtmTimeOut = %d", (uint8_t *)v4, 8u);
  }
  return v1;
}

uint64_t GpsdPreferences::nmeaMaskOverride(id *this)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v1 = [*this stringForKey:@"NmeaMaskOverride"];
  uint64_t v4 = 0;
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08B08], "scannerWithString:", v1), "scanHexLongLong:", &v4);
  uint64_t v2 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)std::mutex buf = 134217984;
    uint64_t v6 = v4;
    _os_log_debug_impl(&dword_237AFF000, v2, OS_LOG_TYPE_DEBUG, "Pref: kNmeaMaskOverride = 0x%llx", buf, 0xCu);
  }
  return v4;
}

uint64_t GpsdPreferences::enableMeasurementApi(id *this)
{
  return [*this BOOLForKey:@"EnableMeasurementApi"];
}

uint64_t GpsdPreferences::enableXocalRequests(id *this)
{
  return [*this BOOLForKey:@"EnableXocalRequests"];
}

uint64_t GpsdPreferences::forceEnableXocalLearning(id *this)
{
  return [*this BOOLForKey:@"ForceEnableXocalLearning"];
}

uint64_t GpsdPreferences::maxSchedulerQos(id *this)
{
  int v1 = [*this integerForKey:@"MaxSchedulerQos"];
  if (v1 == 2)
  {
    uint64_t v4 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_237AFF000, v4, OS_LOG_TYPE_INFO, "Pref,maxSchedulerQos,UserInteractive", v7, 2u);
    }
    return 33;
  }
  else if (v1 == 1)
  {
    uint64_t v2 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)std::mutex buf = 0;
      _os_log_impl(&dword_237AFF000, v2, OS_LOG_TYPE_INFO, "Pref,maxSchedulerQos,UserInitiated", buf, 2u);
    }
    return 25;
  }
  else
  {
    uint64_t v5 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_237AFF000, v5, OS_LOG_TYPE_INFO, "Pref,maxSchedulerQos,Default", v6, 2u);
    }
    return 21;
  }
}

uint64_t GpsdPreferences::forceDisableGpsd(id *this)
{
  return [*this BOOLForKey:@"ForceDisableGpsd"];
}

uint64_t GpsdPreferences::enableBasebandReset(id *this)
{
  return [*this BOOLForKey:@"EnableBasebandReset"];
}

uint64_t GpsdPreferences::enableProtobufBinaryLog(id *this)
{
  return [*this BOOLForKey:@"EnableProtobufBinaryLog"];
}

void *GpsdPreferences::protobufLogDirectory@<X0>(id *this@<X0>, void *a2@<X8>)
{
  int v3 = (char *)objc_msgSend((id)objc_msgSend(*this, "stringForKey:", @"ProtobufLogDirectory"), "UTF8String");
  return std::string::basic_string[abi:ne180100]<0>(a2, v3);
}

uint64_t GpsdPreferences::protobufLogRetentionDays(id *this)
{
  return [*this floatForKey:@"ProtobufLogRetentionDays"];
}

uint64_t GpsdPreferences::enableProtobufTextLog(id *this)
{
  return [*this BOOLForKey:@"EnableProtobufTextLog"];
}

uint64_t GpsdPreferences::enableInterfaceTelemetry(id *this)
{
  return [*this BOOLForKey:@"EnableInterfaceTelemetry"];
}

void *GpsdPreferences::nvStorePath@<X0>(id *this@<X0>, void *a2@<X8>)
{
  uint64_t v4 = (void *)[*this stringForKey:@"DatabasePath"];
  if (v4)
  {
    uint64_t v5 = (char *)[v4 UTF8String];
  }
  else
  {
    switch(*((_DWORD *)this + 2))
    {
      case 1:
        uint64_t v5 = "/var/root/gpstool/";
        break;
      case 2:
        uint64_t v5 = "/var/root/gpsfactorytest/";
        break;
      case 3:
        uint64_t v5 = "/var/mobile/CoreGPS_UnitTests/";
        break;
      case 4:
        uint64_t v5 = "/var/logs/BurnIn/gps/";
        break;
      default:
        uint64_t v5 = "/var/db/gpsd/";
        break;
    }
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v5);
}

void *GpsdPreferences::bundleName@<X0>(GpsdPreferences *this@<X0>, void *a2@<X8>)
{
  return std::string::basic_string[abi:ne180100]<0>(a2, off_264CF0330[*((int *)this + 2)]);
}

void *GpsdPreferences::nvStoreFile@<X0>(GpsdPreferences *this@<X0>, void *a2@<X8>)
{
  int v3 = *((_DWORD *)this + 2);
  if ((v3 - 1) < 2)
  {
    uint64_t v4 = "/var/root/gpstool_nvstore.bin";
  }
  else if (v3 == 4)
  {
    uint64_t v4 = "/private/var/logs/BurnIn/gps/nvstore.bin";
  }
  else if (v3 == 3)
  {
    uint64_t v4 = "/var/mobile/CoreGPS_UnitTests_nvstore.bin";
  }
  else
  {
    uint64_t v4 = (char *)objc_msgSend((id)objc_msgSend(*(id *)this, "stringForKey:", @"NvStoreFile"), "UTF8String");
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v4);
}

uint64_t GpsdPreferences::verboseNvStore(id *this)
{
  return [*this BOOLForKey:@"VerboseNvStore"];
}

uint64_t GpsdPreferences::verboseCommDataSize(id *this)
{
  return [*this BOOLForKey:@"VerboseCommDataSize"];
}

uint64_t GpsdPreferences::verboseCommDataSniffer(id *this)
{
  return [*this BOOLForKey:@"VerboseCommDataSniffer"];
}

void GpsdPreferences::recoveryTestCase(GpsdPreferences *this)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v1 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)std::mutex buf = 0;
    _os_log_error_impl(&dword_237AFF000, v1, OS_LOG_TYPE_ERROR, "Checking recoveryTestCase value is not permitted unless GPSD_DEBUGONLY_PERMIT_TEST_CASES is defined", buf, 2u);
    int v1 = GpsdLogObjectGeneral;
  }
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)std::mutex buf = 136446722;
    uint64_t v6 = "/Library/Caches/com.apple.xbs/Sources/CoreGPS/Sources/Daemon/GpsdPreferences.mm";
    __int16 v7 = 1026;
    int v8 = 641;
    __int16 v9 = 2082;
    long long v10 = "recoveryTestCase";
    _os_log_error_impl(&dword_237AFF000, v1, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: assertion failure in %{public}s", buf, 0x1Cu);
  }
  std::string::basic_string[abi:ne180100]<0>(&v4, "assert");
  std::string::basic_string[abi:ne180100]<0>(&v3, "recoveryTestCase");
  std::string::basic_string[abi:ne180100]<0>(&v2, "Checking recoveryTestCase value is not permitted unless GPSD_DEBUGONLY_PERMIT_TEST_CASES is defined");
  gpsd::util::triggerDiagnosticReport((uint64_t)&v4, (uint64_t)&v3, (uint64_t)&v2);
  std::string::~string(&v2);
  std::string::~string(&v3);
  std::string::~string(&v4);
  __assert_rtn("recoveryTestCase", "GpsdPreferences.mm", 641, "false && \"Checking recoveryTestCase value is not permitted unless GPSD_DEBUGONLY_PERMIT_TEST_CASES is defined\"");
}

void sub_237B262AC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (a27 < 0) {
    operator delete(a22);
  }
  _Unwind_Resume(exception_object);
}

uint64_t GpsdPreferences::genericTestCase(id *this)
{
  return [*this integerForKey:@"GenericTestCase"];
}

uint64_t GpsdPreferences::performanceReportIntervalSeconds(id *this)
{
  return [*this integerForKey:@"PerformanceReportIntervalSeconds"];
}

uint64_t GpsdPreferences::enableConstellationGps(id *this)
{
  return [*this BOOLForKey:@"EnableGps"];
}

uint64_t GpsdPreferences::enableConstellationQzss(id *this)
{
  return [*this BOOLForKey:@"EnableQzss"];
}

uint64_t GpsdPreferences::enableConstellationGlonass(id *this)
{
  return [*this BOOLForKey:@"EnableGlonass"];
}

uint64_t GpsdPreferences::enableConstellationGalileo(id *this)
{
  return [*this BOOLForKey:@"EnableGalileo"];
}

uint64_t GpsdPreferences::enableConstellationBeidou(id *this)
{
  return [*this BOOLForKey:@"EnableBeidou"];
}

uint64_t GpsdPreferences::enableConstellationNavic(id *this)
{
  return [*this BOOLForKey:@"EnableNavic"];
}

uint64_t GpsdPreferences::enableL5(id *this)
{
  return [*this BOOLForKey:@"EnableL5"];
}

uint64_t GpsdPreferences::enableCoexL5NotchFilter(id *this)
{
  return [*this BOOLForKey:@"EnableCoexL5NotchFilter"];
}

uint64_t GpsdPreferences::useB14LteFilterSettingsForB13(id *this)
{
  return [*this BOOLForKey:@"CoexUseB14LteFilterSettingsForB13"];
}

uint64_t GpsdPreferences::enableConstellationsBitfield(id *this)
{
  int v2 = [*this BOOLForKey:@"EnableGps"];
  if ([*this BOOLForKey:@"EnableQzss"]) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  int v4 = v3 | v2;
  if ([*this BOOLForKey:@"EnableGlonass"]) {
    int v5 = 2;
  }
  else {
    int v5 = 0;
  }
  if ([*this BOOLForKey:@"EnableGalileo"]) {
    int v6 = 8;
  }
  else {
    int v6 = 0;
  }
  int v7 = v4 | v5 | v6;
  if ([*this BOOLForKey:@"EnableBeidou"]) {
    int v8 = 4;
  }
  else {
    int v8 = 0;
  }
  if ([*this BOOLForKey:@"EnableNavic"]) {
    int v9 = 32;
  }
  else {
    int v9 = 0;
  }
  return v7 | v8 | v9;
}

unint64_t GpsdPreferences::determineLibindusFinalCoExConfig(id *this, uint64_t a2, int a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  GpsdPlatformInfo::instance(0);
  if (a3) {
    uint64_t v6 = a2;
  }
  else {
    uint64_t v6 = 0;
  }
  if ([*this objectForKey:@"CREnableCoexBlanking2G"])
  {
    if ([*this BOOLForKey:@"CREnableCoexBlanking2G"]) {
      v6 |= 1uLL;
    }
    else {
      v6 &= ~1uLL;
    }
  }
  if ([*this objectForKey:@"CREnableCoexBlankingNR"])
  {
    if ([*this BOOLForKey:@"CREnableCoexBlankingNR"]) {
      v6 |= 2uLL;
    }
    else {
      v6 &= ~2uLL;
    }
  }
  if ([*this objectForKey:@"CREnableCoexLTEB13"])
  {
    if ([*this BOOLForKey:@"CREnableCoexLTEB13"]) {
      v6 |= 4uLL;
    }
    else {
      v6 &= ~4uLL;
    }
  }
  if ([*this objectForKey:@"CREnableCoexLTEB14"])
  {
    if ([*this BOOLForKey:@"CREnableCoexLTEB14"]) {
      v6 |= 8uLL;
    }
    else {
      v6 &= ~8uLL;
    }
  }
  if ([*this objectForKey:@"CREnableCoexEnhancedAssistance"])
  {
    if ([*this BOOLForKey:@"CREnableCoexEnhancedAssistance"]) {
      v6 |= 0x10uLL;
    }
    else {
      v6 &= ~0x10uLL;
    }
  }
  if ([*this objectForKey:@"CREnableSTWMitigation"]
    && ![*this BOOLForKey:@"CREnableSTWMitigation"])
  {
    unint64_t v7 = v6 & 0xFFFFFFFFFFFFFFDFLL;
  }
  else
  {
    unint64_t v7 = v6 | 0x20;
  }
  int v8 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
  {
    int v9 = "No";
    int v11 = 134349826;
    unint64_t v12 = v7;
    __int16 v13 = 2050;
    if (a3) {
      int v9 = "Yes";
    }
    uint64_t v14 = 0;
    __int16 v15 = 2080;
    std::chrono::system_clock::time_point v16 = v9;
    __int16 v17 = 2050;
    uint64_t v18 = a2;
    _os_log_impl(&dword_237AFF000, v8, OS_LOG_TYPE_INFO, "#gdm,decodeCoexConfig,coexConfigPostOverride,0x%{public}llx,coexConfigDefault,0x%{public}llx,isCLOverride,%s,coexConfigCLOverride,0x%{public}llx", (uint8_t *)&v11, 0x2Au);
  }
  return v7;
}

unint64_t GpsdPreferences::libolafCoexFlagsBitfield(id *this)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  int v2 = [*this BOOLForKey:@"EnableCoexBitEnhancedFreqAsst"];
  unsigned int v24 = [*this BOOLForKey:@"EnableCoexBitCdmaFineTimeAsst"];
  int v25 = [*this BOOLForKey:@"EnableCoexBitBlankingGpsL1"];
  int v3 = [*this BOOLForKey:@"EnableCoexBitBlankingGloL1"];
  int v4 = [*this BOOLForKey:@"EnableCoexBitBlankingBdsB1I"];
  int v5 = [*this BOOLForKey:@"EnableCoexBitStaticSpur"];
  int v6 = [*this BOOLForKey:@"EnableCoexBitDynamicNotch"];
  int v7 = [*this BOOLForKey:@"EnableCoexBitJammer"];
  int v8 = [*this integerForKey:@"CoexForceGpsL1Filter"];
  int v9 = [*this integerForKey:@"CoexForceGloL1Filter"];
  int v10 = [*this integerForKey:@"CoexForceB1IFilter"];
  int v11 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)std::mutex buf = 67242752;
    int v27 = v2;
    __int16 v28 = 1026;
    unsigned int v29 = v24;
    __int16 v30 = 1026;
    int v31 = v25;
    __int16 v32 = 1026;
    int v33 = v3;
    __int16 v34 = 1026;
    int v35 = v4;
    __int16 v36 = 1026;
    int v37 = v8;
    __int16 v38 = 1026;
    int v39 = v9;
    __int16 v40 = 1026;
    int v41 = v10;
    __int16 v42 = 1026;
    int v43 = v5;
    __int16 v44 = 1026;
    int v45 = v6;
    __int16 v46 = 1026;
    int v47 = v7;
    _os_log_impl(&dword_237AFF000, v11, OS_LOG_TYPE_INFO, "#coex,eFA,%{public}d,FTA,%{public}d,blankingGPS/GLO/B1I,%{public}d,%{public}d,%{public}d,forceFilterGPS/GLO/B1I,%{public}d,%{public}d,%{public}d,enableSpurStatic,%{public}d,enableSpurDynamic,%{public}d,enableJammer,%{public}d", buf, 0x44u);
  }
  if ((v8 - 1) > 3) {
    uint64_t v12 = 30720;
  }
  else {
    uint64_t v12 = qword_237B31C88[v8 - 1];
  }
  if ((v10 - 1) > 2) {
    uint64_t v13 = 917504;
  }
  else {
    uint64_t v13 = qword_237B31CA8[v10 - 1];
  }
  uint64_t v14 = 98304;
  if (v9 == 2) {
    uint64_t v14 = 0x10000;
  }
  if (v9 == 1) {
    uint64_t v14 = 0x8000;
  }
  unint64_t v15 = 0x100000;
  if (!(v8 | v9)) {
    unint64_t v15 = (unint64_t)(v10 != 0) << 20;
  }
  uint64_t v16 = 4;
  if (!v2) {
    uint64_t v16 = 0;
  }
  uint64_t v17 = 8;
  if (!v5) {
    uint64_t v17 = 0;
  }
  uint64_t v18 = 16;
  if (!v6) {
    uint64_t v18 = 0;
  }
  uint64_t v19 = 32;
  if (!v7) {
    uint64_t v19 = 0;
  }
  uint64_t v20 = 256;
  if (!v25) {
    uint64_t v20 = 0;
  }
  uint64_t v21 = 512;
  if (!v3) {
    uint64_t v21 = 0;
  }
  uint64_t v22 = 1024;
  if (!v4) {
    uint64_t v22 = 0;
  }
  return v16 | v24 | v20 | v21 | v22 | v17 | v18 | v19 | v14 | v15 | v12 | v13;
}

uint64_t GpsdPreferences::groupDelayL1InCAChips(id *this)
{
  return [*this doubleForKey:@"GroupDelayL1InCAChips"];
}

uint64_t GpsdPreferences::externalToChipL5GroupDelayMeters(id *this)
{
  return [*this doubleForKey:@"ExternalToChipL5GroupDelayMeters"];
}

void GpsdPreferences::glonassPerFrequencyGroupDelayMeters(id *this@<X0>, char **a2@<X8>)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  int v3 = (void *)[*this arrayForKey:@"GlonassPerFrequencyGroupDelayMeters"];
  int v4 = v3;
  if (v3 && (unint64_t)[v3 count] > 0xD)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v6 = [v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v6)
    {
      int v7 = 0;
      uint64_t v8 = *(void *)v22;
      do
      {
        uint64_t v9 = 0;
        int v10 = a2[2];
        int v11 = *a2;
        do
        {
          if (*(void *)v22 != v8) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v21 + 1) + 8 * v9) doubleValue];
          uint64_t v13 = v12;
          if (v7 >= v10)
          {
            uint64_t v14 = (v7 - v11) >> 3;
            unint64_t v15 = v14 + 1;
            if ((unint64_t)(v14 + 1) >> 61) {
              std::vector<gnssTest::RfMeasurement>::__throw_length_error[abi:ne180100]();
            }
            if ((v10 - v11) >> 2 > v15) {
              unint64_t v15 = (v10 - v11) >> 2;
            }
            if ((unint64_t)(v10 - v11) >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v16 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v16 = v15;
            }
            if (v16)
            {
              if (v16 >> 61) {
                std::__throw_bad_array_new_length[abi:ne180100]();
              }
              uint64_t v17 = (char *)operator new(8 * v16);
            }
            else
            {
              uint64_t v17 = 0;
            }
            uint64_t v18 = &v17[8 * v14];
            *(void *)uint64_t v18 = v13;
            uint64_t v19 = v18 + 8;
            while (v7 != v11)
            {
              uint64_t v20 = *((void *)v7 - 1);
              v7 -= 8;
              *((void *)v18 - 1) = v20;
              v18 -= 8;
            }
            int v10 = &v17[8 * v16];
            *a2 = v18;
            a2[1] = v19;
            a2[2] = v10;
            if (v11) {
              operator delete(v11);
            }
            int v11 = v18;
            int v7 = v19;
          }
          else
          {
            *(void *)int v7 = v12;
            v7 += 8;
          }
          a2[1] = v7;
          ++v9;
        }
        while (v9 != v6);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v6);
    }
  }
  else
  {
    int v5 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)std::mutex buf = 0;
      _os_log_error_impl(&dword_237AFF000, v5, OS_LOG_TYPE_ERROR, "Invalid glonassPerFrequencyGroupDelayMeters parameters", buf, 2u);
    }
  }
}

void sub_237B26C44(_Unwind_Exception *exception_object)
{
  int v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t GpsdPreferences::isRavenExpected(id *this)
{
  return [*this BOOLForKey:@"RavenExpected"];
}

uint64_t GpsdPreferences::forceFireExtensionsPlatform(id *this)
{
  return [*this integerForKey:@"ForceFireExtensionsPlatform"];
}

uint64_t GpsdPreferences::useInternalEmergencyStack(id *this)
{
  return [*this BOOLForKey:@"UseInternalEmergencyStack"];
}

uint64_t GpsdPreferences::debugFeaturesBitmask(id *this)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v1 = [*this integerForKey:@"DebugFeaturesBitmask"];
  int v2 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 134217984;
    uint64_t v5 = v1;
    _os_log_impl(&dword_237AFF000, v2, OS_LOG_TYPE_DEFAULT, "debugFeaturesBitmask,0x%llx", (uint8_t *)&v4, 0xCu);
  }
  return v1;
}

void *GpsdPreferences::debugSettingsString@<X0>(id *this@<X0>, void *a2@<X8>)
{
  int v3 = (char *)objc_msgSend((id)objc_msgSend(*this, "stringForKey:", @"DebugSettingsString"), "UTF8String");
  return std::string::basic_string[abi:ne180100]<0>(a2, v3);
}

uint64_t GpsdPreferences::platformSpecificFeaturesBitmask(id *this)
{
  if (*(_DWORD *)(GpsdPlatformInfo::instance(0) + 8) != 107) {
    return 0;
  }
  uint64_t v2 = [*this BOOLForKey:@"EnableCoexL5NotchFilter"];
  if ([*this BOOLForKey:@"HasXtalFreqJumpRisk"]) {
    return v2 | 2;
  }
  else {
    return v2;
  }
}

uint64_t GpsdPreferences::hasXtalFreqJumpRisk(id *this)
{
  return [*this BOOLForKey:@"HasXtalFreqJumpRisk"];
}

uint64_t GpsdPreferences::allowAssistanceTimeTo10Milliseconds(id *this)
{
  return [*this BOOLForKey:@"AllowAssistanceTimeTo10Milliseconds"];
}

void GnssHal::CommSpi::CommSpi(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  *(void *)a1 = &unk_26EAA8600;
  std::__function::__value_func<void ()(GnssHal::TimeTransferPulseMark)>::__value_func[abi:ne180100](a1 + 8, a2);
  uint64_t v5 = (id *)GpsdPreferences::instance(0);
  *(unsigned char *)(a1 + 40) = GpsdPreferences::verboseCommDataSize(v5);
  uint64_t v6 = (id *)GpsdPreferences::instance(0);
  char v7 = GpsdPreferences::verboseCommDataSniffer(v6);
  *(_OWORD *)(a1 + 96) = 0u;
  *(unsigned char *)(a1 + 41) = v7;
  *(unsigned char *)(a1 + 42) = 0;
  *(_DWORD *)(a1 + 44) = 0;
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 80) = 0;
  *(void *)(a1 + 88) = a3;
  *(_OWORD *)(a1 + 112) = 0u;
  *(void *)(a1 + 128) = 0;
  uint64_t v8 = (id *)GpsdPreferences::instance(0);
  dispatch_qos_class_t v9 = GpsdPreferences::maxSchedulerQos(v8);
  gpsd::util::dispatchQueueInit((dispatch_queue_t *)(a1 + 96), v9, "commTx");
  gpsd::util::dispatchQueueInit((dispatch_queue_t *)(a1 + 104), QOS_CLASS_USER_INITIATED, "commRx");
  if (!*(void *)(a1 + 88)) {
    *(void *)(a1 + 88) = *(void *)(a1 + 104);
  }
  operator new();
}

void sub_237B272E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,void *a27,uint64_t a28,int a29,__int16 a30,char a31,char a32,void *a33,uint64_t a34,int a35,__int16 a36,char a37,char a38,uint64_t a39,uint64_t a40,int a41,__int16 a42,char a43,char a44)
{
  std::__function::__value_func<void ()(unsigned char *,unsigned long)>::~__value_func[abi:ne180100]((void *)(v48 - 112));
  MEMORY[0x237E29950](v47, 0x10B0C4041A38AA4);
  uint64_t v50 = (void *)(v46 - 40);
  uint64_t v51 = *(void *)(v45 + 128);
  *(void *)(v45 + 128) = 0;
  if (v51) {
    std::default_delete<GnssHal::CommSpi::AsyncBuffering>::operator()[abi:ne180100](v51);
  }
  uint64_t v52 = *(void *)(v45 + 120);
  *(void *)(v45 + 120) = 0;
  if (v52) {
    std::default_delete<GnssHal::CommSpi::AsyncBuffering>::operator()[abi:ne180100](v52);
  }
  std::__function::__value_func<void ()(unsigned char *,unsigned long)>::~__value_func[abi:ne180100](v50);
  std::__function::__value_func<void ()(GnssHal::TimeTransferPulseMark)>::~__value_func[abi:ne180100](v44);
  _Unwind_Resume(a1);
}

void GnssHal::CommSpi::setGnssChipPowerStateOn(GnssHal::CommSpi *this, int a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (GnssHal::CommSpi::isGnssChipPowerStateOn(this) == a2)
  {
    int v4 = GpsdLogObjectWarning;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectWarning, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)std::mutex buf = 67240192;
      *(_DWORD *)uint64_t v14 = a2;
      _os_log_impl(&dword_237AFF000, v4, OS_LOG_TYPE_DEFAULT, "#spi,setGnssChipPowerStateOn,alreadyInState,%{public}d", buf, 8u);
    }
  }
  if (a2) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 1;
  }
  mach_error_t v6 = (*(uint64_t (**)(void, uint64_t))(**((void **)this + 14) + 96))(*((void *)this + 14), v5);
  char v7 = GpsdLogObjectGeneral;
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      dispatch_qos_class_t v9 = mach_error_string(v6);
      *(_DWORD *)std::mutex buf = 67240450;
      *(_DWORD *)uint64_t v14 = v6;
      *(_WORD *)&void v14[4] = 2082;
      *(void *)&v14[6] = v9;
      _os_log_error_impl(&dword_237AFF000, v7, OS_LOG_TYPE_ERROR, "#spi,fail,gpti,SetPowerState,errCode,0x%{public}X,%{public}s", buf, 0x12u);
      char v7 = GpsdLogObjectGeneral;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)std::mutex buf = 136446722;
      *(void *)uint64_t v14 = "/Library/Caches/com.apple.xbs/Sources/CoreGPS/Sources/HAL/Implementation/GnssHalCommSpi.mm";
      *(_WORD *)&v14[8] = 1026;
      *(_DWORD *)&v14[10] = 60;
      __int16 v15 = 2082;
      unint64_t v16 = "setGnssChipPowerStateOn";
      _os_log_error_impl(&dword_237AFF000, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: assertion failure in %{public}s", buf, 0x1Cu);
    }
    std::string::basic_string[abi:ne180100]<0>(&v12, "assert");
    std::string::basic_string[abi:ne180100]<0>(&v11, "setGnssChipPowerStateOn");
    std::string::basic_string[abi:ne180100]<0>(&v10, "#spi,fail,gpti,SetPowerState,errCode,0x%{public}X,%{public}s");
    gpsd::util::triggerDiagnosticReport((uint64_t)&v12, (uint64_t)&v11, (uint64_t)&v10);
    std::string::~string(&v10);
    std::string::~string(&v11);
    std::string::~string(&v12);
    __assert_rtn("setGnssChipPowerStateOn", "GnssHalCommSpi.mm", 60, "false && \"#spi,fail,\" \"gpti,\" \"SetPowerState\" \",errCode,0x%{public}X,%{public}s\"");
  }
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)std::mutex buf = 67240448;
    *(_DWORD *)uint64_t v14 = a2;
    *(_WORD *)&void v14[4] = 1026;
    *(_DWORD *)&v14[6] = v5;
    _os_log_impl(&dword_237AFF000, v7, OS_LOG_TYPE_DEFAULT, "#spi,setGnssChipPowerStateOn,enable,%{public}d,set,%{public}d", buf, 0xEu);
  }
  if (GnssHal::CommSpi::isGnssChipPowerStateOn(this) != a2)
  {
    uint64_t v8 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)std::mutex buf = 0;
      _os_log_error_impl(&dword_237AFF000, v8, OS_LOG_TYPE_ERROR, "#spi,setGnssChipPowerStateOn,failed", buf, 2u);
    }
  }
}

void sub_237B276C8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (a27 < 0) {
    operator delete(a22);
  }
  _Unwind_Resume(exception_object);
}

BOOL GnssHal::CommSpi::isGnssChipPowerStateOn(GnssHal::CommSpi *this)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  int v8 = 0;
  mach_error_t v1 = (*(uint64_t (**)(void, int *))(**((void **)this + 14) + 104))(*((void *)this + 14), &v8);
  uint64_t v2 = GpsdLogObjectGeneral;
  if (v1)
  {
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      int v4 = mach_error_string(v1);
      *(_DWORD *)std::mutex buf = 67240450;
      *(_DWORD *)std::string v10 = v1;
      *(_WORD *)&void v10[4] = 2082;
      *(void *)&v10[6] = v4;
      _os_log_error_impl(&dword_237AFF000, v2, OS_LOG_TYPE_ERROR, "#spi,fail,gpti,GetGnssChipPowerState,errCode,0x%{public}X,%{public}s", buf, 0x12u);
      uint64_t v2 = GpsdLogObjectGeneral;
    }
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)std::mutex buf = 136446722;
      *(void *)std::string v10 = "/Library/Caches/com.apple.xbs/Sources/CoreGPS/Sources/HAL/Implementation/GnssHalCommSpi.mm";
      *(_WORD *)&v10[8] = 1026;
      *(_DWORD *)&v10[10] = 70;
      __int16 v11 = 2082;
      std::string v12 = "isGnssChipPowerStateOn";
      _os_log_error_impl(&dword_237AFF000, v2, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: assertion failure in %{public}s", buf, 0x1Cu);
    }
    std::string::basic_string[abi:ne180100]<0>(&v7, "assert");
    std::string::basic_string[abi:ne180100]<0>(&v6, "isGnssChipPowerStateOn");
    std::string::basic_string[abi:ne180100]<0>(&v5, "#spi,fail,gpti,GetGnssChipPowerState,errCode,0x%{public}X,%{public}s");
    gpsd::util::triggerDiagnosticReport((uint64_t)&v7, (uint64_t)&v6, (uint64_t)&v5);
    std::string::~string(&v5);
    std::string::~string(&v6);
    std::string::~string(&v7);
    __assert_rtn("isGnssChipPowerStateOn", "GnssHalCommSpi.mm", 70, "false && \"#spi,fail,\" \"gpti,\" \"GetGnssChipPowerState\" \",errCode,0x%{public}X,%{public}s\"");
  }
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)std::mutex buf = 67240192;
    *(_DWORD *)std::string v10 = v8;
    _os_log_impl(&dword_237AFF000, v2, OS_LOG_TYPE_DEFAULT, "#spi,GetGnssChipPowerState,%{public}d", buf, 8u);
  }
  return v8 == 2;
}

void sub_237B27938(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a20 < 0) {
    operator delete(a15);
  }
  if (a26 < 0) {
    operator delete(a21);
  }
  _Unwind_Resume(exception_object);
}

uint64_t GnssHal::CommSpi::setReadCallback(void *a1, uint64_t a2)
{
  uint64_t v4 = (*(uint64_t (**)(void *))(*a1 + 72))(a1);
  if (v4)
  {
    std::string v5 = a1 + 7;
    if (a1[10])
    {
      std::string v6 = GpsdLogObjectWarning;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectWarning, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)std::mutex buf = 0;
        _os_log_impl(&dword_237AFF000, v6, OS_LOG_TYPE_DEFAULT, "#spi,setReadCallback,overwrite", buf, 2u);
      }
    }
    std::function<void ()(unsigned char *,unsigned long)>::operator=(v5, a2);
    uint64_t v7 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO))
    {
      __int16 v14 = 0;
      int v8 = "#spi,setReadCallback";
      dispatch_qos_class_t v9 = (uint8_t *)&v14;
      std::string v10 = v7;
      os_log_type_t v11 = OS_LOG_TYPE_INFO;
LABEL_9:
      _os_log_impl(&dword_237AFF000, v10, v11, v8, v9, 2u);
    }
  }
  else
  {
    uint64_t v12 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unint64_t v16 = 0;
      int v8 = "#spi,setReadCallback,notSupported";
      dispatch_qos_class_t v9 = v16;
      std::string v10 = v12;
      os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_9;
    }
  }
  return v4;
}

uint64_t GnssHal::CommSpi::open(GnssHal::CommSpi *this)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if ((*(unsigned int (**)(GnssHal::CommSpi *))(*(void *)this + 32))(this))
  {
    uint64_t v2 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7) = 0;
      _os_log_impl(&dword_237AFF000, v2, OS_LOG_TYPE_DEFAULT, "#spi,open,alreadyOpen", (uint8_t *)&v7, 2u);
    }
  }
  else
  {
    uint64_t v3 = *((void *)this + 6);
    if (v3 && (uint64_t v4 = *((void *)this + 14)) != 0)
    {
      std::string v5 = GpsdLogObjectGeneral;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG))
      {
        int v7 = 134349312;
        uint64_t v8 = v3;
        __int16 v9 = 2050;
        uint64_t v10 = v4;
        _os_log_debug_impl(&dword_237AFF000, v5, OS_LOG_TYPE_DEBUG, "#spi,open,existing,plugin,%{public}p,ifc,%{public}p", (uint8_t *)&v7, 0x16u);
      }
    }
    else
    {
      GnssHal::CommSpi::createIoPlugin(this);
    }
    GnssHal::CommSpi::setGnssChipPowerStateOn(this, 0);
    GnssHal::CommSpi::setGnssChipPowerStateOn(this, 1);
    *((unsigned char *)this + 42) = 1;
  }
  return 1;
}

void GnssHal::CommSpi::createIoPlugin(GnssHal::CommSpi *this)
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  uint64_t v2 = (IOCFPlugInInterface ***)((char *)this + 48);
  if (!*((void *)this + 6))
  {
    mach_port_t v3 = *MEMORY[0x263F0EC88];
    CFDictionaryRef v4 = IOServiceNameMatching("gnss");
    io_service_t MatchingService = IOServiceGetMatchingService(v3, v4);
    if (!MatchingService)
    {
      int v26 = GpsdLogObjectGeneral;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)std::mutex buf = 0;
        _os_log_error_impl(&dword_237AFF000, v26, OS_LOG_TYPE_ERROR, "#spi,fail,IOServiceGetMatchingService", buf, 2u);
        int v26 = GpsdLogObjectGeneral;
      }
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)std::mutex buf = 136446722;
        *(void *)unint64_t v64 = "/Library/Caches/com.apple.xbs/Sources/CoreGPS/Sources/HAL/Implementation/GnssHalCommSpi.mm";
        *(_WORD *)&v64[8] = 1026;
        *(_DWORD *)&v64[10] = 127;
        __int16 v65 = 2082;
        uint64_t v66 = "createIoPlugin";
        _os_log_error_impl(&dword_237AFF000, v26, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: assertion failure in %{public}s", buf, 0x1Cu);
      }
      std::string::basic_string[abi:ne180100]<0>(&v62, "assert");
      std::string::basic_string[abi:ne180100]<0>(&v61, "createIoPlugin");
      std::string::basic_string[abi:ne180100]<0>(&v60, "#spi,fail,IOServiceGetMatchingService");
      gpsd::util::triggerDiagnosticReport((uint64_t)&v62, (uint64_t)&v61, (uint64_t)&v60);
      std::string::~string(&v60);
      std::string::~string(&v61);
      std::string::~string(&v62);
      __assert_rtn("createIoPlugin", "GnssHalCommSpi.mm", 127, "false && \"#spi,fail,IOServiceGetMatchingService\"");
    }
    io_registry_entry_t child = 0;
    mach_error_t ChildEntry = IORegistryEntryGetChildEntry(MatchingService, "IOService", &child);
    if (ChildEntry)
    {
      uint64_t v27 = GpsdLogObjectGeneral;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
      {
        __int16 v28 = mach_error_string(ChildEntry);
        *(_DWORD *)std::mutex buf = 67240450;
        *(_DWORD *)unint64_t v64 = ChildEntry;
        *(_WORD *)&v64[4] = 2082;
        *(void *)&v64[6] = v28;
        _os_log_error_impl(&dword_237AFF000, v27, OS_LOG_TYPE_ERROR, "#spi,fail,kern,IORegistryEntryGetChildEntry,errCode,0x%{public}X,%{public}s", buf, 0x12u);
        uint64_t v27 = GpsdLogObjectGeneral;
      }
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)std::mutex buf = 136446722;
        *(void *)unint64_t v64 = "/Library/Caches/com.apple.xbs/Sources/CoreGPS/Sources/HAL/Implementation/GnssHalCommSpi.mm";
        *(_WORD *)&v64[8] = 1026;
        *(_DWORD *)&v64[10] = 131;
        __int16 v65 = 2082;
        uint64_t v66 = "createIoPlugin";
        _os_log_error_impl(&dword_237AFF000, v27, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: assertion failure in %{public}s", buf, 0x1Cu);
      }
      std::string::basic_string[abi:ne180100]<0>(&v58, "assert");
      std::string::basic_string[abi:ne180100]<0>(&v57, "createIoPlugin");
      std::string::basic_string[abi:ne180100]<0>(&v56, "#spi,fail,kern,IORegistryEntryGetChildEntry,errCode,0x%{public}X,%{public}s");
      gpsd::util::triggerDiagnosticReport((uint64_t)&v58, (uint64_t)&v57, (uint64_t)&v56);
      std::string::~string(&v56);
      std::string::~string(&v57);
      std::string::~string(&v58);
      __assert_rtn("createIoPlugin", "GnssHalCommSpi.mm", 131, "false && \"#spi,fail,\" \"kern,\" \"IORegistryEntryGetChildEntry\" \",errCode,0x%{public}X,%{public}s\"");
    }
    SInt32 theScore = 0;
    io_service_t v7 = child;
    CFUUIDRef v8 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x263EFFB30], 0x31u, 0x68u, 0xB0u, 0x8Eu, 0xE5u, 0x7Du, 0x4Eu, 4u, 0x92u, 0xC9u, 0xC0u, 0x15u, 0xB8u, 0xB0u, 0xE9u, 0xABu);
    CFUUIDRef v9 = CFUUIDGetConstantUUIDWithBytes(0, 0xC2u, 0x44u, 0xE8u, 0x58u, 0x10u, 0x9Cu, 0x11u, 0xD4u, 0x91u, 0xD4u, 0, 0x50u, 0xE4u, 0xC6u, 0x42u, 0x6Fu);
    mach_error_t v10 = IOCreatePlugInInterfaceForService(v7, v8, v9, v2, &theScore);
    if (v10)
    {
      int v31 = GpsdLogObjectGeneral;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
      {
        __int16 v32 = mach_error_string(v10);
        *(_DWORD *)std::mutex buf = 67240450;
        *(_DWORD *)unint64_t v64 = v10;
        *(_WORD *)&v64[4] = 2082;
        *(void *)&v64[6] = v32;
        _os_log_error_impl(&dword_237AFF000, v31, OS_LOG_TYPE_ERROR, "#spi,fail,kern,IOCreatePlugInInterfaceForService,errCode,0x%{public}X,%{public}s", buf, 0x12u);
        int v31 = GpsdLogObjectGeneral;
      }
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)std::mutex buf = 136446722;
        *(void *)unint64_t v64 = "/Library/Caches/com.apple.xbs/Sources/CoreGPS/Sources/HAL/Implementation/GnssHalCommSpi.mm";
        *(_WORD *)&v64[8] = 1026;
        *(_DWORD *)&v64[10] = 135;
        __int16 v65 = 2082;
        uint64_t v66 = "createIoPlugin";
        _os_log_error_impl(&dword_237AFF000, v31, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: assertion failure in %{public}s", buf, 0x1Cu);
      }
      std::string::basic_string[abi:ne180100]<0>(&v54, "assert");
      std::string::basic_string[abi:ne180100]<0>(&v53, "createIoPlugin");
      std::string::basic_string[abi:ne180100]<0>(&v52, "#spi,fail,kern,IOCreatePlugInInterfaceForService,errCode,0x%{public}X,%{public}s");
      gpsd::util::triggerDiagnosticReport((uint64_t)&v54, (uint64_t)&v53, (uint64_t)&v52);
      std::string::~string(&v52);
      std::string::~string(&v53);
      std::string::~string(&v54);
      __assert_rtn("createIoPlugin", "GnssHalCommSpi.mm", 135, "false && \"#spi,fail,\" \"kern,\" \"IOCreatePlugInInterfaceForService\" \",errCode,0x%{public}X,%{public}s\"");
    }
    uint64_t v11 = *v2;
    if (!*v2 || !*v11)
    {
      int v25 = GpsdLogObjectGeneral;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)std::mutex buf = 0;
        _os_log_error_impl(&dword_237AFF000, v25, OS_LOG_TYPE_ERROR, "#spi,fIOCFPluginInterface,nullptr", buf, 2u);
        int v25 = GpsdLogObjectGeneral;
      }
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)std::mutex buf = 136446722;
        *(void *)unint64_t v64 = "/Library/Caches/com.apple.xbs/Sources/CoreGPS/Sources/HAL/Implementation/GnssHalCommSpi.mm";
        *(_WORD *)&v64[8] = 1026;
        *(_DWORD *)&v64[10] = 136;
        __int16 v65 = 2082;
        uint64_t v66 = "createIoPlugin";
        _os_log_error_impl(&dword_237AFF000, v25, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: assertion failure in %{public}s", buf, 0x1Cu);
      }
      std::string::basic_string[abi:ne180100]<0>(&v51, "assert");
      std::string::basic_string[abi:ne180100]<0>(&v50, "createIoPlugin");
      std::string::basic_string[abi:ne180100]<0>(&v49, "#spi,fIOCFPluginInterface,nullptr");
      gpsd::util::triggerDiagnosticReport((uint64_t)&v51, (uint64_t)&v50, (uint64_t)&v49);
      std::string::~string(&v49);
      std::string::~string(&v50);
      std::string::~string(&v51);
      __assert_rtn("createIoPlugin", "GnssHalCommSpi.mm", 136, "false && \"#spi,fIOCFPluginInterface,nullptr\"");
    }
    uint64_t v12 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)std::mutex buf = 134349312;
      *(void *)unint64_t v64 = v11;
      *(_WORD *)&v64[8] = 1026;
      *(_DWORD *)&v64[10] = theScore;
      _os_log_impl(&dword_237AFF000, v12, OS_LOG_TYPE_DEFAULT, "#spi,opened,plugin,%{public}p,score,%{public}d", buf, 0x12u);
    }
  }
  __int16 v14 = (void *)((char *)this + 112);
  uint64_t v13 = (void *)*((void *)this + 14);
  if (!v13)
  {
    __int16 v15 = *v2;
    QueryInterface = (**v2)->QueryInterface;
    CFUUIDRef v17 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x263EFFB30], 0xE8u, 0x77u, 0xCDu, 0x61u, 0x8Du, 0x30u, 0x46u, 0x2Du, 0xA3u, 0xB7u, 0xB0u, 0x11u, 0x5Au, 0x2Cu, 0xF8u, 0xA8u);
    CFUUIDBytes v18 = CFUUIDGetUUIDBytes(v17);
    ((void (*)(IOCFPlugInInterface **, void, void, char *))QueryInterface)(v15, *(void *)&v18.byte0, *(void *)&v18.byte8, (char *)this + 112);
    ((void (*)(IOCFPlugInInterface **))(**v2)->Release)(*v2);
    uint64_t v19 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = (void *)*v14;
      *(_DWORD *)std::mutex buf = 134349056;
      *(void *)unint64_t v64 = v20;
      _os_log_impl(&dword_237AFF000, v19, OS_LOG_TYPE_DEFAULT, "#spi,opened,ifc,%{public}p", buf, 0xCu);
    }
    mach_error_t v21 = (*(uint64_t (**)(void, void))(**((void **)this + 14) + 64))(*((void *)this + 14), *((void *)this + 13));
    if (v21)
    {
      unsigned int v29 = GpsdLogObjectGeneral;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
      {
        __int16 v30 = mach_error_string(v21);
        *(_DWORD *)std::mutex buf = 67240450;
        *(_DWORD *)unint64_t v64 = v21;
        *(_WORD *)&v64[4] = 2082;
        *(void *)&v64[6] = v30;
        _os_log_error_impl(&dword_237AFF000, v29, OS_LOG_TYPE_ERROR, "#spi,fail,gpti,SetDispatchQueue,errCode,0x%{public}X,%{public}s", buf, 0x12u);
        unsigned int v29 = GpsdLogObjectGeneral;
      }
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)std::mutex buf = 136446722;
        *(void *)unint64_t v64 = "/Library/Caches/com.apple.xbs/Sources/CoreGPS/Sources/HAL/Implementation/GnssHalCommSpi.mm";
        *(_WORD *)&v64[8] = 1026;
        *(_DWORD *)&v64[10] = 144;
        __int16 v65 = 2082;
        uint64_t v66 = "createIoPlugin";
        _os_log_error_impl(&dword_237AFF000, v29, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: assertion failure in %{public}s", buf, 0x1Cu);
      }
      std::string::basic_string[abi:ne180100]<0>(&v48, "assert");
      std::string::basic_string[abi:ne180100]<0>(&v47, "createIoPlugin");
      std::string::basic_string[abi:ne180100]<0>(&v46, "#spi,fail,gpti,SetDispatchQueue,errCode,0x%{public}X,%{public}s");
      gpsd::util::triggerDiagnosticReport((uint64_t)&v48, (uint64_t)&v47, (uint64_t)&v46);
      std::string::~string(&v46);
      std::string::~string(&v47);
      std::string::~string(&v48);
      __assert_rtn("createIoPlugin", "GnssHalCommSpi.mm", 144, "false && \"#spi,fail,\" \"gpti,\" \"SetDispatchQueue\" \",errCode,0x%{public}X,%{public}s\"");
    }
    mach_error_t v22 = (*(uint64_t (**)(void, void, GnssHal::CommSpi *))(**((void **)this + 14) + 72))(*((void *)this + 14), GnssHal::CommSpi::readCallback, this);
    if (v22)
    {
      int v33 = GpsdLogObjectGeneral;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
      {
        __int16 v34 = mach_error_string(v22);
        *(_DWORD *)std::mutex buf = 67240450;
        *(_DWORD *)unint64_t v64 = v22;
        *(_WORD *)&v64[4] = 2082;
        *(void *)&v64[6] = v34;
        _os_log_error_impl(&dword_237AFF000, v33, OS_LOG_TYPE_ERROR, "#spi,fail,gpti,RegisterDataHandler,errCode,0x%{public}X,%{public}s", buf, 0x12u);
        int v33 = GpsdLogObjectGeneral;
      }
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)std::mutex buf = 136446722;
        *(void *)unint64_t v64 = "/Library/Caches/com.apple.xbs/Sources/CoreGPS/Sources/HAL/Implementation/GnssHalCommSpi.mm";
        *(_WORD *)&v64[8] = 1026;
        *(_DWORD *)&v64[10] = 145;
        __int16 v65 = 2082;
        uint64_t v66 = "createIoPlugin";
        _os_log_error_impl(&dword_237AFF000, v33, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: assertion failure in %{public}s", buf, 0x1Cu);
      }
      std::string::basic_string[abi:ne180100]<0>(&v45, "assert");
      std::string::basic_string[abi:ne180100]<0>(&v44, "createIoPlugin");
      std::string::basic_string[abi:ne180100]<0>(&v43, "#spi,fail,gpti,RegisterDataHandler,errCode,0x%{public}X,%{public}s");
      gpsd::util::triggerDiagnosticReport((uint64_t)&v45, (uint64_t)&v44, (uint64_t)&v43);
      std::string::~string(&v43);
      std::string::~string(&v44);
      std::string::~string(&v45);
      __assert_rtn("createIoPlugin", "GnssHalCommSpi.mm", 145, "false && \"#spi,fail,\" \"gpti,\" \"RegisterDataHandler\" \",errCode,0x%{public}X,%{public}s\"");
    }
    mach_error_t v23 = (*(uint64_t (**)(void, void (*)(GnssHal::CommSpi *, void *, gpsd::util *, const unsigned __int8 *), GnssHal::CommSpi *))(**((void **)this + 14) + 88))(*((void *)this + 14), GnssHal::CommSpi::eventCallback, this);
    if (v23)
    {
      int v35 = GpsdLogObjectGeneral;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
      {
        __int16 v36 = mach_error_string(v23);
        *(_DWORD *)std::mutex buf = 67240450;
        *(_DWORD *)unint64_t v64 = v23;
        *(_WORD *)&v64[4] = 2082;
        *(void *)&v64[6] = v36;
        _os_log_error_impl(&dword_237AFF000, v35, OS_LOG_TYPE_ERROR, "#spi,fail,gpti,RegisterEventHandler,errCode,0x%{public}X,%{public}s", buf, 0x12u);
        int v35 = GpsdLogObjectGeneral;
      }
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)std::mutex buf = 136446722;
        *(void *)unint64_t v64 = "/Library/Caches/com.apple.xbs/Sources/CoreGPS/Sources/HAL/Implementation/GnssHalCommSpi.mm";
        *(_WORD *)&v64[8] = 1026;
        *(_DWORD *)&v64[10] = 146;
        __int16 v65 = 2082;
        uint64_t v66 = "createIoPlugin";
        _os_log_error_impl(&dword_237AFF000, v35, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: assertion failure in %{public}s", buf, 0x1Cu);
      }
      std::string::basic_string[abi:ne180100]<0>(&v42, "assert");
      std::string::basic_string[abi:ne180100]<0>(&v41, "createIoPlugin");
      std::string::basic_string[abi:ne180100]<0>(&v40, "#spi,fail,gpti,RegisterEventHandler,errCode,0x%{public}X,%{public}s");
      gpsd::util::triggerDiagnosticReport((uint64_t)&v42, (uint64_t)&v41, (uint64_t)&v40);
      std::string::~string(&v40);
      std::string::~string(&v41);
      std::string::~string(&v42);
      __assert_rtn("createIoPlugin", "GnssHalCommSpi.mm", 146, "false && \"#spi,fail,\" \"gpti,\" \"RegisterEventHandler\" \",errCode,0x%{public}X,%{public}s\"");
    }
    uint64_t v13 = (void *)*v14;
    if (!*v14) {
      goto LABEL_17;
    }
  }
  if (!*v13)
  {
LABEL_17:
    long long v24 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)std::mutex buf = 0;
      _os_log_error_impl(&dword_237AFF000, v24, OS_LOG_TYPE_ERROR, "#spi,open,failed,fGNSSPassthroughInterface,nullptr", buf, 2u);
      long long v24 = GpsdLogObjectGeneral;
    }
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)std::mutex buf = 136446722;
      *(void *)unint64_t v64 = "/Library/Caches/com.apple.xbs/Sources/CoreGPS/Sources/HAL/Implementation/GnssHalCommSpi.mm";
      *(_WORD *)&v64[8] = 1026;
      *(_DWORD *)&v64[10] = 149;
      __int16 v65 = 2082;
      uint64_t v66 = "createIoPlugin";
      _os_log_error_impl(&dword_237AFF000, v24, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: assertion failure in %{public}s", buf, 0x1Cu);
    }
    std::string::basic_string[abi:ne180100]<0>(&v39, "assert");
    std::string::basic_string[abi:ne180100]<0>(&v38, "createIoPlugin");
    std::string::basic_string[abi:ne180100]<0>(&v37, "#spi,open,failed,fGNSSPassthroughInterface,nullptr");
    gpsd::util::triggerDiagnosticReport((uint64_t)&v39, (uint64_t)&v38, (uint64_t)&v37);
    std::string::~string(&v37);
    std::string::~string(&v38);
    std::string::~string(&v39);
    __assert_rtn("createIoPlugin", "GnssHalCommSpi.mm", 149, "false && \"#spi,open,failed,fGNSSPassthroughInterface,nullptr\"");
  }
}

void sub_237B289A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p,uint64_t a21,int a22,__int16 a23,char a24,char a25,void *a26,uint64_t a27,int a28,__int16 a29,char a30,char a31,void *a32,uint64_t a33,int a34,__int16 a35,char a36,char a37)
{
  if (a25 < 0) {
    operator delete(__p);
  }
  if (a31 < 0) {
    operator delete(a26);
  }
  if (a37 < 0) {
    operator delete(a32);
  }
  _Unwind_Resume(a1);
}

void GnssHal::CommSpi::close(GnssHal::CommSpi *this)
{
  if ((*(uint64_t (**)(GnssHal::CommSpi *))(*(void *)this + 32))(this))
  {
    GnssHal::CommSpi::setGnssChipPowerStateOn(this, 0);
    *((unsigned char *)this + 42) = 0;
  }
  else
  {
    uint64_t v2 = GpsdLogObjectWarning;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectWarning, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)mach_port_t v3 = 0;
      _os_log_impl(&dword_237AFF000, v2, OS_LOG_TYPE_DEFAULT, "#spi,close,notOpen", v3, 2u);
    }
  }
}

void GnssHal::CommSpi::readCallback(GnssHal::CommSpi::AsyncBuffering **this, unsigned __int8 *a2, int64_t a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (a2 && a3)
  {
    if (!this)
    {
      CFUUIDRef v9 = GpsdLogObjectGeneral;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)block = 0;
        _os_log_error_impl(&dword_237AFF000, v9, OS_LOG_TYPE_ERROR, "#spi,readCallback,commSpiObj,null", block, 2u);
        CFUUIDRef v9 = GpsdLogObjectGeneral;
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)block = 136446722;
        *(void *)&void block[4] = "/Library/Caches/com.apple.xbs/Sources/CoreGPS/Sources/HAL/Implementation/GnssHalCommSpi.mm";
        *(_WORD *)&block[12] = 1026;
        *(_DWORD *)&block[14] = 165;
        *(_WORD *)&block[18] = 2082;
        *(void *)&block[20] = "readCallback";
        _os_log_error_impl(&dword_237AFF000, v9, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: assertion failure in %{public}s", block, 0x1Cu);
      }
      std::string::basic_string[abi:ne180100]<0>(&v12, "assert");
      std::string::basic_string[abi:ne180100]<0>(&v11, "readCallback");
      std::string::basic_string[abi:ne180100]<0>(&v10, "#spi,readCallback,commSpiObj,null");
      gpsd::util::triggerDiagnosticReport((uint64_t)&v12, (uint64_t)&v11, (uint64_t)&v10);
      std::string::~string(&v10);
      std::string::~string(&v11);
      std::string::~string(&v12);
      __assert_rtn("readCallback", "GnssHalCommSpi.mm", 165, "false && \"#spi,readCallback,commSpiObj,null\"");
    }
    GnssHal::CommSpi::AsyncBuffering::input(this[16], a2, a3);
    std::string v6 = (NSObject **)this[16];
    io_service_t v7 = *v6;
    *(void *)block = MEMORY[0x263EF8330];
    *(void *)&block[8] = 3221225472;
    *(void *)&block[16] = ___ZN7GnssHal7CommSpi14AsyncBuffering5flushEv_block_invoke;
    *(void *)&block[24] = &__block_descriptor_40_e5_v8__0l;
    __int16 v14 = v6;
    dispatch_async(v7, block);
  }
  else
  {
    CFUUIDRef v8 = GpsdLogObjectWarning;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectWarning, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)block = 134349312;
      *(void *)&void block[4] = a2;
      *(_WORD *)&block[12] = 2050;
      *(void *)&block[14] = a3;
      _os_log_impl(&dword_237AFF000, v8, OS_LOG_TYPE_DEFAULT, "#spi,read,invalid,data,%{public}p,size,%{public}zu", block, 0x16u);
    }
  }
}

void sub_237B28EF0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (a27 < 0) {
    operator delete(a22);
  }
  _Unwind_Resume(exception_object);
}

void GnssHal::CommSpi::eventCallback(GnssHal::CommSpi *this, void *a2, gpsd::util *a3, const unsigned __int8 *a4)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  CFDictionaryRef v4 = GpsdLogObjectGeneral;
  if (!this)
  {
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)std::mutex buf = 0;
      _os_log_error_impl(&dword_237AFF000, v4, OS_LOG_TYPE_ERROR, "#spi,eventCallback,commSpiObj,null", buf, 2u);
      CFDictionaryRef v4 = GpsdLogObjectGeneral;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)std::mutex buf = 136446722;
      *(void *)uint64_t v15 = "/Library/Caches/com.apple.xbs/Sources/CoreGPS/Sources/HAL/Implementation/GnssHalCommSpi.mm";
      *(_WORD *)&v15[8] = 1026;
      *(_DWORD *)&v15[10] = 194;
      __int16 v16 = 2082;
      CFUUIDRef v17 = "eventCallback";
      _os_log_error_impl(&dword_237AFF000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: assertion failure in %{public}s", buf, 0x1Cu);
    }
    std::string::basic_string[abi:ne180100]<0>(&v13, "assert");
    std::string::basic_string[abi:ne180100]<0>(&v12, "eventCallback");
    std::string::basic_string[abi:ne180100]<0>(&v11, "#spi,eventCallback,commSpiObj,null");
    gpsd::util::triggerDiagnosticReport((uint64_t)&v13, (uint64_t)&v12, (uint64_t)&v11);
    std::string::~string(&v11);
    std::string::~string(&v12);
    std::string::~string(&v13);
    __assert_rtn("eventCallback", "GnssHalCommSpi.mm", 194, "false && \"#spi,eventCallback,commSpiObj,null\"");
  }
  int v7 = (int)a2;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_FAULT))
  {
    gpsd::util::charToHex(a3, a4, 0, &__p);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      p_p = &__p;
    }
    else {
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    *(_DWORD *)std::mutex buf = 67241218;
    *(_DWORD *)uint64_t v15 = v7;
    *(_WORD *)&void v15[4] = 2082;
    *(void *)&v15[6] = p_p;
    __int16 v16 = 2050;
    CFUUIDRef v17 = (const char *)this;
    __int16 v18 = 2050;
    uint64_t v19 = a3;
    __int16 v20 = 2050;
    mach_error_t v21 = a4;
    _os_log_fault_impl(&dword_237AFF000, v4, OS_LOG_TYPE_FAULT, "#spi,eventCallback,type,%{public}d,data,hex,%{public}s,context,%{public}p,eventp,%{public}p,size,%{public}zu", buf, 0x30u);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
}

void sub_237B29194(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,void *a24,uint64_t a25,int a26,__int16 a27,char a28,char a29)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  if (a23 < 0) {
    operator delete(a18);
  }
  if (a29 < 0) {
    operator delete(a24);
  }
  _Unwind_Resume(exception_object);
}

void GnssHal::CommSpi::destroyIoPlugin(IOCFPlugInInterface ***this)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  IODestroyPlugInInterface(this[6]);
  uint64_t v2 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    mach_port_t v3 = this[6];
    CFDictionaryRef v4 = this[14];
    int v5 = 134349312;
    std::string v6 = v3;
    __int16 v7 = 2050;
    CFUUIDRef v8 = v4;
    _os_log_impl(&dword_237AFF000, v2, OS_LOG_TYPE_DEFAULT, "#spi,closed,plugin,%{public}p,ifc,%{public}p", (uint8_t *)&v5, 0x16u);
  }
  this[6] = 0;
  this[14] = 0;
}

void GnssHal::CommSpi::AsyncBuffering::input(GnssHal::CommSpi::AsyncBuffering *this, const unsigned __int8 *a2, int64_t a3)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  if (a3)
  {
    __int16 v34 = (std::mutex *)((char *)this + 40);
    std::mutex::lock((std::mutex *)((char *)this + 40));
    std::string v6 = (char *)*((void *)this + 13);
    __int16 v7 = (char *)*((void *)this + 14);
    CFUUIDRef v8 = (void *)(*((void *)this + 15) - (void)v6);
    int64_t v9 = v7 - v6;
    if ((unint64_t)v8 < v7 - v6 + a3)
    {
      std::string v10 = GpsdLogObjectWarning;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectWarning, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)std::mutex buf = 134349568;
        *(void *)&uint8_t buf[4] = v6;
        *(_WORD *)&unsigned char buf[12] = 2050;
        *(void *)&buf[14] = v7 - v6 + a3;
        *(_WORD *)&buf[22] = 2050;
        __int16 v36 = v8;
        _os_log_impl(&dword_237AFF000, v10, OS_LOG_TYPE_DEFAULT, "#spi,ab,overflow,@%{public}p,sz,%{public}zu,cap,%{public}zu", buf, 0x20u);
        std::string v6 = (char *)*((void *)this + 13);
        __int16 v7 = (char *)*((void *)this + 14);
        int64_t v9 = v7 - v6;
      }
    }
    if (a3 < 1) {
      goto LABEL_44;
    }
    std::string v11 = &v6[v9];
    uint64_t v12 = *((void *)this + 15);
    if (v12 - (uint64_t)v7 < a3)
    {
      uint64_t v13 = v7 - v6 + a3;
      if (v13 < 0) {
        std::vector<gnssTest::RfMeasurement>::__throw_length_error[abi:ne180100]();
      }
      unint64_t v14 = v12 - (void)v6;
      if (2 * v14 > v13) {
        uint64_t v13 = 2 * v14;
      }
      if (v14 >= 0x3FFFFFFFFFFFFFFFLL) {
        size_t v15 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        size_t v15 = v13;
      }
      if (v15) {
        __int16 v16 = (char *)operator new(v15);
      }
      else {
        __int16 v16 = 0;
      }
      __int16 v28 = &v16[v9];
      memcpy(&v16[v9], a2, a3);
      if (v7 == v6)
      {
        unsigned int v29 = &v16[v9];
      }
      else
      {
        do
        {
          v16[v9 - 1] = v6[v9 - 1];
          --v9;
        }
        while (v9);
        __int16 v7 = (char *)*((void *)this + 14);
        unsigned int v29 = v16;
      }
      __int16 v30 = &v28[a3];
      int v31 = &v16[v15];
      if (v7 != v11) {
        memmove(v30, v11, v7 - v11);
      }
      __int16 v32 = (void *)*((void *)this + 13);
      *((void *)this + 13) = v29;
      *((void *)this + 14) = &v30[v7 - v11];
      *((void *)this + 15) = v31;
      if (v32) {
        operator delete(v32);
      }
      goto LABEL_44;
    }
    __int16 v18 = &a2[a3];
    uint64_t v19 = v7 - v11;
    if (v7 - v11 >= a3)
    {
      __int16 v20 = v7;
    }
    else
    {
      memmove(v7, &a2[v19], a3 - v19);
      __int16 v20 = &v11[a3];
      *((void *)this + 14) = &v11[a3];
      if (v19 < 1)
      {
LABEL_44:
        if (((*((void *)this + 14) - *((void *)this + 13)) & 0x7FFFFFFFFFFFF800) != 0)
        {
          int v33 = *(NSObject **)this;
          *(void *)std::mutex buf = MEMORY[0x263EF8330];
          *(void *)&buf[8] = 3221225472;
          *(void *)&uint8_t buf[16] = ___ZN7GnssHal7CommSpi14AsyncBuffering5flushEv_block_invoke;
          __int16 v36 = &__block_descriptor_40_e5_v8__0l;
          std::string v37 = this;
          dispatch_async(v33, buf);
        }
        std::mutex::unlock(v34);
        return;
      }
      __int16 v18 = &a2[v19];
    }
    mach_error_t v21 = &v11[a3];
    uint64_t v22 = v20;
    if (&v20[-a3] < v7)
    {
      if (a3 <= v19) {
        int64_t v23 = v7 - v11;
      }
      else {
        int64_t v23 = a3;
      }
      long long v24 = &v7[a3 - v9];
      int v25 = &v6[v9 - a3];
      int v26 = &v6[v9];
      do
      {
        v26[v23] = v25[v23];
        --v24;
        ++v25;
        ++v26;
      }
      while (&v6[v23] != v24);
      if (a3 <= v19) {
        int64_t v27 = v7 - v11;
      }
      else {
        int64_t v27 = a3;
      }
      uint64_t v22 = &v26[v27];
    }
    *((void *)this + 14) = v22;
    if (v20 != v21) {
      memmove(&v11[a3], &v6[v9], v20 - v21);
    }
    if (v18 != a2) {
      memmove(&v6[v9], a2, v18 - a2);
    }
    goto LABEL_44;
  }
  CFUUIDRef v17 = GpsdLogObjectWarning;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectWarning, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)std::mutex buf = 0;
    _os_log_impl(&dword_237AFF000, v17, OS_LOG_TYPE_DEFAULT, "#spi,ab,input,zerosize", buf, 2u);
  }
}

void sub_237B2963C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::mutex *a10)
{
}

void GnssHal::CommSpi::AsyncBuffering::flush(NSObject **this)
{
  mach_error_t v1 = *this;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = ___ZN7GnssHal7CommSpi14AsyncBuffering5flushEv_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = this;
  dispatch_async(v1, block);
}

void GnssHal::CommSpi::readCallbackInternal(GnssHal::CommSpi *this, gpsd::util *a2, unsigned __int8 *a3, const char *a4)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (*((unsigned char *)this + 41)) {
    gpsd::util::logBinaryBytes(a2, a3, (uint64_t)"#spi,read,bin", a4);
  }
  if (!*((void *)this + 10))
  {
    CFUUIDRef v8 = GpsdLogObjectGeneral;
    if (!os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_FAULT)) {
      return;
    }
    LOWORD(v13) = 0;
    int64_t v9 = "#spi,readCallback,null";
LABEL_11:
    _os_log_fault_impl(&dword_237AFF000, v8, OS_LOG_TYPE_FAULT, v9, (uint8_t *)&v13, 2u);
    return;
  }
  if (!*((unsigned char *)this + 42))
  {
    gpsd::util::logBinaryBytes(a2, a3, (uint64_t)"#spi,read,bin", a4);
    CFUUIDRef v8 = GpsdLogObjectGeneral;
    if (!os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_FAULT)) {
      return;
    }
    LOWORD(v13) = 0;
    int64_t v9 = "#spi,readcallback,portClosed";
    goto LABEL_11;
  }
  if (*((unsigned char *)this + 40)) {
    double v7 = (double)gpsd::util::getMachContinuousTimeNs(this) * 0.000000001;
  }
  else {
    double v7 = 0.0;
  }
  std::string v10 = (gpsd::util *)std::function<void ()(unsigned char *,unsigned long)>::operator()((uint64_t)this + 56, (uint64_t)a2, (uint64_t)a3);
  if (*((unsigned char *)this + 40))
  {
    unint64_t MachContinuousTimeNs = gpsd::util::getMachContinuousTimeNs(v10);
    uint64_t v12 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 134349312;
      unint64_t v14 = a3;
      __int16 v15 = 2050;
      double v16 = ((double)MachContinuousTimeNs * 0.000000001 - v7) * 1000000.0;
      _os_log_debug_impl(&dword_237AFF000, v12, OS_LOG_TYPE_DEBUG, "#spi,hal,read,size,%{public}zu,duration,us,%{public}.1f", (uint8_t *)&v13, 0x16u);
    }
  }
}

uint64_t GnssHal::CommSpi::writeInternal(GnssHal::CommSpi *this, gpsd::util *a2, unsigned __int8 *a3, const char *a4)
{
  CFDictionaryRef v4 = a3;
  uint64_t v32 = *MEMORY[0x263EF8340];
  if (*((unsigned char *)this + 41)) {
    gpsd::util::logBinaryBytes(a2, a3, (uint64_t)"#spi,write,bin", a4);
  }
  double v7 = (gpsd::util *)(*(uint64_t (**)(GnssHal::CommSpi *))(*(void *)this + 32))(this);
  if ((v7 & 1) == 0)
  {
    gpsd::util::logBinaryBytes(a2, v4, (uint64_t)"#spi,write,bin", v8);
    std::string v10 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)std::mutex buf = 0;
      _os_log_error_impl(&dword_237AFF000, v10, OS_LOG_TYPE_ERROR, "#spi,write,notOpen", buf, 2u);
    }
    return -1;
  }
  if (a2 && v4)
  {
    if (*((unsigned char *)this + 40)) {
      double v9 = (double)gpsd::util::getMachContinuousTimeNs(v7) * 0.000000001;
    }
    else {
      double v9 = 0.0;
    }
    uint64_t v12 = (gpsd::util *)(*(uint64_t (**)(void, gpsd::util *, const unsigned __int8 *))(**((void **)this + 14)
                                                                                                 + 80))(*((void *)this + 14), a2, v4);
    if (v12)
    {
      mach_error_t v13 = (int)v12;
      unint64_t MachContinuousTimeNs = gpsd::util::getMachContinuousTimeNs(v12);
      int v15 = *((_DWORD *)this + 11) + 1;
      *((_DWORD *)this + 11) = v15;
      double v16 = GpsdLogObjectGeneral;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_FAULT))
      {
        __int16 v20 = mach_error_string(v13);
        int v21 = *((_DWORD *)this + 11);
        *(_DWORD *)std::mutex buf = 67241474;
        *(_DWORD *)int64_t v27 = v13;
        *(_WORD *)&v27[4] = 2082;
        *(void *)&v27[6] = v20;
        *(_WORD *)&v27[14] = 1026;
        *(_DWORD *)&v27[16] = v21;
        *(_WORD *)&v27[20] = 1026;
        *(_DWORD *)&v27[22] = 5;
        __int16 v28 = 2050;
        unsigned int v29 = v4;
        __int16 v30 = 2050;
        double v31 = ((double)MachContinuousTimeNs * 0.000000001 - v9) * 1000000.0;
        _os_log_fault_impl(&dword_237AFF000, v16, OS_LOG_TYPE_FAULT, "#spi,write,failed,%{public}X,%{public}s,count,%{public}d/%{public}d,size,%{public}zu,duration,us,%{public}.1f", buf, 0x32u);
        int v15 = *((_DWORD *)this + 11);
      }
      if (v15 >= 5)
      {
        uint64_t v22 = GpsdLogObjectGeneral;
        if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)std::mutex buf = 0;
          _os_log_error_impl(&dword_237AFF000, v22, OS_LOG_TYPE_ERROR, "#spi,continuousWriteError", buf, 2u);
          uint64_t v22 = GpsdLogObjectGeneral;
        }
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)std::mutex buf = 136446722;
          *(void *)int64_t v27 = "/Library/Caches/com.apple.xbs/Sources/CoreGPS/Sources/HAL/Implementation/GnssHalCommSpi.mm";
          *(_WORD *)&v27[8] = 1026;
          *(_DWORD *)&unsigned char v27[10] = 223;
          *(_WORD *)&v27[14] = 2082;
          *(void *)&v27[16] = "writeInternal";
          _os_log_error_impl(&dword_237AFF000, v22, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: assertion failure in %{public}s", buf, 0x1Cu);
        }
        std::string::basic_string[abi:ne180100]<0>(&v25, "assert");
        std::string::basic_string[abi:ne180100]<0>(&v24, "writeInternal");
        std::string::basic_string[abi:ne180100]<0>(&v23, "#spi,continuousWriteError");
        gpsd::util::triggerDiagnosticReport((uint64_t)&v25, (uint64_t)&v24, (uint64_t)&v23);
        std::string::~string(&v23);
        std::string::~string(&v24);
        std::string::~string(&v25);
        __assert_rtn("writeInternal", "GnssHalCommSpi.mm", 223, "false && \"#spi,continuousWriteError\"");
      }
      return -1;
    }
    *((_DWORD *)this + 11) = 0;
    if (*((unsigned char *)this + 40))
    {
      double v18 = ((double)gpsd::util::getMachContinuousTimeNs(v12) * 0.000000001 - v9) * 1000000.0;
      uint64_t v19 = GpsdLogObjectGeneral;
      if (v18 > (double)(unint64_t)(8 * (void)v4) / 5.0 + 100000.0
        && os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)std::mutex buf = 134349312;
        *(void *)int64_t v27 = v4;
        *(_WORD *)&v27[8] = 2050;
        *(double *)&unsigned char v27[10] = v18;
        _os_log_fault_impl(&dword_237AFF000, v19, OS_LOG_TYPE_FAULT, "#spi,write,longDelay,size,%{public}zu,duration,us,%{public}.1f", buf, 0x16u);
        uint64_t v19 = GpsdLogObjectGeneral;
      }
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)std::mutex buf = 134349312;
        *(void *)int64_t v27 = v4;
        *(_WORD *)&v27[8] = 2050;
        *(double *)&unsigned char v27[10] = v18;
        _os_log_debug_impl(&dword_237AFF000, v19, OS_LOG_TYPE_DEBUG, "#spi,write,size,%{public}zu,duration,us,%{public}.1f", buf, 0x16u);
      }
    }
  }
  else
  {
    std::string v11 = GpsdLogObjectWarning;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectWarning, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)std::mutex buf = 134349312;
      *(void *)int64_t v27 = a2;
      *(_WORD *)&v27[8] = 2050;
      *(void *)&unsigned char v27[10] = v4;
      _os_log_impl(&dword_237AFF000, v11, OS_LOG_TYPE_DEFAULT, "$spi,write,invalid,buffer,%{public}p,size,%{public}zu", buf, 0x16u);
    }
    return 0;
  }
  return (uint64_t)v4;
}

void sub_237B29D9C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (a27 < 0) {
    operator delete(a22);
  }
  _Unwind_Resume(exception_object);
}

unsigned __int8 *GnssHal::CommSpi::write(GnssHal::CommSpi *this, gpsd::util *a2, unsigned __int8 *a3, const char *a4)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (*((unsigned char *)this + 41)) {
    gpsd::util::logBinaryBytes(a2, a3, (uint64_t)"#spi,hal,write,bin", a4);
  }
  if (*((unsigned char *)this + 40)) {
    double v7 = (double)gpsd::util::getMachContinuousTimeNs(this) * 0.000000001;
  }
  else {
    double v7 = 0.0;
  }
  GnssHal::CommSpi::AsyncBuffering::input(*((GnssHal::CommSpi::AsyncBuffering **)this + 15), (const unsigned __int8 *)a2, (int64_t)a3);
  if (*((unsigned char *)this + 40))
  {
    unint64_t MachContinuousTimeNs = gpsd::util::getMachContinuousTimeNs(v8);
    std::string v10 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG))
    {
      int v12 = 134218240;
      mach_error_t v13 = a3;
      __int16 v14 = 2048;
      double v15 = ((double)MachContinuousTimeNs * 0.000000001 - v7) * 1000000.0;
      _os_log_debug_impl(&dword_237AFF000, v10, OS_LOG_TYPE_DEBUG, "#spi,hal,write,size,%zu,duration,us,%.1f", (uint8_t *)&v12, 0x16u);
    }
  }
  return a3;
}

BOOL GnssHal::CommSpi::writeComplete(GnssHal::CommSpi *this, const unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v4 = (*(uint64_t (**)(GnssHal::CommSpi *, const unsigned __int8 *))(*(void *)this + 88))(this, a2);
  return v4 >= 0 && v4 == a3;
}

uint64_t GnssHal::CommSpi::readFlush(GnssHal::CommSpi *this)
{
  mach_error_t v1 = (NSObject **)*((void *)this + 16);
  uint64_t v2 = *v1;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = ___ZN7GnssHal7CommSpi14AsyncBuffering5flushEv_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = v1;
  dispatch_async(v2, block);
  return 1;
}

uint64_t GnssHal::CommSpi::readWriteFlush(GnssHal::CommSpi *this)
{
  uint64_t v2 = (NSObject **)*((void *)this + 16);
  mach_port_t v3 = *v2;
  uint64_t block = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  double v9 = ___ZN7GnssHal7CommSpi14AsyncBuffering5flushEv_block_invoke;
  std::string v10 = &__block_descriptor_40_e5_v8__0l;
  std::string v11 = v2;
  dispatch_async(v3, &block);
  uint64_t v4 = (NSObject **)*((void *)this + 15);
  int v5 = *v4;
  uint64_t block = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  double v9 = ___ZN7GnssHal7CommSpi14AsyncBuffering5flushEv_block_invoke;
  std::string v10 = &__block_descriptor_40_e5_v8__0l;
  std::string v11 = v4;
  dispatch_async(v5, &block);
  return 1;
}

void GnssHal::CommSpi::pulseTimeMarkStrobe(GnssHal::CommSpi *this@<X0>, uint64_t a2@<X8>)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v19 = 0;
  __int16 v20 = 0;
  mach_error_t v5 = (*(uint64_t (**)(void, gpsd::util **, gpsd::util **))(**((void **)this + 14) + 112))(*((void *)this + 14), &v19, &v20);
  if (v5)
  {
    mach_error_t v13 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      __int16 v14 = mach_error_string(v5);
      *(_DWORD *)std::mutex buf = 67240450;
      *(_DWORD *)uint64_t v22 = v5;
      *(_WORD *)&v22[4] = 2082;
      *(void *)&v22[6] = v14;
      _os_log_error_impl(&dword_237AFF000, v13, OS_LOG_TYPE_ERROR, "#spi,fail,gpti,pulseTimeMarkStrobe,errCode,0x%{public}X,%{public}s", buf, 0x12u);
      mach_error_t v13 = GpsdLogObjectGeneral;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)std::mutex buf = 136446722;
      *(void *)uint64_t v22 = "/Library/Caches/com.apple.xbs/Sources/CoreGPS/Sources/HAL/Implementation/GnssHalCommSpi.mm";
      *(_WORD *)&v22[8] = 1026;
      *(_DWORD *)&v22[10] = 272;
      *(_WORD *)&v22[14] = 2082;
      *(void *)&uint8_t v22[16] = "pulseTimeMarkStrobe";
      _os_log_error_impl(&dword_237AFF000, v13, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: assertion failure in %{public}s", buf, 0x1Cu);
    }
    std::string::basic_string[abi:ne180100]<0>(&v18, "assert");
    std::string::basic_string[abi:ne180100]<0>(&v17, "pulseTimeMarkStrobe");
    std::string::basic_string[abi:ne180100]<0>(&v16, "#spi,fail,gpti,pulseTimeMarkStrobe,errCode,0x%{public}X,%{public}s");
    gpsd::util::triggerDiagnosticReport((uint64_t)&v18, (uint64_t)&v17, (uint64_t)&v16);
    std::string::~string(&v16);
    std::string::~string(&v17);
    std::string::~string(&v18);
    __assert_rtn("pulseTimeMarkStrobe", "GnssHalCommSpi.mm", 272, "false && \"#spi,fail,\" \"gpti,\" \"pulseTimeMarkStrobe\" \",errCode,0x%{public}X,%{public}s\"");
  }
  double v15 = 0;
  if (gpsd::util::getCurrentMachContinuousMinusMachAbsoluteTicks((gpsd::util *)&v15, v4))
  {
    if (*((void *)this + 4)) {
      std::function<void ()(GnssHal::TimeTransferPulseMark)>::operator()((uint64_t)this + 8, v19 - v15, v20 - v15);
    }
    unint64_t v6 = gpsd::util::convertMachTimeInTicksToNs((unint64_t)v19);
    *(void *)a2 = v6;
    unint64_t v7 = gpsd::util::convertMachTimeInTicksToNs((unint64_t)v20);
    *(void *)(a2 + 8) = v7;
    *(unsigned char *)(a2 + 16) = 1;
    uint64_t v8 = GpsdLogObjectGeneral;
    BOOL v9 = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG);
    if (v9)
    {
      unint64_t MachContinuousTimeNs = gpsd::util::getMachContinuousTimeNs((gpsd::util *)v9);
      unint64_t v11 = gpsd::util::convertMachTimeInTicksToNs((unint64_t)v15);
      *(_DWORD *)std::mutex buf = 134349824;
      *(void *)uint64_t v22 = v6;
      *(_WORD *)&v22[8] = 2050;
      *(void *)&v22[10] = v7;
      *(_WORD *)&v22[18] = 2050;
      *(void *)&v22[20] = MachContinuousTimeNs;
      __int16 v23 = 2050;
      unint64_t v24 = v11;
      _os_log_debug_impl(&dword_237AFF000, v8, OS_LOG_TYPE_DEBUG, "#spi,#tt,pulseTimeMarkStrobe,low,ns,%{public}llu,upper,ns,%{public}llu,current,ns,%{public}llu,machContMinusMachAbs,ns,%{public}llu", buf, 0x2Au);
    }
  }
  else
  {
    int v12 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)std::mutex buf = 0;
      _os_log_error_impl(&dword_237AFF000, v12, OS_LOG_TYPE_ERROR, "#spi,#tt,pulseTimeMarkStrobe,offset,failed", buf, 2u);
    }
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
    *(void *)(a2 + 16) = 0;
  }
}

void sub_237B2A3E4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (a27 < 0) {
    operator delete(a22);
  }
  _Unwind_Resume(exception_object);
}

uint64_t GnssHal::CommSpi::AsyncBuffering::AsyncBuffering(uint64_t a1, uint64_t a2, uint64_t a3, size_t a4)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  *(void *)a1 = a2;
  std::__function::__value_func<void ()(unsigned char *,unsigned long)>::__value_func[abi:ne180100](a1 + 8, a3);
  *(void *)(a1 + 40) = 850045863;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(void *)(a1 + 144) = 0;
  if (!*(void *)a1)
  {
    uint64_t v8 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)std::mutex buf = 0;
      _os_log_error_impl(&dword_237AFF000, v8, OS_LOG_TYPE_ERROR, "#spi,ab,queue,null", buf, 2u);
      uint64_t v8 = GpsdLogObjectGeneral;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)std::mutex buf = 136446722;
      int v26 = "/Library/Caches/com.apple.xbs/Sources/CoreGPS/Sources/HAL/Implementation/GnssHalCommSpi.mm";
      __int16 v27 = 1026;
      int v28 = 305;
      __int16 v29 = 2082;
      __int16 v30 = "AsyncBuffering";
      _os_log_error_impl(&dword_237AFF000, v8, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: assertion failure in %{public}s", buf, 0x1Cu);
    }
    std::string::basic_string[abi:ne180100]<0>(v23, "assert");
    std::string::basic_string[abi:ne180100]<0>(v21, "AsyncBuffering");
    std::string::basic_string[abi:ne180100]<0>(__p, "#spi,ab,queue,null");
    gpsd::util::triggerDiagnosticReport((uint64_t)v23, (uint64_t)v21, (uint64_t)__p);
    if (v20 < 0) {
      operator delete(__p[0]);
    }
    if (v22 < 0) {
      operator delete(v21[0]);
    }
    BOOL v9 = "false && \"#spi,ab,queue,null\"";
    int v10 = 305;
    if (v24 < 0)
    {
      unint64_t v11 = (void **)v23;
LABEL_24:
      operator delete(*v11);
    }
LABEL_25:
    __assert_rtn("AsyncBuffering", "GnssHalCommSpi.mm", v10, v9);
  }
  if (!*(void *)(a3 + 24))
  {
    int v12 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)std::mutex buf = 0;
      _os_log_error_impl(&dword_237AFF000, v12, OS_LOG_TYPE_ERROR, "#spi,ab,cb,null", buf, 2u);
      int v12 = GpsdLogObjectGeneral;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)std::mutex buf = 136446722;
      int v26 = "/Library/Caches/com.apple.xbs/Sources/CoreGPS/Sources/HAL/Implementation/GnssHalCommSpi.mm";
      __int16 v27 = 1026;
      int v28 = 306;
      __int16 v29 = 2082;
      __int16 v30 = "AsyncBuffering";
      _os_log_error_impl(&dword_237AFF000, v12, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: assertion failure in %{public}s", buf, 0x1Cu);
    }
    std::string::basic_string[abi:ne180100]<0>(v17, "assert");
    std::string::basic_string[abi:ne180100]<0>(v15, "AsyncBuffering");
    std::string::basic_string[abi:ne180100]<0>(v13, "#spi,ab,cb,null");
    gpsd::util::triggerDiagnosticReport((uint64_t)v17, (uint64_t)v15, (uint64_t)v13);
    if (v14 < 0) {
      operator delete(v13[0]);
    }
    if (v16 < 0) {
      operator delete(v15[0]);
    }
    BOOL v9 = "false && \"#spi,ab,cb,null\"";
    int v10 = 306;
    if (v18 < 0)
    {
      unint64_t v11 = (void **)v17;
      goto LABEL_24;
    }
    goto LABEL_25;
  }
  std::vector<unsigned char>::reserve((unint64_t *)(a1 + 104), a4);
  std::vector<unsigned char>::reserve((unint64_t *)(a1 + 128), a4);
  return a1;
}

void sub_237B2A7B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,void *a27,uint64_t a28,int a29,__int16 a30,char a31,char a32,void *a33,uint64_t a34,int a35,__int16 a36,char a37,char a38,uint64_t a39,uint64_t a40,int a41,__int16 a42,char a43,char a44)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a20 < 0) {
    operator delete(a15);
  }
  if (a26 < 0) {
    operator delete(a21);
  }
  std::string v50 = *v48;
  if (*v48)
  {
    *(void *)(v44 + 136) = v50;
    operator delete(v50);
  }
  std::string v51 = *v47;
  if (*v47)
  {
    *(void *)(v44 + 112) = v51;
    operator delete(v51);
  }
  std::mutex::~mutex(v46);
  std::__function::__value_func<void ()(unsigned char *,unsigned long)>::~__value_func[abi:ne180100](v45);
  _Unwind_Resume(a1);
}

void ___ZN7GnssHal7CommSpi14AsyncBuffering5flushEv_block_invoke(uint64_t a1)
{
}

void GnssHal::CommSpi::AsyncBuffering::flushInternal(GnssHal::CommSpi::AsyncBuffering *this)
{
  uint64_t v2 = (std::mutex *)((char *)this + 40);
  std::mutex::lock((std::mutex *)((char *)this + 40));
  uint64_t v3 = *((void *)this + 13);
  uint64_t v4 = *((void *)this + 14);
  if (v3 == v4)
  {
    std::mutex::unlock(v2);
  }
  else
  {
    *(_OWORD *)((char *)this + 104) = *((_OWORD *)this + 8);
    uint64_t v5 = *((void *)this + 18);
    uint64_t v6 = *((void *)this + 15);
    *((void *)this + 17) = v4;
    *((void *)this + 18) = v6;
    *((void *)this + 15) = v5;
    *((void *)this + 16) = v3;
    std::mutex::unlock(v2);
    std::function<void ()(unsigned char *,unsigned long)>::operator()((uint64_t)this + 8, *((void *)this + 16), *((void *)this + 17) - *((void *)this + 16));
    uint64_t v7 = *((void *)this + 16);
    if (*((void *)this + 17) != v7) {
      *((void *)this + 17) = v7;
    }
    uint64_t v8 = *(NSObject **)this;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = ___ZN7GnssHal7CommSpi14AsyncBuffering5flushEv_block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    void block[4] = this;
    dispatch_async(v8, block);
  }
}

void GnssHal::CommSpi::~CommSpi(GnssHal::CommSpi *this)
{
  GnssHal::CommSpi::~CommSpi(this);
  JUMPOUT(0x237E29950);
}

{
  uint64_t v2;
  uint64_t v3;

  *(void *)this = &unk_26EAA8600;
  GnssHal::CommSpi::close(this);
  uint64_t v2 = *((void *)this + 16);
  *((void *)this + 16) = 0;
  if (v2) {
    std::default_delete<GnssHal::CommSpi::AsyncBuffering>::operator()[abi:ne180100](v2);
  }
  uint64_t v3 = *((void *)this + 15);
  *((void *)this + 15) = 0;
  if (v3) {
    std::default_delete<GnssHal::CommSpi::AsyncBuffering>::operator()[abi:ne180100](v3);
  }
  std::__function::__value_func<void ()(unsigned char *,unsigned long)>::~__value_func[abi:ne180100]((void *)this + 7);
  std::__function::__value_func<void ()(GnssHal::TimeTransferPulseMark)>::~__value_func[abi:ne180100]((void *)this + 1);
}

uint64_t GnssHal::CommSpi::isOpen(GnssHal::CommSpi *this)
{
  return *((unsigned __int8 *)this + 42);
}

uint64_t GnssHal::CommSpi::getFileDescriptor(GnssHal::CommSpi *this)
{
  return 0xFFFFFFFFLL;
}

uint64_t GnssHal::CommSpi::waitForDataAvailable(GnssHal::CommSpi *this)
{
  return 0;
}

uint64_t GnssHal::CommSpi::readTimeout(GnssHal::CommSpi *this, unsigned __int8 *a2)
{
  return -1;
}

uint64_t GnssHal::CommSpi::readComplete(GnssHal::CommSpi *this, unsigned __int8 *a2)
{
  return 0;
}

uint64_t GnssHal::CommSpi::isReadCallbackSupported(GnssHal::CommSpi *this)
{
  return 1;
}

uint64_t GnssHal::CommSpi::enterLowPowerMode(GnssHal::CommSpi *this)
{
  return 0;
}

uint64_t GnssHal::CommSpi::exitLowPowerMode(GnssHal::CommSpi *this)
{
  return 0;
}

double GnssHal::CommSpi::getTimeoutValueSeconds(GnssHal::CommSpi *this)
{
  return 0.0;
}

void std::default_delete<GnssHal::CommSpi::AsyncBuffering>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 128);
  if (v2)
  {
    *(void *)(a1 + 136) = v2;
    operator delete(v2);
  }
  uint64_t v3 = *(void **)(a1 + 104);
  if (v3)
  {
    *(void *)(a1 + 112) = v3;
    operator delete(v3);
  }
  std::mutex::~mutex((std::mutex *)(a1 + 40));
  std::__function::__value_func<void ()(unsigned char *,unsigned long)>::~__value_func[abi:ne180100]((void *)(a1 + 8));
  JUMPOUT(0x237E29950);
}

void std::__function::__func<GnssHal::CommSpi::CommSpi(std::function<void ()(GnssHal::TimeTransferPulseMark)>,NSObject  {objcproto17OS_dispatch_queue}*)::$_0,std::allocator<GnssHal::CommSpi::CommSpi(std::function<void ()(GnssHal::TimeTransferPulseMark)>,NSObject  {objcproto17OS_dispatch_queue}*)::$_0>,void ()(unsigned char *,unsigned long)>::~__func()
{
}

void *std::__function::__func<GnssHal::CommSpi::CommSpi(std::function<void ()(GnssHal::TimeTransferPulseMark)>,NSObject  {objcproto17OS_dispatch_queue}*)::$_0,std::allocator<GnssHal::CommSpi::CommSpi(std::function<void ()(GnssHal::TimeTransferPulseMark)>,NSObject  {objcproto17OS_dispatch_queue}*)::$_0>,void ()(unsigned char *,unsigned long)>::__clone(uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *uint64_t result = &unk_26EAA86C0;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<GnssHal::CommSpi::CommSpi(std::function<void ()(GnssHal::TimeTransferPulseMark)>,NSObject  {objcproto17OS_dispatch_queue}*)::$_0,std::allocator<GnssHal::CommSpi::CommSpi(std::function<void ()(GnssHal::TimeTransferPulseMark)>,NSObject  {objcproto17OS_dispatch_queue}*)::$_0>,void ()(unsigned char *,unsigned long)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_26EAA86C0;
  a2[1] = v2;
  return result;
}

uint64_t std::__function::__func<GnssHal::CommSpi::CommSpi(std::function<void ()(GnssHal::TimeTransferPulseMark)>,NSObject  {objcproto17OS_dispatch_queue}*)::$_0,std::allocator<GnssHal::CommSpi::CommSpi(std::function<void ()(GnssHal::TimeTransferPulseMark)>,NSObject  {objcproto17OS_dispatch_queue}*)::$_0>,void ()(unsigned char *,unsigned long)>::operator()(uint64_t a1, gpsd::util **a2, unsigned __int8 **a3, const char *a4)
{
  return GnssHal::CommSpi::writeInternal(*(GnssHal::CommSpi **)(a1 + 8), *a2, *a3, a4);
}

uint64_t std::__function::__func<GnssHal::CommSpi::CommSpi(std::function<void ()(GnssHal::TimeTransferPulseMark)>,NSObject  {objcproto17OS_dispatch_queue}*)::$_0,std::allocator<GnssHal::CommSpi::CommSpi(std::function<void ()(GnssHal::TimeTransferPulseMark)>,NSObject  {objcproto17OS_dispatch_queue}*)::$_0>,void ()(unsigned char *,unsigned long)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<GnssHal::CommSpi::CommSpi(std::function<void ()(GnssHal::TimeTransferPulseMark)>,NSObject  {objcproto17OS_dispatch_queue}*)::$_0,std::allocator<GnssHal::CommSpi::CommSpi(std::function<void ()(GnssHal::TimeTransferPulseMark)>,NSObject  {objcproto17OS_dispatch_queue}*)::$_0>,void ()(unsigned char *,unsigned long)>::target_type()
{
}

void std::__function::__func<GnssHal::CommSpi::CommSpi(std::function<void ()(GnssHal::TimeTransferPulseMark)>,NSObject  {objcproto17OS_dispatch_queue}*)::$_1,std::allocator<GnssHal::CommSpi::CommSpi(std::function<void ()(GnssHal::TimeTransferPulseMark)>,NSObject  {objcproto17OS_dispatch_queue}*)::$_1>,void ()(unsigned char *,unsigned long)>::~__func()
{
}

void *std::__function::__func<GnssHal::CommSpi::CommSpi(std::function<void ()(GnssHal::TimeTransferPulseMark)>,NSObject  {objcproto17OS_dispatch_queue}*)::$_1,std::allocator<GnssHal::CommSpi::CommSpi(std::function<void ()(GnssHal::TimeTransferPulseMark)>,NSObject  {objcproto17OS_dispatch_queue}*)::$_1>,void ()(unsigned char *,unsigned long)>::__clone(uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *uint64_t result = &unk_26EAA8750;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<GnssHal::CommSpi::CommSpi(std::function<void ()(GnssHal::TimeTransferPulseMark)>,NSObject  {objcproto17OS_dispatch_queue}*)::$_1,std::allocator<GnssHal::CommSpi::CommSpi(std::function<void ()(GnssHal::TimeTransferPulseMark)>,NSObject  {objcproto17OS_dispatch_queue}*)::$_1>,void ()(unsigned char *,unsigned long)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_26EAA8750;
  a2[1] = v2;
  return result;
}

void std::__function::__func<GnssHal::CommSpi::CommSpi(std::function<void ()(GnssHal::TimeTransferPulseMark)>,NSObject  {objcproto17OS_dispatch_queue}*)::$_1,std::allocator<GnssHal::CommSpi::CommSpi(std::function<void ()(GnssHal::TimeTransferPulseMark)>,NSObject  {objcproto17OS_dispatch_queue}*)::$_1>,void ()(unsigned char *,unsigned long)>::operator()(uint64_t a1, gpsd::util **a2, unsigned __int8 **a3, const char *a4)
{
}

uint64_t std::__function::__func<GnssHal::CommSpi::CommSpi(std::function<void ()(GnssHal::TimeTransferPulseMark)>,NSObject  {objcproto17OS_dispatch_queue}*)::$_1,std::allocator<GnssHal::CommSpi::CommSpi(std::function<void ()(GnssHal::TimeTransferPulseMark)>,NSObject  {objcproto17OS_dispatch_queue}*)::$_1>,void ()(unsigned char *,unsigned long)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<GnssHal::CommSpi::CommSpi(std::function<void ()(GnssHal::TimeTransferPulseMark)>,NSObject  {objcproto17OS_dispatch_queue}*)::$_1,std::allocator<GnssHal::CommSpi::CommSpi(std::function<void ()(GnssHal::TimeTransferPulseMark)>,NSObject  {objcproto17OS_dispatch_queue}*)::$_1>,void ()(unsigned char *,unsigned long)>::target_type()
{
}

GnssHal::PlatformNvStore *GnssHal::PlatformNvStore::PlatformNvStore(GnssHal::PlatformNvStore *this)
{
  *(void *)this = &unk_26EAA87D0;
  uint64_t v2 = (GnssHal::PlatformNvStore *)((char *)this + 8);
  proto::gnsshal::NvStore::NvStore((GnssHal::PlatformNvStore *)((char *)this + 8));
  *((_OWORD *)this + 4) = 0u;
  *((_OWORD *)this + 5) = 0u;
  proto::gnsshal::NvStore::NvStore((GnssHal::PlatformNvStore *)((char *)this + 96));
  *((void *)this + 31) = (char *)this + 256;
  *((void *)this + 19) = 0;
  *((void *)this + 20) = 0;
  *((void *)this + 21) = 0;
  *((_OWORD *)this + 12) = 0u;
  *((_OWORD *)this + 13) = 0u;
  *((_OWORD *)this + 14) = 0u;
  *((void *)this + 30) = 0;
  *((void *)this + 32) = 0;
  *((void *)this + 33) = 0;
  *((_OWORD *)this + 11) = xmmword_237B31F70;
  proto::gnsshal::NvStore::Clear((GnssHal::PlatformNvStore *)((char *)this + 96));
  *((_DWORD *)this + 36) |= 1u;
  *((_DWORD *)this + 34) = 1;
  *((void *)this + 11) = 0;
  proto::gnsshal::NvStore::Clear(v2);
  *((_DWORD *)this + 14) |= 1u;
  *((_DWORD *)this + 12) = 1;
  GnssHal::PlatformNvStore::configure(this);
  GnssHal::PlatformNvStore::readCacheFromDisk(this, (GnssHal::PlatformNvStore *)((char *)this + 96));
  GnssHal::PlatformNvStore::readCacheFromDisk(this, v2);
  return this;
}

void sub_237B2ADDC(_Unwind_Exception *a1)
{
  GnssHal::PlatformNvStore::Cache::~Cache(v1);
  _Unwind_Resume(a1);
}

uint64_t GnssHal::PlatformNvStore::Cache::reset(GnssHal::PlatformNvStore::Cache *this)
{
  *((void *)this + 10) = 0;
  uint64_t result = proto::gnsshal::NvStore::Clear(this);
  *((_DWORD *)this + 12) |= 1u;
  *((_DWORD *)this + 10) = 1;
  return result;
}

uint64_t GnssHal::PlatformNvStore::configure(GnssHal::PlatformNvStore *this)
{
  uint64_t v2 = (GpsdPreferences *)GpsdPreferences::instance(0);
  GpsdPreferences::nvStoreFile(v2, &v5);
  uint64_t v3 = (void **)((char *)this + 152);
  if (*((char *)this + 175) < 0) {
    operator delete(*v3);
  }
  *(_OWORD *)uint64_t v3 = v5;
  *((void *)this + 21) = v6;
  return MEMORY[0x237E295A0]((char *)this + 64, &str);
}

uint64_t GnssHal::PlatformNvStore::readCacheFromDisk(GnssHal::PlatformNvStore *this, GnssHal::PlatformNvStore::Cache *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v2 = *((unsigned __int8 *)a2 + 79);
  if ((v2 & 0x80u) != 0) {
    uint64_t v2 = *((void *)a2 + 8);
  }
  if (v2)
  {
    long long v5 = (char *)a2 + 56;
    if ((GnssHal::PlatformNvStore::readCacheFromFile(this, (uint64_t)a2, (uint64_t *)a2 + 7) & 1) == 0)
    {
      if (*((char *)a2 + 79) >= 0) {
        size_t v6 = *((unsigned __int8 *)a2 + 79);
      }
      else {
        size_t v6 = *((void *)a2 + 8);
      }
      uint64_t v7 = __p;
      std::string::basic_string[abi:ne180100]((uint64_t)__p, v6 + 4);
      if (v16 < 0) {
        uint64_t v7 = *(unsigned char **)__p;
      }
      if (v6)
      {
        if (*((char *)a2 + 79) >= 0) {
          uint64_t v8 = v5;
        }
        else {
          uint64_t v8 = (const void *)*((void *)a2 + 7);
        }
        memmove(v7, v8, v6);
      }
      strcpy(&v7[v6], ".bak");
      int CacheFromFile = GnssHal::PlatformNvStore::readCacheFromFile(this, (uint64_t)a2, (uint64_t *)__p);
      if (v16 < 0) {
        operator delete(*(void **)__p);
      }
      int v10 = GpsdLogObjectGeneral;
      if (CacheFromFile)
      {
        unint64_t v11 = (GnssHal::PlatformNvStore *)os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR);
        if (v11)
        {
          if (*((char *)a2 + 79) >= 0) {
            int v12 = v5;
          }
          else {
            int v12 = (char *)*((void *)a2 + 7);
          }
          *(_DWORD *)std::string __p = 136315138;
          *(void *)&__p[4] = v12;
          _os_log_error_impl(&dword_237AFF000, v10, OS_LOG_TYPE_ERROR, "NvStore,Needed to read from backup file, %s, is corrupt", __p, 0xCu);
        }
      }
      else
      {
        if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
        {
          if (*((char *)a2 + 79) >= 0) {
            mach_error_t v13 = v5;
          }
          else {
            mach_error_t v13 = (char *)*((void *)a2 + 7);
          }
          *(_DWORD *)std::string __p = 136315138;
          *(void *)&__p[4] = v13;
          _os_log_impl(&dword_237AFF000, v10, OS_LOG_TYPE_DEFAULT, "NvStore,Failed to read from primary and backup files for,%s, using an empty cache", __p, 0xCu);
        }
        *((void *)a2 + 10) = 0;
        unint64_t v11 = (GnssHal::PlatformNvStore *)proto::gnsshal::NvStore::Clear(a2);
        *((_DWORD *)a2 + 12) |= 1u;
        *((_DWORD *)a2 + 10) = 1;
      }
      GnssHal::PlatformNvStore::writeCacheToDisk(v11, a2);
    }
  }
  return 1;
}

void sub_237B2B0C4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void GnssHal::PlatformNvStore::Cache::~Cache(void **this)
{
  if (*((char *)this + 79) < 0) {
    operator delete(this[7]);
  }
  proto::gnsshal::NvStore::~NvStore((proto::gnsshal::NvStore *)this);
}

void GnssHal::PlatformNvStore::~PlatformNvStore(GnssHal::PlatformNvStore *this)
{
  *(void *)this = &unk_26EAA87D0;
  GnssHal::PlatformNvStore::flushSession(this);
  (*(void (**)(GnssHal::PlatformNvStore *))(*(void *)this + 56))(this);
  std::__tree<std::__value_type<GnssHal::NvStorage::NamedType,std::string>,std::__map_value_compare<GnssHal::NvStorage::NamedType,std::__value_type<GnssHal::NvStorage::NamedType,std::string>,std::less<GnssHal::NvStorage::NamedType>,true>,std::allocator<std::__value_type<GnssHal::NvStorage::NamedType,std::string>>>::destroy((uint64_t)this + 248, *((char **)this + 32));
  std::mutex::~mutex((std::mutex *)((char *)this + 184));
  if (*((char *)this + 175) < 0) {
    operator delete(*((void **)this + 19));
  }
  proto::gnsshal::NvStore::~NvStore((GnssHal::PlatformNvStore *)((char *)this + 96));
  if (*((char *)this + 87) < 0) {
    operator delete(*((void **)this + 8));
  }
  proto::gnsshal::NvStore::~NvStore((GnssHal::PlatformNvStore *)((char *)this + 8));
}

{
  uint64_t vars8;

  GnssHal::PlatformNvStore::~PlatformNvStore(this);
  JUMPOUT(0x237E29950);
}

BOOL GnssHal::PlatformNvStore::storeSession(uint64_t a1, int a2, uint64_t a3)
{
  size_t v6 = (std::mutex *)(a1 + 184);
  std::mutex::lock((std::mutex *)(a1 + 184));
  BOOL v7 = GnssHal::PlatformNvStore::storeInternal((GnssHal::PlatformNvStore *)a1, a2, a3, a1 + 8, (GnssHal::PlatformNvStore::Cache *)(a1 + 96));
  std::mutex::unlock(v6);
  return v7;
}

{
  std::mutex *v6;
  BOOL v7;

  size_t v6 = (std::mutex *)(a1 + 184);
  std::mutex::lock((std::mutex *)(a1 + 184));
  BOOL v7 = GnssHal::PlatformNvStore::storeInternal((GnssHal::PlatformNvStore *)a1, a2, a3, a1 + 8, (GnssHal::PlatformNvStore::Cache *)(a1 + 96));
  std::mutex::unlock(v6);
  return v7;
}

void sub_237B2B288(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

BOOL GnssHal::PlatformNvStore::storeInternal(GnssHal::PlatformNvStore *a1, uint64_t a2, uint64_t a3, uint64_t a4, GnssHal::PlatformNvStore::Cache *a5)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  if (GnssHal::PlatformNvStore::existsInCache(a1, a5, a2))
  {
    BOOL v9 = GpsdLogObjectWarning;
    BOOL v10 = 0;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectWarning, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_237AFF000, v9, OS_LOG_TYPE_DEFAULT, "NvStore,Item already in alternate cache", (uint8_t *)&v19, 2u);
      return 0;
    }
  }
  else
  {
    GnssHal::PlatformNvStore::printState(a1, "pre-store");
    unint64_t v11 = GpsdLogObjectGeneral;
    BOOL v12 = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG);
    if (v12)
    {
      if (a2 <= 0x7FFFFFFF) {
        int v15 = a2;
      }
      else {
        int v15 = a2 - 0x7FFFFFFF;
      }
      double v16 = (double)gpsd::util::getMachContinuousTimeNs((gpsd::util *)v12) * 0.000000001;
      uint64_t v17 = (const void *)(*(void *)(a3 + 8) - *(void *)a3);
      int v18 = gpsd::util::truncatedSha256(*(gpsd::util **)a3, v17);
      int v19 = 134218752;
      double v20 = v16;
      __int16 v21 = 1024;
      int v22 = v15;
      __int16 v23 = 2048;
      char v24 = v17;
      __int16 v25 = 1024;
      int v26 = v18;
      _os_log_debug_impl(&dword_237AFF000, v11, OS_LOG_TYPE_DEBUG, "NvStore,store,mach_cont_s,%.3f,id,%d,size,%zu,hash,%x", (uint8_t *)&v19, 0x22u);
    }
    BOOL v10 = GnssHal::PlatformNvStore::storeToCache(v12, a4, a2, a3);
    if (!v10)
    {
      mach_error_t v13 = GpsdLogObjectWarning;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectWarning, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v19) = 0;
        _os_log_impl(&dword_237AFF000, v13, OS_LOG_TYPE_DEFAULT, "NvStore,storeToCache failed", (uint8_t *)&v19, 2u);
      }
    }
    GnssHal::PlatformNvStore::printState(a1, "post-store");
  }
  return v10;
}

void sub_237B2B50C(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

BOOL GnssHal::PlatformNvStore::storeInternal(GnssHal::PlatformNvStore *this, int a2, uint64_t a3, uint64_t a4, GnssHal::PlatformNvStore::Cache *a5)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  BOOL v10 = (char *)*((void *)this + 32);
  if (!v10) {
    goto LABEL_11;
  }
  unint64_t v11 = (const void **)((char *)this + 256);
  do
  {
    int v12 = *((_DWORD *)v10 + 8);
    BOOL v13 = v12 < a2;
    if (v12 >= a2) {
      char v14 = (char **)v10;
    }
    else {
      char v14 = (char **)(v10 + 8);
    }
    if (!v13) {
      unint64_t v11 = (const void **)v10;
    }
    BOOL v10 = *v14;
  }
  while (*v14);
  if (v11 != (const void **)((char *)this + 256) && *((_DWORD *)v11 + 8) <= a2)
  {
    GnssHal::PlatformNvStore::printState(this, "pre-storeNamed");
    int v18 = GpsdLogObjectGeneral;
    BOOL v19 = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG);
    if (v19)
    {
      double v21 = (double)gpsd::util::getMachContinuousTimeNs((gpsd::util *)v19) * 0.000000001;
      int v22 = (const void *)(*(void *)(a3 + 8) - *(void *)a3);
      int v23 = gpsd::util::truncatedSha256(*(gpsd::util **)a3, v22);
      int v24 = 134218752;
      *(double *)__int16 v25 = v21;
      *(_WORD *)&v25[8] = 1024;
      *(_DWORD *)&v25[10] = a2;
      __int16 v26 = 2048;
      uint64_t v27 = v22;
      __int16 v28 = 1024;
      int v29 = v23;
      _os_log_debug_impl(&dword_237AFF000, v18, OS_LOG_TYPE_DEBUG, "NvStore,storeNamed,mach_cont_s,%.3f,id,%d,size,%zu,hash,%x", (uint8_t *)&v24, 0x22u);
    }
    uint64_t v16 = GnssHal::PlatformNvStore::writeBlobToDedicatedFile(v19, v11 + 5, a3);
    double v20 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG))
    {
      int v24 = 67109120;
      *(_DWORD *)__int16 v25 = v16;
      _os_log_debug_impl(&dword_237AFF000, v20, OS_LOG_TYPE_DEBUG, "NvStore,storeReturn,%d", (uint8_t *)&v24, 8u);
    }
    GnssHal::PlatformNvStore::printState(this, "post-storeNamed");
  }
  else
  {
LABEL_11:
    int v15 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG))
    {
      int v24 = 67109376;
      *(_DWORD *)__int16 v25 = a2;
      *(_WORD *)&v25[4] = 2048;
      *(void *)&v25[6] = a2 + 0x80000000;
      _os_log_debug_impl(&dword_237AFF000, v15, OS_LOG_TYPE_DEBUG, "NvStore,Did not find dedicated file for NamedType,%d,Converting to id,%lld", (uint8_t *)&v24, 0x12u);
    }
    return GnssHal::PlatformNvStore::storeInternal(this, a2 + 0x80000000, a3, a4, a5);
  }
  return v16;
}

BOOL GnssHal::PlatformNvStore::storePermanent(uint64_t a1, int a2, uint64_t a3)
{
  size_t v6 = (std::mutex *)(a1 + 184);
  std::mutex::lock((std::mutex *)(a1 + 184));
  BOOL v7 = GnssHal::PlatformNvStore::storeInternal((GnssHal::PlatformNvStore *)a1, a2, a3, a1 + 96, (GnssHal::PlatformNvStore::Cache *)(a1 + 8));
  std::mutex::unlock(v6);
  return v7;
}

{
  std::mutex *v6;
  BOOL v7;

  size_t v6 = (std::mutex *)(a1 + 184);
  std::mutex::lock((std::mutex *)(a1 + 184));
  BOOL v7 = GnssHal::PlatformNvStore::storeInternal((GnssHal::PlatformNvStore *)a1, a2, a3, a1 + 96, (GnssHal::PlatformNvStore::Cache *)(a1 + 8));
  std::mutex::unlock(v6);
  return v7;
}

void sub_237B2B7E8(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_237B2B860(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void GnssHal::PlatformNvStore::flushSession(GnssHal::PlatformNvStore *this)
{
  uint64_t v2 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_237AFF000, v2, OS_LOG_TYPE_DEFAULT, "NvStore,flushSession", v4, 2u);
  }
  std::mutex::lock((std::mutex *)((char *)this + 184));
  GnssHal::PlatformNvStore::flushInternal(v3, (GnssHal::PlatformNvStore *)((char *)this + 8));
  std::mutex::unlock((std::mutex *)((char *)this + 184));
}

void sub_237B2B8FC(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void GnssHal::PlatformNvStore::flushInternal(GnssHal::PlatformNvStore *this, GnssHal::PlatformNvStore::Cache *a2)
{
  if ((GnssHal::PlatformNvStore::writeCacheToDisk(this, a2) & 1) == 0)
  {
    uint64_t v2 = GpsdLogObjectWarning;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectWarning, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v3 = 0;
      _os_log_impl(&dword_237AFF000, v2, OS_LOG_TYPE_DEFAULT, "NvStore,flush,writeCacheToDisk failed", v3, 2u);
    }
  }
}

void GnssHal::PlatformNvStore::flushPermanent(GnssHal::PlatformNvStore *this)
{
  uint64_t v2 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_237AFF000, v2, OS_LOG_TYPE_DEFAULT, "NvStore,flushPermanent", v4, 2u);
  }
  std::mutex::lock((std::mutex *)((char *)this + 184));
  GnssHal::PlatformNvStore::flushInternal(v3, (GnssHal::PlatformNvStore *)((char *)this + 96));
  std::mutex::unlock((std::mutex *)((char *)this + 184));
}

void sub_237B2BA0C(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void GnssHal::PlatformNvStore::recall(GnssHal::PlatformNvStore *this@<X0>, int a2@<W1>, unint64_t *a3@<X8>)
{
  size_t v6 = (std::mutex *)((char *)this + 184);
  std::mutex::lock((std::mutex *)((char *)this + 184));
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  GnssHal::PlatformNvStore::recallInternal((uint64_t)this, a2, a3);
  std::mutex::unlock(v6);
}

void sub_237B2BA88(_Unwind_Exception *a1)
{
  uint64_t v4 = *(void **)v2;
  if (*(void *)v2)
  {
    *(void *)(v2 + 8) = v4;
    operator delete(v4);
  }
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void GnssHal::PlatformNvStore::recallInternal(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  uint64_t v4 = a2;
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v6 = *(unsigned int *)(a1 + 32);
  if ((int)v6 < 1)
  {
LABEL_5:
    uint64_t v9 = *(unsigned int *)(a1 + 120);
    if ((int)v9 < 1) {
      goto LABEL_17;
    }
    BOOL v10 = *(uint64_t **)(a1 + 112);
    while (1)
    {
      uint64_t v8 = *v10;
      if (*(void *)(*v10 + 16) == a2) {
        break;
      }
      ++v10;
      if (!--v9) {
        goto LABEL_17;
      }
    }
  }
  else
  {
    BOOL v7 = *(uint64_t **)(a1 + 24);
    while (1)
    {
      uint64_t v8 = *v7;
      if (*(void *)(*v7 + 16) == a2) {
        break;
      }
      ++v7;
      if (!--v6) {
        goto LABEL_5;
      }
    }
  }
  unint64_t v11 = *(char **)(v8 + 24);
  if (v11[23] < 0) {
    size_t v12 = *((void *)v11 + 1);
  }
  else {
    size_t v12 = v11[23];
  }
  std::vector<unsigned char>::reserve(a3, v12);
  if (v11[23] < 0)
  {
    char v14 = v11;
    unint64_t v11 = *(char **)v11;
    uint64_t v13 = *((void *)v14 + 1);
  }
  else
  {
    uint64_t v13 = v11[23];
  }
  std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<char const*,char const*,std::back_insert_iterator<std::vector<unsigned char>>>(v11, &v11[v13], a3);
LABEL_17:
  int v15 = GpsdLogObjectGeneral;
  BOOL v16 = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG);
  if (v16)
  {
    if (v4 > 0x7FFFFFFF) {
      LODWORD(v4) = v4 - 0x7FFFFFFF;
    }
    double v17 = (double)gpsd::util::getMachContinuousTimeNs((gpsd::util *)v16) * 0.000000001;
    int v18 = (gpsd::util *)*a3;
    BOOL v19 = (const void *)(a3[1] - *a3);
    int v20 = 134218752;
    double v21 = v17;
    __int16 v22 = 1024;
    int v23 = v4;
    __int16 v24 = 2048;
    __int16 v25 = v19;
    __int16 v26 = 1024;
    int v27 = gpsd::util::truncatedSha256(v18, v19);
    _os_log_debug_impl(&dword_237AFF000, v15, OS_LOG_TYPE_DEBUG, "NvStore,recall,mach_cont_s,%.3f,id,%d,size,%zu,hash,%x", (uint8_t *)&v20, 0x22u);
  }
  GnssHal::PlatformNvStore::printState((GnssHal::PlatformNvStore *)a1, "recalled");
}

void GnssHal::PlatformNvStore::recall(uint64_t a1@<X0>, int a2@<W1>, unint64_t *a3@<X8>)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v6 = (std::mutex *)(a1 + 184);
  std::mutex::lock((std::mutex *)(a1 + 184));
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  uint64_t v7 = *(void *)(a1 + 256);
  if (!v7) {
    goto LABEL_11;
  }
  uint64_t v8 = a1 + 256;
  do
  {
    int v9 = *(_DWORD *)(v7 + 32);
    BOOL v10 = v9 < a2;
    if (v9 >= a2) {
      unint64_t v11 = (uint64_t *)v7;
    }
    else {
      unint64_t v11 = (uint64_t *)(v7 + 8);
    }
    if (!v10) {
      uint64_t v8 = v7;
    }
    uint64_t v7 = *v11;
  }
  while (*v11);
  if (v8 != a1 + 256 && *(_DWORD *)(v8 + 32) <= a2)
  {
    uint64_t v13 = GpsdLogObjectGeneral;
    BOOL v14 = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG);
    if (v14)
    {
      int v15 = (void *)(v8 + 40);
      if (*(char *)(v8 + 63) < 0) {
        int v15 = (void *)*v15;
      }
      int v16 = 67109378;
      int v17 = a2;
      __int16 v18 = 2080;
      uint64_t v19 = (uint64_t)v15;
      _os_log_debug_impl(&dword_237AFF000, v13, OS_LOG_TYPE_DEBUG, "NvStore: Reading NamedType=%d from dedicated file %s", (uint8_t *)&v16, 0x12u);
    }
    GnssHal::PlatformNvStore::readBlobFromDedicatedFile(v14, v8 + 40, a3);
  }
  else
  {
LABEL_11:
    size_t v12 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG))
    {
      int v16 = 67109376;
      int v17 = a2;
      __int16 v18 = 2048;
      uint64_t v19 = a2 + 0x80000000;
      _os_log_debug_impl(&dword_237AFF000, v12, OS_LOG_TYPE_DEBUG, "NvStore: Did not find dedicated file for NamedType=%d, converting it to id=%lld", (uint8_t *)&v16, 0x12u);
    }
    GnssHal::PlatformNvStore::recallInternal(a1, a2 + 0x80000000, a3);
  }
  std::mutex::unlock(v6);
}

void sub_237B2BE38(_Unwind_Exception *a1)
{
  uint64_t v4 = *(void **)v2;
  if (*(void *)v2)
  {
    *(void *)(v2 + 8) = v4;
    operator delete(v4);
  }
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t GnssHal::PlatformNvStore::idFromNamedType(uint64_t a1, int a2)
{
  return a2 + 0x80000000;
}

void GnssHal::PlatformNvStore::readBlobFromDedicatedFile(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (*(char *)(a2 + 23) >= 0) {
    uint64_t v4 = (const char *)a2;
  }
  else {
    uint64_t v4 = *(const char **)a2;
  }
  long long v5 = fopen(v4, "rb");
  if (!v5)
  {
    uint64_t v11 = GpsdLogObjectGeneral;
    if (!os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR)) {
      return;
    }
    int v12 = *__error();
    *(_DWORD *)std::mutex buf = 67240192;
    int v22 = v12;
    uint64_t v13 = "NvStore,Failed to open file for reading,%{public}d";
LABEL_14:
    BOOL v14 = v11;
    uint32_t v15 = 8;
LABEL_15:
    _os_log_error_impl(&dword_237AFF000, v14, OS_LOG_TYPE_ERROR, v13, buf, v15);
    return;
  }
  uint64_t v6 = v5;
  unsigned int __ptr = 0;
  size_t v7 = fread(&__ptr, 4uLL, 1uLL, v5);
  size_t v8 = __ptr;
  if (v7 != 1 || (__ptr & 0x80000000) != 0 || (int)__ptr >= 8000001)
  {
    fclose(v6);
    uint64_t v11 = GpsdLogObjectGeneral;
    if (!os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR)) {
      return;
    }
    *(_DWORD *)std::mutex buf = 67240192;
    int v22 = v8;
    uint64_t v13 = "NvStore,Failed to read itemId/numBytes or out of range,numBytes,%{public}d";
    goto LABEL_14;
  }
  int v9 = (void *)*a3;
  unint64_t v10 = a3[1] - *a3;
  if (__ptr <= v10)
  {
    if (__ptr < v10) {
      a3[1] = (unint64_t)v9 + __ptr;
    }
  }
  else
  {
    std::vector<unsigned char>::__append(a3, __ptr - v10);
    int v9 = (void *)*a3;
  }
  size_t v16 = fread(v9, 1uLL, v8, v6);
  int v17 = fclose(v6);
  if (v16 == v8)
  {
    if (v17)
    {
      uint64_t v18 = GpsdLogObjectGeneral;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)std::mutex buf = 0;
        uint64_t v13 = "NvStore,Failed to close file after reading";
        BOOL v14 = v18;
        uint32_t v15 = 2;
        goto LABEL_15;
      }
    }
  }
  else
  {
    uint64_t v19 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)std::mutex buf = 0;
      _os_log_error_impl(&dword_237AFF000, v19, OS_LOG_TYPE_ERROR, "NvStore,Failed to read payload", buf, 2u);
    }
    a3[1] = *a3;
  }
}

uint64_t GnssHal::PlatformNvStore::clear(GnssHal::PlatformNvStore *this, int a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v4 = GpsdLogObjectGeneral;
  BOOL v5 = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    int v9 = 134218240;
    double v10 = (double)gpsd::util::getMachContinuousTimeNs((gpsd::util *)v5) * 0.000000001;
    __int16 v11 = 1024;
    int v12 = a2;
    _os_log_debug_impl(&dword_237AFF000, v4, OS_LOG_TYPE_DEBUG, "NvStore,clear,mach_cont_s,%.3f,id,%d", (uint8_t *)&v9, 0x12u);
  }
  std::mutex::lock((std::mutex *)((char *)this + 184));
  size_t v7 = (GnssHal::PlatformNvStore *)GnssHal::PlatformNvStore::clearFromCache(v6, (GnssHal::PlatformNvStore *)((char *)this + 8), a2);
  GnssHal::PlatformNvStore::clearFromCache(v7, (GnssHal::PlatformNvStore *)((char *)this + 96), a2);
  std::mutex::unlock((std::mutex *)((char *)this + 184));
  return 1;
}

void sub_237B2C1B8(_Unwind_Exception *exception_object)
{
}

uint64_t GnssHal::PlatformNvStore::clearInternal(GnssHal::PlatformNvStore *this, uint64_t a2)
{
  uint64_t v4 = (GnssHal::PlatformNvStore *)GnssHal::PlatformNvStore::clearFromCache(this, (GnssHal::PlatformNvStore *)((char *)this + 8), a2);
  GnssHal::PlatformNvStore::clearFromCache(v4, (GnssHal::PlatformNvStore *)((char *)this + 96), a2);
  return 1;
}

uint64_t GnssHal::PlatformNvStore::clear(uint64_t a1, int a2)
{
  v20[3] = *(double *)MEMORY[0x263EF8340];
  uint64_t v4 = GpsdLogObjectGeneral;
  BOOL v5 = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    LODWORD(v20[0]) = 134218240;
    *(double *)((char *)v20 + 4) = (double)gpsd::util::getMachContinuousTimeNs((gpsd::util *)v5) * 0.000000001;
    WORD2(v20[1]) = 1024;
    *(_DWORD *)((char *)&v20[1] + 6) = a2;
    _os_log_debug_impl(&dword_237AFF000, v4, OS_LOG_TYPE_DEBUG, "NvStore,clearNamed,mach_cont_s,%.3f,id,%d", (uint8_t *)v20, 0x12u);
  }
  uint64_t v6 = (std::mutex *)(a1 + 184);
  std::mutex::lock((std::mutex *)(a1 + 184));
  uint64_t v7 = *(void *)(a1 + 256);
  if (!v7) {
    goto LABEL_13;
  }
  uint64_t v8 = a1 + 256;
  do
  {
    int v9 = *(_DWORD *)(v7 + 32);
    BOOL v10 = v9 < a2;
    if (v9 >= a2) {
      __int16 v11 = (uint64_t *)v7;
    }
    else {
      __int16 v11 = (uint64_t *)(v7 + 8);
    }
    if (!v10) {
      uint64_t v8 = v7;
    }
    uint64_t v7 = *v11;
  }
  while (*v11);
  if (v8 != a1 + 256 && *(_DWORD *)(v8 + 32) <= a2)
  {
    int v17 = GpsdLogObjectGeneral;
    BOOL v18 = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG);
    if (v18)
    {
      uint64_t v19 = (void *)(v8 + 40);
      if (*(char *)(v8 + 63) < 0) {
        uint64_t v19 = (void *)*v19;
      }
      LODWORD(v20[0]) = 67109378;
      HIDWORD(v20[0]) = a2;
      LOWORD(v20[1]) = 2080;
      *(void *)((char *)&v20[1] + 2) = v19;
      _os_log_debug_impl(&dword_237AFF000, v17, OS_LOG_TYPE_DEBUG, "NvStore: Clearing NamedType=%d from dedicated file %s", (uint8_t *)v20, 0x12u);
    }
    memset(v20, 0, 24);
    uint64_t v15 = GnssHal::PlatformNvStore::writeBlobToDedicatedFile(v18, (const void **)(v8 + 40), (uint64_t)v20);
  }
  else
  {
LABEL_13:
    int v12 = GpsdLogObjectGeneral;
    BOOL v13 = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG);
    if (v13)
    {
      LODWORD(v20[0]) = 67109376;
      HIDWORD(v20[0]) = a2;
      LOWORD(v20[1]) = 2048;
      *(void *)((char *)&v20[1] + 2) = a2 + 0x80000000;
      _os_log_debug_impl(&dword_237AFF000, v12, OS_LOG_TYPE_DEBUG, "NvStore: Did not find dedicated file for NamedType=%d, converting it to id=%lld", (uint8_t *)v20, 0x12u);
    }
    BOOL v14 = (GnssHal::PlatformNvStore *)GnssHal::PlatformNvStore::clearFromCache((GnssHal::PlatformNvStore *)v13, (GnssHal::PlatformNvStore::Cache *)(a1 + 8), a2 + 0x80000000);
    GnssHal::PlatformNvStore::clearFromCache(v14, (GnssHal::PlatformNvStore::Cache *)(a1 + 96), a2 + 0x80000000);
    uint64_t v15 = 1;
  }
  std::mutex::unlock(v6);
  return v15;
}

void sub_237B2C448(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t GnssHal::PlatformNvStore::clearDedicatedFile(uint64_t a1, const void **a2)
{
  memset(v3, 0, sizeof(v3));
  return GnssHal::PlatformNvStore::writeBlobToDedicatedFile(a1, a2, (uint64_t)v3);
}

uint64_t GnssHal::PlatformNvStore::clearSessionStorage(GnssHal::PlatformNvStore *this)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v2 = GpsdLogObjectGeneral;
  BOOL v3 = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO);
  if (v3)
  {
    int v6 = 134217984;
    double v7 = (double)gpsd::util::getMachContinuousTimeNs((gpsd::util *)v3) * 0.000000001;
    _os_log_impl(&dword_237AFF000, v2, OS_LOG_TYPE_INFO, "NvStore,clearSession,mach_cont_s,%.3f", (uint8_t *)&v6, 0xCu);
  }
  std::mutex::lock((std::mutex *)((char *)this + 184));
  GnssHal::PlatformNvStore::clearCache(v4, (GnssHal::PlatformNvStore *)((char *)this + 8));
  std::mutex::unlock((std::mutex *)((char *)this + 184));
  return 1;
}

void sub_237B2C56C(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void GnssHal::PlatformNvStore::clearCache(GnssHal::PlatformNvStore *this, GnssHal::PlatformNvStore::Cache *a2)
{
  *((void *)a2 + 10) = 0;
  BOOL v3 = (GnssHal::PlatformNvStore *)proto::gnsshal::NvStore::Clear(a2);
  *((_DWORD *)a2 + 12) |= 1u;
  *((_DWORD *)a2 + 10) = 1;
  if ((GnssHal::PlatformNvStore::writeCacheToDisk(v3, a2) & 1) == 0)
  {
    uint64_t v4 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)BOOL v5 = 0;
      _os_log_error_impl(&dword_237AFF000, v4, OS_LOG_TYPE_ERROR, "NvStore,clearCache requested but not completed due to writeCacheToDisk failure", v5, 2u);
    }
  }
}

uint64_t GnssHal::PlatformNvStore::clearPermanentStorage(GnssHal::PlatformNvStore *this)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v2 = GpsdLogObjectGeneral;
  BOOL v3 = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_INFO);
  if (v3)
  {
    int v6 = 134217984;
    double v7 = (double)gpsd::util::getMachContinuousTimeNs((gpsd::util *)v3) * 0.000000001;
    _os_log_impl(&dword_237AFF000, v2, OS_LOG_TYPE_INFO, "NvStore,clearPermanent,mach_cont_s,%.3f", (uint8_t *)&v6, 0xCu);
  }
  std::mutex::lock((std::mutex *)((char *)this + 184));
  GnssHal::PlatformNvStore::clearCache(v4, (GnssHal::PlatformNvStore *)((char *)this + 96));
  std::mutex::unlock((std::mutex *)((char *)this + 184));
  return 1;
}

void sub_237B2C700(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void GnssHal::PlatformNvStore::printState(GnssHal::PlatformNvStore *this, const char *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_268943160, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_268943160))
  {
    double v7 = (id *)GpsdPreferences::instance(0);
    _MergedGlobals_2 = GpsdPreferences::verboseNvStore(v7);
    __cxa_guard_release(&qword_268943160);
  }
  if (_MergedGlobals_2)
  {
    uint64_t v4 = GpsdLogObjectGeneral;
    BOOL v5 = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG);
    if (v5)
    {
      int v8 = 136315138;
      int v9 = a2;
      _os_log_debug_impl(&dword_237AFF000, v4, OS_LOG_TYPE_DEBUG, "NvStore,printState,begin,%s", (uint8_t *)&v8, 0xCu);
    }
    if (*((uint64_t *)this + 11) >= 1) {
      GnssHal::PlatformNvStore::printState((GnssHal::PlatformNvStore *)v5, (GnssHal::PlatformNvStore *)((char *)this + 8));
    }
    GnssHal::PlatformNvStore::printState((GnssHal::PlatformNvStore *)v5, (GnssHal::PlatformNvStore *)((char *)this + 96));
    int v6 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG))
    {
      int v8 = 136315138;
      int v9 = a2;
      _os_log_debug_impl(&dword_237AFF000, v6, OS_LOG_TYPE_DEBUG, "NvStore,printState,end,%s", (uint8_t *)&v8, 0xCu);
    }
  }
}

void sub_237B2C888(_Unwind_Exception *a1)
{
}

uint64_t GnssHal::PlatformNvStore::writeBlobToDedicatedFile(uint64_t a1, const void **a2, uint64_t a3)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  if (*((char *)a2 + 23) >= 0) {
    size_t v5 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    size_t v5 = (size_t)a2[1];
  }
  int v6 = __p;
  std::string::basic_string[abi:ne180100]((uint64_t)__p, v5 + 4);
  if (v34 < 0) {
    int v6 = (void **)__p[0];
  }
  if (v5)
  {
    if (*((char *)a2 + 23) >= 0) {
      double v7 = a2;
    }
    else {
      double v7 = *a2;
    }
    memmove(v6, v7, v5);
  }
  strcpy((char *)v6 + v5, ".tmp");
  if (v34 >= 0) {
    int v8 = __p;
  }
  else {
    int v8 = (void **)__p[0];
  }
  int v9 = fopen((const char *)v8, "wb+");
  if (!v9)
  {
    uint64_t v18 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      if (*((char *)a2 + 23) >= 0) {
        uint64_t v19 = (void **)a2;
      }
      else {
        uint64_t v19 = (void **)*a2;
      }
      *(_DWORD *)std::mutex buf = 136446210;
      __int16 v36 = v19;
      uint64_t v15 = "NvStore,Failed to open dedicated tmp file,%{public}s";
      size_t v16 = v18;
      uint32_t v17 = 12;
      goto LABEL_38;
    }
    goto LABEL_39;
  }
  int __ptr = *(_DWORD *)(a3 + 8) - *(_DWORD *)a3;
  if (fwrite(&__ptr, 4uLL, 1uLL, v9) != 1 || (size_t v10 = fwrite(*(const void **)a3, 1uLL, __ptr, v9), v10 != __ptr))
  {
    __int16 v11 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      uint64_t v31 = __p;
      if (v34 < 0) {
        uint64_t v31 = (void **)__p[0];
      }
      *(_DWORD *)std::mutex buf = 136446466;
      __int16 v36 = v31;
      __int16 v37 = 1026;
      int v38 = __ptr;
      _os_log_error_impl(&dword_237AFF000, v11, OS_LOG_TYPE_ERROR, "NvStore,Failed to write to temp file,%{public}s,localNumByes,%{public}d", buf, 0x12u);
    }
  }
  if (fclose(v9))
  {
    uint64_t v13 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      int v14 = *__error();
      *(_DWORD *)std::mutex buf = 67240192;
      LODWORD(v36) = v14;
      uint64_t v15 = "NvStore,Failed to close temp file,%{public}d";
      size_t v16 = v13;
      uint32_t v17 = 8;
LABEL_38:
      _os_log_error_impl(&dword_237AFF000, v16, OS_LOG_TYPE_ERROR, v15, buf, v17);
      goto LABEL_39;
    }
    goto LABEL_39;
  }
  if (v34 >= 0) {
    uint64_t v20 = (const std::__fs::filesystem::path *)__p;
  }
  else {
    uint64_t v20 = (const std::__fs::filesystem::path *)__p[0];
  }
  if (*((char *)a2 + 23) >= 0) {
    double v21 = (const std::__fs::filesystem::path *)a2;
  }
  else {
    double v21 = (const std::__fs::filesystem::path *)*a2;
  }
  rename(v20, v21, v12);
  if (v22)
  {
    uint64_t v23 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      int v24 = *((char *)a2 + 23);
      __int16 v25 = (void **)*a2;
      __int16 v26 = __error();
      if (v24 >= 0) {
        int v27 = (void **)a2;
      }
      else {
        int v27 = v25;
      }
      int v28 = *v26;
      *(_DWORD *)std::mutex buf = 136446466;
      __int16 v36 = v27;
      __int16 v37 = 1026;
      int v38 = v28;
      uint64_t v15 = "NvStore,Failed to move temp file to primary dedicated,%{public}s,%{public}d";
      size_t v16 = v23;
      uint32_t v17 = 18;
      goto LABEL_38;
    }
LABEL_39:
    uint64_t v29 = 0;
    goto LABEL_40;
  }
  uint64_t v29 = 1;
LABEL_40:
  if (v34 < 0) {
    operator delete(__p[0]);
  }
  return v29;
}

void sub_237B2CBD4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

BOOL GnssHal::PlatformNvStore::existsInCache(GnssHal::PlatformNvStore *this, const GnssHal::PlatformNvStore::Cache *a2, uint64_t a3)
{
  uint64_t v3 = *((unsigned int *)a2 + 6);
  if ((int)v3 < 1) {
    return 0;
  }
  uint64_t v5 = 0;
  while (1)
  {
    uint64_t v6 = *(void *)(*((void *)a2 + 2) + 8 * v5);
    if (*(void *)(v6 + 16) == a3) {
      break;
    }
    if (v3 == ++v5) {
      return 0;
    }
  }
  if ((int)v3 <= (int)v5)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)v10);
    uint64_t v6 = *(void *)(*((void *)a2 + 2) + 8 * v5);
  }
  uint64_t v8 = *(void *)(v6 + 24);
  if (*(char *)(v8 + 23) < 0) {
    uint64_t v9 = *(void *)(v8 + 8);
  }
  else {
    uint64_t v9 = *(unsigned __int8 *)(v8 + 23);
  }
  return v9 != 0;
}

void sub_237B2CCD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)va);
  _Unwind_Resume(a1);
}

BOOL GnssHal::PlatformNvStore::storeToCache(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v7 = *(unsigned int *)(a2 + 24);
  uint64_t v8 = (int)v7;
  if ((int)v7 >= 1)
  {
    uint64_t v9 = 0;
    while (1)
    {
      uint64_t v10 = *(void *)(*(void *)(a2 + 16) + 8 * v9);
      if (*(void *)(v10 + 16) == a3) {
        break;
      }
      if (v7 == ++v9) {
        goto LABEL_5;
      }
    }
    if ((int)v7 <= (int)v9)
    {
      wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
      wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
      wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
      wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)buf);
      uint64_t v10 = *(void *)(*(void *)(a2 + 16) + 8 * v9);
    }
    uint64_t v17 = *(void *)(v10 + 24);
    if (*(char *)(v17 + 23) < 0) {
      uint64_t v18 = *(void *)(v17 + 8);
    }
    else {
      uint64_t v18 = *(unsigned __int8 *)(v17 + 23);
    }
    uint64_t v11 = *(void *)(a2 + 80) + *(void *)(a4 + 8) - (v18 + *(void *)a4);
    if (v11 < 8000000)
    {
      *(void *)(a2 + 80) = v11;
      GnssHal::PlatformNvStore::storeToProtobuf(a1, v10, a3, (gpsd::util **)a4);
      return 1;
    }
    uint64_t v15 = GpsdLogObjectGeneral;
    BOOL result = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
LABEL_23:
    *(_DWORD *)std::mutex buf = 134349312;
    uint64_t v22 = v11;
    __int16 v23 = 2050;
    uint64_t v24 = 8000000;
    _os_log_error_impl(&dword_237AFF000, v15, OS_LOG_TYPE_ERROR, "NvStore,NV_LIMIT_TOTAL_SIZE reached,%{public}lld,%{public}lld", buf, 0x16u);
    return 0;
  }
LABEL_5:
  uint64_t v11 = *(void *)(a4 + 8) - *(void *)a4 + *(void *)(a2 + 80);
  if (v11 < 8000000)
  {
    *(void *)(a2 + 80) = v11;
    int v12 = *(_DWORD *)(a2 + 28);
    if ((int)v8 >= v12)
    {
      if (v12 == *(_DWORD *)(a2 + 32))
      {
        wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase *)(a2 + 16));
        int v12 = *(_DWORD *)(a2 + 28);
      }
      *(_DWORD *)(a2 + 28) = v12 + 1;
      wireless_diagnostics::google::protobuf::internal::GenericTypeHandler<proto::gnsshal::NvStoreItem>::New();
    }
    uint64_t v13 = *(void *)(a2 + 16);
    *(_DWORD *)(a2 + 24) = v8 + 1;
    uint64_t v14 = *(void *)(v13 + 8 * v8);
    *(_DWORD *)(v14 + 64) |= 8u;
    *(void *)(v14 + 32) = 0;
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    *(_DWORD *)(v14 + 64) |= 0x10u;
    *(CFAbsoluteTime *)(v14 + 40) = Current;
    GnssHal::PlatformNvStore::storeToProtobuf(v20, v14, a3, (gpsd::util **)a4);
    return 1;
  }
  uint64_t v15 = GpsdLogObjectGeneral;
  BOOL result = os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR);
  if (result) {
    goto LABEL_23;
  }
  return result;
}

void sub_237B2CF94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)va);
  _Unwind_Resume(a1);
}

uint64_t GnssHal::PlatformNvStore::writeCacheToDisk(GnssHal::PlatformNvStore *this, const GnssHal::PlatformNvStore::Cache *a2)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  size_t v2 = *((unsigned __int8 *)a2 + 79);
  char v3 = v2;
  size_t v4 = *((void *)a2 + 8);
  if ((v2 & 0x80u) == 0) {
    uint64_t v5 = *((unsigned __int8 *)a2 + 79);
  }
  else {
    uint64_t v5 = *((void *)a2 + 8);
  }
  if (!v5) {
    return 1;
  }
  uint64_t v7 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)std::mutex buf = 0;
    _os_log_impl(&dword_237AFF000, v7, OS_LOG_TYPE_DEFAULT, "NvStore,writeCacheToDisk", buf, 2u);
    size_t v2 = *((unsigned __int8 *)a2 + 79);
    size_t v4 = *((void *)a2 + 8);
    char v3 = *((unsigned char *)a2 + 79);
  }
  if (v3 >= 0) {
    size_t v8 = v2;
  }
  else {
    size_t v8 = v4;
  }
  uint64_t v9 = v34;
  std::string::basic_string[abi:ne180100]((uint64_t)v34, v8 + 4);
  if (v35 < 0) {
    uint64_t v9 = (void **)v34[0];
  }
  if (v8)
  {
    if (*((char *)a2 + 79) >= 0) {
      uint64_t v10 = (char *)a2 + 56;
    }
    else {
      uint64_t v10 = (char *)*((void *)a2 + 7);
    }
    memmove(v9, v10, v8);
  }
  strcpy((char *)v9 + v8, ".tmp");
  if (*((char *)a2 + 79) >= 0) {
    size_t v11 = *((unsigned __int8 *)a2 + 79);
  }
  else {
    size_t v11 = *((void *)a2 + 8);
  }
  int v12 = __p;
  std::string::basic_string[abi:ne180100]((uint64_t)__p, v11 + 4);
  if (v33 < 0) {
    int v12 = (void **)__p[0];
  }
  if (v11)
  {
    if (*((char *)a2 + 79) >= 0) {
      uint64_t v13 = (char *)a2 + 56;
    }
    else {
      uint64_t v13 = (char *)*((void *)a2 + 7);
    }
    memmove(v12, v13, v11);
  }
  strcpy((char *)v12 + v11, ".bak");
  if (v35 >= 0) {
    uint64_t v14 = v34;
  }
  else {
    uint64_t v14 = (void **)v34[0];
  }
  unlink((const char *)v14);
  if (v35 >= 0) {
    uint64_t v15 = v34;
  }
  else {
    uint64_t v15 = (void **)v34[0];
  }
  size_t v16 = fopen((const char *)v15, "wb+");
  uint64_t v31 = v16;
  if (v16)
  {
    gpsd::util::changeFileToClassD(v16, v17);
    wireless_diagnostics::google::protobuf::MessageLite::SerializeToString();
    uint64_t v20 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      int v23 = *((_DWORD *)a2 + 10);
      int v24 = *((_DWORD *)a2 + 6);
      int v25 = proto::gnsshal::NvStore::ByteSize(a2, v21);
      *(_DWORD *)std::mutex buf = 134349824;
      __int16 v37 = 0;
      __int16 v38 = 1026;
      *(_DWORD *)uint64_t v39 = v23;
      *(_WORD *)&v39[4] = 1026;
      *(_DWORD *)&v39[6] = v24;
      __int16 v40 = 1026;
      int v41 = v25;
      _os_log_error_impl(&dword_237AFF000, v20, OS_LOG_TYPE_ERROR, "NvStore,Could not serialize to string,stringSize,%{public}zu,cacheVer,%{public}d,cacheNum,%{public}d,cacheBytes,%{public}d", buf, 0x1Eu);
    }
  }
  else
  {
    uint64_t v18 = __error();
    uint64_t v19 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      int v26 = *v18;
      int v27 = v35;
      int v28 = (void **)v34[0];
      uint64_t v29 = strerror(v26);
      uint64_t v30 = v34;
      if (v27 < 0) {
        uint64_t v30 = v28;
      }
      *(_DWORD *)std::mutex buf = 136446466;
      __int16 v37 = v30;
      __int16 v38 = 2082;
      *(void *)uint64_t v39 = v29;
      _os_log_error_impl(&dword_237AFF000, v19, OS_LOG_TYPE_ERROR, "NvStore,Failed to open temp file,%{public}s,%{public}s", buf, 0x16u);
    }
  }
  std::unique_ptr<__sFILE,GnssHal::PlatformNvStore::writeCacheToDisk(GnssHal::PlatformNvStore::Cache const&,BOOL)::$_0>::reset[abi:ne180100](&v31);
  if (v33 < 0) {
    operator delete(__p[0]);
  }
  if (v35 < 0) {
    operator delete(v34[0]);
  }
  return 0;
}

void sub_237B2D664(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, FILE *a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  std::unique_ptr<__sFILE,GnssHal::PlatformNvStore::writeCacheToDisk(GnssHal::PlatformNvStore::Cache const&,BOOL)::$_0>::reset[abi:ne180100](&a15);
  if (a21 < 0) {
    operator delete(a16);
  }
  if (a27 < 0) {
    operator delete(a22);
  }
  _Unwind_Resume(a1);
}

void GnssHal::PlatformNvStore::printState(GnssHal::PlatformNvStore *this, const GnssHal::PlatformNvStore::Cache *a2)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  char v3 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v19 = (char *)a2 + 56;
    uint64_t v20 = *((void *)a2 + 10);
    if (*((char *)a2 + 79) < 0) {
      uint64_t v19 = (char *)*((void *)a2 + 7);
    }
    *(_DWORD *)std::mutex buf = 134218242;
    uint64_t v22 = v20;
    __int16 v23 = 2080;
    int v24 = v19;
    _os_log_debug_impl(&dword_237AFF000, v3, OS_LOG_TYPE_DEBUG, "NvStore,printState,currentSize,%lld,filePath,%s", buf, 0x16u);
  }
  if (*((int *)a2 + 6) < 1)
  {
    uint64_t v18 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)std::mutex buf = 0;
      _os_log_debug_impl(&dword_237AFF000, v18, OS_LOG_TYPE_DEBUG, "NvStore,printState,empty", buf, 2u);
    }
  }
  else
  {
    double Current = CFAbsoluteTimeGetCurrent();
    int v5 = *((_DWORD *)a2 + 6);
    if (v5 >= 1)
    {
      double v6 = Current;
      uint64_t v7 = 0;
      size_t v8 = GpsdLogObjectGeneral;
      do
      {
        uint64_t v9 = *(void *)(*((void *)a2 + 2) + 8 * v7);
        uint64_t v10 = *(void *)(v9 + 16);
        if (v10 <= 0x7FFFFFFF) {
          uint64_t v11 = *(void *)(v9 + 16);
        }
        else {
          uint64_t v11 = v10 - 0x7FFFFFFF;
        }
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v12 = *(void *)(v9 + 24);
          if (*(char *)(v12 + 23) < 0) {
            uint64_t v13 = *(char **)(v12 + 8);
          }
          else {
            uint64_t v13 = (char *)*(unsigned __int8 *)(v12 + 23);
          }
          int v14 = *(_DWORD *)(v9 + 56);
          double v15 = v6 - *(double *)(v9 + 40);
          double v16 = v6 - *(double *)(v9 + 48);
          uint64_t v17 = *(void *)(v9 + 32);
          *(_DWORD *)std::mutex buf = 134219264;
          uint64_t v22 = v11;
          __int16 v23 = 2048;
          int v24 = v13;
          __int16 v25 = 1024;
          int v26 = v14;
          __int16 v27 = 2048;
          double v28 = v15;
          __int16 v29 = 2048;
          double v30 = v16;
          __int16 v31 = 2048;
          uint64_t v32 = v17;
          _os_log_debug_impl(&dword_237AFF000, v8, OS_LOG_TYPE_DEBUG, "NvStore,printState,id,%lld,size,%zu,hash,%x,createAgeSeconds,%.1f,modAgeSeconds,%.1f,modCount,%lld", buf, 0x3Au);
          size_t v8 = GpsdLogObjectGeneral;
          int v5 = *((_DWORD *)a2 + 6);
        }
        ++v7;
      }
      while (v7 < v5);
    }
  }
}

uint64_t GnssHal::PlatformNvStore::clearFromCache(GnssHal::PlatformNvStore *this, GnssHal::PlatformNvStore::Cache *a2, uint64_t a3)
{
  uint64_t v3 = *((unsigned int *)a2 + 6);
  if ((int)v3 >= 1)
  {
    uint64_t v6 = 0;
    uint64_t v7 = *((void *)a2 + 2);
    while (1)
    {
      uint64_t v8 = *(void *)(v7 + 8 * v6);
      if (*(void *)(v8 + 16) == a3) {
        break;
      }
      if (v3 == ++v6) {
        return 1;
      }
    }
    if ((int)v3 <= (int)v6)
    {
      wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
      wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
      wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
      wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)buf);
      uint64_t v8 = *(void *)(*((void *)a2 + 2) + 8 * v6);
    }
    uint64_t v9 = *(void *)(v8 + 24);
    if (*(char *)(v9 + 23) < 0) {
      uint64_t v10 = *(void *)(v9 + 8);
    }
    else {
      uint64_t v10 = *(unsigned __int8 *)(v9 + 23);
    }
    *((void *)a2 + 10) -= v10;
    *(void *)std::mutex buf = 0;
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    GnssHal::PlatformNvStore::storeToProtobuf((uint64_t)this, v8, a3, (gpsd::util **)buf);
    if ((GnssHal::PlatformNvStore::writeCacheToDisk(v11, a2) & 1) == 0)
    {
      uint64_t v12 = GpsdLogObjectWarning;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectWarning, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)std::mutex buf = 0;
        _os_log_impl(&dword_237AFF000, v12, OS_LOG_TYPE_DEFAULT, "NvStore,clearFromCache,writeCacheToDisk failed", buf, 2u);
      }
    }
  }
  return 1;
}

void sub_237B2DA7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)va);
  _Unwind_Resume(a1);
}

void GnssHal::PlatformNvStore::storeToProtobuf(uint64_t a1, uint64_t a2, uint64_t a3, gpsd::util **a4)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  *(_DWORD *)(a2 + 64) |= 1u;
  *(void *)(a2 + 16) = a3;
  int v6 = gpsd::util::truncatedSha256(*a4, (const void *)(a4[1] - *a4));
  int v7 = *(_DWORD *)(a2 + 64);
  *(_DWORD *)(a2 + 56) = v6;
  *(_DWORD *)(a2 + 64) = v7 | 6;
  uint64_t v8 = *(void *)(a2 + 24);
  if (v8 == MEMORY[0x263F8C740]) {
    operator new();
  }
  if (*(char *)(v8 + 23) < 0)
  {
    **(unsigned char **)uint64_t v8 = 0;
    *(void *)(v8 + 8) = 0;
  }
  else
  {
    *(unsigned char *)uint64_t v8 = 0;
    *(unsigned char *)(v8 + 23) = 0;
  }
  std::string::reserve((std::string *)v8, a4[1] - *a4);
  uint64_t v9 = *a4;
  uint64_t v10 = a4[1];
  while (v9 != v10)
  {
    std::string::value_type v11 = *(unsigned char *)v9;
    uint64_t v9 = (gpsd::util *)((char *)v9 + 1);
    std::string::push_back((std::string *)v8, v11);
  }
  uint64_t v12 = *(void *)(a2 + 32) + 1;
  *(_DWORD *)(a2 + 64) |= 8u;
  *(void *)(a2 + 32) = v12;
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  *(_DWORD *)(a2 + 64) |= 0x20u;
  *(CFAbsoluteTime *)(a2 + 48) = Current;
  int v14 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG))
  {
    int64_t v15 = a4[1] - *a4;
    uint64_t v16 = *(void *)(a2 + 24);
    if (*(char *)(v16 + 23) < 0) {
      uint64_t v17 = *(void *)(v16 + 8);
    }
    else {
      uint64_t v17 = *(unsigned __int8 *)(v16 + 23);
    }
    int v18 = *(_DWORD *)(a2 + 56);
    uint64_t v19 = *(void *)(a2 + 32);
    int v20 = 134218752;
    uint64_t v21 = v15;
    __int16 v22 = 2048;
    uint64_t v23 = v17;
    __int16 v24 = 1024;
    int v25 = v18;
    __int16 v26 = 2048;
    uint64_t v27 = v19;
    _os_log_debug_impl(&dword_237AFF000, v14, OS_LOG_TYPE_DEBUG, "NvStore,storeToProtobuf,source_size,%zu,dest_size,%zu,hash,%x,count,%lld", (uint8_t *)&v20, 0x26u);
  }
}

void std::unique_ptr<__sFILE,GnssHal::PlatformNvStore::writeCacheToDisk(GnssHal::PlatformNvStore::Cache const&,BOOL)::$_0>::reset[abi:ne180100](FILE **a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  size_t v2 = *a1;
  *a1 = 0;
  if (v2 && fclose(v2))
  {
    uint64_t v3 = GpsdLogObjectGeneral;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
    {
      int v4 = *__error();
      v5[0] = 67240192;
      v5[1] = v4;
      _os_log_error_impl(&dword_237AFF000, v3, OS_LOG_TYPE_ERROR, "NvStore,Failed to close file,%{public}d", (uint8_t *)v5, 8u);
    }
  }
}

void sub_237B2DD3C(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  __clang_call_terminate(a1);
}

uint64_t GnssHal::PlatformNvStore::readCacheFromFile(GnssHal::PlatformNvStore *a1, uint64_t a2, uint64_t *a3)
{
  v75[19] = *MEMORY[0x263EF8340];
  uint64_t v6 = MEMORY[0x263F8C308] + 64;
  v75[0] = MEMORY[0x263F8C308] + 64;
  int v7 = (void *)MEMORY[0x263F8C2A8];
  uint64_t v8 = *(void *)(MEMORY[0x263F8C2A8] + 16);
  v73[0] = *(void *)(MEMORY[0x263F8C2A8] + 8);
  *(void *)((char *)v73 + *(void *)(v73[0] - 24)) = v8;
  v73[1] = 0;
  uint64_t v9 = (std::ios_base *)((char *)v73 + *(void *)(v73[0] - 24));
  std::ios_base::init(v9, v74);
  uint64_t v10 = MEMORY[0x263F8C308] + 24;
  v9[1].__vftable = 0;
  v9[1].__fmtflags_ = -1;
  v73[0] = v10;
  v75[0] = v6;
  MEMORY[0x237E29680](v74);
  if (!std::filebuf::open()) {
    std::ios_base::clear((std::ios_base *)((char *)v73 + *(void *)(v73[0] - 24)), *(_DWORD *)&v74[*(void *)(v73[0] - 24) + 16] | 4);
  }
  if ((v74[*(void *)(v73[0] - 24) + 16] & 5) != 0)
  {
    std::string::value_type v11 = GpsdLogObjectGeneral;
    char v12 = 0;
    if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      if (*((char *)a3 + 23) >= 0) {
        uint64_t v13 = a3;
      }
      else {
        uint64_t v13 = (uint64_t *)*a3;
      }
      *(_DWORD *)std::mutex buf = 136315138;
      uint64_t v71 = v13;
      int v14 = "NvStore,readCacheFromFile,Could not open file,%s";
      int64_t v15 = buf;
LABEL_9:
      _os_log_impl(&dword_237AFF000, v11, OS_LOG_TYPE_DEFAULT, v14, v15, 0xCu);
LABEL_60:
      char v12 = 0;
      goto LABEL_61;
    }
    goto LABEL_61;
  }
  std::istream::seekg();
  std::istream::tellg();
  uint64_t v16 = GpsdLogObjectGeneral;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG))
  {
    if (*((char *)a3 + 23) >= 0) {
      std::string v48 = a3;
    }
    else {
      std::string v48 = (uint64_t *)*a3;
    }
    *(_DWORD *)std::string v62 = 136315394;
    *(void *)long long v63 = v48;
    *(_WORD *)&v63[8] = 1026;
    *(_DWORD *)&v63[10] = v72;
    _os_log_debug_impl(&dword_237AFF000, v16, OS_LOG_TYPE_DEBUG, "NvStore,readCacheFromFile,filePath,%s,size,%{public}d", v62, 0x12u);
  }
  std::istream::seekg();
  if (v72)
  {
    if (wireless_diagnostics::google::protobuf::Message::ParseFromIstream())
    {
      uint64_t v17 = GpsdLogObjectGeneral;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG))
      {
        int v49 = *(_DWORD *)(a2 + 24);
        *(_DWORD *)std::string v62 = 67240192;
        *(_DWORD *)long long v63 = v49;
        _os_log_debug_impl(&dword_237AFF000, v17, OS_LOG_TYPE_DEBUG, "NvStore,readCacheFromFile,items_size,%{public}d", v62, 8u);
      }
      GnssHal::PlatformNvStore::printState(a1, "post-parse of cache from file");
      int v18 = *(_DWORD *)(a2 + 40);
      if (v18 == 1)
      {
        *(void *)(a2 + 80) = 0;
        if (*(int *)(a2 + 24) < 1)
        {
          char v20 = 0;
        }
        else
        {
          uint64_t v19 = 0;
          char v20 = 0;
          BOOL v21 = 0;
          __int16 v22 = (void *)(a2 + 16);
          do
          {
            uint64_t v23 = *(void *)(*v22 + 8 * v19);
            uint64_t v24 = *(void *)(v23 + 24);
            if (*(char *)(v24 + 23) < 0) {
              uint64_t v25 = *(void *)(v24 + 8);
            }
            else {
              uint64_t v25 = *(unsigned __int8 *)(v24 + 23);
            }
            *(void *)(a2 + 80) += v25;
            BOOL v21 = v21 || (*(unsigned char *)(v23 + 64) & 1) == 0;
            int v26 = *(_DWORD *)(v23 + 56);
            int v27 = *(char *)(v24 + 23);
            if (v27 >= 0) {
              uint64_t v28 = (gpsd::util *)v24;
            }
            else {
              uint64_t v28 = *(gpsd::util **)v24;
            }
            if (v27 >= 0) {
              __int16 v29 = (const void *)*(unsigned __int8 *)(v24 + 23);
            }
            else {
              __int16 v29 = *(const void **)(v24 + 8);
            }
            int v30 = gpsd::util::truncatedSha256(v28, v29);
            if (v26 != v30)
            {
              if (v19 >= *(int *)(a2 + 24))
              {
                wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
                wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
                wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
                wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)v62);
              }
              uint64_t v31 = *(void *)(*v22 + 8 * v19);
              uint64_t v32 = GpsdLogObjectGeneral;
              if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_ERROR))
              {
                uint64_t v34 = *(void *)(v31 + 24);
                if (*(char *)(v34 + 23) < 0) {
                  uint64_t v35 = *(void *)(v34 + 8);
                }
                else {
                  uint64_t v35 = *(unsigned __int8 *)(v34 + 23);
                }
                int v36 = *(_DWORD *)(a2 + 24);
                uint64_t v37 = *(void *)(v31 + 16);
                *(_DWORD *)std::string v62 = 67241216;
                *(_DWORD *)long long v63 = v36;
                *(_WORD *)&v63[4] = 2050;
                *(void *)&v63[6] = v37;
                *(_WORD *)&v63[14] = 2050;
                *(void *)&v63[16] = v35;
                __int16 v64 = 1026;
                int v65 = v26;
                __int16 v66 = 1026;
                int v67 = v30;
                _os_log_error_impl(&dword_237AFF000, v32, OS_LOG_TYPE_ERROR, "NvStore,readCacheFromFile,hash does not match,items_size,%{public}d,itemId,%{public}lld,size,%{public}zu,storedHash,%{public}x,calculatedHash,%{public}x", v62, 0x28u);
              }
              *(_DWORD *)(v31 + 64) |= 2u;
              uint64_t v33 = *(void *)(v31 + 24);
              if (v33 == MEMORY[0x263F8C740]) {
                operator new();
              }
              if (*(char *)(v33 + 23) < 0)
              {
                **(unsigned char **)uint64_t v33 = 0;
                *(void *)(v33 + 8) = 0;
              }
              else
              {
                *(unsigned char *)uint64_t v33 = 0;
                *(unsigned char *)(v33 + 23) = 0;
              }
              char v20 = 1;
            }
            ++v19;
          }
          while (v19 < *(int *)(a2 + 24));
          if (v21)
          {
            proto::gnsshal::NvStore::NvStore((proto::gnsshal::NvStore *)v62, (const proto::gnsshal::NvStore *)a2);
            if (*(char *)(a2 + 79) < 0) {
              std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)(a2 + 56), *(void *)(a2 + 64));
            }
            else {
              std::string __p = *(std::string *)(a2 + 56);
            }
            uint64_t v69 = *(void *)(a2 + 80);
            wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Clear<wireless_diagnostics::google::protobuf::RepeatedPtrField<proto::gnsshal::NvStoreItem>::TypeHandler>(a2 + 16);
            if (*(int *)&v63[20] >= 1)
            {
              uint64_t v50 = 0;
              do
              {
                std::string v51 = *(proto::gnsshal::NvStoreItem **)(*(void *)&v63[12] + 8 * v50);
                if (*((unsigned char *)v51 + 64))
                {
                  int v53 = *(_DWORD *)(a2 + 28);
                  uint64_t v54 = *(int *)(a2 + 24);
                  if ((int)v54 >= v53)
                  {
                    if (v53 == *(_DWORD *)(a2 + 32))
                    {
                      wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase *)(a2 + 16));
                      int v53 = *(_DWORD *)(a2 + 28);
                    }
                    *(_DWORD *)(a2 + 28) = v53 + 1;
                    wireless_diagnostics::google::protobuf::internal::GenericTypeHandler<proto::gnsshal::NvStoreItem>::New();
                  }
                  uint64_t v55 = *(void *)(a2 + 16);
                  *(_DWORD *)(a2 + 24) = v54 + 1;
                  std::string v56 = *(proto::gnsshal::NvStoreItem **)(v55 + 8 * v54);
                  if (v51 != v56)
                  {
                    (*(void (**)(proto::gnsshal::NvStoreItem *))(*(void *)v56 + 32))(v56);
                    proto::gnsshal::NvStoreItem::MergeFrom(v56, v51);
                  }
                }
                else
                {
                  std::string v52 = GpsdLogObjectWarning;
                  if (os_log_type_enabled((os_log_t)GpsdLogObjectWarning, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)std::string v60 = 67240192;
                    int v61 = v50;
                    _os_log_impl(&dword_237AFF000, v52, OS_LOG_TYPE_DEFAULT, "NvStore,readCacheFromFile,Missing item id for index,%{public}d", v60, 8u);
                  }
                }
                ++v50;
              }
              while (v50 < *(int *)&v63[20]);
            }
            if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(__p.__r_.__value_.__l.__data_);
            }
            proto::gnsshal::NvStore::~NvStore((proto::gnsshal::NvStore *)v62);
          }
        }
        std::string v57 = GpsdLogObjectGeneral;
        if (os_log_type_enabled((os_log_t)GpsdLogObjectGeneral, OS_LOG_TYPE_DEBUG))
        {
          int v58 = *(_DWORD *)(a2 + 24);
          uint64_t v59 = *(void *)(a2 + 80);
          *(_DWORD *)std::string v62 = 67109376;
          *(_DWORD *)long long v63 = v58;
          *(_WORD *)&v63[4] = 2048;
          *(void *)&v63[6] = v59;
          _os_log_debug_impl(&dword_237AFF000, v57, OS_LOG_TYPE_DEBUG, "NvStore,readCacheFromFile,numItems,%d,totalSize,%lld", v62, 0x12u);
        }
        char v12 = v20 ^ 1;
        goto LABEL_61;
      }
      uint64_t v46 = GpsdLogObjectWarning;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectWarning, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)std::string v62 = 67240448;
        *(_DWORD *)long long v63 = v18;
        *(_WORD *)&v63[4] = 1026;
        *(_DWORD *)&v63[6] = 1;
        std::string v43 = "NvStore,readCacheFromFile,Unexpected version,%{public}d,Expected version,%{public}d";
        uint64_t v44 = v46;
        uint32_t v45 = 14;
LABEL_58:
        _os_log_impl(&dword_237AFF000, v44, OS_LOG_TYPE_DEFAULT, v43, v62, v45);
      }
    }
    else
    {
      uint64_t v39 = GpsdLogObjectWarning;
      if (os_log_type_enabled((os_log_t)GpsdLogObjectWarning, OS_LOG_TYPE_DEFAULT))
      {
        if (*((char *)a3 + 23) >= 0) {
          __int16 v40 = a3;
        }
        else {
          __int16 v40 = (uint64_t *)*a3;
        }
        int v41 = *(_DWORD *)(a2 + 40);
        int v42 = *(_DWORD *)(a2 + 24);
        *(_DWORD *)std::string v62 = 136315650;
        *(void *)long long v63 = v40;
        *(_WORD *)&v63[8] = 1024;
        *(_DWORD *)&v63[10] = v41;
        *(_WORD *)&v63[14] = 1024;
        *(_DWORD *)&v63[16] = v42;
        std::string v43 = "NvStore,readCacheFromFile,Could not parse message from file,%s,parsed_ver,%d,parsed_items_size,%d";
        uint64_t v44 = v39;
        uint32_t v45 = 24;
        goto LABEL_58;
      }
    }
    proto::gnsshal::NvStore::Clear((proto::gnsshal::NvStore *)a2);
    goto LABEL_60;
  }
  std::string::value_type v11 = GpsdLogObjectWarning;
  char v12 = 0;
  if (os_log_type_enabled((os_log_t)GpsdLogObjectWarning, OS_LOG_TYPE_DEFAULT))
  {
    if (*((char *)a3 + 23) >= 0) {
      __int16 v38 = a3;
    }
    else {
      __int16 v38 = (uint64_t *)*a3;
    }
    *(_DWORD *)std::string v62 = 136315138;
    *(void *)long long v63 = v38;
    int v14 = "NvStore,readCacheFromFile,Empty file,%s";
    int64_t v15 = v62;
    goto LABEL_9;
  }
LABEL_61:
  v73[0] = *v7;
  *(void *)((char *)v73 + *(void *)(v73[0] - 24)) = v7[3];
  MEMORY[0x237E29690](v74);
  std::istream::~istream();
  MEMORY[0x237E298C0](v75);
  return v12 & 1;
}

void sub_237B2E6E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45)
{
}

void std::__tree<std::__value_type<GnssHal::NvStorage::NamedType,std::string>,std::__map_value_compare<GnssHal::NvStorage::NamedType,std::__value_type<GnssHal::NvStorage::NamedType,std::string>,std::less<GnssHal::NvStorage::NamedType>,true>,std::allocator<std::__value_type<GnssHal::NvStorage::NamedType,std::string>>>::destroy(uint64_t a1, char *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<GnssHal::NvStorage::NamedType,std::string>,std::__map_value_compare<GnssHal::NvStorage::NamedType,std::__value_type<GnssHal::NvStorage::NamedType,std::string>,std::less<GnssHal::NvStorage::NamedType>,true>,std::allocator<std::__value_type<GnssHal::NvStorage::NamedType,std::string>>>::destroy(a1, *(void *)a2);
    std::__tree<std::__value_type<GnssHal::NvStorage::NamedType,std::string>,std::__map_value_compare<GnssHal::NvStorage::NamedType,std::__value_type<GnssHal::NvStorage::NamedType,std::string>,std::less<GnssHal::NvStorage::NamedType>,true>,std::allocator<std::__value_type<GnssHal::NvStorage::NamedType,std::string>>>::destroy(a1, *((void *)a2 + 1));
    if (a2[63] < 0) {
      operator delete(*((void **)a2 + 5));
    }
    operator delete(a2);
  }
}

void std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<char const*,char const*,std::back_insert_iterator<std::vector<unsigned char>>>(char *a1, char *a2, unint64_t *a3)
{
  if (a1 != a2)
  {
    int v5 = a1;
    uint64_t v6 = (unsigned char *)a3[1];
    do
    {
      char v7 = *v5;
      unint64_t v8 = a3[2];
      if ((unint64_t)v6 >= v8)
      {
        unint64_t v10 = *a3;
        std::string::value_type v11 = &v6[-*a3];
        unint64_t v12 = (unint64_t)(v11 + 1);
        if ((uint64_t)(v11 + 1) < 0) {
          std::vector<gnssTest::RfMeasurement>::__throw_length_error[abi:ne180100]();
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
          int64_t v15 = (char *)operator new(v14);
        }
        else {
          int64_t v15 = 0;
        }
        uint64_t v16 = &v11[(void)v15];
        uint64_t v17 = &v11[(void)v15];
        unsigned char *v17 = v7;
        uint64_t v9 = v17 + 1;
        if (v6 != (unsigned char *)v10)
        {
          int v18 = &v6[~v10];
          do
          {
            char v19 = *--v6;
            (v18--)[(void)v15] = v19;
          }
          while (v6 != (unsigned char *)v10);
          uint64_t v6 = (unsigned char *)*a3;
          uint64_t v16 = v15;
        }
        *a3 = (unint64_t)v16;
        a3[1] = (unint64_t)v9;
        a3[2] = (unint64_t)&v15[v14];
        if (v6) {
          operator delete(v6);
        }
      }
      else
      {
        unsigned char *v6 = v7;
        uint64_t v9 = v6 + 1;
      }
      a3[1] = (unint64_t)v9;
      ++v5;
      uint64_t v6 = v9;
    }
    while (v5 != a2);
  }
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x270ED7B28](data, *(void *)&len, md);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

void CFRelease(CFTypeRef cf)
{
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x270EE5180](theString, *(void *)&encoding);
}

CFUUIDRef CFUUIDGetConstantUUIDWithBytes(CFAllocatorRef alloc, UInt8 byte0, UInt8 byte1, UInt8 byte2, UInt8 byte3, UInt8 byte4, UInt8 byte5, UInt8 byte6, UInt8 byte7, UInt8 byte8, UInt8 byte9, UInt8 byte10, UInt8 byte11, UInt8 byte12, UInt8 byte13, UInt8 byte14, UInt8 byte15)
{
  return (CFUUIDRef)MEMORY[0x270EE5498](alloc, byte0, byte1, byte2, byte3, byte4, byte5, byte6);
}

CFUUIDBytes CFUUIDGetUUIDBytes(CFUUIDRef uuid)
{
  uint64_t v1 = MEMORY[0x270EE54A8](uuid);
  result.byte8 = v2;
  result.byte9 = BYTE1(v2);
  result.byte10 = BYTE2(v2);
  result.byte11 = BYTE3(v2);
  result.byte12 = BYTE4(v2);
  result.byte13 = BYTE5(v2);
  result.byte14 = BYTE6(v2);
  result.byte15 = HIBYTE(v2);
  result.byte0 = v1;
  result.byte1 = BYTE1(v1);
  result.byte2 = BYTE2(v1);
  result.byte3 = BYTE3(v1);
  result.byte4 = BYTE4(v1);
  result.byte5 = BYTE5(v1);
  result.byte6 = BYTE6(v1);
  result.byte7 = HIBYTE(v1);
  return result;
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x270EF3F38](*(void *)&connection, *(void *)&selector, input, *(void *)&inputCnt, output, outputCnt);
}

kern_return_t IOCreatePlugInInterfaceForService(io_service_t service, CFUUIDRef pluginType, CFUUIDRef interfaceType, IOCFPlugInInterface ***theInterface, SInt32 *theScore)
{
  return MEMORY[0x270EF3FC8](*(void *)&service, pluginType, interfaceType, theInterface, theScore);
}

kern_return_t IODestroyPlugInInterface(IOCFPlugInInterface **interface)
{
  return MEMORY[0x270EF4008](interface);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x270EF4790](*(void *)&iterator);
}

kern_return_t IOMainPort(mach_port_t bootstrapPort, mach_port_t *mainPort)
{
  return MEMORY[0x270EF47A8](*(void *)&bootstrapPort, mainPort);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x270EF47B8](*(void *)&mainPort);
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x270EF4820](*(void *)&object);
}

kern_return_t IORegistryEntryGetChildEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *child)
{
  return MEMORY[0x270EF49F0](*(void *)&entry, plane, child);
}

kern_return_t IOServiceAddInterestNotification(IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return MEMORY[0x270EF4A80](notifyPort, *(void *)&service, interestType, callback, refCon, notification);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x270EF4A98](*(void *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x270EF4AB0](*(void *)&mainPort, matching);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x270EF4AB8](*(void *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4AD0](name);
}

CFMutableDictionaryRef IOServiceNameMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4AD8](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x270EF4AE0](*(void *)&service, *(void *)&owningTask, *(void *)&type, connect);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

uint64_t MGGetProductType()
{
  return MEMORY[0x270F95FD8]();
}

uint64_t MGIsDeviceOfType()
{
  return MEMORY[0x270F96008]();
}

void NSLog(NSString *format, ...)
{
}

uint64_t TelephonyBasebandPCITransportCreate()
{
  return MEMORY[0x270F964F0]();
}

uint64_t TelephonyBasebandPCITransportInitParameters()
{
  return MEMORY[0x270F964F8]();
}

uint64_t TelephonyBasebandPCITransportTimesync()
{
  return MEMORY[0x270F96518]();
}

uint64_t TelephonyUtilTransportFree()
{
  return MEMORY[0x270F97228]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t wireless_diagnostics::google::protobuf::DescriptorPool::generated_pool(wireless_diagnostics::google::protobuf::DescriptorPool *this)
{
  return MEMORY[0x270F9B118](this);
}

uint64_t wireless_diagnostics::google::protobuf::DescriptorPool::InternalAddGeneratedFile(wireless_diagnostics::google::protobuf::DescriptorPool *this, const void *a2)
{
  return MEMORY[0x270F9B120](this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::MessageFactory::generated_factory(wireless_diagnostics::google::protobuf::MessageFactory *this)
{
  return MEMORY[0x270F9B128](this);
}

uint64_t wireless_diagnostics::google::protobuf::MessageFactory::InternalRegisterGeneratedFile()
{
  return MEMORY[0x270F9B130]();
}

uint64_t wireless_diagnostics::google::protobuf::MessageFactory::InternalRegisterGeneratedMessage()
{
  return MEMORY[0x270F9B138]();
}

uint64_t wireless_diagnostics::google::protobuf::UnknownFieldSet::MergeFrom()
{
  return MEMORY[0x270F9B150]();
}

uint64_t wireless_diagnostics::google::protobuf::UnknownFieldSet::UnknownFieldSet(wireless_diagnostics::google::protobuf::UnknownFieldSet *this)
{
  return MEMORY[0x270F9B158](this);
}

void wireless_diagnostics::google::protobuf::UnknownFieldSet::~UnknownFieldSet(wireless_diagnostics::google::protobuf::UnknownFieldSet *this)
{
}

uint64_t wireless_diagnostics::google::protobuf::GoogleOnceInitImpl()
{
  return MEMORY[0x270F9AC48]();
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadTagFallback(wireless_diagnostics::google::protobuf::io::CodedInputStream *this)
{
  return MEMORY[0x270F9AC78](this);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, unsigned int *a2)
{
  return MEMORY[0x270F9AC80](this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Fallback(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, unint64_t *a2)
{
  return MEMORY[0x270F9AC88](this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian64Fallback(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, unint64_t *a2)
{
  return MEMORY[0x270F9AC98](this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::PopLimit(wireless_diagnostics::google::protobuf::io::CodedInputStream *this)
{
  return MEMORY[0x270F9ACB8](this);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(wireless_diagnostics::google::protobuf::io::CodedInputStream *this)
{
  return MEMORY[0x270F9ACC0](this);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize64(wireless_diagnostics::google::protobuf::io::CodedOutputStream *this)
{
  return MEMORY[0x270F9ACE0](this);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteRawToArray(wireless_diagnostics::google::protobuf::io::CodedOutputStream *this, const void *a2, uint64_t a3, unsigned __int8 *a4)
{
  return MEMORY[0x270F9ACF8](this, a2, a3, a4);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(wireless_diagnostics::google::protobuf::io::CodedOutputStream *this)
{
  return MEMORY[0x270F9AD10](this);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint64ToArray(wireless_diagnostics::google::protobuf::io::CodedOutputStream *this, uint64_t a2, unsigned __int8 *a3)
{
  return MEMORY[0x270F9AD18](this, a2, a3);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32FallbackToArray(wireless_diagnostics::google::protobuf::io::CodedOutputStream *this, uint64_t a2, unsigned __int8 *a3)
{
  return MEMORY[0x270F9AD20](this, a2, a3);
}

uint64_t wireless_diagnostics::google::protobuf::Message::ParseFromIstream()
{
  return MEMORY[0x270F9B168]();
}

void wireless_diagnostics::google::protobuf::Message::~Message(wireless_diagnostics::google::protobuf::Message *this)
{
}

uint64_t wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage()
{
  return MEMORY[0x270F9AD78]();
}

void wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage(wireless_diagnostics::google::protobuf::internal::LogMessage *this)
{
}

uint64_t wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<()
{
  return MEMORY[0x270F9AD88]();
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormat::ComputeUnknownFieldsSize(wireless_diagnostics::google::protobuf::internal::WireFormat *this, const wireless_diagnostics::google::protobuf::UnknownFieldSet *a2)
{
  return MEMORY[0x270F9B180](this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormat::SkipField(wireless_diagnostics::google::protobuf::internal::WireFormat *this, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2, uint64_t a3, wireless_diagnostics::google::protobuf::UnknownFieldSet *a4)
{
  return MEMORY[0x270F9B190](this, a2, a3, a4);
}

uint64_t wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=()
{
  return MEMORY[0x270F9ADA8]();
}

uint64_t wireless_diagnostics::google::protobuf::internal::ReflectionOps::Merge(wireless_diagnostics::google::protobuf::internal::ReflectionOps *this, const wireless_diagnostics::google::protobuf::Message *a2, wireless_diagnostics::google::protobuf::Message *a3)
{
  return MEMORY[0x270F9B198](this, a2, a3);
}

uint64_t wireless_diagnostics::google::protobuf::internal::VerifyVersion(wireless_diagnostics::google::protobuf::internal *this, uint64_t a2, uint64_t a3, const char *a4)
{
  return MEMORY[0x270F9AEF0](this, a2, a3, a4);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteBytes()
{
  return MEMORY[0x270F9AF00]();
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteInt32(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, uint64_t a2, uint64_t a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  return MEMORY[0x270F9AF18](this, a2, a3, a4);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteInt64(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, uint64_t a2, uint64_t a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  return MEMORY[0x270F9AF20](this, a2, a3, a4);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteDouble(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, uint64_t a2, double a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  return MEMORY[0x270F9AF28](this, a2, a4, a3);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt32(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, uint64_t a2, uint64_t a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  return MEMORY[0x270F9AF48](this, a2, a3, a4);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteMessageMaybeToArray()
{
  return MEMORY[0x270F9AF88]();
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::ReadBytes()
{
  return MEMORY[0x270F9AF90]();
}

void wireless_diagnostics::google::protobuf::internal::FunctionClosure0::~FunctionClosure0(wireless_diagnostics::google::protobuf::internal::FunctionClosure0 *this)
{
}

uint64_t wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Swap()
{
  return MEMORY[0x270F9AFC0]();
}

uint64_t wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve(wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase *this)
{
  return MEMORY[0x270F9AFC8](this);
}

uint64_t wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection::GeneratedMessageReflection()
{
  return MEMORY[0x270F9B1A0]();
}

uint64_t wireless_diagnostics::google::protobuf::MessageLite::SerializeToString()
{
  return MEMORY[0x270F9B020]();
}

uint64_t wireless_diagnostics::google::protobuf::DescriptorPool::FindFileByName()
{
  return MEMORY[0x270F9B1A8]();
}

std::string::size_type std::string::find(const std::string *this, std::string::value_type __c, std::string::size_type __pos)
{
  return MEMORY[0x270F98238](this, __c, __pos);
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

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const std::logic_error *a2)
{
  return (std::logic_error *)MEMORY[0x270F98340](this, a2);
}

std::exception_ptr *__cdecl std::exception_ptr::exception_ptr(std::exception_ptr *this, const std::exception_ptr *a2)
{
  return (std::exception_ptr *)MEMORY[0x270F98398](this, a2);
}

void std::exception_ptr::~exception_ptr(std::exception_ptr *this)
{
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
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

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x270F984B8](this, __s);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984C0](this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x270F984E0](this, __pos, __s);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
}

std::string *__cdecl std::string::replace(std::string *this, std::string::size_type __pos, std::string::size_type __n1, const std::string::value_type *__s, std::string::size_type __n2)
{
  return (std::string *)MEMORY[0x270F98508](this, __pos, __n1, __s, __n2);
}

void std::string::reserve(std::string *this, std::string::size_type __requested_capacity)
{
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
}

std::string *__cdecl std::string::basic_string(std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n, std::allocator<char> *__a)
{
  return (std::string *)MEMORY[0x270F98548](this, __str, __pos, __n, __a);
}

void std::string::~string(std::string *this)
{
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x270F98560](this, __str);
}

std::future_error *__cdecl std::future_error::future_error(std::future_error *this, std::error_code __ec)
{
  return (std::future_error *)MEMORY[0x270F985E0](this, *(void *)&__ec.__val_, __ec.__cat_);
}

void std::future_error::~future_error(std::future_error *this)
{
}

uint64_t std::filebuf::open()
{
  return MEMORY[0x270F98638]();
}

uint64_t std::filebuf::close()
{
  return MEMORY[0x270F98640]();
}

uint64_t std::filebuf::basic_filebuf()
{
  return MEMORY[0x270F98650]();
}

uint64_t std::filebuf::~filebuf()
{
  return MEMORY[0x270F98658]();
}

uint64_t std::istream::seekg()
{
  return MEMORY[0x270F98690]();
}

uint64_t std::istream::tellg()
{
  return MEMORY[0x270F98698]();
}

uint64_t std::istream::sentry::sentry()
{
  return MEMORY[0x270F986B0]();
}

uint64_t std::istream::~istream()
{
  return MEMORY[0x270F986D0]();
}

uint64_t std::istream::operator>>()
{
  return MEMORY[0x270F986F8]();
}

uint64_t std::ostream::flush()
{
  return MEMORY[0x270F98748]();
}

uint64_t std::ostream::write()
{
  return MEMORY[0x270F98750]();
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
  return MEMORY[0x270F987C0]();
}

void std::__shared_count::~__shared_count(std::__shared_count *this)
{
}

uint64_t std::ofstream::open()
{
  return MEMORY[0x270F98880]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x270F988A8]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x270F988B0]();
}

const std::error_category *std::future_category(void)
{
  return (const std::error_category *)MEMORY[0x270F988E0]();
}

void std::__assoc_sub_state::__sub_wait(std::__assoc_sub_state *this, std::unique_lock<std::mutex> *__lk)
{
}

void std::__assoc_sub_state::set_exception(std::__assoc_sub_state *this, std::exception_ptr __p)
{
}

void std::condition_variable::notify_all(std::condition_variable *this)
{
}

void std::condition_variable::notify_one(std::condition_variable *this)
{
}

void std::condition_variable::__do_timed_wait(std::condition_variable *this, std::unique_lock<std::mutex> *__lk, std::chrono::time_point<std::chrono::system_clock, std::chrono::duration<long long, std::ratio<1, 1000000000>>> a3)
{
}

void std::condition_variable::wait(std::condition_variable *this, std::unique_lock<std::mutex> *__lk)
{
}

void std::condition_variable::~condition_variable(std::condition_variable *this)
{
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
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

std::chrono::steady_clock::time_point std::chrono::steady_clock::now(void)
{
  return (std::chrono::steady_clock::time_point)MEMORY[0x270F98C18]();
}

std::chrono::system_clock::time_point std::chrono::system_clock::now(void)
{
  return (std::chrono::system_clock::time_point)MEMORY[0x270F98C28]();
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

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x270F98E08](retstr, *(void *)&__val);
}

uint64_t std::operator+<char>()
{
  return MEMORY[0x270F98E38]();
}

void std::exception::~exception(std::exception *this)
{
}

std::exception_ptr std::current_exception(void)
{
  return (std::exception_ptr)MEMORY[0x270F98E98]();
}

void std::rethrow_exception(std::exception_ptr a1)
{
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

int __darwin_check_fd_set_overflow(int a1, const void *a2, int a3)
{
  return MEMORY[0x270ED7DA8](*(void *)&a1, a2, *(void *)&a3);
}

void *__dynamic_cast(const void *lpsrc, const struct __class_type_info *lpstype, const struct __class_type_info *lpdtype, ptrdiff_t s2d)
{
  return (void *)MEMORY[0x270F98F30](lpsrc, lpstype, lpdtype, s2d);
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
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

int atoi(const char *a1)
{
  return MEMORY[0x270ED86E8](a1);
}

void bzero(void *a1, size_t a2)
{
}

void cfmakeraw(termios *a1)
{
}

int cfsetspeed(termios *a1, speed_t a2)
{
  return MEMORY[0x270ED8EA8](a1, a2);
}

int chmod(const char *a1, mode_t a2)
{
  return MEMORY[0x270ED8EC8](a1, a2);
}

int clock_gettime(clockid_t __clock_id, timespec *__tp)
{
  return MEMORY[0x270ED8EF0](*(void *)&__clock_id, __tp);
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

compression_status compression_stream_destroy(compression_stream *stream)
{
  return MEMORY[0x270F98F68](stream);
}

compression_status compression_stream_init(compression_stream *stream, compression_stream_operation operation, compression_algorithm algorithm)
{
  return MEMORY[0x270F98F78](stream, *(void *)&operation, *(void *)&algorithm);
}

compression_status compression_stream_process(compression_stream *stream, int flags)
{
  return MEMORY[0x270F98F80](stream, *(void *)&flags);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return MEMORY[0x270ED95B8](when, delta);
}

int dlclose(void *__handle)
{
  return MEMORY[0x270ED9618](__handle);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x270ED9628](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

void exit(int a1)
{
}

int fclose(FILE *a1)
{
  return MEMORY[0x270ED98C8](a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x270ED98D0](*(void *)&a1, *(void *)&a2);
}

int feof(FILE *a1)
{
  return MEMORY[0x270ED9910](a1);
}

char *__cdecl fgets(char *a1, int a2, FILE *a3)
{
  return (char *)MEMORY[0x270ED9968](a1, *(void *)&a2, a3);
}

int fileno(FILE *a1)
{
  return MEMORY[0x270ED9978](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x270ED99F0](__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9A28](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9B88](__ptr, __size, __nitems, __stream);
}

tm *__cdecl gmtime(const time_t *a1)
{
  return (tm *)MEMORY[0x270ED9DD8](a1);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return MEMORY[0x270ED9ED8](*(void *)&a1, a2);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x270EDA158]();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x270EDA168](*(void *)&error_value);
}

uint64_t mach_get_times()
{
  return MEMORY[0x270EDA170]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
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

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x270EDA518](a1, a2);
}

time_t mktime(tm *a1)
{
  return MEMORY[0x270EDA588](a1);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

void objc_copyCppObjectAtomic(void *dest, const void *src, void (__cdecl *copyHelper)(void *, const void *))
{
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

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x270EDAB40]();
}

int pclose(FILE *a1)
{
  return MEMORY[0x270EDAC08](a1);
}

FILE *__cdecl popen(const char *a1, const char *a2)
{
  return (FILE *)MEMORY[0x270EDAC48](a1, a2);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x270EDB120](*(void *)&a1, a2, a3);
}

BOOL remove(const std::__fs::filesystem::path *__p, std::error_code *__ec)
{
  return MEMORY[0x270EDB1E8](__p, __ec);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
}

int select(int a1, fd_set *a2, fd_set *a3, fd_set *a4, timeval *a5)
{
  return MEMORY[0x270EDB328](*(void *)&a1, a2, a3, a4, a5);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x270EDB508](*(void *)&a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x270EDB568](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return MEMORY[0x270EDB5F0](a1, a2, a3, a4);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

char *__cdecl strptime(const char *a1, const char *a2, tm *a3)
{
  return (char *)MEMORY[0x270EDB670](a1, a2, a3);
}

int tcflush(int a1, int a2)
{
  return MEMORY[0x270EDB8C0](*(void *)&a1, *(void *)&a2);
}

int tcgetattr(int a1, termios *a2)
{
  return MEMORY[0x270EDB8C8](*(void *)&a1, a2);
}

int tcsetattr(int a1, int a2, const termios *a3)
{
  return MEMORY[0x270EDB8D0](*(void *)&a1, *(void *)&a2, a3);
}

time_t time(time_t *a1)
{
  return MEMORY[0x270EDB930](a1);
}

int unlink(const char *a1)
{
  return MEMORY[0x270EDB9A8](a1);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x270EDB9E8](*(void *)&a1);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x270EDBC30](*(void *)&__fd, __buf, __nbyte);
}