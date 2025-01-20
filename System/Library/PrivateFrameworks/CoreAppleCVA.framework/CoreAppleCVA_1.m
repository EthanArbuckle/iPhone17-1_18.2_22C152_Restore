uint64_t *cva::ProgramOptions::display_help(uint64_t **this, const cva::ProgramOptions::Description *a2)
{
  uint64_t *v4;
  void *v5;
  size_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  unsigned char *v10;
  unsigned char *v11;
  unsigned char *v12;
  int v13;
  std::locale::id *v14;
  const std::locale::facet *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  const std::locale::facet *v24;
  const std::locale::facet *v25;
  unint64_t v26;
  unsigned char *v27;
  const void *v28;
  size_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  std::locale::id *v33;
  const std::locale::facet *v34;
  void **v35;
  uint64_t v36;
  const std::locale::facet *v37;
  const std::locale::facet *v38;
  const std::locale::facet *v39;
  size_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  std::locale::id *v45;
  const std::locale::facet *v46;
  void **v47;
  uint64_t v48;
  const std::locale::facet *v49;
  const std::locale::facet *v50;
  void *__p[2];
  int64_t v52;
  std::locale v53;

  v4 = *this;
  v5 = *this + 6;
  v6 = *((unsigned __int8 *)*this + 71);
  if (*((char *)*this + 71) < 0)
  {
    v7 = v4[6];
    v8 = v4[7];
  }
  else
  {
    v7 = (uint64_t)(*this + 6);
    v8 = *((unsigned __int8 *)*this + 71);
  }
  v9 = (void *)MEMORY[0x263F8C100];
  if (!v8)
  {
LABEL_8:
    v12 = 0;
    v13 = 1;
    goto LABEL_9;
  }
  v10 = (unsigned char *)(v7 + v8);
  v11 = (unsigned char *)v7;
  while (*v11 != 10)
  {
    ++v11;
    if (!--v8) {
      goto LABEL_8;
    }
  }
  v12 = 0;
  v13 = 1;
  if (v11 != v10)
  {
    v27 = &v11[-v7];
    if (&v11[-v7] != (unsigned char *)-1)
    {
      if ((v6 & 0x80) != 0)
      {
        v28 = (const void *)v4[6];
        v6 = v4[7];
      }
      else
      {
        v28 = *this + 6;
      }
      if (v6 >= (unint64_t)v27) {
        v41 = (size_t)&v11[-v7];
      }
      else {
        v41 = v6;
      }
      if (v41 > 0x7FFFFFFFFFFFFFF7) {
LABEL_77:
      }
        abort();
      if (v41 >= 0x17)
      {
        v43 = (v41 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v41 | 7) != 0x17) {
          v43 = v41 | 7;
        }
        v44 = v43 + 1;
        v42 = operator new(v43 + 1);
        __p[1] = (void *)v41;
        v52 = v44 | 0x8000000000000000;
        __p[0] = v42;
      }
      else
      {
        HIBYTE(v52) = v41;
        v42 = __p;
        if (!v41) {
          goto LABEL_68;
        }
      }
      memmove(v42, v28, v41);
LABEL_68:
      *((unsigned char *)v42 + v41) = 0;
      sub_2153C1168(v9, (uint64_t)"BRIEF:", 6);
      std::ios_base::getloc((const std::ios_base *)((char *)v9 + *(void *)(*v9 - 24)));
      v45 = (std::locale::id *)MEMORY[0x263F8C108];
      v46 = std::locale::use_facet(&v53, MEMORY[0x263F8C108]);
      ((void (*)(const std::locale::facet *, uint64_t))v46->__vftable[2].~facet_0)(v46, 10);
      std::locale::~locale(&v53);
      std::ostream::put();
      std::ostream::flush();
      if (v52 >= 0) {
        v47 = __p;
      }
      else {
        v47 = (void **)__p[0];
      }
      if (v52 >= 0) {
        v48 = HIBYTE(v52);
      }
      else {
        v48 = (uint64_t)__p[1];
      }
      sub_2153C1168(v9, (uint64_t)v47, v48);
      std::ios_base::getloc((const std::ios_base *)((char *)v9 + *(void *)(*v9 - 24)));
      v49 = std::locale::use_facet(&v53, v45);
      ((void (*)(const std::locale::facet *, uint64_t))v49->__vftable[2].~facet_0)(v49, 10);
      std::locale::~locale(&v53);
      std::ostream::put();
      std::ostream::flush();
      std::ios_base::getloc((const std::ios_base *)((char *)v9 + *(void *)(*v9 - 24)));
      v50 = std::locale::use_facet(&v53, v45);
      ((void (*)(const std::locale::facet *, uint64_t))v50->__vftable[2].~facet_0)(v50, 10);
      std::locale::~locale(&v53);
      std::ostream::put();
      std::ostream::flush();
      if (SHIBYTE(v52) < 0) {
        operator delete(__p[0]);
      }
      v13 = 0;
      v12 = v27 + 1;
    }
  }
LABEL_9:
  sub_2153C1168(v9, (uint64_t)"SYNOPSIS:", 9);
  std::ios_base::getloc((const std::ios_base *)((char *)v9 + *(void *)(*v9 - 24)));
  v14 = (std::locale::id *)MEMORY[0x263F8C108];
  v15 = std::locale::use_facet((const std::locale *)__p, MEMORY[0x263F8C108]);
  ((void (*)(const std::locale::facet *, uint64_t))v15->__vftable[2].~facet_0)(v15, 10);
  std::locale::~locale((std::locale *)__p);
  std::ostream::put();
  std::ostream::flush();
  v16 = *((char *)*this + 23);
  if (v16 >= 0) {
    v17 = (uint64_t)*this;
  }
  else {
    v17 = **this;
  }
  if (v16 >= 0) {
    v18 = *((unsigned __int8 *)*this + 23);
  }
  else {
    v18 = (*this)[1];
  }
  v19 = sub_2153C1168(v9, v17, v18);
  v20 = sub_2153C1168(v19, (uint64_t)" ", 1);
  v21 = *((char *)*this + 47);
  if (v21 >= 0) {
    v22 = (uint64_t)(*this + 3);
  }
  else {
    v22 = (*this)[3];
  }
  if (v21 >= 0) {
    v23 = *((unsigned __int8 *)*this + 47);
  }
  else {
    v23 = (*this)[4];
  }
  sub_2153C1168(v20, v22, v23);
  std::ios_base::getloc((const std::ios_base *)((char *)v9 + *(void *)(*v9 - 24)));
  v24 = std::locale::use_facet((const std::locale *)__p, v14);
  ((void (*)(const std::locale::facet *, uint64_t))v24->__vftable[2].~facet_0)(v24, 10);
  std::locale::~locale((std::locale *)__p);
  std::ostream::put();
  std::ostream::flush();
  std::ios_base::getloc((const std::ios_base *)((char *)v9 + *(void *)(*v9 - 24)));
  v25 = std::locale::use_facet((const std::locale *)__p, v14);
  ((void (*)(const std::locale::facet *, uint64_t))v25->__vftable[2].~facet_0)(v25, 10);
  std::locale::~locale((std::locale *)__p);
  std::ostream::put();
  std::ostream::flush();
  v26 = *((unsigned __int8 *)v4 + 71);
  if (*((char *)v4 + 71) < 0)
  {
    if (!v4[7]) {
      goto LABEL_55;
    }
  }
  else if (!*((unsigned char *)v4 + 71))
  {
    goto LABEL_55;
  }
  if (!v13)
  {
    if ((v26 & 0x80) != 0)
    {
      v26 = v4[7];
      if (v26 < (unint64_t)v12) {
        goto LABEL_77;
      }
      v5 = (void *)*v5;
    }
    else if ((unint64_t)v12 > v26)
    {
      goto LABEL_77;
    }
    v29 = v26 - (void)v12;
    if (v26 - (unint64_t)v12 > 0x7FFFFFFFFFFFFFF7) {
      goto LABEL_77;
    }
    if (v29 >= 0x17)
    {
      v31 = (v29 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v29 | 7) != 0x17) {
        v31 = v29 | 7;
      }
      v32 = v31 + 1;
      v30 = operator new(v31 + 1);
      __p[1] = (void *)v29;
      v52 = v32 | 0x8000000000000000;
      __p[0] = v30;
    }
    else
    {
      HIBYTE(v52) = v26 - (_BYTE)v12;
      v30 = __p;
      if ((unsigned char *)v26 == v12) {
        goto LABEL_46;
      }
    }
    memmove(v30, &v12[(void)v5], v29);
LABEL_46:
    *((unsigned char *)v30 + v29) = 0;
    goto LABEL_47;
  }
  if ((v26 & 0x80) != 0)
  {
    sub_2153C0AE4(__p, (void *)v4[6], v4[7]);
  }
  else
  {
    *(_OWORD *)__p = *(_OWORD *)v5;
    v52 = v5[2];
  }
LABEL_47:
  sub_2153C1168(v9, (uint64_t)"DESCRIPTION:", 12);
  std::ios_base::getloc((const std::ios_base *)((char *)v9 + *(void *)(*v9 - 24)));
  v33 = (std::locale::id *)MEMORY[0x263F8C108];
  v34 = std::locale::use_facet(&v53, MEMORY[0x263F8C108]);
  ((void (*)(const std::locale::facet *, uint64_t))v34->__vftable[2].~facet_0)(v34, 10);
  std::locale::~locale(&v53);
  std::ostream::put();
  std::ostream::flush();
  if (v52 >= 0) {
    v35 = __p;
  }
  else {
    v35 = (void **)__p[0];
  }
  if (v52 >= 0) {
    v36 = HIBYTE(v52);
  }
  else {
    v36 = (uint64_t)__p[1];
  }
  sub_2153C1168(v9, (uint64_t)v35, v36);
  std::ios_base::getloc((const std::ios_base *)((char *)v9 + *(void *)(*v9 - 24)));
  v37 = std::locale::use_facet(&v53, v33);
  ((void (*)(const std::locale::facet *, uint64_t))v37->__vftable[2].~facet_0)(v37, 10);
  std::locale::~locale(&v53);
  std::ostream::put();
  std::ostream::flush();
  std::ios_base::getloc((const std::ios_base *)((char *)v9 + *(void *)(*v9 - 24)));
  v38 = std::locale::use_facet(&v53, v33);
  ((void (*)(const std::locale::facet *, uint64_t))v38->__vftable[2].~facet_0)(v38, 10);
  std::locale::~locale(&v53);
  std::ostream::put();
  std::ostream::flush();
  if (SHIBYTE(v52) < 0) {
    operator delete(__p[0]);
  }
LABEL_55:
  sub_2153C1168(v9, (uint64_t)"OPTIONS:", 8);
  std::ios_base::getloc((const std::ios_base *)((char *)v9 + *(void *)(*v9 - 24)));
  v39 = std::locale::use_facet((const std::locale *)__p, MEMORY[0x263F8C108]);
  ((void (*)(const std::locale::facet *, uint64_t))v39->__vftable[2].~facet_0)(v39, 10);
  std::locale::~locale((std::locale *)__p);
  std::ostream::put();
  std::ostream::flush();
  return cva::ProgramOptions::Description::display_help((uint64_t *)a2);
}

void cva::ProgramOptions::Description::set_default_arguments(uint64_t *a1, uint64_t **a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  if (*a1 != v3)
  {
    do
    {
      if (!*(void *)(v2 + 48)) {
        goto LABEL_4;
      }
      if (*(char *)(v2 + 23) < 0)
      {
        sub_2153C0AE4(__p, *(void **)v2, *(void *)(v2 + 8));
      }
      else
      {
        *(_OWORD *)__p = *(_OWORD *)v2;
        uint64_t v16 = *(void *)(v2 + 16);
      }
      v5 = (long long *)(v2 + 24);
      if (*(char *)(v2 + 47) < 0)
      {
        sub_2153C0AE4(&v17, *(void **)(v2 + 24), *(void *)(v2 + 32));
      }
      else
      {
        long long v17 = *v5;
        uint64_t v18 = *(void *)(v2 + 40);
      }
      v6 = sub_2154318D8(a2, __p, (uint64_t)__p);
      uint64_t v7 = *((void *)v6 + 10);
      uint64_t v8 = *((void *)v6 + 11);
      if (SHIBYTE(v18) < 0)
      {
        operator delete((void *)v17);
        if ((SHIBYTE(v16) & 0x80000000) == 0)
        {
LABEL_16:
          if (v7 != v8) {
            goto LABEL_4;
          }
          goto LABEL_17;
        }
      }
      else if ((SHIBYTE(v16) & 0x80000000) == 0)
      {
        goto LABEL_16;
      }
      operator delete(__p[0]);
      if (v7 != v8) {
        goto LABEL_4;
      }
LABEL_17:
      if (*(char *)(v2 + 23) < 0)
      {
        sub_2153C0AE4(__p, *(void **)v2, *(void *)(v2 + 8));
        if ((*(char *)(v2 + 47) & 0x80000000) == 0)
        {
LABEL_19:
          long long v17 = *v5;
          uint64_t v18 = *(void *)(v2 + 40);
          goto LABEL_22;
        }
      }
      else
      {
        *(_OWORD *)__p = *(_OWORD *)v2;
        uint64_t v16 = *(void *)(v2 + 16);
        if ((*(char *)(v2 + 47) & 0x80000000) == 0) {
          goto LABEL_19;
        }
      }
      sub_2153C0AE4(&v17, *(void **)(v2 + 24), *(void *)(v2 + 32));
LABEL_22:
      v9 = sub_2154318D8(a2, __p, (uint64_t)__p);
      v10 = v9;
      uint64_t v11 = *(void *)(v2 + 48);
      unint64_t v12 = *((void *)v9 + 11);
      if (v12 >= *((void *)v9 + 12))
      {
        v14 = sub_21541857C((uint64_t)(v9 + 80), v11);
      }
      else
      {
        if (*(char *)(v11 + 23) < 0)
        {
          sub_2153C0AE4(*((unsigned char **)v9 + 11), *(void **)v11, *(void *)(v11 + 8));
        }
        else
        {
          long long v13 = *(_OWORD *)v11;
          *(void *)(v12 + 16) = *(void *)(v11 + 16);
          *(_OWORD *)unint64_t v12 = v13;
        }
        v14 = (char *)(v12 + 24);
      }
      *((void *)v10 + 11) = v14;
      if (SHIBYTE(v18) < 0)
      {
        operator delete((void *)v17);
        if (SHIBYTE(v16) < 0) {
LABEL_32:
        }
          operator delete(__p[0]);
      }
      else if (SHIBYTE(v16) < 0)
      {
        goto LABEL_32;
      }
LABEL_4:
      v2 += 96;
    }
    while (v2 != v3);
  }
}

uint64_t *cva::ProgramOptions::Description::display_help(uint64_t *this)
{
  uint64_t v1 = *this;
  uint64_t v2 = this[1];
  if (*this != v2)
  {
    uint64_t v3 = (void *)MEMORY[0x263F8C100];
    v4 = (std::locale::id *)MEMORY[0x263F8C108];
    do
    {
      if (*(char *)(v1 + 47) < 0)
      {
        if (*(void *)(v1 + 32)) {
          goto LABEL_17;
        }
      }
      else if (*(unsigned char *)(v1 + 47))
      {
        goto LABEL_17;
      }
      if (*(char *)(v1 + 23) < 0)
      {
        if (!*(void *)(v1 + 8))
        {
LABEL_50:
          v5 = v3;
          v6 = "\n\n";
          uint64_t v7 = 2;
          goto LABEL_4;
        }
      }
      else if (!*(unsigned char *)(v1 + 23))
      {
        goto LABEL_50;
      }
LABEL_17:
      if ((*(unsigned char *)(v1 + 47) & 0x80) != 0)
      {
        if (!*(void *)(v1 + 32))
        {
LABEL_29:
          long long v17 = sub_2153C1168(v3, (uint64_t)"--", 2);
          int v18 = *(char *)(v1 + 23);
          if (v18 >= 0) {
            v19 = (const char *)v1;
          }
          else {
            v19 = *(const char **)v1;
          }
          if (v18 >= 0) {
            uint64_t v20 = *(unsigned __int8 *)(v1 + 23);
          }
          else {
            uint64_t v20 = *(void *)(v1 + 8);
          }
          goto LABEL_43;
        }
      }
      else if (!*(unsigned char *)(v1 + 47))
      {
        goto LABEL_29;
      }
      long long v13 = sub_2153C1168(v3, (uint64_t)"-", 1);
      int v14 = *(char *)(v1 + 47);
      if (v14 >= 0) {
        uint64_t v15 = v1 + 24;
      }
      else {
        uint64_t v15 = *(void *)(v1 + 24);
      }
      if (v14 >= 0) {
        uint64_t v16 = *(unsigned __int8 *)(v1 + 47);
      }
      else {
        uint64_t v16 = *(void *)(v1 + 32);
      }
      sub_2153C1168(v13, v15, v16);
      if (*(char *)(v1 + 23) < 0)
      {
        if (!*(void *)(v1 + 8)) {
          goto LABEL_44;
        }
LABEL_36:
        v21 = sub_2153C1168(v3, (uint64_t)" [ --", 5);
        int v22 = *(char *)(v1 + 23);
        if (v22 >= 0) {
          uint64_t v23 = v1;
        }
        else {
          uint64_t v23 = *(void *)v1;
        }
        if (v22 >= 0) {
          uint64_t v24 = *(unsigned __int8 *)(v1 + 23);
        }
        else {
          uint64_t v24 = *(void *)(v1 + 8);
        }
        long long v17 = sub_2153C1168(v21, v23, v24);
        v19 = " ]";
        uint64_t v20 = 2;
LABEL_43:
        sub_2153C1168(v17, (uint64_t)v19, v20);
        goto LABEL_44;
      }
      if (*(unsigned char *)(v1 + 23)) {
        goto LABEL_36;
      }
LABEL_44:
      if (*(_DWORD *)(v1 + 88))
      {
        sub_2153C1168(v3, (uint64_t)" ", 1);
        v25 = *(long long **)(v1 + 48);
        if (!v25) {
          goto LABEL_53;
        }
        if (*((char *)v25 + 23) < 0)
        {
          unint64_t v27 = *((void *)v25 + 1);
          if (!v27) {
            goto LABEL_53;
          }
          sub_2153C0AE4(__p, *(void **)v25, v27);
        }
        else
        {
          if (*((unsigned char *)v25 + 23))
          {
            long long v26 = *v25;
            uint64_t v31 = *((void *)v25 + 2);
            *(_OWORD *)__p = v26;
            goto LABEL_54;
          }
LABEL_53:
          HIBYTE(v31) = 3;
          LODWORD(__p[0]) = 6779489;
        }
LABEL_54:
        if (v31 >= 0) {
          v28 = __p;
        }
        else {
          v28 = (void **)__p[0];
        }
        if (v31 >= 0) {
          uint64_t v29 = HIBYTE(v31);
        }
        else {
          uint64_t v29 = (uint64_t)__p[1];
        }
        sub_2153C1168(v3, (uint64_t)v28, v29);
        if (SHIBYTE(v31) < 0) {
          operator delete(__p[0]);
        }
      }
      v5 = v3;
      v6 = "\n";
      uint64_t v7 = 1;
LABEL_4:
      uint64_t v8 = sub_2153C1168(v5, (uint64_t)v6, v7);
      int v9 = *(char *)(v1 + 87);
      if (v9 >= 0) {
        uint64_t v10 = v1 + 64;
      }
      else {
        uint64_t v10 = *(void *)(v1 + 64);
      }
      if (v9 >= 0) {
        uint64_t v11 = *(unsigned __int8 *)(v1 + 87);
      }
      else {
        uint64_t v11 = *(void *)(v1 + 72);
      }
      sub_2153C1168(v8, v10, v11);
      sub_2153C1168(v3, (uint64_t)"\n", 1);
      std::ios_base::getloc((const std::ios_base *)((char *)v3 + *(void *)(*v3 - 24)));
      unint64_t v12 = std::locale::use_facet((const std::locale *)__p, v4);
      ((void (*)(const std::locale::facet *, uint64_t))v12->__vftable[2].~facet_0)(v12, 10);
      std::locale::~locale((std::locale *)__p);
      std::ostream::put();
      this = (uint64_t *)std::ostream::flush();
      v1 += 96;
    }
    while (v1 != v2);
  }
  return this;
}

std::string *sub_215433E98(std::string *__str, std::string *a2, std::string *this)
{
  if (__str != a2)
  {
    v4 = __str;
    do
    {
      v6 = this;
      std::string::operator=(this, v4);
      uint64_t v7 = v4 + 1;
      std::string::operator=(v6 + 1, v4 + 1);
      std::string::pointer data = v4[2].__r_.__value_.__l.__data_;
      std::string::size_type size = v4[2].__r_.__value_.__l.__size_;
      if (size) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(size + 8), 1uLL, memory_order_relaxed);
      }
      uint64_t v10 = (std::__shared_weak_count *)v6[2].__r_.__value_.__l.__size_;
      v6[2].__r_.__value_.__r.__words[0] = (std::string::size_type)data;
      v6[2].__r_.__value_.__l.__size_ = size;
      if (v10 && !atomic_fetch_add(&v10->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
        std::__shared_weak_count::__release_weak(v10);
      }
      std::string::operator=((std::string *)((char *)v6 + 64), (std::string *)((char *)v7 + 40));
      std::string::value_type v5 = v7[2].__r_.__value_.__s.__data_[20];
      LODWORD(v6[3].__r_.__value_.__r.__words[2]) = v7[2].__r_.__value_.__r.__words[2];
      v6[3].__r_.__value_.__s.__data_[20] = v5;
      v4 = v7 + 3;
      this = v6 + 4;
    }
    while (&v7[3] != a2);
    return v6 + 4;
  }
  return this;
}

uint64_t sub_215433FA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v6 = 0;
    do
    {
      uint64_t v9 = a3 + v6;
      uint64_t v10 = (long long *)(a1 + v6);
      if (*(char *)(a1 + v6 + 23) < 0)
      {
        sub_2153C0AE4((unsigned char *)v9, *(void **)v10, *((void *)v10 + 1));
      }
      else
      {
        long long v11 = *v10;
        *(void *)(v9 + 16) = *((void *)v10 + 2);
        *(_OWORD *)uint64_t v9 = v11;
      }
      unint64_t v12 = (unsigned char *)(a3 + v6 + 24);
      long long v13 = (void **)(a1 + v6 + 24);
      if (*(char *)(a1 + v6 + 47) < 0)
      {
        sub_2153C0AE4(v12, *v13, *(void *)(a1 + v6 + 32));
      }
      else
      {
        long long v14 = *(_OWORD *)v13;
        *(void *)(a3 + v6 + 40) = *(void *)(a1 + v6 + 40);
        *(_OWORD *)unint64_t v12 = v14;
      }
      uint64_t v15 = a3 + v6;
      uint64_t v16 = a1 + v6;
      uint64_t v17 = *(void *)(a1 + v6 + 56);
      *(void *)(v15 + 48) = *(void *)(a1 + v6 + 48);
      *(void *)(v15 + 56) = v17;
      if (v17) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(v17 + 8), 1uLL, memory_order_relaxed);
      }
      uint64_t v18 = v15 + 64;
      v19 = (void **)(v16 + 64);
      if (*(char *)(v16 + 87) < 0)
      {
        sub_2153C0AE4((unsigned char *)v18, *v19, *(void *)(a1 + v6 + 72));
      }
      else
      {
        long long v20 = *(_OWORD *)v19;
        *(void *)(v18 + 16) = *(void *)(v16 + 80);
        *(_OWORD *)uint64_t v18 = v20;
      }
      uint64_t v7 = a3 + v6;
      int v8 = *(_DWORD *)(a1 + v6 + 88);
      *(unsigned char *)(v7 + 92) = *(unsigned char *)(a1 + v6 + 92);
      *(_DWORD *)(v7 + 88) = v8;
      v6 += 96;
    }
    while (a1 + v6 != a2);
    a3 += v6;
  }
  return a3;
}

BOOL cva::ProgramOptions::Description::has(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  if (*a1 == v3) {
    return 0;
  }
  do
  {
    BOOL result = sub_215431814(v2, a2);
    if (result) {
      break;
    }
    v2 += 96;
  }
  while (v2 != v3);
  return result;
}

uint64_t cva::ProgramOptions::Description::expected_args(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  if (*a1 == v3) {
    return 0;
  }
  while (!sub_215431814(v2, a2))
  {
    v2 += 96;
    if (v2 == v3) {
      return 0;
    }
  }
  return *(unsigned int *)(v2 + 88);
}

BOOL cva::ProgramOptions::has(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(unsigned __int8 *)(a2 + 23);
  if ((v2 & 0x80u) != 0) {
    uint64_t v2 = *(void *)(a2 + 8);
  }
  if (!v2) {
    return 0;
  }
  uint64_t v3 = *(unsigned __int8 **)(*(void *)a1 + 96);
  uint64_t v4 = *(void *)a1 + 104;
  if (v3 == (unsigned __int8 *)v4) {
    return 0;
  }
  do
  {
    BOOL result = sub_215431AC8(v3 + 32, a2);
    if (result) {
      break;
    }
    uint64_t v7 = (unsigned __int8 *)*((void *)v3 + 1);
    if (v7)
    {
      do
      {
        int v8 = v7;
        uint64_t v7 = *(unsigned __int8 **)v7;
      }
      while (v7);
    }
    else
    {
      do
      {
        int v8 = (unsigned __int8 *)*((void *)v3 + 2);
        BOOL v9 = *(void *)v8 == (void)v3;
        uint64_t v3 = v8;
      }
      while (!v9);
    }
    uint64_t v3 = v8;
  }
  while (v8 != (unsigned __int8 *)v4);
  return result;
}

void cva::ProgramOptions::as_string(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = *(void **)(*(void *)a1 + 96);
  uint64_t v5 = *(void *)a1 + 104;
  if (v4 == (void *)v5)
  {
LABEL_11:
    if (atomic_load_explicit((atomic_uchar *volatile)&qword_267869BD8, memory_order_acquire))
    {
      uint64_t v10 = &qword_267869BC0;
    }
    else
    {
      uint64_t v10 = &qword_267869BC0;
      if (__cxa_guard_acquire(&qword_267869BD8))
      {
        qword_267869BC0 = 0;
        *(void *)algn_267869BC8 = 0;
        qword_267869BD0 = 0;
        __cxa_atexit((void (*)(void *))sub_215432484, &qword_267869BC0, &dword_2153B7000);
        __cxa_guard_release(&qword_267869BD8);
      }
    }
  }
  else
  {
    while (!sub_215431AC8((unsigned __int8 *)v4 + 32, a2))
    {
      uint64_t v7 = (void *)v4[1];
      if (v7)
      {
        do
        {
          int v8 = v7;
          uint64_t v7 = (void *)*v7;
        }
        while (v7);
      }
      else
      {
        do
        {
          int v8 = (void *)v4[2];
          BOOL v9 = *v8 == (void)v4;
          uint64_t v4 = v8;
        }
        while (!v9);
      }
      uint64_t v4 = v8;
      if (v8 == (void *)v5) {
        goto LABEL_11;
      }
    }
    uint64_t v10 = v4 + 10;
  }
  uint64_t v11 = *v10;
  if (*v10 == v10[1])
  {
    *(unsigned char *)(a3 + 23) = 0;
    *(unsigned char *)a3 = 0;
  }
  else if (*(char *)(v11 + 23) < 0)
  {
    unint64_t v12 = *(void **)v11;
    unint64_t v13 = *(void *)(v11 + 8);
    sub_2153C0AE4((unsigned char *)a3, v12, v13);
  }
  else
  {
    *(_OWORD *)a3 = *(_OWORD *)v11;
    *(void *)(a3 + 16) = *(void *)(v11 + 16);
  }
}

uint64_t *cva::ProgramOptions::as_vector_string(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(unsigned __int8 **)(*(void *)a1 + 96);
  uint64_t v3 = *(void *)a1 + 104;
  if (v2 == (unsigned __int8 *)v3)
  {
LABEL_11:
    if (atomic_load_explicit((atomic_uchar *volatile)&qword_267869BD8, memory_order_acquire))
    {
      return &qword_267869BC0;
    }
    else
    {
      int v8 = &qword_267869BC0;
      if (__cxa_guard_acquire(&qword_267869BD8))
      {
        qword_267869BC0 = 0;
        *(void *)algn_267869BC8 = 0;
        qword_267869BD0 = 0;
        __cxa_atexit((void (*)(void *))sub_215432484, &qword_267869BC0, &dword_2153B7000);
        __cxa_guard_release(&qword_267869BD8);
      }
    }
  }
  else
  {
    while (!sub_215431AC8(v2 + 32, a2))
    {
      uint64_t v5 = (unsigned __int8 *)*((void *)v2 + 1);
      if (v5)
      {
        do
        {
          uint64_t v6 = v5;
          uint64_t v5 = *(unsigned __int8 **)v5;
        }
        while (v5);
      }
      else
      {
        do
        {
          uint64_t v6 = (unsigned __int8 *)*((void *)v2 + 2);
          BOOL v7 = *(void *)v6 == (void)v2;
          uint64_t v2 = v6;
        }
        while (!v7);
      }
      uint64_t v2 = v6;
      if (v6 == (unsigned __int8 *)v3) {
        goto LABEL_11;
      }
    }
    return (uint64_t *)(v2 + 80);
  }
  return v8;
}

const char *cva::ProgramOptions::as_c_str(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(*(void *)a1 + 96);
  uint64_t v3 = *(void *)a1 + 104;
  if (v2 == (void *)v3)
  {
LABEL_11:
    if (atomic_load_explicit((atomic_uchar *volatile)&qword_267869BD8, memory_order_acquire))
    {
      int v8 = &qword_267869BC0;
    }
    else
    {
      int v8 = &qword_267869BC0;
      if (__cxa_guard_acquire(&qword_267869BD8))
      {
        qword_267869BC0 = 0;
        *(void *)algn_267869BC8 = 0;
        qword_267869BD0 = 0;
        __cxa_atexit((void (*)(void *))sub_215432484, &qword_267869BC0, &dword_2153B7000);
        __cxa_guard_release(&qword_267869BD8);
      }
    }
  }
  else
  {
    while (!sub_215431AC8((unsigned __int8 *)v2 + 32, a2))
    {
      uint64_t v5 = (void *)v2[1];
      if (v5)
      {
        do
        {
          uint64_t v6 = v5;
          uint64_t v5 = (void *)*v5;
        }
        while (v5);
      }
      else
      {
        do
        {
          uint64_t v6 = (void *)v2[2];
          BOOL v7 = *v6 == (void)v2;
          uint64_t v2 = v6;
        }
        while (!v7);
      }
      uint64_t v2 = v6;
      if (v6 == (void *)v3) {
        goto LABEL_11;
      }
    }
    int v8 = v2 + 10;
  }
  BOOL result = (const char *)*v8;
  if (*v8 == v8[1]) {
    return "";
  }
  if (result[23] < 0) {
    return *(const char **)result;
  }
  return result;
}

uint64_t cva::ProgramOptions::as_int(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = cva::ProgramOptions::as_c_str(a1, a2);
  return atoi(v2);
}

BOOL cva::ProgramOptions::as_BOOL(uint64_t a1, uint64_t a2)
{
  cva::ProgramOptions::as_string(a1, a2, (uint64_t)&__p);
  uint64_t v2 = v28;
  int v3 = (char)v28;
  uint64_t v4 = v27;
  if ((v28 & 0x80u) != 0) {
    uint64_t v2 = v27;
  }
  switch(v2)
  {
    case 2:
      if ((v28 & 0x80u) == 0) {
        p_p = (char *)&__p;
      }
      else {
        p_p = (char *)__p;
      }
      __darwin_ct_rune_t v15 = *p_p;
      __darwin_ct_rune_t v16 = __toupper(111);
      if (v16 != __toupper(v15)) {
        goto LABEL_27;
      }
      __darwin_ct_rune_t v12 = p_p[1];
      __darwin_ct_rune_t v13 = 110;
      break;
    case 3:
      if ((v28 & 0x80u) == 0) {
        uint64_t v17 = (char *)&__p;
      }
      else {
        uint64_t v17 = (char *)__p;
      }
      __darwin_ct_rune_t v18 = *v17;
      __darwin_ct_rune_t v19 = __toupper(121);
      if (v19 != __toupper(v18)) {
        goto LABEL_27;
      }
      __darwin_ct_rune_t v20 = v17[1];
      __darwin_ct_rune_t v21 = __toupper(101);
      if (v21 != __toupper(v20)) {
        goto LABEL_27;
      }
      __darwin_ct_rune_t v12 = v17[2];
      __darwin_ct_rune_t v13 = 115;
      break;
    case 4:
      uint64_t v5 = (v28 & 0x80u) == 0 ? (char *)&__p : (char *)__p;
      __darwin_ct_rune_t v6 = *v5;
      __darwin_ct_rune_t v7 = __toupper(116);
      if (v7 != __toupper(v6)) {
        goto LABEL_27;
      }
      __darwin_ct_rune_t v8 = v5[1];
      __darwin_ct_rune_t v9 = __toupper(114);
      if (v9 != __toupper(v8)) {
        goto LABEL_27;
      }
      __darwin_ct_rune_t v10 = v5[2];
      __darwin_ct_rune_t v11 = __toupper(117);
      if (v11 != __toupper(v10)) {
        goto LABEL_27;
      }
      __darwin_ct_rune_t v12 = v5[3];
      __darwin_ct_rune_t v13 = 101;
      break;
    default:
      goto LABEL_27;
  }
  __darwin_ct_rune_t v22 = __toupper(v13);
  if (v22 == __toupper(v12))
  {
    BOOL v23 = 1;
    if (v3 < 0) {
      goto LABEL_36;
    }
    return v23;
  }
LABEL_27:
  if (v3 < 0)
  {
    if (v4 != 1)
    {
      BOOL v23 = 0;
LABEL_36:
      operator delete(__p);
      return v23;
    }
    uint64_t v24 = (unsigned __int8 *)__p;
  }
  else
  {
    if (v3 != 1) {
      return 0;
    }
    uint64_t v24 = (unsigned __int8 *)&__p;
  }
  BOOL v23 = *v24 == 49;
  if (v3 < 0) {
    goto LABEL_36;
  }
  return v23;
}

double cva::ProgramOptions::as_double(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = cva::ProgramOptions::as_c_str(a1, a2);
  return atof(v2);
}

float cva::ProgramOptions::as_float(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = cva::ProgramOptions::as_c_str(a1, a2);
  return atof(v2);
}

void cva::ProgramOptions::as_vector_int(uint64_t a1@<X0>, uint64_t a2@<X1>, int **a3@<X8>)
{
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  uint64_t v4 = *(void **)(*(void *)a1 + 96);
  uint64_t v5 = *(void *)a1 + 104;
  if (v4 == (void *)v5)
  {
LABEL_11:
    if (atomic_load_explicit((atomic_uchar *volatile)&qword_267869BD8, memory_order_acquire))
    {
      __darwin_ct_rune_t v10 = &qword_267869BC0;
    }
    else
    {
      __darwin_ct_rune_t v10 = &qword_267869BC0;
      if (__cxa_guard_acquire(&qword_267869BD8))
      {
        qword_267869BC0 = 0;
        *(void *)algn_267869BC8 = 0;
        qword_267869BD0 = 0;
        __cxa_atexit((void (*)(void *))sub_215432484, &qword_267869BC0, &dword_2153B7000);
        __cxa_guard_release(&qword_267869BD8);
      }
    }
  }
  else
  {
    while (!sub_215431AC8((unsigned __int8 *)v4 + 32, a2))
    {
      __darwin_ct_rune_t v7 = (void *)v4[1];
      if (v7)
      {
        do
        {
          __darwin_ct_rune_t v8 = v7;
          __darwin_ct_rune_t v7 = (void *)*v7;
        }
        while (v7);
      }
      else
      {
        do
        {
          __darwin_ct_rune_t v8 = (void *)v4[2];
          BOOL v9 = *v8 == (void)v4;
          uint64_t v4 = v8;
        }
        while (!v9);
      }
      uint64_t v4 = v8;
      if (v8 == (void *)v5) {
        goto LABEL_11;
      }
    }
    __darwin_ct_rune_t v10 = v4 + 10;
  }
  uint64_t v12 = *v10;
  uint64_t v11 = v10[1];
  if (v12 != v11)
  {
    __darwin_ct_rune_t v13 = *a3;
    uint64_t v33 = v11;
    do
    {
      if (*(char *)(v12 + 23) < 0)
      {
        sub_2153C0AE4(__p, *(void **)v12, *(void *)(v12 + 8));
      }
      else
      {
        *(_OWORD *)__p = *(_OWORD *)v12;
        uint64_t v35 = *(void *)(v12 + 16);
      }
      if (v35 >= 0) {
        long long v14 = __p;
      }
      else {
        long long v14 = (void **)__p[0];
      }
      int v15 = atoi((const char *)v14);
      int v16 = v15;
      __darwin_ct_rune_t v18 = a3[1];
      unint64_t v17 = (unint64_t)a3[2];
      if ((unint64_t)v18 >= v17)
      {
        uint64_t v20 = v18 - v13;
        unint64_t v21 = v20 + 1;
        if ((unint64_t)(v20 + 1) >> 62) {
          abort();
        }
        uint64_t v22 = v17 - (void)v13;
        if (v22 >> 1 > v21) {
          unint64_t v21 = v22 >> 1;
        }
        if ((unint64_t)v22 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v23 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v23 = v21;
        }
        if (v23)
        {
          if (v23 >> 62) {
            sub_2153E6200();
          }
          uint64_t v24 = operator new(4 * v23);
        }
        else
        {
          uint64_t v24 = 0;
        }
        v25 = (int *)&v24[4 * v20];
        int *v25 = v16;
        __darwin_ct_rune_t v19 = v25 + 1;
        if (v18 != v13)
        {
          unint64_t v26 = (char *)(v18 - 1) - (char *)v13;
          if (v26 < 0x2C) {
            goto LABEL_56;
          }
          if ((unint64_t)((char *)v13 - v24) < 0x20) {
            goto LABEL_56;
          }
          uint64_t v27 = (v26 >> 2) + 1;
          unsigned __int8 v28 = &v24[4 * v20 - 16];
          uint64_t v29 = v18 - 4;
          uint64_t v30 = v27 & 0x7FFFFFFFFFFFFFF8;
          do
          {
            long long v31 = *(_OWORD *)v29;
            *(v28 - 1) = *((_OWORD *)v29 - 1);
            *unsigned __int8 v28 = v31;
            v28 -= 2;
            v29 -= 8;
            v30 -= 8;
          }
          while (v30);
          v25 -= v27 & 0x7FFFFFFFFFFFFFF8;
          v18 -= v27 & 0x7FFFFFFFFFFFFFF8;
          if (v27 != (v27 & 0x7FFFFFFFFFFFFFF8))
          {
LABEL_56:
            do
            {
              int v32 = *--v18;
              *--v25 = v32;
            }
            while (v18 != v13);
          }
        }
        *a3 = v25;
        a3[1] = v19;
        a3[2] = (int *)&v24[4 * v23];
        if (v13) {
          operator delete(v13);
        }
        __darwin_ct_rune_t v13 = v25;
        uint64_t v11 = v33;
      }
      else
      {
        *__darwin_ct_rune_t v18 = v15;
        __darwin_ct_rune_t v19 = v18 + 1;
      }
      a3[1] = v19;
      if (SHIBYTE(v35) < 0) {
        operator delete(__p[0]);
      }
      v12 += 24;
    }
    while (v12 != v11);
  }
}

void cva::ProgramOptions::as_vector_double(uint64_t a1@<X0>, uint64_t a2@<X1>, double **a3@<X8>)
{
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  uint64_t v4 = *(void **)(*(void *)a1 + 96);
  uint64_t v5 = *(void *)a1 + 104;
  if (v4 == (void *)v5)
  {
LABEL_11:
    if (atomic_load_explicit((atomic_uchar *volatile)&qword_267869BD8, memory_order_acquire))
    {
      __darwin_ct_rune_t v10 = &qword_267869BC0;
    }
    else
    {
      __darwin_ct_rune_t v10 = &qword_267869BC0;
      if (__cxa_guard_acquire(&qword_267869BD8))
      {
        qword_267869BC0 = 0;
        *(void *)algn_267869BC8 = 0;
        qword_267869BD0 = 0;
        __cxa_atexit((void (*)(void *))sub_215432484, &qword_267869BC0, &dword_2153B7000);
        __cxa_guard_release(&qword_267869BD8);
      }
    }
  }
  else
  {
    while (!sub_215431AC8((unsigned __int8 *)v4 + 32, a2))
    {
      __darwin_ct_rune_t v7 = (void *)v4[1];
      if (v7)
      {
        do
        {
          __darwin_ct_rune_t v8 = v7;
          __darwin_ct_rune_t v7 = (void *)*v7;
        }
        while (v7);
      }
      else
      {
        do
        {
          __darwin_ct_rune_t v8 = (void *)v4[2];
          BOOL v9 = *v8 == (void)v4;
          uint64_t v4 = v8;
        }
        while (!v9);
      }
      uint64_t v4 = v8;
      if (v8 == (void *)v5) {
        goto LABEL_11;
      }
    }
    __darwin_ct_rune_t v10 = v4 + 10;
  }
  uint64_t v11 = *v10;
  uint64_t v12 = v10[1];
  if (*v10 != v12)
  {
    __darwin_ct_rune_t v13 = *a3;
    do
    {
      if (*(char *)(v11 + 23) < 0)
      {
        sub_2153C0AE4(__p, *(void **)v11, *(void *)(v11 + 8));
      }
      else
      {
        *(_OWORD *)__p = *(_OWORD *)v11;
        uint64_t v34 = *(void *)(v11 + 16);
      }
      if (v34 >= 0) {
        long long v14 = __p;
      }
      else {
        long long v14 = (void **)__p[0];
      }
      double v15 = atof((const char *)v14);
      double v16 = v15;
      __darwin_ct_rune_t v18 = a3[1];
      unint64_t v17 = (unint64_t)a3[2];
      if ((unint64_t)v18 >= v17)
      {
        uint64_t v20 = v18 - v13;
        unint64_t v21 = v20 + 1;
        if ((unint64_t)(v20 + 1) >> 61) {
          abort();
        }
        uint64_t v22 = v17 - (void)v13;
        if (v22 >> 2 > v21) {
          unint64_t v21 = v22 >> 2;
        }
        if ((unint64_t)v22 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v23 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v23 = v21;
        }
        if (v23)
        {
          if (v23 >> 61) {
            sub_2153E6200();
          }
          uint64_t v24 = operator new(8 * v23);
        }
        else
        {
          uint64_t v24 = 0;
        }
        v25 = (double *)&v24[8 * v20];
        double *v25 = v16;
        __darwin_ct_rune_t v19 = v25 + 1;
        if (v18 != v13)
        {
          unint64_t v26 = (char *)(v18 - 1) - (char *)v13;
          if (v26 < 0x58) {
            goto LABEL_54;
          }
          if ((unint64_t)((char *)v13 - v24) < 0x20) {
            goto LABEL_54;
          }
          uint64_t v27 = (v26 >> 3) + 1;
          unsigned __int8 v28 = &v24[8 * v20 - 16];
          uint64_t v29 = v18 - 2;
          uint64_t v30 = v27 & 0x3FFFFFFFFFFFFFFCLL;
          do
          {
            long long v31 = *(_OWORD *)v29;
            *(v28 - 1) = *((_OWORD *)v29 - 1);
            *unsigned __int8 v28 = v31;
            v28 -= 2;
            v29 -= 4;
            v30 -= 4;
          }
          while (v30);
          v25 -= v27 & 0x3FFFFFFFFFFFFFFCLL;
          v18 -= v27 & 0x3FFFFFFFFFFFFFFCLL;
          if (v27 != (v27 & 0x3FFFFFFFFFFFFFFCLL))
          {
LABEL_54:
            do
            {
              uint64_t v32 = *((void *)v18-- - 1);
              *((void *)v25-- - 1) = v32;
            }
            while (v18 != v13);
          }
        }
        *a3 = v25;
        a3[1] = v19;
        a3[2] = (double *)&v24[8 * v23];
        if (v13) {
          operator delete(v13);
        }
        __darwin_ct_rune_t v13 = v25;
      }
      else
      {
        *__darwin_ct_rune_t v18 = v15;
        __darwin_ct_rune_t v19 = v18 + 1;
      }
      a3[1] = v19;
      if (SHIBYTE(v34) < 0) {
        operator delete(__p[0]);
      }
      v11 += 24;
    }
    while (v11 != v12);
  }
}

void cva::ProgramOptions::as_vector_float(uint64_t a1@<X0>, uint64_t a2@<X1>, float **a3@<X8>)
{
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  uint64_t v4 = *(void **)(*(void *)a1 + 96);
  uint64_t v5 = *(void *)a1 + 104;
  if (v4 == (void *)v5)
  {
LABEL_11:
    if (atomic_load_explicit((atomic_uchar *volatile)&qword_267869BD8, memory_order_acquire))
    {
      __darwin_ct_rune_t v10 = &qword_267869BC0;
    }
    else
    {
      __darwin_ct_rune_t v10 = &qword_267869BC0;
      if (__cxa_guard_acquire(&qword_267869BD8))
      {
        qword_267869BC0 = 0;
        *(void *)algn_267869BC8 = 0;
        qword_267869BD0 = 0;
        __cxa_atexit((void (*)(void *))sub_215432484, &qword_267869BC0, &dword_2153B7000);
        __cxa_guard_release(&qword_267869BD8);
      }
    }
  }
  else
  {
    while (!sub_215431AC8((unsigned __int8 *)v4 + 32, a2))
    {
      __darwin_ct_rune_t v7 = (void *)v4[1];
      if (v7)
      {
        do
        {
          __darwin_ct_rune_t v8 = v7;
          __darwin_ct_rune_t v7 = (void *)*v7;
        }
        while (v7);
      }
      else
      {
        do
        {
          __darwin_ct_rune_t v8 = (void *)v4[2];
          BOOL v9 = *v8 == (void)v4;
          uint64_t v4 = v8;
        }
        while (!v9);
      }
      uint64_t v4 = v8;
      if (v8 == (void *)v5) {
        goto LABEL_11;
      }
    }
    __darwin_ct_rune_t v10 = v4 + 10;
  }
  uint64_t v11 = *v10;
  uint64_t v12 = v10[1];
  if (*v10 != v12)
  {
    __darwin_ct_rune_t v13 = *a3;
    do
    {
      if (*(char *)(v11 + 23) < 0)
      {
        sub_2153C0AE4(__p, *(void **)v11, *(void *)(v11 + 8));
      }
      else
      {
        *(_OWORD *)__p = *(_OWORD *)v11;
        uint64_t v33 = *(void *)(v11 + 16);
      }
      if (v33 >= 0) {
        long long v14 = __p;
      }
      else {
        long long v14 = (void **)__p[0];
      }
      float v15 = atof((const char *)v14);
      unint64_t v17 = a3[1];
      unint64_t v16 = (unint64_t)a3[2];
      if ((unint64_t)v17 >= v16)
      {
        uint64_t v19 = v17 - v13;
        unint64_t v20 = v19 + 1;
        if ((unint64_t)(v19 + 1) >> 62) {
          abort();
        }
        uint64_t v21 = v16 - (void)v13;
        if (v21 >> 1 > v20) {
          unint64_t v20 = v21 >> 1;
        }
        if ((unint64_t)v21 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v22 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v22 = v20;
        }
        if (v22)
        {
          if (v22 >> 62) {
            sub_2153E6200();
          }
          unint64_t v23 = operator new(4 * v22);
        }
        else
        {
          unint64_t v23 = 0;
        }
        uint64_t v24 = (float *)&v23[4 * v19];
        *uint64_t v24 = v15;
        __darwin_ct_rune_t v18 = v24 + 1;
        if (v17 != v13)
        {
          unint64_t v25 = (char *)(v17 - 1) - (char *)v13;
          if (v25 < 0x2C) {
            goto LABEL_54;
          }
          if ((unint64_t)((char *)v13 - v23) < 0x20) {
            goto LABEL_54;
          }
          uint64_t v26 = (v25 >> 2) + 1;
          uint64_t v27 = &v23[4 * v19 - 16];
          unsigned __int8 v28 = v17 - 4;
          uint64_t v29 = v26 & 0x7FFFFFFFFFFFFFF8;
          do
          {
            long long v30 = *(_OWORD *)v28;
            *(v27 - 1) = *((_OWORD *)v28 - 1);
            *uint64_t v27 = v30;
            v27 -= 2;
            v28 -= 8;
            v29 -= 8;
          }
          while (v29);
          v24 -= v26 & 0x7FFFFFFFFFFFFFF8;
          v17 -= v26 & 0x7FFFFFFFFFFFFFF8;
          if (v26 != (v26 & 0x7FFFFFFFFFFFFFF8))
          {
LABEL_54:
            do
            {
              int v31 = *((_DWORD *)v17-- - 1);
              *((_DWORD *)v24-- - 1) = v31;
            }
            while (v17 != v13);
          }
        }
        *a3 = v24;
        a3[1] = v18;
        a3[2] = (float *)&v23[4 * v22];
        if (v13) {
          operator delete(v13);
        }
        __darwin_ct_rune_t v13 = v24;
      }
      else
      {
        *unint64_t v17 = v15;
        __darwin_ct_rune_t v18 = v17 + 1;
      }
      a3[1] = v18;
      if (SHIBYTE(v33) < 0) {
        operator delete(__p[0]);
      }
      v11 += 24;
    }
    while (v11 != v12);
  }
}

char **cva::ProgramOptions::Description::newGroupHeader(char **a1, std::string *__str)
{
  uint64_t v5 = (void **)a1[1];
  unint64_t v4 = (unint64_t)a1[2];
  if ((unint64_t)v5 < v4)
  {
    *((_OWORD *)v5 + 4) = 0u;
    *((_OWORD *)v5 + 5) = 0u;
    *((_OWORD *)v5 + 2) = 0u;
    *((_OWORD *)v5 + 3) = 0u;
    *(_OWORD *)uint64_t v5 = 0u;
    *((_OWORD *)v5 + 1) = 0u;
    __darwin_ct_rune_t v6 = (char *)(v5 + 12);
    goto LABEL_32;
  }
  __darwin_ct_rune_t v7 = (void **)*a1;
  unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * (((char *)v5 - *a1) >> 5);
  unint64_t v9 = v8 + 1;
  if (v8 + 1 > 0x2AAAAAAAAAAAAAALL) {
    abort();
  }
  unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v4 - (void)v7) >> 5);
  if (2 * v10 > v9) {
    unint64_t v9 = 2 * v10;
  }
  if (v10 >= 0x155555555555555) {
    unint64_t v11 = 0x2AAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v11 = v9;
  }
  if (v11)
  {
    if (v11 > 0x2AAAAAAAAAAAAAALL) {
      sub_2153E6200();
    }
    uint64_t v12 = (char *)operator new(96 * v11);
  }
  else
  {
    uint64_t v12 = 0;
  }
  __darwin_ct_rune_t v13 = &v12[96 * v8];
  *((_OWORD *)v13 + 4) = 0u;
  *((_OWORD *)v13 + 5) = 0u;
  *((_OWORD *)v13 + 2) = 0u;
  *((_OWORD *)v13 + 3) = 0u;
  long long v14 = &v12[96 * v11];
  *(_OWORD *)__darwin_ct_rune_t v13 = 0u;
  *((_OWORD *)v13 + 1) = 0u;
  __darwin_ct_rune_t v6 = v13 + 96;
  if (v5 == v7)
  {
    *a1 = v13;
    a1[1] = v6;
    a1[2] = v14;
  }
  else
  {
    do
    {
      long long v15 = *((_OWORD *)v5 - 6);
      *((void *)v13 - 10) = *(v5 - 10);
      *((_OWORD *)v13 - 6) = v15;
      *(v5 - 11) = 0;
      *(v5 - 10) = 0;
      *(v5 - 12) = 0;
      long long v16 = *(_OWORD *)(v5 - 9);
      *((void *)v13 - 7) = *(v5 - 7);
      *(_OWORD *)(v13 - 72) = v16;
      *(v5 - 8) = 0;
      *(v5 - 7) = 0;
      *(v5 - 9) = 0;
      *((_OWORD *)v13 - 3) = *((_OWORD *)v5 - 3);
      *(v5 - 6) = 0;
      *(v5 - 5) = 0;
      long long v17 = *((_OWORD *)v5 - 2);
      *((void *)v13 - 2) = *(v5 - 2);
      *((_OWORD *)v13 - 2) = v17;
      *(v5 - 3) = 0;
      *(v5 - 2) = 0;
      *(v5 - 4) = 0;
      int v18 = *((_DWORD *)v5 - 2);
      *(v13 - 4) = *((unsigned char *)v5 - 4);
      *((_DWORD *)v13 - 2) = v18;
      v13 -= 96;
      v5 -= 12;
    }
    while (v5 != v7);
    uint64_t v5 = (void **)*a1;
    uint64_t v19 = (void **)a1[1];
    *a1 = v13;
    a1[1] = v6;
    a1[2] = v14;
    while (v19 != v5)
    {
      if (*((char *)v19 - 9) < 0)
      {
        operator delete(*(v19 - 4));
        unint64_t v20 = (std::__shared_weak_count *)*(v19 - 5);
        if (!v20) {
          goto LABEL_23;
        }
      }
      else
      {
        unint64_t v20 = (std::__shared_weak_count *)*(v19 - 5);
        if (!v20) {
          goto LABEL_23;
        }
      }
      if (atomic_fetch_add(&v20->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
LABEL_23:
        if ((*((char *)v19 - 49) & 0x80000000) == 0) {
          goto LABEL_24;
        }
        goto LABEL_27;
      }
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
      if ((*((char *)v19 - 49) & 0x80000000) == 0)
      {
LABEL_24:
        if (*((char *)v19 - 73) < 0) {
          goto LABEL_28;
        }
        goto LABEL_17;
      }
LABEL_27:
      operator delete(*(v19 - 9));
      if (*((char *)v19 - 73) < 0) {
LABEL_28:
      }
        operator delete(*(v19 - 12));
LABEL_17:
      v19 -= 12;
    }
  }
  if (v5) {
    operator delete(v5);
  }
LABEL_32:
  a1[1] = v6;
  std::string::operator=((std::string *)(v6 - 32), __str);
  return a1;
}

std::string **cva::ProgramOptions::Description::operator()(std::string **a1, const std::string *a2, uint64_t *a3, int a4, const std::string *a5, int a6)
{
  long long v60 = 0u;
  memset(&v61, 0, sizeof(v61));
  memset(v59, 0, sizeof(v59));
  __p = 0;
  v57 = 0;
  uint64_t v58 = 0;
  cva::utils::string::split((uint64_t)&__p, a2, ",", 1);
  unint64_t v11 = (const std::string *)__p;
  if ((char *)v57 - (unsigned char *)__p != 24)
  {
    if (*((char *)__p + 23) < 0)
    {
      unint64_t v15 = *((void *)__p + 1);
      LODWORD(v16) = *((char *)__p + 47);
      if ((v16 & 0x80000000) == 0) {
        goto LABEL_7;
      }
    }
    else
    {
      unint64_t v15 = *((unsigned __int8 *)__p + 23);
      LODWORD(v16) = *((char *)__p + 47);
      if ((v16 & 0x80000000) == 0)
      {
LABEL_7:
        unint64_t v16 = v16;
        goto LABEL_12;
      }
    }
    unint64_t v16 = *((void *)__p + 4);
LABEL_12:
    std::string::operator=(v59, (const std::string *)__p + (v15 <= v16));
    if (SHIBYTE(v11->__r_.__value_.__r.__words[2]) < 0)
    {
      std::string::size_type size = v11->__r_.__value_.__l.__size_;
      LODWORD(v18) = SHIBYTE(v11[1].__r_.__value_.__r.__words[2]);
      if ((v18 & 0x80000000) == 0) {
        goto LABEL_14;
      }
    }
    else
    {
      std::string::size_type size = HIBYTE(v11->__r_.__value_.__r.__words[2]);
      LODWORD(v18) = SHIBYTE(v11[1].__r_.__value_.__r.__words[2]);
      if ((v18 & 0x80000000) == 0)
      {
LABEL_14:
        std::string::size_type v18 = v18;
LABEL_17:
        long long v14 = &v11[size > v18];
        __darwin_ct_rune_t v13 = &v59[1];
        goto LABEL_18;
      }
    }
    std::string::size_type v18 = v11[1].__r_.__value_.__l.__size_;
    goto LABEL_17;
  }
  uint64_t v12 = (const std::string *)MEMORY[0x2166B9470](&v59[1], "");
  std::string::operator=(v59, v12);
  if (SHIBYTE(v11->__r_.__value_.__r.__words[2]) < 0)
  {
    if (v11->__r_.__value_.__l.__size_ >= 2) {
      goto LABEL_4;
    }
  }
  else if (HIBYTE(v11->__r_.__value_.__r.__words[2]) >= 2uLL)
  {
LABEL_4:
    __darwin_ct_rune_t v13 = v59;
    long long v14 = v11;
    goto LABEL_18;
  }
  __darwin_ct_rune_t v13 = &v59[1];
  long long v14 = v11;
LABEL_18:
  std::string::operator=(v13, v14);
  std::string::operator=(&v61, a5);
  uint64_t v20 = *a3;
  uint64_t v19 = a3[1];
  if (v19) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v19 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v21 = (std::__shared_weak_count *)*((void *)&v60 + 1);
  *(void *)&long long v60 = v20;
  *((void *)&v60 + 1) = v19;
  if (v21 && !atomic_fetch_add(&v21->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
    std::__shared_weak_count::__release_weak(v21);
  }
  int v62 = a4;
  BOOL v63 = a6 == 1;
  unint64_t v23 = a1[1];
  unint64_t v22 = a1[2];
  if (v23 < v22)
  {
    if (SHIBYTE(v59[0].__r_.__value_.__r.__words[2]) < 0)
    {
      sub_2153C0AE4(a1[1], v59[0].__r_.__value_.__l.__data_, v59[0].__r_.__value_.__l.__size_);
    }
    else
    {
      long long v24 = *(_OWORD *)&v59[0].__r_.__value_.__l.__data_;
      v23->__r_.__value_.__r.__words[2] = v59[0].__r_.__value_.__r.__words[2];
      *(_OWORD *)&v23->__r_.__value_.__l.__data_ = v24;
    }
    long long v30 = v23 + 1;
    if (SHIBYTE(v59[1].__r_.__value_.__r.__words[2]) < 0)
    {
      sub_2153C0AE4(v30, v59[1].__r_.__value_.__l.__data_, v59[1].__r_.__value_.__l.__size_);
    }
    else
    {
      long long v31 = *(_OWORD *)&v59[1].__r_.__value_.__l.__data_;
      v23[1].__r_.__value_.__r.__words[2] = v59[1].__r_.__value_.__r.__words[2];
      *(_OWORD *)&v30->__r_.__value_.__l.__data_ = v31;
    }
    v23[2].__r_.__value_.__r.__words[0] = v60;
    uint64_t v32 = *((void *)&v60 + 1);
    v23[2].__r_.__value_.__l.__size_ = *((void *)&v60 + 1);
    if (v32) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v32 + 8), 1uLL, memory_order_relaxed);
    }
    uint64_t v33 = &v23[2].__r_.__value_.__s.__data_[16];
    if (SHIBYTE(v61.__r_.__value_.__r.__words[2]) < 0)
    {
      sub_2153C0AE4(v33, v61.__r_.__value_.__l.__data_, v61.__r_.__value_.__l.__size_);
    }
    else
    {
      long long v34 = *(_OWORD *)&v61.__r_.__value_.__l.__data_;
      v23[3].__r_.__value_.__l.__size_ = v61.__r_.__value_.__r.__words[2];
      *(_OWORD *)uint64_t v33 = v34;
    }
    int v35 = v62;
    v23[3].__r_.__value_.__s.__data_[20] = v63;
    LODWORD(v23[3].__r_.__value_.__r.__words[2]) = v35;
    v36 = v23 + 4;
    goto LABEL_76;
  }
  unint64_t v25 = 0xAAAAAAAAAAAAAAABLL * (((char *)v23 - (char *)*a1) >> 5);
  if (v25 + 1 > 0x2AAAAAAAAAAAAAALL) {
    abort();
  }
  unint64_t v26 = 0xAAAAAAAAAAAAAAABLL * (((char *)v22 - (char *)*a1) >> 5);
  uint64_t v27 = 2 * v26;
  if (2 * v26 <= v25 + 1) {
    uint64_t v27 = v25 + 1;
  }
  if (v26 >= 0x155555555555555) {
    unint64_t v28 = 0x2AAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v28 = v27;
  }
  if (v28)
  {
    if (v28 > 0x2AAAAAAAAAAAAAALL) {
      sub_2153E6200();
    }
    uint64_t v29 = operator new(96 * v28);
  }
  else
  {
    uint64_t v29 = 0;
  }
  v37 = (std::string *)&v29[96 * v25];
  if (SHIBYTE(v59[0].__r_.__value_.__r.__words[2]) < 0) {
    sub_2153C0AE4(&v29[96 * v25], v59[0].__r_.__value_.__l.__data_, v59[0].__r_.__value_.__l.__size_);
  }
  else {
    std::string *v37 = v59[0];
  }
  v38 = &v29[96 * v25 + 24];
  if (SHIBYTE(v59[1].__r_.__value_.__r.__words[2]) < 0)
  {
    sub_2153C0AE4(v38, v59[1].__r_.__value_.__l.__data_, v59[1].__r_.__value_.__l.__size_);
  }
  else
  {
    *(_OWORD *)v38 = *(_OWORD *)&v59[1].__r_.__value_.__l.__data_;
    *(void *)&v29[96 * v25 + 40] = *((void *)&v59[1].__r_.__value_.__l + 2);
  }
  uint64_t v39 = *((void *)&v60 + 1);
  v40 = &v29[96 * v25];
  *((void *)v40 + 6) = v60;
  *((void *)v40 + 7) = v39;
  if (v39) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v39 + 8), 1uLL, memory_order_relaxed);
  }
  v41 = &v29[96 * v25 + 64];
  if (SHIBYTE(v61.__r_.__value_.__r.__words[2]) < 0)
  {
    sub_2153C0AE4(v41, v61.__r_.__value_.__l.__data_, v61.__r_.__value_.__l.__size_);
  }
  else
  {
    *(_OWORD *)v41 = *(_OWORD *)&v61.__r_.__value_.__l.__data_;
    *(void *)&v29[96 * v25 + 80] = *((void *)&v61.__r_.__value_.__l + 2);
  }
  v42 = (std::string *)&v29[96 * v28];
  v43 = &v29[96 * v25];
  *((_DWORD *)v43 + 22) = v62;
  v43[92] = v63;
  v36 = v37 + 4;
  v44 = *a1;
  v45 = a1[1];
  if (v45 == *a1)
  {
    *a1 = v37;
    a1[1] = v36;
    a1[2] = v42;
  }
  else
  {
    do
    {
      long long v46 = *(_OWORD *)&v45[-4].__r_.__value_.__l.__data_;
      v37[-4].__r_.__value_.__r.__words[2] = v45[-4].__r_.__value_.__r.__words[2];
      *(_OWORD *)&v37[-4].__r_.__value_.__l.__data_ = v46;
      v45[-4].__r_.__value_.__l.__size_ = 0;
      v45[-4].__r_.__value_.__r.__words[2] = 0;
      v45[-4].__r_.__value_.__r.__words[0] = 0;
      long long v47 = *(_OWORD *)&v45[-3].__r_.__value_.__l.__data_;
      v37[-3].__r_.__value_.__r.__words[2] = v45[-3].__r_.__value_.__r.__words[2];
      *(_OWORD *)&v37[-3].__r_.__value_.__l.__data_ = v47;
      v45[-3].__r_.__value_.__l.__size_ = 0;
      v45[-3].__r_.__value_.__r.__words[2] = 0;
      v45[-3].__r_.__value_.__r.__words[0] = 0;
      *(_OWORD *)&v37[-2].__r_.__value_.__l.__data_ = *(_OWORD *)&v45[-2].__r_.__value_.__l.__data_;
      v45[-2].__r_.__value_.__r.__words[0] = 0;
      v45[-2].__r_.__value_.__l.__size_ = 0;
      long long v48 = *(_OWORD *)&v45[-2].__r_.__value_.__r.__words[2];
      v37[-1].__r_.__value_.__l.__size_ = v45[-1].__r_.__value_.__l.__size_;
      *(_OWORD *)&v37[-2].__r_.__value_.__r.__words[2] = v48;
      v45[-1].__r_.__value_.__r.__words[0] = 0;
      v45[-1].__r_.__value_.__l.__size_ = 0;
      v45[-2].__r_.__value_.__r.__words[2] = 0;
      int v49 = v45[-1].__r_.__value_.__r.__words[2];
      v37[-1].__r_.__value_.__s.__data_[20] = v45[-1].__r_.__value_.__s.__data_[20];
      LODWORD(v37[-1].__r_.__value_.__r.__words[2]) = v49;
      v37 -= 4;
      v45 -= 4;
    }
    while (v45 != v44);
    v45 = *a1;
    v50 = a1[1];
    *a1 = v37;
    a1[1] = v36;
    a1[2] = v42;
    while (v50 != v45)
    {
      if (v50[-1].__r_.__value_.__s.__data_[15] < 0)
      {
        operator delete((void *)v50[-2].__r_.__value_.__r.__words[2]);
        v51 = (std::__shared_weak_count *)v50[-2].__r_.__value_.__l.__size_;
        if (!v51) {
          goto LABEL_67;
        }
      }
      else
      {
        v51 = (std::__shared_weak_count *)v50[-2].__r_.__value_.__l.__size_;
        if (!v51) {
          goto LABEL_67;
        }
      }
      if (atomic_fetch_add(&v51->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
LABEL_67:
        if ((SHIBYTE(v50[-3].__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
          goto LABEL_68;
        }
        goto LABEL_71;
      }
      ((void (*)(std::__shared_weak_count *))v51->__on_zero_shared)(v51);
      std::__shared_weak_count::__release_weak(v51);
      if ((SHIBYTE(v50[-3].__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
LABEL_68:
        if (SHIBYTE(v50[-4].__r_.__value_.__r.__words[2]) < 0) {
          goto LABEL_72;
        }
        goto LABEL_61;
      }
LABEL_71:
      operator delete(v50[-3].__r_.__value_.__l.__data_);
      if (SHIBYTE(v50[-4].__r_.__value_.__r.__words[2]) < 0) {
LABEL_72:
      }
        operator delete(v50[-4].__r_.__value_.__l.__data_);
LABEL_61:
      v50 -= 4;
    }
  }
  if (v45) {
    operator delete(v45);
  }
LABEL_76:
  a1[1] = v36;
  v52 = (void **)__p;
  if (__p)
  {
    for (i = v57; i != v52; i -= 3)
    {
      if (*((char *)i - 1) < 0) {
        operator delete(*(i - 3));
      }
    }
    operator delete(v52);
  }
  if (SHIBYTE(v61.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v61.__r_.__value_.__l.__data_);
  }
  v54 = (std::__shared_weak_count *)*((void *)&v60 + 1);
  if (!*((void *)&v60 + 1)
    || atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v60 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    if ((SHIBYTE(v59[1].__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_88;
    }
LABEL_91:
    operator delete(v59[1].__r_.__value_.__l.__data_);
    if ((SHIBYTE(v59[0].__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      return a1;
    }
LABEL_92:
    operator delete(v59[0].__r_.__value_.__l.__data_);
    return a1;
  }
  ((void (*)(std::__shared_weak_count *))v54->__on_zero_shared)(v54);
  std::__shared_weak_count::__release_weak(v54);
  if (SHIBYTE(v59[1].__r_.__value_.__r.__words[2]) < 0) {
    goto LABEL_91;
  }
LABEL_88:
  if (SHIBYTE(v59[0].__r_.__value_.__r.__words[2]) < 0) {
    goto LABEL_92;
  }
  return a1;
}

void cva::ProgramOptions::Description::tokenize(const std::string *a1, uint64_t a2)
{
}

CFTypeRef cva::ItemHandler::createValue<int>@<X0>(unsigned int *a1@<X0>, uint64_t a2@<X8>)
{
  CFTypeRef result = (id)[objc_alloc(NSNumber) initWithInt:*a1];
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = 0;
  if (result)
  {
    return CFRetain(result);
  }
  return result;
}

cva::ItemHandler *cva::ItemHandler::ItemHandler(cva::ItemHandler *this, CFTypeRef cf, char a3)
{
  *(void *)this = cf;
  *((unsigned char *)this + 8) = a3;
  if (cf) {
    CFRetain(cf);
  }
  else {
    *((unsigned char *)this + 8) = 0;
  }
  return this;
}

{
  *(void *)this = cf;
  *((unsigned char *)this + 8) = a3;
  if (cf) {
    CFRetain(cf);
  }
  else {
    *((unsigned char *)this + 8) = 0;
  }
  return this;
}

CFTypeRef cva::ItemHandler::createValue<unsigned int>@<X0>(unsigned int *a1@<X0>, uint64_t a2@<X8>)
{
  CFTypeRef result = (id)[objc_alloc(NSNumber) initWithUnsignedInt:*a1];
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = 0;
  if (result)
  {
    return CFRetain(result);
  }
  return result;
}

CFTypeRef cva::ItemHandler::createValue<long long>@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  CFTypeRef result = (id)[objc_alloc(NSNumber) initWithLongLong:*a1];
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = 0;
  if (result)
  {
    return CFRetain(result);
  }
  return result;
}

CFTypeRef cva::ItemHandler::createValue<unsigned long long>@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  CFTypeRef result = (id)[objc_alloc(NSNumber) initWithUnsignedLongLong:*a1];
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = 0;
  if (result)
  {
    return CFRetain(result);
  }
  return result;
}

CFTypeRef cva::ItemHandler::createValue<float>@<X0>(int *a1@<X0>, uint64_t a2@<X8>)
{
  int v3 = *a1;
  id v4 = objc_alloc(NSNumber);
  LODWORD(v5) = v3;
  CFTypeRef result = (id)[v4 initWithFloat:v5];
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = 0;
  if (result)
  {
    return CFRetain(result);
  }
  return result;
}

CFTypeRef cva::ItemHandler::createValue<double>@<X0>(double *a1@<X0>, uint64_t a2@<X8>)
{
  CFTypeRef result = (id)[objc_alloc(NSNumber) initWithDouble:*a1];
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = 0;
  if (result)
  {
    return CFRetain(result);
  }
  return result;
}

CFTypeRef cva::ItemHandler::createValue<BOOL>@<X0>(unsigned __int8 *a1@<X0>, uint64_t a2@<X8>)
{
  CFTypeRef result = (id)[objc_alloc(NSNumber) initWithBool:*a1];
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = 0;
  if (result)
  {
    return CFRetain(result);
  }
  return result;
}

CFTypeRef cva::ItemHandler::createValue<std::string>@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  if (*((char *)a1 + 23) >= 0) {
    int v3 = a1;
  }
  else {
    int v3 = (uint64_t *)*a1;
  }
  CFTypeRef result = (id)[[NSString alloc] initWithUTF8String:v3];
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = 0;
  if (result)
  {
    return CFRetain(result);
  }
  return result;
}

void cva::ItemHandler::createVector<BOOL>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  cf = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:*(unsigned int *)(a1 + 16)];
  if (*(_DWORD *)(a1 + 16))
  {
    unint64_t v4 = 0;
    do
    {
      double v5 = (void *)[objc_alloc(NSNumber) initWithBool:*(unsigned __int8 *)(*(void *)a1 + v4) != 0];
      [cf addObject:v5];

      ++v4;
    }
    while (v4 < *(unsigned int *)(a1 + 16));
  }
  __darwin_ct_rune_t v6 = cf;
  *(void *)a2 = cf;
  *(unsigned char *)(a2 + 8) = 0;
  if (cf)
  {
    CFRetain(cf);
    __darwin_ct_rune_t v6 = cf;
  }
}

void sub_215435D9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void cva::ItemHandler::createVector<unsigned int>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  cf = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:*(unsigned int *)(a1 + 16)];
  if (*(_DWORD *)(a1 + 16))
  {
    unint64_t v4 = 0;
    do
    {
      double v5 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:*(unsigned int *)(*(void *)a1 + 4 * v4)];
      [cf addObject:v5];

      ++v4;
    }
    while (v4 < *(unsigned int *)(a1 + 16));
  }
  __darwin_ct_rune_t v6 = cf;
  *(void *)a2 = cf;
  *(unsigned char *)(a2 + 8) = 0;
  if (cf)
  {
    CFRetain(cf);
    __darwin_ct_rune_t v6 = cf;
  }
}

void sub_215435E8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void cva::ItemHandler::createVector<int>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  cf = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:*(unsigned int *)(a1 + 16)];
  if (*(_DWORD *)(a1 + 16))
  {
    unint64_t v4 = 0;
    do
    {
      double v5 = (void *)[objc_alloc(NSNumber) initWithInt:*(unsigned int *)(*(void *)a1 + 4 * v4)];
      [cf addObject:v5];

      ++v4;
    }
    while (v4 < *(unsigned int *)(a1 + 16));
  }
  __darwin_ct_rune_t v6 = cf;
  *(void *)a2 = cf;
  *(unsigned char *)(a2 + 8) = 0;
  if (cf)
  {
    CFRetain(cf);
    __darwin_ct_rune_t v6 = cf;
  }
}

void sub_215435F7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void cva::ItemHandler::createVector<float>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  cf = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:*(unsigned int *)(a1 + 16)];
  if (*(_DWORD *)(a1 + 16))
  {
    unint64_t v4 = 0;
    do
    {
      int v5 = *(_DWORD *)(*(void *)a1 + 4 * v4);
      id v6 = objc_alloc(NSNumber);
      LODWORD(v7) = v5;
      unint64_t v8 = (void *)[v6 initWithFloat:v7];
      [cf addObject:v8];

      ++v4;
    }
    while (v4 < *(unsigned int *)(a1 + 16));
  }
  unint64_t v9 = cf;
  *(void *)a2 = cf;
  *(unsigned char *)(a2 + 8) = 0;
  if (cf)
  {
    CFRetain(cf);
    unint64_t v9 = cf;
  }
}

void sub_215436074(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void cva::ItemHandler::createVector<double>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  cf = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:*(unsigned int *)(a1 + 16)];
  if (*(_DWORD *)(a1 + 16))
  {
    unint64_t v4 = 0;
    do
    {
      int v5 = (void *)[objc_alloc(NSNumber) initWithDouble:*(double *)(*(void *)a1 + 8 * v4)];
      [cf addObject:v5];

      ++v4;
    }
    while (v4 < *(unsigned int *)(a1 + 16));
  }
  id v6 = cf;
  *(void *)a2 = cf;
  *(unsigned char *)(a2 + 8) = 0;
  if (cf)
  {
    CFRetain(cf);
    id v6 = cf;
  }
}

void sub_21543616C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void cva::ItemHandler::createMatrix<int>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  cf = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:*(unsigned int *)(a1 + 16)];
  if (*(_DWORD *)(a1 + 16))
  {
    unsigned int v4 = 0;
    do
    {
      int v5 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:*(unsigned int *)(a1 + 20)];
      if (*(_DWORD *)(a1 + 20))
      {
        unsigned int v6 = 0;
        do
        {
          double v7 = (void *)[objc_alloc(NSNumber) initWithInt:*(unsigned int *)(*(void *)a1 + 4 * (v4 + *(_DWORD *)(a1 + 16) * v6))];
          [v5 addObject:v7];

          ++v6;
        }
        while (v6 < *(_DWORD *)(a1 + 20));
      }
      [cf addObject:v5];

      ++v4;
    }
    while (v4 < *(_DWORD *)(a1 + 16));
  }
  unint64_t v8 = cf;
  *(void *)a2 = cf;
  *(unsigned char *)(a2 + 8) = 0;
  if (cf)
  {
    CFRetain(cf);
    unint64_t v8 = cf;
  }
}

void sub_2154362AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void cva::ItemHandler::createMatrix<float>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  cf = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:*(unsigned int *)(a1 + 16)];
  if (*(_DWORD *)(a1 + 16))
  {
    unsigned int v4 = 0;
    do
    {
      int v5 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:*(unsigned int *)(a1 + 20)];
      if (*(_DWORD *)(a1 + 20))
      {
        unsigned int v6 = 0;
        do
        {
          int v7 = *(_DWORD *)(*(void *)a1 + 4 * (v4 + *(_DWORD *)(a1 + 16) * v6));
          id v8 = objc_alloc(NSNumber);
          LODWORD(v9) = v7;
          unint64_t v10 = (void *)[v8 initWithFloat:v9];
          [v5 addObject:v10];

          ++v6;
        }
        while (v6 < *(_DWORD *)(a1 + 20));
      }
      [cf addObject:v5];

      ++v4;
    }
    while (v4 < *(_DWORD *)(a1 + 16));
  }
  unint64_t v11 = cf;
  *(void *)a2 = cf;
  *(unsigned char *)(a2 + 8) = 0;
  if (cf)
  {
    CFRetain(cf);
    unint64_t v11 = cf;
  }
}

void sub_215436404(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void cva::ItemHandler::createMatrix<double>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  cf = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:*(unsigned int *)(a1 + 16)];
  if (*(_DWORD *)(a1 + 16))
  {
    unsigned int v4 = 0;
    do
    {
      int v5 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:*(unsigned int *)(a1 + 20)];
      if (*(_DWORD *)(a1 + 20))
      {
        unsigned int v6 = 0;
        do
        {
          int v7 = (void *)[objc_alloc(NSNumber) initWithDouble:*(double *)(*(void *)a1 + 8 * (v4 + *(_DWORD *)(a1 + 16) * v6))];
          [v5 addObject:v7];

          ++v6;
        }
        while (v6 < *(_DWORD *)(a1 + 20));
      }
      [cf addObject:v5];

      ++v4;
    }
    while (v4 < *(_DWORD *)(a1 + 16));
  }
  id v8 = cf;
  *(void *)a2 = cf;
  *(unsigned char *)(a2 + 8) = 0;
  if (cf)
  {
    CFRetain(cf);
    id v8 = cf;
  }
}

void sub_21543655C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void *cva::ItemHandler::getValue<int>(void **a1)
{
  CFTypeRef result = *a1;
  if (result) {
    return (void *)[result intValue];
  }
  return result;
}

void *cva::ItemHandler::getValue<unsigned int>(void **a1)
{
  CFTypeRef result = *a1;
  if (result) {
    return (void *)[result unsignedIntValue];
  }
  return result;
}

void *cva::ItemHandler::getValue<long long>(void **a1)
{
  CFTypeRef result = *a1;
  if (result) {
    return (void *)[result longLongValue];
  }
  return result;
}

void *cva::ItemHandler::getValue<unsigned long long>(void **a1)
{
  CFTypeRef result = *a1;
  if (result) {
    return (void *)[result unsignedLongLongValue];
  }
  return result;
}

double cva::ItemHandler::getValue<float>(void **a1)
{
  uint64_t v1 = *a1;
  if (!v1) {
    return 0.0;
  }
  [v1 floatValue];
  return result;
}

double cva::ItemHandler::getValue<double>(void **a1)
{
  uint64_t v1 = *a1;
  if (!v1) {
    return 0.0;
  }
  [v1 doubleValue];
  return result;
}

void cva::ItemHandler::getValue<std::string>(id *a1@<X0>, void *a2@<X8>)
{
  uint64_t v2 = a2;
  if (!*a1)
  {
    *a2 = 0;
    a2[1] = 0;
    a2[2] = 0;
    return;
  }
  id v9 = *a1;
  int v3 = (const char *)[v9 UTF8String];
  size_t v4 = strlen(v3);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    abort();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v6 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v6 = v4 | 7;
    }
    uint64_t v7 = v6 + 1;
    id v8 = operator new(v6 + 1);
    v2[1] = v5;
    v2[2] = v7 | 0x8000000000000000;
    *uint64_t v2 = v8;
    uint64_t v2 = v8;
  }
  else
  {
    *((unsigned char *)v2 + 23) = v4;
    if (!v4) {
      goto LABEL_11;
    }
  }
  memmove(v2, v3, v5);
LABEL_11:
  *((unsigned char *)v2 + v5) = 0;
}

void sub_2154366E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void cva::ItemHandler::getVector<BOOL>(const void **a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  *(_DWORD *)(a2 + 16) = 0;
  if ((cva::ItemHandler::isVectorType(a1) & 1) == 0) {
    return;
  }
  cva::ItemHandler::getArray((uint64_t)a1, &v13);
  size_t v4 = v13;
  if (v13)
  {
    if (*v13)
    {
      unsigned int v5 = [*v13 count];
      *(_DWORD *)(a2 + 16) = v5;
      if (v5)
      {
        size_t v6 = (v5 + 31) & 0x1FFFFFFE0;
        *(void *)a2 = 0;
        *(void *)(a2 + 8) = v6;
        memptr = 0;
        malloc_type_posix_memalign(&memptr, 0x20uLL, v6, 0x49090899uLL);
        uint64_t v7 = memptr;
        *(void *)a2 = memptr;
LABEL_8:
        uint64_t v8 = 0;
        id v9 = *v4;
        if (!*v4) {
          goto LABEL_12;
        }
LABEL_9:
        LODWORD(v9) = [v9 count];
LABEL_12:
        while (v8 < (int)v9)
        {
          if (*v4
            && v8 < (int)[*v4 count]
            && (v10 = (const void *)[*v4 objectAtIndex:v8], (unint64_t v11 = (void *)v10) != 0))
          {
            CFRetain(v10);
            v7[v8] = [v11 BOOLValue];
            CFRelease(v11);
          }
          else
          {
            v7[v8] = 0;
          }
          ++v8;
          id v9 = *v4;
          if (*v4) {
            goto LABEL_9;
          }
        }
        goto LABEL_17;
      }
    }
    else
    {
      *(_DWORD *)(a2 + 16) = 0;
    }
    uint64_t v7 = 0;
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
    goto LABEL_8;
  }
LABEL_17:
  uint64_t v12 = v14;
  if (v14 && !atomic_fetch_add(&v14->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
    std::__shared_weak_count::__release_weak(v12);
  }
}

void sub_215436870(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_215436A24((uint64_t)va);
  free(0);
  _Unwind_Resume(a1);
}

unint64_t cva::ItemHandler::isVectorType(const void **this)
{
  unint64_t v1 = (unint64_t)*this;
  if (*this)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      cva::ItemHandler::getArray((uint64_t)this, &v10);
      int v3 = v10;
      if (v10)
      {
        uint64_t v4 = 0;
        while (1)
        {
          id v5 = *v3;
          if (*v3) {
            LODWORD(v5) = [v5 count];
          }
          unint64_t v1 = v4 >= (int)v5;
          if (v4 >= (int)v5) {
            break;
          }
          if (*v3 && v4 < (int)[*v3 count])
          {
            size_t v6 = (const void *)[*v3 objectAtIndex:v4];
            unint64_t v1 = (unint64_t)v6;
            if (!v6) {
              break;
            }
            CFRetain(v6);
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();
            CFRelease((CFTypeRef)v1);
            ++v4;
            if (isKindOfClass) {
              continue;
            }
          }
          goto LABEL_12;
        }
      }
      else
      {
LABEL_12:
        unint64_t v1 = 0;
      }
      uint64_t v8 = v11;
      if (v11 && !atomic_fetch_add(&v11->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v8);
      }
    }
    else
    {
      return 0;
    }
  }
  return v1;
}

void sub_2154369FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t sub_215436A24(uint64_t a1)
{
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 8);
  if (v2 && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
  }
  return a1;
}

void sub_215436A94(uint64_t a1)
{
  unint64_t v1 = *(const void **)(a1 + 24);
  if (v1) {
    CFRelease(v1);
  }
}

void sub_215436AA4(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C5FC390;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x2166B9890);
}

void sub_215436AF8(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C5FC390;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void *cva::ArrayHandler::size(void **this)
{
  double result = *this;
  if (result) {
    return (void *)[result count];
  }
  return result;
}

uint64_t *cva::ArrayHandler::item@<X0>(uint64_t *this@<X0>, int a2@<W1>, uint64_t a3@<X8>)
{
  if (a2 < 0
    || (uint64_t v4 = this, (this = (uint64_t *)*this) == 0)
    || (this = (uint64_t *)[this count], (int)this <= a2))
  {
    *(void *)a3 = 0;
    goto LABEL_9;
  }
  this = (uint64_t *)[(id)*v4 objectAtIndex:a2];
  char v6 = *((unsigned char *)v4 + 8);
  *(void *)a3 = this;
  *(unsigned char *)(a3 + 8) = v6;
  if (!this)
  {
LABEL_9:
    *(unsigned char *)(a3 + 8) = 0;
    return this;
  }
  return (uint64_t *)CFRetain(this);
}

void cva::ItemHandler::getVector<int>(const void **a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  *(_DWORD *)(a2 + 16) = 0;
  if ((cva::ItemHandler::isVectorType(a1) & 1) == 0) {
    return;
  }
  cva::ItemHandler::getArray((uint64_t)a1, &v13);
  uint64_t v4 = v13;
  if (v13)
  {
    if (*v13)
    {
      unsigned int v5 = [*v13 count];
      *(_DWORD *)(a2 + 16) = v5;
      if (v5)
      {
        size_t v6 = (4 * v5 + 31) & 0x7FFFFFFE0;
        *(void *)a2 = 0;
        *(void *)(a2 + 8) = v6 >> 2;
        memptr = 0;
        malloc_type_posix_memalign(&memptr, 0x20uLL, v6, 0x49090899uLL);
        uint64_t v7 = memptr;
        *(void *)a2 = memptr;
LABEL_8:
        uint64_t v8 = 0;
        id v9 = *v4;
        if (!*v4) {
          goto LABEL_12;
        }
LABEL_9:
        LODWORD(v9) = [v9 count];
LABEL_12:
        while (v8 < (int)v9)
        {
          if (*v4
            && v8 < (int)[*v4 count]
            && (v10 = (const void *)[*v4 objectAtIndex:v8], (unint64_t v11 = (void *)v10) != 0))
          {
            CFRetain(v10);
            v7[v8] = [v11 intValue];
            CFRelease(v11);
          }
          else
          {
            v7[v8] = 0;
          }
          ++v8;
          id v9 = *v4;
          if (*v4) {
            goto LABEL_9;
          }
        }
        goto LABEL_17;
      }
    }
    else
    {
      *(_DWORD *)(a2 + 16) = 0;
    }
    uint64_t v7 = 0;
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
    goto LABEL_8;
  }
LABEL_17:
  uint64_t v12 = v14;
  if (v14 && !atomic_fetch_add(&v14->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
    std::__shared_weak_count::__release_weak(v12);
  }
}

void sub_215436D40(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_215436A24((uint64_t)va);
  free(0);
  _Unwind_Resume(a1);
}

void cva::ItemHandler::getVector<unsigned int>(const void **a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  *(_DWORD *)(a2 + 16) = 0;
  if ((cva::ItemHandler::isVectorType(a1) & 1) == 0) {
    return;
  }
  cva::ItemHandler::getArray((uint64_t)a1, &v13);
  uint64_t v4 = v13;
  if (v13)
  {
    if (*v13)
    {
      unsigned int v5 = [*v13 count];
      *(_DWORD *)(a2 + 16) = v5;
      if (v5)
      {
        size_t v6 = (4 * v5 + 31) & 0x7FFFFFFE0;
        *(void *)a2 = 0;
        *(void *)(a2 + 8) = v6 >> 2;
        memptr = 0;
        malloc_type_posix_memalign(&memptr, 0x20uLL, v6, 0x49090899uLL);
        uint64_t v7 = memptr;
        *(void *)a2 = memptr;
LABEL_8:
        uint64_t v8 = 0;
        id v9 = *v4;
        if (!*v4) {
          goto LABEL_12;
        }
LABEL_9:
        LODWORD(v9) = [v9 count];
LABEL_12:
        while (v8 < (int)v9)
        {
          if (*v4
            && v8 < (int)[*v4 count]
            && (v10 = (const void *)[*v4 objectAtIndex:v8], (unint64_t v11 = (void *)v10) != 0))
          {
            CFRetain(v10);
            v7[v8] = [v11 unsignedIntValue];
            CFRelease(v11);
          }
          else
          {
            v7[v8] = 0;
          }
          ++v8;
          id v9 = *v4;
          if (*v4) {
            goto LABEL_9;
          }
        }
        goto LABEL_17;
      }
    }
    else
    {
      *(_DWORD *)(a2 + 16) = 0;
    }
    uint64_t v7 = 0;
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
    goto LABEL_8;
  }
LABEL_17:
  uint64_t v12 = v14;
  if (v14 && !atomic_fetch_add(&v14->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
    std::__shared_weak_count::__release_weak(v12);
  }
}

void sub_215436F08(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_215436A24((uint64_t)va);
  free(0);
  _Unwind_Resume(a1);
}

void cva::ItemHandler::getVector<float>(const void **a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  *(_DWORD *)(a2 + 16) = 0;
  if ((cva::ItemHandler::isVectorType(a1) & 1) == 0) {
    return;
  }
  cva::ItemHandler::getArray((uint64_t)a1, &v14);
  uint64_t v4 = v14;
  if (v14)
  {
    if (*v14)
    {
      unsigned int v5 = [*v14 count];
      *(_DWORD *)(a2 + 16) = v5;
      if (v5)
      {
        size_t v6 = (4 * v5 + 31) & 0x7FFFFFFE0;
        *(void *)a2 = 0;
        *(void *)(a2 + 8) = v6 >> 2;
        memptr = 0;
        malloc_type_posix_memalign(&memptr, 0x20uLL, v6, 0x49090899uLL);
        uint64_t v7 = memptr;
        *(void *)a2 = memptr;
LABEL_8:
        uint64_t v8 = 0;
        id v9 = *v4;
        if (!*v4) {
          goto LABEL_12;
        }
LABEL_9:
        LODWORD(v9) = [v9 count];
LABEL_12:
        while (v8 < (int)v9)
        {
          if (*v4
            && v8 < (int)[*v4 count]
            && (v10 = (const void *)[*v4 objectAtIndex:v8], (unint64_t v11 = (void *)v10) != 0))
          {
            CFRetain(v10);
            [v11 floatValue];
            v7[v8] = v12;
            CFRelease(v11);
          }
          else
          {
            v7[v8] = 0;
          }
          ++v8;
          id v9 = *v4;
          if (*v4) {
            goto LABEL_9;
          }
        }
        goto LABEL_17;
      }
    }
    else
    {
      *(_DWORD *)(a2 + 16) = 0;
    }
    uint64_t v7 = 0;
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
    goto LABEL_8;
  }
LABEL_17:
  __darwin_ct_rune_t v13 = v15;
  if (v15 && !atomic_fetch_add(&v15->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
    std::__shared_weak_count::__release_weak(v13);
  }
}

void sub_2154370D0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_215436A24((uint64_t)va);
  free(0);
  _Unwind_Resume(a1);
}

void cva::ItemHandler::getVector<double>(const void **a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  *(_DWORD *)(a2 + 16) = 0;
  if ((cva::ItemHandler::isVectorType(a1) & 1) == 0) {
    return;
  }
  cva::ItemHandler::getArray((uint64_t)a1, &v14);
  uint64_t v4 = v14;
  if (v14)
  {
    if (*v14)
    {
      unsigned int v5 = [*v14 count];
      *(_DWORD *)(a2 + 16) = v5;
      if (v5)
      {
        size_t v6 = (8 * v5 + 31) & 0xFFFFFFFE0;
        *(void *)a2 = 0;
        *(void *)(a2 + 8) = v6 >> 3;
        memptr = 0;
        malloc_type_posix_memalign(&memptr, 0x20uLL, v6, 0x49090899uLL);
        uint64_t v7 = memptr;
        *(void *)a2 = memptr;
LABEL_8:
        uint64_t v8 = 0;
        id v9 = *v4;
        if (!*v4) {
          goto LABEL_12;
        }
LABEL_9:
        LODWORD(v9) = [v9 count];
LABEL_12:
        while (v8 < (int)v9)
        {
          if (*v4
            && v8 < (int)[*v4 count]
            && (v10 = (const void *)[*v4 objectAtIndex:v8], (unint64_t v11 = (void *)v10) != 0))
          {
            CFRetain(v10);
            [v11 doubleValue];
            v7[v8] = v12;
            CFRelease(v11);
          }
          else
          {
            v7[v8] = 0;
          }
          ++v8;
          id v9 = *v4;
          if (*v4) {
            goto LABEL_9;
          }
        }
        goto LABEL_17;
      }
    }
    else
    {
      *(_DWORD *)(a2 + 16) = 0;
    }
    uint64_t v7 = 0;
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
    goto LABEL_8;
  }
LABEL_17:
  __darwin_ct_rune_t v13 = v15;
  if (v15 && !atomic_fetch_add(&v15->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
    std::__shared_weak_count::__release_weak(v13);
  }
}

void sub_215437298(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_215436A24((uint64_t)va);
  free(0);
  _Unwind_Resume(a1);
}

void cva::ItemHandler::getMatrix<int>(cva::ItemHandler *a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  if (cva::ItemHandler::isMatrixType(a1))
  {
    cva::ItemHandler::getArray((uint64_t)a1, &v28);
    if (v28)
    {
      if (*v28)
      {
        int v23 = [*v28 count];
        if (v23 >= 1)
        {
          uint64_t v4 = 0;
          while (1)
          {
            unsigned int v5 = v28;
            if (!*v28 || v4 >= (int)[*v28 count]) {
              break;
            }
            size_t v6 = (void *)[*v5 objectAtIndex:v4];
            uint64_t v7 = v6;
            char v8 = *((unsigned char *)v5 + 8);
            memptr = v6;
            char v25 = v8;
            if (!v6) {
              goto LABEL_12;
            }
            CFRetain(v6);
LABEL_13:
            cva::ItemHandler::getArray((uint64_t)&memptr, &v26);
            if (v7) {
              CFRelease(v7);
            }
            id v9 = v26;
            if (v26)
            {
              if (v4)
              {
                int v11 = *(_DWORD *)(a2 + 16);
                int v10 = *(_DWORD *)(a2 + 20);
                uint64_t v12 = *(_DWORD **)a2;
              }
              else
              {
                if (*v26) {
                  int v10 = [*v26 count];
                }
                else {
                  int v10 = 0;
                }
                *(_DWORD *)(a2 + 16) = v23;
                *(_DWORD *)(a2 + 20) = v10;
                unint64_t v13 = (v10 * v23);
                if (v13)
                {
                  uint64_t v12 = *(_DWORD **)a2;
                  if (*(void *)(a2 + 8) < v13)
                  {
                    free(*(void **)a2);
                    size_t v14 = (4 * v13 + 31) & 0x7FFFFFFE0;
                    *(void *)a2 = 0;
                    *(void *)(a2 + 8) = v14 >> 2;
                    memptr = 0;
                    malloc_type_posix_memalign(&memptr, 0x20uLL, v14, 0x49090899uLL);
                    uint64_t v12 = memptr;
                    *(void *)a2 = memptr;
                  }
                  int v11 = v23;
                }
                else
                {
                  free(*(void **)a2);
                  uint64_t v12 = 0;
                  *(void *)a2 = 0;
                  *(void *)(a2 + 8) = 0;
                  int v11 = v23;
                }
              }
              uint64_t v15 = 0;
              for (int i = v4; ; i += v11)
              {
                id v17 = *v9;
                if (*v9) {
                  LODWORD(v17) = [v17 count];
                }
                int v18 = (int)v17 >= v10 ? v10 : (int)v17;
                if (v15 >= v18) {
                  break;
                }
                if (*v9
                  && v15 < (int)[*v9 count]
                  && (v19 = (const void *)[*v9 objectAtIndex:v15], (uint64_t v20 = (void *)v19) != 0))
                {
                  CFRetain(v19);
                  v12[i] = [v20 intValue];
                  CFRelease(v20);
                }
                else
                {
                  v12[i] = 0;
                }
                ++v15;
              }
            }
            uint64_t v21 = v27;
            if (v27 && !atomic_fetch_add(&v27->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
            {
              ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
              std::__shared_weak_count::__release_weak(v21);
            }
            if (++v4 == v23) {
              goto LABEL_42;
            }
          }
          memptr = 0;
LABEL_12:
          uint64_t v7 = 0;
          char v25 = 0;
          goto LABEL_13;
        }
      }
    }
LABEL_42:
    unint64_t v22 = v29;
    if (v29 && !atomic_fetch_add(&v29->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
      std::__shared_weak_count::__release_weak(v22);
    }
  }
}

void sub_2154375A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  sub_215436A24((uint64_t)va);
  free(0);
  _Unwind_Resume(a1);
}

void cva::ItemHandler::getMatrix<double>(cva::ItemHandler *a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  if (cva::ItemHandler::isMatrixType(a1))
  {
    cva::ItemHandler::getArray((uint64_t)a1, &v29);
    if (v29)
    {
      if (*v29)
      {
        int v24 = [*v29 count];
        if (v24 >= 1)
        {
          uint64_t v4 = 0;
          while (1)
          {
            unsigned int v5 = v29;
            if (!*v29 || v4 >= (int)[*v29 count]) {
              break;
            }
            size_t v6 = (void *)[*v5 objectAtIndex:v4];
            uint64_t v7 = v6;
            char v8 = *((unsigned char *)v5 + 8);
            memptr = v6;
            char v26 = v8;
            if (!v6) {
              goto LABEL_12;
            }
            CFRetain(v6);
LABEL_13:
            cva::ItemHandler::getArray((uint64_t)&memptr, &v27);
            if (v7) {
              CFRelease(v7);
            }
            id v9 = v27;
            if (v27)
            {
              if (v4)
              {
                int v11 = *(_DWORD *)(a2 + 16);
                int v10 = *(_DWORD *)(a2 + 20);
                uint64_t v12 = *(void **)a2;
              }
              else
              {
                if (*v27) {
                  int v10 = [*v27 count];
                }
                else {
                  int v10 = 0;
                }
                *(_DWORD *)(a2 + 16) = v24;
                *(_DWORD *)(a2 + 20) = v10;
                unint64_t v13 = (v10 * v24);
                if (v13)
                {
                  uint64_t v12 = *(void **)a2;
                  if (*(void *)(a2 + 8) < v13)
                  {
                    free(*(void **)a2);
                    size_t v14 = (8 * v13 + 31) & 0xFFFFFFFE0;
                    *(void *)a2 = 0;
                    *(void *)(a2 + 8) = v14 >> 3;
                    memptr = 0;
                    malloc_type_posix_memalign(&memptr, 0x20uLL, v14, 0x49090899uLL);
                    uint64_t v12 = memptr;
                    *(void *)a2 = memptr;
                  }
                  int v11 = v24;
                }
                else
                {
                  free(*(void **)a2);
                  uint64_t v12 = 0;
                  *(void *)a2 = 0;
                  *(void *)(a2 + 8) = 0;
                  int v11 = v24;
                }
              }
              uint64_t v15 = 0;
              for (int i = v4; ; i += v11)
              {
                id v17 = *v9;
                if (*v9) {
                  LODWORD(v17) = [v17 count];
                }
                int v18 = (int)v17 >= v10 ? v10 : (int)v17;
                if (v15 >= v18) {
                  break;
                }
                if (*v9
                  && v15 < (int)[*v9 count]
                  && (v19 = (const void *)[*v9 objectAtIndex:v15], (uint64_t v20 = (void *)v19) != 0))
                {
                  CFRetain(v19);
                  [v20 doubleValue];
                  v12[i] = v21;
                  CFRelease(v20);
                }
                else
                {
                  v12[i] = 0;
                }
                ++v15;
              }
            }
            unint64_t v22 = v28;
            if (v28 && !atomic_fetch_add(&v28->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
            {
              ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
              std::__shared_weak_count::__release_weak(v22);
            }
            if (++v4 == v24) {
              goto LABEL_42;
            }
          }
          memptr = 0;
LABEL_12:
          uint64_t v7 = 0;
          char v26 = 0;
          goto LABEL_13;
        }
      }
    }
LABEL_42:
    int v23 = v30;
    if (v30 && !atomic_fetch_add(&v30->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
      std::__shared_weak_count::__release_weak(v23);
    }
  }
}

void sub_2154378E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  sub_215436A24((uint64_t)va);
  free(0);
  _Unwind_Resume(a1);
}

uint64_t cva::ItemHandler::ItemHandler(uint64_t this)
{
  *(void *)this = 0;
  *(unsigned char *)(this + 8) = 0;
  return this;
}

{
  *(void *)this = 0;
  *(unsigned char *)(this + 8) = 0;
  return this;
}

uint64_t cva::ItemHandler::ItemHandler(uint64_t result, uint64_t a2)
{
  *(void *)double result = *(void *)a2;
  *(unsigned char *)(result + 8) = *(unsigned char *)(a2 + 8);
  *(void *)a2 = 0;
  return result;
}

{
  *(void *)double result = *(void *)a2;
  *(unsigned char *)(result + 8) = *(unsigned char *)(a2 + 8);
  *(void *)a2 = 0;
  return result;
}

uint64_t cva::ItemHandler::ItemHandler(uint64_t a1, uint64_t a2)
{
  int v3 = *(const void **)a2;
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  if (v3) {
    CFRetain(v3);
  }
  else {
    *(unsigned char *)(a1 + 8) = 0;
  }
  return a1;
}

{
  const void *v3;

  int v3 = *(const void **)a2;
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  if (v3) {
    CFRetain(v3);
  }
  else {
    *(unsigned char *)(a1 + 8) = 0;
  }
  return a1;
}

cva::ItemHandler *cva::ItemHandler::ItemHandler(cva::ItemHandler *this, const cva::DictionaryHandler *a2)
{
  int v3 = *(const void **)a2;
  *(void *)this = *(void *)a2;
  *((unsigned char *)this + 8) = *((unsigned char *)a2 + 8);
  if (v3) {
    CFRetain(v3);
  }
  else {
    *((unsigned char *)this + 8) = 0;
  }
  return this;
}

{
  const void *v3;

  int v3 = *(const void **)a2;
  *(void *)this = *(void *)a2;
  *((unsigned char *)this + 8) = *((unsigned char *)a2 + 8);
  if (v3) {
    CFRetain(v3);
  }
  else {
    *((unsigned char *)this + 8) = 0;
  }
  return this;
}

uint64_t cva::ItemHandler::getObject(cva::ItemHandler *this)
{
  return *(void *)this;
}

CFTypeRef cva::ItemHandler::createData@<X0>(CFTypeRef this@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = this;
  *(unsigned char *)(a2 + 8) = 0;
  if (this) {
    return CFRetain(this);
  }
  return this;
}

void cva::ItemHandler::createVector(cva::ItemHandler *this@<X0>, uint64_t a2@<X8>)
{
  int v3 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:this];
  *(void *)a2 = v3;
  *(unsigned char *)(a2 + 8) = 1;
  id v4 = v3;
  if (v3) {
    CFRetain(v3);
  }
  else {
    *(unsigned char *)(a2 + 8) = 0;
  }
}

void sub_215437BB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

BOOL cva::ItemHandler::isValid(cva::ItemHandler *this)
{
  return *(void *)this != 0;
}

uint64_t cva::ItemHandler::isDataType(cva::ItemHandler *this)
{
  if (*(void *)this)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

uint64_t cva::ItemHandler::isNumberType(cva::ItemHandler *this)
{
  if (*(void *)this)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

uint64_t cva::ItemHandler::isBoolType(cva::ItemHandler *this)
{
  if (*(void *)this)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

uint64_t cva::ItemHandler::isStringType(cva::ItemHandler *this)
{
  if (*(void *)this)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

uint64_t cva::ItemHandler::isArrayType(cva::ItemHandler *this)
{
  if (*(void *)this)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

uint64_t cva::ItemHandler::isDictionaryType(cva::ItemHandler *this)
{
  if (*(void *)this)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

BOOL cva::ItemHandler::isVectorTypeOfSize(const void **this, int a2)
{
  if (!cva::ItemHandler::isVectorType(this)) {
    return 0;
  }
  cva::ItemHandler::getArray((uint64_t)this, &v8);
  if (!v8)
  {
    BOOL v5 = 0;
    size_t v6 = v9;
    if (!v9) {
      return v5;
    }
    goto LABEL_9;
  }
  id v4 = *v8;
  if (*v8) {
    LODWORD(v4) = [v4 count];
  }
  BOOL v5 = v4 == a2;
  size_t v6 = v9;
  if (v9)
  {
LABEL_9:
    if (!atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  return v5;
}

void sub_215437E48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_215437E60(uint64_t a1)
{
  unint64_t v1 = *(const void **)(a1 + 24);
  if (v1) {
    CFRelease(v1);
  }
}

void sub_215437E70(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C5FC400;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x2166B9890);
}

void sub_215437EC4(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C5FC400;
  std::__shared_weak_count::~__shared_weak_count(this);
}

uint64_t cva::ItemHandler::getData(cva::ItemHandler *this)
{
  if (*(void *)this && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    return *(void *)this;
  }
  else {
    return 0;
  }
}

uint64_t cva::DictionaryHandler::DictionaryHandler(uint64_t result, uint64_t a2)
{
  *(void *)double result = *(void *)a2;
  *(unsigned char *)(result + 8) = *(unsigned char *)(a2 + 8);
  *(void *)a2 = 0;
  return result;
}

{
  *(void *)double result = *(void *)a2;
  *(unsigned char *)(result + 8) = *(unsigned char *)(a2 + 8);
  *(void *)a2 = 0;
  return result;
}

CFIndex cva::DictionaryHandler::size(CFDictionaryRef *this)
{
  return CFDictionaryGetCount(*this);
}

void cva::DictionaryHandler::getKeys(CFDictionaryRef *this@<X0>, void **a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  CFIndex Count = CFDictionaryGetCount(*this);
  int v5 = Count;
  size_t v6 = (void **)*a2;
  if (0xAAAAAAAAAAAAAAABLL * (((unsigned char *)a2[2] - (unsigned char *)*a2) >> 3) < (int)Count)
  {
    if (Count << 32 < 0) {
      abort();
    }
    uint64_t v7 = (void **)a2[1];
    char v8 = (char *)operator new(24 * (int)Count);
    id v9 = &v8[24 * v5];
    int v10 = &v8[24 * (((char *)v7 - (char *)v6) / 24)];
    if (v7 == v6)
    {
      *a2 = v10;
      a2[1] = v10;
      a2[2] = v9;
    }
    else
    {
      int v11 = &v8[24 * (((char *)v7 - (char *)v6) / 24)];
      do
      {
        long long v12 = *(_OWORD *)(v7 - 3);
        *((void *)v11 - 1) = *(v7 - 1);
        *(_OWORD *)(v11 - 24) = v12;
        v11 -= 24;
        *(v7 - 2) = 0;
        *(v7 - 1) = 0;
        *(v7 - 3) = 0;
        v7 -= 3;
      }
      while (v7 != v6);
      size_t v6 = (void **)*a2;
      unint64_t v13 = (void **)a2[1];
      *a2 = v11;
      a2[1] = v10;
      a2[2] = v9;
      while (v13 != v6)
      {
        if (*((char *)v13 - 1) < 0) {
          operator delete(*(v13 - 3));
        }
        v13 -= 3;
      }
    }
    if (v6) {
      operator delete(v6);
    }
  }
  id v42 = [(__CFDictionary *)*this keyEnumerator];
  [v42 nextObject];
  while (1)
    unint64_t v16 = {;
    if (!v16) {
      break;
    }
    id v17 = v16;
    int v18 = (const char *)[v17 UTF8String];
    uint64_t v19 = v18;
    uint64_t v21 = a2[1];
    uint64_t v20 = a2[2];
    if (v21 < (void *)v20)
    {
      size_t v22 = strlen(v18);
      if (v22 > 0x7FFFFFFFFFFFFFF7) {
        abort();
      }
      size_t v23 = v22;
      if (v22 < 0x17)
      {
        *((unsigned char *)v21 + 23) = v22;
        size_t v14 = v21;
        if (v22) {
          goto LABEL_16;
        }
      }
      else
      {
        uint64_t v24 = (v22 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v22 | 7) != 0x17) {
          uint64_t v24 = v22 | 7;
        }
        uint64_t v25 = v24 + 1;
        size_t v14 = operator new(v24 + 1);
        v21[1] = v23;
        v21[2] = v25 | 0x8000000000000000;
        void *v21 = v14;
LABEL_16:
        memmove(v14, v19, v23);
      }
      *((unsigned char *)v14 + v23) = 0;
      uint64_t v15 = v21 + 3;
      a2[1] = v21 + 3;
      goto LABEL_18;
    }
    unint64_t v26 = 0xAAAAAAAAAAAAAAABLL * (((char *)v21 - (unsigned char *)*a2) >> 3);
    unint64_t v27 = v26 + 1;
    if (v26 + 1 > 0xAAAAAAAAAAAAAAALL) {
      abort();
    }
    unint64_t v28 = 0xAAAAAAAAAAAAAAABLL * ((v20 - (unsigned char *)*a2) >> 3);
    if (2 * v28 > v27) {
      unint64_t v27 = 2 * v28;
    }
    if (v28 >= 0x555555555555555) {
      unint64_t v29 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v29 = v27;
    }
    if (v29)
    {
      if (v29 > 0xAAAAAAAAAAAAAAALL) {
        sub_2153E6200();
      }
      long long v30 = (char *)operator new(24 * v29);
    }
    else
    {
      long long v30 = 0;
    }
    long long v31 = &v30[24 * v26];
    v43 = v31;
    v44 = v31;
    v45 = &v30[24 * v29];
    size_t v32 = strlen(v19);
    if (v32 > 0x7FFFFFFFFFFFFFF7) {
      abort();
    }
    size_t v33 = v32;
    if (v32 >= 0x17)
    {
      uint64_t v34 = (v32 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v32 | 7) != 0x17) {
        uint64_t v34 = v32 | 7;
      }
      uint64_t v35 = v34 + 1;
      v36 = (char *)operator new(v34 + 1);
      *((void *)v31 + 1) = v33;
      *((void *)v31 + 2) = v35 | 0x8000000000000000;
      *(void *)long long v31 = v36;
      long long v31 = v36;
    }
    else
    {
      v31[23] = v32;
      if (!v32) {
        goto LABEL_44;
      }
    }
    memmove(v31, v19, v33);
LABEL_44:
    v31[v33] = 0;
    v37 = v43;
    uint64_t v15 = v44 + 24;
    v38 = (void **)*a2;
    uint64_t v39 = (void **)a2[1];
    if (v39 == *a2)
    {
      *a2 = v43;
      a2[1] = v15;
      a2[2] = v45;
    }
    else
    {
      do
      {
        long long v40 = *(_OWORD *)(v39 - 3);
        *((void *)v37 - 1) = *(v39 - 1);
        *(_OWORD *)(v37 - 24) = v40;
        v37 -= 24;
        *(v39 - 2) = 0;
        *(v39 - 1) = 0;
        *(v39 - 3) = 0;
        v39 -= 3;
      }
      while (v39 != v38);
      uint64_t v39 = (void **)*a2;
      v41 = (void **)a2[1];
      *a2 = v37;
      a2[1] = v15;
      a2[2] = v45;
      while (v41 != v39)
      {
        if (*((char *)v41 - 1) < 0) {
          operator delete(*(v41 - 3));
        }
        v41 -= 3;
      }
    }
    if (v39) {
      operator delete(v39);
    }
LABEL_18:
    a2[1] = v15;

    [v42 nextObject];
  }
}

void sub_215438460(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id a11, char a12)
{
  sub_215432484(v12);
  _Unwind_Resume(a1);
}

uint64_t sub_2154384BC(uint64_t a1)
{
  int v3 = *(void ***)(a1 + 8);
  uint64_t v2 = *(void ***)(a1 + 16);
  if (v2 != v3)
  {
    do
    {
      int v5 = v2 - 3;
      *(void *)(a1 + 16) = v2 - 3;
      if (*((char *)v2 - 1) < 0)
      {
        operator delete(*v5);
        int v5 = *(void ***)(a1 + 16);
      }
      uint64_t v2 = v5;
    }
    while (v5 != v3);
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

BOOL cva::DictionaryHandler::hasKey(id *this, const char *a2)
{
  CFStringRef v3 = CFStringCreateWithCStringNoCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], a2, 0x8000100u, (CFAllocatorRef)*MEMORY[0x263EFFB28]);
  id v4 = [*this valueForKey:v3];
  BOOL v5 = v4 != 0;

  CFRelease(v3);
  return v5;
}

void sub_215438594(_Unwind_Exception *a1)
{
  CFRelease(v1);
  _Unwind_Resume(a1);
}

void cva::DictionaryHandler::item(id *this@<X0>, const char *a2@<X1>, uint64_t a3@<X8>)
{
  CFStringRef v5 = CFStringCreateWithCStringNoCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], a2, 0x8000100u, (CFAllocatorRef)*MEMORY[0x263EFFB28]);
  size_t v6 = (const void *)[*this objectForKey:v5];
  char v7 = *((unsigned char *)this + 8);
  *(void *)a3 = v6;
  *(unsigned char *)(a3 + 8) = v7;
  if (v6) {
    CFRetain(v6);
  }
  else {
    *(unsigned char *)(a3 + 8) = 0;
  }
  CFRelease(v5);
}

void sub_215438638(_Unwind_Exception *a1)
{
  CFRelease(v1);
  _Unwind_Resume(a1);
}

BOOL cva::DictionaryHandler::setItem(id *this, const __CFString *a2, const cva::ItemHandler *a3)
{
  int v3 = *((unsigned __int8 *)this + 8);
  if (*((unsigned char *)this + 8)) {
    [*this setValue:*(void *)a3 forKey:a2];
  }
  return v3 != 0;
}

BOOL cva::DictionaryHandler::setItem(id *this, const char *a2, const cva::ItemHandler *a3)
{
  CFStringRef v5 = CFStringCreateWithCStringNoCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], a2, 0x8000100u, (CFAllocatorRef)*MEMORY[0x263EFFB28]);
  int v6 = *((unsigned __int8 *)this + 8);
  if (*((unsigned char *)this + 8)) {
    [*this setValue:*(void *)a3 forKey:v5];
  }
  CFRelease(v5);
  return v6 != 0;
}

void sub_215438708(_Unwind_Exception *a1)
{
  CFRelease(v1);
  _Unwind_Resume(a1);
}

BOOL cva::DictionaryHandler::removeItem(id *this, const __CFString *a2)
{
  int v2 = *((unsigned __int8 *)this + 8);
  if (*((unsigned char *)this + 8)) {
    [*this removeObjectForKey:a2];
  }
  return v2 != 0;
}

BOOL cva::DictionaryHandler::removeItem(id *this, const char *a2)
{
  CFStringRef v3 = CFStringCreateWithCStringNoCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], a2, 0x8000100u, (CFAllocatorRef)*MEMORY[0x263EFFB28]);
  int v4 = *((unsigned __int8 *)this + 8);
  if (*((unsigned char *)this + 8)) {
    [*this removeObjectForKey:v3];
  }
  CFRelease(v3);
  return v4 != 0;
}

void sub_2154387CC(_Unwind_Exception *a1)
{
  CFRelease(v1);
  _Unwind_Resume(a1);
}

uint64_t cva::DictionaryHandler::writeJsonFile(void **a1, uint64_t *a2, int a3, unsigned int a4)
{
  return sub_2154387E8(*a1, a2, a3, a4);
}

uint64_t sub_2154387E8(void *a1, uint64_t *a2, int a3, unsigned int a4)
{
  id v7 = a1;
  if ([MEMORY[0x263F08900] isValidJSONObject:v7])
  {
    char v8 = (void *)[objc_alloc(MEMORY[0x263EFF9E0]) initToMemory];
    [v8 open];
    id v9 = [v8 streamError];

    if (v9
      || (int v11 = [MEMORY[0x263F08900] writeJSONObject:v7 toStream:v8 options:a3 ^ 1u error:0],
          [v8 close],
          !v11))
    {
      uint64_t v10 = 0;
    }
    else
    {
      id v12 = [NSString alloc];
      if (*((char *)a2 + 23) >= 0) {
        unint64_t v13 = a2;
      }
      else {
        unint64_t v13 = (uint64_t *)*a2;
      }
      size_t v14 = (void *)[v12 initWithUTF8String:v13];
      uint64_t v15 = (void *)[objc_alloc(MEMORY[0x263EFF9E0]) initToFileAtPath:v14 append:0];
      [v15 open];
      unint64_t v16 = [v15 streamError];

      if (v16)
      {
        uint64_t v10 = 0;
      }
      else
      {
        id v17 = [v8 propertyForKey:*MEMORY[0x263EFF590]];
        uint64_t v10 = [v17 writeToFile:v14 options:a4 error:0];
        [v15 close];
      }
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

void sub_21543895C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void cva::DictionaryHandler::readJsonFile(uint64_t *a1@<X0>, void *a2@<X8>)
{
  int v4 = (void *)MEMORY[0x2166B9F10]();
  id v5 = [NSString alloc];
  if (*((char *)a1 + 23) >= 0) {
    int v6 = a1;
  }
  else {
    int v6 = (uint64_t *)*a1;
  }
  id v7 = (void *)[v5 initWithUTF8String:v6];
  char v8 = (void *)[objc_alloc(MEMORY[0x263EFF950]) initWithFileAtPath:v7];
  [v8 open];
  id v9 = [v8 streamError];

  if (v9)
  {
    *a2 = 0;
    a2[1] = 0;
  }
  else
  {
    uint64_t v10 = [MEMORY[0x263F08900] JSONObjectWithStream:v8 options:1 error:0];
    [v8 close];
    if (v10)
    {
      int v11 = (void *)[v10 mutableCopy];
      id v12 = operator new(0x28uLL);
      unint64_t v13 = v12;
      v12[1] = 0;
      v12[2] = 0;
      *id v12 = &unk_26C5FC400;
      v12[3] = v11;
      size_t v14 = (char *)(v12 + 3);
      *((unsigned char *)v12 + 32) = 1;
      if (v11) {
        CFRetain(v11);
      }
      else {
        *((unsigned char *)v12 + 32) = 0;
      }
      *a2 = v14;
      a2[1] = v13;
    }
    else
    {
      *a2 = 0;
      a2[1] = 0;
    }
  }
}

void sub_215438B0C(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v5);
  operator delete(v7);

  _Unwind_Resume(a1);
}

uint64_t cva::DictionaryHandler::writePlistFile(id *a1, uint64_t *a2)
{
  id v3 = *a1;
  id v4 = [NSString alloc];
  if (*((char *)a2 + 23) >= 0) {
    id v5 = a2;
  }
  else {
    id v5 = (uint64_t *)*a2;
  }
  int v6 = (void *)[v4 initWithUTF8String:v5];
  uint64_t v7 = [v3 writeToFile:v6 atomically:0];

  return v7;
}

void sub_215438BD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void cva::DictionaryHandler::readPlistFile(uint64_t *a1@<X0>, void *a2@<X8>)
{
  id v4 = [NSString alloc];
  if (*((char *)a1 + 23) >= 0) {
    id v5 = a1;
  }
  else {
    id v5 = (uint64_t *)*a1;
  }
  id v8 = (id)[v4 initWithUTF8String:v5];
  int v6 = (void *)[objc_alloc(NSDictionary) initWithContentsOfFile:v8];
  if (v6)
  {
    uint64_t v7 = operator new(0x28uLL);
    v7[1] = 0;
    v7[2] = 0;
    *uint64_t v7 = &unk_26C5FC400;
    v7[3] = v6;
    *((unsigned char *)v7 + 32) = 1;
    CFRetain(v6);
    *a2 = v7 + 3;
    a2[1] = v7;
  }
  else
  {
    *a2 = 0;
    a2[1] = 0;
  }
}

void sub_215438CD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  std::__shared_weak_count::~__shared_weak_count(v11);
  operator delete(v13);

  _Unwind_Resume(a1);
}

uint64_t cva::DictionaryHandler::isConvertibleToJSON(cva::DictionaryHandler *this)
{
  return [MEMORY[0x263F08900] isValidJSONObject:*(void *)this];
}

cva::ArrayHandler *cva::ArrayHandler::ArrayHandler(cva::ArrayHandler *this)
{
  *(void *)this = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
  *((unsigned char *)this + 8) = 1;
  return this;
}

{
  *(void *)this = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
  *((unsigned char *)this + 8) = 1;
  return this;
}

uint64_t cva::ArrayHandler::ArrayHandler(uint64_t result, uint64_t a2)
{
  *(void *)double result = *(void *)a2;
  *(unsigned char *)(result + 8) = *(unsigned char *)(a2 + 8);
  *(void *)a2 = 0;
  return result;
}

{
  *(void *)double result = *(void *)a2;
  *(unsigned char *)(result + 8) = *(unsigned char *)(a2 + 8);
  *(void *)a2 = 0;
  return result;
}

cva::ArrayHandler *cva::ArrayHandler::ArrayHandler(cva::ArrayHandler *this, CFTypeRef cf)
{
  *(void *)this = cf;
  *((unsigned char *)this + 8) = 1;
  if (cf) {
    CFRetain(cf);
  }
  else {
    *((unsigned char *)this + 8) = 0;
  }
  return this;
}

{
  *(void *)this = cf;
  *((unsigned char *)this + 8) = 1;
  if (cf) {
    CFRetain(cf);
  }
  else {
    *((unsigned char *)this + 8) = 0;
  }
  return this;
}

{
  *(void *)this = cf;
  *((unsigned char *)this + 8) = 0;
  if (cf) {
    CFRetain(cf);
  }
  return this;
}

{
  *(void *)this = cf;
  *((unsigned char *)this + 8) = 0;
  if (cf) {
    CFRetain(cf);
  }
  return this;
}

void cva::ArrayHandler::~ArrayHandler(const void **this)
{
  unint64_t v1 = *this;
  if (v1) {
    CFRelease(v1);
  }
}

{
  const void *v1;

  unint64_t v1 = *this;
  if (v1) {
    CFRelease(v1);
  }
}

uint64_t *cva::ArrayHandler::operator=(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = *result;
  *double result = *a2;
  *a2 = v2;
  LOBYTE(v2) = *((unsigned char *)result + 8);
  *((unsigned char *)result + 8) = *((unsigned char *)a2 + 8);
  *((unsigned char *)a2 + 8) = v2;
  return result;
}

uint64_t cva::ArrayHandler::getArray(cva::ArrayHandler *this)
{
  return *(void *)this;
}

BOOL cva::ArrayHandler::validIndex(void **this, int a2)
{
  BOOL result = 0;
  if ((a2 & 0x80000000) == 0)
  {
    id v4 = *this;
    if (v4) {
      return (int)[v4 count] > a2;
    }
  }
  return result;
}

uint64_t cva::ArrayHandler::setItem(id *this, int a2, const cva::ItemHandler *a3)
{
  if (!*(void *)a3) {
    return 0;
  }
  uint64_t result = 0;
  if ((a2 & 0x80000000) == 0 && *this)
  {
    if ((int)[*this count] > a2 && *((unsigned char *)this + 8))
    {
      [*this replaceObjectAtIndex:a2 withObject:*(void *)a3];
      return 1;
    }
    return 0;
  }
  return result;
}

uint64_t cva::ArrayHandler::addItem(cva::ArrayHandler *this, const cva::ItemHandler *a2)
{
  if (!*(void *)a2 || !*((unsigned char *)this + 8)) {
    return 0;
  }
  objc_msgSend(*(id *)this, "addObject:");
  return 1;
}

uint64_t cva::ArrayHandler::writeJsonFile(void **a1, uint64_t *a2, int a3, unsigned int a4)
{
  return sub_2154387E8(*a1, a2, a3, a4);
}

void cva::ArrayHandler::readJsonFile(uint64_t *a1@<X0>, void *a2@<X8>)
{
  id v4 = (void *)MEMORY[0x2166B9F10]();
  id v5 = [NSString alloc];
  if (*((char *)a1 + 23) >= 0) {
    int v6 = a1;
  }
  else {
    int v6 = (uint64_t *)*a1;
  }
  uint64_t v7 = (void *)[v5 initWithUTF8String:v6];
  id v8 = (void *)[objc_alloc(MEMORY[0x263EFF950]) initWithFileAtPath:v7];
  [v8 open];
  id v9 = [v8 streamError];

  if (v9)
  {
    *a2 = 0;
    a2[1] = 0;
  }
  else
  {
    uint64_t v10 = [MEMORY[0x263F08900] JSONObjectWithStream:v8 options:1 error:0];
    [v8 close];
    if (v10)
    {
      int v11 = (void *)[v10 mutableCopy];
      id v12 = operator new(0x28uLL);
      unint64_t v13 = v12;
      v12[1] = 0;
      v12[2] = 0;
      *id v12 = &unk_26C5FC390;
      v12[3] = v11;
      size_t v14 = (char *)(v12 + 3);
      *((unsigned char *)v12 + 32) = 1;
      if (v11) {
        CFRetain(v11);
      }
      else {
        *((unsigned char *)v12 + 32) = 0;
      }
      *a2 = v14;
      a2[1] = v13;
    }
    else
    {
      *a2 = 0;
      a2[1] = 0;
    }
  }
}

void sub_2154391CC(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v5);
  operator delete(v7);

  _Unwind_Resume(a1);
}

void cva::DirectoryIterator::Private::Private(cva::DirectoryIterator::Private *this)
{
}

{
  operator new();
}

void cva::DirectoryIterator::Private::Private()
{
}

DIR *cva::DirectoryIterator::Private::seek_valid(cva::DirectoryIterator::Private *this)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t result = (DIR *)*((void *)this + 1);
  if (result)
  {
    int v11 = 0;
    if (readdir_r(result, &v12, &v11) || !v11)
    {
      id v8 = (DIR *)*((void *)this + 1);
      if (v8)
      {
        closedir(v8);
        *((void *)this + 1) = 0;
      }
      operator new();
    }
    size_t v3 = strlen(v12.d_name);
    if (v3 >= 0x7FFFFFFFFFFFFFF8) {
      abort();
    }
    id v4 = (void *)v3;
    if (v3 >= 0x17)
    {
      uint64_t v6 = (v3 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v3 | 7) != 0x17) {
        uint64_t v6 = v3 | 7;
      }
      uint64_t v7 = v6 + 1;
      id v5 = operator new(v6 + 1);
      __p[1] = v4;
      unint64_t v10 = v7 | 0x8000000000000000;
      __p[0] = v5;
    }
    else
    {
      HIBYTE(v10) = v3;
      id v5 = __p;
      if (!v3)
      {
LABEL_12:
        *((unsigned char *)v4 + (void)v5) = 0;
        operator new();
      }
    }
    memcpy(v5, v12.d_name, (size_t)v4);
    goto LABEL_12;
  }
  return result;
}

void cva::DirectoryIterator::Private::close(cva::DirectoryIterator::Private *this)
{
  uint64_t v2 = (DIR *)*((void *)this + 1);
  if (v2)
  {
    closedir(v2);
    *((void *)this + 1) = 0;
  }
  operator new();
}

void cva::DirectoryIterator::DirectoryIterator(cva::DirectoryIterator *this)
{
}

{
  operator new();
}

void cva::DirectoryIterator::DirectoryIterator(cva::DirectoryIterator *this, const cva::Path *a2)
{
}

{
  operator new();
}

void cva::DirectoryIterator::DirectoryIterator()
{
}

{
  operator new();
}

void cva::DirectoryIterator::~DirectoryIterator(cva::DirectoryIterator *this)
{
  uint64_t v1 = *(void *)this;
  uint64_t v2 = *(DIR **)(*(void *)this + 8);
  if (v2)
  {
    closedir(v2);
    *(void *)(v1 + 8) = 0;
  }
  operator new();
}

BOOL cva::DirectoryIterator::operator BOOL(uint64_t a1)
{
  return *(void *)(*(void *)a1 + 8) != 0;
}

uint64_t cva::DirectoryIterator::operator*(void *a1)
{
  return *a1 + 16;
}

uint64_t cva::DirectoryIterator::operator->(void *a1)
{
  return *a1 + 16;
}

cva::DirectoryIterator::Private **cva::DirectoryIterator::operator++(cva::DirectoryIterator::Private **a1)
{
  return a1;
}

uint64_t cva::operator==(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *(void *)(*a1 + 8);
  uint64_t v4 = *(void *)(*(void *)a2 + 8);
  uint64_t result = (v3 | v4) == 0;
  if (v3) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    uint64_t v7 = *(unsigned __int8 **)(v2 + 16);
    id v8 = *(unsigned __int8 ***)(*(void *)a2 + 16);
    uint64_t v9 = v7[23];
    if ((v9 & 0x80u) == 0) {
      unint64_t v10 = (unsigned __int8 *)v7[23];
    }
    else {
      unint64_t v10 = (unsigned __int8 *)*((void *)v7 + 1);
    }
    int v11 = (unsigned __int8 *)*((unsigned __int8 *)v8 + 23);
    int v12 = (char)v11;
    if ((char)v11 < 0) {
      int v11 = v8[1];
    }
    if (v10 == v11)
    {
      if (v12 >= 0) {
        uint64_t v13 = *(unsigned __int8 **)(*(void *)a2 + 16);
      }
      else {
        uint64_t v13 = *v8;
      }
      if ((v9 & 0x80) != 0)
      {
        return memcmp(*(const void **)v7, v13, *((void *)v7 + 1)) == 0;
      }
      else if (v7[23])
      {
        uint64_t v14 = v9 - 1;
        do
        {
          int v16 = *v7++;
          int v15 = v16;
          int v18 = *v13++;
          int v17 = v18;
          BOOL v20 = v14-- != 0;
          uint64_t result = v15 == v17;
        }
        while (v15 == v17 && v20);
      }
      else
      {
        return 1;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

double cva::ImageDirectory::ImageDirectory(cva::ImageDirectory *this)
{
  *((void *)this + 10) = 0;
  double result = 0.0;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *((void *)this + 8) = 0;
  *((void *)this + 9) = (char *)this + 80;
  *((void *)this + 11) = 0;
  *((void *)this + 12) = (char *)this + 80;
  return result;
}

{
  double result;

  *((void *)this + 10) = 0;
  double result = 0.0;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *((void *)this + 8) = 0;
  *((void *)this + 9) = (char *)this + 80;
  *((void *)this + 11) = 0;
  *((void *)this + 12) = (char *)this + 80;
  return result;
}

void cva::ImageDirectory::open(std::string *a1, const std::string *a2, const std::string *a3)
{
  std::string::operator=(a1, a2);
  std::string::operator=(a1 + 1, a3);
  uint64_t v5 = 0;
  while (1)
  {
    BOOL v6 = off_2642418A8[v5];
    size_t v7 = strlen(v6);
    if (v7 >= 0x7FFFFFFFFFFFFFF8) {
      abort();
    }
    size_t v8 = v7;
    if (v7 >= 0x17) {
      break;
    }
    HIBYTE(v16) = v7;
    p_dst = &__dst;
    if (v7) {
      goto LABEL_11;
    }
LABEL_12:
    *((unsigned char *)p_dst + v8) = 0;
    std::string::size_type size = a1[2].__r_.__value_.__l.__size_;
    if (size < a1[2].__r_.__value_.__r.__words[2])
    {
      *(_OWORD *)std::string::size_type size = __dst;
      *(void *)(size + 16) = v16;
      a1[2].__r_.__value_.__l.__size_ = size + 24;
    }
    else
    {
      uint64_t v13 = sub_21541D040((void **)&a1[2].__r_.__value_.__l.__data_, (uint64_t)&__dst);
      int v14 = SHIBYTE(v16);
      a1[2].__r_.__value_.__l.__size_ = (std::string::size_type)v13;
      if (v14 < 0) {
        operator delete((void *)__dst);
      }
    }
    if (++v5 == 6)
    {
      cva::ImageDirectory::parseDirectory((cva::ImageDirectory *)a1);
    }
  }
  uint64_t v10 = (v7 & 0xFFFFFFFFFFFFFFF8) + 8;
  if ((v7 | 7) != 0x17) {
    uint64_t v10 = v7 | 7;
  }
  uint64_t v11 = v10 + 1;
  p_dst = (long long *)operator new(v10 + 1);
  *((void *)&__dst + 1) = v8;
  unint64_t v16 = v11 | 0x8000000000000000;
  *(void *)&long long __dst = p_dst;
LABEL_11:
  memmove(p_dst, v6, v8);
  goto LABEL_12;
}

void cva::ImageDirectory::parseDirectory(cva::ImageDirectory *this)
{
}

void cva::ImageDirectory::open(std::string *a1, const std::string *a2, const std::string *a3, uint64_t a4)
{
  std::string::operator=(a1, a2);
  std::string::operator=(a1 + 1, a3);
  std::string::pointer data = a1[2].__r_.__value_.__l.__data_;
  for (std::string::size_type i = a1[2].__r_.__value_.__l.__size_; (std::string::pointer)i != data; i -= 24)
  {
    if (*(char *)(i - 1) < 0) {
      operator delete(*(void **)(i - 24));
    }
  }
  a1[2].__r_.__value_.__l.__size_ = (std::string::size_type)data;
  if ((unint64_t)data >= a1[2].__r_.__value_.__r.__words[2])
  {
    uint64_t v10 = sub_21541857C((uint64_t)&a1[2], a4);
  }
  else
  {
    if (*(char *)(a4 + 23) < 0)
    {
      sub_2153C0AE4(data, *(void **)a4, *(void *)(a4 + 8));
    }
    else
    {
      long long v9 = *(_OWORD *)a4;
      *((void *)data + 2) = *(void *)(a4 + 16);
      *(_OWORD *)std::string::pointer data = v9;
    }
    uint64_t v10 = data + 24;
  }
  a1[2].__r_.__value_.__l.__size_ = (std::string::size_type)v10;
  cva::ImageDirectory::parseDirectory((cva::ImageDirectory *)a1);
}

void cva::ImageDirectory::close(char **this)
{
  uint64_t v1 = this + 10;
  sub_2153CF0DC(this[10]);
  *(v1 - 1) = v1;
  *uint64_t v1 = 0;
  v1[1] = 0;
  v1[2] = v1;
}

uint64_t cva::ImageDirectory::getCurrentImageName(cva::ImageDirectory *this)
{
  return *((void *)this + 12) + 40;
}

void cva::ImageDirectory::getCurrentImagePath(cva::ImageDirectory *this@<X0>, std::string *a2@<X8>)
{
  int v3 = *((char *)this + 23);
  if (v3 >= 0) {
    size_t v4 = *((unsigned __int8 *)this + 23);
  }
  else {
    size_t v4 = *((void *)this + 1);
  }
  unint64_t v5 = v4 + 1;
  if (v4 + 1 >= 0x7FFFFFFFFFFFFFF8) {
    abort();
  }
  if (v5 >= 0x17)
  {
    uint64_t v8 = (v5 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v5 | 7) != 0x17) {
      uint64_t v8 = v5 | 7;
    }
    uint64_t v9 = v8 + 1;
    p_dst = (std::string *)operator new(v8 + 1);
    __dst.__r_.__value_.__l.__size_ = v4 + 1;
    __dst.__r_.__value_.__r.__words[2] = v9 | 0x8000000000000000;
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)p_dst;
  }
  else
  {
    memset(&__dst, 0, sizeof(__dst));
    p_dst = &__dst;
    *((unsigned char *)&__dst.__r_.__value_.__s + 23) = v4 + 1;
    if (!v4) {
      goto LABEL_15;
    }
  }
  if (v3 >= 0) {
    uint64_t v10 = this;
  }
  else {
    uint64_t v10 = *(cva::ImageDirectory **)this;
  }
  memmove(p_dst, v10, v4);
LABEL_15:
  *(_WORD *)((char *)&p_dst->__r_.__value_.__l.__data_ + v4) = 47;
  uint64_t v11 = *((void *)this + 12);
  int v14 = *(const std::string::value_type **)(v11 + 40);
  uint64_t v12 = v11 + 40;
  uint64_t v13 = v14;
  int v15 = *(char *)(v12 + 23);
  if (v15 >= 0) {
    unint64_t v16 = (const std::string::value_type *)v12;
  }
  else {
    unint64_t v16 = v13;
  }
  if (v15 >= 0) {
    std::string::size_type v17 = *(unsigned __int8 *)(v12 + 23);
  }
  else {
    std::string::size_type v17 = *(void *)(v12 + 8);
  }
  int v18 = std::string::append(&__dst, v16, v17);
  *a2 = *v18;
  v18->__r_.__value_.__r.__words[0] = 0;
  v18->__r_.__value_.__l.__size_ = 0;
  v18->__r_.__value_.__r.__words[2] = 0;
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__dst.__r_.__value_.__l.__data_);
  }
}

const char *cva::ImageDirectory::getCurrentImageFormat(cva::ImageDirectory **this, char *a2, unsigned int *a3, unsigned int *a4)
{
  if (this[12] == (cva::ImageDirectory *)(this + 10)) {
    return 0;
  }
  cva::ImageDirectory::getCurrentImagePath((cva::ImageDirectory *)this, &__p);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  uint64_t v9 = cva::imfinfo((const char *)p_p, a2, a3, a4, v7);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  return v9;
}

uint64_t cva::ImageDirectory::getCurrentFrame(cva::ImageDirectory *this)
{
  return *(void *)(*((void *)this + 12) + 32);
}

uint64_t cva::ImageDirectory::getCurrentPosition(cva::ImageDirectory *this)
{
  uint64_t v1 = (void *)*((void *)this + 9);
  uint64_t v2 = (void *)*((void *)this + 12);
  if (v1 == v2) {
    return 0;
  }
  uint64_t result = 0;
  do
  {
    size_t v4 = (void *)v1[1];
    if (v4)
    {
      do
      {
        unint64_t v5 = v4;
        size_t v4 = (void *)*v4;
      }
      while (v4);
    }
    else
    {
      do
      {
        unint64_t v5 = (void *)v1[2];
        BOOL v6 = *v5 == (void)v1;
        uint64_t v1 = v5;
      }
      while (!v6);
    }
    ++result;
    uint64_t v1 = v5;
  }
  while (v5 != v2);
  return result;
}

uint64_t cva::ImageDirectory::getNumberOfImages(cva::ImageDirectory *this)
{
  return *((void *)this + 11);
}

BOOL cva::ImageDirectory::forward(cva::ImageDirectory *this, uint64_t a2)
{
  if (!a2) {
    return 1;
  }
  uint64_t v2 = (char *)this + 80;
  int v3 = (char *)*((void *)this + 12);
  while (1)
  {
    size_t v4 = (char *)*((void *)v3 + 1);
    unint64_t v5 = v3;
    if (v4)
    {
      do
      {
        int v3 = v4;
        size_t v4 = *(char **)v4;
      }
      while (v4);
    }
    else
    {
      do
      {
        int v3 = (char *)*((void *)v5 + 2);
        BOOL v6 = *(void *)v3 == (void)v5;
        unint64_t v5 = v3;
      }
      while (!v6);
    }
    BOOL v7 = v3 != v2;
    if (v3 == v2) {
      break;
    }
    if (!--a2) {
      goto LABEL_13;
    }
  }
  int v3 = (char *)this + 80;
LABEL_13:
  *((void *)this + 12) = v3;
  return v7;
}

BOOL cva::ImageDirectory::backward(cva::ImageDirectory *this, uint64_t a2)
{
  if (!a2) {
    return 1;
  }
  uint64_t v2 = (void *)*((void *)this + 9);
  int v3 = (void *)*((void *)this + 12);
  while (1)
  {
    BOOL v4 = v3 != v2;
    if (v3 == v2) {
      break;
    }
    unint64_t v5 = (void *)*v3;
    if (*v3)
    {
      do
      {
        BOOL v6 = v5;
        unint64_t v5 = (void *)v5[1];
      }
      while (v5);
    }
    else
    {
      do
      {
        BOOL v6 = (void *)v3[2];
        BOOL v7 = *v6 == (void)v3;
        int v3 = v6;
      }
      while (v7);
    }
    *((void *)this + 12) = v6;
    int v3 = v6;
    if (!--a2) {
      return 1;
    }
  }
  return v4;
}

BOOL cva::ImageDirectory::isAtEnd(cva::ImageDirectory *this)
{
  return *((void *)this + 12) == (void)this + 80;
}

uint64_t cva::ImageDirectory::seekToFrame(cva::ImageDirectory *this, unint64_t a2)
{
  uint64_t v2 = (void *)*((void *)this + 10);
  if (!v2) {
    return 0;
  }
  int v3 = (void *)((char *)this + 80);
  do
  {
    unint64_t v4 = v2[4];
    BOOL v5 = v4 >= a2;
    if (v4 >= a2) {
      BOOL v6 = v2;
    }
    else {
      BOOL v6 = v2 + 1;
    }
    if (v5) {
      int v3 = v2;
    }
    uint64_t v2 = (void *)*v6;
  }
  while (*v6);
  if (v3 == (void *)((char *)this + 80) || v3[4] > a2) {
    return 0;
  }
  *((void *)this + 12) = v3;
  return 1;
}

BOOL cva::ImageDirectory::seekToPosition(cva::ImageDirectory *this, unint64_t a2)
{
  unint64_t v2 = *((void *)this + 11);
  if (v2 > a2)
  {
    int v3 = (void *)*((void *)this + 9);
    *((void *)this + 12) = v3;
    if ((a2 & 0x8000000000000000) != 0)
    {
      unint64_t v9 = a2;
      do
      {
        uint64_t v11 = (void *)*v3;
        if (*v3)
        {
          do
          {
            BOOL v7 = v11;
            uint64_t v11 = (void *)v11[1];
          }
          while (v11);
        }
        else
        {
          do
          {
            BOOL v7 = (void *)v3[2];
            BOOL v8 = *v7 == (void)v3;
            int v3 = v7;
          }
          while (v8);
        }
        int v3 = v7;
      }
      while (!__CFADD__(v9++, 1));
      goto LABEL_19;
    }
    if (a2)
    {
      uint64_t v4 = a2;
      do
      {
        BOOL v6 = (void *)v3[1];
        if (v6)
        {
          do
          {
            BOOL v7 = v6;
            BOOL v6 = (void *)*v6;
          }
          while (v6);
        }
        else
        {
          do
          {
            BOOL v7 = (void *)v3[2];
            BOOL v8 = *v7 == (void)v3;
            int v3 = v7;
          }
          while (!v8);
        }
        int v3 = v7;
      }
      while (v4-- > 1);
LABEL_19:
      *((void *)this + 12) = v7;
    }
  }
  return v2 > a2;
}

BOOL cva::adp::io::detail::endsWith(uint64_t **a1, void *a2)
{
  size_t v2 = *((unsigned __int8 *)a1 + 23);
  size_t v3 = (size_t)a1[1];
  if ((v2 & 0x80u) == 0) {
    size_t v4 = *((unsigned __int8 *)a1 + 23);
  }
  else {
    size_t v4 = (size_t)a1[1];
  }
  int v5 = *((char *)a2 + 23);
  if (v5 >= 0) {
    size_t v6 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    size_t v6 = a2[1];
  }
  BOOL v11 = v4 >= v6;
  size_t v7 = v4 - v6;
  if (!v11) {
    return 0;
  }
  if ((v2 & 0x80) != 0)
  {
    BOOL v11 = v6 != -1 && v3 >= v7;
    if (v11)
    {
      size_t v12 = v3 - v7;
      if (v12 >= v6) {
        size_t v10 = v6;
      }
      else {
        size_t v10 = v12;
      }
      a1 = (uint64_t **)*a1;
      goto LABEL_26;
    }
LABEL_34:
    abort();
  }
  if (v2 < v7 || v6 == -1) {
    goto LABEL_34;
  }
  if (v2 - v7 >= v6) {
    size_t v10 = v6;
  }
  else {
    size_t v10 = v2 - v7;
  }
LABEL_26:
  if (v5 < 0) {
    a2 = (void *)*a2;
  }
  return !memcmp((char *)a1 + v7, a2, v10) && v10 == v6;
}

uint64_t cva::adp::io::detail::hasDelimiter(char **a1, char *a2, uint64_t a3)
{
  int v4 = *((char *)a1 + 23);
  int v5 = a2[23];
  if (v5 >= 0) {
    size_t v6 = a2;
  }
  else {
    size_t v6 = *(char **)a2;
  }
  if (v5 >= 0) {
    int64_t v7 = a2[23];
  }
  else {
    int64_t v7 = *((void *)a2 + 1);
  }
  if (v4 >= 0) {
    BOOL v8 = (char *)a1;
  }
  else {
    BOOL v8 = *a1;
  }
  if (v4 >= 0) {
    size_t v9 = *((unsigned __int8 *)a1 + 23);
  }
  else {
    size_t v9 = (size_t)a1[1];
  }
  if (!v7)
  {
    size_t v11 = 0;
LABEL_17:
    if (v9 >= v11) {
      size_t v12 = v11;
    }
    else {
      size_t v12 = v9;
    }
    if (v12 >= 0x7FFFFFFFFFFFFFF8) {
      abort();
    }
    if (v12 >= 0x17)
    {
      uint64_t v20 = (v12 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v12 | 7) != 0x17) {
        uint64_t v20 = v12 | 7;
      }
      uint64_t v21 = v20 + 1;
      p_dst = (long long *)operator new(v20 + 1);
      *((void *)&__dst + 1) = v12;
      unint64_t v23 = v21 | 0x8000000000000000;
      *(void *)&long long __dst = p_dst;
    }
    else
    {
      HIBYTE(v23) = v12;
      p_dst = &__dst;
      if (!v12) {
        goto LABEL_34;
      }
    }
    memmove(p_dst, v8, v12);
LABEL_34:
    *((unsigned char *)p_dst + v12) = 0;
    if (*(char *)(a3 + 23) < 0) {
      operator delete(*(void **)a3);
    }
    *(_OWORD *)a3 = __dst;
    *(void *)(a3 + 16) = v23;
    return 1;
  }
  if ((uint64_t)v9 >= v7)
  {
    int v14 = &v8[v9];
    int v15 = *v6;
    unint64_t v16 = (char *)v9;
    std::string::size_type v17 = v8;
    do
    {
      int v18 = &v16[-v7];
      if (v18 == (char *)-1) {
        break;
      }
      uint64_t result = (uint64_t)memchr(v17, v15, (size_t)(v18 + 1));
      if (!result) {
        return result;
      }
      uint64_t v19 = result;
      uint64_t result = memcmp((const void *)result, v6, v7);
      if (!result)
      {
        if ((char *)v19 != v14)
        {
          size_t v11 = v19 - (void)v8;
          if (v19 - (void)v8 != -1) {
            goto LABEL_17;
          }
        }
        return result;
      }
      std::string::size_type v17 = (void *)(v19 + 1);
      unint64_t v16 = &v14[-v19 - 1];
    }
    while ((uint64_t)v16 >= v7);
  }
  return 0;
}

uint64_t cva::adp::io::detail::hasSensor(void *a1, unsigned __int8 **a2, void *a3)
{
  size_t v3 = a1 + 1;
  int v4 = (void *)*a1;
  if ((void *)*a1 != a1 + 1)
  {
    char v6 = *((unsigned char *)a2 + 23);
    if (v6 >= 0) {
      int64_t v7 = (unsigned __int8 *)*((unsigned __int8 *)a2 + 23);
    }
    else {
      int64_t v7 = a2[1];
    }
    if (v6 >= 0) {
      BOOL v8 = (unsigned __int8 *)a2;
    }
    else {
      BOOL v8 = *a2;
    }
    do
    {
      uint64_t v9 = *((unsigned __int8 *)v4 + 63);
      if ((v9 & 0x80u) == 0) {
        size_t v10 = (unsigned __int8 *)*((unsigned __int8 *)v4 + 63);
      }
      else {
        size_t v10 = (unsigned __int8 *)v4[6];
      }
      if (v10 == v7)
      {
        size_t v11 = (const void **)(v4 + 5);
        if ((v9 & 0x80) != 0)
        {
          if (!memcmp(*v11, v8, v4[6]))
          {
LABEL_26:
            *a3 = v4[4];
            return 1;
          }
        }
        else
        {
          if (!*((unsigned char *)v4 + 63)) {
            goto LABEL_26;
          }
          size_t v12 = v8;
          while (*(unsigned __int8 *)v11 == *v12)
          {
            size_t v11 = (const void **)((char *)v11 + 1);
            ++v12;
            if (!--v9) {
              goto LABEL_26;
            }
          }
        }
      }
      uint64_t v13 = (void *)v4[1];
      if (v13)
      {
        do
        {
          int v14 = v13;
          uint64_t v13 = (void *)*v13;
        }
        while (v13);
      }
      else
      {
        do
        {
          int v14 = (void *)v4[2];
          BOOL v15 = *v14 == (void)v4;
          int v4 = v14;
        }
        while (!v15);
      }
      int v4 = v14;
    }
    while (v14 != v3);
  }
  return 0;
}

void *cva::adp::io::detail::reverseFind(uint64_t a1, void *a2, unsigned __int8 *a3)
{
  if ((void *)(a1 + 8) != a2)
  {
    while (*((unsigned __int8 *)a2 + 26) != *a3)
    {
      size_t v3 = (void *)a2[1];
      if (v3)
      {
        do
        {
          int v4 = v3;
          size_t v3 = (void *)*v3;
        }
        while (v3);
      }
      else
      {
        do
        {
          int v4 = (void *)a2[2];
          BOOL v5 = *v4 == (void)a2;
          a2 = v4;
        }
        while (!v5);
      }
      a2 = v4;
      if (v4 == (void *)(a1 + 8)) {
        return (void *)(a1 + 8);
      }
    }
  }
  return a2;
}

uint64_t cva::adp::io::detail::keysToNames(std::string::size_type *a1, const void **a2, const std::string **a3, uint64_t a4, uint64_t **a5)
{
  BOOL v5 = *a3;
  char v6 = a3[1];
  if (*a3 == v6) {
    return 1;
  }
  int64_t v7 = a5 + 1;
  BOOL v8 = " ";
  v54 = a3[1];
  while (1)
  {
    std::operator+<char>();
    std::string::size_type v9 = HIBYTE(v5->__r_.__value_.__r.__words[2]);
    std::string::size_type size = v5->__r_.__value_.__l.__size_;
    if ((v9 & 0x80u) == 0) {
      std::string::size_type v11 = HIBYTE(v5->__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v11 = v5->__r_.__value_.__l.__size_;
    }
    int v12 = SHIBYTE(__p.__r_.__value_.__r.__words[2]);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v13 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v13 = __p.__r_.__value_.__l.__size_;
    }
    BOOL v23 = v11 >= v13;
    std::string::size_type v14 = v11 - v13;
    if (!v23)
    {
      BOOL v15 = 0;
      if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
        goto LABEL_15;
      }
LABEL_14:
      operator delete(__p.__r_.__value_.__l.__data_);
      goto LABEL_15;
    }
    if ((v9 & 0x80) != 0)
    {
      if (v13 == -1 || size < v14) {
LABEL_102:
      }
        abort();
      if (size - v14 >= v13) {
        size_t v25 = v13;
      }
      else {
        size_t v25 = size - v14;
      }
      unint64_t v26 = (const std::string *)v5->__r_.__value_.__r.__words[0];
    }
    else
    {
      BOOL v23 = v13 != -1 && v9 >= v14;
      if (!v23) {
        goto LABEL_102;
      }
      std::string::size_type v24 = v9 - v14;
      if (v24 >= v13) {
        size_t v25 = v13;
      }
      else {
        size_t v25 = v24;
      }
      unint64_t v26 = v5;
    }
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      p_p = &__p;
    }
    else {
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    int v37 = memcmp((char *)v26 + v14, p_p, v25);
    BOOL v15 = v25 == v13 && v37 == 0;
    if (v12 < 0) {
      goto LABEL_14;
    }
LABEL_15:
    if (!v15) {
      goto LABEL_5;
    }
    unint64_t v16 = v8;
    unint64_t v60 = 0;
    int v17 = *((char *)a2 + 23);
    if (v17 >= 0) {
      size_t v18 = *((unsigned __int8 *)a2 + 23);
    }
    else {
      size_t v18 = (size_t)a2[1];
    }
    int v19 = SHIBYTE(v5->__r_.__value_.__r.__words[2]);
    if (v19 >= 0) {
      size_t v20 = HIBYTE(v5->__r_.__value_.__r.__words[2]);
    }
    else {
      size_t v20 = v5->__r_.__value_.__l.__size_;
    }
    unint64_t v21 = v20 + v18;
    if (v20 + v18 >= 0x7FFFFFFFFFFFFFF8) {
      goto LABEL_102;
    }
    if (v21 <= 0x16)
    {
      memset(&__dst, 0, sizeof(__dst));
      p_dst = &__dst;
      *((unsigned char *)&__dst.__r_.__value_.__s + 23) = v20 + v18;
      if (!v18) {
        goto LABEL_43;
      }
LABEL_39:
      if (v17 >= 0) {
        unint64_t v29 = a2;
      }
      else {
        unint64_t v29 = *a2;
      }
      memmove(p_dst, v29, v18);
      goto LABEL_43;
    }
    uint64_t v27 = (v21 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v21 | 7) != 0x17) {
      uint64_t v27 = v21 | 7;
    }
    uint64_t v28 = v27 + 1;
    p_dst = (std::string *)operator new(v27 + 1);
    __dst.__r_.__value_.__l.__size_ = v20 + v18;
    __dst.__r_.__value_.__r.__words[2] = v28 | 0x8000000000000000;
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)p_dst;
    if (v18) {
      goto LABEL_39;
    }
LABEL_43:
    long long v30 = (char *)p_dst + v18;
    if (v20)
    {
      if (v19 >= 0) {
        long long v31 = v5;
      }
      else {
        long long v31 = (const std::string *)v5->__r_.__value_.__r.__words[0];
      }
      memmove(v30, v31, v20);
    }
    v30[v20] = 0;
    size_t v32 = std::string::append(&__dst, "/");
    std::string::size_type v33 = v32->__r_.__value_.__r.__words[2];
    *(_OWORD *)&__p.__r_.__value_.__l.__data_ = *(_OWORD *)&v32->__r_.__value_.__l.__data_;
    __p.__r_.__value_.__r.__words[2] = v33;
    v32->__r_.__value_.__l.__size_ = 0;
    v32->__r_.__value_.__r.__words[2] = 0;
    v32->__r_.__value_.__r.__words[0] = 0;
    char v58 = 2;
    strcpy((char *)v57, "ID");
    int v34 = cva::adp::io::PListSerializer::getItem<unsigned long long>(a1, &__p, (uint64_t)v57, &v60);
    char v6 = v54;
    if (v58 < 0) {
      operator delete(v57[0]);
    }
    BOOL v8 = v16;
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(__p.__r_.__value_.__l.__data_);
      if ((SHIBYTE(__dst.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
LABEL_52:
        if (!v34) {
          return 0;
        }
        goto LABEL_76;
      }
    }
    else if ((SHIBYTE(__dst.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
      goto LABEL_52;
    }
    operator delete(__dst.__r_.__value_.__l.__data_);
    if (!v34) {
      return 0;
    }
LABEL_76:
    uint64_t v39 = *v7;
    unint64_t v40 = v60;
    if (*v7) {
      break;
    }
    long long v46 = v7;
    long long v47 = (char *)v7;
    if (v60 >= 0xFF) {
      return 0;
    }
LABEL_98:
    int v49 = v47;
    long long v47 = (char *)operator new(0x40uLL);
    *((void *)v47 + 4) = v40;
    *((void *)v47 + 5) = 0;
    *((void *)v47 + 6) = 0;
    *((void *)v47 + 7) = 0;
    *(void *)long long v47 = 0;
    *((void *)v47 + 1) = 0;
    *((void *)v47 + 2) = v49;
    *long long v46 = (uint64_t *)v47;
    v50 = (uint64_t *)**a5;
    v51 = (uint64_t *)v47;
    if (v50)
    {
      *a5 = v50;
      v51 = *v46;
    }
    sub_2153CF298(a5[1], v51);
    a5[2] = (uint64_t *)((char *)a5[2] + 1);
LABEL_4:
    std::string::operator=((std::string *)(v47 + 40), v5);
LABEL_5:
    if (++v5 == v6) {
      return 1;
    }
  }
  v41 = v7;
  id v42 = *v7;
  do
  {
    unint64_t v43 = v42[4];
    BOOL v44 = v43 >= v60;
    if (v43 >= v60) {
      v45 = (uint64_t **)v42;
    }
    else {
      v45 = (uint64_t **)(v42 + 1);
    }
    if (v44) {
      v41 = (uint64_t **)v42;
    }
    id v42 = *v45;
  }
  while (*v45);
  if (v41 != v7)
  {
    if (v60 >= (unint64_t)v41[4] || v60 > 0xFE) {
      return 0;
    }
    while (1)
    {
LABEL_94:
      while (1)
      {
        long long v47 = (char *)v39;
        unint64_t v48 = v39[4];
        if (v60 >= v48) {
          break;
        }
        uint64_t v39 = *(uint64_t **)v47;
        long long v46 = (uint64_t **)v47;
        if (!*(void *)v47) {
          goto LABEL_98;
        }
      }
      if (v48 >= v60) {
        goto LABEL_4;
      }
      uint64_t v39 = (uint64_t *)*((void *)v47 + 1);
      if (!v39)
      {
        long long v46 = (uint64_t **)(v47 + 8);
        goto LABEL_98;
      }
    }
  }
  if (v60 < 0xFF) {
    goto LABEL_94;
  }
  return 0;
}

uint64_t cva::adp::io::detail::createFromToTree(void *a1, uint64_t *a2, unsigned __int8 *a3, uint64_t **a4)
{
  int v4 = a1 + 1;
  BOOL v5 = (void *)*a1;
  if ((void *)*a1 == a1 + 1) {
    return 1;
  }
  BOOL v8 = (unsigned __int8 **)(a4 + 1);
  while (2)
  {
    uint64_t v10 = *a2;
    uint64_t v9 = a2[1];
    if (*a2 != v9)
    {
      int v11 = *((char *)v5 + 63);
      if (v11 >= 0) {
        unint64_t v12 = *((unsigned __int8 *)v5 + 63);
      }
      else {
        unint64_t v12 = v5[6];
      }
      if (v12 == -1)
      {
        if (v11 < 0)
        {
          while ((*(char *)(v10 + 23) & 0x80000000) == 0 || *(void *)(v10 + 8) != -1)
          {
            v10 += 24;
            if (v10 == v9) {
              goto LABEL_84;
            }
          }
        }
        else
        {
          while ((*(char *)(v10 + 23) & 0x80000000) == 0 || *(void *)(v10 + 8) != -1)
          {
            v10 += 24;
            if (v10 == v9) {
              goto LABEL_84;
            }
          }
        }
LABEL_152:
        abort();
      }
      if (v11 < 0)
      {
        while (1)
        {
          unint64_t v27 = *(unsigned __int8 *)(v10 + 23);
          unint64_t v28 = *(void *)(v10 + 8);
          unint64_t v29 = (v27 & 0x80u) == 0 ? *(unsigned __int8 *)(v10 + 23) : *(void *)(v10 + 8);
          BOOL v20 = v29 >= v12;
          unint64_t v30 = v29 - v12;
          if (v20)
          {
            if ((v27 & 0x80) != 0)
            {
              if (v28 < v30) {
                goto LABEL_152;
              }
              size_t v23 = v28 - v30 >= v12 ? v12 : v28 - v30;
              std::string::size_type v24 = *(char **)v10;
            }
            else
            {
              BOOL v20 = v27 >= v30;
              unint64_t v31 = v27 - v30;
              if (!v20) {
                goto LABEL_152;
              }
              size_t v23 = v31 >= v12 ? v12 : v31;
              std::string::size_type v24 = (char *)v10;
            }
            int v25 = memcmp(&v24[v30], (const void *)v5[5], v23);
            if (v23 == v12 && v25 == 0) {
              break;
            }
          }
          v10 += 24;
          if (v10 == v9) {
            goto LABEL_84;
          }
        }
      }
      else
      {
        while (1)
        {
          unint64_t v17 = *(unsigned __int8 *)(v10 + 23);
          unint64_t v18 = *(void *)(v10 + 8);
          unint64_t v19 = (v17 & 0x80u) == 0 ? *(unsigned __int8 *)(v10 + 23) : *(void *)(v10 + 8);
          BOOL v20 = v19 >= v12;
          unint64_t v21 = v19 - v12;
          if (v20)
          {
            if ((v17 & 0x80) != 0)
            {
              if (v18 < v21) {
                goto LABEL_152;
              }
              size_t v13 = v18 - v21 >= v12 ? v12 : v18 - v21;
              std::string::size_type v14 = *(char **)v10;
            }
            else
            {
              BOOL v20 = v17 >= v21;
              unint64_t v22 = v17 - v21;
              if (!v20) {
                goto LABEL_152;
              }
              size_t v13 = v22 >= v12 ? v12 : v22;
              std::string::size_type v14 = (char *)v10;
            }
            int v15 = memcmp(&v14[v21], v5 + 5, v13);
            BOOL v16 = v13 == v12 && v15 == 0;
            if (v16) {
              break;
            }
          }
          v10 += 24;
          if (v10 == v9) {
            goto LABEL_84;
          }
        }
      }
    }
    if (v10 == v9)
    {
LABEL_84:
      unsigned int v40 = *((unsigned __int8 *)v5 + 32);
      v41 = *v8;
      id v42 = (uint64_t **)v8;
      unint64_t v43 = v8;
      if (*v8)
      {
        while (1)
        {
          while (1)
          {
            unint64_t v43 = v41;
            unsigned int v44 = v41[25];
            if (v44 <= v40) {
              break;
            }
            v41 = (unsigned __int8 *)*v43;
            id v42 = (uint64_t **)v43;
            if (!*v43) {
              goto LABEL_91;
            }
          }
          if (v44 >= v40) {
            break;
          }
          v41 = (unsigned __int8 *)v43[1];
          if (!v41)
          {
            id v42 = (uint64_t **)(v43 + 1);
            goto LABEL_91;
          }
        }
      }
      else
      {
LABEL_91:
        v45 = v43;
        unint64_t v43 = operator new(0x20uLL);
        *((unsigned char *)v43 + 25) = v40;
        *((unsigned char *)v43 + 26) = 0;
        void *v43 = 0;
        v43[1] = 0;
        v43[2] = v45;
        uint64_t *v42 = v43;
        long long v46 = (uint64_t *)**a4;
        long long v47 = v43;
        if (v46)
        {
          *a4 = v46;
          long long v47 = *v42;
        }
        sub_2153CF298(a4[1], v47);
        a4[2] = (uint64_t *)((char *)a4[2] + 1);
      }
      *((unsigned char *)v43 + 26) = -1;
      goto LABEL_124;
    }
    __s1 = 0;
    size_t __n = 0;
    uint64_t v76 = 0;
    char v73 = 4;
    strcpy((char *)__p, " To ");
    int hasDelimiter = cva::adp::io::detail::hasDelimiter((char **)v10, (char *)__p, (uint64_t)&__s1);
    if (v73 < 0) {
      operator delete(__p[0]);
    }
    uint64_t v33 = HIBYTE(v76);
    int v34 = SHIBYTE(v76);
    if (!hasDelimiter) {
      goto LABEL_121;
    }
    if (v76 >= 0) {
      size_t v35 = HIBYTE(v76);
    }
    else {
      size_t v35 = __n;
    }
    uint64_t v36 = a3[23];
    int v37 = (char)v36;
    if ((v36 & 0x80u) != 0) {
      uint64_t v36 = *((void *)a3 + 1);
    }
    if (v35 == v36)
    {
      if (v37 >= 0) {
        v38 = a3;
      }
      else {
        v38 = *(unsigned __int8 **)a3;
      }
      if (SHIBYTE(v76) < 0)
      {
        if (!memcmp(__s1, v38, __n))
        {
LABEL_137:
          LODWORD(v56) = *((unsigned __int8 *)v5 + 32);
          v67 = *v8;
          v59 = v8;
          unint64_t v60 = v8;
          if (!*v8)
          {
LABEL_144:
            v65 = operator new(0x20uLL);
            v65[25] = v56;
            v65[26] = 0;
            *(void *)v65 = 0;
            *((void *)v65 + 1) = 0;
            *((void *)v65 + 2) = v60;
            *v59 = v65;
            v66 = (uint64_t *)**a4;
            LOBYTE(v56) = -1;
            unint64_t v60 = (unsigned __int8 **)v65;
            if (!v66) {
              goto LABEL_146;
            }
            goto LABEL_145;
          }
          while (1)
          {
            while (1)
            {
              unint64_t v60 = (unsigned __int8 **)v67;
              unsigned int v68 = v67[25];
              if (v68 <= v56) {
                break;
              }
              v67 = *v60;
              v59 = v60;
              if (!*v60) {
                goto LABEL_144;
              }
            }
            if (v68 >= v56) {
              break;
            }
            v67 = v60[1];
            if (!v67)
            {
              v59 = v60 + 1;
              goto LABEL_144;
            }
          }
          LOBYTE(v56) = -1;
          goto LABEL_147;
        }
      }
      else
      {
        if (!HIBYTE(v76)) {
          goto LABEL_137;
        }
        p_s1 = &__s1;
        while (*(unsigned __int8 *)p_s1 == *v38)
        {
          p_s1 = (void **)((char *)p_s1 + 1);
          ++v38;
          if (!--v33) {
            goto LABEL_137;
          }
        }
      }
    }
    unint64_t v48 = (void *)*a1;
    if ((void *)*a1 == v4) {
      goto LABEL_121;
    }
    int v49 = v34 >= 0 ? &__s1 : (void **)__s1;
    while (1)
    {
      uint64_t v50 = *((unsigned __int8 *)v48 + 63);
      if ((v50 & 0x80u) == 0) {
        uint64_t v51 = *((unsigned __int8 *)v48 + 63);
      }
      else {
        uint64_t v51 = v48[6];
      }
      if (v51 != v35) {
        goto LABEL_112;
      }
      v52 = (const void **)(v48 + 5);
      if ((v50 & 0x80) != 0) {
        break;
      }
      if (!*((unsigned char *)v48 + 63)) {
        goto LABEL_118;
      }
      v53 = v49;
      while (*(unsigned __int8 *)v52 == *(unsigned __int8 *)v53)
      {
        v52 = (const void **)((char *)v52 + 1);
        v53 = (void **)((char *)v53 + 1);
        if (!--v50) {
          goto LABEL_118;
        }
      }
LABEL_112:
      v54 = (void *)v48[1];
      if (v54)
      {
        do
        {
          v55 = v54;
          v54 = (void *)*v54;
        }
        while (v54);
      }
      else
      {
        do
        {
          v55 = (void *)v48[2];
          BOOL v16 = *v55 == (void)v48;
          unint64_t v48 = v55;
        }
        while (!v16);
      }
      unint64_t v48 = v55;
      if (v55 == v4) {
        goto LABEL_121;
      }
    }
    if (memcmp(*v52, v49, v48[6])) {
      goto LABEL_112;
    }
LABEL_118:
    unint64_t v56 = v48[4];
    if (v56 > 0xFE)
    {
LABEL_121:
      char v61 = 0;
      if ((v34 & 0x80) != 0) {
        goto LABEL_122;
      }
      goto LABEL_123;
    }
    unsigned int v57 = *((unsigned __int8 *)v5 + 32);
    char v58 = *v8;
    v59 = v8;
    unint64_t v60 = v8;
    if (!*v8)
    {
LABEL_135:
      v65 = operator new(0x20uLL);
      v65[25] = v57;
      v65[26] = 0;
      *(void *)v65 = 0;
      *((void *)v65 + 1) = 0;
      *((void *)v65 + 2) = v60;
      *v59 = v65;
      v66 = (uint64_t *)**a4;
      unint64_t v60 = (unsigned __int8 **)v65;
      if (!v66)
      {
LABEL_146:
        sub_2153CF298(a4[1], (uint64_t *)v65);
        a4[2] = (uint64_t *)((char *)a4[2] + 1);
        LOBYTE(v34) = HIBYTE(v76);
        goto LABEL_147;
      }
LABEL_145:
      unint64_t v60 = (unsigned __int8 **)v65;
      *a4 = v66;
      v65 = *v59;
      goto LABEL_146;
    }
    while (1)
    {
      while (1)
      {
        unint64_t v60 = (unsigned __int8 **)v58;
        unsigned int v64 = v58[25];
        if (v64 <= v57) {
          break;
        }
        char v58 = *v60;
        v59 = v60;
        if (!*v60) {
          goto LABEL_135;
        }
      }
      if (v64 >= v57) {
        break;
      }
      char v58 = v60[1];
      if (!v58)
      {
        v59 = v60 + 1;
        goto LABEL_135;
      }
    }
LABEL_147:
    *((unsigned char *)v60 + 26) = v56;
    char v61 = 1;
    if ((v34 & 0x80) != 0) {
LABEL_122:
    }
      operator delete(__s1);
LABEL_123:
    if ((v61 & 1) == 0) {
      return 0;
    }
LABEL_124:
    int v62 = (void *)v5[1];
    if (v62)
    {
      do
      {
        BOOL v63 = v62;
        int v62 = (void *)*v62;
      }
      while (v62);
    }
    else
    {
      do
      {
        BOOL v63 = (void *)v5[2];
        BOOL v16 = *v63 == (void)v5;
        BOOL v5 = v63;
      }
      while (!v16);
    }
    BOOL v5 = v63;
    if (v63 != v4) {
      continue;
    }
    return 1;
  }
}

void cva::adp::io::detail::findChildNodes(void *a1, int a2, unint64_t *a3)
{
  BOOL v5 = a1 + 1;
  char v6 = (void *)*a1;
  if (a1 + 1 != (void *)*a1)
  {
    while (*((unsigned __int8 *)v6 + 26) != a2)
    {
      size_t v35 = (void *)v6[1];
      if (v35)
      {
        do
        {
          uint64_t v36 = v35;
          size_t v35 = (void *)*v35;
        }
        while (v35);
      }
      else
      {
        do
        {
          uint64_t v36 = (void *)v6[2];
          BOOL v22 = *v36 == (void)v6;
          char v6 = v36;
        }
        while (!v22);
      }
      char v6 = v36;
      if (v36 == v5) {
        return;
      }
    }
  }
  if (v6 != v5)
  {
    int64_t v7 = (unsigned char *)a3[1];
    while (1)
    {
      unint64_t v8 = a3[2];
      if ((unint64_t)v7 < v8)
      {
        *v7++ = *((unsigned char *)v6 + 25);
        goto LABEL_28;
      }
      unint64_t v9 = *a3;
      unint64_t v10 = (unint64_t)&v7[-*a3];
      unint64_t v11 = v10 + 1;
      if ((uint64_t)(v10 + 1) < 0) {
        abort();
      }
      unint64_t v12 = v8 - v9;
      if (2 * v12 > v11) {
        unint64_t v11 = 2 * v12;
      }
      size_t v13 = v12 >= 0x3FFFFFFFFFFFFFFFLL ? 0x7FFFFFFFFFFFFFFFLL : v11;
      std::string::size_type v14 = v13 ? operator new(v13) : 0;
      int v15 = (char *)v14 + v10;
      *((unsigned char *)v14 + v10) = *((unsigned char *)v6 + 25);
      uint64_t v16 = (uint64_t)v14 + v10 + 1;
      if (v7 != (unsigned char *)v9) {
        break;
      }
LABEL_25:
      *a3 = (unint64_t)v15;
      a3[1] = v16;
      a3[2] = (unint64_t)v14 + v13;
      if (v7) {
        operator delete(v7);
      }
      int64_t v7 = (unsigned char *)v16;
LABEL_28:
      a3[1] = (unint64_t)v7;
      BOOL v20 = (void *)v6[1];
      if (v20)
      {
        do
        {
          unint64_t v21 = v20;
          BOOL v20 = (void *)*v20;
        }
        while (v20);
      }
      else
      {
        do
        {
          unint64_t v21 = (void *)v6[2];
          BOOL v22 = *v21 == (void)v6;
          char v6 = v21;
        }
        while (!v22);
      }
      if (v5 != v21)
      {
        char v6 = v21;
        while (*((unsigned __int8 *)v6 + 26) != a2)
        {
          size_t v23 = (void *)v6[1];
          if (v23)
          {
            do
            {
              std::string::size_type v24 = v23;
              size_t v23 = (void *)*v23;
            }
            while (v23);
          }
          else
          {
            do
            {
              std::string::size_type v24 = (void *)v6[2];
              BOOL v22 = *v24 == (void)v6;
              char v6 = v24;
            }
            while (!v22);
          }
          char v6 = v24;
          if (v24 == v5) {
            return;
          }
        }
        if (v6 != v5) {
          continue;
        }
      }
      return;
    }
    if (v10 < 8
      || (char *)v14 + v10 + v9 - (void)v7 > (char *)v14 + v10 - 1
      || v9 > (unint64_t)(v7 - 1)
      || v9 - (unint64_t)v14 < 0x20)
    {
      unint64_t v17 = v7;
      goto LABEL_21;
    }
    if (v10 >= 0x20)
    {
      unint64_t v25 = v10 & 0xFFFFFFFFFFFFFFE0;
      unint64_t v26 = (char *)v14 + v10 - 16;
      unint64_t v27 = (long long *)(v7 - 16);
      unint64_t v28 = v10 & 0xFFFFFFFFFFFFFFE0;
      do
      {
        long long v29 = *v27;
        *(v26 - 1) = *(v27 - 1);
        *unint64_t v26 = v29;
        v26 -= 2;
        v27 -= 2;
        v28 -= 32;
      }
      while (v28);
      if (v10 == v25) {
        goto LABEL_54;
      }
      if ((v10 & 0x18) == 0)
      {
        v15 -= v25;
        unint64_t v17 = &v7[-v25];
        goto LABEL_21;
      }
    }
    else
    {
      unint64_t v25 = 0;
    }
    unint64_t v17 = &v7[-(v10 & 0xFFFFFFFFFFFFFFF8)];
    unint64_t v30 = v25 - (v10 & 0xFFFFFFFFFFFFFFF8);
    unint64_t v31 = &v7[-v25];
    size_t v32 = &v7[-v25 - v9 - 8 + (void)v14];
    uint64_t v33 = (uint64_t *)(v31 - 8);
    do
    {
      uint64_t v34 = *v33--;
      *v32-- = v34;
      v30 += 8;
    }
    while (v30);
    if (v10 == (v10 & 0xFFFFFFFFFFFFFFF8))
    {
LABEL_54:
      int64_t v7 = (unsigned char *)v9;
LABEL_24:
      int v15 = (char *)v14;
      goto LABEL_25;
    }
    v15 -= v10 & 0xFFFFFFFFFFFFFFF8;
LABEL_21:
    unint64_t v18 = v15 - 1;
    do
    {
      char v19 = *--v17;
      *v18-- = v19;
    }
    while (v17 != (unsigned char *)v9);
    int64_t v7 = (unsigned char *)*a3;
    goto LABEL_24;
  }
}

uint64_t cva::RigidBodyKinematics::integrateAndJacobians(uint64_t a1, unsigned int *a2, double **a3, uint64_t a4, uint64_t a5, double *a6, double *a7, unint64_t a8, double a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  if (a9 < 0.0) {
    return 0;
  }
  uint64_t v273 = v26;
  uint64_t v274 = v25;
  uint64_t v275 = v24;
  uint64_t v276 = v23;
  uint64_t v277 = v22;
  uint64_t v278 = v21;
  uint64_t v279 = v20;
  uint64_t v280 = v19;
  uint64_t v281 = v17;
  uint64_t v282 = v18;
  double v257 = 0.0;
  float64x2_t v256 = 0u;
  float64x2_t v255 = 0u;
  float64x2_t v254 = 0u;
  float64x2_t v253 = 0u;
  *(void *)&v258[16] = 0;
  *(void *)&v258[8] = 0;
  size_t v32 = *a3;
  *(double *)v258 = **a3 * a9;
  *(float64x2_t *)&v258[8] = vmulq_n_f64(*(float64x2_t *)(v32 + 1), a9);
  {
    cva::Rotation3<double>::ExpAndJacobian(cva::MatrixRef<double const,3u,1u,false> const&,cva::Matrix<double,3u,3u,false> *)::kThreshold = 0x3E50000000000000;
  }
  double v33 = sqrt(*(double *)v258 * *(double *)v258+ *(double *)&v258[8] * *(double *)&v258[8]+ *(double *)&v258[16] * *(double *)&v258[16]);
  double v172 = cos(v33 * 0.5);
  double v173 = *(double *)&v258[8];
  double v174 = *(double *)&v258[16];
  double v175 = *(double *)v258;
  if (v33 <= *(double *)&cva::Rotation3<double>::ExpAndJacobian(cva::MatrixRef<double const,3u,1u,false> const&,cva::Matrix<double,3u,3u,false> *)::kThreshold)
  {
    double v171 = v33 * v33 / -48.0 + 0.5;
    v253.f64[1] = *(double *)&v258[16] * 0.5;
    v254.f64[0] = *(double *)&v258[8] * -0.5;
    v254.f64[1] = *(double *)&v258[16] * -0.5;
    v255.f64[1] = *(double *)v258 * 0.5;
    v256.f64[0] = *(double *)&v258[8] * 0.5;
    v256.f64[1] = *(double *)v258 * -0.5;
    v253.f64[0] = 1.0;
    v255.f64[0] = 1.0;
    double v257 = 1.0;
    double v36 = 1.0;
  }
  else
  {
    double v34 = sin(v33 * 0.5);
    double v261 = 0.0;
    v263.f64[1] = -(*(double *)&v258[16] / v33);
    double v264 = 0.0;
    double v267 = -(*(double *)v258 / v33);
    double v262 = *(double *)&v258[16] / v33;
    v263.f64[0] = -(*(double *)&v258[8] / v33);
    double v266 = *(double *)&v258[8] / v33;
    double v265 = *(double *)v258 / v33;
    double v268 = 0.0;
    double v171 = v34 / v33;
    long double v35 = (v33 - sin(v33)) / v33;
    v254.f64[0] = -(*(double *)&v258[8] / v33 * v35);
    v254.f64[1] = -(*(double *)&v258[16] / v33 * v35);
    v256.f64[0] = v35 * (*(double *)&v258[8] / v33);
    v256.f64[1] = -(*(double *)v258 / v33 * v35);
    v253.f64[1] = v35 * (*(double *)&v258[16] / v33);
    v253.f64[0] = 2.0 / v33 * (v34 * v34) + v35 * 0.0;
    v255.f64[1] = v35 * (*(double *)v258 / v33);
    v255.f64[0] = v253.f64[0];
    double v257 = v253.f64[0];
    *(void *)&v251[0] = &v253;
    *((void *)&v251[0] + 1) = &v261;
    memset(v269, 0, sizeof(v269));
    long long v270 = 0u;
    float64x2_t v271 = 0u;
    double v272 = 0.0;
    sub_2153CB228((uint64_t)v269, (double **)v251);
    v253.f64[1] = *((float64_t *)v269 + 1);
    float64x2_t v254 = (float64x2_t)v269[1];
    v255.f64[1] = *((float64_t *)&v270 + 1);
    float64x2_t v256 = v271;
    v253.f64[0] = *(double *)v269 + 1.0;
    v255.f64[0] = *(double *)&v270 + 1.0;
    double v36 = v272 + 1.0;
    double v257 = v272 + 1.0;
  }
  v251[0] = vmulq_n_f64(v253, a9);
  v251[1] = vmulq_n_f64(v254, a9);
  v251[2] = vmulq_n_f64(v255, a9);
  v251[3] = vmulq_n_f64(v256, a9);
  double v252 = v36 * a9;
  double v243 = 0.0;
  float64x2_t v242 = 0u;
  long long v241 = 0u;
  long long v240 = 0u;
  long long v239 = 0u;
  double v261 = 0.0;
  double v264 = 0.0;
  double v37 = *(double *)(a1 + 24);
  double v38 = *(double *)(a1 + 32);
  double v267 = -v38;
  double v268 = 0.0;
  float64x2_t v39 = *(float64x2_t *)(a1 + 40);
  double v265 = v38;
  double v262 = v39.f64[1];
  double v266 = v39.f64[0];
  float64x2_t v263 = vnegq_f64(v39);
  __asm { FMOV            V1.2D, #-2.0 }
  float64x2_t v182 = _Q1;
  float64x2_t v170 = v39;
  *(float64x2_t *)&v258[16] = vmulq_f64(v39, _Q1);
  *(float64x2_t *)&v259[8] = vaddq_f64(*(float64x2_t *)(a1 + 32), *(float64x2_t *)(a1 + 32));
  double v169 = v37;
  *(double *)&v258[8] = v39.f64[1] + v39.f64[1];
  *(double *)v258 = v37 + v37 + 0.0;
  *(double *)&v259[24] = v38 * -2.0;
  *(double *)v259 = *(double *)v258;
  double v260 = *(double *)v258;
  uint64_t v244 = (uint64_t)v258;
  *(void *)&long long v245 = &v261;
  memset(v269, 0, sizeof(v269));
  long long v270 = 0u;
  float64x2_t v271 = 0u;
  double v272 = 0.0;
  sub_2153CB228((uint64_t)v269, (double **)&v244);
  *(void *)&v258[8] = *((void *)&v269[0] + 1);
  *(_OWORD *)&v258[16] = v269[1];
  *(void *)&v259[8] = *((void *)&v270 + 1);
  *(float64x2_t *)&v259[16] = v271;
  *(double *)v258 = *(double *)v269 + 1.0;
  *(double *)v259 = *(double *)&v270 + 1.0;
  double v260 = v272 + 1.0;
  double v243 = v272 + 1.0;
  float64x2_t v242 = v271;
  long long v241 = *(_OWORD *)v259;
  long long v239 = *(_OWORD *)v258;
  long long v240 = v269[1];
  long long v248 = 0u;
  uint64_t v246 = 0;
  long long v245 = 0u;
  uint64_t v244 = 0x3FF0000000000000;
  uint64_t v247 = 0x3FF0000000000000;
  uint64_t v249 = 0;
  uint64_t v250 = 0x3FF0000000000000;
  *(void *)&v269[0] = &v239;
  *((void *)&v269[0] + 1) = v251;
  memset(v237, 0, sizeof(v237));
  uint64_t v238 = 0;
  sub_2153CB228((uint64_t)v237, (double **)v269);
  unint64_t v236 = 0;
  long long v234 = 0u;
  long long v235 = 0u;
  long long v232 = 0u;
  long long v233 = 0u;
  double v231 = 0.0;
  long long v229 = 0u;
  long long v230 = 0u;
  long long v227 = 0u;
  long long v228 = 0u;
  double v261 = 0.0;
  double v264 = 0.0;
  double v46 = *(double *)(a1 + 24);
  double v45 = *(double *)(a1 + 32);
  double v267 = -v45;
  double v268 = 0.0;
  float64x2_t v47 = *(float64x2_t *)(a1 + 40);
  double v265 = v45;
  double v266 = v47.f64[0];
  float64x2_t v263 = vnegq_f64(v47);
  double v262 = v47.f64[1];
  *(float64x2_t *)&v258[16] = vmulq_f64(v47, v182);
  *(float64x2_t *)&v259[8] = vaddq_f64(*(float64x2_t *)(a1 + 32), *(float64x2_t *)(a1 + 32));
  *(double *)&v258[8] = v47.f64[1] + v47.f64[1];
  *(double *)v258 = v46 + v46 + 0.0;
  *(double *)&v259[24] = v45 * -2.0;
  *(double *)v259 = *(double *)v258;
  double v260 = *(double *)v258;
  uint64_t v220 = (uint64_t)v258;
  *(void *)&long long v221 = &v261;
  memset(v269, 0, sizeof(v269));
  long long v270 = 0u;
  float64x2_t v271 = 0u;
  double v272 = 0.0;
  sub_2153CB228((uint64_t)v269, (double **)&v220);
  *(void *)&v258[8] = *((void *)&v269[0] + 1);
  *(_OWORD *)&v258[16] = v269[1];
  *(void *)&v259[8] = *((void *)&v270 + 1);
  *(float64x2_t *)&v259[16] = v271;
  *(double *)v258 = *(double *)v269 + 1.0;
  *(double *)v259 = *(double *)&v270 + 1.0;
  double v260 = v272 + 1.0;
  double v261 = COERCE_DOUBLE(v258);
  double v262 = *(double *)&a4;
  memset(v269, 0, 24);
  sub_2153DB29C((uint64_t)v269, (uint64_t)&v261);
  long long v48 = *(_OWORD *)((char *)v269 + 8);
  *(void *)&long long v232 = 0x8000000000000000;
  *((double *)&v232 + 1) = -*(double *)&v269[1];
  long long v233 = *(_OWORD *)((char *)v269 + 8);
  *(void *)&long long v234 = 0x8000000000000000;
  *((double *)&v234 + 1) = -*(double *)v269;
  *(double *)&long long v235 = -*((double *)v269 + 1);
  *((void *)&v235 + 1) = *(void *)&v269[0];
  unint64_t v236 = 0x8000000000000000;
  long long v229 = *(_OWORD *)v259;
  long long v230 = *(_OWORD *)&v259[16];
  double v231 = v260;
  long long v227 = *(_OWORD *)v258;
  long long v228 = *(_OWORD *)&v258[16];
  double v49 = *(double *)v269 + **(double **)a5;
  double v181 = *(double *)(*(void *)a5 + 16);
  double v183 = *(double *)(*(void *)a5 + 8);
  double v50 = *(double *)(*(void *)a2 + 8);
  double v51 = **(double **)a2 * a9;
  double v180 = *(double *)(*(void *)a2 + 16);
  *(double *)v269 = a9;
  *((double *)v269 + 1) = a9 * 0.0;
  *(double *)&v269[1] = a9 * 0.0;
  *((double *)&v269[1] + 1) = a9 * 0.0;
  *(double *)&long long v270 = a9;
  *((double *)&v270 + 1) = a9 * 0.0;
  v271.f64[0] = a9 * 0.0;
  v271.f64[1] = a9 * 0.0;
  double v272 = a9;
  double v52 = *(double *)&v270 * 0.5 * *(double *)&v270;
  double v261 = v52;
  double v262 = v52 * 0.0;
  v263.f64[0] = v52 * 0.0;
  v263.f64[1] = v52 * 0.0;
  double v264 = v52;
  double v265 = v52 * 0.0;
  double v266 = v52 * 0.0;
  double v267 = v52 * 0.0;
  double v268 = v52;
  double v53 = *(double *)(a1 + 8);
  double v168 = v49;
  double v54 = v52 * v49 + *(double *)a1 + v51;
  double v179 = *(double *)(a1 + 16);
  memset(&v259[8], 0, 24);
  memset(&v258[8], 0, 24);
  *(void *)v258 = 0x3FF0000000000000;
  *(void *)v259 = 0x3FF0000000000000;
  double v260 = 1.0;
  uint64_t v222 = 0;
  long long v224 = 0u;
  long long v221 = 0u;
  uint64_t v220 = 0x3FF0000000000000;
  uint64_t v223 = 0x3FF0000000000000;
  uint64_t v225 = 0;
  uint64_t v226 = 0x3FF0000000000000;
  uint64_t v215 = 0;
  long long v217 = 0u;
  long long v214 = 0u;
  uint64_t v213 = 0x3FF0000000000000;
  uint64_t v216 = 0x3FF0000000000000;
  uint64_t v218 = 0;
  uint64_t v219 = 0x3FF0000000000000;
  *(void *)&v209[0] = &v220;
  *((void *)&v209[0] + 1) = v269;
  memset(v211, 0, sizeof(v211));
  uint64_t v212 = 0;
  sub_2153CB228((uint64_t)v211, (double **)v209);
  double v198 = COERCE_DOUBLE(&v213);
  double v199 = COERCE_DOUBLE(&v261);
  *(void *)&v207[0] = &v198;
  *((void *)&v207[0] + 1) = &v227;
  memset(v209, 0, sizeof(v209));
  uint64_t v210 = 0;
  sub_21543CE30((uint64_t)v209, (uint64_t)v207);
  uint64_t v191 = (uint64_t)&v213;
  *(void *)&long long v192 = &v261;
  double v198 = COERCE_DOUBLE(&v191);
  double v199 = COERCE_DOUBLE(&v232);
  memset(v207, 0, sizeof(v207));
  uint64_t v208 = 0;
  sub_21543CE30((uint64_t)v207, (uint64_t)&v198);
  double v198 = a9;
  double v199 = a9 * 0.0;
  double v200 = a9 * 0.0;
  double v201 = a9 * 0.0;
  double v202 = a9;
  double v203 = a9 * 0.0;
  double v204 = a9 * 0.0;
  double v205 = a9 * 0.0;
  double v206 = a9;
  uint64_t v193 = 0;
  long long v195 = 0u;
  long long v192 = 0u;
  uint64_t v191 = 0x3FF0000000000000;
  uint64_t v196 = 0;
  uint64_t v197 = 0x3FF0000000000000;
  uint64_t v194 = 0x3FF0000000000000;
  v185 = &v191;
  v186 = &v198;
  v187 = &v185;
  v188 = &v232;
  memset(v189, 0, sizeof(v189));
  uint64_t v190 = 0;
  sub_21543CE30((uint64_t)v189, (uint64_t)&v187);
  if ((*(void *)&v54 & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FEFFFFFFFFFFFFFLL) {
    return 0;
  }
  double v55 = v52 * (*(double *)&v48 + v183) + v53 + v50 * a9;
  if (COERCE__INT64(fabs(v55)) > 0x7FEFFFFFFFFFFFFFLL) {
    return 0;
  }
  double v56 = v52 * (*((double *)&v48 + 1) + v181) + v179 + v180 * a9;
  if (COERCE__INT64(fabs(v56)) > 0x7FEFFFFFFFFFFFFFLL) {
    return 0;
  }
  _D5 = v171 * v173;
  _V24.D[1] = v170.f64[1];
  double v59 = v172 * v169 - (v171 * v175 * v38 + v171 * v173 * v170.f64[0] + vmuld_lane_f64(v171 * v174, v170, 1));
  __asm { FMLA            D19, D5, V24.D[1] }
  double v61 = v38 * v172 + v171 * v175 * v169 - _D19;
  double v62 = v172 * v170.f64[0] + v171 * v173 * v169 - (vmuld_lane_f64(-(v171 * v175), v170, 1) + v171 * v174 * v38);
  double v63 = vmuld_lane_f64(v172, v170, 1) + v171 * v174 * v169 - vmlad_n_f64(-(v171 * v173 * v38), v171 * v175, v170.f64[0]);
  double v64 = (v59 * v59 + v63 * v63 + v61 * v61 + v62 * v62) * -0.5 + 1.5;
  double v65 = v62 * v64;
  double v66 = (*(double *)&v48 + v183) * a9;
  a6[4] = v61 * v64;
  a6[5] = v65;
  a6[6] = v63 * v64;
  *a6 = v54;
  a6[1] = v55;
  a6[2] = v56;
  a6[3] = v59 * v64;
  uint64_t v67 = *(void *)a2;
  double v68 = v168 * a9 + **(double **)a2;
  if ((double *)(*(void *)a2 - 8 * a2[3]) == &a7[-HIDWORD(a8)])
  {
    double v69 = *(double *)(v67 + 16);
    double v70 = v66 + *(double *)(v67 + 8);
    *a7 = v68;
    a7[1] = v70;
  }
  else
  {
    *a7 = v68;
    a7[1] = v66 + *(double *)(v67 + 8);
    double v69 = *(double *)(v67 + 16);
  }
  a7[2] = (*((double *)&v48 + 1) + v181) * a9 + v69;
  if (a10)
  {
    uint64_t v71 = 0;
    unint64_t v72 = 0x300000000;
    char v73 = &v244;
    do
    {
      uint64_t v74 = *v73++;
      *(void *)(a10 + 8 * v71) = v74;
      unint64_t v75 = HIDWORD(v72);
      BOOL v76 = (int)v72 < 2;
      if ((int)v72 < 2) {
        unint64_t v75 = 0;
      }
      uint64_t v77 = v71 + v75;
      uint64_t v78 = (v72 + 1);
      unint64_t v79 = v72 & 0xFFFFFFFF00000000;
      if (!v76) {
        uint64_t v78 = 0;
      }
      unint64_t v72 = v78 | v79;
      uint64_t v71 = v77 + 1;
    }
    while (v71 != 18);
    unint64_t v80 = 0x300000000;
    for (uint64_t i = 18; i != 36; uint64_t i = v84 + 1)
    {
      *(void *)(a10 + 8 * i) = 0;
      unint64_t v82 = HIDWORD(v80);
      BOOL v83 = (int)v80 < 2;
      if ((int)v80 < 2) {
        unint64_t v82 = 0;
      }
      unint64_t v84 = i + v82;
      uint64_t v85 = (v80 + 1);
      unint64_t v86 = v80 & 0xFFFFFFFF00000000;
      if (!v83) {
        uint64_t v85 = 0;
      }
      unint64_t v80 = v85 | v86;
    }
    unint64_t v87 = 0x300000000;
    v88 = (uint64_t *)v207;
    for (uint64_t j = 3; j != 21; uint64_t j = v93 + 1)
    {
      uint64_t v90 = *v88++;
      *(void *)(a10 + 8 * j) = v90;
      unint64_t v91 = HIDWORD(v87);
      BOOL v92 = (int)v87 < 2;
      if ((int)v87 < 2) {
        unint64_t v91 = 0;
      }
      unint64_t v93 = j + v91;
      uint64_t v94 = (v87 + 1);
      unint64_t v95 = v87 & 0xFFFFFFFF00000000;
      if (!v92) {
        uint64_t v94 = 0;
      }
      unint64_t v87 = v94 | v95;
    }
    unint64_t v96 = 0x300000000;
    v97 = (uint64_t *)v258;
    do
    {
      uint64_t v98 = *v97++;
      *(void *)(a10 + 8 * j) = v98;
      unint64_t v99 = HIDWORD(v96);
      BOOL v100 = (int)v96 < 2;
      if ((int)v96 < 2) {
        unint64_t v99 = 0;
      }
      unint64_t v101 = j + v99;
      uint64_t v102 = (v96 + 1);
      unint64_t v103 = v96 & 0xFFFFFFFF00000000;
      if (!v100) {
        uint64_t v102 = 0;
      }
      unint64_t v96 = v102 | v103;
      uint64_t j = v101 + 1;
    }
    while (j != 39);
  }
  if (a11)
  {
    uint64_t v104 = 0;
    unint64_t v105 = 0x300000000;
    do
    {
      *(void *)(a11 + 8 * v104) = 0;
      unint64_t v106 = HIDWORD(v105);
      BOOL v107 = (int)v105 < 2;
      if ((int)v105 < 2) {
        unint64_t v106 = 0;
      }
      uint64_t v108 = v104 + v106;
      uint64_t v109 = (v105 + 1);
      unint64_t v110 = v105 & 0xFFFFFFFF00000000;
      if (!v107) {
        uint64_t v109 = 0;
      }
      unint64_t v105 = v109 | v110;
      uint64_t v104 = v108 + 1;
    }
    while (v104 != 18);
    unint64_t v111 = 0x300000000;
    v112 = (uint64_t *)v211;
    for (uint64_t k = 3; k != 21; uint64_t k = v117 + 1)
    {
      uint64_t v114 = *v112++;
      *(void *)(a11 + 8 * k) = v114;
      unint64_t v115 = HIDWORD(v111);
      BOOL v116 = (int)v111 < 2;
      if ((int)v111 < 2) {
        unint64_t v115 = 0;
      }
      unint64_t v117 = k + v115;
      uint64_t v118 = (v111 + 1);
      unint64_t v119 = v111 & 0xFFFFFFFF00000000;
      if (!v116) {
        uint64_t v118 = 0;
      }
      unint64_t v111 = v118 | v119;
    }
  }
  if (a13)
  {
    uint64_t v120 = 0;
    unint64_t v121 = 0x300000000;
    do
    {
      *(void *)(a13 + 8 * v120) = 0;
      unint64_t v122 = HIDWORD(v121);
      BOOL v123 = (int)v121 < 2;
      if ((int)v121 < 2) {
        unint64_t v122 = 0;
      }
      uint64_t v124 = v120 + v122;
      uint64_t v125 = (v121 + 1);
      unint64_t v126 = v121 & 0xFFFFFFFF00000000;
      if (!v123) {
        uint64_t v125 = 0;
      }
      unint64_t v121 = v125 | v126;
      uint64_t v120 = v124 + 1;
    }
    while (v120 != 18);
    unint64_t v127 = 0x300000000;
    v128 = (uint64_t *)v209;
    for (uint64_t m = 3; m != 21; uint64_t m = v133 + 1)
    {
      uint64_t v130 = *v128++;
      *(void *)(a13 + 8 * m) = v130;
      unint64_t v131 = HIDWORD(v127);
      BOOL v132 = (int)v127 < 2;
      if ((int)v127 < 2) {
        unint64_t v131 = 0;
      }
      unint64_t v133 = m + v131;
      uint64_t v134 = (v127 + 1);
      unint64_t v135 = v127 & 0xFFFFFFFF00000000;
      if (!v132) {
        uint64_t v134 = 0;
      }
      unint64_t v127 = v134 | v135;
    }
  }
  if (a12)
  {
    uint64_t v136 = 0;
    unint64_t v137 = 0x300000000;
    v138 = (uint64_t *)v237;
    do
    {
      uint64_t v139 = *v138++;
      *(void *)(a12 + 8 * v136) = v139;
      unint64_t v140 = HIDWORD(v137);
      BOOL v141 = (int)v137 < 2;
      if ((int)v137 < 2) {
        unint64_t v140 = 0;
      }
      uint64_t v142 = v136 + v140;
      uint64_t v143 = (v137 + 1);
      unint64_t v144 = v137 & 0xFFFFFFFF00000000;
      if (!v141) {
        uint64_t v143 = 0;
      }
      unint64_t v137 = v143 | v144;
      uint64_t v136 = v142 + 1;
    }
    while (v136 != 18);
    unint64_t v145 = 0x300000000;
    for (uint64_t n = 3; n != 21; uint64_t n = v149 + 1)
    {
      *(void *)(a12 + 8 * n) = 0;
      unint64_t v147 = HIDWORD(v145);
      BOOL v148 = (int)v145 < 2;
      if ((int)v145 < 2) {
        unint64_t v147 = 0;
      }
      unint64_t v149 = n + v147;
      uint64_t v150 = (v145 + 1);
      unint64_t v151 = v145 & 0xFFFFFFFF00000000;
      if (!v148) {
        uint64_t v150 = 0;
      }
      unint64_t v145 = v150 | v151;
    }
  }
  if (a14)
  {
    uint64_t v152 = 0;
    unint64_t v153 = 0;
    v154 = (uint64_t *)v189;
    do
    {
      uint64_t v155 = *v154++;
      *(void *)(a14 + 8 * v152) = v155;
      unint64_t v156 = HIDWORD(v153);
      BOOL v157 = (int)v153 < 2;
      if ((int)v153 < 2) {
        unint64_t v156 = 0;
      }
      uint64_t v158 = v152 + v156;
      uint64_t v159 = (v153 + 1);
      unint64_t v160 = v153 & 0xFFFFFFFF00000000;
      if (!v157) {
        uint64_t v159 = 0;
      }
      unint64_t v153 = v159 | v160;
      uint64_t v152 = v158 + 1;
    }
    while (v152 != 9);
    unint64_t v161 = 0;
    for (iuint64_t i = 9; ii != 18; iuint64_t i = v165 + 1)
    {
      *(void *)(a14 + 8 * ii) = 0;
      unint64_t v163 = HIDWORD(v161);
      BOOL v164 = (int)v161 < 2;
      if ((int)v161 < 2) {
        unint64_t v163 = 0;
      }
      unint64_t v165 = ii + v163;
      uint64_t v166 = (v161 + 1);
      unint64_t v167 = v161 & 0xFFFFFFFF00000000;
      if (!v164) {
        uint64_t v166 = 0;
      }
      unint64_t v161 = v166 | v167;
    }
  }
  if (a15)
  {
    *(_OWORD *)(a15 + 24) = 0u;
    *(_OWORD *)(a15 + 40) = 0u;
    *(_OWORD *)(a15 + 8) = 0u;
    *(void *)a15 = 0x3FF0000000000000;
    *(void *)(a15 + 32) = 0x3FF0000000000000;
    *(void *)(a15 + 56) = 0;
    *(void *)(a15 + 64) = 0x3FF0000000000000;
  }
  if (a17)
  {
    v185 = &v191;
    v186 = &v198;
    v187 = &v185;
    v188 = &v227;
    sub_21543CE30(a17, (uint64_t)&v187);
  }
  if (a16)
  {
    *(void *)(a16 + 64) = 0;
    *(_OWORD *)(a16 + 32) = 0u;
    *(_OWORD *)(a16 + 48) = 0u;
    *(_OWORD *)a16 = 0u;
    *(_OWORD *)(a16 + 16) = 0u;
  }
  return 1;
}

__n128 sub_21543CE30(uint64_t a1, uint64_t a2)
{
  size_t v3 = *(double **)(a2 + 8);
  if (v3 == (double *)a1)
  {
    double v16 = 0.0;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    __n128 v13 = 0u;
    sub_21543CE30(&v12);
    long long v11 = v15;
    *(_OWORD *)(a1 + 32) = v14;
    *(_OWORD *)(a1 + 48) = v11;
    *(double *)(a1 + 64) = v16;
    __n128 result = v13;
    *(_OWORD *)a1 = v12;
    *(__n128 *)(a1 + 16) = result;
  }
  else
  {
    int v4 = *(double ***)a2;
    long long v12 = 0u;
    __n128 v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    double v16 = 0.0;
    sub_2153CB228((uint64_t)&v12, v4);
    long long v5 = v12;
    __n128 v6 = v13;
    long long v7 = v15;
    *(double *)a1 = *(double *)&v12 * *v3 + 0.0 + v13.n128_f64[1] * v3[1] + *(double *)&v15 * v3[2];
    long long v8 = v14;
    *(double *)(a1 + 8) = *((double *)&v5 + 1) * *v3 + 0.0 + *(double *)&v14 * v3[1] + *((double *)&v7 + 1) * v3[2];
    double v9 = v16;
    *(double *)(a1 + 16) = v6.n128_f64[0] * *v3 + 0.0 + *((double *)&v8 + 1) * v3[1] + v16 * v3[2];
    *(double *)(a1 + 24) = *(double *)&v5 * v3[3] + 0.0 + v6.n128_f64[1] * v3[4] + *(double *)&v7 * v3[5];
    *(double *)(a1 + 32) = *((double *)&v5 + 1) * v3[3] + 0.0 + *(double *)&v8 * v3[4] + *((double *)&v7 + 1) * v3[5];
    *(double *)(a1 + 40) = v6.n128_f64[0] * v3[3] + 0.0 + *((double *)&v8 + 1) * v3[4] + v9 * v3[5];
    *(double *)(a1 + 48) = *(double *)&v5 * v3[6] + 0.0 + v6.n128_f64[1] * v3[7] + *(double *)&v7 * v3[8];
    *(double *)(a1 + 56) = *((double *)&v5 + 1) * v3[6] + 0.0 + *(double *)&v8 * v3[7] + *((double *)&v7 + 1) * v3[8];
    result.n128_f64[0] = v6.n128_f64[0] * v3[6] + 0.0 + *((double *)&v8 + 1) * v3[7] + v9 * v3[8];
    *(void *)(a1 + 64) = result.n128_u64[0];
  }
  return result;
}

uint64_t cva::RigidBodyKinematics::integrate(uint64_t a1, unsigned int *a2, double **a3, uint64_t a4, uint64_t a5, double *a6, double *a7, unint64_t a8, double a9)
{
  return cva::RigidBodyKinematics::integrateAndJacobians(a1, a2, a3, a4, a5, a6, a7, a8, a9, 0, 0, 0, 0, 0, 0, 0, 0);
}

const char *cva::imfinfo(const char *this, char *a2, unsigned int *a3, unsigned int *a4, unsigned int *a5)
{
  if (this)
  {
    *(_DWORD *)a2 = 0;
    *a3 = 0;
    CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFStringRef v9 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], this, 0x8000100u);
    CFURLRef v10 = CFURLCreateWithFileSystemPath(v8, v9, kCFURLPOSIXPathStyle, 0);
    CFRelease(v9);
    long long v11 = CGImageSourceCreateWithURL(v10, 0);
    CFRelease(v10);
    if (v11)
    {
      ImageAtIndex = CGImageSourceCreateImageAtIndex(v11, 0, 0);
      CFRelease(v11);
      if (ImageAtIndex)
      {
        *(_DWORD *)a2 = CGImageGetWidth(ImageAtIndex);
        *a3 = CGImageGetHeight(ImageAtIndex);
        ColorSpace = CGImageGetColorSpace(ImageAtIndex);
        int NumberOfComponents = CGColorSpaceGetNumberOfComponents(ColorSpace);
        int BitsPerComponent = CGImageGetBitsPerComponent(ImageAtIndex);
        CGBitmapInfo BitmapInfo = CGImageGetBitmapInfo(ImageAtIndex);
        CGImageAlphaInfo AlphaInfo = CGImageGetAlphaInfo(ImageAtIndex);
        CGImageRelease(ImageAtIndex);
        if (AlphaInfo > kCGImageAlphaNoneSkipFirst || ((1 << AlphaInfo) & 0x61) == 0)
        {
          if (NumberOfComponents == 3 && AlphaInfo == kCGImageAlphaFirst)
          {
            if (BitsPerComponent == 16) {
              int v19 = 1647719521;
            }
            else {
              int v19 = 0;
            }
            if (BitsPerComponent == 8) {
              int v19 = 32;
            }
            goto LABEL_37;
          }
        }
        else
        {
          if (NumberOfComponents == 3)
          {
            if (BitsPerComponent == 16) {
              int v19 = 1647589490;
            }
            else {
              int v19 = 0;
            }
            if (BitsPerComponent == 8) {
              int v19 = 24;
            }
            goto LABEL_37;
          }
          if (NumberOfComponents == 1)
          {
            int v19 = 1278226488;
            switch(BitsPerComponent)
            {
              case 8:
LABEL_37:
                *a4 = v19;
                return (const char *)(v19 != 0);
              case 32:
                int v19 = ((int)(BitmapInfo << 23) >> 31) & 0x4C303066;
                goto LABEL_37;
              case 16:
                int v19 = 1278226536;
                if ((BitmapInfo & 0x100) == 0) {
                  int v19 = 1647392359;
                }
                goto LABEL_37;
            }
          }
        }
        int v19 = 0;
        goto LABEL_37;
      }
      uint64_t v20 = "CGImageSourceCreateImageAtIndex() failed!";
    }
    else
    {
      uint64_t v20 = "CGImageSourceCreateWithURL() failed!";
    }
    puts(v20);
    return 0;
  }
  return this;
}

FILE *cva::ppml008read@<X0>(cva *this@<X0>, void *a2@<X8>)
{
  __n128 result = fopen((const char *)this, "rb");
  if (result)
  {
    long long v5 = result;
    uint64_t v8 = 0;
    int v7 = 0;
    if (sub_21543D358(result, (_DWORD *)&v8 + 1, &v8, &v7)) {
      BOOL v6 = v7 == 1278226488;
    }
    else {
      BOOL v6 = 0;
    }
    if (v6) {
      operator new();
    }
    __n128 result = (FILE *)fclose(v5);
  }
  *a2 = 0;
  return result;
}

uint64_t sub_21543D358(FILE *a1, _DWORD *a2, _DWORD *a3, int *a4)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  *a2 = 0;
  *a3 = 0;
  *a4 = 0;
  v15[0] = 35;
  while (!feof(a1) && v15[0] == 35)
  {
    uint64_t result = (uint64_t)fgets(v15, 512, a1);
    if (!result) {
      return result;
    }
  }
  if (*(unsigned __int16 *)v15 == 13904)
  {
    int v9 = 24;
  }
  else
  {
    uint64_t result = 0;
    if (*(unsigned __int16 *)v15 != 13648) {
      return result;
    }
    int v9 = 0;
  }
  *a4 = v9;
  v15[0] = 35;
  while (!feof(a1) && v15[0] == 35)
  {
    uint64_t result = (uint64_t)fgets(v15, 512, a1);
    if (!result) {
      return result;
    }
  }
  uint64_t v14 = 0;
  int v10 = sscanf(v15, "%d %d", (char *)&v14 + 4, &v14);
  uint64_t result = 0;
  if (v10 == 2)
  {
    v15[0] = 35;
    while (!feof(a1) && v15[0] == 35)
    {
      uint64_t result = (uint64_t)fgets(v15, 512, a1);
      if (!result) {
        return result;
      }
    }
    int v13 = 0;
    int v11 = sscanf(v15, "%d", &v13);
    uint64_t result = 0;
    if (v11 == 1)
    {
      if (!*a4)
      {
        if (v13 < 257)
        {
          int v12 = 1278226488;
LABEL_27:
          *a4 = v12;
          goto LABEL_28;
        }
        if (v13 <= 0x10000)
        {
          int v12 = 1647392359;
          goto LABEL_27;
        }
      }
LABEL_28:
      *a2 = HIDWORD(v14);
      *a3 = v14;
      return 1;
    }
  }
  return result;
}

FILE *cva::ppmb16gread@<X0>(cva *this@<X0>, void *a2@<X8>)
{
  uint64_t result = fopen((const char *)this, "rb");
  if (result)
  {
    long long v5 = result;
    uint64_t v8 = 0;
    int v7 = 0;
    if (sub_21543D358(result, (_DWORD *)&v8 + 1, &v8, &v7)) {
      BOOL v6 = v7 == 1647392359;
    }
    else {
      BOOL v6 = 0;
    }
    if (v6) {
      operator new();
    }
    uint64_t result = (FILE *)fclose(v5);
  }
  *a2 = 0;
  return result;
}

FILE *cva::ppmrgb8read@<X0>(cva *this@<X0>, void *a2@<X8>)
{
  uint64_t result = fopen((const char *)this, "rb");
  if (result)
  {
    long long v5 = result;
    uint64_t v8 = 0;
    int v7 = 0;
    if (sub_21543D358(result, (_DWORD *)&v8 + 1, &v8, &v7)) {
      BOOL v6 = v7 == 24;
    }
    else {
      BOOL v6 = 0;
    }
    if (v6) {
      operator new();
    }
    uint64_t result = (FILE *)fclose(v5);
  }
  *a2 = 0;
  return result;
}

uint64_t cva::imread<unsigned char>@<X0>(cva *a1@<X0>, size_t *a2@<X8>)
{
  strcpy((char *)&size, ".ppm");
  strcpy((char *)v10, ".pgm");
  if (sub_21543D9C8((char *)a1, (char *)&size) || sub_21543D9C8((char *)a1, (char *)v10))
  {
    uint64_t result = (uint64_t)cva::ppml008read(a1, &size);
    *a2 = size;
  }
  else
  {
    int v9 = 0;
    v10[0] = 0;
    uint64_t result = sub_21543DAA8((char *)a1, v10, &v9, &v8, &v7, &v6, (CGImageAlphaInfo *)&v5);
    if (result) {
      operator new();
    }
    *a2 = 0;
  }
  return result;
}

uint64_t sub_21543D9C8(char *__s, char *a2)
{
  uint64_t result = 0;
  if (__s && a2)
  {
    if (!*__s || !*a2) {
      return 0;
    }
    uint64_t result = (uint64_t)strchr(__s, 46);
    if (result)
    {
      uint64_t result = (uint64_t)strchr(a2, 46);
      if (result)
      {
        uint64_t v5 = -1;
        uint64_t v6 = -1;
        while (1)
        {
          size_t v7 = strlen(__s);
          if (v5 + 1 >= v7) {
            break;
          }
          __darwin_ct_rune_t v8 = __tolower(__s[v7 + v6]);
          size_t v9 = strlen(a2);
          if (v8 != __tolower(a2[v9 + v6])) {
            break;
          }
          size_t v10 = strlen(a2) - 1;
          --v6;
          ++v5;
          uint64_t result = 1;
          if (v5 == v10) {
            return result;
          }
        }
        return 0;
      }
    }
  }
  return result;
}

uint64_t sub_21543DAA8(char *cStr, _DWORD *a2, _DWORD *a3, _DWORD *a4, _DWORD *a5, CGBitmapInfo *a6, CGImageAlphaInfo *a7)
{
  *a2 = 0;
  *a3 = 0;
  CFAllocatorRef v13 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFStringRef v14 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], cStr, 0x8000100u);
  CFURLRef v15 = CFURLCreateWithFileSystemPath(v13, v14, kCFURLPOSIXPathStyle, 0);
  CFRelease(v14);
  uint64_t v16 = CGImageSourceCreateWithURL(v15, 0);
  CFRelease(v15);
  if (!v16) {
    return 0;
  }
  ImageAtIndex = CGImageSourceCreateImageAtIndex(v16, 0, 0);
  CFRelease(v16);
  if (!ImageAtIndex) {
    return 0;
  }
  *a2 = CGImageGetWidth(ImageAtIndex);
  *a3 = CGImageGetHeight(ImageAtIndex);
  ColorSpace = CGImageGetColorSpace(ImageAtIndex);
  *a4 = CGColorSpaceGetNumberOfComponents(ColorSpace);
  *a5 = CGImageGetBitsPerComponent(ImageAtIndex);
  *a6 = CGImageGetBitmapInfo(ImageAtIndex);
  *a7 = CGImageGetAlphaInfo(ImageAtIndex);
  CGImageRelease(ImageAtIndex);
  return 1;
}

BOOL sub_21543DBDC(char *cStr, char *a2, unsigned int a3, int a4, unsigned int a5)
{
  LODWORD(v6) = a4;
  CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFStringRef v10 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], cStr, 0x8000100u);
  CFURLRef v11 = CFURLCreateWithFileSystemPath(v9, v10, kCFURLPOSIXPathStyle, 0);
  CFRelease(v10);
  int v12 = CGImageSourceCreateWithURL(v11, 0);
  CFRelease(v11);
  if (!v12) {
    return 0;
  }
  ImageAtIndex = CGImageSourceCreateImageAtIndex(v12, 0, 0);
  CFRelease(v12);
  if (!ImageAtIndex) {
    return 0;
  }
  DataProvider = CGImageGetDataProvider(ImageAtIndex);
  CFDataRef v15 = CGDataProviderCopyData(DataProvider);
  if (!v15)
  {
LABEL_6:
    CGImageRelease(ImageAtIndex);
    return 0;
  }
  CFDataRef v16 = v15;
  BytePtr = (UInt8 *)CFDataGetBytePtr(v15);
  vImagePixelCount v18 = a3;
  ColorSpace = CGImageGetColorSpace(ImageAtIndex);
  size_t NumberOfComponents = CGColorSpaceGetNumberOfComponents(ColorSpace);
  if (((CGImageGetBitsPerComponent(ImageAtIndex) * NumberOfComponents) >> 3) * v18 > a5)
  {
    CFRelease(v16);
    goto LABEL_6;
  }
  int BitsPerPixel = CGImageGetBitsPerPixel(ImageAtIndex);
  unsigned int BytesPerRow = CGImageGetBytesPerRow(ImageAtIndex);
  CGImageAlphaInfo AlphaInfo = CGImageGetAlphaInfo(ImageAtIndex);
  if (BitsPerPixel != 32 || AlphaInfo - 5 >= 2)
  {
    if (v6)
    {
      int v26 = 0;
      int v27 = 0;
      if (BytesPerRow >= a5) {
        size_t v28 = a5;
      }
      else {
        size_t v28 = BytesPerRow;
      }
      uint64_t v6 = v6;
      do
      {
        memcpy(&a2[v26], &BytePtr[v27], v28);
        v27 += BytesPerRow;
        v26 += a5;
        --v6;
      }
      while (v6);
    }
    CFRelease(v16);
    CGImageRelease(ImageAtIndex);
    return 1;
  }
  else
  {
    v32.std::string::pointer data = BytePtr;
    v32.height = v6;
    v32.width = v18;
    v32.rowBytes = BytesPerRow;
    v31.std::string::pointer data = a2;
    v31.height = v6;
    v31.width = v18;
    v31.rowBytes = a5;
    if (AlphaInfo == kCGImageAlphaNoneSkipLast) {
      vImage_Error v29 = vImageConvert_RGBA8888toRGB888(&v32, &v31, 0);
    }
    else {
      vImage_Error v29 = vImageConvert_ARGB8888toRGB888(&v32, &v31, 0);
    }
    vImage_Error v30 = v29;
    CFRelease(v16);
    CGImageRelease(ImageAtIndex);
    return v30 == 0;
  }
}

uint64_t cva::imread<unsigned short>@<X0>(cva *a1@<X0>, size_t *a2@<X8>)
{
  strcpy((char *)&size, ".ppm");
  strcpy((char *)v10, ".pgm");
  if (sub_21543D9C8((char *)a1, (char *)&size) || sub_21543D9C8((char *)a1, (char *)v10))
  {
    uint64_t result = (uint64_t)cva::ppmb16gread(a1, &size);
    *a2 = size;
  }
  else
  {
    int v9 = 0;
    v10[0] = 0;
    uint64_t result = sub_21543DAA8((char *)a1, v10, &v9, &v8, &v7, &v6, (CGImageAlphaInfo *)&v5);
    if (result) {
      operator new();
    }
    *a2 = 0;
  }
  return result;
}

uint64_t cva::imread<float>@<X0>(char *a1@<X0>, void *a2@<X8>)
{
  strcpy((char *)&size, ".tiff");
  uint64_t result = sub_21543D9C8(a1, (char *)&size);
  if (result)
  {
    uint64_t v9 = 0;
    uint64_t result = sub_21543DAA8(a1, (_DWORD *)&v9 + 1, &v9, &v8, &v7, &v6, (CGImageAlphaInfo *)&v5);
    if (result) {
      operator new();
    }
    *a2 = 0;
  }
  else
  {
    *a2 = 0;
  }
  return result;
}

uint64_t cva::imread<cva::Matrix<unsigned char,3u,1u,false>>@<X0>(cva *a1@<X0>, size_t *a2@<X8>)
{
  strcpy((char *)&size, ".ppm");
  strcpy((char *)v10, ".pgm");
  if (sub_21543D9C8((char *)a1, (char *)&size) || sub_21543D9C8((char *)a1, (char *)v10))
  {
    uint64_t result = (uint64_t)cva::ppmrgb8read(a1, &size);
    *a2 = size;
  }
  else
  {
    int v9 = 0;
    v10[0] = 0;
    uint64_t result = sub_21543DAA8((char *)a1, v10, &v9, &v8, &v7, &v6, (CGImageAlphaInfo *)&v5);
    if (result) {
      operator new();
    }
    *a2 = 0;
  }
  return result;
}

uint64_t cva::imread<cva::Matrix<unsigned char,4u,1u,false>>@<X0>(char *a1@<X0>, void *a2@<X8>)
{
  strcpy((char *)&size, ".ppm");
  strcpy((char *)v10, ".pgm");
  uint64_t result = sub_21543D9C8(a1, (char *)&size);
  if (result
    || (uint64_t result = sub_21543D9C8(a1, (char *)v10), (result & 1) != 0)
    || (strcpy((char *)&size, ".tiff"), uint64_t result = sub_21543D9C8(a1, (char *)&size), (result & 1) != 0))
  {
    *a2 = 0;
  }
  else
  {
    int v9 = 0;
    v10[0] = 0;
    uint64_t result = sub_21543DAA8(a1, v10, &v9, &v8, &v7, &v6, (CGImageAlphaInfo *)&v5);
    if (result) {
      operator new();
    }
    *a2 = 0;
  }
  return result;
}

uint64_t cva::imread<cva::Matrix<unsigned short,4u,1u,false>>@<X0>(char *a1@<X0>, void *a2@<X8>)
{
  strcpy((char *)&size, ".ppm");
  strcpy((char *)v10, ".pgm");
  uint64_t result = sub_21543D9C8(a1, (char *)&size);
  if (result
    || (uint64_t result = sub_21543D9C8(a1, (char *)v10), (result & 1) != 0)
    || (strcpy((char *)&size, ".tiff"), uint64_t result = sub_21543D9C8(a1, (char *)&size), (result & 1) != 0))
  {
    *a2 = 0;
  }
  else
  {
    int v9 = 0;
    v10[0] = 0;
    uint64_t result = sub_21543DAA8(a1, v10, &v9, &v8, &v7, &v6, (CGImageAlphaInfo *)&v5);
    if (result) {
      operator new();
    }
    *a2 = 0;
  }
  return result;
}

FILE *cva::imread(cva *this, const char *a2)
{
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  CVPixelBufferRef pixelBuffer = 0;
  uint64_t v22 = 0;
  strcpy(v25, ".ppm");
  strcpy((char *)&pixelBufferOut, ".pgm");
  if (sub_21543D9C8((char *)this, v25)
    || sub_21543D9C8((char *)this, (char *)&pixelBufferOut))
  {
    uint64_t result = fopen((const char *)this, "rb");
    if (!result) {
      return result;
    }
    int v4 = result;
    uint64_t v28 = 0;
    OSType v27 = 0;
    CVPixelBufferRef pixelBufferOut = 0;
    if (sub_21543D358(result, (_DWORD *)&v28 + 1, &v28, (int *)&v27))
    {
      OSType v5 = v27;
      if (v27 == 24 || v27 == 1647392359 || v27 == 1278226488)
      {
        size_t v6 = v28;
        size_t v7 = HIDWORD(v28);
        AttributeDictionary = cva::createAttributeDictionary((cva *)HIDWORD(v28), v28, v27, 16, 16, 0, 1, 0, v20);
        if (AttributeDictionary)
        {
          int v9 = AttributeDictionary;
          CVReturn v10 = CVPixelBufferCreate(0, v7, v6, v5, AttributeDictionary, &pixelBufferOut);
          CFRelease(v9);
          if (!v10)
          {
            CVPixelBufferLockBaseAddress(pixelBufferOut, 0);
            cva::imageViewFromPixelBuffer<unsigned char>();
          }
        }
        CVPixelBufferRef pixelBufferOut = 0;
      }
    }
    fclose(v4);
    return 0;
  }
  if (!sub_21543DAA8((char *)this, (_DWORD *)&v24 + 1, &v24, (_DWORD *)&v23 + 1, &v23, (CGBitmapInfo *)&v22 + 1, (CGImageAlphaInfo *)&v22))return 0; {
  if (v22 <= 6 && ((1 << v22) & 0x61) != 0)
  }
  {
    if (HIDWORD(v23) == 3)
    {
      if (v23 == 16) {
        int v15 = 1647589490;
      }
      else {
        int v15 = 0;
      }
      if (v23 == 8) {
        int v11 = 24;
      }
      else {
        int v11 = v15;
      }
    }
    else if (HIDWORD(v23) == 1)
    {
      int v11 = 1278226488;
      if (v23 != 8)
      {
        if ((v22 & 0x10000000000) != 0) {
          int v12 = 1278226536;
        }
        else {
          int v12 = 1647392359;
        }
        if (v23 != 16) {
          int v12 = 0;
        }
        if (v23 == 32) {
          int v11 = ((int)(HIDWORD(v22) << 23) >> 31) & 0x4C303066;
        }
        else {
          int v11 = v12;
        }
      }
    }
    else
    {
      int v11 = 0;
    }
  }
  else
  {
    if (v23 == 16) {
      int v13 = 1647719521;
    }
    else {
      int v13 = 0;
    }
    if (v23 == 8) {
      int v14 = 32;
    }
    else {
      int v14 = v13;
    }
    if (v22 != 4) {
      int v14 = 0;
    }
    if (HIDWORD(v23) == 3) {
      int v11 = v14;
    }
    else {
      int v11 = 0;
    }
  }
  size_t v17 = v24;
  size_t v16 = HIDWORD(v24);
  uint64_t result = (FILE *)cva::createAttributeDictionary((cva *)HIDWORD(v24), v24, v11, 16, 16, 0, 1, 0, v20);
  if (result)
  {
    vImagePixelCount v18 = result;
    CVReturn v19 = CVPixelBufferCreate(0, v16, v17, v11, (CFDictionaryRef)result, &pixelBuffer);
    CFRelease(v18);
    uint64_t result = 0;
    if (!v19)
    {
      CVPixelBufferLockBaseAddress(pixelBuffer, 0);
      cva::imageViewFromPixelBuffer<unsigned char>();
    }
  }
  return result;
}

CGDataProvider *cva::imwrite<unsigned char>(uint64_t a1, char *__s)
{
  strcpy(v13, ".ppm");
  strcpy(v12, ".pgm");
  if (!sub_21543D9C8(__s, v13) && !sub_21543D9C8(__s, v12)) {
    return sub_21543EA64(*(void **)(a1 + 24), *(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 12), *(_DWORD *)(a1 + 20), __s, 0, 0, 0, 8u);
  }
  int v4 = fopen(__s, "wb");
  if (!v4) {
    return 0;
  }
  OSType v5 = v4;
  BOOL v6 = 1;
  fwrite("P5\n", 3uLL, 1uLL, v4);
  fprintf(v5, "%d %d\n", *(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 12));
  fwrite("255\n", 4uLL, 1uLL, v5);
  if (*(_DWORD *)(a1 + 12))
  {
    int v7 = 0;
    size_t v8 = (*(_DWORD *)(a1 + 16) * *(_DWORD *)(a1 + 8));
    int v9 = *(char **)(a1 + 24);
    while (1)
    {
      size_t v10 = fwrite(v9, 1uLL, v8, v5);
      BOOL v6 = v10 == v8;
      if (v10 != v8) {
        break;
      }
      v9 += *(unsigned int *)(a1 + 20);
      if (++v7 >= *(_DWORD *)(a1 + 12))
      {
        BOOL v6 = 1;
        break;
      }
    }
  }
  fclose(v5);
  return (CGDataProvider *)v6;
}

CGDataProvider *sub_21543EA64(void *data, unsigned int a2, unsigned int a3, unsigned int a4, char *a5, int a6, CGBitmapInfo a7, int a8, unsigned int a9)
{
  int info = a8;
  int v15 = CGDataProviderCreateWithData(&info, data, a4 * a3, 0);
  if (v15)
  {
    if (a6)
    {
      DeviceRGB = CGColorSpaceCreateDeviceRGB();
      if (DeviceRGB) {
        goto LABEL_4;
      }
    }
    else
    {
      DeviceRGB = CGColorSpaceCreateDeviceGray();
      if (DeviceRGB)
      {
LABEL_4:
        int NumberOfComponents = CGColorSpaceGetNumberOfComponents(DeviceRGB);
        if (info == 3) {
          int v18 = NumberOfComponents + 1;
        }
        else {
          int v18 = NumberOfComponents;
        }
        CVReturn v19 = CGImageCreate(a2, a3, a9, v18 * a9, a4, DeviceRGB, a7, v15, 0, 0, kCGRenderingIntentDefault);
        CGColorSpaceRelease(DeviceRGB);
        CGDataProviderRelease(v15);
        if (v19)
        {
          CFAllocatorRef v20 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
          CFStringRef v21 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], a5, 0);
          CFURLRef v22 = CFURLCreateWithFileSystemPath(v20, v21, kCFURLPOSIXPathStyle, 0);
          uint64_t v23 = strrchr(a5, 46);
          CFStringRef v24 = CFStringCreateWithCString(v20, v23 + 1, 0x8000100u);
          CFStringRef PreferredIdentifierForTag = UTTypeCreatePreferredIdentifierForTag((CFStringRef)*MEMORY[0x263F01910], v24, 0);
          int v26 = CGImageDestinationCreateWithURL(v22, PreferredIdentifierForTag, 1uLL, 0);
          CFRelease(v21);
          CFRelease(v22);
          CFRelease(v24);
          CFRelease(PreferredIdentifierForTag);
          if (v26)
          {
            CGImageDestinationAddImage(v26, v19, 0);
            int v15 = (CGDataProvider *)CGImageDestinationFinalize(v26);
            CFRelease(v26);
            CGImageRelease(v19);
            return v15;
          }
          CGImageRelease(v19);
        }
        return 0;
      }
    }
    CGDataProviderRelease(v15);
    return 0;
  }
  return v15;
}

CGDataProvider *cva::imwrite<unsigned short>(uint64_t a1, char *__s)
{
  strcpy(v13, ".ppm");
  strcpy(v12, ".pgm");
  if (!sub_21543D9C8(__s, v13) && !sub_21543D9C8(__s, v12)) {
    return sub_21543EA64(*(void **)(a1 + 24), *(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 12), *(_DWORD *)(a1 + 20), __s, 0, 0x1000u, 0, 0x10u);
  }
  int v4 = fopen(__s, "wb");
  if (!v4) {
    return 0;
  }
  OSType v5 = v4;
  BOOL v6 = 1;
  fwrite("P5\n", 3uLL, 1uLL, v4);
  fprintf(v5, "%d %d\n", *(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 12));
  fwrite("65535\n", 6uLL, 1uLL, v5);
  if (*(_DWORD *)(a1 + 12))
  {
    int v7 = 0;
    size_t v8 = (*(_DWORD *)(a1 + 16) * *(_DWORD *)(a1 + 8));
    int v9 = *(char **)(a1 + 24);
    while (1)
    {
      size_t v10 = fwrite(v9, 1uLL, v8, v5);
      BOOL v6 = v10 == v8;
      if (v10 != v8) {
        break;
      }
      v9 += *(unsigned int *)(a1 + 20);
      if (++v7 >= *(_DWORD *)(a1 + 12))
      {
        BOOL v6 = 1;
        break;
      }
    }
  }
  fclose(v5);
  return (CGDataProvider *)v6;
}

CGDataProvider *cva::imwrite<float>(uint64_t a1, char *__s)
{
  strcpy(v5, ".tiff");
  uint64_t result = (CGDataProvider *)sub_21543D9C8(__s, v5);
  if (result) {
    return sub_21543EA64(*(void **)(a1 + 24), *(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 12), *(_DWORD *)(a1 + 20), __s, 0, 0x2F00u, 0, 0x20u);
  }
  return result;
}

CGDataProvider *cva::imwrite<cva::Matrix<unsigned char,3u,1u,false>>(uint64_t a1, char *__s)
{
  strcpy(v13, ".ppm");
  strcpy(v12, ".pgm");
  if (!sub_21543D9C8(__s, v13) && !sub_21543D9C8(__s, v12)) {
    return sub_21543EA64(*(void **)(a1 + 24), *(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 12), *(_DWORD *)(a1 + 20), __s, 1, 0, 0, 8u);
  }
  int v4 = fopen(__s, "wb");
  if (!v4) {
    return 0;
  }
  OSType v5 = v4;
  BOOL v6 = 1;
  fwrite("P6\n", 3uLL, 1uLL, v4);
  fprintf(v5, "%d %d\n", *(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 12));
  fwrite("255\n", 4uLL, 1uLL, v5);
  if (*(_DWORD *)(a1 + 12))
  {
    int v7 = 0;
    size_t v8 = (*(_DWORD *)(a1 + 16) * *(_DWORD *)(a1 + 8));
    int v9 = *(char **)(a1 + 24);
    while (1)
    {
      size_t v10 = fwrite(v9, 1uLL, v8, v5);
      BOOL v6 = v10 == v8;
      if (v10 != v8) {
        break;
      }
      v9 += *(unsigned int *)(a1 + 20);
      if (++v7 >= *(_DWORD *)(a1 + 12))
      {
        BOOL v6 = 1;
        break;
      }
    }
  }
  fclose(v5);
  return (CGDataProvider *)v6;
}

CGDataProvider *cva::imwrite<cva::Matrix<unsigned char,4u,1u,false>>(uint64_t a1, char *__s)
{
  strcpy(v6, ".ppm");
  strcpy(v5, ".pgm");
  if (sub_21543D9C8(__s, v6)) {
    return 0;
  }
  if (sub_21543D9C8(__s, v5)) {
    return 0;
  }
  strcpy(v6, ".tiff");
  if (sub_21543D9C8(__s, v6)) {
    return 0;
  }
  else {
    return sub_21543EA64(*(void **)(a1 + 24), *(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 12), *(_DWORD *)(a1 + 20), __s, 1, 1u, 3, 8u);
  }
}

CGDataProvider *cva::imwrite<cva::Matrix<unsigned short,4u,1u,false>>(uint64_t a1, char *__s)
{
  strcpy(v6, ".ppm");
  strcpy(v5, ".pgm");
  if (sub_21543D9C8(__s, v6)) {
    return 0;
  }
  if (sub_21543D9C8(__s, v5)) {
    return 0;
  }
  strcpy(v6, ".tiff");
  if (sub_21543D9C8(__s, v6)) {
    return 0;
  }
  else {
    return sub_21543EA64(*(void **)(a1 + 24), *(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 12), *(_DWORD *)(a1 + 20), __s, 1, 0x1003u, 3, 0x10u);
  }
}

void *cva::Path::Private::Private(void *this)
{
  *this = 0;
  this[1] = 0;
  this[2] = 0;
  return this;
}

{
  *this = 0;
  this[1] = 0;
  this[2] = 0;
  return this;
}

void *cva::Path::Private::Private(void *__dst, long long *a2)
{
  if (*((char *)a2 + 23) < 0)
  {
    sub_2153C0AE4(__dst, *(void **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v3 = *a2;
    __dst[2] = *((void *)a2 + 2);
    *(_OWORD *)std::string __dst = v3;
  }
  return __dst;
}

{
  long long v3;

  if (*((char *)a2 + 23) < 0)
  {
    sub_2153C0AE4(__dst, *(void **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v3 = *a2;
    __dst[2] = *((void *)a2 + 2);
    *(_OWORD *)std::string __dst = v3;
  }
  return __dst;
}

void cva::Path::Path(cva::Path *this)
{
}

{
  operator new();
}

void cva::Path::Path(cva::Path *this, const char *a2)
{
}

{
  sub_21543F31C();
}

void sub_21543F31C()
{
}

std::string **cva::Path::operator=(std::string **a1, const std::string **a2)
{
  if (a2 != (const std::string **)a1) {
    std::string::operator=(*a1, *a2);
  }
  return a1;
}

uint64_t cva::Path::forwardString(cva::Path *this)
{
  return *(void *)this;
}

void cva::Path::directory(const std::string **this)
{
  uint64_t v1 = *this;
  int v2 = HIBYTE((*this)->__r_.__value_.__r.__words[2]);
  if (SHIBYTE((*this)->__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::size_type size = v1->__r_.__value_.__l.__size_;
    if (size)
    {
      long long v3 = (const std::string *)v1->__r_.__value_.__r.__words[0];
      if (*(unsigned char *)(v1->__r_.__value_.__r.__words[0] + size - 1) != 47)
      {
        if (size != 1)
        {
          if (size != 2) {
            goto LABEL_13;
          }
LABEL_12:
          if (LOWORD(v3->__r_.__value_.__l.__data_) != 11822) {
            goto LABEL_13;
          }
          goto LABEL_34;
        }
        if (v3->__r_.__value_.__s.__data_[0] != 46) {
          goto LABEL_13;
        }
LABEL_34:
        int v12 = (char)v2;
        if ((v2 & 0x80u) == 0) {
          size_t v13 = HIBYTE((*this)->__r_.__value_.__r.__words[2]);
        }
        else {
          size_t v13 = v1->__r_.__value_.__l.__size_;
        }
        unint64_t v14 = v13 + 1;
        if (v13 + 1 >= 0x7FFFFFFFFFFFFFF8) {
          abort();
        }
        if (v14 >= 0x17)
        {
          uint64_t v16 = (v14 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v14 | 7) != 0x17) {
            uint64_t v16 = v14 | 7;
          }
          uint64_t v17 = v16 + 1;
          int v15 = (char *)operator new(v16 + 1);
          __sz[1] = v13 + 1;
          unint64_t v24 = v17 | 0x8000000000000000;
          __sz[0] = (size_t)v15;
        }
        else
        {
          __sz[1] = 0;
          unint64_t v24 = 0;
          __sz[0] = 0;
          int v15 = (char *)__sz;
          HIBYTE(v24) = v13 + 1;
          if (!v13) {
            goto LABEL_48;
          }
        }
        if (v12 >= 0) {
          int v18 = v1;
        }
        else {
          int v18 = (const std::string *)v1->__r_.__value_.__r.__words[0];
        }
        memmove(v15, v18, v13);
LABEL_48:
        *(_WORD *)&v15[v13] = 47;
        operator new();
      }
    }
  }
  else if (*((unsigned char *)&(*this)->__r_.__value_.__s + 23) {
         && v1->__r_.__value_.__s.__data_[HIBYTE((*this)->__r_.__value_.__r.__words[2]) - 1] != 47)
  }
  {
    if (v2 != 1)
    {
      long long v3 = *this;
      if (v2 != 2)
      {
LABEL_13:
        __sz[0] = 0;
        __sz[1] = 0;
        unint64_t v24 = 0;
        cva::utils::string::split((uint64_t)__sz, v1, "/", 1);
        size_t v5 = __sz[1];
        BOOL v6 = (void **)(__sz[1] - 24);
        if (*(char *)(__sz[1] - 1) < 0) {
          operator delete(*v6);
        }
        __sz[1] = (size_t)v6;
        if ((void **)__sz[0] == v6)
        {
          if ((unint64_t)v6 >= v24)
          {
            unint64_t v7 = 0x5555555555555556 * ((uint64_t)(v24 - (void)v6) >> 3);
            if (v7 <= 1) {
              unint64_t v7 = 1;
            }
            if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v24 - (void)v6) >> 3) >= 0x555555555555555) {
              unint64_t v8 = 0xAAAAAAAAAAAAAAALL;
            }
            else {
              unint64_t v8 = v7;
            }
            if (v8 > 0xAAAAAAAAAAAAAAALL) {
              sub_2153E6200();
            }
            uint64_t v9 = 24 * v8;
            size_t v10 = operator new(24 * v8);
            *(void *)size_t v10 = 46;
            v10[23] = 1;
            size_t v5 = (size_t)(v10 + 24);
            __sz[0] = (size_t)v10;
            unint64_t v24 = (unint64_t)&v10[v9];
            operator delete(v6);
          }
          else
          {
            *(void *)(v5 - 24) = 46;
            *(unsigned char *)(v5 - 1) = 1;
          }
          __sz[1] = v5;
        }
        char v20 = 1;
        LOWORD(__p) = 47;
        cva::utils::string::join((long long **)__sz, (uint64_t)&__p, &v21);
        int v11 = std::string::append(&v21, "/");
        v22[0] = v11->__r_.__value_.__r.__words[2];
        *(_DWORD *)((char *)v22 + 3) = *(_DWORD *)((char *)&v11->__r_.__value_.__r.__words[2] + 3);
        v11->__r_.__value_.__l.__size_ = 0;
        v11->__r_.__value_.__r.__words[2] = 0;
        v11->__r_.__value_.__r.__words[0] = 0;
        if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0)
        {
          operator delete(v21.__r_.__value_.__l.__data_);
          if ((v20 & 0x80000000) == 0) {
            goto LABEL_30;
          }
        }
        else if ((v20 & 0x80000000) == 0)
        {
          goto LABEL_30;
        }
        operator delete(__p);
LABEL_30:
        operator new();
      }
      goto LABEL_12;
    }
    if (v1->__r_.__value_.__s.__data_[0] != 46) {
      goto LABEL_13;
    }
    goto LABEL_34;
  }
  operator new();
}

void cva::Path::parentPath(cva::Path *this@<X0>, int a2@<W8>)
{
}

void sub_21543F9BC(int a1, uint64_t a2, int a3)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  if (*(char *)(a2 + 23) < 0)
  {
    if (*(void *)(a2 + 8))
    {
LABEL_3:
      v41 = 0;
      id v42 = 0;
      unint64_t v43 = 0;
      cva::utils::string::split((uint64_t)&v41, (const std::string *)a2, "/", 1);
      int v4 = v42;
      size_t v5 = v42 - 3;
      if (*((char *)v42 - 1) < 0)
      {
        if (*(v42 - 2)) {
          goto LABEL_11;
        }
        operator delete(*v5);
      }
      else if (*((unsigned char *)v42 - 1))
      {
        goto LABEL_11;
      }
      id v42 = v5;
      int v4 = v5;
LABEL_11:
      BOOL v6 = (long long *)v41;
      uint64_t v7 = (char *)v4 - v41 - 24;
      if ((char *)v4 - v41 != 24) {
        goto LABEL_14;
      }
      if (*((char *)v4 - 1) < 0)
      {
        if (*(v4 - 2))
        {
LABEL_14:
          if (!a3)
          {
            int v11 = v4 - 3;
            if (*((char *)v4 - 1) < 0) {
              operator delete(*v11);
            }
            id v42 = v4 - 3;
            if (v6 != (long long *)v11) {
              goto LABEL_104;
            }
            if (v6 < (long long *)v43)
            {
              *(void *)BOOL v6 = 46;
              *((unsigned char *)v4 - 1) = 1;
              id v42 = v4;
              goto LABEL_104;
            }
            unint64_t v16 = 0x5555555555555556 * ((v43 - (char *)v6) >> 3);
            if (v16 <= 1) {
              unint64_t v16 = 1;
            }
            if (0xAAAAAAAAAAAAAAABLL * ((v43 - (char *)v6) >> 3) >= 0x555555555555555) {
              unint64_t v17 = 0xAAAAAAAAAAAAAAALL;
            }
            else {
              unint64_t v17 = v16;
            }
            if (v17 <= 0xAAAAAAAAAAAAAAALL)
            {
              uint64_t v18 = 24 * v17;
              CVReturn v19 = (char *)operator new(24 * v17);
              *(void *)CVReturn v19 = 46;
              v19[23] = 1;
              v41 = v19;
              unint64_t v43 = &v19[v18];
              operator delete(v6);
              id v42 = (void **)(v19 + 24);
              goto LABEL_104;
            }
            goto LABEL_110;
          }
          if (0xAAAAAAAAAAAAAAABLL * (((char *)v4 - v41) >> 3) >= 2)
          {
            while (1)
            {
              int v9 = *((char *)v4 - 1);
              if (v9 < 0)
              {
                if (*(v4 - 2) != (void *)1 || (size_t v10 = *(v4 - 3), *v10 != 46))
                {
LABEL_30:
                  id v42 = v4;
                  break;
                }
                operator delete(v10);
              }
              else if (v9 != 1 || *((unsigned char *)v4 - 24) != 46)
              {
                goto LABEL_30;
              }
              v4 -= 3;
              unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * (v7 >> 3);
              v7 -= 24;
              if (v8 <= 1) {
                goto LABEL_30;
              }
            }
          }
          int v12 = (char *)(v4 - 3);
          if (*((char *)v4 - 1) < 0)
          {
            uint64_t v14 = (uint64_t)*(v4 - 2);
            if (v14 == 1)
            {
              int v15 = *(_WORD **)v12;
              if (**(unsigned char **)v12 == 46) {
                goto LABEL_52;
              }
            }
            else if (v14 == 2)
            {
              int v15 = *(_WORD **)v12;
              if (**(_WORD **)v12 == 11822) {
                goto LABEL_52;
              }
            }
            else
            {
              int v15 = *(_WORD **)v12;
            }
            operator delete(v15);
          }
          else
          {
            int v13 = *((unsigned __int8 *)v4 - 1);
            if (v13 == 1)
            {
              if (*v12 == 46) {
                goto LABEL_52;
              }
            }
            else if (v13 == 2 && *(_WORD *)v12 == 11822)
            {
LABEL_52:
              if (v4 < (void **)v43)
              {
                FILE *v4 = (void *)11822;
                char v20 = *(void **)((char *)v44.__r_.__value_.__r.__words + 7);
                v4[1] = (void *)v44.__r_.__value_.__r.__words[0];
                *(void **)((char *)v4 + 15) = v20;
                *((unsigned char *)v4 + 23) = 2;
                int v12 = (char *)(v4 + 3);
                id v42 = v4 + 3;
                goto LABEL_94;
              }
              unint64_t v21 = 0xAAAAAAAAAAAAAAABLL * (((char *)v4 - (char *)v6) >> 3) + 1;
              if (v21 <= 0xAAAAAAAAAAAAAAALL)
              {
                if (0x5555555555555556 * ((v43 - (char *)v6) >> 3) > v21) {
                  unint64_t v21 = 0x5555555555555556 * ((v43 - (char *)v6) >> 3);
                }
                if (0xAAAAAAAAAAAAAAABLL * ((v43 - (char *)v6) >> 3) >= 0x555555555555555) {
                  unint64_t v22 = 0xAAAAAAAAAAAAAAALL;
                }
                else {
                  unint64_t v22 = v21;
                }
                if (!v22)
                {
                  uint64_t v23 = 0;
                  goto LABEL_78;
                }
                if (v22 <= 0xAAAAAAAAAAAAAAALL)
                {
                  uint64_t v23 = (char *)operator new(24 * v22);
LABEL_78:
                  vImage_Error v29 = &v23[8 * (((char *)v4 - (char *)v6) >> 3)];
                  *(void *)vImage_Error v29 = 11822;
                  v29[23] = 2;
                  v44.__r_.__value_.__r.__words[0] = 0;
                  *(std::string::size_type *)((char *)v44.__r_.__value_.__r.__words + 7) = 0;
                  int v12 = v29 + 24;
                  if (v4 == (void **)v6)
                  {
                    v41 = &v23[8 * (((char *)v4 - (char *)v6) >> 3)];
                    unint64_t v43 = &v23[24 * v22];
                  }
                  else
                  {
                    vImage_Error v30 = (long long *)v4;
                    do
                    {
                      long long v31 = *(long long *)((char *)v30 - 24);
                      *((void *)v29 - 1) = *((void *)v30 - 1);
                      *(_OWORD *)(v29 - 24) = v31;
                      v29 -= 24;
                      *((void *)v30 - 2) = 0;
                      *((void *)v30 - 1) = 0;
                      *((void *)v30 - 3) = 0;
                      vImage_Error v30 = (long long *)((char *)v30 - 24);
                    }
                    while (v30 != v6);
                    v41 = v29;
                    id v42 = (void **)v12;
                    unint64_t v43 = &v23[24 * v22];
                    while (v4 != (void **)v6)
                    {
                      if (*((char *)v4 - 1) < 0) {
                        operator delete(*(v4 - 3));
                      }
                      v4 -= 3;
                    }
                  }
                  if (v6) {
                    operator delete(v6);
                  }
                  id v42 = (void **)v12;
LABEL_94:
                  if (0xAAAAAAAAAAAAAAABLL * ((v12 - v41) >> 3) >= 2)
                  {
                    double v33 = (void **)(v12 - 24);
                    uint64_t v34 = v12 - 24 - v41;
                    do
                    {
                      int v36 = *((char *)v33 + 23);
                      if (v36 < 0)
                      {
                        if (v33[1] != (void *)1 || *(unsigned char *)*v33 != 46) {
                          break;
                        }
                        operator delete(*v33);
                      }
                      else if (v36 != 1 || *(unsigned char *)v33 != 46)
                      {
                        break;
                      }
                      v12 -= 24;
                      id v42 = v33;
                      unint64_t v35 = 0xAAAAAAAAAAAAAAABLL * (v34 >> 3);
                      v33 -= 3;
                      v34 -= 24;
                    }
                    while (v35 > 1);
                  }
LABEL_104:
                  char v39 = 1;
                  LOWORD(__p) = 47;
                  cva::utils::string::join((long long **)&v41, (uint64_t)&__p, &v44);
                  double v37 = std::string::append(&v44, "/");
                  v40[0] = v37->__r_.__value_.__r.__words[2];
                  *(_DWORD *)((char *)v40 + 3) = *(_DWORD *)((char *)&v37->__r_.__value_.__r.__words[2] + 3);
                  v37->__r_.__value_.__l.__size_ = 0;
                  v37->__r_.__value_.__r.__words[2] = 0;
                  v37->__r_.__value_.__r.__words[0] = 0;
                  if (SHIBYTE(v44.__r_.__value_.__r.__words[2]) < 0)
                  {
                    operator delete(v44.__r_.__value_.__l.__data_);
                    if ((v39 & 0x80000000) == 0) {
                      goto LABEL_106;
                    }
                  }
                  else if ((v39 & 0x80000000) == 0)
                  {
                    goto LABEL_106;
                  }
                  operator delete(__p);
LABEL_106:
                  operator new();
                }
LABEL_110:
                sub_2153E6200();
              }
LABEL_111:
              abort();
            }
          }
          id v42 = v4 - 3;
          if (v6 != (long long *)v12) {
            goto LABEL_94;
          }
          if (v12 >= v43)
          {
            unint64_t v25 = 0xAAAAAAAAAAAAAAABLL * ((v12 - (char *)v6) >> 3);
            unint64_t v26 = v25 + 1;
            if (v25 + 1 > 0xAAAAAAAAAAAAAAALL) {
              goto LABEL_111;
            }
            if (0x5555555555555556 * ((v43 - (char *)v6) >> 3) > v26) {
              unint64_t v26 = 0x5555555555555556 * ((v43 - (char *)v6) >> 3);
            }
            if (0xAAAAAAAAAAAAAAABLL * ((v43 - (char *)v6) >> 3) >= 0x555555555555555) {
              unint64_t v27 = 0xAAAAAAAAAAAAAAALL;
            }
            else {
              unint64_t v27 = v26;
            }
            if (v27)
            {
              if (v27 > 0xAAAAAAAAAAAAAAALL) {
                goto LABEL_110;
              }
              uint64_t v28 = (char *)operator new(24 * v27);
            }
            else
            {
              uint64_t v28 = 0;
            }
            vImage_Buffer v32 = &v28[24 * v25];
            *(void *)vImage_Buffer v32 = 46;
            v32[23] = 1;
            v44.__r_.__value_.__r.__words[0] = 0;
            *(std::string::size_type *)((char *)v44.__r_.__value_.__r.__words + 7) = 0;
            int v4 = (void **)(v32 + 24);
            v41 = v32;
            unint64_t v43 = &v28[24 * v27];
            if (v6) {
              operator delete(v6);
            }
          }
          else
          {
            *(v4 - 3) = (void *)46;
            std::string::size_type v24 = v44.__r_.__value_.__r.__words[0];
            *(void **)((char *)v4 - 9) = *(void **)((char *)v44.__r_.__value_.__r.__words + 7);
            *(v4 - 2) = (void *)v24;
            *((unsigned char *)v4 - 1) = 1;
          }
          id v42 = v4;
          int v12 = (char *)v4;
          goto LABEL_94;
        }
      }
      else if (*((unsigned char *)v4 - 1))
      {
        goto LABEL_14;
      }
      v44.__r_.__value_.__r.__words[0] = (std::string::size_type)"/";
      sub_21543F31C();
    }
  }
  else if (*(unsigned char *)(a2 + 23))
  {
    goto LABEL_3;
  }
  operator new();
}

void cva::Path::filename(cva::Path *this)
{
  uint64_t v1 = *(long long **)this;
  if (*(char *)(*(void *)this + 23) < 0)
  {
    unint64_t v3 = *((void *)v1 + 1);
    if (v3 && *(unsigned char *)(*(void *)v1 + v3 - 1) != 47)
    {
      sub_2153C0AE4(&__p, *(void **)v1, v3);
LABEL_9:
      cva::Path::safeBasename(&__p, &v5);
      operator new();
    }
  }
  else if (*(unsigned char *)(*(void *)this + 23) {
         && *((unsigned char *)v1 + *(unsigned __int8 *)(*(void *)this + 23) - 1) != 47)
  }
  {
    long long v2 = *v1;
    __p.__r_.__value_.__r.__words[2] = *((void *)v1 + 2);
    *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v2;
    goto LABEL_9;
  }
  operator new();
}

std::string *cva::Path::safeBasename@<X0>(std::string *this@<X0>, unsigned char *a2@<X8>)
{
  long long v2 = this;
  unint64_t v3 = a2;
  if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0)
  {
    if (this->__r_.__value_.__l.__size_) {
      goto LABEL_3;
    }
LABEL_14:
    a2[23] = 1;
    *(_WORD *)a2 = 46;
    return this;
  }
  if (!*((unsigned char *)&this->__r_.__value_.__s + 23)) {
    goto LABEL_14;
  }
LABEL_3:
  for (unsigned int i = HIBYTE(this->__r_.__value_.__r.__words[2]); (i & 0x80) == 0; unsigned int i = HIBYTE(this->__r_.__value_.__r.__words[2]))
  {
    std::string::size_type size = i;
    if (i <= 1) {
      goto LABEL_15;
    }
    if (*((unsigned char *)&this[-1].__r_.__value_.__r.__words[2] + i + 7) != 47) {
      goto LABEL_16;
    }
    std::string::size_type v5 = i - 1;
    *((unsigned char *)&this->__r_.__value_.__s + 23) = size - 1;
    BOOL v6 = this;
LABEL_5:
    v6->__r_.__value_.__s.__data_[v5] = 0;
  }
  std::string::size_type size = this->__r_.__value_.__l.__size_;
  std::string::size_type v5 = size - 1;
  if (size > 1)
  {
    BOOL v6 = (std::string *)this->__r_.__value_.__r.__words[0];
    if (*(unsigned char *)(this->__r_.__value_.__r.__words[0] + size - 1) != 47) {
      goto LABEL_16;
    }
    this->__r_.__value_.__l.__size_ = v5;
    goto LABEL_5;
  }
LABEL_15:
  if (size == 1)
  {
LABEL_20:
    *(_OWORD *)unint64_t v3 = *(_OWORD *)&v2->__r_.__value_.__l.__data_;
    v3[2] = *((void *)&v2->__r_.__value_.__l + 2);
    v2->__r_.__value_.__l.__size_ = 0;
    v2->__r_.__value_.__r.__words[2] = 0;
    v2->__r_.__value_.__r.__words[0] = 0;
    return this;
  }
LABEL_16:
  this = (std::string *)std::string::rfind(this, 47, 0xFFFFFFFFFFFFFFFFLL);
  if (this == (std::string *)-1) {
    goto LABEL_20;
  }
  if (SHIBYTE(v2->__r_.__value_.__r.__words[2]) < 0)
  {
    unint64_t v8 = v2->__r_.__value_.__l.__size_;
    if (v8 <= (unint64_t)this) {
      goto LABEL_32;
    }
    long long v2 = (std::string *)v2->__r_.__value_.__r.__words[0];
  }
  else
  {
    unint64_t v8 = HIBYTE(v2->__r_.__value_.__r.__words[2]);
    if ((unint64_t)this >= v8) {
LABEL_32:
    }
      abort();
  }
  int v9 = &this->__r_.__value_.__s.__data_[1];
  size_t v10 = v8 - ((void)this->__r_.__value_.__r.__words + 1);
  if (v10 >= 0x7FFFFFFFFFFFFFF8) {
    goto LABEL_32;
  }
  if (v10 >= 0x17)
  {
    uint64_t v11 = (v10 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v10 | 7) != 0x17) {
      uint64_t v11 = v10 | 7;
    }
    uint64_t v12 = v11 + 1;
    int v13 = operator new(v11 + 1);
    v3[1] = v10;
    v3[2] = v12 | 0x8000000000000000;
    *unint64_t v3 = v13;
    unint64_t v3 = v13;
    goto LABEL_30;
  }
  *((unsigned char *)v3 + 23) = v10;
  if ((char *)v8 != v9) {
LABEL_30:
  }
    this = (std::string *)memmove(v3, &v9[(void)v2], v10);
  *((unsigned char *)v3 + v10) = 0;
  return this;
}

void cva::Path::stem(cva::Path *this)
{
}

void cva::Path::extension(cva::Path *this)
{
}

void cva::Path::workingDirectory(cva::Path *this)
{
  if (getcwd(0, 0)) {
    sub_21543F31C();
  }
  operator new();
}

void cva::Path::canonical(cva::Path *this)
{
  if (*(char *)(*(void *)this + 23) < 0)
  {
    if (*(void *)(*(void *)this + 8)) {
LABEL_3:
    }
      cva::Path::absolute(this);
  }
  else if (*(unsigned char *)(*(void *)this + 23))
  {
    goto LABEL_3;
  }
  operator new();
}

void cva::Path::absolute(cva::Path *this)
{
  uint64_t v1 = *(unsigned char **)this;
  if (*(char *)(*(void *)this + 23) < 0)
  {
    if (!*((void *)v1 + 1)) {
      goto LABEL_8;
    }
    long long v2 = *(unsigned char **)v1;
  }
  else
  {
    long long v2 = *(unsigned char **)this;
    if (!*(unsigned char *)(*(void *)this + 23)) {
      goto LABEL_8;
    }
  }
  if (*v2 == 47) {
    operator new();
  }
LABEL_8:
  if (getcwd(0, 0)) {
    sub_21543F31C();
  }
  operator new();
}

BOOL cva::Path::isAbsolute(cva::Path *this)
{
  uint64_t v1 = *(void **)this;
  if ((*(char *)(*(void *)this + 23) & 0x80000000) == 0)
  {
    if (!*(unsigned char *)(*(void *)this + 23)) {
      return 0;
    }
    return *(unsigned char *)v1 == 47;
  }
  if (v1[1])
  {
    uint64_t v1 = (void *)*v1;
    return *(unsigned char *)v1 == 47;
  }
  return 0;
}

uint64_t cva::Path::makeRelative(const std::string **this, const std::string **a2)
{
  char v20 = 0;
  unint64_t v21 = 0;
  uint64_t v22 = 0;
  std::string __p = 0;
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  cva::utils::string::split((uint64_t)&v20, *this, "/", 1);
  cva::utils::string::split((uint64_t)&__p, *a2, "/", 1);
  unint64_t v3 = v20;
  int v4 = v21;
  std::string::size_type v5 = (unsigned __int8 **)__p;
  if (v20 == v21) {
    goto LABEL_29;
  }
  BOOL v6 = v18;
  if (__p == v18) {
    goto LABEL_29;
  }
  if (*((char *)v18 - 1) < 0)
  {
    if (*(v18 - 2)) {
      goto LABEL_9;
    }
    operator delete(*(v18 - 3));
  }
  else if (*((unsigned char *)v18 - 1))
  {
    goto LABEL_9;
  }
  uint64_t v18 = v6 - 3;
  v6 -= 3;
LABEL_9:
  if (v5 == v6) {
LABEL_43:
  }
    operator new();
  uint64_t v7 = v3;
  unint64_t v8 = v5;
  while (v7 != v4)
  {
    uint64_t v9 = *((unsigned __int8 *)v7 + 23);
    if ((v9 & 0x80u) == 0) {
      size_t v10 = (unsigned __int8 *)*((unsigned __int8 *)v7 + 23);
    }
    else {
      size_t v10 = (unsigned __int8 *)v7[1];
    }
    uint64_t v11 = (unsigned __int8 *)*((unsigned __int8 *)v8 + 23);
    int v12 = (char)v11;
    if ((char)v11 < 0) {
      uint64_t v11 = v8[1];
    }
    if (v10 != v11) {
      break;
    }
    if (v12 >= 0) {
      int v13 = (unsigned __int8 *)v8;
    }
    else {
      int v13 = *v8;
    }
    if ((v9 & 0x80) != 0)
    {
      if (memcmp(*v7, v13, (size_t)v7[1])) {
        break;
      }
    }
    else if (*((unsigned char *)v7 + 23))
    {
      uint64_t v14 = 0;
      while (*((unsigned __int8 *)v7 + v14) == v13[v14])
      {
        if (v9 == ++v14) {
          goto LABEL_12;
        }
      }
      break;
    }
LABEL_12:
    v7 += 3;
    v8 += 3;
    if (v8 == v6) {
      goto LABEL_43;
    }
  }
LABEL_29:
  if (v5)
  {
    for (unsigned int i = v18; i != v5; i -= 3)
    {
      if (*((char *)i - 1) < 0) {
        operator delete(*(i - 3));
      }
    }
    operator delete(v5);
  }
  if (v3)
  {
    for (; v4 != v3; v4 -= 3)
    {
      if (*((char *)v4 - 1) < 0) {
        operator delete(*(v4 - 3));
      }
    }
    operator delete(v3);
  }
  return 0;
}

BOOL cva::Path::isDirectory(const char **this)
{
  uint64_t v1 = *this;
  if (v1[23] < 0) {
    uint64_t v1 = *(const char **)v1;
  }
  return !stat(v1, &v4) && (v4.st_mode & 0xF000) == 0x4000;
}

BOOL cva::Path::isRegularFile(const char **this)
{
  uint64_t v1 = *this;
  if (v1[23] < 0) {
    uint64_t v1 = *(const char **)v1;
  }
  return !stat(v1, &v4) && (v4.st_mode & 0xF000) == 0x8000;
}

BOOL cva::Path::createDirectory(const char **this, const cva::Path *a2)
{
  unint64_t v3 = *this;
  if (v3[23] < 0) {
    unint64_t v3 = *(const char **)v3;
  }
  if (access(v3, 0))
  {
    stat v4 = *this;
    if ((*this)[23] < 0) {
      stat v4 = *(const char **)v4;
    }
    return mkdir(v4, 0x1FFu) == 0;
  }
  else
  {
    BOOL v6 = *this;
    if ((*this)[23] < 0) {
      BOOL v6 = *(const char **)v6;
    }
    return !stat(v6, &v8) && (v8.st_mode & 0xF000) == 0x4000;
  }
}

BOOL cva::Path::createDirectory(cva::Path *this, const cva::Path *a2)
{
  uint64_t v3 = *(void *)this;
  int v4 = *(char *)(v3 + 23);
  if (a2)
  {
    if (v4 < 0) {
      uint64_t v3 = *(void *)v3;
    }
    if (access((const char *)v3, 0)) {
      sub_21543F9BC((int)&v9, *(void *)this, 0);
    }
LABEL_12:
    uint64_t v7 = *(const char **)this;
    if (*(char *)(*(void *)this + 23) < 0) {
      uint64_t v7 = *(const char **)v7;
    }
    return !stat(v7, &v9) && (v9.st_mode & 0xF000) == 0x4000;
  }
  if (v4 < 0) {
    uint64_t v3 = *(void *)v3;
  }
  if (!access((const char *)v3, 0)) {
    goto LABEL_12;
  }
  std::string::size_type v5 = *(const char **)this;
  if (*(char *)(*(void *)this + 23) < 0) {
    std::string::size_type v5 = *(const char **)v5;
  }
  return mkdir(v5, 0x1FFu) == 0;
}

void cva::Path::tempDirectory(cva::Path *this)
{
}

void cva::Path::randomFilename(cva::Path *this)
{
  std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep rep = std::chrono::steady_clock::now().__d_.__rep_;
  unsigned int add = atomic_fetch_add(dword_267869BE0, 1u);
  uint64_t v3 = operator new(8uLL);
  *uint64_t v3 = rep;
  int v4 = operator new(0x10uLL);
  v4[2] = add;
  *(void *)int v4 = *v3;
  operator delete(v3);
  int v5 = *v4 - 1500454533;
  int v6 = *v4 + 840723718;
  unsigned int v7 = 1664525 * (v5 ^ v6 ^ 0x83DBDFDA ^ ((v5 ^ v6 ^ 0x83DBDFDA) >> 27));
  unsigned int v8 = v7 + v6;
  unsigned int v9 = v4[1] + v7;
  unsigned int v10 = v9 + 2;
  int v11 = v8 ^ (v9 + 2);
  v9 += 1371501271;
  unsigned int v12 = 1664525 * (v11 ^ v9 ^ ((v11 ^ v9) >> 27));
  int v13 = v4[2] + v12 + 3;
  int v14 = v13 + v5;
  unsigned int v15 = 1566083941 * ((v14 + v12 + v9 + v13) ^ ((v14 + v12 + v9 + v13) >> 27));
  int v16 = v15 ^ v10;
  unsigned int v17 = 1566083941 * ((v16 + (v15 ^ v14) + v15) ^ ((v16 + (v15 ^ v14) + v15) >> 27));
  int v18 = v17-- ^ v16;
  int v19 = v17 ^ v13;
  unsigned int v20 = 1566083941 * ((v19 + v18 + v17) ^ ((v19 + v18 + v17) >> 27));
  int v21 = v20 ^ v19;
  v20 -= 2;
  int v22 = v20 ^ v15;
  LOWORD(v21) = -29851 * ((v22 + v21 + v20) ^ ((v22 + v21 + v20) >> 27));
  cva::Sprintf::sprintf((cva::Sprintf *)"%04x-%04x-%04x-%04x", (uint64_t)__p, (unsigned __int16)(v21 ^ v22), (unsigned __int16)((v21 - 3) ^ v17), (unsigned __int16)v20, (unsigned __int16)(v21 - 3));
  operator new();
}

void cva::Path::tempFilename(cva::Path *this)
{
}

BOOL cva::Path::remove(const char *a1)
{
  if (a1[23] < 0) {
    a1 = *(const char **)a1;
  }
  return unlink(a1) == 0;
}

BOOL cva::Path::rmdir(const char *a1)
{
  if (a1[23] < 0) {
    a1 = *(const char **)a1;
  }
  return rmdir(a1) == 0;
}

void cva::Path::copyFile()
{
  uint64_t v0 = *MEMORY[0x263EF8340];
  operator new();
}

void cva::Path::rename()
{
}

BOOL cva::Path::resize(const char *a1, off_t a2)
{
  if (a1[23] < 0) {
    a1 = *(const char **)a1;
  }
  return truncate(a1, a2) == 0;
}

uint64_t cva::plistParseScalar<unsigned char>(CFTypeRef *a1, unsigned char *a2)
{
  CFTypeID v4 = CFGetTypeID(*a1);
  if (v4 != CFNumberGetTypeID()) {
    return 0;
  }
  unint64_t v5 = [(id)*a1 unsignedIntegerValue];
  if (v5 > 0xFF) {
    return 0;
  }
  *a2 = v5;
  return 1;
}

uint64_t cva::plistParseScalar<unsigned short>(CFTypeRef *a1, _WORD *a2)
{
  CFTypeID v4 = CFGetTypeID(*a1);
  if (v4 != CFNumberGetTypeID()) {
    return 0;
  }
  unint64_t v5 = [(id)*a1 unsignedIntegerValue];
  if (v5 >> 16) {
    return 0;
  }
  *a2 = v5;
  return 1;
}

uint64_t cva::plistParseScalar<unsigned int>(CFTypeRef *a1, _DWORD *a2)
{
  CFTypeID v4 = CFGetTypeID(*a1);
  if (v4 != CFNumberGetTypeID()) {
    return 0;
  }
  unint64_t v5 = [(id)*a1 unsignedIntegerValue];
  if (HIDWORD(v5)) {
    return 0;
  }
  *a2 = v5;
  return 1;
}

BOOL cva::plistParseScalar<unsigned long long>(CFTypeRef *a1, void *a2)
{
  CFTypeID v4 = CFGetTypeID(*a1);
  CFTypeID TypeID = CFNumberGetTypeID();
  if (v4 == TypeID) {
    *a2 = [(id)*a1 unsignedIntegerValue];
  }
  return v4 == TypeID;
}

uint64_t cva::plistParseScalar<signed char>(CFTypeRef *a1, unsigned char *a2)
{
  CFTypeID v4 = CFGetTypeID(*a1);
  if (v4 != CFNumberGetTypeID()) {
    return 0;
  }
  uint64_t v5 = [(id)*a1 integerValue];
  if (v5 != (char)v5) {
    return 0;
  }
  *a2 = v5;
  return 1;
}

uint64_t cva::plistParseScalar<short>(CFTypeRef *a1, _WORD *a2)
{
  CFTypeID v4 = CFGetTypeID(*a1);
  if (v4 != CFNumberGetTypeID()) {
    return 0;
  }
  uint64_t v5 = [(id)*a1 integerValue];
  if (v5 != (__int16)v5) {
    return 0;
  }
  *a2 = v5;
  return 1;
}

uint64_t cva::plistParseScalar<int>(CFTypeRef *a1, _DWORD *a2)
{
  CFTypeID v4 = CFGetTypeID(*a1);
  if (v4 != CFNumberGetTypeID()) {
    return 0;
  }
  uint64_t v5 = [(id)*a1 integerValue];
  if (v5 != (int)v5) {
    return 0;
  }
  *a2 = v5;
  return 1;
}

BOOL cva::plistParseScalar<long long>(CFTypeRef *a1, void *a2)
{
  CFTypeID v4 = CFGetTypeID(*a1);
  CFTypeID TypeID = CFNumberGetTypeID();
  if (v4 == TypeID) {
    *a2 = [(id)*a1 integerValue];
  }
  return v4 == TypeID;
}

BOOL cva::plistParseScalar<BOOL>(CFTypeRef *a1, unsigned char *a2)
{
  CFTypeID v4 = CFGetTypeID(*a1);
  CFTypeID TypeID = CFBooleanGetTypeID();
  if (v4 == TypeID) {
    *a2 = [(id)*a1 BOOLValue];
  }
  return v4 == TypeID;
}

BOOL cva::plistParseScalar<float>(CFTypeRef *a1, _DWORD *a2)
{
  CFTypeID v4 = CFGetTypeID(*a1);
  CFTypeID TypeID = CFNumberGetTypeID();
  if (v4 == TypeID)
  {
    [(id)*a1 floatValue];
    *a2 = v6;
  }
  return v4 == TypeID;
}

BOOL cva::plistParseScalar<double>(CFTypeRef *a1, void *a2)
{
  CFTypeID v4 = CFGetTypeID(*a1);
  CFTypeID TypeID = CFNumberGetTypeID();
  if (v4 == TypeID)
  {
    [(id)*a1 doubleValue];
    *a2 = v6;
  }
  return v4 == TypeID;
}

BOOL cva::plistParseScalar<std::string>(CFTypeRef *a1, uint64_t a2)
{
  CFTypeID v4 = CFGetTypeID(*a1);
  CFTypeID TypeID = CFStringGetTypeID();
  if (v4 == TypeID)
  {
    id v6 = (id) (id) *a1;
    MEMORY[0x2166B9470](a2, [v6 UTF8String]);
  }
  return v4 == TypeID;
}

void sub_2154423FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

CFPropertyListRef cva::createPlistLoadFile(cva *this, const char *a2)
{
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFStringRef v3 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], (const char *)this, 0);
  CFURLRef v4 = CFURLCreateWithFileSystemPath(v2, v3, kCFURLPOSIXPathStyle, 0);
  uint64_t v5 = CFReadStreamCreateWithFile(v2, v4);
  CFReadStreamOpen(v5);
  CFPropertyListRef v6 = CFPropertyListCreateWithStream(v2, v5, 0, 1uLL, 0, 0);
  CFReadStreamClose(v5);
  CFRelease(v5);
  CFRelease(v4);
  CFRelease(v3);
  return v6;
}

uint64_t cva::plistSaveFile(cva *this, const void *a2, const char *a3)
{
  CFURLRef v4 = objc_msgSend(NSString, "stringWithCString:encoding:", a2, objc_msgSend(NSString, "defaultCStringEncoding", a3));
  CFDataRef Data = CFPropertyListCreateData((CFAllocatorRef)*MEMORY[0x263EFFB08], this, kCFPropertyListXMLFormat_v1_0, 0, 0);
  CFDataRef v6 = Data;
  if (Data)
  {
    uint64_t v7 = [(__CFData *)Data writeToFile:v4 atomically:1];
    CFRelease(v6);
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

void sub_215442568(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL cva::plistGetDictElement(CFTypeRef *this, const void *const *a2, const void **a3, const void **a4)
{
  CFTypeID v7 = CFGetTypeID(*this);
  if (v7 != CFDictionaryGetTypeID()) {
    return 0;
  }
  CFStringRef v8 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], (const char *)a2, 0);
  BOOL v9 = CFDictionaryGetValueIfPresent((CFDictionaryRef)*this, v8, a3) != 0;
  CFRelease(v8);
  return v9;
}

BOOL cva::plistGetDataElement(CFTypeRef *this, const void **a2, unsigned __int8 *a3)
{
  int v3 = (int)a3;
  CFTypeID v6 = CFGetTypeID(*this);
  if (v6 != CFDataGetTypeID()) {
    return 0;
  }
  id v7 = (id)*this;
  size_t v8 = [v7 length];
  BOOL v9 = v8 == v3;
  BOOL v10 = v9;
  if (v9) {
    memcpy(a2, (const void *)[v7 bytes], v8);
  }

  return v10;
}

void sub_2154426A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void cva::plistPrintDict(CFDictionaryRef *this, const __CFDictionary *const *a2)
{
  CFIndex Count = CFDictionaryGetCount(*this);
  CFURLRef v4 = (const void **)malloc_type_malloc(8 * Count, 0xC0040B8AA526DuLL);
  uint64_t v5 = (const void **)malloc_type_malloc(8 * Count, 0xC0040B8AA526DuLL);
  CFDictionaryGetKeysAndValues(*this, v4, v5);
  if (Count)
  {
    CFTypeID v6 = v4;
    id v7 = v5;
    do
    {
      size_t v8 = *v6++;
      CFShow(v8);
      BOOL v9 = *v7++;
      CFShow(v9);
      --Count;
    }
    while (Count);
  }
  free(v4);
  free(v5);
}

uint64_t cva::adp::PListPath::PListPath(uint64_t this)
{
  *(unsigned char *)(this + 23) = 1;
  *(_WORD *)this = 47;
  return this;
}

{
  *(unsigned char *)(this + 23) = 1;
  *(_WORD *)this = 47;
  return this;
}

uint64_t cva::adp::PListPath::PListPath(uint64_t a1, unint64_t *a2)
{
  return a1;
}

{
  cva::adp::PListPath::convertToPath(a2, a1);
  return a1;
}

void cva::adp::PListPath::convertToPath(unint64_t *a1@<X1>, uint64_t a2@<X8>)
{
  int v3 = (void *)a2;
  uint64_t v4 = *((unsigned __int8 *)a1 + 23);
  if ((*((char *)a1 + 23) & 0x80000000) == 0)
  {
    if (*((unsigned char *)a1 + 23))
    {
      size_t v5 = *((unsigned __int8 *)a1 + 23);
      if (*((unsigned char *)a1 + v4 - 1) == 47)
      {
        *(_OWORD *)a2 = *(_OWORD *)a1;
        *(void *)(a2 + 16) = a1[2];
        return;
      }
      goto LABEL_11;
    }
LABEL_10:
    *(unsigned char *)(a2 + 23) = 1;
    *(_WORD *)a2 = 47;
    return;
  }
  size_t v5 = a1[1];
  if (!v5) {
    goto LABEL_10;
  }
  CFTypeID v6 = (void *)*a1;
  if (*(unsigned char *)(*a1 + v5 - 1) != 47)
  {
LABEL_11:
    unint64_t v8 = v5 + 1;
    if (v5 + 1 >= 0x7FFFFFFFFFFFFFF8) {
      abort();
    }
    if (v8 > 0x16)
    {
      uint64_t v9 = (v8 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v8 | 7) != 0x17) {
        uint64_t v9 = v8 | 7;
      }
      uint64_t v10 = v9 + 1;
      int v11 = operator new(v9 + 1);
      v3[1] = v8;
      v3[2] = v10 | 0x8000000000000000;
      *int v3 = v11;
      int v3 = v11;
    }
    else
    {
      *(void *)(a2 + 8) = 0;
      *(void *)(a2 + 16) = 0;
      *(void *)a2 = 0;
      *(unsigned char *)(a2 + 23) = v8;
    }
    if ((v4 & 0x80u) == 0) {
      unsigned int v12 = a1;
    }
    else {
      unsigned int v12 = (const void *)*a1;
    }
    memmove(v3, v12, v5);
    *(_WORD *)((char *)v3 + v5) = 47;
    return;
  }
  unint64_t v7 = a1[1];
  sub_2153C0AE4((unsigned char *)a2, v6, v7);
}

std::string *cva::adp::PListPath::operator+@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, std::string *a3@<X8>)
{
  if (*(char *)(a1 + 23) < 0)
  {
    sub_2153C0AE4(a3, *(void **)a1, *(void *)(a1 + 8));
  }
  else
  {
    *(_OWORD *)&a3->__r_.__value_.__l.__data_ = *(_OWORD *)a1;
    a3->__r_.__value_.__r.__words[2] = *(void *)(a1 + 16);
  }
  int v5 = *(char *)(a2 + 23);
  if (v5 >= 0) {
    CFTypeID v6 = (const std::string::value_type *)a2;
  }
  else {
    CFTypeID v6 = *(const std::string::value_type **)a2;
  }
  if (v5 >= 0) {
    std::string::size_type v7 = *(unsigned __int8 *)(a2 + 23);
  }
  else {
    std::string::size_type v7 = *(void *)(a2 + 8);
  }
  return std::string::append(a3, v6, v7);
}

void cva::adp::PListPath::operator+(uint64_t a1@<X0>, unint64_t *a2@<X1>, std::string *a3@<X8>)
{
  if (*(char *)(a1 + 23) < 0)
  {
    sub_2153C0AE4(a3, *(void **)a1, *(void *)(a1 + 8));
  }
  else
  {
    *(_OWORD *)&a3->__r_.__value_.__l.__data_ = *(_OWORD *)a1;
    a3->__r_.__value_.__r.__words[2] = *(void *)(a1 + 16);
  }
  cva::adp::PListPath::convertToPath(a2, (uint64_t)__p);
  if ((v8 & 0x80u) == 0) {
    int v5 = __p;
  }
  else {
    int v5 = (void **)__p[0];
  }
  if ((v8 & 0x80u) == 0) {
    std::string::size_type v6 = v8;
  }
  else {
    std::string::size_type v6 = (std::string::size_type)__p[1];
  }
  std::string::append(a3, (const std::string::value_type *)v5, v6);
  if ((char)v8 < 0) {
    operator delete(__p[0]);
  }
}

void cva::PrintError::print(cva::PrintError *this@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  strerror_r((int)this, __strerrbuf, 0x400uLL);
  cva::Sprintf::sprintf((cva::Sprintf *)"%s (%d)", a2, __strerrbuf, this);
}

FILE *cva::FileTarget::logImpl(uint64_t a1, int a2, const char *a3, va_list a4)
{
  uint64_t result = *(FILE **)(a1 + 80);
  if (result)
  {
    fprintf(result, "< %-8s > ", off_2642418D8[a2]);
    vfprintf(*(FILE **)(a1 + 80), a3, a4);
    uint64_t result = (FILE *)fputc(10, *(FILE **)(a1 + 80));
    if (*(unsigned char *)(a1 + 88))
    {
      unsigned __int8 v8 = *(FILE **)(a1 + 80);
      return (FILE *)fflush(v8);
    }
  }
  return result;
}

void cva::FileTarget::~FileTarget(cva::FileTarget *this)
{
  CFAllocatorRef v2 = (FILE *)*((void *)this + 10);
  if (v2)
  {
    fflush(v2);
    fclose(*((FILE **)this + 10));
  }
  *(void *)this = &unk_26C5FBE78;
  std::mutex::~mutex((std::mutex *)((char *)this + 8));
  JUMPOUT(0x2166B9890);
}

{
  FILE *v2;

  CFAllocatorRef v2 = (FILE *)*((void *)this + 10);
  if (v2)
  {
    fflush(v2);
    fclose(*((FILE **)this + 10));
  }
  *(void *)this = &unk_26C5FBE78;
  std::mutex::~mutex((std::mutex *)((char *)this + 8));
}

{
  FILE *v2;

  CFAllocatorRef v2 = (FILE *)*((void *)this + 10);
  if (v2)
  {
    fflush(v2);
    fclose(*((FILE **)this + 10));
  }
  *(void *)this = &unk_26C5FBE78;
  std::mutex::~mutex((std::mutex *)((char *)this + 8));
}

uint64_t cva::ConsoleTarget::logImpl(uint64_t a1, int a2, const char *a3, va_list a4)
{
  std::string::size_type v7 = *(FILE **)(a1 + 80);
  unsigned __int8 v8 = (const char *)(a1 + 88);
  if (*(char *)(a1 + 111) < 0) {
    unsigned __int8 v8 = *(const char **)v8;
  }
  fprintf(v7, "[%s] < %-8s > ", v8, off_2642418D8[a2]);
  vfprintf(*(FILE **)(a1 + 80), a3, a4);
  uint64_t v9 = *(FILE **)(a1 + 80);
  return fputc(10, v9);
}

void sub_215442CF4(uint64_t a1)
{
  if (*(char *)(a1 + 111) < 0) {
    operator delete(*(void **)(a1 + 88));
  }
  *(void *)a1 = &unk_26C5FBE78;
  std::mutex::~mutex((std::mutex *)(a1 + 8));
  JUMPOUT(0x2166B9890);
}

uint64_t sub_215442D6C(uint64_t a1)
{
  if (*(char *)(a1 + 111) < 0) {
    operator delete(*(void **)(a1 + 88));
  }
  *(void *)a1 = &unk_26C5FBE78;
  std::mutex::~mutex((std::mutex *)(a1 + 8));
  return a1;
}

void cva::OsLogTarget::logImpl(uint64_t a1, unsigned int a2, const char *a3, va_list a4)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  int v7 = vsnprintf(0, 0, a3, a4);
  int v8 = v7 + 1;
  if (v7 == -1)
  {
    uint64_t v9 = 0;
    uint64_t v10 = 0;
  }
  else
  {
    if (v7 <= -2) {
      abort();
    }
    size_t v11 = v8;
    uint64_t v9 = (char *)operator new(v8);
    uint64_t v10 = &v9[v11];
    bzero(v9, v11);
  }
  vsnprintf(v9, v10 - v9, a3, a4);
  unsigned int v12 = *(NSObject **)(a1 + 80);
  unint64_t v13 = 0x1110000102uLL >> (8 * a2);
  if (a2 >= 6) {
    LOBYTE(v13) = 2;
  }
  os_log_type_t v14 = v13;
  if (os_log_type_enabled(v12, (os_log_type_t)v13))
  {
    unsigned int v15 = off_2642418D8[a2];
    *(_DWORD *)buf = 136315394;
    int v18 = v15;
    __int16 v19 = 2080;
    unsigned int v20 = v9;
    _os_log_impl(&dword_2153B7000, v12, v14, "< %-8s > %s", buf, 0x16u);
  }
  if (v9) {
    operator delete(v9);
  }
}

void sub_215442F20(uint64_t a1)
{
  *(void *)a1 = &unk_26C5FBE78;
  std::mutex::~mutex((std::mutex *)(a1 + 8));
  JUMPOUT(0x2166B9890);
}

uint64_t sub_215442F84(uint64_t a1)
{
  *(void *)a1 = &unk_26C5FBE78;
  std::mutex::~mutex((std::mutex *)(a1 + 8));
  return a1;
}

char *cva::toString(int a1)
{
  return off_2642418D8[a1];
}

void cva::Logger::Target::~Target(cva::Logger::Target *this)
{
  *(void *)this = &unk_26C5FBE78;
  std::mutex::~mutex((std::mutex *)((char *)this + 8));
}

void *cva::Logger::instance(cva::Logger *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_267869BF0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_267869BF0))
  {
    cva::Logger::Logger((cva::Logger *)&unk_267869BE8);
  }
  return &unk_267869BE8;
}

void cva::Logger::Logger(cva::Logger *this)
{
}

uint64_t *sub_21544324C(uint64_t *a1)
{
  uint64_t v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    std::mutex::~mutex((std::mutex *)(v2 + 24));
    sub_2154432A4(*(char **)(v2 + 8));
    MEMORY[0x2166B9890](v2, 0x1020C40791C62A7);
  }
  return a1;
}

void sub_2154432A4(char *a1)
{
  if (!a1) {
    return;
  }
  sub_2154432A4(*(void *)a1);
  sub_2154432A4(*((void *)a1 + 1));
  uint64_t v2 = (std::__shared_weak_count *)*((void *)a1 + 8);
  if (v2 && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
    if ((a1[55] & 0x80000000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  if (a1[55] < 0) {
LABEL_5:
  }
    operator delete(*((void **)a1 + 4));
LABEL_6:
  operator delete(a1);
}

void cva::Logger::Private::setTarget(uint64_t **a1, long long *a2, const char *a3)
{
  std::string::size_type v6 = (std::mutex *)(a1 + 3);
  std::mutex::lock((std::mutex *)(a1 + 3));
  size_t v7 = strlen(a3);
  if (v7 >= 0x7FFFFFFFFFFFFFF8) {
    abort();
  }
  size_t v8 = v7;
  if (v7 >= 0x17)
  {
    uint64_t v10 = (v7 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v7 | 7) != 0x17) {
      uint64_t v10 = v7 | 7;
    }
    uint64_t v11 = v10 + 1;
    p_dst = (long long *)operator new(v10 + 1);
    *((void *)&__dst + 1) = v8;
    int64_t v35 = v11 | 0x8000000000000000;
    *(void *)&long long __dst = p_dst;
    goto LABEL_8;
  }
  HIBYTE(v35) = v7;
  p_dst = &__dst;
  if (v7) {
LABEL_8:
  }
    memcpy(p_dst, a3, v8);
  *((unsigned char *)p_dst + v8) = 0;
  unint64_t v13 = a1 + 1;
  unsigned int v12 = a1[1];
  if (v12)
  {
    if (v35 >= 0) {
      size_t v14 = HIBYTE(v35);
    }
    else {
      size_t v14 = *((void *)&__dst + 1);
    }
    if (v35 >= 0) {
      unsigned int v15 = &__dst;
    }
    else {
      unsigned int v15 = (long long *)__dst;
    }
    while (1)
    {
      while (1)
      {
        int v16 = (char *)v12;
        __int16 v19 = (const void *)v12[4];
        unsigned int v17 = v12 + 4;
        int v18 = v19;
        int v20 = *((char *)v17 + 23);
        if (v20 >= 0) {
          size_t v21 = *((unsigned __int8 *)v17 + 23);
        }
        else {
          size_t v21 = v17[1];
        }
        if (v20 >= 0) {
          int v22 = v17;
        }
        else {
          int v22 = v18;
        }
        if (v21 >= v14) {
          size_t v23 = v14;
        }
        else {
          size_t v23 = v21;
        }
        int v24 = memcmp(v15, v22, v23);
        BOOL v25 = v14 < v21;
        if (v24) {
          BOOL v25 = v24 < 0;
        }
        if (!v25) {
          break;
        }
        unsigned int v12 = *(uint64_t **)v16;
        unint64_t v13 = (uint64_t **)v16;
        if (!*(void *)v16) {
          goto LABEL_35;
        }
      }
      int v26 = memcmp(v22, v15, v23);
      BOOL v27 = v21 < v14;
      if (v26) {
        BOOL v27 = v26 < 0;
      }
      if (!v27) {
        break;
      }
      unsigned int v12 = (uint64_t *)*((void *)v16 + 1);
      if (!v12)
      {
        unint64_t v13 = (uint64_t **)(v16 + 8);
        goto LABEL_35;
      }
    }
  }
  else
  {
    int v16 = (char *)(a1 + 1);
LABEL_35:
    uint64_t v28 = v16;
    int v16 = (char *)operator new(0x48uLL);
    *((_OWORD *)v16 + 2) = __dst;
    int64_t v29 = v35;
    long long __dst = 0uLL;
    int64_t v35 = 0;
    *((void *)v16 + 7) = 0;
    *((void *)v16 + 8) = 0;
    *((void *)v16 + 6) = v29;
    *(void *)int v16 = 0;
    *((void *)v16 + 1) = 0;
    *((void *)v16 + 2) = v28;
    *unint64_t v13 = (uint64_t *)v16;
    vImage_Error v30 = (uint64_t *)**a1;
    long long v31 = (uint64_t *)v16;
    if (v30)
    {
      *a1 = v30;
      long long v31 = *v13;
    }
    sub_2153CF298(a1[1], v31);
    a1[2] = (uint64_t *)((char *)a1[2] + 1);
  }
  long long v32 = *a2;
  *(void *)a2 = 0;
  *((void *)a2 + 1) = 0;
  double v33 = (std::__shared_weak_count *)*((void *)v16 + 8);
  *(_OWORD *)(v16 + 56) = v32;
  if (!v33 || atomic_fetch_add(&v33->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    if ((SHIBYTE(v35) & 0x80000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_41;
  }
  ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
  std::__shared_weak_count::__release_weak(v33);
  if (SHIBYTE(v35) < 0) {
LABEL_41:
  }
    operator delete((void *)__dst);
LABEL_42:
  std::mutex::unlock(v6);
}

void sub_2154435E0(uint64_t a1)
{
  *(void *)(a1 + 24) = &unk_26C5FBE78;
  std::mutex::~mutex((std::mutex *)(a1 + 32));
}

void sub_215443608(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C5FC358;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x2166B9890);
}

void sub_21544365C(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C5FC358;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void cva::Logger::setTarget(uint64_t ***a1, void *a2, const char *a3)
{
  int v3 = *a1;
  uint64_t v4 = a2[1];
  *(void *)&long long v6 = *a2;
  *((void *)&v6 + 1) = v4;
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
  }
  cva::Logger::Private::setTarget(v3, &v6, a3);
  uint64_t v5 = (std::__shared_weak_count *)*((void *)&v6 + 1);
  if (*((void *)&v6 + 1)
    && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v6 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
    std::__shared_weak_count::__release_weak(v5);
  }
}

os_log_t cva::Logger::makeOsLogTarget@<X0>(cva::Logger *this@<X0>, const char *a2@<X1>, void *a3@<X8>)
{
  size_t v7 = (char *)operator new(0x70uLL);
  *((void *)v7 + 1) = 0;
  *((void *)v7 + 2) = 0;
  *(void *)size_t v7 = &unk_26C5FC358;
  *(_OWORD *)(v7 + 40) = 0u;
  *(_OWORD *)(v7 + 56) = 0u;
  *(_OWORD *)(v7 + 72) = 0u;
  *(_OWORD *)(v7 + 81) = 0u;
  *((void *)v7 + 3) = &unk_26C5FB468;
  *((void *)v7 + 4) = 850045863;
  os_log_t result = os_log_create(a2, (const char *)this);
  *((void *)v7 + 13) = result;
  *a3 = v7 + 24;
  a3[1] = v7;
  return result;
}

void cva::Logger::Private::getTarget(cva::Logger::Private *this@<X0>, const char *a2@<X1>, void *a3@<X8>)
{
  long long v6 = (std::mutex *)((char *)this + 24);
  std::mutex::lock((std::mutex *)((char *)this + 24));
  size_t v7 = strlen(a2);
  if (v7 >= 0x7FFFFFFFFFFFFFF8) {
    abort();
  }
  size_t v8 = v7;
  if (v7 >= 0x17)
  {
    uint64_t v10 = (v7 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v7 | 7) != 0x17) {
      uint64_t v10 = v7 | 7;
    }
    uint64_t v11 = v10 + 1;
    p_dst = (void ***)operator new(v10 + 1);
    size_t v35 = v8;
    int64_t v36 = v11 | 0x8000000000000000;
    long long __dst = (void **)p_dst;
  }
  else
  {
    HIBYTE(v36) = v7;
    p_dst = &__dst;
    if (!v7) {
      goto LABEL_9;
    }
  }
  memcpy(p_dst, a2, v8);
LABEL_9:
  *((unsigned char *)p_dst + v8) = 0;
  size_t v14 = (char *)*((void *)this + 1);
  unsigned int v12 = (char *)this + 8;
  unint64_t v13 = v14;
  char v15 = HIBYTE(v36);
  if (!v14) {
    goto LABEL_52;
  }
  size_t v16 = v36 >= 0 ? HIBYTE(v36) : v35;
  unsigned int v17 = v36 >= 0 ? (void **)&__dst : __dst;
  int v18 = v12;
  do
  {
    int v19 = v13[55];
    if (v19 >= 0) {
      size_t v20 = v13[55];
    }
    else {
      size_t v20 = *((void *)v13 + 5);
    }
    if (v19 >= 0) {
      size_t v21 = v13 + 32;
    }
    else {
      size_t v21 = (const void *)*((void *)v13 + 4);
    }
    if (v16 >= v20) {
      size_t v22 = v20;
    }
    else {
      size_t v22 = v16;
    }
    int v23 = memcmp(v21, v17, v22);
    BOOL v24 = v20 < v16;
    if (v23) {
      BOOL v24 = v23 < 0;
    }
    BOOL v25 = !v24;
    if (v24) {
      int v26 = (char **)(v13 + 8);
    }
    else {
      int v26 = (char **)v13;
    }
    if (v25) {
      int v18 = v13;
    }
    unint64_t v13 = *v26;
  }
  while (*v26);
  if (v18 == v12) {
    goto LABEL_52;
  }
  int v27 = v18[55];
  if (v27 >= 0) {
    size_t v28 = v18[55];
  }
  else {
    size_t v28 = *((void *)v18 + 5);
  }
  if (v27 >= 0) {
    int64_t v29 = v18 + 32;
  }
  else {
    int64_t v29 = (const void *)*((void *)v18 + 4);
  }
  if (v28 >= v16) {
    size_t v30 = v16;
  }
  else {
    size_t v30 = v28;
  }
  int v31 = memcmp(v17, v29, v30);
  BOOL v32 = v16 < v28;
  if (v31) {
    BOOL v32 = v31 < 0;
  }
  if (v32)
  {
LABEL_52:
    int v18 = v12;
    if ((v15 & 0x80) == 0)
    {
LABEL_49:
      if (v18 != v12) {
        goto LABEL_50;
      }
LABEL_54:
      *a3 = 0;
      a3[1] = 0;
      goto LABEL_55;
    }
  }
  else if ((v15 & 0x80) == 0)
  {
    goto LABEL_49;
  }
  operator delete(__dst);
  if (v18 == v12) {
    goto LABEL_54;
  }
LABEL_50:
  uint64_t v33 = *((void *)v18 + 8);
  *a3 = *((void *)v18 + 7);
  a3[1] = v33;
  if (v33) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v33 + 8), 1uLL, memory_order_relaxed);
  }
LABEL_55:
  std::mutex::unlock(v6);
}

void cva::Logger::logInCategory(cva::Logger::Private **a1, uint64_t a2, char *a3, uint64_t a4, ...)
{
  va_start(va, a4);
  cva::Logger::Private::getTarget(*a1, a3, &v8);
  uint64_t v6 = v8;
  if (v8 && a2 != 5 && *(unsigned __int8 *)(v8 + 72) <= a2)
  {
    std::mutex::lock((std::mutex *)(v8 + 8));
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t *))(*(void *)v6 + 16))(v6, a2, a4, (uint64_t *)va);
    std::mutex::unlock((std::mutex *)(v6 + 8));
  }
  size_t v7 = v9;
  if (v9)
  {
    if (!atomic_fetch_add(&v9->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
}

BOOL cva::Logger::setMinimumSeverity(cva::Logger::Private **a1, int a2, char *a3)
{
  if (a2 == 5) {
    return 0;
  }
  char v4 = a2;
  cva::Logger::Private::getTarget(*a1, a3, &v7);
  BOOL v3 = v7 != 0;
  if (v7) {
    *(unsigned char *)(v7 + 72) = v4;
  }
  uint64_t v5 = v8;
  if (v8 && !atomic_fetch_add(&v8->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
    std::__shared_weak_count::__release_weak(v5);
  }
  return v3;
}

uint64_t cva::Logger::getMinimumSeverity(cva::Logger::Private **this, const char *a2)
{
  cva::Logger::Private::getTarget(*this, a2, &v5);
  if (v5)
  {
    uint64_t v2 = *(unsigned __int8 *)(v5 + 72);
    BOOL v3 = v6;
    if (!v6) {
      return v2;
    }
  }
  else
  {
    uint64_t v2 = 5;
    BOOL v3 = v6;
    if (!v6) {
      return v2;
    }
  }
  if (!atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
    std::__shared_weak_count::__release_weak(v3);
  }
  return v2;
}

__n128 cva::Logger::makeConsoleTarget@<Q0>(cva::Logger *this@<X0>, const char *a2@<X1>, __n128 *a3@<X8>)
{
  int v3 = (int)a2;
  uint64_t v6 = (char *)operator new(0x88uLL);
  unint64_t v7 = (unint64_t)v6;
  *((void *)v6 + 1) = 0;
  *((void *)v6 + 2) = 0;
  *(void *)uint64_t v6 = &unk_26C5FC3C8;
  unint64_t v8 = (unint64_t)(v6 + 24);
  *(_OWORD *)(v6 + 40) = 0u;
  *(_OWORD *)(v6 + 56) = 0u;
  *(_OWORD *)(v6 + 72) = 0u;
  *(_OWORD *)(v6 + 81) = 0u;
  *((void *)v6 + 3) = &unk_26C5FB810;
  *((void *)v6 + 4) = 850045863;
  uint64_t v9 = (void *)MEMORY[0x263EF8348];
  if (!v3) {
    uint64_t v9 = (void *)MEMORY[0x263EF8358];
  }
  *((void *)v6 + 13) = *v9;
  size_t v10 = strlen((const char *)this);
  if (v10 >= 0x7FFFFFFFFFFFFFF8) {
    abort();
  }
  size_t v11 = v10;
  if (v10 >= 0x17)
  {
    uint64_t v13 = (v10 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v10 | 7) != 0x17) {
      uint64_t v13 = v10 | 7;
    }
    uint64_t v14 = v13 + 1;
    unsigned int v12 = operator new(v13 + 1);
    *(void *)(v7 + 120) = v11;
    *(void *)(v7 + 128) = v14 | 0x8000000000000000;
    *(void *)(v7 + 112) = v12;
  }
  else
  {
    unsigned int v12 = (void *)(v7 + 112);
    *(unsigned char *)(v7 + 135) = v10;
    if (!v10) {
      goto LABEL_11;
    }
  }
  memcpy(v12, this, v11);
LABEL_11:
  *((unsigned char *)v12 + v11) = 0;
  result.n128_u64[0] = v8;
  result.n128_u64[1] = v7;
  *a3 = result;
  return result;
}

void sub_215443D78(uint64_t a1)
{
  if (*(char *)(a1 + 135) < 0) {
    operator delete(*(void **)(a1 + 112));
  }
  *(void *)(a1 + 24) = &unk_26C5FBE78;
  std::mutex::~mutex((std::mutex *)(a1 + 32));
}

void sub_215443DDC(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C5FC3C8;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x2166B9890);
}

void sub_215443E30(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C5FC3C8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

cva::FileTarget *cva::FileTarget::FileTarget(cva::FileTarget *this, const char *__filename, int a3, int a4)
{
  char v5 = a3;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *(_OWORD *)((char *)this + 57) = 0u;
  *(void *)this = &unk_26C5FB350;
  *((void *)this + 1) = 850045863;
  if (a3) {
    unint64_t v8 = "a";
  }
  else {
    unint64_t v8 = "w";
  }
  uint64_t v9 = fopen(__filename, v8);
  *((void *)this + 10) = v9;
  *((unsigned char *)this + 88) = a4;
  if (v9)
  {
    if ((v5 & 1) == 0)
    {
      time_t v13 = time(0);
      size_t v10 = (FILE *)*((void *)this + 10);
      size_t v11 = ctime(&v13);
      fprintf(v10, "-- %s", v11);
      a4 = *((unsigned __int8 *)this + 88);
    }
    if (a4) {
      fflush(*((FILE **)this + 10));
    }
  }
  return this;
}

{
  char v5;
  const char *v8;
  FILE *v9;
  FILE *v10;
  char *v11;
  time_t v13;

  char v5 = a3;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *(_OWORD *)((char *)this + 57) = 0u;
  *(void *)this = &unk_26C5FB350;
  *((void *)this + 1) = 850045863;
  if (a3) {
    unint64_t v8 = "a";
  }
  else {
    unint64_t v8 = "w";
  }
  uint64_t v9 = fopen(__filename, v8);
  *((void *)this + 10) = v9;
  *((unsigned char *)this + 88) = a4;
  if (v9)
  {
    if ((v5 & 1) == 0)
    {
      time_t v13 = time(0);
      size_t v10 = (FILE *)*((void *)this + 10);
      size_t v11 = ctime(&v13);
      fprintf(v10, "-- %s", v11);
      a4 = *((unsigned __int8 *)this + 88);
    }
    if (a4) {
      fflush(*((FILE **)this + 10));
    }
  }
  return this;
}

FILE *cva::Logger::makeFileTarget@<X0>(cva::Logger *this@<X0>, const char *a2@<X1>, int a3@<W2>, void *a4@<X8>)
{
  int v5 = (int)a2;
  unint64_t v8 = (char *)operator new(0x78uLL);
  *((void *)v8 + 1) = 0;
  *((void *)v8 + 2) = 0;
  *(void *)unint64_t v8 = &unk_26C5FC320;
  *(_OWORD *)(v8 + 40) = 0u;
  *(_OWORD *)(v8 + 56) = 0u;
  *(_OWORD *)(v8 + 72) = 0u;
  *(_OWORD *)(v8 + 81) = 0u;
  *((void *)v8 + 3) = &unk_26C5FB350;
  *((void *)v8 + 4) = 850045863;
  if (v5) {
    uint64_t v9 = "a";
  }
  else {
    uint64_t v9 = "w";
  }
  __n128 result = fopen((const char *)this, v9);
  *((void *)v8 + 13) = result;
  v8[112] = a3;
  if (result)
  {
    if ((v5 & 1) == 0)
    {
      time_t v13 = time(0);
      size_t v11 = (FILE *)*((void *)v8 + 13);
      unsigned int v12 = ctime(&v13);
      __n128 result = (FILE *)fprintf(v11, "-- %s", v12);
      a3 = v8[112];
    }
    if (a3) {
      __n128 result = (FILE *)fflush(*((FILE **)v8 + 13));
    }
  }
  *a4 = v8 + 24;
  a4[1] = v8;
  return result;
}

void sub_21544418C(uint64_t a1)
{
  uint64_t v2 = *(FILE **)(a1 + 104);
  if (v2)
  {
    fflush(v2);
    fclose(*(FILE **)(a1 + 104));
  }
  *(void *)(a1 + 24) = &unk_26C5FBE78;
  std::mutex::~mutex((std::mutex *)(a1 + 32));
}

void sub_2154441F4(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C5FC320;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x2166B9890);
}

void sub_215444248(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C5FC320;
  std::__shared_weak_count::~__shared_weak_count(this);
}

uint64_t cva::OsLogTarget::getOsLogType(unsigned int a1)
{
  unint64_t v1 = 0x1110000102uLL >> (8 * a1);
  if (a1 >= 6) {
    LOBYTE(v1) = 2;
  }
  return v1;
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x270EE47C8](allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x270EE4838]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x270EE4930](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x270EE4948]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x270EE4968](theDict, key, value);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x270EE4C58]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x270EE4D10](allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateWithStream(CFAllocatorRef allocator, CFReadStreamRef stream, CFIndex streamLength, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x270EE4D48](allocator, stream, streamLength, options, format, error);
}

void CFReadStreamClose(CFReadStreamRef stream)
{
}

CFReadStreamRef CFReadStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFReadStreamRef)MEMORY[0x270EE4D90](alloc, fileURL);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return MEMORY[0x270EE4DB8](stream);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

void CFShow(CFTypeRef obj)
{
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithCStringNoCopy(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x270EE50F0](alloc, cStr, *(void *)&encoding, contentsDeallocator);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x270EE53F0](allocator, filePath, pathStyle, isDirectory);
}

CGColorSpaceRef CGColorSpaceCreateDeviceGray(void)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C60]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C68]();
}

size_t CGColorSpaceGetNumberOfComponents(CGColorSpaceRef space)
{
  return MEMORY[0x270EE5D18](space);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

CFDataRef CGDataProviderCopyData(CGDataProviderRef provider)
{
  return (CFDataRef)MEMORY[0x270EE62B8](provider);
}

CGDataProviderRef CGDataProviderCreateWithData(void *info, const void *data, size_t size, CGDataProviderReleaseDataCallback releaseData)
{
  return (CGDataProviderRef)MEMORY[0x270EE62E0](info, data, size, releaseData);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x270EE6738](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, *(void *)&bitmapInfo, provider);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithURL(CFURLRef url, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x270EF4F38](url, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x270EF4F48](idst);
}

CGImageAlphaInfo CGImageGetAlphaInfo(CGImageRef image)
{
  return MEMORY[0x270EE6778](image);
}

CGBitmapInfo CGImageGetBitmapInfo(CGImageRef image)
{
  return MEMORY[0x270EE6780](image);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x270EE6790](image);
}

size_t CGImageGetBitsPerPixel(CGImageRef image)
{
  return MEMORY[0x270EE67A0](image);
}

size_t CGImageGetBytesPerRow(CGImageRef image)
{
  return MEMORY[0x270EE67C0](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x270EE67D8](image);
}

CGDataProviderRef CGImageGetDataProvider(CGImageRef image)
{
  return (CGDataProviderRef)MEMORY[0x270EE67E8](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x270EE6800](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x270EE6868](image);
}

void CGImageRelease(CGImageRef image)
{
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x270EF5018](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x270EF5040](url, options);
}

CVReturn CVMetalTextureCacheCreate(CFAllocatorRef allocator, CFDictionaryRef cacheAttributes, id metalDevice, CFDictionaryRef textureAttributes, CVMetalTextureCacheRef *cacheOut)
{
  return MEMORY[0x270EEA0E0](allocator, cacheAttributes, metalDevice, textureAttributes, cacheOut);
}

CVReturn CVMetalTextureCacheCreateTextureFromImage(CFAllocatorRef allocator, CVMetalTextureCacheRef textureCache, CVImageBufferRef sourceImage, CFDictionaryRef textureAttributes, MTLPixelFormat pixelFormat, size_t width, size_t height, size_t planeIndex, CVMetalTextureRef *textureOut)
{
  return MEMORY[0x270EEA0F0](allocator, textureCache, sourceImage, textureAttributes, pixelFormat, width, height, planeIndex);
}

id CVMetalTextureGetTexture(CVMetalTextureRef image)
{
  return (id)MEMORY[0x270EEA110](image);
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x270EEA150](allocator, width, height, *(void *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

CVReturn CVPixelBufferCreateWithBytes(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, void *baseAddress, size_t bytesPerRow, CVPixelBufferReleaseBytesCallback releaseCallback, void *releaseRefCon, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x270EEA168](allocator, width, height, *(void *)&pixelFormatType, baseAddress, bytesPerRow, releaseCallback, releaseRefCon);
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x270EEA190](pixelBuffer);
}

void *__cdecl CVPixelBufferGetBaseAddressOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return (void *)MEMORY[0x270EEA1A0](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA1B0](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRowOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x270EEA1C8](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA1E8](pixelBuffer);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA218](pixelBuffer);
}

size_t CVPixelBufferGetPlaneCount(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA220](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA240](pixelBuffer);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x270EEA260](pixelBuffer, lockFlags);
}

CVReturn CVPixelBufferPoolCreate(CFAllocatorRef allocator, CFDictionaryRef poolAttributes, CFDictionaryRef pixelBufferAttributes, CVPixelBufferPoolRef *poolOut)
{
  return MEMORY[0x270EEA278](allocator, poolAttributes, pixelBufferAttributes, poolOut);
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x270EEA330](pixelBuffer, unlockFlags);
}

CFDictionaryRef CVPixelFormatDescriptionCreateWithPixelFormatType(CFAllocatorRef allocator, OSType pixelFormat)
{
  return (CFDictionaryRef)MEMORY[0x270EEA340](allocator, *(void *)&pixelFormat);
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x270EF5E20]();
}

void NSLog(NSString *format, ...)
{
}

CFStringRef UTTypeCreatePreferredIdentifierForTag(CFStringRef inTagClass, CFStringRef inTag, CFStringRef inConformingToUTI)
{
  return (CFStringRef)MEMORY[0x270EE8580](inTagClass, inTag, inConformingToUTI);
}

int _NSGetExecutablePath(char *buf, uint32_t *bufsize)
{
  return MEMORY[0x270ED7D10](buf, bufsize);
}

void _SparseDestroyOpaqueNumeric_Double(SparseOpaqueFactorization_Double *toFree)
{
}

void _SparseDestroyOpaqueNumeric_Float(SparseOpaqueFactorization_Float *toFree)
{
}

SparseOpaqueFactorization_Double *__cdecl _SparseFactorQR_Double(SparseOpaqueFactorization_Double *__return_ptr retstr, SparseFactorization_t factorType, const SparseMatrix_Double *Matrix, const SparseSymbolicFactorOptions *sfoptions, const SparseNumericFactorOptions *nfoptions)
{
  return (SparseOpaqueFactorization_Double *)MEMORY[0x270EDE210](retstr, factorType, Matrix, sfoptions, nfoptions);
}

SparseOpaqueFactorization_Float *__cdecl _SparseFactorQR_Float(SparseOpaqueFactorization_Float *__return_ptr retstr, SparseFactorization_t factorType, const SparseMatrix_Float *Matrix, const SparseSymbolicFactorOptions *sfoptions, const SparseNumericFactorOptions *nfoptions)
{
  return (SparseOpaqueFactorization_Float *)MEMORY[0x270EDE218](retstr, factorType, Matrix, sfoptions, nfoptions);
}

SparseOpaqueFactorization_Double *__cdecl _SparseFactorSymmetric_Double(SparseOpaqueFactorization_Double *__return_ptr retstr, SparseFactorization_t factorType, const SparseMatrix_Double *Matrix, const SparseSymbolicFactorOptions *sfoptions, const SparseNumericFactorOptions *nfoptions)
{
  return (SparseOpaqueFactorization_Double *)MEMORY[0x270EDE220](retstr, factorType, Matrix, sfoptions, nfoptions);
}

SparseOpaqueFactorization_Float *__cdecl _SparseFactorSymmetric_Float(SparseOpaqueFactorization_Float *__return_ptr retstr, SparseFactorization_t factorType, const SparseMatrix_Float *Matrix, const SparseSymbolicFactorOptions *sfoptions, const SparseNumericFactorOptions *nfoptions)
{
  return (SparseOpaqueFactorization_Float *)MEMORY[0x270EDE228](retstr, factorType, Matrix, sfoptions, nfoptions);
}

SparseNumericFactorOptions *__cdecl _SparseGetOptionsFromNumericFactor_Double(SparseNumericFactorOptions *__return_ptr retstr, SparseOpaqueFactorization_Double *factor)
{
  return (SparseNumericFactorOptions *)MEMORY[0x270EDE230](retstr, factor);
}

SparseNumericFactorOptions *__cdecl _SparseGetOptionsFromNumericFactor_Float(SparseNumericFactorOptions *__return_ptr retstr, SparseOpaqueFactorization_Float *factor)
{
  return (SparseNumericFactorOptions *)MEMORY[0x270EDE238](retstr, factor);
}

SparseSymbolicFactorOptions *__cdecl _SparseGetOptionsFromSymbolicFactor(SparseSymbolicFactorOptions *__return_ptr retstr, SparseOpaqueSymbolicFactorization *factor)
{
  return (SparseSymbolicFactorOptions *)MEMORY[0x270EDE240](retstr, factor);
}

void _SparseGetWorkspaceRequired_Double(SparseSubfactor_t Subfactor, SparseOpaqueFactorization_Double *Factor, size_t *workStatic, size_t *workPerRHS)
{
}

void _SparseGetWorkspaceRequired_Float(SparseSubfactor_t Subfactor, SparseOpaqueFactorization_Float *Factor, size_t *workStatic, size_t *workPerRHS)
{
}

void _SparseMultiplySubfactor_Double(const SparseOpaqueSubfactor_Double *Subfactor, const DenseMatrix_Double *x, const DenseMatrix_Double *y, char *workspace)
{
}

void _SparseMultiplySubfactor_Float(const SparseOpaqueSubfactor_Float *Subfactor, const DenseMatrix_Float *x, const DenseMatrix_Float *y, char *workspace)
{
}

void _SparseRefactorQR_Double(const SparseMatrix_Double *Matrix, SparseOpaqueFactorization_Double *Factorization, const SparseNumericFactorOptions *nfoptions, void *workspace)
{
}

void _SparseRefactorQR_Float(const SparseMatrix_Float *Matrix, SparseOpaqueFactorization_Float *Factorization, const SparseNumericFactorOptions *nfoptions, void *workspace)
{
}

void _SparseRefactorSymmetric_Double(const SparseMatrix_Double *Matrix, SparseOpaqueFactorization_Double *Factorization, const SparseNumericFactorOptions *nfoptions, void *workspace)
{
}

void _SparseRefactorSymmetric_Float(const SparseMatrix_Float *Matrix, SparseOpaqueFactorization_Float *Factorization, const SparseNumericFactorOptions *nfoptions, void *workspace)
{
}

void _SparseRetainNumeric_Double(SparseOpaqueFactorization_Double *numericFactor)
{
}

void _SparseRetainNumeric_Float(SparseOpaqueFactorization_Float *numericFactor)
{
}

void _SparseSolveOpaque_Double(const SparseOpaqueFactorization_Double *Factored, const DenseMatrix_Double *RHS, const DenseMatrix_Double *Soln, void *workspace)
{
}

void _SparseSolveOpaque_Float(const SparseOpaqueFactorization_Float *Factored, const DenseMatrix_Float *RHS, const DenseMatrix_Float *Soln, void *workspace)
{
}

void _SparseSolveSubfactor_Double(const SparseOpaqueSubfactor_Double *Subfactor, const DenseMatrix_Double *b, const DenseMatrix_Double *x, char *workspace)
{
}

void _SparseSolveSubfactor_Float(const SparseOpaqueSubfactor_Float *Subfactor, const DenseMatrix_Float *b, const DenseMatrix_Float *x, char *workspace)
{
}

void _SparseSpMV_Double(double alpha, SparseMatrix_Double *A, DenseMatrix_Double *x, BOOL accumulate, DenseMatrix_Double *y)
{
}

void _SparseSpMV_Float(float alpha, SparseMatrix_Float *A, DenseMatrix_Float *x, BOOL accumulate, DenseMatrix_Float *y)
{
}

void _SparseTrap(void)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void cva::ItemHandler::createVector<unsigned int>()
{
  while (1)
    ;
}

void cva::imageViewFromPixelBuffer<cva::Matrix<unsigned char,3u,1u,false>>()
{
  while (1)
    ;
}

void cva::imageViewFromPixelBuffer<cva::Matrix<unsigned char,4u,1u,false>>()
{
  while (1)
    ;
}

void cva::imageViewFromPixelBuffer<unsigned char>()
{
  while (1)
    ;
}

void cva::Buffer<cva::half>::Buffer()
{
  while (1)
    ;
}

{
  while (1)
    ;
}

void cva::Buffer<cva::half>::~Buffer()
{
  while (1)
    ;
}

void cva::Buffer<float>::Buffer()
{
  while (1)
    ;
}

{
  while (1)
    ;
}

void cva::Buffer<float>::~Buffer()
{
  while (1)
    ;
}

void cva::Buffer<unsigned char>::Buffer()
{
  while (1)
    ;
}

{
  while (1)
    ;
}

void cva::Buffer<unsigned char>::~Buffer()
{
  while (1)
    ;
}

void cva::Buffer<unsigned int>::Buffer()
{
  while (1)
    ;
}

{
  while (1)
    ;
}

void cva::Buffer<unsigned int>::~Buffer()
{
  while (1)
    ;
}

void cva::Buffer<unsigned short>::Buffer()
{
  while (1)
    ;
}

{
  while (1)
    ;
}

void cva::Buffer<unsigned short>::~Buffer()
{
  while (1)
    ;
}

void cva::ItemHandler::getValue<std::string>()
{
  while (1)
    ;
}

void cva::ItemHandler::getVector<double>()
{
  while (1)
    ;
}

void cva::ItemHandler::getVector<float>()
{
  while (1)
    ;
}

void cva::ItemHandler::getVector<unsigned int>()
{
  while (1)
    ;
}

void cva::SE3GroupStorage<double,cva::Matrix<double,4u,4u,false>>::log()
{
  while (1)
    ;
}

void cva::SE3GroupStorage<float,cva::Matrix<float,4u,4u,false>>::log()
{
  while (1)
    ;
}

std::string::size_type std::string::find_first_of(const std::string *this, const std::string::value_type *__s, std::string::size_type __pos, std::string::size_type __n)
{
  return MEMORY[0x270F98218](this, __s, __pos, __n);
}

std::string::size_type std::string::find_first_not_of(const std::string *this, const std::string::value_type *__s, std::string::size_type __pos, std::string::size_type __n)
{
  return MEMORY[0x270F98220](this, __s, __pos, __n);
}

std::string::size_type std::string::rfind(const std::string *this, std::string::value_type __c, std::string::size_type __pos)
{
  return MEMORY[0x270F98240](this, __c, __pos);
}

uint64_t std::stringbuf::str()
{
  return MEMORY[0x270F98268]();
}

{
  return MEMORY[0x270F988C8]();
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

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x270F984B8](this, __s);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
}

std::string *__cdecl std::string::replace(std::string *this, std::string::size_type __pos, std::string::size_type __n1, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x270F98500](this, __pos, __n1, __s);
}

void std::string::reserve(std::string *this, std::string::size_type __requested_capacity)
{
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x270F98560](this, __str);
}

std::string *__cdecl std::string::operator=(std::string *this, std::string::value_type __c)
{
  return (std::string *)MEMORY[0x270F98568](this, __c);
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

uint64_t std::istream::get()
{
  return MEMORY[0x270F98668]();
}

uint64_t std::istream::peek()
{
  return MEMORY[0x270F98670]();
}

uint64_t std::istream::ignore()
{
  return MEMORY[0x270F986A8]();
}

uint64_t std::istream::sentry::sentry()
{
  return MEMORY[0x270F986B0]();
}

uint64_t std::istream::putback()
{
  return MEMORY[0x270F986C0]();
}

uint64_t std::istream::~istream()
{
  return MEMORY[0x270F986D0]();
}

uint64_t std::istream::operator>>()
{
  return MEMORY[0x270F986E0]();
}

{
  return MEMORY[0x270F986E8]();
}

{
  return MEMORY[0x270F986F0]();
}

{
  return MEMORY[0x270F98708]();
}

uint64_t std::ostream::put()
{
  return MEMORY[0x270F98740]();
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
  return MEMORY[0x270F98780]();
}

{
  return MEMORY[0x270F98790]();
}

{
  return MEMORY[0x270F987A0]();
}

{
  return MEMORY[0x270F987A8]();
}

{
  return MEMORY[0x270F987B0]();
}

{
  return MEMORY[0x270F987C0]();
}

{
  return MEMORY[0x270F987D0]();
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x270F98870]();
}

std::regex_traits<char>::char_class_type std::__get_classname(const char *__s, BOOL __icase)
{
  return MEMORY[0x270F98890](__s, __icase);
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

std::__shared_weak_count *__cdecl std::__shared_weak_count::lock(std::__shared_weak_count *this)
{
  return (std::__shared_weak_count *)MEMORY[0x270F989E8](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

std::string *__cdecl std::__get_collation_name(std::string *__return_ptr retstr, const char *__s)
{
  return (std::string *)MEMORY[0x270F98A00](retstr, __s);
}

void std::__libcpp_verbose_abort(const char *__format, ...)
{
}

double std::stod(const std::string *__str, size_t *__idx)
{
  MEMORY[0x270F98B68](__str, __idx);
  return result;
}

int std::stoi(const std::string *__str, size_t *__idx, int __base)
{
  return MEMORY[0x270F98B78](__str, __idx, *(void *)&__base);
}

const std::ctype_base::mask *std::ctype<char>::classic_table(void)
{
  return (const std::ctype_base::mask *)MEMORY[0x270F98B90]();
}

std::ctype<char> *__cdecl std::ctype<char>::ctype(std::ctype<char> *this, const std::ctype_base::mask *__tab, BOOL __del, size_t __refs)
{
  return (std::ctype<char> *)MEMORY[0x270F98B98](this, __tab, __del, __refs);
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

void std::locale::__install_ctor(std::locale *this, const std::locale *a2, std::locale::facet *a3, uint64_t a4)
{
}

uint64_t std::locale::id::__get(std::locale::id *this)
{
  return MEMORY[0x270F98C58](this);
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

const std::locale *__cdecl std::locale::operator=(std::locale *this, const std::locale *a2)
{
  return (const std::locale *)MEMORY[0x270F98C88](this, a2);
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
}

std::locale std::ios_base::imbue(std::ios_base *this, const std::locale *__loc)
{
  return (std::locale)MEMORY[0x270F98D58](this, __loc);
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x270F98DE8]();
}

uint64_t std::operator+<char>()
{
  return MEMORY[0x270F98E38]();
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

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x270ED7DA0](lpfunc, obj, lpdso_handle);
}

char *__cxa_demangle(const char *lpmangled, char *lpout, size_t *lpoutlen, int *lpstatus)
{
  return (char *)MEMORY[0x270F98EE8](lpmangled, lpout, lpoutlen, lpstatus);
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

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

double __exp10(double a1)
{
  MEMORY[0x270ED7DC8](a1);
  return result;
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x270ED7E28](*(void *)&a1, a2);
}

__double2 __sincos_stret(double a1)
{
  MEMORY[0x270ED7E88](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

__float2 __sincosf_stret(float a1)
{
  MEMORY[0x270ED7E90](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x270ED7F00](*(void *)&a1);
}

__darwin_ct_rune_t __toupper(__darwin_ct_rune_t a1)
{
  return MEMORY[0x270ED7F08](*(void *)&a1);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

int access(const char *a1, int a2)
{
  return MEMORY[0x270ED8480](a1, *(void *)&a2);
}

long double acos(long double __x)
{
  MEMORY[0x270ED8588](__x);
  return result;
}

float acosf(float a1)
{
  MEMORY[0x270ED8598](a1);
  return result;
}

uint64_t appleblas_dgeadd_NEWLAPACK()
{
  return MEMORY[0x270EDE2D0]();
}

uint64_t appleblas_sgeadd_NEWLAPACK()
{
  return MEMORY[0x270EDE2D8]();
}

long double asin(long double __x)
{
  MEMORY[0x270ED8610](__x);
  return result;
}

float asinf(float a1)
{
  MEMORY[0x270ED8618](a1);
  return result;
}

long double atan(long double __x)
{
  MEMORY[0x270ED86A0](__x);
  return result;
}

long double atan2(long double __y, long double __x)
{
  MEMORY[0x270ED86A8](__y, __x);
  return result;
}

float atan2f(float a1, float a2)
{
  MEMORY[0x270ED86B8](a1, a2);
  return result;
}

float atanf(float a1)
{
  MEMORY[0x270ED86C0](a1);
  return result;
}

double atof(const char *a1)
{
  MEMORY[0x270ED86E0](a1);
  return result;
}

int atoi(const char *a1)
{
  return MEMORY[0x270ED86E8](a1);
}

int backtrace(void **a1, int a2)
{
  return MEMORY[0x270ED8718](a1, *(void *)&a2);
}

char **__cdecl backtrace_symbols(void *const *a1, int a2)
{
  return (char **)MEMORY[0x270ED8730](a1, *(void *)&a2);
}

void bzero(void *a1, size_t a2)
{
}

uint64_t cblas_dgemm_NEWLAPACK()
{
  return MEMORY[0x270EDE330]();
}

uint64_t cblas_dgemv_NEWLAPACK()
{
  return MEMORY[0x270EDE340]();
}

uint64_t cblas_dger_NEWLAPACK()
{
  return MEMORY[0x270EDE350]();
}

uint64_t cblas_dsyrk_NEWLAPACK()
{
  return MEMORY[0x270EDE398]();
}

uint64_t cblas_dtrsm_NEWLAPACK()
{
  return MEMORY[0x270EDE3B8]();
}

uint64_t cblas_dtrsv_NEWLAPACK()
{
  return MEMORY[0x270EDE3C8]();
}

uint64_t cblas_sgemm_NEWLAPACK()
{
  return MEMORY[0x270EDE440]();
}

uint64_t cblas_sgemv_NEWLAPACK()
{
  return MEMORY[0x270EDE458]();
}

uint64_t cblas_sger_NEWLAPACK()
{
  return MEMORY[0x270EDE470]();
}

uint64_t cblas_ssyrk_NEWLAPACK()
{
  return MEMORY[0x270EDE4A0]();
}

uint64_t cblas_strsm_NEWLAPACK()
{
  return MEMORY[0x270EDE4B0]();
}

uint64_t cblas_strsv_NEWLAPACK()
{
  return MEMORY[0x270EDE4C0]();
}

int closedir(DIR *a1)
{
  return MEMORY[0x270ED8F30](a1);
}

long double cos(long double __x)
{
  MEMORY[0x270ED9128](__x);
  return result;
}

float cosf(float a1)
{
  MEMORY[0x270ED9130](a1);
  return result;
}

char *__cdecl ctime(const time_t *a1)
{
  return (char *)MEMORY[0x270ED9168](a1);
}

uint64_t dgbsv_NEWLAPACK()
{
  return MEMORY[0x270EDE4E8]();
}

uint64_t dgbtrf_NEWLAPACK()
{
  return MEMORY[0x270EDE4F0]();
}

uint64_t dgbtrs_NEWLAPACK()
{
  return MEMORY[0x270EDE4F8]();
}

uint64_t dgeev_NEWLAPACK()
{
  return MEMORY[0x270EDE510]();
}

uint64_t dgels_NEWLAPACK()
{
  return MEMORY[0x270EDE530]();
}

uint64_t dgelsd_NEWLAPACK()
{
  return MEMORY[0x270EDE540]();
}

uint64_t dgelss_NEWLAPACK()
{
  return MEMORY[0x270EDE548]();
}

uint64_t dgeqrf_NEWLAPACK()
{
  return MEMORY[0x270EDE558]();
}

uint64_t dgerqf_NEWLAPACK()
{
  return MEMORY[0x270EDE568]();
}

uint64_t dgesdd_NEWLAPACK()
{
  return MEMORY[0x270EDE570]();
}

uint64_t dgesv_NEWLAPACK()
{
  return MEMORY[0x270EDE580]();
}

uint64_t dgesvd_NEWLAPACK()
{
  return MEMORY[0x270EDE588]();
}

uint64_t dgetrf_NEWLAPACK()
{
  return MEMORY[0x270EDE598]();
}

uint64_t dgetri_NEWLAPACK()
{
  return MEMORY[0x270EDE5A8]();
}

uint64_t dgetrs_NEWLAPACK()
{
  return MEMORY[0x270EDE5B8]();
}

int dladdr(const void *a1, Dl_info *a2)
{
  return MEMORY[0x270ED9610](a1, a2);
}

uint64_t dorgqr_NEWLAPACK()
{
  return MEMORY[0x270EDE610]();
}

uint64_t dormqr_NEWLAPACK()
{
  return MEMORY[0x270EDE628]();
}

uint64_t dposv_NEWLAPACK()
{
  return MEMORY[0x270EDE630]();
}

uint64_t dpotrf_NEWLAPACK()
{
  return MEMORY[0x270EDE638]();
}

uint64_t dpotrs_NEWLAPACK()
{
  return MEMORY[0x270EDE650]();
}

uint64_t dpstrf_NEWLAPACK()
{
  return MEMORY[0x270EDE668]();
}

uint64_t dsyev_NEWLAPACK()
{
  return MEMORY[0x270EDE688]();
}

uint64_t dsysv_NEWLAPACK()
{
  return MEMORY[0x270EDE6A0]();
}

uint64_t dsytrf_NEWLAPACK()
{
  return MEMORY[0x270EDE6B8]();
}

uint64_t dsytrs_NEWLAPACK()
{
  return MEMORY[0x270EDE6C8]();
}

uint64_t dtrtri_NEWLAPACK()
{
  return MEMORY[0x270EDE6E8]();
}

uint64_t dtrtrs_NEWLAPACK()
{
  return MEMORY[0x270EDE6F0]();
}

int fclose(FILE *a1)
{
  return MEMORY[0x270ED98C8](a1);
}

int feof(FILE *a1)
{
  return MEMORY[0x270ED9910](a1);
}

int fflush(FILE *a1)
{
  return MEMORY[0x270ED9938](a1);
}

char *__cdecl fgets(char *a1, int a2, FILE *a3)
{
  return (char *)MEMORY[0x270ED9968](a1, *(void *)&a2, a3);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x270ED99F0](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return MEMORY[0x270ED9A18](*(void *)&a1, a2);
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

char *__cdecl getcwd(char *a1, size_t a2)
{
  return (char *)MEMORY[0x270ED9BD0](a1, a2);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x270ED9BE8](a1);
}

float logf(float a1)
{
  MEMORY[0x270EDA0F8](a1);
  return result;
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

int malloc_type_posix_memalign(void **memptr, size_t alignment, size_t size, malloc_type_id_t type_id)
{
  return MEMORY[0x270EDA398](memptr, alignment, size, type_id);
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
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

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x270EDA858](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF50](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x270EDAF58](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF60](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF70](a1);
}

int pthread_mutexattr_init(pthread_mutexattr_t *a1)
{
  return MEMORY[0x270EDAF80](a1);
}

int pthread_mutexattr_settype(pthread_mutexattr_t *a1, int a2)
{
  return MEMORY[0x270EDAF98](a1, *(void *)&a2);
}

int puts(const char *a1)
{
  return MEMORY[0x270EDB098](a1);
}

int readdir_r(DIR *a1, dirent *a2, dirent **a3)
{
  return MEMORY[0x270EDB130](a1, a2, a3);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x270EDB170](a1, a2);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
}

int rmdir(const char *a1)
{
  return MEMORY[0x270EDB268](a1);
}

uint64_t sgbsv_NEWLAPACK()
{
  return MEMORY[0x270EDE738]();
}

uint64_t sgeev_NEWLAPACK()
{
  return MEMORY[0x270EDE740]();
}

uint64_t sgels_NEWLAPACK()
{
  return MEMORY[0x270EDE758]();
}

uint64_t sgelsd_NEWLAPACK()
{
  return MEMORY[0x270EDE760]();
}

uint64_t sgelss_NEWLAPACK()
{
  return MEMORY[0x270EDE768]();
}

uint64_t sgeqrf_NEWLAPACK()
{
  return MEMORY[0x270EDE770]();
}

uint64_t sgerqf_NEWLAPACK()
{
  return MEMORY[0x270EDE788]();
}

uint64_t sgesdd_NEWLAPACK()
{
  return MEMORY[0x270EDE790]();
}

uint64_t sgesv_NEWLAPACK()
{
  return MEMORY[0x270EDE7A0]();
}

uint64_t sgesvd_NEWLAPACK()
{
  return MEMORY[0x270EDE7B0]();
}

uint64_t sgetrf_NEWLAPACK()
{
  return MEMORY[0x270EDE7C8]();
}

uint64_t sgetri_NEWLAPACK()
{
  return MEMORY[0x270EDE7D8]();
}

uint64_t sgetrs_NEWLAPACK()
{
  return MEMORY[0x270EDE7E8]();
}

long double sin(long double __x)
{
  MEMORY[0x270EDB4E8](__x);
  return result;
}

float sinf(float a1)
{
  MEMORY[0x270EDB4F0](a1);
  return result;
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

uint64_t sorgqr_NEWLAPACK()
{
  return MEMORY[0x270EDE828]();
}

uint64_t sormqr_NEWLAPACK()
{
  return MEMORY[0x270EDE840]();
}

uint64_t sposv_NEWLAPACK()
{
  return MEMORY[0x270EDE8B8]();
}

uint64_t spotrf_NEWLAPACK()
{
  return MEMORY[0x270EDE8C0]();
}

uint64_t spotrs_NEWLAPACK()
{
  return MEMORY[0x270EDE8C8]();
}

uint64_t spstrf_NEWLAPACK()
{
  return MEMORY[0x270EDE8D0]();
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x270EDB560](a1, a2);
}

uint64_t ssyev_NEWLAPACK()
{
  return MEMORY[0x270EDE8E0]();
}

uint64_t ssysv_NEWLAPACK()
{
  return MEMORY[0x270EDE8F8]();
}

uint64_t ssytrf_NEWLAPACK()
{
  return MEMORY[0x270EDE900]();
}

uint64_t ssytrs_NEWLAPACK()
{
  return MEMORY[0x270EDE910]();
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x270EDB568](a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x270EDB5A8](__s, *(void *)&__c);
}

int strerror_r(int __errnum, char *__strerrbuf, size_t __buflen)
{
  return MEMORY[0x270EDB5E8](*(void *)&__errnum, __strerrbuf, __buflen);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x270EDB680](__s, *(void *)&__c);
}

uint64_t strtri_NEWLAPACK()
{
  return MEMORY[0x270EDE928]();
}

uint64_t strtrs_NEWLAPACK()
{
  return MEMORY[0x270EDE930]();
}

long double tan(long double __x)
{
  MEMORY[0x270EDB810](__x);
  return result;
}

float tanf(float a1)
{
  MEMORY[0x270EDB818](a1);
  return result;
}

time_t time(time_t *a1)
{
  return MEMORY[0x270EDB930](a1);
}

int truncate(const char *a1, off_t a2)
{
  return MEMORY[0x270EDB978](a1, a2);
}

int unlink(const char *a1)
{
  return MEMORY[0x270EDB9A8](a1);
}

vImage_Error vImageConvert_16UToF(const vImage_Buffer *src, const vImage_Buffer *dest, float offset, float scale, vImage_Flags flags)
{
  return MEMORY[0x270EDEF50](src, dest, *(void *)&flags, offset, scale);
}

vImage_Error vImageConvert_420Yp8_CbCr8ToARGB8888(const vImage_Buffer *srcYp, const vImage_Buffer *srcCbCr, const vImage_Buffer *dest, const vImage_YpCbCrToARGB *info, const uint8_t permuteMap[4], const uint8_t alpha, vImage_Flags flags)
{
  return MEMORY[0x270EDEF70](srcYp, srcCbCr, dest, info, permuteMap, alpha, *(void *)&flags);
}

vImage_Error vImageConvert_422CbYpCrYp8ToARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, const vImage_YpCbCrToARGB *info, const uint8_t permuteMap[4], const uint8_t alpha, vImage_Flags flags)
{
  return MEMORY[0x270EDEF78](src, dest, info, permuteMap, alpha, *(void *)&flags);
}

vImage_Error vImageConvert_422YpCbYpCr8ToARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, const vImage_YpCbCrToARGB *info, const uint8_t permuteMap[4], const uint8_t alpha, vImage_Flags flags)
{
  return MEMORY[0x270EDEF80](src, dest, info, permuteMap, alpha, *(void *)&flags);
}

vImage_Error vImageConvert_ARGB8888To420Yp8_CbCr8(const vImage_Buffer *src, const vImage_Buffer *destYp, const vImage_Buffer *destCbCr, const vImage_ARGBToYpCbCr *info, const uint8_t permuteMap[4], vImage_Flags flags)
{
  return MEMORY[0x270EDEF88](src, destYp, destCbCr, info, permuteMap, *(void *)&flags);
}

vImage_Error vImageConvert_ARGB8888To422YpCbYpCr8(const vImage_Buffer *src, const vImage_Buffer *dest, const vImage_ARGBToYpCbCr *info, const uint8_t permuteMap[4], vImage_Flags flags)
{
  return MEMORY[0x270EDEF98](src, dest, info, permuteMap, *(void *)&flags);
}

vImage_Error vImageConvert_ARGB8888toPlanar8(const vImage_Buffer *srcARGB, const vImage_Buffer *destA, const vImage_Buffer *destR, const vImage_Buffer *destG, const vImage_Buffer *destB, vImage_Flags flags)
{
  return MEMORY[0x270EDEFA0](srcARGB, destA, destR, destG, destB, *(void *)&flags);
}

vImage_Error vImageConvert_ARGB8888toPlanarF(const vImage_Buffer *src, const vImage_Buffer *alpha, const vImage_Buffer *red, const vImage_Buffer *green, const vImage_Buffer *blue, const Pixel_FFFF maxFloat, const Pixel_FFFF minFloat, vImage_Flags flags)
{
  return MEMORY[0x270EDEFA8](src, alpha, red, green, blue, maxFloat, minFloat, *(void *)&flags);
}

vImage_Error vImageConvert_ARGB8888toRGB888(const vImage_Buffer *a1, const vImage_Buffer *a2, vImage_Flags a3)
{
  return MEMORY[0x270EDEFB0](a1, a2, *(void *)&a3);
}

vImage_Error vImageConvert_ARGBToYpCbCr_GenerateConversion(const vImage_ARGBToYpCbCrMatrix *matrix, const vImage_YpCbCrPixelRange *pixelRange, vImage_ARGBToYpCbCr *outInfo, vImageARGBType inARGBType, vImageYpCbCrType outYpCbCrType, vImage_Flags flags)
{
  return MEMORY[0x270EDEFE0](matrix, pixelRange, outInfo, *(void *)&inARGBType, *(void *)&outYpCbCrType, *(void *)&flags);
}

vImage_Error vImageConvert_BGRA8888toRGB888(const vImage_Buffer *a1, const vImage_Buffer *a2, vImage_Flags a3)
{
  return MEMORY[0x270EDEFF0](a1, a2, *(void *)&a3);
}

vImage_Error vImageConvert_ChunkyToPlanar8(const void *srcChannels[], const vImage_Buffer *destPlanarBuffers[], unsigned int channelCount, size_t srcStrideBytes, vImagePixelCount srcWidth, vImagePixelCount srcHeight, size_t srcRowBytes, vImage_Flags flags)
{
  return MEMORY[0x270EDEFF8](srcChannels, destPlanarBuffers, *(void *)&channelCount, srcStrideBytes, srcWidth, srcHeight, srcRowBytes, *(void *)&flags);
}

vImage_Error vImageConvert_ChunkyToPlanarF(const void *srcChannels[], const vImage_Buffer *destPlanarBuffers[], unsigned int channelCount, size_t srcStrideBytes, vImagePixelCount srcWidth, vImagePixelCount srcHeight, size_t srcRowBytes, vImage_Flags flags)
{
  return MEMORY[0x270EDF008](srcChannels, destPlanarBuffers, *(void *)&channelCount, srcStrideBytes, srcWidth, srcHeight, srcRowBytes, *(void *)&flags);
}

vImage_Error vImageConvert_FTo16U(const vImage_Buffer *src, const vImage_Buffer *dest, float offset, float scale, vImage_Flags flags)
{
  return MEMORY[0x270EDF010](src, dest, *(void *)&flags, offset, scale);
}

vImage_Error vImageConvert_Planar16UtoPlanar8_dithered(const vImage_Buffer *src, const vImage_Buffer *dest, int dither, vImage_Flags flags)
{
  return MEMORY[0x270EDF028](src, dest, *(void *)&dither, *(void *)&flags);
}

vImage_Error vImageConvert_Planar8To16U(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x270EDF030](src, dest, *(void *)&flags);
}

vImage_Error vImageConvert_Planar8toARGB8888(const vImage_Buffer *srcA, const vImage_Buffer *srcR, const vImage_Buffer *srcG, const vImage_Buffer *srcB, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x270EDF078](srcA, srcR, srcG, srcB, dest, *(void *)&flags);
}

vImage_Error vImageConvert_Planar8toPlanarF(const vImage_Buffer *src, const vImage_Buffer *dest, Pixel_F maxFloat, Pixel_F minFloat, vImage_Flags flags)
{
  return MEMORY[0x270EDF090](src, dest, *(void *)&flags, maxFloat, minFloat);
}

vImage_Error vImageConvert_Planar8toRGB888(const vImage_Buffer *planarRed, const vImage_Buffer *planarGreen, const vImage_Buffer *planarBlue, const vImage_Buffer *rgbDest, vImage_Flags flags)
{
  return MEMORY[0x270EDF0A0](planarRed, planarGreen, planarBlue, rgbDest, *(void *)&flags);
}

vImage_Error vImageConvert_PlanarFToARGB8888(const vImage_Buffer *alpha, const vImage_Buffer *red, const vImage_Buffer *green, const vImage_Buffer *blue, const vImage_Buffer *dest, const Pixel_FFFF maxFloat, const Pixel_FFFF minFloat, vImage_Flags flags)
{
  return MEMORY[0x270EDF0A8](alpha, red, green, blue, dest, maxFloat, minFloat, *(void *)&flags);
}

vImage_Error vImageConvert_PlanarFtoPlanar8(const vImage_Buffer *src, const vImage_Buffer *dest, Pixel_F maxFloat, Pixel_F minFloat, vImage_Flags flags)
{
  return MEMORY[0x270EDF0F8](src, dest, *(void *)&flags, maxFloat, minFloat);
}

vImage_Error vImageConvert_RGB888toARGB8888(const vImage_Buffer *a1, const vImage_Buffer *a2, Pixel_8 a3, const vImage_Buffer *a4, BOOL a5, vImage_Flags a6)
{
  return MEMORY[0x270EDF108](a1, a2, a3, a4, a5, *(void *)&a6);
}

vImage_Error vImageConvert_RGB888toBGRA8888(const vImage_Buffer *a1, const vImage_Buffer *a2, Pixel_8 a3, const vImage_Buffer *a4, BOOL a5, vImage_Flags a6)
{
  return MEMORY[0x270EDF110](a1, a2, a3, a4, a5, *(void *)&a6);
}

vImage_Error vImageConvert_RGB888toPlanar8(const vImage_Buffer *rgbSrc, const vImage_Buffer *redDest, const vImage_Buffer *greenDest, const vImage_Buffer *blueDest, vImage_Flags flags)
{
  return MEMORY[0x270EDF118](rgbSrc, redDest, greenDest, blueDest, *(void *)&flags);
}

vImage_Error vImageConvert_RGB888toRGBA8888(const vImage_Buffer *a1, const vImage_Buffer *a2, Pixel_8 a3, const vImage_Buffer *a4, BOOL a5, vImage_Flags a6)
{
  return MEMORY[0x270EDF120](a1, a2, a3, a4, a5, *(void *)&a6);
}

vImage_Error vImageConvert_RGBA8888toRGB888(const vImage_Buffer *a1, const vImage_Buffer *a2, vImage_Flags a3)
{
  return MEMORY[0x270EDF128](a1, a2, *(void *)&a3);
}

vImage_Error vImageConvert_YpCbCrToARGB_GenerateConversion(const vImage_YpCbCrToARGBMatrix *matrix, const vImage_YpCbCrPixelRange *pixelRange, vImage_YpCbCrToARGB *outInfo, vImageYpCbCrType inYpCbCrType, vImageARGBType outARGBType, vImage_Flags flags)
{
  return MEMORY[0x270EDF140](matrix, pixelRange, outInfo, *(void *)&inYpCbCrType, *(void *)&outARGBType, *(void *)&flags);
}

vImage_Error vImageMatrixMultiply_ARGB8888ToPlanar8(const vImage_Buffer *src, const vImage_Buffer *dest, const int16_t matrix[4], int32_t divisor, const int16_t pre_bias[4], int32_t post_bias, vImage_Flags flags)
{
  return MEMORY[0x270EDF240](src, dest, matrix, *(void *)&divisor, pre_bias, *(void *)&post_bias, *(void *)&flags);
}

vImage_Error vImageOverwriteChannelsWithScalar_ARGB8888(Pixel_8 scalar, const vImage_Buffer *src, const vImage_Buffer *dest, uint8_t copyMask, vImage_Flags flags)
{
  return MEMORY[0x270EDF250](scalar, src, dest, copyMask, *(void *)&flags);
}

vImage_Error vImageOverwriteChannels_ARGB8888(const vImage_Buffer *newSrc, const vImage_Buffer *origSrc, const vImage_Buffer *dest, uint8_t copyMask, vImage_Flags flags)
{
  return MEMORY[0x270EDF258](newSrc, origSrc, dest, copyMask, *(void *)&flags);
}

vImage_Error vImageScale_ARGB16S(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImage_Flags flags)
{
  return MEMORY[0x270EDF318](src, dest, tempBuffer, *(void *)&flags);
}

vImage_Error vImageScale_ARGB16U(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImage_Flags flags)
{
  return MEMORY[0x270EDF320](src, dest, tempBuffer, *(void *)&flags);
}

vImage_Error vImageScale_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImage_Flags flags)
{
  return MEMORY[0x270EDF328](src, dest, tempBuffer, *(void *)&flags);
}

vImage_Error vImageScale_ARGBFFFF(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImage_Flags flags)
{
  return MEMORY[0x270EDF340](src, dest, tempBuffer, *(void *)&flags);
}

vImage_Error vImageScale_Planar16S(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImage_Flags flags)
{
  return MEMORY[0x270EDF370](src, dest, tempBuffer, *(void *)&flags);
}

vImage_Error vImageScale_Planar16U(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImage_Flags flags)
{
  return MEMORY[0x270EDF378](src, dest, tempBuffer, *(void *)&flags);
}

vImage_Error vImageScale_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImage_Flags flags)
{
  return MEMORY[0x270EDF380](src, dest, tempBuffer, *(void *)&flags);
}

vImage_Error vImageScale_PlanarF(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImage_Flags flags)
{
  return MEMORY[0x270EDF390](src, dest, tempBuffer, *(void *)&flags);
}

int vfprintf(FILE *a1, const char *a2, va_list a3)
{
  return MEMORY[0x270EDBA70](a1, a2, a3);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x270EDBB18](__str, __size, __format, a4);
}