uint64_t lacc::ELFLoader::arch_version(lacc::ELFLoader *this)
{
  uint64_t result;
  void *v2;
  void *v3;

  result = *(unsigned int *)(*(void *)(*(void *)this + 32) + 36);
  if (result != 1 && result != 2)
  {
    v2 = sub_25442E680();
    v3 = (void *)v2[4];
    if (v2[3] - (void)v3 > 0x60uLL)
    {
      qmemcpy(v3, "Warning: running old, un-versioned binary on new simulator. Defaulting to simulator LACC V1 ISA.\n", 97);
      v2[4] += 97;
    }
    else
    {
      sub_25442D960((uint64_t)v2, "Warning: running old, un-versioned binary on new simulator. Defaulting to simulator LACC V1 ISA.\n", 0x61uLL);
    }
    return 1;
  }
  return result;
}

void lacc::ELFLoader::open(uint64_t a1@<X8>)
{
  v2 = (std::__shared_weak_count *)operator new(0x50uLL);
  v2->__shared_owners_ = 0;
  p_shared_owners = &v2->__shared_owners_;
  v2->__shared_weak_owners_ = 0;
  v2[1].std::__shared_count = 0u;
  v2->__vftable = (std::__shared_weak_count_vtbl *)&unk_2703CF790;
  *(_OWORD *)&v2[1].__shared_weak_owners_ = 0u;
  *(_OWORD *)&v2[2].__shared_owners_ = 0u;
  v2[3].__vftable = 0;
  v8[1] = v2 + 1;
  v8[2] = v2;
  sub_25441EA14((uint64_t)&v2[1], v8);
  if (!v8[0])
  {
    atomic_fetch_add_explicit(&v2->__shared_owners_, 1uLL, memory_order_relaxed);
    *(void *)a1 = v2 + 1;
    *(void *)(a1 + 8) = v2;
    *(unsigned char *)(a1 + 16) = 1;
    if (atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL)) {
      return;
    }
LABEL_9:
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
    return;
  }
  uint64_t v7 = v8[0];
  v8[0] = 0;
  v4 = sub_25442E680();
  __int16 v6 = 257;
  sub_2544286AC(&v7, (uint64_t)v4, v5);
  if (v7) {
    (*(void (**)(uint64_t))(*(void *)v7 + 8))(v7);
  }
  *(unsigned char *)a1 = 0;
  *(unsigned char *)(a1 + 16) = 0;
  if (v8[0]) {
    (*(void (**)(void))(*(void *)v8[0] + 8))(v8[0]);
  }
  if (!atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL)) {
    goto LABEL_9;
  }
}

void sub_25441E9B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  sub_25441EE8C((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_25441E9C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  if (a8) {
    sub_25442EF24();
  }
  if (a9) {
    (*(void (**)(uint64_t))(*(void *)a9 + 8))(a9);
  }
  sub_25441EE8C((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_25441EA14@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 24))
  {
    v11 = "only one call to .open() supported";
    __int16 v12 = 259;
    operator new();
  }
  __int16 v12 = 260;
  v11 = (const char *)MEMORY[0x25A278D10]();
  sub_25442A180((unsigned __int8 *)&v11, 1, 0, 0, (uint64_t)&v15);
  if (v16)
  {
    uint64_t result = sub_254428AA0(v15, a2);
  }
  else
  {
    uint64_t v4 = v15;
    uint64_t v15 = 0;
    uint64_t v5 = *(void *)(a1 + 24);
    *(void *)(a1 + 24) = v4;
    if (v5)
    {
      (*(void (**)(uint64_t))(*(void *)v5 + 8))(v5);
      uint64_t v4 = *(void *)(a1 + 24);
    }
    uint64_t v6 = *(void *)(v4 + 8);
    unint64_t v7 = *(void *)(v4 + 16) - v6;
    if (v7 < 0x10 || (*(unsigned char *)(v6 + 4) == 1 ? (BOOL v8 = *(unsigned char *)(v6 + 5) == 1) : (BOOL v8 = 0), !v8)) {
      operator new();
    }
    uint64_t result = sub_25441FF6C(v6, v7, (uint64_t)&v13);
    if (v14)
    {
      *a2 = v13;
    }
    else
    {
      int v10 = *(unsigned __int8 *)(a1 + 48);
      *(_OWORD *)(a1 + 32) = v13;
      if (!v10) {
        *(unsigned char *)(a1 + 48) = 1;
      }
      if (**(_DWORD **)(a1 + 32) != 1179403647) {
        operator new();
      }
      *a2 = 0;
    }
  }
  if ((v16 & 1) == 0)
  {
    uint64_t result = v15;
    uint64_t v15 = 0;
    if (result) {
      return (*(uint64_t (**)(uint64_t))(*(void *)result + 8))(result);
    }
  }
  return result;
}

void sub_25441ED78(_Unwind_Exception *a1)
{
  MEMORY[0x25A278F10](v1, 0x10F3C401C2224D9);
  if (*(unsigned char *)(v2 - 56))
  {
    uint64_t v4 = *(void *)(v2 - 72);
    *(void *)(v2 - 72) = 0;
    if (v4) {
      (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
    }
  }
  if ((*(unsigned char *)(v2 - 32) & 1) == 0)
  {
    uint64_t v5 = *(void *)(v2 - 48);
    *(void *)(v2 - 48) = 0;
    if (v5)
    {
      (*(void (**)(uint64_t))(*(void *)v5 + 8))(v5);
      _Unwind_Resume(a1);
    }
  }
  _Unwind_Resume(a1);
}

uint64_t sub_25441EE8C(uint64_t result)
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

BOOL lacc::ELFLoader::load(const void ***a1, uint64_t a2)
{
  sub_25441EFE0(*a1, a2, &v8);
  uint64_t v2 = v8;
  if (v8)
  {
    uint64_t v7 = v8;
    uint64_t v8 = 0;
    v3 = sub_25442E680();
    __int16 v6 = 257;
    sub_2544286AC(&v7, (uint64_t)v3, v5);
    if (v7) {
      (*(void (**)(uint64_t))(*(void *)v7 + 8))(v7);
    }
    if (v8) {
      (*(void (**)(uint64_t))(*(void *)v8 + 8))(v8);
    }
  }
  return v2 == 0;
}

void sub_25441EFC0(_Unwind_Exception *a1)
{
  if (*(void *)(v1 - 32)) {
    sub_25442EF24();
  }
  sub_25442EF58((uint64_t *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_25441EFE0(const void **a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v83 = *MEMORY[0x263EF8340];
  if (!*((unsigned char *)a1 + 48))
  {
    __dst = (void **)"call .open() before trying to .load()";
    __int16 v70 = 259;
    operator new();
  }
  __int16 v6 = a1 + 4;
  (**(void (***)(uint64_t))a2)(a2);
  sub_254420098(v6, (uint64_t)&v80);
  if (v82)
  {
    int v46 = 0;
    uint64_t v47 = v80;
    uint64_t v80 = 0;
    *a3 = v47;
    if (v82) {
      goto LABEL_108;
    }
    goto LABEL_110;
  }
  if (!v81)
  {
LABEL_100:
    int v46 = 1;
    if (v82) {
      goto LABEL_108;
    }
    goto LABEL_110;
  }
  uint64_t v7 = v80;
  uint64_t v8 = v80 + 40 * v81;
  v61 = a3;
  uint64_t v62 = v8;
  while (1)
  {
    __dst = (void **)sub_254420484;
    sub_254420294(v6, (unsigned int *)v7, (void (*)(uint64_t *__return_ptr, uint64_t, void ***))sub_2544228A0, (uint64_t)&__dst, (uint64_t)&__src);
    if (v79)
    {
      v48 = __src;
      __src = 0;
      goto LABEL_103;
    }
    if ((*(unsigned char *)(v7 + 8) & 2) != 0) {
      break;
    }
LABEL_94:
    if (v79)
    {
      v45 = __src;
      __src = 0;
      if (v45) {
        (*(void (**)(void *))(*(void *)v45 + 8))(v45);
      }
    }
    v7 += 40;
    if (v7 == v8) {
      goto LABEL_100;
    }
  }
  int v9 = *(_DWORD *)(v7 + 4);
  if (v9 == 8)
  {
    int v10 = __src;
    if (!__src)
    {
      __dst = 0;
      size_t v67 = 0;
      p_dst = &__dst;
      int64_t v68 = 0;
LABEL_23:
      char v16 = (*(uint64_t (**)(uint64_t, void ***, void, void))(*(void *)a2 + 24))(a2, p_dst, *(unsigned int *)(v7 + 12), *(unsigned int *)(v7 + 20));
      if (SHIBYTE(v68) < 0) {
        operator delete(__dst);
      }
      if ((v16 & 1) == 0)
      {
        int v54 = *((char *)a1 + 23);
        if (v54 >= 0) {
          size_t v55 = *((unsigned __int8 *)a1 + 23);
        }
        else {
          size_t v55 = (size_t)a1[1];
        }
        unint64_t v56 = v55 + 24;
        if (v55 + 24 > 0x7FFFFFFFFFFFFFF7) {
          sub_254422888();
        }
        if (v56 <= 0x16)
        {
          size_t v75 = 0;
          unint64_t v76 = 0;
          v74 = 0;
          v57 = &v74;
          HIBYTE(v76) = v55 + 24;
          goto LABEL_129;
        }
        uint64_t v58 = (v56 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v56 | 7) != 0x17) {
          uint64_t v58 = v56 | 7;
        }
        uint64_t v59 = v58 + 1;
        v57 = operator new(v58 + 1);
        size_t v75 = v55 + 24;
        unint64_t v76 = v59 | 0x8000000000000000;
        v74 = v57;
        if (v55)
        {
LABEL_129:
          if (v54 >= 0) {
            v60 = a1;
          }
          else {
            v60 = *a1;
          }
          memmove(v57, v60, v55);
        }
        strcpy((char *)v57 + v55, ": error loading section ");
        __dst = &v74;
        int64_t v68 = (int64_t)__src;
        size_t v69 = __len;
        __int16 v70 = 1284;
        operator new();
      }
      int v9 = *(_DWORD *)(v7 + 4);
      goto LABEL_27;
    }
    size_t v11 = __len;
    if (__len > 0x7FFFFFFFFFFFFFF7) {
      sub_254422888();
    }
    if (__len >= 0x17)
    {
      size_t v14 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((__len | 7) != 0x17) {
        size_t v14 = __len | 7;
      }
      size_t v15 = v14 + 1;
      __int16 v12 = (void ***)operator new(v14 + 1);
      size_t v67 = v11;
      int64_t v68 = v15 | 0x8000000000000000;
      __dst = (void **)v12;
      a3 = v61;
    }
    else
    {
      HIBYTE(v68) = __len;
      __int16 v12 = &__dst;
      if (!__len) {
        goto LABEL_19;
      }
    }
    memmove(v12, v10, v11);
LABEL_19:
    *((unsigned char *)v12 + v11) = 0;
    if (v68 >= 0) {
      p_dst = &__dst;
    }
    else {
      p_dst = (void ***)__dst;
    }
    uint64_t v8 = v62;
    goto LABEL_23;
  }
LABEL_27:
  if (v9 != 1) {
    goto LABEL_94;
  }
  sub_2544228AC(v6, v7, (uint64_t)&v74);
  if ((v76 & 1) == 0)
  {
    sub_254420510(v6, (uint64_t)&v71);
    if (v73)
    {
      char v24 = 0;
      uint64_t v25 = v71;
      uint64_t v71 = 0;
      *a3 = v25;
      if ((v73 & 1) == 0) {
        goto LABEL_90;
      }
      goto LABEL_88;
    }
    unsigned int v17 = *(_DWORD *)(v7 + 12);
    if (v72)
    {
      uint64_t v18 = 0;
      while (1)
      {
        if (*(_DWORD *)(v71 + v18) == 1 && *(_DWORD *)(v71 + v18 + 4) == *(_DWORD *)(v7 + 16))
        {
          unsigned int v19 = *(_DWORD *)(v71 + v18 + 8);
          if (v17 >= v19 && *(_DWORD *)(v71 + v18 + 20) + v19 > v17) {
            break;
          }
        }
        v18 += 32;
        if (32 * v72 == v18) {
          goto LABEL_38;
        }
      }
      unsigned int v17 = v17 - v19 + *(_DWORD *)(v71 + v18 + 12);
    }
LABEL_38:
    uint64_t v20 = v17;
    if ((*(unsigned char *)(v7 + 8) & 4) == 0)
    {
      v21 = __src;
      if (!__src)
      {
        __dst = 0;
        size_t v67 = 0;
        v29 = &__dst;
        int64_t v68 = 0;
        uint64_t v8 = v62;
        goto LABEL_61;
      }
      size_t v22 = __len;
      if (__len > 0x7FFFFFFFFFFFFFF7) {
        sub_254422888();
      }
      if (__len >= 0x17)
      {
        size_t v31 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((__len | 7) != 0x17) {
          size_t v31 = __len | 7;
        }
        size_t v32 = v31 + 1;
        v23 = (void ***)operator new(v31 + 1);
        size_t v67 = v22;
        int64_t v68 = v32 | 0x8000000000000000;
        __dst = (void **)v23;
      }
      else
      {
        HIBYTE(v68) = __len;
        v23 = &__dst;
        if (!__len) {
          goto LABEL_57;
        }
      }
      memmove(v23, v21, v22);
LABEL_57:
      *((unsigned char *)v23 + v22) = 0;
      if (v68 >= 0) {
        v29 = &__dst;
      }
      else {
        v29 = (void ***)__dst;
      }
      a3 = v61;
      uint64_t v8 = v62;
LABEL_61:
      char v33 = (*(uint64_t (**)(uint64_t, void ***, void, size_t, void *, uint64_t))(*(void *)a2 + 8))(a2, v29, *(unsigned int *)(v7 + 12), v75, v74, v20);
      if (SHIBYTE(v68) < 0) {
        goto LABEL_62;
      }
      goto LABEL_86;
    }
    v26 = __src;
    if (!__src)
    {
      __dst = 0;
      size_t v67 = 0;
      v30 = &__dst;
      int64_t v68 = 0;
      uint64_t v8 = v62;
      goto LABEL_85;
    }
    size_t v27 = __len;
    if (__len > 0x7FFFFFFFFFFFFFF7) {
      sub_254422888();
    }
    if (__len >= 0x17)
    {
      size_t v41 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((__len | 7) != 0x17) {
        size_t v41 = __len | 7;
      }
      size_t v42 = v41 + 1;
      v28 = (void ***)operator new(v41 + 1);
      size_t v67 = v27;
      int64_t v68 = v42 | 0x8000000000000000;
      __dst = (void **)v28;
    }
    else
    {
      HIBYTE(v68) = __len;
      v28 = &__dst;
      if (!__len) {
        goto LABEL_81;
      }
    }
    memmove(v28, v26, v27);
LABEL_81:
    *((unsigned char *)v28 + v27) = 0;
    if (v68 >= 0) {
      v30 = &__dst;
    }
    else {
      v30 = (void ***)__dst;
    }
    a3 = v61;
    uint64_t v8 = v62;
LABEL_85:
    char v33 = (*(uint64_t (**)(uint64_t, void ***, void, size_t, void *, uint64_t))(*(void *)a2 + 16))(a2, v30, *(unsigned int *)(v7 + 12), v75, v74, v20);
    if (SHIBYTE(v68) < 0)
    {
LABEL_62:
      operator delete(__dst);
      if ((v33 & 1) == 0) {
        goto LABEL_63;
      }
      goto LABEL_87;
    }
LABEL_86:
    if ((v33 & 1) == 0)
    {
LABEL_63:
      int v34 = *((char *)a1 + 23);
      if (v34 >= 0) {
        size_t v35 = *((unsigned __int8 *)a1 + 23);
      }
      else {
        size_t v35 = (size_t)a1[1];
      }
      unint64_t v36 = v35 + 24;
      if (v35 + 24 > 0x7FFFFFFFFFFFFFF7) {
        sub_254422888();
      }
      if (v36 <= 0x16)
      {
        size_t v64 = 0;
        unint64_t v65 = 0;
        __p = 0;
        p_p = &__p;
        HIBYTE(v65) = v35 + 24;
        goto LABEL_72;
      }
      uint64_t v38 = (v36 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v36 | 7) != 0x17) {
        uint64_t v38 = v36 | 7;
      }
      uint64_t v39 = v38 + 1;
      p_p = operator new(v38 + 1);
      size_t v64 = v35 + 24;
      unint64_t v65 = v39 | 0x8000000000000000;
      __p = p_p;
      if (v35)
      {
LABEL_72:
        if (v34 >= 0) {
          v40 = a1;
        }
        else {
          v40 = *a1;
        }
        memmove(p_p, v40, v35);
      }
      strcpy((char *)p_p + v35, ": error loading section ");
      __dst = &__p;
      int64_t v68 = (int64_t)__src;
      size_t v69 = __len;
      __int16 v70 = 1284;
      operator new();
    }
LABEL_87:
    char v24 = 1;
    if ((v73 & 1) == 0) {
      goto LABEL_90;
    }
LABEL_88:
    uint64_t v43 = v71;
    uint64_t v71 = 0;
    if (v43) {
      (*(void (**)(uint64_t))(*(void *)v43 + 8))(v43);
    }
LABEL_90:
    if (v76)
    {
      v44 = v74;
      v74 = 0;
      if (v44) {
        (*(void (**)(void *))(*(void *)v44 + 8))(v44);
      }
    }
    if ((v24 & 1) == 0) {
      goto LABEL_104;
    }
    goto LABEL_94;
  }
  v48 = v74;
LABEL_103:
  *a3 = (uint64_t)v48;
LABEL_104:
  if (v79)
  {
    v49 = __src;
    __src = 0;
    if (v49) {
      (*(void (**)(void *))(*(void *)v49 + 8))(v49);
    }
  }
  int v46 = 0;
  if (v82)
  {
LABEL_108:
    uint64_t v50 = v80;
    uint64_t v80 = 0;
    if (v50) {
      (*(void (**)(uint64_t))(*(void *)v50 + 8))(v50);
    }
  }
LABEL_110:
  if (v46)
  {
    uint64_t v51 = *(unsigned int *)(*v6 + 36);
    if (v51 != 1 && v51 != 2)
    {
      v52 = sub_25442E680();
      v53 = (void *)v52[4];
      if (v52[3] - (void)v53 > 0x60uLL)
      {
        qmemcpy(v53, "Warning: running old, un-versioned binary on new simulator. Defaulting to simulator LACC V1 ISA.\n", 97);
        v52[4] += 97;
      }
      else
      {
        sub_25442D960((uint64_t)v52, "Warning: running old, un-versioned binary on new simulator. Defaulting to simulator LACC V1 ISA.\n", 0x61uLL);
      }
      uint64_t v51 = 1;
    }
    (*(void (**)(uint64_t, uint64_t))(*(void *)a2 + 56))(a2, v51);
    *a3 = 0;
  }
}

void sub_25441F998(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, int a19, __int16 a20,char a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,void *__p,uint64_t a29,char a30,int a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  MEMORY[0x25A278F10](v35, 0x10F3C401C2224D9);
  if (SHIBYTE(a31) < 0) {
    operator delete(__p);
  }
  if ((a34 & 1) != 0 && a32) {
    (*(void (**)(uint64_t))(*(void *)a32 + 8))(a32);
  }
  if (*(unsigned char *)(v36 - 104))
  {
    uint64_t v38 = *(void *)(v36 - 120);
    *(void *)(v36 - 120) = 0;
    if (v38)
    {
      (*(void (**)(uint64_t))(*(void *)v38 + 8))(v38);
      _Unwind_Resume(a1);
    }
  }
  _Unwind_Resume(a1);
}

uint64_t lacc::ELFLoader::start(lacc::ELFLoader *this)
{
  return *(unsigned int *)(*(void *)(*(void *)this + 32) + 24);
}

uint64_t lacc::ELFLoader::flags(lacc::ELFLoader *this)
{
  return *(unsigned int *)(*(void *)(*(void *)this + 32) + 36);
}

uint64_t lacc::ELFLoader::get_text_segment_size(lacc::ELFLoader *this)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (!*(unsigned char *)(*(void *)this + 48)) {
    return 0;
  }
  sub_254420510((void *)(*(void *)this + 32), (uint64_t)&v5);
  uint64_t v1 = v5;
  if (v7)
  {
    uint64_t v5 = 0;
    if (v1) {
      (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
    }
    return 0;
  }
  if (!v6) {
    return 0;
  }
  uint64_t result = 0;
  v3 = (unsigned char *)(v5 + 24);
  uint64_t v4 = 32 * v6;
  do
  {
    if (*((_DWORD *)v3 - 6) == 1 && (*v3 & 1) != 0) {
      result += *((unsigned int *)v3 - 1);
    }
    v3 += 32;
    v4 -= 32;
  }
  while (v4);
  return result;
}

uint64_t lacc::ELFLoader::lookup_size(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a1;
  v9[0] = a2;
  v9[1] = a3;
  sub_254422D44(v3, v9, (uint64_t)&v10);
  if ((v12 & 1) == 0) {
    return v11;
  }
  uint64_t v8 = v10;
  uint64_t v5 = sub_25442E680();
  __int16 v7 = 257;
  sub_2544286AC(&v8, (uint64_t)v5, v6);
  uint64_t result = v8;
  if (v8)
  {
    (*(void (**)(uint64_t))(*(void *)v8 + 8))(v8);
    return 0;
  }
  return result;
}

void sub_25441FDAC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  if (a14) {
    sub_25442EF24();
  }
  _Unwind_Resume(exception_object);
}

uint64_t lacc::ELFLoader::lookup(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a1;
  v9[0] = a2;
  v9[1] = a3;
  sub_254422D44(v3, v9, (uint64_t)&v10);
  if ((v11 & 1) == 0) {
    return HIDWORD(v10);
  }
  uint64_t v8 = v10;
  uint64_t v5 = sub_25442E680();
  __int16 v7 = 257;
  sub_2544286AC(&v8, (uint64_t)v5, v6);
  uint64_t result = v8;
  if (v8)
  {
    (*(void (**)(uint64_t))(*(void *)v8 + 8))(v8);
    return 0;
  }
  return result;
}

void sub_25441FED0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  if (a14) {
    sub_25442EF24();
  }
  _Unwind_Resume(exception_object);
}

uint64_t lacc::ELFLoader::dma_write(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)a2 + 40))(a2, a3, a4, a5);
}

uint64_t lacc::ELFLoader::dma_read(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)a2 + 48))(a2, a3, a4, a5);
}

void sub_25441FF58(void *a1)
{
}

uint64_t sub_25441FF6C@<X0>(uint64_t result@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (a2 <= 0x33)
  {
    unint64_t v4 = a2;
    v5[0] = "invalid buffer: the size (";
    v5[2] = &v4;
    __int16 v6 = 2563;
    v7[0] = v5;
    v7[2] = ") is smaller than an ELF header (";
    __int16 v8 = 770;
    uint64_t v3 = 52;
    v9[0] = v7;
    void v9[2] = &v3;
    __int16 v10 = 2562;
    char v11 = v9;
    uint64_t v12 = ")";
    __int16 v13 = 770;
    operator new();
  }
  *(unsigned char *)(a3 + 16) &= ~1u;
  *(void *)a3 = result;
  *(void *)(a3 + 8) = a2;
  return result;
}

void sub_254420070(_Unwind_Exception *a1)
{
  MEMORY[0x25A278F10](v1, 0x10F3C401C2224D9);
  _Unwind_Resume(a1);
}

void *sub_254420098@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *result;
  uint64_t v4 = *(unsigned int *)(*result + 32);
  if (v4)
  {
    uint64_t v5 = (uint64_t *)*(unsigned __int16 *)(v3 + 46);
    if (v5 != (uint64_t *)40)
    {
      char v11 = "invalid e_shentsize in ELF header: ";
      uint64_t v12 = v5;
      __int16 v13 = 2307;
      operator new();
    }
    unint64_t v6 = result[1];
    if (v4 > 0xFFFFFFD7 || v4 + 40 > v6)
    {
      uint64_t v10 = *(unsigned int *)(*result + 32);
      char v11 = "section header table goes past the end of the file: e_shoff = 0x";
      uint64_t v12 = &v10;
      __int16 v13 = 3587;
      operator new();
    }
    uint64_t v8 = v3 + v4;
    unsigned int v9 = *(unsigned __int16 *)(v3 + 48);
    if (v9)
    {
      if (v4 + 40 * (unint64_t)v9 > v6) {
        goto LABEL_13;
      }
    }
    else
    {
      unsigned int v9 = *(_DWORD *)(v8 + 20);
      if (v4 + 40 * (unint64_t)v9 > v6)
      {
LABEL_13:
        char v11 = "section table goes past the end of file";
        __int16 v13 = 259;
        operator new();
      }
    }
    *(unsigned char *)(a2 + 16) &= ~1u;
    *(void *)a2 = v8;
    *(void *)(a2 + 8) = v9;
  }
  else
  {
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
    *(unsigned char *)(a2 + 16) &= ~1u;
  }
  return result;
}

void sub_25442025C(_Unwind_Exception *a1)
{
  MEMORY[0x25A278F10](v1, 0x10F3C401C2224D9);
  _Unwind_Resume(a1);
}

void *sub_254420294@<X0>(void *a1@<X0>, unsigned int *a2@<X1>, void (*a3)(uint64_t *__return_ptr, uint64_t, void ***)@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  sub_254420098(a1, (uint64_t)v15);
  if (v16)
  {
    uint64_t v11 = v15[0];
    v15[0] = 0;
    *(unsigned char *)(a5 + 16) |= 1u;
    *(void *)a5 = v11;
    uint64_t result = 0;
    v15[0] = 0;
  }
  else
  {
    sub_254420704(a1, v15[0], v15[1], a3, a4, (uint64_t)v13);
    if (v14)
    {
      uint64_t v12 = v13[0];
      v13[0] = 0;
      *(unsigned char *)(a5 + 16) |= 1u;
      *(void *)a5 = v12;
      uint64_t result = 0;
      v13[0] = 0;
    }
    else
    {
      uint64_t result = sub_2544208AC(a1, a2, v13[0], v13[1], a5);
      if (v14)
      {
        uint64_t result = (void *)v13[0];
        v13[0] = 0;
        if (result) {
          uint64_t result = (void *)(*(uint64_t (**)(void *))(*result + 8))(result);
        }
      }
    }
    if (v16)
    {
      uint64_t result = (void *)v15[0];
      v15[0] = 0;
      if (result) {
        return (void *)(*(uint64_t (**)(void *))(*result + 8))(result);
      }
    }
  }
  return result;
}

void sub_25442040C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, char a17)
{
  uint64_t v17 = exception_object;
  if (a14)
  {
    sub_25442EF98(&a12, (uint64_t)exception_object, a2, (uint64_t)&a10);
    uint64_t v17 = a10;
  }
  if (a17)
  {
    uint64_t v18 = a15;
    a15 = 0;
    if (v18)
    {
      (*(void (**)(uint64_t))(*(void *)v18 + 8))(v18);
      _Unwind_Resume(v17);
    }
  }
  _Unwind_Resume(v17);
}

void sub_254420484()
{
}

void sub_2544204E8(_Unwind_Exception *a1)
{
  MEMORY[0x25A278F10](v1, 0x10F3C401C2224D9);
  _Unwind_Resume(a1);
}

void *sub_254420510@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *result;
  uint64_t v4 = *(unsigned __int16 *)(*result + 44);
  if (*(_WORD *)(*result + 44))
  {
    uint64_t v5 = *(unsigned __int16 *)(v3 + 42);
    if (v5 != 32)
    {
      size_t v22 = "invalid e_phentsize: ";
      uint64_t v23 = v5;
      __int16 v24 = 2307;
      operator new();
    }
  }
  else
  {
    uint64_t v5 = *(unsigned __int16 *)(v3 + 42);
  }
  uint64_t v6 = *(unsigned int *)(v3 + 28);
  unint64_t v7 = result[1];
  if (v6 + v5 * (unint64_t)*(unsigned __int16 *)(*result + 44) > v7)
  {
    uint64_t v8 = *(unsigned int *)(v3 + 28);
    unint64_t v9 = v7;
    v10[0] = "program headers are longer than binary of size ";
    v10[2] = &v9;
    __int16 v11 = 2563;
    v12[0] = v10;
    v12[2] = ": e_phoff = 0x";
    __int16 v13 = 770;
    v14[0] = v12;
    v14[2] = &v8;
    __int16 v15 = 3586;
    v16[0] = v14;
    v16[2] = ", e_phnum = ";
    __int16 v17 = 770;
    v18[0] = v16;
    v18[2] = v4;
    __int16 v19 = 2306;
    v20[0] = v18;
    v20[2] = ", e_phentsize = ";
    __int16 v21 = 770;
    size_t v22 = (const char *)v20;
    uint64_t v23 = v5;
    __int16 v24 = 2306;
    operator new();
  }
  *(unsigned char *)(a2 + 16) &= ~1u;
  *(void *)a2 = v3 + v6;
  *(void *)(a2 + 8) = v4;
  return result;
}

void sub_2544206D4(_Unwind_Exception *a1)
{
  MEMORY[0x25A278F10](v1, 0x10F3C401C2224D9);
  _Unwind_Resume(a1);
}

void sub_254420704(void *a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, void (*a4)(uint64_t *__return_ptr, uint64_t, void ***)@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  unsigned int v7 = *(unsigned __int16 *)(*a1 + 50);
  if (v7 == 0xFFFF)
  {
    if (!a3)
    {
      __int16 v11 = "e_shstrndx == SHN_XINDEX, but the section header table is empty";
      __int16 v13 = 259;
      operator new();
    }
    unsigned int v7 = *(_DWORD *)(a2 + 24);
    if (v7) {
      goto LABEL_3;
    }
LABEL_9:
    *(unsigned char *)(a6 + 16) &= ~1u;
    *(void *)a6 = "";
    *(void *)(a6 + 8) = 0;
    return;
  }
  if (!*(_WORD *)(*a1 + 50)) {
    goto LABEL_9;
  }
LABEL_3:
  if (a3 <= v7)
  {
    v9[0] = "section header string table index ";
    void v9[2] = v7;
    __int16 v10 = 2051;
    __int16 v11 = (const char *)v9;
    uint64_t v12 = " does not exist";
    __int16 v13 = 770;
    operator new();
  }
  uint64_t v8 = a2 + 40 * v7;

  sub_254420AE4(a1, v8, a4, a5, a6);
}

void sub_25442087C(_Unwind_Exception *a1)
{
  MEMORY[0x25A278F10](v1, 0x10F3C401C2224D9);
  _Unwind_Resume(a1);
}

void *sub_2544208AC@<X0>(void *result@<X0>, unsigned int *a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X8>)
{
  unint64_t v6 = *a2;
  if (v6)
  {
    if (a4 <= v6)
    {
      sub_2544210A8(result, (uint64_t)a2, (char *)&v13);
      uint64_t v8 = std::string::insert(&v13, 0, "a section ");
      long long v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
      v14.__r_.__value_.__r.__words[2] = v8->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v14.__r_.__value_.__l.__data_ = v9;
      v8->__r_.__value_.__l.__size_ = 0;
      v8->__r_.__value_.__r.__words[2] = 0;
      v8->__r_.__value_.__r.__words[0] = 0;
      __int16 v10 = std::string::append(&v14, " has an invalid sh_name (0x");
      long long v11 = *(_OWORD *)&v10->__r_.__value_.__l.__data_;
      std::string::size_type v16 = v10->__r_.__value_.__r.__words[2];
      *(_OWORD *)__p = v11;
      v10->__r_.__value_.__l.__size_ = 0;
      v10->__r_.__value_.__r.__words[2] = 0;
      v10->__r_.__value_.__r.__words[0] = 0;
      unint64_t v12 = v6;
      v17[0] = __p;
      v17[2] = &v12;
      __int16 v18 = 3588;
      __int16 v19 = v17;
      uint64_t v20 = ") offset which goes past the end of the section name string table";
      __int16 v21 = 770;
      operator new();
    }
    unsigned int v7 = (const char *)(a3 + v6);
    uint64_t result = (void *)strlen(v7);
    *(unsigned char *)(a5 + 16) &= ~1u;
    *(void *)a5 = v7;
    *(void *)(a5 + 8) = result;
  }
  else
  {
    *(void *)a5 = 0;
    *(void *)(a5 + 8) = 0;
    *(unsigned char *)(a5 + 16) &= ~1u;
  }
  return result;
}

void sub_254420A4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  MEMORY[0x25A278F10](v28, 0x10F3C401C2224D9);
  if (a28 < 0)
  {
    operator delete(__p);
    if ((a21 & 0x80000000) == 0)
    {
LABEL_3:
      if ((a15 & 0x80000000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_7;
    }
  }
  else if ((a21 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(a16);
  if ((a15 & 0x80000000) == 0) {
LABEL_4:
  }
    _Unwind_Resume(a1);
LABEL_7:
  operator delete(a10);
  _Unwind_Resume(a1);
}

void sub_254420AE4(void *a1@<X0>, uint64_t a2@<X1>, void (*a3)(uint64_t *__return_ptr, uint64_t, void ***)@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  if (*(_DWORD *)(a2 + 4) == 3) {
    goto LABEL_19;
  }
  sub_2544210A8(a1, a2, (char *)&v30);
  __int16 v10 = std::string::insert(&v30, 0, "invalid sh_type for string table section ");
  long long v11 = *(_OWORD *)&v10->__r_.__value_.__l.__data_;
  v31.__r_.__value_.__r.__words[2] = v10->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v31.__r_.__value_.__l.__data_ = v11;
  v10->__r_.__value_.__l.__size_ = 0;
  v10->__r_.__value_.__r.__words[2] = 0;
  v10->__r_.__value_.__r.__words[0] = 0;
  unint64_t v12 = std::string::append(&v31, ": expected SHT_STRTAB, but got ");
  long long v13 = *(_OWORD *)&v12->__r_.__value_.__l.__data_;
  std::string::size_type v33 = v12->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v13;
  v12->__r_.__value_.__l.__size_ = 0;
  v12->__r_.__value_.__r.__words[2] = 0;
  v12->__r_.__value_.__r.__words[0] = 0;
  __int16 v43 = 260;
  v40 = __p;
  std::string v14 = sub_254427AF4(*(unsigned __int16 *)(*a1 + 18), *(_DWORD *)(a2 + 4));
  char v16 = v43;
  if (v43 == 1)
  {
    int v34 = (void **)v14;
    uint64_t v35 = v15;
    __int16 v38 = 261;
  }
  else if ((_BYTE)v43)
  {
    if (HIBYTE(v43) != 1) {
      char v16 = 2;
    }
    __int16 v17 = &v40;
    if (HIBYTE(v43) == 1) {
      __int16 v17 = (void ***)v40;
    }
    int v34 = (void **)v17;
    uint64_t v35 = v41;
    uint64_t v36 = v14;
    uint64_t v37 = v15;
    LOBYTE(v38) = v16;
    HIBYTE(v38) = 5;
  }
  else
  {
    __int16 v38 = 256;
  }
  a3(&v39, a4, &v34);
  if (SHIBYTE(v33) < 0)
  {
    operator delete(__p[0]);
    if ((SHIBYTE(v31.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
LABEL_13:
      if ((SHIBYTE(v30.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
        goto LABEL_14;
      }
LABEL_18:
      operator delete(v30.__r_.__value_.__l.__data_);
      uint64_t v18 = v39;
      if (v39) {
        goto LABEL_15;
      }
      goto LABEL_19;
    }
  }
  else if ((SHIBYTE(v31.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    goto LABEL_13;
  }
  operator delete(v31.__r_.__value_.__l.__data_);
  if (SHIBYTE(v30.__r_.__value_.__r.__words[2]) < 0) {
    goto LABEL_18;
  }
LABEL_14:
  uint64_t v18 = v39;
  if (v39)
  {
LABEL_15:
    *(unsigned char *)(a5 + 16) |= 1u;
    *(void *)a5 = v18;
    return;
  }
LABEL_19:
  sub_2544212FC(a1, a2, (uint64_t)&v40);
  __int16 v19 = v40;
  if (v42)
  {
    v40 = 0;
    *(unsigned char *)(a5 + 16) |= 1u;
    *(void *)a5 = v19;
    if ((v42 & 1) == 0) {
      return;
    }
    goto LABEL_26;
  }
  uint64_t v20 = v41;
  if (!v41)
  {
    sub_2544210A8(a1, a2, (char *)&v30);
    uint64_t v25 = std::string::insert(&v30, 0, "SHT_STRTAB string table section ");
    long long v26 = *(_OWORD *)&v25->__r_.__value_.__l.__data_;
    v31.__r_.__value_.__r.__words[2] = v25->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v31.__r_.__value_.__l.__data_ = v26;
    v25->__r_.__value_.__l.__size_ = 0;
    v25->__r_.__value_.__r.__words[2] = 0;
    v25->__r_.__value_.__r.__words[0] = 0;
    size_t v27 = std::string::append(&v31, " is empty");
    long long v28 = *(_OWORD *)&v27->__r_.__value_.__l.__data_;
    std::string::size_type v33 = v27->__r_.__value_.__r.__words[2];
    *(_OWORD *)__p = v28;
    v27->__r_.__value_.__l.__size_ = 0;
    v27->__r_.__value_.__r.__words[2] = 0;
    v27->__r_.__value_.__r.__words[0] = 0;
    __int16 v38 = 260;
    int v34 = __p;
    operator new();
  }
  if (*((unsigned char *)v40 + v41 - 1))
  {
    sub_2544210A8(a1, a2, (char *)&v30);
    __int16 v21 = std::string::insert(&v30, 0, "SHT_STRTAB string table section ");
    long long v22 = *(_OWORD *)&v21->__r_.__value_.__l.__data_;
    v31.__r_.__value_.__r.__words[2] = v21->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v31.__r_.__value_.__l.__data_ = v22;
    v21->__r_.__value_.__l.__size_ = 0;
    v21->__r_.__value_.__r.__words[2] = 0;
    v21->__r_.__value_.__r.__words[0] = 0;
    uint64_t v23 = std::string::append(&v31, " is non-null terminated");
    long long v24 = *(_OWORD *)&v23->__r_.__value_.__l.__data_;
    std::string::size_type v33 = v23->__r_.__value_.__r.__words[2];
    *(_OWORD *)__p = v24;
    v23->__r_.__value_.__l.__size_ = 0;
    v23->__r_.__value_.__r.__words[2] = 0;
    v23->__r_.__value_.__r.__words[0] = 0;
    __int16 v38 = 260;
    int v34 = __p;
    operator new();
  }
  *(unsigned char *)(a5 + 16) &= ~1u;
  *(void *)a5 = v19;
  *(void *)(a5 + 8) = v20;
  if (v42)
  {
LABEL_26:
    v29 = v40;
    v40 = 0;
    if (v29) {
      (*((void (**)(void **))*v29 + 1))(v29);
    }
  }
}

void sub_254420F0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  MEMORY[0x25A278F10](v28, 0x10F3C401C2224D9);
  if (a28 < 0)
  {
    operator delete(__p);
    if ((a21 & 0x80000000) == 0)
    {
LABEL_3:
      if ((a15 & 0x80000000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_8;
    }
  }
  else if ((a21 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(a16);
  if ((a15 & 0x80000000) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)(v29 - 80) & 1) == 0) {
      goto LABEL_11;
    }
    goto LABEL_9;
  }
LABEL_8:
  operator delete(a10);
  if ((*(unsigned char *)(v29 - 80) & 1) == 0) {
    goto LABEL_11;
  }
LABEL_9:
  uint64_t v31 = *(void *)(v29 - 96);
  *(void *)(v29 - 96) = 0;
  if (v31)
  {
    (*(void (**)(uint64_t))(*(void *)v31 + 8))(v31);
    _Unwind_Resume(a1);
  }
LABEL_11:
  _Unwind_Resume(a1);
}

void sub_2544210A8(void *a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  sub_254420098(a1, (uint64_t)v12);
  if ((v13 & 1) == 0)
  {
    std::to_string(&v10, 0xCCCCCCCCCCCCCCCDLL * ((int64_t)(a2 - v12[0]) >> 3));
    uint64_t v5 = std::string::insert(&v10, 0, "[index ");
    long long v6 = *(_OWORD *)&v5->__r_.__value_.__l.__data_;
    v11.__r_.__value_.__r.__words[2] = v5->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v11.__r_.__value_.__l.__data_ = v6;
    v5->__r_.__value_.__l.__size_ = 0;
    v5->__r_.__value_.__r.__words[2] = 0;
    v5->__r_.__value_.__r.__words[0] = 0;
    unsigned int v7 = std::string::append(&v11, "]");
    *(std::string *)a3 = *v7;
    v7->__r_.__value_.__l.__size_ = 0;
    v7->__r_.__value_.__r.__words[2] = 0;
    v7->__r_.__value_.__r.__words[0] = 0;
    if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(v11.__r_.__value_.__l.__data_);
      if ((SHIBYTE(v10.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
LABEL_4:
        if ((v13 & 1) == 0) {
          return;
        }
        goto LABEL_12;
      }
    }
    else if ((SHIBYTE(v10.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
      goto LABEL_4;
    }
    operator delete(v10.__r_.__value_.__l.__data_);
    if ((v13 & 1) == 0) {
      return;
    }
LABEL_12:
    std::string::size_type v9 = v12[0];
    v12[0] = 0;
    if (v9) {
      (*(void (**)(std::string::size_type))(*(void *)v9 + 8))(v9);
    }
    return;
  }
  std::string::size_type v8 = v12[0];
  v12[0] = 0;
  v10.__r_.__value_.__r.__words[0] = v8;
  sub_254421794(&v10, &v11);
  if (v10.__r_.__value_.__r.__words[0]) {
    (*(void (**)(std::string::size_type))(*(void *)v10.__r_.__value_.__l.__data_ + 8))(v10.__r_.__value_.__r.__words[0]);
  }
  a3[23] = 15;
  strcpy(a3, "[unknown index]");
  if (v13) {
    goto LABEL_12;
  }
}

void sub_254421268(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a10) {
    sub_25442EF24();
  }
  if (*(unsigned char *)(v21 - 32))
  {
    uint64_t v23 = *(void *)(v21 - 48);
    *(void *)(v21 - 48) = 0;
    if (v23)
    {
      (*(void (**)(uint64_t))(*(void *)v23 + 8))(v23);
      _Unwind_Resume(exception_object);
    }
  }
  _Unwind_Resume(exception_object);
}

void *sub_2544212FC@<X0>(void *result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3 = result;
  std::string::size_type v6 = *(unsigned int *)(a2 + 16);
  std::string::size_type v5 = *(unsigned int *)(a2 + 20);
  if (__CFADD__(v6, v5))
  {
    sub_2544210A8(result, a2, (char *)&v26);
    unsigned int v7 = std::string::insert(&v26, 0, "section ");
    long long v8 = *(_OWORD *)&v7->__r_.__value_.__l.__data_;
    v21.__r_.__value_.__r.__words[2] = v7->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v21.__r_.__value_.__l.__data_ = v8;
    v7->__r_.__value_.__l.__size_ = 0;
    v7->__r_.__value_.__r.__words[2] = 0;
    v7->__r_.__value_.__r.__words[0] = 0;
    std::string::size_type v9 = std::string::append(&v21, " has a sh_offset (0x");
    long long v10 = *(_OWORD *)&v9->__r_.__value_.__l.__data_;
    long long v24 = (const char *)v9->__r_.__value_.__r.__words[2];
    *(_OWORD *)__p = v10;
    v9->__r_.__value_.__l.__size_ = 0;
    v9->__r_.__value_.__r.__words[2] = 0;
    v9->__r_.__value_.__r.__words[0] = 0;
    v20.__r_.__value_.__r.__words[0] = v6;
    v27[0] = __p;
    uint64_t v28 = &v20;
    __int16 v29 = 3588;
    v30[0] = v27;
    uint64_t v31 = ") + sh_size (0x";
    __int16 v32 = 770;
    v19.__r_.__value_.__r.__words[0] = v5;
    v33[0] = v30;
    int v34 = &v19;
    __int16 v35 = 3586;
    uint64_t v36 = v33;
    uint64_t v37 = ") that cannot be represented";
    __int16 v38 = 770;
    operator new();
  }
  if (result[1] < (unint64_t)(v5 + v6))
  {
    sub_2544210A8(result, a2, (char *)&v19);
    std::string v11 = std::string::insert(&v19, 0, "section ");
    long long v12 = *(_OWORD *)&v11->__r_.__value_.__l.__data_;
    v20.__r_.__value_.__r.__words[2] = v11->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v20.__r_.__value_.__l.__data_ = v12;
    v11->__r_.__value_.__l.__size_ = 0;
    v11->__r_.__value_.__r.__words[2] = 0;
    v11->__r_.__value_.__r.__words[0] = 0;
    char v13 = std::string::append(&v20, " has a sh_offset (0x");
    long long v14 = *(_OWORD *)&v13->__r_.__value_.__l.__data_;
    v26.__r_.__value_.__r.__words[2] = v13->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v26.__r_.__value_.__l.__data_ = v14;
    v13->__r_.__value_.__l.__size_ = 0;
    v13->__r_.__value_.__r.__words[2] = 0;
    v13->__r_.__value_.__r.__words[0] = 0;
    std::string::size_type v17 = v5;
    std::string::size_type v18 = v6;
    v21.__r_.__value_.__r.__words[0] = (std::string::size_type)&v26;
    v21.__r_.__value_.__r.__words[2] = (std::string::size_type)&v18;
    __int16 v22 = 3588;
    __p[0] = &v21;
    long long v24 = ") + sh_size (0x";
    __int16 v25 = 770;
    v27[0] = __p;
    uint64_t v28 = (std::string *)&v17;
    __int16 v29 = 3586;
    v30[0] = v27;
    uint64_t v31 = ") that is greater than the file size (0x";
    __int16 v32 = 770;
    uint64_t v16 = v3[1];
    v33[0] = v30;
    int v34 = (std::string *)&v16;
    __int16 v35 = 3586;
    uint64_t v36 = v33;
    uint64_t v37 = ")";
    __int16 v38 = 770;
    operator new();
  }
  std::string::size_type v15 = *result + v6;
  *(unsigned char *)(a3 + 16) &= ~1u;
  *(void *)a3 = v15;
  *(void *)(a3 + 8) = v5;
  return result;
}

void sub_254421674(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,void *a25,uint64_t a26,int a27,__int16 a28,char a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,void *a34,uint64_t a35,int a36,__int16 a37,char a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,void *__p,uint64_t a44,int a45,__int16 a46,char a47,char a48)
{
  MEMORY[0x25A278F10](v48, 0x10F3C401C2224D9);
  if (a48 < 0)
  {
    operator delete(__p);
    if (a23 < 0)
    {
LABEL_5:
      operator delete(a18);
      if ((a17 & 0x80000000) == 0) {
LABEL_9:
      }
        _Unwind_Resume(a1);
LABEL_8:
      operator delete(a12);
      goto LABEL_9;
    }
  }
  else if (a23 < 0)
  {
    goto LABEL_5;
  }
  if ((a17 & 0x80000000) == 0) {
    goto LABEL_9;
  }
  goto LABEL_8;
}

void **sub_254421794@<X0>(void **result@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *result;
  if (*result)
  {
    *uint64_t result = 0;
    if ((*(unsigned int (**)(void *, void *))(*v3 + 48))(v3, &unk_269DF03C9))
    {
      *a2 = 0;
      uint64_t v4 = (uint64_t **)v3[1];
      std::string::size_type v5 = (uint64_t **)v3[2];
      if (v4 != v5)
      {
        std::string::size_type v6 = 0;
        do
        {
          long long v10 = v6;
          *a2 = 0;
          unsigned int v7 = *v4;
          void *v4 = 0;
          if ((*(unsigned int (**)(uint64_t *, void *))(*v7 + 48))(v7, &unk_269DF03C8))
          {
            (*(void (**)(uint64_t *))(*v7 + 8))(v7);
            unsigned int v7 = 0;
          }
          std::string::size_type v9 = v7;
          sub_254421A94(&v10, &v9, &v11);
          std::string::size_type v6 = v11;
          *a2 = v11;
          std::string v11 = 0;
          if (v9) {
            (*(void (**)(uint64_t *))(*v9 + 8))(v9);
          }
          if (v10) {
            (*(void (**)(uint64_t *))(*v10 + 8))(v10);
          }
          ++v4;
        }
        while (v4 != v5);
      }
      return (void **)(*(uint64_t (**)(void *))(*v3 + 8))(v3);
    }
    else
    {
      uint64_t result = (void **)(*(uint64_t (**)(void *, void *))(*v3 + 48))(v3, &unk_269DF03C8);
      if (result)
      {
        *a2 = 0;
        long long v8 = *(uint64_t (**)(void *))(*v3 + 8);
        return (void **)v8(v3);
      }
      else
      {
        *a2 = v3;
      }
    }
  }
  else
  {
    *a2 = 0;
  }
  return result;
}

void sub_2544219F0(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

uint64_t *sub_254421A94@<X0>(uint64_t **a1@<X0>, uint64_t **a2@<X1>, uint64_t **a3@<X8>)
{
  uint64_t result = *a1;
  unsigned int v7 = *a2;
  if (!result) {
    goto LABEL_18;
  }
  if (v7)
  {
    if ((*(unsigned int (**)(uint64_t *, void *))(*result + 48))(result, &unk_269DF03C9))
    {
      long long v8 = *a1;
      uint64_t result = *a2;
      if (*a2)
      {
        uint64_t result = (uint64_t *)(*(uint64_t (**)(uint64_t *, void *))(*result + 48))(result, &unk_269DF03C9);
        std::string::size_type v9 = *a2;
        if (result)
        {
          *a2 = 0;
          long long v10 = (uint64_t *)v9[1];
          std::string v11 = (uint64_t *)v9[2];
          if (v10 == v11) {
            goto LABEL_26;
          }
          uint64_t result = (uint64_t *)v8[2];
          do
          {
            if ((unint64_t)result < v8[3])
            {
              uint64_t v12 = *v10;
              *long long v10 = 0;
              *result++ = v12;
            }
            else
            {
              uint64_t result = sub_254422320(v8 + 1, v10);
            }
            v8[2] = (uint64_t)result;
            ++v10;
          }
          while (v10 != v11);
          if (v9) {
LABEL_26:
          }
            uint64_t result = (uint64_t *)(*(uint64_t (**)(uint64_t *))(*v9 + 8))(v9);
LABEL_27:
          *a3 = *a1;
          goto LABEL_28;
        }
      }
      else
      {
        std::string::size_type v9 = 0;
      }
      std::string::size_type v17 = v9;
      *a2 = 0;
      std::string::size_type v15 = (uint64_t **)v8[2];
      if ((unint64_t)v15 >= v8[3])
      {
        uint64_t v16 = sub_254422320(v8 + 1, (uint64_t *)&v17);
        uint64_t result = v17;
        v8[2] = (uint64_t)v16;
        std::string::size_type v17 = 0;
        if (result) {
          uint64_t result = (uint64_t *)(*(uint64_t (**)(uint64_t *))(*result + 8))(result);
        }
      }
      else
      {
        *std::string::size_type v15 = v9;
        v8[2] = (uint64_t)(v15 + 1);
      }
      goto LABEL_27;
    }
    if (!*a2 || !(*(unsigned int (**)(uint64_t *, void *))(**a2 + 48))(*a2, &unk_269DF03C9)) {
      operator new();
    }
    char v13 = (char **)(*a2 + 1);
    long long v14 = *v13;
    std::string::size_type v17 = *a1;
    *a1 = 0;
    sub_254421E68(v13, (uint64_t)v14, (uint64_t *)&v17);
    uint64_t result = v17;
    std::string::size_type v17 = 0;
    if (result) {
      uint64_t result = (uint64_t *)(*(uint64_t (**)(uint64_t *))(*result + 8))(result);
    }
    unsigned int v7 = *a2;
LABEL_18:
    *a3 = v7;
    *a2 = 0;
    return result;
  }
  *a3 = result;
LABEL_28:
  *a1 = 0;
  return result;
}

void sub_254421DE8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, int a11, __int16 a12, char a13, char a14, uint64_t a15)
{
  if (a15)
  {
    sub_25442EF24();
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void sub_254421E50(_Unwind_Exception *a1)
{
  if (v1)
  {
    sub_25442EFF8();
    _Unwind_Resume(a1);
  }
  JUMPOUT(0x254421E48);
}

char *sub_254421E68(char **a1, uint64_t a2, uint64_t *a3)
{
  std::string::size_type v6 = *a1;
  unint64_t v5 = (unint64_t)a1[1];
  uint64_t v7 = a2 - (void)*a1;
  uint64_t v8 = v7 >> 3;
  std::string::size_type v9 = &(*a1)[v7 & 0xFFFFFFFFFFFFFFF8];
  unint64_t v10 = (unint64_t)a1[2];
  if (v5 < v10)
  {
    if (v9 == (char *)v5)
    {
      uint64_t v23 = *a3;
      *a3 = 0;
      *(void *)std::string::size_type v9 = v23;
      a1[1] = v9 + 8;
      return v9;
    }
    uint64_t v11 = v5 - (void)(v9 + 8);
    uint64_t v12 = v11 >> 3;
    char v13 = (uint64_t *)(v5 - 8);
    if (v5 < 8)
    {
      std::string::size_type v18 = a1[1];
    }
    else
    {
      unint64_t v14 = (v7 & 0xFFFFFFFFFFFFFFF8) + v11;
      unint64_t v15 = (unint64_t)&v6[v14 + 8];
      if (v5 > v15) {
        unint64_t v15 = (unint64_t)a1[1];
      }
      unint64_t v16 = v15 + ~(unint64_t)v6 - v14;
      if (v16 >= 0xE8)
      {
        BOOL v56 = (unint64_t)v13 >= (v16 & 0xFFFFFFFFFFFFFFF8) + v5 + 8
           || v5 >= (unint64_t)&v6[v14 + 8 + (v16 & 0xFFFFFFFFFFFFFFF8)];
        std::string::size_type v17 = (uint64_t *)(v5 - 8);
        std::string::size_type v18 = a1[1];
        if (v56)
        {
          uint64_t v57 = (v16 >> 3) + 1;
          uint64_t v58 = v57 & 0x3FFFFFFFFFFFFFFCLL;
          std::string::size_type v17 = &v13[v58];
          std::string::size_type v18 = (char *)(v5 + v58 * 8);
          uint64_t v59 = (_OWORD *)(v5 + 16);
          v60 = &v6[8 * v12 + 16 + 8 * v8];
          uint64_t v61 = v57 & 0x3FFFFFFFFFFFFFFCLL;
          do
          {
            long long v62 = *((_OWORD *)v60 - 1);
            long long v63 = *(_OWORD *)v60;
            *((_OWORD *)v60 - 1) = 0uLL;
            *(_OWORD *)v60 = 0uLL;
            *(v59 - 1) = v62;
            *uint64_t v59 = v63;
            v59 += 2;
            v60 += 32;
            v61 -= 4;
          }
          while (v61);
          if (v57 == (v57 & 0x3FFFFFFFFFFFFFFCLL)) {
            goto LABEL_61;
          }
        }
      }
      else
      {
        std::string::size_type v17 = (uint64_t *)(v5 - 8);
        std::string::size_type v18 = a1[1];
      }
      do
      {
        uint64_t v64 = *v17;
        *v17++ = 0;
        *(void *)std::string::size_type v18 = v64;
        v18 += 8;
      }
      while ((unint64_t)v17 < v5);
    }
LABEL_61:
    a1[1] = v18;
    if ((char *)v5 != v9 + 8)
    {
      uint64_t v65 = 8 * v12;
      uint64_t v66 = (uint64_t)&v6[8 * v8 - 8];
      do
      {
        uint64_t v67 = *(void *)(v66 + v65);
        *(void *)(v66 + v65) = 0;
        uint64_t v68 = *v13;
        *char v13 = v67;
        if (v68) {
          (*(void (**)(uint64_t))(*(void *)v68 + 8))(v68);
        }
        --v13;
        v65 -= 8;
      }
      while (v65);
    }
    uint64_t v69 = *a3;
    *a3 = 0;
    uint64_t v70 = *(void *)v9;
    *(void *)std::string::size_type v9 = v69;
    if (v70) {
      (*(void (**)(uint64_t))(*(void *)v70 + 8))(v70);
    }
    return v9;
  }
  unint64_t v19 = ((uint64_t)(v5 - (void)v6) >> 3) + 1;
  if (v19 >> 61) {
    sub_254422570();
  }
  uint64_t v20 = v10 - (void)v6;
  if (v20 >> 2 > v19) {
    unint64_t v19 = v20 >> 2;
  }
  if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFF8) {
    unint64_t v21 = 0x1FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v21 = v19;
  }
  unint64_t v76 = a1 + 2;
  if (v21)
  {
    if (v21 >> 61) {
      sub_254422618();
    }
    __int16 v22 = (char *)operator new(8 * v21);
  }
  else
  {
    __int16 v22 = 0;
  }
  uint64_t v72 = v22;
  unint64_t v73 = (unint64_t)&v22[8 * v8];
  v74 = (char *)v73;
  size_t v75 = &v22[8 * v21];
  sub_25442264C(&v72, a3);
  unint64_t v24 = v73;
  __int16 v25 = *a1;
  unint64_t v26 = v73;
  if (*a1 != v9)
  {
    unint64_t v27 = &v6[v7 & 0xFFFFFFFFFFFFFFF8] - v25 - 8;
    unint64_t v26 = v73;
    uint64_t v28 = v9;
    if (v27 < 0x88) {
      goto LABEL_74;
    }
    BOOL v29 = (unint64_t)&v6[(v7 & 0xFFFFFFFFFFFFFFF8) - (v27 & 0xFFFFFFFFFFFFFFF8) - 8] >= v73
       || v73 - (v27 & 0xFFFFFFFFFFFFFFF8) - 8 >= (unint64_t)v9;
    unint64_t v26 = v73;
    uint64_t v28 = v9;
    if (!v29) {
      goto LABEL_74;
    }
    uint64_t v30 = (v27 >> 3) + 1;
    uint64_t v31 = 8 * (v30 & 0x3FFFFFFFFFFFFFFCLL);
    unint64_t v26 = v73 - v31;
    uint64_t v28 = &v9[-v31];
    __int16 v32 = &v6[8 * v8 - 16];
    std::string::size_type v33 = (_OWORD *)(v73 - 16);
    uint64_t v34 = v30 & 0x3FFFFFFFFFFFFFFCLL;
    do
    {
      long long v36 = *((_OWORD *)v32 - 1);
      long long v35 = *(_OWORD *)v32;
      *((_OWORD *)v32 - 1) = 0uLL;
      *(_OWORD *)__int16 v32 = 0uLL;
      *(v33 - 1) = v36;
      *std::string::size_type v33 = v35;
      v32 -= 32;
      v33 -= 2;
      v34 -= 4;
    }
    while (v34);
    if (v30 != (v30 & 0x3FFFFFFFFFFFFFFCLL))
    {
LABEL_74:
      do
      {
        uint64_t v37 = *((void *)v28 - 1);
        v28 -= 8;
        *(void *)uint64_t v28 = 0;
        *(void *)(v26 - 8) = v37;
        v26 -= 8;
      }
      while (v28 != v25);
    }
  }
  unint64_t v73 = v26;
  __int16 v38 = a1[1];
  uint64_t v39 = v74;
  if (v38 != v9)
  {
    v40 = &v6[v7 & 0xFFFFFFFFFFFFFFF8];
    unint64_t v41 = v38 - v40 - 8;
    if (v41 < 0x88) {
      goto LABEL_40;
    }
    unint64_t v42 = (unint64_t)&v40[(v41 & 0xFFFFFFFFFFFFFFF8) + 8];
    if (v9 < &v74[(v41 & 0xFFFFFFFFFFFFFFF8) + 8] && (unint64_t)v74 < v42) {
      goto LABEL_40;
    }
    uint64_t v44 = (v41 >> 3) + 1;
    uint64_t v45 = 8 * (v44 & 0x3FFFFFFFFFFFFFFCLL);
    v9 += v45;
    int v46 = &v74[v45];
    uint64_t v47 = v74 + 16;
    uint64_t v48 = &v6[8 * v8 + 16];
    uint64_t v49 = v44 & 0x3FFFFFFFFFFFFFFCLL;
    do
    {
      long long v50 = *((_OWORD *)v48 - 1);
      long long v51 = *(_OWORD *)v48;
      *((_OWORD *)v48 - 1) = 0uLL;
      *(_OWORD *)uint64_t v48 = 0uLL;
      *(v47 - 1) = v50;
      *uint64_t v47 = v51;
      v47 += 2;
      v48 += 32;
      v49 -= 4;
    }
    while (v49);
    uint64_t v39 = v46;
    if (v44 != (v44 & 0x3FFFFFFFFFFFFFFCLL))
    {
LABEL_40:
      int v46 = v39;
      do
      {
        uint64_t v52 = *(void *)v9;
        *(void *)std::string::size_type v9 = 0;
        v9 += 8;
        *(void *)int v46 = v52;
        v46 += 8;
      }
      while (v9 != v38);
    }
    unint64_t v26 = v73;
    std::string::size_type v9 = a1[1];
    uint64_t v39 = v46;
  }
  v53 = *a1;
  *a1 = (char *)v26;
  a1[1] = v39;
  int v54 = a1[2];
  a1[2] = v75;
  v74 = v9;
  size_t v75 = v54;
  uint64_t v72 = v53;
  unint64_t v73 = (unint64_t)v53;
  if (v9 == v53)
  {
    if (!v9) {
      return (char *)v24;
    }
    goto LABEL_50;
  }
  do
  {
    v74 = v9 - 8;
    uint64_t v55 = *((void *)v9 - 1);
    *((void *)v9 - 1) = 0;
    if (v55) {
      (*(void (**)(uint64_t))(*(void *)v55 + 8))(v55);
    }
    std::string::size_type v9 = v74;
  }
  while (v74 != v53);
  std::string::size_type v9 = v72;
  if (v72) {
LABEL_50:
  }
    operator delete(v9);
  return (char *)v24;
}

void sub_25442230C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_2544224F0((uint64_t)va);
  _Unwind_Resume(a1);
}

void *sub_254422320(void *a1, uint64_t *a2)
{
  uint64_t v3 = a1[1] - *a1;
  uint64_t v4 = v3 >> 3;
  unint64_t v5 = (v3 >> 3) + 1;
  if (v5 >> 61) {
    sub_254422570();
  }
  uint64_t v7 = a1[2] - *a1;
  if (v7 >> 2 > v5) {
    unint64_t v5 = v7 >> 2;
  }
  if ((unint64_t)v7 >= 0x7FFFFFFFFFFFFFF8) {
    unint64_t v8 = 0x1FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v8 = v5;
  }
  if (v8)
  {
    if (v8 >> 61) {
      sub_254422618();
    }
    std::string::size_type v9 = (char *)operator new(8 * v8);
  }
  else
  {
    std::string::size_type v9 = 0;
  }
  unint64_t v10 = &v9[8 * v4];
  uint64_t v11 = &v9[8 * v8];
  uint64_t v12 = *a2;
  *a2 = 0;
  *(void *)unint64_t v10 = v12;
  char v13 = v10 + 8;
  unint64_t v14 = (char *)*a1;
  unint64_t v15 = (char *)a1[1];
  if (v15 == (char *)*a1)
  {
    *a1 = v10;
    a1[1] = v13;
    a1[2] = v11;
    if (!v15) {
      return v13;
    }
    goto LABEL_26;
  }
  unint64_t v16 = (unint64_t)&v15[-*a1 - 8];
  if (v16 < 0x78 || &v15[-(v16 & 0xFFFFFFFFFFFFFFF8) - 8] < v10 && &v9[v3 - (v16 & 0xFFFFFFFFFFFFFFF8) - 8] < v15) {
    goto LABEL_34;
  }
  uint64_t v17 = (v16 >> 3) + 1;
  uint64_t v18 = 8 * (v17 & 0x3FFFFFFFFFFFFFFCLL);
  v10 -= v18;
  unint64_t v19 = &v15[-v18];
  uint64_t v20 = v15 - 16;
  unint64_t v21 = &v9[8 * v4 - 16];
  uint64_t v22 = v17 & 0x3FFFFFFFFFFFFFFCLL;
  do
  {
    long long v24 = *((_OWORD *)v20 - 1);
    long long v23 = *(_OWORD *)v20;
    *((_OWORD *)v20 - 1) = 0uLL;
    *(_OWORD *)uint64_t v20 = 0uLL;
    *((_OWORD *)v21 - 1) = v24;
    *(_OWORD *)unint64_t v21 = v23;
    v20 -= 32;
    v21 -= 32;
    v22 -= 4;
  }
  while (v22);
  unint64_t v15 = v19;
  if (v17 != (v17 & 0x3FFFFFFFFFFFFFFCLL))
  {
LABEL_34:
    do
    {
      uint64_t v25 = *((void *)v15 - 1);
      v15 -= 8;
      *(void *)unint64_t v15 = 0;
      *((void *)v10 - 1) = v25;
      v10 -= 8;
    }
    while (v15 != v14);
  }
  unint64_t v26 = (char *)*a1;
  unint64_t v15 = (char *)a1[1];
  *a1 = v10;
  a1[1] = v13;
  a1[2] = v11;
  if (v15 != v26)
  {
    do
    {
      uint64_t v28 = *((void *)v15 - 1);
      v15 -= 8;
      uint64_t v27 = v28;
      *(void *)unint64_t v15 = 0;
      if (v28) {
        (*(void (**)(uint64_t))(*(void *)v27 + 8))(v27);
      }
    }
    while (v15 != v26);
    unint64_t v15 = v26;
  }
  if (v15) {
LABEL_26:
  }
    operator delete(v15);
  return v13;
}

uint64_t sub_2544224F0(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 8;
    uint64_t v4 = *(void *)(i - 8);
    *(void *)(i - 8) = 0;
    if (v4) {
      (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
    }
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void sub_254422570()
{
}

void sub_254422588(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_2544225E4(exception, a1);
  __cxa_throw(exception, (struct type_info *)off_2653AC090, MEMORY[0x263F8C060]);
}

void sub_2544225D0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_2544225E4(std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

void sub_254422618()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

void sub_25442264C(char **a1, uint64_t *a2)
{
  uint64_t v4 = a1[2];
  if (v4 != a1[3]) {
    goto LABEL_24;
  }
  unint64_t v5 = *a1;
  std::string::size_type v6 = a1[1];
  if (v6 > *a1)
  {
    uint64_t v7 = (v6 - *a1) >> 3;
    if (v7 >= -1) {
      uint64_t v8 = v7 + 1;
    }
    else {
      uint64_t v8 = v7 + 2;
    }
    uint64_t v9 = v8 >> 1;
    uint64_t v10 = -v9;
    if (v6 == v4)
    {
      long long v23 = &v6[-8 * v9];
    }
    else
    {
      do
      {
        uint64_t v11 = *(void *)v6;
        *(void *)std::string::size_type v6 = 0;
        uint64_t v12 = *(void *)&v6[8 * v10];
        *(void *)&v6[8 * v10] = v11;
        if (v12) {
          (*(void (**)(uint64_t))(*(void *)v12 + 8))(v12);
        }
        v6 += 8;
      }
      while (v6 != v4);
      uint64_t v4 = a1[1];
      long long v23 = &v6[8 * v10];
    }
    a1[1] = &v4[8 * v10];
    a1[2] = v23;
    uint64_t v4 = v23;
    goto LABEL_24;
  }
  unint64_t v13 = (v4 - v5) >> 2;
  if (v4 == v5) {
    unint64_t v13 = 1;
  }
  if (v13 >> 61) {
    sub_254422618();
  }
  unint64_t v14 = v13 >> 2;
  uint64_t v15 = 8 * v13;
  unint64_t v16 = (char *)operator new(8 * v13);
  uint64_t v17 = &v16[8 * v14];
  uint64_t v18 = &v16[v15];
  int64_t v19 = v4 - v6;
  if (v4 != v6)
  {
    uint64_t v20 = &v17[v19 & 0xFFFFFFFFFFFFFFF8];
    unint64_t v21 = v19 - 8;
    if ((unint64_t)(v19 - 8) >= 0x78)
    {
      unint64_t v25 = v19 & 0xFFFFFFFFFFFFFFF8;
      BOOL v26 = v6 >= &v16[8 * v14 + v25] || v17 >= &v6[v25];
      uint64_t v22 = &v16[8 * v14];
      if (v26)
      {
        uint64_t v27 = (v21 >> 3) + 1;
        uint64_t v28 = 8 * (v27 & 0x3FFFFFFFFFFFFFFCLL);
        uint64_t v22 = &v17[v28];
        BOOL v29 = &v6[v28];
        uint64_t v30 = (long long *)(v6 + 16);
        uint64_t v31 = &v16[8 * v14 + 16];
        uint64_t v32 = v27 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          long long v33 = *(v30 - 1);
          long long v34 = *v30;
          *(v30 - 1) = 0uLL;
          *uint64_t v30 = 0uLL;
          *((_OWORD *)v31 - 1) = v33;
          *(_OWORD *)uint64_t v31 = v34;
          v30 += 2;
          v31 += 32;
          v32 -= 4;
        }
        while (v32);
        std::string::size_type v6 = v29;
        if (v27 == (v27 & 0x3FFFFFFFFFFFFFFCLL))
        {
LABEL_34:
          unint64_t v5 = *a1;
          long long v36 = a1[1];
          uint64_t v37 = a1[2];
          *a1 = v16;
          a1[1] = v17;
          a1[2] = v20;
          a1[3] = v18;
          while (v37 != v36)
          {
            uint64_t v39 = *((void *)v37 - 1);
            v37 -= 8;
            uint64_t v38 = v39;
            *(void *)uint64_t v37 = 0;
            if (v39) {
              (*(void (**)(uint64_t))(*(void *)v38 + 8))(v38);
            }
          }
          goto LABEL_21;
        }
      }
    }
    else
    {
      uint64_t v22 = &v16[8 * v14];
    }
    do
    {
      uint64_t v35 = *(void *)v6;
      *(void *)std::string::size_type v6 = 0;
      v6 += 8;
      *(void *)uint64_t v22 = v35;
      v22 += 8;
    }
    while (v22 != v20);
    goto LABEL_34;
  }
  *a1 = v16;
  a1[1] = v17;
  a1[2] = v17;
  a1[3] = v18;
LABEL_21:
  if (v5) {
    operator delete(v5);
  }
  uint64_t v4 = a1[2];
LABEL_24:
  uint64_t v24 = *a2;
  *a2 = 0;
  *(void *)uint64_t v4 = v24;
  a1[2] += 8;
}

void sub_254422888()
{
}

uint64_t sub_2544228A0(uint64_t (**a1)(uint64_t), uint64_t a2)
{
  return (*a1)(a2);
}

void *sub_2544228AC@<X0>(void *result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3 = result;
  std::string::size_type v6 = *(unsigned int *)(a2 + 16);
  std::string::size_type v5 = *(unsigned int *)(a2 + 20);
  if (__CFADD__(v6, v5))
  {
    sub_2544210A8(result, a2, (char *)&v26);
    uint64_t v7 = std::string::insert(&v26, 0, "section ");
    long long v8 = *(_OWORD *)&v7->__r_.__value_.__l.__data_;
    v21.__r_.__value_.__r.__words[2] = v7->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v21.__r_.__value_.__l.__data_ = v8;
    v7->__r_.__value_.__l.__size_ = 0;
    v7->__r_.__value_.__r.__words[2] = 0;
    v7->__r_.__value_.__r.__words[0] = 0;
    uint64_t v9 = std::string::append(&v21, " has a sh_offset (0x");
    long long v10 = *(_OWORD *)&v9->__r_.__value_.__l.__data_;
    uint64_t v24 = (const char *)v9->__r_.__value_.__r.__words[2];
    *(_OWORD *)__p = v10;
    v9->__r_.__value_.__l.__size_ = 0;
    v9->__r_.__value_.__r.__words[2] = 0;
    v9->__r_.__value_.__r.__words[0] = 0;
    v20.__r_.__value_.__r.__words[0] = v6;
    v27[0] = __p;
    uint64_t v28 = &v20;
    __int16 v29 = 3588;
    v30[0] = v27;
    uint64_t v31 = ") + sh_size (0x";
    __int16 v32 = 770;
    v19.__r_.__value_.__r.__words[0] = v5;
    v33[0] = v30;
    long long v34 = &v19;
    __int16 v35 = 3586;
    long long v36 = v33;
    uint64_t v37 = ") that cannot be represented";
    __int16 v38 = 770;
    operator new();
  }
  if (result[1] < (unint64_t)(v5 + v6))
  {
    sub_2544210A8(result, a2, (char *)&v19);
    uint64_t v11 = std::string::insert(&v19, 0, "section ");
    long long v12 = *(_OWORD *)&v11->__r_.__value_.__l.__data_;
    v20.__r_.__value_.__r.__words[2] = v11->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v20.__r_.__value_.__l.__data_ = v12;
    v11->__r_.__value_.__l.__size_ = 0;
    v11->__r_.__value_.__r.__words[2] = 0;
    v11->__r_.__value_.__r.__words[0] = 0;
    unint64_t v13 = std::string::append(&v20, " has a sh_offset (0x");
    long long v14 = *(_OWORD *)&v13->__r_.__value_.__l.__data_;
    v26.__r_.__value_.__r.__words[2] = v13->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v26.__r_.__value_.__l.__data_ = v14;
    v13->__r_.__value_.__l.__size_ = 0;
    v13->__r_.__value_.__r.__words[2] = 0;
    v13->__r_.__value_.__r.__words[0] = 0;
    std::string::size_type v17 = v5;
    std::string::size_type v18 = v6;
    v21.__r_.__value_.__r.__words[0] = (std::string::size_type)&v26;
    v21.__r_.__value_.__r.__words[2] = (std::string::size_type)&v18;
    __int16 v22 = 3588;
    __p[0] = &v21;
    uint64_t v24 = ") + sh_size (0x";
    __int16 v25 = 770;
    v27[0] = __p;
    uint64_t v28 = (std::string *)&v17;
    __int16 v29 = 3586;
    v30[0] = v27;
    uint64_t v31 = ") that is greater than the file size (0x";
    __int16 v32 = 770;
    uint64_t v16 = v3[1];
    v33[0] = v30;
    long long v34 = (std::string *)&v16;
    __int16 v35 = 3586;
    long long v36 = v33;
    uint64_t v37 = ")";
    __int16 v38 = 770;
    operator new();
  }
  std::string::size_type v15 = *result + v6;
  *(unsigned char *)(a3 + 16) &= ~1u;
  *(void *)a3 = v15;
  *(void *)(a3 + 8) = v5;
  return result;
}

void sub_254422C24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,void *a25,uint64_t a26,int a27,__int16 a28,char a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,void *a34,uint64_t a35,int a36,__int16 a37,char a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,void *__p,uint64_t a44,int a45,__int16 a46,char a47,char a48)
{
  MEMORY[0x25A278F10](v48, 0x10F3C401C2224D9);
  if (a48 < 0)
  {
    operator delete(__p);
    if (a23 < 0)
    {
LABEL_5:
      operator delete(a18);
      if ((a17 & 0x80000000) == 0) {
LABEL_9:
      }
        _Unwind_Resume(a1);
LABEL_8:
      operator delete(a12);
      goto LABEL_9;
    }
  }
  else if (a23 < 0)
  {
    goto LABEL_5;
  }
  if ((a17 & 0x80000000) == 0) {
    goto LABEL_9;
  }
  goto LABEL_8;
}

void sub_254422D44(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = (const void **)a1;
  uint64_t v50 = *MEMORY[0x263EF8340];
  std::string::size_type v6 = (void *)(a1 + 32);
  sub_254420098((void *)(a1 + 32), (uint64_t)&v39);
  uint64_t v7 = v39;
  if (v41)
  {
    int v21 = 0;
    uint64_t v39 = 0;
    *(unsigned char *)(a3 + 16) |= 1u;
    *(void *)a3 = v7;
    goto LABEL_32;
  }
  if (!v40) {
    goto LABEL_41;
  }
  long long v8 = &v39[10 * v40];
  int v9 = *(unsigned __int8 *)(a3 + 16);
  __int16 v35 = a2;
  uint64_t v36 = a3;
  long long v33 = v8;
  long long v34 = v4;
  while (v7[1] != 2)
  {
LABEL_5:
    v7 += 10;
    if (v7 == v8)
    {
      int v21 = 1;
      if (v41) {
        goto LABEL_32;
      }
      goto LABEL_40;
    }
  }
  sub_254423298(v6, (uint64_t)v7, (uint64_t)&__dst);
  if (v49)
  {
    int v21 = 0;
    long long v23 = __dst;
    *(unsigned char *)(a3 + 16) |= 1u;
    *(void *)a3 = v23;
    if (v41) {
      goto LABEL_32;
    }
LABEL_40:
    if (!v21) {
      return;
    }
LABEL_41:
    int v24 = *((char *)v4 + 23);
    if (v24 >= 0) {
      size_t v25 = *((unsigned __int8 *)v4 + 23);
    }
    else {
      size_t v25 = (size_t)v4[1];
    }
    unint64_t v26 = v25 + 22;
    if (v25 + 22 >= 0x7FFFFFFFFFFFFFF8) {
      sub_254422888();
    }
    if (v26 >= 0x17)
    {
      uint64_t v28 = (v26 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v26 | 7) != 0x17) {
        uint64_t v28 = v26 | 7;
      }
      uint64_t v29 = v28 + 1;
      p_dst = operator new(v28 + 1);
      unint64_t v48 = v25 + 22;
      unint64_t v49 = v29 | 0x8000000000000000;
      __dst = p_dst;
    }
    else
    {
      unint64_t v48 = 0;
      unint64_t v49 = 0;
      __dst = 0;
      p_dst = &__dst;
      HIBYTE(v49) = v25 + 22;
      if (!v25) {
        goto LABEL_55;
      }
    }
    if (v24 >= 0) {
      uint64_t v30 = v4;
    }
    else {
      uint64_t v30 = *v4;
    }
    memmove(p_dst, v30, v25);
LABEL_55:
    strcpy((char *)p_dst + v25, ": function not found: ");
    uint64_t v31 = (const void *)*a2;
    uint64_t v32 = a2[1];
    uint64_t v39 = (unsigned int *)&__dst;
    unint64_t v41 = v31;
    uint64_t v42 = v32;
    __int16 v43 = 1284;
    operator new();
  }
  sub_254423504(v6, v7, (uint64_t)&v44);
  long long v10 = v44;
  if (v46)
  {
    char v17 = 0;
    uint64_t v44 = 0;
    v9 |= 1u;
    *(unsigned char *)(a3 + 16) = v9;
    *(void *)a3 = v10;
    if ((v46 & 1) == 0) {
      goto LABEL_28;
    }
    goto LABEL_26;
  }
  if (!v45)
  {
    char v17 = 1;
    if ((v46 & 1) == 0) {
      goto LABEL_28;
    }
    goto LABEL_26;
  }
  long long v12 = (const char *)__dst;
  unint64_t v11 = v48;
  uint64_t v13 = 16 * v45;
  long long v14 = (const void *)*a2;
  uint64_t v15 = a2[1];
  do
  {
    v38[0] = *v10;
    if (v11 <= v38[0])
    {
      uint64_t v18 = sub_25442814C();
      unint64_t v37 = v11;
      sub_254423CB4(3, v18, (uint64_t)"st_name (0x%x) is past the end of the string table of size 0x%zx", (int *)v38, (uint64_t *)&v37);
    }
    if (v12)
    {
      size_t v16 = strlen(&v12[v38[0]]);
      if (v16 == v15 && (!v16 || !memcmp(&v12[v38[0]], v14, v16)))
      {
LABEL_18:
        char v17 = 0;
        v9 &= ~1u;
        a3 = v36;
        *(unsigned char *)(v36 + 16) = v9;
        *(_OWORD *)uint64_t v36 = *(_OWORD *)v10;
        goto LABEL_25;
      }
    }
    else if (!v15)
    {
      goto LABEL_18;
    }
    v10 += 4;
    v13 -= 16;
  }
  while (v13);
  char v17 = 1;
  a3 = v36;
LABEL_25:
  uint64_t v4 = v34;
  a2 = v35;
  long long v8 = v33;
  if (v46)
  {
LABEL_26:
    std::string v19 = v44;
    uint64_t v44 = 0;
    if (v19) {
      (*(void (**)(int *))(*(void *)v19 + 8))(v19);
    }
  }
LABEL_28:
  if (v49)
  {
    std::string v20 = __dst;
    __dst = 0;
    if (v20) {
      (*(void (**)(void *))(*v20 + 8))(v20);
    }
  }
  if (v17) {
    goto LABEL_5;
  }
  int v21 = 0;
  if ((v41 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_32:
  __int16 v22 = v39;
  uint64_t v39 = 0;
  if (!v22) {
    goto LABEL_40;
  }
  (*(void (**)(unsigned int *))(*(void *)v22 + 8))(v22);
  if (v21) {
    goto LABEL_41;
  }
}

void sub_254423190(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, _Unwind_Exception *a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25)
{
  unint64_t v26 = exception_object;
  if (a25)
  {
    sub_25442EF98(&a23, (uint64_t)exception_object, a2, (uint64_t)&a16);
    unint64_t v26 = a16;
  }
  if (*(unsigned char *)(v25 - 104))
  {
    uint64_t v27 = *(void *)(v25 - 120);
    *(void *)(v25 - 120) = 0;
    if (v27) {
      (*(void (**)(uint64_t))(*(void *)v27 + 8))(v27);
    }
  }
  if (a20)
  {
    uint64_t v28 = a18;
    a18 = 0;
    if (v28)
    {
      (*(void (**)(uint64_t))(*(void *)v28 + 8))(v28);
      _Unwind_Resume(v26);
    }
  }
  _Unwind_Resume(v26);
}

void sub_254423298(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  sub_254420098(a1, (uint64_t)v8);
  if (v9)
  {
    uint64_t v7 = v8[0];
    v8[0] = 0;
    *(unsigned char *)(a3 + 16) |= 1u;
    *(void *)a3 = v7;
  }
  else
  {
    sub_2544233A4(a1, a2, v8[0], v8[1], a3);
    if (v9)
    {
      uint64_t v6 = v8[0];
      v8[0] = 0;
      if (v6) {
        (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
      }
    }
  }
}

void sub_254423380(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11)
{
  if (a11) {
    sub_25442F130(&a9);
  }
  _Unwind_Resume(exception_object);
}

void sub_2544233A4(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X8>)
{
  int v6 = *(_DWORD *)(a2 + 4);
  if (v6 != 2 && v6 != 11)
  {
    v9[0] = "invalid sh_type for symbol table, expected SHT_SYMTAB or SHT_DYNSYM";
    __int16 v10 = 259;
    operator new();
  }
  unint64_t v8 = *(unsigned int *)(a2 + 24);
  if (a4 <= v8)
  {
    v9[0] = "invalid section index: ";
    void v9[2] = v8;
    __int16 v10 = 2051;
    operator new();
  }
  v9[0] = sub_254420484;
  sub_254420AE4(a1, a3 + 40 * v8, (void (*)(uint64_t *__return_ptr, uint64_t, void ***))sub_2544228A0, (uint64_t)v9, a5);
}

void sub_2544234D4(_Unwind_Exception *a1)
{
  MEMORY[0x25A278F10](v1, 0x10F3C401C2224D9);
  _Unwind_Resume(a1);
}

void *sub_254423504@<X0>(void *result@<X0>, unsigned int *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = result;
  if (a2[9] != 16)
  {
    sub_2544210A8(result, (uint64_t)a2, (char *)&v32);
    long long v12 = std::string::insert(&v32, 0, "section ");
    long long v13 = *(_OWORD *)&v12->__r_.__value_.__l.__data_;
    v34.__r_.__value_.__r.__words[2] = v12->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v34.__r_.__value_.__l.__data_ = v13;
    v12->__r_.__value_.__l.__size_ = 0;
    v12->__r_.__value_.__r.__words[2] = 0;
    v12->__r_.__value_.__r.__words[0] = 0;
    long long v14 = std::string::append(&v34, " has invalid sh_entsize: expected ");
    long long v15 = *(_OWORD *)&v14->__r_.__value_.__l.__data_;
    __int16 v38 = (std::string *)v14->__r_.__value_.__r.__words[2];
    *(_OWORD *)__p = v15;
    v14->__r_.__value_.__l.__size_ = 0;
    v14->__r_.__value_.__r.__words[2] = 0;
    v14->__r_.__value_.__r.__words[0] = 0;
    v36.__r_.__value_.__r.__words[0] = 16;
    v40[0] = __p;
    unint64_t v41 = &v36;
    __int16 v42 = 2564;
    v43[0] = v40;
    uint64_t v44 = (std::string *)", but got ";
    __int16 v45 = 770;
    size_t v16 = (const char *)a2[9];
    char v46 = v43;
    uint64_t v47 = v16;
    __int16 v48 = 2050;
    operator new();
  }
  std::string::size_type v6 = a2[5];
  if ((v6 & 0xF) != 0)
  {
    sub_2544210A8(result, (uint64_t)a2, (char *)&v36);
    uint64_t v7 = std::string::insert(&v36, 0, "section ");
    long long v8 = *(_OWORD *)&v7->__r_.__value_.__l.__data_;
    v32.__r_.__value_.__r.__words[2] = v7->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v32.__r_.__value_.__l.__data_ = v8;
    v7->__r_.__value_.__l.__size_ = 0;
    v7->__r_.__value_.__r.__words[2] = 0;
    v7->__r_.__value_.__r.__words[0] = 0;
    char v9 = std::string::append(&v32, " has an invalid sh_size (");
    long long v10 = *(_OWORD *)&v9->__r_.__value_.__l.__data_;
    v34.__r_.__value_.__r.__words[2] = v9->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v34.__r_.__value_.__l.__data_ = v10;
    v9->__r_.__value_.__l.__size_ = 0;
    v9->__r_.__value_.__r.__words[2] = 0;
    v9->__r_.__value_.__r.__words[0] = 0;
    __p[0] = &v34;
    __int16 v38 = (std::string *)v6;
    __int16 v39 = 2052;
    v40[0] = __p;
    unint64_t v41 = (std::string *)") which is not a multiple of its sh_entsize (";
    __int16 v42 = 770;
    unint64_t v11 = (std::string *)a2[9];
    v43[0] = v40;
    uint64_t v44 = v11;
    __int16 v45 = 2050;
    char v46 = v43;
    uint64_t v47 = ")";
    __int16 v48 = 770;
    operator new();
  }
  std::string::size_type v17 = a2[4];
  if (__CFADD__(v17, v6))
  {
    sub_2544210A8(result, (uint64_t)a2, (char *)&v36);
    uint64_t v18 = std::string::insert(&v36, 0, "section ");
    long long v19 = *(_OWORD *)&v18->__r_.__value_.__l.__data_;
    v32.__r_.__value_.__r.__words[2] = v18->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v32.__r_.__value_.__l.__data_ = v19;
    v18->__r_.__value_.__l.__size_ = 0;
    v18->__r_.__value_.__r.__words[2] = 0;
    v18->__r_.__value_.__r.__words[0] = 0;
    std::string v20 = std::string::append(&v32, " has a sh_offset (0x");
    long long v21 = *(_OWORD *)&v20->__r_.__value_.__l.__data_;
    v34.__r_.__value_.__r.__words[2] = v20->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v34.__r_.__value_.__l.__data_ = v21;
    v20->__r_.__value_.__l.__size_ = 0;
    v20->__r_.__value_.__r.__words[2] = 0;
    v20->__r_.__value_.__r.__words[0] = 0;
    v31.__r_.__value_.__r.__words[0] = v17;
    __p[0] = &v34;
    __int16 v38 = &v31;
    __int16 v39 = 3588;
    v40[0] = __p;
    unint64_t v41 = (std::string *)") + sh_size (0x";
    __int16 v42 = 770;
    v30.__r_.__value_.__r.__words[0] = v6;
    v43[0] = v40;
    uint64_t v44 = &v30;
    __int16 v45 = 3586;
    char v46 = v43;
    uint64_t v47 = ") that cannot be represented";
    __int16 v48 = 770;
    operator new();
  }
  if (result[1] < (unint64_t)(v6 + v17))
  {
    sub_2544210A8(result, (uint64_t)a2, (char *)&v30);
    __int16 v22 = std::string::insert(&v30, 0, "section ");
    long long v23 = *(_OWORD *)&v22->__r_.__value_.__l.__data_;
    v31.__r_.__value_.__r.__words[2] = v22->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v31.__r_.__value_.__l.__data_ = v23;
    v22->__r_.__value_.__l.__size_ = 0;
    v22->__r_.__value_.__r.__words[2] = 0;
    v22->__r_.__value_.__r.__words[0] = 0;
    int v24 = std::string::append(&v31, " has a sh_offset (0x");
    long long v25 = *(_OWORD *)&v24->__r_.__value_.__l.__data_;
    v36.__r_.__value_.__r.__words[2] = v24->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v36.__r_.__value_.__l.__data_ = v25;
    v24->__r_.__value_.__l.__size_ = 0;
    v24->__r_.__value_.__r.__words[2] = 0;
    v24->__r_.__value_.__r.__words[0] = 0;
    std::string::size_type v28 = v6;
    std::string::size_type v29 = v17;
    v32.__r_.__value_.__r.__words[0] = (std::string::size_type)&v36;
    v32.__r_.__value_.__r.__words[2] = (std::string::size_type)&v29;
    __int16 v33 = 3588;
    v34.__r_.__value_.__r.__words[0] = (std::string::size_type)&v32;
    v34.__r_.__value_.__r.__words[2] = (std::string::size_type)") + sh_size (0x";
    __int16 v35 = 770;
    __p[0] = &v34;
    __int16 v38 = (std::string *)&v28;
    __int16 v39 = 3586;
    v40[0] = __p;
    unint64_t v41 = (std::string *)") that is greater than the file size (0x";
    __int16 v42 = 770;
    uint64_t v27 = v4[1];
    v43[0] = v40;
    uint64_t v44 = (std::string *)&v27;
    __int16 v45 = 3586;
    char v46 = v43;
    uint64_t v47 = ")";
    __int16 v48 = 770;
    operator new();
  }
  std::string::size_type v26 = *result + v17;
  *(unsigned char *)(a3 + 16) &= ~1u;
  *(void *)a3 = v26;
  *(void *)(a3 + 8) = v6 >> 4;
  return result;
}

void sub_254423ADC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,void *a25,uint64_t a26,int a27,__int16 a28,char a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,void *a34,uint64_t a35,int a36,__int16 a37,char a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,void *__p,uint64_t a44,int a45,__int16 a46,char a47,char a48,uint64_t a49,void *a50,uint64_t a51,int a52,__int16 a53,char a54,char a55)
{
  MEMORY[0x25A278F10](v55, 0x10F3C401C2224D9);
  if (a48 < 0)
  {
    operator delete(__p);
    if (a23 < 0)
    {
LABEL_5:
      operator delete(a18);
      if ((a17 & 0x80000000) == 0) {
LABEL_9:
      }
        _Unwind_Resume(a1);
LABEL_8:
      operator delete(a12);
      goto LABEL_9;
    }
  }
  else if (a23 < 0)
  {
    goto LABEL_5;
  }
  if ((a17 & 0x80000000) == 0) {
    goto LABEL_9;
  }
  goto LABEL_8;
}

void sub_254423CA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (a24 < 0) {
    JUMPOUT(0x254423C94);
  }
  JUMPOUT(0x254423C9CLL);
}

void sub_254423CB4(uint64_t a1, uint64_t a2, uint64_t a3, int *a4, uint64_t *a5)
{
  memset(__p, 0, sizeof(__p));
  int v11 = 0;
  char v15 = 0;
  uint64_t v16 = 0;
  int v17 = 1;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  uint64_t v12 = 0;
  long long v10 = &unk_2703CFE20;
  uint64_t v18 = __p;
  sub_25442D54C((uint64_t)&v10, 0, 0, 0);
  int v8 = *a4;
  uint64_t v9 = *a5;
  v20[0] = &unk_2703CF758;
  v20[1] = a3;
  int v21 = v8;
  uint64_t v22 = v9;
  sub_25442D64C((uint64_t)&v10, (uint64_t)v20);
  operator new();
}

void sub_254423E0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  MEMORY[0x25A278F10](v24, 0x10F3C401C2224D9);
  sub_25442D3B0((uint64_t)&a10);
  if (a24 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_254423E58(uint64_t a1, char *__str, size_t __size)
{
  return snprintf(__str, __size, *(const char **)(a1 + 8), *(unsigned int *)(a1 + 16), *(void *)(a1 + 24));
}

void sub_254423E94(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_2703CF790;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_254423EB4(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_2703CF790;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x25A278F10);
}

void sub_254423F08(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  *(void *)(a1 + 48) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  if (*(char *)(a1 + 47) < 0)
  {
    uint64_t v3 = *(void **)(a1 + 24);
    operator delete(v3);
  }
}

uint64_t sub_254423F90(uint64_t *a1)
{
  uint64_t result = *a1;
  *a1 = 0;
  return result;
}

uint64_t lacc::LaccABI::allocate_return(lacc::LaccABI *this, int a2)
{
  *((_DWORD *)this + 5) -= a2;
  uint64_t v2 = (uint64_t (***)(void))*((void *)this + 3);
  ++*((_DWORD *)this + 2);
  return (**v2)(v2);
}

int *lacc::LaccABI::reserve(int *this)
{
  int v1 = *this;
  if (*this >= 11)
  {
    int v2 = this[5] - 4;
    this[4] = v2;
    this[5] = v2;
  }
  *this = v1 + 1;
  return this;
}

{
  int v1;
  int v2;

  int v1 = *this;
  if (*this >= 11)
  {
    int v2 = this[5] - 8;
    this[4] = v2;
    this[5] = v2;
  }
  *this = v1 + 2;
  return this;
}

_DWORD *lacc::LaccABI::reserve(_DWORD *result)
{
  int v1 = result[1];
  if (v1 >= 2)
  {
    int v2 = result[5] - 8;
    result[4] = v2;
    result[5] = v2;
  }
  result[1] = v1 + 1;
  return result;
}

{
  int v1;
  int v2;

  int v1 = result[1];
  if (v1 >= 2)
  {
    int v2 = result[5] - 16;
    result[4] = v2;
    result[5] = v2;
  }
  result[1] = v1 + 1;
  return result;
}

{
  int v1;
  int v2;

  int v1 = result[1];
  if (v1 >= 2)
  {
    int v2 = result[5] - 32;
    result[4] = v2;
    result[5] = v2;
  }
  result[1] = v1 + 1;
  return result;
}

{
  int v1;
  int v2;

  int v1 = result[1];
  if (v1 >= 2)
  {
    int v2 = result[5] - 32;
    result[4] = v2;
    result[5] = v2;
  }
  result[1] = v1 + 1;
  return result;
}

{
  int v1;
  int v2;

  int v1 = result[1];
  if (v1 >= 2)
  {
    int v2 = result[5] - 4;
    result[4] = v2;
    result[5] = v2;
  }
  result[1] = v1 + 1;
  return result;
}

{
  int v1;
  int v2;

  int v1 = result[1];
  if (v1 >= 2)
  {
    int v2 = result[5] - 8;
    result[4] = v2;
    result[5] = v2;
  }
  result[1] = v1 + 1;
  return result;
}

{
  int v1;
  int v2;

  int v1 = result[1];
  if (v1 >= 2)
  {
    int v2 = result[5] - 16;
    result[4] = v2;
    result[5] = v2;
  }
  result[1] = v1 + 1;
  return result;
}

{
  int v1;
  int v2;

  int v1 = result[1];
  if (v1 >= 2)
  {
    int v2 = result[5] - 16;
    result[4] = v2;
    result[5] = v2;
  }
  result[1] = v1 + 1;
  return result;
}

{
  int v1;
  int v2;

  int v1 = result[1];
  if (v1 >= 2)
  {
    int v2 = result[5] - 32;
    result[4] = v2;
    result[5] = v2;
  }
  result[1] = v1 + 1;
  return result;
}

{
  int v1;
  int v2;

  int v1 = result[1];
  if (v1 >= 2)
  {
    int v2 = result[5] - 32;
    result[4] = v2;
    result[5] = v2;
  }
  result[1] = v1 + 1;
  return result;
}

{
  int v1;
  int v2;

  int v1 = result[1];
  if (v1 >= 2)
  {
    int v2 = result[5] - 32;
    result[4] = v2;
    result[5] = v2;
  }
  result[1] = v1 + 1;
  return result;
}

{
  int v1;
  int v2;

  int v1 = result[1];
  if (v1 >= 2)
  {
    int v2 = result[5] - 32;
    result[4] = v2;
    result[5] = v2;
  }
  result[1] = v1 + 1;
  return result;
}

_DWORD *lacc::LaccABI::release(_DWORD *this)
{
  int v1 = (*this)--;
  if (v1 >= 12) {
    this[5] += 4;
  }
  return this;
}

int *lacc::LaccABI::release(int *this)
{
  int v1 = *this;
  *this -= 2;
  if (v1 >= 13) {
    this[5] += 8;
  }
  return this;
}

uint64_t lacc::LaccABI::release(uint64_t result)
{
  int v1 = *(_DWORD *)(result + 4);
  *(_DWORD *)(result + 4) = v1 - 1;
  if (v1 >= 3) {
    *(_DWORD *)(result + 20) += 8;
  }
  return result;
}

{
  int v1;

  int v1 = *(_DWORD *)(result + 4);
  *(_DWORD *)(result + 4) = v1 - 1;
  if (v1 >= 3) {
    *(_DWORD *)(result + 20) += 16;
  }
  return result;
}

{
  int v1;

  int v1 = *(_DWORD *)(result + 4);
  *(_DWORD *)(result + 4) = v1 - 1;
  if (v1 >= 3) {
    *(_DWORD *)(result + 20) += 32;
  }
  return result;
}

{
  int v1;

  int v1 = *(_DWORD *)(result + 4);
  *(_DWORD *)(result + 4) = v1 - 1;
  if (v1 >= 3) {
    *(_DWORD *)(result + 20) += 32;
  }
  return result;
}

{
  int v1;

  int v1 = *(_DWORD *)(result + 4);
  *(_DWORD *)(result + 4) = v1 - 1;
  if (v1 >= 3) {
    *(_DWORD *)(result + 20) += 4;
  }
  return result;
}

{
  int v1;

  int v1 = *(_DWORD *)(result + 4);
  *(_DWORD *)(result + 4) = v1 - 1;
  if (v1 >= 3) {
    *(_DWORD *)(result + 20) += 8;
  }
  return result;
}

{
  int v1;

  int v1 = *(_DWORD *)(result + 4);
  *(_DWORD *)(result + 4) = v1 - 1;
  if (v1 >= 3) {
    *(_DWORD *)(result + 20) += 16;
  }
  return result;
}

{
  int v1;

  int v1 = *(_DWORD *)(result + 4);
  *(_DWORD *)(result + 4) = v1 - 1;
  if (v1 >= 3) {
    *(_DWORD *)(result + 20) += 16;
  }
  return result;
}

{
  int v1;

  int v1 = *(_DWORD *)(result + 4);
  *(_DWORD *)(result + 4) = v1 - 1;
  if (v1 >= 3) {
    *(_DWORD *)(result + 20) += 32;
  }
  return result;
}

{
  int v1;

  int v1 = *(_DWORD *)(result + 4);
  *(_DWORD *)(result + 4) = v1 - 1;
  if (v1 >= 3) {
    *(_DWORD *)(result + 20) += 32;
  }
  return result;
}

{
  int v1;

  int v1 = *(_DWORD *)(result + 4);
  *(_DWORD *)(result + 4) = v1 - 1;
  if (v1 >= 3) {
    *(_DWORD *)(result + 20) += 32;
  }
  return result;
}

{
  int v1;

  int v1 = *(_DWORD *)(result + 4);
  *(_DWORD *)(result + 4) = v1 - 1;
  if (v1 >= 3) {
    *(_DWORD *)(result + 20) += 32;
  }
  return result;
}

uint64_t lacc::LaccABI::push(lacc::LaccABI *this, int a2)
{
  int v7 = a2;
  int v3 = *((_DWORD *)this + 2);
  if (v3 > 10)
  {
    uint64_t result = (*(uint64_t (**)(void, void, uint64_t, int *))(**((void **)this + 3) + 104))(*((void *)this + 3), *((unsigned int *)this + 4), 4, &v7);
    *((_DWORD *)this + 4) += 4;
    ++*((_DWORD *)this + 2);
  }
  else
  {
    uint64_t v4 = (uint64_t (***)(void))*((void *)this + 3);
    *((_DWORD *)this + 2) = v3 + 1;
    std::string::size_type v5 = **v4;
    return v5();
  }
  return result;
}

uint64_t lacc::LaccABI::pop(uint64_t this)
{
  return this;
}

{
  *(_DWORD *)(this + 8) -= 2;
  return this;
}

uint64_t lacc::LaccABI::push(lacc::LaccABI *this, uint64_t a2)
{
  uint64_t v8 = a2;
  int v3 = *((_DWORD *)this + 2);
  if (v3 > 10)
  {
    uint64_t result = (*(uint64_t (**)(void, void, uint64_t, uint64_t *))(**((void **)this + 3) + 104))(*((void *)this + 3), *((unsigned int *)this + 4), 8, &v8);
    *((_DWORD *)this + 4) += 8;
    *((_DWORD *)this + 2) += 2;
  }
  else
  {
    uint64_t v4 = (void (***)(void))*((void *)this + 3);
    *((_DWORD *)this + 2) = v3 + 1;
    (**v4)(v4);
    std::string::size_type v5 = (uint64_t (***)(void))*((void *)this + 3);
    ++*((_DWORD *)this + 2);
    std::string::size_type v6 = **v5;
    return v6();
  }
  return result;
}

uint64_t lacc::LaccABI::push(uint64_t a1, double a2)
{
  double v7 = a2;
  if (*(int *)(a1 + 12) > 1)
  {
    uint64_t result = (*(uint64_t (**)(void, void, uint64_t, double *))(**(void **)(a1 + 24) + 104))(*(void *)(a1 + 24), *(unsigned int *)(a1 + 16), 8, &v7);
    *(_DWORD *)(a1 + 16) += 8;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v6 = 0;
    long long v4 = *(unint64_t *)&a2;
    uint64_t result = (*(uint64_t (**)(void))(**(void **)(a1 + 24) + 56))(*(void *)(a1 + 24));
  }
  ++*(_DWORD *)(a1 + 12);
  return result;
}

{
  uint64_t result;
  long long v4;
  uint64_t v5;
  uint64_t v6;
  double v7;

  double v7 = a2;
  if (*(int *)(a1 + 12) > 1)
  {
    uint64_t result = (*(uint64_t (**)(void, void, uint64_t, double *))(**(void **)(a1 + 24) + 104))(*(void *)(a1 + 24), *(unsigned int *)(a1 + 16), 8, &v7);
    *(_DWORD *)(a1 + 16) += 8;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v6 = 0;
    long long v4 = *(unint64_t *)&a2;
    uint64_t result = (*(uint64_t (**)(void))(**(void **)(a1 + 24) + 24))(*(void *)(a1 + 24));
  }
  ++*(_DWORD *)(a1 + 12);
  return result;
}

uint64_t lacc::LaccABI::push(uint64_t a1, __n128 a2)
{
  __n128 v7 = a2;
  if (*(int *)(a1 + 12) > 1)
  {
    uint64_t result = (*(uint64_t (**)(void, void, uint64_t, __n128 *))(**(void **)(a1 + 24) + 104))(*(void *)(a1 + 24), *(unsigned int *)(a1 + 16), 16, &v7);
    *(_DWORD *)(a1 + 16) += 16;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v6 = 0;
    __n128 v4 = a2;
    uint64_t result = (*(uint64_t (**)(void))(**(void **)(a1 + 24) + 56))(*(void *)(a1 + 24));
  }
  ++*(_DWORD *)(a1 + 12);
  return result;
}

{
  uint64_t result;
  __n128 v4;
  long long v5;
  __n128 v6;

  uint64_t v6 = a2;
  if (*(int *)(a1 + 12) > 1)
  {
    uint64_t result = (*(uint64_t (**)(void, void, uint64_t, __n128 *))(**(void **)(a1 + 24) + 104))(*(void *)(a1 + 24), *(unsigned int *)(a1 + 16), 16, &v6);
    *(_DWORD *)(a1 + 16) += 16;
  }
  else
  {
    a2.n128_u32[3] = 0;
    __n128 v4 = a2;
    uint64_t v5 = 0u;
    uint64_t result = (*(uint64_t (**)(void))(**(void **)(a1 + 24) + 24))(*(void *)(a1 + 24));
  }
  ++*(_DWORD *)(a1 + 12);
  return result;
}

{
  uint64_t result;
  __n128 v4;
  uint64_t v5;
  uint64_t v6;
  __n128 v7;

  __n128 v7 = a2;
  if (*(int *)(a1 + 12) > 1)
  {
    uint64_t result = (*(uint64_t (**)(void, void, uint64_t, __n128 *))(**(void **)(a1 + 24) + 104))(*(void *)(a1 + 24), *(unsigned int *)(a1 + 16), 16, &v7);
    *(_DWORD *)(a1 + 16) += 16;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v6 = 0;
    __n128 v4 = a2;
    uint64_t result = (*(uint64_t (**)(void))(**(void **)(a1 + 24) + 24))(*(void *)(a1 + 24));
  }
  ++*(_DWORD *)(a1 + 12);
  return result;
}

uint64_t lacc::LaccABI::push(uint64_t a1, long long *a2)
{
  long long v3 = *a2;
  long long v4 = a2[1];
  v8[0] = *a2;
  v8[1] = v4;
  if (*(int *)(a1 + 12) > 1)
  {
    uint64_t result = (*(uint64_t (**)(void, void, uint64_t, _OWORD *))(**(void **)(a1 + 24) + 104))(*(void *)(a1 + 24), *(unsigned int *)(a1 + 16), 32, v8);
    *(_DWORD *)(a1 + 16) += 32;
  }
  else
  {
    long long v6 = v3;
    long long v7 = (unint64_t)v4;
    uint64_t result = (*(uint64_t (**)(void))(**(void **)(a1 + 24) + 56))(*(void *)(a1 + 24));
  }
  ++*(_DWORD *)(a1 + 12);
  return result;
}

{
  long long v3;
  long long v4;
  uint64_t result;
  long long v6;
  long long v7;
  _OWORD v8[2];

  long long v3 = *a2;
  long long v4 = a2[1];
  v8[0] = *a2;
  v8[1] = v4;
  if (*(int *)(a1 + 12) > 1)
  {
    uint64_t result = (*(uint64_t (**)(void, void, uint64_t, _OWORD *))(**(void **)(a1 + 24) + 104))(*(void *)(a1 + 24), *(unsigned int *)(a1 + 16), 32, v8);
    *(_DWORD *)(a1 + 16) += 32;
  }
  else
  {
    long long v6 = v3;
    long long v7 = v4;
    uint64_t result = (*(uint64_t (**)(void))(**(void **)(a1 + 24) + 56))(*(void *)(a1 + 24));
  }
  ++*(_DWORD *)(a1 + 12);
  return result;
}

{
  long long v3;
  unsigned int v4;
  uint64_t result;
  long long v6;
  long long v7;
  long long v8;
  unsigned int v9;

  long long v3 = *a2;
  long long v4 = *((_DWORD *)a2 + 4);
  uint64_t v9 = v4;
  uint64_t v8 = v3;
  if (*(int *)(a1 + 12) > 1)
  {
    uint64_t result = (*(uint64_t (**)(void, void, uint64_t, long long *))(**(void **)(a1 + 24) + 104))(*(void *)(a1 + 24), *(unsigned int *)(a1 + 16), 32, &v8);
    *(_DWORD *)(a1 + 16) += 32;
  }
  else
  {
    long long v6 = v3;
    long long v7 = v4;
    uint64_t result = (*(uint64_t (**)(void))(**(void **)(a1 + 24) + 24))(*(void *)(a1 + 24));
  }
  ++*(_DWORD *)(a1 + 12);
  return result;
}

{
  long long v3;
  long long v4;
  long long v5;
  uint64_t result;
  long long v7;
  long long v8;
  long long v9;
  uint64_t v10;
  int v11;

  long long v3 = *a2;
  long long v4 = a2[1];
  int v11 = *((void *)a2 + 3);
  long long v10 = v4;
  uint64_t v9 = v3;
  if (*(int *)(a1 + 12) > 1)
  {
    uint64_t result = (*(uint64_t (**)(void, void, uint64_t, long long *))(**(void **)(a1 + 24) + 104))(*(void *)(a1 + 24), *(unsigned int *)(a1 + 16), 32, &v9);
    *(_DWORD *)(a1 + 16) += 32;
  }
  else
  {
    *(void *)&uint64_t v5 = v4;
    *((void *)&v5 + 1) = DWORD2(v4);
    long long v7 = v3;
    uint64_t v8 = v5;
    uint64_t result = (*(uint64_t (**)(void))(**(void **)(a1 + 24) + 24))(*(void *)(a1 + 24));
  }
  ++*(_DWORD *)(a1 + 12);
  return result;
}

{
  long long v3;
  long long v4;
  uint64_t result;
  long long v6;
  long long v7;
  _OWORD v8[2];

  long long v3 = *a2;
  long long v4 = a2[1];
  v8[0] = *a2;
  v8[1] = v4;
  if (*(int *)(a1 + 12) > 1)
  {
    uint64_t result = (*(uint64_t (**)(void, void, uint64_t, _OWORD *))(**(void **)(a1 + 24) + 104))(*(void *)(a1 + 24), *(unsigned int *)(a1 + 16), 32, v8);
    *(_DWORD *)(a1 + 16) += 32;
  }
  else
  {
    long long v6 = v3;
    long long v7 = v4;
    uint64_t result = (*(uint64_t (**)(void))(**(void **)(a1 + 24) + 24))(*(void *)(a1 + 24));
  }
  ++*(_DWORD *)(a1 + 12);
  return result;
}

uint64_t lacc::LaccABI::push(uint64_t a1, int a2)
{
  int v4 = a2;
  if (*(int *)(a1 + 12) > 1)
  {
    uint64_t result = (*(uint64_t (**)(void, void, uint64_t, int *))(**(void **)(a1 + 24) + 104))(*(void *)(a1 + 24), *(unsigned int *)(a1 + 16), 4, &v4);
    *(_DWORD *)(a1 + 16) += 4;
  }
  else
  {
    uint64_t result = (*(uint64_t (**)(void))(**(void **)(a1 + 24) + 24))(*(void *)(a1 + 24));
  }
  ++*(_DWORD *)(a1 + 12);
  return result;
}

uint64_t lacc::LaccABI::push(uint64_t a1, _OWORD *a2)
{
  long long v3 = *a2;
  long long v4 = a2[1];
  uint64_t v9 = *((void *)a2 + 2);
  long long v8 = v3;
  if (*(int *)(a1 + 12) > 1)
  {
    uint64_t result = (*(uint64_t (**)(void, void, uint64_t, long long *))(**(void **)(a1 + 24) + 104))(*(void *)(a1 + 24), *(unsigned int *)(a1 + 16), 32, &v8);
    *(_DWORD *)(a1 + 16) += 32;
  }
  else
  {
    long long v6 = v3;
    long long v7 = (unint64_t)v4;
    uint64_t result = (*(uint64_t (**)(void))(**(void **)(a1 + 24) + 24))(*(void *)(a1 + 24));
  }
  ++*(_DWORD *)(a1 + 12);
  return result;
}

uint64_t lacc::LaccABI::pop(uint64_t result)
{
  return result;
}

{
  --*(_DWORD *)(result + 12);
  return result;
}

{
  --*(_DWORD *)(result + 12);
  return result;
}

{
  --*(_DWORD *)(result + 12);
  return result;
}

{
  --*(_DWORD *)(result + 12);
  return result;
}

{
  --*(_DWORD *)(result + 12);
  return result;
}

{
  --*(_DWORD *)(result + 12);
  return result;
}

{
  --*(_DWORD *)(result + 12);
  return result;
}

{
  --*(_DWORD *)(result + 12);
  return result;
}

{
  --*(_DWORD *)(result + 12);
  return result;
}

{
  --*(_DWORD *)(result + 12);
  return result;
}

{
  --*(_DWORD *)(result + 12);
  return result;
}

uint64_t lacc::LaccABI::insert(lacc::LaccABI *this, void *a2, int a3)
{
  int v6 = *((_DWORD *)this + 5) - a3;
  *((_DWORD *)this + 5) = v6;
  long long v8 = (char *)*((void *)this + 6);
  unint64_t v7 = *((void *)this + 7);
  if ((unint64_t)v8 >= v7)
  {
    long long v10 = (char **)((char *)this + 40);
    int v11 = (char *)*((void *)this + 5);
    uint64_t v12 = (v8 - v11) >> 4;
    unint64_t v13 = v12 + 1;
    if ((unint64_t)(v12 + 1) >> 60) {
      sub_254422570();
    }
    uint64_t v14 = v7 - (void)v11;
    if (v14 >> 3 > v13) {
      unint64_t v13 = v14 >> 3;
    }
    if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v15 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v15 = v13;
    }
    if (v15)
    {
      if (v15 >> 60) {
        sub_254422618();
      }
      uint64_t v16 = (char *)operator new(16 * v15);
    }
    else
    {
      uint64_t v16 = 0;
    }
    int v17 = &v16[16 * v12];
    *(_DWORD *)int v17 = v6;
    *((_DWORD *)v17 + 1) = a3;
    *((void *)v17 + 1) = a2;
    uint64_t v9 = v17 + 16;
    if (v8 != v11)
    {
      do
      {
        *((_OWORD *)v17 - 1) = *((_OWORD *)v8 - 1);
        v17 -= 16;
        v8 -= 16;
      }
      while (v8 != v11);
      long long v8 = *v10;
    }
    *((void *)this + 5) = v17;
    *((void *)this + 6) = v9;
    *((void *)this + 7) = &v16[16 * v15];
    if (v8) {
      operator delete(v8);
    }
  }
  else
  {
    *(_DWORD *)long long v8 = v6;
    *((_DWORD *)v8 + 1) = a3;
    uint64_t v9 = v8 + 16;
    *((void *)v8 + 1) = a2;
  }
  *((void *)this + 6) = v9;
  return *((unsigned int *)this + 5);
}

uint64_t lacc::LaccABI::extract(lacc::LaccABI *this, void *a2, uint64_t a3)
{
  int v3 = a3;
  uint64_t v5 = *((unsigned int *)this + 5);
  (*(void (**)(void, uint64_t, uint64_t, void *))(**((void **)this + 3) + 112))(*((void *)this + 3), v5, a3, a2);
  *((_DWORD *)this + 5) += v3;
  return v5;
}

uint64_t lacc::LaccABI::insert(lacc::LaccABI *this, const void *a2, int a3)
{
  int v6 = *((_DWORD *)this + 5) - a3;
  *((_DWORD *)this + 5) = v6;
  long long v8 = (char *)*((void *)this + 6);
  unint64_t v7 = *((void *)this + 7);
  if ((unint64_t)v8 >= v7)
  {
    long long v10 = (char **)((char *)this + 40);
    int v11 = (char *)*((void *)this + 5);
    uint64_t v12 = (v8 - v11) >> 4;
    unint64_t v13 = v12 + 1;
    if ((unint64_t)(v12 + 1) >> 60) {
      sub_254422570();
    }
    uint64_t v14 = v7 - (void)v11;
    if (v14 >> 3 > v13) {
      unint64_t v13 = v14 >> 3;
    }
    if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v15 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v15 = v13;
    }
    if (v15)
    {
      if (v15 >> 60) {
        sub_254422618();
      }
      uint64_t v16 = (char *)operator new(16 * v15);
    }
    else
    {
      uint64_t v16 = 0;
    }
    int v17 = &v16[16 * v12];
    *(_DWORD *)int v17 = v6;
    *((_DWORD *)v17 + 1) = a3;
    *((void *)v17 + 1) = a2;
    uint64_t v9 = v17 + 16;
    if (v8 != v11)
    {
      do
      {
        *((_OWORD *)v17 - 1) = *((_OWORD *)v8 - 1);
        v17 -= 16;
        v8 -= 16;
      }
      while (v8 != v11);
      long long v8 = *v10;
    }
    *((void *)this + 5) = v17;
    *((void *)this + 6) = v9;
    *((void *)this + 7) = &v16[16 * v15];
    if (v8) {
      operator delete(v8);
    }
  }
  else
  {
    *(_DWORD *)long long v8 = v6;
    *((_DWORD *)v8 + 1) = a3;
    uint64_t v9 = v8 + 16;
    *((void *)v8 + 1) = a2;
  }
  *((void *)this + 6) = v9;
  return *((unsigned int *)this + 5);
}

uint64_t lacc::LaccABI::extract(lacc::LaccABI *this, const void *a2, int a3)
{
  uint64_t v3 = *((unsigned int *)this + 5);
  *((_DWORD *)this + 5) = v3 + a3;
  return v3;
}

uint64_t lacc::LaccABI::write_stack_items(uint64_t this)
{
  uint64_t v1 = this;
  int v2 = *(unsigned int **)(this + 40);
  uint64_t v3 = *(unsigned int **)(this + 48);
  if (v2 != v3)
  {
    do
    {
      this = (*(uint64_t (**)(void, void, void, void))(**(void **)(v1 + 24) + 104))(*(void *)(v1 + 24), *v2, v2[1], *((void *)v2 + 1));
      v2 += 4;
    }
    while (v2 != v3);
    int v2 = *(unsigned int **)(v1 + 40);
  }
  *(void *)(v1 + 4--*(_DWORD *)(this + 8) = v2;
  return this;
}

double lacc::LaccABI::get_return_vd4@<D0>(lacc::LaccABI *this@<X0>, _OWORD *a2@<X8>)
{
  (*(void (**)(_OWORD *__return_ptr))(**((void **)this + 3) + 72))(v5);
  double result = *(double *)v5;
  long long v4 = v5[1];
  *a2 = v5[0];
  a2[1] = v4;
  return result;
}

double lacc::LaccABI::get_return_vf8@<D0>(lacc::LaccABI *this@<X0>, _OWORD *a2@<X8>)
{
  (*(void (**)(_OWORD *__return_ptr))(**((void **)this + 3) + 40))(v5);
  double result = *(double *)v5;
  long long v4 = v5[1];
  *a2 = v5[0];
  a2[1] = v4;
  return result;
}

uint64_t lacc::LaccABI::get_return_u32(lacc::LaccABI *this)
{
  return (*(uint64_t (**)(void, void))(**((void **)this + 3) + 8))(*((void *)this + 3), 0);
}

uint64_t lacc::LaccABI::get_return(lacc::LaccABI *this, void *a2)
{
  uint64_t v3 = *((void *)this + 3);
  --*((_DWORD *)this + 2);
  (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
  long long v4 = *(uint64_t (**)(void))(**((void **)this + 3) + 112);

  return v4();
}

void lacc::LaccABI::~LaccABI(lacc::LaccABI *this)
{
  int v2 = (std::__shared_weak_count *)*((void *)this + 9);
  if (v2 && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
    uint64_t v3 = (void *)*((void *)this + 5);
    if (!v3) {
      return;
    }
  }
  else
  {
    uint64_t v3 = (void *)*((void *)this + 5);
    if (!v3) {
      return;
    }
  }
  *((void *)this + 6) = v3;
  operator delete(v3);
}

{
  std::__shared_weak_count *v2;
  void *v3;

  int v2 = (std::__shared_weak_count *)*((void *)this + 9);
  if (v2 && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
    uint64_t v3 = (void *)*((void *)this + 5);
    if (!v3) {
      return;
    }
  }
  else
  {
    uint64_t v3 = (void *)*((void *)this + 5);
    if (!v3) {
      return;
    }
  }
  *((void *)this + 6) = v3;
  operator delete(v3);
}

void lacc::LaccABI::LaccABI(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = 0;
  *(void *)(a1 + --*(_DWORD *)(this + 8) = 0;
  *(void *)(a1 + 24) = a2;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(void *)(a1 + 72) = 0;
  int v3 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 80))(a2);
  *(_DWORD *)(a1 + 32) = v3 - 64;
  *(_DWORD *)(a1 + 16) = v3 - 64;
  *(_DWORD *)(a1 + 20) = v3 - 64;
  operator new();
}

void sub_254425790(_Unwind_Exception *a1)
{
  MEMORY[0x25A278F10](v2, 0xC400A2AC0F1);
  sub_25441EE8C(v1 + 64);
  uint64_t v5 = *v3;
  if (*v3)
  {
    *(void *)(v1 + 4--*(_DWORD *)(this + 8) = v5;
    operator delete(v5);
  }
  _Unwind_Resume(a1);
}

uint64_t lacc::LaccABI::allocate_stack(lacc::LaccABI *this)
{
  (*(void (**)(void, void, void))(**((void **)this + 3) + 96))(*((void *)this + 3), *((unsigned int *)this + 8), (*((_DWORD *)this + 8) - *((_DWORD *)this + 5)));
  uint64_t v2 = (uint64_t (*)(void))***((void ***)this + 3);

  return v2();
}

uint64_t lacc::LaccABI::call(lacc::LaccABI *this)
{
  uint64_t result = (*(uint64_t (**)(void))(**((void **)this + 3) + 120))(*((void *)this + 3));
  if ((result & 1) == 0)
  {
    *(void *)this = 0;
    *((void *)this + 1) = 0;
  }
  return result;
}

uint64_t lacc::LaccABI::call(lacc::LaccABI *this, const char *a2)
{
  uint64_t result = (*(uint64_t (**)(void, const char *, void))(**((void **)this + 3) + 128))(*((void *)this + 3), a2, 0);
  if ((result & 1) == 0)
  {
    *(void *)this = 0;
    *((void *)this + 1) = 0;
  }
  return result;
}

uint64_t lacc::LaccABI::read_register(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 168))();
}

uint64_t lacc::LaccABI::dump_registers(uint64_t a1)
{
  sub_254426398((uint64_t)v51);
  uint64_t v50 = 0;
  int v2 = (*(uint64_t (**)(uint64_t, uint64_t, char *, uint64_t *))(*(void *)a1 + 168))(a1, 2000, (char *)&v50 + 4, &v50);
  if (v50 == 4) {
    int v3 = v2;
  }
  else {
    int v3 = 0;
  }
  if (v3 == 1)
  {
    long long v4 = sub_254426880(v52, (uint64_t)" ", 1);
    uint64_t v5 = *v4;
    *(_DWORD *)((char *)v4 + *(void *)(*v4 - 24) + --*(_DWORD *)(this + 8) = *(_DWORD *)((unsigned char *)v4 + *(void *)(*v4 - 24) + 8) & 0xFFFFFF4F | 0x20;
    *(uint64_t *)((char *)v4 + *(void *)(v5 - 24) + 24) = 6;
    int v6 = sub_254426880(v4, (uint64_t)"PC", 2);
    unint64_t v7 = sub_254426880(v6, (uint64_t)": ", 2);
    uint64_t v8 = *v7;
    *(_DWORD *)((char *)v7 + *(void *)(*v7 - 24) + --*(_DWORD *)(this + 8) = *(_DWORD *)((unsigned char *)v7 + *(void *)(*v7 - 24) + 8) & 0xFFFFFF4F | 0x80;
    *(_DWORD *)((char *)v7 + *(void *)(v8 - 24) + --*(_DWORD *)(this + 8) = *(_DWORD *)((unsigned char *)v7 + *(void *)(v8 - 24) + 8) & 0xFFFFFFB5 | 8;
    *(uint64_t *)((char *)v7 + *(void *)(v8 - 24) + 24) = 8;
    std::ostream::operator<<();
  }
  int v9 = (*(uint64_t (**)(uint64_t, uint64_t, char *, uint64_t *))(*(void *)a1 + 168))(a1, 2004, (char *)&v50 + 4, &v50);
  if (v50 == 4) {
    int v10 = v9;
  }
  else {
    int v10 = 0;
  }
  if (v10 == 1)
  {
    int v11 = sub_254426880(v52, (uint64_t)" ", 1);
    uint64_t v12 = *v11;
    *(_DWORD *)((char *)v11 + *(void *)(*v11 - 24) + --*(_DWORD *)(this + 8) = *(_DWORD *)((unsigned char *)v11 + *(void *)(*v11 - 24) + 8) & 0xFFFFFF4F | 0x20;
    *(uint64_t *)((char *)v11 + *(void *)(v12 - 24) + 24) = 6;
    unint64_t v13 = sub_254426880(v11, (uint64_t)"RET", 3);
    uint64_t v14 = sub_254426880(v13, (uint64_t)": ", 2);
    uint64_t v15 = *v14;
    *(_DWORD *)((char *)v14 + *(void *)(*v14 - 24) + --*(_DWORD *)(this + 8) = *(_DWORD *)((unsigned char *)v14 + *(void *)(*v14 - 24) + 8) & 0xFFFFFF4F | 0x80;
    *(_DWORD *)((char *)v14 + *(void *)(v15 - 24) + --*(_DWORD *)(this + 8) = *(_DWORD *)((unsigned char *)v14 + *(void *)(v15 - 24) + 8) & 0xFFFFFFB5 | 8;
    *(uint64_t *)((char *)v14 + *(void *)(v15 - 24) + 24) = 8;
    std::ostream::operator<<();
  }
  int v16 = (*(uint64_t (**)(uint64_t, uint64_t, char *, uint64_t *))(*(void *)a1 + 168))(a1, 2008, (char *)&v50 + 4, &v50);
  if (v50 == 4) {
    int v17 = v16;
  }
  else {
    int v17 = 0;
  }
  if (v17 == 1)
  {
    uint64_t v18 = sub_254426880(v52, (uint64_t)" ", 1);
    uint64_t v19 = *v18;
    *(_DWORD *)((char *)v18 + *(void *)(*v18 - 24) + --*(_DWORD *)(this + 8) = *(_DWORD *)((unsigned char *)v18 + *(void *)(*v18 - 24) + 8) & 0xFFFFFF4F | 0x20;
    *(uint64_t *)((char *)v18 + *(void *)(v19 - 24) + 24) = 6;
    std::string v20 = sub_254426880(v18, (uint64_t)"STAT0", 5);
    int v21 = sub_254426880(v20, (uint64_t)": ", 2);
    uint64_t v22 = *v21;
    *(_DWORD *)((char *)v21 + *(void *)(*v21 - 24) + --*(_DWORD *)(this + 8) = *(_DWORD *)((unsigned char *)v21 + *(void *)(*v21 - 24) + 8) & 0xFFFFFF4F | 0x80;
    *(_DWORD *)((char *)v21 + *(void *)(v22 - 24) + --*(_DWORD *)(this + 8) = *(_DWORD *)((unsigned char *)v21 + *(void *)(v22 - 24) + 8) & 0xFFFFFFB5 | 8;
    *(uint64_t *)((char *)v21 + *(void *)(v22 - 24) + 24) = 8;
    std::ostream::operator<<();
  }
  int v23 = (*(uint64_t (**)(uint64_t, uint64_t, char *, uint64_t *))(*(void *)a1 + 168))(a1, 10000, (char *)&v50 + 4, &v50);
  if (v50 == 4) {
    int v24 = v23;
  }
  else {
    int v24 = 0;
  }
  if (v24 == 1)
  {
    long long v25 = sub_254426880(v52, (uint64_t)" ", 1);
    uint64_t v26 = *v25;
    *(_DWORD *)((char *)v25 + *(void *)(*v25 - 24) + --*(_DWORD *)(this + 8) = *(_DWORD *)((unsigned char *)v25 + *(void *)(*v25 - 24) + 8) & 0xFFFFFF4F | 0x20;
    *(uint64_t *)((char *)v25 + *(void *)(v26 - 24) + 24) = 6;
    uint64_t v27 = sub_254426880(v25, (uint64_t)"PKTS", 4);
    std::string::size_type v28 = sub_254426880(v27, (uint64_t)": ", 2);
    uint64_t v29 = *v28;
    *(_DWORD *)((char *)v28 + *(void *)(*v28 - 24) + --*(_DWORD *)(this + 8) = *(_DWORD *)((unsigned char *)v28 + *(void *)(*v28 - 24) + 8) & 0xFFFFFF4F | 0x80;
    *(_DWORD *)((char *)v28 + *(void *)(v29 - 24) + --*(_DWORD *)(this + 8) = *(_DWORD *)((unsigned char *)v28 + *(void *)(v29 - 24) + 8) & 0xFFFFFFB5 | 8;
    *(uint64_t *)((char *)v28 + *(void *)(v29 - 24) + 24) = 8;
    std::ostream::operator<<();
  }
  sub_254426880(v52, (uint64_t)"\n", 1);
  uint64_t v30 = 0;
  for (int i = 0; i != 32; ++i)
  {
    int v32 = (*(uint64_t (**)(uint64_t, uint64_t, char *, uint64_t *))(*(void *)a1 + 168))(a1, v30, (char *)&v50 + 4, &v50);
    if (v50 == 4) {
      int v33 = v32;
    }
    else {
      int v33 = 0;
    }
    if (v33 == 1)
    {
      std::string v34 = sub_254426880(v52, (uint64_t)" ", 1);
      uint64_t v35 = *v34;
      *(_DWORD *)((char *)v34 + *(void *)(*v34 - 24) + --*(_DWORD *)(this + 8) = *(_DWORD *)((unsigned char *)v34 + *(void *)(*v34 - 24) + 8) & 0xFFFFFF4F | 0x20;
      *(uint64_t *)((char *)v34 + *(void *)(v35 - 24) + 24) = 6;
      std::to_string(&v47, i);
      std::string v36 = std::string::insert(&v47, 0, "R");
      long long v37 = *(_OWORD *)&v36->__r_.__value_.__l.__data_;
      int64_t v49 = v36->__r_.__value_.__r.__words[2];
      *(_OWORD *)__p = v37;
      v36->__r_.__value_.__l.__size_ = 0;
      v36->__r_.__value_.__r.__words[2] = 0;
      v36->__r_.__value_.__r.__words[0] = 0;
      if (v49 >= 0) {
        __int16 v38 = __p;
      }
      else {
        __int16 v38 = (void **)__p[0];
      }
      if (v49 >= 0) {
        uint64_t v39 = HIBYTE(v49);
      }
      else {
        uint64_t v39 = (uint64_t)__p[1];
      }
      uint64_t v40 = sub_254426880(v34, (uint64_t)v38, v39);
      unint64_t v41 = sub_254426880(v40, (uint64_t)": ", 2);
      uint64_t v42 = *v41;
      *(_DWORD *)((char *)v41 + *(void *)(*v41 - 24) + --*(_DWORD *)(this + 8) = *(_DWORD *)((unsigned char *)v41 + *(void *)(*v41 - 24) + 8) & 0xFFFFFF4F | 0x80;
      *(_DWORD *)((char *)v41 + *(void *)(v42 - 24) + --*(_DWORD *)(this + 8) = *(_DWORD *)((unsigned char *)v41 + *(void *)(v42 - 24) + 8) & 0xFFFFFFB5 | 8;
      *(uint64_t *)((char *)v41 + *(void *)(v42 - 24) + 24) = 8;
      __int16 v43 = (void *)std::ostream::operator<<();
      if ((i & 3) == 3) {
        uint64_t v44 = "\n";
      }
      else {
        uint64_t v44 = "";
      }
      sub_254426880(v43, (uint64_t)v44, (i & 3) == 3);
      if (SHIBYTE(v49) < 0)
      {
        operator delete(__p[0]);
        if ((SHIBYTE(v47.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
          goto LABEL_22;
        }
      }
      else if ((SHIBYTE(v47.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
        goto LABEL_22;
      }
      operator delete(v47.__r_.__value_.__l.__data_);
    }
LABEL_22:
    uint64_t v30 = (v30 + 4);
  }
  std::stringbuf::str();
  v51[0] = *MEMORY[0x263F8C2B8];
  uint64_t v45 = *(void *)(MEMORY[0x263F8C2B8] + 72);
  *(void *)((char *)v51 + *(void *)(v51[0] - 24)) = *(void *)(MEMORY[0x263F8C2B8] + 64);
  v52[0] = v45;
  v52[1] = MEMORY[0x263F8C318] + 16;
  if (v53 < 0) {
    operator delete((void *)v52[9]);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return MEMORY[0x25A278E90](&v54);
}

void sub_2544262C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  sub_25442667C((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_2544262D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  sub_25442667C((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_2544262E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  sub_25442667C((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_2544262FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  sub_25442667C((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_254426310(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,char a25)
{
  if ((a17 & 0x80000000) == 0)
  {
    sub_25442667C((uint64_t)&a25);
    _Unwind_Resume(a1);
  }
  operator delete(__p);
  sub_25442667C((uint64_t)&a25);
  _Unwind_Resume(a1);
}

void sub_254426384(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  sub_25442667C((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_254426398(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263F8C328] + 104;
  *(void *)(a1 + 12--*(_DWORD *)(this + 8) = MEMORY[0x263F8C328] + 104;
  uint64_t v3 = a1 + 16;
  uint64_t v4 = MEMORY[0x263F8C328] + 64;
  *(void *)(a1 + 16) = MEMORY[0x263F8C328] + 64;
  uint64_t v5 = (void *)MEMORY[0x263F8C2B8];
  uint64_t v6 = *(void *)(MEMORY[0x263F8C2B8] + 24);
  uint64_t v7 = *(void *)(MEMORY[0x263F8C2B8] + 16);
  *(void *)a1 = v7;
  *(void *)(a1 + *(void *)(v7 - 24)) = v6;
  *(void *)(a1 + --*(_DWORD *)(this + 8) = 0;
  uint64_t v8 = (std::ios_base *)(a1 + *(void *)(*(void *)a1 - 24));
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
  *(void *)(a1 + 12--*(_DWORD *)(this + 8) = v2;
  *(void *)(a1 + 16) = v4;
  std::streambuf::basic_streambuf();
  *(void *)(a1 + 24) = MEMORY[0x263F8C318] + 16;
  *(_OWORD *)(a1 + 8--*(_DWORD *)(this + 8) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_DWORD *)(a1 + 120) = 24;
  return a1;
}

void sub_254426648(_Unwind_Exception *a1)
{
  std::iostream::~basic_iostream();
  MEMORY[0x25A278E90](v1);
  _Unwind_Resume(a1);
}

uint64_t sub_25442667C(uint64_t a1)
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
  MEMORY[0x25A278E90](a1 + 128);
  return a1;
}

void sub_2544267B8(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x25A278F10);
}

uint64_t sub_2544267F0(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    JUMPOUT(0x25A278F10);
  }
  return result;
}

uint64_t sub_25442680C(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "NSt3__110shared_ptrIN4lacc13CaptureReplayEE27__shared_ptr_default_deleteIS2_S2_EE") {
    return a1 + 24;
  }
  if (((v3 & (unint64_t)"NSt3__110shared_ptrIN4lacc13CaptureReplayEE27__shared_ptr_default_deleteIS2_S2_EE" & 0x8000000000000000) != 0) == __OFSUB__(v3, "NSt3__110shared_ptrIN4lacc13CaptureReplayEE27__shared_ptr_default_deleteIS2_S2_EE")) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"NSt3__110shared_ptrIN4lacc13CaptureReplayEE27__shared_ptr_default_deleteIS2_S2_EE" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 24; {
  return 0;
  }
}

void *sub_254426880(void *a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x25A278D40](v13, a1);
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
    if (!sub_254426A24(v7, a2, v11, a2 + a3, v6, (char)v9)) {
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | 5);
    }
  }
  MEMORY[0x25A278D50](v13);
  return a1;
}

void sub_2544269BC(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  MEMORY[0x25A278D50](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(void *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x25442699CLL);
}

void sub_254426A10(_Unwind_Exception *a1)
{
}

uint64_t sub_254426A24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
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
        sub_254422888();
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
      *((unsigned char *)v13 + v--*(_DWORD *)(result + 12) = 0;
      if (v22 >= 0) {
        int v16 = __b;
      }
      else {
        int v16 = (void **)__b[0];
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

void sub_254426BF8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t lacc::Counts::read_from@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  lacc::LaccABI::read_register(a1);
  lacc::LaccABI::read_register(a1);
  lacc::LaccABI::read_register(a1);
  lacc::LaccABI::read_register(a1);
  lacc::LaccABI::read_register(a1);
  return lacc::LaccABI::read_register(a1);
}

lacc_hardware::LaccHardware *lacc_hardware::LaccHardware::LaccHardware(lacc_hardware::LaccHardware *this)
{
  uint64_t v2 = operator new(0x38uLL);
  v2[1] = 0;
  v2[2] = 0;
  void *v2 = &unk_2703CF830;
  *(void *)this = sub_254427154(v2 + 3);
  *((void *)this + 1) = v2;
  return this;
}

{
  void *v2;

  uint64_t v2 = operator new(0x38uLL);
  v2[1] = 0;
  v2[2] = 0;
  void *v2 = &unk_2703CF830;
  *(void *)this = sub_254427154(v2 + 3);
  *((void *)this + 1) = v2;
  return this;
}

void sub_254426DEC(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  operator delete(v3);
  _Unwind_Resume(a1);
}

void sub_254426E5C(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  operator delete(v3);
  _Unwind_Resume(a1);
}

uint64_t lacc_hardware::LaccHardware::operator lacc_hardware::LaccHw &(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t lacc_hardware::LaccHardware::operator lacc::CallInterface &(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t lacc_hardware::LaccHardware::operator lacc::ConfigInterface &(void *a1)
{
  return *a1 + 8;
}

void sub_254426E98(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_2703CF830;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_254426EB8(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_2703CF830;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x25A278F10);
}

uint64_t sub_254426F0C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 24) + 176))();
}

void *sub_254426F34(void *a1)
{
  *a1 = &unk_2703CF880;
  a1[1] = &unk_2703CF960;
  int v2 = CVHWAGeneralProcessingCreate();
  if (v2)
  {
    if (v2 == 3)
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x25A278CD0](exception, "Could not allocate context for AppleCVHWA");
      goto LABEL_15;
    }
    if (v2 == 2)
    {
      uint64_t v5 = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
      std::logic_error::logic_error(v5, "Nullpointer exception in CVHWAGeneralProcessingCreate");
      goto LABEL_10;
    }
    goto LABEL_14;
  }
  int v3 = CVHWAGeneralProcessingConfigCreate();
  if (v3)
  {
    if (v3 == 3)
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x25A278CD0](exception, "Could not allocate configuration context for AppleCVHWA");
      goto LABEL_15;
    }
    if (v3 == 2)
    {
      uint64_t v5 = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
      std::logic_error::logic_error(v5, "Nullpointer exception in CVHWAGeneralProcessingConfigCreate");
LABEL_10:
      v5->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C3A0] + 16);
      __cxa_throw(v5, (struct type_info *)off_2653AC0A0, MEMORY[0x263F8C080]);
    }
LABEL_14:
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x25A278CD0](exception, "unknown error in AppleCVHWA");
LABEL_15:
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  CVHWAGeneralProcessingConfigSetAccelInstance();
  return a1;
}

void sub_2544270DC(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_2544270F0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_254427104(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_254427118(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_25442712C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_254427140(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void *sub_254427158(void *a1)
{
  *a1 = &unk_2703CF880;
  a1[1] = &unk_2703CF960;
  if (a1[2])
  {
    CVHWAGeneralProcessingRelease();
    a1[2] = 0;
  }
  if (a1[3])
  {
    CVHWAGeneralProcessingConfigRelease();
    a1[3] = 0;
  }
  return a1;
}

uint64_t sub_2544271DC(void *a1)
{
  *(a1 - 1) = &unk_2703CF880;
  *a1 = &unk_2703CF960;
  if (a1[1])
  {
    CVHWAGeneralProcessingRelease();
    a1[1] = 0;
  }
  uint64_t result = a1[2];
  if (result)
  {
    uint64_t result = CVHWAGeneralProcessingConfigRelease();
    a1[2] = 0;
  }
  return result;
}

void sub_25442725C(void *a1)
{
  *a1 = &unk_2703CF880;
  a1[1] = &unk_2703CF960;
  if (a1[2])
  {
    CVHWAGeneralProcessingRelease();
    a1[2] = 0;
  }
  if (a1[3])
  {
    CVHWAGeneralProcessingConfigRelease();
    a1[3] = 0;
  }

  JUMPOUT(0x25A278F10);
}

void sub_254427300(void *a1)
{
  *(a1 - 1) = &unk_2703CF880;
  *a1 = &unk_2703CF960;
  if (a1[1])
  {
    CVHWAGeneralProcessingRelease();
    a1[1] = 0;
  }
  if (a1[2])
  {
    CVHWAGeneralProcessingConfigRelease();
    a1[2] = 0;
  }

  JUMPOUT(0x25A278F10);
}

BOOL sub_2544273A4()
{
  kdebug_trace();
  int v0 = CVHWAGeneralProcessingSetupDMASourceBuffer();
  kdebug_trace();
  return v0 == 0;
}

BOOL sub_25442743C()
{
  kdebug_trace();
  int v0 = CVHWAGeneralProcessingSetupDMADestinationBuffer();
  kdebug_trace();
  return v0 == 0;
}

BOOL sub_2544274D4()
{
  return CVHWAGeneralProcessingConfigSetAccelInstance() == 0;
}

BOOL sub_2544274FC()
{
  return CVHWAGeneralProcessingConfigSetAccelInstance() == 0;
}

BOOL sub_254427524()
{
  return !CVHWAGeneralProcessingConfigSetBinaryPath() && CVHWAGeneralProcessingInit() == 0;
}

BOOL sub_254427580()
{
  return !CVHWAGeneralProcessingConfigSetBinaryPath() && CVHWAGeneralProcessingInit() == 0;
}

uint64_t sub_2544275DC()
{
  if (CVHWAGeneralProcessingAllocateBuffer()) {
    return 0;
  }
  else {
    return 0;
  }
}

uint64_t sub_254427614(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270F0D0D0](a2);
}

uint64_t sub_25442761C(uint64_t a1)
{
  return MEMORY[0x270F0D118](*(void *)(a1 + 16));
}

uint64_t sub_254427628()
{
  return 0;
}

uint64_t sub_25442765C(uint64_t a1, unsigned int a2, uint64_t a3, int a4)
{
  if (a2 <= 0x1F && (a4 - 1) <= 7) {
    return CVHWAGeneralProcessingSetVecFloatRegister();
  }
  return result;
}

uint64_t sub_254427684(uint64_t a1, unsigned int a2, long long *a3, int a4)
{
  long long v9 = 0u;
  long long v10 = 0u;
  if (a2 <= 0x1F && (a4 - 1) <= 7)
  {
    CVHWAGeneralProcessingGetVecFloatRegister();
    long long v7 = *a3;
    long long v6 = a3[1];
    LODWORD(v9) = *a3;
    if (a4 != 1)
    {
      DWORD1(v9) = DWORD1(v7);
      if (a4 != 2)
      {
        DWORD2(v9) = DWORD2(v7);
        if (a4 != 3)
        {
          *(_DWORD *)((unint64_t)&v9 | 0xC) = HIDWORD(v7);
          if (a4 != 4)
          {
            LODWORD(v10) = v6;
            if (a4 != 5)
            {
              DWORD1(v10) = DWORD1(v6);
              if (a4 != 6)
              {
                DWORD2(v10) = DWORD2(v6);
                if (a4 != 7) {
                  HIDWORD(v10) = HIDWORD(v6);
                }
              }
            }
          }
        }
      }
    }
    return CVHWAGeneralProcessingSetVecFloatRegister();
  }
  return result;
}

uint64_t sub_254427790(uint64_t a1, unsigned int a2, uint64_t a3, int a4)
{
  if (a2 <= 0x1F && (a4 - 1) <= 7) {
    return CVHWAGeneralProcessingGetVecFloatRegister();
  }
  return result;
}

uint64_t sub_2544277B8@<X0>(unsigned int a1@<W1>, _OWORD *a2@<X8>)
{
  long long v3 = 0uLL;
  long long v4 = 0uLL;
  if (a1 <= 0x1F)
  {
    uint64_t result = CVHWAGeneralProcessingGetVecFloatRegister();
    long long v3 = 0u;
    long long v4 = 0u;
  }
  *a2 = v3;
  a2[1] = v4;
  return result;
}

uint64_t sub_254427810(uint64_t a1, unsigned int a2, uint64_t a3, int a4)
{
  if (a2 <= 0x1F && (a4 - 1) <= 3) {
    return CVHWAGeneralProcessingSetVecDoubleRegister();
  }
  return result;
}

uint64_t sub_254427838(uint64_t a1, unsigned int a2, uint64_t a3, int a4)
{
  if (a2 <= 0x1F && (a4 - 1) <= 3)
  {
    CVHWAGeneralProcessingGetVecDoubleRegister();
    return CVHWAGeneralProcessingSetVecDoubleRegister();
  }
  return result;
}

uint64_t sub_2544278FC(uint64_t a1, unsigned int a2, uint64_t a3, int a4)
{
  if (a2 <= 0x1F && (a4 - 1) <= 3) {
    return CVHWAGeneralProcessingGetVecDoubleRegister();
  }
  return result;
}

uint64_t sub_254427924@<X0>(unsigned int a1@<W1>, _OWORD *a2@<X8>)
{
  long long v3 = 0uLL;
  long long v4 = 0uLL;
  if (a1 <= 0x1F)
  {
    uint64_t result = CVHWAGeneralProcessingGetVecDoubleRegister();
    long long v3 = 0u;
    long long v4 = 0u;
  }
  *a2 = v3;
  a2[1] = v4;
  return result;
}

uint64_t sub_25442797C()
{
  return 0x80000;
}

uint64_t sub_254427984()
{
  return 0x20000;
}

uint64_t sub_25442798C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  CVHWAGeneralProcessingClearStackData();
  uint64_t v6 = *(void *)(a1 + 16);

  return MEMORY[0x270F0D090](v6, a2, a3);
}

uint64_t sub_2544279E0(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  return MEMORY[0x270F0D140](*(void *)(a1 + 16), a4, a2, a3);
}

uint64_t sub_2544279FC(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  return MEMORY[0x270F0D100](*(void *)(a1 + 16), a2, a4, a3);
}

BOOL sub_254427A10()
{
  return CVHWAGeneralProcessingRunProgram() == 0;
}

BOOL sub_254427A34()
{
  return CVHWAGeneralProcessingCallFunction() == 0;
}

BOOL sub_254427A58(uint64_t a1, uint64_t a2, void *a3, unsigned int *a4)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int SpecialRegister = CVHWAGeneralProcessingReadSpecialRegister();
  int v7 = SpecialRegister;
  if (a3 && !SpecialRegister) {
    memcpy(a3, __src, *a4);
  }
  return v7 == 0;
}

uint64_t lacc_hardware::LaccHardware::arch_version(lacc_hardware::LaccHardware *this)
{
  return MEMORY[0x270F0D148](this);
}

const char *sub_254427AF4(int a1, int a2)
{
  if (a1 > 61)
  {
    if (a1 > 163)
    {
      if (a1 == 164)
      {
        if (a2 == 1879048192) {
          return "SHT_HEX_ORDERED";
        }
      }
      else if (a1 == 243 && a2 == 1879048195)
      {
        return "SHT_RISCV_ATTRIBUTES";
      }
    }
    else if (a1 == 62)
    {
      if (a2 == 1879048193) {
        return "SHT_X86_64_UNWIND";
      }
    }
    else if (a1 == 105 && a2 == 1879048195)
    {
      return "SHT_MSP430_ATTRIBUTES";
    }
    goto LABEL_21;
  }
  if (a1 != 8 && a1 != 10)
  {
    if (a1 == 40 && (a2 - 1879048193) < 5) {
      return (&off_2653AC0E8)[a2 - 1879048193];
    }
LABEL_21:
    if (a2 > 1879002111)
    {
      switch(a2)
      {
        case 1879002112:
          uint64_t result = "SHT_LLVM_ODRTAB";
          break;
        case 1879002113:
          uint64_t result = "SHT_LLVM_LINKER_OPTIONS";
          break;
        case 1879002114:
LABEL_48:
          uint64_t result = "Unknown";
          break;
        case 1879002115:
          uint64_t result = "SHT_LLVM_ADDRSIG";
          break;
        case 1879002116:
          uint64_t result = "SHT_LLVM_DEPENDENT_LIBRARIES";
          break;
        case 1879002117:
          uint64_t result = "SHT_LLVM_SYMPART";
          break;
        case 1879002118:
          uint64_t result = "SHT_LLVM_PART_EHDR";
          break;
        case 1879002119:
          uint64_t result = "SHT_LLVM_PART_PHDR";
          break;
        case 1879002120:
          uint64_t result = "SHT_LLVM_BB_ADDR_MAP";
          break;
        case 1879002121:
          uint64_t result = "SHT_LLVM_CALL_GRAPH_PROFILE";
          break;
        default:
          switch(a2)
          {
            case 1879048181:
              uint64_t result = "SHT_GNU_ATTRIBUTES";
              break;
            case 1879048182:
              uint64_t result = "SHT_GNU_HASH";
              break;
            case 1879048183:
            case 1879048184:
            case 1879048185:
            case 1879048186:
            case 1879048187:
            case 1879048188:
              goto LABEL_48;
            case 1879048189:
              uint64_t result = "SHT_GNU_verdef";
              break;
            case 1879048190:
              uint64_t result = "SHT_GNU_verneed";
              break;
            case 1879048191:
              uint64_t result = "SHT_GNU_versym";
              break;
            default:
              if (a2 != 1879047936) {
                goto LABEL_48;
              }
              uint64_t result = "SHT_ANDROID_RELR";
              break;
          }
          break;
      }
    }
    else
    {
      uint64_t result = "SHT_NULL";
      switch(a2)
      {
        case 0:
          return result;
        case 1:
          return "SHT_PROGBITS";
        case 2:
          return "SHT_SYMTAB";
        case 3:
          return "SHT_STRTAB";
        case 4:
          return "SHT_RELA";
        case 5:
          return "SHT_HASH";
        case 6:
          return "SHT_DYNAMIC";
        case 7:
          return "SHT_NOTE";
        case 8:
          return "SHT_NOBITS";
        case 9:
          return "SHT_REL";
        case 10:
          return "SHT_SHLIB";
        case 11:
          return "SHT_DYNSYM";
        case 12:
        case 13:
          goto LABEL_48;
        case 14:
          return "SHT_INIT_ARRAY";
        case 15:
          return "SHT_FINI_ARRAY";
        case 16:
          return "SHT_PREINIT_ARRAY";
        case 17:
          return "SHT_GROUP";
        case 18:
          return "SHT_SYMTAB_SHNDX";
        case 19:
          return "SHT_RELR";
        default:
          if (a2 == 1610612737)
          {
            uint64_t result = "SHT_ANDROID_REL";
          }
          else
          {
            if (a2 != 1610612738) {
              goto LABEL_48;
            }
            uint64_t result = "SHT_ANDROID_RELA";
          }
          break;
      }
    }
    return result;
  }
  uint64_t result = "SHT_MIPS_REGINFO";
  switch(a2)
  {
    case 1879048198:
      return result;
    case 1879048205:
      uint64_t result = "SHT_MIPS_OPTIONS";
      break;
    case 1879048222:
      uint64_t result = "SHT_MIPS_DWARF";
      break;
    case 1879048234:
      uint64_t result = "SHT_MIPS_ABIFLAGS";
      break;
    default:
      goto LABEL_21;
  }
  return result;
}

void *sub_2544280AC(unsigned char *__dst, void *__src, unint64_t a3)
{
  uint64_t v5 = __dst;
  if (a3 > 0x16)
  {
    if (a3 >= 0x7FFFFFFFFFFFFFF8) {
      sub_254422888();
    }
    uint64_t v6 = (a3 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a3 | 7) != 0x17) {
      uint64_t v6 = a3 | 7;
    }
    uint64_t v7 = v6 + 1;
    int v8 = operator new(v6 + 1);
    v5[1] = a3;
    _OWORD v5[2] = v7 | 0x8000000000000000;
    *uint64_t v5 = v8;
    uint64_t v5 = v8;
  }
  else
  {
    __dst[23] = a3;
  }

  return memmove(v5, __src, a3 + 1);
}

uint64_t sub_25442814C()
{
  if (!atomic_load_explicit(qword_269DF01F0, memory_order_acquire)) {
    sub_254429EC0((unint64_t *)qword_269DF01F0, (uint64_t (*)(void))sub_254428388, (unint64_t)sub_2544283D0);
  }
  return qword_269DF01F0[0];
}

void sub_2544281B4(uint64_t a1, uint64_t a2)
{
  std::error_code::message(&v5, (const std::error_code *)(a1 + 8));
  if ((v5.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    long long v3 = &v5;
  }
  else {
    long long v3 = (std::string *)v5.__r_.__value_.__r.__words[0];
  }
  if ((v5.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    size_t size = HIBYTE(v5.__r_.__value_.__r.__words[2]);
  }
  else {
    size_t size = v5.__r_.__value_.__l.__size_;
  }
  sub_25442D960(a2, v3, size);
  if (SHIBYTE(v5.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v5.__r_.__value_.__l.__data_);
  }
}

void sub_25442822C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_254428248(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  v14[0] = 0;
  v14[1] = 0;
  uint64_t v15 = 0;
  int v6 = 0;
  char v10 = 0;
  uint64_t v11 = 0;
  int v12 = 1;
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  uint64_t v7 = 0;
  std::string v5 = &unk_2703CFE20;
  unint64_t v13 = v14;
  sub_25442D54C((uint64_t)&v5, 0, 0, 0);
  (*(void (**)(uint64_t, void **))(*(void *)a1 + 16))(a1, &v5);
  if (*((char *)v13 + 23) < 0)
  {
    sub_2544280AC((unsigned char *)a2, *v13, (unint64_t)v13[1]);
  }
  else
  {
    long long v4 = *(_OWORD *)v13;
    *(void *)(a2 + 16) = v13[2];
    *(_OWORD *)a2 = v4;
  }
  sub_25442D3B0((uint64_t)&v5);
  if (SHIBYTE(v15) < 0) {
    operator delete(v14[0]);
  }
}

void sub_254428354(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_25442D3B0((uint64_t)&a9);
  if (*(char *)(v9 - 17) < 0) {
    operator delete(*(void **)(v9 - 40));
  }
  _Unwind_Resume(a1);
}

uint64_t sub_25442837C(uint64_t a1)
{
  return *(void *)(a1 + 8);
}

void sub_254428388()
{
}

uint64_t sub_2544283D0(uint64_t result)
{
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

void sub_254428400(std::error_category *a1)
{
  std::error_category::~error_category(a1);

  JUMPOUT(0x25A278F10);
}

const char *sub_254428438()
{
  return "llvm.object";
}

double sub_254428444@<D0>(int a1@<W1>, uint64_t a2@<X8>)
{
  switch(a1)
  {
    case 2:
      std::string v5 = (char *)operator new(0x38uLL);
      *(void *)a2 = v5;
      *(_OWORD *)(a2 + --*(_DWORD *)(this + 8) = xmmword_2544314D0;
      strcpy(v5, "The file was not recognized as a valid object file");
      double result = *(double *)" valid object file";
      break;
    case 3:
      int v6 = (char *)operator new(0x38uLL);
      *(void *)a2 = v6;
      *(_OWORD *)(a2 + --*(_DWORD *)(this + 8) = xmmword_2544314C0;
      strcpy(v6, "Invalid data was encountered while parsing the file");
      double result = *(double *)"le parsing the file";
      break;
    case 4:
      uint64_t v7 = (char *)operator new(0x38uLL);
      *(void *)a2 = v7;
      *(_OWORD *)(a2 + --*(_DWORD *)(this + 8) = xmmword_2544314B0;
      strcpy(v7, "The end of the file was unexpectedly encountered");
      double result = *(double *)"edly encountered";
      break;
    case 5:
      uint64_t v8 = (char *)operator new(0x30uLL);
      *(void *)a2 = v8;
      *(_OWORD *)(a2 + --*(_DWORD *)(this + 8) = xmmword_2544314A0;
      strcpy(v8, "String table must end with a null terminator");
      double result = *(double *)" null terminator";
      break;
    case 6:
      *(unsigned char *)(a2 + 23) = 21;
      double result = *(double *)"Invalid section index";
      strcpy((char *)a2, "Invalid section index");
      break;
    case 7:
      uint64_t v9 = (char *)operator new(0x30uLL);
      *(void *)a2 = v9;
      *(_OWORD *)(a2 + --*(_DWORD *)(this + 8) = xmmword_254431490;
      double result = *(double *)"Bitcode section not found in object file";
      strcpy(v9, "Bitcode section not found in object file");
      break;
    case 8:
      *(unsigned char *)(a2 + 23) = 20;
      double result = *(double *)"Invalid symbol index";
      strcpy((char *)a2, "Invalid symbol index");
      break;
    default:
      long long v3 = (char *)operator new(0x30uLL);
      *(void *)a2 = v3;
      *(_OWORD *)(a2 + --*(_DWORD *)(this + 8) = xmmword_2544314E0;
      strcpy(v3, "No object file for requested architecture");
      double result = *(double *)"ted architecture";
      break;
  }
  return result;
}

void sub_254428694()
{
}

void *sub_2544286AC(void *result, uint64_t a2, unsigned __int8 *a3)
{
  if (*result)
  {
    long long v4 = (void **)result;
    double result = sub_25442CF84(a3, a2);
    std::string v5 = *v4;
    uint64_t *v4 = 0;
    if (v5)
    {
      if ((*(unsigned int (**)(void *, void *))(*v5 + 48))(v5, &unk_269DF03C9))
      {
        int v6 = (uint64_t **)v5[1];
        uint64_t v7 = (uint64_t **)v5[2];
        if (v6 != v7)
        {
          uint64_t v8 = 0;
          do
          {
            unint64_t v13 = v8;
            uint64_t v9 = *v6;
            *int v6 = 0;
            if ((*(unsigned int (**)(uint64_t *, void *))(*v9 + 48))(v9, &unk_269DF03C8))
            {
              (*(void (**)(uint64_t *, uint64_t))(*v9 + 16))(v9, a2);
              char v10 = *(unsigned char **)(a2 + 32);
              if (*(unsigned char **)(a2 + 24) == v10)
              {
                sub_25442D960(a2, "\n", 1uLL);
              }
              else
              {
                *char v10 = 10;
                ++*(void *)(a2 + 32);
              }
              int v12 = 0;
              (*(void (**)(uint64_t *))(*v9 + 8))(v9);
            }
            else
            {
              int v12 = v9;
            }
            sub_254421A94(&v13, &v12, &v14);
            uint64_t v8 = v14;
            uint64_t v14 = 0;
            if (v12) {
              (*(void (**)(uint64_t *))(*v12 + 8))(v12);
            }
            if (v13) {
              (*(void (**)(uint64_t *))(*v13 + 8))(v13);
            }
            ++v6;
          }
          while (v6 != v7);
        }
      }
      else
      {
        double result = (void *)(*(uint64_t (**)(void *, void *))(*v5 + 48))(v5, &unk_269DF03C8);
        if (!result) {
          return result;
        }
        (*(void (**)(void *, uint64_t))(*v5 + 16))(v5, a2);
        uint64_t v11 = *(unsigned char **)(a2 + 32);
        if (*(unsigned char **)(a2 + 24) == v11)
        {
          sub_25442D960(a2, "\n", 1uLL);
        }
        else
        {
          unsigned char *v11 = 10;
          ++*(void *)(a2 + 32);
        }
      }
      return (void *)(*(uint64_t (**)(void *))(*v5 + 8))(v5);
    }
  }
  return result;
}

void sub_254428984(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_254428A30()
{
  if (!atomic_load_explicit(&qword_269DF0208, memory_order_acquire)) {
    sub_254429EC0((unint64_t *)&qword_269DF0208, (uint64_t (*)(void))sub_254429478, (unint64_t)sub_2544294C0);
  }
  return 1;
}

uint64_t sub_254428AA0@<X0>(int a1@<W0>, void *a2@<X8>)
{
  if (a1) {
    operator new();
  }
  uint64_t result = 0;
  *a2 = 0;
  return result;
}

uint64_t sub_254428B4C(void **a1)
{
  v14.__val_ = 0;
  v14.__cat_ = std::system_category();
  int v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    if ((*(unsigned int (**)(void *, void *))(*v2 + 48))(v2, &unk_269DF03C9))
    {
      long long v3 = (uint64_t **)v2[1];
      long long v4 = (uint64_t **)v2[2];
      if (v3 != v4)
      {
        std::string v5 = 0;
        do
        {
          v11.__r_.__value_.__r.__words[0] = (std::string::size_type)v5;
          int v6 = *v3;
          char *v3 = 0;
          if ((*(unsigned int (**)(uint64_t *, void *))(*v6 + 48))(v6, &unk_269DF03C8))
          {
            *(void *)&v14.__val_ = (*(uint64_t (**)(uint64_t *))(*v6 + 32))(v6);
            v14.__cat_ = v7;
            uint64_t v15 = 0;
            (*(void (**)(uint64_t *))(*v6 + 8))(v6);
          }
          else
          {
            uint64_t v15 = v6;
          }
          sub_254421A94((uint64_t **)&v11, &v15, (uint64_t **)&v12);
          std::string v5 = v12;
          int v12 = 0;
          if (v15) {
            (*(void (**)(uint64_t *))(*v15 + 8))(v15);
          }
          if (v11.__r_.__value_.__r.__words[0]) {
            (*(void (**)(std::string::size_type))(*(void *)v11.__r_.__value_.__l.__data_ + 8))(v11.__r_.__value_.__r.__words[0]);
          }
          ++v3;
        }
        while (v3 != v4);
      }
    }
    else
    {
      if (!(*(unsigned int (**)(void *, void *))(*v2 + 48))(v2, &unk_269DF03C8)) {
        goto LABEL_16;
      }
      *(void *)&v14.__val_ = (*(uint64_t (**)(void *))(*v2 + 32))(v2);
      v14.__cat_ = v8;
    }
    (*(void (**)(void *))(*v2 + 8))(v2);
  }
LABEL_16:
  if (!atomic_load_explicit(&qword_269DF0208, memory_order_acquire)) {
    sub_254429EC0((unint64_t *)&qword_269DF0208, (uint64_t (*)(void))sub_254429478, (unint64_t)sub_2544294C0);
  }
  if (v14.__cat_ == (const std::error_category *)qword_269DF0208 && v14.__val_ == 3)
  {
    std::error_code::message(&v11, &v14);
    __int16 v13 = 260;
    int v12 = &v11;
    sub_254428694();
  }
  return *(void *)&v14.__val_;
}

void sub_254428E20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  (*(void (**)(uint64_t))(*(void *)v15 + 8))(v15);
  _Unwind_Resume(a1);
}

uint64_t sub_254428EE8(uint64_t a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4)
{
  *(void *)a1 = &unk_2703CFA48;
  sub_25442CB14(a2, (void *)(a1 + 8));
  *(void *)(a1 + 32) = a3;
  *(void *)(a1 + 40) = a4;
  *(unsigned char *)(a1 + 4--*(_DWORD *)(this + 8) = 1;
  return a1;
}

void sub_254428F50(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a1 + 48))
  {
    int v4 = *(char *)(a1 + 31);
    if (v4 >= 0) {
      std::string v5 = (unsigned char *)(a1 + 8);
    }
    else {
      std::string v5 = *(unsigned char **)(a1 + 8);
    }
    if (v4 >= 0) {
      size_t v6 = *(unsigned __int8 *)(a1 + 31);
    }
    else {
      size_t v6 = *(void *)(a1 + 16);
    }
    sub_25442D960(a2, v5, v6);
    return;
  }
  std::error_code::message(&v12, (const std::error_code *)(a1 + 32));
  if ((v12.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    uint64_t v7 = &v12;
  }
  else {
    uint64_t v7 = (std::string *)v12.__r_.__value_.__r.__words[0];
  }
  if ((v12.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    size_t size = HIBYTE(v12.__r_.__value_.__r.__words[2]);
  }
  else {
    size_t size = v12.__r_.__value_.__l.__size_;
  }
  sub_25442D960(a2, v7, size);
  if ((SHIBYTE(v12.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    int v9 = *(char *)(a1 + 31);
    if ((v9 & 0x80000000) == 0) {
      goto LABEL_19;
    }
LABEL_22:
    if (!*(void *)(a1 + 16)) {
      return;
    }
    goto LABEL_23;
  }
  operator delete(v12.__r_.__value_.__l.__data_);
  int v9 = *(char *)(a1 + 31);
  if (v9 < 0) {
    goto LABEL_22;
  }
LABEL_19:
  if (!(_BYTE)v9) {
    return;
  }
LABEL_23:
  std::operator+<char>();
  if ((v12.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    char v10 = &v12;
  }
  else {
    char v10 = (std::string *)v12.__r_.__value_.__r.__words[0];
  }
  if ((v12.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    size_t v11 = HIBYTE(v12.__r_.__value_.__r.__words[2]);
  }
  else {
    size_t v11 = v12.__r_.__value_.__l.__size_;
  }
  sub_25442D960(a2, v10, v11);
  if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v12.__r_.__value_.__l.__data_);
  }
}

void sub_25442908C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_2544290AC(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

uint64_t sub_2544290B8(uint64_t a1)
{
  int v2 = *(void **)(a1 + 8);
  if (v2)
  {
    long long v3 = *(void **)(a1 + 16);
    int v4 = *(void **)(a1 + 8);
    if (v3 != v2)
    {
      do
      {
        uint64_t v6 = *--v3;
        uint64_t v5 = v6;
        void *v3 = 0;
        if (v6) {
          (*(void (**)(uint64_t))(*(void *)v5 + 8))(v5);
        }
      }
      while (v3 != v2);
      int v4 = *(void **)(a1 + 8);
    }
    *(void *)(a1 + 16) = v2;
    operator delete(v4);
  }
  return a1;
}

void sub_254429148(uint64_t a1)
{
  int v2 = *(void **)(a1 + 8);
  if (v2)
  {
    long long v3 = *(void **)(a1 + 16);
    int v4 = *(void **)(a1 + 8);
    if (v3 != v2)
    {
      do
      {
        uint64_t v6 = *--v3;
        uint64_t v5 = v6;
        void *v3 = 0;
        if (v6) {
          (*(void (**)(uint64_t))(*(void *)v5 + 8))(v5);
        }
      }
      while (v3 != v2);
      int v4 = *(void **)(a1 + 8);
    }
    *(void *)(a1 + 16) = v2;
    operator delete(v4);
  }

  JUMPOUT(0x25A278F10);
}

uint64_t sub_2544291F8(uint64_t result, uint64_t a2)
{
  uint64_t v3 = result;
  uint64_t v4 = *(void *)(a2 + 32);
  if ((unint64_t)(*(void *)(a2 + 24) - v4) > 0x10)
  {
    *(unsigned char *)(v4 + 16) = 10;
    *(_OWORD *)uint64_t v4 = *(_OWORD *)"Multiple errors:\n";
    *(void *)(a2 + 32) += 17;
    uint64_t v5 = *(void **)(result + 8);
    for (int i = *(void **)(result + 16); v5 != i; ++v5)
    {
LABEL_7:
      while (1)
      {
        uint64_t result = (*(uint64_t (**)(void, uint64_t))(*(void *)*v5 + 16))(*v5, a2);
        uint64_t v7 = *(unsigned char **)(a2 + 32);
        if (*(unsigned char **)(a2 + 24) == v7) {
          break;
        }
        *uint64_t v7 = 10;
        ++*(void *)(a2 + 32);
        if (++v5 == i) {
          return result;
        }
      }
      uint64_t result = sub_25442D960(a2, "\n", 1uLL);
    }
  }
  else
  {
    uint64_t result = sub_25442D960(a2, "Multiple errors:\n", 0x11uLL);
    uint64_t v5 = *(void **)(v3 + 8);
    int i = *(void **)(v3 + 16);
    if (v5 != i) {
      goto LABEL_7;
    }
  }
  return result;
}

void *sub_254429310()
{
  return &unk_269DF03C9;
}

BOOL sub_25442931C(uint64_t a1, void *a2)
{
  return a2 == &unk_269DF03C9 || a2 == &unk_269DF03C8;
}

void sub_25442933C()
{
}

void *sub_254429350()
{
  return &unk_269DF03CA;
}

BOOL sub_25442935C(uint64_t a1, void *a2)
{
  return a2 == &unk_269DF03CA || a2 == &unk_269DF03C8;
}

uint64_t sub_25442937C(uint64_t result)
{
  uint64_t v1 = result;
  *(void *)uint64_t result = &unk_2703CFA48;
  if (*(char *)(result + 31) < 0)
  {
    operator delete(*(void **)(result + 8));
    return v1;
  }
  return result;
}

void sub_2544293DC(uint64_t a1)
{
  *(void *)a1 = &unk_2703CFA48;
  if (*(char *)(a1 + 31) < 0) {
    operator delete(*(void **)(a1 + 8));
  }

  JUMPOUT(0x25A278F10);
}

void *sub_25442944C()
{
  return &unk_269DF03CB;
}

BOOL sub_254429458(uint64_t a1, void *a2)
{
  return a2 == &unk_269DF03CB || a2 == &unk_269DF03C8;
}

void sub_254429478()
{
}

uint64_t sub_2544294C0(uint64_t result)
{
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

void sub_2544294F0(std::error_category *a1)
{
  std::error_category::~error_category(a1);

  JUMPOUT(0x25A278F10);
}

const char *sub_254429528()
{
  return "Error";
}

void sub_254429534(int a1@<W1>, uint64_t a2@<X8>)
{
  if (a1 == 3)
  {
    uint64_t v3 = (char *)operator new(0x80uLL);
    *(void *)a2 = v3;
    *(_OWORD *)(a2 + --*(_DWORD *)(this + 8) = xmmword_254431530;
    strcpy(v3, "Inconvertible error value. An error has occurred that could not be converted to a known std::error_code. Please file a bug.");
  }
  else if (a1 == 2)
  {
    strcpy((char *)a2, "A file error occurred.");
    *(unsigned char *)(a2 + 23) = 22;
  }
  else
  {
    *(unsigned char *)(a2 + 23) = 15;
    strcpy((char *)a2, "Multiple errors");
  }
}

uint64_t sub_25442960C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  *(void *)&long long v54 = a1;
  *((void *)&v54 + 1) = a2;
  unint64_t v4 = sub_25442C7E8(&v54, "{}", 2, 0);
  if (v4 >= *((void *)&v54 + 1)) {
    unint64_t v5 = *((void *)&v54 + 1);
  }
  else {
    unint64_t v5 = v4;
  }
  unint64_t v6 = *((void *)&v54 + 1) - v5;
  *(void *)&v56[0] = v54 + v5;
  *((void *)&v56[0] + 1) = *((void *)&v54 + 1) - v5;
  uint64_t v7 = sub_25442C868(v56, "{}", 2, 0xFFFFFFFFFFFFFFFFLL);
  unint64_t v8 = *((void *)&v56[0] + 1);
  if ((unint64_t)(v7 + 1) < *((void *)&v56[0] + 1)) {
    uint64_t v9 = v7 + 1;
  }
  else {
    uint64_t v9 = *((void *)&v56[0] + 1);
  }
  unint64_t v10 = *((void *)&v56[0] + 1) - v6 + v9;
  if (*((void *)&v56[0] + 1) >= v10) {
    unint64_t v8 = v10;
  }
  uint64_t v52 = *(unsigned __int8 **)&v56[0];
  unint64_t v53 = v8;
  unint64_t v11 = sub_25442C7E8(&v52, " \t\n\v\f\r", 6, 0);
  if (v11 >= v53) {
    unint64_t v12 = v53;
  }
  else {
    unint64_t v12 = v11;
  }
  unint64_t v13 = v53 - v12;
  *(void *)&v56[0] = &v52[v12];
  *((void *)&v56[0] + 1) = v53 - v12;
  uint64_t v14 = sub_25442C868(v56, " \t\n\v\f\r", 6, 0xFFFFFFFFFFFFFFFFLL);
  unint64_t v15 = *((void *)&v56[0] + 1);
  if ((unint64_t)(v14 + 1) < *((void *)&v56[0] + 1)) {
    uint64_t v16 = v14 + 1;
  }
  else {
    uint64_t v16 = *((void *)&v56[0] + 1);
  }
  unint64_t v17 = *((void *)&v56[0] + 1) - v13 + v16;
  uint64_t v52 = *(unsigned __int8 **)&v56[0];
  if (*((void *)&v56[0] + 1) >= v17) {
    unint64_t v15 = v17;
  }
  unint64_t v53 = v15;
  *(void *)&v56[0] = 0;
  uint64_t result = sub_25442C8F8(&v52, 0, (unint64_t *)v56);
  if (result)
  {
    memset(v56, 0, sizeof(v56));
    *(_OWORD *)(a3 + --*(_DWORD *)(this + 8) = 0u;
    memset(v55, 0, sizeof(v55));
    *(void *)a3 = 0;
    *(_OWORD *)(a3 + 24) = 0u;
    *(_DWORD *)(a3 + 40) = 2;
    *(unsigned char *)(a3 + 44) = 0;
    *(_DWORD *)(a3 + 60) = 0;
    *(_OWORD *)(a3 + 45) = *(_OWORD *)v55;
    goto LABEL_71;
  }
  uint64_t v19 = *(void *)&v56[0];
  unint64_t v20 = sub_25442C7E8(&v52, " \t\n\v\f\r", 6, 0);
  if (v20 >= v53) {
    unint64_t v21 = v53;
  }
  else {
    unint64_t v21 = v20;
  }
  unint64_t v22 = v53 - v21;
  *(void *)&v56[0] = &v52[v21];
  *((void *)&v56[0] + 1) = v53 - v21;
  uint64_t v23 = sub_25442C868(v56, " \t\n\v\f\r", 6, 0xFFFFFFFFFFFFFFFFLL);
  if ((unint64_t)(v23 + 1) < *((void *)&v56[0] + 1)) {
    uint64_t v24 = v23 + 1;
  }
  else {
    uint64_t v24 = *((void *)&v56[0] + 1);
  }
  unint64_t v25 = *((void *)&v56[0] + 1) - v22 + v24;
  if (*((void *)&v56[0] + 1) < v25) {
    unint64_t v25 = *((void *)&v56[0] + 1);
  }
  uint64_t v52 = *(unsigned __int8 **)&v56[0];
  unint64_t v53 = v25;
  if (!v25 || **(unsigned char **)&v56[0] != 44)
  {
    uint64_t v33 = 0;
    char v27 = 32;
    int v28 = 2;
    goto LABEL_46;
  }
  uint64_t v26 = (char *)(*(void *)&v56[0] + 1);
  char v27 = 32;
  int v28 = 2;
  unint64_t v29 = v25 - 1;
  uint64_t v52 = (unsigned __int8 *)(*(void *)&v56[0] + 1);
  unint64_t v53 = v25 - 1;
  if (v25 == 1)
  {
    uint64_t v33 = 0;
    goto LABEL_46;
  }
  unint64_t v30 = v25 - 2;
  if (v30)
  {
    std::string v31 = (unsigned __int8 *)(*(void *)&v56[0] + 2);
    int v32 = *(char *)(*(void *)&v56[0] + 2);
    switch(v32)
    {
      case '+':
LABEL_38:
        char v27 = *v26;
        if (v29 >= 2) {
          uint64_t v34 = 2;
        }
        else {
          uint64_t v34 = v29;
        }
        std::string v31 = (unsigned __int8 *)&v26[v34];
        unint64_t v30 = v29 - v34;
        goto LABEL_42;
      case '-':
        int v28 = 0;
        goto LABEL_38;
      case '=':
        int v28 = 1;
        goto LABEL_38;
    }
    int v51 = *v26;
    switch(v51)
    {
      case '+':
LABEL_42:
        uint64_t v52 = v31;
        unint64_t v53 = v30;
        break;
      case '-':
        int v28 = 0;
        goto LABEL_42;
      case '=':
        int v28 = 1;
        goto LABEL_42;
    }
  }
  *(void *)&v56[0] = 0;
  if (sub_25442C8F8(&v52, 0, (unint64_t *)v56)) {
    uint64_t v33 = 0;
  }
  else {
    uint64_t v33 = *(void *)&v56[0];
  }
LABEL_46:
  unint64_t v35 = sub_25442C7E8(&v52, " \t\n\v\f\r", 6, 0);
  if (v35 >= v53) {
    unint64_t v36 = v53;
  }
  else {
    unint64_t v36 = v35;
  }
  unint64_t v37 = v53 - v36;
  *(void *)&v56[0] = &v52[v36];
  *((void *)&v56[0] + 1) = v53 - v36;
  uint64_t v38 = sub_25442C868(v56, " \t\n\v\f\r", 6, 0xFFFFFFFFFFFFFFFFLL);
  if ((unint64_t)(v38 + 1) < *((void *)&v56[0] + 1)) {
    uint64_t v39 = v38 + 1;
  }
  else {
    uint64_t v39 = *((void *)&v56[0] + 1);
  }
  unint64_t v40 = *((void *)&v56[0] + 1) - v37 + v39;
  if (*((void *)&v56[0] + 1) < v40) {
    unint64_t v40 = *((void *)&v56[0] + 1);
  }
  uint64_t v52 = *(unsigned __int8 **)&v56[0];
  unint64_t v53 = v40;
  if (v40 && **(unsigned char **)&v56[0] == 58)
  {
    *(void *)uint64_t v55 = *(void *)&v56[0] + 1;
    *(void *)&v55[8] = v40 - 1;
    unint64_t v41 = sub_25442C7E8(v55, " \t\n\v\f\r", 6, 0);
    if (v41 >= *(void *)&v55[8]) {
      unint64_t v42 = *(void *)&v55[8];
    }
    else {
      unint64_t v42 = v41;
    }
    unint64_t v43 = *(void *)&v55[8] - v42;
    *(void *)&v56[0] = *(void *)v55 + v42;
    *((void *)&v56[0] + 1) = *(void *)&v55[8] - v42;
    uint64_t v44 = sub_25442C868(v56, " \t\n\v\f\r", 6, 0xFFFFFFFFFFFFFFFFLL);
    if ((unint64_t)(v44 + 1) < *((void *)&v56[0] + 1)) {
      uint64_t v45 = v44 + 1;
    }
    else {
      uint64_t v45 = *((void *)&v56[0] + 1);
    }
    unint64_t v46 = *((void *)&v56[0] + 1) - v43 + v45;
    uint64_t v47 = *(void *)&v56[0];
    if (*((void *)&v56[0] + 1) >= v46) {
      unint64_t v48 = v46;
    }
    else {
      unint64_t v48 = *((void *)&v56[0] + 1);
    }
    uint64_t v52 = 0;
    unint64_t v53 = 0;
  }
  else
  {
    unint64_t v48 = 0;
    uint64_t v47 = 0;
  }
  unint64_t v49 = sub_25442C7E8(&v52, " \t\n\v\f\r", 6, 0);
  if (v49 >= v53) {
    unint64_t v50 = v53;
  }
  else {
    unint64_t v50 = v49;
  }
  *(void *)&v56[0] = &v52[v50];
  *((void *)&v56[0] + 1) = v53 - v50;
  uint64_t result = sub_25442C868(v56, " \t\n\v\f\r", 6, 0xFFFFFFFFFFFFFFFFLL);
  *(_DWORD *)a3 = 1;
  *(_OWORD *)(a3 + --*(_DWORD *)(this + 8) = v54;
  *(void *)(a3 + 24) = v19;
  *(void *)(a3 + 32) = v33;
  *(_DWORD *)(a3 + 40) = v28;
  *(unsigned char *)(a3 + 44) = v27;
  *(void *)(a3 + 4--*(_DWORD *)(this + 8) = v47;
  *(void *)(a3 + 56) = v48;
LABEL_71:
  *(unsigned char *)(a3 + 64) = 1;
  return result;
}

double sub_254429AE8@<D0>(char *__s@<X0>, size_t __n@<X1>, uint64_t a3@<X8>)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  if (__n)
  {
    size_t v5 = __n;
    while (2)
    {
      if (*__s == 123)
      {
        uint64_t v6 = 1;
        do
        {
          if (v5 == v6)
          {
            unint64_t v8 = -1;
            if (v5 != -1) {
              unint64_t v8 = v5;
            }
            if (v8 >= 2) {
              goto LABEL_37;
            }
            goto LABEL_14;
          }
          int v7 = __s[v6++];
        }
        while (v7 == 123);
        unint64_t v8 = v6 - 1;
        if (v5 < v8) {
          unint64_t v8 = v5;
        }
        if (v8 >= 2)
        {
LABEL_37:
          unint64_t v19 = v8 >> 1;
          if (v5 < v8 >> 1) {
            unint64_t v19 = v5;
          }
          *(void *)(a3 + 24) = 0;
          *(void *)(a3 + 32) = 0;
          unint64_t v20 = v8 & 0xFFFFFFFFFFFFFFFELL;
          *(void *)&v23[11] = 0;
          if (v5 < v20) {
            unint64_t v20 = v5;
          }
          *(void *)&v23[3] = 0;
          *(_DWORD *)a3 = 2;
          *(void *)(a3 + --*(_DWORD *)(this + 8) = __s;
          *(void *)(a3 + 16) = v19;
          *(_DWORD *)(a3 + 40) = 2;
          *(unsigned char *)(a3 + 44) = 0;
          double result = *(double *)v23;
          *(_OWORD *)(a3 + 45) = *(_OWORD *)v23;
          *(_DWORD *)(a3 + 60) = 0;
          *(void *)(a3 + 64) = &__s[v20];
          *(void *)(a3 + 72) = v5 - v20;
          return result;
        }
LABEL_14:
        uint64_t v9 = memchr(__s, 125, v5);
        if (!v9 || (unint64_t v10 = v9 - __s, v9 - __s == -1))
        {
          *(void *)(a3 + 24) = 0;
          *(void *)(a3 + 32) = 0;
          *(void *)&v23[11] = 0;
          *(void *)&v23[3] = 0;
          *(void *)(a3 + 64) = 0;
          *(void *)(a3 + 72) = 0;
          *(_DWORD *)a3 = 2;
          *(void *)(a3 + --*(_DWORD *)(this + 8) = __s;
          *(void *)(a3 + 16) = v5;
          goto LABEL_31;
        }
        if (v5 < 2 || (v11 = memchr(__s + 1, 123, v5 - 1)) == 0 || (unint64_t v12 = v11 - __s, v11 - __s >= v10))
        {
          if (v10 <= 1) {
            unint64_t v13 = 1;
          }
          else {
            unint64_t v13 = v10;
          }
          if (v5 < v13) {
            unint64_t v13 = v5;
          }
          uint64_t v14 = __s + 1;
          uint64_t v15 = v13 - 1;
          if (v5 >= v10 + 1) {
            size_t v16 = v10 + 1;
          }
          else {
            size_t v16 = v5;
          }
          __s += v16;
          v5 -= v16;
          sub_25442960C((uint64_t)v14, v15, (uint64_t)v23);
          if (v26)
          {
            long long v21 = *(_OWORD *)&v23[16];
            *(_OWORD *)a3 = *(_OWORD *)v23;
            *(_OWORD *)(a3 + 16) = v21;
            double result = *(double *)&v24;
            long long v22 = v25;
            *(_OWORD *)(a3 + 32) = v24;
            *(_OWORD *)(a3 + 4--*(_DWORD *)(this + 8) = v22;
            *(void *)(a3 + 64) = __s;
            *(void *)(a3 + 72) = v5;
            return result;
          }
          if (v5) {
            continue;
          }
          goto LABEL_29;
        }
        if (v5 < v12) {
          unint64_t v12 = v5;
        }
        *(void *)(a3 + 24) = 0;
        *(void *)(a3 + 32) = 0;
        *(void *)&v23[11] = 0;
      }
      else
      {
        uint64_t v18 = memchr(__s, 123, v5);
        unint64_t v12 = v18 - __s;
        *(void *)(a3 + 24) = 0;
        *(void *)(a3 + 32) = 0;
        if (!v18) {
          unint64_t v12 = -1;
        }
        *(void *)&v23[11] = 0;
        if (v5 < v12) {
          unint64_t v12 = v5;
        }
      }
      break;
    }
    *(void *)&v23[3] = 0;
    *(_DWORD *)a3 = 2;
    *(void *)(a3 + --*(_DWORD *)(this + 8) = __s;
    *(void *)(a3 + 16) = v12;
    *(_DWORD *)(a3 + 40) = 2;
    *(unsigned char *)(a3 + 44) = 0;
    double result = *(double *)v23;
    *(_OWORD *)(a3 + 45) = *(_OWORD *)v23;
    *(_DWORD *)(a3 + 60) = *(_DWORD *)&v23[15];
    *(void *)(a3 + 64) = &__s[v12];
    *(void *)(a3 + 72) = v5 - v12;
    return result;
  }
LABEL_29:
  *(void *)&v23[11] = 0;
  *(void *)&v23[3] = 0;
  *(void *)(a3 + 64) = 0;
  *(void *)(a3 + 72) = 0;
  *(_DWORD *)a3 = 2;
  *(void *)(a3 + 24) = 0;
  *(void *)(a3 + 32) = 0;
  *(void *)(a3 + --*(_DWORD *)(this + 8) = __s;
  *(void *)(a3 + 16) = 0;
LABEL_31:
  *(_DWORD *)(a3 + 40) = 2;
  *(unsigned char *)(a3 + 44) = 0;
  double result = *(double *)v23;
  *(_OWORD *)(a3 + 45) = *(_OWORD *)v23;
  *(_DWORD *)(a3 + 60) = *(_DWORD *)&v23[15];
  return result;
}

double sub_254429D68@<D0>(char *__s@<X0>, size_t __n@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = a3 + 16;
  *(void *)a3 = a3 + 16;
  *(void *)(a3 + --*(_DWORD *)(this + 8) = 0x200000000;
  *(_DWORD *)uint64_t v23 = 0;
  *(void *)&long long v5 = 0;
  memset(&v23[8], 0, 32);
  *(_DWORD *)&v23[40] = 2;
  v23[44] = 0;
  long long v24 = 0uLL;
  if (__n)
  {
    size_t v6 = __n;
    do
    {
      sub_254429AE8(__s, v6, (uint64_t)v18);
      *(_OWORD *)uint64_t v23 = v18[0];
      *(_OWORD *)&v23[16] = v18[1];
      *(void *)&long long v5 = v19;
      *(_OWORD *)&unsigned char v23[32] = v19;
      long long v24 = v20;
      __s = v21;
      size_t v6 = v22;
      if (!LODWORD(v18[0])) {
        continue;
      }
      uint64_t v13 = *(unsigned int *)(a3 + 8);
      unint64_t v8 = *(void *)a3;
      if (v13 >= *(_DWORD *)(a3 + 12))
      {
        unint64_t v14 = v13 + 1;
        BOOL v15 = v8 + (v13 << 6) > (unint64_t)v23;
        if (v8 <= (unint64_t)v23 && v15)
        {
          sub_25442C238(a3, v4, v14, 64);
          size_t v16 = &v23[-v8];
          unint64_t v8 = *(void *)a3;
          uint64_t v9 = (long long *)&v16[*(void *)a3];
          goto LABEL_5;
        }
        sub_25442C238(a3, v4, v14, 64);
        unint64_t v8 = *(void *)a3;
      }
      uint64_t v9 = (long long *)v23;
LABEL_5:
      unint64_t v10 = (_OWORD *)(v8 + ((unint64_t)*(unsigned int *)(a3 + 8) << 6));
      long long v5 = *v9;
      long long v11 = v9[1];
      long long v12 = v9[3];
      v10[2] = v9[2];
      v10[3] = v12;
      *unint64_t v10 = v5;
      v10[1] = v11;
      ++*(_DWORD *)(a3 + 8);
    }
    while (v6);
  }
  return *(double *)&v5;
}

void sub_254429EA0(_Unwind_Exception *exception_object)
{
  if (*v2 != v1) {
    free(*v2);
  }
  _Unwind_Resume(exception_object);
}

void sub_254429EC0(unint64_t *a1, uint64_t (*a2)(void), unint64_t a3)
{
  if (sub_25442CB0C())
  {
    if ((atomic_load_explicit((atomic_uchar *volatile)&qword_269DF0228, memory_order_acquire) & 1) == 0
      && __cxa_guard_acquire(&qword_269DF0228))
    {
      MEMORY[0x25A278DD0](&stru_269DF0230);
      __cxa_atexit(MEMORY[0x263F8C0E0], &stru_269DF0230, &dword_254419000);
      __cxa_guard_release(&qword_269DF0228);
    }
    std::recursive_mutex::lock(&stru_269DF0230);
    if (!*a1)
    {
      atomic_store(a2(), a1);
      uint64_t v6 = qword_269DF0220;
      a1[1] = a3;
      a1[2] = v6;
      qword_269DF0220 = (uint64_t)a1;
    }
    std::recursive_mutex::unlock(&stru_269DF0230);
  }
  else
  {
    atomic_store(a2(), a1);
    uint64_t v7 = qword_269DF0220;
    a1[1] = a3;
    a1[2] = v7;
    qword_269DF0220 = (uint64_t)a1;
  }
}

void sub_254429FC0(_Unwind_Exception *a1)
{
}

void sub_254429FD8(_Unwind_Exception *a1)
{
}

char *sub_254429FF0(uint64_t a1, uint64_t a2)
{
  v12[32] = *MEMORY[0x263EF8340];
  unint64_t v10 = v12;
  long long v11 = xmmword_254431520;
  if (*(unsigned char *)(a2 + 33) == 1)
  {
    size_t v3 = 0;
    uint64_t v4 = 0;
    switch(*(unsigned char *)(a2 + 32))
    {
      case 1:
        break;
      case 3:
        uint64_t v4 = *(const void **)a2;
        if (*(void *)a2) {
          size_t v3 = strlen(*(const char **)a2);
        }
        else {
          size_t v3 = 0;
        }
        break;
      case 4:
        unint64_t v8 = *(const char **)a2;
        int v9 = *(char *)(*(void *)a2 + 23);
        if (v9 >= 0) {
          uint64_t v4 = *(const void **)a2;
        }
        else {
          uint64_t v4 = *(const void **)v8;
        }
        if (v9 >= 0) {
          size_t v3 = *(unsigned __int8 *)(*(void *)a2 + 23);
        }
        else {
          size_t v3 = *((void *)v8 + 1);
        }
        break;
      case 5:
        uint64_t v4 = *(const void **)a2;
        size_t v3 = *(void *)(a2 + 8);
        break;
      default:
        goto LABEL_5;
    }
  }
  else
  {
LABEL_5:
    sub_25442CEB8(a2, (uint64_t)&v10);
    uint64_t v4 = v10;
    size_t v3 = v11;
  }
  long long v5 = (char *)operator new(a1 + v3 + 1);
  uint64_t v6 = &v5[a1];
  if (v3) {
    memcpy(v6, v4, v3);
  }
  v6[v3] = 0;
  if (v10 != v12) {
    free(v10);
  }
  return v5;
}

void sub_25442A14C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9)
{
  if (a9 != v9) {
    free(a9);
  }
  _Unwind_Resume(exception_object);
}

void *sub_25442A180@<X0>(unsigned __int8 *a1@<X0>, int a2@<W1>, int a3@<W2>, char a4@<W3>, uint64_t a5@<X8>)
{
  return sub_25442A1A0(a5, a1, 0xFFFFFFFFFFFFFFFFLL, 0, a2, a3, a4);
}

void *sub_25442A1A0(uint64_t a1, unsigned __int8 *a2, size_t a3, off_t a4, int a5, int a6, char a7)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (a5) {
    int v13 = 3;
  }
  else {
    int v13 = 0;
  }
  sub_25442BB88(a2, v13, 0, (uint64_t)&v20);
  if (v21)
  {
    BOOL v15 = v20;
    long long v20 = 0;
    long long v19 = v15;
    uint64_t v16 = sub_254428B4C(&v19);
    *(unsigned char *)(a1 + 16) |= 1u;
    *(void *)a1 = v16;
    *(void *)(a1 + --*(_DWORD *)(this + 8) = v17;
    double result = v19;
    if (v19) {
      double result = (void *)(*(uint64_t (**)(void *))(*v19 + 8))(v19);
    }
  }
  else
  {
    int v18 = (int)v20;
    sub_25442A574(a1, (int)v20, (uint64_t)a2, 0xFFFFFFFFFFFFFFFFLL, a3, a4, a6, a7);
    double result = (void *)sub_25442BCCC(&v18);
  }
  if (v21)
  {
    double result = v20;
    long long v20 = 0;
    if (result) {
      return (void *)(*(uint64_t (**)(void *))(*result + 8))(result);
    }
  }
  return result;
}

void sub_25442A2F8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _Unwind_Exception *a12, uint64_t a13, uint64_t a14, char a15)
{
  if ((*(unsigned char *)(v15 + 16) & 1) == 0)
  {
    sub_25442F16C((uint64_t *)v15);
    exception_object = a12;
  }
  if (a15)
  {
    if (a14)
    {
      (*(void (**)(uint64_t))(*(void *)a14 + 8))(a14);
      _Unwind_Resume(exception_object);
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_25442A384(size_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  v17[32] = *MEMORY[0x263EF8340];
  uint64_t v15 = v17;
  long long v16 = xmmword_254431520;
  if (*(unsigned char *)(a2 + 33) == 1)
  {
    size_t v5 = 0;
    uint64_t v6 = 0;
    switch(*(unsigned char *)(a2 + 32))
    {
      case 1:
        break;
      case 3:
        uint64_t v6 = *(const void **)a2;
        if (*(void *)a2) {
          size_t v5 = strlen(*(const char **)a2);
        }
        else {
          size_t v5 = 0;
        }
        break;
      case 4:
        int v13 = *(const char **)a2;
        int v14 = *(char *)(*(void *)a2 + 23);
        if (v14 >= 0) {
          uint64_t v6 = *(const void **)a2;
        }
        else {
          uint64_t v6 = *(const void **)v13;
        }
        if (v14 >= 0) {
          size_t v5 = *(unsigned __int8 *)(*(void *)a2 + 23);
        }
        else {
          size_t v5 = *((void *)v13 + 1);
        }
        break;
      case 5:
        uint64_t v6 = *(const void **)a2;
        size_t v5 = *(void *)(a2 + 8);
        break;
      default:
        goto LABEL_5;
    }
  }
  else
  {
LABEL_5:
    sub_25442CEB8(a2, (uint64_t)&v15);
    uint64_t v6 = v15;
    size_t v5 = v16;
  }
  unint64_t v7 = (v5 + 40) & 0xFFFFFFFFFFFFFFF0;
  size_t v8 = a1 + v7 + 1;
  if (v8 <= a1)
  {
    unint64_t v10 = 0;
  }
  else
  {
    int v9 = operator new(v8, MEMORY[0x263F8C180]);
    unint64_t v10 = v9;
    if (v9)
    {
      long long v11 = (char *)(v9 + 3);
      if (v5) {
        memcpy(v9 + 3, v6, v5);
      }
      v11[v5] = 0;
      long long v12 = (char *)v10 + v7 + a1;
      *long long v12 = 0;
      *unint64_t v10 = &unk_2703CFC60;
      v10[1] = (char *)v10 + v7;
      v10[2] = v12;
    }
  }
  *a3 = v10;
  if (v15 != v17) {
    free(v15);
  }
}

void sub_25442A544(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9)
{
  if (a9 != v9) {
    free(a9);
  }
  _Unwind_Resume(exception_object);
}

void sub_25442A574(uint64_t a1, int a2, uint64_t a3, size_t a4, size_t a5, off_t a6, int a7, char a8)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_269DF0280, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_269DF0280))
  {
    dword_269DF0274 = sub_25442ACE8();
    __cxa_guard_release(&qword_269DF0280);
  }
  if (a5 == -1 && (a5 = a4, a4 == -1))
  {
    long long v39 = 0u;
    memset(v40, 0, sizeof(v40));
    uint64_t v41 = 0xFFFFLL;
    __int16 v42 = 0;
    uint64_t v43 = 0;
    uint64_t v24 = sub_25442B8B4(a2, (uint64_t)&v39);
    if (v24)
    {
      *(unsigned char *)(a1 + 16) |= 1u;
      *(void *)a1 = v24;
      *(void *)(a1 + --*(_DWORD *)(this + 8) = v25;
      return;
    }
    if (*(_DWORD *)&v40[24] != 2 && *(_DWORD *)&v40[24] != 5)
    {
      sub_25442AAC4();
      char v34 = *(unsigned char *)(a1 + 16);
      if (v46)
      {
        char v35 = v34 | 1;
        unint64_t v36 = v44;
        *(void *)(a1 + --*(_DWORD *)(this + 8) = v45;
      }
      else
      {
        char v35 = v34 & 0xFE;
        unint64_t v36 = v44;
      }
      *(unsigned char *)(a1 + 16) = v35;
      *(void *)a1 = v36;
      return;
    }
    a5 = *(void *)&v40[16];
    a4 = *(void *)&v40[16];
    size_t v16 = dword_269DF0274;
    if (a7)
    {
LABEL_5:
      if (a8) {
        goto LABEL_27;
      }
    }
  }
  else
  {
    size_t v16 = dword_269DF0274;
    if (a7) {
      goto LABEL_5;
    }
  }
  BOOL v17 = a5 >= 0x4000 && a5 >= v16;
  char v18 = !v17;
  if (v17 && a7)
  {
    if (a4 == -1)
    {
      long long v39 = 0u;
      memset(v40, 0, sizeof(v40));
      uint64_t v41 = 0xFFFFLL;
      __int16 v42 = 0;
      uint64_t v43 = 0;
      if (sub_25442B8B4(a2, (uint64_t)&v39)) {
        goto LABEL_27;
      }
      a4 = *(void *)&v40[16];
      if (a5 + a6 != *(void *)&v40[16]) {
        goto LABEL_27;
      }
LABEL_17:
      if ((a4 & ((int)v16 - 1)) == 0) {
        goto LABEL_27;
      }
LABEL_20:
      LODWORD(v39) = 0;
      *((void *)&v39 + 1) = std::system_category();
      long long v19 = sub_254429FF0(48, a3);
      *(void *)long long v19 = &unk_2703CFCB0;
      int v20 = sub_25442B9D8();
      int v21 = sub_25442B9D8();
      sub_25442B8F0((uint64_t)(v19 + 24), a2, 0, ((v20 - 1) & (unint64_t)a6) + a5, -v21 & (unint64_t)a6, &v39);
      if (!v39)
      {
        uint64_t v22 = sub_25442B62C((uint64_t)(v19 + 24));
        unint64_t v23 = v22 + ((int)(sub_25442B9D8() - 1) & (unint64_t)a6);
        *((void *)v19 + 1) = v23;
        *((void *)v19 + 2) = v23 + a5;
        if (!v39)
        {
          *(unsigned char *)(a1 + 16) &= ~1u;
          *(void *)a1 = v19;
          return;
        }
      }
      (*(void (**)(char *))(*(void *)v19 + 8))(v19);
      goto LABEL_27;
    }
    if (a5 + a6 == a4) {
      goto LABEL_17;
    }
  }
  else if ((v18 & 1) == 0)
  {
    goto LABEL_20;
  }
LABEL_27:
  sub_25442A384(a5, a3, &v38);
  if (!v38)
  {
    uint64_t v33 = std::generic_category();
    *(unsigned char *)(a1 + 16) |= 1u;
    *(void *)a1 = 12;
    *(void *)(a1 + --*(_DWORD *)(this + 8) = v33;
    return;
  }
  char v26 = (char *)v38[1];
  unint64_t v27 = v38[2] - (void)v26;
  do
  {
    if (!v27) {
      goto LABEL_44;
    }
    sub_25442BC08(a2, v26, v27, a6, (uint64_t)&v44);
    if (v45)
    {
      unint64_t v29 = v44;
      uint64_t v44 = 0;
      unint64_t v37 = v29;
      uint64_t v30 = sub_254428B4C(&v37);
      *(unsigned char *)(a1 + 16) |= 1u;
      *(void *)a1 = v30;
      *(void *)(a1 + --*(_DWORD *)(this + 8) = v31;
      if (v37)
      {
        (*(void (**)(void *))(*v37 + 8))(v37);
        int v28 = 1;
        if ((v45 & 1) == 0) {
          continue;
        }
      }
      else
      {
        int v28 = 1;
        if ((v45 & 1) == 0) {
          continue;
        }
      }
    }
    else if (v44)
    {
      int v28 = 0;
      v27 -= (unint64_t)v44;
      char v26 = (char *)v44 + (void)v26;
      a6 += (off_t)v44;
      if ((v45 & 1) == 0) {
        continue;
      }
    }
    else
    {
      bzero(v26, v27);
      int v28 = 3;
      if ((v45 & 1) == 0) {
        continue;
      }
    }
    int v32 = v44;
    uint64_t v44 = 0;
    if (v32) {
      (*(void (**)(void *))(*v32 + 8))(v32);
    }
  }
  while (!v28);
  if (v28 == 3)
  {
LABEL_44:
    *(unsigned char *)(a1 + 16) &= ~1u;
    *(void *)a1 = v38;
    return;
  }
  if (v38) {
    (*(void (**)(void *))(*v38 + 8))(v38);
  }
}

void sub_25442AA10(_Unwind_Exception *a1)
{
}

void sub_25442AA28(_Unwind_Exception *a1)
{
  sub_25442B9A4(v1);
  _Unwind_Resume(a1);
}

void sub_25442AAC4()
{
  uint64_t v0 = MEMORY[0x270FA5388]();
  uint64_t v2 = v1;
  uint64_t v3 = v0;
  v16[2048] = *MEMORY[0x263EF8340];
  int v14 = v16;
  long long v15 = xmmword_254431660;
  sub_25442B634(v4, &v14, 0x4000uLL, &v13);
  if (v13)
  {
    long long v12 = (void *)v13;
    uint64_t v13 = 0;
    uint64_t v5 = sub_254428B4C(&v12);
    *(unsigned char *)(v3 + 16) |= 1u;
    *(void *)uint64_t v3 = v5;
    *(void *)(v3 + --*(_DWORD *)(this + 8) = v6;
    if (v12) {
      (*(void (**)(void *))(*v12 + 8))(v12);
    }
    if (v13)
    {
      (*(void (**)(uint64_t))(*(void *)v13 + 8))(v13);
      unint64_t v7 = v14;
      if (v14 == v16) {
        return;
      }
      goto LABEL_10;
    }
LABEL_9:
    unint64_t v7 = v14;
    if (v14 == v16) {
      return;
    }
    goto LABEL_10;
  }
  size_t v8 = v14;
  size_t v9 = v15;
  sub_25442A384(v15, v2, &v13);
  uint64_t v10 = v13;
  if (v13)
  {
    memcpy(*(void **)(v13 + 8), v8, v9);
    *(unsigned char *)(v3 + 16) &= ~1u;
    *(void *)uint64_t v3 = v10;
    goto LABEL_9;
  }
  long long v11 = std::generic_category();
  *(unsigned char *)(v3 + 16) |= 1u;
  *(void *)uint64_t v3 = 12;
  *(void *)(v3 + --*(_DWORD *)(this + 8) = v11;
  unint64_t v7 = v14;
  if (v14 == v16) {
    return;
  }
LABEL_10:
  free(v7);
}

void sub_25442AC78(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11)
{
  if (a11 == v11) {
    _Unwind_Resume(exception_object);
  }
  free(a11);
  _Unwind_Resume(exception_object);
}

uint64_t sub_25442ACE8()
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  sub_25442BCE0((uint64_t)&v5);
  if ((v6 & 1) == 0) {
    return v5;
  }
  uint64_t v1 = v5;
  uint64_t v5 = 0;
  uint64_t v3 = v1;
  sub_254421794(&v3, &v4);
  if (v3) {
    (*(void (**)(void *))(*v3 + 8))(v3);
  }
  if (v6)
  {
    uint64_t v2 = v5;
    uint64_t v5 = 0;
    if (v2) {
      (*(void (**)(void *))(*v2 + 8))(v2);
    }
  }
  return 4096;
}

void sub_25442ADD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, __int16 a10, char a11, char a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
  if (a13) {
    sub_25442EF24();
  }
  sub_25442F218((uint64_t)&a12, &a16, &a15);
  _Unwind_Resume(a1);
}

uint64_t sub_25442AE10(uint64_t a1)
{
  uint64_t v1 = a1 + 24;
  strlen((const char *)(a1 + 24));
  return v1;
}

uint64_t sub_25442AE40()
{
  return 0;
}

void *sub_25442AE48(void *a1)
{
  *a1 = &unk_2703CFCB0;
  sub_25442B9A4(a1 + 3);
  return a1;
}

void sub_25442AE90(size_t *a1)
{
  *a1 = (size_t)&unk_2703CFCB0;
  sub_25442B9A4(a1 + 3);

  operator delete(a1);
}

uint64_t sub_25442AEE8(uint64_t a1)
{
  uint64_t v1 = a1 + 48;
  strlen((const char *)(a1 + 48));
  return v1;
}

void *sub_25442AF18(uint64_t a1)
{
  return sub_25442B9BC((size_t *)(a1 + 24));
}

uint64_t sub_25442AF20()
{
  return 1;
}

uint64_t sub_25442AF28(uint64_t *a1)
{
  uint64_t result = *a1;
  *a1 = 0;
  return result;
}

void sub_25442AF44()
{
  *(void *)uint64_t v0 = v2;
  *(_DWORD *)(v0 + --*(_DWORD *)(this + 8) = v1;
}

uint64_t sub_25442AF64(uint64_t a1, unint64_t a2, size_t a3, int a4)
{
  return sub_25442AF6C(a1, a2, a3, a4, 0);
}

uint64_t sub_25442AF6C(uint64_t a1, unint64_t a2, size_t a3, int a4, int a5)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (!HIDWORD(a2))
  {
    return sub_25442B2F8(a1, a2, a3, a4, a5);
  }
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  *(void *)&long long v11 = 0x3030303030303030;
  *((void *)&v11 + 1) = 0x3030303030303030;
  v23[6] = v11;
  v23[7] = v11;
  v23[4] = v11;
  v23[5] = v11;
  v23[2] = v11;
  v23[3] = v11;
  v23[0] = v11;
  v23[1] = v11;
  do
  {
    *((unsigned char *)&v23[7] + v10-- + 15) = (a2 % 0xA) | 0x30;
    v9 += 0x100000000;
    BOOL v12 = a2 > 9;
    a2 /= 0xAuLL;
  }
  while (v12);
  size_t v13 = v9 >> 32;
  if (!a5)
  {
LABEL_10:
    if (a4 != 1) {
      goto LABEL_11;
    }
    goto LABEL_16;
  }
  int v14 = *(unsigned char **)(a1 + 32);
  if ((unint64_t)v14 < *(void *)(a1 + 24))
  {
    *(void *)(a1 + 32) = v14 + 1;
    *int v14 = 45;
    goto LABEL_10;
  }
  sub_25442D8B0(a1, 45);
  if (a4 != 1)
  {
LABEL_11:
    if (v13 < a3)
    {
      size_t v15 = v13;
      do
      {
        while (1)
        {
          size_t v16 = *(unsigned char **)(a1 + 32);
          if ((unint64_t)v16 >= *(void *)(a1 + 24)) {
            break;
          }
          *(void *)(a1 + 32) = v16 + 1;
          *size_t v16 = 48;
          if (++v15 >= a3) {
            goto LABEL_16;
          }
        }
        sub_25442D8B0(a1, 48);
        ++v15;
      }
      while (v15 < a3);
    }
  }
LABEL_16:
  BOOL v17 = &v24[-v13];
  if (a4 != 1) {
    return sub_25442D960(a1, v17, v13);
  }
  unint64_t v18 = (v13 - 1) % 3;
  size_t v19 = v13 - (v18 + 1);
  if (v13 >= v18 + 1) {
    size_t v20 = v18 + 1;
  }
  else {
    size_t v20 = v13;
  }
  uint64_t result = sub_25442D960(a1, v17, v20);
  if (v19)
  {
    unint64_t v21 = -3 * ((-(int)v10 - 1) / 3uLL);
    do
    {
      uint64_t v22 = *(unsigned char **)(a1 + 32);
      if ((unint64_t)v22 < *(void *)(a1 + 24))
      {
        *(void *)(a1 + 32) = v22 + 1;
        *uint64_t v22 = 44;
      }
      else
      {
        sub_25442D8B0(a1, 44);
      }
      uint64_t result = sub_25442D960(a1, &v24[v21], 3uLL);
      v21 += 3;
    }
    while (v21);
  }
  return result;
}

uint64_t sub_25442B1D8(uint64_t a1, unint64_t a2, size_t a3, int a4)
{
  if ((a2 & 0x8000000000000000) != 0)
  {
    a2 = -(uint64_t)a2;
    int v4 = 1;
  }
  else
  {
    int v4 = 0;
  }
  return sub_25442AF6C(a1, a2, a3, a4, v4);
}

uint64_t sub_25442B1F0(uint64_t a1, unint64_t a2, int a3, unint64_t a4, char a5)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (a5)
  {
    if (a4 > 0x7F) {
      LODWORD(a4) = 128;
    }
  }
  else
  {
    LODWORD(a4) = 0;
  }
  unsigned int v5 = (67 - __clz(a2)) >> 2;
  if (v5 <= 1) {
    unsigned int v5 = 1;
  }
  *(void *)&long long v6 = 0x3030303030303030;
  *((void *)&v6 + 1) = 0x3030303030303030;
  v11[6] = v6;
  v11[7] = v6;
  v11[4] = v6;
  v11[5] = v6;
  LODWORD(v7) = v5 + 2 * ((a3 & 0xFFFFFFFE) == 2);
  v11[2] = v6;
  v11[3] = v6;
  if (v7 <= a4) {
    size_t v7 = a4;
  }
  else {
    size_t v7 = v7;
  }
  v11[0] = v6;
  v11[1] = v6;
  if ((a3 & 0xFFFFFFFE) == 2) {
    BYTE1(v11[0]) = 120;
  }
  if (a2)
  {
    size_t v8 = (char *)&v11[-1] + v7 + 15;
    do
    {
      *v8-- = a0123456789abcd[a2 & 0xF] | (32 * ((a3 & 0xFFFFFFFD) != 0));
      BOOL v9 = a2 > 0xF;
      a2 >>= 4;
    }
    while (v9);
  }
  return sub_25442D960(a1, v11, v7);
}

uint64_t sub_25442B2F8(uint64_t a1, unsigned int a2, size_t a3, int a4, int a5)
{
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  uint64_t v25 = *MEMORY[0x263EF8340];
  *(void *)&long long v10 = 0x3030303030303030;
  *((void *)&v10 + 1) = 0x3030303030303030;
  v23[6] = v10;
  v23[7] = v10;
  v23[4] = v10;
  v23[5] = v10;
  v23[2] = v10;
  v23[3] = v10;
  v23[0] = v10;
  v23[1] = v10;
  do
  {
    *((unsigned char *)&v23[7] + v9-- + 15) = (a2 % 0xA) | 0x30;
    v8 += 0x100000000;
    BOOL v11 = a2 > 9;
    a2 /= 0xAu;
  }
  while (v11);
  size_t v12 = v8 >> 32;
  if (!a5)
  {
LABEL_6:
    if (a4 == 1) {
      goto LABEL_14;
    }
    goto LABEL_9;
  }
  size_t v13 = *(unsigned char **)(a1 + 32);
  if ((unint64_t)v13 < *(void *)(a1 + 24))
  {
    *(void *)(a1 + 32) = v13 + 1;
    *size_t v13 = 45;
    goto LABEL_6;
  }
  sub_25442D8B0(a1, 45);
  if (a4 == 1) {
    goto LABEL_14;
  }
LABEL_9:
  if (v12 < a3)
  {
    size_t v14 = v12;
    do
    {
      while (1)
      {
        size_t v15 = *(unsigned char **)(a1 + 32);
        if ((unint64_t)v15 >= *(void *)(a1 + 24)) {
          break;
        }
        *(void *)(a1 + 32) = v15 + 1;
        *size_t v15 = 48;
        if (++v14 >= a3) {
          goto LABEL_14;
        }
      }
      sub_25442D8B0(a1, 48);
      ++v14;
    }
    while (v14 < a3);
  }
LABEL_14:
  size_t v16 = &v24[-v12];
  if (a4 != 1) {
    return sub_25442D960(a1, v16, v12);
  }
  unint64_t v17 = (v12 - 1) % 3;
  size_t v18 = v12 - (v17 + 1);
  if (v12 >= v17 + 1) {
    size_t v19 = v17 + 1;
  }
  else {
    size_t v19 = v12;
  }
  uint64_t result = sub_25442D960(a1, v16, v19);
  if (v18)
  {
    unint64_t v21 = -3 * ((-(int)v9 - 1) / 3uLL);
    do
    {
      uint64_t v22 = *(unsigned char **)(a1 + 32);
      if ((unint64_t)v22 < *(void *)(a1 + 24))
      {
        *(void *)(a1 + 32) = v22 + 1;
        *uint64_t v22 = 44;
      }
      else
      {
        sub_25442D8B0(a1, 44);
      }
      uint64_t result = sub_25442D960(a1, &v24[v21], 3uLL);
      v21 += 3;
    }
    while (v21);
  }
  return result;
}

unint64_t sub_25442B50C(unsigned __int8 *a1, int *a2, int a3, void *a4)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v6 = sub_25442B9DC(a1, a2, 2, 1, a3, 438);
  uint64_t v7 = v6;
  if (v6)
  {
    unint64_t v8 = v6 & 0xFFFFFFFF00000000;
  }
  else
  {
    if (a4)
    {
      a4[1] = 0;
      if (fcntl(*a2, 50, __s) != -1)
      {
        size_t v10 = strlen(__s);
        uint64_t v11 = a4[1];
        if (a4[2] < v11 + v10)
        {
          sub_25442C354((uint64_t)a4, a4 + 3, v11 + v10, 1);
          uint64_t v11 = a4[1];
        }
        if (v10)
        {
          memcpy((void *)(*a4 + v11), __s, v10);
          uint64_t v11 = a4[1];
        }
        a4[1] = v11 + v10;
      }
    }
    std::system_category();
    unint64_t v8 = 0;
  }
  return v8 | v7;
}

uint64_t sub_25442B62C(uint64_t a1)
{
  return *(void *)(a1 + 8);
}

ssize_t sub_25442B634@<X0>(int a1@<W0>, void *a2@<X1>, unint64_t a3@<X2>, void *a4@<X8>)
{
  unint64_t v8 = a2[1];
  uint64_t v9 = a2 + 3;
  if (a3 >= 0x7FFFFFFF) {
    size_t v10 = 0x7FFFFFFFLL;
  }
  else {
    size_t v10 = a3;
  }
  uint64_t v11 = a2[1];
  unint64_t v12 = v8 + a3;
  BOOL v13 = v8 > v8 + a3;
  if (v8 != v8 + a3)
  {
LABEL_5:
    if (!v13 && a2[2] < v12) {
      sub_25442C354((uint64_t)a2, v9, v12, 1);
    }
    a2[1] = v12;
  }
  while (1)
  {
    size_t v14 = (void *)(*a2 + v11);
    while (1)
    {
      *__error() = 0;
      ssize_t result = read(a1, v14, v10);
      if (result != -1) {
        break;
      }
      if (*__error() != 4)
      {
        int v17 = *__error();
        std::generic_category();
        ssize_t result = sub_254428AA0(v17, &v19);
        uint64_t v18 = v19;
        goto LABEL_16;
      }
    }
    if (!result) {
      break;
    }
    v11 += result;
    unint64_t v16 = a2[1];
    unint64_t v12 = v11 + a3;
    BOOL v13 = v16 > v11 + a3;
    if (v16 != v11 + a3) {
      goto LABEL_5;
    }
  }
  uint64_t v18 = 0;
LABEL_16:
  *a4 = v18;
  a2[1] = v11;
  return result;
}

void sub_25442B754(_Unwind_Exception *a1)
{
  *(void *)(v1 + --*(_DWORD *)(this + 8) = v2;
  _Unwind_Resume(a1);
}

void sub_25442B75C(_Unwind_Exception *a1)
{
  *(void *)(v1 + --*(_DWORD *)(this + 8) = v2;
  _Unwind_Resume(a1);
}

void sub_25442B764(_Unwind_Exception *a1)
{
  *(void *)(v1 + --*(_DWORD *)(this + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t sub_25442B76C(int a1, int *a2, uint64_t a3)
{
  if (a1)
  {
    uint64_t v4 = *__error();
    unsigned int v5 = std::generic_category();
    if (v5 == std::generic_category() && v4 == 2)
    {
      *(void *)(a3 + 32) = 0;
      *(_OWORD *)a3 = 0u;
      *(_OWORD *)(a3 + 16) = 0u;
      *(void *)(a3 + 40) = 0xFFFF00000001;
      *(_DWORD *)(a3 + 4--*(_DWORD *)(this + 8) = 0;
      *(_WORD *)(a3 + 52) = 0;
      *(void *)(a3 + 56) = 0;
      return 2;
    }
    else
    {
      *(_OWORD *)(a3 + 2--*(_DWORD *)(this + 8) = 0u;
      *(_OWORD *)a3 = 0u;
      *(_OWORD *)(a3 + 16) = 0u;
      *(void *)(a3 + 44) = 0xFFFFLL;
      *(_WORD *)(a3 + 52) = 0;
      *(void *)(a3 + 56) = 0;
      return v4;
    }
  }
  else
  {
    int v7 = a2[10];
    int v8 = a2[14];
    unint64_t v9 = *((unsigned __int16 *)a2 + 2);
    int v10 = v9 & 0xFFF;
    uint64_t v11 = (v9 >> 12) ^ 8;
    if (v11 == 15) {
      int v12 = 9;
    }
    else {
      int v12 = dword_254431748[v11];
    }
    int v13 = *a2;
    __int16 v14 = *((_WORD *)a2 + 3);
    uint64_t v15 = *((void *)a2 + 1);
    uint64_t v16 = *((void *)a2 + 6);
    uint64_t v17 = *((void *)a2 + 12);
    uint64_t v18 = *((void *)a2 + 2);
    *(void *)a3 = *((void *)a2 + 4);
    *(void *)(a3 + --*(_DWORD *)(this + 8) = v16;
    *(_DWORD *)(a3 + 16) = v7;
    *(_DWORD *)(a3 + 20) = v8;
    *(void *)(a3 + 24) = v18;
    *(void *)(a3 + 32) = v17;
    *(_DWORD *)(a3 + 40) = v12;
    *(_DWORD *)(a3 + 44) = v10;
    *(_DWORD *)(a3 + 4--*(_DWORD *)(this + 8) = v13;
    *(_WORD *)(a3 + 52) = v14;
    *(void *)(a3 + 56) = v15;
    std::system_category();
    return 0;
  }
}

uint64_t sub_25442B8B4(int a1, uint64_t a2)
{
  int v3 = fstat(a1, &v5);
  return sub_25442B76C(v3, &v5.st_dev, a2);
}

uint64_t sub_25442B8F0(uint64_t a1, int a2, int a3, size_t a4, off_t a5, void *a6)
{
  *(void *)a1 = a4;
  *(void *)(a1 + --*(_DWORD *)(this + 8) = 0;
  *(_DWORD *)(a1 + 16) = a3;
  if (a3 == 1) {
    int v9 = 65;
  }
  else {
    int v9 = 66;
  }
  BOOL v10 = a3 == 0;
  if (a3) {
    int v11 = 3;
  }
  else {
    int v11 = 1;
  }
  if (v10) {
    int v12 = 24642;
  }
  else {
    int v12 = v9;
  }
  int v13 = mmap(0, a4, v11, v12, a2, a5);
  *(void *)(a1 + --*(_DWORD *)(this + 8) = v13;
  if (v13 != (void *)-1)
  {
    __int16 v14 = std::system_category();
    *a6 = 0;
    a6[1] = v14;
    return a1;
  }
  uint64_t v16 = *__error();
  uint64_t v17 = std::generic_category();
  *a6 = v16;
  a6[1] = v17;
  if (!v16) {
    return a1;
  }
  *(void *)a1 = 0;
  *(void *)(a1 + --*(_DWORD *)(this + 8) = 0;
  *(_DWORD *)(a1 + 16) = 0;
  return a1;
}

void *sub_25442B9A4(size_t *a1)
{
  ssize_t result = (void *)a1[1];
  if (result) {
    return (void *)munmap(result, *a1);
  }
  return result;
}

void *sub_25442B9BC(size_t *a1)
{
  ssize_t result = (void *)a1[1];
  if (result) {
    return (void *)posix_madvise(result, *a1, 4);
  }
  return result;
}

uint64_t sub_25442B9DC(unsigned __int8 *a1, int *a2, int a3, int a4, int a5, uint64_t a6)
{
  v23[16] = *MEMORY[0x263EF8340];
  int v9 = 2 * (a4 == 3);
  if (a4 == 2) {
    int v9 = 1;
  }
  if (a4 == 1) {
    int v9 = 0;
  }
  int v10 = a5 & 4;
  if ((a5 & 4) != 0) {
    a3 = 3;
  }
  int v12 = v9 | 0x600;
  int v13 = v9 | 0x200;
  if (a3 == 1) {
    v9 |= 0xA00u;
  }
  if (a3 == 3) {
    int v9 = v13;
  }
  if (a3) {
    int v14 = v9;
  }
  else {
    int v14 = v12;
  }
  unint64_t v21 = v23;
  long long v22 = xmmword_254431730;
  uint64_t v15 = (const char *)sub_25442CFD0(a1, (uint64_t)&v21);
  int v16 = v14 | ((a5 << 20) & 0x1000000 | (2 * v10)) ^ 0x1000000;
  while (1)
  {
    *__error() = 0;
    int v17 = open(v15, v16, a6);
    if (v17 != -1) {
      break;
    }
    if (*__error() != 4)
    {
      *a2 = -1;
      goto LABEL_22;
    }
  }
  *a2 = v17;
  if ((v17 & 0x80000000) == 0)
  {
    std::system_category();
    uint64_t v18 = 0;
    uint64_t v19 = v21;
    if (v21 == v23) {
      return v18;
    }
    goto LABEL_23;
  }
LABEL_22:
  uint64_t v18 = *__error();
  std::generic_category();
  uint64_t v19 = v21;
  if (v21 == v23) {
    return v18;
  }
LABEL_23:
  free(v19);
  return v18;
}

void sub_25442BB64(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11)
{
  if (a11 != v11) {
    free(a11);
  }
  _Unwind_Resume(exception_object);
}

unint64_t sub_25442BB88@<X0>(unsigned __int8 *a1@<X0>, int a2@<W1>, void *a3@<X2>, uint64_t a4@<X8>)
{
  int v7 = 0;
  unint64_t result = sub_25442B50C(a1, &v7, a2, a3);
  if (result)
  {
    unint64_t result = sub_254428AA0(result, &v6);
    *(unsigned char *)(a4 + 8) |= 1u;
    *(void *)a4 = v6;
  }
  else
  {
    *(unsigned char *)(a4 + 8) &= ~1u;
    *(_DWORD *)a4 = v7;
  }
  return result;
}

ssize_t sub_25442BC08@<X0>(int a1@<W0>, void *a2@<X1>, unint64_t a3@<X2>, off_t a4@<X3>, uint64_t a5@<X8>)
{
  if (a3 >= 0x7FFFFFFF) {
    size_t v9 = 0x7FFFFFFFLL;
  }
  else {
    size_t v9 = a3;
  }
  while (1)
  {
    *__error() = 0;
    ssize_t result = pread(a1, a2, v9, a4);
    if (result != -1) {
      break;
    }
    if (*__error() != 4)
    {
      int v11 = *__error();
      std::generic_category();
      sub_254428AA0(v11, &v12);
      *(unsigned char *)(a5 + 8) |= 1u;
      ssize_t result = v12;
      goto LABEL_8;
    }
  }
  *(unsigned char *)(a5 + 8) &= ~1u;
LABEL_8:
  *(void *)a5 = result;
  return result;
}

uint64_t sub_25442BCCC(int *a1)
{
  int v1 = *a1;
  *a1 = -1;
  return sub_25442BDA4(v1);
}

void sub_25442BCE0(uint64_t a1@<X8>)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)qword_269DF02A8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(qword_269DF02A8))
  {
    dword_269DF02A0 = getpagesize();
    __cxa_guard_release(qword_269DF02A8);
  }
  int v2 = dword_269DF02A0;
  if (dword_269DF02A0 == -1)
  {
    int v3 = *__error();
    std::generic_category();
    sub_254428AA0(v3, &v4);
    *(unsigned char *)(a1 + 8) |= 1u;
    *(void *)a1 = v4;
  }
  else
  {
    *(unsigned char *)(a1 + 8) &= ~1u;
    *(_DWORD *)a1 = v2;
  }
}

uint64_t sub_25442BDA4(int a1)
{
  sigset_t v5 = -1;
  sigset_t v6 = -1;
  unsigned int v2 = pthread_sigmask(3, &v6, &v5);
  if (!v2)
  {
    if ((close(a1) & 0x80000000) == 0)
    {
      int v3 = pthread_sigmask(3, &v5, 0);
LABEL_5:
      unsigned int v2 = v3;
      goto LABEL_6;
    }
    unsigned int v2 = *__error();
    int v3 = pthread_sigmask(3, &v5, 0);
    if (!v2) {
      goto LABEL_5;
    }
  }
LABEL_6:
  std::generic_category();
  return v2;
}

BOOL sub_25442BE38(int a1)
{
  return isatty(a1) != 0;
}

BOOL sub_25442BE58()
{
  uint64_t v0 = getenv("TERM");
  int v1 = v0;
  if (!v0) {
    return 0;
  }
  size_t v2 = strlen(v0);
  if (v2 == 6)
  {
    if (*(_DWORD *)v1 == 2003269987 && *((_WORD *)v1 + 2) == 28265) {
      return v1 != 0;
    }
LABEL_22:
    if (*(_DWORD *)v1 == 1701995379 && *((_WORD *)v1 + 2) == 28261) {
      return v1 != 0;
    }
LABEL_26:
    if (*(_DWORD *)v1 == 1919251576 && v1[4] == 109) {
      return v1 != 0;
    }
    BOOL v8 = *(_DWORD *)v1 == 808547446 && v1[4] == 48;
    if (v8 || *(_DWORD *)v1 == 1953921138) {
      return v1 != 0;
    }
    if (*(_DWORD *)&v1[v2 - 5] == 1869377379 && v1[v2 - 1] == 114) {
      return v1 != 0;
    }
    return 0;
  }
  if (v2 == 5)
  {
    if (*(_DWORD *)v1 == 1970170220 && v1[4] == 120) {
      return v1 != 0;
    }
    goto LABEL_26;
  }
  if (v2 != 4)
  {
    if (v2 < 6) {
      return 0;
    }
    goto LABEL_22;
  }
  if (*(_DWORD *)v1 != 1769172577 && *(_DWORD *)v1 != 1953921138) {
    return 0;
  }
  return v1 != 0;
}

BOOL sub_25442C000(int a1)
{
  if (!isatty(a1)) {
    return 0;
  }
  if (!atomic_load_explicit(&qword_269DF0288, memory_order_acquire)) {
    sub_254429EC0((unint64_t *)&qword_269DF0288, (uint64_t (*)(void))sub_25442C1AC, (unint64_t)sub_25442C1F8);
  }
  size_t v2 = (std::mutex *)qword_269DF0288;
  std::mutex::lock((std::mutex *)qword_269DF0288);
  int v3 = set_curterm(0);
  int v8 = 0;
  if (setupterm(0, a1, &v8))
  {
    BOOL v4 = 0;
  }
  else
  {
    int v6 = tigetnum("colors");
    if (v6 < 0) {
      BOOL v4 = sub_25442BE58();
    }
    else {
      BOOL v4 = v6 != 0;
    }
    int v7 = set_curterm(v3);
    del_curterm(v7);
  }
  std::mutex::unlock(v2);
  return v4;
}

void sub_25442C108(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_25442C11C(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_25442C130(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_25442C144(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_25442C158()
{
  return 0;
}

char *sub_25442C160(char a1, int a2, int a3)
{
  return &a030m[160 * a3 + 80 * a2 + 10 * (a1 & 7)];
}

const char *sub_25442C188()
{
  return "\x1B[1m";
}

const char *sub_25442C194()
{
  return "\x1B[7m";
}

const char *sub_25442C1A0()
{
  return "\x1B[0m";
}

void sub_25442C1AC()
{
}

std::mutex *sub_25442C1F8(std::mutex *result)
{
  if (result)
  {
    std::mutex::~mutex(result);
    JUMPOUT(0x25A278F10);
  }
  return result;
}

void *sub_25442C238(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  if (HIDWORD(a3)) {
    sub_25442C450(a3);
  }
  uint64_t v5 = *(unsigned int *)(a1 + 12);
  if (v5 == -1) {
    sub_25442C6E8(0xFFFFFFFFuLL);
  }
  unint64_t v7 = (2 * v5) | 1;
  if (v7 <= a3) {
    unint64_t v7 = a3;
  }
  if (v7 >= 0xFFFFFFFF) {
    uint64_t v8 = 0xFFFFFFFFLL;
  }
  else {
    uint64_t v8 = v7;
  }
  size_t v9 = *(void **)a1;
  uint64_t v10 = v8 * a4;
  if (*(void *)a1 == a2)
  {
    ssize_t v12 = malloc_type_malloc(v8 * a4, 0x4065EBACuLL);
    if (!v12 && (v10 || (ssize_t v12 = malloc_type_malloc(1uLL, 0x4065EBACuLL)) == 0)) {
LABEL_20:
    }
      sub_254428694();
    ssize_t result = memcpy(v12, *(const void **)a1, *(unsigned int *)(a1 + 8) * a4);
  }
  else
  {
    ssize_t result = malloc_type_realloc(v9, v8 * a4, 0x1DB68EDCuLL);
    ssize_t v12 = result;
    if (!result)
    {
      if (v10) {
        goto LABEL_20;
      }
      ssize_t result = malloc_type_malloc(1uLL, 0x4065EBACuLL);
      ssize_t v12 = result;
      if (!result) {
        goto LABEL_20;
      }
    }
  }
  *(void *)a1 = v12;
  *(_DWORD *)(a1 + --*(_DWORD *)(result + 12) = v8;
  return result;
}

void *sub_25442C354(uint64_t a1, void *a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = *(void *)(a1 + 16);
  if (v4 == -1) {
    sub_25442C6E8(0xFFFFFFFFFFFFFFFFLL);
  }
  unint64_t v7 = (2 * v4) | 1;
  if (v7 <= a3) {
    unint64_t v8 = a3;
  }
  else {
    unint64_t v8 = v7;
  }
  size_t v9 = *(void **)a1;
  unint64_t v10 = v8 * a4;
  if (v9 == a2)
  {
    ssize_t v12 = malloc_type_malloc(v8 * a4, 0x4065EBACuLL);
    if (!v12 && (v10 || (ssize_t v12 = malloc_type_malloc(1uLL, 0x4065EBACuLL)) == 0)) {
LABEL_16:
    }
      sub_254428694();
    ssize_t result = memcpy(v12, *(const void **)a1, *(void *)(a1 + 8) * a4);
  }
  else
  {
    ssize_t result = malloc_type_realloc(v9, v8 * a4, 0x1DB68EDCuLL);
    ssize_t v12 = result;
    if (!result)
    {
      if (v10) {
        goto LABEL_16;
      }
      ssize_t result = malloc_type_malloc(1uLL, 0x4065EBACuLL);
      ssize_t v12 = result;
      if (!result) {
        goto LABEL_16;
      }
    }
  }
  *(void *)a1 = v12;
  *(void *)(a1 + 16) = v8;
  return result;
}

void sub_25442C450(unint64_t a1)
{
  std::to_string(&v13, a1);
  int v1 = std::string::insert(&v13, 0, "SmallVector unable to grow. Requested capacity (");
  long long v2 = *(_OWORD *)&v1->__r_.__value_.__l.__data_;
  v14.__r_.__value_.__r.__words[2] = v1->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v14.__r_.__value_.__l.__data_ = v2;
  v1->__r_.__value_.__l.__size_ = 0;
  v1->__r_.__value_.__r.__words[2] = 0;
  v1->__r_.__value_.__r.__words[0] = 0;
  int v3 = std::string::append(&v14, ") is larger than maximum value for size type (");
  long long v4 = *(_OWORD *)&v3->__r_.__value_.__l.__data_;
  v15.__r_.__value_.__r.__words[2] = v3->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v15.__r_.__value_.__l.__data_ = v4;
  v3->__r_.__value_.__l.__size_ = 0;
  v3->__r_.__value_.__r.__words[2] = 0;
  v3->__r_.__value_.__r.__words[0] = 0;
  std::to_string(&__p, 0xFFFFFFFFuLL);
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
  unint64_t v7 = std::string::append(&v15, (const std::string::value_type *)p_p, size);
  long long v8 = *(_OWORD *)&v7->__r_.__value_.__l.__data_;
  v16.__r_.__value_.__r.__words[2] = v7->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v16.__r_.__value_.__l.__data_ = v8;
  v7->__r_.__value_.__l.__size_ = 0;
  v7->__r_.__value_.__r.__words[2] = 0;
  v7->__r_.__value_.__r.__words[0] = 0;
  size_t v9 = std::string::append(&v16, ")");
  long long v10 = *(_OWORD *)&v9->__r_.__value_.__l.__data_;
  v17.__r_.__value_.__r.__words[2] = v9->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v17.__r_.__value_.__l.__data_ = v10;
  v9->__r_.__value_.__l.__size_ = 0;
  v9->__r_.__value_.__r.__words[2] = 0;
  v9->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v16.__r_.__value_.__l.__data_);
    if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
LABEL_9:
      if ((SHIBYTE(v15.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
        goto LABEL_10;
      }
      goto LABEL_16;
    }
  }
  else if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    goto LABEL_9;
  }
  operator delete(__p.__r_.__value_.__l.__data_);
  if ((SHIBYTE(v15.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
LABEL_10:
    if ((SHIBYTE(v14.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_17;
  }
LABEL_16:
  operator delete(v15.__r_.__value_.__l.__data_);
  if ((SHIBYTE(v14.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
LABEL_11:
    if ((SHIBYTE(v13.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_17:
  operator delete(v14.__r_.__value_.__l.__data_);
  if ((SHIBYTE(v13.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
LABEL_13:
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::logic_error::logic_error(exception, &v17);
    exception->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
    __cxa_throw(exception, (struct type_info *)off_2653AC090, MEMORY[0x263F8C060]);
  }
LABEL_12:
  operator delete(v13.__r_.__value_.__l.__data_);
  goto LABEL_13;
}

void sub_25442C5F8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,uint64_t a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33)
{
  if (*(char *)(v33 - 25) < 0)
  {
    operator delete(*(void **)(v33 - 48));
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void sub_25442C66C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    JUMPOUT(0x25442C678);
  }
  JUMPOUT(0x25442C638);
}

void sub_25442C68C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (a24 < 0) {
    JUMPOUT(0x25442C698);
  }
  JUMPOUT(0x25442C640);
}

void sub_25442C6AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0) {
    JUMPOUT(0x25442C6B8);
  }
  JUMPOUT(0x25442C648);
}

void sub_25442C6CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    JUMPOUT(0x25442C6D8);
  }
  JUMPOUT(0x25442C650);
}

void sub_25442C6E8(unint64_t a1)
{
  std::to_string(&v4, a1);
  int v1 = std::string::insert(&v4, 0, "SmallVector capacity unable to grow. Already at maximum size ");
  long long v2 = *(_OWORD *)&v1->__r_.__value_.__l.__data_;
  v5.__r_.__value_.__r.__words[2] = v1->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v5.__r_.__value_.__l.__data_ = v2;
  v1->__r_.__value_.__l.__size_ = 0;
  v1->__r_.__value_.__r.__words[2] = 0;
  v1->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v4.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v4.__r_.__value_.__l.__data_);
  }
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::logic_error::logic_error(exception, &v5);
  exception->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  __cxa_throw(exception, (struct type_info *)off_2653AC090, MEMORY[0x263F8C060]);
}

void sub_25442C794(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  if ((a18 & 0x80000000) == 0) {
    _Unwind_Resume(exception_object);
  }
  operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_25442C7CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
  {
    operator delete(__p);
    _Unwind_Resume(a1);
  }
  JUMPOUT(0x25442C7A0);
}

uint64_t sub_25442C7E8(void *a1, unsigned __int8 *a2, uint64_t a3, unint64_t a4)
{
  for (; a3; --a3)
  {
    unsigned int v4 = *a2++;
    *(void *)((char *)&v7 + (((unint64_t)v4 >> 3) & 0x18)) |= 1 << v4;
  }
  unint64_t v5 = a1[1];
  if (v5 <= a4) {
    return -1;
  }
  while (((*(void *)((char *)&v7 + (((unint64_t)*(unsigned __int8 *)(*a1 + a4) >> 3) & 0x18)) >> *(unsigned char *)(*a1 + a4)) & 1) != 0)
  {
    if (v5 == ++a4) {
      return -1;
    }
  }
  return a4;
}

uint64_t sub_25442C868(void *a1, unsigned __int8 *a2, uint64_t a3, unint64_t a4)
{
  for (; a3; --a3)
  {
    unsigned int v4 = *a2++;
    *(void *)((char *)&v10 + (((unint64_t)v4 >> 3) & 0x18)) |= 1 << v4;
  }
  if (a1[1] >= a4) {
    unint64_t v5 = a4;
  }
  else {
    unint64_t v5 = a1[1];
  }
  while (v5)
  {
    unint64_t v6 = v5 - 1;
    unint64_t v7 = *(unsigned __int8 *)(*a1 + v5 - 1);
    uint64_t v8 = *(void *)((char *)&v10 + ((v7 >> 3) & 0x18)) >> v7;
    unint64_t v5 = v6;
    if ((v8 & 1) == 0) {
      return v6;
    }
  }
  return -1;
}

uint64_t sub_25442C8F8(unsigned __int8 **a1, unsigned int a2, unint64_t *a3)
{
  if (a2)
  {
    unint64_t v5 = a1[1];
    if (!v5) {
      return 1;
    }
  }
  else
  {
    a2 = sub_25442CA08((uint64_t)a1);
    unint64_t v5 = a1[1];
    if (!v5) {
      return 1;
    }
  }
  unint64_t v6 = 0;
  unint64_t v7 = *a1;
  *a3 = 0;
  uint64_t v8 = v5;
  do
  {
    if ((char)*v7 < 48) {
      break;
    }
    unsigned int v9 = *v7;
    if (v9 >= 0x3A)
    {
      if (v9 < 0x61)
      {
        if (v9 - 65 > 0x19) {
          break;
        }
        unsigned int v10 = v9 - 55;
        if (v10 >= a2) {
          break;
        }
      }
      else
      {
        if (v9 >= 0x7B) {
          break;
        }
        unsigned int v10 = v9 - 87;
        if (v10 >= a2) {
          break;
        }
      }
    }
    else
    {
      unsigned int v10 = v9 - 48;
      if (v10 >= a2) {
        break;
      }
    }
    unint64_t v11 = v6 * a2 + v10;
    *a3 = v11;
    if (v11 / a2 < v6) {
      return 1;
    }
    ++v7;
    unint64_t v6 = v11;
    --v8;
  }
  while (v8);
  if (v5 == v8) {
    return 1;
  }
  uint64_t result = 0;
  *a1 = v7;
  a1[1] = v8;
  return result;
}

uint64_t sub_25442CA08(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 < 2) {
    return 10;
  }
  int v3 = *(unsigned char **)a1;
  if (**(_WORD **)a1 == 30768 || *(_WORD *)v3 == 22576)
  {
    *(void *)a1 = v3 + 2;
    *(void *)(a1 + --*(_DWORD *)(this + 8) = v1 - 2;
    return 16;
  }
  else if (*(_WORD *)v3 == 25136 || *(_WORD *)v3 == 16944)
  {
    *(void *)a1 = v3 + 2;
    *(void *)(a1 + --*(_DWORD *)(this + 8) = v1 - 2;
    return 2;
  }
  else if (*(_WORD *)v3 == 28464)
  {
    *(void *)a1 = v3 + 2;
    *(void *)(a1 + --*(_DWORD *)(this + 8) = v1 - 2;
    return 8;
  }
  else
  {
    if (*v3 != 48) {
      return 10;
    }
    int v5 = v3[1];
    unsigned int v4 = v3 + 1;
    if ((v5 - 48) > 9) {
      return 10;
    }
    *(void *)a1 = v4;
    *(void *)(a1 + --*(_DWORD *)(this + 8) = v1 - 1;
    return 8;
  }
}

uint64_t sub_25442CB0C()
{
  return 1;
}

void sub_25442CB14(unsigned __int8 *a1@<X0>, void *a2@<X8>)
{
  long long v2 = (void **)a1;
  v18[32] = *MEMORY[0x263EF8340];
  int v4 = a1[32];
  if (v4 != 6)
  {
    if (v4 != 4)
    {
      int v8 = a1[33];
      std::string v16 = v18;
      long long v17 = xmmword_254431520;
      if (v8 == 1)
      {
        switch(v4)
        {
          case 1:
            goto LABEL_22;
          case 3:
            long long v2 = *(void ***)a1;
            if (!*(void *)a1) {
              goto LABEL_22;
            }
            size_t v9 = strlen((const char *)v2);
            goto LABEL_18;
          case 4:
            long long v2 = *(void ***)a1;
            if (*(char *)(*(void *)a1 + 23) < 0) {
              goto LABEL_16;
            }
            size_t v9 = *(unsigned __int8 *)(*(void *)a1 + 23);
            if (v9 >= 0x17) {
              goto LABEL_29;
            }
            goto LABEL_20;
          case 5:
            goto LABEL_16;
          default:
            break;
        }
      }
LABEL_15:
      sub_25442CEB8((uint64_t)a1, (uint64_t)&v16);
      long long v2 = &v16;
LABEL_16:
      if (!*v2)
      {
LABEL_22:
        *a2 = 0;
        a2[1] = 0;
        a2[2] = 0;
        unsigned int v10 = v16;
        if (v16 == v18) {
          return;
        }
LABEL_34:
        free(v10);
        return;
      }
      size_t v9 = (size_t)v2[1];
      long long v2 = (void **)*v2;
LABEL_18:
      if (v9 >= 0x7FFFFFFFFFFFFFF8) {
        sub_254422888();
      }
      if (v9 >= 0x17)
      {
LABEL_29:
        uint64_t v13 = (v9 & 0x7FFFFFFFFFFFFFF8) + 8;
        if ((v9 | 7) != 0x17) {
          uint64_t v13 = v9 | 7;
        }
        uint64_t v14 = v13 + 1;
        std::string v15 = operator new(v13 + 1);
        a2[1] = v9;
        a2[2] = v14 | 0x8000000000000000;
        *a2 = v15;
        a2 = v15;
      }
      else
      {
LABEL_20:
        *((unsigned char *)a2 + 23) = v9;
        if (!v9)
        {
LABEL_33:
          *((unsigned char *)a2 + v9) = 0;
          unsigned int v10 = v16;
          if (v16 == v18) {
            return;
          }
          goto LABEL_34;
        }
      }
      memmove(a2, v2, v9);
      goto LABEL_33;
    }
    if (a1[33] == 1)
    {
      int v5 = *(void ***)a1;
      if (*(char *)(*(void *)a1 + 23) < 0)
      {
        unint64_t v11 = *v5;
        unint64_t v12 = (unint64_t)v5[1];
        sub_2544280AC(a2, v11, v12);
      }
      else
      {
        long long v6 = *(_OWORD *)v5;
        a2[2] = v5[2];
        *(_OWORD *)a2 = v6;
      }
      return;
    }
LABEL_10:
    std::string v16 = v18;
    long long v17 = xmmword_254431520;
    goto LABEL_15;
  }
  if (a1[33] != 1) {
    goto LABEL_10;
  }
  uint64_t v7 = *(void *)a1;

  sub_25442CDDC(v7, a2);
}

void sub_25442CDAC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9)
{
  if (a9 != v9) {
    free(a9);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_25442CDDC@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  int v5 = 0;
  char v9 = 0;
  uint64_t v10 = 0;
  int v11 = 1;
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  uint64_t v6 = 0;
  int v4 = &unk_2703CFE20;
  unint64_t v12 = a2;
  sub_25442D54C((uint64_t)&v4, 0, 0, 0);
  sub_25442DBE4((uint64_t)&v4, a1);
  if (v8 != v6) {
    sub_25442D810(&v4);
  }
  return sub_25442D3B0((uint64_t)&v4);
}

void sub_25442CE90(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_25442D3B0((uint64_t)va);
  if (*(char *)(v2 + 23) < 0) {
    operator delete(*(void **)v2);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_25442CEB8(uint64_t a1, uint64_t a2)
{
  int v7 = 0;
  char v11 = 0;
  uint64_t v12 = 0;
  int v13 = 1;
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  uint64_t v8 = 0;
  uint64_t v6 = &unk_2703CFEB0;
  uint64_t v14 = a2;
  int v3 = (void *)sub_25442D54C((uint64_t)&v6, 0, 0, 0);
  int v4 = sub_25442D0B0(v3, (uint64_t)&v6, *(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 32));
  sub_25442D0B0(v4, (uint64_t)&v6, *(void *)(a1 + 16), *(void *)(a1 + 24), *(unsigned char *)(a1 + 33));
  return sub_25442D3B0((uint64_t)&v6);
}

void sub_25442CF5C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_25442D3B0((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_25442CF70(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_25442D3B0((uint64_t)va);
  _Unwind_Resume(a1);
}

void *sub_25442CF84(unsigned __int8 *a1, uint64_t a2)
{
  int v4 = sub_25442D0B0(a1, a2, *(void *)a1, *((void *)a1 + 1), a1[32]);
  uint64_t v5 = *((void *)a1 + 2);
  size_t v6 = *((void *)a1 + 3);
  unsigned __int8 v7 = a1[33];

  return sub_25442D0B0(v4, a2, v5, v6, v7);
}

void *sub_25442CFD0(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t v2 = (void *)a2;
  if (a1[33] != 1) {
    goto LABEL_7;
  }
  unsigned int v3 = a1[32];
  if (v3 < 2) {
    goto LABEL_7;
  }
  if (v3 == 4)
  {
    uint64_t v2 = *(void **)a1;
    if ((*(char *)(*(void *)a1 + 23) & 0x80000000) == 0) {
      return *(void **)a1;
    }
    return (void *)*v2;
  }
  if (v3 != 3)
  {
LABEL_7:
    sub_25442CEB8((uint64_t)a1, a2);
    uint64_t v6 = v2[1];
    if ((unint64_t)(v6 + 1) > v2[2])
    {
      sub_25442C354((uint64_t)v2, v2 + 3, v6 + 1, 1);
      uint64_t v6 = v2[1];
    }
    *(unsigned char *)(*v2 + v6) = 0;
    return (void *)*v2;
  }
  uint64_t v4 = *(void *)a1;
  if (!*(void *)a1) {
    return 0;
  }
  strlen(*(const char **)a1);
  return (void *)v4;
}

void *sub_25442D0B0(void *result, uint64_t a2, uint64_t a3, size_t a4, unsigned __int8 a5)
{
  int v8 = a5;
  if (a5 == 2)
  {
    do
    {
      uint64_t result = (void *)sub_25442D0B0(result, a2, *(void *)a3, *(void *)(a3 + 8), *(unsigned __int8 *)(a3 + 32));
      unsigned __int8 v9 = *(unsigned char *)(a3 + 33);
      uint64_t v10 = a3 + 16;
      a3 = *(void *)(a3 + 16);
      a4 = *(void *)(v10 + 8);
      int v8 = v9;
    }
    while (v9 == 2);
  }
  switch(v8)
  {
    case 3:
      if (a3)
      {
        a4 = strlen((const char *)a3);
        uint64_t result = *(void **)(a2 + 32);
        if (a4 > *(void *)(a2 + 24) - (void)result) {
          goto LABEL_18;
        }
        goto LABEL_6;
      }
      return result;
    case 4:
      int v11 = *(char *)(a3 + 23);
      if (v11 >= 0) {
        uint64_t v12 = (unsigned char *)a3;
      }
      else {
        uint64_t v12 = *(unsigned char **)a3;
      }
      if (v11 >= 0) {
        size_t v13 = *(unsigned __int8 *)(a3 + 23);
      }
      else {
        size_t v13 = *(void *)(a3 + 8);
      }
      uint64_t v14 = a2;
      return (void *)sub_25442D960(v14, v12, v13);
    case 5:
      uint64_t result = *(void **)(a2 + 32);
      if (a4 <= *(void *)(a2 + 24) - (void)result)
      {
LABEL_6:
        if (a4)
        {
          uint64_t result = memcpy(result, (const void *)a3, a4);
          *(void *)(a2 + 32) += a4;
        }
      }
      else
      {
LABEL_18:
        uint64_t v14 = a2;
        uint64_t v12 = (unsigned char *)a3;
        size_t v13 = a4;
        return (void *)sub_25442D960(v14, v12, v13);
      }
      return result;
    case 6:
      return (void *)sub_25442DBE4(a2, a3);
    case 7:
      std::string v15 = *(unsigned char **)(a2 + 32);
      if ((unint64_t)v15 >= *(void *)(a2 + 24))
      {
        return (void *)sub_25442D8B0(a2, a3);
      }
      else
      {
        *(void *)(a2 + 32) = v15 + 1;
        *std::string v15 = a3;
      }
      return result;
    case 8:
      unint64_t v16 = a3;
      uint64_t v17 = a2;
      goto LABEL_29;
    case 9:
      unint64_t v18 = (int)a3;
      uint64_t v19 = a2;
      goto LABEL_32;
    case 10:
      unint64_t v16 = *(void *)a3;
      uint64_t v17 = a2;
      goto LABEL_29;
    case 11:
      unint64_t v18 = *(void *)a3;
      uint64_t v19 = a2;
      goto LABEL_32;
    case 12:
      unint64_t v16 = *(void *)a3;
      uint64_t v17 = a2;
LABEL_29:
      uint64_t result = (void *)sub_25442D5B8(v17, v16);
      break;
    case 13:
      unint64_t v18 = *(void *)a3;
      uint64_t v19 = a2;
LABEL_32:
      uint64_t result = (void *)sub_25442D5E8(v19, v18);
      break;
    case 14:
      unint64_t v20 = *(void *)a3;
      uint64_t result = (void *)sub_25442D618(a2, v20);
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_25442D3B0(uint64_t a1)
{
  *(void *)a1 = &unk_2703CFD00;
  if (*(_DWORD *)(a1 + 56) == 1)
  {
    uint64_t v2 = *(void *)(a1 + 16);
    if (v2) {
      MEMORY[0x25A278EF0](v2, 0x1000C8077774924);
    }
  }
  return a1;
}

uint64_t sub_25442D420()
{
  return 1024;
}

uint64_t sub_25442D428(uint64_t *a1)
{
  uint64_t result = (*(uint64_t (**)(uint64_t *))(*a1 + 88))(a1);
  uint64_t v4 = a1 + 2;
  uint64_t v3 = a1[2];
  uint64_t v5 = a1[4];
  if (result)
  {
    if (v5 != v3)
    {
      a1[4] = v3;
      sub_25442D824(a1, v3, v5 - v3);
    }
    operator new[]();
  }
  uint64_t v6 = v5 - v3;
  if (v5 != v3)
  {
    a1[4] = v3;
    uint64_t result = sub_25442D824(a1, v3, v6);
  }
  if (*((_DWORD *)a1 + 14) == 1)
  {
    uint64_t result = *v4;
    if (*v4) {
      uint64_t result = MEMORY[0x25A278EF0](result, 0x1000C8077774924, v6);
    }
  }
  *((_DWORD *)a1 + 14) = 0;
  a1[3] = 0;
  a1[4] = 0;
  uint64_t *v4 = 0;
  return result;
}

uint64_t sub_25442D54C(uint64_t result, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v7 = result;
  if (*(_DWORD *)(result + 56) == 1)
  {
    uint64_t result = *(void *)(result + 16);
    if (result) {
      uint64_t result = MEMORY[0x25A278EF0](result, 0x1000C8077774924);
    }
  }
  *(void *)(v7 + 16) = a2;
  *(void *)(v7 + 24) = a2 + a3;
  *(void *)(v7 + 32) = a2;
  *(_DWORD *)(v7 + 56) = a4;
  return result;
}

uint64_t sub_25442D5B8(uint64_t a1, unint64_t a2)
{
  return a1;
}

uint64_t sub_25442D5E8(uint64_t a1, unint64_t a2)
{
  return a1;
}

uint64_t sub_25442D618(uint64_t a1, unint64_t a2)
{
  return a1;
}

uint64_t sub_25442D64C(uint64_t a1, uint64_t a2)
{
  v16[16] = *MEMORY[0x263EF8340];
  unint64_t v4 = *(void *)(a1 + 24) - *(void *)(a1 + 32);
  if (v4 <= 3)
  {
    unint64_t v7 = 127;
  }
  else
  {
    int v5 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 8))(a2);
    if (v5 < v4) {
      unsigned int v6 = v5;
    }
    else {
      unsigned int v6 = v5 + 1;
    }
    if (v5 >= 0) {
      unint64_t v7 = v6;
    }
    else {
      unint64_t v7 = (2 * v4);
    }
    if (v4 >= v7)
    {
      *(void *)(a1 + 32) += v7;
      return a1;
    }
  }
  uint64_t v14 = v16;
  long long v15 = xmmword_254431730;
  do
  {
    uint64_t v8 = v15;
    if ((void)v15 != v7)
    {
      if ((unint64_t)v15 <= v7)
      {
        if (*((void *)&v15 + 1) < v7)
        {
          sub_25442C354((uint64_t)&v14, v16, v7, 1);
          uint64_t v8 = v15;
        }
        if (v7 != v8) {
          bzero((char *)v14 + v8, v7 - v8);
        }
      }
      *(void *)&long long v15 = v7;
    }
    int v9 = (*(uint64_t (**)(uint64_t, void *, unint64_t))(*(void *)a2 + 8))(a2, v14, v7);
    if (v9 < v7) {
      unsigned int v10 = v9;
    }
    else {
      unsigned int v10 = v9 + 1;
    }
    if (v9 >= 0) {
      size_t v11 = v10;
    }
    else {
      size_t v11 = (2 * v7);
    }
    BOOL v12 = v7 >= v11;
    unint64_t v7 = v11;
  }
  while (!v12);
  sub_25442D960(a1, v14, v11);
  if (v14 != v16) {
    free(v14);
  }
  return a1;
}

void sub_25442D7EC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9)
{
  if (a9 != v9) {
    free(a9);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_25442D810(void *a1)
{
  uint64_t v1 = a1[2];
  uint64_t v2 = a1[4] - v1;
  a1[4] = v1;
  return sub_25442D824(a1, v1, v2);
}

uint64_t sub_25442D824(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = a1[6];
  if (v6)
  {
    uint64_t v7 = *(void *)(v6 + 16);
    if (*(void *)(v6 + 32) != v7)
    {
      *(void *)(v6 + 32) = v7;
      sub_25442D824();
    }
  }
  uint64_t v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(*a1 + 72);

  return v8(a1, a2, a3);
}

uint64_t sub_25442D8B0(uint64_t a1, char a2)
{
  unint64_t v4 = *(unsigned char **)(a1 + 32);
  if ((unint64_t)v4 >= *(void *)(a1 + 24))
  {
    while (1)
    {
      uint64_t v6 = *(void *)(a1 + 16);
      if (v6)
      {
        *(void *)(a1 + 32) = v6;
        sub_25442D824((void *)a1, v6, (uint64_t)&v4[-v6]);
        unint64_t v4 = *(unsigned char **)(a1 + 32);
        goto LABEL_2;
      }
      if (!*(_DWORD *)(a1 + 56)) {
        break;
      }
      sub_25442D428((uint64_t *)a1);
      unint64_t v4 = *(unsigned char **)(a1 + 32);
      if ((unint64_t)v4 < *(void *)(a1 + 24)) {
        goto LABEL_2;
      }
    }
    char v7 = a2;
    sub_25442D824((void *)a1, (uint64_t)&v7, 1);
    return a1;
  }
  else
  {
LABEL_2:
    *(void *)(a1 + 32) = v4 + 1;
    unsigned char *v4 = a2;
    return a1;
  }
}

uint64_t sub_25442D960(uint64_t a1, unsigned char *a2, size_t __n)
{
  size_t v3 = __n;
  uint64_t v7 = *(void *)(a1 + 24);
  uint64_t v6 = *(unsigned char **)(a1 + 32);
  size_t v8 = v7 - (void)v6;
  if (v7 - (uint64_t)v6 < __n)
  {
    while (1)
    {
      while (1)
      {
        size_t v11 = *(unsigned char **)(a1 + 16);
        if (!v11) {
          break;
        }
        if (v6 == v11)
        {
          v8 *= v3 / v8;
          v3 -= v8;
          sub_25442D824((void *)a1, (uint64_t)a2, v8);
          uint64_t v6 = *(unsigned char **)(a1 + 32);
          size_t v10 = *(void *)(a1 + 24) - (void)v6;
          if (v3 <= v10)
          {
            sub_25442DB20((void **)a1, &a2[v8], v3);
            return a1;
          }
        }
        else
        {
          sub_25442DB20((void **)a1, a2, v8);
          uint64_t v12 = *(void *)(a1 + 16);
          uint64_t v13 = *(void *)(a1 + 32) - v12;
          *(void *)(a1 + 32) = v12;
          sub_25442D824((void *)a1, v12, v13);
          v3 -= v8;
          uint64_t v6 = *(unsigned char **)(a1 + 32);
          size_t v10 = *(void *)(a1 + 24) - (void)v6;
        }
        a2 += v8;
        size_t v8 = v10;
        if (v10 >= v3) {
          goto LABEL_2;
        }
      }
      if (!*(_DWORD *)(a1 + 56)) {
        break;
      }
      sub_25442D428((uint64_t *)a1);
      uint64_t v6 = *(unsigned char **)(a1 + 32);
      size_t v8 = *(void *)(a1 + 24) - (void)v6;
      if (v8 >= v3) {
        goto LABEL_2;
      }
    }
    sub_25442D824((void *)a1, (uint64_t)a2, v3);
    return a1;
  }
  else
  {
LABEL_2:
    switch(v3)
    {
      case 0uLL:
        break;
      case 1uLL:
        goto LABEL_6;
      case 2uLL:
        goto LABEL_5;
      case 3uLL:
        goto LABEL_4;
      case 4uLL:
        v6[3] = a2[3];
        uint64_t v6 = *(unsigned char **)(a1 + 32);
LABEL_4:
        v6[2] = a2[2];
        uint64_t v6 = *(unsigned char **)(a1 + 32);
LABEL_5:
        v6[1] = a2[1];
        uint64_t v6 = *(unsigned char **)(a1 + 32);
LABEL_6:
        *uint64_t v6 = *a2;
        break;
      default:
        memcpy(v6, a2, v3);
        break;
    }
    *(void *)(a1 + 32) += v3;
    return a1;
  }
}

void **sub_25442DB20(void **result, unsigned char *a2, size_t __n)
{
  unint64_t v4 = result;
  switch(__n)
  {
    case 0uLL:
      goto LABEL_6;
    case 1uLL:
      goto LABEL_5;
    case 2uLL:
      goto LABEL_4;
    case 3uLL:
      goto LABEL_3;
    case 4uLL:
      *((unsigned char *)result[4] + 3) = a2[3];
LABEL_3:
      *((unsigned char *)result[4] + 2) = a2[2];
LABEL_4:
      *((unsigned char *)result[4] + 1) = a2[1];
LABEL_5:
      *(unsigned char *)result[4] = *a2;
LABEL_6:
      result[4] = (char *)result[4] + __n;
      break;
    default:
      uint64_t result = (void **)memcpy(result[4], a2, __n);
      v4[4] = (char *)v4[4] + __n;
      break;
  }
  return result;
}

uint64_t sub_25442DBE4(uint64_t a1, uint64_t a2)
{
  return a1;
}

void sub_25442DC14(uint64_t a1, uint64_t a2)
{
  v21[16] = *MEMORY[0x263EF8340];
  sub_254429D68(*(char **)a1, *(void *)(a1 + 8), (uint64_t)&v19);
  unint64_t v4 = v19;
  if (v20)
  {
    int v5 = (char *)v19 + 32;
    unint64_t v6 = (unint64_t)v20 << 6;
    do
    {
      int v7 = *((_DWORD *)v5 - 8);
      if (v7)
      {
        if (v7 == 2 || (unint64_t v8 = *((void *)v5 - 1), v8 >= *(void *)(a1 + 24)))
        {
          uint64_t v12 = (unsigned char *)*((void *)v5 - 3);
          unint64_t v13 = *((void *)v5 - 2);
          uint64_t v14 = *(void **)(a2 + 32);
          if (v13 > *(void *)(a2 + 24) - (void)v14)
          {
            sub_25442D960(a2, v12, *((void *)v5 - 2));
          }
          else if (v13)
          {
            memcpy(v14, v12, *((void *)v5 - 2));
            *(void *)(a2 + 32) += v13;
          }
        }
        else
        {
          int v9 = *((_DWORD *)v5 + 2);
          uint64_t v10 = *(void *)v5;
          char v11 = v5[12];
          uint64_t v15 = *(void *)(*(void *)(a1 + 16) + 8 * v8);
          int v16 = v9;
          uint64_t v17 = v10;
          char v18 = v11;
          sub_25442EAC8(&v15, a2);
        }
      }
      v5 += 64;
      v6 -= 64;
    }
    while (v6);
    unint64_t v4 = v19;
  }
  if (v4 != v21) {
    free(v4);
  }
}

void sub_25442DD60(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t *a14, uint64_t a15, uint64_t a16)
{
  if (a14 == &a16) {
    _Unwind_Resume(exception_object);
  }
  free(a14);
  _Unwind_Resume(exception_object);
}

uint64_t sub_25442DD90(uint64_t a1)
{
  *(void *)a1 = &unk_2703CFD00;
  if (*(_DWORD *)(a1 + 56) == 1)
  {
    uint64_t v2 = *(void *)(a1 + 16);
    if (v2) {
      MEMORY[0x25A278EF0](v2, 0x1000C8077774924);
    }
  }
  return a1;
}

uint64_t sub_25442DDF8(uint64_t a1, int a2, int a3, int a4)
{
  if (*(unsigned char *)(a1 + 40)
    && (!sub_25442C158() || (*(unsigned int (**)(uint64_t))(*(void *)a1 + 48))(a1)))
  {
    if (sub_25442C158())
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 16);
      if (v8 != v9)
      {
        *(void *)(a1 + 32) = v9;
        sub_25442D824((void *)a1, v9, v8 - v9);
      }
    }
    if (a2 == 8)
    {
      uint64_t v10 = (char *)sub_25442C188();
      if (!v10) {
        return a1;
      }
      goto LABEL_11;
    }
    uint64_t v10 = sub_25442C160(a2, a3, a4);
    if (v10)
    {
LABEL_11:
      size_t v11 = strlen(v10);
      sub_25442D960(a1, v10, v11);
    }
  }
  return a1;
}

uint64_t sub_25442DEDC(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)
    && (!sub_25442C158() || (*(unsigned int (**)(uint64_t))(*(void *)a1 + 48))(a1)))
  {
    if (sub_25442C158())
    {
      uint64_t v2 = *(void *)(a1 + 32);
      uint64_t v3 = *(void *)(a1 + 16);
      if (v2 != v3)
      {
        *(void *)(a1 + 32) = v3;
        sub_25442D824((void *)a1, v3, v2 - v3);
      }
    }
    unint64_t v4 = sub_25442C1A0();
    if (v4)
    {
      int v5 = (char *)v4;
      size_t v6 = strlen(v4);
      sub_25442D960(a1, v5, v6);
    }
  }
  return a1;
}

uint64_t sub_25442DF80(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)
    && (!sub_25442C158() || (*(unsigned int (**)(uint64_t))(*(void *)a1 + 48))(a1)))
  {
    if (sub_25442C158())
    {
      uint64_t v2 = *(void *)(a1 + 32);
      uint64_t v3 = *(void *)(a1 + 16);
      if (v2 != v3)
      {
        *(void *)(a1 + 32) = v3;
        sub_25442D824((void *)a1, v3, v2 - v3);
      }
    }
    unint64_t v4 = sub_25442C194();
    if (v4)
    {
      int v5 = (char *)v4;
      size_t v6 = strlen(v4);
      sub_25442D960(a1, v5, v6);
    }
  }
  return a1;
}

uint64_t sub_25442E02C(uint64_t a1, int a2, char a3, int a4, int a5)
{
  *(_DWORD *)(a1 + --*(_DWORD *)(this + 8) = a5;
  *(unsigned char *)(a1 + 40) = 0;
  *(void *)(a1 + 4--*(_DWORD *)(this + 8) = 0;
  *(_DWORD *)(a1 + 56) = a4 ^ 1;
  *(_DWORD *)(a1 + 60) = a2;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 16) = 0;
  *(void *)a1 = &unk_2703CFD78;
  *(unsigned char *)(a1 + 64) = a3;
  *(_DWORD *)(a1 + 72) = 0;
  *(_DWORD *)(a1 + 65) = 0;
  *(void *)(a1 + 80) = std::system_category();
  *(void *)(a1 + 8--*(_DWORD *)(this + 8) = 0;
  if ((*(_DWORD *)(a1 + 60) & 0x80000000) != 0)
  {
    *(unsigned char *)(a1 + 64) = 0;
    return a1;
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t))(*(void *)a1 + 64))(a1, 1);
    int v6 = *(_DWORD *)(a1 + 60);
    if (v6 <= 2) {
      *(unsigned char *)(a1 + 64) = 0;
    }
    off_t v7 = lseek(v6, 0, 1);
    memset(v11, 0, sizeof(v11));
    uint64_t v12 = 0xFFFFLL;
    __int16 v13 = 0;
    uint64_t v14 = 0;
    int v8 = sub_25442B8B4(*(_DWORD *)(a1 + 60), (uint64_t)v11);
    *(unsigned char *)(a1 + 66) = *(_DWORD *)&v11[40] == 2;
    *(unsigned char *)(a1 + 65) = v8 == 0 && v7 != -1;
    if (v8 == 0 && v7 != -1) {
      off_t v9 = v7;
    }
    else {
      off_t v9 = 0;
    }
    *(void *)(a1 + 8--*(_DWORD *)(this + 8) = v9;
    return a1;
  }
}

void sub_25442E168(_Unwind_Exception *a1)
{
  sub_25442D3B0(v1);
  _Unwind_Resume(a1);
}

void sub_25442E17C(_Unwind_Exception *a1)
{
  sub_25442D3B0(v1);
  _Unwind_Resume(a1);
}

void sub_25442E190(_Unwind_Exception *a1)
{
  sub_25442D3B0(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_25442E1A4(uint64_t a1)
{
  *(void *)a1 = &unk_2703CFD78;
  if ((*(_DWORD *)(a1 + 60) & 0x80000000) == 0)
  {
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 16);
    if (v2 != v3)
    {
      *(void *)(a1 + 32) = v3;
      sub_25442D824((void *)a1, v3, v2 - v3);
    }
    if (*(unsigned char *)(a1 + 64))
    {
      uint64_t v4 = sub_25442BDA4(*(_DWORD *)(a1 + 60));
      if (v4)
      {
        *(void *)(a1 + 72) = v4;
        *(void *)(a1 + 80) = v5;
      }
    }
  }
  if (*(_DWORD *)(a1 + 72))
  {
    uint64_t v12 = "IO failure on output stream: ";
    __int16 v13 = 259;
    std::error_code v8 = *(std::error_code *)(a1 + 72);
    std::error_code::message(&v9, &v8);
    __int16 v11 = 260;
    uint64_t v10 = &v9;
    sub_25442E2D0((uint64_t *)&v12, (uint64_t *)&v10, (uint64_t)v14);
    sub_254428694();
  }
  *(void *)a1 = &unk_2703CFD00;
  if (*(_DWORD *)(a1 + 56) == 1)
  {
    uint64_t v6 = *(void *)(a1 + 16);
    if (v6) {
      MEMORY[0x25A278EF0](v6, 0x1000C8077774924);
    }
  }
  return a1;
}

uint64_t *sub_25442E2D0@<X0>(uint64_t *result@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  int v3 = *((unsigned __int8 *)result + 32);
  if (*((unsigned char *)result + 32) && (int v4 = *((unsigned __int8 *)a2 + 32), *((unsigned char *)a2 + 32)))
  {
    if (v3 == 1)
    {
      long long v5 = *((_OWORD *)a2 + 1);
      *(_OWORD *)a3 = *(_OWORD *)a2;
      *(_OWORD *)(a3 + 16) = v5;
      *(void *)(a3 + 32) = a2[4];
    }
    else if (v4 == 1)
    {
      long long v6 = *((_OWORD *)result + 1);
      *(_OWORD *)a3 = *(_OWORD *)result;
      *(_OWORD *)(a3 + 16) = v6;
      *(void *)(a3 + 32) = result[4];
    }
    else
    {
      off_t v7 = (uint64_t *)*result;
      uint64_t v8 = result[1];
      if (*((unsigned char *)result + 33) != 1)
      {
        LOBYTE(v3) = 2;
        off_t v7 = result;
      }
      uint64_t v9 = a2[1];
      if (*((unsigned char *)a2 + 33) == 1)
      {
        uint64_t v10 = (uint64_t *)*a2;
      }
      else
      {
        LOBYTE(v4) = 2;
        uint64_t v10 = a2;
      }
      *(void *)a3 = v7;
      *(void *)(a3 + --*(_DWORD *)(this + 8) = v8;
      *(void *)(a3 + 16) = v10;
      *(void *)(a3 + 24) = v9;
      *(unsigned char *)(a3 + 32) = v3;
      *(unsigned char *)(a3 + 33) = v4;
    }
  }
  else
  {
    *(_WORD *)(a3 + 32) = 256;
  }
  return result;
}

void sub_25442E368(uint64_t a1)
{
  sub_25442E1A4(a1);

  JUMPOUT(0x25A278F10);
}

uint64_t sub_25442E3A0(uint64_t a1, char *__buf, unint64_t a3)
{
  unint64_t v3 = a3;
  *(void *)(a1 + 88) += a3;
  while (1)
  {
    size_t v6 = v3 >= 0x7FFFFFFF ? 0x7FFFFFFFLL : v3;
    uint64_t result = write(*(_DWORD *)(a1 + 60), __buf, v6);
    if (result < 0) {
      break;
    }
    __buf += result;
    v3 -= result;
LABEL_3:
    if (!v3) {
      return result;
    }
  }
  uint64_t result = (uint64_t)__error();
  if (*(_DWORD *)result == 4) {
    goto LABEL_3;
  }
  uint64_t result = (uint64_t)__error();
  if (*(_DWORD *)result == 35) {
    goto LABEL_3;
  }
  uint64_t result = (uint64_t)__error();
  if (*(_DWORD *)result == 35) {
    goto LABEL_3;
  }
  uint64_t v8 = *__error();
  uint64_t result = (uint64_t)std::generic_category();
  *(void *)(a1 + 72) = v8;
  *(void *)(a1 + 80) = result;
  return result;
}

off_t sub_25442E448(int *a1, unsigned char *a2, size_t a3, off_t a4)
{
  uint64_t v8 = (*(uint64_t (**)(int *))(*(void *)a1 + 80))(a1);
  uint64_t v9 = *((void *)a1 + 4);
  uint64_t v10 = *((void *)a1 + 2);
  uint64_t v11 = v8 + v9;
  if (v9 != v10)
  {
    *((void *)a1 + 4) = v10;
    sub_25442D824(a1, v10, v9 - v10);
  }
  off_t v12 = v11 - v10;
  off_t v13 = lseek(a1[15], a4, 0);
  *((void *)a1 + 11) = v13;
  if (v13 == -1)
  {
    uint64_t v14 = *__error();
    uint64_t v15 = std::generic_category();
    *((void *)a1 + 9) = v14;
    *((void *)a1 + 10) = v15;
  }
  sub_25442D960((uint64_t)a1, a2, a3);
  uint64_t v16 = *((void *)a1 + 4);
  uint64_t v17 = *((void *)a1 + 2);
  if (v16 != v17)
  {
    *((void *)a1 + 4) = v17;
    sub_25442D824(a1, v17, v16 - v17);
  }
  off_t result = lseek(a1[15], v12, 0);
  *((void *)a1 + 11) = result;
  if (result == -1)
  {
    uint64_t v19 = *__error();
    off_t result = (off_t)std::generic_category();
    *((void *)a1 + 9) = v19;
    *((void *)a1 + 10) = result;
  }
  return result;
}

uint64_t sub_25442E568(int *a1)
{
  if (fstat(a1[15], &v3)) {
    return 0;
  }
  if (v3.st_mode & 0xF000) == 0x2000 && ((*(uint64_t (**)(int *))(*(void *)a1 + 48))(a1)) {
    return 0;
  }
  return v3.st_blksize;
}

BOOL sub_25442E608(uint64_t a1)
{
  return sub_25442BE38(*(_DWORD *)(a1 + 60));
}

BOOL sub_25442E610(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 68)) {
    return *(unsigned char *)(a1 + 67) != 0;
  }
  BOOL result = sub_25442C000(*(_DWORD *)(a1 + 60));
  if (!*(unsigned char *)(a1 + 68)) {
    *(unsigned char *)(a1 + 6--*(_DWORD *)(this + 8) = 1;
  }
  *(unsigned char *)(a1 + 67) = result;
  return result;
}

void *sub_25442E680()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)qword_269DF02B8, memory_order_acquire) & 1) != 0
    || !__cxa_guard_acquire(qword_269DF02B8))
  {
    return &unk_269DF0368;
  }
  sub_25442E02C((uint64_t)&unk_269DF0368, 2, 0, 1, 0);
  __cxa_atexit((void (*)(void *))sub_25442E364, &unk_269DF0368, &dword_254419000);
  __cxa_guard_release(qword_269DF02B8);
  return &unk_269DF0368;
}

void sub_25442E720(_Unwind_Exception *a1)
{
}

std::string *sub_25442E738(uint64_t a1, const std::string::value_type *a2, std::string::size_type a3)
{
  return std::string::append(*(std::string **)(a1 + 64), a2, a3);
}

uint64_t sub_25442E740(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 64) + 8);
}

void *sub_25442E74C(void *result, void *__src, size_t __n)
{
  long long v5 = (void *)result[8];
  uint64_t v6 = v5[1];
  unint64_t v7 = v6 + __n;
  if (v5[2] < v7)
  {
    BOOL result = sub_25442C354(result[8], v5 + 3, v7, 1);
    uint64_t v6 = v5[1];
  }
  if (__n)
  {
    BOOL result = memcpy((void *)(*v5 + v6), __src, __n);
    uint64_t v6 = v5[1];
  }
  v5[1] = v6 + __n;
  return result;
}

void *sub_25442E7C4(uint64_t a1, const void *a2, size_t a3, uint64_t a4)
{
  return memcpy((void *)(**(void **)(a1 + 64) + a4), a2, a3);
}

uint64_t sub_25442E7DC()
{
  return 0;
}

uint64_t sub_25442E7E4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 48))();
}

uint64_t sub_25442E808(uint64_t result, char a2)
{
  *(unsigned char *)(result + 40) = a2;
  return result;
}

uint64_t sub_25442E810(uint64_t a1)
{
  *(void *)a1 = &unk_2703CFD00;
  if (*(_DWORD *)(a1 + 56) == 1)
  {
    uint64_t v2 = *(void *)(a1 + 16);
    if (v2) {
      MEMORY[0x25A278EF0](v2, 0x1000C8077774924);
    }
  }
  return a1;
}

void sub_25442E878(uint64_t a1)
{
  *(void *)a1 = &unk_2703CFD00;
  if (*(_DWORD *)(a1 + 56) == 1)
  {
    uint64_t v1 = *(void *)(a1 + 16);
    if (v1) {
      MEMORY[0x25A278EF0](v1, 0x1000C8077774924);
    }
  }

  JUMPOUT(0x25A278F10);
}

void sub_25442E900(void *a1, uint64_t a2)
{
  uint64_t v2 = (std::string *)a1[8];
  std::string::size_type v3 = (*(uint64_t (**)(void *))(*a1 + 80))(a1) + a2 + a1[4] - a1[2];

  std::string::reserve(v2, v3);
}

uint64_t sub_25442E97C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 64);
  if (*(char *)(v1 + 23) < 0) {
    return *(void *)(v1 + 8);
  }
  else {
    return *(unsigned __int8 *)(v1 + 23);
  }
}

void sub_25442E998(uint64_t a1)
{
  *(void *)a1 = &unk_2703CFD00;
  if (*(_DWORD *)(a1 + 56) == 1)
  {
    uint64_t v1 = *(void *)(a1 + 16);
    if (v1) {
      MEMORY[0x25A278EF0](v1, 0x1000C8077774924);
    }
  }

  JUMPOUT(0x25A278F10);
}

void *sub_25442EA20(void *a1, uint64_t a2)
{
  uint64_t v4 = a1[8];
  BOOL result = (void *)(*(uint64_t (**)(void *))(*a1 + 80))(a1);
  unint64_t v6 = (unint64_t)result + a2 + a1[4] - a1[2];
  if (*(void *)(v4 + 16) < v6)
  {
    return sub_25442C354(v4, (void *)(v4 + 24), v6, 1);
  }
  return result;
}

uint64_t sub_25442EAC0(uint64_t a1)
{
  return *(void *)(a1 + 88);
}

void sub_25442EAC8(void *a1, uint64_t a2)
{
  v39[8] = *MEMORY[0x263EF8340];
  if (a1[2])
  {
    unint64_t v37 = v39;
    *(_OWORD *)__n = xmmword_2544318D0;
    int v28 = 0;
    char v32 = 0;
    uint64_t v33 = 0;
    char v35 = &v37;
    int v34 = 0;
    unint64_t v27 = &unk_2703CFEB0;
    uint64_t v29 = 0;
    uint64_t v30 = 0;
    uint64_t v31 = 0;
    (*(void (**)(void, void **))(*(void *)*a1 + 24))(*a1, &v27);
    unint64_t v4 = a1[2];
    size_t v5 = __n[0];
    size_t v6 = v4 - __n[0];
    if (v4 > __n[0])
    {
      int v7 = *((_DWORD *)a1 + 2);
      if (!v7)
      {
        sub_25442D960(a2, v37, __n[0]);
        if (v6)
        {
          int v14 = 0;
          do
          {
            char v15 = *((unsigned char *)a1 + 24);
            while (1)
            {
              uint64_t v16 = *(unsigned char **)(a2 + 32);
              if ((unint64_t)v16 < *(void *)(a2 + 24)) {
                goto LABEL_29;
              }
              uint64_t v17 = *(void *)(a2 + 16);
              if (v17)
              {
                *(void *)(a2 + 32) = v17;
                sub_25442D824((void *)a2, v17, (uint64_t)&v16[-v17]);
                uint64_t v16 = *(unsigned char **)(a2 + 32);
LABEL_29:
                *(void *)(a2 + 32) = v16 + 1;
                *uint64_t v16 = v15;
                goto LABEL_30;
              }
              if (!*(_DWORD *)(a2 + 56)) {
                break;
              }
              sub_25442D428((uint64_t *)a2);
            }
            char v36 = v15;
            sub_25442D824((void *)a2, (uint64_t)&v36, 1);
LABEL_30:
            ++v14;
          }
          while (v14 != v6);
        }
        goto LABEL_58;
      }
      if (v7 == 1)
      {
        size_t v8 = v6 >> 1;
        if ((v6 >> 1))
        {
          int v9 = 0;
          do
          {
            char v10 = *((unsigned char *)a1 + 24);
            while (1)
            {
              uint64_t v11 = *(unsigned char **)(a2 + 32);
              if ((unint64_t)v11 < *(void *)(a2 + 24)) {
                goto LABEL_13;
              }
              uint64_t v12 = *(void *)(a2 + 16);
              if (v12)
              {
                *(void *)(a2 + 32) = v12;
                sub_25442D824((void *)a2, v12, (uint64_t)&v11[-v12]);
                uint64_t v11 = *(unsigned char **)(a2 + 32);
LABEL_13:
                *(void *)(a2 + 32) = v11 + 1;
                unsigned char *v11 = v10;
                goto LABEL_14;
              }
              if (!*(_DWORD *)(a2 + 56)) {
                break;
              }
              sub_25442D428((uint64_t *)a2);
            }
            char v36 = v10;
            sub_25442D824((void *)a2, (uint64_t)&v36, 1);
LABEL_14:
            ++v9;
          }
          while (v9 != v8);
          size_t v5 = __n[0];
        }
        sub_25442D960(a2, v37, v5);
        int v22 = v6 - v8;
        if (v22)
        {
          for (int i = 0; i != v22; ++i)
          {
            char v24 = *((unsigned char *)a1 + 24);
            while (1)
            {
              uint64_t v25 = *(unsigned char **)(a2 + 32);
              if ((unint64_t)v25 < *(void *)(a2 + 24)) {
                goto LABEL_53;
              }
              uint64_t v26 = *(void *)(a2 + 16);
              if (v26)
              {
                *(void *)(a2 + 32) = v26;
                sub_25442D824((void *)a2, v26, (uint64_t)&v25[-v26]);
                uint64_t v25 = *(unsigned char **)(a2 + 32);
LABEL_53:
                *(void *)(a2 + 32) = v25 + 1;
                *uint64_t v25 = v24;
                goto LABEL_54;
              }
              if (!*(_DWORD *)(a2 + 56)) {
                break;
              }
              sub_25442D428((uint64_t *)a2);
            }
            char v36 = v24;
            sub_25442D824((void *)a2, (uint64_t)&v36, 1);
LABEL_54:
            ;
          }
        }
        goto LABEL_58;
      }
      if (v6)
      {
        int v18 = 0;
        do
        {
          char v19 = *((unsigned char *)a1 + 24);
          while (1)
          {
            unsigned int v20 = *(unsigned char **)(a2 + 32);
            if ((unint64_t)v20 < *(void *)(a2 + 24)) {
              goto LABEL_41;
            }
            uint64_t v21 = *(void *)(a2 + 16);
            if (v21)
            {
              *(void *)(a2 + 32) = v21;
              sub_25442D824((void *)a2, v21, (uint64_t)&v20[-v21]);
              unsigned int v20 = *(unsigned char **)(a2 + 32);
LABEL_41:
              *(void *)(a2 + 32) = v20 + 1;
              *unsigned int v20 = v19;
              goto LABEL_42;
            }
            if (!*(_DWORD *)(a2 + 56)) {
              break;
            }
            sub_25442D428((uint64_t *)a2);
          }
          char v36 = v19;
          sub_25442D824((void *)a2, (uint64_t)&v36, 1);
LABEL_42:
          ++v18;
        }
        while (v18 != v6);
        size_t v5 = __n[0];
      }
    }
    sub_25442D960(a2, v37, v5);
LABEL_58:
    unint64_t v27 = &unk_2703CFD00;
    if (v34 == 1 && v29) {
      MEMORY[0x25A278EF0](v29, 0x1000C8077774924);
    }
    if (v37 != v39) {
      free(v37);
    }
    return;
  }
  off_t v13 = *(void (**)(void))(*(void *)*a1 + 24);

  v13();
}

void sub_25442EED8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19)
{
  sub_25442DD90((uint64_t)&a9);
  if (a19 != v19) {
    free(a19);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_25442EF24()
{
  sub_254423F84();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_25442EF58(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result) {
    return (*(uint64_t (**)(uint64_t))(*(void *)result + 8))(result);
  }
  return result;
}

uint64_t sub_25442EF98(uint64_t *a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_254423F90(a1);
  if (result)
  {
    sub_254423F84();
    uint64_t result = (*(uint64_t (**)(void))(v8 + 8))();
  }
  *(void *)a4 = a2;
  *(_DWORD *)(a4 + --*(_DWORD *)(this + 8) = a3;
  return result;
}

uint64_t sub_25442EFF8()
{
  sub_254423F84();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_25442F020(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  if (sub_254423F90(a1))
  {
    sub_254423F84();
    (*(void (**)(void))(v5 + 8))();
  }
  uint64_t v6 = *a2;
  *a2 = 0;
  if (v6)
  {
    sub_254423F84();
    (*(void (**)(void))(v7 + 8))();
  }
  return MEMORY[0x25A278F10](a3, 0xA1C4030951706);
}

void sub_25442F0B0(void **a1, void *a2, void **a3)
{
  uint64_t v5 = *a1;
  uint64_t v6 = a2;
  if (v5 != a2)
  {
    do
    {
      uint64_t v8 = *--v5;
      *uint64_t v5 = 0;
      if (v8)
      {
        sub_254423F84();
        (*(void (**)(void))(v9 + 8))();
      }
    }
    while (v5 != a2);
    uint64_t v6 = *a3;
  }
  *a1 = a2;
  operator delete(v6);
}

uint64_t sub_25442F130(uint64_t *a1)
{
  uint64_t result = sub_254423F90(a1);
  if (result)
  {
    sub_254423F84();
    return (*(uint64_t (**)(void))(v2 + 8))();
  }
  return result;
}

void sub_25442F16C(uint64_t *a1)
{
  if (sub_25442AF28(a1))
  {
    sub_254423F84();
    (*(void (**)(void))(v1 + 8))();
  }
  sub_25442AF44();
}

void sub_25442F1BC()
{
  sub_25442AF50();
  if (v1)
  {
    uint64_t v2 = *v0;
    *uint64_t v0 = 0;
    if (v2)
    {
      sub_254423F84();
      (*(void (**)(void))(v3 + 8))();
    }
  }
  sub_25442AF44();
}

uint64_t sub_25442F218(uint64_t a1, unsigned char *a2, uint64_t *a3)
{
  if (*a2)
  {
    uint64_t result = *a3;
    *a3 = 0;
    if (result)
    {
      sub_254423F84();
      return (*(uint64_t (**)(void))(v4 + 8))();
    }
  }
  return result;
}

uint64_t CVHWAGeneralProcessingAllocateBuffer()
{
  return MEMORY[0x270F0D088]();
}

uint64_t CVHWAGeneralProcessingCallFunction()
{
  return MEMORY[0x270F0D098]();
}

uint64_t CVHWAGeneralProcessingClearStackData()
{
  return MEMORY[0x270F0D0A0]();
}

uint64_t CVHWAGeneralProcessingConfigCreate()
{
  return MEMORY[0x270F0D0A8]();
}

uint64_t CVHWAGeneralProcessingConfigRelease()
{
  return MEMORY[0x270F0D0B0]();
}

uint64_t CVHWAGeneralProcessingConfigSetAccelInstance()
{
  return MEMORY[0x270F0D0B8]();
}

uint64_t CVHWAGeneralProcessingConfigSetBinaryPath()
{
  return MEMORY[0x270F0D0C0]();
}

uint64_t CVHWAGeneralProcessingCreate()
{
  return MEMORY[0x270F0D0C8]();
}

uint64_t CVHWAGeneralProcessingGetUint32Register()
{
  return MEMORY[0x270F0D0D8]();
}

uint64_t CVHWAGeneralProcessingGetVecDoubleRegister()
{
  return MEMORY[0x270F0D0E0]();
}

uint64_t CVHWAGeneralProcessingGetVecFloatRegister()
{
  return MEMORY[0x270F0D0E8]();
}

uint64_t CVHWAGeneralProcessingInit()
{
  return MEMORY[0x270F0D0F0]();
}

uint64_t CVHWAGeneralProcessingReadSpecialRegister()
{
  return MEMORY[0x270F0D0F8]();
}

uint64_t CVHWAGeneralProcessingRelease()
{
  return MEMORY[0x270F0D108]();
}

uint64_t CVHWAGeneralProcessingRunProgram()
{
  return MEMORY[0x270F0D110]();
}

uint64_t CVHWAGeneralProcessingSetVecDoubleRegister()
{
  return MEMORY[0x270F0D120]();
}

uint64_t CVHWAGeneralProcessingSetVecFloatRegister()
{
  return MEMORY[0x270F0D128]();
}

uint64_t CVHWAGeneralProcessingSetupDMADestinationBuffer()
{
  return MEMORY[0x270F0D130]();
}

uint64_t CVHWAGeneralProcessingSetupDMASourceBuffer()
{
  return MEMORY[0x270F0D138]();
}

uint64_t CVHWAGetLaccMatchSupported()
{
  return MEMORY[0x270F0D150]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::string *__cdecl std::error_code::message(std::string *__return_ptr retstr, const std::error_code *this)
{
  return (std::string *)MEMORY[0x270F98210](retstr, this);
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

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const std::string *a2)
{
  return (std::logic_error *)MEMORY[0x270F98338](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x270F983B0](this, a2);
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

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984C0](this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x270F984E0](this, __pos, __s);
}

void std::string::reserve(std::string *this, std::string::size_type __requested_capacity)
{
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
  return MEMORY[0x270F987B0]();
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x270F98870]();
}

void std::error_category::~error_category(std::error_category *this)
{
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x270F988A8]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x270F988B0]();
}

void std::recursive_mutex::lock(std::recursive_mutex *this)
{
}

void std::recursive_mutex::unlock(std::recursive_mutex *this)
{
}

std::recursive_mutex *__cdecl std::recursive_mutex::recursive_mutex(std::recursive_mutex *this)
{
  return (std::recursive_mutex *)MEMORY[0x270F98900](this);
}

const std::error_category *std::system_category(void)
{
  return (const std::error_category *)MEMORY[0x270F98910]();
}

const std::error_category *std::generic_category(void)
{
  return (const std::error_category *)MEMORY[0x270F98918]();
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

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, uint64_t __val)
{
  return (std::string *)MEMORY[0x270F98E18](retstr, __val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unint64_t __val)
{
  return (std::string *)MEMORY[0x270F98E20](retstr, __val);
}

uint64_t std::operator+<char>()
{
  return MEMORY[0x270F98E38]();
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

void *__cdecl operator new(size_t __sz, const std::nothrow_t *a2)
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

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

void abort(void)
{
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

int del_curterm(TERMINAL *a1)
{
  return MEMORY[0x270F9A0C0](a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x270ED98D0](*(void *)&a1, *(void *)&a2);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x270ED9AF0](*(void *)&a1, a2);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x270ED9BE8](a1);
}

int getpagesize(void)
{
  return MEMORY[0x270ED9CC8]();
}

int isatty(int a1)
{
  return MEMORY[0x270ED9EF0](*(void *)&a1);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x270ED9F50]();
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x270EDA118](*(void *)&a1, a2, *(void *)&a3);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA3A0](ptr, size, type_id);
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

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x270EDA598](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x270EDA5F8](a1, a2);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

int posix_madvise(void *a1, size_t a2, int a3)
{
  return MEMORY[0x270EDAC50](a1, a2, *(void *)&a3);
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x270EDAD10](*(void *)&__fd, __buf, __nbyte, a4);
}

int pthread_sigmask(int a1, const sigset_t *a2, sigset_t *a3)
{
  return MEMORY[0x270EDB058](*(void *)&a1, a2, a3);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x270EDB120](*(void *)&a1, a2, a3);
}

TERMINAL *__cdecl set_curterm(TERMINAL *a1)
{
  return (TERMINAL *)MEMORY[0x270F9A0F0](a1);
}

int setupterm(char *a1, int a2, int *a3)
{
  return MEMORY[0x270F9A100](a1, *(void *)&a2, a3);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

int tigetnum(char *a1)
{
  return MEMORY[0x270F9A130](a1);
}