void **sub_100004544(void **a1)
{
  void **v2;
  void **v3;
  void *v4;

  v2 = (void **)*a1;
  if (*a1)
  {
    v3 = (void **)a1[1];
    v4 = *a1;
    if (v3 != v2)
    {
      do
      {
        if (*((char *)v3 - 1) < 0) {
          operator delete(*(v3 - 3));
        }
        v3 -= 3;
      }
      while (v3 != v2);
      v4 = *a1;
    }
    a1[1] = v2;
    operator delete(v4);
  }
  return a1;
}

BOOL support::fs::createDir(const char *a1, mode_t a2, int a3)
{
  v5 = a1;
  v6.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v6.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)&v29.st_blksize = v6;
  *(timespec *)v29.st_qspare = v6;
  v29.st_birthtimespec = v6;
  *(timespec *)&v29.st_size = v6;
  v29.st_mtimespec = v6;
  v29.st_ctimespec = v6;
  *(timespec *)&v29.st_uid = v6;
  v29.st_atimespec = v6;
  *(timespec *)&v29.st_dev = v6;
  if (a1[23] < 0) {
    a1 = *(const char **)a1;
  }
  if (!stat(a1, &v29)) {
    return 1;
  }
  if (!a3)
  {
    if (v5[23] >= 0) {
      v21 = v5;
    }
    else {
      v21 = *(const char **)v5;
    }
    return mkdir(v21, a2) == 0;
  }
  v27[1] = (void *)0xAAAAAAAAAAAAAAAALL;
  uint64_t v28 = 0x1AAAAAAAAAAAAAALL;
  v27[0] = (void *)0xAAAAAAAAAAAA002FLL;
  memset(&__p[32], 170, 24);
  ctu::tokenize();
  memset(__p, 0, 24);
  if (v5[23] >= 0) {
    v7 = v5;
  }
  else {
    v7 = *(const char **)v5;
  }
  if (*v7 == 47)
  {
    *(_OWORD *)__p = *(_OWORD *)v27;
    *(void *)&__p[16] = v28;
  }
  uint64_t v8 = *(void *)&__p[32];
  if (*(void *)&__p[40] != *(void *)&__p[32])
  {
    unint64_t v9 = 0;
    unsigned int v10 = 1;
    while (1)
    {
      if (v10 != 1)
      {
        if (v28 >= 0) {
          v11 = v27;
        }
        else {
          v11 = (void **)v27[0];
        }
        if (v28 >= 0) {
          std::string::size_type v12 = HIBYTE(v28);
        }
        else {
          std::string::size_type v12 = (std::string::size_type)v27[1];
        }
        std::string::append((std::string *)__p, (const std::string::value_type *)v11, v12);
        uint64_t v8 = *(void *)&__p[32];
      }
      uint64_t v13 = v8 + 24 * v9;
      int v14 = *(char *)(v13 + 23);
      v15 = v14 >= 0 ? (const std::string::value_type *)v13 : *(const std::string::value_type **)v13;
      std::string::size_type v16 = v14 >= 0 ? *(unsigned __int8 *)(v13 + 23) : *(void *)(v13 + 8);
      std::string::append((std::string *)__p, v15, v16);
      v17.tv_sec = 0xAAAAAAAAAAAAAAAALL;
      v17.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
      *(timespec *)&v29.st_blksize = v17;
      *(timespec *)v29.st_qspare = v17;
      v29.st_birthtimespec = v17;
      *(timespec *)&v29.st_size = v17;
      v29.st_mtimespec = v17;
      v29.st_ctimespec = v17;
      *(timespec *)&v29.st_uid = v17;
      v29.st_atimespec = v17;
      *(timespec *)&v29.st_dev = v17;
      v18 = __p[23] >= 0 ? __p : *(const char **)__p;
      if (stat(v18, &v29))
      {
        v19 = __p[23] >= 0 ? __p : *(const char **)__p;
        if (mkdir(v19, a2)) {
          break;
        }
      }
      unint64_t v9 = v10;
      uint64_t v8 = *(void *)&__p[32];
      ++v10;
      if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)&__p[40] - *(void *)&__p[32]) >> 3) <= v9) {
        goto LABEL_42;
      }
    }
    uint64_t v20 = 0;
    if ((__p[23] & 0x80000000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_43;
  }
LABEL_42:
  uint64_t v20 = 1;
  if ((__p[23] & 0x80000000) != 0) {
LABEL_43:
  }
    operator delete(*(void **)__p);
LABEL_44:
  uint64_t v22 = *(void *)&__p[32];
  if (*(void *)&__p[32])
  {
    uint64_t v23 = *(void *)&__p[40];
    v24 = *(void **)&__p[32];
    if (*(void *)&__p[40] != *(void *)&__p[32])
    {
      do
      {
        if (*(char *)(v23 - 1) < 0) {
          operator delete(*(void **)(v23 - 24));
        }
        v23 -= 24;
      }
      while (v23 != v22);
      v24 = *(void **)&__p[32];
    }
    *(void *)&__p[40] = v22;
    operator delete(v24);
  }
  if (SHIBYTE(v28) < 0) {
    operator delete(v27[0]);
  }
  return v20;
}

void sub_100004838(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (a14 < 0)
  {
    operator delete(__p);
    sub_100004544(&a16);
    if ((a24 & 0x80000000) == 0) {
LABEL_3:
    }
      _Unwind_Resume(a1);
  }
  else
  {
    sub_100004544(&a16);
    if ((a24 & 0x80000000) == 0) {
      goto LABEL_3;
    }
  }
  operator delete(a19);
  _Unwind_Resume(a1);
}

void sub_100004884()
{
}

void sub_10000489C(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_1000048F8(exception, a1);
}

void sub_1000048E4(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_1000048F8(std::logic_error *a1, const char *a2)
{
  result = std::logic_error::logic_error(a1, a2);
  return result;
}

void sub_10000492C(void *a1)
{
}

void *sub_100004940(unsigned char *__dst, void *__src, unint64_t a3)
{
  v5 = __dst;
  if (a3 > 0x16)
  {
    if (a3 >= 0x7FFFFFFFFFFFFFF8) {
      sub_100004884();
    }
    uint64_t v6 = (a3 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a3 | 7) != 0x17) {
      uint64_t v6 = a3 | 7;
    }
    uint64_t v7 = v6 + 1;
    uint64_t v8 = operator new(v6 + 1);
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

void *sub_1000049E0(void *__dst, void *__src, size_t __len)
{
  if (__len > 0x16)
  {
    if (__len - 0x7FFFFFFFFFFFFFF7 <= 0x800000000000001ELL) {
      sub_100004884();
    }
    size_t v7 = 44;
    if (__len > 0x2C) {
      size_t v7 = __len;
    }
    size_t v8 = (v7 | 7) + 1;
    uint64_t v6 = operator new(v8);
    memcpy(v6, __src, __len);
    __dst[1] = __len;
    __dst[2] = v8 | 0x8000000000000000;
    *__dst = v6;
  }
  else
  {
    *((unsigned char *)__dst + 23) = __len;
    uint64_t v6 = __dst;
    if (__len)
    {
      memmove(__dst, __src, __len);
      uint64_t v6 = __dst;
    }
  }
  *((unsigned char *)v6 + __len) = 0;
  return __dst;
}

void **sub_100004AA8(void **a1, void *__src, size_t __len)
{
  unint64_t v6 = (unint64_t)a1[2];
  uint64_t v7 = v6 & 0x7FFFFFFFFFFFFFFFLL;
  if ((v6 & 0x7FFFFFFFFFFFFFFFLL) > __len)
  {
    size_t v8 = *a1;
    a1[1] = (void *)__len;
    if (__len) {
      memmove(v8, __src, __len);
    }
    goto LABEL_12;
  }
  size_t v9 = 0x7FFFFFFFFFFFFFF7;
  if (0x7FFFFFFFFFFFFFF7 - v7 < __len - v7 + 1) {
    sub_100004884();
  }
  unint64_t v10 = v7 - 1;
  v11 = a1;
  if ((v6 & 0x8000000000000000) == 0)
  {
    if (v10 > 0x3FFFFFFFFFFFFFF2) {
      goto LABEL_7;
    }
LABEL_14:
    unint64_t v13 = 2 * v10;
    if (__len > 2 * v10) {
      unint64_t v13 = __len;
    }
    uint64_t v14 = (v13 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v13 | 7) != 0x17) {
      uint64_t v14 = v13 | 7;
    }
    if (v13 >= 0x17) {
      size_t v9 = v14 + 1;
    }
    else {
      size_t v9 = 23;
    }
    size_t v8 = operator new(v9);
    if (!__len) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  v11 = *a1;
  if (v10 <= 0x3FFFFFFFFFFFFFF2) {
    goto LABEL_14;
  }
LABEL_7:
  size_t v8 = operator new(0x7FFFFFFFFFFFFFF7uLL);
  if (__len) {
LABEL_8:
  }
    memcpy(v8, __src, __len);
LABEL_9:
  if (v10 != 22) {
    operator delete(v11);
  }
  a1[1] = (void *)__len;
  a1[2] = (void *)(v9 | 0x8000000000000000);
  *a1 = v8;
LABEL_12:
  *((unsigned char *)v8 + __len) = 0;
  return a1;
}

int main(int argc, const char **argv, const char **envp)
{
  v3 = (const void *)abm::trace::kScratchFolder;
  size_t v4 = strlen(abm::trace::kScratchFolder);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    sub_100004884();
  }
  std::string::size_type v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    p_dst = (std::string *)operator new(v7 + 1);
    __dst.__r_.__value_.__l.__size_ = v5;
    __dst.__r_.__value_.__r.__words[2] = v8 | 0x8000000000000000;
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)p_dst;
  }
  else
  {
    *((unsigned char *)&__dst.__r_.__value_.__s + 23) = v4;
    p_dst = &__dst;
    if (!v4)
    {
LABEL_10:
      p_dst->__r_.__value_.__s.__data_[v5] = 0;
      size_t v9 = getprogname();
      std::string::size_type v10 = strlen(v9);
      v11 = std::string::append(&__dst, v9, v10);
      long long v12 = *(_OWORD *)&v11->__r_.__value_.__l.__data_;
      v50.__r_.__value_.__r.__words[2] = v11->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v50.__r_.__value_.__l.__data_ = v12;
      v11->__r_.__value_.__l.__size_ = 0;
      v11->__r_.__value_.__r.__words[2] = 0;
      v11->__r_.__value_.__r.__words[0] = 0;
      unint64_t v13 = std::string::append(&v50, ".log", 4uLL);
      std::string v51 = *v13;
      v13->__r_.__value_.__l.__size_ = 0;
      v13->__r_.__value_.__r.__words[2] = 0;
      v13->__r_.__value_.__r.__words[0] = 0;
      if (SHIBYTE(v50.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v50.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__dst.__r_.__value_.__l.__data_);
      }
      *(_OWORD *)&__dst.__r_.__value_.__l.__data_ = 0uLL;
      uint64_t v47 = 0;
      uint64_t v48 = 0;
      unint64_t v45 = 0xAAAAAAAAAAAAAAAALL;
      os_log_t v46 = (os_log_t)0xAAAAAAAAAAAAAAAALL;
      ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)&v45, "com.apple.telephony.abm", "helper.main");
      if ((_set_user_dir_suffix() & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v50.__r_.__value_.__l.__data_) = 0;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "_set_user_dir_suffix failed!\n", (uint8_t *)&v50, 2u);
      }
      uint64_t v14 = NSTemporaryDirectory();
      if (capabilities::abs::ABMLogEnabled((capabilities::abs *)v14))
      {
        v15 = (const char *)sub_100005458(&v50, abm::trace::kScratchFolder);
        support::fs::createDir(v15, 0x1EDu, 0);
        if (SHIBYTE(v50.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v50.__r_.__value_.__l.__data_);
        }
        sub_10000550C(&v50, (uint64_t)&v51);
        sub_100005A44((uint64_t)&v47, (long long *)&v50);
        sub_100005ACC((uint64_t)&v50);
      }
      sub_100005458(&v50, "helper.main");
      ctu::LogServer::create();
      sub_100005A44((uint64_t)&__dst, (long long *)buf);
      sub_100005ACC((uint64_t)buf);
      if (SHIBYTE(v50.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v50.__r_.__value_.__l.__data_);
      }
      std::string::size_type v16 = (ctu::LogServer *)__dst.__r_.__value_.__r.__words[0];
      if (__dst.__r_.__value_.__r.__words[0])
      {
        uint64_t v17 = v47;
        if (!v47) {
          goto LABEL_25;
        }
        sub_100005458(__p, (char *)&unk_10000769F);
        sub_100005B48(v17, (long long *)__p);
        if (v43 < 0) {
          operator delete(__p[0]);
        }
        v41[0] = v47;
        v41[1] = v48;
        if (v48) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)(v48 + 8), 1uLL, memory_order_relaxed);
        }
        ctu::LogServer::addWriter();
        sub_100005ACC((uint64_t)v41);
        std::string::size_type v16 = (ctu::LogServer *)__dst.__r_.__value_.__r.__words[0];
        if (__dst.__r_.__value_.__r.__words[0]) {
LABEL_25:
        }
          ctu::LogServer::start(v16);
      }
      *(_OWORD *)&v50.__r_.__value_.__l.__data_ = 0uLL;
      if (&_sCanHostHelperServer)
      {
        int CanHostHelperServer = sCanHostHelperServer();
        v19 = v46;
        BOOL v20 = os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT);
        if (CanHostHelperServer)
        {
          if (v20)
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Hosting ABM Helper server!", buf, 2u);
          }
          long long v40 = *(_OWORD *)&__dst.__r_.__value_.__l.__data_;
          if (__dst.__r_.__value_.__l.__size_) {
            atomic_fetch_add_explicit((atomic_ullong *volatile)(__dst.__r_.__value_.__l.__size_ + 8), 1uLL, memory_order_relaxed);
          }
          abm::HelperServer::create();
          sub_100005A44((uint64_t)&v50, (long long *)buf);
          sub_100005ACC((uint64_t)buf);
          sub_100005ACC((uint64_t)&v40);
        }
        else if (v20)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Not allowed to host ABM Helper server!", buf, 2u);
        }
        v21 = (abm::HelperServer *)v50.__r_.__value_.__r.__words[0];
        if (v50.__r_.__value_.__r.__words[0])
        {
          uint64_t v23 = v46;
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Starting ABM Helper server", buf, 2u);
            v21 = (abm::HelperServer *)v50.__r_.__value_.__r.__words[0];
          }
          abm::HelperServer::start(v21);
          if (v50.__r_.__value_.__r.__words[0])
          {
            global_queue = dispatch_get_global_queue(21, 0);
            v25 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, global_queue);
            v26 = v25;
            if (v25)
            {
              handler[0] = _NSConcreteStackBlock;
              handler[1] = 3321888768;
              handler[2] = sub_100005C78;
              handler[3] = &unk_100008340;
              dispatch_object_t object = v25;
              dispatch_retain(v25);
              ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)v38, (const ctu::OsLogContext *)&v45);
              long long v39 = *(_OWORD *)&v50.__r_.__value_.__l.__data_;
              if (v50.__r_.__value_.__l.__size_) {
                atomic_fetch_add_explicit((atomic_ullong *volatile)(v50.__r_.__value_.__l.__size_ + 8), 1uLL, memory_order_relaxed);
              }
              dispatch_source_set_event_handler(v26, handler);
              dispatch_activate(v26);
              signal(15, (void (__cdecl *)(int))1);
              sub_100005ACC((uint64_t)&v39);
              ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v38);
              if (object) {
                dispatch_release(object);
              }
            }
            v27 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 1uLL, 0, (dispatch_queue_t)&_dispatch_main_q);
            uint64_t v28 = v27;
            if (v27)
            {
              v31[0] = _NSConcreteStackBlock;
              v31[1] = 3321888768;
              v31[2] = sub_100005E04;
              v31[3] = &unk_1000083B0;
              long long v32 = *(_OWORD *)&v50.__r_.__value_.__l.__data_;
              if (v50.__r_.__value_.__l.__size_) {
                atomic_fetch_add_explicit((atomic_ullong *volatile)(v50.__r_.__value_.__l.__size_ + 8), 1uLL, memory_order_relaxed);
              }
              dispatch_object_t v33 = v27;
              dispatch_retain(v27);
              long long v34 = *(_OWORD *)&__dst.__r_.__value_.__l.__data_;
              if (__dst.__r_.__value_.__l.__size_) {
                atomic_fetch_add_explicit((atomic_ullong *volatile)(__dst.__r_.__value_.__l.__size_ + 8), 1uLL, memory_order_relaxed);
              }
              ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)v35, (const ctu::OsLogContext *)&v45);
              dispatch_source_set_event_handler(v28, v31);
              dispatch_time_t v29 = dispatch_time(0, 2000000000);
              dispatch_source_set_timer(v28, v29, 0x77359400uLL, 0x1DCD6500uLL);
              dispatch_activate(v28);
              ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v35);
              sub_100005ACC((uint64_t)&v34);
              if (v33) {
                dispatch_release(v33);
              }
              sub_100005ACC((uint64_t)&v32);
            }
            do
              CFRunLoopRun();
            while (byte_10000C004 != 1);
            if (v28) {
              dispatch_release(v28);
            }
            if (v26) {
              dispatch_release(v26);
            }
          }
        }
      }
      if (__dst.__r_.__value_.__r.__words[0])
      {
        *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
        ctu::LogServer::flush((uint64_t *)buf, (ctu::LogServer *)__dst.__r_.__value_.__l.__data_);
        if (*(void *)buf) {
          dispatch_group_wait(*(dispatch_group_t *)buf, 0xFFFFFFFFFFFFFFFFLL);
        }
        ctu::LogServer::close((ctu::LogServer *)__dst.__r_.__value_.__l.__data_);
        if (*(void *)buf) {
          dispatch_release(*(dispatch_object_t *)buf);
        }
      }
      if (v47) {
        (*(void (**)(uint64_t))(*(void *)v47 + 16))(v47);
      }
      uint64_t v22 = v46;
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "ABM Helper Exit!", buf, 2u);
      }
      _Exit(0);
    }
  }
  memmove(p_dst, v3, v5);
  goto LABEL_10;
}

void sub_1000052A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,dispatch_object_t object,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,char a32,uint64_t a33,void *__p,uint64_t a35,int a36,__int16 a37,char a38,char a39)
{
  sub_100005ACC(v41);
  ctu::OsLogContext::~OsLogContext(v40);
  if (object) {
    dispatch_release(object);
  }
  dispatch_release(v39);
  sub_100005ACC(v42 - 112);
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)(v42 - 168));
  v44 = *(std::__shared_weak_count **)(v42 - 144);
  if (v44 && !atomic_fetch_add(&v44->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v44->__on_zero_shared)(v44);
    std::__shared_weak_count::__release_weak(v44);
  }
  unint64_t v45 = *(std::__shared_weak_count **)(v42 - 128);
  if (v45 && !atomic_fetch_add(&v45->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v45->__on_zero_shared)(v45);
    std::__shared_weak_count::__release_weak(v45);
  }
  if (*(char *)(v42 - 57) < 0) {
    operator delete(*(void **)(v42 - 80));
  }
  _Unwind_Resume(a1);
}

void *sub_100005458(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    sub_100004884();
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

void sub_10000550C(void *a1, uint64_t a2)
{
  size_t v4 = (char *)operator new(0x380uLL);
  size_t v5 = dispatch_queue_create("FlatFileLogWriter", 0);
  *((void *)v4 + 1) = 0;
  *((void *)v4 + 2) = 0;
  *((void *)v4 + 3) = v5;
  if (v5)
  {
    unint64_t v6 = v5;
    dispatch_retain(v5);
    *((void *)v4 + 4) = 0;
    dispatch_release(v6);
    *(void *)size_t v4 = off_100008440;
    uint64_t v7 = v4 + 40;
    if ((*(char *)(a2 + 23) & 0x80000000) == 0)
    {
LABEL_3:
      *(_OWORD *)uint64_t v7 = *(_OWORD *)a2;
      *((void *)v7 + 2) = *(void *)(a2 + 16);
      goto LABEL_6;
    }
  }
  else
  {
    *((void *)v4 + 4) = 0;
    *(void *)size_t v4 = off_100008440;
    uint64_t v7 = v4 + 40;
    if ((*(char *)(a2 + 23) & 0x80000000) == 0) {
      goto LABEL_3;
    }
  }
  sub_100004940(v7, *(void **)a2, *(void *)(a2 + 8));
LABEL_6:
  *((void *)v4 + 8) = v9;
  *(void *)&v4[*(void *)(v9 - 24) + 64] = v8;
  std::string::size_type v10 = (std::ios_base *)&v4[*(void *)(*((void *)v4 + 8) - 24) + 64];
  std::ios_base::init(v10, v4 + 72);
  v10[1].__vftable = 0;
  v10[1].__fmtflags_ = -1;
  std::streambuf::basic_streambuf();
  *(_OWORD *)(v4 + 136) = 0u;
  *(_OWORD *)(v4 + 152) = 0u;
  *((_DWORD *)v4 + 42) = 16;
  *((void *)v4 + 41) = v12;
  *(void *)&v4[*(void *)(v12 - 24) + 328] = v11;
  unint64_t v13 = (std::ios_base *)&v4[*(void *)(*((void *)v4 + 41) - 24) + 328];
  std::ios_base::init(v13, v4 + 336);
  v13[1].__vftable = 0;
  v13[1].__fmtflags_ = -1;
  std::filebuf::basic_filebuf();
  *a1 = v4;
  uint64_t v14 = (std::__shared_weak_count *)operator new(0x20uLL);
  v14->__shared_owners_ = 0;
  p_shared_owners = &v14->__shared_owners_;
  v14->__vftable = (std::__shared_weak_count_vtbl *)&off_1000083F0;
  v14->__shared_weak_owners_ = 0;
  v14[1].__vftable = (std::__shared_weak_count_vtbl *)v4;
  a1[1] = v14;
  std::string::size_type v16 = (std::__shared_weak_count *)*((void *)v4 + 2);
  if (v16)
  {
    if (v16->__shared_owners_ != -1) {
      return;
    }
    atomic_fetch_add_explicit(&v14->__shared_owners_, 1uLL, memory_order_relaxed);
    atomic_fetch_add_explicit(&v14->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    *((void *)v4 + 1) = v4;
    *((void *)v4 + 2) = v14;
    std::__shared_weak_count::__release_weak(v16);
    if (atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL)) {
      return;
    }
  }
  else
  {
    atomic_fetch_add_explicit(&v14->__shared_owners_, 1uLL, memory_order_relaxed);
    atomic_fetch_add_explicit(&v14->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    *((void *)v4 + 1) = v4;
    *((void *)v4 + 2) = v14;
    if (atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL)) {
      return;
    }
  }
  ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);

  std::__shared_weak_count::__release_weak(v14);
}

void sub_100005978(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  sub_1000062D4(a10);
  operator delete(v10);
  _Unwind_Resume(a1);
}

void sub_100005994(void *a1)
{
  __cxa_begin_catch(a1);
  dispatch_barrier_async_f(v1[3], v1, (dispatch_function_t)sub_1000061A4);
  __cxa_rethrow();
}

void sub_1000059BC(_Unwind_Exception *a1)
{
}

void sub_1000059D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  std::ostream::~ostream();
  std::ios::~ios();
  sub_1000061D0(v12);
  if (v10[63] < 0) {
    operator delete(*v11);
  }
  sub_1000062D4(a10);
  operator delete(v10);
  _Unwind_Resume(a1);
}

uint64_t sub_100005A44(uint64_t result, long long *a2)
{
  uint64_t v2 = result;
  long long v3 = *a2;
  *(void *)a2 = 0;
  *((void *)a2 + 1) = 0;
  size_t v4 = *(std::__shared_weak_count **)(result + 8);
  *(_OWORD *)result = v3;
  if (v4)
  {
    if (!atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
      return v2;
    }
  }
  return result;
}

uint64_t sub_100005ACC(uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v2 = *(std::__shared_weak_count **)(result + 8);
  if (v2)
  {
    if (!atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
      return v1;
    }
  }
  return result;
}

void sub_100005B48(uint64_t a1, long long *a2)
{
  uint64_t v3 = a1 + 8;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3321888768;
  v5[2] = sub_100006C74;
  v5[3] = &unk_100008520;
  v5[4] = a1;
  if (*((char *)a2 + 23) < 0)
  {
    sub_100004940(&__p, *(void **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long __p = *a2;
    uint64_t v7 = *((void *)a2 + 2);
  }
  uint64_t v8 = v5;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006720;
  block[3] = &unk_100008500;
  block[4] = v3;
  block[5] = &v8;
  size_t v4 = *(NSObject **)(a1 + 24);
  if (*(void *)(a1 + 32))
  {
    dispatch_async_and_wait(v4, block);
    if ((SHIBYTE(v7) & 0x80000000) == 0) {
      return;
    }
LABEL_8:
    operator delete((void *)__p);
    return;
  }
  dispatch_sync(v4, block);
  if (SHIBYTE(v7) < 0) {
    goto LABEL_8;
  }
}

uint64_t sub_100005C78(uint64_t a1)
{
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  uint64_t v2 = *(NSObject **)(a1 + 48);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)size_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "SIGTERM signal received; set quit flag and stop server",
      v4,
      2u);
  }
  uint64_t result = abm::HelperServer::stop(*(abm::HelperServer **)(a1 + 56));
  byte_10000C004 = 1;
  return result;
}

uint64_t sub_100005CF8(void *a1, void *a2)
{
  size_t v4 = a2[4];
  a1[4] = v4;
  if (v4) {
    dispatch_retain(v4);
  }
  uint64_t result = ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)(a1 + 5), (const ctu::OsLogContext *)(a2 + 5));
  uint64_t v6 = a2[8];
  a1[7] = a2[7];
  a1[8] = v6;
  if (v6) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void sub_100005D50(void *a1)
{
  uint64_t v2 = (ctu::OsLogContext *)(a1 + 5);
  uint64_t v3 = (std::__shared_weak_count *)a1[8];
  if (v3 && !atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
    std::__shared_weak_count::__release_weak(v3);
    ctu::OsLogContext::~OsLogContext(v2);
    size_t v4 = a1[4];
    if (!v4) {
      return;
    }
  }
  else
  {
    ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)(a1 + 5));
    size_t v4 = a1[4];
    if (!v4) {
      return;
    }
  }

  dispatch_release(v4);
}

void sub_100005E04(uint64_t a1)
{
  if (abm::HelperServer::isBusy(*(abm::HelperServer **)(a1 + 32)))
  {
    dword_10000C000 = 12;
    if (*(void *)(a1 + 56))
    {
      uint64_t v2 = *(NSObject **)(a1 + 80);
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v5[0]) = 0;
        _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "Server is busy", (uint8_t *)v5, 2u);
      }
    }
  }
  else
  {
    int v3 = dword_10000C000 - 2;
    dword_10000C000 -= 2;
    if ((byte_10000C004 & 1) != 0 || v3 <= 0)
    {
      dword_10000C000 = 0;
      dispatch_source_cancel(*(dispatch_source_t *)(a1 + 48));
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_100008390);
    }
    if (*(void *)(a1 + 56))
    {
      size_t v4 = *(NSObject **)(a1 + 80);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v5[0] = 67109120;
        v5[1] = dword_10000C000;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Server is idle; %d secs to exit",
          (uint8_t *)v5,
          8u);
      }
    }
  }
}

void sub_100005F50(id a1)
{
  byte_10000C004 = 1;
  Main = CFRunLoopGetMain();

  CFRunLoopStop(Main);
}

uint64_t sub_100005F84(void *a1, void *a2)
{
  uint64_t v4 = a2[5];
  a1[4] = a2[4];
  a1[5] = v4;
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
  }
  size_t v5 = a2[6];
  a1[6] = v5;
  if (v5) {
    dispatch_retain(v5);
  }
  uint64_t v6 = a2[8];
  a1[7] = a2[7];
  a1[8] = v6;
  if (v6) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 8), 1uLL, memory_order_relaxed);
  }

  return ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)(a1 + 9), (const ctu::OsLogContext *)(a2 + 9));
}

void sub_100006000(void *a1)
{
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)(a1 + 9));
  uint64_t v2 = (std::__shared_weak_count *)a1[8];
  if (v2 && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
    int v3 = a1[6];
    if (!v3) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  int v3 = a1[6];
  if (v3) {
LABEL_4:
  }
    dispatch_release(v3);
LABEL_5:
  uint64_t v4 = (std::__shared_weak_count *)a1[5];
  if (v4 && !atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
    std::__shared_weak_count::__release_weak(v4);
  }
}

void sub_1000060EC(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

void sub_100006114(uint64_t a1)
{
}

uint64_t sub_100006130(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "ZN3ctu20SharedSynchronizableI17FlatFileLogWriterE15make_shared_ptrIS1_EENSt3__110shared_ptrIT_EEPS6_EUlPS1_E_") {
    return a1 + 24;
  }
  if (((v3 & (unint64_t)"ZN3ctu20SharedSynchronizableI17FlatFileLogWriterE15make_shared_ptrIS1_EENSt3__110shared_"
                                "ptrIT_EEPS6_EUlPS1_E_" & 0x8000000000000000) != 0) == __OFSUB__(v3, "ZN3ctu20SharedSynchronizableI17FlatFileLogWriterE15make_shared_ptrIS1_EENSt3__110shared_ptrIT_EEPS6_EUlPS1_E_"))return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN3ctu20SharedSynchronizableI17FlatFileLogWriterE15make_shared_ptrIS1_EENSt3__110shared_ptrIT_EEPS6_EUlPS1_E_" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 24; {
  return 0;
  }
}

uint64_t sub_1000061A4(uint64_t result)
{
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

uint64_t sub_1000061D0(uint64_t a1)
{
  if (*(char *)(a1 + 95) < 0) {
    operator delete(*(void **)(a1 + 72));
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  std::ios::~ios();
  return a1;
}

void *sub_1000062D4(void *a1)
{
  uint64_t v2 = a1[3];
  if (v2) {
    dispatch_release(v2);
  }
  unint64_t v3 = a1[2];
  if (v3) {
    dispatch_release(v3);
  }
  uint64_t v4 = (std::__shared_weak_count *)a1[1];
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }
  return a1;
}

void sub_100006320(uint64_t a1)
{
  uint64_t v1 = (void *)sub_1000064A4(a1);

  operator delete(v1);
}

void sub_100006348(uint64_t a1)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000066B4;
  v3[3] = &unk_1000084E0;
  v3[4] = a1;
  uint64_t v4 = v3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006720;
  block[3] = &unk_100008500;
  block[4] = a1 + 8;
  block[5] = &v4;
  uint64_t v2 = a1 + 24;
  uint64_t v1 = *(NSObject **)(a1 + 24);
  if (*(void *)(v2 + 8)) {
    dispatch_async_and_wait(v1, block);
  }
  else {
    dispatch_sync(v1, block);
  }
}

void sub_100006414(uint64_t a1, uint64_t a2)
{
  v4[0] = a2;
  v4[1] = a1;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006734;
  block[3] = &unk_100008500;
  block[4] = a1 + 8;
  block[5] = v4;
  uint64_t v3 = a1 + 24;
  uint64_t v2 = *(NSObject **)(a1 + 24);
  if (*(void *)(v3 + 8)) {
    dispatch_async_and_wait(v2, block);
  }
  else {
    dispatch_sync(v2, block);
  }
}

uint64_t sub_1000064A4(uint64_t a1)
{
  *(void *)a1 = off_100008440;
  std::filebuf::~filebuf();
  std::ostream::~ostream();
  std::ios::~ios();
  if (*(char *)(a1 + 159) < 0) {
    operator delete(*(void **)(a1 + 136));
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  std::ios::~ios();
  if ((*(char *)(a1 + 63) & 0x80000000) == 0)
  {
    uint64_t v4 = *(NSObject **)(a1 + 32);
    if (!v4) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  operator delete(*(void **)(a1 + 40));
  uint64_t v4 = *(NSObject **)(a1 + 32);
  if (v4) {
LABEL_5:
  }
    dispatch_release(v4);
LABEL_6:
  size_t v5 = *(NSObject **)(a1 + 24);
  if (v5) {
    dispatch_release(v5);
  }
  uint64_t v6 = *(std::__shared_weak_count **)(a1 + 16);
  if (v6) {
    std::__shared_weak_count::__release_weak(v6);
  }
  return a1;
}

void sub_1000066B4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!std::filebuf::close())
  {
    uint64_t v2 = (std::ios_base *)(v1 + 328 + *(void *)(*(void *)(v1 + 328) - 24));
    std::ios_base::iostate v3 = v2->__rdstate_ | 4;
    std::ios_base::clear(v2, v3);
  }
}

void *sub_100006720(uint64_t a1)
{
  return (*(void *(**)(void *__return_ptr))(**(void **)(a1 + 40) + 16))(*(void **)(a1 + 40));
}

uint64_t sub_100006734(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 40);
  uint64_t v2 = v1[1];
  uint64_t v3 = 328;
  if (*(void *)(v2 + 456))
  {
    uint64_t v4 = v2 + 328;
  }
  else
  {
    uint64_t v3 = 64;
    uint64_t v4 = v2 + 64;
  }
  uint64_t v5 = *(void *)(v2 + v3);
  *(_DWORD *)(v4 + *(void *)(v5 - 24) + 8) |= 4u;
  *(void *)(v4 + *(void *)(v5 - 24) + 16) = 3;
  uint64_t v6 = (void *)std::ostream::operator<<();
  char v20 = 58;
  sub_100006918(v6, (uint64_t)&v20, 1);
  uint64_t v7 = (void *)ctu::operator<<();
  char v21 = 58;
  uint64_t v8 = sub_100006918(v7, (uint64_t)&v21, 1);
  int v9 = *(char *)(*v1 + 47);
  if (v9 >= 0) {
    uint64_t v10 = *v1 + 24;
  }
  else {
    uint64_t v10 = *(void *)(*v1 + 24);
  }
  if (v9 >= 0) {
    uint64_t v11 = *(unsigned __int8 *)(*v1 + 47);
  }
  else {
    uint64_t v11 = *(void *)(*v1 + 32);
  }
  uint64_t v12 = sub_100006918(v8, v10, v11);
  char v22 = 58;
  unint64_t v13 = sub_100006918(v12, (uint64_t)&v22, 1);
  int v14 = *(char *)(*v1 + 71);
  if (v14 >= 0) {
    uint64_t v15 = *v1 + 48;
  }
  else {
    uint64_t v15 = *(void *)(*v1 + 48);
  }
  if (v14 >= 0) {
    uint64_t v16 = *(unsigned __int8 *)(*v1 + 71);
  }
  else {
    uint64_t v16 = *(void *)(*v1 + 56);
  }
  uint64_t v17 = sub_100006918(v13, v15, v16);
  std::ios_base::getloc((const std::ios_base *)((char *)v17 + *(void *)(*v17 - 24)));
  v18 = std::locale::use_facet(&v23, &std::ctype<char>::id);
  ((void (*)(const std::locale::facet *, uint64_t))v18->__vftable[2].~facet_0)(v18, 10);
  std::locale::~locale(&v23);
  std::ostream::put();
  return std::ostream::flush();
}

void sub_100006904(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::locale a10)
{
}

void *sub_100006918(void *a1, uint64_t a2, uint64_t a3)
{
  std::ostream::sentry::sentry();
  uint64_t v6 = (char *)a1 + *(void *)(*a1 - 24);
  uint64_t v7 = *((void *)v6 + 5);
  int v8 = *((_DWORD *)v6 + 2);
  int v9 = *((_DWORD *)v6 + 36);
  if (v9 == -1)
  {
    std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
    uint64_t v12 = std::locale::use_facet(__b, &std::ctype<char>::id);
    int v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v12->__vftable[2].~facet_0)(v12, 32);
    std::locale::~locale(__b);
    *((_DWORD *)v6 + 36) = v9;
    uint64_t v10 = a2 + a3;
    if ((v8 & 0xB0) == 0x20) {
      uint64_t v11 = a2 + a3;
    }
    else {
      uint64_t v11 = a2;
    }
    if (!v7) {
      goto LABEL_33;
    }
  }
  else
  {
    uint64_t v10 = a2 + a3;
    if ((*((_DWORD *)v6 + 2) & 0xB0) == 0x20) {
      uint64_t v11 = a2 + a3;
    }
    else {
      uint64_t v11 = a2;
    }
    if (!v7) {
      goto LABEL_33;
    }
  }
  uint64_t v13 = *((void *)v6 + 3);
  BOOL v14 = v13 <= a3;
  size_t v15 = v13 - a3;
  if (v14) {
    size_t v16 = 0;
  }
  else {
    size_t v16 = v15;
  }
  if (v11 - a2 >= 1
    && (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v7 + 96))(v7, a2, v11 - a2) != v11 - a2)
  {
    goto LABEL_33;
  }
  if ((uint64_t)v16 >= 1)
  {
    memset(__b, 170, sizeof(__b));
    if (v16 >= 0x7FFFFFFFFFFFFFF8) {
      sub_100004884();
    }
    if (v16 >= 0x17)
    {
      uint64_t v18 = (v16 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v16 | 7) != 0x17) {
        uint64_t v18 = v16 | 7;
      }
      uint64_t v19 = v18 + 1;
      uint64_t v17 = (std::locale::__imp *)operator new(v18 + 1);
      __b[1].__locale_ = (std::locale::__imp *)v16;
      __b[2].__locale_ = (std::locale::__imp *)(v19 | 0x8000000000000000);
      __b[0].__locale_ = v17;
    }
    else
    {
      HIBYTE(__b[2].__locale_) = v16;
      uint64_t v17 = (std::locale::__imp *)__b;
    }
    memset(v17, v9, v16);
    *((unsigned char *)v17 + v16) = 0;
    if (SHIBYTE(__b[2].__locale_) >= 0) {
      locale = __b;
    }
    else {
      locale = __b[0].__locale_;
    }
    uint64_t v21 = (*(uint64_t (**)(uint64_t, void *, size_t))(*(void *)v7 + 96))(v7, locale, v16);
    uint64_t v22 = v21;
    if ((SHIBYTE(__b[2].__locale_) & 0x80000000) == 0)
    {
      if (v21 == v16) {
        goto LABEL_30;
      }
LABEL_33:
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | 5);
      goto LABEL_34;
    }
    operator delete(__b[0].__locale_);
    if (v22 != v16) {
      goto LABEL_33;
    }
  }
LABEL_30:
  if (v10 - v11 >= 1
    && (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v7 + 96))(v7, v11, v10 - v11) != v10 - v11)
  {
    goto LABEL_33;
  }
  *((void *)v6 + 3) = 0;
LABEL_34:
  std::ostream::sentry::~sentry();
  return a1;
}

void sub_100006BF4(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  std::ostream::sentry::~sentry();
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v17 + *(void *)(*v17 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x100006BC4);
}

void sub_100006C60(_Unwind_Exception *a1)
{
}

void sub_100006C74(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = (void **)(a1 + 40);
  char v3 = *(unsigned char *)(a1 + 63);
  if ((v3 & 0x80000000) == 0)
  {
    uint64_t v4 = (void **)(v1 + 40);
    if (*(unsigned char *)(a1 + 63)) {
      BOOL v5 = v4 == v2;
    }
    else {
      BOOL v5 = 1;
    }
    if (!v5) {
      goto LABEL_11;
    }
LABEL_22:
    int v8 = (void *)(v1 + 328);
    if (*(char *)(v1 + 63) < 0) {
      goto LABEL_28;
    }
    goto LABEL_23;
  }
  uint64_t v4 = (void **)(v1 + 40);
  if (*(void *)(a1 + 48)) {
    BOOL v6 = v4 == v2;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6) {
    goto LABEL_22;
  }
LABEL_11:
  if (*(char *)(v1 + 63) < 0)
  {
    if (v3 >= 0) {
      int v9 = (void *)(a1 + 40);
    }
    else {
      int v9 = *(void **)(a1 + 40);
    }
    if (v3 >= 0) {
      size_t v10 = *(unsigned __int8 *)(a1 + 63);
    }
    else {
      size_t v10 = *(void *)(a1 + 48);
    }
    sub_100004AA8(v4, v9, v10);
    goto LABEL_22;
  }
  if ((*(unsigned char *)(a1 + 63) & 0x80) != 0)
  {
    sub_1000049E0(v4, *(void **)(a1 + 40), *(void *)(a1 + 48));
    int v8 = (void *)(v1 + 328);
    if (*(char *)(v1 + 63) < 0) {
      goto LABEL_28;
    }
  }
  else
  {
    long long v7 = *(_OWORD *)v2;
    void v4[2] = *(void **)(a1 + 56);
    *(_OWORD *)uint64_t v4 = v7;
    int v8 = (void *)(v1 + 328);
    if (*(char *)(v1 + 63) < 0)
    {
LABEL_28:
      std::ofstream::open();
      int v11 = *(_DWORD *)(v1 + 168);
      if ((v11 & 0x10) != 0) {
        goto LABEL_29;
      }
      goto LABEL_24;
    }
  }
LABEL_23:
  std::ofstream::open();
  int v11 = *(_DWORD *)(v1 + 168);
  if ((v11 & 0x10) != 0)
  {
LABEL_29:
    unint64_t v15 = *(void *)(v1 + 160);
    unint64_t v16 = *(void *)(v1 + 120);
    if (v15 < v16)
    {
      *(void *)(v1 + 160) = v16;
      unint64_t v15 = v16;
    }
    BOOL v14 = (const void **)(v1 + 112);
    goto LABEL_32;
  }
LABEL_24:
  if ((v11 & 8) == 0)
  {
    size_t v12 = 0;
    HIBYTE(v27) = 0;
    p_dst = (void **)&__dst;
    goto LABEL_40;
  }
  BOOL v14 = (const void **)(v1 + 88);
  unint64_t v15 = *(void *)(v1 + 104);
LABEL_32:
  uint64_t v17 = *v14;
  size_t v12 = v15 - (void)*v14;
  if (v12 >= 0x7FFFFFFFFFFFFFF8) {
    sub_100004884();
  }
  if (v12 >= 0x17)
  {
    uint64_t v18 = (v12 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v12 | 7) != 0x17) {
      uint64_t v18 = v12 | 7;
    }
    uint64_t v19 = v18 + 1;
    p_dst = (void **)operator new(v18 + 1);
    size_t v26 = v12;
    int64_t v27 = v19 | 0x8000000000000000;
    std::string __dst = p_dst;
    goto LABEL_39;
  }
  HIBYTE(v27) = v15 - *(unsigned char *)v14;
  p_dst = (void **)&__dst;
  if (v12) {
LABEL_39:
  }
    memmove(p_dst, v17, v12);
LABEL_40:
  *((unsigned char *)p_dst + v12) = 0;
  if (v27 >= 0) {
    char v20 = (void **)&__dst;
  }
  else {
    char v20 = __dst;
  }
  if (v27 >= 0) {
    uint64_t v21 = HIBYTE(v27);
  }
  else {
    uint64_t v21 = v26;
  }
  sub_100006918(v8, (uint64_t)v20, v21);
  if (SHIBYTE(v27) < 0)
  {
    operator delete(__dst);
    uint64_t v22 = (std::string *)(v1 + 136);
    if ((*(char *)(v1 + 159) & 0x80000000) == 0)
    {
LABEL_48:
      *(void *)(v1 + 136) = 0;
      *(unsigned char *)(v1 + 159) = 0;
      *(void *)(v1 + 160) = 0;
      int v23 = *(_DWORD *)(v1 + 168);
      if ((v23 & 8) == 0) {
        goto LABEL_49;
      }
LABEL_53:
      *(void *)(v1 + 160) = v22;
      *(void *)(v1 + 88) = v22;
      *(void *)(v1 + 96) = v22;
      *(void *)(v1 + 104) = v22;
      if ((v23 & 0x10) == 0) {
        return;
      }
      goto LABEL_54;
    }
  }
  else
  {
    uint64_t v22 = (std::string *)(v1 + 136);
    if ((*(char *)(v1 + 159) & 0x80000000) == 0) {
      goto LABEL_48;
    }
  }
  operator delete(v22->__r_.__value_.__l.__data_);
  *(void *)(v1 + 136) = 0;
  *(unsigned char *)(v1 + 159) = 0;
  *(void *)(v1 + 160) = 0;
  int v23 = *(_DWORD *)(v1 + 168);
  if ((v23 & 8) != 0) {
    goto LABEL_53;
  }
LABEL_49:
  if ((v23 & 0x10) == 0) {
    return;
  }
LABEL_54:
  *(void *)(v1 + 160) = v22;
  std::string::append(v22, 0x16uLL, 0);
  if (*(char *)(v1 + 159) < 0) {
    uint64_t v24 = *(void *)(v1 + 144);
  }
  else {
    uint64_t v24 = *(unsigned __int8 *)(v1 + 159);
  }
  *(void *)(v1 + 112) = v22;
  *(void *)(v1 + 120) = v22;
  *(void *)(v1 + 128) = (char *)v22 + v24;
}

void sub_100006F18(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *sub_100006F34(uint64_t a1, uint64_t a2)
{
  uint64_t result = (void *)(a1 + 40);
  if (*(char *)(a2 + 63) < 0) {
    return sub_100004940(result, *(void **)(a2 + 40), *(void *)(a2 + 48));
  }
  long long v3 = *(_OWORD *)(a2 + 40);
  result[2] = *(void *)(a2 + 56);
  *(_OWORD *)uint64_t result = v3;
  return result;
}

void sub_100006F64(uint64_t a1)
{
  if (*(char *)(a1 + 63) < 0) {
    operator delete(*(void **)(a1 + 40));
  }
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return _CFRunLoopGetMain();
}

void CFRunLoopRun(void)
{
}

void CFRunLoopStop(CFRunLoopRef rl)
{
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

void _Exit(int a1)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t capabilities::abs::ABMLogEnabled(capabilities::abs *this)
{
  return capabilities::abs::ABMLogEnabled(this);
}

uint64_t abm::HelperServer::stop(abm::HelperServer *this)
{
  return abm::HelperServer::stop(this);
}

uint64_t abm::HelperServer::start(abm::HelperServer *this)
{
  return abm::HelperServer::start(this);
}

uint64_t abm::HelperServer::create()
{
  return abm::HelperServer::create();
}

uint64_t abm::HelperServer::isBusy(abm::HelperServer *this)
{
  return abm::HelperServer::isBusy(this);
}

uint64_t ctu::OsLogContext::OsLogContext(ctu::OsLogContext *this, const char *a2, const char *a3)
{
  return ctu::OsLogContext::OsLogContext(this, a2, a3);
}

uint64_t ctu::OsLogContext::OsLogContext(ctu::OsLogContext *this, const ctu::OsLogContext *a2)
{
  return ctu::OsLogContext::OsLogContext(this, a2);
}

void ctu::OsLogContext::~OsLogContext(ctu::OsLogContext *this)
{
}

uint64_t ctu::tokenize()
{
  return ctu::tokenize();
}

uint64_t ctu::LogServer::close(ctu::LogServer *this)
{
  return ctu::LogServer::close(this);
}

uint64_t ctu::LogServer::start(ctu::LogServer *this)
{
  return ctu::LogServer::start(this);
}

uint64_t ctu::LogServer::create()
{
  return ctu::LogServer::create();
}

uint64_t ctu::LogServer::addWriter()
{
  return ctu::LogServer::addWriter();
}

uint64_t ctu::operator<<()
{
  return ctu::operator<<();
}

uint64_t ctu::LogServer::flush(ctu::LogServer *this)
{
  return ctu::LogServer::flush(this);
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

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return std::string::append(this, __s, __n);
}

std::string *__cdecl std::string::append(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  return std::string::append(this, __n, __c);
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

uint64_t std::ostream::put()
{
  return std::ostream::put();
}

uint64_t std::ostream::flush()
{
  return std::ostream::flush();
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

uint64_t std::ofstream::open()
{
  return std::ofstream::open();
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

void std::terminate(void)
{
}

void operator delete(void *__p)
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

void __cxa_rethrow(void)
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

const char *getprogname(void)
{
  return _getprogname();
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

int mkdir(const char *a1, mode_t a2)
{
  return _mkdir(a1, a2);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t sCanHostHelperServer()
{
  return _sCanHostHelperServer();
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
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