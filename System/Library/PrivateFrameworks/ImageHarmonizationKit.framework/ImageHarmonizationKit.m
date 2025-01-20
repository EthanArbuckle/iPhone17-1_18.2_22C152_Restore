void sub_2529BCA30(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v2;
  va_list va;

  va_start(va, a2);
  sub_2529BCA7C((uint64_t *)va);

  _Unwind_Resume(a1);
}

void sub_2529BCA48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13)
{
  if (__p)
  {
    operator delete(__p);

    _Unwind_Resume(a1);
  }

  _Unwind_Resume(a1);
}

void *sub_2529BCA7C(void *a1)
{
  *a1 = &unk_2702DD568;
  v2 = (std::__shared_weak_count *)a1[6];
  if (v2 && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
    v3 = (void *)a1[2];
    if (!v3) {
      return a1;
    }
    goto LABEL_4;
  }
  v3 = (void *)a1[2];
  if (v3)
  {
LABEL_4:
    a1[3] = v3;
    operator delete(v3);
  }
  return a1;
}

void sub_2529BCD38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2529BCD4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  sub_2529BCA7C(&a18);
  if (__p) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_2529BCD80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2529BCD94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2529BCDA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2529BCDB8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_2529BCA7C((uint64_t *)va);

  _Unwind_Resume(a1);
}

void sub_2529BD398(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17)
{
  sub_2529BCA7C(&a9);
  sub_2529BCA7C((void *)(v18 - 104));

  _Unwind_Resume(a1);
}

void sub_2529BD438(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2529BD764(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17)
{
  sub_2529BCA7C(&a9);
  sub_2529BCA7C((void *)(v17 - 104));
  _Unwind_Resume(a1);
}

void sub_2529BDBAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  __cxa_free_exception(v17);
  sub_2529BCA7C(&a9);
  sub_2529BDDD8(&a16);

  _Unwind_Resume(a1);
}

uint64_t *sub_2529BDC0C(uint64_t *a1)
{
  uint64_t v2 = MEMORY[0x263F8C310] + 64;
  a1[52] = MEMORY[0x263F8C310] + 64;
  v3 = a1 + 1;
  uint64_t v4 = *(void *)(MEMORY[0x263F8C2B0] + 16);
  uint64_t v5 = *(void *)(MEMORY[0x263F8C2B0] + 8);
  *a1 = v5;
  *(uint64_t *)((char *)a1 + *(void *)(v5 - 24)) = v4;
  v6 = (std::ios_base *)((char *)a1 + *(void *)(*a1 - 24));
  std::ios_base::init(v6, a1 + 1);
  uint64_t v7 = MEMORY[0x263F8C310] + 24;
  v6[1].__vftable = 0;
  v6[1].__fmtflags_ = -1;
  *a1 = v7;
  a1[52] = v2;
  MEMORY[0x2533C4760](v3);
  if (!std::filebuf::open()) {
    std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | 4);
  }
  return a1;
}

void sub_2529BDD94(_Unwind_Exception *a1)
{
  std::ostream::~ostream();
  MEMORY[0x2533C4830](v1);
  _Unwind_Resume(a1);
}

void *sub_2529BDDD8(void *a1)
{
  uint64_t v2 = MEMORY[0x263F8C2B0];
  uint64_t v3 = *MEMORY[0x263F8C2B0];
  *a1 = *MEMORY[0x263F8C2B0];
  *(void *)((char *)a1 + *(void *)(v3 - 24)) = *(void *)(v2 + 24);
  MEMORY[0x2533C4770](a1 + 1);
  std::ostream::~ostream();
  MEMORY[0x2533C4830](a1 + 52);
  return a1;
}

void sub_2529BE0E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  sub_2529BCA7C(&a9);
  sub_2529BCA7C(&a16);

  _Unwind_Resume(a1);
}

void sub_2529BE108(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  sub_2529BCA7C((uint64_t *)va);

  _Unwind_Resume(a1);
}

void sub_2529BE120(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  sub_2529BCA7C((uint64_t *)va);

  _Unwind_Resume(a1);
}

void sub_2529BE138(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2529BE148(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2529BE478(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14)
{
  __cxa_free_exception(v14);
  sub_2529BCA7C(&a14);

  _Unwind_Resume(a1);
}

void sub_2529BE4CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_2529BE828(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  __cxa_free_exception(v10);
  sub_2529BCA7C(&a9);

  _Unwind_Resume(a1);
}

void sub_2529BE84C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2529BE860(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_2529BCA7C(&a9);

  _Unwind_Resume(a1);
}

void sub_2529BE878(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_2529BCA7C(&a9);

  _Unwind_Resume(a1);
}

void sub_2529BEBB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  __cxa_free_exception(v10);
  sub_2529BCA7C(&a9);

  _Unwind_Resume(a1);
}

void sub_2529BEBDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2529BEBF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_2529BCA7C(&a9);

  _Unwind_Resume(a1);
}

void sub_2529BEC08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_2529BCA7C(&a9);

  _Unwind_Resume(a1);
}

void sub_2529BF004(_Unwind_Exception *a1)
{
  sub_2529BCA7C((void *)(v2 - 120));

  _Unwind_Resume(a1);
}

void sub_2529BF01C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  sub_2529BCA7C((uint64_t *)va);

  _Unwind_Resume(a1);
}

void sub_2529BF034(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2529BF044(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_2529BCA7C(va);
  sub_2529BCA7C((void *)(v3 - 120));

  _Unwind_Resume(a1);
}

void sub_2529BF088(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  uint64_t v19 = va_arg(va1, void);
  sub_2529BCA7C((uint64_t *)va);
  sub_2529BCA7C((uint64_t *)va1);

  _Unwind_Resume(a1);
}

void sub_2529BF0A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13)
{
  if (__p) {
    operator delete(__p);
  }
  sub_2529BCA7C((void *)(v14 - 120));

  _Unwind_Resume(a1);
}

void *sub_2529BF0D0(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 8) != *(_DWORD *)(a1 + 8))
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Tensor types mismatch.");
    goto LABEL_8;
  }
  uint64_t v3 = (const void *)(*(uint64_t (**)(void))(**(void **)(a2 + 40) + 24))(*(void *)(a2 + 40));
  size_t v5 = v4;
  v6 = (void *)(*(uint64_t (**)(void))(**(void **)(a1 + 40) + 24))(*(void *)(a1 + 40));
  if (v5 != v7)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Tensor sizes mismatch.");
LABEL_8:
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }

  return memcpy(v6, v3, v5);
}

void sub_2529BF1D4(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_2529BF1E8(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_2529BF7EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25)
{
  __cxa_free_exception(v27);
  sub_2529BCA7C(&a25);

  _Unwind_Resume(a1);
}

void sub_2529BF884(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2529BF898(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25)
{
  if (__p)
  {
    operator delete(__p);
    sub_2529BCA7C(&a25);

    _Unwind_Resume(a1);
  }
  sub_2529BCA7C(&a25);

  _Unwind_Resume(a1);
}

void sub_2529BF8C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  sub_2529BCA7C((uint64_t *)va);

  _Unwind_Resume(a1);
}

void sub_2529BFDD0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v2);
  sub_2529BCA7C((void *)(v3 - 120));

  _Unwind_Resume(a1);
}

void sub_2529BFDF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2529BFE00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
  sub_2529BCA7C(&a12);
  sub_2529BCA7C((void *)(v20 - 120));

  _Unwind_Resume(a1);
}

void sub_2529C020C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va1, a2);
  va_start(va, a2);
  uint64_t v5 = va_arg(va1, void);
  uint64_t v7 = va_arg(va1, void);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  sub_2529BCA7C((uint64_t *)va);
  sub_2529BCA7C((uint64_t *)va1);
  if (v3) {
    operator delete(v3);
  }

  _Unwind_Resume(a1);
}

void sub_2529C0668(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  sub_2529BCA7C(&a9);
  sub_2529BCA7C(&a20);
  operator delete(v21);

  _Unwind_Resume(a1);
}

void *sub_2529C0708(void *result, uint64_t a2)
{
  uint64_t v3 = result;
  *result = &unk_2702DD568;
  int v4 = *(_DWORD *)(a2 + 8);
  result[2] = 0;
  *((_DWORD *)result + 2) = v4;
  result[3] = 0;
  result[4] = 0;
  v6 = *(unsigned char **)(a2 + 16);
  uint64_t v5 = *(unsigned char **)(a2 + 24);
  int64_t v7 = v5 - v6;
  if (v5 != v6)
  {
    if (v7 < 0) {
      sub_2529C1558();
    }
    uint64_t v8 = (char *)operator new(v5 - v6);
    v3[2] = v8;
    v3[3] = v8;
    uint64_t v9 = &v8[8 * (v7 >> 3)];
    v3[4] = v9;
    result = memcpy(v8, v6, v7);
    v3[3] = v9;
  }
  uint64_t v10 = *(void *)(a2 + 48);
  v3[5] = *(void *)(a2 + 40);
  v3[6] = v10;
  if (v10) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v10 + 8), 1uLL, memory_order_relaxed);
  }
  void *v3 = &unk_2702DD520;
  return result;
}

void sub_2529C07E4(_Unwind_Exception *exception_object)
{
  int v4 = *v2;
  if (*v2)
  {
    *(void *)(v1 + 24) = v4;
    operator delete(v4);
  }
  _Unwind_Resume(exception_object);
}

void sub_2529C081C(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  if (a1 != a2) {
    sub_2529C1824((void *)(a1 + 16), *(char **)(a2 + 16), *(char **)(a2 + 24), (uint64_t)(*(void *)(a2 + 24) - *(void *)(a2 + 16)) >> 3);
  }
  uint64_t v5 = *(void *)(a2 + 40);
  uint64_t v4 = *(void *)(a2 + 48);
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
  }
  v6 = *(std::__shared_weak_count **)(a1 + 48);
  *(void *)(a1 + 40) = v5;
  *(void *)(a1 + 48) = v4;
  if (v6 && !atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
    std::__shared_weak_count::__release_weak(v6);
  }
}

void sub_2529C09EC(void *a1)
{
  *a1 = &unk_2702DD568;
  uint64_t v2 = (std::__shared_weak_count *)a1[6];
  if (v2 && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
    uint64_t v3 = (void *)a1[2];
    if (!v3)
    {
LABEL_5:
      JUMPOUT(0x2533C48B0);
    }
  }
  else
  {
    uint64_t v3 = (void *)a1[2];
    if (!v3) {
      goto LABEL_5;
    }
  }
  a1[3] = v3;
  operator delete(v3);
  goto LABEL_5;
}

void *sub_2529C0AB0(void *a1)
{
  *a1 = &unk_2702DD568;
  uint64_t v2 = (std::__shared_weak_count *)a1[6];
  if (v2 && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
    uint64_t v3 = (void *)a1[2];
    if (!v3) {
      return a1;
    }
    goto LABEL_4;
  }
  uint64_t v3 = (void *)a1[2];
  if (v3)
  {
LABEL_4:
    a1[3] = v3;
    operator delete(v3);
  }
  return a1;
}

void sub_2529C0B54(void *a1)
{
  *a1 = &unk_2702DD568;
  uint64_t v2 = (std::__shared_weak_count *)a1[6];
  if (v2 && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
    uint64_t v3 = (void *)a1[2];
    if (!v3)
    {
LABEL_5:
      JUMPOUT(0x2533C48B0);
    }
  }
  else
  {
    uint64_t v3 = (void *)a1[2];
    if (!v3) {
      goto LABEL_5;
    }
  }
  a1[3] = v3;
  operator delete(v3);
  goto LABEL_5;
}

uint64_t sub_2529C0C18(uint64_t result)
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

uint64_t sub_2529C0C94(uint64_t a1, int *a2, uint64_t a3)
{
  v6 = (std::__shared_weak_count *)operator new(0xD0uLL);
  v6->__shared_owners_ = 0;
  v6->__shared_weak_owners_ = 0;
  v6->__vftable = (std::__shared_weak_count_vtbl *)&unk_2702DD588;
  sub_2529C0F14((uint64_t)&v6[1], a2, (int32x4_t **)a3);
  *(void *)a1 = &unk_2702DD568;
  int v7 = *a2;
  *(void *)(a1 + 16) = 0;
  *(_DWORD *)(a1 + 8) = v7;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0;
  uint64_t v8 = *(int32x4_t **)a3;
  int64_t v9 = *(void *)(a3 + 8) - *(void *)a3;
  if (v9)
  {
    if (v9 < 0) {
      sub_2529C1558();
    }
    uint64_t v10 = (char *)operator new(v9);
    *(void *)(a1 + 16) = v10;
    *(void *)(a1 + 24) = v10;
    uint64_t v11 = &v10[8 * (v9 >> 3)];
    *(void *)(a1 + 32) = v11;
    memcpy(v10, v8, v9);
    *(void *)(a1 + 24) = v11;
  }
  *(void *)(a1 + 40) = v6 + 1;
  *(void *)(a1 + 48) = v6;
  atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  if (!atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
    std::__shared_weak_count::__release_weak(v6);
  }
  *(void *)a1 = &unk_2702DD520;
  return a1;
}

void sub_2529C0E44(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  operator delete(v3);
  _Unwind_Resume(a1);
}

void sub_2529C0E5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
  uint64_t v14 = *v12;
  if (*v12)
  {
    *(void *)(v11 + 24) = v14;
    operator delete(v14);
  }
  sub_2529C0C18((uint64_t)&a11);
  sub_2529C0C18((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_2529C0E88(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_2702DD588;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_2529C0EA8(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_2702DD588;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x2533C48B0);
}

void sub_2529C0EFC(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 201)) {
    free(*(void **)(a1 + 32));
  }
}

uint64_t sub_2529C0F14(uint64_t a1, int *a2, int32x4_t **a3)
{
  long long v28 = 0u;
  espresso_buffer_pack_tensor_shape();
  uint64_t v6 = *a2;
  if (v6 >= 5)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Unknown data type");
    goto LABEL_20;
  }
  uint64_t v7 = qword_2529D9850[v6];
  int64_t v9 = *a3;
  uint64_t v8 = (char *)a3[1];
  if (*a3 == (int32x4_t *)v8)
  {
    uint64_t v13 = 0;
    goto LABEL_11;
  }
  unint64_t v10 = v8 - (char *)v9 - 8;
  if (v10 >= 0x38)
  {
    uint64_t v14 = (v10 >> 3) + 1;
    uint64_t v12 = (int32x4_t *)((char *)v9 + 8 * (v14 & 0x3FFFFFFFFFFFFFF8));
    uint64_t v15 = v9 + 2;
    v16.i64[0] = 0x100000001;
    v16.i64[1] = 0x100000001;
    uint64_t v17 = v14 & 0x3FFFFFFFFFFFFFF8;
    v18.i64[0] = 0x100000001;
    v18.i64[1] = 0x100000001;
    do
    {
      int32x4_t v20 = v15[-2];
      int32x4_t v19 = v15[-1];
      int32x4_t v22 = *v15;
      int32x4_t v21 = v15[1];
      v15 += 4;
      int32x4_t v16 = vmulq_s32(v16, vuzp1q_s32(v20, v19));
      int32x4_t v18 = vmulq_s32(v18, vuzp1q_s32(v22, v21));
      v17 -= 8;
    }
    while (v17);
    int8x16_t v23 = (int8x16_t)vmulq_s32(v18, v16);
    *(int32x2_t *)v23.i8 = vmul_s32(*(int32x2_t *)v23.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v23, v23, 8uLL));
    int v11 = v23.i32[0] * v23.i32[1];
    if (v14 == (v14 & 0x3FFFFFFFFFFFFFF8)) {
      goto LABEL_10;
    }
  }
  else
  {
    int v11 = 1;
    uint64_t v12 = *a3;
  }
  do
  {
    __int32 v24 = v12->i32[0];
    uint64_t v12 = (int32x4_t *)((char *)v12 + 8);
    v11 *= v24;
  }
  while (v12 != (int32x4_t *)v8);
LABEL_10:
  uint64_t v13 = v11;
LABEL_11:
  memptr = 0;
  if (malloc_type_posix_memalign(&memptr, 0x1000uLL, (v13 * v7 + 4095) & 0xFFFFFFFFFFFFF000, 0x1E091250uLL))
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Failed to allocate aligned memory.");
    goto LABEL_20;
  }
  *(void *)&long long v28 = memptr;
  uint64_t v25 = *a2;
  if (v25 >= 5 || ((0x1Du >> v25) & 1) == 0)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Unknown data type.");
    goto LABEL_20;
  }
  uint64_t v29 = dword_2529D9878[v25];
  *(_OWORD *)(a1 + 120) = 0u;
  *(_OWORD *)(a1 + 136) = 0u;
  *(_OWORD *)(a1 + 152) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_OWORD *)(a1 + 8) = v28;
  *(_OWORD *)(a1 + 24) = 0u;
  *(void *)a1 = &unk_2702DD5D8;
  *(_OWORD *)(a1 + 40) = 0u;
  *(void *)(a1 + 168) = v29;
  *(_WORD *)(a1 + 176) = 257;
  if (*(_DWORD *)(a1 + 168) != 65568)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Unexpected espresso buffer storage type");
LABEL_20:
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  return a1;
}

void sub_2529C1198(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_2529C11AC(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_2529C11C0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_2529C11D4(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_2529C11E8(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 177)) {
    free(*(void **)(a1 + 8));
  }
  return a1;
}

void sub_2529C121C(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 177)) {
    free(*(void **)(a1 + 8));
  }

  JUMPOUT(0x2533C48B0);
}

uint64_t sub_2529C1270(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a2 + 32))(a2, a1 + 8);
}

uint64_t sub_2529C12A0(uint64_t a1)
{
  return *(void *)(a1 + 8);
}

unint64_t sub_2529C12BC@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  unint64_t result = espresso_buffer_get_rank();
  unint64_t v5 = result;
  if (result >= 6)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::to_string(&v19, v5);
    uint64_t v14 = std::string::insert(&v19, 0, "Unsupported tensor rank: ");
    int8x16_t v15 = *(int8x16_t *)&v14->__r_.__value_.__l.__data_;
    v17.i64[0] = v14->__r_.__value_.__r.__words[2];
    int8x16_t v16 = v15;
    v14->__r_.__value_.__l.__size_ = 0;
    v14->__r_.__value_.__r.__words[2] = 0;
    v14->__r_.__value_.__r.__words[0] = 0;
    std::runtime_error::runtime_error(exception, (const std::string *)&v16);
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  int8x16_t v6 = (int8x16_t)vshlq_n_s64(*(int64x2_t *)(a1 + 152), 2uLL);
  int8x16_t v7 = (int8x16_t)vshlq_n_s64(*(int64x2_t *)(a1 + 136), 2uLL);
  int8x16_t v16 = vextq_s8(v6, v6, 8uLL);
  int8x16_t v17 = vextq_s8(v7, v7, 8uLL);
  uint64_t v18 = 4 * *(void *)(a1 + 128);
  a2[1] = 0;
  a2[2] = 0;
  *a2 = 0;
  if (result)
  {
    uint64_t v8 = 8 * (5 - result);
    size_t v9 = 40 - v8;
    unint64_t v10 = (char *)operator new(40 - v8);
    int v11 = &v16.i8[v8];
    *a2 = v10;
    uint64_t v12 = &v10[8 * ((unint64_t)(40 - v8) >> 3)];
    a2[2] = v12;
    unint64_t result = (unint64_t)memcpy(v10, v11, v9);
    a2[1] = v12;
  }
  return result;
}

void sub_2529C13F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a22 < 0)
  {
    operator delete(a17);
    if ((v23 & 1) == 0) {
LABEL_8:
    }
      _Unwind_Resume(a1);
  }
  else if (!v23)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v22);
  _Unwind_Resume(a1);
}

void sub_2529C1478(uint64_t a1)
{
  (*(void (**)(uint64_t))(*(void *)a1 + 24))(a1);
  (*(void (**)(void **__return_ptr, uint64_t))(*(void *)a1 + 32))(&__p, a1);
  sub_2529C1600();
}

void sub_2529C1528(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_2529C1544(void *a1)
{
}

void sub_2529C1558()
{
}

void sub_2529C1570(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_2529C15CC(exception, a1);
  __cxa_throw(exception, (struct type_info *)off_265385C60, MEMORY[0x263F8C060]);
}

void sub_2529C15B8(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_2529C15CC(std::logic_error *a1, const char *a2)
{
  unint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

void sub_2529C1600()
{
}

void sub_2529C16FC(_Unwind_Exception *a1)
{
  MEMORY[0x2533C48B0](v1, 0x1000C4077774924);
  _Unwind_Resume(a1);
}

void sub_2529C1720(_Unwind_Exception *a1)
{
  uint64_t v4 = *v2;
  if (*v2)
  {
    *(void *)(v1 + 32) = v4;
    operator delete(v4);
  }
  sub_2529C0C18(v1);
  _Unwind_Resume(a1);
}

void sub_2529C1748(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x2533C48B0);
}

uint64_t sub_2529C1780(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    JUMPOUT(0x2533C4890);
  }
  return result;
}

uint64_t sub_2529C17A0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  if (v3 == 0x80000002529D99D8) {
    return a1 + 24;
  }
  if (((v3 & 0x80000002529D99D8 & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x80000002529D99D8)) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x80000002529D99D8 & 0x7FFFFFFFFFFFFFFFLL))) {
    return a1 + 24;
  }
  return 0;
}

void *sub_2529C1824(void *result, char *__src, char *a3, size_t __sz)
{
  int8x16_t v6 = __src;
  int8x16_t v7 = result;
  uint64_t v8 = result[2];
  size_t v9 = (char *)*result;
  if (__sz > (v8 - *result) >> 3)
  {
    if (v9)
    {
      result[1] = v9;
      operator delete(v9);
      uint64_t v8 = 0;
      *int8x16_t v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if (__sz >> 61) {
      goto LABEL_22;
    }
    uint64_t v10 = v8 >> 2;
    if (v8 >> 2 <= __sz) {
      uint64_t v10 = __sz;
    }
    BOOL v11 = (unint64_t)v8 >= 0x7FFFFFFFFFFFFFF8;
    unint64_t v12 = 0x1FFFFFFFFFFFFFFFLL;
    if (!v11) {
      unint64_t v12 = v10;
    }
    if (v12 >> 61) {
LABEL_22:
    }
      sub_2529C1558();
    uint64_t v13 = v12;
    uint64_t result = operator new(8 * v12);
    size_t v9 = (char *)result;
    *int8x16_t v7 = result;
    v7[1] = result;
    v7[2] = &result[v13];
    size_t v14 = a3 - v6;
    if (v14) {
      uint64_t result = memcpy(result, v6, v14);
    }
    int8x16_t v15 = (void **)(v7 + 1);
    goto LABEL_21;
  }
  int8x16_t v15 = (void **)(result + 1);
  int8x16_t v16 = (unsigned char *)result[1];
  unint64_t v17 = (v16 - v9) >> 3;
  if (v17 >= __sz)
  {
    size_t v14 = a3 - __src;
    if (a3 == __src) {
      goto LABEL_21;
    }
    std::string v19 = (void *)*result;
LABEL_20:
    uint64_t result = memmove(v19, __src, v14);
    goto LABEL_21;
  }
  uint64_t v18 = &__src[8 * v17];
  if (v16 != v9)
  {
    uint64_t result = memmove((void *)*result, __src, v16 - v9);
    size_t v9 = (char *)*v15;
  }
  size_t v14 = a3 - v18;
  if (v14)
  {
    std::string v19 = v9;
    __src = v18;
    goto LABEL_20;
  }
LABEL_21:
  *int8x16_t v15 = &v9[v14];
  return result;
}

void *sub_2529C196C(void *a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x2533C4780](v13, a1);
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
    if (!sub_2529C1B10(v7, a2, v11, a2 + a3, v6, (char)v9)) {
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | 5);
    }
  }
  MEMORY[0x2533C4790](v13);
  return a1;
}

void sub_2529C1AA8(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  MEMORY[0x2533C4790](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(void *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x2529C1A88);
}

void sub_2529C1AFC(_Unwind_Exception *a1)
{
}

uint64_t sub_2529C1B10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
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
        sub_2529C1D00();
      }
      if (v12 >= 0x17)
      {
        uint64_t v14 = (v12 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v12 | 7) != 0x17) {
          uint64_t v14 = v12 | 7;
        }
        uint64_t v15 = v14 + 1;
        uint64_t v13 = (void **)operator new(v14 + 1);
        __b[1] = (void *)v12;
        int64_t v22 = v15 | 0x8000000000000000;
        __b[0] = v13;
      }
      else
      {
        HIBYTE(v22) = v12;
        uint64_t v13 = __b;
      }
      memset(v13, __c, v12);
      *((unsigned char *)v13 + v12) = 0;
      if (v22 >= 0) {
        int8x16_t v16 = __b;
      }
      else {
        int8x16_t v16 = (void **)__b[0];
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

void sub_2529C1CE4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_2529C1D00()
{
}

void sub_2529C1EF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_2529C20E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2529C20F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2529C2110(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2529C213C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2529C2158(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2529C2170(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2529C2184(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2529C22F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2529C2308(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2529C2320(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2529C2334(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2529C2348(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2529C235C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2529C23F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2529C2404(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2529C2518(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2529C2528(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2529C2538(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2529C2624(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2529C263C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2529C2988(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_2529C2E70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, void *a19)
{
  _Unwind_Resume(a1);
}

void sub_2529C32F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21)
{
  _Unwind_Resume(a1);
}

void sub_2529C384C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16, void *a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_2529C3A30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2529C3A84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2529C42F0(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v6);
  operator delete(v8);

  _Unwind_Resume(a1);
}

void sub_2529C49DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42)
{
  sub_2529BCA7C(&a35);
  sub_2529C4F44(&a42);

  _Unwind_Resume(a1);
}

void sub_2529C4AAC(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (*(char *)(a3 + 23) < 0)
  {
    sub_2529C9C60(__dst, *(void **)a3, *(void *)(a3 + 8));
  }
  else
  {
    *(_OWORD *)__dst = *(_OWORD *)a3;
    uint64_t v24 = *(void *)(a3 + 16);
  }
  sub_2529CA720(&__p, (uint64_t)__dst, 1uLL);
  sub_2529C5EBC(a1, a2, (long long **)&__p, (uint64_t)v22);
  int v8 = sub_2529C7818(v22, a3);
  int v9 = v8;
  if (!v8) {
    sub_2529C77BC("unordered_map::at: key not found");
  }
  *(void *)a4 = &unk_2702DD568;
  int v10 = *((_DWORD *)v8 + 12);
  *(void *)(a4 + 16) = 0;
  *(_DWORD *)(a4 + 8) = v10;
  *(void *)(a4 + 24) = 0;
  *(void *)(a4 + 32) = 0;
  size_t v12 = (unsigned char *)v8[7];
  uint64_t v11 = (unsigned char *)v8[8];
  int64_t v13 = v11 - v12;
  if (v11 != v12)
  {
    if (v13 < 0) {
      sub_2529C1558();
    }
    uint64_t v14 = (char *)operator new(v11 - v12);
    *(void *)(a4 + 16) = v14;
    *(void *)(a4 + 24) = v14;
    uint64_t v15 = &v14[8 * (v13 >> 3)];
    *(void *)(a4 + 32) = v15;
    memcpy(v14, v12, v13);
    *(void *)(a4 + 24) = v15;
  }
  *(void *)(a4 + 40) = v9[10];
  uint64_t v16 = v9[11];
  *(void *)(a4 + 48) = v16;
  if (v16) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v16 + 8), 1uLL, memory_order_relaxed);
  }
  *(void *)a4 = &unk_2702DD520;
  sub_2529C988C((uint64_t)v22);
  uint64_t v17 = (void **)__p;
  if (__p)
  {
    uint64_t v18 = v21;
    uint64_t v19 = __p;
    if (v21 != __p)
    {
      do
      {
        if (*((char *)v18 - 1) < 0) {
          operator delete(*(v18 - 3));
        }
        v18 -= 3;
      }
      while (v18 != v17);
      uint64_t v19 = __p;
    }
    int32x4_t v21 = v17;
    operator delete(v19);
  }
  if (SHIBYTE(v24) < 0) {
    operator delete(__dst[0]);
  }
}

void sub_2529C4CA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  if (a22 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_2529C4CF4(uint64_t a1)
{
  *(void *)(a1 + 24) = &unk_2702DD568;
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 72);
  if (!v2 || atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    uint64_t v3 = *(void **)(a1 + 40);
    if (!v3) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
  std::__shared_weak_count::__release_weak(v2);
  uint64_t v3 = *(void **)(a1 + 40);
  if (v3)
  {
LABEL_4:
    *(void *)(a1 + 48) = v3;
    operator delete(v3);
  }
LABEL_5:
  if (*(char *)(a1 + 23) < 0) {
    operator delete(*(void **)a1);
  }
  return a1;
}

uint64_t sub_2529C4DBC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 40);
  int v4 = *(_DWORD *)(v3 + 168);
  if (v4 == 65568 || v4 == 131104)
  {
    uint64_t v6 = 4;
  }
  else
  {
    if (v4 != 262152)
    {
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "Unsupported espresso type encountered.");
LABEL_13:
      __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
    }
    uint64_t v6 = 1;
  }
  uint64_t v7 = (const void **)(v3 + 8);
  size_t v8 = *(void *)(v3 + 160) * *(void *)(v3 + 120) * v6;
  long long v9 = *(_OWORD *)(v3 + 120);
  long long v10 = *(_OWORD *)(v3 + 136);
  long long v11 = *(_OWORD *)(v3 + 152);
  uint64_t v20 = *(void *)(v3 + 168);
  long long v12 = *(_OWORD *)(v3 + 8);
  long long v13 = *(_OWORD *)(v3 + 40);
  v19[1] = *(_OWORD *)(v3 + 24);
  v19[2] = v13;
  v19[0] = v12;
  long long v14 = *(_OWORD *)(v3 + 56);
  long long v15 = *(_OWORD *)(v3 + 72);
  long long v16 = *(_OWORD *)(v3 + 104);
  v19[5] = *(_OWORD *)(v3 + 88);
  v19[6] = v16;
  v19[3] = v14;
  v19[4] = v15;
  v19[8] = v10;
  v19[9] = v11;
  v19[7] = v9;
  memptr = 0;
  if (malloc_type_posix_memalign(&memptr, 0x1000uLL, (v8 + 4095) & 0xFFFFFFFFFFFFF000, 0x1E091250uLL))
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Failed to allocate aligned memory.");
    goto LABEL_13;
  }
  *(void *)&v19[0] = memptr;
  memcpy(memptr, *v7, v8);
  LOWORD(memptr) = 257;
  return sub_2529C8034(a2, (uint64_t)v19, &memptr);
}

void sub_2529C4F1C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_2529C4F30(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void *sub_2529C4F44(void *a1)
{
  *a1 = &unk_2702DD568;
  uint64_t v2 = (std::__shared_weak_count *)a1[6];
  if (v2 && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
    uint64_t v3 = (void *)a1[2];
    if (!v3) {
      return a1;
    }
    goto LABEL_4;
  }
  uint64_t v3 = (void *)a1[2];
  if (v3)
  {
LABEL_4:
    a1[3] = v3;
    operator delete(v3);
  }
  return a1;
}

void sub_2529C5560(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42)
{
  sub_2529BCA7C(&a35);
  sub_2529C4F44(&a42);

  _Unwind_Resume(a1);
}

void sub_2529C5D58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,void *__p,uint64_t a41,int a42,__int16 a43,char a44,char a45,void *a46,uint64_t a47,int a48,__int16 a49,char a50,char a51)
{
  sub_2529C988C((uint64_t)&a29);
  sub_2529C4CF4(v53);
  sub_2529C4CF4(v54 - 248);
  sub_2529BCA7C(&a13);
  sub_2529BCA7C(&a21);
  if (a45 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

uint64_t sub_2529C5EBC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, long long **a3@<X2>, uint64_t a4@<X8>)
{
  unint64_t v5 = *(long long **)(a1 + 8);
  for (i = *(uint64_t **)(a2 + 16); i; i = (uint64_t *)*i)
  {
    *(void *)v34 = &unk_2702DD7E0;
    if (*((char *)i + 39) < 0)
    {
      sub_2529C9C60(&v34[8], (void *)i[2], i[3]);
    }
    else
    {
      long long v7 = *((_OWORD *)i + 1);
      uint64_t v35 = i[4];
      *(_OWORD *)&v34[8] = v7;
    }
    long long v36 = *v5;
    (*(void (**)(uint64_t, unsigned char *))(*(void *)i[10] + 16))(i[10], v34);
    if (SHIBYTE(v35) < 0) {
      operator delete(*(void **)&v34[8]);
    }
  }
  long long v9 = *a3;
  size_t v8 = a3[1];
  if (*a3 != v8)
  {
    do
    {
      if (sub_2529C8CE4((void *)v5 + 24, (uint64_t)v9))
      {
        long long v10 = sub_2529C7818((void *)v5 + 24, (uint64_t)v9);
        if (!v10) {
          sub_2529C77BC("unordered_map::at: key not found");
        }
        long long v11 = v10;
        uint64_t v25 = &unk_2702DD568;
        int v26 = *((_DWORD *)v10 + 12);
        long long v28 = 0;
        uint64_t v29 = 0;
        v27 = 0;
        long long v13 = (unsigned char *)v10[7];
        long long v12 = (unsigned char *)v10[8];
        int64_t v14 = v12 - v13;
        if (v12 != v13)
        {
          if (v14 < 0) {
            sub_2529C1558();
          }
          v27 = operator new(v12 - v13);
          long long v28 = (char *)v27;
          long long v15 = (char *)v27 + 8 * (v14 >> 3);
          uint64_t v29 = v15;
          memcpy(v27, v13, v14);
          long long v28 = v15;
        }
        long long v16 = (std::__shared_weak_count *)v11[11];
        uint64_t v30 = v11[10];
        v31 = v16;
        if (v16)
        {
          atomic_fetch_add_explicit(&v16->__shared_owners_, 1uLL, memory_order_relaxed);
          uint64_t v17 = v31;
          uint64_t v25 = &unk_2702DD568;
          if (v31) {
            goto LABEL_29;
          }
        }
        else
        {
          uint64_t v25 = &unk_2702DD568;
        }
      }
      else
      {
        int v33 = espresso_network_bind_buffer();
        HIBYTE(v32[2]) = 21;
        strcpy((char *)v32, "Binding output buffer");
        sub_2529C8564(&v33, (uint64_t *)v32);
        if (SHIBYTE(v32[2]) < 0) {
          operator delete(v32[0]);
        }
        LOWORD(v32[0]) = 0;
        sub_2529C8034((uint64_t)&v25, (uint64_t)v34, v32);
        v32[0] = v9;
        uint64_t v18 = sub_2529C9D00((uint64_t)(v5 + 12), (uint64_t)v9, (uint64_t)&unk_2529D9AA5, v32);
        uint64_t v19 = v18;
        *((_DWORD *)v18 + 12) = v26;
        if (v18 + 5 != (uint64_t *)&v25) {
          sub_2529C1824(v18 + 7, (char *)v27, v28, (v28 - (unsigned char *)v27) >> 3);
        }
        uint64_t v21 = v30;
        uint64_t v20 = v31;
        if (v31) {
          atomic_fetch_add_explicit(&v31->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        int64_t v22 = (std::__shared_weak_count *)v19[11];
        _OWORD v19[10] = v21;
        v19[11] = (uint64_t)v20;
        if (v22 && !atomic_fetch_add(&v22->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
          std::__shared_weak_count::__release_weak(v22);
          uint64_t v17 = v31;
          uint64_t v25 = &unk_2702DD568;
          if (v31)
          {
LABEL_29:
            if (!atomic_fetch_add(&v17->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
            {
              ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
              std::__shared_weak_count::__release_weak(v17);
            }
          }
        }
        else
        {
          uint64_t v17 = v31;
          uint64_t v25 = &unk_2702DD568;
          if (v31) {
            goto LABEL_29;
          }
        }
      }
      if (v27)
      {
        long long v28 = (char *)v27;
        operator delete(v27);
      }
      long long v9 = (long long *)((char *)v9 + 24);
    }
    while (v9 != v8);
  }
  LODWORD(v32[0]) = espresso_plan_execute_sync();
  v34[23] = 14;
  strcpy(v34, "Executing plan");
  sub_2529C8564((int *)v32, (uint64_t *)v34);
  if ((v34[23] & 0x80000000) != 0) {
    operator delete(*(void **)v34);
  }
  return sub_2529C8F14(a4, (uint64_t)(v5 + 12));
}

void sub_2529C62EC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, int a19, __int16 a20,char a21,char a22,uint64_t a23,void *__p,uint64_t a25,int a26,__int16 a27,char a28,char a29,int a30,__int16 a31,char a32,char a33)
{
  if (a29 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void **sub_2529C6378(void **a1)
{
  uint64_t v2 = (void **)*a1;
  if (*a1)
  {
    uint64_t v3 = (void **)a1[1];
    int v4 = *a1;
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
      int v4 = *a1;
    }
    a1[1] = v2;
    operator delete(v4);
  }
  return a1;
}

void sub_2529C6474(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2529C648C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_2529C6860(uint64_t a1, __CVBuffer *a2)
{
  CVPixelBufferRef pixelBuffer = a2;
  uint64_t v3 = (std::__shared_weak_count *)operator new(0x28uLL);
  sub_2529C6D98(v3, &pixelBuffer);
  uint64_t v19 = v3 + 1;
  uint64_t v20 = v3;
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  int v4 = sub_2529C6ACC(pixelBuffer);
  unint64_t v5 = pixelBuffer;
  size_t Height = CVPixelBufferGetHeight(pixelBuffer);
  size_t Width = CVPixelBufferGetWidth(v5);
  uint64_t v8 = sub_2529C7284(v5);
  sub_2529C75DC(&v15, Height, Width, v8);
  *(void *)a1 = &unk_2702DD568;
  *(void *)(a1 + 16) = 0;
  *(_DWORD *)(a1 + 8) = v4;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0;
  long long v9 = v15;
  int64_t v10 = v16 - v15;
  if (v16 != v15)
  {
    if (v10 < 0) {
      sub_2529C1558();
    }
    long long v11 = (char *)operator new(v16 - v15);
    *(void *)(a1 + 16) = v11;
    *(void *)(a1 + 24) = v11;
    long long v12 = &v11[8 * (v10 >> 3)];
    *(void *)(a1 + 32) = v12;
    memcpy(v11, v9, v10);
    *(void *)(a1 + 24) = v12;
  }
  *(void *)(a1 + 40) = v3 + 1;
  *(void *)(a1 + 48) = v3;
  atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
  if (v9)
  {
    long long v16 = v9;
    operator delete(v9);
  }
  if (!atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
    std::__shared_weak_count::__release_weak(v3);
  }
  long long v13 = v18;
  if (v18 && !atomic_fetch_add(&v18->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
    std::__shared_weak_count::__release_weak(v13);
  }
  *(void *)a1 = &unk_2702DD690;
  return a1;
}

void sub_2529C6A3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, char a12, uint64_t a13, char a14)
{
}

uint64_t sub_2529C6ACC(__CVBuffer *a1)
{
  signed int PixelFormatType = CVPixelBufferGetPixelFormatType(a1);
  if (PixelFormatType <= 1278226533)
  {
    if (PixelFormatType <= 1111970368)
    {
      if (PixelFormatType != 32)
      {
        int v2 = 1094862674;
        goto LABEL_10;
      }
      return 0;
    }
    if (PixelFormatType == 1111970369) {
      return 0;
    }
    int v2 = 1278226488;
LABEL_10:
    if (PixelFormatType == v2) {
      return 0;
    }
LABEL_15:
    unsigned int v4 = PixelFormatType;
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::to_string(&v8, v4);
    uint64_t v6 = std::string::insert(&v8, 0, "Unsupported CVPixelBuffer type: ");
    long long v7 = *(_OWORD *)&v6->__r_.__value_.__l.__data_;
    v9.__r_.__value_.__r.__words[2] = v6->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v9.__r_.__value_.__l.__data_ = v7;
    v6->__r_.__value_.__l.__size_ = 0;
    v6->__r_.__value_.__r.__words[2] = 0;
    v6->__r_.__value_.__r.__words[0] = 0;
    std::runtime_error::runtime_error(exception, &v9);
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  if (PixelFormatType > 1717855599)
  {
    if (PixelFormatType != 1717856627 && PixelFormatType != 1717855600) {
      goto LABEL_15;
    }
  }
  else if (PixelFormatType != 1278226534)
  {
    int v2 = 1380401729;
    goto LABEL_10;
  }
  return 4;
}

void sub_2529C6C40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a15 < 0)
  {
    operator delete(a10);
    if ((v22 & 1) == 0) {
LABEL_8:
    }
      _Unwind_Resume(a1);
  }
  else if (!v22)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v21);
  goto LABEL_8;
}

void sub_2529C6CA0(void *a1)
{
  *a1 = &unk_2702DD568;
  int v2 = (std::__shared_weak_count *)a1[6];
  if (v2 && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
    uint64_t v3 = (void *)a1[2];
    if (!v3)
    {
LABEL_5:
      JUMPOUT(0x2533C48B0);
    }
  }
  else
  {
    uint64_t v3 = (void *)a1[2];
    if (!v3) {
      goto LABEL_5;
    }
  }
  a1[3] = v3;
  operator delete(v3);
  goto LABEL_5;
}

void sub_2529C6D64()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

void *sub_2529C6D98(void *a1, __CVBuffer **a2)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = &unk_2702DD6C8;
  uint64_t v3 = *a2;
  a1[3] = &unk_2702DD718;
  a1[4] = v3;
  if (!v3)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Null CVPixelBuffer encountered.");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  CVPixelBufferRetain(v3);
  return a1;
}

void sub_2529C6E4C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v2);
  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void sub_2529C6E68(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void sub_2529C6E7C(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_2702DD6C8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_2529C6E9C(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_2702DD6C8;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x2533C48B0);
}

void sub_2529C6EF0(uint64_t a1)
{
}

uint64_t sub_2529C6F14(uint64_t a1)
{
  return a1;
}

void sub_2529C6F44(uint64_t a1)
{
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 8));

  JUMPOUT(0x2533C48B0);
}

uint64_t sub_2529C6F94(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void))(*(void *)a2 + 24))(a2, *(void *)(a1 + 8));
}

void *sub_2529C6FC4(uint64_t a1)
{
  BaseAddress = CVPixelBufferGetBaseAddress(*(CVPixelBufferRef *)(a1 + 8));
  if (!BaseAddress)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Failed to get CVPixelBuffer's data. Ensure the buffer was locked.");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  uint64_t v3 = BaseAddress;
  CVPixelBufferGetDataSize(*(CVPixelBufferRef *)(a1 + 8));
  return v3;
}

void sub_2529C703C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void *sub_2529C7050@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = qword_2529D9B50[sub_2529C6ACC(*(__CVBuffer **)(a1 + 8))];
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(*(CVPixelBufferRef *)(a1 + 8));
  uint64_t v6 = sub_2529C7284(*(__CVBuffer **)(a1 + 8));
  a2[1] = 0;
  a2[2] = 0;
  *a2 = 0;
  uint64_t result = operator new(0x18uLL);
  a2[1] = result + 3;
  a2[2] = result + 3;
  *uint64_t result = BytesPerRow;
  result[1] = v6 * v4;
  result[2] = v4;
  *a2 = result;
  return result;
}

void sub_2529C70D0(CVPixelBufferRef *a1)
{
  if (!CVPixelBufferLockBaseAddress(a1[1], 1uLL))
  {
    (*((void (**)(CVPixelBufferRef *))*a1 + 3))(a1);
    (*((void (**)(void **__return_ptr, CVPixelBufferRef *))*a1 + 4))(&__p, a1);
    sub_2529C1600();
  }
  exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
  std::runtime_error::runtime_error(exception, "Failed to lock pixel buffer.");
  __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
}

void sub_2529C722C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_2529C7240(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_2529C7254(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13)
{
  if (__p)
  {
    a13 = (uint64_t)__p;
    operator delete(__p);
  }
  sub_2529C7458((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t sub_2529C7284(__CVBuffer *a1)
{
  signed int PixelFormatType = CVPixelBufferGetPixelFormatType(a1);
  if (PixelFormatType <= 1278226533)
  {
    if (PixelFormatType <= 1111970368)
    {
      if (PixelFormatType == 32) {
        return 4;
      }
      int v2 = 1094862674;
      goto LABEL_8;
    }
    if (PixelFormatType == 1111970369) {
      return 4;
    }
    int v4 = 1278226488;
LABEL_14:
    if (PixelFormatType != v4) {
      goto LABEL_16;
    }
    return 1;
  }
  if (PixelFormatType > 1717855599)
  {
    if (PixelFormatType == 1717856627) {
      return 1;
    }
    int v4 = 1717855600;
    goto LABEL_14;
  }
  if (PixelFormatType != 1278226534)
  {
    int v2 = 1380401729;
LABEL_8:
    if (PixelFormatType == v2) {
      return 4;
    }
LABEL_16:
    unsigned int v5 = PixelFormatType;
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::to_string(&v9, v5);
    long long v7 = std::string::insert(&v9, 0, "Unsupported CVPixelBuffer type: ");
    long long v8 = *(_OWORD *)&v7->__r_.__value_.__l.__data_;
    v10.__r_.__value_.__r.__words[2] = v7->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v10.__r_.__value_.__l.__data_ = v8;
    v7->__r_.__value_.__l.__size_ = 0;
    v7->__r_.__value_.__r.__words[2] = 0;
    v7->__r_.__value_.__r.__words[0] = 0;
    std::runtime_error::runtime_error(exception, &v10);
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  return 1;
}

void sub_2529C73F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a15 < 0)
  {
    operator delete(a10);
    if ((v22 & 1) == 0) {
LABEL_8:
    }
      _Unwind_Resume(a1);
  }
  else if (!v22)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v21);
  goto LABEL_8;
}

uint64_t sub_2529C7458(uint64_t a1)
{
  *(void *)a1 = &unk_2702DD770;
  if (CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)(a1 + 8), *(void *)(a1 + 16)))
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Failed to unlock pixel buffer.");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  return a1;
}

void sub_2529C74E0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_2529C74F4(uint64_t a1)
{
  *(void *)a1 = &unk_2702DD770;
  if (!CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)(a1 + 8), *(void *)(a1 + 16)))
  {
    JUMPOUT(0x2533C48B0);
  }
  exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
  std::runtime_error::runtime_error(exception, "Failed to unlock pixel buffer.");
  __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
}

void sub_2529C75A8(_Unwind_Exception *a1)
{
  __cxa_free_exception(v2);
  MEMORY[0x2533C48B0](v1, 0x10A1C40AFD1EA57);
  _Unwind_Resume(a1);
}

char **sub_2529C75DC(char **a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  long long v8 = (char *)operator new(8uLL);
  *(void *)long long v8 = a2;
  a1[1] = v8 + 8;
  a1[2] = v8 + 8;
  *a1 = v8;
  std::string v9 = (char *)operator new(0x10uLL);
  std::string v10 = v9 + 16;
  *(void *)std::string v9 = *(void *)v8;
  *((void *)v9 + 1) = a3;
  *a1 = v9;
  a1[1] = v9 + 16;
  a1[2] = v9 + 16;
  operator delete(v8);
  unint64_t v11 = (unint64_t)a1[2];
  a1[1] = v9 + 16;
  if ((unint64_t)(v9 + 16) < v11)
  {
    *((void *)v9 + 2) = a4;
    uint64_t v12 = (uint64_t)(v9 + 24);
    goto LABEL_21;
  }
  long long v13 = *a1;
  uint64_t v14 = (v10 - *a1) >> 3;
  unint64_t v15 = v14 + 1;
  if ((unint64_t)(v14 + 1) >> 61) {
    sub_2529C1558();
  }
  uint64_t v16 = v11 - (void)v13;
  if (v16 >> 2 > v15) {
    unint64_t v15 = v16 >> 2;
  }
  if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFF8) {
    unint64_t v17 = 0x1FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v17 = v15;
  }
  if (v17)
  {
    if (v17 >> 61) {
      sub_2529C6D64();
    }
    uint64_t v18 = (char *)operator new(8 * v17);
    uint64_t v19 = &v18[8 * v14];
    uint64_t v20 = &v18[8 * v17];
    *(void *)uint64_t v19 = a4;
    uint64_t v12 = (uint64_t)(v19 + 8);
    if (v10 == v13) {
      goto LABEL_19;
    }
    goto LABEL_14;
  }
  uint64_t v18 = 0;
  uint64_t v19 = (char *)(8 * v14);
  uint64_t v20 = 0;
  *(void *)(8 * v14) = a4;
  uint64_t v12 = 8 * v14 + 8;
  if (v10 != v13)
  {
LABEL_14:
    unint64_t v21 = v9 - v13 + 8;
    if (v21 < 0x18) {
      goto LABEL_26;
    }
    uint64_t v22 = (v21 >> 3) + 1;
    uint64_t v23 = 8 * (v22 & 0x3FFFFFFFFFFFFFFCLL);
    v10 -= v23;
    v19 -= v23;
    uint64_t v24 = &v18[8 * v14 - 16];
    uint64_t v25 = v22 & 0x3FFFFFFFFFFFFFFCLL;
    do
    {
      long long v26 = *(_OWORD *)v9;
      *((_OWORD *)v24 - 1) = *((_OWORD *)v9 - 1);
      *(_OWORD *)uint64_t v24 = v26;
      v24 -= 32;
      v9 -= 32;
      v25 -= 4;
    }
    while (v25);
    if (v22 != (v22 & 0x3FFFFFFFFFFFFFFCLL))
    {
LABEL_26:
      do
      {
        uint64_t v27 = *((void *)v10 - 1);
        v10 -= 8;
        *((void *)v19 - 1) = v27;
        v19 -= 8;
      }
      while (v10 != v13);
    }
  }
LABEL_19:
  *a1 = v19;
  a1[1] = (char *)v12;
  a1[2] = v20;
  if (v13) {
    operator delete(v13);
  }
LABEL_21:
  a1[1] = (char *)v12;
  return a1;
}

void sub_2529C77A0(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void sub_2529C77BC(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_2529C7E94(exception, a1);
  __cxa_throw(exception, (struct type_info *)off_265385C68, MEMORY[0x263F8C068]);
}

void sub_2529C7804(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t *sub_2529C7818(void *a1, uint64_t a2)
{
  int v2 = (unsigned char *)a2;
  unint64_t v4 = *(void *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    unint64_t v5 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(void *)a2;
    unint64_t v5 = v4;
  }
  unint64_t v6 = sub_2529C7A48((uint64_t)&v25, (uint64_t *)a2, v5);
  int8x8_t v7 = (int8x8_t)a1[1];
  if (!*(void *)&v7) {
    return 0;
  }
  unint64_t v8 = v6;
  uint8x8_t v9 = (uint8x8_t)vcnt_s8(v7);
  v9.i16[0] = vaddlv_u8(v9);
  if (v9.u32[0] > 1uLL)
  {
    unint64_t v10 = v6;
    if (v6 >= *(void *)&v7) {
      unint64_t v10 = v6 % *(void *)&v7;
    }
  }
  else
  {
    unint64_t v10 = (*(void *)&v7 - 1) & v6;
  }
  uint64_t v12 = *(uint64_t ***)(*a1 + 8 * v10);
  if (v12)
  {
    long long v13 = *v12;
    if (*v12)
    {
      char v14 = v2[23];
      if (v14 >= 0) {
        uint64_t v15 = v2[23];
      }
      else {
        uint64_t v15 = *((void *)v2 + 1);
      }
      if (v14 < 0) {
        int v2 = *(unsigned char **)v2;
      }
      if (v9.u32[0] < 2uLL)
      {
        uint64_t v16 = *(void *)&v7 - 1;
        while (1)
        {
          uint64_t v21 = v13[1];
          if (v21 == v8)
          {
            uint64_t v22 = *((unsigned __int8 *)v13 + 39);
            if ((v22 & 0x80u) == 0) {
              uint64_t v23 = *((unsigned __int8 *)v13 + 39);
            }
            else {
              uint64_t v23 = v13[3];
            }
            if (v23 == v15)
            {
              if ((v22 & 0x80) != 0)
              {
                if (!memcmp((const void *)v13[2], v2, v13[3])) {
                  return v13;
                }
              }
              else
              {
                if (!*((unsigned char *)v13 + 39)) {
                  return v13;
                }
                uint64_t v24 = 0;
                while (*((unsigned __int8 *)v13 + v24 + 16) == v2[v24])
                {
                  if (v22 == ++v24) {
                    return v13;
                  }
                }
              }
            }
          }
          else if ((v21 & v16) != v10)
          {
            return 0;
          }
          uint64_t result = 0;
          long long v13 = (uint64_t *)*v13;
          if (!v13) {
            return result;
          }
        }
      }
      while (1)
      {
        unint64_t v17 = v13[1];
        if (v17 == v8)
        {
          uint64_t v18 = *((unsigned __int8 *)v13 + 39);
          if ((v18 & 0x80u) == 0) {
            uint64_t v19 = *((unsigned __int8 *)v13 + 39);
          }
          else {
            uint64_t v19 = v13[3];
          }
          if (v19 == v15)
          {
            if ((v18 & 0x80) != 0)
            {
              if (!memcmp((const void *)v13[2], v2, v13[3])) {
                return v13;
              }
            }
            else
            {
              if (!*((unsigned char *)v13 + 39)) {
                return v13;
              }
              uint64_t v20 = 0;
              while (*((unsigned __int8 *)v13 + v20 + 16) == v2[v20])
              {
                if (v18 == ++v20) {
                  return v13;
                }
              }
            }
          }
        }
        else
        {
          if (v17 >= *(void *)&v7) {
            v17 %= *(void *)&v7;
          }
          if (v17 != v10) {
            return 0;
          }
        }
        uint64_t result = 0;
        long long v13 = (uint64_t *)*v13;
        if (!v13) {
          return result;
        }
      }
    }
  }
  return 0;
}

unint64_t sub_2529C7A48(uint64_t a1, uint64_t *a2, unint64_t a3)
{
  if (a3 > 0x20)
  {
    if (a3 > 0x40)
    {
      uint64_t v23 = *(uint64_t *)((char *)a2 + a3 - 48);
      uint64_t v24 = *(uint64_t *)((char *)a2 + a3 - 40);
      uint64_t v25 = *(uint64_t *)((char *)a2 + a3 - 24);
      uint64_t v27 = *(uint64_t *)((char *)a2 + a3 - 64);
      uint64_t v26 = *(uint64_t *)((char *)a2 + a3 - 56);
      uint64_t v28 = *(uint64_t *)((char *)a2 + a3 - 16);
      uint64_t v29 = *(uint64_t *)((char *)a2 + a3 - 8);
      unint64_t v30 = v26 + v28;
      unint64_t v31 = 0x9DDFEA08EB382D69
          * (v25 ^ ((0x9DDFEA08EB382D69 * (v25 ^ (v23 + a3))) >> 47) ^ (0x9DDFEA08EB382D69 * (v25 ^ (v23 + a3))));
      unint64_t v32 = 0x9DDFEA08EB382D69 * (v31 ^ (v31 >> 47));
      unint64_t v33 = v27 + a3 + v26 + v23;
      uint64_t v34 = v33 + v24;
      unint64_t v35 = __ROR8__(v33, 44) + v27 + a3 + __ROR8__(v24 + v27 + a3 - 0x622015F714C7D297 * (v31 ^ (v31 >> 47)), 21);
      uint64_t v36 = v26 + v28 + *(uint64_t *)((char *)a2 + a3 - 32) - 0x4B6D499041670D8DLL;
      uint64_t v37 = v36 + v25 + v28;
      uint64_t v38 = __ROR8__(v37, 44);
      uint64_t v39 = v37 + v29;
      uint64_t v40 = v38 + v36 + __ROR8__(v36 + v24 + v29, 21);
      uint64_t v42 = *a2;
      v41 = a2 + 4;
      unint64_t v43 = v42 - 0x4B6D499041670D8DLL * v24;
      uint64_t v44 = -(uint64_t)((a3 - 1) & 0xFFFFFFFFFFFFFFC0);
      do
      {
        uint64_t v45 = *(v41 - 3);
        uint64_t v46 = v43 + v34 + v30 + v45;
        uint64_t v47 = v41[2];
        uint64_t v48 = v41[3];
        uint64_t v49 = v41[1];
        unint64_t v30 = v49 + v34 - 0x4B6D499041670D8DLL * __ROR8__(v30 + v35 + v47, 42);
        uint64_t v50 = v32 + v39;
        uint64_t v51 = *(v41 - 2);
        uint64_t v52 = *(v41 - 1);
        uint64_t v53 = *(v41 - 4) - 0x4B6D499041670D8DLL * v35;
        uint64_t v54 = v53 + v39 + v52;
        uint64_t v55 = v53 + v45 + v51;
        uint64_t v34 = v55 + v52;
        uint64_t v56 = __ROR8__(v55, 44) + v53;
        unint64_t v57 = (0xB492B66FBE98F273 * __ROR8__(v46, 37)) ^ v40;
        unint64_t v43 = 0xB492B66FBE98F273 * __ROR8__(v50, 33);
        unint64_t v35 = v56 + __ROR8__(v54 + v57, 21);
        unint64_t v58 = v43 + v40 + *v41;
        uint64_t v39 = v58 + v49 + v47 + v48;
        uint64_t v40 = __ROR8__(v58 + v49 + v47, 44) + v58 + __ROR8__(v30 + v51 + v58 + v48, 21);
        v41 += 8;
        unint64_t v32 = v57;
        v44 += 64;
      }
      while (v44);
      unint64_t v59 = v43
          - 0x622015F714C7D297
          * ((0x9DDFEA08EB382D69
            * (v40 ^ ((0x9DDFEA08EB382D69 * (v40 ^ v35)) >> 47) ^ (0x9DDFEA08EB382D69 * (v40 ^ v35)))) ^ ((0x9DDFEA08EB382D69 * (v40 ^ ((0x9DDFEA08EB382D69 * (v40 ^ v35)) >> 47) ^ (0x9DDFEA08EB382D69 * (v40 ^ v35)))) >> 47));
      unint64_t v60 = 0x9DDFEA08EB382D69
          * (v59 ^ (v57
                  - 0x4B6D499041670D8DLL * (v30 ^ (v30 >> 47))
                  - 0x622015F714C7D297
                  * ((0x9DDFEA08EB382D69
                    * (v39 ^ ((0x9DDFEA08EB382D69 * (v39 ^ v34)) >> 47) ^ (0x9DDFEA08EB382D69 * (v39 ^ v34)))) ^ ((0x9DDFEA08EB382D69 * (v39 ^ ((0x9DDFEA08EB382D69 * (v39 ^ v34)) >> 47) ^ (0x9DDFEA08EB382D69 * (v39 ^ v34)))) >> 47))));
      return 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * (v59 ^ (v60 >> 47) ^ v60)) ^ ((0x9DDFEA08EB382D69 * (v59 ^ (v60 >> 47) ^ v60)) >> 47));
    }
    else
    {
      uint64_t v6 = *(uint64_t *)((char *)a2 + a3 - 16);
      uint64_t v7 = *a2 - 0x3C5A37A36834CED9 * (v6 + a3);
      uint64_t v9 = a2[2];
      uint64_t v8 = a2[3];
      uint64_t v10 = __ROR8__(v7 + v8, 52);
      uint64_t v11 = v7 + a2[1];
      uint64_t v12 = __ROR8__(v11, 7);
      uint64_t v13 = v11 + v9;
      uint64_t v14 = *(uint64_t *)((char *)a2 + a3 - 32) + v9;
      uint64_t v15 = v12 + __ROR8__(*a2 - 0x3C5A37A36834CED9 * (v6 + a3), 37) + v10 + __ROR8__(v13, 31);
      uint64_t v16 = *(uint64_t *)((char *)a2 + a3 - 24) + v14 + v6;
      unint64_t v17 = 0xC3A5C85C97CB3127 * (v16 + *(uint64_t *)((char *)a2 + a3 - 8) + v8 + v15)
          - 0x651E95C4D06FBFB1
          * (v13
           + v8
           + __ROR8__(v14, 37)
           + __ROR8__(*(uint64_t *)((char *)a2 + a3 - 24) + v14, 7)
           + __ROR8__(*(uint64_t *)((char *)a2 + a3 - 8) + v8 + v14, 52)
           + __ROR8__(v16, 31));
      return 0x9AE16A3B2F90404FLL
           * ((v15 - 0x3C5A37A36834CED9 * (v17 ^ (v17 >> 47))) ^ ((v15 - 0x3C5A37A36834CED9 * (v17 ^ (v17 >> 47))) >> 47));
    }
  }
  else if (a3 > 0x10)
  {
    uint64_t v18 = a2[1];
    unint64_t v19 = 0xB492B66FBE98F273 * *a2;
    uint64_t v20 = __ROR8__(0x9AE16A3B2F90404FLL * *(uint64_t *)((char *)a2 + a3 - 8), 30) + __ROR8__(v19 - v18, 43);
    unint64_t v21 = v19 + a3 + __ROR8__(v18 ^ 0xC949D7C7509E6557, 20) - 0x9AE16A3B2F90404FLL * *(uint64_t *)((char *)a2 + a3 - 8);
    unint64_t v22 = 0x9DDFEA08EB382D69 * ((v20 - 0x3C5A37A36834CED9 * *(uint64_t *)((char *)a2 + a3 - 16)) ^ v21);
    return 0x9DDFEA08EB382D69
         * ((0x9DDFEA08EB382D69 * (v21 ^ (v22 >> 47) ^ v22)) ^ ((0x9DDFEA08EB382D69 * (v21 ^ (v22 >> 47) ^ v22)) >> 47));
  }
  else if (a3 < 9)
  {
    if (a3 < 4)
    {
      unint64_t result = 0x9AE16A3B2F90404FLL;
      if (a3)
      {
        unint64_t v63 = (0xC949D7C7509E6557 * (a3 + 4 * *((unsigned __int8 *)a2 + a3 - 1))) ^ (0x9AE16A3B2F90404FLL
                                                                                       * (*(unsigned __int8 *)a2 | ((unint64_t)*((unsigned __int8 *)a2 + (a3 >> 1)) << 8)));
        return 0x9AE16A3B2F90404FLL * (v63 ^ (v63 >> 47));
      }
    }
    else
    {
      uint64_t v61 = *(unsigned int *)((char *)a2 + a3 - 4);
      unint64_t v62 = 0x9DDFEA08EB382D69 * (((8 * *(_DWORD *)a2) + a3) ^ v61);
      return 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * (v61 ^ (v62 >> 47) ^ v62)) ^ ((0x9DDFEA08EB382D69 * (v61 ^ (v62 >> 47) ^ v62)) >> 47));
    }
  }
  else
  {
    uint64_t v3 = *(uint64_t *)((char *)a2 + a3 - 8);
    uint64_t v4 = __ROR8__(v3 + a3, a3);
    return (0x9DDFEA08EB382D69
          * ((0x9DDFEA08EB382D69
            * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *a2)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *a2)))) ^ ((0x9DDFEA08EB382D69 * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *a2)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *a2)))) >> 47))) ^ v3;
  }
  return result;
}

std::logic_error *sub_2529C7E94(std::logic_error *a1, const char *a2)
{
  unint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C390] + 16);
  return result;
}

uint64_t sub_2529C7EC8(uint64_t a1, char *__s, uint64_t a3)
{
  size_t v6 = strlen(__s);
  if (v6 >= 0x7FFFFFFFFFFFFFF8) {
    sub_2529C1D00();
  }
  size_t v7 = v6;
  if (v6 >= 0x17)
  {
    uint64_t v9 = (v6 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v6 | 7) != 0x17) {
      uint64_t v9 = v6 | 7;
    }
    uint64_t v10 = v9 + 1;
    uint64_t v8 = operator new(v9 + 1);
    *(void *)(a1 + 8) = v7;
    *(void *)(a1 + 16) = v10 | 0x8000000000000000;
    *(void *)a1 = v8;
    goto LABEL_8;
  }
  *(unsigned char *)(a1 + 23) = v6;
  uint64_t v8 = (void *)a1;
  if (v6) {
LABEL_8:
  }
    memmove(v8, __s, v7);
  *((unsigned char *)v8 + v7) = 0;
  int v11 = *(_DWORD *)(a3 + 8);
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 24) = &unk_2702DD568;
  *(_DWORD *)(a1 + 32) = v11;
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = 0;
  uint64_t v13 = *(unsigned char **)(a3 + 16);
  uint64_t v12 = *(unsigned char **)(a3 + 24);
  int64_t v14 = v12 - v13;
  if (v12 != v13)
  {
    if (v14 < 0) {
      sub_2529C1558();
    }
    uint64_t v15 = (char *)operator new(v12 - v13);
    *(void *)(a1 + 40) = v15;
    *(void *)(a1 + 48) = v15;
    uint64_t v16 = &v15[8 * (v14 >> 3)];
    *(void *)(a1 + 56) = v16;
    memcpy(v15, v13, v14);
    *(void *)(a1 + 48) = v16;
  }
  uint64_t v17 = *(void *)(a3 + 48);
  *(void *)(a1 + 64) = *(void *)(a3 + 40);
  *(void *)(a1 + 72) = v17;
  if (v17) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v17 + 8), 1uLL, memory_order_relaxed);
  }
  return a1;
}

void sub_2529C8010(_Unwind_Exception *a1)
{
  uint64_t v4 = *v2;
  if (*v2)
  {
    *(void *)(v1 + 48) = v4;
    operator delete(v4);
  }
  sub_2529D7F0C((void **)v1);
  _Unwind_Resume(a1);
}

uint64_t sub_2529C8034(uint64_t a1, uint64_t a2, _WORD *a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  sub_2529C8428(a2, a3, &v18);
  uint64_t v6 = v18;
  unint64_t v5 = v19;
  uint64_t v20 = v18;
  unint64_t v21 = v19;
  uint64_t v18 = 0;
  unint64_t v19 = 0;
  int v7 = *(_DWORD *)(a2 + 160);
  switch(v7)
  {
    case 65568:
      int v8 = 4;
      break;
    case 262152:
      int v8 = 0;
      break;
    case 131104:
      int v8 = 2;
      break;
    default:
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "Unsupported espresso type encountered.");
      __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  uint64_t v24 = 0;
  int v23 = espresso_buffer_unpack_tensor_shape();
  strcpy((char *)__p, "Unpacking tensor shape");
  HIBYTE(__p[2]) = 22;
  sub_2529C8564(&v23, (uint64_t *)__p);
  if (SHIBYTE(__p[2]) < 0)
  {
    operator delete(__p[0]);
    unint64_t v9 = (unint64_t)v24;
    memset(__p, 0, sizeof(__p));
    if (v24) {
      goto LABEL_9;
    }
LABEL_13:
    int v11 = 0;
    goto LABEL_14;
  }
  unint64_t v9 = (unint64_t)v24;
  memset(__p, 0, sizeof(__p));
  if (!v24) {
    goto LABEL_13;
  }
LABEL_9:
  if (v9 >> 61) {
    sub_2529C1558();
  }
  size_t v10 = 8 * v9;
  if (((8 * v9) & 0x8000000000000000) != 0) {
    sub_2529C1558();
  }
  int v11 = (char *)operator new(8 * v9);
  unint64_t v9 = (unint64_t)&v11[8 * ((uint64_t)(8 * v9) >> 3)];
  memcpy(v11, __src, v10);
LABEL_14:
  *(void *)a1 = &unk_2702DD568;
  *(_DWORD *)(a1 + 8) = v8;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0;
  uint64_t v12 = v9 - (void)v11;
  if ((char *)v9 != v11)
  {
    if (v12 < 0) {
      sub_2529C1558();
    }
    uint64_t v13 = (char *)operator new(v9 - (void)v11);
    *(void *)(a1 + 16) = v13;
    int64_t v14 = &v13[8 * (v12 >> 3)];
    *(void *)(a1 + 32) = v14;
    memcpy(v13, v11, v9 - (void)v11);
    *(void *)(a1 + 24) = v14;
  }
  *(void *)(a1 + 40) = v6;
  *(void *)(a1 + 48) = v5;
  if (v5) {
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  if (v11) {
    operator delete(v11);
  }
  if (v5 && !atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
    std::__shared_weak_count::__release_weak(v5);
  }
  uint64_t v15 = v19;
  if (v19 && !atomic_fetch_add(&v19->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
    std::__shared_weak_count::__release_weak(v15);
  }
  *(void *)a1 = &unk_2702DD520;
  return a1;
}

void sub_2529C8354(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, char a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
}

void sub_2529C83C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va1, a5);
  va_start(va, a5);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  unint64_t v9 = *v7;
  if (*v7)
  {
    *(void *)(v5 + 24) = v9;
    operator delete(v9);
  }
  if (v6) {
    JUMPOUT(0x2529C83E0);
  }
  sub_2529C0C18((uint64_t)va1);
  sub_2529C0C18((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_2529C83FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  if (__p) {
    operator delete(__p);
  }
  sub_2529C0C18((uint64_t)&a15);
  sub_2529C0C18((uint64_t)&a13);
  _Unwind_Resume(a1);
}

void *sub_2529C8428@<X0>(uint64_t a1@<X1>, _WORD *a2@<X2>, void *a3@<X8>)
{
  unint64_t result = operator new(0xD0uLL);
  result[1] = 0;
  result[2] = 0;
  *unint64_t result = &unk_2702DD588;
  result[3] = &unk_2702DD5D8;
  long long v7 = *(_OWORD *)(a1 + 144);
  *((_OWORD *)result + 10) = *(_OWORD *)(a1 + 128);
  *((_OWORD *)result + 11) = v7;
  result[24] = *(void *)(a1 + 160);
  long long v8 = *(_OWORD *)(a1 + 80);
  *((_OWORD *)result + 6) = *(_OWORD *)(a1 + 64);
  *((_OWORD *)result + 7) = v8;
  long long v9 = *(_OWORD *)(a1 + 112);
  *((_OWORD *)result + 8) = *(_OWORD *)(a1 + 96);
  *((_OWORD *)result + 9) = v9;
  long long v10 = *(_OWORD *)(a1 + 16);
  *((_OWORD *)result + 2) = *(_OWORD *)a1;
  *((_OWORD *)result + 3) = v10;
  long long v11 = *(_OWORD *)(a1 + 48);
  *((_OWORD *)result + 4) = *(_OWORD *)(a1 + 32);
  *((_OWORD *)result + 5) = v11;
  int v12 = *((_DWORD *)result + 48) - 0x10000;
  *((_WORD *)result + 100) = *a2;
  if (v12 != 32)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Unexpected espresso buffer storage type");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  *a3 = result + 3;
  a3[1] = result;
  return result;
}

void sub_2529C852C(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  operator delete(v3);
  _Unwind_Resume(a1);
}

void sub_2529C8544(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  std::__shared_weak_count::~__shared_weak_count(v2);
  operator delete(v4);
  _Unwind_Resume(a1);
}

int *sub_2529C8564(int *result, uint64_t *a2)
{
  if (*result)
  {
    int v2 = result;
    sub_2529C879C((uint64_t)result, a2);
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::operator+<char>();
    uint64_t v4 = std::string::append(&v13, " [espresso error: ");
    long long v5 = *(_OWORD *)&v4->__r_.__value_.__l.__data_;
    v14.__r_.__value_.__r.__words[2] = v4->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v14.__r_.__value_.__l.__data_ = v5;
    v4->__r_.__value_.__l.__size_ = 0;
    v4->__r_.__value_.__r.__words[2] = 0;
    v4->__r_.__value_.__r.__words[0] = 0;
    std::to_string(&v12, *v2);
    if ((v12.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      uint64_t v6 = &v12;
    }
    else {
      uint64_t v6 = (std::string *)v12.__r_.__value_.__r.__words[0];
    }
    if ((v12.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type size = HIBYTE(v12.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type size = v12.__r_.__value_.__l.__size_;
    }
    long long v8 = std::string::append(&v14, (const std::string::value_type *)v6, size);
    long long v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
    v15.__r_.__value_.__r.__words[2] = v8->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v15.__r_.__value_.__l.__data_ = v9;
    v8->__r_.__value_.__l.__size_ = 0;
    v8->__r_.__value_.__r.__words[2] = 0;
    v8->__r_.__value_.__r.__words[0] = 0;
    long long v10 = std::string::append(&v15, "]");
    long long v11 = *(_OWORD *)&v10->__r_.__value_.__l.__data_;
    v16.__r_.__value_.__r.__words[2] = v10->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v16.__r_.__value_.__l.__data_ = v11;
    v10->__r_.__value_.__l.__size_ = 0;
    v10->__r_.__value_.__r.__words[2] = 0;
    v10->__r_.__value_.__r.__words[0] = 0;
    std::runtime_error::runtime_error(exception, &v16);
    exception->__vftable = (std::runtime_error_vtbl *)&unk_2702DD7B8;
    __cxa_throw(exception, (struct type_info *)&unk_2702DD790, (void (*)(void *))std::runtime_error::~runtime_error);
  }
  return result;
}

void sub_2529C86B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,uint64_t a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33)
{
  if (*(char *)(v35 - 41) < 0)
  {
    operator delete(*(void **)(v35 - 64));
    if ((a33 & 0x80000000) == 0)
    {
LABEL_3:
      if ((a14 & 0x80000000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((a33 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(a28);
  if ((a14 & 0x80000000) == 0)
  {
LABEL_4:
    if ((a26 & 0x80000000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  operator delete(a9);
  if ((a26 & 0x80000000) == 0)
  {
LABEL_5:
    if (a20 < 0) {
      goto LABEL_6;
    }
    goto LABEL_12;
  }
LABEL_11:
  operator delete(a21);
  if (a20 < 0)
  {
LABEL_6:
    operator delete(__p);
    if ((v34 & 1) == 0) {
LABEL_14:
    }
      _Unwind_Resume(a1);
LABEL_13:
    __cxa_free_exception(v33);
    goto LABEL_14;
  }
LABEL_12:
  if (!v34) {
    goto LABEL_14;
  }
  goto LABEL_13;
}

void sub_2529C879C(uint64_t a1, uint64_t *a2)
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    sub_2529D7F1C(a2);
  }
}

void sub_2529C87F0(std::runtime_error *a1)
{
  std::runtime_error::~runtime_error(a1);

  JUMPOUT(0x2533C48B0);
}

uint64_t sub_2529C8828(uint64_t result)
{
  uint64_t v1 = result;
  if (*(char *)(result + 31) < 0)
  {
    operator delete(*(void **)(result + 8));
    return v1;
  }
  return result;
}

void sub_2529C886C(uint64_t a1)
{
  if (*(char *)(a1 + 31) < 0) {
    operator delete(*(void **)(a1 + 8));
  }

  JUMPOUT(0x2533C48B0);
}

void sub_2529C88C0(uint64_t a1, long long *a2, _DWORD *a3)
{
  switch(*a3)
  {
    case 0:
      long long v3 = a2[1];
      long long v10 = *a2;
      long long v11 = v3;
      int v12 = espresso_network_bind_input_vimagebuffer_bgra8();
      char v9 = 21;
      strcpy(__p, "Binding vImage_Buffer");
      sub_2529C8564(&v12, (uint64_t *)__p);
      break;
    case 1:
      long long v5 = a2[1];
      long long v10 = *a2;
      long long v11 = v5;
      int v12 = espresso_network_bind_input_vimagebuffer_rgba8();
      char v9 = 21;
      strcpy(__p, "Binding vImage_Buffer");
      sub_2529C8564(&v12, (uint64_t *)__p);
      break;
    case 2:
      long long v4 = a2[1];
      long long v10 = *a2;
      long long v11 = v4;
      int v12 = espresso_network_bind_input_vimagebuffer_argb8();
      char v9 = 21;
      strcpy(__p, "Binding vImage_Buffer");
      sub_2529C8564(&v12, (uint64_t *)__p);
      break;
    case 3:
      long long v6 = a2[1];
      long long v10 = *a2;
      long long v11 = v6;
      int v12 = espresso_network_bind_input_vimagebuffer_planar8();
      char v9 = 21;
      strcpy(__p, "Binding vImage_Buffer");
      sub_2529C8564(&v12, (uint64_t *)__p);
      break;
    default:
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "Unsupported image buffer type");
      __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  if (v9 < 0) {
    operator delete(*(void **)__p);
  }
}

void sub_2529C8B08(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_2529C8B1C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_2529C8B54()
{
  int v2 = espresso_network_bind_cvpixelbuffer();
  char v1 = 21;
  strcpy(__p, "Binding CVPixelBuffer");
  sub_2529C8564(&v2, (uint64_t *)__p);
  if (v1 < 0) {
    operator delete(*(void **)__p);
  }
}

void sub_2529C8BF4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_2529C8C10()
{
  int v2 = espresso_network_bind_buffer();
  __p = operator new(0x20uLL);
  long long v1 = xmmword_2529D9890;
  strcpy((char *)__p, "Binding espresso_buffer_t");
  sub_2529C8564(&v2, (uint64_t *)&__p);
  if (SHIBYTE(v1) < 0) {
    operator delete(__p);
  }
}

void sub_2529C8CC8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t *sub_2529C8CE4(void *a1, uint64_t a2)
{
  int v2 = (unsigned char *)a2;
  unint64_t v4 = *(void *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    unint64_t v5 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(void *)a2;
    unint64_t v5 = v4;
  }
  unint64_t v6 = sub_2529C7A48((uint64_t)&v25, (uint64_t *)a2, v5);
  int8x8_t v7 = (int8x8_t)a1[1];
  if (!*(void *)&v7) {
    return 0;
  }
  unint64_t v8 = v6;
  uint8x8_t v9 = (uint8x8_t)vcnt_s8(v7);
  v9.i16[0] = vaddlv_u8(v9);
  if (v9.u32[0] > 1uLL)
  {
    unint64_t v10 = v6;
    if (v6 >= *(void *)&v7) {
      unint64_t v10 = v6 % *(void *)&v7;
    }
  }
  else
  {
    unint64_t v10 = (*(void *)&v7 - 1) & v6;
  }
  int v12 = *(uint64_t ***)(*a1 + 8 * v10);
  if (v12)
  {
    std::string v13 = *v12;
    if (*v12)
    {
      char v14 = v2[23];
      if (v14 >= 0) {
        uint64_t v15 = v2[23];
      }
      else {
        uint64_t v15 = *((void *)v2 + 1);
      }
      if (v14 < 0) {
        int v2 = *(unsigned char **)v2;
      }
      if (v9.u32[0] < 2uLL)
      {
        uint64_t v16 = *(void *)&v7 - 1;
        while (1)
        {
          uint64_t v21 = v13[1];
          if (v8 == v21)
          {
            uint64_t v22 = *((unsigned __int8 *)v13 + 39);
            if ((v22 & 0x80u) == 0) {
              uint64_t v23 = *((unsigned __int8 *)v13 + 39);
            }
            else {
              uint64_t v23 = v13[3];
            }
            if (v23 == v15)
            {
              if ((v22 & 0x80) != 0)
              {
                if (!memcmp((const void *)v13[2], v2, v13[3])) {
                  return v13;
                }
              }
              else
              {
                if (!*((unsigned char *)v13 + 39)) {
                  return v13;
                }
                uint64_t v24 = 0;
                while (*((unsigned __int8 *)v13 + v24 + 16) == v2[v24])
                {
                  if (v22 == ++v24) {
                    return v13;
                  }
                }
              }
            }
          }
          else if ((v21 & v16) != v10)
          {
            return 0;
          }
          unint64_t result = 0;
          std::string v13 = (uint64_t *)*v13;
          if (!v13) {
            return result;
          }
        }
      }
      while (1)
      {
        unint64_t v17 = v13[1];
        if (v8 == v17)
        {
          uint64_t v18 = *((unsigned __int8 *)v13 + 39);
          if ((v18 & 0x80u) == 0) {
            uint64_t v19 = *((unsigned __int8 *)v13 + 39);
          }
          else {
            uint64_t v19 = v13[3];
          }
          if (v19 == v15)
          {
            if ((v18 & 0x80) != 0)
            {
              if (!memcmp((const void *)v13[2], v2, v13[3])) {
                return v13;
              }
            }
            else
            {
              if (!*((unsigned char *)v13 + 39)) {
                return v13;
              }
              uint64_t v20 = 0;
              while (*((unsigned __int8 *)v13 + v20 + 16) == v2[v20])
              {
                if (v18 == ++v20) {
                  return v13;
                }
              }
            }
          }
        }
        else
        {
          if (v17 >= *(void *)&v7) {
            v17 %= *(void *)&v7;
          }
          if (v17 != v10) {
            return 0;
          }
        }
        unint64_t result = 0;
        std::string v13 = (uint64_t *)*v13;
        if (!v13) {
          return result;
        }
      }
    }
  }
  return 0;
}

uint64_t sub_2529C8F14(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  size_t prime = *(void *)(a2 + 8);
  if (prime == 1)
  {
    size_t prime = 2;
LABEL_17:
    sub_2529C9058(a1, prime);
    goto LABEL_18;
  }
  if ((prime & (prime - 1)) != 0)
  {
    size_t prime = std::__next_prime(*(void *)(a2 + 8));
    int8x8_t v5 = *(int8x8_t *)(a1 + 8);
    BOOL v6 = prime >= *(void *)&v5;
    if (prime > *(void *)&v5) {
      goto LABEL_17;
    }
  }
  else
  {
    int8x8_t v5 = 0;
    BOOL v6 = 1;
    if (prime) {
      goto LABEL_17;
    }
  }
  if (!v6)
  {
    unint64_t v7 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v5 < 3uLL || (uint8x8_t v8 = (uint8x8_t)vcnt_s8(v5), v8.i16[0] = vaddlv_u8(v8), v8.u32[0] > 1uLL))
    {
      unint64_t v7 = std::__next_prime(v7);
    }
    else
    {
      uint64_t v9 = 1 << -(char)__clz(v7 - 1);
      if (v7 >= 2) {
        unint64_t v7 = v9;
      }
    }
    if (prime <= v7) {
      size_t prime = v7;
    }
    if (prime < *(void *)&v5) {
      goto LABEL_17;
    }
  }
LABEL_18:
  for (i = *(long long **)(a2 + 16); i; i = *(long long **)i)
    sub_2529C9208(a1, (uint64_t)(i + 1), i + 1);
  return a1;
}

void sub_2529C9030(_Unwind_Exception *a1)
{
  sub_2529C988C(v1);
  _Unwind_Resume(a1);
}

void sub_2529C9044(_Unwind_Exception *a1)
{
  sub_2529C988C(v1);
  _Unwind_Resume(a1);
}

void sub_2529C9058(uint64_t a1, unint64_t a2)
{
  if (!a2)
  {
    uint64_t v15 = *(void **)a1;
    *(void *)a1 = 0;
    if (v15) {
      operator delete(v15);
    }
    *(void *)(a1 + 8) = 0;
    return;
  }
  if (a2 >> 61) {
    sub_2529C6D64();
  }
  unint64_t v4 = operator new(8 * a2);
  int8x8_t v5 = *(void **)a1;
  *(void *)a1 = v4;
  if (v5) {
    operator delete(v5);
  }
  uint64_t v6 = 0;
  *(void *)(a1 + 8) = a2;
  do
    *(void *)(*(void *)a1 + 8 * v6++) = 0;
  while (a2 != v6);
  uint64_t v8 = a1 + 16;
  unint64_t v7 = *(void **)(a1 + 16);
  if (v7)
  {
    unint64_t v9 = v7[1];
    unint64_t v10 = a2 - 1;
    if ((a2 & (a2 - 1)) == 0)
    {
      uint64_t v11 = v9 & v10;
      *(void *)(*(void *)a1 + 8 * v11) = v8;
      while (1)
      {
        int v12 = (void *)*v7;
        if (!*v7) {
          break;
        }
        uint64_t v13 = v12[1] & v10;
        if (v13 == v11)
        {
          unint64_t v7 = (void *)*v7;
        }
        else if (*(void *)(*(void *)a1 + 8 * v13))
        {
          *unint64_t v7 = *v12;
          uint64_t v14 = 8 * v13;
          *int v12 = **(void **)(*(void *)a1 + v14);
          **(void **)(*(void *)a1 + v14) = v12;
        }
        else
        {
          *(void *)(*(void *)a1 + 8 * v13) = v7;
          unint64_t v7 = v12;
          uint64_t v11 = v13;
        }
      }
      return;
    }
    if (v9 >= a2) {
      v9 %= a2;
    }
    *(void *)(*(void *)a1 + 8 * v9) = v8;
    uint64_t v16 = (void *)*v7;
    if (*v7)
    {
      while (1)
      {
        unint64_t v18 = v16[1];
        if (v18 >= a2) {
          v18 %= a2;
        }
        if (v18 == v9) {
          goto LABEL_25;
        }
        if (*(void *)(*(void *)a1 + 8 * v18))
        {
          *unint64_t v7 = *v16;
          uint64_t v17 = 8 * v18;
          void *v16 = **(void **)(*(void *)a1 + v17);
          **(void **)(*(void *)a1 + v17) = v16;
          uint64_t v16 = v7;
LABEL_25:
          unint64_t v7 = v16;
          uint64_t v16 = (void *)*v16;
          if (!v16) {
            return;
          }
        }
        else
        {
          *(void *)(*(void *)a1 + 8 * v18) = v7;
          unint64_t v7 = v16;
          uint64_t v16 = (void *)*v16;
          unint64_t v9 = v18;
          if (!v16) {
            return;
          }
        }
      }
    }
  }
}

uint64_t *sub_2529C9208(uint64_t a1, uint64_t a2, long long *a3)
{
  int8x8_t v5 = (unsigned char *)a2;
  unint64_t v7 = *(void *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    unint64_t v8 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(void *)a2;
    unint64_t v8 = v7;
  }
  unint64_t v9 = sub_2529C7A48((uint64_t)v41, (uint64_t *)a2, v8);
  unint64_t v10 = v9;
  unint64_t v11 = *(void *)(a1 + 8);
  if (v11)
  {
    uint8x8_t v12 = (uint8x8_t)vcnt_s8((int8x8_t)v11);
    v12.i16[0] = vaddlv_u8(v12);
    if (v12.u32[0] > 1uLL)
    {
      unint64_t v3 = v9;
      if (v9 >= v11) {
        unint64_t v3 = v9 % v11;
      }
    }
    else
    {
      unint64_t v3 = (v11 - 1) & v9;
    }
    uint64_t v13 = *(uint64_t ***)(*(void *)a1 + 8 * v3);
    if (v13)
    {
      uint64_t v14 = *v13;
      if (*v13)
      {
        char v15 = v5[23];
        if (v15 >= 0) {
          uint64_t v16 = v5[23];
        }
        else {
          uint64_t v16 = *((void *)v5 + 1);
        }
        if (v15 < 0) {
          int8x8_t v5 = *(unsigned char **)v5;
        }
        if (v12.u32[0] < 2uLL)
        {
          while (1)
          {
            uint64_t v21 = v14[1];
            if (v21 == v10)
            {
              uint64_t v22 = *((unsigned __int8 *)v14 + 39);
              if ((v22 & 0x80u) == 0) {
                uint64_t v23 = *((unsigned __int8 *)v14 + 39);
              }
              else {
                uint64_t v23 = v14[3];
              }
              if (v23 == v16)
              {
                if ((v22 & 0x80) != 0)
                {
                  if (!memcmp((const void *)v14[2], v5, v14[3])) {
                    return v14;
                  }
                }
                else
                {
                  if (!*((unsigned char *)v14 + 39)) {
                    return v14;
                  }
                  uint64_t v24 = 0;
                  while (*((unsigned __int8 *)v14 + v24 + 16) == v5[v24])
                  {
                    if (v22 == ++v24) {
                      return v14;
                    }
                  }
                }
              }
            }
            else if ((v21 & (v11 - 1)) != v3)
            {
              goto LABEL_51;
            }
            uint64_t v14 = (uint64_t *)*v14;
            if (!v14) {
              goto LABEL_51;
            }
          }
        }
        do
        {
          unint64_t v17 = v14[1];
          if (v17 == v10)
          {
            uint64_t v18 = *((unsigned __int8 *)v14 + 39);
            if ((v18 & 0x80u) == 0) {
              uint64_t v19 = *((unsigned __int8 *)v14 + 39);
            }
            else {
              uint64_t v19 = v14[3];
            }
            if (v19 == v16)
            {
              if ((v18 & 0x80) != 0)
              {
                if (!memcmp((const void *)v14[2], v5, v14[3])) {
                  return v14;
                }
              }
              else
              {
                if (!*((unsigned char *)v14 + 39)) {
                  return v14;
                }
                uint64_t v20 = 0;
                while (*((unsigned __int8 *)v14 + v20 + 16) == v5[v20])
                {
                  if (v18 == ++v20) {
                    return v14;
                  }
                }
              }
            }
          }
          else
          {
            if (v17 >= v11) {
              v17 %= v11;
            }
            if (v17 != v3) {
              break;
            }
          }
          uint64_t v14 = (uint64_t *)*v14;
        }
        while (v14);
      }
    }
  }
LABEL_51:
  char v25 = operator new(0x60uLL);
  v41[0] = v25;
  v41[1] = a1 + 16;
  char v42 = 0;
  void *v25 = 0;
  v25[1] = v10;
  sub_2529C9664(v25 + 2, a3);
  char v42 = 1;
  float v26 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v27 = *(float *)(a1 + 32);
  if (!v11 || (float)(v27 * (float)v11) < v26)
  {
    BOOL v30 = 1;
    if (v11 >= 3) {
      BOOL v30 = (v11 & (v11 - 1)) != 0;
    }
    unint64_t v31 = v30 | (2 * v11);
    unint64_t v32 = vcvtps_u32_f32(v26 / v27);
    if (v31 <= v32) {
      size_t prime = v32;
    }
    else {
      size_t prime = v31;
    }
    if (prime == 1)
    {
      size_t prime = 2;
    }
    else if ((prime & (prime - 1)) != 0)
    {
      size_t prime = std::__next_prime(prime);
    }
    int8x8_t v34 = *(int8x8_t *)(a1 + 8);
    if (prime > *(void *)&v34) {
      goto LABEL_65;
    }
    if (prime < *(void *)&v34)
    {
      unint64_t v35 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
      if (*(void *)&v34 < 3uLL || (uint8x8_t v36 = (uint8x8_t)vcnt_s8(v34), v36.i16[0] = vaddlv_u8(v36), v36.u32[0] > 1uLL))
      {
        unint64_t v35 = std::__next_prime(v35);
      }
      else
      {
        uint64_t v37 = 1 << -(char)__clz(v35 - 1);
        if (v35 >= 2) {
          unint64_t v35 = v37;
        }
      }
      if (prime <= v35) {
        size_t prime = v35;
      }
      if (prime < *(void *)&v34) {
LABEL_65:
      }
        sub_2529C9058(a1, prime);
    }
    unint64_t v11 = *(void *)(a1 + 8);
    unint64_t v38 = v11 - 1;
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v10 >= v11)
      {
        unint64_t v3 = v10 % v11;
        uint64_t v28 = *(void **)(*(void *)a1 + 8 * (v10 % v11));
        uint64_t v29 = (void *)v41[0];
        if (v28) {
          goto LABEL_54;
        }
      }
      else
      {
        unint64_t v3 = v10;
        uint64_t v28 = *(void **)(*(void *)a1 + 8 * v10);
        uint64_t v29 = (void *)v41[0];
        if (v28) {
          goto LABEL_54;
        }
      }
    }
    else
    {
      unint64_t v3 = v38 & v10;
      uint64_t v28 = *(void **)(*(void *)a1 + 8 * (v38 & v10));
      uint64_t v29 = (void *)v41[0];
      if (v28) {
        goto LABEL_54;
      }
    }
LABEL_78:
    *uint64_t v29 = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v41[0];
    *(void *)(*(void *)a1 + 8 * v3) = a1 + 16;
    if (*(void *)v41[0])
    {
      unint64_t v39 = *(void *)(*(void *)v41[0] + 8);
      if ((v11 & (v11 - 1)) != 0)
      {
        if (v39 >= v11) {
          v39 %= v11;
        }
      }
      else
      {
        v39 &= v11 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v39) = v41[0];
    }
    goto LABEL_89;
  }
  uint64_t v28 = *(void **)(*(void *)a1 + 8 * v3);
  uint64_t v29 = (void *)v41[0];
  if (!v28) {
    goto LABEL_78;
  }
LABEL_54:
  *uint64_t v29 = *v28;
  *uint64_t v28 = v41[0];
LABEL_89:
  uint64_t v14 = (uint64_t *)v41[0];
  ++*(void *)(a1 + 24);
  return v14;
}

void sub_2529C9630(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_2529C9794((uint64_t *)va, 0);
  _Unwind_Resume(a1);
}

void sub_2529C9648(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_2529C9794((uint64_t *)va, 0);
  _Unwind_Resume(a1);
}

void *sub_2529C9664(void *__dst, long long *a2)
{
  if (*((char *)a2 + 23) < 0)
  {
    sub_2529C9C60(__dst, *(void **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v4 = *a2;
    __dst[2] = *((void *)a2 + 2);
    *(_OWORD *)__dst = v4;
  }
  int v5 = *((_DWORD *)a2 + 8);
  __dst[5] = 0;
  __dst[3] = &unk_2702DD568;
  *((_DWORD *)__dst + 8) = v5;
  __dst[6] = 0;
  __dst[7] = 0;
  unint64_t v7 = (unsigned char *)*((void *)a2 + 5);
  uint64_t v6 = (unsigned char *)*((void *)a2 + 6);
  int64_t v8 = v6 - v7;
  if (v6 != v7)
  {
    if (v8 < 0) {
      sub_2529C1558();
    }
    unint64_t v9 = (char *)operator new(v6 - v7);
    __dst[5] = v9;
    __dst[6] = v9;
    unint64_t v10 = &v9[8 * (v8 >> 3)];
    __dst[7] = v10;
    memcpy(v9, v7, v8);
    __dst[6] = v10;
  }
  uint64_t v11 = *((void *)a2 + 9);
  __dst[8] = *((void *)a2 + 8);
  __dst[9] = v11;
  if (v11) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v11 + 8), 1uLL, memory_order_relaxed);
  }
  __dst[3] = &unk_2702DD520;
  return __dst;
}

void sub_2529C9770(_Unwind_Exception *a1)
{
  long long v4 = *v2;
  if (*v2)
  {
    *(void *)(v1 + 48) = v4;
    operator delete(v4);
  }
  sub_2529D7F0C((void **)v1);
  _Unwind_Resume(a1);
}

void sub_2529C9794(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  *a1 = a2;
  if (v2)
  {
    if (!*((unsigned char *)a1 + 16)) {
      goto LABEL_9;
    }
    *(void *)(v2 + 40) = &unk_2702DD568;
    unint64_t v3 = *(std::__shared_weak_count **)(v2 + 88);
    if (v3 && !atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
    long long v4 = *(void **)(v2 + 56);
    if (v4)
    {
      *(void *)(v2 + 64) = v4;
      operator delete(v4);
    }
    if (*(char *)(v2 + 39) < 0)
    {
      operator delete(*(void **)(v2 + 16));
      int v5 = (void *)v2;
    }
    else
    {
LABEL_9:
      int v5 = (void *)v2;
    }
    operator delete(v5);
  }
}

uint64_t sub_2529C988C(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 16);
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = (void *)*v2;
      v2[5] = &unk_2702DD568;
      long long v4 = (std::__shared_weak_count *)v2[11];
      if (v4)
      {
        if (!atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
          break;
        }
      }
      int v5 = (void *)v2[7];
      if (v5) {
        goto LABEL_7;
      }
LABEL_8:
      if (*((char *)v2 + 39) < 0) {
        operator delete((void *)v2[2]);
      }
      operator delete(v2);
      uint64_t v2 = v3;
      if (!v3) {
        goto LABEL_12;
      }
    }
    ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
    std::__shared_weak_count::__release_weak(v4);
    int v5 = (void *)v2[7];
    if (!v5) {
      goto LABEL_8;
    }
LABEL_7:
    v2[8] = v5;
    operator delete(v5);
    goto LABEL_8;
  }
LABEL_12:
  uint64_t v6 = *(void **)a1;
  *(void *)a1 = 0;
  if (v6) {
    operator delete(v6);
  }
  return a1;
}

uint64_t sub_2529C9988(uint64_t a1, char *__s, uint64_t a3)
{
  size_t v6 = strlen(__s);
  if (v6 >= 0x7FFFFFFFFFFFFFF8) {
    sub_2529C1D00();
  }
  size_t v7 = v6;
  if (v6 >= 0x17)
  {
    uint64_t v9 = (v6 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v6 | 7) != 0x17) {
      uint64_t v9 = v6 | 7;
    }
    uint64_t v10 = v9 + 1;
    int64_t v8 = operator new(v9 + 1);
    *(void *)(a1 + 8) = v7;
    *(void *)(a1 + 16) = v10 | 0x8000000000000000;
    *(void *)a1 = v8;
    goto LABEL_8;
  }
  *(unsigned char *)(a1 + 23) = v6;
  int64_t v8 = (void *)a1;
  if (v6) {
LABEL_8:
  }
    memmove(v8, __s, v7);
  *((unsigned char *)v8 + v7) = 0;
  int v11 = *(_DWORD *)(a3 + 8);
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 24) = &unk_2702DD568;
  *(_DWORD *)(a1 + 32) = v11;
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = 0;
  uint64_t v13 = *(unsigned char **)(a3 + 16);
  uint8x8_t v12 = *(unsigned char **)(a3 + 24);
  int64_t v14 = v12 - v13;
  if (v12 != v13)
  {
    if (v14 < 0) {
      sub_2529C1558();
    }
    char v15 = (char *)operator new(v12 - v13);
    *(void *)(a1 + 40) = v15;
    *(void *)(a1 + 48) = v15;
    uint64_t v16 = &v15[8 * (v14 >> 3)];
    *(void *)(a1 + 56) = v16;
    memcpy(v15, v13, v14);
    *(void *)(a1 + 48) = v16;
  }
  uint64_t v17 = *(void *)(a3 + 48);
  *(void *)(a1 + 64) = *(void *)(a3 + 40);
  *(void *)(a1 + 72) = v17;
  if (v17) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v17 + 8), 1uLL, memory_order_relaxed);
  }
  return a1;
}

void sub_2529C9AD0(_Unwind_Exception *a1)
{
  long long v4 = *v2;
  if (*v2)
  {
    *(void *)(v1 + 48) = v4;
    operator delete(v4);
  }
  sub_2529D7F0C((void **)v1);
  _Unwind_Resume(a1);
}

uint64_t sub_2529C9AF4(uint64_t a1, char *__s, uint64_t a3)
{
  size_t v6 = strlen(__s);
  if (v6 >= 0x7FFFFFFFFFFFFFF8) {
    sub_2529C1D00();
  }
  size_t v7 = v6;
  if (v6 >= 0x17)
  {
    uint64_t v9 = (v6 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v6 | 7) != 0x17) {
      uint64_t v9 = v6 | 7;
    }
    uint64_t v10 = v9 + 1;
    int64_t v8 = operator new(v9 + 1);
    *(void *)(a1 + 8) = v7;
    *(void *)(a1 + 16) = v10 | 0x8000000000000000;
    *(void *)a1 = v8;
    goto LABEL_8;
  }
  *(unsigned char *)(a1 + 23) = v6;
  int64_t v8 = (void *)a1;
  if (v6) {
LABEL_8:
  }
    memmove(v8, __s, v7);
  *((unsigned char *)v8 + v7) = 0;
  int v11 = *(_DWORD *)(a3 + 8);
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 24) = &unk_2702DD568;
  *(_DWORD *)(a1 + 32) = v11;
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = 0;
  uint64_t v13 = *(unsigned char **)(a3 + 16);
  uint8x8_t v12 = *(unsigned char **)(a3 + 24);
  int64_t v14 = v12 - v13;
  if (v12 != v13)
  {
    if (v14 < 0) {
      sub_2529C1558();
    }
    char v15 = (char *)operator new(v12 - v13);
    *(void *)(a1 + 40) = v15;
    *(void *)(a1 + 48) = v15;
    uint64_t v16 = &v15[8 * (v14 >> 3)];
    *(void *)(a1 + 56) = v16;
    memcpy(v15, v13, v14);
    *(void *)(a1 + 48) = v16;
  }
  uint64_t v17 = *(void *)(a3 + 48);
  *(void *)(a1 + 64) = *(void *)(a3 + 40);
  *(void *)(a1 + 72) = v17;
  if (v17) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v17 + 8), 1uLL, memory_order_relaxed);
  }
  return a1;
}

void sub_2529C9C3C(_Unwind_Exception *a1)
{
  long long v4 = *v2;
  if (*v2)
  {
    *(void *)(v1 + 48) = v4;
    operator delete(v4);
  }
  sub_2529D7F0C((void **)v1);
  _Unwind_Resume(a1);
}

void *sub_2529C9C60(unsigned char *__dst, void *__src, unint64_t a3)
{
  int v5 = __dst;
  if (a3 > 0x16)
  {
    if (a3 >= 0x7FFFFFFFFFFFFFF8) {
      sub_2529C1D00();
    }
    uint64_t v6 = (a3 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a3 | 7) != 0x17) {
      uint64_t v6 = a3 | 7;
    }
    uint64_t v7 = v6 + 1;
    int64_t v8 = operator new(v6 + 1);
    v5[1] = a3;
    v5[2] = v7 | 0x8000000000000000;
    *int v5 = v8;
    int v5 = v8;
  }
  else
  {
    __dst[23] = a3;
  }

  return memmove(v5, __src, a3 + 1);
}

uint64_t *sub_2529C9D00(uint64_t a1, uint64_t a2, uint64_t a3, long long **a4)
{
  uint64_t v6 = (unsigned char *)a2;
  unint64_t v8 = *(void *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    unint64_t v9 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(void *)a2;
    unint64_t v9 = v8;
  }
  unint64_t v10 = sub_2529C7A48((uint64_t)v45, (uint64_t *)a2, v9);
  unint64_t v11 = v10;
  unint64_t v12 = *(void *)(a1 + 8);
  if (v12)
  {
    uint8x8_t v13 = (uint8x8_t)vcnt_s8((int8x8_t)v12);
    v13.i16[0] = vaddlv_u8(v13);
    if (v13.u32[0] > 1uLL)
    {
      unint64_t v4 = v10;
      if (v10 >= v12) {
        unint64_t v4 = v10 % v12;
      }
    }
    else
    {
      unint64_t v4 = (v12 - 1) & v10;
    }
    int64_t v14 = *(uint64_t ***)(*(void *)a1 + 8 * v4);
    if (v14)
    {
      char v15 = *v14;
      if (*v14)
      {
        char v16 = v6[23];
        if (v16 >= 0) {
          uint64_t v17 = v6[23];
        }
        else {
          uint64_t v17 = *((void *)v6 + 1);
        }
        if (v16 < 0) {
          uint64_t v6 = *(unsigned char **)v6;
        }
        if (v13.u32[0] < 2uLL)
        {
          while (1)
          {
            uint64_t v22 = v15[1];
            if (v22 == v11)
            {
              uint64_t v23 = *((unsigned __int8 *)v15 + 39);
              if ((v23 & 0x80u) == 0) {
                uint64_t v24 = *((unsigned __int8 *)v15 + 39);
              }
              else {
                uint64_t v24 = v15[3];
              }
              if (v24 == v17)
              {
                if ((v23 & 0x80) != 0)
                {
                  if (!memcmp((const void *)v15[2], v6, v15[3])) {
                    return v15;
                  }
                }
                else
                {
                  if (!*((unsigned char *)v15 + 39)) {
                    return v15;
                  }
                  uint64_t v25 = 0;
                  while (*((unsigned __int8 *)v15 + v25 + 16) == v6[v25])
                  {
                    if (v23 == ++v25) {
                      return v15;
                    }
                  }
                }
              }
            }
            else if ((v22 & (v12 - 1)) != v4)
            {
              goto LABEL_51;
            }
            char v15 = (uint64_t *)*v15;
            if (!v15) {
              goto LABEL_51;
            }
          }
        }
        do
        {
          unint64_t v18 = v15[1];
          if (v18 == v11)
          {
            uint64_t v19 = *((unsigned __int8 *)v15 + 39);
            if ((v19 & 0x80u) == 0) {
              uint64_t v20 = *((unsigned __int8 *)v15 + 39);
            }
            else {
              uint64_t v20 = v15[3];
            }
            if (v20 == v17)
            {
              if ((v19 & 0x80) != 0)
              {
                if (!memcmp((const void *)v15[2], v6, v15[3])) {
                  return v15;
                }
              }
              else
              {
                if (!*((unsigned char *)v15 + 39)) {
                  return v15;
                }
                uint64_t v21 = 0;
                while (*((unsigned __int8 *)v15 + v21 + 16) == v6[v21])
                {
                  if (v19 == ++v21) {
                    return v15;
                  }
                }
              }
            }
          }
          else
          {
            if (v18 >= v12) {
              v18 %= v12;
            }
            if (v18 != v4) {
              break;
            }
          }
          char v15 = (uint64_t *)*v15;
        }
        while (v15);
      }
    }
  }
LABEL_51:
  float v26 = (char *)operator new(0x60uLL);
  v45[0] = v26;
  v45[1] = a1 + 16;
  char v46 = 0;
  *(void *)float v26 = 0;
  *((void *)v26 + 1) = v11;
  float v27 = v26 + 16;
  uint64_t v28 = *a4;
  if (*((char *)*a4 + 23) < 0)
  {
    sub_2529C9C60(v27, *(void **)v28, *((void *)v28 + 1));
  }
  else
  {
    long long v29 = *v28;
    *((void *)v26 + 4) = *((void *)v28 + 2);
    *(_OWORD *)float v27 = v29;
  }
  *((_DWORD *)v26 + 12) = 4;
  *(_OWORD *)(v26 + 56) = 0u;
  *(_OWORD *)(v26 + 72) = 0u;
  *((void *)v26 + 11) = 0;
  *((void *)v26 + 5) = &unk_2702DD520;
  char v46 = 1;
  float v30 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v31 = *(float *)(a1 + 32);
  if (!v12 || (float)(v31 * (float)v12) < v30)
  {
    BOOL v34 = 1;
    if (v12 >= 3) {
      BOOL v34 = (v12 & (v12 - 1)) != 0;
    }
    unint64_t v35 = v34 | (2 * v12);
    unint64_t v36 = vcvtps_u32_f32(v30 / v31);
    if (v35 <= v36) {
      size_t prime = v36;
    }
    else {
      size_t prime = v35;
    }
    if (prime == 1)
    {
      size_t prime = 2;
    }
    else if ((prime & (prime - 1)) != 0)
    {
      size_t prime = std::__next_prime(prime);
    }
    int8x8_t v38 = *(int8x8_t *)(a1 + 8);
    if (prime > *(void *)&v38) {
      goto LABEL_68;
    }
    if (prime < *(void *)&v38)
    {
      unint64_t v39 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
      if (*(void *)&v38 < 3uLL || (uint8x8_t v40 = (uint8x8_t)vcnt_s8(v38), v40.i16[0] = vaddlv_u8(v40), v40.u32[0] > 1uLL))
      {
        unint64_t v39 = std::__next_prime(v39);
      }
      else
      {
        uint64_t v41 = 1 << -(char)__clz(v39 - 1);
        if (v39 >= 2) {
          unint64_t v39 = v41;
        }
      }
      if (prime <= v39) {
        size_t prime = v39;
      }
      if (prime < *(void *)&v38) {
LABEL_68:
      }
        sub_2529C9058(a1, prime);
    }
    unint64_t v12 = *(void *)(a1 + 8);
    unint64_t v42 = v12 - 1;
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v11 >= v12)
      {
        unint64_t v4 = v11 % v12;
        unint64_t v32 = *(void **)(*(void *)a1 + 8 * (v11 % v12));
        unint64_t v33 = (void *)v45[0];
        if (v32) {
          goto LABEL_57;
        }
      }
      else
      {
        unint64_t v4 = v11;
        unint64_t v32 = *(void **)(*(void *)a1 + 8 * v11);
        unint64_t v33 = (void *)v45[0];
        if (v32) {
          goto LABEL_57;
        }
      }
    }
    else
    {
      unint64_t v4 = v42 & v11;
      unint64_t v32 = *(void **)(*(void *)a1 + 8 * (v42 & v11));
      unint64_t v33 = (void *)v45[0];
      if (v32) {
        goto LABEL_57;
      }
    }
LABEL_81:
    *unint64_t v33 = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v45[0];
    *(void *)(*(void *)a1 + 8 * v4) = a1 + 16;
    if (*(void *)v45[0])
    {
      unint64_t v43 = *(void *)(*(void *)v45[0] + 8);
      if ((v12 & (v12 - 1)) != 0)
      {
        if (v43 >= v12) {
          v43 %= v12;
        }
      }
      else
      {
        v43 &= v12 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v43) = v45[0];
    }
    goto LABEL_92;
  }
  unint64_t v32 = *(void **)(*(void *)a1 + 8 * v4);
  unint64_t v33 = (void *)v45[0];
  if (!v32) {
    goto LABEL_81;
  }
LABEL_57:
  *unint64_t v33 = *v32;
  *unint64_t v32 = v45[0];
LABEL_92:
  char v15 = (uint64_t *)v45[0];
  ++*(void *)(a1 + 24);
  return v15;
}

void sub_2529CA17C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_2529C9794((uint64_t *)va, 0);
  _Unwind_Resume(a1);
}

void sub_2529CA194(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_2529C9794((uint64_t *)va, 0);
  _Unwind_Resume(a1);
}

uint64_t *sub_2529CA1B0(uint64_t a1, uint64_t a2, long long *a3)
{
  int v5 = (unsigned char *)a2;
  unint64_t v7 = *(void *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    unint64_t v8 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(void *)a2;
    unint64_t v8 = v7;
  }
  unint64_t v9 = sub_2529C7A48((uint64_t)v41, (uint64_t *)a2, v8);
  unint64_t v10 = v9;
  unint64_t v11 = *(void *)(a1 + 8);
  if (v11)
  {
    uint8x8_t v12 = (uint8x8_t)vcnt_s8((int8x8_t)v11);
    v12.i16[0] = vaddlv_u8(v12);
    if (v12.u32[0] > 1uLL)
    {
      unint64_t v3 = v9;
      if (v9 >= v11) {
        unint64_t v3 = v9 % v11;
      }
    }
    else
    {
      unint64_t v3 = (v11 - 1) & v9;
    }
    uint8x8_t v13 = *(uint64_t ***)(*(void *)a1 + 8 * v3);
    if (v13)
    {
      int64_t v14 = *v13;
      if (*v13)
      {
        char v15 = v5[23];
        if (v15 >= 0) {
          uint64_t v16 = v5[23];
        }
        else {
          uint64_t v16 = *((void *)v5 + 1);
        }
        if (v15 < 0) {
          int v5 = *(unsigned char **)v5;
        }
        if (v12.u32[0] < 2uLL)
        {
          while (1)
          {
            uint64_t v21 = v14[1];
            if (v21 == v10)
            {
              uint64_t v22 = *((unsigned __int8 *)v14 + 39);
              if ((v22 & 0x80u) == 0) {
                uint64_t v23 = *((unsigned __int8 *)v14 + 39);
              }
              else {
                uint64_t v23 = v14[3];
              }
              if (v23 == v16)
              {
                if ((v22 & 0x80) != 0)
                {
                  if (!memcmp((const void *)v14[2], v5, v14[3])) {
                    return v14;
                  }
                }
                else
                {
                  if (!*((unsigned char *)v14 + 39)) {
                    return v14;
                  }
                  uint64_t v24 = 0;
                  while (*((unsigned __int8 *)v14 + v24 + 16) == v5[v24])
                  {
                    if (v22 == ++v24) {
                      return v14;
                    }
                  }
                }
              }
            }
            else if ((v21 & (v11 - 1)) != v3)
            {
              goto LABEL_51;
            }
            int64_t v14 = (uint64_t *)*v14;
            if (!v14) {
              goto LABEL_51;
            }
          }
        }
        do
        {
          unint64_t v17 = v14[1];
          if (v17 == v10)
          {
            uint64_t v18 = *((unsigned __int8 *)v14 + 39);
            if ((v18 & 0x80u) == 0) {
              uint64_t v19 = *((unsigned __int8 *)v14 + 39);
            }
            else {
              uint64_t v19 = v14[3];
            }
            if (v19 == v16)
            {
              if ((v18 & 0x80) != 0)
              {
                if (!memcmp((const void *)v14[2], v5, v14[3])) {
                  return v14;
                }
              }
              else
              {
                if (!*((unsigned char *)v14 + 39)) {
                  return v14;
                }
                uint64_t v20 = 0;
                while (*((unsigned __int8 *)v14 + v20 + 16) == v5[v20])
                {
                  if (v18 == ++v20) {
                    return v14;
                  }
                }
              }
            }
          }
          else
          {
            if (v17 >= v11) {
              v17 %= v11;
            }
            if (v17 != v3) {
              break;
            }
          }
          int64_t v14 = (uint64_t *)*v14;
        }
        while (v14);
      }
    }
  }
LABEL_51:
  uint64_t v25 = operator new(0x60uLL);
  v41[0] = v25;
  v41[1] = a1 + 16;
  char v42 = 0;
  void *v25 = 0;
  v25[1] = v10;
  sub_2529CA60C(v25 + 2, a3);
  char v42 = 1;
  float v26 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v27 = *(float *)(a1 + 32);
  if (!v11 || (float)(v27 * (float)v11) < v26)
  {
    BOOL v30 = 1;
    if (v11 >= 3) {
      BOOL v30 = (v11 & (v11 - 1)) != 0;
    }
    unint64_t v31 = v30 | (2 * v11);
    unint64_t v32 = vcvtps_u32_f32(v26 / v27);
    if (v31 <= v32) {
      size_t prime = v32;
    }
    else {
      size_t prime = v31;
    }
    if (prime == 1)
    {
      size_t prime = 2;
    }
    else if ((prime & (prime - 1)) != 0)
    {
      size_t prime = std::__next_prime(prime);
    }
    int8x8_t v34 = *(int8x8_t *)(a1 + 8);
    if (prime > *(void *)&v34) {
      goto LABEL_65;
    }
    if (prime < *(void *)&v34)
    {
      unint64_t v35 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
      if (*(void *)&v34 < 3uLL || (uint8x8_t v36 = (uint8x8_t)vcnt_s8(v34), v36.i16[0] = vaddlv_u8(v36), v36.u32[0] > 1uLL))
      {
        unint64_t v35 = std::__next_prime(v35);
      }
      else
      {
        uint64_t v37 = 1 << -(char)__clz(v35 - 1);
        if (v35 >= 2) {
          unint64_t v35 = v37;
        }
      }
      if (prime <= v35) {
        size_t prime = v35;
      }
      if (prime < *(void *)&v34) {
LABEL_65:
      }
        sub_2529C9058(a1, prime);
    }
    unint64_t v11 = *(void *)(a1 + 8);
    unint64_t v38 = v11 - 1;
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v10 >= v11)
      {
        unint64_t v3 = v10 % v11;
        uint64_t v28 = *(void **)(*(void *)a1 + 8 * (v10 % v11));
        long long v29 = (void *)v41[0];
        if (v28) {
          goto LABEL_54;
        }
      }
      else
      {
        unint64_t v3 = v10;
        uint64_t v28 = *(void **)(*(void *)a1 + 8 * v10);
        long long v29 = (void *)v41[0];
        if (v28) {
          goto LABEL_54;
        }
      }
    }
    else
    {
      unint64_t v3 = v38 & v10;
      uint64_t v28 = *(void **)(*(void *)a1 + 8 * (v38 & v10));
      long long v29 = (void *)v41[0];
      if (v28) {
        goto LABEL_54;
      }
    }
LABEL_78:
    *long long v29 = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v41[0];
    *(void *)(*(void *)a1 + 8 * v3) = a1 + 16;
    if (*(void *)v41[0])
    {
      unint64_t v39 = *(void *)(*(void *)v41[0] + 8);
      if ((v11 & (v11 - 1)) != 0)
      {
        if (v39 >= v11) {
          v39 %= v11;
        }
      }
      else
      {
        v39 &= v11 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v39) = v41[0];
    }
    goto LABEL_89;
  }
  uint64_t v28 = *(void **)(*(void *)a1 + 8 * v3);
  long long v29 = (void *)v41[0];
  if (!v28) {
    goto LABEL_78;
  }
LABEL_54:
  *long long v29 = *v28;
  *uint64_t v28 = v41[0];
LABEL_89:
  int64_t v14 = (uint64_t *)v41[0];
  ++*(void *)(a1 + 24);
  return v14;
}

void sub_2529CA5D8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_2529C9794((uint64_t *)va, 0);
  _Unwind_Resume(a1);
}

void sub_2529CA5F0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_2529C9794((uint64_t *)va, 0);
  _Unwind_Resume(a1);
}

void *sub_2529CA60C(void *__dst, long long *a2)
{
  if (*((char *)a2 + 23) < 0)
  {
    sub_2529C9C60(__dst, *(void **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v4 = *a2;
    __dst[2] = *((void *)a2 + 2);
    *(_OWORD *)__dst = v4;
  }
  int v5 = *((_DWORD *)a2 + 8);
  __dst[5] = 0;
  __dst[3] = &unk_2702DD568;
  *((_DWORD *)__dst + 8) = v5;
  __dst[6] = 0;
  __dst[7] = 0;
  unint64_t v7 = (unsigned char *)*((void *)a2 + 5);
  uint64_t v6 = (unsigned char *)*((void *)a2 + 6);
  int64_t v8 = v6 - v7;
  if (v6 != v7)
  {
    if (v8 < 0) {
      sub_2529C1558();
    }
    unint64_t v9 = (char *)operator new(v6 - v7);
    __dst[5] = v9;
    __dst[6] = v9;
    unint64_t v10 = &v9[8 * (v8 >> 3)];
    __dst[7] = v10;
    memcpy(v9, v7, v8);
    __dst[6] = v10;
  }
  uint64_t v11 = *((void *)a2 + 9);
  __dst[8] = *((void *)a2 + 8);
  __dst[9] = v11;
  if (v11) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v11 + 8), 1uLL, memory_order_relaxed);
  }
  return __dst;
}

void sub_2529CA6FC(_Unwind_Exception *a1)
{
  long long v4 = *v2;
  if (*v2)
  {
    *(void *)(v1 + 48) = v4;
    operator delete(v4);
  }
  sub_2529D7F0C((void **)v1);
  _Unwind_Resume(a1);
}

void *sub_2529CA720(void *a1, uint64_t a2, unint64_t a3)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a3)
  {
    if (a3 >= 0xAAAAAAAAAAAAAABLL) {
      sub_2529C1558();
    }
    uint64_t v5 = 24 * a3;
    uint64_t v6 = (char *)operator new(24 * a3);
    uint64_t v7 = 0;
    *a1 = v6;
    a1[1] = v6;
    a1[2] = &v6[v5];
    do
    {
      unint64_t v9 = &v6[v7];
      unint64_t v10 = (long long *)(a2 + v7);
      if (*(char *)(a2 + v7 + 23) < 0)
      {
        sub_2529C9C60(v9, *(void **)v10, *((void *)v10 + 1));
      }
      else
      {
        long long v8 = *v10;
        *((void *)v9 + 2) = *((void *)v10 + 2);
        *(_OWORD *)unint64_t v9 = v8;
      }
      v7 += 24;
    }
    while (v5 != v7);
    a1[1] = &v6[v7];
  }
  return a1;
}

void sub_2529CA7FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
}

void sub_2529CA810(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  for (; v11; v11 -= 24)
  {
    if (*(char *)(v10 + v11 - 1) < 0) {
      operator delete(*(void **)(v10 + v11 - 24));
    }
  }
  *(void *)(v9 + 8) = v10;
  sub_2529CA84C(&a9);
  _Unwind_Resume(a1);
}

void ***sub_2529CA84C(void ***result)
{
  uint64_t v1 = result;
  if (!*((unsigned char *)result + 8))
  {
    uint64_t v2 = *result;
    unint64_t v3 = (void **)**result;
    if (v3)
    {
      long long v4 = (void **)v2[1];
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

void sub_2529CA8E4(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_2702DD840;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_2529CA904(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_2702DD840;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x2533C48B0);
}

uint64_t sub_2529CA958(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void sub_2529CA980(uint64_t a1, void *a2, const char **a3)
{
  long long v4 = *a3;
  size_t v5 = strlen(*a3);
  if (v5 >= 0x7FFFFFFFFFFFFFF8) {
    sub_2529C1D00();
  }
  size_t v6 = v5;
  if (v5 >= 0x17)
  {
    uint64_t v8 = (v5 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v5 | 7) != 0x17) {
      uint64_t v8 = v5 | 7;
    }
    uint64_t v9 = v8 + 1;
    p_dst = (long long *)operator new(v8 + 1);
    *((void *)&__dst + 1) = v6;
    unint64_t v35 = v9 | 0x8000000000000000;
    *(void *)&long long __dst = p_dst;
    goto LABEL_8;
  }
  HIBYTE(v35) = v5;
  p_dst = &__dst;
  if (v5) {
LABEL_8:
  }
    memmove(p_dst, v4, v6);
  *((unsigned char *)p_dst + v6) = 0;
  char v21 = 0;
  char v22 = 0;
  char v23 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  unint64_t v17 = 0;
  char v20 = 0;
  uint64_t v24 = 0xFFFFFFFFLL;
  char v25 = 0;
  char v26 = 0;
  char v27 = 0;
  char v28 = 0;
  *(_OWORD *)long long v29 = 0u;
  *(_OWORD *)BOOL v30 = 0u;
  int v31 = 1065353216;
  char v33 = 0;
  LOBYTE(__p) = 0;
  *a2 = &unk_2702DD890;
  uint64_t v10 = operator new(0x128uLL);
  v10[1] = 0;
  v10[2] = 0;
  void *v10 = &unk_2702DD8C0;
  a2[1] = sub_2529CAE00((uint64_t)(v10 + 3), &__dst, (uint64_t)&v17);
  a2[2] = v10;
  if (v33 < 0) {
    operator delete(__p);
  }
  uint64_t v11 = (void **)v30[0];
  if (v30[0])
  {
    do
    {
      uint64_t v16 = (void **)*v11;
      if (*((char *)v11 + 39) < 0) {
        operator delete(v11[2]);
      }
      operator delete(v11);
      uint64_t v11 = v16;
    }
    while (v16);
  }
  uint8x8_t v12 = v29[0];
  v29[0] = 0;
  if (v12) {
    operator delete(v12);
  }
  uint8x8_t v13 = (void **)v17;
  if (v17)
  {
    int64_t v14 = v18;
    char v15 = v17;
    if (v18 != v17)
    {
      do
      {
        if (*((char *)v14 - 1) < 0) {
          operator delete(*(v14 - 3));
        }
        v14 -= 3;
      }
      while (v14 != v13);
      char v15 = v17;
    }
    uint64_t v18 = v13;
    operator delete(v15);
  }
  if (SHIBYTE(v35) < 0) {
    operator delete((void *)__dst);
  }
}

void sub_2529CAB9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::__shared_weak_count::~__shared_weak_count(v9);
  operator delete(v12);
  sub_2529CBE9C((uint64_t)&a9);
  if (*(char *)(v10 - 49) < 0) {
    operator delete(*(void **)(v10 - 72));
  }
  _Unwind_Resume(a1);
}

uint64_t sub_2529CABD4(uint64_t a1)
{
  uint64_t v2 = *(void ***)(a1 + 16);
  if (v2)
  {
    do
    {
      size_t v5 = (void **)*v2;
      if (*((char *)v2 + 39) < 0) {
        operator delete(v2[2]);
      }
      operator delete(v2);
      uint64_t v2 = v5;
    }
    while (v5);
  }
  unint64_t v3 = *(void **)a1;
  *(void *)a1 = 0;
  if (v3) {
    operator delete(v3);
  }
  return a1;
}

void *sub_2529CAC40(void *result)
{
  uint64_t v1 = result;
  *unint64_t result = &unk_2702DD890;
  uint64_t v2 = (std::__shared_weak_count *)result[2];
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

void sub_2529CACD8(void *a1)
{
  *a1 = &unk_2702DD890;
  uint64_t v1 = (std::__shared_weak_count *)a1[2];
  if (v1 && !atomic_fetch_add(&v1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
    std::__shared_weak_count::__release_weak(v1);
  }

  JUMPOUT(0x2533C48B0);
}

void sub_2529CAD80(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_2702DD8C0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_2529CADA0(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_2702DD8C0;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x2533C48B0);
}

uint64_t sub_2529CADF4(uint64_t a1)
{
  return sub_2529CBE24(a1 + 24);
}

uint64_t sub_2529CAE00(uint64_t a1, long long *a2, uint64_t a3)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  *(void *)a1 = 0;
  *(_DWORD *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  size_t v6 = (uint64_t *)(a1 + 16);
  *(void *)(a1 + 24) = 0;
  if (*((char *)a2 + 23) < 0)
  {
    sub_2529C9C60((unsigned char *)(a1 + 32), *(void **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v7 = *a2;
    *(void *)(a1 + 48) = *((void *)a2 + 2);
    *(_OWORD *)(a1 + 32) = v7;
  }
  sub_2529CB56C(a1 + 56, a3);
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_DWORD *)(a1 + 224) = 1065353216;
  *(_OWORD *)(a1 + 232) = 0u;
  *(_OWORD *)(a1 + 248) = 0u;
  *(_DWORD *)(a1 + 264) = 1065353216;
  if (!*(unsigned char *)(a3 + 28) && qword_269C3FA98 != -1) {
    dispatch_once(&qword_269C3FA98, &unk_2702DD900);
  }
  uint64_t context = espresso_create_context();
  uint64_t *v6 = context;
  if (!context)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Failed to create espresso context.");
    goto LABEL_63;
  }
  uint64_t plan = espresso_create_plan();
  *(void *)(a1 + 24) = plan;
  if (!plan)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Failed to create espresso plan.");
LABEL_63:
    exception->__vftable = (std::runtime_error_vtbl *)&unk_2702DD7B8;
    __cxa_throw(exception, (struct type_info *)&unk_2702DD790, (void (*)(void *))std::runtime_error::~runtime_error);
  }
  if (*(unsigned char *)(a3 + 52)
    && (LODWORD(__dst.__r_.__value_.__l.__data_) = espresso_plan_set_priority(),
        HIBYTE(__p[2]) = 20,
        strcpy((char *)__p, "Setting plan priorty"),
        sub_2529C8564((int *)&__dst, (uint64_t *)__p),
        SHIBYTE(__p[2]) < 0))
  {
    operator delete(__p[0]);
    if ((*((char *)a2 + 23) & 0x80000000) == 0) {
      goto LABEL_12;
    }
  }
  else if ((*((char *)a2 + 23) & 0x80000000) == 0)
  {
LABEL_12:
    *(_OWORD *)__p = *a2;
    __p[2] = *((void **)a2 + 2);
    goto LABEL_15;
  }
  sub_2529C9C60(__p, *(void **)a2, *((void *)a2 + 1));
LABEL_15:
  int v10 = *(char *)(a3 + 135);
  if (v10 >= 0) {
    std::string::size_type v11 = *(unsigned __int8 *)(a3 + 135);
  }
  else {
    std::string::size_type v11 = *(void *)(a3 + 120);
  }
  if (!v11) {
    goto LABEL_40;
  }
  int v12 = SHIBYTE(__p[2]);
  if (SHIBYTE(__p[2]) >= 0) {
    size_t v13 = HIBYTE(__p[2]);
  }
  else {
    size_t v13 = (size_t)__p[1];
  }
  unint64_t v14 = v13 + 1;
  if (v13 + 1 >= 0x7FFFFFFFFFFFFFF8) {
    sub_2529C1D00();
  }
  if (v14 >= 0x17)
  {
    uint64_t v16 = (v14 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v14 | 7) != 0x17) {
      uint64_t v16 = v14 | 7;
    }
    uint64_t v17 = v16 + 1;
    p_dst = (std::string *)operator new(v16 + 1);
    __dst.__r_.__value_.__l.__size_ = v13 + 1;
    __dst.__r_.__value_.__r.__words[2] = v17 | 0x8000000000000000;
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)p_dst;
    goto LABEL_29;
  }
  memset(&__dst, 0, sizeof(__dst));
  p_dst = &__dst;
  *((unsigned char *)&__dst.__r_.__value_.__s + 23) = v13 + 1;
  if (v13)
  {
LABEL_29:
    if (v12 >= 0) {
      uint64_t v18 = __p;
    }
    else {
      uint64_t v18 = (void **)__p[0];
    }
    memmove(p_dst, v18, v13);
  }
  *(_WORD *)((char *)&p_dst->__r_.__value_.__l.__data_ + v13) = 58;
  if (v10 >= 0) {
    uint64_t v19 = (const std::string::value_type *)(a3 + 112);
  }
  else {
    uint64_t v19 = *(const std::string::value_type **)(a3 + 112);
  }
  char v20 = std::string::append(&__dst, v19, v11);
  char v21 = (void *)v20->__r_.__value_.__r.__words[0];
  *(void *)&long long v31 = v20->__r_.__value_.__l.__size_;
  *(void *)((char *)&v31 + 7) = *(std::string::size_type *)((char *)&v20->__r_.__value_.__r.__words[1] + 7);
  char v22 = HIBYTE(v20->__r_.__value_.__r.__words[2]);
  v20->__r_.__value_.__l.__size_ = 0;
  v20->__r_.__value_.__r.__words[2] = 0;
  v20->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(__p[2]) < 0) {
    operator delete(__p[0]);
  }
  __p[0] = v21;
  __p[1] = (void *)v31;
  *(void **)((char *)&__p[1] + 7) = *(void **)((char *)&v31 + 7);
  HIBYTE(__p[2]) = v22;
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__dst.__r_.__value_.__l.__data_);
  }
LABEL_40:
  LODWORD(v31) = espresso_plan_add_network();
  __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)operator new(0x20uLL);
  *(_OWORD *)&__dst.__r_.__value_.__r.__words[1] = xmmword_2529D98A0;
  strcpy(__dst.__r_.__value_.__l.__data_, "Loading espresso Network");
  sub_2529C8564((int *)&v31, (uint64_t *)&__dst);
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__dst.__r_.__value_.__l.__data_);
    if (!*(unsigned char *)(a3 + 64)) {
      goto LABEL_45;
    }
  }
  else if (!*(unsigned char *)(a3 + 64))
  {
    goto LABEL_45;
  }
  LODWORD(v31) = espresso_plan_share_intermediate_buffer();
  __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)operator new(0x20uLL);
  *(_OWORD *)&__dst.__r_.__value_.__r.__words[1] = xmmword_2529D98B0;
  strcpy(__dst.__r_.__value_.__l.__data_, "Sharing intermediate buffer");
  sub_2529C8564((int *)&v31, (uint64_t *)&__dst);
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__dst.__r_.__value_.__l.__data_);
    uint64_t v24 = *(void *)a3;
    uint64_t v23 = *(void *)(a3 + 8);
    if (*(void *)a3 == v23) {
      goto LABEL_51;
    }
    goto LABEL_48;
  }
LABEL_45:
  uint64_t v24 = *(void *)a3;
  uint64_t v23 = *(void *)(a3 + 8);
  if (*(void *)a3 == v23) {
    goto LABEL_51;
  }
  do
  {
LABEL_48:
    LODWORD(v31) = espresso_network_declare_output();
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)operator new(0x20uLL);
    *(_OWORD *)&__dst.__r_.__value_.__r.__words[1] = xmmword_2529D98A0;
    strcpy(__dst.__r_.__value_.__l.__data_, "Declaring network output");
    sub_2529C8564((int *)&v31, (uint64_t *)&__dst);
    if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__dst.__r_.__value_.__l.__data_);
    }
    v24 += 24;
  }
  while (v24 != v23);
LABEL_51:
  for (i = *(uint64_t **)(a3 + 88); i; i = (uint64_t *)*i)
  {
    long long v31 = *(_OWORD *)(i + 5);
    int v32 = *((_DWORD *)i + 14);
    int v28 = espresso_set_image_preprocessing_params();
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)operator new(0x20uLL);
    *(_OWORD *)&__dst.__r_.__value_.__r.__words[1] = xmmword_2529D98C0;
    strcpy(__dst.__r_.__value_.__l.__data_, "Setting preprocessing params");
    sub_2529C8564(&v28, (uint64_t *)&__dst);
    if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__dst.__r_.__value_.__l.__data_);
    }
  }
  LODWORD(v31) = espresso_plan_build();
  strcpy((char *)&__dst, "Building espresso plan");
  *((unsigned char *)&__dst.__r_.__value_.__s + 23) = 22;
  sub_2529C8564((int *)&v31, (uint64_t *)&__dst);
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__dst.__r_.__value_.__l.__data_);
    if ((SHIBYTE(__p[2]) & 0x80000000) == 0) {
      return a1;
    }
LABEL_60:
    operator delete(__p[0]);
    return a1;
  }
  if (SHIBYTE(__p[2]) < 0) {
    goto LABEL_60;
  }
  return a1;
}

void sub_2529CB45C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void **a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22,uint64_t a23,void *a24,uint64_t a25,int a26,__int16 a27,char a28,char a29)
{
  sub_2529C988C(a10);
  sub_2529C988C(a11);
  sub_2529CBE9C(a12);
  if (*(char *)(v29 + 55) < 0) {
    operator delete(*a9);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_2529CB56C(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  sub_2529CB6B8((char *)a1, *(void *)a2, *(void *)(a2 + 8), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a2 + 8) - *(void *)a2) >> 3));
  long long v4 = *(_OWORD *)(a2 + 24);
  long long v5 = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 49) = *(_OWORD *)(a2 + 49);
  *(_OWORD *)(a1 + 40) = v5;
  *(_OWORD *)(a1 + 24) = v4;
  sub_2529CB7EC(a1 + 72, a2 + 72);
  size_t v6 = (unsigned char *)(a1 + 112);
  if (*(char *)(a2 + 135) < 0)
  {
    sub_2529C9C60(v6, *(void **)(a2 + 112), *(void *)(a2 + 120));
  }
  else
  {
    long long v7 = *(_OWORD *)(a2 + 112);
    *(void *)(a1 + 128) = *(void *)(a2 + 128);
    *(_OWORD *)size_t v6 = v7;
  }
  return a1;
}

void sub_2529CB628(_Unwind_Exception *exception_object)
{
  long long v4 = (void **)v1[11];
  if (v4) {
    sub_2529D7FD4(v4);
  }
  long long v5 = *v2;
  std::__shared_weak_count *v2 = 0;
  if (v5)
  {
    operator delete(v5);
    size_t v6 = (void **)*v1;
    if (!*v1) {
LABEL_5:
    }
      _Unwind_Resume(exception_object);
  }
  else
  {
    size_t v6 = (void **)*v1;
    if (!*v1) {
      goto LABEL_5;
    }
  }
  long long v7 = (void **)v1[1];
  uint64_t v8 = v6;
  if (v7 != v6)
  {
    do
    {
      if (*((char *)v7 - 1) < 0) {
        operator delete(*(v7 - 3));
      }
      v7 -= 3;
    }
    while (v7 != v6);
    uint64_t v8 = *v1;
  }
  v1[1] = v6;
  operator delete(v8);
  _Unwind_Resume(exception_object);
}

char *sub_2529CB6B8(char *result, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    long long v5 = result;
    if (a4 >= 0xAAAAAAAAAAAAAABLL) {
      sub_2529C1558();
    }
    unint64_t result = (char *)operator new(24 * a4);
    uint64_t v8 = result;
    *long long v5 = result;
    v5[1] = result;
    v5[2] = &result[24 * a4];
    if (a2 != a3)
    {
      uint64_t v9 = 0;
      do
      {
        unint64_t result = &v8[v9];
        uint64_t v10 = a2 + v9;
        if (*(char *)(a2 + v9 + 23) < 0)
        {
          unint64_t result = (char *)sub_2529C9C60(result, *(void **)v10, *(void *)(v10 + 8));
        }
        else
        {
          *(_OWORD *)unint64_t result = *(_OWORD *)v10;
          *((void *)result + 2) = *(void *)(v10 + 16);
        }
        v9 += 24;
      }
      while (a2 + v9 != a3);
      v8 += v9;
    }
    v5[1] = v8;
  }
  return result;
}

void sub_2529CB79C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
}

void sub_2529CB7B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  for (; v11; v11 -= 24)
  {
    if (*(char *)(v10 + v11 - 1) < 0) {
      operator delete(*(void **)(v10 + v11 - 24));
    }
  }
  *(void *)(v9 + 8) = v10;
  sub_2529CA84C(&a9);
  _Unwind_Resume(a1);
}

uint64_t sub_2529CB7EC(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  size_t prime = *(void *)(a2 + 8);
  if (prime == 1)
  {
    size_t prime = 2;
LABEL_17:
    sub_2529C9058(a1, prime);
    goto LABEL_18;
  }
  if ((prime & (prime - 1)) != 0)
  {
    size_t prime = std::__next_prime(*(void *)(a2 + 8));
    int8x8_t v5 = *(int8x8_t *)(a1 + 8);
    BOOL v6 = prime >= *(void *)&v5;
    if (prime > *(void *)&v5) {
      goto LABEL_17;
    }
  }
  else
  {
    int8x8_t v5 = 0;
    BOOL v6 = 1;
    if (prime) {
      goto LABEL_17;
    }
  }
  if (!v6)
  {
    unint64_t v7 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v5 < 3uLL || (uint8x8_t v8 = (uint8x8_t)vcnt_s8(v5), v8.i16[0] = vaddlv_u8(v8), v8.u32[0] > 1uLL))
    {
      unint64_t v7 = std::__next_prime(v7);
    }
    else
    {
      uint64_t v9 = 1 << -(char)__clz(v7 - 1);
      if (v7 >= 2) {
        unint64_t v7 = v9;
      }
    }
    if (prime <= v7) {
      size_t prime = v7;
    }
    if (prime < *(void *)&v5) {
      goto LABEL_17;
    }
  }
LABEL_18:
  for (i = *(void **)(a2 + 16); i; i = (void *)*i)
    sub_2529CB930(a1, (uint64_t)(i + 2), (uint64_t)(i + 2));
  return a1;
}

void sub_2529CB908(_Unwind_Exception *a1)
{
  sub_2529CABD4(v1);
  _Unwind_Resume(a1);
}

void sub_2529CB91C(_Unwind_Exception *a1)
{
  sub_2529CABD4(v1);
  _Unwind_Resume(a1);
}

uint64_t *sub_2529CB930(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int8x8_t v5 = (unsigned char *)a2;
  unint64_t v7 = *(void *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    unint64_t v8 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(void *)a2;
    unint64_t v8 = v7;
  }
  unint64_t v9 = sub_2529C7A48((uint64_t)v42, (uint64_t *)a2, v8);
  unint64_t v10 = v9;
  unint64_t v11 = *(void *)(a1 + 8);
  if (v11)
  {
    uint8x8_t v12 = (uint8x8_t)vcnt_s8((int8x8_t)v11);
    v12.i16[0] = vaddlv_u8(v12);
    if (v12.u32[0] > 1uLL)
    {
      unint64_t v3 = v9;
      if (v9 >= v11) {
        unint64_t v3 = v9 % v11;
      }
    }
    else
    {
      unint64_t v3 = (v11 - 1) & v9;
    }
    size_t v13 = *(uint64_t ***)(*(void *)a1 + 8 * v3);
    if (v13)
    {
      unint64_t v14 = *v13;
      if (*v13)
      {
        char v15 = v5[23];
        if (v15 >= 0) {
          uint64_t v16 = v5[23];
        }
        else {
          uint64_t v16 = *((void *)v5 + 1);
        }
        if (v15 < 0) {
          int8x8_t v5 = *(unsigned char **)v5;
        }
        if (v12.u32[0] < 2uLL)
        {
          while (1)
          {
            uint64_t v21 = v14[1];
            if (v21 == v10)
            {
              uint64_t v22 = *((unsigned __int8 *)v14 + 39);
              if ((v22 & 0x80u) == 0) {
                uint64_t v23 = *((unsigned __int8 *)v14 + 39);
              }
              else {
                uint64_t v23 = v14[3];
              }
              if (v23 == v16)
              {
                if ((v22 & 0x80) != 0)
                {
                  if (!memcmp((const void *)v14[2], v5, v14[3])) {
                    return v14;
                  }
                }
                else
                {
                  if (!*((unsigned char *)v14 + 39)) {
                    return v14;
                  }
                  uint64_t v24 = 0;
                  while (*((unsigned __int8 *)v14 + v24 + 16) == v5[v24])
                  {
                    if (v22 == ++v24) {
                      return v14;
                    }
                  }
                }
              }
            }
            else if ((v21 & (v11 - 1)) != v3)
            {
              goto LABEL_51;
            }
            unint64_t v14 = (uint64_t *)*v14;
            if (!v14) {
              goto LABEL_51;
            }
          }
        }
        do
        {
          unint64_t v17 = v14[1];
          if (v17 == v10)
          {
            uint64_t v18 = *((unsigned __int8 *)v14 + 39);
            if ((v18 & 0x80u) == 0) {
              uint64_t v19 = *((unsigned __int8 *)v14 + 39);
            }
            else {
              uint64_t v19 = v14[3];
            }
            if (v19 == v16)
            {
              if ((v18 & 0x80) != 0)
              {
                if (!memcmp((const void *)v14[2], v5, v14[3])) {
                  return v14;
                }
              }
              else
              {
                if (!*((unsigned char *)v14 + 39)) {
                  return v14;
                }
                uint64_t v20 = 0;
                while (*((unsigned __int8 *)v14 + v20 + 16) == v5[v20])
                {
                  if (v18 == ++v20) {
                    return v14;
                  }
                }
              }
            }
          }
          else
          {
            if (v17 >= v11) {
              v17 %= v11;
            }
            if (v17 != v3) {
              break;
            }
          }
          unint64_t v14 = (uint64_t *)*v14;
        }
        while (v14);
      }
    }
  }
LABEL_51:
  char v25 = (char *)operator new(0x40uLL);
  v42[0] = v25;
  v42[1] = a1 + 16;
  char v43 = 0;
  *(void *)char v25 = 0;
  *((void *)v25 + 1) = v10;
  char v26 = v25 + 16;
  if (*(char *)(a3 + 23) < 0)
  {
    sub_2529C9C60(v26, *(void **)a3, *(void *)(a3 + 8));
  }
  else
  {
    *(_OWORD *)char v26 = *(_OWORD *)a3;
    *((void *)v25 + 4) = *(void *)(a3 + 16);
  }
  *(_OWORD *)(v25 + 40) = *(_OWORD *)(a3 + 24);
  *((_DWORD *)v25 + 14) = *(_DWORD *)(a3 + 40);
  char v43 = 1;
  float v27 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v28 = *(float *)(a1 + 32);
  if (!v11 || (float)(v28 * (float)v11) < v27)
  {
    BOOL v31 = 1;
    if (v11 >= 3) {
      BOOL v31 = (v11 & (v11 - 1)) != 0;
    }
    unint64_t v32 = v31 | (2 * v11);
    unint64_t v33 = vcvtps_u32_f32(v27 / v28);
    if (v32 <= v33) {
      size_t prime = v33;
    }
    else {
      size_t prime = v32;
    }
    if (prime == 1)
    {
      size_t prime = 2;
    }
    else if ((prime & (prime - 1)) != 0)
    {
      size_t prime = std::__next_prime(prime);
    }
    int8x8_t v35 = *(int8x8_t *)(a1 + 8);
    if (prime > *(void *)&v35) {
      goto LABEL_68;
    }
    if (prime < *(void *)&v35)
    {
      unint64_t v36 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
      if (*(void *)&v35 < 3uLL || (uint8x8_t v37 = (uint8x8_t)vcnt_s8(v35), v37.i16[0] = vaddlv_u8(v37), v37.u32[0] > 1uLL))
      {
        unint64_t v36 = std::__next_prime(v36);
      }
      else
      {
        uint64_t v38 = 1 << -(char)__clz(v36 - 1);
        if (v36 >= 2) {
          unint64_t v36 = v38;
        }
      }
      if (prime <= v36) {
        size_t prime = v36;
      }
      if (prime < *(void *)&v35) {
LABEL_68:
      }
        sub_2529C9058(a1, prime);
    }
    unint64_t v11 = *(void *)(a1 + 8);
    unint64_t v39 = v11 - 1;
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v10 >= v11)
      {
        unint64_t v3 = v10 % v11;
        uint64_t v29 = *(void **)(*(void *)a1 + 8 * (v10 % v11));
        BOOL v30 = (void *)v42[0];
        if (v29) {
          goto LABEL_57;
        }
      }
      else
      {
        unint64_t v3 = v10;
        uint64_t v29 = *(void **)(*(void *)a1 + 8 * v10);
        BOOL v30 = (void *)v42[0];
        if (v29) {
          goto LABEL_57;
        }
      }
    }
    else
    {
      unint64_t v3 = v39 & v10;
      uint64_t v29 = *(void **)(*(void *)a1 + 8 * (v39 & v10));
      BOOL v30 = (void *)v42[0];
      if (v29) {
        goto LABEL_57;
      }
    }
LABEL_81:
    *BOOL v30 = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v42[0];
    *(void *)(*(void *)a1 + 8 * v3) = a1 + 16;
    if (*(void *)v42[0])
    {
      unint64_t v40 = *(void *)(*(void *)v42[0] + 8);
      if ((v11 & (v11 - 1)) != 0)
      {
        if (v40 >= v11) {
          v40 %= v11;
        }
      }
      else
      {
        v40 &= v11 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v40) = v42[0];
    }
    goto LABEL_92;
  }
  uint64_t v29 = *(void **)(*(void *)a1 + 8 * v3);
  BOOL v30 = (void *)v42[0];
  if (!v29) {
    goto LABEL_81;
  }
LABEL_57:
  *BOOL v30 = *v29;
  *uint64_t v29 = v42[0];
LABEL_92:
  unint64_t v14 = (uint64_t *)v42[0];
  ++*(void *)(a1 + 24);
  return v14;
}

void sub_2529CBD80(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_2529CBDAC((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_2529CBD94(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_2529CBDAC((uint64_t *)va);
  _Unwind_Resume(a1);
}

uint64_t *sub_2529CBDAC(uint64_t *a1)
{
  uint64_t v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    if (*((unsigned char *)a1 + 16) && *(char *)(v2 + 39) < 0) {
      operator delete(*(void **)(v2 + 16));
    }
    operator delete((void *)v2);
  }
  return a1;
}

uint64_t sub_2529CBDFC()
{
  uint64_t result = MGGetBoolAnswer();
  byte_269C3FA90 = result;
  return result;
}

uint64_t sub_2529CBE24(uint64_t a1)
{
  if (*(void *)(a1 + 24)) {
    espresso_plan_destroy();
  }
  if (*(void *)(a1 + 16)) {
    espresso_context_destroy();
  }
  sub_2529C988C(a1 + 232);
  sub_2529C988C(a1 + 192);
  sub_2529CBE9C(a1 + 56);
  if (*(char *)(a1 + 55) < 0) {
    operator delete(*(void **)(a1 + 32));
  }
  return a1;
}

uint64_t sub_2529CBE9C(uint64_t a1)
{
  if (*(char *)(a1 + 135) < 0)
  {
    operator delete(*(void **)(a1 + 112));
    uint64_t v2 = *(void ***)(a1 + 88);
    if (!v2) {
      goto LABEL_5;
    }
  }
  else
  {
    uint64_t v2 = *(void ***)(a1 + 88);
    if (!v2) {
      goto LABEL_5;
    }
  }
  do
  {
    unint64_t v7 = (void **)*v2;
    if (*((char *)v2 + 39) < 0) {
      operator delete(v2[2]);
    }
    operator delete(v2);
    uint64_t v2 = v7;
  }
  while (v7);
LABEL_5:
  unint64_t v3 = *(void **)(a1 + 72);
  *(void *)(a1 + 72) = 0;
  if (v3) {
    operator delete(v3);
  }
  long long v4 = *(void ***)a1;
  if (*(void *)a1)
  {
    int8x8_t v5 = *(void ***)(a1 + 8);
    BOOL v6 = *(void ***)a1;
    if (v5 != v4)
    {
      do
      {
        if (*((char *)v5 - 1) < 0) {
          operator delete(*(v5 - 3));
        }
        v5 -= 3;
      }
      while (v5 != v4);
      BOOL v6 = *(void ***)a1;
    }
    *(void *)(a1 + 8) = v4;
    operator delete(v6);
  }
  return a1;
}

void sub_2529CBF6C(void **a1)
{
}

void sub_2529CC07C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2529CC1A0(_Unwind_Exception *a1)
{
  BOOL v6 = v4;

  _Unwind_Resume(a1);
}

void sub_2529CC1E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2529CC200(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2529CC310(_Unwind_Exception *a1)
{
  unint64_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_2529CC328(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2529CC338(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2529CC348(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2529CC438(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2529CC450(_Unwind_Exception *a1)
{
  unint64_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_2529CC560(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2529CC584(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2529CC85C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);

  _Unwind_Resume(a1);
}

void sub_2529CC9CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2529CC9DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2529CC9F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2529CCA00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2529CCAE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2529CCAF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2529CCB0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2529CCB1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2529CCCA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2529CCCC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2529CCCD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2529CCCF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2529CCD8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2529CCDA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2529CCF24(_Unwind_Exception *a1)
{
  unint64_t v3 = *v1;
  void *v1 = 0;
  if (v3)
  {
    if (*v3) {
      CFRelease(*v3);
    }
    MEMORY[0x2533C48B0](v3, 0x20C4093837F09);
  }
  MEMORY[0x2533C48B0](v1, 0x20C4093837F09);
  _Unwind_Resume(a1);
}

void sub_2529CD0D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14)
{
  __cxa_free_exception(v15);
  MEMORY[0x2533C48B0](v14, 0x20C4093837F09);
  _Unwind_Resume(a1);
}

uint64_t sub_2529CD154(uint64_t a1, uint64_t a2)
{
  if (!*(void *)a2 || !*(void *)(a2 + 8))
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Invalid dimensions requested for CVPixelBuffer creation.");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  CVPixelBufferRef pixelBufferOut = 0;
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  uint64_t v18 = Mutable;
  if (*(unsigned char *)(a2 + 20))
  {
    CFMutableDictionaryRef v6 = CFDictionaryCreateMutable(v4, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    unint64_t v7 = (const void *)*MEMORY[0x263F04130];
    v17.__r_.__value_.__r.__words[0] = (std::string::size_type)v6;
    CFDictionarySetValue(Mutable, v7, v6);
    if (v6) {
      CFRelease(v6);
    }
  }
  if (*(unsigned char *)(a2 + 32))
  {
    CFNumberRef v8 = CFNumberCreate(v4, kCFNumberSInt64Type, (const void *)(a2 + 24));
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F04078], v8);
    CFRelease(v8);
  }
  CVReturn v9 = CVPixelBufferCreate(v4, *(void *)a2, *(void *)(a2 + 8), *(_DWORD *)(a2 + 16), Mutable, &pixelBufferOut);
  if (v9)
  {
    size_t v13 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::to_string(&v16, v9);
    uint64_t v14 = std::string::insert(&v16, 0, "Failed to create CVPixelBuffer. Status = ");
    long long v15 = *(_OWORD *)&v14->__r_.__value_.__l.__data_;
    v17.__r_.__value_.__r.__words[2] = v14->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v17.__r_.__value_.__l.__data_ = v15;
    v14->__r_.__value_.__l.__size_ = 0;
    v14->__r_.__value_.__r.__words[2] = 0;
    v14->__r_.__value_.__r.__words[0] = 0;
    std::runtime_error::runtime_error(v13, &v17);
    __cxa_throw(v13, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  unint64_t v10 = pixelBufferOut;
  if (Mutable) {
    CFRelease(Mutable);
  }
  sub_2529C6860(a1, v10);
  CVPixelBufferRelease(*(CVPixelBufferRef *)(*(void *)(a1 + 40) + 8));
  return a1;
}

void sub_2529CD360(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,const void *a23)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a15 < 0)
  {
    operator delete(a10);
    if ((v24 & 1) == 0)
    {
LABEL_8:
      sub_2529CE030(&a23);
      _Unwind_Resume(a1);
    }
  }
  else if (!v24)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v23);
  sub_2529CE030(&a23);
  _Unwind_Resume(a1);
}

CFTypeRef **sub_2529CD430(CFTypeRef **a1)
{
  uint64_t v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    if (*v2) {
      CFRelease(*v2);
    }
    MEMORY[0x2533C48B0](v2, 0x20C4093837F09);
  }
  return a1;
}

void sub_2529CD554(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2529CD578(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2529CD784(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_2529C0C18((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_2529CD820(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2529CD838(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

Class sub_2529CD98C(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!qword_269C3FAA8)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = sub_2529CDAD0;
    v4[4] = &unk_265385E28;
    v4[5] = v4;
    long long v5 = xmmword_265385E10;
    uint64_t v6 = 0;
    qword_269C3FAA8 = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!qword_269C3FAA8)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("VNCreateSceneprintRequest");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)sub_2529D8018();
LABEL_8:
    free(v2);
  }
  qword_269C3FAA0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_2529CDAD0()
{
  uint64_t result = _sl_dlopen();
  qword_269C3FAA8 = result;
  return result;
}

Class sub_2529CDB44(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!qword_269C3FAA8)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = sub_2529CDAD0;
    v4[4] = &unk_265385E28;
    v4[5] = v4;
    long long v5 = xmmword_265385E10;
    uint64_t v6 = 0;
    qword_269C3FAA8 = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!qword_269C3FAA8)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("VNImageRequestHandler");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)sub_2529D8040();
LABEL_8:
    free(v2);
  }
  qword_269C3FAB0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_2529CDC88()
{
}

void sub_2529CDD38(_Unwind_Exception *a1)
{
  __cxa_free_exception(v2);
  MEMORY[0x2533C48B0](v1, 0x20C4093837F09);
  _Unwind_Resume(a1);
}

uint64_t sub_2529CDD6C(uint64_t result, char *a2)
{
  if (result)
  {
    int v2 = result;
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    sub_2529CDF7C(&v14, a2);
    long long v5 = std::string::insert(&v14, 0, "PixelBufferTransfer operation [");
    long long v6 = *(_OWORD *)&v5->__r_.__value_.__l.__data_;
    v15.__r_.__value_.__r.__words[2] = v5->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v15.__r_.__value_.__l.__data_ = v6;
    v5->__r_.__value_.__l.__size_ = 0;
    v5->__r_.__value_.__r.__words[2] = 0;
    v5->__r_.__value_.__r.__words[0] = 0;
    uint64_t v7 = std::string::append(&v15, "] failed. Status = ");
    long long v8 = *(_OWORD *)&v7->__r_.__value_.__l.__data_;
    v16.__r_.__value_.__r.__words[2] = v7->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v16.__r_.__value_.__l.__data_ = v8;
    v7->__r_.__value_.__l.__size_ = 0;
    v7->__r_.__value_.__r.__words[2] = 0;
    v7->__r_.__value_.__r.__words[0] = 0;
    std::to_string(&v13, v2);
    if ((v13.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      CVReturn v9 = &v13;
    }
    else {
      CVReturn v9 = (std::string *)v13.__r_.__value_.__r.__words[0];
    }
    if ((v13.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type size = HIBYTE(v13.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type size = v13.__r_.__value_.__l.__size_;
    }
    unint64_t v11 = std::string::append(&v16, (const std::string::value_type *)v9, size);
    long long v12 = *(_OWORD *)&v11->__r_.__value_.__l.__data_;
    v17.__r_.__value_.__r.__words[2] = v11->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v17.__r_.__value_.__l.__data_ = v12;
    v11->__r_.__value_.__l.__size_ = 0;
    v11->__r_.__value_.__r.__words[2] = 0;
    v11->__r_.__value_.__r.__words[0] = 0;
    std::runtime_error::runtime_error(exception, &v17);
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  return result;
}

void sub_2529CDE90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,uint64_t a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33)
{
  if (*(char *)(v35 - 41) < 0)
  {
    operator delete(*(void **)(v35 - 64));
    if ((a14 & 0x80000000) == 0)
    {
LABEL_3:
      if ((a33 & 0x80000000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((a14 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(a9);
  if ((a33 & 0x80000000) == 0)
  {
LABEL_4:
    if ((a26 & 0x80000000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  operator delete(a28);
  if ((a26 & 0x80000000) == 0)
  {
LABEL_5:
    if (a20 < 0) {
      goto LABEL_6;
    }
    goto LABEL_12;
  }
LABEL_11:
  operator delete(a21);
  if (a20 < 0)
  {
LABEL_6:
    operator delete(__p);
    if ((v34 & 1) == 0) {
LABEL_14:
    }
      _Unwind_Resume(a1);
LABEL_13:
    __cxa_free_exception(v33);
    goto LABEL_14;
  }
LABEL_12:
  if (!v34) {
    goto LABEL_14;
  }
  goto LABEL_13;
}

void *sub_2529CDF7C(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    sub_2529C1D00();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    long long v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    long long v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

const void **sub_2529CE030(const void **a1)
{
  int v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void sub_2529CE068(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x2533C48B0);
}

uint64_t sub_2529CE0A0(uint64_t result)
{
  uint64_t v1 = *(CFTypeRef ***)(result + 24);
  if (v1)
  {
    int v2 = *v1;
    void *v1 = 0;
    if (v2)
    {
      if (*v2) {
        CFRelease(*v2);
      }
      MEMORY[0x2533C48B0](v2, 0x20C4093837F09);
    }
    JUMPOUT(0x2533C48B0);
  }
  return result;
}

uint64_t sub_2529CE128(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "NSt3__110shared_ptrIN2ik19PixelBufferTransferEE27__shared_ptr_default_deleteIS2_S2_EE") {
    return a1 + 24;
  }
  if (((v3 & (unint64_t)"NSt3__110shared_ptrIN2ik19PixelBufferTransferEE27__shared_ptr_default_deleteIS2_S2_EE" & 0x8000000000000000) != 0) == __OFSUB__(v3, "NSt3__110shared_ptrIN2ik19PixelBufferTransferEE27__shared_ptr_default_deleteIS2_S2_EE")) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"NSt3__110shared_ptrIN2ik19PixelBufferTransferEE27__shared_ptr_default_deleteIS2_S2_EE" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 24; {
  return 0;
  }
}

uint64_t sub_2529CE19C(void *a1)
{
  int v2 = objc_opt_new();
  uint64_t v6 = objc_msgSend_toCVPixelBufferRefWithCIContext_(a1, v3, (uint64_t)v2, v4, v5);

  return v6;
}

void sub_2529CE1E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

CVPixelBufferRef sub_2529CE1F4(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  objc_msgSend_extent(a1, v5, v6, v7, v8);
  double v10 = v9;
  objc_msgSend_extent(a1, v11, v12, v13, v14);
  CVPixelBufferRef pixelBufferOut = 0;
  CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (unint64_t)v10, (unint64_t)v15, 0x42475241u, 0, &pixelBufferOut);
  objc_msgSend_render_toCVPixelBuffer_(v4, v16, (uint64_t)a1, (uint64_t)pixelBufferOut, v17);
  CVPixelBufferRef v18 = pixelBufferOut;

  return v18;
}

void sub_2529CE288(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2529CE298(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2529CE2A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2529CE718(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *__p,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  if (a25 < 0) {
    operator delete(__p);
  }
  if (a19 < 0)
  {
    operator delete(a14);
    if ((v26 & 1) == 0)
    {
LABEL_8:
      sub_2529CE030((const void **)(v27 - 80));
      _Unwind_Resume(a1);
    }
  }
  else if (!v26)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v25);
  goto LABEL_8;
}

uint64_t sub_2529CE800(uint64_t a1)
{
  *(void *)a1 = &unk_2702DD770;
  if (CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)(a1 + 8), *(void *)(a1 + 16)))
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Failed to unlock pixel buffer.");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  return a1;
}

void sub_2529CE888(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_2529CE9A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  __cxa_free_exception(v11);
  MEMORY[0x2533C48B0](v10, 0x20C4093837F09);
  _Unwind_Resume(a1);
}

void sub_2529CE9EC(uint64_t a1)
{
  *(void *)a1 = &unk_2702DD770;
  if (!CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)(a1 + 8), *(void *)(a1 + 16)))
  {
    JUMPOUT(0x2533C48B0);
  }
  exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
  std::runtime_error::runtime_error(exception, "Failed to unlock pixel buffer.");
  __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
}

void sub_2529CEAA0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v2);
  MEMORY[0x2533C48B0](v1, 0x10A1C40AFD1EA57);
  _Unwind_Resume(a1);
}

uint64_t sub_2529CEAD4(uint64_t result, char *a2)
{
  if (result)
  {
    int v2 = result;
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    sub_2529CDF7C(&v14, a2);
    uint64_t v5 = std::string::insert(&v14, 0, "PixelBufferTransfer operation [");
    long long v6 = *(_OWORD *)&v5->__r_.__value_.__l.__data_;
    v15.__r_.__value_.__r.__words[2] = v5->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v15.__r_.__value_.__l.__data_ = v6;
    v5->__r_.__value_.__l.__size_ = 0;
    v5->__r_.__value_.__r.__words[2] = 0;
    v5->__r_.__value_.__r.__words[0] = 0;
    uint64_t v7 = std::string::append(&v15, "] failed. Status = ");
    long long v8 = *(_OWORD *)&v7->__r_.__value_.__l.__data_;
    v16.__r_.__value_.__r.__words[2] = v7->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v16.__r_.__value_.__l.__data_ = v8;
    v7->__r_.__value_.__l.__size_ = 0;
    v7->__r_.__value_.__r.__words[2] = 0;
    v7->__r_.__value_.__r.__words[0] = 0;
    std::to_string(&v13, v2);
    if ((v13.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      double v9 = &v13;
    }
    else {
      double v9 = (std::string *)v13.__r_.__value_.__r.__words[0];
    }
    if ((v13.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type size = HIBYTE(v13.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type size = v13.__r_.__value_.__l.__size_;
    }
    unint64_t v11 = std::string::append(&v16, (const std::string::value_type *)v9, size);
    long long v12 = *(_OWORD *)&v11->__r_.__value_.__l.__data_;
    v17.__r_.__value_.__r.__words[2] = v11->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v17.__r_.__value_.__l.__data_ = v12;
    v11->__r_.__value_.__l.__size_ = 0;
    v11->__r_.__value_.__r.__words[2] = 0;
    v11->__r_.__value_.__r.__words[0] = 0;
    std::runtime_error::runtime_error(exception, &v17);
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  return result;
}

void sub_2529CEBF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,uint64_t a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33)
{
  if (*(char *)(v35 - 41) < 0)
  {
    operator delete(*(void **)(v35 - 64));
    if ((a14 & 0x80000000) == 0)
    {
LABEL_3:
      if ((a33 & 0x80000000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((a14 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(a9);
  if ((a33 & 0x80000000) == 0)
  {
LABEL_4:
    if ((a26 & 0x80000000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  operator delete(a28);
  if ((a26 & 0x80000000) == 0)
  {
LABEL_5:
    if (a20 < 0) {
      goto LABEL_6;
    }
    goto LABEL_12;
  }
LABEL_11:
  operator delete(a21);
  if (a20 < 0)
  {
LABEL_6:
    operator delete(__p);
    if ((v34 & 1) == 0) {
LABEL_14:
    }
      _Unwind_Resume(a1);
LABEL_13:
    __cxa_free_exception(v33);
    goto LABEL_14;
  }
LABEL_12:
  if (!v34) {
    goto LABEL_14;
  }
  goto LABEL_13;
}

void sub_2529CEDB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__n128 sub_2529CEDC0@<Q0>(void *__s@<X0>, uint64_t a2@<X8>)
{
  size_t v4 = *((unsigned __int8 *)__s + 23);
  if (*((char *)__s + 23) < 0)
  {
    uint64_t v5 = (void *)*__s;
    int64_t v6 = __s[1];
    uint64_t v7 = (char *)(*__s + v6);
    if (v6 < 1) {
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v5 = __s;
    int64_t v6 = *((unsigned __int8 *)__s + 23);
    uint64_t v7 = (char *)__s + v4;
    if (!*((unsigned char *)__s + 23)) {
      goto LABEL_9;
    }
  }
  long long v8 = v5;
  do
  {
    double v9 = (char *)memchr(v8, 47, v6);
    if (!v9) {
      break;
    }
    if (*v9 == 47) {
      goto LABEL_10;
    }
    long long v8 = v9 + 1;
    int64_t v6 = v7 - (unsigned char *)v8;
  }
  while (v7 - (unsigned char *)v8 > 0);
LABEL_9:
  double v9 = v7;
LABEL_10:
  if (v9 == v7) {
    unint64_t v10 = 0;
  }
  else {
    unint64_t v10 = v9 - (char *)v5 + 1;
  }
  if ((v4 & 0x80) != 0)
  {
    size_t v4 = __s[1];
    if (v4 < v10) {
      goto LABEL_86;
    }
    unint64_t v11 = (void *)*__s;
  }
  else
  {
    unint64_t v11 = __s;
    if (v10 > v4) {
LABEL_86:
    }
      sub_2529D36D4();
  }
  if (v4 - v10 < v4) {
    v4 -= v10;
  }
  if (v4 > 0x7FFFFFFFFFFFFFF7) {
    goto LABEL_85;
  }
  if (v4 >= 0x17)
  {
    uint64_t v17 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v17 = v4 | 7;
    }
    uint64_t v18 = v17 + 1;
    p_dst = (long long *)operator new(v17 + 1);
    *((void *)&__dst + 1) = v4;
    unint64_t v39 = v18 | 0x8000000000000000;
    *(void *)&long long __dst = p_dst;
LABEL_30:
    memmove(p_dst, (char *)v11 + v10, v4);
    *((unsigned char *)p_dst + v4) = 0;
    if ((*((char *)__s + 23) & 0x80000000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_31;
  }
  HIBYTE(v39) = v4;
  p_dst = &__dst;
  if (v4) {
    goto LABEL_30;
  }
  LOBYTE(__dst) = 0;
  if ((*((char *)__s + 23) & 0x80000000) == 0) {
    goto LABEL_24;
  }
LABEL_31:
  operator delete((void *)*__s);
LABEL_24:
  *(_OWORD *)__s = __dst;
  __s[2] = v39;
  size_t v13 = *((unsigned __int8 *)__s + 23);
  if (*((char *)__s + 23) < 0)
  {
    std::string v14 = (void *)*__s;
    int64_t v15 = __s[1];
    std::string v16 = (char *)(*__s + v15);
    if (v15 < 1) {
      goto LABEL_37;
    }
  }
  else
  {
    std::string v14 = __s;
    int64_t v15 = *((unsigned __int8 *)__s + 23);
    std::string v16 = (char *)__s + v13;
    if (!*((unsigned char *)__s + 23)) {
      goto LABEL_37;
    }
  }
  uint64_t v19 = v14;
  do
  {
    uint64_t v20 = (char *)memchr(v19, 47, v15);
    if (!v20) {
      break;
    }
    if (*v20 == 47) {
      goto LABEL_38;
    }
    uint64_t v19 = v20 + 1;
    int64_t v15 = v16 - (unsigned char *)v19;
  }
  while (v16 - (unsigned char *)v19 > 0);
LABEL_37:
  uint64_t v20 = v16;
LABEL_38:
  unint64_t v21 = v20 - (char *)v14;
  if (v20 == v16) {
    unint64_t v21 = -1;
  }
  if ((v13 & 0x80) != 0)
  {
    uint64_t v22 = (void *)*__s;
    size_t v13 = __s[1];
    if (v13 >= v21) {
      size_t v13 = v21;
    }
    if (v13 <= 0x7FFFFFFFFFFFFFF7) {
      goto LABEL_48;
    }
LABEL_85:
    sub_2529C1D00();
  }
  uint64_t v22 = __s;
  if (v13 >= v21) {
    size_t v13 = v21;
  }
  if (v13 > 0x7FFFFFFFFFFFFFF7) {
    goto LABEL_85;
  }
LABEL_48:
  if (v13 >= 0x17)
  {
    uint64_t v27 = (v13 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v13 | 7) != 0x17) {
      uint64_t v27 = v13 | 7;
    }
    uint64_t v28 = v27 + 1;
    uint64_t v23 = (long long *)operator new(v27 + 1);
    *((void *)&__dst + 1) = v13;
    unint64_t v39 = v28 | 0x8000000000000000;
    *(void *)&long long __dst = v23;
LABEL_57:
    memmove(v23, v22, v13);
    *((unsigned char *)v23 + v13) = 0;
    if ((*((char *)__s + 23) & 0x80000000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_58;
  }
  HIBYTE(v39) = v13;
  uint64_t v23 = &__dst;
  if (v13) {
    goto LABEL_57;
  }
  LOBYTE(__dst) = 0;
  if ((*((char *)__s + 23) & 0x80000000) == 0) {
    goto LABEL_51;
  }
LABEL_58:
  operator delete((void *)*__s);
LABEL_51:
  *(_OWORD *)__s = __dst;
  __s[2] = v39;
  size_t v24 = *((unsigned __int8 *)__s + 23);
  if (*((char *)__s + 23) < 0)
  {
    char v25 = (void *)*__s;
    int64_t v26 = __s[1];
    if (v26 < 1) {
      goto LABEL_81;
    }
  }
  else
  {
    char v25 = __s;
    int64_t v26 = *((unsigned __int8 *)__s + 23);
    if (!*((unsigned char *)__s + 23)) {
      goto LABEL_81;
    }
  }
  uint64_t v29 = (char *)v25 + v26;
  BOOL v30 = v25;
  while (1)
  {
    BOOL v31 = memchr(v30, 95, v26);
    if (!v31) {
      goto LABEL_81;
    }
    if (*v31 == 95) {
      break;
    }
    BOOL v30 = v31 + 1;
    int64_t v26 = v29 - (unsigned char *)v30;
    if (v29 - (unsigned char *)v30 < 1) {
      goto LABEL_81;
    }
  }
  if (v31 != v29)
  {
    size_t v32 = v31 - (unsigned char *)v25;
    if (v31 - (unsigned char *)v25 != -1)
    {
      if ((v24 & 0x80) != 0)
      {
        unint64_t v33 = (void *)*__s;
        size_t v24 = __s[1];
        if (v24 >= v32) {
          size_t v24 = v32;
        }
        if (v24 > 0x7FFFFFFFFFFFFFF7) {
          goto LABEL_85;
        }
      }
      else
      {
        unint64_t v33 = __s;
        if (v24 >= v32) {
          size_t v24 = v32;
        }
        if (v24 > 0x7FFFFFFFFFFFFFF7) {
          goto LABEL_85;
        }
      }
      if (v24 >= 0x17)
      {
        uint64_t v35 = (v24 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v24 | 7) != 0x17) {
          uint64_t v35 = v24 | 7;
        }
        uint64_t v36 = v35 + 1;
        int v34 = (long long *)operator new(v35 + 1);
        *((void *)&__dst + 1) = v24;
        unint64_t v39 = v36 | 0x8000000000000000;
        *(void *)&long long __dst = v34;
      }
      else
      {
        HIBYTE(v39) = v24;
        int v34 = &__dst;
        if (!v24) {
          goto LABEL_78;
        }
      }
      memmove(v34, v33, v24);
LABEL_78:
      *((unsigned char *)v34 + v24) = 0;
      if (*((char *)__s + 23) < 0) {
        operator delete((void *)*__s);
      }
      *(_OWORD *)__s = __dst;
      __s[2] = v39;
    }
  }
LABEL_81:
  __n128 result = *(__n128 *)__s;
  *(_OWORD *)a2 = *(_OWORD *)__s;
  *(void *)(a2 + 16) = __s[2];
  __s[1] = 0;
  __s[2] = 0;
  *__s = 0;
  return result;
}

void sub_2529CF1EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2529CF240(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2529D0214(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, void *a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,void *__p,uint64_t a43,int a44,__int16 a45,char a46,char a47)
{
  _Unwind_Resume(a1);
}

void sub_2529D0A4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42)
{
  sub_2529BCA7C(&a35);
  sub_2529C4F44(&a42);

  _Unwind_Resume(a1);
}

void sub_2529D10B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p,uint64_t a21,int a22,__int16 a23,char a24,char a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39)
{
  sub_2529BCA7C(&a13);
  sub_2529BCA7C(&a39);
  sub_2529C4F44((void *)(v41 - 240));

  _Unwind_Resume(a1);
}

void sub_2529D13EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  sub_2529BCA7C(v17);
  if (v16) {
    operator delete(v16);
  }

  _Unwind_Resume(a1);
}

void sub_2529D2974(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,void *a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  if (v68 < 0) {
    operator delete(__p);
  }

  sub_2529C988C((uint64_t)&a20);
  sub_2529C6378(&a34);
  sub_2529BCA7C(&a53);
  sub_2529BCA7C(&a60);

  _Unwind_Resume(a1);
}

void sub_2529D2C94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2529D2CA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2529D2CB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2529D2CD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2529D2D68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2529D2D80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_2529D3124(uint64_t a1, char *__s, uint64_t a3)
{
  size_t v6 = strlen(__s);
  if (v6 >= 0x7FFFFFFFFFFFFFF8) {
    sub_2529C1D00();
  }
  size_t v7 = v6;
  if (v6 >= 0x17)
  {
    uint64_t v9 = (v6 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v6 | 7) != 0x17) {
      uint64_t v9 = v6 | 7;
    }
    uint64_t v10 = v9 + 1;
    long long v8 = operator new(v9 + 1);
    *(void *)(a1 + 8) = v7;
    *(void *)(a1 + 16) = v10 | 0x8000000000000000;
    *(void *)a1 = v8;
    goto LABEL_8;
  }
  *(unsigned char *)(a1 + 23) = v6;
  long long v8 = (void *)a1;
  if (v6) {
LABEL_8:
  }
    memmove(v8, __s, v7);
  *((unsigned char *)v8 + v7) = 0;
  int v11 = *(_DWORD *)(a3 + 8);
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 24) = &unk_2702DD568;
  *(_DWORD *)(a1 + 32) = v11;
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = 0;
  size_t v13 = *(unsigned char **)(a3 + 16);
  long long v12 = *(unsigned char **)(a3 + 24);
  int64_t v14 = v12 - v13;
  if (v12 != v13)
  {
    if (v14 < 0) {
      sub_2529C1558();
    }
    int64_t v15 = (char *)operator new(v12 - v13);
    *(void *)(a1 + 40) = v15;
    *(void *)(a1 + 48) = v15;
    std::string v16 = &v15[8 * (v14 >> 3)];
    *(void *)(a1 + 56) = v16;
    memcpy(v15, v13, v14);
    *(void *)(a1 + 48) = v16;
  }
  uint64_t v17 = *(void *)(a3 + 48);
  *(void *)(a1 + 64) = *(void *)(a3 + 40);
  *(void *)(a1 + 72) = v17;
  if (v17) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v17 + 8), 1uLL, memory_order_relaxed);
  }
  return a1;
}

void sub_2529D326C(_Unwind_Exception *a1)
{
  size_t v4 = *v2;
  if (*v2)
  {
    *(void *)(v1 + 48) = v4;
    operator delete(v4);
  }
  sub_2529D7F0C((void **)v1);
  _Unwind_Resume(a1);
}

uint64_t sub_2529D3290(uint64_t a1, char *__s, uint64_t a3)
{
  size_t v6 = strlen(__s);
  if (v6 >= 0x7FFFFFFFFFFFFFF8) {
    sub_2529C1D00();
  }
  size_t v7 = v6;
  if (v6 >= 0x17)
  {
    uint64_t v9 = (v6 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v6 | 7) != 0x17) {
      uint64_t v9 = v6 | 7;
    }
    uint64_t v10 = v9 + 1;
    long long v8 = operator new(v9 + 1);
    *(void *)(a1 + 8) = v7;
    *(void *)(a1 + 16) = v10 | 0x8000000000000000;
    *(void *)a1 = v8;
    goto LABEL_8;
  }
  *(unsigned char *)(a1 + 23) = v6;
  long long v8 = (void *)a1;
  if (v6) {
LABEL_8:
  }
    memmove(v8, __s, v7);
  *((unsigned char *)v8 + v7) = 0;
  int v11 = *(_DWORD *)(a3 + 8);
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 24) = &unk_2702DD568;
  *(_DWORD *)(a1 + 32) = v11;
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = 0;
  size_t v13 = *(unsigned char **)(a3 + 16);
  long long v12 = *(unsigned char **)(a3 + 24);
  int64_t v14 = v12 - v13;
  if (v12 != v13)
  {
    if (v14 < 0) {
      sub_2529C1558();
    }
    int64_t v15 = (char *)operator new(v12 - v13);
    *(void *)(a1 + 40) = v15;
    *(void *)(a1 + 48) = v15;
    std::string v16 = &v15[8 * (v14 >> 3)];
    *(void *)(a1 + 56) = v16;
    memcpy(v15, v13, v14);
    *(void *)(a1 + 48) = v16;
  }
  uint64_t v17 = *(void *)(a3 + 48);
  *(void *)(a1 + 64) = *(void *)(a3 + 40);
  *(void *)(a1 + 72) = v17;
  if (v17) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v17 + 8), 1uLL, memory_order_relaxed);
  }
  return a1;
}

void sub_2529D33D8(_Unwind_Exception *a1)
{
  size_t v4 = *v2;
  if (*v2)
  {
    *(void *)(v1 + 48) = v4;
    operator delete(v4);
  }
  sub_2529D7F0C((void **)v1);
  _Unwind_Resume(a1);
}

uint64_t sub_2529D33FC(uint64_t a1, char *__s, uint64_t a3)
{
  size_t v6 = strlen(__s);
  if (v6 >= 0x7FFFFFFFFFFFFFF8) {
    sub_2529C1D00();
  }
  size_t v7 = v6;
  if (v6 >= 0x17)
  {
    uint64_t v9 = (v6 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v6 | 7) != 0x17) {
      uint64_t v9 = v6 | 7;
    }
    uint64_t v10 = v9 + 1;
    long long v8 = operator new(v9 + 1);
    *(void *)(a1 + 8) = v7;
    *(void *)(a1 + 16) = v10 | 0x8000000000000000;
    *(void *)a1 = v8;
    goto LABEL_8;
  }
  *(unsigned char *)(a1 + 23) = v6;
  long long v8 = (void *)a1;
  if (v6) {
LABEL_8:
  }
    memmove(v8, __s, v7);
  *((unsigned char *)v8 + v7) = 0;
  int v11 = *(_DWORD *)(a3 + 8);
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 24) = &unk_2702DD568;
  *(_DWORD *)(a1 + 32) = v11;
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = 0;
  size_t v13 = *(unsigned char **)(a3 + 16);
  long long v12 = *(unsigned char **)(a3 + 24);
  int64_t v14 = v12 - v13;
  if (v12 != v13)
  {
    if (v14 < 0) {
      sub_2529C1558();
    }
    int64_t v15 = (char *)operator new(v12 - v13);
    *(void *)(a1 + 40) = v15;
    *(void *)(a1 + 48) = v15;
    std::string v16 = &v15[8 * (v14 >> 3)];
    *(void *)(a1 + 56) = v16;
    memcpy(v15, v13, v14);
    *(void *)(a1 + 48) = v16;
  }
  uint64_t v17 = *(void *)(a3 + 48);
  *(void *)(a1 + 64) = *(void *)(a3 + 40);
  *(void *)(a1 + 72) = v17;
  if (v17) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v17 + 8), 1uLL, memory_order_relaxed);
  }
  return a1;
}

void sub_2529D3544(_Unwind_Exception *a1)
{
  size_t v4 = *v2;
  if (*v2)
  {
    *(void *)(v1 + 48) = v4;
    operator delete(v4);
  }
  sub_2529D7F0C((void **)v1);
  _Unwind_Resume(a1);
}

uint64_t sub_2529D3568(uint64_t a1, char *__s, uint64_t a3)
{
  size_t v6 = strlen(__s);
  if (v6 >= 0x7FFFFFFFFFFFFFF8) {
    sub_2529C1D00();
  }
  size_t v7 = v6;
  if (v6 >= 0x17)
  {
    uint64_t v9 = (v6 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v6 | 7) != 0x17) {
      uint64_t v9 = v6 | 7;
    }
    uint64_t v10 = v9 + 1;
    long long v8 = operator new(v9 + 1);
    *(void *)(a1 + 8) = v7;
    *(void *)(a1 + 16) = v10 | 0x8000000000000000;
    *(void *)a1 = v8;
    goto LABEL_8;
  }
  *(unsigned char *)(a1 + 23) = v6;
  long long v8 = (void *)a1;
  if (v6) {
LABEL_8:
  }
    memmove(v8, __s, v7);
  *((unsigned char *)v8 + v7) = 0;
  int v11 = *(_DWORD *)(a3 + 8);
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 24) = &unk_2702DD568;
  *(_DWORD *)(a1 + 32) = v11;
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = 0;
  size_t v13 = *(unsigned char **)(a3 + 16);
  long long v12 = *(unsigned char **)(a3 + 24);
  int64_t v14 = v12 - v13;
  if (v12 != v13)
  {
    if (v14 < 0) {
      sub_2529C1558();
    }
    int64_t v15 = (char *)operator new(v12 - v13);
    *(void *)(a1 + 40) = v15;
    *(void *)(a1 + 48) = v15;
    std::string v16 = &v15[8 * (v14 >> 3)];
    *(void *)(a1 + 56) = v16;
    memcpy(v15, v13, v14);
    *(void *)(a1 + 48) = v16;
  }
  uint64_t v17 = *(void *)(a3 + 48);
  *(void *)(a1 + 64) = *(void *)(a3 + 40);
  *(void *)(a1 + 72) = v17;
  if (v17) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v17 + 8), 1uLL, memory_order_relaxed);
  }
  return a1;
}

void sub_2529D36B0(_Unwind_Exception *a1)
{
  size_t v4 = *v2;
  if (*v2)
  {
    *(void *)(v1 + 48) = v4;
    operator delete(v4);
  }
  sub_2529D7F0C((void **)v1);
  _Unwind_Resume(a1);
}

void sub_2529D36D4()
{
}

char *sub_2529D36EC(void **a1, uint64_t a2)
{
  unint64_t v3 = 0xAAAAAAAAAAAAAAABLL * (((unsigned char *)a1[1] - (unsigned char *)*a1) >> 3);
  unint64_t v4 = v3 + 1;
  if (v3 + 1 > 0xAAAAAAAAAAAAAAALL) {
    sub_2529C1558();
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
      sub_2529C6D64();
    }
    size_t v7 = (char *)operator new(24 * v6);
  }
  else
  {
    size_t v7 = 0;
  }
  long long v8 = &v7[24 * v3];
  uint64_t v9 = &v7[24 * v6];
  *(_OWORD *)long long v8 = *(_OWORD *)a2;
  *((void *)v8 + 2) = *(void *)(a2 + 16);
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)a2 = 0;
  uint64_t v10 = v8 + 24;
  int v11 = (char *)*a1;
  long long v12 = (char *)a1[1];
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
  int64_t v14 = (char *)*a1;
  long long v12 = (char *)a1[1];
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
    long long v12 = v14;
  }
  if (v12) {
LABEL_20:
  }
    operator delete(v12);
  return v10;
}

uint64_t getImageHarmonizationKitVersion()
{
  return 20230629;
}

void sub_2529D3990(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2529D3A18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2529D3AAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2529D3C8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2529D3CA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2529D3D58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2529D3DBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)IHKHarmonizationRequest;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_2529D3E98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2529D3EF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  uint64_t v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)IHKHarmonizationResult;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_2529D4020(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2529D4030(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2529D4444(_Unwind_Exception *a1, uint64_t a2, void *a3, void *a4, void *a5, uint64_t a6, void *a7, void *a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  sub_2529C4F44((uint64_t *)va);

  _Unwind_Resume(a1);
}

void sub_2529D4548()
{
}

void sub_2529D478C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::__shared_weak_count::~__shared_weak_count(v10);
  operator delete(v13);
  sub_2529CBE9C((uint64_t)&a9);
  if (*(char *)(v11 - 49) < 0) {
    operator delete(*(void **)(v11 - 72));
  }
  MEMORY[0x2533C48B0](v9, 0xA1C409BE6959DLL);
  _Unwind_Resume(a1);
}

void sub_2529D4898(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2529D48B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2529D5038(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,void *__p,uint64_t a33)
{
  if (__p)
  {
    a33 = (uint64_t)__p;
    operator delete(__p);
  }
  if (a20 < 0) {
    operator delete(a15);
  }
  sub_2529C988C((uint64_t)&a24);

  _Unwind_Resume(a1);
}

void sub_2529D50E8(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = *(void *)(a1 + 8);
  uint64_t v7 = *(void *)(v6 + 56);
  uint64_t v8 = *(void *)(v6 + 64);
  if (v7 == v8)
  {
    sub_2529D5404((uint64_t)&__p);
  }
  else
  {
    __p = 0;
    long long v13 = 0;
    uint64_t v14 = 0;
    sub_2529CB6B8((char *)&__p, v7, v8, 0xAAAAAAAAAAAAAAABLL * ((v8 - v7) >> 3));
  }
  sub_2529C5EBC(a1, a2, (long long **)&__p, a3);
  uint64_t v9 = (void **)__p;
  if (__p)
  {
    uint64_t v10 = v13;
    uint64_t v11 = __p;
    if (v13 != __p)
    {
      do
      {
        if (*((char *)v10 - 1) < 0) {
          operator delete(*(v10 - 3));
        }
        v10 -= 3;
      }
      while (v10 != v9);
      uint64_t v11 = __p;
    }
    long long v13 = v9;
    operator delete(v11);
  }
}

void sub_2529D51C0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_2529C6378((void **)va);
  _Unwind_Resume(a1);
}

const char *sub_2529D5404@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = 0;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  *(void *)a1 = 0;
  long long v12 = 0;
  while (1)
  {
    __n128 result = (const char *)espresso_get_output_blob_name();
    uint64_t v5 = result;
    long long v12 = result;
    if (!result) {
      return result;
    }
    uint64_t v6 = *(char **)(a1 + 8);
    if ((unint64_t)v6 >= *(void *)(a1 + 16))
    {
      unint64_t v3 = sub_2529D5558((void **)a1, &v12);
      goto LABEL_3;
    }
    size_t v7 = strlen(result);
    if (v7 >= 0x7FFFFFFFFFFFFFF8) {
      sub_2529C1D00();
    }
    size_t v8 = v7;
    if (v7 >= 0x17)
    {
      uint64_t v10 = (v7 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v7 | 7) != 0x17) {
        uint64_t v10 = v7 | 7;
      }
      uint64_t v11 = v10 + 1;
      uint64_t v9 = operator new(v10 + 1);
      *((void *)v6 + 1) = v8;
      *((void *)v6 + 2) = v11 | 0x8000000000000000;
      *(void *)uint64_t v6 = v9;
    }
    else
    {
      v6[23] = v7;
      uint64_t v9 = v6;
      if (!v7) {
        goto LABEL_14;
      }
    }
    memmove(v9, v5, v8);
LABEL_14:
    *((unsigned char *)v9 + v8) = 0;
    unint64_t v3 = v6 + 24;
    *(void *)(a1 + 8) = v6 + 24;
LABEL_3:
    *(void *)(a1 + 8) = v3;
    ++v2;
  }
}

void sub_2529D5528(_Unwind_Exception *exception_object)
{
  *(void *)(v1 + 8) = v2;
  if (*(void *)v1) {
    sub_2529D8068((void **)(v1 + 8), *(void ***)v1, (void **)v1);
  }
  _Unwind_Resume(exception_object);
}

char *sub_2529D5558(void **a1, const char **a2)
{
  unint64_t v3 = 0xAAAAAAAAAAAAAAABLL * (((unsigned char *)a1[1] - (unsigned char *)*a1) >> 3);
  unint64_t v4 = v3 + 1;
  if (v3 + 1 > 0xAAAAAAAAAAAAAAALL) {
    sub_2529C1558();
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
      sub_2529C6D64();
    }
    size_t v7 = (char *)operator new(24 * v6);
  }
  else
  {
    size_t v7 = 0;
  }
  size_t v8 = &v7[24 * v3];
  uint64_t v22 = v8;
  uint64_t v23 = v8;
  size_t v24 = &v7[24 * v6];
  uint64_t v9 = *a2;
  size_t v10 = strlen(*a2);
  if (v10 >= 0x7FFFFFFFFFFFFFF8) {
    sub_2529C1D00();
  }
  size_t v11 = v10;
  if (v10 >= 0x17)
  {
    uint64_t v16 = (v10 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v10 | 7) != 0x17) {
      uint64_t v16 = v10 | 7;
    }
    uint64_t v17 = v16 + 1;
    uint64_t v18 = (char *)operator new(v16 + 1);
    *((void *)v8 + 1) = v11;
    *((void *)v8 + 2) = v17 | 0x8000000000000000;
    *(void *)size_t v8 = v18;
    size_t v8 = v18;
  }
  else
  {
    v8[23] = v10;
    if (!v10)
    {
      char *v8 = 0;
      long long v12 = v8;
      long long v13 = v8 + 24;
      uint64_t v14 = (char *)*a1;
      int64_t v15 = (char *)a1[1];
      if (v15 == *a1) {
        goto LABEL_23;
      }
      goto LABEL_20;
    }
  }
  memmove(v8, v9, v11);
  v8[v11] = 0;
  long long v12 = v22;
  long long v13 = v23 + 24;
  uint64_t v14 = (char *)*a1;
  int64_t v15 = (char *)a1[1];
  if (v15 == *a1)
  {
LABEL_23:
    *a1 = v12;
    a1[1] = v13;
    a1[2] = v24;
    goto LABEL_28;
  }
  do
  {
LABEL_20:
    long long v19 = *(_OWORD *)(v15 - 24);
    *((void *)v12 - 1) = *((void *)v15 - 1);
    *(_OWORD *)(v12 - 24) = v19;
    v12 -= 24;
    *((void *)v15 - 2) = 0;
    *((void *)v15 - 1) = 0;
    *((void *)v15 - 3) = 0;
    v15 -= 24;
  }
  while (v15 != v14);
  uint64_t v20 = (char *)*a1;
  int64_t v15 = (char *)a1[1];
  *a1 = v12;
  a1[1] = v13;
  a1[2] = v24;
  if (v15 != v20)
  {
    do
    {
      if (*(v15 - 1) < 0) {
        operator delete(*((void **)v15 - 3));
      }
      v15 -= 24;
    }
    while (v15 != v20);
    int64_t v15 = v20;
  }
LABEL_28:
  if (v15) {
    operator delete(v15);
  }
  return v13;
}

void sub_2529D5778(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_2529D578C((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_2529D578C(uint64_t a1)
{
  unint64_t v3 = *(void ***)(a1 + 8);
  uint64_t v2 = *(void ***)(a1 + 16);
  if (v2 != v3)
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
    while (v5 != v3);
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

uint64_t sub_2529D57F4(uint64_t a1, const char **a2, uint64_t a3)
{
  uint64_t v5 = *a2;
  size_t v6 = strlen(*a2);
  if (v6 >= 0x7FFFFFFFFFFFFFF8) {
    sub_2529C1D00();
  }
  size_t v7 = v6;
  if (v6 >= 0x17)
  {
    uint64_t v9 = (v6 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v6 | 7) != 0x17) {
      uint64_t v9 = v6 | 7;
    }
    uint64_t v10 = v9 + 1;
    size_t v8 = operator new(v9 + 1);
    *(void *)(a1 + 8) = v7;
    *(void *)(a1 + 16) = v10 | 0x8000000000000000;
    *(void *)a1 = v8;
    goto LABEL_8;
  }
  *(unsigned char *)(a1 + 23) = v6;
  size_t v8 = (void *)a1;
  if (v6) {
LABEL_8:
  }
    memmove(v8, v5, v7);
  *((unsigned char *)v8 + v7) = 0;
  int v11 = *(_DWORD *)(a3 + 8);
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 24) = &unk_2702DD568;
  *(_DWORD *)(a1 + 32) = v11;
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = 0;
  long long v13 = *(unsigned char **)(a3 + 16);
  long long v12 = *(unsigned char **)(a3 + 24);
  int64_t v14 = v12 - v13;
  if (v12 != v13)
  {
    if (v14 < 0) {
      sub_2529C1558();
    }
    int64_t v15 = (char *)operator new(v12 - v13);
    *(void *)(a1 + 40) = v15;
    *(void *)(a1 + 48) = v15;
    uint64_t v16 = &v15[8 * (v14 >> 3)];
    *(void *)(a1 + 56) = v16;
    memcpy(v15, v13, v14);
    *(void *)(a1 + 48) = v16;
  }
  uint64_t v17 = *(void *)(a3 + 48);
  *(void *)(a1 + 64) = *(void *)(a3 + 40);
  *(void *)(a1 + 72) = v17;
  if (v17) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v17 + 8), 1uLL, memory_order_relaxed);
  }
  return a1;
}

void sub_2529D593C(_Unwind_Exception *a1)
{
  unint64_t v4 = *v2;
  if (*v2)
  {
    *(void *)(v1 + 48) = v4;
    operator delete(v4);
  }
  sub_2529D7F0C((void **)v1);
  _Unwind_Resume(a1);
}

void sub_2529D5B34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_2529D5BAC()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = v1;
  if (v1 == 1)
  {
    uint64_t v2 = (uint64_t)MTLCreateSystemDefaultDevice();
    uint64_t v3 = *(void *)(v0 + 16);
    *(void *)(v0 + 16) = v2;
    swift_unknownObjectRetain();
    sub_2529D5E30(v3);
  }
  sub_2529D5E40(v1);
  return v2;
}

uint64_t sub_2529D5C08(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + 16);
  *(void *)(v1 + 16) = a1;
  return sub_2529D5E30(v2);
}

uint64_t (*sub_2529D5C18(uint64_t *a1))(void *a1, char a2)
{
  a1[1] = v1;
  *a1 = sub_2529D5BAC();
  return sub_2529D5C60;
}

uint64_t sub_2529D5C60(void *a1, char a2)
{
  uint64_t v2 = a1[1];
  uint64_t v3 = *(void *)(v2 + 16);
  *(void *)(v2 + 16) = *a1;
  if (a2)
  {
    swift_unknownObjectRetain();
    sub_2529D5E30(v3);
    return swift_unknownObjectRelease();
  }
  else
  {
    return sub_2529D5E30(v3);
  }
}

uint64_t sub_2529D5CD0()
{
  uint64_t v1 = v0[3];
  id v2 = (id)v1;
  if (v1 != 1) {
    goto LABEL_5;
  }
  id v3 = (id)(*(uint64_t (**)(void))(*v0 + 112))();
  if (v3)
  {
    unint64_t v4 = v3;
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    id v6 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
    id v10 = 0;
    id v2 = objc_msgSend(v4, sel_newDefaultLibraryWithBundle_error_, v6, &v10);

    swift_unknownObjectRelease();
    id v3 = v10;
    if (v2)
    {
      uint64_t v7 = v0[3];
      v0[3] = v2;
      swift_unknownObjectRetain();
      sub_2529D5E30(v7);
LABEL_5:
      sub_2529D5E40(v1);
      return (uint64_t)v2;
    }
  }
  else
  {
    __break(1u);
  }
  uint64_t v9 = v3;
  sub_2529D80D0();

  swift_willThrow();
  uint64_t result = swift_unexpectedError();
  __break(1u);
  return result;
}

uint64_t sub_2529D5E30(uint64_t result)
{
  if (result != 1) {
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_2529D5E40(uint64_t result)
{
  if (result != 1) {
    return swift_unknownObjectRetain();
  }
  return result;
}

uint64_t sub_2529D5E50(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + 24);
  *(void *)(v1 + 24) = a1;
  return sub_2529D5E30(v2);
}

uint64_t (*sub_2529D5E60(uint64_t *a1))(void *a1, char a2)
{
  a1[1] = v1;
  *a1 = sub_2529D5CD0();
  return sub_2529D5EA8;
}

uint64_t sub_2529D5EA8(void *a1, char a2)
{
  uint64_t v2 = a1[1];
  uint64_t v3 = *(void *)(v2 + 24);
  *(void *)(v2 + 24) = *a1;
  if (a2)
  {
    swift_unknownObjectRetain();
    sub_2529D5E30(v3);
    return swift_unknownObjectRelease();
  }
  else
  {
    return sub_2529D5E30(v3);
  }
}

id sub_2529D5F18(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v4 = v2[4];
  id v5 = (id)v4;
  if (v4 != 1) {
    goto LABEL_5;
  }
  id v6 = *(uint64_t (**)(uint64_t, uint64_t))(*v3 + 112);
  id result = (id)v6(a1, a2);
  if (result)
  {
    id v8 = objc_msgSend(result, sel_name);
    swift_unknownObjectRelease();
    sub_2529D8140();

    sub_2529D8150();
    swift_bridgeObjectRelease();
    sub_2529D80E0();
    uint64_t v9 = swift_bridgeObjectRelease();
    id result = (id)((uint64_t (*)(uint64_t))v6)(v9);
    if (result)
    {
      id v5 = objc_msgSend(result, sel_newCommandQueue);
      swift_unknownObjectRelease();
      uint64_t v10 = v3[4];
      v3[4] = v5;
      swift_unknownObjectRetain();
      sub_2529D5E30(v10);
LABEL_5:
      sub_2529D5E40(v4);
      return v5;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_2529D6064(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + 32);
  *(void *)(v1 + 32) = a1;
  return sub_2529D5E30(v2);
}

uint64_t (*sub_2529D6074(id *a1, uint64_t a2))(void *a1, char a2)
{
  a1[1] = v2;
  *a1 = sub_2529D5F18((uint64_t)a1, a2);
  return sub_2529D60BC;
}

uint64_t sub_2529D60BC(void *a1, char a2)
{
  uint64_t v2 = a1[1];
  uint64_t v3 = *(void *)(v2 + 32);
  *(void *)(v2 + 32) = *a1;
  if (a2)
  {
    swift_unknownObjectRetain();
    sub_2529D5E30(v3);
    return swift_unknownObjectRelease();
  }
  else
  {
    return sub_2529D5E30(v3);
  }
}

unint64_t sub_2529D612C()
{
  unint64_t result = qword_269C3F6E0;
  if (!qword_269C3F6E0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_269C3F6E0);
  }
  return result;
}

unint64_t sub_2529D616C()
{
  unint64_t result = qword_269C3F6E8;
  if (!qword_269C3F6E8)
  {
    sub_2529D8170();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C3F6E8);
  }
  return result;
}

uint64_t sub_2529D61C4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_2529D6208()
{
  unint64_t result = qword_269C3F6F8;
  if (!qword_269C3F6F8)
  {
    sub_2529D6264(&qword_269C3F6F0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C3F6F8);
  }
  return result;
}

uint64_t sub_2529D6264(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_2529D62AC()
{
  uint64_t v0 = swift_allocObject();
  sub_2529D62E4();
  return v0;
}

int64x2_t *sub_2529D62E4()
{
  uint64_t v1 = sub_2529D8180();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v4 = (char *)v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2529D8170();
  MEMORY[0x270FA5388]();
  sub_2529D8100();
  MEMORY[0x270FA5388]();
  v0[1] = vdupq_n_s64(1uLL);
  v0[2].i64[0] = 1;
  sub_2529D612C();
  sub_2529D80F0();
  v6[1] = MEMORY[0x263F8EE78];
  sub_2529D616C();
  sub_2529D61C4(&qword_269C3F6F0);
  sub_2529D6208();
  sub_2529D81A0();
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, *MEMORY[0x263F8F130], v1);
  v0[2].i64[1] = sub_2529D8190();
  (*(void (**)(void))(v0->i64[0] + 200))();
  return v0;
}

uint64_t sub_2529D6520()
{
  v10[3] = *(id *)MEMORY[0x263EF8340];
  uint64_t v1 = (*(uint64_t (**)(void))(*(void *)v0 + 136))();
  if (!v1) {
    __break(1u);
  }
  uint64_t v2 = (void *)v1;
  uint64_t v3 = (void *)sub_2529D8130();
  id v4 = objc_msgSend(v2, sel_newFunctionWithName_, v3);

  uint64_t v5 = swift_unknownObjectRelease();
  if (!v4) {
    return 0;
  }
  id v6 = (id)(*(uint64_t (**)(uint64_t))(*(void *)v0 + 112))(v5);
  if (v6)
  {
    v10[0] = 0;
    id v7 = objc_msgSend(v6, sel_newComputePipelineStateWithFunction_error_, v4, v10);
    swift_unknownObjectRelease();
    id v6 = v10[0];
    if (v7)
    {
      swift_unknownObjectRelease();
      return (uint64_t)v7;
    }
  }
  else
  {
    __break(1u);
  }
  uint64_t v9 = v6;
  sub_2529D80D0();

  swift_willThrow();
  v10[0] = 0;
  v10[1] = (id)0xE000000000000000;
  sub_2529D81B0();
  sub_2529D8150();
  sub_2529D61C4(&qword_269C3F700);
  sub_2529D81C0();
  uint64_t result = sub_2529D81D0();
  __break(1u);
  return result;
}

uint64_t sub_2529D671C(CGImage *a1)
{
  uint64_t v3 = self;
  size_t Width = CGImageGetWidth(a1);
  id v5 = objc_msgSend(v3, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, Width, CGImageGetHeight(a1), 0);
  id v6 = (void *)(*(uint64_t (**)(void))(*(void *)v1 + 112))();
  if (!v6)
  {
    __break(1u);
    goto LABEL_7;
  }
  id v7 = objc_msgSend(v6, sel_newTextureWithDescriptor_, v5);
  swift_unknownObjectRelease();
  if (v7)
  {
    uint64_t v22 = v5;
    size_t v8 = CGImageGetWidth(a1);
    size_t Height = CGImageGetHeight(a1);
    sub_2529D6904(v8, Height, &v23);
    uint64_t v10 = v23;
    uint64_t v11 = v24;
    uint64_t v12 = v25;
    uint64_t v13 = v26;
    uint64_t v15 = v27;
    uint64_t v14 = v28;
    uint64_t v16 = CGImageGetDataProvider(a1);
    if (v16)
    {
      uint64_t v17 = v16;
      CFDataRef v18 = CGDataProviderCopyData(v16);

      BytePtr = CFDataGetBytePtr(v18);
      if (BytePtr)
      {
        size_t BytesPerRow = CGImageGetBytesPerRow(a1);
        uint64_t v23 = v10;
        uint64_t v24 = v11;
        uint64_t v25 = v12;
        uint64_t v26 = v13;
        uint64_t v27 = v15;
        uint64_t v28 = v14;
        objc_msgSend(v7, sel_replaceRegion_mipmapLevel_withBytes_bytesPerRow_, &v23, 0, BytePtr, BytesPerRow);

        return (uint64_t)v7;
      }
      goto LABEL_8;
    }
LABEL_7:
    __break(1u);
LABEL_8:
    __break(1u);
  }
  uint64_t result = sub_2529D81D0();
  __break(1u);
  return result;
}

uint64_t sub_2529D6904@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  a3[3] = result;
  a3[4] = a2;
  a3[5] = 1;
  return result;
}

uint64_t sub_2529D6918(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void *))
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)v5 + 160))();
  if (!result) {
    goto LABEL_30;
  }
  id v12 = objc_msgSend((id)result, sel_commandBuffer);
  uint64_t result = swift_unknownObjectRelease();
  if (!v12)
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  uint64_t result = (uint64_t)objc_msgSend(v12, sel_computeCommandEncoder);
  if (!result)
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  uint64_t v13 = (void *)result;
  objc_msgSend((id)result, sel_setComputePipelineState_, a1);
  a5(v13);
  uint64_t v14 = (uint64_t)objc_msgSend(a1, sel_threadExecutionWidth);
  uint64_t result = (uint64_t)objc_msgSend(a1, sel_maxTotalThreadsPerThreadgroup);
  if (!v14)
  {
    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  if (result == 0x8000000000000000 && v14 == -1) {
    goto LABEL_22;
  }
  uint64_t v27 = a4;
  uint64_t v15 = result / v14;
  uint64_t v16 = sub_2529D6BC0(v14, result / v14, &v29);
  uint64_t v18 = v29;
  uint64_t v17 = v30;
  uint64_t v26 = v31;
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v5 + 112))(v16);
  if (result)
  {
    unsigned int v19 = objc_msgSend((id)result, sel_supportsFamily_, 1004);
    uint64_t result = swift_unknownObjectRelease();
    if (v19)
    {
      uint64_t v20 = sel_dispatchThreads_threadsPerThreadgroup_;
      uint64_t v29 = a2;
      uint64_t v30 = a3;
LABEL_20:
      uint64_t v31 = v27;
      v28[0] = v18;
      v28[1] = v17;
      v28[2] = v26;
      objc_msgSend(v13, v20, &v29, v28);
      objc_msgSend(v13, sel_endEncoding);
      objc_msgSend(v12, sel_commit);
      objc_msgSend(v12, sel_waitUntilCompleted);
      swift_unknownObjectRelease();
      return swift_unknownObjectRelease();
    }
    uint64_t v21 = a2 + v14;
    if (!__OFADD__(a2, v14))
    {
      BOOL v22 = __OFSUB__(v21, 1);
      uint64_t v23 = v21 - 1;
      if (!v22)
      {
        if (v23 == 0x8000000000000000 && v14 == -1) {
          goto LABEL_28;
        }
        uint64_t v24 = a3 + v15;
        if (!__OFADD__(a3, v15))
        {
          BOOL v22 = __OFSUB__(v24, 1);
          uint64_t v25 = v24 - 1;
          if (!v22)
          {
            if (v15)
            {
              if (v15 != -1 || v25 != 0x8000000000000000)
              {
                uint64_t v20 = sel_dispatchThreadgroups_threadsPerThreadgroup_;
                uint64_t v29 = v23 / v14;
                uint64_t v30 = v25 / v15;
                goto LABEL_20;
              }
              goto LABEL_29;
            }
            goto LABEL_27;
          }
LABEL_26:
          __break(1u);
LABEL_27:
          __break(1u);
LABEL_28:
          __break(1u);
LABEL_29:
          __break(1u);
LABEL_30:
          __break(1u);
          goto LABEL_31;
        }
LABEL_25:
        __break(1u);
        goto LABEL_26;
      }
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
LABEL_33:
  __break(1u);
  return result;
}

uint64_t sub_2529D6BC0@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  *a3 = result;
  a3[1] = a2;
  a3[2] = 1;
  return result;
}

uint64_t sub_2529D6BD0()
{
  sub_2529D5E30(*(void *)(v0 + 16));
  sub_2529D5E30(*(void *)(v0 + 24));
  sub_2529D5E30(*(void *)(v0 + 32));

  return v0;
}

uint64_t sub_2529D6C08()
{
  sub_2529D5E30(*(void *)(v0 + 16));
  sub_2529D5E30(*(void *)(v0 + 24));
  sub_2529D5E30(*(void *)(v0 + 32));

  return MEMORY[0x270FA0228](v0, 48, 7);
}

uint64_t type metadata accessor for IHKMetalProcessing()
{
  return self;
}

uint64_t sub_2529D6C7C()
{
  swift_beginAccess();
  return *(void *)(v0 + 48);
}

uint64_t sub_2529D6CB4(unint64_t a1, int a2)
{
  int v4 = a1;
  unint64_t v5 = HIDWORD(a1);
  uint64_t result = swift_beginAccess();
  v2[12] = v4;
  v2[13] = v5;
  v2[14] = a2;
  return result;
}

uint64_t (*sub_2529D6D08())()
{
  return j__swift_endAccess;
}

uint64_t sub_2529D6D60()
{
  v0[11] = (*(uint64_t (**)(uint64_t, unint64_t))(*v0 + 192))(0x697247796C707061, 0xE900000000000064);

  return swift_unknownObjectRelease();
}

uint64_t sub_2529D6DCC(void *a1, uint64_t a2, uint64_t a3, float a4, uint64_t a5, uint64_t a6, uint64_t a7, unint64_t a8, char a9)
{
  unint64_t v58 = a8;
  uint64_t v59 = a7;
  uint64_t v16 = sub_2529D8120();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  unint64_t v57 = (char *)&v55 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  BOOL v22 = (char *)&v55 - v21;
  uint64_t v23 = MEMORY[0x270FA5388](v20);
  unint64_t v62 = (char *)&v55 - v24;
  uint64_t v25 = MEMORY[0x270FA5388](v23);
  uint64_t v27 = (char *)&v55 - v26;
  uint64_t v28 = MEMORY[0x270FA5388](v25);
  unint64_t v63 = (char *)&v55 - v29;
  MEMORY[0x270FA5388](v28);
  uint64_t v56 = (char *)&v55 - v30;
  sub_2529D8110();
  if (a9) {
    uint64_t v31 = a1;
  }
  else {
    uint64_t v31 = (CGImage *)objc_msgSend(self, sel_convertCGImageToBGRA_sRGB_, a1);
  }
  size_t v32 = v31;
  unint64_t v60 = v27;
  uint64_t v61 = v22;
  sub_2529D8110();
  __int16 BitmapInfo = CGImageGetBitmapInfo(v32);
  v9[8] = (*(uint64_t (**)(CGImage *))(*v9 + 208))(v32);
  uint64_t v34 = swift_unknownObjectRelease();
  if ((BitmapInfo & 0x2000) == 0 || (((BitmapInfo & 0x1Fu) < 7) & (0x54u >> BitmapInfo)) == 0) {
    goto LABEL_23;
  }
  uint64_t v35 = *(uint64_t (**)(uint64_t))(*v9 + 112);
  uint64_t v36 = (void *)v35(v34);
  if (!v36) {
    goto LABEL_17;
  }
  if (!a2)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (a3 < 0)
  {
    __break(1u);
    goto LABEL_16;
  }
  if ((unsigned __int128)(a6 * (__int128)a3) >> 64 != (a6 * a3) >> 63)
  {
LABEL_16:
    __break(1u);
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v55 = v16;
  uint8x8_t v37 = v32;
  id v38 = objc_msgSend(v36, sel_newBufferWithBytes_length_options_, a2);
  swift_unknownObjectRelease();
  v9[10] = v38;
  swift_unknownObjectRelease();
  unint64_t v39 = (void *)v9[8];
  if (!v39)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  id v40 = objc_msgSend(v39, sel_width);
  uint64_t v41 = (void *)v9[8];
  char v42 = v62;
  if (!v41)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  id v43 = objc_msgSend(self, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, 80, v40, objc_msgSend(v41, sel_height), 0);
  uint64_t v44 = (void *)v35((uint64_t)objc_msgSend(v43, sel_setUsage_, 2));
  if (v44)
  {
    id v45 = objc_msgSend(v44, sel_newTextureWithDescriptor_, v43);
    swift_unknownObjectRelease();
    v9[9] = v45;
    swift_unknownObjectRelease();
    char v46 = v60;
    sub_2529D8110();
    (*(void (**)(uint64_t, unint64_t, uint64_t, uint64_t, float))(*v9 + 392))(v59, v58 | ((HIDWORD(v58) & 1) << 32), 1, 1, a4);
    sub_2529D8110();
    uint64_t v47 = v61;
    sub_2529D8110();
    if (v9[9])
    {
      uint64_t v48 = *(uint64_t (**)(uint64_t, CGImage *))(*v9 + 400);
      uint64_t v49 = swift_unknownObjectRetain();
      uint64_t v50 = v48(v49, v37);
      swift_unknownObjectRelease();
      uint64_t v51 = v57;
      sub_2529D8110();

      uint64_t v52 = *(void (**)(char *, uint64_t))(v17 + 8);
      uint64_t v53 = v55;
      v52(v51, v55);
      v52(v47, v53);
      v52(v42, v53);
      v52(v46, v53);
      v52(v63, v53);
      v52(v56, v53);
      return v50;
    }
    goto LABEL_22;
  }
LABEL_21:
  __break(1u);
LABEL_22:
  __break(1u);
LABEL_23:
  uint64_t v64 = 0;
  unint64_t v65 = 0xE000000000000000;
  sub_2529D81B0();
  sub_2529D8150();
  sub_2529D8150();
  swift_bridgeObjectRelease();
  sub_2529D8150();
  sub_2529D8150();
  swift_bridgeObjectRelease();
  sub_2529D8150();
  uint64_t result = sub_2529D81D0();
  __break(1u);
  return result;
}

id sub_2529D73B8(uint64_t a1, uint64_t a2, char a3, char a4, float a5)
{
  id result = (id)v5[8];
  if (!result)
  {
    __break(1u);
    goto LABEL_6;
  }
  id v12 = objc_msgSend(result, sel_width);
  id result = (id)v5[8];
  if (!result)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  id result = objc_msgSend(result, sel_height);
  if (v5[11])
  {
    id v13 = result;
    MEMORY[0x270FA5388](result);
    v16[2] = v5;
    v16[3] = a1;
    int v17 = a2;
    char v18 = BYTE4(a2) & 1;
    char v19 = a3 & 1;
    char v20 = a4 & 1;
    float v21 = a5;
    uint64_t v14 = *(void (**)(uint64_t, id, id, uint64_t, void *(*)(void *), void *))(*v5 + 216);
    uint64_t v15 = swift_unknownObjectRetain();
    v14(v15, v12, v13, 1, sub_2529D793C, v16);
    return (id)swift_unknownObjectRelease();
  }
LABEL_7:
  __break(1u);
  return result;
}

CGContext *sub_2529D74F4(void *a1)
{
  uint64_t v2 = (uint64_t)objc_msgSend(a1, sel_width);
  id result = (CGContext *)objc_msgSend(a1, sel_height);
  uint64_t v4 = v2 * (void)result;
  if ((unsigned __int128)(v2 * (__int128)(uint64_t)result) >> 64 != (v2 * (uint64_t)result) >> 63)
  {
    __break(1u);
    goto LABEL_15;
  }
  if ((unint64_t)(v4 - 0x2000000000000000) >> 62 != 3)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  id result = (CGContext *)objc_msgSend(a1, sel_width);
  if (((unint64_t)result - 0x2000000000000000) >> 62 != 3)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  size_t v5 = 4 * v4;
  if (4 * v4 < 0)
  {
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  size_t v6 = 4 * (void)result;
  if (v5)
  {
    uint64_t v7 = sub_2529D8160();
    *(void *)(v7 + 16) = v5;
    bzero((void *)(v7 + 32), v5);
  }
  else
  {
    uint64_t v7 = MEMORY[0x263F8EE78];
  }
  sub_2529D6904((uint64_t)objc_msgSend(a1, sel_width), (uint64_t)objc_msgSend(a1, sel_height), &v13);
  objc_msgSend(a1, sel_getBytes_bytesPerRow_fromRegion_mipmapLevel_, v7 + 32, v6, &v13, 0);
  id result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x263F002D8]);
  if (!result) {
    goto LABEL_18;
  }
  size_t v8 = result;
  id v9 = objc_msgSend(a1, sel_width);
  id v10 = objc_msgSend(a1, sel_height);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v7 = (uint64_t)sub_2529D7BBC(0, *(void *)(v7 + 16), 0, (char *)v7);
  }
  id result = CGBitmapContextCreate((void *)(v7 + 32), (size_t)v9, (size_t)v10, 8uLL, v6, v8, 0x2002u);
  if (!result) {
    goto LABEL_19;
  }
  uint64_t v11 = result;
  id result = CGBitmapContextCreateImage(result);
  if (result)
  {
    id v12 = result;

    swift_bridgeObjectRelease();
    return v12;
  }
LABEL_20:
  __break(1u);
  return result;
}

int64x2_t *sub_2529D76E8()
{
  uint64_t v0 = swift_allocObject();
  *(void *)(v0 + 48) = 0x1000000010;
  *(_DWORD *)(v0 + 56) = 8;
  *(_OWORD *)(v0 + 64) = 0u;
  *(_OWORD *)(v0 + 80) = 0u;
  return sub_2529D62E4();
}

uint64_t sub_2529D7734()
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  return swift_unknownObjectRelease();
}

uint64_t sub_2529D7774()
{
  uint64_t v0 = sub_2529D6BD0();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0228](v0, 96, 7);
}

id sub_2529D7860()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id sub_2529D7894()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IHKBilateralGridUtils();
  return objc_msgSendSuper2(&v2, sel_init);
}

id sub_2529D7908()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IHKBilateralGridUtils();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void *sub_2529D793C(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *(void **)(v1 + 16);
  id v5 = *(id *)(v2 + 24);
  int v6 = *(_DWORD *)(v2 + 32);
  char v7 = *(unsigned char *)(v2 + 36);
  char v8 = *(unsigned char *)(v2 + 37);
  char v9 = *(unsigned char *)(v2 + 38);
  int v10 = *(_DWORD *)(v2 + 40);
  objc_msgSend(a1, sel_setTexture_atIndex_, v4[8], 0);
  objc_msgSend(a1, sel_setTexture_atIndex_, v4[9], 1);
  id v11 = objc_msgSend(a1, sel_setBuffer_offset_atIndex_, v4[10], 0, 0);
  if (v7)
  {
    id v11 = (id)(*(uint64_t (**)(id))(*v4 + 264))(v11);
    id v5 = v11;
    int v6 = v12;
  }
  id v22 = v5;
  int v23 = v6;
  long long v13 = *(uint64_t (**)(id))(*v4 + 112);
  id result = (void *)v13(v11);
  if (!result)
  {
    __break(1u);
    goto LABEL_9;
  }
  id v15 = objc_msgSend(result, sel_newBufferWithBytes_length_options_, &v22, 12, 0);
  swift_unknownObjectRelease();
  char v21 = v8;
  id result = (void *)v13(objc_msgSend(a1, sel_setBuffer_offset_atIndex_, v15, 0, 1));
  if (!result)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  id v16 = objc_msgSend(result, sel_newBufferWithBytes_length_options_, &v21, 1, 0);
  swift_unknownObjectRelease();
  char v20 = v9;
  id result = (void *)v13(objc_msgSend(a1, sel_setBuffer_offset_atIndex_, v16, 0, 2));
  if (!result)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  id v17 = objc_msgSend(result, sel_newBufferWithBytes_length_options_, &v20, 1, 0);
  swift_unknownObjectRelease();
  int v19 = v10;
  id result = (void *)v13(objc_msgSend(a1, sel_setBuffer_offset_atIndex_, v17, 0, 3));
  if (result)
  {
    id v18 = objc_msgSend(result, sel_newBufferWithBytes_length_options_, &v19, 4, 0);
    swift_unknownObjectRelease();
    objc_msgSend(a1, sel_setBuffer_offset_atIndex_, v18, 0, 4);
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    return (void *)swift_unknownObjectRelease();
  }
LABEL_11:
  __break(1u);
  return result;
}

char *sub_2529D7BBC(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_2529D61C4((uint64_t *)&unk_269C3F9C0);
    int v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    int v10 = (char *)MEMORY[0x263F8EE78];
  }
  int v12 = v10 + 32;
  long long v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

int64x2_t *sub_2529D7CA8(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, float a7)
{
  type metadata accessor for IHKBilateralGrid();
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 48) = 0x1000000010;
  *(_DWORD *)(v14 + 56) = 8;
  *(_OWORD *)(v14 + 64) = 0u;
  *(_OWORD *)(v14 + 80) = 0u;
  id result = sub_2529D62E4();
  if (a3 < 0 || (a3 | a2) >> 32)
  {
    __break(1u);
    goto LABEL_8;
  }
  if (!a3)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  unint64_t v16 = a4 / 48 / a3;
  if ((v16 & 0x8000000000000000) != 0)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if (!HIDWORD(v16))
  {
    uint64_t v17 = (*(uint64_t (**)(uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, unint64_t, uint64_t, void, float))(result->i64[0] + 384))(a5, a1, a2, a3, a4, a2 | (a3 << 32), a4 / 48 / a3, a6 & 1, a7);
    swift_release();
    return (int64x2_t *)v17;
  }
LABEL_10:
  __break(1u);
  return result;
}

uint64_t type metadata accessor for IHKBilateralGridUtils()
{
  return self;
}

uint64_t initializeBufferWithCopyOfBuffer for IHKBGGridSize(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(_DWORD *)(result + 8) = *((_DWORD *)a2 + 2);
  *(void *)id result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for IHKBGGridSize(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 12)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for IHKBGGridSize(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_DWORD *)(result + 8) = 0;
    *(void *)id result = (a2 - 1);
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 12) = v3;
  return result;
}

ValueMetadata *type metadata accessor for IHKBGGridSize()
{
  return &type metadata for IHKBGGridSize;
}

uint64_t type metadata accessor for IHKBilateralGrid()
{
  return self;
}

void sub_2529D7EB0(std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

void sub_2529D7F0C(void **a1)
{
  if (*((char *)a1 + 23) < 0) {
    sub_2529CBF6C(a1);
  }
}

void sub_2529D7F1C(uint64_t *a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v2 = *((char *)a1 + 23);
  char v3 = (uint64_t *)*a1;
  uint64_t status_string = espresso_get_status_string();
  if (v2 >= 0) {
    char v5 = a1;
  }
  else {
    char v5 = v3;
  }
  int v6 = 136315394;
  int64_t v7 = v5;
  __int16 v8 = 2080;
  uint64_t v9 = status_string;
  _os_log_error_impl(&dword_2529BA000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Encountered an error during: %s\n -> Espresso Error: %s", (uint8_t *)&v6, 0x16u);
}

void sub_2529D7FD4(void **__p)
{
  do
  {
    int v2 = (void **)*__p;
    if (*((char *)__p + 39) < 0) {
      operator delete(__p[2]);
    }
    operator delete(__p);
    __p = v2;
  }
  while (v2);
}

uint64_t sub_2529D8018()
{
  uint64_t v0 = abort_report_np();
  return sub_2529D8040(v0);
}

uint64_t sub_2529D8040()
{
  uint64_t v0 = abort_report_np();
  return sub_2529D8068(v0);
}

void sub_2529D8068(void **a1, void **a2, void **a3)
{
  char v5 = (void **)*a1;
  int v6 = a2;
  if (v5 != a2)
  {
    do
    {
      if (*((char *)v5 - 1) < 0) {
        operator delete(*(v5 - 3));
      }
      v5 -= 3;
    }
    while (v5 != a2);
    int v6 = *a3;
  }
  *a1 = a2;
  operator delete(v6);
}

uint64_t sub_2529D80D0()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_2529D80E0()
{
  return MEMORY[0x270EF0D20]();
}

uint64_t sub_2529D80F0()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_2529D8100()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_2529D8110()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t sub_2529D8120()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t sub_2529D8130()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_2529D8140()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_2529D8150()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_2529D8160()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_2529D8170()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_2529D8180()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_2529D8190()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_2529D81A0()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_2529D81B0()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_2529D81C0()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_2529D81D0()
{
  return MEMORY[0x270F9EFF0]();
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x270EE59E8](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x270EE59F8](context);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5CA8](name);
}

CFStringRef CGColorSpaceGetName(CGColorSpaceRef space)
{
  return (CFStringRef)MEMORY[0x270EE5D10](space);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextRelease(CGContextRef c)
{
}

CFDataRef CGDataProviderCopyData(CGDataProviderRef provider)
{
  return (CFDataRef)MEMORY[0x270EE62B8](provider);
}

CGImageRef CGImageCreateCopyWithColorSpace(CGImageRef image, CGColorSpaceRef space)
{
  return (CGImageRef)MEMORY[0x270EE6748](image, space);
}

CGBitmapInfo CGImageGetBitmapInfo(CGImageRef image)
{
  return MEMORY[0x270EE6780](image);
}

size_t CGImageGetBytesPerRow(CGImageRef image)
{
  return MEMORY[0x270EE67C0](image);
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

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x270EE6908](image);
}

CFTypeRef CVBufferCopyAttachment(CVBufferRef buffer, CFStringRef key, CVAttachmentMode *attachmentMode)
{
  return (CFTypeRef)MEMORY[0x270EE9FC0](buffer, key, attachmentMode);
}

void CVBufferSetAttachment(CVBufferRef buffer, CFStringRef key, CFTypeRef value, CVAttachmentMode attachmentMode)
{
}

CGColorSpaceRef CVImageBufferGetColorSpace(CVImageBufferRef imageBuffer)
{
  return (CGColorSpaceRef)MEMORY[0x270EEA0B0](imageBuffer);
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x270EEA150](allocator, width, height, *(void *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x270EEA190](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA1B0](pixelBuffer);
}

size_t CVPixelBufferGetDataSize(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA1D0](pixelBuffer);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA1E8](pixelBuffer);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA218](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA240](pixelBuffer);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x270EEA260](pixelBuffer, lockFlags);
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
}

CVPixelBufferRef CVPixelBufferRetain(CVPixelBufferRef texture)
{
  return (CVPixelBufferRef)MEMORY[0x270EEA320](texture);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x270EEA330](pixelBuffer, unlockFlags);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x270EF5E20]();
}

void NSLog(NSString *format, ...)
{
}

OSStatus VTCreateCGImageFromCVPixelBuffer(CVPixelBufferRef pixelBuffer, CFDictionaryRef options, CGImageRef *imageOut)
{
  return MEMORY[0x270F06678](pixelBuffer, options, imageOut);
}

OSStatus VTPixelTransferSessionCreate(CFAllocatorRef allocator, VTPixelTransferSessionRef *pixelTransferSessionOut)
{
  return MEMORY[0x270F067E0](allocator, pixelTransferSessionOut);
}

OSStatus VTPixelTransferSessionTransferImage(VTPixelTransferSessionRef session, CVPixelBufferRef sourceBuffer, CVPixelBufferRef destinationBuffer)
{
  return MEMORY[0x270F067F0](session, sourceBuffer, destinationBuffer);
}

void _Block_object_dispose(const void *a1, const int a2)
{
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

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x270F98458](__n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x270F98498](this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984A0](this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x270F984E0](this, __pos, __s);
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
  return MEMORY[0x270F987A0]();
}

{
  return MEMORY[0x270F987C0]();
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
  return MEMORY[0x270F98DE8]();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x270F98E08](retstr, *(void *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unsigned int __val)
{
  return (std::string *)MEMORY[0x270F98E10](retstr, *(void *)&__val);
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

void operator new()
{
  while (1)
    ;
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

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

uint64_t espresso_buffer_get_rank()
{
  return MEMORY[0x270F27EC0]();
}

uint64_t espresso_buffer_pack_tensor_shape()
{
  return MEMORY[0x270F27EC8]();
}

uint64_t espresso_buffer_unpack_tensor_shape()
{
  return MEMORY[0x270F27ED8]();
}

uint64_t espresso_context_destroy()
{
  return MEMORY[0x270F27EE0]();
}

uint64_t espresso_create_context()
{
  return MEMORY[0x270F27F08]();
}

uint64_t espresso_create_plan()
{
  return MEMORY[0x270F27F20]();
}

uint64_t espresso_get_output_blob_name()
{
  return MEMORY[0x270F27F60]();
}

uint64_t espresso_get_status_string()
{
  return MEMORY[0x270F27F68]();
}

uint64_t espresso_network_bind_buffer()
{
  return MEMORY[0x270F27F78]();
}

uint64_t espresso_network_bind_cvpixelbuffer()
{
  return MEMORY[0x270F27F98]();
}

uint64_t espresso_network_bind_input_vimagebuffer_argb8()
{
  return MEMORY[0x270F27FC0]();
}

uint64_t espresso_network_bind_input_vimagebuffer_bgra8()
{
  return MEMORY[0x270F27FC8]();
}

uint64_t espresso_network_bind_input_vimagebuffer_planar8()
{
  return MEMORY[0x270F27FD8]();
}

uint64_t espresso_network_bind_input_vimagebuffer_rgba8()
{
  return MEMORY[0x270F27FE8]();
}

uint64_t espresso_network_declare_output()
{
  return MEMORY[0x270F28010]();
}

uint64_t espresso_plan_add_network()
{
  return MEMORY[0x270F28068]();
}

uint64_t espresso_plan_build()
{
  return MEMORY[0x270F28070]();
}

uint64_t espresso_plan_destroy()
{
  return MEMORY[0x270F28090]();
}

uint64_t espresso_plan_execute_sync()
{
  return MEMORY[0x270F280A0]();
}

uint64_t espresso_plan_set_priority()
{
  return MEMORY[0x270F280B8]();
}

uint64_t espresso_plan_share_intermediate_buffer()
{
  return MEMORY[0x270F280C0]();
}

uint64_t espresso_set_image_preprocessing_params()
{
  return MEMORY[0x270F280D8]();
}

int fclose(FILE *a1)
{
  return MEMORY[0x270ED98C8](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x270ED99F0](__filename, __mode);
}

void free(void *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9B88](__ptr, __size, __nitems, __stream);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyCppObjectAtomic(void *dest, const void *src, void (__cdecl *copyHelper)(void *, const void *))
{
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)((uint64_t (*)(id, SEL))MEMORY[0x270F9A6D0])(a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x270EDAD20](a1);
}

int puts(const char *a1)
{
  return MEMORY[0x270EDB098](a1);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
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

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x270FA0588]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}