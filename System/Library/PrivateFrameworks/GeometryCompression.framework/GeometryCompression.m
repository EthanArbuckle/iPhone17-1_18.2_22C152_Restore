double GCLSourceFromData(uint64_t a1, uint64_t a2, void *a3)
{
  _OWORD *v6;
  double result;

  if (a1)
  {
    if (a3)
    {
      *a3 = 0;
      v6 = operator new(0x40uLL);
      result = 0.0;
      v6[1] = 0u;
      v6[2] = 0u;
      *((void *)v6 + 1) = a2;
      *((void *)v6 + 2) = (char *)v6 + 24;
      *((void *)v6 + 5) = (char *)v6 + 40;
      *((void *)v6 + 6) = (char *)v6 + 40;
      *((void *)v6 + 7) = 0;
      *(void *)v6 = a1;
      *a3 = v6;
    }
  }
  return result;
}

void sub_24FF552E8(void *a1)
{
}

void GCLSourceRelease(uint64_t a1)
{
  if (a1)
  {
    sub_24FF55494((uint64_t *)(a1 + 40));
    sub_24FF5558C(a1 + 16, *(char **)(a1 + 24));
    operator delete((void *)a1);
  }
}

unint64_t GCLSourceOptionSet(uint64_t a1, char *a2, int a3)
{
  unint64_t result = 0x8000000000000000;
  if (a1 && a2)
  {
    sub_24FF555F0(__p, a2);
    v8 = __p;
    *((_DWORD *)sub_24FF5574C((uint64_t **)(a1 + 16), (const void **)__p, (uint64_t)&unk_24FF7D066, (_OWORD **)&v8) + 14) = a3;
    if (v7 < 0) {
      operator delete(__p[0]);
    }
    return 0;
  }
  return result;
}

void sub_24FF553CC(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  __cxa_begin_catch(a1);
  __cxa_end_catch();
  JUMPOUT(0x24FF553B8);
}

unint64_t GCLDecodeMeshFromSource(uint64_t a1, uint64_t *a2)
{
  unint64_t result = 0x8000000000000000;
  if (a1)
  {
    if (a2)
    {
      if (a2[2]) {
        return sub_24FF5D1DC(a1);
      }
      sub_24FF55494((uint64_t *)(a1 + 40));
      unint64_t result = sub_24FF5C700(a1, a2);
      if (!result) {
        return sub_24FF5D1DC(a1);
      }
    }
  }
  return result;
}

void sub_24FF55458(void *a1)
{
}

unint64_t GCLDecodeMeshFromSourceWithOptions(uint64_t a1, uint64_t *a2)
{
  return GCLDecodeMeshFromSource(a1, a2);
}

void sub_24FF55484(void *a1)
{
}

void sub_24FF55494(uint64_t *a1)
{
  if (a1[2])
  {
    uint64_t v2 = *a1;
    v3 = (uint64_t *)a1[1];
    uint64_t v4 = *v3;
    *(void *)(v4 + 8) = *(void *)(*a1 + 8);
    **(void **)(v2 + 8) = v4;
    a1[2] = 0;
    if (v3 != a1)
    {
      do
      {
        v5 = (uint64_t *)v3[1];
        sub_24FF55508(v3 + 2);
        operator delete(v3);
        v3 = v5;
      }
      while (v5 != a1);
    }
  }
}

void *sub_24FF55508(void *a1)
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

void sub_24FF5558C(uint64_t a1, char *a2)
{
  if (a2)
  {
    sub_24FF5558C(a1, *(void *)a2);
    sub_24FF5558C(a1, *((void *)a2 + 1));
    if (a2[55] < 0) {
      operator delete(*((void **)a2 + 4));
    }
    operator delete(a2);
  }
}

void *sub_24FF555F0(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    sub_24FF556A4();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

void sub_24FF556A4()
{
}

void sub_24FF556BC(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_24FF55718(exception, a1);
  __cxa_throw(exception, (struct type_info *)&unk_270164EA8, MEMORY[0x263F8C060]);
}

void sub_24FF55704(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_24FF55718(std::logic_error *a1, const char *a2)
{
  unint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

_OWORD *sub_24FF5574C(uint64_t **a1, const void **a2, uint64_t a3, _OWORD **a4)
{
  v6 = (void **)sub_24FF557E8((uint64_t)a1, &v12, a2);
  uint64_t v7 = *v6;
  if (!*v6)
  {
    uint64_t v8 = (uint64_t **)v6;
    uint64_t v7 = operator new(0x40uLL);
    v9 = *a4;
    uint64_t v10 = *((void *)*a4 + 2);
    v7[2] = **a4;
    *((void *)v7 + 6) = v10;
    v9[1] = 0;
    v9[2] = 0;
    void *v9 = 0;
    *((_DWORD *)v7 + 14) = 0;
    sub_24FF55888(a1, v12, v8, (uint64_t *)v7);
  }
  return v7;
}

void *sub_24FF557E8(uint64_t a1, void *a2, const void **a3)
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
        uint64_t v8 = (void *)v4;
        v9 = (const void **)(v4 + 32);
        if (!sub_24FF558E0(v7, a3, (const void **)(v4 + 32))) {
          break;
        }
        uint64_t v4 = *v8;
        size_t v5 = v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }
      if (!sub_24FF558E0(v7, v9, a3)) {
        break;
      }
      size_t v5 = v8 + 1;
      uint64_t v4 = v8[1];
    }
    while (v4);
  }
  else
  {
    uint64_t v8 = (void *)(a1 + 8);
  }
LABEL_10:
  *a2 = v8;
  return v5;
}

uint64_t *sub_24FF55888(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  size_t v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  unint64_t result = sub_24FF5594C(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

BOOL sub_24FF558E0(uint64_t a1, const void **a2, const void **a3)
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
    v6 = a2;
  }
  else {
    v6 = *a2;
  }
  if (v3 >= 0) {
    size_t v7 = *((unsigned __int8 *)a3 + 23);
  }
  else {
    size_t v7 = (size_t)a3[1];
  }
  if (v3 >= 0) {
    uint64_t v8 = a3;
  }
  else {
    uint64_t v8 = *a3;
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

uint64_t *sub_24FF5594C(uint64_t *result, uint64_t *a2)
{
  *((unsigned char *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      uint64_t v2 = (uint64_t *)a2[2];
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
            uint64_t v2 = (uint64_t *)*v3;
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
      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), size_t v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          uint64_t v11 = a2[1];
          *uint64_t v2 = v11;
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
        uint64_t v2 = (uint64_t *)v3[1];
        uint64_t v12 = *v2;
        v3[1] = *v2;
        if (v12) {
          *(void *)(v12 + 16) = v3;
        }
        v2[2] = v3[2];
        *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
        *uint64_t v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
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

uint64_t GCLBufferSemanticName(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    result += 56;
    if (*(char *)(v1 + 79) < 0) {
      return *(void *)result;
    }
  }
  return result;
}

uint64_t GCLBufferProperty(uint64_t a1, char *__s, _DWORD *a3)
{
  uint64_t result = 0x8000000000000000;
  if (a1 && __s && a3)
  {
    v7[0] = __s;
    v7[1] = strlen(__s);
    uint64_t v6 = sub_24FF55C54(a1 + 80, (uint64_t)v7);
    if (a1 + 88 == v6)
    {
      return 0x8000000000000000;
    }
    else
    {
      uint64_t result = 0;
      *a3 = *(_DWORD *)(v6 + 56);
    }
  }
  return result;
}

unint64_t GCLBufferSetProperty(uint64_t a1, char *a2, int a3)
{
  unint64_t result = 0x8000000000000000;
  if (a1 && a2)
  {
    sub_24FF555F0(__p, a2);
    int v8 = __p;
    *((_DWORD *)sub_24FF5574C((uint64_t **)(a1 + 80), (const void **)__p, (uint64_t)&unk_24FF7D066, (_OWORD **)&v8) + 14) = a3;
    if (v7 < 0) {
      operator delete(__p[0]);
    }
    return 0;
  }
  return result;
}

void sub_24FF55C18(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  __cxa_begin_catch(a1);
  __cxa_end_catch();
  JUMPOUT(0x24FF55C04);
}

uint64_t GCLBufferId(uint64_t result)
{
  if (result) {
    return *(unsigned int *)(result + 104);
  }
  return result;
}

uint64_t sub_24FF55C54(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + 8;
  uint64_t v3 = *(void *)(a1 + 8);
  if (!v3) {
    return v2;
  }
  uint64_t v5 = a1 + 16;
  uint64_t v6 = a1 + 8;
  do
  {
    int v7 = sub_24FF55CE4(v5, (const void **)(v3 + 32), a2);
    int v8 = (uint64_t *)(v3 + 8);
    if (!v7)
    {
      int v8 = (uint64_t *)v3;
      uint64_t v6 = v3;
    }
    uint64_t v3 = *v8;
  }
  while (*v8);
  if (v6 == v2 || sub_24FF55D44(v5, a2, (const void **)(v6 + 32))) {
    return v2;
  }
  return v6;
}

uint64_t sub_24FF55CE4(uint64_t a1, const void **a2, uint64_t a3)
{
  int v3 = *((char *)a2 + 23);
  if (v3 >= 0) {
    int v4 = a2;
  }
  else {
    int v4 = *a2;
  }
  if (v3 >= 0) {
    size_t v5 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    size_t v5 = (size_t)a2[1];
  }
  uint64_t v6 = *(const void **)a3;
  size_t v7 = *(void *)(a3 + 8);
  if (v7 >= v5) {
    size_t v8 = v5;
  }
  else {
    size_t v8 = *(void *)(a3 + 8);
  }
  int v9 = memcmp(v4, v6, v8);
  if (v5 < v7) {
    unsigned int v10 = -1;
  }
  else {
    unsigned int v10 = 1;
  }
  if (v5 == v7) {
    unsigned int v10 = 0;
  }
  if (v9) {
    unsigned int v10 = v9;
  }
  return v10 >> 31;
}

uint64_t sub_24FF55D44(uint64_t a1, uint64_t a2, const void **a3)
{
  int v3 = *(const void **)a2;
  size_t v4 = *(void *)(a2 + 8);
  int v5 = *((char *)a3 + 23);
  if (v5 >= 0) {
    uint64_t v6 = a3;
  }
  else {
    uint64_t v6 = *a3;
  }
  if (v5 >= 0) {
    size_t v7 = *((unsigned __int8 *)a3 + 23);
  }
  else {
    size_t v7 = (size_t)a3[1];
  }
  if (v7 >= v4) {
    size_t v8 = v4;
  }
  else {
    size_t v8 = v7;
  }
  int v9 = memcmp(v3, v6, v8);
  if (v4 < v7) {
    unsigned int v10 = -1;
  }
  else {
    unsigned int v10 = 1;
  }
  if (v4 == v7) {
    unsigned int v10 = 0;
  }
  if (v9) {
    unsigned int v10 = v9;
  }
  return v10 >> 31;
}

uint64_t sub_24FF55DA4(_DWORD *a1, uint64_t a2, _DWORD *a3, uint64_t a4)
{
  uint64_t v4 = 3;
  if (a1 && (a2 & 0x8000000000000000) == 0 && (unint64_t)a2 >= 4)
  {
    if ((a2 & 0xFFFFFFFFFFFFFFFCLL) == 4 || (unint64_t)a2 < 0x10 || a1 == (_DWORD *)-16 || !a4)
    {
      return 3;
    }
    else
    {
      int v5 = (unsigned __int8 *)(a1 + 2);
      uint64_t v6 = 4 * a4;
      unint64_t v7 = a1[3];
      while (*a3 != *a1)
      {
        ++a3;
        uint64_t v4 = 3;
        v6 -= 4;
        if (!v6) {
          return v4;
        }
      }
      uint64_t v9 = 16;
      if (a2 > 16) {
        uint64_t v9 = a2;
      }
      uint64_t v4 = 3;
      BOOL v10 = (a2 & (unint64_t)~(a2 >> 63)) - v9 + 16 > v7 || a2 < (uint64_t)v7;
      if (!v10 && a1 != (_DWORD *)-8 && (unsigned __int8 *)((char *)a1 + v7) >= v5)
      {
        unsigned int v11 = -1;
        for (unint64_t i = v7 - 8; i; --i)
        {
          int v13 = *v5++;
          unsigned int v11 = dword_24FF7D068[v13 ^ HIBYTE(v11)] ^ (v11 << 8);
        }
        if (a1[1] == v11) {
          return 0;
        }
        else {
          return 3;
        }
      }
    }
  }
  return v4;
}

uint64_t GCLBufferListBegin(uint64_t result)
{
  if (result) {
    return *(void *)(result + 8);
  }
  return result;
}

uint64_t GCLBufferListIterNext(uint64_t result)
{
  if (result) {
    return *(void *)(result + 8);
  }
  return result;
}

uint64_t GCLBufferForBufferListIter(uint64_t a1)
{
  if (a1) {
    return a1 + 16;
  }
  else {
    return 0;
  }
}

uint64_t sub_24FF55EB4(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263F8C328] + 104;
  *(void *)(a1 + 128) = MEMORY[0x263F8C328] + 104;
  uint64_t v3 = a1 + 16;
  uint64_t v4 = MEMORY[0x263F8C328] + 64;
  *(void *)(a1 + 16) = MEMORY[0x263F8C328] + 64;
  int v5 = (void *)MEMORY[0x263F8C2B8];
  uint64_t v6 = *(void *)(MEMORY[0x263F8C2B8] + 24);
  uint64_t v7 = *(void *)(MEMORY[0x263F8C2B8] + 16);
  *(void *)a1 = v7;
  *(void *)(a1 + *(void *)(v7 - 24)) = v6;
  *(void *)(a1 + 8) = 0;
  size_t v8 = (std::ios_base *)(a1 + *(void *)(*(void *)a1 - 24));
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

void sub_24FF56164(_Unwind_Exception *a1)
{
  std::iostream::~basic_iostream();
  MEMORY[0x25337C9F0](v1);
  _Unwind_Resume(a1);
}

uint64_t sub_24FF5618C(uint64_t a1)
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
  MEMORY[0x25337C9F0](a1 + 128);
  return a1;
}

void sub_24FF562C4(void *a1)
{
}

void *sub_24FF562D8(void *a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x25337C920](v13, a1);
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
    if (!sub_24FF5647C(v7, a2, v11, a2 + a3, v6, (char)v9)) {
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | 5);
    }
  }
  MEMORY[0x25337C930](v13);
  return a1;
}

void sub_24FF56414(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  MEMORY[0x25337C930](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(void *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x24FF563F4);
}

void sub_24FF56468(_Unwind_Exception *a1)
{
}

uint64_t sub_24FF5647C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
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
      sub_24FF56604(__p, v12, __c);
      int v13 = v18 >= 0 ? __p : (void **)__p[0];
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

void sub_24FF565E8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *sub_24FF56604(void *__b, size_t __len, int __c)
{
  if (__len >= 0x7FFFFFFFFFFFFFF8) {
    sub_24FF556A4();
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

unint64_t GCLOptionsNew(void *a1)
{
  if (!a1) {
    return 0x8000000000000000;
  }
  uint64_t v2 = operator new(0x18uLL);
  unint64_t result = 0;
  v2[2] = 0;
  v2[1] = 0;
  *uint64_t v2 = v2 + 1;
  *a1 = v2;
  return result;
}

void sub_24FF56704(void *a1)
{
}

void GCLOptionsRelease(char **a1)
{
  if (a1)
  {
    sub_24FF5558C((uint64_t)a1, a1[1]);
    operator delete(a1);
  }
}

uint64_t GCLOptionsGet(uint64_t a1, char *__s, _DWORD *a3)
{
  uint64_t result = 0x8000000000000000;
  if (a1 && __s && a3)
  {
    v7[0] = __s;
    v7[1] = strlen(__s);
    uint64_t v6 = sub_24FF55C54(a1, (uint64_t)v7);
    if (a1 + 8 == v6)
    {
      return 0x8000000000000000;
    }
    else
    {
      uint64_t result = 0;
      *a3 = *(_DWORD *)(v6 + 56);
    }
  }
  return result;
}

unint64_t GCLOptionsSet(uint64_t **a1, char *a2, int a3)
{
  unint64_t result = 0x8000000000000000;
  if (a1 && a2)
  {
    sub_24FF555F0(__p, a2);
    size_t v8 = __p;
    *((_DWORD *)sub_24FF5574C(a1, (const void **)__p, (uint64_t)&unk_24FF7D066, (_OWORD **)&v8) + 14) = a3;
    if (v7 < 0) {
      operator delete(__p[0]);
    }
    return 0;
  }
  return result;
}

void sub_24FF56868(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  __cxa_begin_catch(a1);
  __cxa_end_catch();
  JUMPOUT(0x24FF56854);
}

unint64_t GCLBufferListFromSource(uint64_t a1, uint64_t **a2)
{
  if (!a2) {
    return 0x8000000000000000;
  }
  *a2 = 0;
  if (!a1) {
    return 0x8000000000000000;
  }
  uint64_t v4 = (uint64_t *)operator new(0x18uLL);
  *uint64_t v4 = (uint64_t)v4;
  v4[1] = (uint64_t)v4;
  v4[2] = 0;
  unint64_t v5 = sub_24FF5C700(a1, v4);
  if (v5)
  {
    sub_24FF56B88((char *)v4);
    operator delete(v4);
  }
  else
  {
    *a2 = v4;
  }
  return v5;
}

unint64_t GCLBufferListNew(void *a1)
{
  if (!a1) {
    return 0x8000000000000000;
  }
  uint64_t v2 = operator new(0x18uLL);
  unint64_t result = 0;
  *uint64_t v2 = v2;
  v2[1] = v2;
  v2[2] = 0;
  *a1 = v2;
  return result;
}

void sub_24FF56990(void *a1)
{
}

void GCLBufferListRelease(char *a1)
{
  if (a1)
  {
    sub_24FF56B88(a1);
    operator delete(a1);
  }
}

uint64_t GCLBufferListGetBuffer(uint64_t a1, char *__s)
{
  uint64_t result = 0;
  if (a1 && __s)
  {
    uint64_t v5 = *(void *)(a1 + 8);
    if (v5 == a1) {
      return 0;
    }
    size_t v6 = strlen(__s);
    while (1)
    {
      char v7 = (void *)(v5 + 72);
      if (*(char *)(v5 + 95) < 0)
      {
        if (v6 != *(void *)(v5 + 80)) {
          goto LABEL_13;
        }
        if (v6 == -1) {
LABEL_17:
        }
          sub_24FF56C24();
        char v7 = (void *)*v7;
      }
      else
      {
        if (v6 != *(unsigned __int8 *)(v5 + 95)) {
          goto LABEL_13;
        }
        if (v6 == -1) {
          goto LABEL_17;
        }
      }
      if (!memcmp(v7, __s, v6)) {
        return v5 + 16;
      }
LABEL_13:
      uint64_t v5 = *(void *)(v5 + 8);
      if (v5 == a1) {
        return 0;
      }
    }
  }
  return result;
}

uint64_t GCLBufferListGetBufferById(uint64_t result, int a2)
{
  if (result)
  {
    uint64_t v2 = result;
    while (1)
    {
      uint64_t v2 = *(void *)(v2 + 8);
      if (v2 == result) {
        break;
      }
      if (*(void *)(v2 + 120) == a2) {
        return v2 + 16;
      }
    }
    return 0;
  }
  return result;
}

unint64_t GCLBufferListAppendNew(uint64_t *a1, char *a2, int a3, uint64_t a4, uint64_t a5, void *a6)
{
  unint64_t result = 0x8000000000000000;
  if (a1 && a2)
  {
    uint64_t v15 = a2;
    int v14 = a3;
    uint64_t v12 = a5;
    uint64_t v13 = a4;
    uint64_t v11 = a1[2];
    int v9 = sub_24FF56CCC((uint64_t)a1, 0, 0, &v11, &v15, &v14, &v13, &v12);
    v9[1] = a1;
    uint64_t v10 = *a1;
    void *v9 = *a1;
    *(void *)(v10 + 8) = v9;
    *a1 = (uint64_t)v9;
    ++a1[2];
    unint64_t result = 0;
    if (a6) {
      *a6 = v9 + 2;
    }
  }
  return result;
}

void sub_24FF56B78(void *a1)
{
}

void sub_24FF56B88(char *a1)
{
  if (*((void *)a1 + 2))
  {
    uint64_t v2 = *(void *)a1;
    uint64_t v3 = (char *)*((void *)a1 + 1);
    uint64_t v4 = *(void *)v3;
    *(void *)(v4 + 8) = *(void *)(*(void *)a1 + 8);
    **(void **)(v2 + 8) = v4;
    *((void *)a1 + 2) = 0;
    if (v3 != a1)
    {
      do
      {
        uint64_t v5 = (char *)*((void *)v3 + 1);
        sub_24FF5558C((uint64_t)(v3 + 96), *((char **)v3 + 13));
        if (v3[95] < 0) {
          operator delete(*((void **)v3 + 9));
        }
        if (v3[64])
        {
          size_t v6 = (void *)*((void *)v3 + 2);
          if (v6) {
            operator delete[](v6);
          }
        }
        operator delete(v3);
        uint64_t v3 = v5;
      }
      while (v5 != a1);
    }
  }
}

void sub_24FF56C24()
{
}

void sub_24FF56C3C(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_24FF56C98(exception, a1);
  __cxa_throw(exception, (struct type_info *)&unk_270164EC0, MEMORY[0x263F8C068]);
}

void sub_24FF56C84(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_24FF56C98(std::logic_error *a1, const char *a2)
{
  unint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C390] + 16);
  return result;
}

void *sub_24FF56CCC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, char **a5, int *a6, uint64_t *a7, uint64_t *a8)
{
  uint64_t v15 = a1 + 16;
  v16 = operator new(0x80uLL);
  void *v16 = a2;
  v16[1] = a3;
  sub_24FF56D70(v15, (uint64_t)(v16 + 2), a4, a5, a6, a7, a8);
  return v16;
}

void sub_24FF56D5C(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *sub_24FF56D70(uint64_t a1, uint64_t a2, uint64_t *a3, char **a4, int *a5, uint64_t *a6, uint64_t *a7)
{
  uint64_t v8 = *a3;
  int v9 = *a4;
  int v10 = *a5;
  uint64_t v11 = *a6;
  uint64_t v12 = *a7;
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  *(_DWORD *)(a2 + 16) = v10;
  *(void *)(a2 + 24) = v11;
  *(void *)(a2 + 32) = v12;
  *(void *)(a2 + 40) = v12;
  *(unsigned char *)(a2 + 48) = 0;
  unint64_t result = sub_24FF555F0((void *)(a2 + 56), v9);
  *(void *)(a2 + 88) = 0;
  a2 += 88;
  *(void *)(a2 - 8) = a2;
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = v8;
  return result;
}

void sub_24FF56DCC(_Unwind_Exception *exception_object)
{
  if (*(unsigned char *)(v1 + 48))
  {
    if (*(void *)v1) {
      operator delete[](*(void **)v1);
    }
  }
  _Unwind_Resume(exception_object);
}

uint64_t GCLBufferElementType(uint64_t result)
{
  if (result) {
    return *(unsigned int *)(result + 16);
  }
  return result;
}

uint64_t GCLBufferSetElementType(uint64_t result, int a2)
{
  if (result) {
    *(_DWORD *)(result + 16) = a2;
  }
  return result;
}

uint64_t GCLBufferNumRows(uint64_t result)
{
  if (result) {
    return *(void *)(result + 24);
  }
  return result;
}

uint64_t GCLBufferTupleWidth(uint64_t result)
{
  if (result) {
    return *(void *)(result + 32);
  }
  return result;
}

void *GCLBufferData(void *result)
{
  if (result) {
    return (void *)(*result + result[1]);
  }
  return result;
}

uint64_t GCLBufferBase(uint64_t result)
{
  if (result) {
    return *(void *)result;
  }
  return result;
}

void *GCLBufferSetBase(void *result, uint64_t a2)
{
  if (result) {
    *unint64_t result = a2;
  }
  return result;
}

uint64_t GCLBufferOffset(uint64_t result)
{
  if (result) {
    return *(void *)(result + 8);
  }
  return result;
}

uint64_t GCLBufferSetOffset(uint64_t result, uint64_t a2)
{
  if (result) {
    *(void *)(result + 8) = a2;
  }
  return result;
}

uint64_t GCLBufferStrideBytes(uint64_t result)
{
  if (result) {
    return *(void *)(result + 40) * *(unsigned __int8 *)(result + 16);
  }
  return result;
}

int *sub_24FF56E70(int *result, int *a2, int *a3, int a4, int *a5, int *a6, int *a7, int *a8, _DWORD *a9)
{
  uint64_t v10 = *a7;
  uint64_t v11 = a7[1];
  uint64_t v12 = *a5 - v10;
  uint64_t v13 = a5[1] - v11;
  uint64_t v14 = a7[2];
  uint64_t v15 = a5[2] - v14;
  uint64_t v16 = *a6 - v10;
  uint64_t v17 = a6[1] - v11;
  uint64_t v18 = a6[2] - v14;
  uint64_t v19 = *a8 - v10;
  uint64_t v20 = a8[1] - v11;
  uint64_t v21 = a8[2] - v14;
  unint64_t v22 = v12 * v12 + v13 * v13 + v15 * v15;
  unint64_t v23 = v16 * v16 + v17 * v17 + v18 * v18;
  if (v22 >> 30) {
    BOOL v24 = 0;
  }
  else {
    BOOL v24 = v23 >> 30 == 0;
  }
  if (v24 && (unint64_t)(v19 * v19 + v20 * v20 + v21 * v21) >> 30 == 0)
  {
    uint64_t v32 = v16 * v12 + v17 * v13 + v18 * v15;
    unint64_t v33 = v23 * v22 - v32 * v32;
    if (v33)
    {
      uint64_t v34 = v19 * v12 + v20 * v13 + v21 * v15;
      uint64_t v35 = v19 * v16 + v20 * v17 + v21 * v18;
      if (v33 >= 0x80)
      {
        char v44 = __clz(v33);
        char v45 = 57 - v44;
        uint64_t v46 = 1 << (56 - v44);
        unint64_t v33 = (uint64_t)(v46 + v33) >> v45;
        uint64_t v47 = v34 * v23 - v35 * v32;
        if (v47 < 0) {
          uint64_t v36 = -(uint64_t)((unint64_t)(v46 - v47) >> v45);
        }
        else {
          uint64_t v36 = (unint64_t)(v46 + v47) >> v45;
        }
        if (v36 >= 0x3FFFFFFFFFFFLL) {
          uint64_t v36 = 0x3FFFFFFFFFFFLL;
        }
        if (v36 <= (uint64_t)0xFFFFC00000000001) {
          uint64_t v36 = 0xFFFFC00000000001;
        }
        uint64_t v48 = v35 * v22 - v34 * v32;
        if (v48 < 0) {
          uint64_t v37 = -(uint64_t)((unint64_t)(v46 - v48) >> v45);
        }
        else {
          uint64_t v37 = (unint64_t)(v46 + v48) >> v45;
        }
      }
      else
      {
        uint64_t v36 = v34 * v23 - v35 * v32;
        if (v36 >= 0x3FFFFFFFFFFFLL) {
          uint64_t v36 = 0x3FFFFFFFFFFFLL;
        }
        if (v36 <= (uint64_t)0xFFFFC00000000001) {
          uint64_t v36 = 0xFFFFC00000000001;
        }
        uint64_t v37 = v35 * v22 - v34 * v32;
      }
      if (v37 >= 0x3FFFFFFFFFFFLL) {
        uint64_t v37 = 0x3FFFFFFFFFFFLL;
      }
      unint64_t v49 = 0xFFFFC00000000001;
      if (v37 > (uint64_t)0xFFFFC00000000001) {
        unint64_t v49 = v37;
      }
      uint64_t v50 = word_24FF7D4F2[v33 - 1];
      if (v36 * v50 >= 0x3FFFFFFF) {
        uint64_t v51 = 0x3FFFFFFFLL;
      }
      else {
        uint64_t v51 = v36 * v50;
      }
      if (v51 <= -1073741823) {
        uint64_t v51 = -1073741823;
      }
      uint64_t v52 = v49 * v50;
      if (v52 >= 0x3FFFFFFF) {
        uint64_t v52 = 0x3FFFFFFFLL;
      }
      if (v52 <= -1073741823) {
        uint64_t v52 = -1073741823;
      }
      if (a4 >= 1)
      {
        uint64_t v53 = a4;
        do
        {
          uint64_t v55 = *result++;
          uint64_t v54 = v55;
          uint64_t v56 = *a2++;
          uint64_t v57 = v51 * v54 + v52 * v56;
          uint64_t v58 = *a3++;
          uint64_t v59 = v57 + (0x10000 - (v51 + v52)) * v58;
          if (v59 >= 0) {
            int64_t v60 = (unint64_t)(v59 + 0x8000) >> 16;
          }
          else {
            int64_t v60 = -(uint64_t)((unint64_t)(0x8000 - v59) >> 16);
          }
          if (v60 >= 0x3FFFFFFF) {
            int64_t v60 = 0x3FFFFFFFLL;
          }
          if (v60 <= -1073741823) {
            LODWORD(v60) = -1073741823;
          }
          *a9++ = v60;
          --v53;
        }
        while (v53);
      }
    }
    else if (a4 >= 1)
    {
      uint64_t v38 = a4;
      do
      {
        int v40 = *result++;
        int v39 = v40;
        int v42 = *a2++;
        int v41 = v42;
        int v43 = *a3++;
        *a9++ = v41 + v39 - v43;
        --v38;
      }
      while (v38);
    }
  }
  else if (a4 >= 1)
  {
    uint64_t v26 = a4;
    do
    {
      int v28 = *result++;
      int v27 = v28;
      int v30 = *a2++;
      int v29 = v30;
      int v31 = *a3++;
      *a9++ = v29 + v27 - v31;
      --v26;
    }
    while (v26);
  }
  return result;
}

int *sub_24FF57110(int *result, int *a2, int *a3, _DWORD *a4, _DWORD *a5, int *a6, int *a7, _DWORD *a8)
{
  *a8 = 0;
  int v8 = a5[1];
  int v9 = a4[1];
  int v10 = a5[2];
  int v11 = a4[2];
  unint64_t v12 = (v8 - v9) * (uint64_t)(v8 - v9) + (*a5 - *a4) * (uint64_t)(*a5 - *a4) + (v10 - v11) * (uint64_t)(v10 - v11);
  int v13 = *a6;
  int v14 = a6[1];
  int v15 = a6[2];
  unint64_t v16 = (v14 - v9) * (uint64_t)(v14 - v9) + (v13 - *a4) * (uint64_t)(v13 - *a4) + (v15 - v11) * (uint64_t)(v15 - v11);
  unint64_t v17 = (v14 - v8) * (uint64_t)(v14 - v8) + (v13 - *a5) * (uint64_t)(v13 - *a5) + (v15 - v10) * (uint64_t)(v15 - v10);
  if (v12 >> 28) {
    BOOL v18 = 0;
  }
  else {
    BOOL v18 = v16 >> 28 == 0;
  }
  if (!v18 || v17 >> 28 != 0 || v12 == 0)
  {
    int v21 = *a2 + *result;
    if (v21 < 0 != __OFADD__(*a2, *result)) {
      ++v21;
    }
    *a7 = v21 >> 1;
    int v22 = result[1];
    int v23 = a2[1];
    BOOL v24 = __OFADD__(v23, v22);
    int v25 = v23 + v22;
    if (v25 < 0 != v24) {
      ++v25;
    }
    LODWORD(v26) = v25 >> 1;
  }
  else
  {
    char v27 = __clz(v12);
    uint64_t v28 = 1 << (56 - v27);
    if (v12 >= 0x80)
    {
      unint64_t v17 = (v28 + v17) >> (57 - v27);
      unint64_t v16 = (v28 + v16) >> (57 - v27);
      unint64_t v12 = (v28 + v12) >> (57 - v27);
    }
    uint64_t v29 = word_24FF7D4F2[v12 - 1];
    uint64_t v30 = (v16 - v17) * v29;
    uint64_t v31 = 1073676288;
    if (v30 < 1073676288) {
      uint64_t v31 = v30;
    }
    uint64_t v32 = v31 + 0x10000;
    BOOL v33 = v30 < -1073807360;
    uint64_t v34 = -1073741824;
    if (!v33) {
      uint64_t v34 = v32;
    }
    uint64_t v35 = ((v16 * v29) << 18) - v34 * v34;
    if (v35 >= 0xFFFFFFFFLL) {
      uint64_t v35 = 0xFFFFFFFFLL;
    }
    LODWORD(v36) = v35 & ~(v35 >> 63);
    uint64_t v37 = *result;
    uint64_t v38 = result[1];
    uint64_t v39 = *a2 - v37;
    uint64_t v40 = a2[1] - v38;
    uint64_t v41 = a3[1] - v38;
    unsigned int v42 = __clz(v36);
    unsigned int v43 = ((v36 >> ((32 - v42) >> 1)) + (1 << ((32 - v42) >> 1))) >> 1;
    if (v36 >= 2) {
      uint64_t v36 = v43;
    }
    else {
      uint64_t v36 = v36;
    }
    if ((*a3 - v37) * v40 < v41 * v39)
    {
      uint64_t v36 = -v36;
      *a8 = 1;
      LODWORD(v37) = *result;
    }
    uint64_t v44 = (int)v37;
    uint64_t v45 = v34 * v39 + v36 * v40;
    if (v45 >= 0) {
      unint64_t v46 = (unint64_t)(v45 + 0x10000) >> 17;
    }
    else {
      unint64_t v46 = -(uint64_t)((unint64_t)(0x10000 - v45) >> 17);
    }
    uint64_t v47 = v46 + v44;
    uint64_t v48 = v34 * v40 - v36 * v39;
    if (v48 >= 0) {
      unint64_t v49 = (unint64_t)(v48 + 0x10000) >> 17;
    }
    else {
      unint64_t v49 = -(uint64_t)((unint64_t)(0x10000 - v48) >> 17);
    }
    uint64_t v50 = v49 + result[1];
    if (v47 >= 0x3FFFFFFF) {
      uint64_t v47 = 0x3FFFFFFFLL;
    }
    if (v47 <= -1073741823) {
      LODWORD(v47) = -1073741823;
    }
    *a7 = v47;
    if (v50 >= 0x3FFFFFFF) {
      uint64_t v26 = 0x3FFFFFFFLL;
    }
    else {
      uint64_t v26 = v50;
    }
    if (v26 <= -1073741823) {
      LODWORD(v26) = -1073741823;
    }
  }
  a7[1] = v26;
  return result;
}

int *sub_24FF57350(int *result, int *a2, _DWORD *a3, _DWORD *a4, int *a5, int a6, int *a7)
{
  int v7 = a4[1];
  int v8 = a3[1];
  int v9 = a4[2];
  int v10 = a3[2];
  unint64_t v11 = (v7 - v8) * (uint64_t)(v7 - v8) + (*a4 - *a3) * (uint64_t)(*a4 - *a3) + (v9 - v10) * (uint64_t)(v9 - v10);
  int v12 = *a5;
  int v13 = a5[1];
  int v14 = a5[2];
  unint64_t v15 = (v13 - v8) * (uint64_t)(v13 - v8) + (v12 - *a3) * (uint64_t)(v12 - *a3) + (v14 - v10) * (uint64_t)(v14 - v10);
  unint64_t v16 = (v13 - v7) * (uint64_t)(v13 - v7) + (v12 - *a4) * (uint64_t)(v12 - *a4) + (v14 - v9) * (uint64_t)(v14 - v9);
  if (v11 >> 28) {
    BOOL v17 = 0;
  }
  else {
    BOOL v17 = v15 >> 28 == 0;
  }
  if (!v17 || v16 >> 28 != 0 || v11 == 0)
  {
    int v20 = *a2 + *result;
    if (v20 < 0 != __OFADD__(*a2, *result)) {
      ++v20;
    }
    *a7 = v20 >> 1;
    int v21 = result[1];
    int v22 = a2[1];
    BOOL v23 = __OFADD__(v22, v21);
    int v24 = v22 + v21;
    if (v24 < 0 != v23) {
      ++v24;
    }
    LODWORD(v25) = v24 >> 1;
  }
  else
  {
    char v26 = __clz(v11);
    char v27 = 57 - v26;
    uint64_t v28 = 1 << (56 - v26);
    unint64_t v29 = (v28 + v11) >> v27;
    unint64_t v30 = (v28 + v15) >> v27;
    unint64_t v31 = (v28 + v16) >> v27;
    if (v11 >= 0x80)
    {
      unint64_t v16 = v31;
      unint64_t v15 = v30;
      unint64_t v11 = v29;
    }
    uint64_t v32 = word_24FF7D4F2[v11 - 1];
    uint64_t v33 = (v15 - v16) * v32;
    uint64_t v34 = 1073676288;
    if (v33 < 1073676288) {
      uint64_t v34 = v33;
    }
    uint64_t v35 = v34 + 0x10000;
    BOOL v36 = v33 < -1073807360;
    uint64_t v37 = -1073741824;
    if (!v36) {
      uint64_t v37 = v35;
    }
    uint64_t v38 = ((v15 * v32) << 18) - v37 * v37;
    if (v38 >= 0xFFFFFFFFLL) {
      uint64_t v38 = 0xFFFFFFFFLL;
    }
    LODWORD(v38) = v38 & ~(v38 >> 63);
    uint64_t v39 = *result;
    uint64_t v40 = result[1];
    uint64_t v41 = *a2 - v39;
    uint64_t v42 = a2[1] - v40;
    unsigned int v43 = __clz(v38);
    if (v38 >= 2) {
      uint64_t v38 = ((v38 >> ((32 - v43) >> 1)) + (1 << ((32 - v43) >> 1))) >> 1;
    }
    else {
      uint64_t v38 = v38;
    }
    uint64_t v44 = v38 * *((int *)&unk_24FF7D5F8 + a6);
    uint64_t v45 = v37 * v41 + v44 * v42;
    if (v45 >= 0) {
      unint64_t v46 = (unint64_t)(v45 + 0x10000) >> 17;
    }
    else {
      unint64_t v46 = -(uint64_t)((unint64_t)(0x10000 - v45) >> 17);
    }
    uint64_t v47 = v46 + v39;
    uint64_t v48 = v37 * v42 - v44 * v41;
    if (v48 >= 0) {
      unint64_t v49 = (unint64_t)(v48 + 0x10000) >> 17;
    }
    else {
      unint64_t v49 = -(uint64_t)((unint64_t)(0x10000 - v48) >> 17);
    }
    uint64_t v25 = v49 + v40;
    if (v47 >= 0x3FFFFFFF) {
      uint64_t v50 = 0x3FFFFFFFLL;
    }
    else {
      uint64_t v50 = v47;
    }
    if (v50 <= -1073741823) {
      LODWORD(v50) = -1073741823;
    }
    *a7 = v50;
    if (v25 >= 0x3FFFFFFF) {
      uint64_t v25 = 0x3FFFFFFFLL;
    }
    if (v25 <= -1073741823) {
      LODWORD(v25) = -1073741823;
    }
  }
  a7[1] = v25;
  return result;
}

unint64_t sub_24FF5756C(unint64_t result, int *a2, int *a3, _DWORD *a4, _DWORD *a5, int *a6, int *a7)
{
  int v7 = a5[1];
  int v8 = a4[1];
  int v9 = a5[2];
  int v10 = a4[2];
  unint64_t v11 = (v7 - v8) * (uint64_t)(v7 - v8) + (*a5 - *a4) * (uint64_t)(*a5 - *a4) + (v9 - v10) * (uint64_t)(v9 - v10);
  int v12 = *a6;
  int v13 = a6[1];
  int v14 = a6[2];
  unint64_t v15 = (v13 - v8) * (uint64_t)(v13 - v8) + (v12 - *a4) * (uint64_t)(v12 - *a4) + (v14 - v10) * (uint64_t)(v14 - v10);
  unint64_t v16 = (v13 - v7) * (uint64_t)(v13 - v7) + (v12 - *a5) * (uint64_t)(v12 - *a5) + (v14 - v9) * (uint64_t)(v14 - v9);
  if (v11 >> 28) {
    BOOL v17 = 0;
  }
  else {
    BOOL v17 = v15 >> 28 == 0;
  }
  if (!v17 || v16 >> 28 != 0 || v11 == 0)
  {
    int v20 = *a2 + *(_DWORD *)result;
    if (v20 < 0 != __OFADD__(*a2, *(_DWORD *)result)) {
      ++v20;
    }
    *a7 = v20 >> 1;
    int v21 = *(_DWORD *)(result + 4);
    int v22 = a2[1];
    BOOL v23 = __OFADD__(v22, v21);
    int v24 = v22 + v21;
    if (v24 < 0 != v23) {
      ++v24;
    }
    LODWORD(v25) = v24 >> 1;
  }
  else
  {
    char v26 = __clz(v11);
    char v27 = 57 - v26;
    uint64_t v28 = 1 << (56 - v26);
    unint64_t v29 = (v28 + v11) >> v27;
    unint64_t v30 = (v28 + v15) >> v27;
    unint64_t v31 = (v28 + v16) >> v27;
    if (v11 >= 0x80)
    {
      unint64_t v16 = v31;
      unint64_t v15 = v30;
      unint64_t v11 = v29;
    }
    uint64_t v32 = word_24FF7D4F2[v11 - 1];
    uint64_t v33 = (v15 - v16) * v32;
    uint64_t v34 = 1073676288;
    if (v33 < 1073676288) {
      uint64_t v34 = v33;
    }
    uint64_t v35 = v34 + 0x10000;
    BOOL v36 = v33 < -1073807360;
    uint64_t v37 = -1073741824;
    if (!v36) {
      uint64_t v37 = v35;
    }
    uint64_t v38 = ((v15 * v32) << 18) - v37 * v37;
    if (v38 >= 0xFFFFFFFFLL) {
      uint64_t v38 = 0xFFFFFFFFLL;
    }
    LODWORD(v38) = v38 & ~(v38 >> 63);
    uint64_t v39 = *(int *)result;
    uint64_t v40 = *(int *)(result + 4);
    uint64_t v41 = *a2 - v39;
    uint64_t v42 = a2[1] - v40;
    unsigned int v43 = (32 - __clz(v38)) >> 1;
    unint64_t result = v38 >> v43;
    if (v38 >= 2) {
      uint64_t v38 = (result + (1 << v43)) >> 1;
    }
    else {
      uint64_t v38 = v38;
    }
    if ((v40 - a3[1]) * v41 < (v39 - *a3) * v42) {
      uint64_t v38 = -v38;
    }
    uint64_t v44 = v37 * v41 - v38 * v42;
    if (v44 >= 0) {
      unint64_t v45 = (unint64_t)(v44 + 0x10000) >> 17;
    }
    else {
      unint64_t v45 = -(uint64_t)((unint64_t)(0x10000 - v44) >> 17);
    }
    uint64_t v46 = v45 + v39;
    uint64_t v47 = v37 * v42 + v38 * v41;
    if (v47 >= 0) {
      unint64_t v48 = (unint64_t)(v47 + 0x10000) >> 17;
    }
    else {
      unint64_t v48 = -(uint64_t)((unint64_t)(0x10000 - v47) >> 17);
    }
    uint64_t v25 = v48 + v40;
    if (v46 >= 0x3FFFFFFF) {
      uint64_t v49 = 0x3FFFFFFFLL;
    }
    else {
      uint64_t v49 = v46;
    }
    if (v49 <= -1073741823) {
      LODWORD(v49) = -1073741823;
    }
    *a7 = v49;
    if (v25 >= 0x3FFFFFFF) {
      uint64_t v25 = 0x3FFFFFFFLL;
    }
    if (v25 <= -1073741823) {
      LODWORD(v25) = -1073741823;
    }
  }
  a7[1] = v25;
  return result;
}

void sub_24FF57794(void **a1, unint64_t a2)
{
  if (a2 > ((unsigned char *)a1[2] - (unsigned char *)*a1) >> 3)
  {
    if (a2 >> 61) {
      sub_24FF5A660();
    }
    int64_t v3 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    uint64_t v4 = (char *)sub_24FF5A678(a2);
    uint64_t v5 = &v4[v3 & 0xFFFFFFFFFFFFFFF8];
    int v7 = &v4[8 * v6];
    int v9 = (char *)*a1;
    int v8 = (char *)a1[1];
    int v10 = v5;
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
      int v8 = (char *)*a1;
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

void sub_24FF5783C(uint64_t a1, uint64_t a2, uint64_t a3, const char **a4)
{
  uint64_t v8 = a3 + 80;
  int v9 = a4[1];
  uint64_t v50 = v9;
  size_t v51 = strlen(v9);
  uint64_t v10 = sub_24FF55C54(v8, (uint64_t)&v50);
  uint64_t v11 = v10;
  if (a3 + 88 == v10)
  {
    size_t v14 = strlen(a4[2]);
    uint64_t v50 = a4[2];
    size_t v51 = v14;
    uint64_t v15 = sub_24FF55C54(v8, (uint64_t)&v50);
    if (v11 != v15)
    {
      int v16 = *(_DWORD *)(v15 + 56);
      BOOL v17 = *a4;
      *(void *)(a1 + 8) = 0;
      *(void *)(a1 + 16) = 0;
      *(void *)a1 = 0;
      sub_24FF57794((void **)a1, *(void *)(a2 + 16));
      uint64_t v18 = *(void *)(a2 + 8);
      if (v18 == a2) {
        return;
      }
      while (1)
      {
        if (!v17)
        {
LABEL_16:
          uint64_t v50 = "tag";
          size_t v51 = 3;
          uint64_t v21 = sub_24FF55C54(v18 + 96, (uint64_t)&v50);
          if (v18 + 104 != v21 && *(_DWORD *)(v21 + 56) == v16)
          {
            uint64_t v22 = v18 + 16;
            int v24 = *(void **)(a1 + 8);
            unint64_t v23 = *(void *)(a1 + 16);
            if ((unint64_t)v24 >= v23)
            {
              char v26 = *(void **)a1;
              uint64_t v27 = ((uint64_t)v24 - *(void *)a1) >> 3;
              unint64_t v28 = v27 + 1;
              if ((unint64_t)(v27 + 1) >> 61) {
                sub_24FF5A660();
              }
              uint64_t v29 = v23 - (void)v26;
              if (v29 >> 2 > v28) {
                unint64_t v28 = v29 >> 2;
              }
              if ((unint64_t)v29 >= 0x7FFFFFFFFFFFFFF8) {
                unint64_t v30 = 0x1FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v30 = v28;
              }
              if (v30) {
                unint64_t v30 = (unint64_t)sub_24FF5A678(v30);
              }
              else {
                uint64_t v31 = 0;
              }
              uint64_t v32 = (void *)(v30 + 8 * v27);
              *uint64_t v32 = v22;
              uint64_t v25 = v32 + 1;
              if (v24 != v26)
              {
                do
                {
                  uint64_t v33 = *--v24;
                  *--uint64_t v32 = v33;
                }
                while (v24 != v26);
                int v24 = v26;
              }
              *(void *)a1 = v32;
              *(void *)(a1 + 8) = v25;
              *(void *)(a1 + 16) = v30 + 8 * v31;
              if (v24) {
                operator delete(v24);
              }
            }
            else
            {
              *int v24 = v22;
              uint64_t v25 = v24 + 1;
            }
            *(void *)(a1 + 8) = v25;
          }
          goto LABEL_35;
        }
        uint64_t v19 = (void *)(v18 + 72);
        size_t v20 = strlen(v17);
        if (*(char *)(v18 + 95) < 0)
        {
          if (v20 != *(void *)(v18 + 80)) {
            goto LABEL_35;
          }
          if (v20 == -1) {
            sub_24FF56C24();
          }
          uint64_t v19 = (void *)*v19;
        }
        else if (v20 != *(unsigned __int8 *)(v18 + 95))
        {
          goto LABEL_35;
        }
        if (!memcmp(v19, v17, v20)) {
          goto LABEL_16;
        }
LABEL_35:
        uint64_t v18 = *(void *)(v18 + 8);
        if (v18 == a2) {
          return;
        }
      }
    }
    uint64_t v34 = *a4;
    *(void *)(a1 + 8) = 0;
    *(void *)(a1 + 16) = 0;
    *(void *)a1 = 0;
    sub_24FF57794((void **)a1, *(void *)(a2 + 16));
    uint64_t v35 = *(void *)(a2 + 8);
    if (v35 == a2) {
      return;
    }
    while (1)
    {
      if (!v34)
      {
LABEL_47:
        uint64_t v50 = "tag";
        size_t v51 = 3;
        if (v35 + 104 == sub_24FF55C54(v35 + 96, (uint64_t)&v50))
        {
          uint64_t v38 = v35 + 16;
          uint64_t v40 = *(void **)(a1 + 8);
          unint64_t v39 = *(void *)(a1 + 16);
          if ((unint64_t)v40 >= v39)
          {
            uint64_t v42 = *(void **)a1;
            uint64_t v43 = ((uint64_t)v40 - *(void *)a1) >> 3;
            unint64_t v44 = v43 + 1;
            if ((unint64_t)(v43 + 1) >> 61) {
              sub_24FF5A660();
            }
            uint64_t v45 = v39 - (void)v42;
            if (v45 >> 2 > v44) {
              unint64_t v44 = v45 >> 2;
            }
            if ((unint64_t)v45 >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v46 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v46 = v44;
            }
            if (v46) {
              unint64_t v46 = (unint64_t)sub_24FF5A678(v46);
            }
            else {
              uint64_t v47 = 0;
            }
            unint64_t v48 = (void *)(v46 + 8 * v43);
            *unint64_t v48 = v38;
            uint64_t v41 = v48 + 1;
            if (v40 != v42)
            {
              do
              {
                uint64_t v49 = *--v40;
                *--unint64_t v48 = v49;
              }
              while (v40 != v42);
              uint64_t v40 = v42;
            }
            *(void *)a1 = v48;
            *(void *)(a1 + 8) = v41;
            *(void *)(a1 + 16) = v46 + 8 * v47;
            if (v40) {
              operator delete(v40);
            }
          }
          else
          {
            *uint64_t v40 = v38;
            uint64_t v41 = v40 + 1;
          }
          *(void *)(a1 + 8) = v41;
        }
        goto LABEL_65;
      }
      BOOL v36 = (void *)(v35 + 72);
      size_t v37 = strlen(v34);
      if (*(char *)(v35 + 95) < 0)
      {
        if (v37 != *(void *)(v35 + 80)) {
          goto LABEL_65;
        }
        if (v37 == -1) {
          sub_24FF56C24();
        }
        BOOL v36 = (void *)*v36;
      }
      else if (v37 != *(unsigned __int8 *)(v35 + 95))
      {
        goto LABEL_65;
      }
      if (!memcmp(v36, v34, v37)) {
        goto LABEL_47;
      }
LABEL_65:
      uint64_t v35 = *(void *)(v35 + 8);
      if (v35 == a2) {
        return;
      }
    }
  }
  uint64_t v12 = a2;
  while (1)
  {
    uint64_t v12 = *(void *)(v12 + 8);
    if (v12 == a2) {
      break;
    }
    if (*(void *)(v12 + 120) == *(_DWORD *)(v10 + 56))
    {
      *(void *)a1 = 0;
      *(void *)(a1 + 8) = 0;
      *(void *)(a1 + 16) = 0;
      int v13 = operator new(8uLL);
      *(void *)a1 = v13;
      *v13++ = v12 + 16;
      *(void *)(a1 + 8) = v13;
      *(void *)(a1 + 16) = v13;
      return;
    }
  }
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
}

void sub_24FF57C1C(_Unwind_Exception *exception_object)
{
  int64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

unint64_t sub_24FF57C5C(unint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v3 = a2[1];
  a1[1] = 0;
  a1[2] = 0;
  *a1 = 0;
  int64_t v5 = v3 - v4;
  if (v3 == v4)
  {
    unint64_t result = 0;
    uint64_t v8 = 0;
    goto LABEL_7;
  }
  sub_24FF5A77C(a1, v5 >> 3);
  int v7 = (char *)a1[1];
  bzero(v7, v5);
  uint64_t v8 = (uint64_t *)&v7[v5];
  a1[1] = (unint64_t)&v7[v5];
  unint64_t result = *a1;
  BOOL v10 = *a1 == (void)&v7[v5];
  if ((char *)*a1 == &v7[v5])
  {
LABEL_7:
    BOOL v10 = 1;
    goto LABEL_8;
  }
  uint64_t v11 = 0;
  uint64_t v12 = (uint64_t *)*a1;
  do
    *v12++ = v11++;
  while (v12 != v8);
LABEL_8:
  if (a2[1] != *a2 && *(unsigned char *)(*a2 + 4))
  {
    uint64_t v15 = a2;
    unint64_t v13 = 126 - 2 * __clz((uint64_t)((uint64_t)v8 - result) >> 3);
    if (v10) {
      uint64_t v14 = 0;
    }
    else {
      uint64_t v14 = v13;
    }
    return sub_24FF5A7BC(result, v8, &v15, v14, 1);
  }
  return result;
}

void sub_24FF57D3C(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void sub_24FF57D58(unint64_t *a1, uint64_t **a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  uint64_t v5 = (char *)v4 - (char *)*a2;
  if (v4 == *a2)
  {
    int v7 = 0;
  }
  else
  {
    if (v5 < 0) {
      sub_24FF5A660();
    }
    int v7 = sub_24FF5A678(v5 >> 3);
    *a1 = (unint64_t)v7;
    a1[1] = (unint64_t)v7;
    a1[2] = (unint64_t)&v7[8 * v8];
    uint64_t v3 = *a2;
    uint64_t v4 = a2[1];
  }
  for (; v3 != v4; int v7 = v14)
  {
    uint64_t v9 = *v3;
    uint64_t v10 = *v3 + 80;
    v24[0] = "meshid";
    v24[1] = 6;
    uint64_t v11 = sub_24FF55C54(v10, (uint64_t)v24);
    if (v9 + 88 == v11) {
      uint64_t v12 = 0;
    }
    else {
      uint64_t v12 = *(unsigned int *)(v11 + 56) | 0x100000000;
    }
    unint64_t v13 = a1[2];
    if ((unint64_t)v7 >= v13)
    {
      uint64_t v15 = (unsigned char *)*a1;
      uint64_t v16 = (uint64_t)&v7[-*a1] >> 3;
      unint64_t v17 = v16 + 1;
      if ((unint64_t)(v16 + 1) >> 61) {
        sub_24FF5A660();
      }
      uint64_t v18 = v13 - (void)v15;
      if (v18 >> 2 > v17) {
        unint64_t v17 = v18 >> 2;
      }
      if ((unint64_t)v18 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v19 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v19 = v17;
      }
      if (v19) {
        unint64_t v19 = (unint64_t)sub_24FF5A678(v19);
      }
      else {
        uint64_t v20 = 0;
      }
      unint64_t v21 = v19 + 8 * v16;
      *(void *)unint64_t v21 = v12;
      uint64_t v14 = (unsigned char *)(v21 + 8);
      if (v7 != v15)
      {
        do
        {
          int v22 = *((_DWORD *)v7 - 2);
          v7 -= 8;
          char v23 = v7[4];
          *(_DWORD *)(v21 - 8) = v22;
          v21 -= 8;
          *(unsigned char *)(v21 + 4) = v23;
        }
        while (v7 != v15);
        int v7 = (unsigned char *)*a1;
      }
      *a1 = v21;
      a1[1] = (unint64_t)v14;
      a1[2] = v19 + 8 * v20;
      if (v7) {
        operator delete(v7);
      }
    }
    else
    {
      *(void *)int v7 = v12;
      uint64_t v14 = v7 + 8;
    }
    a1[1] = (unint64_t)v14;
    ++v3;
  }
}

void sub_24FF57EEC(_Unwind_Exception *exception_object)
{
  if (v2)
  {
    *(void *)(v1 + 8) = v2;
    operator delete(v2);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_24FF57F14(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 24);
  if (v2)
  {
    *(void *)(a1 + 32) = v2;
    operator delete(v2);
  }
  uint64_t v3 = *(void **)a1;
  if (*(void *)a1)
  {
    *(void *)(a1 + 8) = v3;
    operator delete(v3);
  }
  return a1;
}

void sub_24FF57F58(uint64_t *a1, uint64_t **a2, uint64_t *a3)
{
  sub_24FF57D58((unint64_t *)&__p, a2);
  int v7 = (char *)__p;
  uint64_t v6 = (char *)v31;
  if (__p != v31)
  {
    uint64_t v8 = 0;
    uint64_t v9 = (unsigned __int8 *)__p;
    do
    {
      v8 += v9[4];
      v9 += 8;
    }
    while (v9 != v31);
    if (!v8)
    {
      do
      {
        if (!v7[4]) {
          v7[4] = 1;
        }
        *(_DWORD *)int v7 = v8;
        v7 += 8;
        LODWORD(v8) = v8 + 1;
      }
      while (v7 != v6);
    }
  }
  sub_24FF57C5C((unint64_t *)&v28, (uint64_t *)&__p);
  uint64_t v11 = *a3;
  uint64_t v10 = a3[1];
  a1[1] = 0;
  a1[2] = 0;
  *a1 = 0;
  uint64_t v12 = v10 - v11;
  if (v10 == v11)
  {
    uint64_t v14 = 0;
  }
  else
  {
    sub_24FF5A77C(a1, v12 >> 2);
    unint64_t v13 = (char *)a1[1];
    bzero(v13, 2 * v12);
    uint64_t v14 = &v13[2 * v12];
    a1[1] = (uint64_t)v14;
  }
  uint64_t v15 = v28;
  if (v29 == v28)
  {
    uint64_t v15 = v29;
    if (!v29) {
      goto LABEL_24;
    }
  }
  else
  {
    uint64_t v16 = 0;
    unint64_t v17 = 0;
    uint64_t v18 = *a1;
    uint64_t v19 = (uint64_t)&v14[-*a1] >> 3;
    unint64_t v20 = v29 - v28;
    do
    {
      if (v19 == v16)
      {
        exception = __cxa_allocate_exception(0x10uLL);
        MEMORY[0x25337C8E0](exception, "unexpected submeshed topology buffer id");
        __cxa_throw(exception, (struct type_info *)&unk_270164ED8, MEMORY[0x263F8C070]);
      }
      uint64_t v21 = v15[v17];
      int v22 = (char *)__p + 8 * v21;
      int v23 = v22[4];
      int v24 = *(_DWORD *)v22;
      if (v23) {
        BOOL v25 = *(_DWORD *)(*a3 + 4 * v17) == v24;
      }
      else {
        BOOL v25 = 0;
      }
      if (v25)
      {
        uint64_t v26 = (*a2)[v21];
        ++v17;
      }
      else
      {
        uint64_t v26 = 0;
      }
      *(void *)(v18 + 8 * v16++) = v26;
    }
    while (v17 < v20);
  }
  operator delete(v15);
LABEL_24:
  if (__p)
  {
    uint64_t v31 = (unsigned __int8 *)__p;
    operator delete(__p);
  }
}

void sub_24FF5810C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, void *a12, uint64_t a13)
{
  if (*(void *)v13)
  {
    uint64_t v15 = *(void **)v13;
    *(void *)(v13 + 8) = *(void *)v13;
    operator delete(v15);
  }
  if (__p) {
    operator delete(__p);
  }
  if (a12) {
    operator delete(a12);
  }
  _Unwind_Resume(exception_object);
}

void sub_24FF58170(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v125 = *MEMORY[0x263EF8340];
  uint64_t v5 = *(void *)(a3 + 8);
  if (*(void *)a3 == v5)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x25337C8E0](exception, "idx buffer missing");
    goto LABEL_136;
  }
  uint64_t v7 = *(void *)(a4 + 8);
  unint64_t v8 = v5 - *(void *)a3;
  if (v7 != *(void *)a4 && v8 < v7 - *(void *)a4)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x25337C8E0](exception, "topology and submeshed index buffer mismatch");
    goto LABEL_136;
  }
  if (a5 && v8 >= 9)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x25337C8E0](exception, "facegroup and submeshed buffers conflict");
LABEL_136:
    __cxa_throw(exception, (struct type_info *)&unk_270164ED8, MEMORY[0x263F8C070]);
  }
  sub_24FF57D58((unint64_t *)&v120, (uint64_t **)a3);
  uint64_t v13 = *((void *)&v120 + 1);
  uint64_t v14 = v120;
  if (*((void *)&v120 + 1) != (void)v120)
  {
    uint64_t v15 = 0;
    uint64_t v16 = v120;
    do
    {
      v15 += *(unsigned __int8 *)(v16 + 4);
      v16 += 8;
    }
    while (v16 != *((void *)&v120 + 1));
    if (v15)
    {
      if (v15 != (uint64_t)(*((void *)&v120 + 1) - v120) >> 3)
      {
        unint64_t v17 = __cxa_allocate_exception(0x10uLL);
        MEMORY[0x25337C8E0](v17, "submeshed index buffer ids incomplete");
        __cxa_throw(v17, (struct type_info *)&unk_270164ED8, MEMORY[0x263F8C070]);
      }
    }
    else
    {
      do
      {
        if (!*(unsigned char *)(v14 + 4)) {
          *(unsigned char *)(v14 + 4) = 1;
        }
        *(_DWORD *)uint64_t v14 = v15;
        v14 += 8;
        LODWORD(v15) = v15 + 1;
      }
      while (v14 != v13);
    }
  }
  sub_24FF57C5C((unint64_t *)&v118, (uint64_t *)&v120);
  memset(__p, 0, sizeof(__p));
  *(_OWORD *)v116 = 0u;
  uint64_t v18 = *(void *)(a3 + 8);
  uint64_t v19 = v18 - *(void *)a3;
  if (v18 == *(void *)a3)
  {
    unint64_t v20 = 0;
  }
  else
  {
    if (v19 < 0) {
      sub_24FF5A660();
    }
    unint64_t v20 = sub_24FF5B7C8(v19 >> 3);
    uint64_t v22 = v21;
    bzero(v20, (unint64_t)v19 >> 1);
    v116[0] = v20;
    v116[1] = (char *)v20 + ((unint64_t)v19 >> 1);
    __p[0] = &v20[v22];
    uint64_t v23 = *(void *)(a3 + 8);
    int64_t v24 = v23 - *(void *)a3;
    if (v23 != *(void *)a3)
    {
      if (v24 < 0) {
        sub_24FF5A660();
      }
      BOOL v25 = sub_24FF5A678(v24 >> 3);
      uint64_t v27 = v26;
      bzero(v25, v24);
      __p[1] = v25;
      __p[2] = (char *)v25 + v24;
      __p[3] = &v25[v27];
      goto LABEL_25;
    }
  }
  BOOL v25 = 0;
LABEL_25:
  long long v28 = v118;
  if ((void)v118 != *((void *)&v118 + 1))
  {
    uint64_t v29 = v120;
    unint64_t v30 = (void *)v118;
    do
    {
      uint64_t v31 = v29 + 8 * *v30;
      if (!*(unsigned char *)(v31 + 4)) {
        sub_24FF5A614();
      }
      *v20++ = *(_DWORD *)v31;
      ++v30;
    }
    while (v30 != *((void **)&v28 + 1));
    uint64_t v32 = (uint64_t *)v28;
    do
    {
      uint64_t v33 = *v32++;
      *v25++ = *(void *)(*(void *)a3 + 8 * v33);
    }
    while (v32 != *((uint64_t **)&v28 + 1));
  }
  if ((void)v28) {
    operator delete((void *)v28);
  }
  if ((void)v120)
  {
    *((void *)&v120 + 1) = v120;
    operator delete((void *)v120);
  }
  uint64_t v102 = a2;
  sub_24FF57F58((uint64_t *)&v118, (uint64_t **)a4, (uint64_t *)v116);
  if (v116[1] == v116[0])
  {
LABEL_137:
    v101 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x25337C8E0](v101, "no faces?");
    __cxa_throw(v101, (struct type_info *)&unk_270164ED8, MEMORY[0x263F8C070]);
  }
  uint64_t v34 = 0;
  uint64_t v35 = 0;
  unint64_t v36 = 0;
  size_t v37 = 0;
  uint64_t v38 = 0;
  unint64_t v39 = 0;
  uint64_t v40 = 0;
  unint64_t v41 = 0;
  int64x2_t v103 = vdupq_n_s64(1uLL);
  do
  {
    uint64_t v104 = v40;
    unint64_t v105 = v36;
    uint64_t v42 = *(uint64_t **)(v118 + 8 * v41);
    if (!v42 || !*v42) {
      uint64_t v42 = &qword_24FF7D470;
    }
    uint64_t v43 = *((void *)__p[1] + v41);
    *(void *)&long long v120 = "faceType";
    *((void *)&v120 + 1) = 8;
    uint64_t v44 = sub_24FF55C54(v43 + 80, (uint64_t)&v120);
    if (v43 + 88 == v44) {
      uint64_t v45 = 0;
    }
    else {
      uint64_t v45 = *(unsigned int *)(v44 + 56) | 0x100000000;
    }
    unint64_t v46 = *(void *)(v43 + 32);
    if (v46 == 4)
    {
      *((void *)&v47 + 1) = v103.i64[1];
      *(void *)&long long v47 = 4;
    }
    else if (v46 == 3)
    {
      long long v47 = xmmword_24FF7D600;
    }
    else
    {
      long long v47 = 0uLL;
    }
    uint64_t v48 = 0;
    long long v120 = v47;
    uint64_t v49 = 0;
    if ((v45 & 0x100000000) != 0 && (v45 & 0xFFFFFFFC) == 0)
    {
      uint64_t v50 = 8 * (int)v45;
      uint64_t v48 = *(void *)((char *)&unk_24FF7D680 + v50);
      uint64_t v49 = *(void *)((char *)&unk_24FF7D6A0 + v50);
    }
    uint64_t v121 = v48;
    uint64_t v122 = v49;
    unint64_t v51 = *v42;
    if (!*v42)
    {
      uint64_t v52 = 0;
LABEL_63:
      uint64_t v62 = 0;
      goto LABEL_64;
    }
    uint64_t v52 = v42[3];
    if (!v52)
    {
      unint64_t v51 = 0;
      goto LABEL_63;
    }
    uint64_t v53 = (int *)(v51 + 4 * v42[1]);
    if (v52 != 1)
    {
      uint64_t v55 = v53 + 1;
      int v54 = *v53;
      uint64_t v56 = 4 * v52 - 4;
      uint64_t v57 = v53 + 1;
      do
      {
        int v59 = *v57++;
        int v58 = v59;
        BOOL v60 = v54 < v59;
        if (v54 <= v59) {
          int v54 = v58;
        }
        if (v60) {
          uint64_t v53 = v55;
        }
        uint64_t v55 = v57;
        v56 -= 4;
      }
      while (v56);
    }
    int v61 = *v53;
    unint64_t v51 = *v53 & 0xFFFFFFFFFFFFFF00;
    uint64_t v62 = v61;
    uint64_t v52 = 1;
LABEL_64:
    char v63 = 0;
    unint64_t v123 = v62 | v51;
    uint64_t v124 = v52;
    v64 = &v120;
    uint64_t v65 = 1;
    v66 = &v120;
    do
    {
      char v67 = v63;
      int v68 = *((unsigned __int8 *)v64 + 24);
      v64 = &v120 + v65;
      if (v68 && (!*((unsigned char *)v66 + 8) || *(void *)v66 < *(void *)v64)) {
        v66 = &v120 + v65;
      }
      char v63 = 1;
      uint64_t v65 = 2;
    }
    while ((v67 & 1) == 0);
    uint64_t v69 = *(void *)v66;
    if (v46 > 1)
    {
      if (!v42[3])
      {
        unint64_t v70 = *(void *)(v43 + 24);
        goto LABEL_84;
      }
      v99 = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x25337C8E0](v99, "index buffer width > 1 when topology buffer present");
LABEL_133:
      __cxa_throw(v99, (struct type_info *)&unk_270164ED8, MEMORY[0x263F8C070]);
    }
    if ((v45 & 0x100000000) == 0) {
      goto LABEL_77;
    }
    if (v45 != 1)
    {
      if (!v45)
      {
        unint64_t v71 = *(void *)(v43 + 24) / 3uLL;
        goto LABEL_79;
      }
LABEL_77:
      unint64_t v71 = 0;
      goto LABEL_79;
    }
    unint64_t v71 = *(void *)(v43 + 24) >> 2;
LABEL_79:
    unint64_t v70 = v42[3];
    if (v70)
    {
      if (v71 && v71 != v70)
      {
        v99 = __cxa_allocate_exception(0x10uLL);
        MEMORY[0x25337C8E0](v99, "index and topology buffers conflict");
        goto LABEL_133;
      }
    }
    else
    {
      unint64_t v70 = v71;
    }
LABEL_84:
    if (!*((unsigned char *)v66 + 8)) {
      sub_24FF5A614();
    }
    if ((unint64_t)v38 >= v39)
    {
      uint64_t v72 = (v38 - v37) >> 2;
      unint64_t v73 = v72 + 1;
      if ((unint64_t)(v72 + 1) >> 62) {
        sub_24FF5A660();
      }
      if ((uint64_t)(v39 - (void)v37) >> 1 > v73) {
        unint64_t v73 = (uint64_t)(v39 - (void)v37) >> 1;
      }
      if (v39 - (unint64_t)v37 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v74 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v74 = v73;
      }
      if (v74) {
        unint64_t v74 = (unint64_t)sub_24FF5B7C8(v74);
      }
      else {
        uint64_t v75 = 0;
      }
      v76 = (char *)(v74 + 4 * v72);
      *(_DWORD *)v76 = v69;
      v77 = v76 + 4;
      while (v38 != v37)
      {
        int v78 = *((_DWORD *)v38 - 1);
        v38 -= 4;
        *((_DWORD *)v76 - 1) = v78;
        v76 -= 4;
      }
      unint64_t v79 = v74 + 4 * v75;
      if (v37) {
        operator delete(v37);
      }
      size_t v37 = v76;
      uint64_t v38 = v77;
      unint64_t v39 = v79;
    }
    else
    {
      *(_DWORD *)uint64_t v38 = v69;
      v38 += 4;
    }
    unint64_t v36 = v105;
    if ((unint64_t)v35 >= v105)
    {
      uint64_t v80 = v35 - v34;
      unint64_t v81 = v80 + 1;
      if ((unint64_t)(v80 + 1) >> 61) {
        sub_24FF5A660();
      }
      if ((uint64_t)(v105 - (void)v34) >> 2 > v81) {
        unint64_t v81 = (uint64_t)(v105 - (void)v34) >> 2;
      }
      if (v105 - (unint64_t)v34 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v82 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v82 = v81;
      }
      if (v82)
      {
        unint64_t v82 = (unint64_t)sub_24FF5A678(v82);
        unint64_t v84 = v39;
      }
      else
      {
        unint64_t v84 = v39;
        uint64_t v83 = 0;
      }
      v85 = (unint64_t *)(v82 + 8 * v80);
      unint64_t *v85 = v70;
      v86 = v85 + 1;
      while (v35 != v34)
      {
        unint64_t v87 = *--v35;
        *--v85 = v87;
      }
      unint64_t v36 = v82 + 8 * v83;
      if (v34)
      {
        v88 = v34;
        unint64_t v89 = v36;
        operator delete(v88);
        unint64_t v36 = v89;
      }
      uint64_t v34 = v85;
      uint64_t v35 = v86;
      unint64_t v39 = v84;
    }
    else
    {
      *v35++ = v70;
    }
    uint64_t v40 = v70 + v104;
    ++v41;
    v90 = v116[0];
    v91 = v116[1];
    int64_t v92 = (char *)v116[1] - (char *)v116[0];
  }
  while (v41 < ((char *)v116[1] - (char *)v116[0]) >> 2);
  if (!v40) {
    goto LABEL_137;
  }
  unint64_t v93 = v36;
  v94 = *(void **)v102;
  if (*(void *)v102)
  {
    *(void *)(v102 + 8) = v94;
    operator delete(v94);
    *(void *)uint64_t v102 = 0;
    *(void *)(v102 + 8) = 0;
    *(void *)(v102 + 16) = 0;
    v90 = v116[0];
    v91 = v116[1];
    int64_t v92 = (char *)v116[1] - (char *)v116[0];
  }
  unint64_t v95 = v92 >> 2;
  *(void *)uint64_t v102 = v90;
  *(void *)(v102 + 8) = v91;
  *(void **)(v102 + 16) = __p[0];
  v116[1] = 0;
  memset(__p, 0, sizeof(__p));
  v116[0] = 0;
  long long v106 = *(_OWORD *)&__p[1];
  *(void **)v107 = __p[3];
  *(_OWORD *)&v107[8] = v118;
  uint64_t v96 = v119;
  long long v118 = 0uLL;
  uint64_t v119 = 0;
  *(void *)&v107[24] = v96;
  long long v108 = 0uLL;
  uint64_t v109 = 0;
  sub_24FF5B800(&v108, v90, (uint64_t)v91, v95);
  v110 = v34;
  v111 = v35;
  unint64_t v112 = v93;
  v113 = v37;
  v114 = v38;
  unint64_t v115 = v39;
  *(void *)(a1 + 24) = 0;
  v97 = operator new(0x88uLL);
  void *v97 = &unk_270164F88;
  v97[1] = v40;
  *((_OWORD *)v97 + 1) = v106;
  *((_OWORD *)v97 + 2) = *(_OWORD *)v107;
  long long v98 = v108;
  *((_OWORD *)v97 + 3) = *(_OWORD *)&v107[16];
  *((_OWORD *)v97 + 4) = v98;
  v97[10] = v109;
  v97[11] = v34;
  v97[12] = v35;
  v97[13] = v93;
  v97[14] = v37;
  v97[15] = v38;
  v97[16] = v39;
  *(void *)(a1 + 24) = v97;
  if (__p[1])
  {
    __p[2] = __p[1];
    operator delete(__p[1]);
  }
  if (v116[0])
  {
    v116[1] = v116[0];
    operator delete(v116[0]);
  }
}

void sub_24FF589D4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, void *a20,uint64_t a21,uint64_t a22,void *__p,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  size_t v37 = *(void **)(v35 - 144);
  if (v37)
  {
    *(void *)(v35 - 136) = v37;
    operator delete(v37);
  }
  _Unwind_Resume(exception_object);
}

void sub_24FF58ADC()
{
  if (v1)
  {
    operator delete(v1);
    if (!v0) {
      JUMPOUT(0x24FF58A3CLL);
    }
    JUMPOUT(0x24FF58A34);
  }
  JUMPOUT(0x24FF58A30);
}

void *sub_24FF58AF8(void *a1)
{
  uint64_t v2 = (void *)a1[13];
  if (v2)
  {
    a1[14] = v2;
    operator delete(v2);
  }
  uint64_t v3 = (void *)a1[10];
  if (v3)
  {
    a1[11] = v3;
    operator delete(v3);
  }
  uint64_t v4 = (void *)a1[7];
  if (v4)
  {
    a1[8] = v4;
    operator delete(v4);
  }
  uint64_t v5 = (void *)a1[4];
  if (v5)
  {
    a1[5] = v5;
    operator delete(v5);
  }
  uint64_t v6 = (void *)a1[1];
  if (v6)
  {
    a1[2] = v6;
    operator delete(v6);
  }
  return a1;
}

void sub_24FF58B6C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 288);
  if (!v2) {
    sub_24FF5C48C();
  }
  (*(void (**)(void **__return_ptr))(*(void *)v2 + 48))(v13);
  if (*(unsigned char *)(a1 + 144))
  {
    uint64_t v3 = *(void **)(a1 + 96);
    if (v3) {
      operator delete[](v3);
    }
  }
  uint64_t v4 = v13[1];
  *(void **)(a1 + 96) = v13[0];
  *(void *)(a1 + 104) = v4;
  *(_DWORD *)(a1 + 112) = v14;
  uint64_t v5 = v16;
  *(void *)(a1 + 120) = v15;
  *(void *)(a1 + 128) = v5;
  *(void *)(a1 + 136) = v5;
  *(unsigned char *)(a1 + 144) = v17;
  char v17 = 0;
  if (*(unsigned char *)(a1 + 256))
  {
    uint64_t v6 = *(void **)(a1 + 208);
    if (v6) {
      operator delete[](v6);
    }
  }
  uint64_t v7 = v19;
  *(void *)(a1 + 208) = __p;
  *(void *)(a1 + 216) = v7;
  *(_DWORD *)(a1 + 224) = v20;
  uint64_t v8 = v22;
  *(void *)(a1 + 232) = v21;
  *(void *)(a1 + 240) = v8;
  *(void *)(a1 + 248) = v8;
  *(unsigned char *)(a1 + 256) = v23;
  char v23 = 0;
  if (*(unsigned char *)(a1 + 200) && (uint64_t v9 = *(void **)(a1 + 152)) != 0)
  {
    operator delete[](v9);
    BOOL v10 = v23 == 0;
  }
  else
  {
    BOOL v10 = 1;
  }
  uint64_t v11 = v25;
  *(void *)(a1 + 152) = v24;
  *(void *)(a1 + 160) = v11;
  *(_DWORD *)(a1 + 168) = v26;
  uint64_t v12 = v28;
  *(void *)(a1 + 176) = v27;
  *(void *)(a1 + 184) = v12;
  *(void *)(a1 + 192) = v12;
  *(unsigned char *)(a1 + 200) = v29;
  char v29 = 0;
  if (!v10 && __p) {
    operator delete[](__p);
  }
  if (v17)
  {
    if (v13[0]) {
      operator delete[](v13[0]);
    }
  }
}

uint64_t sub_24FF58CB4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 232);
  uint64_t v2 = 12 * *(void *)(a1 + 64) + 4 * v1;
  uint64_t v3 = 4 * v1;
  uint64_t v4 = v2 + 4 * *(void *)(a1 + 128) * *(void *)(a1 + 120);
  if (!*(unsigned char *)(a1 + 24)) {
    uint64_t v3 = 0;
  }
  return v4 + v3 + 1024;
}

unint64_t sub_24FF58CF0(uint64_t a1, int **a2, uint64_t *a3)
{
  if ((*(_DWORD *)(a1 + 32) & 0x80000000) == 0)
  {
    sub_24FF6D770(a1, *(void *)(a1 + 40) + 4 * *(void *)(a1 + 48), *(void *)(a1 + 64), *(void *)(a1 + 208) + 4 * *(void *)(a1 + 216), *(void *)(a1 + 232), *(void *)(a1 + 96) + 4 * *(void *)(a1 + 104), *(void *)(a1 + 120) * *(void *)(a1 + 128), *(void *)(a1 + 152) + 4 * *(void *)(a1 + 160), (unsigned int *)(a1 + 32), a1 + 8);
    if (v6) {
      return 0x8000000000000000;
    }
  }
  uint64_t v10 = 0;
  if (sub_24FF6AB1C(*a2, (int32x2_t *)(*(void *)(a1 + 40) + 4 * *(void *)(a1 + 48)), *(void *)(a1 + 64), (int *)(*(void *)(a1 + 208) + 4 * *(void *)(a1 + 216)), *(void *)(a1 + 232), (_DWORD *)(*(void *)(a1 + 96) + 4 * *(void *)(a1 + 104)), *(void *)(a1 + 120) * *(void *)(a1 + 128), (_DWORD *)(*(void *)(a1 + 152) + 4 * *(void *)(a1 + 160)), *a3, a3[1] & ~(a3[1] >> 63), &v10, 0, 0, 0, a1 + 8))return 0x8000000000000000; {
  unint64_t result = 0;
  }
  if (*a3) {
    uint64_t v8 = *a3 + v10;
  }
  else {
    uint64_t v8 = v10;
  }
  uint64_t v9 = a3[1] - v10;
  *a3 = v8;
  a3[1] = v9;
  return result;
}

void sub_24FF58DFC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 240);
  if (!v2) {
    sub_24FF5C48C();
  }
  (*(void (**)(void *__return_ptr))(*(void *)v2 + 48))(v6);
  if (*(unsigned char *)(a1 + 152))
  {
    uint64_t v3 = *(void **)(a1 + 104);
    if (v3) {
      operator delete[](v3);
    }
  }
  uint64_t v4 = v6[1];
  *(void *)(a1 + 104) = v6[0];
  *(void *)(a1 + 112) = v4;
  *(_DWORD *)(a1 + 120) = v7;
  uint64_t v5 = v9;
  *(void *)(a1 + 128) = v8;
  *(void *)(a1 + 136) = v5;
  *(void *)(a1 + 144) = v5;
  *(unsigned char *)(a1 + 152) = v10;
}

uint64_t sub_24FF58E90(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 72);
  uint64_t v2 = *(void *)(a1 + 80);
  if (*(_DWORD *)(a1 + 44))
  {
    uint64_t v3 = v1 * v2;
    if (!*(_DWORD *)(a1 + 24)) {
      uint64_t v1 = 0;
    }
    uint64_t v4 = 4 * *(void *)(a1 + 136) * *(void *)(a1 + 128);
    if (!*(_DWORD *)(a1 + 28)) {
      uint64_t v4 = 0;
    }
    uint64_t v5 = v1 + 4 * v3 + v4;
  }
  else
  {
    uint64_t v6 = v1 * v2;
    if (!*(_DWORD *)(a1 + 24)) {
      uint64_t v1 = 0;
    }
    uint64_t v5 = v1 + 4 * v6;
  }
  return v5 + 1024;
}

unint64_t sub_24FF58EE8(uint64_t a1, int **a2, uint64_t *a3)
{
  unsigned int v6 = *(_DWORD *)(a1 + 36);
  if (!*(_DWORD *)(a1 + 44))
  {
    if ((v6 & 0x80000000) == 0
      && sub_24FF6D854(*a2, *(void *)(a1 + 48) + 4 * *(void *)(a1 + 56), *(void *)(a1 + 160) + *(void *)(a1 + 168), *(_DWORD *)(a1 + 40), *(void *)(a1 + 80), (unsigned int *)(a1 + 36), a1 + 8))
    {
      return 0x8000000000000000;
    }
    uint64_t v17 = 0;
    if (sub_24FF6CF88((unsigned int *)*a2, *(void *)(a1 + 48) + 4 * *(void *)(a1 + 56), (unsigned char *)(*(void *)(a1 + 160) + *(void *)(a1 + 168)), *(_DWORD *)(a1 + 40), 0, *(void *)(a1 + 80), *a3, a3[1] & ~(a3[1] >> 63), &v17, a1 + 8))return 0x8000000000000000; {
    goto LABEL_9;
    }
  }
  uint64_t v7 = *(void *)(a1 + 160);
  int v8 = *(_DWORD *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 104);
  char v10 = *a2;
  if ((v6 & 0x80000000) == 0)
  {
    *(_DWORD *)(a1 + 24) = v7 != 0;
    *(_DWORD *)(a1 + 28) = v9 != 0;
    if (v8 == 1 && *v10 <= 79) {
      char v11 = 2;
    }
    else {
      char v11 = 4;
    }
    *(unsigned char *)(a1 + 16) = v11;
    if (v6 - 3 < 4)
    {
      char v15 = 0;
      if (v8 == 1) {
        int v16 = 3;
      }
      else {
        int v16 = 1;
      }
      goto LABEL_20;
    }
    if (v6 < 3)
    {
      char v15 = 0;
      int v16 = 1;
LABEL_20:
      *(_DWORD *)(a1 + 20) = v16;
      *(unsigned char *)(a1 + 32) = v15;
      char v10 = *a2;
      goto LABEL_21;
    }
    if (v6 != 11)
    {
      if (v8 == 1) {
        int v16 = 4;
      }
      else {
        int v16 = 2;
      }
      char v15 = 1;
      goto LABEL_20;
    }
  }
LABEL_21:
  uint64_t v17 = 0;
  if (sub_24FF74BA8((uint64_t)v10, (int *)(*(void *)(a1 + 48) + 4 * *(void *)(a1 + 56)), (unsigned char *)(v7 + *(void *)(a1 + 168)), v8, 0, *(void *)(a1 + 72), *(void *)(a1 + 80), (int *)(v9 + 4 * *(void *)(a1 + 112)), *a3, a3[1] & ~(a3[1] >> 63), &v17, a1 + 8))return 0x8000000000000000; {
LABEL_9:
  }
  unint64_t result = 0;
  if (*a3) {
    uint64_t v13 = *a3 + v17;
  }
  else {
    uint64_t v13 = v17;
  }
  uint64_t v14 = a3[1] - v17;
  *a3 = v13;
  a3[1] = v14;
  return result;
}

uint64_t GCLEncodeMeshFromBufferList(uint64_t a1, void *a2, uint64_t *a3)
{
  uint64_t v198 = *MEMORY[0x263EF8340];
  uint64_t v3 = 0x8000000000000000;
  if (!a1 || !a2 || !*a2) {
    return v3;
  }
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_269A9AA00, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_269A9AA00))
  {
    qword_269A9AA18 = 0;
    qword_269A9AA10 = 0;
    qword_269A9AA08 = (uint64_t)&qword_269A9AA10;
    __cxa_atexit((void (*)(void *))sub_24FF5A400, &qword_269A9AA08, &dword_24FF54000);
    __cxa_guard_release(&qword_269A9AA00);
  }
  size_t __sz = 0;
  v181 = &v181;
  v182 = (uint64_t *)&v181;
  if (a3) {
    uint64_t v7 = a3;
  }
  else {
    uint64_t v7 = &qword_269A9AA08;
  }
  uint64_t v183 = 0;
  v184 = 0;
  uint64_t v185 = 0;
  uint64_t v186 = 0;
  int v8 = (char *)operator new(0x128uLL);
  *((_OWORD *)v8 + 1) = 0u;
  *((_OWORD *)v8 + 16) = 0u;
  *((_OWORD *)v8 + 17) = 0u;
  *((_OWORD *)v8 + 14) = 0u;
  *((_OWORD *)v8 + 15) = 0u;
  *((_OWORD *)v8 + 12) = 0u;
  *((_OWORD *)v8 + 13) = 0u;
  *((_OWORD *)v8 + 10) = 0u;
  *((_OWORD *)v8 + 11) = 0u;
  *((_OWORD *)v8 + 8) = 0u;
  *((_OWORD *)v8 + 9) = 0u;
  *((_OWORD *)v8 + 6) = 0u;
  *((_OWORD *)v8 + 7) = 0u;
  *((_OWORD *)v8 + 4) = 0u;
  *((_OWORD *)v8 + 5) = 0u;
  *((_OWORD *)v8 + 2) = 0u;
  *((_OWORD *)v8 + 3) = 0u;
  *(void *)int v8 = &unk_270164F00;
  *((void *)v8 + 1) = 0;
  v8[16] = 4;
  *((_DWORD *)v8 + 5) = 2;
  *(_DWORD *)(v8 + 25) = 16843009;
  v8[29] = 1;
  *((_DWORD *)v8 + 8) = 9;
  *((void *)v8 + 36) = 0;
  uint64_t v9 = *(void *)(a1 + 8);
  v179 = a2;
  if (v9 == a1) {
    goto LABEL_88;
  }
  uint64_t v10 = *(void *)(a1 + 8);
  while (1)
  {
    char v11 = (void *)(v10 + 72);
    int v12 = *(char *)(v10 + 95);
    if ((v12 & 0x80000000) == 0) {
      break;
    }
    if (*(void *)(v10 + 80) == 4)
    {
      char v11 = (void *)*v11;
      goto LABEL_15;
    }
LABEL_16:
    uint64_t v10 = *(void *)(v10 + 8);
    if (v10 == a1)
    {
      uint64_t v13 = 0;
      goto LABEL_19;
    }
  }
  if (v12 != 4) {
    goto LABEL_16;
  }
LABEL_15:
  if (*(_DWORD *)v11 != *(_DWORD *)"vtxs") {
    goto LABEL_16;
  }
  uint64_t v13 = v10 + 16;
  do
  {
LABEL_19:
    uint64_t v14 = (void *)(v9 + 72);
    int v15 = *(char *)(v9 + 95);
    if (v15 < 0)
    {
      if (*(void *)(v9 + 80) != 4) {
        goto LABEL_25;
      }
      uint64_t v14 = (void *)*v14;
    }
    else if (v15 != 4)
    {
      goto LABEL_25;
    }
    if (*(_DWORD *)v14 == *(_DWORD *)"fgrp")
    {
      uint64_t v16 = v9 + 16;
      if (v13) {
        goto LABEL_27;
      }
      goto LABEL_88;
    }
LABEL_25:
    uint64_t v9 = *(void *)(v9 + 8);
  }
  while (v9 != a1);
  uint64_t v16 = 0;
  if (!v13)
  {
LABEL_88:
    unint64_t v17 = 0x8000000000000000;
    goto LABEL_89;
  }
LABEL_27:
  unint64_t v17 = 0x8000000000000000;
  if (!*(void *)v13) {
    goto LABEL_89;
  }
  v175 = v7;
  if (*(_DWORD *)(v13 + 16) != 260
    || *(void *)(v13 + 32) != 3
    || v16 && (!*(void *)v16 || *(_DWORD *)(v16 + 16) != 260 || *(void *)(v16 + 32) != 1))
  {
    goto LABEL_89;
  }
  sub_24FF5783C((uint64_t)&v196, a1, v13, (const char **)&off_26534ED48);
  uint64_t v173 = v16;
  v187 = 0;
  v188 = 0;
  unint64_t v189 = 0;
  sub_24FF57794(&v187, *(void *)(a1 + 16));
  uint64_t v18 = *(void *)(a1 + 8);
  if (v18 == a1) {
    goto LABEL_61;
  }
  int v20 = v188;
  unint64_t v19 = v189;
  uint64_t v21 = (uint64_t *)v187;
  while (2)
  {
    uint64_t v22 = (void *)(v18 + 72);
    int v23 = *(char *)(v18 + 95);
    if (v23 < 0)
    {
      if (*(void *)(v18 + 80) != 4) {
        goto LABEL_59;
      }
      uint64_t v22 = (void *)*v22;
    }
    else if (v23 != 4)
    {
      goto LABEL_59;
    }
    if (*(_DWORD *)v22 == *(_DWORD *)"topo")
    {
      __p = v21;
      uint64_t v24 = v18 + 16;
      if ((unint64_t)v20 >= v19)
      {
        uint64_t v25 = v20 - v21;
        unint64_t v26 = v25 + 1;
        if ((unint64_t)(v25 + 1) >> 61) {
          sub_24FF5A660();
        }
        if ((uint64_t)(v19 - (void)__p) >> 2 > v26) {
          unint64_t v26 = (uint64_t)(v19 - (void)__p) >> 2;
        }
        if (v19 - (unint64_t)__p >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v27 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v27 = v26;
        }
        if (v27) {
          unint64_t v27 = (unint64_t)sub_24FF5A678(v27);
        }
        else {
          uint64_t v28 = 0;
        }
        uint64_t v21 = (uint64_t *)(v27 + 8 * v25);
        *uint64_t v21 = v24;
        char v29 = v21 + 1;
        while (v20 != __p)
        {
          uint64_t v30 = *--v20;
          *--uint64_t v21 = v30;
        }
        unint64_t v19 = v27 + 8 * v28;
        if (__p)
        {
          unint64_t v31 = v27 + 8 * v28;
          operator delete(__p);
          unint64_t v19 = v31;
        }
        int v20 = v29;
      }
      else
      {
        *v20++ = v24;
      }
    }
LABEL_59:
    uint64_t v18 = *(void *)(v18 + 8);
    if (v18 != a1) {
      continue;
    }
    break;
  }
  v188 = v20;
  unint64_t v189 = v19;
  v187 = v21;
LABEL_61:
  uint64_t v33 = *((void *)&v196 + 1);
  uint64_t v32 = (void *)v196;
  if ((void)v196 != *((void *)&v196 + 1))
  {
    uint64_t v34 = (uint64_t *)v196;
    unint64_t v17 = 0x8000000000000000;
    while (1)
    {
      uint64_t v35 = *v34;
      if (!*v34) {
        break;
      }
      int v36 = 0;
      if (!*(void *)v35 || *(_DWORD *)(v35 + 16) != 260) {
        goto LABEL_110;
      }
      if (++v34 == *((uint64_t **)&v196 + 1))
      {
        if (v187 == v188)
        {
LABEL_74:
          sub_24FF58170((uint64_t)&v192, (uint64_t)&v184, (uint64_t)&v196, (uint64_t)&v187, v173);
          v171 = v32;
          sub_24FF5C3AC((void *)v8 + 33, (uint64_t)&v192);
          sub_24FF5C328(&v192);
          uint64_t v39 = *(void *)v13;
          uint64_t v40 = *(void *)(v13 + 8);
          int v41 = *(_DWORD *)(v13 + 16);
          uint64_t v42 = *(void *)(v13 + 24);
          uint64_t v43 = *(void *)(v13 + 32);
          if (v8[88])
          {
            uint64_t v44 = (void *)*((void *)v8 + 5);
            if (v44)
            {
              uint64_t v168 = *(void *)(v13 + 24);
              operator delete[](v44);
              uint64_t v42 = v168;
            }
          }
          char v45 = 0;
          uint64_t v46 = 0;
          *((void *)v8 + 5) = v39;
          *((void *)v8 + 6) = v40;
          *((_DWORD *)v8 + 14) = v41;
          *((void *)v8 + 8) = v42;
          *((void *)v8 + 9) = v43;
          *((void *)v8 + 10) = v43;
          v8[88] = 0;
          *((_DWORD *)v8 + 8) = -1;
          if (v173) {
            BOOL v47 = 1;
          }
          else {
            BOOL v47 = (unint64_t)(v33 - (void)v171) > 8;
          }
          char v48 = v47;
          v8[24] = v48;
          uint64_t v49 = v13 + 80;
          uint64_t v190 = v13 + 80;
          v191 = v175;
          while (1)
          {
            uint64_t v50 = *(&v190 + v46);
            char v51 = v45;
            v192 = "compression-level";
            uint64_t v193 = 17;
            uint64_t v52 = sub_24FF55C54(v50, (uint64_t)&v192);
            if (v50 + 8 != v52) {
              break;
            }
            char v45 = 1;
            uint64_t v46 = 1;
            if (v51) {
              goto LABEL_233;
            }
          }
          *((_DWORD *)v8 + 8) = *(_DWORD *)(v52 + 56);
LABEL_233:
          char v131 = 0;
          uint64_t v132 = 0;
          uint64_t v190 = v49;
          v191 = v175;
          while (1)
          {
            uint64_t v133 = *(&v190 + v132);
            char v134 = v131;
            v192 = "mode-bin";
            uint64_t v193 = 8;
            uint64_t v135 = sub_24FF55C54(v133, (uint64_t)&v192);
            if (v133 + 8 != v135) {
              break;
            }
            char v131 = 1;
            uint64_t v132 = 1;
            if (v134) {
              goto LABEL_238;
            }
          }
          v8[16] = *(_DWORD *)(v135 + 56);
LABEL_238:
          char v136 = 0;
          uint64_t v137 = 0;
          uint64_t v190 = v49;
          v191 = v175;
          while (1)
          {
            uint64_t v138 = *(&v190 + v137);
            char v139 = v136;
            v192 = "mode-pred";
            uint64_t v193 = 9;
            uint64_t v140 = sub_24FF55C54(v138, (uint64_t)&v192);
            if (v138 + 8 != v140) {
              break;
            }
            char v136 = 1;
            uint64_t v137 = 1;
            if (v139) {
              goto LABEL_243;
            }
          }
          *((_DWORD *)v8 + 5) = *(_DWORD *)(v140 + 56);
LABEL_243:
          char v141 = 0;
          uint64_t v142 = 0;
          uint64_t v190 = v49;
          v191 = v175;
          while (1)
          {
            uint64_t v143 = *(&v190 + v142);
            char v144 = v141;
            v192 = "pmesh-act";
            uint64_t v193 = 9;
            uint64_t v145 = sub_24FF55C54(v143, (uint64_t)&v192);
            if (v143 + 8 != v145) {
              break;
            }
            char v141 = 1;
            uint64_t v142 = 1;
            if (v144) {
              goto LABEL_248;
            }
          }
          v8[25] = *(_DWORD *)(v145 + 56);
LABEL_248:
          char v146 = 0;
          uint64_t v147 = 0;
          uint64_t v190 = v49;
          v191 = v175;
          while (1)
          {
            uint64_t v148 = *(&v190 + v147);
            char v149 = v146;
            v192 = "pmesh-tfsc";
            uint64_t v193 = 10;
            uint64_t v150 = sub_24FF55C54(v148, (uint64_t)&v192);
            if (v148 + 8 != v150) {
              break;
            }
            char v146 = 1;
            uint64_t v147 = 1;
            if (v149) {
              goto LABEL_253;
            }
          }
          v8[26] = *(_DWORD *)(v150 + 56);
LABEL_253:
          char v151 = 0;
          uint64_t v152 = 0;
          uint64_t v190 = v49;
          v191 = v175;
          while (1)
          {
            uint64_t v153 = *(&v190 + v152);
            char v154 = v151;
            v192 = "pmesh-gbt";
            uint64_t v193 = 9;
            uint64_t v155 = sub_24FF55C54(v153, (uint64_t)&v192);
            if (v153 + 8 != v155) {
              break;
            }
            char v151 = 1;
            uint64_t v152 = 1;
            if (v154) {
              goto LABEL_258;
            }
          }
          v8[27] = *(_DWORD *)(v155 + 56);
LABEL_258:
          char v156 = 0;
          uint64_t v157 = 0;
          uint64_t v190 = v49;
          v191 = v175;
          while (1)
          {
            uint64_t v158 = *(&v190 + v157);
            char v159 = v156;
            v192 = "mode-abe";
            uint64_t v193 = 8;
            uint64_t v160 = sub_24FF55C54(v158, (uint64_t)&v192);
            if (v158 + 8 != v160) {
              break;
            }
            char v156 = 1;
            uint64_t v157 = 1;
            if (v159) {
              goto LABEL_263;
            }
          }
          v8[28] = *(_DWORD *)(v160 + 56);
LABEL_263:
          char v161 = 0;
          uint64_t v162 = 0;
          uint64_t v190 = v49;
          v191 = v175;
          while (1)
          {
            uint64_t v163 = *(&v190 + v162);
            char v164 = v161;
            v192 = "pmesh-dlpp";
            uint64_t v193 = 10;
            uint64_t v165 = sub_24FF55C54(v163, (uint64_t)&v192);
            if (v163 + 8 != v165) {
              break;
            }
            char v161 = 1;
            uint64_t v162 = 1;
            if (v164) {
              goto LABEL_268;
            }
          }
          v8[29] = *(_DWORD *)(v165 + 56);
LABEL_268:
          unint64_t v17 = 0;
          int v36 = 1;
          uint64_t v32 = v171;
          goto LABEL_110;
        }
        size_t v37 = (uint64_t *)v187;
        unint64_t v17 = 0x8000000000000000;
        while (1)
        {
          uint64_t v38 = *v37;
          if (!*v37) {
            goto LABEL_109;
          }
          int v36 = 0;
          if (!*(void *)v38 || *(_DWORD *)(v38 + 16) != 260) {
            goto LABEL_110;
          }
          if (*(void *)(v38 + 32) != 1) {
            goto LABEL_109;
          }
          if (++v37 == v188) {
            goto LABEL_74;
          }
        }
      }
    }
  }
LABEL_109:
  int v36 = 0;
  unint64_t v17 = 0x8000000000000000;
LABEL_110:
  if (v187) {
    operator delete(v187);
  }
  if (v32) {
    operator delete(v32);
  }
  if (!v36)
  {
LABEL_89:
    sub_24FF5C588((uint64_t)v8);
    goto LABEL_90;
  }
  BOOL v60 = operator new(0x18uLL);
  uint64_t v61 = (uint64_t)v181;
  v60[1] = &v181;
  v60[2] = v8;
  *BOOL v60 = v61;
  *(void *)(v61 + 8) = v60;
  v181 = v60;
  ++v183;
  uint64_t v62 = *(void *)(a1 + 8);
  if (v62 != a1)
  {
    while (1)
    {
      if (*(char *)(v62 + 95) < 0)
      {
        v64 = *(char **)(v62 + 72);
        uint64_t v63 = *(void *)(v62 + 80);
      }
      else
      {
        uint64_t v63 = *(unsigned __int8 *)(v62 + 95);
        v64 = (char *)(v62 + 72);
      }
      if (v63 >= 4) {
        break;
      }
LABEL_227:
      uint64_t v62 = *(void *)(v62 + 8);
      if (v62 == a1) {
        goto LABEL_228;
      }
    }
    uint64_t v65 = &v64[v63];
    v66 = v64;
    while (1)
    {
      char v67 = (char *)memchr(v66, 97, v63 - 3);
      if (!v67) {
        goto LABEL_227;
      }
      if (*(_DWORD *)v67 == 1920234593) {
        break;
      }
      v66 = v67 + 1;
      uint64_t v63 = v65 - v66;
      if (v65 - v66 < 4) {
        goto LABEL_227;
      }
    }
    if (v67 == v65 || v67 != v64) {
      goto LABEL_227;
    }
    int v68 = operator new(0xF8uLL);
    v68[1] = 0u;
    v68[13] = 0u;
    v68[14] = 0u;
    v68[11] = 0u;
    v68[12] = 0u;
    v68[9] = 0u;
    v68[10] = 0u;
    v68[7] = 0u;
    v68[8] = 0u;
    v68[5] = 0u;
    v68[6] = 0u;
    v68[3] = 0u;
    v68[4] = 0u;
    v68[2] = 0u;
    *(void *)int v68 = &unk_270164F38;
    *((void *)v68 + 1) = 0;
    *((unsigned char *)v68 + 16) = 4;
    *((_DWORD *)v68 + 5) = 2;
    *((unsigned char *)v68 + 32) = 1;
    *((_DWORD *)v68 + 9) = 9;
    *((void *)v68 + 30) = 0;
    sub_24FF5783C((uint64_t)&v187, a1, v62 + 16, (const char **)&off_26534ED48);
    sub_24FF5783C((uint64_t)&v192, a1, v62 + 16, (const char **)&off_26534ED60);
    if (v192 != (char *)v193)
    {
      uint64_t v69 = *(uint64_t **)v192;
      goto LABEL_130;
    }
    uint64_t v69 = 0;
    unint64_t v70 = 0;
    if (v192)
    {
LABEL_130:
      operator delete(v192);
      unint64_t v70 = v69;
    }
    char v71 = 0;
    unint64_t v17 = 0x8000000000000000;
    uint64_t v72 = v187;
    if (*(void *)(v62 + 16) && *(_DWORD *)(v62 + 32) == 260)
    {
      unint64_t v73 = (uint64_t *)v187;
      if (v187 != v188)
      {
        while (1)
        {
          uint64_t v74 = *v73;
          if (!*v73) {
            break;
          }
          BOOL v75 = *(void *)v74 && *(_DWORD *)(v74 + 16) == 4;
          if (!v75 || *(void *)(v74 + 32) != 1) {
            break;
          }
          if (++v73 == v188) {
            goto LABEL_142;
          }
        }
        char v71 = 0;
        unint64_t v17 = 0x8000000000000000;
        goto LABEL_223;
      }
LABEL_142:
      if (v70)
      {
        char v71 = 0;
        unint64_t v17 = 0x8000000000000000;
        if (*v70 && *((_DWORD *)v70 + 4) == 1)
        {
          if (v70[4] == 1) {
            goto LABEL_146;
          }
          char v71 = 0;
        }
      }
      else
      {
LABEL_146:
        v172 = v188;
        v174 = (uint64_t *)v187;
        if (v187 == v188)
        {
          uint64_t v76 = 0;
          *(_OWORD *)__pa = 0u;
        }
        else
        {
          if (((char *)v188 - (unsigned char *)v187) >> 3 != (v185 - (uint64_t)v184) >> 2)
          {
            exception = __cxa_allocate_exception(0x10uLL);
            MEMORY[0x25337C8E0](exception, "mismatched submeshed attribute index buffers");
            __cxa_throw(exception, (struct type_info *)&unk_270164ED8, MEMORY[0x263F8C070]);
          }
          sub_24FF57F58((uint64_t *)&v196, (uint64_t **)&v187, (uint64_t *)&v184);
          *(_OWORD *)__pa = v196;
          uint64_t v76 = v197;
        }
        v77 = (char *)operator new(0x20uLL);
        *(void *)v77 = &unk_270164FD0;
        *(_OWORD *)(v77 + 8) = *(_OWORD *)__pa;
        *((void *)v77 + 3) = v76;
        int v78 = (char *)*((void *)v68 + 30);
        *((void *)v68 + 30) = 0;
        __pb = v70;
        if (v78 == (char *)v68 + 216)
        {
          (*(void (**)(uint64_t))(*((void *)v68 + 27) + 32))((uint64_t)v68 + 216);
        }
        else if (v78)
        {
          (*(void (**)(char *))(*(void *)v78 + 40))(v78);
        }
        *((void *)v68 + 30) = v77;
        uint64_t v195 = 0;
        sub_24FF5C504(&v192);
        uint64_t v79 = *(void *)(v62 + 16);
        uint64_t v80 = *(void *)(v62 + 24);
        int v81 = *(_DWORD *)(v62 + 32);
        uint64_t v82 = *(void *)(v62 + 40);
        uint64_t v83 = *(void *)(v62 + 48);
        if (*((unsigned char *)v68 + 96))
        {
          unint64_t v84 = (void *)*((void *)v68 + 6);
          if (v84)
          {
            uint64_t v169 = *(void *)(v62 + 40);
            operator delete[](v84);
            uint64_t v82 = v169;
          }
        }
        *((void *)v68 + 6) = v79;
        *((void *)v68 + 7) = v80;
        *((_DWORD *)v68 + 16) = v81;
        *((void *)v68 + 9) = v82;
        *((void *)v68 + 10) = v83;
        *((void *)v68 + 11) = v83;
        *((unsigned char *)v68 + 96) = 0;
        if (__pb)
        {
          uint64_t v85 = *__pb;
          uint64_t v86 = __pb[1];
          int v87 = *((_DWORD *)__pb + 4);
          uint64_t v88 = __pb[3];
          uint64_t v89 = __pb[4];
        }
        else
        {
          uint64_t v85 = 0;
          uint64_t v86 = 0;
          int v87 = 0;
          uint64_t v88 = 0;
          uint64_t v89 = 0;
        }
        uint64_t v72 = v174;
        if (*((unsigned char *)v68 + 208))
        {
          v90 = (void *)*((void *)v68 + 20);
          if (v90)
          {
            uint64_t v167 = v86;
            uint64_t v170 = v85;
            operator delete[](v90);
            uint64_t v86 = v167;
            uint64_t v85 = v170;
          }
        }
        *((void *)v68 + 20) = v85;
        *((void *)v68 + 21) = v86;
        *((_DWORD *)v68 + 44) = v87;
        *((void *)v68 + 23) = v88;
        *((void *)v68 + 24) = v89;
        *((void *)v68 + 25) = v89;
        *((unsigned char *)v68 + 208) = 0;
        int v91 = *(char *)(v62 + 95);
        if (v91 >= 0) {
          int64_t v92 = (const void *)(v62 + 72);
        }
        else {
          int64_t v92 = *(const void **)(v62 + 72);
        }
        if (v91 >= 0) {
          unint64_t v93 = *(unsigned __int8 *)(v62 + 95);
        }
        else {
          unint64_t v93 = *(void *)(v62 + 80);
        }
        if (v93 >= 8) {
          size_t v94 = 8;
        }
        else {
          size_t v94 = v93;
        }
        if (!memcmp(v92, "attrTCrd", v94) && v93 == 8)
        {
          int v95 = 1;
        }
        else if (!memcmp(v92, "attrNorm", v94) && v93 == 8)
        {
          int v95 = 2;
        }
        else if (!memcmp(v92, "attrTgnt", v94) && v93 == 8)
        {
          int v95 = 3;
        }
        else if (!memcmp(v92, "attrBgnt", v94) && v93 == 8)
        {
          int v95 = 4;
        }
        else
        {
          int v96 = memcmp(v92, "attrColr", v94);
          if (v93 == 8 && v96 == 0) {
            int v95 = 5;
          }
          else {
            int v95 = 0;
          }
        }
        char v98 = 0;
        uint64_t v99 = 0;
        *((_DWORD *)v68 + 10) = v95;
        *((_DWORD *)v68 + 11) = 0;
        *((_DWORD *)v68 + 9) = -1;
        *(void *)&long long v196 = v62 + 96;
        *((void *)&v196 + 1) = v175;
        while (1)
        {
          uint64_t v100 = *((void *)&v196 + v99);
          char v101 = v98;
          v192 = "compression-level";
          uint64_t v193 = 17;
          uint64_t v102 = sub_24FF55C54(v100, (uint64_t)&v192);
          if (v100 + 8 != v102) {
            break;
          }
          char v98 = 1;
          uint64_t v99 = 1;
          if (v101) {
            goto LABEL_197;
          }
        }
        *((_DWORD *)v68 + 9) = *(_DWORD *)(v102 + 56);
LABEL_197:
        char v103 = 0;
        uint64_t v104 = 0;
        *(void *)&long long v196 = v62 + 96;
        *((void *)&v196 + 1) = v175;
        while (1)
        {
          uint64_t v105 = *((void *)&v196 + v104);
          char v106 = v103;
          v192 = "mode-bin";
          uint64_t v193 = 8;
          uint64_t v107 = sub_24FF55C54(v105, (uint64_t)&v192);
          if (v105 + 8 != v107) {
            break;
          }
          char v103 = 1;
          uint64_t v104 = 1;
          if (v106) {
            goto LABEL_202;
          }
        }
        *((unsigned char *)v68 + 16) = *(_DWORD *)(v107 + 56);
LABEL_202:
        char v108 = 0;
        uint64_t v109 = 0;
        *(void *)&long long v196 = v62 + 96;
        *((void *)&v196 + 1) = v175;
        while (1)
        {
          uint64_t v110 = *((void *)&v196 + v109);
          char v111 = v108;
          v192 = "mode-pred";
          uint64_t v193 = 9;
          uint64_t v112 = sub_24FF55C54(v110, (uint64_t)&v192);
          if (v110 + 8 != v112) {
            break;
          }
          char v108 = 1;
          uint64_t v109 = 1;
          if (v111) {
            goto LABEL_207;
          }
        }
        *((_DWORD *)v68 + 5) = *(_DWORD *)(v112 + 56);
LABEL_207:
        char v113 = 0;
        uint64_t v114 = 0;
        *(void *)&long long v196 = v62 + 96;
        *((void *)&v196 + 1) = v175;
        while (1)
        {
          uint64_t v115 = *((void *)&v196 + v114);
          char v116 = v113;
          v192 = "mode-abe";
          uint64_t v193 = 8;
          uint64_t v117 = sub_24FF55C54(v115, (uint64_t)&v192);
          if (v115 + 8 != v117) {
            break;
          }
          char v113 = 1;
          uint64_t v114 = 1;
          if (v116) {
            goto LABEL_212;
          }
        }
        *((unsigned char *)v68 + 32) = *(_DWORD *)(v117 + 56);
LABEL_212:
        char v118 = 0;
        uint64_t v119 = 0;
        *(void *)&long long v196 = v62 + 96;
        *((void *)&v196 + 1) = v175;
        while (1)
        {
          uint64_t v120 = *((void *)&v196 + v119);
          char v121 = v118;
          v192 = "bitdepth";
          uint64_t v193 = 8;
          uint64_t v122 = sub_24FF55C54(v120, (uint64_t)&v192);
          if (v120 + 8 != v122) {
            break;
          }
          char v118 = 1;
          uint64_t v119 = 1;
          if (v121) {
            goto LABEL_217;
          }
        }
        *((_DWORD *)v68 + 3) = *(_DWORD *)(v122 + 56);
LABEL_217:
        char v123 = 0;
        uint64_t v124 = 0;
        *(void *)&long long v196 = v62 + 96;
        *((void *)&v196 + 1) = v175;
        while (1)
        {
          uint64_t v125 = *((void *)&v196 + v124);
          char v126 = v123;
          v192 = "attrScope";
          uint64_t v193 = 9;
          uint64_t v127 = sub_24FF55C54(v125, (uint64_t)&v192);
          if (v125 + 8 != v127) {
            break;
          }
          char v123 = 1;
          uint64_t v124 = 1;
          if (v126) {
            goto LABEL_222;
          }
        }
        *((_DWORD *)v68 + 11) = *(_DWORD *)(v127 + 56);
LABEL_222:
        unint64_t v17 = 0;
        *((_DWORD *)v68 + 6) = __pb != 0;
        *((_DWORD *)v68 + 7) = v174 != v172;
        char v71 = 1;
      }
    }
LABEL_223:
    if (v72) {
      operator delete(v72);
    }
    if (v71)
    {
      v128 = operator new(0x18uLL);
      v128[1] = &v181;
      v128[2] = v68;
      uint64_t v129 = (uint64_t)v181;
      void *v128 = v181;
      *(void *)(v129 + 8) = v128;
      v181 = v128;
      ++v183;
      goto LABEL_227;
    }
    sub_24FF5C614((uint64_t)v68);
    goto LABEL_90;
  }
LABEL_228:
  v130 = v182;
  if (v182 == (uint64_t *)&v181)
  {
    unint64_t v17 = 0;
  }
  else
  {
    do
    {
      (**(void (***)(uint64_t))v130[2])(v130[2]);
      unint64_t v17 = 0;
      __sz += (*(uint64_t (**)(uint64_t))(*(void *)v130[2] + 8))(v130[2]);
      v130 = (uint64_t *)v130[1];
    }
    while (v130 != (uint64_t *)&v181);
  }
LABEL_90:
  if (v184) {
    operator delete(v184);
  }
  if (v17)
  {
    uint64_t v3 = 0x8000000000000000;
  }
  else
  {
    uint64_t v193 = 0;
    v194 = 0;
    v192 = 0;
    if (__sz)
    {
      if ((__sz & 0x8000000000000000) != 0) {
        sub_24FF5A660();
      }
      uint64_t v53 = (char *)operator new(__sz);
      int v54 = &v53[__sz];
      v192 = v53;
      v194 = &v53[__sz];
      bzero(v53, __sz);
      uint64_t v193 = (uint64_t)&v53[__sz];
    }
    else
    {
      int v54 = 0;
      uint64_t v53 = 0;
    }
    uint64_t v55 = v54 - v53;
    *(void *)&long long v196 = v53;
    *((void *)&v196 + 1) = v54 - v53;
    sub_24FF7BC6C(&v187);
    uint64_t v56 = v182;
    if (v182 == (uint64_t *)&v181)
    {
LABEL_102:
      ((void (*)(void, char *, int64_t))*v179)(v179[1], v53, v54 - v53 - (v55 & ~(v55 >> 63)));
      uint64_t v3 = 0;
    }
    else
    {
      while (1)
      {
        uint64_t v3 = (*(uint64_t (**)(uint64_t, void **, long long *))(*(void *)v56[2] + 16))(v56[2], &v187, &v196);
        if (v3) {
          break;
        }
        uint64_t v56 = (uint64_t *)v56[1];
        if (v56 == (uint64_t *)&v181)
        {
          uint64_t v55 = *((void *)&v196 + 1);
          goto LABEL_102;
        }
      }
    }
    uint64_t v57 = v187;
    v187 = 0;
    if (v57)
    {
      int v58 = sub_24FF7C1E0((uint64_t)v57);
      operator delete(v58);
    }
    if (v53) {
      operator delete(v53);
    }
  }
  sub_24FF5A6E4((uint64_t *)&v181);
  return v3;
}

void sub_24FF5A210(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, long long a15, uint64_t a16, uint64_t *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,uint64_t a23,uint64_t a24,uint64_t a25)
{
  if (a2)
  {
    if (__p) {
      operator delete(__p);
    }
    sub_24FF5C614(v25);
    if (a22) {
      operator delete(a22);
    }
    sub_24FF5A6E4(a17);
    __cxa_begin_catch(exception_object);
    __cxa_end_catch();
    JUMPOUT(0x24FF596A0);
  }
  _Unwind_Resume(exception_object);
}

void sub_24FF5A3F8()
{
}

uint64_t sub_24FF5A400(uint64_t a1)
{
  return a1;
}

uint64_t sub_24FF5A42C(uint64_t a1)
{
  sub_24FF5C328((void *)(a1 + 264));
  if (*(unsigned char *)(a1 + 256))
  {
    uint64_t v2 = *(void **)(a1 + 208);
    if (v2) {
      operator delete[](v2);
    }
  }
  if (*(unsigned char *)(a1 + 200))
  {
    uint64_t v3 = *(void **)(a1 + 152);
    if (v3) {
      operator delete[](v3);
    }
  }
  if (*(unsigned char *)(a1 + 144))
  {
    uint64_t v4 = *(void **)(a1 + 96);
    if (v4) {
      operator delete[](v4);
    }
  }
  if (*(unsigned char *)(a1 + 88))
  {
    uint64_t v5 = *(void **)(a1 + 40);
    if (v5) {
      operator delete[](v5);
    }
  }
  return a1;
}

void sub_24FF5A4A8(uint64_t a1)
{
  sub_24FF5C328((void *)(a1 + 264));
  if (*(unsigned char *)(a1 + 256))
  {
    uint64_t v2 = *(void **)(a1 + 208);
    if (v2) {
      operator delete[](v2);
    }
  }
  if (*(unsigned char *)(a1 + 200))
  {
    uint64_t v3 = *(void **)(a1 + 152);
    if (v3) {
      operator delete[](v3);
    }
  }
  if (*(unsigned char *)(a1 + 144))
  {
    uint64_t v4 = *(void **)(a1 + 96);
    if (v4) {
      operator delete[](v4);
    }
  }
  if (*(unsigned char *)(a1 + 88))
  {
    uint64_t v5 = *(void **)(a1 + 40);
    if (v5) {
      operator delete[](v5);
    }
  }
  operator delete((void *)a1);
}

uint64_t sub_24FF5A534(uint64_t a1)
{
  sub_24FF5C504((void *)(a1 + 216));
  if (*(unsigned char *)(a1 + 208))
  {
    uint64_t v2 = *(void **)(a1 + 160);
    if (v2) {
      operator delete[](v2);
    }
  }
  if (*(unsigned char *)(a1 + 152))
  {
    uint64_t v3 = *(void **)(a1 + 104);
    if (v3) {
      operator delete[](v3);
    }
  }
  if (*(unsigned char *)(a1 + 96))
  {
    uint64_t v4 = *(void **)(a1 + 48);
    if (v4) {
      operator delete[](v4);
    }
  }
  return a1;
}

void sub_24FF5A59C(uint64_t a1)
{
  sub_24FF5C504((void *)(a1 + 216));
  if (*(unsigned char *)(a1 + 208))
  {
    uint64_t v2 = *(void **)(a1 + 160);
    if (v2) {
      operator delete[](v2);
    }
  }
  if (*(unsigned char *)(a1 + 152))
  {
    uint64_t v3 = *(void **)(a1 + 104);
    if (v3) {
      operator delete[](v3);
    }
  }
  if (*(unsigned char *)(a1 + 96))
  {
    uint64_t v4 = *(void **)(a1 + 48);
    if (v4) {
      operator delete[](v4);
    }
  }
  operator delete((void *)a1);
}

void sub_24FF5A614()
{
  exception = __cxa_allocate_exception(8uLL);
  void *exception = MEMORY[0x263F8C3B0] + 16;
  __cxa_throw(exception, (struct type_info *)&unk_270164F60, MEMORY[0x263F8C088]);
}

void sub_24FF5A660()
{
}

void *sub_24FF5A678(unint64_t a1)
{
  if (a1 >> 61) {
    sub_24FF5A6B0();
  }
  return operator new(8 * a1);
}

void sub_24FF5A6B0()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, (struct type_info *)&unk_270165060, MEMORY[0x263F8C090]);
}

void sub_24FF5A6E4(uint64_t *a1)
{
  if (a1[2])
  {
    uint64_t v2 = *a1;
    uint64_t v3 = (uint64_t *)a1[1];
    uint64_t v4 = *v3;
    *(void *)(v4 + 8) = *(void *)(*a1 + 8);
    **(void **)(v2 + 8) = v4;
    a1[2] = 0;
    if (v3 != a1)
    {
      do
      {
        unsigned int v6 = (uint64_t *)v3[1];
        uint64_t v5 = v3[2];
        v3[2] = 0;
        if (v5) {
          (*(void (**)(uint64_t))(*(void *)v5 + 32))(v5);
        }
        operator delete(v3);
        uint64_t v3 = v6;
      }
      while (v6 != a1);
    }
  }
}

char *sub_24FF5A77C(void *a1, unint64_t a2)
{
  if (a2 >> 61) {
    sub_24FF5A660();
  }
  unint64_t result = (char *)sub_24FF5A678(a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

unint64_t sub_24FF5A7BC(unint64_t result, uint64_t *a2, uint64_t **a3, uint64_t a4, char a5)
{
  char v11 = (uint64_t *)result;
LABEL_2:
  int v12 = a2 - 1;
  j = v11;
  while (1)
  {
    char v11 = j;
    uint64_t v14 = (char *)a2 - (char *)j;
    unint64_t v15 = a2 - j;
    if (v6 || !v5)
    {
      switch(v15)
      {
        case 0uLL:
        case 1uLL:
          return result;
        case 2uLL:
          uint64_t v53 = *j;
          uint64_t v54 = **a3;
          uint64_t v55 = v54 + 8 * *j;
          if (*(unsigned char *)(v55 + 4))
          {
            uint64_t v56 = *(a2 - 1);
            uint64_t v57 = v54 + 8 * v56;
            if (!*(unsigned char *)(v57 + 4) || *(_DWORD *)v57 < *(_DWORD *)v55)
            {
              uint64_t *j = v56;
              *(a2 - 1) = v53;
            }
          }
          return result;
        case 3uLL:
          uint64_t v58 = **a3;
          return (unint64_t)sub_24FF5B2C4(j, j + 1, a2 - 1, v58);
        case 4uLL:
          return (unint64_t)sub_24FF5B6CC(j, j + 1, j + 2, a2 - 1, a3);
        case 5uLL:
          int v59 = j + 1;
          BOOL v60 = j + 2;
          uint64_t v61 = j + 3;
          unint64_t result = (unint64_t)sub_24FF5B6CC(j, j + 1, j + 2, j + 3, a3);
          uint64_t v62 = j[3];
          uint64_t v63 = **a3;
          uint64_t v64 = v63 + 8 * v62;
          if (!*(unsigned char *)(v64 + 4)) {
            return result;
          }
          uint64_t v65 = *(a2 - 1);
          uint64_t v66 = v63 + 8 * v65;
          if (*(unsigned char *)(v66 + 4))
          {
            if (*(_DWORD *)v66 >= *(_DWORD *)v64) {
              return result;
            }
          }
          *uint64_t v61 = v65;
          *(a2 - 1) = v62;
          uint64_t v67 = *v60;
          uint64_t v68 = v63 + 8 * *v60;
          if (!*(unsigned char *)(v68 + 4)) {
            return result;
          }
          uint64_t v69 = *v61;
          uint64_t v70 = v63 + 8 * *v61;
          if (*(unsigned char *)(v70 + 4))
          {
            unsigned int v71 = *(_DWORD *)v70;
            if (v71 >= *(_DWORD *)v68) {
              return result;
            }
            *BOOL v60 = v69;
            *uint64_t v61 = v67;
            uint64_t v72 = *v59;
            uint64_t v73 = v63 + 8 * *v59;
            if (!*(unsigned char *)(v73 + 4)) {
              return result;
            }
            if (v71 >= *(_DWORD *)v73) {
              return result;
            }
            j[1] = v69;
            j[2] = v72;
            uint64_t v74 = *j;
            uint64_t v75 = v63 + 8 * *j;
            if (!*(unsigned char *)(v75 + 4) || v71 >= *(_DWORD *)v75) {
              return result;
            }
          }
          else
          {
            *BOOL v60 = v69;
            *uint64_t v61 = v67;
            uint64_t v136 = *v59;
            if (!*(unsigned char *)(v63 + 8 * *v59 + 4)) {
              return result;
            }
            j[1] = v69;
            j[2] = v136;
            uint64_t v74 = *j;
            if (!*(unsigned char *)(v63 + 8 * *j + 4)) {
              return result;
            }
          }
          uint64_t *j = v69;
          j[1] = v74;
          return result;
        default:
          JUMPOUT(0);
      }
    }
    if (v14 <= 191) {
      break;
    }
    if (!a4)
    {
      if (j != a2)
      {
        int64_t v88 = (v15 - 2) >> 1;
        uint64_t v89 = *a3;
        int64_t v90 = v88;
        while (2)
        {
          int64_t v91 = v90;
          if (v88 >= v90)
          {
            uint64_t v92 = (2 * v90) | 1;
            unint64_t v93 = &j[v92];
            uint64_t v94 = *v89;
            if (2 * v91 + 2 < (uint64_t)v15)
            {
              uint64_t v95 = v94 + 8 * v93[1];
              if (*(unsigned char *)(v95 + 4))
              {
                uint64_t v96 = v94 + 8 * *v93;
                if (!*(unsigned char *)(v96 + 4) || *(_DWORD *)v96 < *(_DWORD *)v95)
                {
                  ++v93;
                  uint64_t v92 = 2 * v91 + 2;
                }
              }
            }
            uint64_t v97 = *v93;
            uint64_t v98 = j[v91];
            uint64_t v99 = v94 + 8 * v98;
            unint64_t result = *(unsigned __int8 *)(v99 + 4);
            if (!*(unsigned char *)(v99 + 4)
              || (uint64_t v100 = v94 + 8 * v97, *(unsigned char *)(v100 + 4)) && *(_DWORD *)v100 >= *(_DWORD *)v99)
            {
              j[v91] = v97;
              if (v88 < v92) {
                goto LABEL_149;
              }
              while (2)
              {
                uint64_t v102 = 2 * v92;
                uint64_t v92 = (2 * v92) | 1;
                char v101 = &j[v92];
                uint64_t v103 = v102 + 2;
                if (v103 < (uint64_t)v15)
                {
                  uint64_t v104 = v94 + 8 * v101[1];
                  if (*(unsigned char *)(v104 + 4))
                  {
                    uint64_t v105 = v94 + 8 * *v101;
                    if (!*(unsigned char *)(v105 + 4) || *(_DWORD *)v105 < *(_DWORD *)v104)
                    {
                      ++v101;
                      uint64_t v92 = v103;
                    }
                  }
                }
                uint64_t v106 = *v101;
                if (result
                  && ((uint64_t v107 = v94 + 8 * v106, !*(unsigned char *)(v107 + 4)) || *(_DWORD *)v107 < *(_DWORD *)v99))
                {
LABEL_149:
                  char v101 = v93;
                }
                else
                {
                  *unint64_t v93 = v106;
                  unint64_t v93 = v101;
                  if (v88 >= v92) {
                    continue;
                  }
                }
                break;
              }
              uint64_t *v101 = v98;
            }
          }
          int64_t v90 = v91 - 1;
          if (v91) {
            continue;
          }
          break;
        }
        uint64_t v108 = (unint64_t)v14 >> 3;
        while (2)
        {
          uint64_t v109 = 0;
          uint64_t v110 = *j;
          char v111 = *a3;
          uint64_t v112 = j;
          do
          {
            char v113 = v112;
            v112 += v109 + 1;
            uint64_t v114 = 2 * v109;
            uint64_t v109 = (2 * v109) | 1;
            uint64_t v115 = v114 + 2;
            if (v115 < v108)
            {
              unint64_t result = *v111;
              uint64_t v116 = *v111 + 8 * v112[1];
              if (*(unsigned char *)(v116 + 4))
              {
                result += 8 * *v112;
                if (!*(unsigned char *)(result + 4)
                  || (unint64_t result = *(unsigned int *)result, result < *(_DWORD *)v116))
                {
                  ++v112;
                  uint64_t v109 = v115;
                }
              }
            }
            uint64_t *v113 = *v112;
          }
          while (v109 <= (uint64_t)((unint64_t)(v108 - 2) >> 1));
          if (v112 == --a2) {
            goto LABEL_179;
          }
          *uint64_t v112 = *a2;
          *a2 = v110;
          uint64_t v117 = (char *)v112 - (char *)j + 8;
          if (v117 >= 9)
          {
            uint64_t v110 = *v112;
            uint64_t v118 = *v111;
            uint64_t v119 = (unsigned int *)(v118 + 8 * *v112);
            if (*((unsigned char *)v119 + 4))
            {
              unint64_t v120 = ((unint64_t)v117 >> 3) - 2;
              unint64_t v121 = v120 >> 1;
              uint64_t v122 = &j[v120 >> 1];
              uint64_t v123 = v118 + 8 * *v122;
              unint64_t result = *(unsigned __int8 *)(v123 + 4);
              if (!*(unsigned char *)(v123 + 4) || (unint64_t result = *v119, *(_DWORD *)v123 < result))
              {
                *uint64_t v112 = *v122;
                if (v120 < 2) {
                  goto LABEL_175;
                }
                while (2)
                {
                  unint64_t v124 = v121 - 1;
                  unint64_t v121 = (v121 - 1) >> 1;
                  uint64_t v112 = &j[v121];
                  uint64_t v125 = v118 + 8 * *v112;
                  unint64_t result = *(unsigned __int8 *)(v125 + 4);
                  if (*(unsigned char *)(v125 + 4) && (unint64_t result = *v119, *(_DWORD *)v125 >= result))
                  {
LABEL_175:
                    uint64_t v112 = v122;
                  }
                  else
                  {
                    *uint64_t v122 = *v112;
                    uint64_t v122 = &j[v121];
                    if (v124 > 1) {
                      continue;
                    }
                  }
                  break;
                }
LABEL_179:
                *uint64_t v112 = v110;
              }
            }
          }
          if (v108-- > 2) {
            continue;
          }
          break;
        }
      }
      return result;
    }
    unint64_t v16 = v15 >> 1;
    unint64_t v17 = &j[v15 >> 1];
    uint64_t v18 = **a3;
    if ((unint64_t)v14 >= 0x401)
    {
      sub_24FF5B2C4(v11, &v11[v15 >> 1], a2 - 1, v18);
      sub_24FF5B2C4(v11 + 1, v17 - 1, a2 - 2, **a3);
      sub_24FF5B2C4(v11 + 2, &v11[v16 + 1], a2 - 3, **a3);
      unint64_t result = (unint64_t)sub_24FF5B2C4(v17 - 1, v17, &v11[v16 + 1], **a3);
      uint64_t v19 = *v11;
      *char v11 = *v17;
      *unint64_t v17 = v19;
    }
    else
    {
      unint64_t result = (unint64_t)sub_24FF5B2C4(&v11[v15 >> 1], v11, a2 - 1, v18);
    }
    --a4;
    uint64_t v20 = *v11;
    uint64_t v21 = **a3;
    uint64_t v22 = v21 + 8 * *v11;
    if (a5)
    {
      int v23 = v11 + 1;
      if (!*(unsigned char *)(v22 + 4))
      {
        char v24 = 1;
        goto LABEL_26;
      }
LABEL_17:
      for (unint64_t i = v11; ; unint64_t i = v23++)
      {
        uint64_t v28 = v21 + 8 * i[1];
        if (*(unsigned char *)(v28 + 4))
        {
          if (*(_DWORD *)v28 >= *(_DWORD *)v22) {
            break;
          }
        }
      }
      char v29 = a2 - 1;
      if (i != v11)
      {
        do
        {
          uint64_t v30 = v29;
          uint64_t v31 = v21 + 8 * *v29;
          if (!*(unsigned char *)(v31 + 4)) {
            break;
          }
          unsigned int v32 = *(_DWORD *)v31;
          char v29 = v30 - 1;
        }
        while (v32 >= *(_DWORD *)v22);
        char v24 = 0;
        goto LABEL_36;
      }
      char v24 = 0;
LABEL_26:
      if (v23 >= a2)
      {
        uint64_t v30 = a2;
        goto LABEL_36;
      }
      uint64_t v30 = a2 - 1;
      if (v24)
      {
LABEL_28:
        if (v23 >= v30) {
          goto LABEL_36;
        }
        goto LABEL_33;
      }
      while (1)
      {
        uint64_t v33 = v21 + 8 * *v30;
        if (!*(unsigned char *)(v33 + 4) || v23 >= v30 || *(_DWORD *)v33 < *(_DWORD *)v22) {
          break;
        }
LABEL_33:
        --v30;
        if (v24) {
          goto LABEL_28;
        }
      }
LABEL_36:
      j = v23;
      if (v23 < v30)
      {
        uint64_t v34 = *v30;
        j = v23;
        uint64_t v35 = v30;
        do
        {
          uint64_t v36 = *j;
          *j++ = v34;
          *uint64_t v35 = v36;
          if ((v24 & 1) == 0)
          {
            while (1)
            {
              uint64_t v38 = v21 + 8 * *j;
              if (*(unsigned char *)(v38 + 4))
              {
                if (*(_DWORD *)v38 >= *(_DWORD *)v22) {
                  break;
                }
              }
              ++j;
            }
          }
          do
          {
            do
              --v35;
            while ((v24 & 1) != 0);
            uint64_t v34 = *v35;
            uint64_t v37 = v21 + 8 * *v35;
          }
          while (*(unsigned char *)(v37 + 4) && *(_DWORD *)v37 >= *(_DWORD *)v22);
        }
        while (j < v35);
      }
      uint64_t v39 = j - 1;
      if (j - 1 != v11) {
        *char v11 = *v39;
      }
      *uint64_t v39 = v20;
      if (v23 < v30) {
        goto LABEL_52;
      }
      BOOL v40 = sub_24FF5B3B4(v11, j - 1, a3);
      unint64_t result = sub_24FF5B3B4(j, a2, a3);
      if (result)
      {
        a2 = j - 1;
        if (v40) {
          return result;
        }
        goto LABEL_2;
      }
      if (!v40)
      {
LABEL_52:
        unint64_t result = sub_24FF5A7BC(v11, j - 1, a3, a4, a5 & 1);
        a5 = 0;
      }
    }
    else
    {
      int v25 = *(unsigned __int8 *)(v22 + 4);
      if (!*(unsigned char *)(v22 + 4))
      {
        uint64_t v41 = v21 + 8 * *v12;
        if (*(unsigned char *)(v41 + 4)) {
          goto LABEL_57;
        }
LABEL_86:
        char v43 = 1;
        goto LABEL_88;
      }
      uint64_t v26 = v21 + 8 * *(v11 - 1);
      if (!*(unsigned char *)(v26 + 4) || *(_DWORD *)v26 < *(_DWORD *)v22)
      {
        int v23 = v11 + 1;
        goto LABEL_17;
      }
      uint64_t v41 = v21 + 8 * *v12;
      if (!*(unsigned char *)(v41 + 4)) {
        goto LABEL_86;
      }
      if (*(_DWORD *)v22 < *(_DWORD *)v41)
      {
LABEL_57:
        for (j = v11 + 1; ; ++j)
        {
          uint64_t v42 = v21 + 8 * *j;
          if (*(unsigned char *)(v42 + 4))
          {
            if (!*(unsigned char *)(v22 + 4) || *(_DWORD *)v22 < *(_DWORD *)v42) {
              break;
            }
          }
        }
        char v43 = 0;
        goto LABEL_63;
      }
      char v43 = 0;
LABEL_88:
      for (j = v11 + 1; j < a2; ++j)
      {
        uint64_t v52 = v21 + 8 * *j;
        if (*(unsigned char *)(v52 + 4))
        {
          if (!*(unsigned char *)(v22 + 4) || *(_DWORD *)v22 < *(_DWORD *)v52) {
            break;
          }
        }
      }
LABEL_63:
      if (j < a2) {
        uint64_t v44 = a2 - 1;
      }
      else {
        uint64_t v44 = a2;
      }
      if ((v43 & 1) == 0 && j < a2)
      {
        uint64_t v44 = a2 - 1;
        do
        {
          if (*(unsigned char *)(v22 + 4) && *(_DWORD *)v22 >= *(_DWORD *)v41) {
            break;
          }
          uint64_t v45 = *--v44;
          uint64_t v41 = v21 + 8 * v45;
        }
        while (*(unsigned char *)(v41 + 4));
      }
      if (j < v44)
      {
        uint64_t v46 = *j;
        uint64_t v47 = *v44;
        do
        {
          *j++ = v47;
          *uint64_t v44 = v46;
          while (1)
          {
            uint64_t v46 = *j;
            uint64_t v48 = v21 + 8 * *j;
            if (*(unsigned char *)(v48 + 4))
            {
              if (!v25 || *(_DWORD *)v22 < *(_DWORD *)v48) {
                break;
              }
            }
            ++j;
          }
          do
          {
            uint64_t v49 = *--v44;
            uint64_t v47 = v49;
            uint64_t v50 = v21 + 8 * v49;
          }
          while (*(unsigned char *)(v50 + 4) && (!v25 || *(_DWORD *)v22 < *(_DWORD *)v50));
        }
        while (j < v44);
      }
      char v51 = j - 1;
      BOOL v5 = j - 1 >= v11;
      BOOL v6 = j - 1 == v11;
      if (j - 1 != v11) {
        *char v11 = *v51;
      }
      a5 = 0;
      *char v51 = v20;
    }
  }
  if (a5)
  {
    if (j != a2)
    {
      uint64_t v76 = j + 1;
      if (j + 1 != a2)
      {
        uint64_t v77 = 0;
        uint64_t v78 = **a3;
        uint64_t v79 = j;
        do
        {
          uint64_t v80 = v79;
          uint64_t v79 = v76;
          uint64_t v81 = v78 + 8 * *v80;
          if (*(unsigned char *)(v81 + 4))
          {
            uint64_t v82 = v80[1];
            uint64_t v83 = v78 + 8 * v82;
            int v84 = *(unsigned __int8 *)(v83 + 4);
            if (!*(unsigned char *)(v83 + 4) || *(_DWORD *)v83 < *(_DWORD *)v81)
            {
              v80[1] = *v80;
              uint64_t v85 = j;
              if (v80 == j) {
                goto LABEL_134;
              }
              uint64_t v86 = v77;
              while (1)
              {
                uint64_t v87 = *(uint64_t *)((char *)j + v86 - 8);
                unint64_t result = v78 + 8 * v87;
                if (!*(unsigned char *)(result + 4))
                {
                  uint64_t v85 = v80;
                  goto LABEL_134;
                }
                if (v84)
                {
                  unint64_t result = *(unsigned int *)result;
                  if (*(_DWORD *)v83 >= result) {
                    break;
                  }
                }
                --v80;
                *(uint64_t *)((char *)j + v86) = v87;
                v86 -= 8;
                if (!v86)
                {
                  uint64_t v85 = j;
                  goto LABEL_134;
                }
              }
              uint64_t v85 = (uint64_t *)((char *)j + v86);
LABEL_134:
              uint64_t *v85 = v82;
            }
          }
          uint64_t v76 = v79 + 1;
          v77 += 8;
        }
        while (v79 + 1 != a2);
      }
    }
  }
  else if (j != a2)
  {
    uint64_t v127 = j + 1;
    if (j + 1 != a2)
    {
      uint64_t v128 = **a3;
      do
      {
        uint64_t v129 = v128 + 8 * *v11;
        if (*(unsigned char *)(v129 + 4))
        {
          uint64_t v130 = *v127;
          uint64_t v131 = v128 + 8 * *v127;
          int v132 = *(unsigned __int8 *)(v131 + 4);
          if (!*(unsigned char *)(v131 + 4) || *(_DWORD *)v131 < *(_DWORD *)v129)
          {
            *uint64_t v127 = *v11;
            uint64_t v133 = *(v11 - 1);
            uint64_t v134 = v128 + 8 * v133;
            uint64_t v135 = v11;
            if (*(unsigned char *)(v134 + 4))
            {
              uint64_t v135 = v11;
              do
              {
                if (v132 && *(_DWORD *)v131 >= *(_DWORD *)v134) {
                  break;
                }
                *uint64_t v135 = v133;
                uint64_t v133 = *(v135 - 2);
                uint64_t v134 = v128 + 8 * v133;
                --v135;
              }
              while (*(unsigned char *)(v134 + 4));
            }
            *uint64_t v135 = v130;
          }
        }
        ++v127;
        ++v11;
      }
      while (v127 != a2);
    }
  }
  return result;
}

uint64_t *sub_24FF5B2C4(uint64_t *result, uint64_t *a2, uint64_t *a3, uint64_t a4)
{
  uint64_t v4 = *a2;
  uint64_t v5 = *result;
  uint64_t v6 = a4 + 8 * *a2;
  uint64_t v7 = a4 + 8 * *result;
  if (!*(unsigned char *)(v7 + 4))
  {
    if (!*(unsigned char *)(v6 + 4)) {
      return result;
    }
    uint64_t v8 = *a3;
    uint64_t v9 = a4 + 8 * *a3;
    goto LABEL_9;
  }
  if (*(unsigned char *)(v6 + 4))
  {
    uint64_t v8 = *a3;
    uint64_t v9 = a4 + 8 * *a3;
    if (*(_DWORD *)v6 < *(_DWORD *)v7)
    {
      if (!*(unsigned char *)(v9 + 4) || *(_DWORD *)v9 < *(_DWORD *)v6)
      {
        *unint64_t result = v8;
LABEL_18:
        *a3 = v5;
        return result;
      }
      goto LABEL_15;
    }
LABEL_9:
    if (!*(unsigned char *)(v9 + 4) || *(_DWORD *)v9 < *(_DWORD *)v6)
    {
      *a2 = v8;
      *a3 = v4;
      uint64_t v10 = *result;
      uint64_t v11 = a4 + 8 * *result;
      if (*(unsigned char *)(v11 + 4))
      {
        uint64_t v12 = a4 + 8 * *a2;
        if (!*(unsigned char *)(v12 + 4) || *(_DWORD *)v12 < *(_DWORD *)v11)
        {
          *unint64_t result = *a2;
          *a2 = v10;
        }
      }
    }
    return result;
  }
LABEL_15:
  *unint64_t result = v4;
  *a2 = v5;
  uint64_t v13 = a4 + 8 * *a3;
  if (!*(unsigned char *)(v13 + 4) || *(_DWORD *)v13 < *(_DWORD *)v7)
  {
    *a2 = *a3;
    goto LABEL_18;
  }
  return result;
}

BOOL sub_24FF5B3B4(uint64_t *a1, uint64_t *a2, uint64_t **a3)
{
  uint64_t v6 = a2 - a1;
  BOOL result = 1;
  switch(v6)
  {
    case 0:
    case 1:
      return result;
    case 2:
      uint64_t v8 = *a1;
      uint64_t v9 = **a3;
      uint64_t v10 = v9 + 8 * *a1;
      if (*(unsigned char *)(v10 + 4))
      {
        uint64_t v11 = *(a2 - 1);
        uint64_t v12 = v9 + 8 * v11;
        if (!*(unsigned char *)(v12 + 4) || *(_DWORD *)v12 < *(_DWORD *)v10)
        {
          *a1 = v11;
          *(a2 - 1) = v8;
        }
      }
      return result;
    case 3:
      sub_24FF5B2C4(a1, a1 + 1, a2 - 1, **a3);
      return 1;
    case 4:
      sub_24FF5B6CC(a1, a1 + 1, a1 + 2, a2 - 1, a3);
      return 1;
    case 5:
      unint64_t v27 = a1 + 1;
      uint64_t v28 = a1 + 2;
      char v29 = a1 + 3;
      sub_24FF5B6CC(a1, a1 + 1, a1 + 2, a1 + 3, a3);
      uint64_t v30 = a1[3];
      uint64_t v31 = **a3;
      uint64_t v32 = v31 + 8 * v30;
      if (!*(unsigned char *)(v32 + 4)) {
        return 1;
      }
      uint64_t v33 = *(a2 - 1);
      uint64_t v34 = v31 + 8 * v33;
      if (*(unsigned char *)(v34 + 4))
      {
        if (*(_DWORD *)v34 >= *(_DWORD *)v32) {
          return 1;
        }
      }
      *char v29 = v33;
      *(a2 - 1) = v30;
      uint64_t v35 = *v28;
      uint64_t v36 = v31 + 8 * *v28;
      if (!*(unsigned char *)(v36 + 4)) {
        return 1;
      }
      uint64_t v37 = *v29;
      uint64_t v38 = v31 + 8 * *v29;
      if (!*(unsigned char *)(v38 + 4))
      {
        *uint64_t v28 = v37;
        *char v29 = v35;
        uint64_t v44 = *v27;
        if (!*(unsigned char *)(v31 + 8 * *v27 + 4)) {
          return 1;
        }
        a1[1] = v37;
        a1[2] = v44;
        uint64_t v42 = *a1;
        if (!*(unsigned char *)(v31 + 8 * *a1 + 4)) {
          return 1;
        }
LABEL_39:
        *a1 = v37;
        a1[1] = v42;
        return 1;
      }
      unsigned int v39 = *(_DWORD *)v38;
      if (v39 < *(_DWORD *)v36)
      {
        *uint64_t v28 = v37;
        *char v29 = v35;
        uint64_t v40 = *v27;
        uint64_t v41 = v31 + 8 * *v27;
        if (*(unsigned char *)(v41 + 4))
        {
          if (v39 < *(_DWORD *)v41)
          {
            a1[1] = v37;
            a1[2] = v40;
            uint64_t v42 = *a1;
            uint64_t v43 = v31 + 8 * *a1;
            if (*(unsigned char *)(v43 + 4))
            {
              if (v39 < *(_DWORD *)v43) {
                goto LABEL_39;
              }
            }
          }
        }
      }
      return 1;
    default:
      uint64_t v13 = a1 + 2;
      sub_24FF5B2C4(a1, a1 + 1, a1 + 2, **a3);
      uint64_t v14 = a1 + 3;
      if (a1 + 3 == a2) {
        return 1;
      }
      uint64_t v15 = 0;
      int v16 = 0;
      uint64_t v17 = **a3;
      while (1)
      {
        uint64_t v18 = v17 + 8 * *v13;
        if (*(unsigned char *)(v18 + 4))
        {
          uint64_t v19 = *v14;
          uint64_t v20 = v17 + 8 * *v14;
          int v21 = *(unsigned __int8 *)(v20 + 4);
          if (!*(unsigned char *)(v20 + 4) || *(_DWORD *)v20 < *(_DWORD *)v18)
          {
            *uint64_t v14 = *v13;
            uint64_t v22 = a1;
            if (v13 != a1)
            {
              uint64_t v23 = v15;
              while (1)
              {
                char v24 = (char *)a1 + v23;
                uint64_t v25 = *(uint64_t *)((char *)a1 + v23 + 8);
                uint64_t v26 = v17 + 8 * v25;
                if (!*(unsigned char *)(v26 + 4))
                {
                  uint64_t v22 = (uint64_t *)(v24 + 16);
                  goto LABEL_20;
                }
                if (v21 && *(_DWORD *)v20 >= *(_DWORD *)v26) {
                  break;
                }
                --v13;
                *((void *)v24 + 2) = v25;
                v23 -= 8;
                if (v23 == -16)
                {
                  uint64_t v22 = a1;
                  goto LABEL_20;
                }
              }
              uint64_t v22 = v13;
            }
LABEL_20:
            *uint64_t v22 = v19;
            if (++v16 == 8) {
              return v14 + 1 == a2;
            }
          }
        }
        uint64_t v13 = v14;
        v15 += 8;
        if (++v14 == a2) {
          return 1;
        }
      }
  }
}

uint64_t *sub_24FF5B6CC(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, uint64_t **a5)
{
  BOOL result = sub_24FF5B2C4(a1, a2, a3, **a5);
  uint64_t v11 = *a3;
  uint64_t v12 = **a5;
  uint64_t v13 = v12 + 8 * *a3;
  if (*(unsigned char *)(v13 + 4))
  {
    uint64_t v14 = v12 + 8 * *a4;
    if (!*(unsigned char *)(v14 + 4) || *(_DWORD *)v14 < *(_DWORD *)v13)
    {
      *a3 = *a4;
      *a4 = v11;
      uint64_t v15 = *a2;
      uint64_t v16 = v12 + 8 * *a2;
      if (*(unsigned char *)(v16 + 4))
      {
        uint64_t v17 = v12 + 8 * *a3;
        if (!*(unsigned char *)(v17 + 4) || *(_DWORD *)v17 < *(_DWORD *)v16)
        {
          *a2 = *a3;
          *a3 = v15;
          uint64_t v18 = *a1;
          uint64_t v19 = v12 + 8 * *a1;
          if (*(unsigned char *)(v19 + 4))
          {
            uint64_t v20 = v12 + 8 * *a2;
            if (!*(unsigned char *)(v20 + 4) || *(_DWORD *)v20 < *(_DWORD *)v19)
            {
              *a1 = *a2;
              *a2 = v18;
            }
          }
        }
      }
    }
  }
  return result;
}

void *sub_24FF5B7C8(unint64_t a1)
{
  if (a1 >> 62) {
    sub_24FF5A6B0();
  }
  return operator new(4 * a1);
}

void *sub_24FF5B800(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v4 = result;
    if (a4 >> 62) {
      sub_24FF5A660();
    }
    BOOL result = sub_24FF5B7C8(a4);
    uint64_t v7 = result;
    *uint64_t v4 = result;
    v4[1] = result;
    v4[2] = (char *)result + 4 * v8;
    size_t v9 = a3 - (void)a2;
    if (v9) {
      BOOL result = memmove(result, a2, v9);
    }
    v4[1] = (char *)v7 + v9;
  }
  return result;
}

void sub_24FF5B87C(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void *sub_24FF5B898(void *a1)
{
  *a1 = &unk_270164F88;
  uint64_t v2 = (void *)a1[14];
  if (v2)
  {
    a1[15] = v2;
    operator delete(v2);
  }
  uint64_t v3 = (void *)a1[11];
  if (v3)
  {
    a1[12] = v3;
    operator delete(v3);
  }
  uint64_t v4 = (void *)a1[8];
  if (v4)
  {
    a1[9] = v4;
    operator delete(v4);
  }
  uint64_t v5 = (void *)a1[5];
  if (v5)
  {
    a1[6] = v5;
    operator delete(v5);
  }
  uint64_t v6 = (void *)a1[2];
  if (v6)
  {
    a1[3] = v6;
    operator delete(v6);
  }
  return a1;
}

void sub_24FF5B928(void *__p)
{
  uint64_t *__p = &unk_270164F88;
  uint64_t v2 = (void *)__p[14];
  if (v2)
  {
    __p[15] = v2;
    operator delete(v2);
  }
  uint64_t v3 = (void *)__p[11];
  if (v3)
  {
    __p[12] = v3;
    operator delete(v3);
  }
  uint64_t v4 = (void *)__p[8];
  if (v4)
  {
    __p[9] = v4;
    operator delete(v4);
  }
  uint64_t v5 = (void *)__p[5];
  if (v5)
  {
    __p[6] = v5;
    operator delete(v5);
  }
  uint64_t v6 = (void *)__p[2];
  if (v6)
  {
    __p[3] = v6;
    operator delete(v6);
  }
  operator delete(__p);
}

void *sub_24FF5B9C8(uint64_t a1)
{
  uint64_t v1 = a1 + 8;
  uint64_t v2 = operator new(0x88uLL);
  *uint64_t v2 = &unk_270164F88;
  sub_24FF5BE14(v2 + 1, v1);
  return v2;
}

void sub_24FF5BA1C(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *sub_24FF5BA30(uint64_t a1, void *a2)
{
  *a2 = &unk_270164F88;
  return sub_24FF5BE14(a2 + 1, a1 + 8);
}

void sub_24FF5BA5C(uint64_t a1)
{
}

void sub_24FF5BA64(void *a1)
{
  sub_24FF5C004(a1 + 1);
  operator delete(a1);
}

char *sub_24FF5BAA0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)(a2 + 160) = 0;
  *(_OWORD *)(a2 + 128) = 0u;
  *(_OWORD *)(a2 + 144) = 0u;
  *(_OWORD *)(a2 + 96) = 0u;
  *(_OWORD *)(a2 + 112) = 0u;
  *(_OWORD *)(a2 + 64) = 0u;
  *(_OWORD *)(a2 + 80) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)(a2 + 48) = 0u;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  uint64_t v4 = (uint64_t *)a1[2];
  uint64_t v5 = (uint64_t *)a1[3];
  if (v4 == v5)
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v7 = (uint64_t *)a1[2];
    do
    {
      uint64_t v8 = *v7++;
      v6 += *(void *)(v8 + 24) * *(void *)(v8 + 32);
    }
    while (v7 != v5);
  }
  *(_DWORD *)(a2 + 16) = 4;
  *(void *)(a2 + 24) = v6;
  *(int64x2_t *)(a2 + 32) = vdupq_n_s64(1uLL);
  *(unsigned char *)(a2 + 48) = 0;
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  BOOL result = (char *)operator new[](4 * v6);
  uint64_t v10 = result;
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 48) = 1;
  if (v4 != v5)
  {
    if ((unint64_t)(v5 - v4) <= 1) {
      uint64_t v11 = 1;
    }
    else {
      uint64_t v11 = v5 - v4;
    }
    do
    {
      uint64_t v12 = *(void *)(*v4 + 24) * *(void *)(*v4 + 32);
      if (v12) {
        BOOL result = (char *)memmove(v10, (const void *)(*(void *)*v4 + 4 * *(void *)(*v4 + 8)), 4 * v12);
      }
      v10 += 4 * v12;
      ++v4;
      --v11;
    }
    while (v11);
  }
  uint64_t v13 = a1[1];
  *(void *)(a2 + 56) = 0;
  *(void *)(a2 + 64) = 0;
  *(_DWORD *)(a2 + 72) = 4;
  *(void *)(a2 + 80) = v13;
  *(int64x2_t *)(a2 + 88) = vdupq_n_s64(1uLL);
  *(unsigned char *)(a2 + 104) = 0;
  uint64_t v15 = (unsigned int *)a1[14];
  uint64_t v14 = (unsigned int *)a1[15];
  if (v15 == v14 || (uint64_t v16 = v15 + 1, v15 + 1 == v14))
  {
    uint64_t v19 = (unsigned int *)a1[14];
    uint64_t v16 = v19;
LABEL_44:
    unsigned int v25 = *v19;
    goto LABEL_45;
  }
  unsigned int v18 = *v15;
  unsigned int v17 = v15[1];
  if (v17 >= *v15) {
    uint64_t v19 = (unsigned int *)a1[14];
  }
  else {
    uint64_t v19 = v15 + 1;
  }
  if (v17 < v18) {
    uint64_t v16 = (unsigned int *)a1[14];
  }
  uint64_t v20 = v15 + 2;
  if (v20 == v14) {
    goto LABEL_44;
  }
  if (v17 <= v18) {
    unsigned int v21 = v18;
  }
  else {
    unsigned int v21 = v17;
  }
  if (v17 >= v18) {
    unsigned int v17 = v18;
  }
  while (v20 + 1 != v14)
  {
    unsigned int v23 = *v20;
    unsigned int v22 = v20[1];
    if (v22 >= *v20)
    {
      if (v23 < v17)
      {
        unsigned int v17 = *v20;
        uint64_t v19 = v20;
      }
      BOOL v24 = v22 >= v21;
      if (v22 > v21) {
        unsigned int v21 = v20[1];
      }
      if (v24) {
        uint64_t v16 = v20 + 1;
      }
    }
    else
    {
      unsigned int v17 = *v19;
      if (v22 < *v19)
      {
        unsigned int v17 = v20[1];
        uint64_t v19 = v20 + 1;
      }
      unsigned int v21 = *v16;
      if (v23 > *v16) {
        unsigned int v21 = *v20;
      }
      if (v23 >= *v16) {
        uint64_t v16 = v20;
      }
    }
    v20 += 2;
    if (v20 == v14) {
      goto LABEL_44;
    }
  }
  unsigned int v25 = *v20;
  if (*v20 >= *v19)
  {
    if (v25 >= *v16) {
      uint64_t v16 = v20;
    }
    goto LABEL_44;
  }
LABEL_45:
  if (v25 > 3 || *v16 >= 4)
  {
    *(void *)(a2 + 64) = 0;
    BOOL result = (char *)operator new[](4 * v13);
    uint64_t v26 = result;
    *(void *)(a2 + 56) = result;
    *(unsigned char *)(a2 + 104) = 1;
    uint64_t v28 = a1[5];
    uint64_t v27 = a1[6];
    if (v27 != v28)
    {
      unint64_t v29 = 0;
      do
      {
        uint64_t v30 = *(void **)(v28 + 8 * v29);
        if (v30)
        {
          uint64_t v31 = v30[3];
          if (v31)
          {
            BOOL result = (char *)memmove(v26, (const void *)(*v30 + 4 * v30[1]), 4 * v31);
            uint64_t v28 = a1[5];
            uint64_t v27 = a1[6];
          }
          v26 += 4 * v31;
        }
        else
        {
          uint64_t v32 = *(void *)(a1[11] + 8 * v29);
          if (v32)
          {
            uint64_t v33 = a1[14];
            do
            {
              *(_DWORD *)uint64_t v26 = *(_DWORD *)(v33 + 4 * v29);
              v26 += 4;
              --v32;
            }
            while (v32);
          }
        }
        ++v29;
      }
      while (v29 < (v27 - v28) >> 3);
    }
  }
  if (a1[9] - a1[8] >= 5uLL)
  {
    uint64_t v34 = a1[1];
    if (*(unsigned char *)(a2 + 160))
    {
      uint64_t v35 = *(void **)(a2 + 112);
      if (v35) {
        operator delete[](v35);
      }
    }
    *(_DWORD *)(a2 + 128) = 260;
    *(void *)(a2 + 136) = v34;
    *(int64x2_t *)(a2 + 144) = vdupq_n_s64(1uLL);
    *(unsigned char *)(a2 + 160) = 0;
    *(void *)(a2 + 112) = 0;
    *(void *)(a2 + 120) = 0;
    BOOL result = (char *)operator new[](4 * v34);
    *(void *)(a2 + 112) = result;
    *(unsigned char *)(a2 + 160) = 1;
    uint64_t v36 = a1[8];
    uint64_t v37 = a1[9];
    uint64_t v38 = v37 - v36;
    if (v37 != v36)
    {
      uint64_t v39 = 0;
      unint64_t v40 = v38 >> 2;
      uint64_t v41 = a1[11];
      if (v40 <= 1) {
        unint64_t v40 = 1;
      }
      do
      {
        for (uint64_t i = *(void *)(v41 + 8 * v39); i; --i)
        {
          *(_DWORD *)BOOL result = *(_DWORD *)(v36 + 4 * v39);
          result += 4;
        }
        ++v39;
      }
      while (v39 != v40);
    }
  }
  return result;
}

void sub_24FF5BDDC(_Unwind_Exception *exception_object)
{
  if (*(unsigned char *)(v1 + 104) && *v2) {
    operator delete[](*v2);
  }
  if (*(unsigned char *)(v1 + 48))
  {
    if (*(void *)v1) {
      operator delete[](*(void **)v1);
    }
  }
  _Unwind_Resume(exception_object);
}

void *sub_24FF5BE14(void *a1, uint64_t a2)
{
  *a1 = *(void *)a2;
  a1[1] = 0;
  a1[2] = 0;
  a1[3] = 0;
  sub_24FF5BF88(a1 + 1, *(const void **)(a2 + 8), *(void *)(a2 + 16), (uint64_t)(*(void *)(a2 + 16) - *(void *)(a2 + 8)) >> 3);
  a1[4] = 0;
  a1[5] = 0;
  a1[6] = 0;
  sub_24FF5BF88(a1 + 4, *(const void **)(a2 + 32), *(void *)(a2 + 40), (uint64_t)(*(void *)(a2 + 40) - *(void *)(a2 + 32)) >> 3);
  a1[7] = 0;
  a1[8] = 0;
  a1[9] = 0;
  sub_24FF5B800(a1 + 7, *(const void **)(a2 + 56), *(void *)(a2 + 64), (uint64_t)(*(void *)(a2 + 64) - *(void *)(a2 + 56)) >> 2);
  a1[10] = 0;
  a1[11] = 0;
  a1[12] = 0;
  uint64_t v5 = *(unsigned char **)(a2 + 80);
  uint64_t v4 = *(unsigned char **)(a2 + 88);
  int64_t v6 = v4 - v5;
  if (v4 != v5)
  {
    sub_24FF5A77C(a1 + 10, v6 >> 3);
    uint64_t v7 = (char *)a1[11];
    memmove(v7, v5, v6);
    a1[11] = &v7[8 * (v6 >> 3)];
  }
  a1[13] = 0;
  a1[14] = 0;
  a1[15] = 0;
  sub_24FF5B800(a1 + 13, *(const void **)(a2 + 104), *(void *)(a2 + 112), (uint64_t)(*(void *)(a2 + 112) - *(void *)(a2 + 104)) >> 2);
  return a1;
}

void sub_24FF5BF28(_Unwind_Exception *exception_object)
{
  uint64_t v7 = *v5;
  if (*v5)
  {
    v1[11] = v7;
    operator delete(v7);
  }
  uint64_t v8 = *v4;
  if (*v4)
  {
    v1[8] = v8;
    operator delete(v8);
  }
  size_t v9 = *v3;
  if (*v3)
  {
    v1[5] = v9;
    operator delete(v9);
  }
  uint64_t v10 = *v2;
  if (*v2)
  {
    v1[2] = v10;
    operator delete(v10);
  }
  _Unwind_Resume(exception_object);
}

void *sub_24FF5BF88(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    int64_t v6 = result;
    BOOL result = sub_24FF5A77C(result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      BOOL result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_24FF5BFE8(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void sub_24FF5C004(void *a1)
{
  uint64_t v2 = (void *)a1[13];
  if (v2)
  {
    a1[14] = v2;
    operator delete(v2);
  }
  uint64_t v3 = (void *)a1[10];
  if (v3)
  {
    a1[11] = v3;
    operator delete(v3);
  }
  uint64_t v4 = (void *)a1[7];
  if (v4)
  {
    a1[8] = v4;
    operator delete(v4);
  }
  uint64_t v5 = (void *)a1[4];
  if (v5)
  {
    a1[5] = v5;
    operator delete(v5);
  }
  int64_t v6 = (void *)a1[1];
  if (v6)
  {
    a1[2] = v6;
    operator delete(v6);
  }
}

void *sub_24FF5C08C(void *a1)
{
  *a1 = &unk_270164FD0;
  uint64_t v2 = (void *)a1[1];
  if (v2)
  {
    a1[2] = v2;
    operator delete(v2);
  }
  return a1;
}

void sub_24FF5C0DC(void *__p)
{
  uint64_t *__p = &unk_270164FD0;
  uint64_t v2 = (void *)__p[1];
  if (v2)
  {
    __p[2] = v2;
    operator delete(v2);
  }
  operator delete(__p);
}

void *sub_24FF5C13C(uint64_t a1)
{
  uint64_t v2 = operator new(0x20uLL);
  *uint64_t v2 = &unk_270164FD0;
  v2[2] = 0;
  v2[3] = 0;
  v2[1] = 0;
  sub_24FF5BF88(v2 + 1, *(const void **)(a1 + 8), *(void *)(a1 + 16), (uint64_t)(*(void *)(a1 + 16) - *(void *)(a1 + 8)) >> 3);
  return v2;
}

void sub_24FF5C1A0(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *sub_24FF5C1B4(uint64_t a1, void *a2)
{
  *a2 = &unk_270164FD0;
  a2[2] = 0;
  a2[3] = 0;
  a2[1] = 0;
  return sub_24FF5BF88(a2 + 1, *(const void **)(a1 + 8), *(void *)(a1 + 16), (uint64_t)(*(void *)(a1 + 16) - *(void *)(a1 + 8)) >> 3);
}

void sub_24FF5C1F0(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 8);
  if (v2)
  {
    *(void *)(a1 + 16) = v2;
    operator delete(v2);
  }
}

void sub_24FF5C208(void *__p)
{
  uint64_t v2 = (void *)__p[1];
  if (v2)
  {
    __p[2] = v2;
    operator delete(v2);
  }
  operator delete(__p);
}

char *sub_24FF5C24C@<X0>(char *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)(a2 + 48) = 0;
  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)a2 = 0u;
  uint64_t v2 = (uint64_t *)*((void *)result + 1);
  uint64_t v3 = (uint64_t *)*((void *)result + 2);
  if (v2 != v3)
  {
    uint64_t v5 = 0;
    int64_t v6 = (uint64_t *)*((void *)result + 1);
    do
    {
      uint64_t v7 = *v6++;
      v5 += *(void *)(v7 + 24) * *(void *)(v7 + 32);
    }
    while (v6 != v3);
    *(_DWORD *)(a2 + 16) = 4;
    *(void *)(a2 + 24) = v5;
    *(int64x2_t *)(a2 + 32) = vdupq_n_s64(1uLL);
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
    BOOL result = (char *)operator new[](4 * v5);
    size_t v8 = result;
    *(void *)a2 = result;
    *(unsigned char *)(a2 + 48) = 1;
    if ((unint64_t)(v3 - v2) <= 1) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = v3 - v2;
    }
    do
    {
      uint64_t v10 = *(void *)(*v2 + 24) * *(void *)(*v2 + 32);
      if (v10) {
        BOOL result = (char *)memmove(v8, (const void *)(*(void *)*v2 + 4 * *(void *)(*v2 + 8)), 4 * v10);
      }
      v8 += 4 * v10;
      ++v2;
      --v9;
    }
    while (v9);
  }
  return result;
}

void *sub_24FF5C328(void *a1)
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

void *sub_24FF5C3AC(void *a1, uint64_t a2)
{
  uint64_t v4 = (void *)a1[3];
  a1[3] = 0;
  if (v4 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v4)
  {
    (*(void (**)(void *))(*v4 + 40))(v4);
  }
  uint64_t v5 = *(void *)(a2 + 24);
  if (v5)
  {
    if (v5 == a2)
    {
      a1[3] = a1;
      (*(void (**)(void, void *))(**(void **)(a2 + 24) + 24))(*(void *)(a2 + 24), a1);
    }
    else
    {
      a1[3] = v5;
      *(void *)(a2 + 24) = 0;
    }
  }
  else
  {
    a1[3] = 0;
  }
  return a1;
}

void sub_24FF5C48C()
{
  exception = __cxa_allocate_exception(8uLL);
  void *exception = &unk_270165030;
  __cxa_throw(exception, (struct type_info *)&unk_270165008, (void (*)(void *))std::exception::~exception);
}

void sub_24FF5C4DC(std::exception *a1)
{
  std::exception::~exception(a1);
  operator delete(v1);
}

void *sub_24FF5C504(void *a1)
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

void sub_24FF5C588(uint64_t a1)
{
  sub_24FF5C328((void *)(a1 + 264));
  if (*(unsigned char *)(a1 + 256))
  {
    uint64_t v2 = *(void **)(a1 + 208);
    if (v2) {
      operator delete[](v2);
    }
  }
  if (*(unsigned char *)(a1 + 200))
  {
    uint64_t v3 = *(void **)(a1 + 152);
    if (v3) {
      operator delete[](v3);
    }
  }
  if (*(unsigned char *)(a1 + 144))
  {
    uint64_t v4 = *(void **)(a1 + 96);
    if (v4) {
      operator delete[](v4);
    }
  }
  if (*(unsigned char *)(a1 + 88))
  {
    uint64_t v5 = *(void **)(a1 + 40);
    if (v5) {
      operator delete[](v5);
    }
  }
  operator delete((void *)a1);
}

void sub_24FF5C614(uint64_t a1)
{
  sub_24FF5C504((void *)(a1 + 216));
  if (*(unsigned char *)(a1 + 208))
  {
    uint64_t v2 = *(void **)(a1 + 160);
    if (v2) {
      operator delete[](v2);
    }
  }
  if (*(unsigned char *)(a1 + 152))
  {
    uint64_t v3 = *(void **)(a1 + 104);
    if (v3) {
      operator delete[](v3);
    }
  }
  if (*(unsigned char *)(a1 + 96))
  {
    uint64_t v4 = *(void **)(a1 + 48);
    if (v4) {
      operator delete[](v4);
    }
  }
  operator delete((void *)a1);
}

uint64_t *sub_24FF5C68C(uint64_t *result, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    uint64_t v3 = 8 * a2;
    do
    {
      uint64_t v4 = *v2;
      if (*v2)
      {
        if (!*(void *)v4)
        {
          size_t v5 = *(void *)(v4 + 24) * *(unsigned __int8 *)(v4 + 16) * *(void *)(v4 + 32);
          *(void *)(v4 + 8) = 0;
          BOOL result = (uint64_t *)operator new[](v5);
          *(void *)uint64_t v4 = result;
          *(unsigned char *)(v4 + 48) = 1;
        }
      }
      ++v2;
      v3 -= 8;
    }
    while (v3);
  }
  return result;
}

unint64_t sub_24FF5C700(uint64_t a1, uint64_t *a2)
{
  uint64_t v83 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(_DWORD **)a1;
  uint64_t v4 = *(void *)(a1 + 8);
  *(void *)&long long v78 = 0xEEB6CC7FFAA28E71;
  if (sub_24FF55DA4(v3, v4 & ~(v4 >> 63), &v78, 2)) {
    return 0x8000000000000000;
  }
  LOBYTE(v80) = 0;
  long long v78 = 0u;
  long long v79 = 0u;
  if (!sub_24FF5DEB4((uint64_t)v3, v4 & ~(v4 >> 63), (uint64_t)&v78, (int16x8_t)0) || v6 < 0) {
    return 0x8000000000000000;
  }
  uint64_t v64 = (_DWORD *)DWORD2(v78);
  int v7 = v79;
  int v8 = DWORD1(v79);
  unsigned int v9 = HIDWORD(v79);
  int v66 = v80;
  *(void *)&long long v78 = "vtxs";
  int v77 = 260;
  __p[0] = (void *)SHIDWORD(v78);
  uint64_t v69 = 3;
  uint64_t v76 = a2[2];
  uint64_t v10 = (uint64_t **)sub_24FF56CCC((uint64_t)a2, 0, 0, &v76, (char **)&v78, &v77, (uint64_t *)__p, &v69);
  v10[1] = a2;
  uint64_t v11 = *a2;
  *uint64_t v10 = (uint64_t *)*a2;
  *(void *)(v11 + 8) = v10;
  *a2 = (uint64_t)v10;
  uint64_t v12 = a2[2] + 1;
  a2[2] = v12;
  *(void *)&long long v78 = "idxs";
  int v77 = 260;
  __p[0] = (void *)v8;
  uint64_t v69 = 1;
  uint64_t v76 = v12;
  uint64_t v13 = (uint64_t **)sub_24FF56CCC((uint64_t)a2, 0, 0, &v76, (char **)&v78, &v77, (uint64_t *)__p, &v69);
  v13[1] = a2;
  uint64_t v14 = *a2;
  *uint64_t v13 = (uint64_t *)*a2;
  *(void *)(v14 + 8) = v13;
  *a2 = (uint64_t)v13;
  uint64_t v15 = a2[2] + 1;
  a2[2] = v15;
  *(void *)&long long v78 = "topo";
  int v77 = 260;
  __p[0] = (void *)v7;
  uint64_t v69 = 1;
  uint64_t v76 = v15;
  uint64_t v16 = sub_24FF56CCC((uint64_t)a2, 0, 0, &v76, (char **)&v78, &v77, (uint64_t *)__p, &v69);
  v16[1] = a2;
  uint64_t v17 = *a2;
  void *v16 = *a2;
  *(void *)(v17 + 8) = v16;
  *a2 = (uint64_t)v16;
  uint64_t v18 = a2[2] + 1;
  a2[2] = v18;
  if (v66)
  {
    *(void *)&long long v78 = "fgrp";
    int v77 = 260;
    __p[0] = (void *)v7;
    uint64_t v69 = 1;
    uint64_t v76 = v18;
    uint64_t v19 = sub_24FF56CCC((uint64_t)a2, 0, 0, &v76, (char **)&v78, &v77, (uint64_t *)__p, &v69);
    v19[1] = a2;
    uint64_t v20 = *a2;
    *uint64_t v19 = *a2;
    *(void *)(v20 + 8) = v19;
    *a2 = (uint64_t)v19;
    ++a2[2];
    unsigned int v21 = v19 + 2;
  }
  else
  {
    unsigned int v21 = 0;
  }
  if (v9 == 1)
  {
    uint64_t v22 = 4 * v7;
  }
  else if (v9)
  {
    uint64_t v22 = 0;
  }
  else
  {
    uint64_t v22 = 3 * v7;
  }
  if (v13[5] == (uint64_t *)v22)
  {
    v13[5] = (uint64_t *)v7;
    if (v9 > 3) {
      unsigned int v23 = 0;
    }
    else {
      unsigned int v23 = (uint64_t *)qword_24FF7D6C8[v9];
    }
    v13[6] = v23;
    v13[7] = v23;
  }
  sub_24FF555F0(&v78, "faceType");
  __p[0] = &v78;
  *((_DWORD *)sub_24FF5574C(v13 + 12, (const void **)&v78, (uint64_t)&unk_24FF7D066, (_OWORD **)__p) + 14) = v9;
  if (SBYTE7(v79) < 0) {
    operator delete((void *)v78);
  }
  BOOL v24 = v13[15];
  sub_24FF555F0(&v78, "idxdby");
  __p[0] = &v78;
  *((_DWORD *)sub_24FF5574C(v10 + 12, (const void **)&v78, (uint64_t)&unk_24FF7D066, (_OWORD **)__p) + 14) = v24;
  if (SBYTE7(v79) < 0) {
    operator delete((void *)v78);
  }
  unsigned int v25 = operator new(0x38uLL);
  *unsigned int v25 = &unk_270165088;
  v25[1] = v10 + 2;
  v25[2] = v13 + 2;
  v25[3] = v16 + 2;
  v25[4] = v21;
  v25[5] = v3;
  v25[6] = v4;
  *((void *)&v79 + 1) = v25;
  uint64_t v57 = (uint64_t *)(a1 + 40);
  sub_24FF5D0E8((uint64_t *)(a1 + 40), &v78);
  sub_24FF55508(&v78);
  unint64_t result = 0;
  if (v64)
  {
    uint64_t v26 = v4 - (void)v64;
    if (v26 >= 1)
    {
      if (v3) {
        uint64_t v27 = (_DWORD *)((char *)v64 + (void)v3);
      }
      else {
        uint64_t v27 = v64;
      }
      uint64_t v28 = v26;
      while (1)
      {
        *(void *)&long long v78 = 0xEEB6CC7FFAA28E71;
        if (sub_24FF55DA4(v27, v26, &v78, 2)) {
          break;
        }
        int v81 = 0;
        long long v79 = 0u;
        long long v80 = 0u;
        long long v78 = 0u;
        if (!sub_24FF5F618((uint64_t)v27, v26, (uint64_t)&v78) || v29 < 0) {
          break;
        }
        uint64_t v30 = &kGCLAttributeBuffer;
        if ((v80 - 1) <= 4) {
          uint64_t v30 = (char **)(&off_26534EC30)[(int)v80 - 1];
        }
        uint64_t v31 = (_DWORD *)DWORD2(v78);
        uint64_t v67 = (void *)SHIDWORD(v78);
        uint64_t v32 = (int)v79;
        uint64_t v58 = (void *)SDWORD1(v79);
        int v33 = HIDWORD(v79);
        int v34 = DWORD1(v80);
        int v63 = HIDWORD(v80);
        int v65 = DWORD2(v80);
        uint64_t v35 = *v30;
        sub_24FF555F0(&v78, "attrScope");
        uint64_t v62 = v31;
        DWORD2(v79) = v34;
        sub_24FF555F0(&v80, "bitdepth");
        uint64_t v36 = 0;
        *(_DWORD *)&v82[1] = v33;
        uint64_t v70 = 0;
        unsigned int v71 = 0;
        uint64_t v69 = (uint64_t)&v70;
        do
        {
          sub_24FF5D34C(&v69, (uint64_t)&v70, (const void **)((char *)&v78 + v36), (uint64_t)&v78 + v36);
          v36 += 32;
        }
        while (v36 != 64);
        sub_24FF555F0(__p, v35);
        uint64_t v74 = (char **)v69;
        v75[0] = v70;
        v75[1] = v71;
        BOOL v60 = v27;
        int v59 = v34;
        if (v71)
        {
          *((void *)v70 + 2) = v75;
          uint64_t v69 = (uint64_t)&v70;
          uint64_t v70 = 0;
          unsigned int v71 = 0;
        }
        else
        {
          uint64_t v74 = v75;
        }
        uint64_t v37 = a2[2];
        uint64_t v38 = (char *)operator new(0x80uLL);
        uint64_t v39 = (uint64_t *)v38;
        *((_OWORD *)v38 + 1) = 0u;
        uint64_t v61 = v38 + 16;
        *(_OWORD *)uint64_t v38 = 0u;
        *((_DWORD *)v38 + 8) = 260;
        *((void *)v38 + 5) = v67;
        *((void *)v38 + 6) = v32;
        *((void *)v38 + 7) = v32;
        v38[64] = 0;
        if (SHIBYTE(v73) < 0)
        {
          sub_24FF5D2AC(v38 + 72, __p[0], (unint64_t)__p[1]);
        }
        else
        {
          *(_OWORD *)(v38 + 72) = *(_OWORD *)__p;
          *((void *)v38 + 11) = v73;
        }
        v39[13] = 0;
        unint64_t v40 = (uint64_t **)(v39 + 12);
        v39[14] = 0;
        v39[12] = (uint64_t)(v39 + 13);
        uint64_t v41 = v74;
        if (v74 != v75)
        {
          do
          {
            sub_24FF5D34C(v39 + 12, (uint64_t)(v39 + 13), (const void **)v41 + 4, (uint64_t)(v41 + 4));
            uint64_t v42 = v41[1];
            if (v42)
            {
              do
              {
                uint64_t v43 = (char **)v42;
                uint64_t v42 = *(char **)v42;
              }
              while (v42);
            }
            else
            {
              do
              {
                uint64_t v43 = (char **)v41[2];
                BOOL v44 = *v43 == (char *)v41;
                uint64_t v41 = v43;
              }
              while (!v44);
            }
            uint64_t v41 = v43;
          }
          while (v43 != v75);
        }
        v39[15] = v37;
        uint64_t v45 = (uint64_t)a2;
        uint64_t v46 = *a2;
        *uint64_t v39 = *a2;
        v39[1] = (uint64_t)a2;
        *(void *)(v46 + 8) = v39;
        *a2 = (uint64_t)v39;
        ++a2[2];
        sub_24FF5558C((uint64_t)&v74, v75[0]);
        if (SHIBYTE(v73) < 0) {
          operator delete(__p[0]);
        }
        sub_24FF5558C((uint64_t)&v69, v70);
        for (uint64_t i = 0; i != -64; i -= 32)
        {
          if ((char)v82[i] < 0) {
            operator delete(*(void **)((char *)&v80 + i));
          }
        }
        if (v65 == 1)
        {
          *(void *)&long long v78 = "cond";
          int v77 = 1;
          __p[0] = v67;
          uint64_t v69 = 1;
          uint64_t v76 = a2[2];
          uint64_t v48 = sub_24FF56CCC((uint64_t)a2, 0, 0, &v76, (char **)&v78, &v77, (uint64_t *)__p, &v69);
          v48[1] = a2;
          uint64_t v49 = *a2;
          *uint64_t v48 = *a2;
          *(void *)(v49 + 8) = v48;
          *a2 = (uint64_t)v48;
          ++a2[2];
          uint64_t v50 = v48[15];
          sub_24FF555F0(&v78, "condby");
          __p[0] = &v78;
          *((_DWORD *)sub_24FF5574C(v40, (const void **)&v78, (uint64_t)&unk_24FF7D066, (_OWORD **)__p) + 14) = v50;
          uint64_t v45 = (uint64_t)a2;
          if (SBYTE7(v79) < 0) {
            operator delete((void *)v78);
          }
          char v51 = v48 + 2;
        }
        else
        {
          char v51 = 0;
        }
        if (v63)
        {
          *(void *)&long long v78 = "idxs";
          int v77 = 4;
          __p[0] = v58;
          uint64_t v69 = 1;
          uint64_t v76 = *(void *)(v45 + 16);
          uint64_t v52 = sub_24FF56CCC(v45, 0, 0, &v76, (char **)&v78, &v77, (uint64_t *)__p, &v69);
          v52[1] = a2;
          uint64_t v53 = *a2;
          *uint64_t v52 = *a2;
          *(void *)(v53 + 8) = v52;
          *a2 = (uint64_t)v52;
          ++*(void *)(v45 + 16);
          uint64_t v54 = v52[15];
          sub_24FF555F0(&v78, "idxdby");
          __p[0] = &v78;
          *((_DWORD *)sub_24FF5574C(v40, (const void **)&v78, (uint64_t)&unk_24FF7D066, (_OWORD **)__p) + 14) = v54;
          if (SBYTE7(v79) < 0) {
            operator delete((void *)v78);
          }
          uint64_t v55 = v52 + 2;
        }
        else
        {
          uint64_t v55 = 0;
        }
        uint64_t v56 = operator new(0x38uLL);
        *uint64_t v56 = &unk_2701650D0;
        v56[1] = v61;
        v56[2] = v51;
        v56[3] = v55;
        *((_DWORD *)v56 + 8) = v59;
        v56[5] = v60;
        v56[6] = v28;
        *((void *)&v79 + 1) = v56;
        sub_24FF5D0E8(v57, &v78);
        sub_24FF55508(&v78);
        unint64_t result = 0;
        if (v60) {
          uint64_t v27 = (_DWORD *)((char *)v62 + (void)v60);
        }
        else {
          uint64_t v27 = v62;
        }
        v28 -= (uint64_t)v62;
        if (v28 >= 1)
        {
          uint64_t v26 = v28 & ~(v28 >> 63);
          if (v62) {
            continue;
          }
        }
        return result;
      }
      return 0x8000000000000000;
    }
  }
  return result;
}

void sub_24FF5CFF8(_Unwind_Exception *a1)
{
  sub_24FF55508((void *)(v1 - 176));
  _Unwind_Resume(a1);
}

uint64_t *sub_24FF5D0E8(uint64_t *a1, void *a2)
{
  unint64_t result = (uint64_t *)operator new(0x30uLL);
  size_t v5 = result;
  *unint64_t result = 0;
  result[1] = 0;
  uint64_t v6 = a2 + 3;
  int v7 = (void *)a2[3];
  if (v7)
  {
    if (v7 == a2)
    {
      result[5] = (uint64_t)(result + 2);
      unint64_t result = (uint64_t *)(*(uint64_t (**)(void *))(*a2 + 24))(a2);
      goto LABEL_7;
    }
    result[5] = (uint64_t)v7;
  }
  else
  {
    uint64_t v6 = result + 5;
  }
  void *v6 = 0;
LABEL_7:
  uint64_t v8 = *a1;
  uint64_t *v5 = *a1;
  v5[1] = (uint64_t)a1;
  *(void *)(v8 + 8) = v5;
  *a1 = (uint64_t)v5;
  ++a1[2];
  return result;
}

uint64_t sub_24FF5D19C(uint64_t a1)
{
  if (*(char *)(a1 + 23) < 0) {
    operator delete(*(void **)a1);
  }
  return a1;
}

uint64_t sub_24FF5D1DC(uint64_t a1)
{
  sub_24FF68CEC(&v9);
  uint64_t v2 = a1 + 40;
  for (uint64_t i = *(void *)(a1 + 48); i != v2; uint64_t i = *(void *)(i + 8))
  {
    uint64_t v4 = *(void *)(i + 40);
    if (!v4) {
      sub_24FF5C48C();
    }
    uint64_t v5 = (*(uint64_t (**)(uint64_t, void **))(*(void *)v4 + 48))(v4, &v9);
    if (v5) {
      goto LABEL_7;
    }
  }
  uint64_t v5 = 0;
LABEL_7:
  uint64_t v6 = v9;
  unsigned int v9 = 0;
  if (v6)
  {
    int v7 = sub_24FF6A770(v6);
    operator delete(v7);
  }
  return v5;
}

void sub_24FF5D288(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10)
{
  if (a10)
  {
    uint64_t v11 = sub_24FF6A770(a10);
    operator delete(v11);
  }
  _Unwind_Resume(exception_object);
}

void *sub_24FF5D2AC(unsigned char *__dst, void *__src, unint64_t a3)
{
  uint64_t v5 = __dst;
  if (a3 > 0x16)
  {
    if (a3 >= 0x7FFFFFFFFFFFFFF8) {
      sub_24FF556A4();
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
    uint64_t v5 = v8;
  }
  else
  {
    __dst[23] = a3;
  }
  return memmove(v5, __src, a3 + 1);
}

uint64_t *sub_24FF5D34C(uint64_t *result, uint64_t a2, const void **a3, uint64_t a4)
{
  uint64_t v7 = (uint64_t **)result;
  uint64_t v8 = result + 1;
  if (result + 1 == (uint64_t *)a2
    || (unint64_t result = (uint64_t *)sub_24FF558E0((uint64_t)(result + 2), a3, (const void **)(a2 + 32)), result))
  {
    if (*v7 == (uint64_t *)a2)
    {
      uint64_t v10 = a2;
LABEL_16:
      if (*(void *)a2)
      {
        uint64_t v21 = v10;
        uint64_t v12 = (uint64_t **)(v10 + 8);
      }
      else
      {
        uint64_t v21 = a2;
        uint64_t v12 = (uint64_t **)a2;
      }
      goto LABEL_30;
    }
    uint64_t v9 = *(void *)a2;
    if (*(void *)a2)
    {
      do
      {
        uint64_t v10 = v9;
        uint64_t v9 = *(void *)(v9 + 8);
      }
      while (v9);
    }
    else
    {
      uint64_t v15 = a2;
      do
      {
        uint64_t v10 = *(void *)(v15 + 16);
        BOOL v16 = *(void *)v10 == v15;
        uint64_t v15 = v10;
      }
      while (v16);
    }
    unint64_t result = (uint64_t *)sub_24FF558E0((uint64_t)(v7 + 2), (const void **)(v10 + 32), a3);
    if (result) {
      goto LABEL_16;
    }
LABEL_29:
    unint64_t result = sub_24FF557E8((uint64_t)v7, &v21, a3);
    uint64_t v12 = (uint64_t **)result;
    goto LABEL_30;
  }
  unint64_t result = (uint64_t *)sub_24FF558E0((uint64_t)(v7 + 2), (const void **)(a2 + 32), a3);
  if (result)
  {
    uint64_t v12 = (uint64_t **)(a2 + 8);
    uint64_t v11 = *(uint64_t **)(a2 + 8);
    if (v11)
    {
      uint64_t v13 = *(void **)(a2 + 8);
      do
      {
        uint64_t v14 = (uint64_t)v13;
        uint64_t v13 = (void *)*v13;
      }
      while (v13);
    }
    else
    {
      uint64_t v17 = a2;
      do
      {
        uint64_t v14 = *(void *)(v17 + 16);
        BOOL v16 = *(void *)v14 == v17;
        uint64_t v17 = v14;
      }
      while (!v16);
    }
    if ((uint64_t *)v14 != v8)
    {
      unint64_t result = (uint64_t *)sub_24FF558E0((uint64_t)(v7 + 2), a3, (const void **)(v14 + 32));
      if (!result) {
        goto LABEL_29;
      }
      uint64_t v11 = *v12;
    }
    if (v11)
    {
      uint64_t v21 = v14;
      uint64_t v12 = (uint64_t **)v14;
    }
    else
    {
      uint64_t v21 = a2;
    }
LABEL_30:
    if (*v12) {
      return result;
    }
    goto LABEL_31;
  }
  uint64_t v20 = a2;
  uint64_t v21 = a2;
  uint64_t v12 = (uint64_t **)&v20;
  if (a2) {
    return result;
  }
LABEL_31:
  uint64_t v18 = (char *)operator new(0x40uLL);
  uint64_t v19 = v18 + 32;
  if (*(char *)(a4 + 23) < 0)
  {
    sub_24FF5D2AC(v19, *(void **)a4, *(void *)(a4 + 8));
  }
  else
  {
    *(_OWORD *)uint64_t v19 = *(_OWORD *)a4;
    *((void *)v18 + 6) = *(void *)(a4 + 16);
  }
  *((_DWORD *)v18 + 14) = *(_DWORD *)(a4 + 24);
  return sub_24FF55888(v7, v21, v12, (uint64_t *)v18);
}

void sub_24FF5D538(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

__n128 sub_24FF5D554(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x38uLL);
  *(void *)uint64_t v2 = &unk_270165088;
  *(_OWORD *)(v2 + 8) = *(_OWORD *)(a1 + 8);
  *(_OWORD *)(v2 + 24) = *(_OWORD *)(a1 + 24);
  __n128 result = *(__n128 *)(a1 + 40);
  *(__n128 *)(v2 + 40) = result;
  return result;
}

__n128 sub_24FF5D5B0(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_270165088;
  __n128 result = *(__n128 *)(a1 + 8);
  long long v3 = *(_OWORD *)(a1 + 24);
  *(_OWORD *)(a2 + 40) = *(_OWORD *)(a1 + 40);
  *(_OWORD *)(a2 + 24) = v3;
  *(__n128 *)(a2 + 8) = result;
  return result;
}

unint64_t sub_24FF5D5F0(uint64_t a1, uint64_t *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v4 = *(_OWORD *)(a1 + 24);
  v17[0] = *(_OWORD *)(a1 + 8);
  v17[1] = v4;
  sub_24FF5C68C((uint64_t *)v17, 4);
  *(void *)&v17[0] = 0;
  uint64_t v5 = *(uint64_t **)(a1 + 8);
  if (!v5 || (uint64_t v6 = *v5) == 0)
  {
    uint64_t v6 = 0;
    uint64_t v5 = &qword_24FF7D470;
  }
  uint64_t v7 = *(uint64_t **)(a1 + 24);
  if (!v7 || (uint64_t v8 = *v7) == 0)
  {
    uint64_t v8 = 0;
    uint64_t v7 = &qword_24FF7D470;
  }
  uint64_t v9 = *(uint64_t **)(a1 + 16);
  if (!v9 || (uint64_t v10 = *v9) == 0)
  {
    uint64_t v10 = 0;
    uint64_t v9 = &qword_24FF7D470;
  }
  uint64_t v11 = v5[1];
  uint64_t v12 = v7[1];
  uint64_t v13 = v9[1];
  uint64_t v14 = *(uint64_t **)(a1 + 32);
  if (!v14 || (uint64_t v15 = *v14) == 0)
  {
    uint64_t v15 = 0;
    uint64_t v14 = &qword_24FF7D470;
  }
  return (unint64_t)(sub_24FF5DA9C(*a2, *(void *)(a1 + 40), *(void *)(a1 + 48) & ~(*(uint64_t *)(a1 + 48) >> 63), v17, (int32x2_t *)(v6 + 4 * v11), (_DWORD *)(v8 + 4 * v12), (void *)(v10 + 4 * v13), (int *)(v15 + 4 * v14[1])) != 0) << 63;
}

__n128 sub_24FF5D720(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x38uLL);
  *(void *)uint64_t v2 = &unk_2701650D0;
  *(_OWORD *)(v2 + 8) = *(_OWORD *)(a1 + 8);
  *(_OWORD *)(v2 + 24) = *(_OWORD *)(a1 + 24);
  __n128 result = *(__n128 *)(a1 + 40);
  *(__n128 *)(v2 + 40) = result;
  return result;
}

__n128 sub_24FF5D77C(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_2701650D0;
  __n128 result = *(__n128 *)(a1 + 8);
  long long v3 = *(_OWORD *)(a1 + 24);
  *(_OWORD *)(a2 + 40) = *(_OWORD *)(a1 + 40);
  *(_OWORD *)(a2 + 24) = v3;
  *(__n128 *)(a2 + 8) = result;
  return result;
}

unint64_t sub_24FF5D7BC(uint64_t a1, uint64_t *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (!*(void *)(*(void *)(a1 + 8) + 24)) {
    return 0;
  }
  uint64_t v20 = *(void *)(a1 + 8);
  long long v21 = *(_OWORD *)(a1 + 16);
  sub_24FF5C68C(&v20, 3);
  uint64_t v20 = 0;
  unint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48) & ~(*(uint64_t *)(a1 + 48) >> 63);
  uint64_t v6 = *(uint64_t **)(a1 + 8);
  if (*(_DWORD *)(a1 + 32))
  {
    if (!v6 || (uint64_t v7 = *v6) == 0)
    {
      uint64_t v7 = 0;
      uint64_t v6 = &qword_24FF7D470;
    }
    uint64_t v8 = v7 + 4 * v6[1];
    uint64_t v9 = *(uint64_t **)(a1 + 24);
    if (!v9 || (uint64_t v10 = *v9) == 0)
    {
      uint64_t v10 = 0;
      uint64_t v9 = &qword_24FF7D470;
    }
    uint64_t v11 = (void *)(v10 + 4 * v9[1]);
    uint64_t v12 = *(uint64_t **)(a1 + 16);
    if (!v12 || (uint64_t v13 = *v12) == 0)
    {
      uint64_t v13 = 0;
      uint64_t v12 = &qword_24FF7D470;
    }
    int v14 = sub_24FF642B0(*a2, v4, v5, &v20, v8, v13 + v12[1], v11);
  }
  else
  {
    if (!v6 || (uint64_t v16 = *v6) == 0)
    {
      uint64_t v16 = 0;
      uint64_t v6 = &qword_24FF7D470;
    }
    uint64_t v17 = v16 + 4 * v6[1];
    uint64_t v18 = *(uint64_t **)(a1 + 16);
    if (!v18 || (uint64_t v19 = *v18) == 0)
    {
      uint64_t v19 = 0;
      uint64_t v18 = &qword_24FF7D470;
    }
    int v14 = sub_24FF5F324(*a2, v4, v5, &v20, v17, v19 + v18[1]);
  }
  return (unint64_t)(v14 != 0) << 63;
}

uint64_t sub_24FF5D92C(uint64_t result)
{
  uint64_t v1 = 0;
  *(_DWORD *)__n128 result = 0;
  *(void *)&long long v2 = 0xFFFF00000000;
  *((void *)&v2 + 1) = 0xFFFF00000000;
  *(_OWORD *)(result + 24) = v2;
  *(void *)(result + 16) = 0;
  *(void *)(result + 40) = 0;
  uint64_t v3 = 0x217u;
  do
  {
    *(_WORD *)(result + v1 * 2 + 48) = word_269A9A400[v1];
    *(_WORD *)(result + v3 * 2) = word_269A9A400[v3 - 280];
    ++v1;
    --v3;
  }
  while (v1 != 256);
  return result;
}

void *sub_24FF5D980(uint64_t a1)
{
  *(void *)&long long v1 = 0xFFFF000000000000;
  *((void *)&v1 + 1) = 0xFFFF000000000000;
  *(_OWORD *)(a1 + 24) = v1;
  *(void *)(a1 + 40) = 16;
  unsigned int v2 = *(_DWORD *)a1;
  if (!*(_DWORD *)a1)
  {
    int v4 = -16777216;
    goto LABEL_7;
  }
  uint64_t v3 = *(unsigned __int8 **)(a1 + 8);
  int v4 = *v3 << 24;
  *(_DWORD *)(a1 + 32) = v4;
  if (v2 == 1)
  {
LABEL_7:
    int v5 = v4 | 0xFF0000;
    goto LABEL_8;
  }
  int v5 = v4 | (v3[1] << 16);
  *(_DWORD *)(a1 + 32) = v5;
  if (v2 <= 2)
  {
LABEL_8:
    int v6 = v5 | 0xFF00;
    goto LABEL_9;
  }
  int v6 = v5 | (v3[2] << 8);
  *(_DWORD *)(a1 + 32) = v6;
  if (v2 == 3)
  {
LABEL_9:
    int v7 = 255;
    goto LABEL_10;
  }
  int v7 = v3[3];
LABEL_10:
  *(_DWORD *)(a1 + 32) = v7 | v6;
  *(void *)(a1 + 16) = 3;
  return memcpy((void *)(a1 + 48), &unk_269A9A600, 0x400uLL);
}

char *sub_24FF5DA18(uint64_t a1, unsigned int *a2, uint64_t a3)
{
  uint64_t v3 = a3 - 4;
  if (a3 >= 4)
  {
    unsigned int v7 = *a2;
    int v6 = a2 + 1;
    int v5 = (char *)v7;
    if (v6)
    {
      int v4 = &v5[(void)v6];
      goto LABEL_7;
    }
    int v4 = v5;
  }
  else
  {
    int v4 = 0;
    uint64_t v3 = 0;
    int v5 = 0;
  }
  int v6 = 0;
LABEL_7:
  if (!v4) {
    return 0;
  }
  uint64_t v8 = 0;
  if (((v3 - (void)v5) & 0x8000000000000000) == 0)
  {
    *(_DWORD *)a1 = v5;
    *(void *)(a1 + 8) = v6;
    sub_24FF5D980(a1);
    return v4;
  }
  return (char *)v8;
}

uint64_t sub_24FF5DA9C(uint64_t a1, unint64_t a2, unint64_t a3, void *a4, int32x2_t *a5, _DWORD *a6, void *a7, int *a8)
{
  *(_DWORD *)(a1 + 4384) = 0;
  unsigned __int8 v59 = 0;
  long long v57 = 0u;
  long long v58 = 0u;
  int v60 = 0;
  char v61 = 4;
  uint64_t v62 = 0x101010100000002;
  unsigned __int8 v63 = 1;
  uint64_t v16 = (_DWORD *)sub_24FF5DEB4(a2, a3, (uint64_t)&v57, (int16x8_t)0);
  if (!v16) {
    goto LABEL_59;
  }
  if (v17 < 0) {
    goto LABEL_59;
  }
  if (!a2) {
    goto LABEL_59;
  }
  if (((a3 - DWORD2(v57)) & 0x8000000000000000) != 0) {
    goto LABEL_59;
  }
  if ((unint64_t)v16 + v17 < a2) {
    goto LABEL_59;
  }
  unint64_t v18 = a2 + DWORD2(v57);
  if (v18 < (unint64_t)v16) {
    goto LABEL_59;
  }
  unint64_t v19 = v18 - (void)v16;
  if ((uint64_t)(v18 - (void)v16) < 0) {
    goto LABEL_59;
  }
  if (!a5 || !a7 || !a6 && (HIDWORD(v58) & 0xFFFFFFFE) == 2 || !a8 && v59) {
    goto LABEL_14;
  }
  int16x4_t v21 = (int16x4_t)vand_s8((int8x8_t)vdup_n_s16(BYTE4(v57) == 0), (int8x8_t)vceq_s16((int16x4_t)(*(void *)&vdup_n_s16(BYTE5(v57)) & 0xFF00FF00FF00FFLL), (int16x4_t)0x8000600040005));
  if ((vmaxv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(v21, 0xFuLL))) & 1) == 0
    || v59 && (vorr_s8((int8x8_t)v21, (int8x8_t)vdup_lane_s16(v21, 1)).u8[0] & 1) != 0 && (v61 & 0xFB) != 0)
  {
    uint64_t v20 = 4;
    goto LABEL_60;
  }
  if (a3 < DWORD2(v57) || v62 == 3 || v62 == 4 || v61 == 3 || v61 == 1) {
    goto LABEL_59;
  }
  uint64_t v20 = 0;
  if (!v58 || !HIDWORD(v57)) {
    return v20;
  }
  unsigned int v54 = 0;
  uint64_t v53 = 0;
  if (v19 < 4
    || (LODWORD(v55) = *v16, (v19 & 0xFFFFFFFFFFFFFFFCLL) == 4)
    || (HIDWORD(v55) = v16[1], (v19 & 0xFFFFFFFFFFFFFFFCLL) == 8))
  {
    uint64_t v22 = 0;
    unsigned int v23 = 0;
  }
  else
  {
    uint64_t v22 = v19 - 12;
    unsigned int v23 = v16 + 3;
    int v56 = v16[2];
  }
  unsigned int v24 = v63;
  if (v63)
  {
    if (!v22) {
      goto LABEL_59;
    }
    unsigned int v24 = *(unsigned __int8 *)v23;
    LODWORD(v53) = v24;
    if (v22 == 1) {
      goto LABEL_59;
    }
    unsigned int v25 = *((unsigned __int8 *)v23 + 1);
    HIDWORD(v53) = v25;
    if (v22 == 2) {
      goto LABEL_59;
    }
    v22 -= 3;
    unsigned int v26 = *((unsigned __int8 *)v23 + 2);
    unsigned int v23 = (unsigned int *)((char *)v23 + 3);
    unsigned int v54 = v26;
  }
  else
  {
    unsigned int v26 = 0;
    unsigned int v25 = 0;
  }
  if (!v23) {
    goto LABEL_59;
  }
  if ((int)v24 <= (int)v25) {
    unsigned int v27 = v25;
  }
  else {
    unsigned int v27 = v24;
  }
  if (v24 <= v25) {
    unsigned int v24 = v25;
  }
  if (v27 < v26) {
    unsigned int v24 = v26;
  }
  if (v24 >= 0x1D) {
    goto LABEL_59;
  }
  int v51 = v58;
  int v52 = v59;
  uint64_t v49 = HIDWORD(v57);
  uint64_t v50 = DWORD2(v57);
  sub_24FF5E020(a1 + 1072, &v57, &v55, &v53);
  sub_24FF5E13C(a1 + 1304, a1 + 1072);
  uint64_t v28 = sub_24FF5DA18(a1, v23, v22);
  if (!v28) {
    goto LABEL_59;
  }
  uint64_t v31 = v29;
  if (v29 < 0) {
    goto LABEL_59;
  }
  uint64_t v32 = (unsigned int *)v28;
  if (*(unsigned char *)(a1 + 1152)) {
    sub_24FF5E330(a1, v30);
  }
  else {
    sub_24FF5E9BC(a1, v30);
  }
  uint64_t v20 = *(unsigned int *)(a1 + 4384);
  if (v20) {
    return v20;
  }
  if (v52)
  {
    if (!a8)
    {
LABEL_14:
      uint64_t v20 = 5;
LABEL_60:
      *(_DWORD *)(a1 + 4384) = v20;
      return v20;
    }
    if (sub_24FF5DA18(a1, v32, v31) && (v33 & 0x8000000000000000) == 0)
    {
      sub_24FF5EB9C(a1, a8);
      uint64_t v20 = *(unsigned int *)(a1 + 4384);
      if (v20) {
        return v20;
      }
      uint64_t v20 = sub_24FF5EEF4(a1, a8);
      *(_DWORD *)(a1 + 4384) = v20;
      goto LABEL_63;
    }
LABEL_59:
    uint64_t v20 = 3;
    goto LABEL_60;
  }
  sub_24FF5F2F4(a1 + 1232, 2uLL);
  uint64_t v35 = *(_DWORD **)(a1 + 1232);
  *uint64_t v35 = 0;
  v35[1] = v51;
  uint64_t v20 = *(unsigned int *)(a1 + 4384);
LABEL_63:
  if (!v20)
  {
    uint64_t v36 = *(unsigned char **)(a1 + 1184);
    uint64_t v37 = *(unsigned char **)(a1 + 1192);
    if (v37 != v36) {
      memmove(a7, v36, v37 - v36);
    }
    uint64_t v38 = v49;
    if ((int)v49 >= 1)
    {
      int32x2_t v39 = *(int32x2_t *)(a1 + 1092);
      int v40 = *(_DWORD *)(a1 + 1100);
      uint64_t v41 = (_DWORD *)(*(void *)(a1 + 1160) + 8);
      uint64_t v42 = a5 + 1;
      do
      {
        __int32 v43 = *v41 + v40;
        v42[-1] = vadd_s32(*(int32x2_t *)(v41 - 2), v39);
        v42->i32[0] = v43;
        uint64_t v42 = (int32x2_t *)((char *)v42 + 12);
        v41 += 3;
        --v38;
      }
      while (v38);
    }
    if (a6)
    {
      uint64_t v44 = *(void *)(a1 + 1208);
      uint64_t v45 = *(void *)(a1 + 1216) - v44;
      if ((unint64_t)v45 >= 5)
      {
        unint64_t v46 = v45 >> 2;
        if (v46 <= 2) {
          unint64_t v46 = 2;
        }
        unint64_t v47 = v46 - 1;
        uint64_t v48 = (_DWORD *)(v44 + 4);
        do
        {
          *a6++ = *v48 - *(v48 - 1);
          ++v48;
          --v47;
        }
        while (v47);
      }
    }
    uint64_t v20 = 0;
    *a4 = v50;
  }
  return v20;
}

uint64_t sub_24FF5DEB4(uint64_t a1, uint64_t a2, uint64_t a3, int16x8_t a4)
{
  if (a2 < 4) {
    return 0;
  }
  unint64_t v4 = a2 & 0xFFFFFFFFFFFFFFFCLL;
  if ((a2 & 0xFFFFFFFFFFFFFFFCLL) == 4
    || a2 == 8
    || a2 == 9
    || (a2 & 0xFFFFFFFFFFFFFFFELL) == 0xA
    || v4 == 12
    || v4 == 16
    || v4 == 20
    || a2 == 24
    || a2 == 25
    || a2 == 26
    || a2 == 27
    || v4 == 28)
  {
    return 0;
  }
  uint64_t v7 = a1 + 32;
  if (a1 == -32) {
    return 0;
  }
  uint64_t v5 = 0;
  if (*(_DWORD *)a1 == -90009999)
  {
    int v8 = *(_DWORD *)(a1 + 4);
    char v9 = *(unsigned char *)(a1 + 8);
    char v10 = *(unsigned char *)(a1 + 9);
    __int16 v11 = *(_WORD *)(a1 + 10);
    int v12 = *(_DWORD *)(a1 + 12);
    int v13 = *(_DWORD *)(a1 + 16) & 0x7FFFFFFF;
    int v14 = *(_DWORD *)(a1 + 20) & 0x7FFFFFFF;
    char v15 = *(unsigned char *)(a1 + 24);
    int v16 = *(unsigned __int8 *)(a1 + 25);
    unsigned int v17 = *(unsigned __int8 *)(a1 + 26);
    int v18 = *(unsigned __int8 *)(a1 + 27);
    int v19 = *(_DWORD *)(a1 + 28) & 0x7FFFFFFF;
    *(uint16x4_t *)a4.i8 = vshl_u16((uint16x4_t)vdup_n_s16(v17), (uint16x4_t)0xFFFCFFFDFFFEFFFFLL);
    if (v17 >> 6 == 1) {
      int v19 = 4 * v14;
    }
    if (v17 < 0x40) {
      int v19 = 3 * v14;
    }
    *(_DWORD *)a3 = 0;
    *(unsigned char *)(a3 + 4) = v9;
    *(unsigned char *)(a3 + 5) = v10;
    *(_WORD *)(a3 + 6) = v11;
    *(_DWORD *)(a3 + 8) = v12;
    *(_DWORD *)(a3 + 12) = v13;
    *(_DWORD *)(a3 + 16) = v14;
    *(_DWORD *)(a3 + 20) = v19;
    *(_DWORD *)(a3 + 24) = v18;
    *(_DWORD *)(a3 + 28) = v17 >> 6;
    *(unsigned char *)(a3 + 32) = v17 & 1;
    *(_DWORD *)(a3 + 36) = v8;
    *(unsigned char *)(a3 + 40) = v15;
    *(_DWORD *)(a3 + 44) = v16;
    a4.i32[0] &= 0xFF01FF01;
    a4.i16[2] &= 0xFF01u;
    a4.i16[3] &= 0xFF01u;
    *(_DWORD *)(a3 + 48) = vmovn_s16(a4).u32[0];
    *(unsigned char *)(a3 + 52) = (v17 & 0x20) != 0;
    return v7;
  }
  return v5;
}

void sub_24FF5E020(uint64_t a1, long long *a2, uint64_t *a3, uint64_t *a4)
{
  long long v6 = *a2;
  long long v7 = a2[1];
  long long v8 = a2[2];
  *(void *)(a1 + 77) = *(void *)((char *)a2 + 45);
  *(_OWORD *)(a1 + 48) = v7;
  *(_OWORD *)(a1 + 64) = v8;
  *(_OWORD *)(a1 + 32) = v6;
  *(void *)a1 = 0;
  uint64_t v9 = *a4;
  *(_DWORD *)(a1 + 16) = *((_DWORD *)a4 + 2);
  *(void *)(a1 + 8) = v9;
  uint64_t v10 = *a3;
  *(_DWORD *)(a1 + 28) = *((_DWORD *)a3 + 2);
  *(void *)(a1 + 20) = v10;
  unint64_t v11 = *((int *)a2 + 3);
  sub_24FF68D38((uint64_t *)(a1 + 88), v11);
  sub_24FF5F2F4(a1 + 136, 0);
  unint64_t v12 = *((int *)a2 + 4) + 1;
  LODWORD(v13) = 0;
  sub_24FF62F6C(a1 + 136, v12, &v13);
  sub_24FF5F2F4(a1 + 112, *((int *)a2 + 5));
  sub_24FF68D38((uint64_t *)(a1 + 184), 0);
  int v14 = -1;
  uint64_t v13 = -1;
  sub_24FF68D74((uint64_t *)(a1 + 184), v11, &v13);
  sub_24FF68D38((uint64_t *)(a1 + 208), 0);
  int v14 = -1;
  uint64_t v13 = -1;
  sub_24FF68D74((uint64_t *)(a1 + 208), v11, &v13);
  sub_24FF5F2F4(a1 + 160, 0);
}

void sub_24FF5E13C(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(int *)(a2 + 44);
  if (*(unsigned char *)(a2 + 81)) {
    BOOL v4 = *(unsigned char *)(a2 + 80) == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4 || (sub_24FF5F2F4(a1 + 120, 0), int v12 = 0, sub_24FF62F6C(a1 + 120, v3, &v12), *(unsigned char *)(a2 + 80)))
  {
    sub_24FF69210(a1 + 168, v3);
    sub_24FF6924C(a1 + 192, 64);
  }
  sub_24FF692E4(a1 + 144, v3);
  long long v6 = *(unsigned char **)(a1 + 144);
  long long v7 = *(unsigned char **)(a1 + 152);
  if (v6 != v7) {
    memset(v6, 255, (v7 - v6) & 0xFFFFFFFFFFFFFFF0);
  }
  sub_24FF69314((void **)a1, 0x100uLL);
  sub_24FF69314((void **)(a1 + 96), 0x40uLL);
  sub_24FF69314((void **)(a1 + 72), 0x40uLL);
  sub_24FF69314((void **)(a1 + 24), 0x20uLL);
  sub_24FF693BC((unint64_t *)(a1 + 48), 0x20uLL);
  memset_pattern16((void *)(a1 + 1992), &unk_24FF7D710, 0xAuLL);
  uint64_t v8 = 0;
  *(_WORD *)(a1 + 2002) = 0x8000;
  do
  {
    memset_pattern16((void *)(a1 + 2004 + v8), &unk_24FF7D710, 6uLL);
    v8 += 6;
  }
  while (v8 != 96);
  *(_WORD *)(a1 + 2100) = 0x8000;
  memset_pattern16((void *)(a1 + 2102), &unk_24FF7D710, 6uLL);
  uint64_t v9 = 0;
  *(_WORD *)(a1 + 2108) = 0x8000;
  do
  {
    memset_pattern16((void *)(a1 + 2110 + v9), &unk_24FF7D710, 0x10uLL);
    v9 += 16;
  }
  while (v9 != 80);
  memset_pattern16((void *)(a1 + 2194), &unk_24FF7D710, 0x20uLL);
  memset_pattern16((void *)(a1 + 2232), &unk_24FF7D710, 0x80uLL);
  *(_WORD *)(a1 + 2230) = 0x8000;
  *(_DWORD *)(a1 + 2190) = -2147450880;
  *(_DWORD *)(a1 + 2226) = -2147450880;
  memset_pattern16((void *)(a1 + 2368), &unk_24FF7D710, 6uLL);
  uint64_t v10 = 0;
  uint64_t v11 = a1 + 2376;
  do
  {
    sub_24FF60D8C(v11 + v10, 3);
    v10 += 120;
  }
  while (v10 != 240);
}

void sub_24FF5E330(uint64_t a1, int32x2_t a2)
{
  uint64_t v3 = *(unsigned int *)(a1 + 1116);
  uint64_t v122 = 0;
  int v121 = 0;
  if ((int)v3 >= 1)
  {
    uint64_t v4 = 0;
    uint64_t v5 = (_DWORD *)(a1 + 1496);
    uint64_t v118 = (_WORD *)(a1 + 3306);
    LODWORD(v6) = -1;
    uint64_t v116 = v3;
    while (1)
    {
      if (v4 == HIDWORD(v122))
      {
        ++HIDWORD(v122);
        int v7 = *(unsigned char *)(a1 + 1156) ? -1 : v6;
        *(_DWORD *)(*(void *)(a1 + 1256) + 12 * v4) = v7;
        sub_24FF62F9C(a1, v4, a2);
        sub_24FF63854((_DWORD *)(a1 + 1496), (int *)(*(void *)(a1 + 1472) + 12 * v4));
        uint64_t v117 = v4;
        if (*(_DWORD *)(a1 + 1496)) {
          break;
        }
      }
LABEL_168:
      if (++v4 == v3)
      {
        int v114 = v122;
        int v113 = HIDWORD(v122);
        LODWORD(v3) = *(_DWORD *)(a1 + 1116);
        goto LABEL_171;
      }
    }
    while (1)
    {
      int v8 = *(_DWORD *)(a1 + 1500);
      uint64_t v9 = v8 < 0 ? 0 : sub_24FF6A5E0((_DWORD *)(a1 + 1496), v8);
      unint64_t v6 = 0xAAAAAAAAAAAAAAABLL * ((v9 - *(void *)(a1 + 1472)) >> 2);
      int v10 = *(_DWORD *)(*(void *)(a1 + 1448)
                      + ((uint64_t)(0xAAAAAAAB00000000 * ((v9 - *(void *)(a1 + 1472)) >> 2)) >> 28));
      int v11 = *(_DWORD *)(*(void *)(a1 + 1448)
                      + ((uint64_t)(0xAAAAAAAB00000000 * ((v9 - *(void *)(a1 + 1472)) >> 2)) >> 28)
                      + 4);
      BOOL v12 = v10 != -1;
      BOOL v13 = v11 == v10 && v10 != -1;
      unsigned int v14 = (v12 | (2 * (v11 != -1))) + v13;
      if (sub_24FF5FDE8((unsigned int *)a1, (_WORD *)(a1 + 2 * v14 + 3296))) {
        break;
      }
LABEL_167:
      uint64_t v3 = v116;
      uint64_t v4 = v117;
      if (!*v5) {
        goto LABEL_168;
      }
    }
    uint64_t v15 = (int)v6;
    int v119 = v6;
    while (1)
    {
      int v120 = 0;
      int v16 = sub_24FF639FC(a1, v6, v14, &v120, (_DWORD *)&v122 + 1, (int *)&v122, &v121);
      if (v16 < 0) {
        return;
      }
      if (*(_DWORD *)(a1 + 4384)) {
        return;
      }
      unsigned int v18 = v16;
      sub_24FF63790(a1, v120, v16, v17);
      if (*(_DWORD *)(a1 + 4384)) {
        return;
      }
      uint64_t v19 = v18;
      if (v18 >= 2) {
        break;
      }
LABEL_156:
      if ((int)v18 >= 1)
      {
        uint64_t v106 = 0;
        do
        {
          uint64_t v107 = (int *)(*(void *)(a1 + 1472) + 12 * *(int *)(*(void *)(a1 + 1328) + 4 * v106));
          uint64_t v108 = (_DWORD *)(a1 + 1496);
          if (*(unsigned char *)(*(void *)(a1 + 1352) + v106)) {
            sub_24FF63854(v108, v107);
          }
          else {
            sub_24FF639AC(v108, v107);
          }
          ++v106;
        }
        while (v19 != v106);
        if (*(_DWORD *)(a1 + 4384)) {
          return;
        }
      }
      int v109 = *(_DWORD *)(*(void *)(a1 + 1448) + 16 * v15);
      int v110 = *(_DWORD *)(*(void *)(a1 + 1448) + 16 * v15 + 4);
      BOOL v111 = v109 != -1;
      BOOL v112 = v110 == v109 && v109 != -1;
      unsigned int v14 = (v111 | (2 * (v110 != -1))) + v112;
      LODWORD(v6) = v119;
      if (!sub_24FF5FDE8((unsigned int *)a1, v118)) {
        goto LABEL_167;
      }
    }
    int v20 = *(unsigned __int8 *)(a1 + 1154);
    uint64_t v21 = v18 - 1;
    uint64_t v22 = (int *)(*(void *)(a1 + 1328) + 4);
    while (1)
    {
      int v24 = *(v22 - 1);
      int v23 = *v22;
      if (!v20)
      {
        uint64_t v64 = *(void *)(a1 + 1472);
        *(_DWORD *)(v64 + 12 * v24) += 8;
        *(_DWORD *)(v64 + 12 * v23) += 8;
        goto LABEL_155;
      }
      uint64_t v25 = *(void *)(a1 + 1160);
      unsigned int v26 = (int *)(v25 + 12 * (int)v15);
      unsigned int v27 = (int *)(v25 + 12 * v24);
      uint64_t v28 = (int *)(v25 + 12 * v23);
      int v30 = *v28;
      int v29 = v28[1];
      int v31 = *v27;
      int v32 = v27[1];
      int v33 = *v28 - *v27;
      int v34 = v29 - v32;
      int v35 = v28[2];
      int v36 = v27[2];
      int v37 = v35 - v36;
      int v38 = *v26;
      int v39 = v26[1];
      int v40 = *v26 - *v27;
      int v41 = v39 - v32;
      int v42 = v26[2];
      int v43 = v42 - v36;
      if (v30 - v31 >= 0) {
        unsigned int v44 = v33;
      }
      else {
        unsigned int v44 = -v33;
      }
      if (v34 >= 0) {
        unsigned int v45 = v34;
      }
      else {
        unsigned int v45 = -v34;
      }
      if (v37 >= 0) {
        unsigned int v46 = v37;
      }
      else {
        unsigned int v46 = -v37;
      }
      BOOL v49 = v44 < 0x1000 && v45 < 0x1000 && v46 < 0x1000;
      if (v40 >= 0) {
        unsigned int v50 = v40;
      }
      else {
        unsigned int v50 = -v40;
      }
      if (v41 >= 0) {
        unsigned int v51 = v41;
      }
      else {
        unsigned int v51 = -v41;
      }
      if (v43 >= 0) {
        unsigned int v52 = v43;
      }
      else {
        unsigned int v52 = -v43;
      }
      if (v49 && v50 <= 0xFFF && v51 <= 0xFFF && v52 <= 0xFFF)
      {
        int v53 = v40 * v33 + v41 * v34 + v43 * v37;
        if (!v53) {
          goto LABEL_96;
        }
        int v54 = v43 * v34 - v41 * v37;
        if (v54 < 0) {
          int v54 = v41 * v37 - v43 * v34;
        }
        int v55 = v40 * v37 - v43 * v33;
        if (v55 < 0) {
          int v55 = -v55;
        }
        int v56 = v41 * v33 - v40 * v34;
        if (v56 < 0) {
          int v56 = -v56;
        }
        int v57 = v54 + v55;
        if (v55 < v56)
        {
          int v58 = v56;
        }
        else
        {
          int v57 = v54 + v56;
          int v58 = v55;
        }
        BOOL v59 = v54 >= v55 && v54 >= v56;
        if (v59) {
          unsigned int v60 = v55 + v56;
        }
        else {
          unsigned int v60 = v57;
        }
        if (v59) {
          int v61 = v54;
        }
        else {
          int v61 = v58;
        }
        unsigned int v62 = v61 + (v60 >> 2);
        if (v53 < 0) {
          LODWORD(v63) = -16 * v53 / (int)(v62 - v53) + 16;
        }
        else {
          LODWORD(v63) = (int)(16 * v62) / (int)(v62 + v53);
        }
      }
      else
      {
        uint64_t v65 = v41 * (uint64_t)v34 + v40 * (uint64_t)v33 + v43 * (uint64_t)v37;
        if (!v65)
        {
LABEL_96:
          LODWORD(v63) = 16;
          goto LABEL_99;
        }
        uint64_t v66 = v43 * (uint64_t)v34 - v41 * (uint64_t)v37;
        if (v66 < 0) {
          uint64_t v66 = v41 * (uint64_t)v37 - v43 * (uint64_t)v34;
        }
        uint64_t v67 = v40 * (uint64_t)v37 - v43 * (uint64_t)v33;
        if (v67 < 0) {
          uint64_t v67 = -v67;
        }
        uint64_t v68 = v41 * (uint64_t)v33 - v40 * (uint64_t)v34;
        if (v68 < 0) {
          uint64_t v68 = -v68;
        }
        uint64_t v69 = v66 + v67;
        if (v67 < (unint64_t)v68)
        {
          uint64_t v70 = v68;
        }
        else
        {
          uint64_t v69 = v66 + v68;
          uint64_t v70 = v67;
        }
        BOOL v71 = v66 >= (unint64_t)v67 && v66 >= (unint64_t)v68;
        if (v71) {
          unint64_t v72 = v67 + v68;
        }
        else {
          unint64_t v72 = v69;
        }
        if (v71) {
          uint64_t v73 = v66;
        }
        else {
          uint64_t v73 = v70;
        }
        uint64_t v63 = v73 + (v72 >> 2);
        if (v65 < 0) {
          LODWORD(v63) = -16 * v65 / (v63 - v65) + 16;
        }
        else {
          uint64_t v63 = 16 * v63 / (v63 + v65);
        }
      }
LABEL_99:
      int v74 = v38 - v30;
      int v75 = v39 - v29;
      int v76 = v42 - v35;
      int v77 = -v33;
      int v78 = -v34;
      int v79 = -v37;
      if (v74 >= 0) {
        unsigned int v80 = v74;
      }
      else {
        unsigned int v80 = -v74;
      }
      BOOL v81 = v80 < 0x1000 && v49;
      if (v75 >= 0) {
        unsigned int v82 = v75;
      }
      else {
        unsigned int v82 = -v75;
      }
      if (v76 >= 0) {
        unsigned int v83 = v76;
      }
      else {
        unsigned int v83 = -v76;
      }
      if (v81 && v82 <= 0xFFF && v83 <= 0xFFF)
      {
        int v84 = v74 * v77 + v75 * v78 + v76 * v79;
        if (!v84) {
          goto LABEL_145;
        }
        int v85 = v75 * v37 + v76 * v78;
        if (v85 < 0) {
          int v85 = -v85;
        }
        int v86 = v74 * v79 + v76 * v33;
        if (v86 < 0) {
          int v86 = -v86;
        }
        int v87 = v74 * v34 + v75 * v77;
        if (v87 < 0) {
          int v87 = -v87;
        }
        if (v85 < v86 || v85 < v87)
        {
          unsigned int v88 = v85 + v86;
          int v100 = v85 + v87;
          if (v86 < v87)
          {
            int v85 = v87;
          }
          else
          {
            unsigned int v88 = v100;
            int v85 = v86;
          }
        }
        else
        {
          unsigned int v88 = v86 + v87;
        }
        int v101 = v85 + (v88 >> 2);
        if (v84 < 0) {
          LODWORD(v89) = -16 * v84 / (v101 - v84) + 16;
        }
        else {
          LODWORD(v89) = 16 * v101 / (v101 + v84);
        }
      }
      else
      {
        uint64_t v89 = v75 * (uint64_t)v78 + v74 * (uint64_t)v77 + v76 * (uint64_t)v79;
        if (!v89)
        {
LABEL_145:
          LODWORD(v89) = 16;
          goto LABEL_153;
        }
        int v90 = -v33;
        uint64_t v91 = v76 * (uint64_t)v78 - v75 * (uint64_t)v79;
        if (v91 < 0) {
          uint64_t v91 = v75 * (uint64_t)v79 - v76 * (uint64_t)v78;
        }
        uint64_t v92 = v74 * (uint64_t)v79 - v76 * (uint64_t)v90;
        if (v92 < 0) {
          uint64_t v92 = -v92;
        }
        uint64_t v93 = v75 * (uint64_t)v90 - v74 * (uint64_t)v78;
        if (v93 < 0) {
          uint64_t v93 = -v93;
        }
        uint64_t v94 = v91 + v92;
        if (v92 < (unint64_t)v93)
        {
          uint64_t v95 = v93;
        }
        else
        {
          uint64_t v94 = v91 + v93;
          uint64_t v95 = v92;
        }
        BOOL v96 = v91 >= (unint64_t)v92 && v91 >= (unint64_t)v93;
        if (v96) {
          unint64_t v97 = v92 + v93;
        }
        else {
          unint64_t v97 = v94;
        }
        if (v96) {
          uint64_t v98 = v91;
        }
        else {
          uint64_t v98 = v95;
        }
        unint64_t v99 = v98 + (v97 >> 2);
        if (v89 < 0) {
          LODWORD(v89) = -16 * v89 / (uint64_t)(v99 - v89) + 16;
        }
        else {
          uint64_t v89 = (uint64_t)(16 * v99) / (uint64_t)(v99 + v89);
        }
      }
LABEL_153:
      uint64_t v102 = *(void *)(a1 + 1472);
      uint64_t v103 = 12 * v24;
      *(_DWORD *)(v102 + v103) += v63;
      uint64_t v104 = 12 * v23;
      int v105 = *(_DWORD *)(v102 + v104) + v89;
      *(_DWORD *)(v102 + v104) = v105;
      if ((*(_DWORD *)(v102 + v103) & 0x80000000) != 0 || v105 < 0) {
        goto LABEL_177;
      }
LABEL_155:
      ++v22;
      if (!--v21) {
        goto LABEL_156;
      }
    }
  }
  int v113 = 0;
  int v114 = 0;
LABEL_171:
  BOOL v115 = *(_DWORD *)(a1 + 1120) == v114 && v3 == v113;
  if (!v115 || *(_DWORD *)(a1 + 1124) != v121) {
LABEL_177:
  }
    *(_DWORD *)(a1 + 4384) = 3;
}

void sub_24FF5E9BC(uint64_t a1, int32x2_t a2)
{
  uint64_t v3 = *(unsigned int *)(a1 + 1116);
  int v24 = 0;
  int v25 = 0;
  if ((int)v3 >= 1)
  {
    int v4 = 0;
    uint64_t v5 = 0;
    LODWORD(v6) = 0;
    LODWORD(v7) = -1;
    while (1)
    {
      if (v5 == v4)
      {
        int v8 = v4 + 1;
        int v26 = v4 + 1;
        if (*(unsigned char *)(a1 + 1156)) {
          int v9 = -1;
        }
        else {
          int v9 = v7;
        }
        *(_DWORD *)(*(void *)(a1 + 1256) + 12 * v5) = v9;
        a2 = sub_24FF62F9C(a1, v5, a2);
        if ((int)v6 <= v4)
        {
          uint64_t v6 = (int)v6;
          while (1)
          {
            uint64_t v7 = v6;
            int v10 = *(_DWORD *)(*(void *)(a1 + 1448) + 16 * v6);
            int v11 = *(_DWORD *)(*(void *)(a1 + 1448) + 16 * v6 + 4);
            BOOL v12 = v10 != -1;
            BOOL v13 = v11 == v10 && v10 != -1;
            unsigned int v14 = (v12 | (2 * (v11 != -1))) + v13;
            if (sub_24FF5FDE8((unsigned int *)a1, (_WORD *)(a1 + 2 * v14 + 3296))) {
              break;
            }
LABEL_24:
            ++v6;
            if (v7 + 1 >= v8)
            {
              int v4 = v8;
              goto LABEL_9;
            }
          }
          while (1)
          {
            int v23 = 0;
            int v15 = sub_24FF639FC(a1, v6, v14, &v23, &v26, &v25, &v24);
            if (v15 < 0) {
              break;
            }
            if (*(_DWORD *)(a1 + 4384)) {
              break;
            }
            sub_24FF63790(a1, v23, v15, v16);
            if (*(_DWORD *)(a1 + 4384)) {
              break;
            }
            int v17 = *(_DWORD *)(*(void *)(a1 + 1448) + 16 * v6);
            int v18 = *(_DWORD *)(*(void *)(a1 + 1448) + 16 * v6 + 4);
            BOOL v19 = v17 != -1;
            BOOL v20 = v18 == v17 && v17 != -1;
            unsigned int v14 = (v19 | (2 * (v18 != -1))) + v20;
            if (!sub_24FF5FDE8((unsigned int *)a1, (_WORD *)(a1 + 3306)))
            {
              int v8 = v26;
              goto LABEL_24;
            }
          }
          return;
        }
        ++v4;
      }
LABEL_9:
      if (++v5 == v3)
      {
        int v22 = v25;
        LODWORD(v3) = *(_DWORD *)(a1 + 1116);
        goto LABEL_27;
      }
    }
  }
  int v4 = 0;
  int v22 = 0;
LABEL_27:
  BOOL v21 = *(_DWORD *)(a1 + 1120) == v22 && v3 == v4;
  if (!v21 || *(_DWORD *)(a1 + 1124) != v24) {
    *(_DWORD *)(a1 + 4384) = 3;
  }
}

uint64_t sub_24FF5EB9C(uint64_t result, _DWORD *a2)
{
  unsigned int v2 = (unsigned int *)result;
  uint64_t v40 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(unsigned int *)(result + 1120);
  if ((int)v3 <= 0)
  {
    *(_DWORD *)(result + 4384) = 3;
  }
  else if (*(unsigned char *)(result + 1144))
  {
    __int16 v38 = 0x8000;
    __int16 v37 = 0x8000;
    memset_pattern16(__b, &unk_24FF7D710, 0x80uLL);
    int v5 = 0;
    __int16 v36 = 0x8000;
    int v6 = 6;
    do
    {
      __n128 result = sub_24FF5FDE8(v2, &v38);
      if (result)
      {
        BOOL v7 = sub_24FF5FDE8(v2, &v37);
        if (sub_24FF5FDE8(v2, __b)) {
          unsigned int v8 = 32;
        }
        else {
          unsigned int v8 = 0;
        }
        if (sub_24FF5FDE8(v2, &__b[(v8 >> 5) + 1])) {
          int v9 = 16;
        }
        else {
          int v9 = 0;
        }
        unsigned int v10 = v9 | v8;
        if (sub_24FF5FDE8(v2, &__b[(v10 >> 4) + 3])) {
          int v11 = 8;
        }
        else {
          int v11 = 0;
        }
        unsigned int v12 = v10 | v11;
        if (sub_24FF5FDE8(v2, &__b[(v12 >> 3) + 7])) {
          int v13 = 4;
        }
        else {
          int v13 = 0;
        }
        unsigned int v14 = v12 | v13;
        if (sub_24FF5FDE8(v2, &__b[(v14 >> 2) + 15])) {
          int v15 = 2;
        }
        else {
          int v15 = 0;
        }
        unsigned int v16 = v14 | v15;
        __n128 result = sub_24FF5FDE8(v2, &__b[(v16 >> 1) + 31]);
        int v17 = v16 | result;
        if ((v16 | result) == 0x3F)
        {
          __n128 result = sub_24FF5FED8(v2, v6, &v36);
          int v17 = result + 63;
          int v18 = -63 - result;
          if ((int)result >= -63) {
            int v18 = result + 63;
          }
          int v19 = v18 >> v6;
          if (!v6 || v19)
          {
            if (v19 > 1) {
              ++v6;
            }
          }
          else
          {
            --v6;
          }
        }
        if (v7) {
          int v20 = v17 + 1;
        }
        else {
          int v20 = ~v17;
        }
      }
      else
      {
        int v20 = 0;
      }
      v5 += v20;
      *a2++ = v5;
      --v3;
    }
    while (v3);
  }
  else
  {
    __int16 v38 = 0x8000;
    __int16 v37 = 0x8000;
    memset_pattern16(__b, &unk_24FF7D710, 0x80uLL);
    int v21 = 0;
    __int16 v36 = 0x8000;
    do
    {
      __n128 result = sub_24FF5FDE8(v2, &v38);
      if (result)
      {
        BOOL v22 = sub_24FF5FDE8(v2, &v37);
        BOOL v23 = sub_24FF5FDE8(v2, __b);
        if (v23) {
          uint64_t v24 = 2;
        }
        else {
          uint64_t v24 = 1;
        }
        if (sub_24FF5FDE8(v2, &__b[v24])) {
          int v25 = 2;
        }
        else {
          int v25 = 0;
        }
        int v26 = v25 | v23;
        if (sub_24FF5FDE8(v2, &__b[v26 + 3])) {
          int v27 = 4;
        }
        else {
          int v27 = 0;
        }
        int v28 = v26 | v27;
        if (sub_24FF5FDE8(v2, &__b[v28 + 7])) {
          int v29 = 8;
        }
        else {
          int v29 = 0;
        }
        int v30 = v28 | v29;
        if (sub_24FF5FDE8(v2, &__b[v30 + 15])) {
          int v31 = 16;
        }
        else {
          int v31 = 0;
        }
        int v32 = v30 | v31;
        __n128 result = sub_24FF5FDE8(v2, &__b[v32 + 31]);
        if (result) {
          int v33 = 32;
        }
        else {
          int v33 = 0;
        }
        int v34 = v32 | v33;
        if (v34 == 63)
        {
          __n128 result = sub_24FF5FED8(v2, 6, &v36);
          int v34 = result + 63;
        }
        if (v22) {
          int v35 = v34 + 1;
        }
        else {
          int v35 = ~v34;
        }
      }
      else
      {
        int v35 = 0;
      }
      v21 += v35;
      *a2++ = v21;
      --v3;
    }
    while (v3);
  }
  return result;
}

uint64_t sub_24FF5EEF4(uint64_t a1, int *a2)
{
  unint64_t v3 = *(unsigned int *)(a1 + 1120);
  unint64_t v4 = *(unsigned int *)(a1 + 1124);
  if ((int)v4 < 3 || (int)v3 <= 0) {
    goto LABEL_41;
  }
  BOOL v7 = a2;
  unsigned int v8 = a2;
  if (v3 == 1) {
    goto LABEL_38;
  }
  unsigned int v8 = a2 + 1;
  int v9 = a2[1];
  int v10 = *a2;
  if (v9 >= *a2) {
    BOOL v7 = a2;
  }
  else {
    BOOL v7 = a2 + 1;
  }
  if (v9 < v10) {
    unsigned int v8 = a2;
  }
  if (v3 == 2) {
    goto LABEL_38;
  }
  int v11 = a2 + 2;
  if (v9 <= v10) {
    int v12 = *a2;
  }
  else {
    int v12 = a2[1];
  }
  if (v9 < v10) {
    int v10 = a2[1];
  }
  uint64_t v13 = 4 * v3 - 12;
  while (v13)
  {
    int v15 = *v11;
    int v14 = v11[1];
    if (v14 >= *v11)
    {
      if (v15 < v10)
      {
        int v10 = *v11;
        BOOL v7 = v11;
      }
      BOOL v16 = v14 < v12;
      if (v14 > v12) {
        int v12 = v11[1];
      }
      if (!v16) {
        unsigned int v8 = v11 + 1;
      }
    }
    else
    {
      int v10 = *v7;
      if (v14 < *v7)
      {
        int v10 = v11[1];
        BOOL v7 = v11 + 1;
      }
      int v12 = *v8;
      if (v15 > *v8) {
        int v12 = *v11;
      }
      if (v15 >= *v8) {
        unsigned int v8 = v11;
      }
    }
    v11 += 2;
    v13 -= 8;
    if (v13 == -4) {
      goto LABEL_38;
    }
  }
  int v17 = *v11;
  if (*v11 >= *v7)
  {
    if (v17 >= *v8) {
      unsigned int v8 = v11;
    }
LABEL_38:
    int v17 = *v7;
  }
  if (v17 < 0 || (int v18 = *v8, v19 = v18 - v17, v18 - v17 > (int)v3))
  {
LABEL_41:
    uint64_t result = 3;
    *(_DWORD *)(a1 + 4384) = 3;
    return result;
  }
  int v21 = v19 + 2;
  *(_DWORD *)(a1 + 1076) = v17;
  *(_DWORD *)(a1 + 1072) = v18;
  BOOL v22 = (uint64_t *)(a1 + 1232);
  sub_24FF5F2F4(a1 + 1232, 0);
  LODWORD(v64[0]) = 0;
  sub_24FF62F6C(a1 + 1232, v19 + 2, v64);
  BOOL v23 = *(int **)(a1 + 1232);
  uint64_t v24 = a2;
  unint64_t v25 = v3;
  do
  {
    int v26 = *v24++;
    ++v23[v26 - v17 + 1];
    --v25;
  }
  while (v25);
  if ((v19 & 0x80000000) == 0)
  {
    if (v21 <= 2) {
      uint64_t v27 = 2;
    }
    else {
      uint64_t v27 = v21;
    }
    int v30 = *v23;
    int v28 = v23 + 1;
    int v29 = v30;
    uint64_t v31 = v27 - 1;
    do
    {
      v29 += *v28;
      *v28++ = v29;
      --v31;
    }
    while (v31);
  }
  sub_24FF6A51C(v64, v3);
  LODWORD(v61[0]) = 0;
  sub_24FF6A454(v63, (int)v3 + 1, v61);
  uint64_t v32 = 0;
  uint64_t v33 = *(void *)(a1 + 1232);
  int v34 = v64[0];
  uint64_t v35 = *(void *)(a1 + 1208);
  __int16 v36 = v63[0];
  do
  {
    int v37 = a2[v32] - v17;
    uint64_t v38 = *(int *)(v33 + 4 * v37);
    *(_DWORD *)(v33 + 4 * v37) = v38 + 1;
    v34[v38] = v32;
    v36[v32 + 1] = *(_DWORD *)(v35 + 4 * v32 + 4) - *(_DWORD *)(v35 + 4 * v32) + v36[v32];
    ++v32;
  }
  while (v3 != v32);
  sub_24FF6A51C(v61, v4);
  sub_24FF6A51C(__p, v3);
  uint64_t v39 = 0;
  int v40 = 0;
  do
  {
    uint64_t v41 = *((int *)v64[0] + v39);
    uint64_t v42 = 4 * v41 + 4;
    int v43 = *(_DWORD *)(*(void *)(a1 + 1208) + v42) - *(_DWORD *)(*(void *)(a1 + 1208) + 4 * v41);
    uint64_t v44 = *((int *)v63[0] + v41);
    uint64_t v45 = *(int *)((char *)v63[0] + v42);
    *((_DWORD *)__p[0] + v39) = v43;
    if (v45 != v44) {
      memmove((char *)v61[0] + 4 * v40, (const void *)(*(void *)(a1 + 1184) + 4 * v44), 4 * v45 - 4 * v44);
    }
    v40 += v43;
    ++v39;
  }
  while (v3 != v39);
  uint64_t v46 = 0;
  long long v47 = *(_OWORD *)(a1 + 1184);
  *(_OWORD *)(a1 + 1184) = *(_OWORD *)v61;
  *(_OWORD *)int v61 = v47;
  uint64_t v48 = *(void *)(a1 + 1200);
  *(void *)(a1 + 1200) = v62;
  uint64_t v62 = v48;
  BOOL v49 = *(int **)(a1 + 1208);
  unsigned int v50 = __p[0];
  int v53 = *v49;
  unsigned int v51 = v49 + 1;
  int v52 = v53;
  do
  {
    v52 += v50[v46];
    v51[v46++] = v52;
  }
  while (v3 != v46);
  if (v19 < 0) {
    goto LABEL_65;
  }
  uint64_t v54 = 0;
  int v55 = 0;
  uint64_t v56 = *v22;
  do
  {
    int v57 = *(_DWORD *)(v56 + 4 * v54);
    if (v55 < v57)
    {
      uint64_t v58 = v57 - (uint64_t)v55;
      BOOL v59 = &a2[v55];
      do
      {
        *v59++ = v17 + v54;
        --v58;
      }
      while (v58);
    }
    *(_DWORD *)(v56 + 4 * v54++) = v55;
    int v55 = v57;
  }
  while (v54 != v19 + 1);
  if (v50)
  {
LABEL_65:
    __p[1] = v50;
    operator delete(v50);
  }
  if (v61[0])
  {
    v61[1] = v61[0];
    operator delete(v61[0]);
  }
  if (v63[0])
  {
    v63[1] = v63[0];
    operator delete(v63[0]);
  }
  if (v64[0])
  {
    v64[1] = v64[0];
    operator delete(v64[0]);
  }
  return 0;
}

void sub_24FF5F2A8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21)
{
  if (__p) {
    operator delete(__p);
  }
  if (a17) {
    operator delete(a17);
  }
  if (a20) {
    operator delete(a20);
  }
  _Unwind_Resume(exception_object);
}

void sub_24FF5F2F4(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 2;
  if (a2 <= v2)
  {
    if (a2 < v2) {
      *(void *)(a1 + 8) = *(void *)a1 + 4 * a2;
    }
  }
  else
  {
    sub_24FF6A214((char **)a1, a2 - v2);
  }
}

uint64_t sub_24FF5F324(uint64_t a1, unint64_t a2, unint64_t a3, void *a4, uint64_t a5, uint64_t a6)
{
  uint64_t result = 5;
  if (a2 && a5)
  {
    if (*(_DWORD *)(a1 + 4384)) {
      return 6;
    }
    int v14 = (unsigned int *)sub_24FF5F618(a2, a3, a1 + 3992);
    uint64_t result = 3;
    if (v14)
    {
      if ((v13 & 0x8000000000000000) == 0)
      {
        unint64_t v15 = *(unsigned int *)(a1 + 4000);
        if ((uint64_t)(a3 - v15) >= 0 && (unint64_t)v14 + v13 >= a2)
        {
          uint64_t v16 = a2 + v15;
          if (a2 + v15 >= (unint64_t)v14)
          {
            uint64_t v17 = v16 - (void)v14;
            if (v16 - (uint64_t)v14 >= 0 && !*(_DWORD *)(a1 + 4028))
            {
              if (*(unsigned char *)(a1 + 3996)) {
                return 4;
              }
              unsigned int v18 = *(unsigned __int8 *)(a1 + 3997);
              uint64_t result = 4;
              if (v18 <= 8 && ((1 << v18) & 0x160) != 0)
              {
                if (a3 < v15) {
                  return 3;
                }
                int v19 = *(_DWORD *)(a1 + 1116);
                if (*(_DWORD *)(a1 + 4004) != v19 || !a6 && *(_DWORD *)(a1 + 4032)) {
                  return 3;
                }
                uint64_t v20 = *(unsigned int *)(a1 + 4008);
                unint64_t v44 = *(int *)(a1 + 4008);
                if ((*(_DWORD *)(a1 + 4048) - 5) >= 2)
                {
                  unsigned int v21 = *(_DWORD *)(a1 + 4020);
                }
                else
                {
                  if (v20 != 2) {
                    return 3;
                  }
                  unsigned int v21 = *(_DWORD *)(a1 + 4020);
                  if (!v21) {
                    return 3;
                  }
                }
                if (v21 > 0x1B) {
                  return 3;
                }
                int v43 = (int **)(a1 + 3920);
                BOOL v22 = (int **)(a1 + 3944);
                sub_24FF5F2F4(a1 + 3944, v44);
                if ((int)v20 < 1)
                {
                  sub_24FF5F2F4((uint64_t)v43, v44);
                  unsigned __int8 v29 = 0;
                }
                else
                {
                  for (uint64_t i = 0; i != v20; ++i)
                  {
                    BOOL v24 = v17 < 4;
                    v17 -= 4;
                    if (v24)
                    {
                      uint64_t v17 = 0;
                      int v14 = 0;
                    }
                    else
                    {
                      unsigned int v25 = *v14++;
                      (*v22)[i] = v25;
                    }
                  }
                  sub_24FF5F2F4((uint64_t)v43, v44);
                  uint64_t v26 = 0;
                  uint64_t result = 3;
                  do
                  {
                    while (!v17)
                    {
                      int v14 = 0;
                      if (++v26 == v20) {
                        return result;
                      }
                    }
                    uint64_t v27 = *v43;
                    --v17;
                    int v28 = *(unsigned __int8 *)v14;
                    int v14 = (unsigned int *)((char *)v14 + 1);
                    (*v43)[v26++] = v28;
                  }
                  while (v26 != v20);
                  if (!v14) {
                    return 3;
                  }
                  unsigned __int8 v29 = 0;
                  int v30 = *v22;
                  char v31 = 1;
                  uint64_t v32 = v20;
                  do
                  {
                    int v33 = *v30++;
                    v29 |= v33 != 0;
                    int v34 = *v27++;
                    v31 &= v34 < 29;
                    --v32;
                  }
                  while (v32);
                  if ((v31 & 1) == 0) {
                    return 3;
                  }
                }
                __int16 v36 = sub_24FF5DA18(a1, v14, v17);
                uint64_t result = 3;
                if (v36)
                {
                  if ((v35 & 0x8000000000000000) == 0)
                  {
                    uint64_t result = sub_24FF5F76C(a1, a5, a6);
                    if (!result)
                    {
                      if ((v29 & (v19 > 0)) == 1)
                      {
                        int v37 = 0;
                        int v38 = 0;
                        do
                        {
                          if ((int)v20 >= 1)
                          {
                            uint64_t v39 = *v22;
                            int v40 = (_DWORD *)(a5 + 4 * v37);
                            v37 += v44;
                            uint64_t v41 = v20;
                            do
                            {
                              int v42 = *v39++;
                              *v40++ += v42;
                              --v41;
                            }
                            while (v41);
                          }
                          ++v38;
                        }
                        while (v38 != v19);
                      }
                      uint64_t result = 0;
                      *a4 = *(unsigned int *)(a1 + 4000);
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_24FF5F618(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 < 4) {
    return 0;
  }
  unint64_t v3 = a2 & 0xFFFFFFFFFFFFFFFCLL;
  if ((a2 & 0xFFFFFFFFFFFFFFFCLL) == 4
    || a2 == 8
    || a2 == 9
    || (a2 & 0xFFFFFFFFFFFFFFFELL) == 0xA
    || v3 == 12
    || v3 == 16
    || a2 == 20
    || a2 == 21
    || a2 == 22
    || a2 == 23
    || a2 == 24
    || a2 == 25
    || a2 == 26
    || a2 == 27
    || v3 == 28)
  {
    return 0;
  }
  uint64_t v6 = a1 + 32;
  if (a1 == -32) {
    return 0;
  }
  uint64_t v4 = 0;
  if (*(_DWORD *)a1 == -290009985)
  {
    int v7 = *(_DWORD *)(a1 + 4);
    char v8 = *(unsigned char *)(a1 + 8);
    char v9 = *(unsigned char *)(a1 + 9);
    __int16 v10 = *(_WORD *)(a1 + 10);
    int v11 = *(_DWORD *)(a1 + 12);
    int v12 = *(_DWORD *)(a1 + 16) & 0x7FFFFFFF;
    int v13 = *(unsigned __int8 *)(a1 + 20);
    int v14 = *(unsigned __int8 *)(a1 + 21);
    int v15 = *(unsigned __int8 *)(a1 + 22);
    char v16 = *(unsigned char *)(a1 + 23);
    int v17 = *(unsigned __int8 *)(a1 + 24);
    unsigned int v18 = *(unsigned __int8 *)(a1 + 25);
    int v19 = *(unsigned __int8 *)(a1 + 26);
    int v20 = *(unsigned __int8 *)(a1 + 27);
    int v21 = *(_DWORD *)(a1 + 28) & 0x7FFFFFFF;
    *(_DWORD *)a3 = 0;
    *(unsigned char *)(a3 + 4) = v8;
    *(unsigned char *)(a3 + 5) = v9;
    *(_WORD *)(a3 + 6) = v10;
    *(_DWORD *)(a3 + 8) = v11;
    *(_DWORD *)(a3 + 12) = v12;
    *(_DWORD *)(a3 + 16) = v15;
    *(_DWORD *)(a3 + 20) = v21;
    *(_DWORD *)(a3 + 24) = v14;
    *(_DWORD *)(a3 + 28) = v20;
    *(_DWORD *)(a3 + 32) = v13;
    *(_DWORD *)(a3 + 36) = v18 & 0xF;
    *(_DWORD *)(a3 + 40) = v19;
    *(_DWORD *)(a3 + 44) = v18 >> 4;
    *(_DWORD *)(a3 + 48) = v7;
    *(unsigned char *)(a3 + 52) = v16;
    uint64_t v4 = v6;
    *(_DWORD *)(a3 + 56) = v17;
  }
  return v4;
}

uint64_t sub_24FF5F76C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_DWORD *)(a1 + 4032) == 1)
  {
    memset_pattern16(__b, &unk_24FF7D710, 4uLL);
    if (*(int *)(a1 + 4004) >= 1)
    {
      uint64_t v6 = 0;
      uint64_t v7 = 0;
      while (1)
      {
        char v8 = (int *)(*(void *)(a1 + 1256) + v6);
        uint64_t v9 = *v8;
        uint64_t v10 = v8[1];
        uint64_t v11 = v8[2];
        int v12 = (int *)(*(void *)(a1 + 1280) + v6);
        uint64_t v13 = v12[2];
        if (v13 != -1)
        {
          BOOL v14 = *(unsigned __int8 *)(a3 + v10)
              + *(unsigned __int8 *)(a3 + v9)
              + *(unsigned __int8 *)(a3 + v11)
              + *(unsigned __int8 *)(a3 + *v12)
              + *(unsigned __int8 *)(a3 + v12[1])
              + *(unsigned __int8 *)(a3 + v13) > 2;
          goto LABEL_8;
        }
        if (v11 != -1)
        {
          BOOL v14 = *(unsigned __int8 *)(a3 + v10)
              + *(unsigned __int8 *)(a3 + v9)
              + *(unsigned __int8 *)(a3 + v11) > 1;
LABEL_8:
          int v15 = v14;
          goto LABEL_11;
        }
        if (v10 == -1) {
          break;
        }
        int v15 = *(unsigned __int8 *)(a3 + v9);
        if (v15)
        {
          int v16 = *(unsigned __int8 *)(a3 + v10);
LABEL_18:
          int v15 = v16 != 0;
        }
LABEL_11:
        *(unsigned char *)(a3 + v7++) = sub_24FF5FDE8((unsigned int *)a1, &__b[v15]);
        v6 += 12;
        if (v7 >= *(int *)(a1 + 4004)) {
          goto LABEL_20;
        }
      }
      if (v9 == -1)
      {
        int v15 = 0;
        goto LABEL_11;
      }
      int v16 = *(unsigned __int8 *)(a3 + v9);
      goto LABEL_18;
    }
  }
LABEL_20:
  uint64_t v17 = *(unsigned int *)(a1 + 4048);
  if (v17 > 6) {
    return 3;
  }
  ((void (*)(uint64_t, uint64_t, uint64_t))off_270165108[2 * v17])(a1, a2, a3);
  return 0;
}

void sub_24FF5F900(unsigned int *a1, uint64_t a2, int a3, void *a4, unsigned char *a5, void *a6, uint64_t a7)
{
  int v68 = 0;
  sub_24FF6A454(__p, a3, &v68);
  switch(*a5)
  {
    case 0:
      if (a3 < 1) {
        goto LABEL_90;
      }
      uint64_t v11 = 0;
      uint64_t v12 = 0;
      uint64_t v13 = 0;
      unint64_t v14 = (unint64_t)a3 << 6;
      do
      {
        if (sub_24FF5FDE8(a1, (_WORD *)(*a6 + v11)))
        {
          BOOL v15 = sub_24FF5FDE8(a1, (_WORD *)(a6[3] + v11));
          int v16 = (_WORD *)(a6[6] + 2 * (int)v13);
          BOOL v17 = sub_24FF5FDE8(a1, v16);
          if (v17) {
            uint64_t v18 = 2;
          }
          else {
            uint64_t v18 = 1;
          }
          if (sub_24FF5FDE8(a1, &v16[v18])) {
            int v19 = 2;
          }
          else {
            int v19 = 0;
          }
          int v20 = v19 | v17;
          if (sub_24FF5FDE8(a1, &v16[(v19 | v17) + 3])) {
            int v21 = 4;
          }
          else {
            int v21 = 0;
          }
          int v22 = v20 | v21;
          if (sub_24FF5FDE8(a1, &v16[v22 + 7])) {
            int v23 = 8;
          }
          else {
            int v23 = 0;
          }
          int v24 = v22 | v23;
          if (sub_24FF5FDE8(a1, &v16[v24 + 15])) {
            int v25 = 16;
          }
          else {
            int v25 = 0;
          }
          int v26 = v24 | v25;
          if (sub_24FF5FDE8(a1, &v16[v26 + 31])) {
            int v27 = 32;
          }
          else {
            int v27 = 0;
          }
          int v28 = v26 | v27;
          if (v28 == 63) {
            int v28 = sub_24FF5FED8(a1, *(_DWORD *)(a6[12] + v12), (_WORD *)(a6[9] + v11)) + 63;
          }
          if (v15) {
            int v29 = v28 + 1;
          }
          else {
            int v29 = ~v28;
          }
          unint64_t v14 = (unint64_t)a3 << 6;
        }
        else
        {
          int v29 = 0;
        }
        *(_DWORD *)((char *)__p[0] + v12) = v29;
        v13 += 64;
        v12 += 4;
        v11 += 2;
      }
      while (v14 != v13);
      goto LABEL_86;
    case 2:
      if (a3 < 1) {
        goto LABEL_90;
      }
      uint64_t v30 = 0;
      uint64_t v31 = 0;
      do
      {
        uint64_t v32 = a6[12];
        int v33 = sub_24FF5FFA0(a1, *(_DWORD *)(v32 + v30), (_WORD *)(a6[3] + v31), (_WORD *)(a6[9] + v31));
        if (v33 >= 0) {
          unsigned int v34 = v33;
        }
        else {
          unsigned int v34 = -v33;
        }
        int v35 = *(_DWORD *)(v32 + v30);
        unsigned int v36 = v34 >> v35;
        if (v35) {
          BOOL v37 = v36 == 0;
        }
        else {
          BOOL v37 = 0;
        }
        if (v37)
        {
          int v38 = -1;
        }
        else
        {
          if (v36 < 2) {
            goto LABEL_45;
          }
          int v38 = 1;
        }
        *(_DWORD *)(v32 + v30) = v38 + v35;
LABEL_45:
        *(_DWORD *)((char *)__p[0] + v30) = v33;
        v31 += 2;
        v30 += 4;
      }
      while (2 * a3 != v31);
LABEL_86:
      uint64_t v63 = (char *)__p[0];
      if (a3 < 1) {
        goto LABEL_91;
      }
      uint64_t v64 = 0;
      do
      {
        *(_DWORD *)(a7 + v64) = *(_DWORD *)&v63[v64] + *(_DWORD *)(a2 + v64);
        v64 += 4;
      }
      while (4 * a3 != v64);
LABEL_92:
      __p[1] = v63;
      operator delete(v63);
      return;
    case 3:
      if (a3 < 1) {
        goto LABEL_90;
      }
      uint64_t v39 = 0;
      int v40 = __p[0];
      do
      {
        int v41 = *(_DWORD *)(*a4 + 4 * v39);
        if (v41 < 1)
        {
          int v43 = 0;
        }
        else
        {
          int v42 = 0;
          int v43 = 0;
          do
          {
            LOWORD(v68) = 0x8000;
            v43 += sub_24FF5FDE8(a1, &v68) << v42++;
          }
          while (v41 != v42);
        }
        v40[v39++] = v43;
      }
      while (v39 != a3);
      goto LABEL_86;
    case 4:
      if (a3 < 1)
      {
LABEL_90:
        uint64_t v63 = (char *)__p[0];
LABEL_91:
        if (v63) {
          goto LABEL_92;
        }
        return;
      }
      uint64_t v44 = 0;
      uint64_t v45 = 0;
      uint64_t v46 = 0;
      break;
    default:
      goto LABEL_86;
  }
  while (!sub_24FF5FDE8(a1, (_WORD *)(*a6 + v44)))
  {
    int v62 = 0;
LABEL_85:
    *(_DWORD *)((char *)__p[0] + v45) = v62;
    v46 += 64;
    v45 += 4;
    v44 += 2;
    if ((unint64_t)a3 << 6 == v46) {
      goto LABEL_86;
    }
  }
  BOOL v47 = sub_24FF5FDE8(a1, (_WORD *)(a6[3] + v44));
  uint64_t v48 = (_WORD *)(a6[6] + 2 * (int)v46);
  if (sub_24FF5FDE8(a1, v48)) {
    unsigned int v49 = 32;
  }
  else {
    unsigned int v49 = 0;
  }
  if (sub_24FF5FDE8(a1, &v48[(v49 >> 5) + 1])) {
    int v50 = 16;
  }
  else {
    int v50 = 0;
  }
  unsigned int v51 = v50 | v49;
  if (sub_24FF5FDE8(a1, &v48[(v51 >> 4) + 3])) {
    int v52 = 8;
  }
  else {
    int v52 = 0;
  }
  unsigned int v53 = v51 | v52;
  if (sub_24FF5FDE8(a1, &v48[(v53 >> 3) + 7])) {
    int v54 = 4;
  }
  else {
    int v54 = 0;
  }
  unsigned int v55 = v53 | v54;
  if (sub_24FF5FDE8(a1, &v48[(v55 >> 2) + 15])) {
    int v56 = 2;
  }
  else {
    int v56 = 0;
  }
  int v57 = v55 | v56 | sub_24FF5FDE8(a1, &v48[((v55 | v56) >> 1) + 31]);
  if (v57 == 63)
  {
    uint64_t v58 = a6[12];
    int v57 = sub_24FF5FED8(a1, *(_DWORD *)(v58 + v45), (_WORD *)(a6[9] + v44)) + 63;
    int v59 = *(_DWORD *)(v58 + v45);
    int v60 = v57 >> v59;
    if (!v59 || v60)
    {
      if (v60 < 2) {
        goto LABEL_82;
      }
      int v61 = 1;
    }
    else
    {
      int v61 = -1;
    }
    *(_DWORD *)(v58 + v45) = v61 + v59;
  }
LABEL_82:
  if (v47) {
    int v62 = v57 + 1;
  }
  else {
    int v62 = ~v57;
  }
  goto LABEL_85;
}

BOOL sub_24FF5FDE8(unsigned int *a1, _WORD *a2)
{
  unsigned int v2 = (unsigned __int16)*a2;
  unsigned int v3 = a1[7];
  unsigned int v4 = a1[8];
  if (v3 > 0x40000000)
  {
    unsigned int v11 = a1[7];
  }
  else
  {
    int v5 = a1[10];
    do
    {
      v4 *= 2;
      a1[10] = --v5;
      if (!v5)
      {
        uint64_t v6 = *((void *)a1 + 2);
        *((void *)a1 + 2) = v6 + 1;
        unint64_t v7 = *a1;
        if (v6 + 1 >= v7) {
          int v8 = 65280;
        }
        else {
          int v8 = *(unsigned __int8 *)(*((void *)a1 + 1) + v6 + 1) << 8;
        }
        unint64_t v9 = v6 + 2;
        *((void *)a1 + 2) = v9;
        if (v9 >= v7) {
          int v10 = 255;
        }
        else {
          int v10 = *(unsigned __int8 *)(*((void *)a1 + 1) + v9);
        }
        v4 |= v8 | v10;
        int v5 = 16;
        a1[10] = 16;
      }
      unsigned int v11 = 2 * v3;
      BOOL v12 = v3 >= 0x20000001;
      v3 *= 2;
    }
    while (!v12);
  }
  unsigned int v13 = (HIWORD(v11) * v2) & 0xFFFF0000;
  unsigned int v14 = v11 - v13;
  BOOL v15 = v4 >= v13;
  *a2 = *((_WORD *)a1 + ((v2 >> 7) & 0x1FE | v15) + 24) + v2;
  if (v4 < v13) {
    unsigned int v16 = v13;
  }
  else {
    unsigned int v16 = v14;
  }
  if (v4 < v13) {
    unsigned int v13 = 0;
  }
  a1[7] = v16;
  a1[8] = v4 - v13;
  return v15;
}

uint64_t sub_24FF5FED8(unsigned int *a1, int a2, _WORD *a3)
{
  int v6 = 0;
  if (sub_24FF5FDE8(a1, a3) && a2 <= 30)
  {
    int v6 = 0;
    do
    {
      int v7 = a2 + 1;
      v6 |= 1 << a2;
      if (!sub_24FF5FDE8(a1, a3)) {
        break;
      }
    }
    while (a2++ < 30);
  }
  else
  {
    int v7 = a2;
  }
  int v9 = 0;
  if (v7)
  {
    int v10 = v7 - 1;
    do
    {
      __int16 v12 = 0x8000;
      v9 |= sub_24FF5FDE8(a1, &v12) << v10--;
    }
    while (v10 != -1);
  }
  return (v9 + v6);
}

uint64_t sub_24FF5FFA0(unsigned int *a1, int a2, _WORD *a3, _WORD *a4)
{
  uint64_t result = sub_24FF5FED8(a1, a2, a4);
  if (result)
  {
    unsigned int v7 = result;
    if (sub_24FF5FDE8(a1, a3)) {
      return v7;
    }
    else {
      return -v7;
    }
  }
  return result;
}

void sub_24FF5FFF0(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t v164 = *MEMORY[0x263EF8340];
  unsigned int v4 = (void *)(a1 + 3920);
  uint64_t v5 = *(unsigned int *)(a1 + 4004);
  uint64_t v150 = *(int *)(a1 + 4008);
  int v148 = ~(-1 << (*(_DWORD *)(a1 + 4020) - 1));
  sub_24FF65ECC((void *)(a1 + 1160), (void *)(a1 + 1208), (void *)(a1 + 1184), (uint64_t *)(a1 + 1184), -1431655765 * ((*(void *)(a1 + 1168) - *(void *)(a1 + 1160)) >> 2), (uint64_t *)(a1 + 3968), v148);
  uint64_t v6 = 0;
  uint64_t v163 = 0;
  memset(v162, 0, sizeof(v162));
  do
  {
    sub_24FF60D8C((uint64_t)v162 + v6, v150);
    v6 += 120;
  }
  while (v6 != 360);
  memset_pattern16(__b, &unk_24FF7D710, 6uLL);
  memset_pattern16(v160, &unk_24FF7D710, 6uLL);
  __int16 v159 = 0x8000;
  __int16 v158 = 0x8000;
  int v7 = v148;
  if ((int)v5 > 0)
  {
    uint64_t v8 = 0;
    int v9 = *(_DWORD *)(a1 + 4032);
    int v142 = 2 * v148;
    int v143 = v9;
    uint64_t v145 = 12 * v5;
    int v10 = (int *)(a2 + 4);
    int32x2_t v11 = vdup_n_s32(v148);
    __int16 v12 = a3;
    char v144 = a3;
    uint64_t v137 = v4;
    while (v9 && !*v12)
    {
LABEL_162:
      v8 += 12;
      v10 += v150;
      ++v12;
      if (v145 == v8) {
        goto LABEL_163;
      }
    }
    unsigned int v13 = (int32x2_t *)(*(void *)(a1 + 3968) + v8);
    int32x2_t v14 = *v13;
    int v15 = v13[1].i32[0];
    unsigned int v16 = (int *)(*(void *)(a1 + 1256) + v8);
    uint64_t v17 = *v16;
    uint64_t v18 = v16[1];
    uint64_t v19 = v16[2];
    int v20 = (int *)(*(void *)(a1 + 1280) + v8);
    uint64_t v21 = v20[2];
    int32x2_t v146 = v14;
    if (v21 != -1 && (!v9 || a3[v17] && a3[v18] && a3[v19] && a3[*v20] && a3[v20[1]] && a3[v21]))
    {
      int v138 = *v20;
      int v139 = v20[1];
      int32x2_t v22 = vsub_s32(*(int32x2_t *)(a2 + 4 * (int)v17 * (int)v150), v11);
      int32x2_t v23 = vabs_s32(vrev64_s32(v22));
      int v140 = v7 - v23.i32[1] - v23.i32[0];
      if (v140 < 0) {
        int32x2_t v22 = (int32x2_t)vbsl_s8((int8x8_t)vcltz_s32(v22), (int8x8_t)vsub_s32(v23, v11), (int8x8_t)__PAIR64__(v7 - v23.i32[1], v7 - v23.i32[0]));
      }
      BOOL v24 = sub_24FF5FDE8((unsigned int *)a1, v160);
      uint64_t v25 = 2;
      if (!v24) {
        uint64_t v25 = 1;
      }
      if (sub_24FF5FDE8((unsigned int *)a1, &v160[v25])) {
        int v26 = 2;
      }
      else {
        int v26 = 0;
      }
      int v27 = v26 | v24;
      if (v27 == 2)
      {
        int32x2_t v59 = vsub_s32(*(int32x2_t *)(a2 + 4 * v138 * (int)v150), v11);
        int32x2_t v60 = vabs_s32(vrev64_s32(v59));
        int v61 = v148 - v60.i32[1] - v60.i32[0];
        if (v61 < 0) {
          int32x2_t v59 = (int32x2_t)vbsl_s8((int8x8_t)vcltz_s32(v59), (int8x8_t)vsub_s32(v60, v11), (int8x8_t)__PAIR64__(v148 - v60.i32[1], v148 - v60.i32[0]));
        }
        unsigned int v4 = v137;
        int32x2_t v62 = vsub_s32(*(int32x2_t *)(a2 + 4 * v139 * (int)v150), v11);
        int32x2_t v63 = vabs_s32(vrev64_s32(v62));
        int v64 = v148 - v63.i32[1] - v63.i32[0];
        if (v64 < 0) {
          int32x2_t v62 = (int32x2_t)vbsl_s8((int8x8_t)vcltz_s32(v62), (int8x8_t)vsub_s32(v63, v11), (int8x8_t)__PAIR64__(v148 - v63.i32[1], v148 - v63.i32[0]));
        }
        int32x2_t v65 = vsub_s32(*(int32x2_t *)(a2 + 4 * (int)v21 * (int)v150), v11);
        int32x2_t v66 = vabs_s32(vrev64_s32(v65));
        if (v148 - v66.i32[1] - v66.i32[0] < 0) {
          int32x2_t v65 = (int32x2_t)vbsl_s8((int8x8_t)vcltz_s32(v65), (int8x8_t)vsub_s32(v66, v11), (int8x8_t)__PAIR64__(v148 - v66.i32[1], v148 - v66.i32[0]));
        }
        double v28 = COERCE_DOUBLE(vsub_s32(vadd_s32(v62, v59), v65));
        int v15 = v64 + v61 - (v148 - v66.i32[1] - v66.i32[0]);
      }
      else
      {
        unsigned int v4 = v137;
        if (v27 == 1)
        {
          int32x2_t v67 = vsub_s32(*(int32x2_t *)(a2 + 4 * (int)v18 * (int)v150), v11);
          int32x2_t v68 = vabs_s32(vrev64_s32(v67));
          int v69 = v148 - v68.i32[1] - v68.i32[0];
          if (v69 < 0) {
            int32x2_t v67 = (int32x2_t)vbsl_s8((int8x8_t)vcltz_s32(v67), (int8x8_t)vsub_s32(v68, v11), (int8x8_t)__PAIR64__(v148 - v68.i32[1], v148 - v68.i32[0]));
          }
          int32x2_t v70 = vsub_s32(*(int32x2_t *)(a2 + 4 * (int)v19 * (int)v150), v11);
          int32x2_t v71 = vabs_s32(vrev64_s32(v70));
          int v72 = v148 - v71.i32[1] - v71.i32[0];
          if (v72 < 0) {
            int32x2_t v70 = (int32x2_t)vbsl_s8((int8x8_t)vcltz_s32(v70), (int8x8_t)vsub_s32(v71, v11), (int8x8_t)__PAIR64__(v148 - v71.i32[1], v148 - v71.i32[0]));
          }
          double v28 = COERCE_DOUBLE(vsub_s32(vadd_s32(v67, v22), v70));
          int v15 = v69 + v140 - v72;
        }
        else if (v27)
        {
          double v73 = COERCE_DOUBLE(vsub_s32(*(int32x2_t *)(a2 + 4 * (int)v18 * (int)v150), v11));
          int32x2_t v74 = vabs_s32(vrev64_s32(*(int32x2_t *)&v73));
          int8x8_t v76 = (int8x8_t)vsub_s32(v74, v11);
          __int32 v77 = v74.i32[0];
          v74.i32[0] = v148 - v74.i32[0];
          v74.i32[1] = v148 - v74.i32[1];
          __int32 v75 = v74.i32[1];
          double v78 = COERCE_DOUBLE(vbsl_s8((int8x8_t)vcltz_s32(*(int32x2_t *)&v73), v76, (int8x8_t)v74));
          int v79 = v75 - v77;
          if (v79 < 0) {
            double v73 = v78;
          }
          double v80 = COERCE_DOUBLE(vsub_s32(*(int32x2_t *)(a2 + 4 * (int)v19 * (int)v150), v11));
          int32x2_t v81 = vabs_s32(vrev64_s32(*(int32x2_t *)&v80));
          __int32 v82 = v148 - v81.i32[1];
          __int32 v83 = v81.i32[0];
          double v84 = COERCE_DOUBLE(vbsl_s8((int8x8_t)vcltz_s32(*(int32x2_t *)&v80), (int8x8_t)vsub_s32(v81, v11), (int8x8_t)__PAIR64__(v148 - v81.i32[1], v148 - v81.i32[0])));
          int v85 = v82 - v83;
          if (v85 < 0) {
            double v80 = v84;
          }
          int32x2_t v86 = vsub_s32(*(int32x2_t *)(a2 + 4 * v138 * (int)v150), v11);
          int32x2_t v87 = vabs_s32(vrev64_s32(v86));
          int v88 = v148 - v87.i32[1] - v87.i32[0];
          if (v88 < 0) {
            int32x2_t v86 = (int32x2_t)vbsl_s8((int8x8_t)vcltz_s32(v86), (int8x8_t)vsub_s32(v87, v11), (int8x8_t)__PAIR64__(v148 - v87.i32[1], v148 - v87.i32[0]));
          }
          int32x2_t v89 = vsub_s32(*(int32x2_t *)(a2 + 4 * v139 * (int)v150), v11);
          int32x2_t v90 = vabs_s32(vrev64_s32(v89));
          int v91 = v148 - v90.i32[1] - v90.i32[0];
          if (v91 < 0) {
            int32x2_t v89 = (int32x2_t)vbsl_s8((int8x8_t)vcltz_s32(v89), (int8x8_t)vsub_s32(v90, v11), (int8x8_t)__PAIR64__(v148 - v90.i32[1], v148 - v90.i32[0]));
          }
          int32x2_t v92 = vsub_s32(*(int32x2_t *)(a2 + 4 * (int)v21 * (int)v150), v11);
          int32x2_t v93 = vabs_s32(vrev64_s32(v92));
          if (v148 - v93.i32[1] - v93.i32[0] < 0) {
            int32x2_t v92 = (int32x2_t)vbsl_s8((int8x8_t)vcltz_s32(v92), (int8x8_t)vsub_s32(v93, v11), (int8x8_t)__PAIR64__(v148 - v93.i32[1], v148 - v93.i32[0]));
          }
          uint32x2_t v94 = (uint32x2_t)vadd_s32(v86, v22);
          BOOL v95 = __OFADD__(v88, v140);
          int v96 = v88 + v140;
          if (v96 < 0 != v95) {
            ++v96;
          }
          int32x2_t v97 = vadd_s32(v89, *(int32x2_t *)&v73);
          int64x2_t v98 = vmull_s32(vsub_s32(vsra_n_s32(vadd_s32(v97, v97), (int32x2_t)vsra_n_u32(v94, v94, 0x1FuLL), 1uLL), vadd_s32(*(int32x2_t *)&v80, v92)), vdup_n_s32(0x55555556u));
          double v28 = COERCE_DOUBLE(vadd_s32(vshrn_n_s64(v98, 0x20uLL), vmovn_s64((int64x2_t)vshrq_n_u64((uint64x2_t)v98, 0x3FuLL))));
          unint64_t v99 = 1431655766 * ((v96 >> 1) + 2 * (v91 + v79) - (v85 + v148 - v93.i32[1] - v93.i32[0]));
          int v15 = HIDWORD(v99) + (v99 >> 63);
        }
        else
        {
          double v28 = *(double *)&v146;
          int32x2_t v29 = vzip1_s32(v22, v146);
          int32x2_t v30 = vzip2_s32(v22, v146);
          if (v29.i32[0] * (uint64_t)v29.i32[1] + v15 * (uint64_t)v140 + v30.i32[0] * (uint64_t)v30.i32[1] < 0)
          {
            double v28 = COERCE_DOUBLE(vneg_s32(v146));
            int v15 = -v15;
          }
        }
      }
      unsigned int v51 = 2;
      goto LABEL_109;
    }
    if (v19 != -1 && (!v9 || a3[v17] && a3[v18] && a3[v19]))
    {
      int32x2_t v31 = vsub_s32(*(int32x2_t *)(a2 + 4 * (int)v17 * (int)v150), v11);
      int32x2_t v32 = vabs_s32(vrev64_s32(v31));
      int v141 = v7 - v32.i32[1] - v32.i32[0];
      if (v141 < 0) {
        int32x2_t v31 = (int32x2_t)vbsl_s8((int8x8_t)vcltz_s32(v31), (int8x8_t)vsub_s32(v32, v11), (int8x8_t)__PAIR64__(v7 - v32.i32[1], v7 - v32.i32[0]));
      }
      int32x2_t v33 = vsub_s32(*(int32x2_t *)(a2 + 4 * (int)v18 * (int)v150), v11);
      int32x2_t v34 = vabs_s32(vrev64_s32(v33));
      int v35 = v7 - v34.i32[1] - v34.i32[0];
      if (v35 < 0) {
        int32x2_t v33 = (int32x2_t)vbsl_s8((int8x8_t)vcltz_s32(v33), (int8x8_t)vsub_s32(v34, v11), (int8x8_t)__PAIR64__(v7 - v34.i32[1], v7 - v34.i32[0]));
      }
      int32x2_t v36 = vsub_s32(*(int32x2_t *)(a2 + 4 * (int)v19 * (int)v150), v11);
      int32x2_t v37 = vabs_s32(vrev64_s32(v36));
      int v38 = v7 - v37.i32[1] - v37.i32[0];
      if (v38 < 0) {
        int32x2_t v36 = (int32x2_t)vbsl_s8((int8x8_t)vcltz_s32(v36), (int8x8_t)vsub_s32(v37, v11), (int8x8_t)__PAIR64__(v7 - v37.i32[1], v7 - v37.i32[0]));
      }
      BOOL v39 = sub_24FF5FDE8((unsigned int *)a1, __b);
      uint64_t v40 = 2;
      if (!v39) {
        uint64_t v40 = 1;
      }
      if (sub_24FF5FDE8((unsigned int *)a1, &__b[v40])) {
        int v41 = 2;
      }
      else {
        int v41 = 0;
      }
      int v42 = v41 | v39;
      if (v42 == 2)
      {
        uint32x2_t v100 = (uint32x2_t)vsub_s32(v33, (int32x2_t)vmvn_s8((int8x8_t)v31));
        double v28 = COERCE_DOUBLE(vshr_n_s32((int32x2_t)vsra_n_u32(v100, v100, 0x1FuLL), 1uLL));
        if (v141 + v35 + 1 >= 0) {
          int v101 = v141 + v35 + 1;
        }
        else {
          int v101 = v141 + v35 + 2;
        }
        int v15 = v101 >> 1;
        unsigned int v51 = 1;
      }
      else
      {
        if (v42 == 1)
        {
          double v28 = COERCE_DOUBLE(vsub_s32(vadd_s32(v33, v31), v36));
          int v15 = v35 + v141 - v38;
        }
        else if (v42)
        {
          int64x2_t v102 = vmull_s32(vadd_s32(vsub_s32(v33, (int32x2_t)vmvn_s8((int8x8_t)v31)), v36), vdup_n_s32(0x55555556u));
          double v28 = COERCE_DOUBLE(vadd_s32(vshrn_n_s64(v102, 0x20uLL), vmovn_s64((int64x2_t)vshrq_n_u64((uint64x2_t)v102, 0x3FuLL))));
          int v15 = (v141 + v35 + v38 + 1) / 3;
        }
        else
        {
          double v28 = *(double *)&v146;
          int32x2_t v43 = vzip1_s32(v31, v146);
          int32x2_t v44 = vzip2_s32(v31, v146);
          if (v43.i32[0] * (uint64_t)v43.i32[1] + v15 * (uint64_t)v141 + v44.i32[0] * (uint64_t)v44.i32[1] < 0)
          {
            double v28 = COERCE_DOUBLE(vneg_s32(v146));
            int v15 = -v15;
          }
        }
        unsigned int v51 = 1;
      }
      goto LABEL_109;
    }
    if (v18 == -1 || v9 && (!a3[v17] || !a3[v18]))
    {
      if (v17 == -1 || v9 && !a3[v17])
      {
        BOOL v55 = sub_24FF5FDE8((unsigned int *)a1, &v158);
        double v28 = *(double *)&v146;
        double v56 = COERCE_DOUBLE(vneg_s32(v146));
        if (v55) {
          int v15 = -v15;
        }
        unsigned int v51 = 0;
        if (v55) {
          double v28 = v56;
        }
LABEL_109:
        int v103 = LODWORD(v28);
        int v155 = LODWORD(v28);
        int v104 = HIDWORD(v28);
        int v154 = HIDWORD(v28);
        int32x2_t v105 = vabs_s32(*(int32x2_t *)&v28);
        unsigned int v106 = v105.u32[1];
        if (v15 >= 0) {
          unsigned int v107 = v15;
        }
        else {
          unsigned int v107 = -v15;
        }
        unsigned int v108 = v105.i32[0];
        BOOL v110 = v105.i32[0] < (unsigned __int32)v105.i32[1] || v105.i32[0] < v107;
        if (v110)
        {
          unsigned int v108 = v107;
          int v111 = HIDWORD(v28);
          int v112 = LODWORD(v28);
          if (v105.i32[1] < v107) {
            goto LABEL_123;
          }
          int v113 = &v154;
          unsigned int v108 = v105.u32[1];
          int v111 = v15;
          int v112 = LODWORD(v28);
        }
        else
        {
          int v113 = &v155;
          int v111 = HIDWORD(v28);
          int v112 = v15;
        }
        int *v113 = v15;
LABEL_123:
        int v156 = v112;
        v157[0] = v111;
        v157[1] = v108;
        sub_24FF5F900((unsigned int *)a1, (uint64_t)&v156, v150, v4, (unsigned char *)(a1 + 4044), (void *)v162 + 15 * v51, (uint64_t)&v151);
        int v115 = v151;
        int v114 = v152;
        if (v151 >= 0) {
          int v116 = v151;
        }
        else {
          int v116 = -v151;
        }
        if (v152 >= 0) {
          int v117 = v152;
        }
        else {
          int v117 = -v152;
        }
        int v7 = v148;
        int v118 = v148 - v116;
        int v119 = v148 - v116 - v117;
        if (v119 < 0)
        {
          int v122 = v148 - v117;
          int v123 = v117 - v148;
          if (v151 >= 0) {
            int v115 = v122;
          }
          else {
            int v115 = v123;
          }
          int v7 = v148;
          int v124 = v116 - v148;
          if (v152 >= 0) {
            int v114 = v118;
          }
          else {
            int v114 = v124;
          }
          if (v110) {
            goto LABEL_131;
          }
        }
        else if (v110)
        {
LABEL_131:
          if (v15 >= 0) {
            int v120 = v119;
          }
          else {
            int v120 = -v119;
          }
          if (v104 < 0) {
            int v119 = -v119;
          }
          if (v106 >= v107) {
            int v121 = v114;
          }
          else {
            int v121 = v120;
          }
          if (v106 >= v107) {
            int v114 = v119;
          }
          goto LABEL_151;
        }
        int v121 = v115;
        if (v103 >= 0) {
          int v115 = v119;
        }
        else {
          int v115 = -v119;
        }
LABEL_151:
        a3 = v144;
        if (v114 >= 0) {
          int v125 = v114;
        }
        else {
          int v125 = -v114;
        }
        if (v115 < 0)
        {
          int v126 = -v115;
        }
        else
        {
          int v125 = v142 - v125;
          int v126 = v115;
        }
        if (v114 >= 0) {
          int v126 = v142 - v126;
        }
        int v127 = v115 + v7;
        int v128 = v114 + v7;
        if (v121 < 0)
        {
          int v127 = v125;
          int v128 = v126;
        }
        *(v10 - 1) = v127;
        *int v10 = v128;
        int v9 = v143;
        goto LABEL_162;
      }
      int32x2_t v45 = vsub_s32(*(int32x2_t *)(a2 + 4 * (int)v17 * (int)v150), v11);
      int32x2_t v54 = vabs_s32(vrev64_s32(v45));
      int v47 = v7 - v54.i32[1] - v54.i32[0];
      if (v47 < 0) {
        int32x2_t v45 = (int32x2_t)vbsl_s8((int8x8_t)vcltz_s32(v45), (int8x8_t)vsub_s32(v54, v11), (int8x8_t)__PAIR64__(v7 - v54.i32[1], v7 - v54.i32[0]));
      }
      if (sub_24FF5FDE8((unsigned int *)a1, &v159))
      {
        unsigned int v51 = 0;
        int v15 = v47;
        double v28 = *(double *)&v45;
        goto LABEL_109;
      }
    }
    else
    {
      int32x2_t v45 = vsub_s32(*(int32x2_t *)(a2 + 4 * (int)v17 * (int)v150), v11);
      int32x2_t v46 = vabs_s32(vrev64_s32(v45));
      int v47 = v7 - v46.i32[1] - v46.i32[0];
      if (v47 < 0) {
        int32x2_t v45 = (int32x2_t)vbsl_s8((int8x8_t)vcltz_s32(v45), (int8x8_t)vsub_s32(v46, v11), (int8x8_t)__PAIR64__(v7 - v46.i32[1], v7 - v46.i32[0]));
      }
      int32x2_t v48 = vsub_s32(*(int32x2_t *)(a2 + 4 * (int)v18 * (int)v150), v11);
      int32x2_t v49 = vabs_s32(vrev64_s32(v48));
      int v50 = v7 - v49.i32[1] - v49.i32[0];
      if (v50 < 0) {
        int32x2_t v48 = (int32x2_t)vbsl_s8((int8x8_t)vcltz_s32(v48), (int8x8_t)vsub_s32(v49, v11), (int8x8_t)__PAIR64__(v7 - v49.i32[1], v7 - v49.i32[0]));
      }
      if (sub_24FF5FDE8((unsigned int *)a1, &v159))
      {
        unsigned int v51 = 0;
        uint32x2_t v52 = (uint32x2_t)vsub_s32(v48, (int32x2_t)vmvn_s8((int8x8_t)v45));
        double v28 = COERCE_DOUBLE(vshr_n_s32((int32x2_t)vsra_n_u32(v52, v52, 0x1FuLL), 1uLL));
        if (v47 + v50 + 1 >= 0) {
          int v53 = v47 + v50 + 1;
        }
        else {
          int v53 = v47 + v50 + 2;
        }
        int v15 = v53 >> 1;
        goto LABEL_109;
      }
    }
    double v28 = *(double *)&v146;
    int32x2_t v57 = vzip1_s32(v45, v146);
    unsigned int v51 = 0;
    int32x2_t v58 = vzip2_s32(v45, v146);
    if (v57.i32[0] * (uint64_t)v57.i32[1] + v15 * (uint64_t)v47 + v58.i32[0] * (uint64_t)v58.i32[1] < 0)
    {
      double v28 = COERCE_DOUBLE(vneg_s32(v146));
      int v15 = -v15;
    }
    goto LABEL_109;
  }
LABEL_163:
  unint64_t v129 = 360;
  do
  {
    uint64_t v130 = (char *)v162 + v129;
    uint64_t v131 = *(void **)&v157[v129 / 4];
    if (v131)
    {
      *((void *)v130 - 2) = v131;
      operator delete(v131);
    }
    int v132 = (void *)*((void *)v130 - 6);
    if (v132)
    {
      *(void *)&v153[v129] = v132;
      operator delete(v132);
    }
    uint64_t v133 = (char *)v162 + v129;
    uint64_t v134 = *(void **)((char *)&v162[-4] + v129 - 8);
    if (v134)
    {
      *((void *)v133 - 8) = v134;
      operator delete(v134);
    }
    uint64_t v135 = (void *)*((void *)v133 - 12);
    if (v135)
    {
      *(void *)((char *)&v162[-5] + v129 - 8) = v135;
      operator delete(v135);
    }
    uint64_t v136 = (void *)*((void *)v130 - 15);
    if (v136)
    {
      *(void *)((char *)&v162[-7] + v129) = v136;
      operator delete(v136);
    }
    v129 -= 120;
  }
  while (v129);
}

void sub_24FF60D60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  for (uint64_t i = 240; i != -120; i -= 120)
    sub_24FF60EC8((uint64_t)(&a31 + i));
  _Unwind_Resume(a1);
}

void sub_24FF60D8C(uint64_t a1, int a2)
{
  unint64_t v4 = a2;
  sub_24FF69918(a1, a2);
  sub_24FF69918(a1 + 24, v4);
  sub_24FF69918(a1 + 48, a2 << 6);
  sub_24FF69918(a1 + 72, v4);
  sub_24FF5F2F4(a1 + 96, v4);
  uint64_t v5 = *(void **)(a1 + 96);
  uint64_t v6 = *(void *)(a1 + 104) - (void)v5;
  if (v6 >= 1) {
    memset_pattern16(v5, &unk_24FF7D700, 4 * (((unint64_t)v6 >> 2) - ((unint64_t)v6 > 3)) + 4);
  }
  uint64_t v7 = *(void *)(a1 + 8);
  if (*(void *)a1 != v7) {
    memset_pattern16(*(void **)a1, &unk_24FF7D710, (v7 - *(void *)a1) & 0xFFFFFFFFFFFFFFFELL);
  }
  uint64_t v8 = *(unsigned char **)(a1 + 24);
  int v9 = *(unsigned char **)(a1 + 32);
  if (v8 != v9) {
    memset_pattern16(v8, &unk_24FF7D710, (v9 - v8) & 0xFFFFFFFFFFFFFFFELL);
  }
  int v10 = *(unsigned char **)(a1 + 48);
  int32x2_t v11 = *(unsigned char **)(a1 + 56);
  if (v10 != v11) {
    memset_pattern16(v10, &unk_24FF7D710, (v11 - v10) & 0xFFFFFFFFFFFFFFFELL);
  }
  __int16 v12 = *(unsigned char **)(a1 + 72);
  unsigned int v13 = *(unsigned char **)(a1 + 80);
  if (v12 != v13)
  {
    memset_pattern16(v12, &unk_24FF7D710, (v13 - v12) & 0xFFFFFFFFFFFFFFFELL);
  }
}

uint64_t sub_24FF60EC8(uint64_t a1)
{
  unsigned int v2 = *(void **)(a1 + 96);
  if (v2)
  {
    *(void *)(a1 + 104) = v2;
    operator delete(v2);
  }
  unsigned int v3 = *(void **)(a1 + 72);
  if (v3)
  {
    *(void *)(a1 + 80) = v3;
    operator delete(v3);
  }
  unint64_t v4 = *(void **)(a1 + 48);
  if (v4)
  {
    *(void *)(a1 + 56) = v4;
    operator delete(v4);
  }
  uint64_t v5 = *(void **)(a1 + 24);
  if (v5)
  {
    *(void *)(a1 + 32) = v5;
    operator delete(v5);
  }
  uint64_t v6 = *(void **)a1;
  if (*(void *)a1)
  {
    *(void *)(a1 + 8) = v6;
    operator delete(v6);
  }
  return a1;
}

void sub_24FF60F3C(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t v3 = *(unsigned int *)(a1 + 4004);
  int v4 = *(_DWORD *)(a1 + 4008);
  int v5 = ~(-1 << (*(_DWORD *)(a1 + 4020) - 1));
  int v52 = *(_DWORD *)(a1 + 4032);
  sub_24FF65ECC((void *)(a1 + 1160), (void *)(a1 + 1208), (void *)(a1 + 1184), (uint64_t *)(a1 + 1184), -1431655765 * ((*(void *)(a1 + 1168) - *(void *)(a1 + 1160)) >> 2), (uint64_t *)(a1 + 3968), v5);
  uint64_t v67 = 0;
  long long v66 = 0u;
  *(_OWORD *)__p = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  *(_OWORD *)int32x2_t v63 = 0u;
  *(_OWORD *)int32x2_t v60 = 0u;
  *(_OWORD *)int v61 = 0u;
  sub_24FF60D8C((uint64_t)v60, v4);
  __int16 v59 = 0x8000;
  if ((int)v3 >= 1)
  {
    uint64_t v6 = 0;
    int v48 = 2 * v5;
    uint64_t v50 = 12 * v3;
    int v51 = v4;
    uint64_t v7 = a3;
    uint64_t v8 = (int *)(a2 + 4);
    uint64_t v49 = 4 * v4;
    while (v52 && !*v7)
    {
LABEL_83:
      v6 += 12;
      uint64_t v8 = (int *)((char *)v8 + v49);
      ++v7;
      if (v50 == v6) {
        goto LABEL_84;
      }
    }
    int v9 = (int *)(*(void *)(a1 + 3968) + v6);
    int v10 = *v9;
    int v11 = v9[1];
    int v12 = v9[2];
    uint64_t v13 = *(int *)(*(void *)(a1 + 1256) + v6);
    if (v13 == -1 || v52 && !a3[v13])
    {
      if (sub_24FF5FDE8((unsigned int *)a1, &v59))
      {
        int v10 = -v10;
        int v11 = -v11;
        int v12 = -v12;
      }
    }
    else
    {
      int32x2_t v14 = (_DWORD *)(a2 + 4 * (int)v13 * v51);
      int v15 = *v14 - v5;
      int v16 = v14[1] - v5;
      if (v15 >= 0) {
        int v17 = v15;
      }
      else {
        int v17 = -v15;
      }
      if (v16 >= 0) {
        int v18 = v16;
      }
      else {
        int v18 = -v16;
      }
      int v19 = v5 - v17;
      int v20 = v18 - v5;
      if (v15 >= 0) {
        int v20 = v5 - v18;
      }
      int v21 = v17 - v5;
      if (v16 >= 0) {
        int v21 = v19;
      }
      int v22 = v19 - v18;
      if (v22 < 0)
      {
        int v15 = v20;
        int v16 = v21;
      }
      if (v12 * (uint64_t)v22 + v10 * (uint64_t)v15 + v11 * (uint64_t)v16 < 0)
      {
        int v10 = -v10;
        int v11 = -v11;
        int v12 = -v12;
      }
    }
    if (v10 >= 0) {
      unsigned int v23 = v10;
    }
    else {
      unsigned int v23 = -v10;
    }
    if (v11 >= 0) {
      unsigned int v24 = v11;
    }
    else {
      unsigned int v24 = -v11;
    }
    if (v12 >= 0) {
      unsigned int v25 = v12;
    }
    else {
      unsigned int v25 = -v12;
    }
    BOOL v27 = v23 < v24 || v23 < v25;
    if (v27)
    {
      unsigned int v23 = v25;
      int v28 = v11;
      int v29 = v10;
      if (v24 < v25)
      {
LABEL_44:
        v58[0] = v29;
        v58[1] = v28;
        v58[2] = v23;
        sub_24FF5F900((unsigned int *)a1, (uint64_t)v58, v51, (void *)(a1 + 3920), (unsigned char *)(a1 + 4044), v60, (uint64_t)&v54);
        int v31 = v54;
        int v32 = v55;
        if (v54 >= 0) {
          int v33 = v54;
        }
        else {
          int v33 = -v54;
        }
        if (v55 >= 0) {
          int v34 = v55;
        }
        else {
          int v34 = -v55;
        }
        int v35 = v5 - v33;
        int v36 = v5 - v33 - v34;
        if (v36 < 0)
        {
          int v37 = v5 - v34;
          int v38 = v34 - v5;
          if (v54 >= 0) {
            int v31 = v37;
          }
          else {
            int v31 = v38;
          }
          int v39 = v33 - v5;
          if (v55 >= 0) {
            int v32 = v35;
          }
          else {
            int v32 = v39;
          }
        }
        int v40 = -v36;
        if (v12 >= 0) {
          int v41 = v36;
        }
        else {
          int v41 = -v36;
        }
        if (v11 >= 0) {
          int v40 = v36;
        }
        if (v24 < v25) {
          int v40 = v32;
        }
        else {
          int v41 = v32;
        }
        if (v10 < 0) {
          int v36 = -v36;
        }
        if (v27) {
          int v32 = v40;
        }
        else {
          int v41 = v31;
        }
        if (!v27) {
          int v31 = v36;
        }
        if (v32 >= 0) {
          int v42 = v32;
        }
        else {
          int v42 = -v32;
        }
        if (v31 < 0)
        {
          int v43 = -v31;
        }
        else
        {
          int v42 = v48 - v42;
          int v43 = v31;
        }
        if (v32 >= 0) {
          int v43 = v48 - v43;
        }
        int v44 = v31 + v5;
        int v45 = v32 + v5;
        if (v41 < 0)
        {
          int v44 = v42;
          int v45 = v43;
        }
        *(v8 - 1) = v44;
        *uint64_t v8 = v45;
        goto LABEL_83;
      }
      int32x2_t v30 = &v56;
      unsigned int v23 = v24;
      int v28 = v12;
      int v29 = v10;
    }
    else
    {
      int32x2_t v30 = &v57;
      int v28 = v11;
      int v29 = v12;
    }
    *(_DWORD *)int32x2_t v30 = v12;
    goto LABEL_44;
  }
LABEL_84:
  if ((void)v66)
  {
    *((void *)&v66 + 1) = v66;
    operator delete((void *)v66);
  }
  if (__p[1])
  {
    *(void **)&long long v65 = __p[1];
    operator delete(__p[1]);
  }
  if (v63[0])
  {
    v63[1] = v63[0];
    operator delete(v63[0]);
  }
  if (v61[1])
  {
    *(void **)&long long v62 = v61[1];
    operator delete(v61[1]);
  }
  if (v60[0])
  {
    v60[1] = v60[0];
    operator delete(v60[0]);
  }
}

void sub_24FF612EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  sub_24FF60EC8((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_24FF61304(_DWORD *a1, uint64_t a2, uint64_t a3)
{
  int v5 = a1;
  uint64_t v6 = 0;
  uint64_t v141 = *MEMORY[0x263EF8340];
  uint64_t v132 = a1[1001];
  unint64_t v7 = (int)a1[1002];
  unint64_t v129 = a1 + 980;
  int v8 = a1[1008];
  uint64_t v9 = a1[1002];
  uint64_t v140 = 0;
  memset(v139, 0, sizeof(v139));
  do
  {
    sub_24FF60D8C((uint64_t)v139 + v6, v7);
    v6 += 120;
  }
  while (v6 != 360);
  __int16 v138 = 0x8000;
  memset_pattern16(__b, &unk_24FF7D710, 6uLL);
  memset_pattern16(v136, &unk_24FF7D710, 6uLL);
  LODWORD(__p[0]) = 0;
  sub_24FF6A454(v135, v7, __p);
  int v133 = 0;
  sub_24FF6A454(__p, v7, &v133);
  if ((int)v132 >= 1)
  {
    uint64_t v10 = 0;
    int v11 = v5 + 1011;
    uint64_t v124 = 4 * v9;
    uint64_t v126 = a3;
    uint64_t v127 = a2;
    int v128 = v5;
    unint64_t v130 = v7;
    uint64_t v131 = v7;
    int v125 = v8;
    int v119 = v5 + 1011;
    while (1)
    {
      if (v8 && !*(unsigned char *)(a3 + v10)) {
        goto LABEL_106;
      }
      int v12 = (int *)(*((void *)v5 + 157) + 12 * v10);
      uint64_t v14 = *v12;
      uint64_t v13 = v12[1];
      uint64_t v15 = v12[2];
      int v16 = (int *)(*((void *)v5 + 160) + 12 * v10);
      uint64_t v17 = v16[2];
      if (v17 == -1
        || v8
        && (!*(unsigned char *)(a3 + v14)
         || !*(unsigned char *)(a3 + v13)
         || !*(unsigned char *)(a3 + v15)
         || !*(unsigned char *)(a3 + *v16)
         || !*(unsigned char *)(a3 + v16[1])
         || !*(unsigned char *)(a3 + v17)))
      {
        break;
      }
      int v120 = *v16;
      int v121 = v16[1];
      int v118 = v14;
      int v18 = v5;
      int v19 = (int *)(a2 + 4 * (int)v14 * (int)v7);
      int v122 = v13;
      int v20 = (int *)(a2 + 4 * (int)v13 * (int)v131);
      int v21 = (int *)(a2 + 4 * (int)v15 * (int)v7);
      BOOL v22 = sub_24FF5FDE8(v18, v136);
      uint64_t v23 = 2;
      if (!v22) {
        uint64_t v23 = 1;
      }
      if (sub_24FF5FDE8(v18, &v136[v23])) {
        int v24 = 2;
      }
      else {
        int v24 = 0;
      }
      int v25 = v24 | v22;
      if (v25)
      {
        int v26 = (int *)(a2 + 4 * v120 * (int)v131);
        BOOL v27 = (int *)(a2 + 4 * v121 * (int)v130);
        int v28 = (int *)(a2 + 4 * (int)v17 * (int)v131);
        if (v25 == 2)
        {
          sub_24FF56E70(v19, v20, v21, v131, (int *)(*((void *)v128 + 145) + 12 * v118), (int *)(*((void *)v128 + 145) + 12 * v122), (int *)(*((void *)v128 + 145) + 12 * (int)v15), (int *)(*((void *)v128 + 145) + 12 * v10), (_DWORD *)v135[0]);
          sub_24FF56E70(v26, v27, v28, v130, (int *)(*((void *)v128 + 145) + 12 * v120), (int *)(*((void *)v128 + 145) + 12 * v121), (int *)(*((void *)v128 + 145) + 12 * (int)v17), (int *)(*((void *)v128 + 145) + 12 * v10), (_DWORD *)__p[0]);
          int v29 = v131;
          if ((int)v131 >= 1)
          {
            __int32 v77 = (int *)v135[0];
            double v78 = (int *)__p[0];
            uint64_t v79 = v131;
            int v11 = v119;
            do
            {
              int v80 = *v78++;
              int v81 = v80 + *v77;
              if (v81 < 0 != __OFADD__(v80, *v77)) {
                ++v81;
              }
              *v77++ = v81 >> 1;
              --v79;
            }
            while (v79);
            goto LABEL_104;
          }
LABEL_92:
          unsigned int v59 = 2;
          goto LABEL_93;
        }
        if (v25 == 1)
        {
          int v29 = v131;
          int v11 = v119;
          if ((int)v131 >= 1)
          {
            int32x2_t v30 = v135[0];
            uint64_t v31 = v131;
            do
            {
              int v33 = *v26++;
              int v32 = v33;
              int v34 = *v27++;
              int v35 = v34 + v32;
              int v36 = *v28++;
              *v30++ = v35 - v36;
              --v31;
            }
            while (v31);
          }
          goto LABEL_104;
        }
        int v29 = v131;
        if (v131 != 2)
        {
          int v11 = v119;
          if ((int)v130 >= 1)
          {
            unint64_t v97 = 0;
            int64x2_t v98 = (char *)v135[0];
            do
            {
              int v99 = v19[v97 / 4];
              int v100 = v26[v97 / 4];
              BOOL v68 = __OFADD__(v100, v99);
              int v101 = v100 + v99;
              if (v101 < 0 != v68) {
                ++v101;
              }
              unint64_t v102 = 1431655766 * ((v101 >> 1) - (v21[v97 / 4] + v28[v97 / 4]) + 2 * (v27[v97 / 4] + v20[v97 / 4]));
              *(_DWORD *)&v98[v97] = HIDWORD(v102) + (v102 >> 63);
              v97 += 4;
              unsigned int v59 = 2;
            }
            while (v124 != v97);
            goto LABEL_105;
          }
          goto LABEL_104;
        }
        sub_24FF5756C((unint64_t)v19, v20, v21, (_DWORD *)(*((void *)v128 + 145) + 12 * v118), (_DWORD *)(*((void *)v128 + 145) + 12 * v122), (int *)(*((void *)v128 + 145) + 12 * v10), (int *)v135[0]);
        sub_24FF5756C((unint64_t)v26, v27, v28, (_DWORD *)(*((void *)v128 + 145) + 12 * v120), (_DWORD *)(*((void *)v128 + 145) + 12 * v121), (int *)(*((void *)v128 + 145) + 12 * v10), (int *)__p[0]);
        __int32 v82 = v135[0];
        __int32 v83 = __p[0];
        int v84 = *((_DWORD *)v135[0] + 1);
        int v85 = *(_DWORD *)__p[0] + *(_DWORD *)v135[0];
        if (v85 < 0 != __OFADD__(*(_DWORD *)__p[0], *(_DWORD *)v135[0])) {
          ++v85;
        }
        *(_DWORD *)v135[0] = v85 >> 1;
        int v86 = v83[1];
        BOOL v68 = __OFADD__(v86, v84);
        int v87 = v86 + v84;
        if (v87 < 0 != v68) {
          ++v87;
        }
        v82[1] = v87 >> 1;
      }
      else if ((int)v130 >= 1)
      {
        int32x2_t v70 = v135[0];
        int v29 = v131;
        uint64_t v71 = v131;
        int v11 = v119;
        do
        {
          int v73 = *v19++;
          int v72 = v73;
          int v74 = *v20++;
          int v75 = v74 + v72;
          int v76 = *v21++;
          *v70++ = v75 - v76;
          --v71;
        }
        while (v71);
LABEL_104:
        unsigned int v59 = 2;
        goto LABEL_105;
      }
      unsigned int v59 = 2;
      int v29 = v131;
LABEL_93:
      int v11 = v119;
LABEL_105:
      unint64_t v7 = v130;
      a2 = v127;
      int v5 = v128;
      sub_24FF5F900(v128, (uint64_t)v135[0], v29, v129, v11, (void *)v139 + 15 * v59, v127 + 4 * v10 * v130);
      a3 = v126;
      int v8 = v125;
LABEL_106:
      if (++v10 == v132) {
        goto LABEL_107;
      }
    }
    if (v15 == -1 || v8 && (!*(unsigned char *)(a3 + v14) || !*(unsigned char *)(a3 + v13) || !*(unsigned char *)(a3 + v15)))
    {
      int v29 = v131;
      if (v13 == -1 || v8 && (!*(unsigned char *)(a3 + v14) || !*(unsigned char *)(a3 + v13)))
      {
        if (v14 == -1 || v8 && !*(unsigned char *)(a3 + v14))
        {
          int32x2_t v60 = v135[0];
          if ((int)v7 >= 1) {
            bzero(v135[0], v124);
          }
          LOBYTE(v133) = 3;
          sub_24FF5F900(v5, (uint64_t)v60, v7, v129, &v133, 0, a2 + 4 * v10 * v7);
          goto LABEL_106;
        }
        if ((int)v131 >= 1)
        {
          int v55 = (int *)(a2 + 4 * (int)v14 * (int)v131);
          char v56 = v135[0];
          uint64_t v57 = v131;
          do
          {
            int v58 = *v55++;
            *v56++ = v58;
            --v57;
          }
          while (v57);
        }
        unsigned int v59 = 0;
      }
      else
      {
        int v53 = v13;
        if (v7 == 2)
        {
          BOOL v54 = sub_24FF5FDE8(v5, &v138);
          sub_24FF57350((int *)(a2 + 8 * v14), (int *)(a2 + 8 * v53), (_DWORD *)(*((void *)v5 + 145) + 12 * (int)v14), (_DWORD *)(*((void *)v5 + 145) + 12 * v53), (int *)(*((void *)v5 + 145) + 12 * v10), v54, (int *)v135[0]);
        }
        else if ((int)v7 >= 1)
        {
          int v61 = (int *)(a2 + 4 * (int)v14 * (int)v131);
          long long v62 = (int *)(a2 + 4 * (int)v13 * (int)v7);
          int32x2_t v63 = (int *)v135[0];
          uint64_t v64 = v131;
          do
          {
            int v66 = *v61++;
            int v65 = v66;
            int v67 = *v62++;
            BOOL v68 = __OFADD__(v67, v65);
            int v69 = v67 + v65;
            if (v69 < 0 != v68) {
              ++v69;
            }
            *v63++ = v69 >> 1;
            --v64;
          }
          while (v64);
        }
        unsigned int v59 = 1;
      }
      goto LABEL_105;
    }
    uint64_t v37 = v14;
    int v38 = (int *)(a2 + 4 * (int)v14 * (int)v7);
    int v29 = v131;
    uint64_t v123 = v13;
    uint64_t v39 = a2;
    int v40 = (int *)(a2 + 4 * (int)v13 * (int)v131);
    int v41 = (int *)(v39 + 4 * (int)v15 * (int)v7);
    BOOL v42 = sub_24FF5FDE8(v5, __b);
    uint64_t v43 = 2;
    if (!v42) {
      uint64_t v43 = 1;
    }
    if (sub_24FF5FDE8(v5, &__b[v43])) {
      int v44 = 2;
    }
    else {
      int v44 = 0;
    }
    int v45 = v44 | v42;
    if (v45 == 2)
    {
      sub_24FF56E70(v38, v40, v41, v130, (int *)(*((void *)v5 + 145) + 12 * (int)v37), (int *)(*((void *)v5 + 145) + 12 * (int)v123), (int *)(*((void *)v5 + 145) + 12 * (int)v15), (int *)(*((void *)v5 + 145) + 12 * v10), (_DWORD *)v135[0]);
      int v11 = v119;
      if ((int)v130 >= 1)
      {
        int v88 = (int *)v135[0];
        uint64_t v89 = v131;
        do
        {
          int v91 = *v38++;
          int v90 = v91;
          int v92 = *v40++;
          int v93 = v92 + v90;
          int v94 = *v41++;
          int v95 = v93 - v94;
          BOOL v68 = __OFADD__(v95, *v88);
          int v96 = v95 + *v88;
          if (v96 < 0 != v68) {
            ++v96;
          }
          *v88++ = v96 >> 1;
          --v89;
        }
        while (v89);
      }
      goto LABEL_104;
    }
    if (v45 == 1)
    {
      sub_24FF56E70(v38, v40, v41, v131, (int *)(*((void *)v5 + 145) + 12 * (int)v37), (int *)(*((void *)v5 + 145) + 12 * (int)v123), (int *)(*((void *)v5 + 145) + 12 * (int)v15), (int *)(*((void *)v5 + 145) + 12 * v10), (_DWORD *)v135[0]);
    }
    else if (v45)
    {
      if (v131 != 2)
      {
        int v11 = v119;
        if ((int)v131 >= 1)
        {
          int v103 = v135[0];
          uint64_t v104 = v131;
          do
          {
            int v106 = *v38++;
            int v105 = v106;
            int v108 = *v40++;
            int v107 = v108;
            int v109 = *v41++;
            *v103++ = v107 + v105 - v109;
            unsigned int v59 = 2;
            --v104;
          }
          while (v104);
          goto LABEL_105;
        }
        goto LABEL_104;
      }
      sub_24FF5756C(v127 + 8 * v37, (int *)(v127 + 8 * v123), (int *)(v127 + 8 * v15), (_DWORD *)(*((void *)v5 + 145) + 12 * (int)v37), (_DWORD *)(*((void *)v5 + 145) + 12 * (int)v123), (int *)(*((void *)v5 + 145) + 12 * v10), (int *)v135[0]);
    }
    else if ((int)v131 >= 1)
    {
      int32x2_t v46 = v135[0];
      uint64_t v47 = v131;
      int v11 = v119;
      do
      {
        int v49 = *v38++;
        int v48 = v49;
        int v50 = *v40++;
        int v51 = v50 + v48;
        int v52 = *v41++;
        *v46++ = v51 - v52;
        --v47;
      }
      while (v47);
      goto LABEL_104;
    }
    goto LABEL_92;
  }
LABEL_107:
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if (v135[0])
  {
    v135[1] = v135[0];
    operator delete(v135[0]);
  }
  unint64_t v110 = 360;
  do
  {
    int v111 = (char *)v139 + v110;
    int v112 = v135[v110 / 8 + 2];
    if (v112)
    {
      *((void *)v111 - 2) = v112;
      operator delete(v112);
    }
    int v113 = (void *)*((void *)v111 - 6);
    if (v113)
    {
      v135[v110 / 8] = v113;
      operator delete(v113);
    }
    int v114 = (char *)v139 + v110;
    int v115 = *(void **)((char *)&v139[-4] + v110 - 8);
    if (v115)
    {
      *((void *)v114 - 8) = v115;
      operator delete(v115);
    }
    int v116 = (void *)*((void *)v114 - 12);
    if (v116)
    {
      *(void *)((char *)&v139[-5] + v110 - 8) = v116;
      operator delete(v116);
    }
    int v117 = (void *)*((void *)v111 - 15);
    if (v117)
    {
      *(void *)((char *)&v139[-7] + v110) = v117;
      operator delete(v117);
    }
    v110 -= 120;
  }
  while (v110);
}

void sub_24FF61C30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *a25,uint64_t a26,uint64_t a27,void *__p,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  if (__p) {
    operator delete(__p);
  }
  for (uint64_t i = 240; i != -120; i -= 120)
    sub_24FF60EC8((uint64_t)(&a33 + i));
  _Unwind_Resume(a1);
}

void sub_24FF61C9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = 0;
  uint64_t v59 = *MEMORY[0x263EF8340];
  uint64_t v51 = *(unsigned int *)(a1 + 4004);
  unint64_t v6 = *(int *)(a1 + 4008);
  int v48 = (void *)(a1 + 3920);
  int v49 = *(_DWORD *)(a1 + 4032);
  uint64_t v7 = *(unsigned int *)(a1 + 4008);
  uint64_t v58 = 0;
  memset(v57, 0, sizeof(v57));
  do
  {
    sub_24FF60D8C((uint64_t)v57 + v5, v6);
    v5 += 120;
  }
  while (v5 != 360);
  __int16 v56 = 0x8000;
  LODWORD(__p[0]) = 0;
  sub_24FF6A454(&v54, v6, __p);
  int v52 = 0;
  sub_24FF6A454(__p, v6, &v52);
  uint64_t v8 = a3;
  int v9 = v49;
  if ((int)v51 >= 1)
  {
    for (uint64_t i = 0; i != v51; ++i)
    {
      if (v9 && !*(unsigned char *)(v8 + i)) {
        continue;
      }
      int v11 = (int *)(*(void *)(a1 + 1256) + 12 * i);
      uint64_t v12 = *v11;
      uint64_t v13 = v11[1];
      uint64_t v14 = v11[2];
      uint64_t v15 = (int *)(*(void *)(a1 + 1280) + 12 * i);
      uint64_t v16 = v15[2];
      if (v16 != -1
        && ((v17 = *v15, uint64_t v18 = v15[1], !v9)
         || *(unsigned char *)(v8 + v12)
         && *(unsigned char *)(v8 + v13)
         && *(unsigned char *)(v8 + v14)
         && *(unsigned char *)(v8 + v17)
         && *(unsigned char *)(v8 + v18)
         && *(unsigned char *)(v8 + v16)))
      {
        sub_24FF56E70((int *)(a2 + 4 * (int)v12 * (int)v6), (int *)(a2 + 4 * (int)v13 * (int)v7), (int *)(a2 + 4 * (int)v14 * (int)v6), v6, (int *)(*(void *)(a1 + 1160) + 12 * (int)v12), (int *)(*(void *)(a1 + 1160) + 12 * (int)v13), (int *)(*(void *)(a1 + 1160) + 12 * (int)v14), (int *)(*(void *)(a1 + 1160) + 12 * i), v54);
        sub_24FF56E70((int *)(a2 + 4 * (int)v17 * (int)v6), (int *)(a2 + 4 * (int)v18 * (int)v6), (int *)(a2 + 4 * (int)v16 * (int)v6), v6, (int *)(*(void *)(a1 + 1160) + 12 * (int)v17), (int *)(*(void *)(a1 + 1160) + 12 * (int)v18), (int *)(*(void *)(a1 + 1160) + 12 * (int)v16), (int *)(*(void *)(a1 + 1160) + 12 * i), (_DWORD *)__p[0]);
        if ((int)v7 >= 1)
        {
          int v19 = (int *)v54;
          int v20 = (int *)__p[0];
          uint64_t v21 = v6;
          do
          {
            int v22 = *v20++;
            int v23 = v22 + *v19;
            if (v23 < 0 != __OFADD__(v22, *v19)) {
              ++v23;
            }
            *v19++ = v23 >> 1;
            --v21;
          }
          while (v21);
        }
      }
      else
      {
        if (v14 == -1 || v9 && (!*(unsigned char *)(v8 + v12) || !*(unsigned char *)(v8 + v13) || !*(unsigned char *)(v8 + v14)))
        {
          if (v13 == -1 || v9 && (!*(unsigned char *)(v8 + v12) || !*(unsigned char *)(v8 + v13)))
          {
            if (v12 == -1 || v9 && !*(unsigned char *)(v8 + v12))
            {
              int32x2_t v30 = v54;
              if ((int)v6 >= 1) {
                bzero(v54, 4 * v7);
              }
              LOBYTE(v52) = 3;
              sub_24FF5F900((unsigned int *)a1, (uint64_t)v30, v6, v48, &v52, 0, a2 + 4 * i * v6);
              uint64_t v8 = a3;
              int v9 = v49;
              continue;
            }
            if ((int)v7 >= 1)
            {
              int v26 = (int *)(a2 + 4 * (int)v12 * (int)v6);
              BOOL v27 = v54;
              uint64_t v28 = v6;
              do
              {
                int v29 = *v26++;
                *v27++ = v29;
                --v28;
              }
              while (v28);
            }
            unsigned int v24 = 0;
          }
          else
          {
            if (v7 == 2)
            {
              BOOL v25 = sub_24FF5FDE8((unsigned int *)a1, &v56);
              sub_24FF57350((int *)(a2 + 8 * v12), (int *)(a2 + 8 * v13), (_DWORD *)(*(void *)(a1 + 1160) + 12 * (int)v12), (_DWORD *)(*(void *)(a1 + 1160) + 12 * (int)v13), (int *)(*(void *)(a1 + 1160) + 12 * i), v25, (int *)v54);
            }
            else if ((int)v6 >= 1)
            {
              uint64_t v31 = (int *)(a2 + 4 * (int)v12 * (int)v6);
              int v32 = (int *)(a2 + 4 * (int)v13 * (int)v6);
              int v33 = (int *)v54;
              uint64_t v34 = v6;
              do
              {
                int v36 = *v31++;
                int v35 = v36;
                int v37 = *v32++;
                BOOL v38 = __OFADD__(v37, v35);
                int v39 = v37 + v35;
                if (v39 < 0 != v38) {
                  ++v39;
                }
                *v33++ = v39 >> 1;
                --v34;
              }
              while (v34);
            }
            unsigned int v24 = 1;
          }
          goto LABEL_50;
        }
        sub_24FF56E70((int *)(a2 + 4 * (int)v12 * (int)v6), (int *)(a2 + 4 * (int)v13 * (int)v7), (int *)(a2 + 4 * (int)v14 * (int)v6), v6, (int *)(*(void *)(a1 + 1160) + 12 * (int)v12), (int *)(*(void *)(a1 + 1160) + 12 * (int)v13), (int *)(*(void *)(a1 + 1160) + 12 * (int)v14), (int *)(*(void *)(a1 + 1160) + 12 * i), v54);
      }
      unsigned int v24 = 2;
LABEL_50:
      sub_24FF5F900((unsigned int *)a1, (uint64_t)v54, v6, v48, (unsigned char *)(a1 + 4044), (void *)v57 + 15 * v24, a2 + 4 * i * v6);
      uint64_t v8 = a3;
      int v9 = v49;
    }
  }
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if (v54)
  {
    v55[0] = v54;
    operator delete(v54);
  }
  unint64_t v40 = 360;
  do
  {
    int v41 = (char *)v57 + v40;
    BOOL v42 = (void *)v55[v40 / 8];
    if (v42)
    {
      *((void *)v41 - 2) = v42;
      operator delete(v42);
    }
    uint64_t v43 = (void *)*((void *)v41 - 6);
    if (v43)
    {
      __p[v40 / 8 + 2] = v43;
      operator delete(v43);
    }
    int v44 = (char *)v57 + v40;
    int v45 = *(void **)((char *)&v57[-4] + v40 - 8);
    if (v45)
    {
      *((void *)v44 - 8) = v45;
      operator delete(v45);
    }
    int32x2_t v46 = (void *)*((void *)v44 - 12);
    if (v46)
    {
      *(void *)((char *)&v57[-5] + v40 - 8) = v46;
      operator delete(v46);
    }
    uint64_t v47 = (void *)*((void *)v41 - 15);
    if (v47)
    {
      *(void *)((char *)&v57[-7] + v40) = v47;
      operator delete(v47);
    }
    v40 -= 120;
  }
  while (v40);
}

void sub_24FF62184(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, uint64_t a20,void *__p,uint64_t a22,uint64_t a23,uint64_t a24,char a25)
{
  if (__p) {
    operator delete(__p);
  }
  for (uint64_t i = 240; i != -120; i -= 120)
    sub_24FF60EC8((uint64_t)(&a25 + i));
  _Unwind_Resume(a1);
}

void sub_24FF621EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = 0;
  uint64_t v80 = *MEMORY[0x263EF8340];
  uint64_t v6 = *(unsigned int *)(a1 + 4004);
  int32x2_t v70 = (void *)(a1 + 3920);
  unint64_t v72 = *(int *)(a1 + 4008);
  int v71 = *(_DWORD *)(a1 + 4032);
  uint64_t v7 = *(unsigned int *)(a1 + 4008);
  uint64_t v79 = 0;
  memset(v78, 0, sizeof(v78));
  do
  {
    sub_24FF60D8C((uint64_t)v78 + v5, v7);
    v5 += 120;
  }
  while (v5 != 360);
  memset_pattern16(__b, &unk_24FF7D710, 6uLL);
  int v74 = 0;
  sub_24FF6A454(&__p, v72, &v74);
  int v8 = v71;
  if ((int)v6 >= 1)
  {
    uint64_t v9 = 0;
    uint64_t v68 = a3;
    uint64_t v10 = 4 * v7;
    uint64_t v65 = v6;
    uint64_t v69 = a2;
    do
    {
      if (v8 && !*(unsigned char *)(a3 + v9)) {
        goto LABEL_77;
      }
      int v11 = (int *)(*(void *)(a1 + 1256) + 12 * v9);
      uint64_t v13 = *v11;
      uint64_t v12 = v11[1];
      uint64_t v14 = v11[2];
      uint64_t v15 = (int *)(*(void *)(a1 + 1280) + 12 * v9);
      uint64_t v16 = v15[2];
      if (v16 != -1
        && (!v8
         || *(unsigned char *)(a3 + v13)
         && *(unsigned char *)(a3 + v12)
         && *(unsigned char *)(a3 + v14)
         && *(unsigned char *)(a3 + *v15)
         && *(unsigned char *)(a3 + v15[1])
         && *(unsigned char *)(a3 + v16)))
      {
        int v66 = *v15;
        int v67 = v15[1];
        BOOL v17 = sub_24FF5FDE8((unsigned int *)a1, __b);
        uint64_t v18 = 2;
        if (!v17) {
          uint64_t v18 = 1;
        }
        if (sub_24FF5FDE8((unsigned int *)a1, &__b[v18])) {
          int v19 = 2;
        }
        else {
          int v19 = 0;
        }
        unint64_t v20 = v72;
        int v21 = v13 * v72;
        uint64_t v22 = v69;
        uint64_t v23 = v69 + 4 * v21;
        uint64_t v24 = v69 + 4 * (int)v12 * (int)v7;
        uint64_t v25 = v69 + 4 * (int)v14 * (int)v72;
        int v26 = v19 | v17;
        if (v19 | v17)
        {
          uint64_t v27 = v69 + 4 * v66 * (int)v7;
          uint64_t v28 = v69 + 4 * v67 * (int)v72;
          uint64_t v29 = v69 + 4 * (int)v16 * (int)v7;
          if (v26 == 1)
          {
            int32x2_t v30 = (char *)__p;
            a3 = v68;
            uint64_t v6 = v65;
            if ((int)v7 >= 1)
            {
              uint64_t v51 = 0;
              do
              {
                *(_DWORD *)&v30[v51] = *(_DWORD *)(v28 + v51) + *(_DWORD *)(v27 + v51) - *(_DWORD *)(v29 + v51);
                v51 += 4;
              }
              while (v10 != v51);
            }
          }
          else
          {
            a3 = v68;
            uint64_t v6 = v65;
            if (v26 == 2)
            {
              int32x2_t v30 = (char *)__p;
              if ((int)v7 >= 1)
              {
                uint64_t v31 = 0;
                do
                {
                  int v32 = *(_DWORD *)(v23 + v31);
                  int v33 = *(_DWORD *)(v27 + v31);
                  BOOL v34 = __OFADD__(v33, v32);
                  int v35 = v33 + v32;
                  if (v35 < 0 != v34) {
                    ++v35;
                  }
                  *(_DWORD *)&v30[v31] = *(_DWORD *)(v28 + v31) + *(_DWORD *)(v24 + v31) - (v35 >> 1);
                  v31 += 4;
                }
                while (v10 != v31);
              }
            }
            else
            {
              int32x2_t v30 = (char *)__p;
              if ((int)v7 >= 1)
              {
                uint64_t v52 = 0;
                do
                {
                  int v53 = *(_DWORD *)(v23 + v52);
                  int v54 = *(_DWORD *)(v27 + v52);
                  BOOL v34 = __OFADD__(v54, v53);
                  int v55 = v54 + v53;
                  if (v55 < 0 != v34) {
                    ++v55;
                  }
                  unint64_t v56 = 1431655766
                      * ((v55 >> 1)
                       - (*(_DWORD *)(v25 + v52)
                        + *(_DWORD *)(v29 + v52))
                       + 2 * (*(_DWORD *)(v28 + v52) + *(_DWORD *)(v24 + v52)));
                  *(_DWORD *)&v30[v52] = HIDWORD(v56) + (v56 >> 63);
                  v52 += 4;
                }
                while (v10 != v52);
              }
            }
          }
        }
        else
        {
          int32x2_t v30 = (char *)__p;
          if ((int)v72 < 1)
          {
            unsigned int v45 = 2;
            a3 = v68;
            uint64_t v6 = v65;
            goto LABEL_76;
          }
          uint64_t v50 = 0;
          a3 = v68;
          uint64_t v6 = v65;
          do
          {
            *(_DWORD *)&v30[v50] = *(_DWORD *)(v24 + v50) + *(_DWORD *)(v23 + v50) - *(_DWORD *)(v25 + v50);
            v50 += 4;
          }
          while (v10 != v50);
        }
      }
      else
      {
        if (v14 == -1 || v8 && (!*(unsigned char *)(a3 + v13) || !*(unsigned char *)(a3 + v12) || !*(unsigned char *)(a3 + v14)))
        {
          unint64_t v20 = v72;
          if (v12 == -1 || v8 && (!*(unsigned char *)(a3 + v13) || !*(unsigned char *)(a3 + v12)))
          {
            if (v13 == -1 || v8 && !*(unsigned char *)(a3 + v13))
            {
              int v49 = __p;
              if ((int)v7 >= 1)
              {
                bzero(__p, 4 * v7);
                unint64_t v20 = v72;
              }
              LOBYTE(v74) = 3;
              sub_24FF5F900((unsigned int *)a1, (uint64_t)v49, v20, v70, &v74, 0, v69 + 4 * v9 * v20);
              a3 = v68;
              int v8 = v71;
              goto LABEL_77;
            }
            int32x2_t v30 = (char *)__p;
            if ((int)v72 >= 1)
            {
              uint64_t v46 = 0;
              int v47 = v13 * v7;
              uint64_t v22 = v69;
              uint64_t v48 = v69 + 4 * v47;
              do
              {
                *(_DWORD *)&v30[v46] = *(_DWORD *)(v48 + v46);
                v46 += 4;
              }
              while (v10 != v46);
              unsigned int v45 = 0;
              goto LABEL_76;
            }
            unsigned int v45 = 0;
          }
          else
          {
            int32x2_t v30 = (char *)__p;
            if ((int)v7 >= 1)
            {
              uint64_t v39 = 0;
              int v40 = v13 * v7;
              uint64_t v22 = v69;
              uint64_t v41 = v69 + 4 * v40;
              do
              {
                int v42 = *(_DWORD *)(v41 + v39);
                int v43 = *(_DWORD *)(v69 + 4 * (int)v12 * (int)v72 + v39);
                BOOL v34 = __OFADD__(v43, v42);
                int v44 = v43 + v42;
                if (v44 < 0 != v34) {
                  ++v44;
                }
                *(_DWORD *)&v30[v39] = v44 >> 1;
                v39 += 4;
              }
              while (v10 != v39);
              unsigned int v45 = 1;
              goto LABEL_76;
            }
            unsigned int v45 = 1;
          }
          goto LABEL_75;
        }
        int32x2_t v30 = (char *)__p;
        unint64_t v20 = v72;
        if ((int)v72 < 1)
        {
          unsigned int v45 = 2;
LABEL_75:
          uint64_t v22 = v69;
          goto LABEL_76;
        }
        uint64_t v36 = 0;
        int v37 = v13 * v72;
        uint64_t v22 = v69;
        uint64_t v38 = v69 + 4 * v37;
        do
        {
          *(_DWORD *)&v30[v36] = *(_DWORD *)(v69 + 4 * (int)v12 * (int)v7 + v36)
                               + *(_DWORD *)(v38 + v36)
                               - *(_DWORD *)(v69 + 4 * (int)v14 * (int)v72 + v36);
          v36 += 4;
        }
        while (v10 != v36);
      }
      unsigned int v45 = 2;
LABEL_76:
      sub_24FF5F900((unsigned int *)a1, (uint64_t)v30, v20, v70, (unsigned char *)(a1 + 4044), (void *)v78 + 15 * v45, v22 + 4 * v9 * v20);
      int v8 = v71;
LABEL_77:
      ++v9;
    }
    while (v9 != v6);
  }
  if (__p)
  {
    v76[0] = __p;
    operator delete(__p);
  }
  unint64_t v57 = 360;
  do
  {
    uint64_t v58 = (char *)v78 + v57;
    uint64_t v59 = (void *)v76[v57 / 8];
    if (v59)
    {
      *((void *)v58 - 2) = v59;
      operator delete(v59);
    }
    int32x2_t v60 = (void *)*((void *)v58 - 6);
    if (v60)
    {
      *(void *)((char *)&v78[-2] + v57 - 8) = v60;
      operator delete(v60);
    }
    int v61 = (char *)v78 + v57;
    long long v62 = *(void **)((char *)&v78[-4] + v57 - 8);
    if (v62)
    {
      *((void *)v61 - 8) = v62;
      operator delete(v62);
    }
    int32x2_t v63 = (void *)*((void *)v61 - 12);
    if (v63)
    {
      *(void *)((char *)&v78[-5] + v57 - 8) = v63;
      operator delete(v63);
    }
    uint64_t v64 = (void *)*((void *)v58 - 15);
    if (v64)
    {
      *(void *)((char *)&v78[-7] + v57) = v64;
      operator delete(v64);
    }
    v57 -= 120;
  }
  while (v57);
}

void sub_24FF627F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *__p,uint64_t a22,uint64_t a23,uint64_t a24,char a25)
{
  for (uint64_t i = 240; i != -120; i -= 120)
    sub_24FF60EC8((uint64_t)(&a25 + i));
  _Unwind_Resume(a1);
}

void sub_24FF62838(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = 0;
  uint64_t v52 = *MEMORY[0x263EF8340];
  uint64_t v7 = *(unsigned int *)(a1 + 4004);
  unint64_t v8 = *(int *)(a1 + 4008);
  uint64_t v9 = (void *)(a1 + 3920);
  uint64_t v10 = *(unsigned int *)(a1 + 4032);
  uint64_t v11 = *(unsigned int *)(a1 + 4008);
  uint64_t v51 = 0;
  memset(v50, 0, sizeof(v50));
  do
  {
    sub_24FF60D8C((uint64_t)v50 + v6, v11);
    v6 += 120;
  }
  while (v6 != 360);
  int v48 = 0;
  sub_24FF6A454(__p, v8, &v48);
  if ((int)v7 >= 1)
  {
    uint64_t v12 = 0;
    uint64_t v47 = a3;
    uint64_t v13 = 4 * v11;
    while (v10)
    {
      if (*(unsigned char *)(a3 + v12))
      {
        uint64_t v14 = (int *)(*(void *)(a1 + 1256) + 12 * v12);
        int v15 = *v14;
        int v16 = v14[1];
        int v17 = v14[2];
        if (v17 == -1 || !*(unsigned char *)(a3 + v15) || !*(unsigned char *)(a3 + v16) || !*(unsigned char *)(a3 + v17))
        {
          if (v16 == -1 || !*(unsigned char *)(a3 + v15) || !*(unsigned char *)(a3 + v16))
          {
            if (v15 == -1 || !*(unsigned char *)(a3 + v15))
            {
LABEL_34:
              uint64_t v34 = v7;
              uint64_t v35 = v10;
              uint64_t v36 = v9;
              int v37 = __p[0];
              if ((int)v11 >= 1) {
                bzero(__p[0], 4 * v11);
              }
              LOBYTE(v48) = 3;
              uint64_t v38 = (uint64_t)v37;
              uint64_t v9 = v36;
              sub_24FF5F900((unsigned int *)a1, v38, v8, v36, &v48, 0, a2 + 4 * v12 * v8);
              uint64_t v10 = v35;
              uint64_t v7 = v34;
              a3 = v47;
              goto LABEL_37;
            }
LABEL_16:
            uint64_t v18 = (char *)__p[0];
            if ((int)v8 >= 1)
            {
              uint64_t v19 = 0;
              uint64_t v20 = a2 + 4 * v15 * (int)v11;
              do
              {
                *(_DWORD *)&v18[v19] = *(_DWORD *)(v20 + v19);
                v19 += 4;
              }
              while (v13 != v19);
            }
            unsigned int v21 = 0;
LABEL_32:
            sub_24FF5F900((unsigned int *)a1, (uint64_t)v18, v8, v9, (unsigned char *)(a1 + 4044), (void *)v50 + 15 * v21, a2 + 4 * v12 * v8);
            goto LABEL_37;
          }
LABEL_26:
          uint64_t v18 = (char *)__p[0];
          if ((int)v11 >= 1)
          {
            uint64_t v27 = 0;
            uint64_t v28 = a2 + 4 * v15 * (int)v11;
            uint64_t v29 = a2 + 4 * v16 * (int)v8;
            do
            {
              int v30 = *(_DWORD *)(v28 + v27);
              int v31 = *(_DWORD *)(v29 + v27);
              BOOL v32 = __OFADD__(v31, v30);
              int v33 = v31 + v30;
              if (v33 < 0 != v32) {
                ++v33;
              }
              *(_DWORD *)&v18[v27] = v33 >> 1;
              v27 += 4;
            }
            while (v13 != v27);
          }
          unsigned int v21 = 1;
          goto LABEL_32;
        }
        goto LABEL_21;
      }
LABEL_37:
      if (++v12 == v7) {
        goto LABEL_38;
      }
    }
    uint64_t v22 = (int *)(*(void *)(a1 + 1256) + 12 * v12);
    int v15 = *v22;
    int v16 = v22[1];
    int v17 = v22[2];
    if (v17 == -1)
    {
      if (v16 == -1)
      {
        if (v15 == -1) {
          goto LABEL_34;
        }
        goto LABEL_16;
      }
      goto LABEL_26;
    }
LABEL_21:
    uint64_t v18 = (char *)__p[0];
    if ((int)v11 >= 1)
    {
      uint64_t v23 = 0;
      uint64_t v24 = a2 + 4 * v15 * (int)v8;
      uint64_t v25 = a2 + 4 * v16 * (int)v11;
      uint64_t v26 = a2 + 4 * v17 * (int)v8;
      do
      {
        *(_DWORD *)&v18[v23] = *(_DWORD *)(v25 + v23) + *(_DWORD *)(v24 + v23) - *(_DWORD *)(v26 + v23);
        v23 += 4;
      }
      while (v13 != v23);
    }
    unsigned int v21 = 2;
    goto LABEL_32;
  }
LABEL_38:
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  unint64_t v39 = 360;
  do
  {
    int v40 = (char *)v50 + v39;
    uint64_t v41 = __p[v39 / 8];
    if (v41)
    {
      *((void *)v40 - 2) = v41;
      operator delete(v41);
    }
    int v42 = (void *)*((void *)v40 - 6);
    if (v42)
    {
      *(void *)((char *)&v50[-2] + v39 - 8) = v42;
      operator delete(v42);
    }
    int v43 = (char *)v50 + v39;
    int v44 = *(void **)((char *)&v50[-4] + v39 - 8);
    if (v44)
    {
      *((void *)v43 - 8) = v44;
      operator delete(v44);
    }
    unsigned int v45 = (void *)*((void *)v43 - 12);
    if (v45)
    {
      *(void *)((char *)&v50[-5] + v39 - 8) = v45;
      operator delete(v45);
    }
    uint64_t v46 = (void *)*((void *)v40 - 15);
    if (v46)
    {
      *(void *)((char *)&v50[-7] + v39) = v46;
      operator delete(v46);
    }
    v39 -= 120;
  }
  while (v39);
}

void sub_24FF62BD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, uint64_t a14, char a15)
{
  for (uint64_t i = 240; i != -120; i -= 120)
    sub_24FF60EC8((uint64_t)(&a15 + i));
  _Unwind_Resume(a1);
}

void sub_24FF62C20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v6 = 0;
  uint64_t v7 = 0;
  uint64_t v45 = *MEMORY[0x263EF8340];
  uint64_t v8 = *(unsigned int *)(a1 + 4004);
  unint64_t v9 = *(int *)(a1 + 4008);
  int v10 = *(_DWORD *)(a1 + 4032);
  uint64_t v41 = (void *)(a1 + 3920);
  uint64_t v11 = *(unsigned int *)(a1 + 4008);
  memset(v44, 0, sizeof(v44));
  do
  {
    char v12 = v6;
    sub_24FF60D8C((uint64_t)v44 + 120 * v7, v9);
    char v6 = 1;
    uint64_t v7 = 1;
  }
  while ((v12 & 1) == 0);
  int v42 = 0;
  sub_24FF6A454(__p, v9, &v42);
  uint64_t v13 = v41;
  if ((int)v8 >= 1)
  {
    uint64_t v14 = 0;
    uint64_t v15 = 4 * v11;
    while (v10)
    {
      if (*(unsigned char *)(a3 + v14))
      {
        int v16 = (int *)(*(void *)(a1 + 1256) + 12 * v14);
        int v17 = *v16;
        int v18 = v16[1];
        if (v18 == -1 || !*(unsigned char *)(a3 + v17) || !*(unsigned char *)(a3 + v18))
        {
          if (v17 == -1 || !*(unsigned char *)(a3 + v17))
          {
LABEL_25:
            int v31 = __p[0];
            if ((int)v11 >= 1) {
              bzero(__p[0], 4 * v11);
            }
            LOBYTE(v42) = 3;
            uint64_t v32 = (uint64_t)v31;
            uint64_t v13 = v41;
            sub_24FF5F900((unsigned int *)a1, v32, v9, v41, &v42, 0, a2 + 4 * v14 * v9);
            goto LABEL_28;
          }
LABEL_12:
          uint64_t v19 = (char *)__p[0];
          if ((int)v9 >= 1)
          {
            uint64_t v20 = 0;
            uint64_t v21 = a2 + 4 * v17 * (int)v11;
            do
            {
              *(_DWORD *)&v19[v20] = *(_DWORD *)(v21 + v20);
              v20 += 4;
            }
            while (v15 != v20);
          }
          unsigned int v22 = 0;
LABEL_23:
          sub_24FF5F900((unsigned int *)a1, (uint64_t)v19, v9, v13, (unsigned char *)(a1 + 4044), (void *)v44 + 15 * v22, a2 + 4 * v14 * v9);
          goto LABEL_28;
        }
LABEL_17:
        uint64_t v19 = (char *)__p[0];
        if ((int)v11 >= 1)
        {
          uint64_t v24 = 0;
          uint64_t v25 = a2 + 4 * v17 * (int)v11;
          uint64_t v26 = a2 + 4 * v18 * (int)v9;
          do
          {
            int v27 = *(_DWORD *)(v25 + v24);
            int v28 = *(_DWORD *)(v26 + v24);
            BOOL v29 = __OFADD__(v28, v27);
            int v30 = v28 + v27;
            if (v30 < 0 != v29) {
              ++v30;
            }
            *(_DWORD *)&v19[v24] = v30 >> 1;
            v24 += 4;
          }
          while (v15 != v24);
        }
        unsigned int v22 = 1;
        goto LABEL_23;
      }
LABEL_28:
      if (++v14 == v8) {
        goto LABEL_29;
      }
    }
    uint64_t v23 = (int *)(*(void *)(a1 + 1256) + 12 * v14);
    int v17 = *v23;
    int v18 = v23[1];
    if (v18 == -1)
    {
      if (v17 == -1) {
        goto LABEL_25;
      }
      goto LABEL_12;
    }
    goto LABEL_17;
  }
LABEL_29:
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  for (uint64_t i = 0; i != -240; i -= 120)
  {
    uint64_t v34 = (void *)((char *)v44 + i);
    uint64_t v35 = *(void **)((char *)&v44[13] + i + 8);
    if (v35)
    {
      v34[28] = v35;
      operator delete(v35);
    }
    uint64_t v36 = (void *)v34[24];
    if (v36)
    {
      *(void *)((char *)&v44[12] + i + 8) = v36;
      operator delete(v36);
    }
    int v37 = (char *)v44 + i;
    uint64_t v38 = *(void **)((char *)&v44[10] + i + 8);
    if (v38)
    {
      *((void *)v37 + 22) = v38;
      operator delete(v38);
    }
    unint64_t v39 = (void *)*((void *)v37 + 18);
    if (v39)
    {
      *(void *)((char *)&v44[9] + i + 8) = v39;
      operator delete(v39);
    }
    int v40 = (void *)v34[15];
    if (v40)
    {
      *(void *)((char *)&v44[8] + i) = v40;
      operator delete(v40);
    }
  }
}

void sub_24FF62F24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, uint64_t a14, char a15)
{
  for (uint64_t i = 120; i != -120; i -= 120)
    sub_24FF60EC8((uint64_t)(&a15 + i));
  _Unwind_Resume(a1);
}

void sub_24FF62F6C(uint64_t a1, unint64_t a2, _DWORD *a3)
{
  unint64_t v3 = (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 2;
  if (a2 <= v3)
  {
    if (a2 < v3) {
      *(void *)(a1 + 8) = *(void *)a1 + 4 * a2;
    }
  }
  else
  {
    sub_24FF6A330((void **)a1, a2 - v3, a3);
  }
}

int32x2_t sub_24FF62F9C(uint64_t a1, int a2, int32x2_t result)
{
  if (*(_DWORD *)(a1 + 1116) <= a2)
  {
    *(_DWORD *)(a1 + 4384) = 3;
    return result;
  }
  uint64_t v5 = (int *)(*(void *)(a1 + 1256) + 12 * a2);
  int v6 = *v5;
  int v7 = v5[1];
  int v8 = v5[2];
  int v9 = *(_DWORD *)(a1 + 1148);
  if (v9 != 1)
  {
    if (v9 != 2) {
      goto LABEL_17;
    }
    int v10 = (int *)(*(void *)(a1 + 1280) + 12 * a2);
    int v11 = v10[2];
    if (v11 != -1)
    {
      int v12 = *v10;
      int v66 = v10[1];
      BOOL v13 = sub_24FF5FDE8((unsigned int *)a1, (_WORD *)(a1 + 3672));
      uint64_t v14 = 4;
      if (!v13) {
        uint64_t v14 = 2;
      }
      if (sub_24FF5FDE8((unsigned int *)a1, (_WORD *)(a1 + 3672 + v14))) {
        int v15 = 2;
      }
      else {
        int v15 = 0;
      }
      int v16 = v15 | v13;
      if (v16 == 2)
      {
        uint64_t v39 = *(void *)(a1 + 1160);
        int v40 = (int32x2_t *)(v39 + 12 * v7);
        uint64_t v41 = (int32x2_t *)(v39 + 12 * v66);
        int v42 = (int32x2_t *)(v39 + 12 * v6);
        int v43 = (int32x2_t *)(v39 + 12 * v12);
        __int32 v44 = v42[1].i32[0];
        __int32 v45 = v43[1].i32[0];
        BOOL v33 = __OFADD__(v45, v44);
        int v46 = v45 + v44;
        int32x2_t v47 = vadd_s32(*v41, *v40);
        uint32x2_t v48 = (uint32x2_t)vadd_s32(*v43, *v42);
        int32x2_t v49 = vshr_n_s32((int32x2_t)vsra_n_u32(v48, v48, 0x1FuLL), 1uLL);
        if (v46 < 0 != v33) {
          int v50 = v46 + 1;
        }
        else {
          int v50 = v46;
        }
        int32x2_t v67 = vsub_s32(v47, v49);
        int v27 = v41[1].i32[0] + v40[1].i32[0] - (v50 >> 1);
        goto LABEL_34;
      }
      if (v16 == 1)
      {
        uint64_t v51 = *(void *)(a1 + 1160);
        int v18 = (int32x2_t *)(v51 + 12 * v12);
        uint64_t v19 = (int32x2_t *)(v51 + 12 * v66);
        int v20 = v19[1].i32[0] + v18[1].i32[0];
        uint64_t v21 = (int32x2_t *)(v51 + 12 * v11);
      }
      else
      {
        if (v16)
        {
          uint64_t v52 = *(void *)(a1 + 1160);
          int v53 = (int32x2_t *)(v52 + 12 * v6);
          int v54 = (int32x2_t *)(v52 + 12 * v12);
          __int32 v55 = v53[1].i32[0];
          __int32 v56 = v54[1].i32[0];
          BOOL v33 = __OFADD__(v56, v55);
          int v57 = v56 + v55;
          if (v57 < 0 != v33) {
            ++v57;
          }
          uint64_t v58 = (int32x2_t *)(v52 + 12 * v7);
          uint64_t v59 = (int32x2_t *)(v52 + 12 * v66);
          int32x2_t v60 = (int32x2_t *)(v52 + 12 * v8);
          int v61 = (int32x2_t *)(v52 + 12 * v11);
          uint32x2_t v62 = (uint32x2_t)vadd_s32(*v54, *v53);
          int32x2_t v63 = vadd_s32(*v59, *v58);
          int64x2_t v64 = vmull_s32(vsub_s32(vsra_n_s32(vadd_s32(v63, v63), (int32x2_t)vsra_n_u32(v62, v62, 0x1FuLL), 1uLL), vadd_s32(*v60, *v61)), vdup_n_s32(0x55555556u));
          int32x2_t v67 = vadd_s32(vshrn_n_s64(v64, 0x20uLL), vmovn_s64((int64x2_t)vshrq_n_u64((uint64x2_t)v64, 0x3FuLL)));
          int v27 = (2 * (v59[1].i32[0] + v58[1].i32[0]) + (v57 >> 1) - (v60[1].i32[0] + v61[1].i32[0])) / 3;
          goto LABEL_34;
        }
        uint64_t v17 = *(void *)(a1 + 1160);
        int v18 = (int32x2_t *)(v17 + 12 * v6);
        uint64_t v19 = (int32x2_t *)(v17 + 12 * v7);
        int v20 = v19[1].i32[0] + v18[1].i32[0];
        uint64_t v21 = (int32x2_t *)(v17 + 12 * v8);
      }
      int32x2_t v67 = vsub_s32(vadd_s32(*v19, *v18), *v21);
      int v27 = v20 - v21[1].i32[0];
LABEL_34:
      unsigned int v22 = 1;
      goto LABEL_35;
    }
  }
  if (v8 != -1)
  {
    unsigned int v22 = 0;
    uint64_t v23 = *(void *)(a1 + 1160);
    uint64_t v24 = (int32x2_t *)(v23 + 12 * v6);
    uint64_t v25 = (int32x2_t *)(v23 + 12 * v7);
    uint64_t v26 = (int32x2_t *)(v23 + 12 * v8);
    int32x2_t v67 = vsub_s32(vadd_s32(*v25, *v24), *v26);
    int v27 = v25[1].i32[0] + v24[1].i32[0] - v26[1].i32[0];
LABEL_35:
    sub_24FF6337C((uint64_t)&v68, (unsigned int *)a1, *(unsigned char *)(a1 + 1144), (void *)(a1 + 120 * v22 + 3680));
    int32x2_t v36 = v68;
    int v37 = v69;
    int32x2_t v38 = v67;
    goto LABEL_36;
  }
LABEL_17:
  if (v7 != -1)
  {
    unsigned int v22 = 0;
    uint64_t v28 = *(void *)(a1 + 1160);
    BOOL v29 = (int32x2_t *)(v28 + 12 * v6);
    int v30 = (int32x2_t *)(v28 + 12 * v7);
    uint32x2_t v31 = (uint32x2_t)vadd_s32(*v30, *v29);
    __int32 v32 = v29[1].i32[0];
    LODWORD(v30) = v30[1].i32[0];
    BOOL v33 = __OFADD__(v30, v32);
    int v34 = v30 + v32;
    int32x2_t v67 = vshr_n_s32((int32x2_t)vsra_n_u32(v31, v31, 0x1FuLL), 1uLL);
    if (v34 < 0 != v33) {
      ++v34;
    }
    int v27 = v34 >> 1;
    goto LABEL_35;
  }
  if (v6 != -1)
  {
    unsigned int v22 = 0;
    uint64_t v35 = *(void *)(a1 + 1160) + 12 * v6;
    int32x2_t v67 = *(int32x2_t *)v35;
    int v27 = *(_DWORD *)(v35 + 8);
    goto LABEL_35;
  }
  if (!*(unsigned char *)(a1 + 1156))
  {
    unsigned int v22 = 0;
    int v27 = 0;
    int32x2_t v67 = 0;
    goto LABEL_35;
  }
  sub_24FF6337C((uint64_t)&v68, (unsigned int *)a1, 3, 0);
  int v27 = 0;
  int32x2_t v36 = v68;
  int v37 = v69;
  int32x2_t v38 = 0;
LABEL_36:
  uint64_t v65 = (int32x2_t *)(*(void *)(a1 + 1160) + 12 * a2);
  uint64_t result = vadd_s32(v36, v38);
  *uint64_t v65 = result;
  v65[1].i32[0] = v37 + v27;
  return result;
}

uint64_t sub_24FF6337C(uint64_t result, unsigned int *a2, char a3, void *a4)
{
  uint64_t v6 = result;
  switch(a3)
  {
    case 0:
      uint64_t v7 = 0;
      uint64_t v8 = 0;
      for (uint64_t i = 0; i != 384; i += 128)
      {
        uint64_t result = sub_24FF5FDE8(a2, (_WORD *)(*a4 + v7));
        if (result)
        {
          BOOL v56 = sub_24FF5FDE8(a2, (_WORD *)(a4[3] + v7));
          int v10 = (_WORD *)(a4[6] + i);
          BOOL v11 = sub_24FF5FDE8(a2, v10);
          if (v11) {
            uint64_t v12 = 2;
          }
          else {
            uint64_t v12 = 1;
          }
          if (sub_24FF5FDE8(a2, &v10[v12])) {
            int v13 = 2;
          }
          else {
            int v13 = 0;
          }
          int v14 = v13 | v11;
          if (sub_24FF5FDE8(a2, &v10[v14 + 3])) {
            int v15 = 4;
          }
          else {
            int v15 = 0;
          }
          int v16 = v14 | v15;
          if (sub_24FF5FDE8(a2, &v10[v16 + 7])) {
            int v17 = 8;
          }
          else {
            int v17 = 0;
          }
          int v18 = v16 | v17;
          if (sub_24FF5FDE8(a2, &v10[v18 + 15])) {
            int v19 = 16;
          }
          else {
            int v19 = 0;
          }
          int v20 = v18 | v19;
          uint64_t result = sub_24FF5FDE8(a2, &v10[v20 + 31]);
          if (result) {
            int v21 = 32;
          }
          else {
            int v21 = 0;
          }
          int v22 = v20 | v21;
          if (v22 == 63)
          {
            uint64_t result = sub_24FF5FED8(a2, *(_DWORD *)(a4[12] + v8), (_WORD *)(a4[9] + v7));
            int v22 = result + 63;
          }
          if (v56) {
            int v23 = v22 + 1;
          }
          else {
            int v23 = ~v22;
          }
        }
        else
        {
          int v23 = 0;
        }
        *(_DWORD *)(v6 + v8) = v23;
        v8 += 4;
        v7 += 2;
      }
      return result;
    case 2:
      uint64_t v24 = 0;
      uint64_t v25 = 0;
      while (1)
      {
        uint64_t v26 = a4[12];
        uint64_t result = sub_24FF5FFA0(a2, *(_DWORD *)(v26 + v24), (_WORD *)(a4[3] + v25), (_WORD *)(a4[9] + v25));
        unsigned int v27 = (int)result >= 0 ? result : -(int)result;
        int v28 = *(_DWORD *)(v26 + v24);
        unsigned int v29 = v27 >> v28;
        if (v28 && v29 == 0) {
          break;
        }
        if (v29 >= 2)
        {
          int v31 = 1;
LABEL_41:
          *(_DWORD *)(v26 + v24) = v31 + v28;
        }
        *(_DWORD *)(v6 + v24) = result;
        v25 += 2;
        v24 += 4;
        if (v25 == 6) {
          return result;
        }
      }
      int v31 = -1;
      goto LABEL_41;
    case 3:
      for (uint64_t j = 0; j != 3; ++j)
      {
        int v33 = a2[j + 270];
        if (v33 < 1)
        {
          int v35 = 0;
        }
        else
        {
          int v34 = 0;
          int v35 = 0;
          do
          {
            __int16 v57 = 0x8000;
            uint64_t result = sub_24FF5FDE8(a2, &v57);
            v35 += result << v34++;
          }
          while (v33 != v34);
        }
        *(_DWORD *)(v6 + 4 * j) = v35;
      }
      return result;
    case 4:
      uint64_t v36 = 0;
      uint64_t v37 = 0;
      uint64_t v38 = 62;
      break;
    default:
      return result;
  }
  do
  {
    uint64_t result = sub_24FF5FDE8(a2, (_WORD *)(*a4 + v36));
    if (!result)
    {
      int v55 = 0;
      goto LABEL_80;
    }
    BOOL v39 = sub_24FF5FDE8(a2, (_WORD *)(a4[3] + v36));
    uint64_t v40 = a4[6] + v38;
    if (sub_24FF5FDE8(a2, (_WORD *)(v40 - 62))) {
      unint64_t v41 = 32;
    }
    else {
      unint64_t v41 = 0;
    }
    if (sub_24FF5FDE8(a2, (_WORD *)(v40 + (v41 >> 4) - 60))) {
      int v42 = 16;
    }
    else {
      int v42 = 0;
    }
    unint64_t v43 = v42 | v41;
    if (sub_24FF5FDE8(a2, (_WORD *)(v40 + (v43 >> 3) - 56))) {
      int v44 = 8;
    }
    else {
      int v44 = 0;
    }
    unint64_t v45 = v43 | v44;
    if (sub_24FF5FDE8(a2, (_WORD *)(v40 + (v45 >> 2) - 48))) {
      int v46 = 4;
    }
    else {
      int v46 = 0;
    }
    unint64_t v47 = v45 | v46;
    if (sub_24FF5FDE8(a2, (_WORD *)(v40 + (v47 >> 1) - 32))) {
      int v48 = 2;
    }
    else {
      int v48 = 0;
    }
    uint64_t v49 = v47 | v48;
    uint64_t result = sub_24FF5FDE8(a2, (_WORD *)(v40 + v49));
    int v50 = v49 | result;
    if ((v49 | result) == 0x3F)
    {
      uint64_t v51 = a4[12];
      uint64_t result = sub_24FF5FED8(a2, *(_DWORD *)(v51 + v37), (_WORD *)(a4[9] + v36));
      int v50 = result + 63;
      int v52 = *(_DWORD *)(v51 + v37);
      int v53 = ((int)result + 63) >> v52;
      if (!v52 || v53)
      {
        if (v53 < 2) {
          goto LABEL_77;
        }
        int v54 = 1;
      }
      else
      {
        int v54 = -1;
      }
      *(_DWORD *)(v51 + v37) = v54 + v52;
    }
LABEL_77:
    if (v39) {
      int v55 = v50 + 1;
    }
    else {
      int v55 = ~v50;
    }
LABEL_80:
    *(_DWORD *)(v6 + v37) = v55;
    v38 += 128;
    v37 += 4;
    v36 += 2;
  }
  while (v38 != 446);
  return result;
}

void sub_24FF63790(uint64_t a1, int a2, int a3, int32x2_t a4)
{
  if (a2 == 3 || a2 == 5)
  {
    if (a3 >= 1)
    {
      unint64_t v5 = a3 + 1;
      do
      {
        if (*(_DWORD *)(a1 + 4384)) {
          break;
        }
        if (*(unsigned char *)(*(void *)(a1 + 1352) + (v5 - 2))) {
          a4 = sub_24FF62F9C(a1, *(_DWORD *)(*(void *)(a1 + 1328) + 4 * (v5 - 2)), a4);
        }
        --v5;
      }
      while (v5 > 1);
    }
  }
  else if (a3 >= 1)
  {
    uint64_t v6 = 0;
    uint64_t v7 = a3;
    do
    {
      if (*(_DWORD *)(a1 + 4384)) {
        break;
      }
      if (*(unsigned char *)(*(void *)(a1 + 1352) + v6)) {
        a4 = sub_24FF62F9C(a1, *(_DWORD *)(*(void *)(a1 + 1328) + 4 * v6), a4);
      }
      ++v6;
    }
    while (v7 != v6);
  }
}

void sub_24FF63854(_DWORD *a1, int *a2)
{
  if (*a2 >= 63) {
    int v4 = 63;
  }
  else {
    int v4 = *a2;
  }
  if (v4 <= a1[1]) {
    int v5 = a1[1];
  }
  else {
    int v5 = v4;
  }
  uint64_t v6 = &a1[6 * v4];
  uint64_t v9 = *((void *)v6 + 1);
  uint64_t v8 = (void **)(v6 + 2);
  uint64_t v7 = v9;
  a1[1] = v5;
  int v10 = v8 + 1;
  BOOL v11 = (int **)v8[1];
  uint64_t v12 = ((uint64_t)v11 - v9) >> 3;
  a2[1] = v4;
  a2[2] = v12;
  unint64_t v13 = (unint64_t)v8[2];
  if ((unint64_t)v11 >= v13)
  {
    if ((unint64_t)(v12 + 1) >> 61) {
      sub_24FF5A660();
    }
    uint64_t v15 = v13 - v7;
    uint64_t v16 = v15 >> 2;
    if (v15 >> 2 <= (unint64_t)(v12 + 1)) {
      uint64_t v16 = v12 + 1;
    }
    if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v17 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v17 = v16;
    }
    if (v17) {
      int v18 = (char *)sub_24FF69750((uint64_t)(v8 + 2), v17);
    }
    else {
      int v18 = 0;
    }
    int v19 = (int **)&v18[8 * v12];
    int v20 = &v18[8 * v17];
    *int v19 = a2;
    int v14 = v19 + 1;
    int v21 = (char *)*v10;
    int v22 = (char *)*v8;
    if (*v10 != *v8)
    {
      do
      {
        int v23 = (int *)*((void *)v21 - 1);
        v21 -= 8;
        *--int v19 = v23;
      }
      while (v21 != v22);
      int v21 = (char *)*v8;
    }
    *uint64_t v8 = v19;
    *int v10 = v14;
    v8[2] = v20;
    if (v21) {
      operator delete(v21);
    }
  }
  else
  {
    *BOOL v11 = a2;
    int v14 = v11 + 1;
  }
  *int v10 = v14;
  ++*a1;
  uint64_t v24 = &a1[v4];
  unint64_t v25 = (unint64_t)((char *)v14 - (unsigned char *)*v8) >> 3;
  if (v24[386] > (int)v25) {
    LODWORD(v25) = v24[386];
  }
  v24[386] = v25;
}

void sub_24FF639AC(_DWORD *a1, int *a2)
{
  if (sub_24FF6A58C(a1, (uint64_t)a2))
  {
    sub_24FF63854(a1, a2);
  }
}

uint64_t sub_24FF639FC(uint64_t a1, int a2, unsigned int a3, int *a4, _DWORD *a5, int *a6, int *a7)
{
  int v14 = *a6;
  if (sub_24FF5FDE8((unsigned int *)a1, (_WORD *)(a1 + 16 * a3 + 3414)))
  {
    char v15 = 0;
    char v16 = 0;
    char v17 = 0;
    int v18 = 0;
    int v19 = 0;
    int v20 = 1;
LABEL_3:
    int v21 = 1;
  }
  else
  {
    uint64_t v22 = a1 + 16 * a3;
    uint64_t v23 = v22 + 3414;
    BOOL v24 = sub_24FF5FDE8((unsigned int *)a1, (_WORD *)(v22 + 3416));
    uint64_t v25 = 4;
    if (v24) {
      uint64_t v25 = 6;
    }
    if (sub_24FF5FDE8((unsigned int *)a1, (_WORD *)(v23 + v25))) {
      int v26 = 2;
    }
    else {
      int v26 = 0;
    }
    int v27 = v26 | v24;
    BOOL v28 = sub_24FF5FDE8((unsigned int *)a1, (_WORD *)(v23 + 2 * (v26 | v24 | 4u)));
    int v19 = v27 + 5;
    if (!v28) {
      int v19 = v27 + 1;
    }
    char v15 = 0;
    int v21 = 0;
    char v17 = 0;
    int v20 = 1;
    char v16 = 1;
    int v18 = 1;
    switch(v19)
    {
      case 1:
        break;
      case 2:
        char v15 = 0;
        char v16 = 0;
        char v17 = 0;
        goto LABEL_3;
      case 3:
        int v20 = 0;
        char v16 = 0;
        int v18 = 0;
        goto LABEL_16;
      case 4:
        int v20 = 0;
        char v16 = 0;
LABEL_16:
        char v15 = 1;
        goto LABEL_18;
      case 5:
        char v15 = 0;
        char v16 = 0;
        int v18 = 0;
LABEL_18:
        int v21 = 1;
        goto LABEL_21;
      case 6:
        char v15 = 0;
        int v21 = 0;
        goto LABEL_21;
      case 7:
        int v20 = 0;
        int v21 = 0;
        char v15 = 1;
LABEL_21:
        char v17 = 1;
        break;
      default:
        char v15 = 0;
        char v16 = 0;
        int v19 = 8;
        int v20 = 1;
        int v21 = 1;
        char v17 = 1;
        int v18 = 1;
        break;
    }
  }
  *a4 = v19;
  uint64_t v104 = a5;
  int v102 = v21;
  int v103 = v18;
  int v105 = v20;
  char v106 = v16;
  char v107 = v15;
  if (*(unsigned char *)(a1 + 1153) && *(unsigned char *)(a1 + 1152))
  {
    int v29 = *(_DWORD *)(*(void *)(a1 + 1472) + 12 * a2);
    if (v29 <= 19) {
      int v29 = 19;
    }
    unsigned int v30 = v29 - 19;
    unsigned int v109 = v30 >> 1;
    int v110 = 15;
    BOOL v31 = v30 >= 0x1E;
    __int32 v32 = &v110;
    if (!v31) {
      __int32 v32 = (int *)&v109;
    }
  }
  else
  {
    int v111 = 7;
    __int32 v32 = (int *)(*(void *)(a1 + 1424) + 4 * a2);
    if (*v32 >= 7) {
      __int32 v32 = &v111;
    }
  }
  int v33 = (_WORD *)(a1 + 6 * *v32 + 3308);
  BOOL v34 = sub_24FF5FDE8((unsigned int *)a1, v33);
  uint64_t v35 = 2;
  if (!v34) {
    uint64_t v35 = 1;
  }
  if (sub_24FF5FDE8((unsigned int *)a1, &v33[v35])) {
    int v36 = 2;
  }
  else {
    int v36 = 0;
  }
  int v37 = v36 | v34;
  if ((v36 | v34) != 3)
  {
LABEL_39:
    int v39 = *a6;
    if (v37 >= *(_DWORD *)(a1 + 1120) - *a6) {
      goto LABEL_65;
    }
    int v100 = (unsigned int *)a4;
    int v101 = a2;
    int v40 = v37 + 1;
    int v98 = v14;
    int v99 = a7;
    switch(*(_DWORD *)(a1 + 1132))
    {
      case 0:
        uint64_t v41 = *(void *)(a1 + 1208);
        int v42 = v40;
        do
        {
          *(_DWORD *)(v41 + 4 * v39 + 4) = *(_DWORD *)(v41 + 4 * v39) + 3;
          int v39 = *a6 + 1;
          *a6 = v39;
          --v42;
        }
        while (v42);
        int v43 = v40;
        break;
      case 1:
        uint64_t v44 = *(void *)(a1 + 1208);
        int v45 = v40;
        do
        {
          *(_DWORD *)(v44 + 4 * v39 + 4) = *(_DWORD *)(v44 + 4 * v39) + 4;
          int v39 = *a6 + 1;
          *a6 = v39;
          --v45;
        }
        while (v45);
        int v43 = 2 * v40;
        break;
      case 2:
        int v43 = 0;
        do
        {
          if (sub_24FF5FDE8((unsigned int *)a1, (_WORD *)(a1 + 3406))) {
            int v46 = 4;
          }
          else {
            int v46 = 3;
          }
          unint64_t v47 = (_DWORD *)(*(void *)(a1 + 1208) + 4 * *a6);
          v47[1] = *v47 + v46;
          ++*a6;
          int v43 = v43 + v46 - 2;
          --v40;
        }
        while (v40);
        break;
      case 3:
        int v43 = 0;
        do
        {
          BOOL v48 = sub_24FF5FDE8((unsigned int *)a1, (_WORD *)(a1 + 3406));
          if (v48) {
            uint64_t v49 = 4;
          }
          else {
            uint64_t v49 = 2;
          }
          if (sub_24FF5FDE8((unsigned int *)a1, (_WORD *)(a1 + v49 + 3406))) {
            int v50 = 2;
          }
          else {
            int v50 = 0;
          }
          int v51 = v50 | v48;
          if (v51 == 3) {
            int v51 = sub_24FF5FED8((unsigned int *)a1, 0, (_WORD *)(a1 + 3412)) + 3;
          }
          int v52 = (_DWORD *)(*(void *)(a1 + 1208) + 4 * *a6);
          v52[1] = v51 + *v52 + 3;
          ++*a6;
          v43 += v51 + 1;
          --v40;
        }
        while (v40);
        break;
      default:
        goto LABEL_65;
    }
    if (v43 <= 0 || v43 > *(_DWORD *)(a1 + 1124)) {
      goto LABEL_65;
    }
    unint64_t v54 = (v43 + 1);
    int v56 = *(_DWORD *)(a1 + 1116);
    uint64_t v57 = a1 + 1328;
    uint64_t v58 = (char **)(a1 + 1352);
    sub_24FF5F2F4(a1 + 1328, v54);
    uint64_t v59 = *(char **)(a1 + 1352);
    unint64_t v60 = *(void *)(a1 + 1360) - (void)v59;
    if (v54 <= v60)
    {
      int v61 = v101;
      if (v54 < v60) {
        *(void *)(a1 + 1360) = &v59[v54];
      }
    }
    else
    {
      sub_24FF69DDC((unint64_t *)(a1 + 1352), v54 - v60);
      uint64_t v59 = *v58;
      int v61 = v101;
    }
    *uint64_t v59 = v107;
    *(unsigned char *)(*(void *)(a1 + 1352) + v43) = v106;
    uint64_t v62 = v43;
    int32x2_t v63 = *(_DWORD **)(a1 + 1328);
    uint64_t v64 = *(void *)(a1 + 1448);
    int v108 = *(_DWORD *)(v64 + 16 * v61);
    if (v17)
    {
      int v65 = v56;
      if (!v105) {
        goto LABEL_79;
      }
      if (*(unsigned char *)(a1 + 1152)) {
        int v66 = sub_24FF69A9C(a1, v61 - 1);
      }
      else {
        int v66 = sub_24FF5FFA0((unsigned int *)a1, 0, (_WORD *)(a1 + 3530), (_WORD *)(a1 + 3532)) + v61 - 1;
      }
    }
    else
    {
      int v66 = *(_DWORD *)(v64 + 16 * v61 + 4);
      int v65 = v56;
    }
    *int32x2_t v63 = v66;
LABEL_79:
    if (v43 >= 2)
    {
      if (sub_24FF5FDE8((unsigned int *)a1, (_WORD *)(a1 + 3534)))
      {
        for (uint64_t i = 1; i != v43; (*v58)[i++] = 1)
          ;
      }
      else if (v54 == 3)
      {
        *(unsigned char *)(*(void *)(a1 + 1352) + 1) = 0;
        if (*(unsigned char *)(a1 + 1152)) {
          int v68 = sub_24FF69A9C(a1, v65);
        }
        else {
          int v68 = v65 - sub_24FF5FED8((unsigned int *)a1, 0, (_WORD *)(a1 + 3532));
        }
        *(_DWORD *)(*(void *)v57 + 4) = v68;
      }
      else
      {
        uint64_t v69 = 1;
        do
        {
          *(unsigned char *)(*(void *)(a1 + 1352) + v69) = sub_24FF5FDE8((unsigned int *)a1, (_WORD *)(a1 + 3494));
          if (!*(unsigned char *)(*(void *)(a1 + 1352) + v69))
          {
            if (*(unsigned char *)(a1 + 1152)) {
              int v70 = sub_24FF69A9C(a1, v65);
            }
            else {
              int v70 = v65 - sub_24FF5FED8((unsigned int *)a1, 0, (_WORD *)(a1 + 3532));
            }
            *(_DWORD *)(*(void *)v57 + 4 * v69) = v70;
          }
          ++v69;
        }
        while (v62 != v69);
      }
    }
    if (*(_DWORD *)(a1 + 4384)) {
      return 0xFFFFFFFFLL;
    }
    int v71 = v98;
    if (v103)
    {
      if (!v102)
      {
LABEL_106:
        int v53 = (_DWORD *)(a1 + 4384);
        if (*v100 == 3 || *v100 == 5)
        {
          unint64_t v72 = *v58;
          uint64_t v73 = v62;
          int v74 = v99;
          do
          {
            if (v72[v73])
            {
              int v75 = (*v104)++;
              *(_DWORD *)(*(void *)v57 + 4 * v73) = v75;
            }
          }
          while (v73-- > 0);
        }
        else
        {
          uint64_t v77 = 0;
          double v78 = *v58;
          int v74 = v99;
          do
          {
            if (v78[v77])
            {
              int v79 = (*v104)++;
              *(_DWORD *)(*(void *)v57 + 4 * v77) = v79;
            }
            ++v77;
          }
          while (v54 != v77);
        }
        uint64_t v80 = *(int **)(a1 + 1328);
        unint64_t v81 = v54;
        while (1)
        {
          int v83 = *v80++;
          int v82 = v83;
          if (v83 < 0 || v82 >= (int)((*(void *)(a1 + 1456) - *(void *)(a1 + 1448)) >> 4)) {
            goto LABEL_66;
          }
          if (!--v81)
          {
            sub_24FF69C60((void *)a1, v61, *v100, v54);
            if (*(unsigned char *)(a1 + 1152)) {
              BOOL v84 = *(unsigned char *)(a1 + 1153) == 0;
            }
            else {
              BOOL v84 = 1;
            }
            int v85 = 0;
            for (uint64_t j = (int *)(*(void *)(a1 + 1328) + 4); ; ++j)
            {
              int v87 = *(j - 1);
              int v88 = *j;
              if (!v85)
              {
                uint64_t v89 = *v74;
                if ((int)v89 + 2 > *(_DWORD *)(a1 + 1124)) {
                  goto LABEL_66;
                }
                int v85 = *(_DWORD *)(*(void *)(a1 + 1208) + 4 * (v71 + 1))
                    - *(_DWORD *)(*(void *)(a1 + 1208) + 4 * v71)
                    - 2;
                *int v74 = v89 + 1;
                uint64_t v90 = *(void *)(a1 + 1184);
                *(_DWORD *)(v90 + 4 * v89) = v61;
                uint64_t v91 = *v74;
                *int v74 = v91 + 1;
                *(_DWORD *)(v90 + 4 * v91) = v87;
                ++v71;
              }
              uint64_t v92 = *v74;
              if ((int)v92 >= *(_DWORD *)(a1 + 1124)) {
                break;
              }
              uint64_t v93 = v87;
              *int v74 = v92 + 1;
              *(_DWORD *)(*(void *)(a1 + 1184) + 4 * v92) = v88;
              uint64_t v94 = *(void *)(a1 + 1448);
              uint64_t v95 = v94 + 16 * v88;
              *(_DWORD *)(v95 + 4) = v87;
              *(_DWORD *)(v95 + 8) = v61;
              int v96 = (_DWORD *)(v94 + 16 * v87);
              *int v96 = v88;
              v96[3] = v61;
              if (v84)
              {
                uint64_t v97 = *(void *)(a1 + 1424);
                ++*(_DWORD *)(v97 + 4 * v93);
                ++*(_DWORD *)(v97 + 4 * v88);
              }
              --v85;
              if (!--v62) {
                return v54;
              }
            }
            goto LABEL_66;
          }
        }
      }
      if (*(unsigned char *)(a1 + 1152)) {
        int v108 = sub_24FF69A9C(a1, v61 + 1);
      }
      else {
        int v108 = sub_24FF5FFA0((unsigned int *)a1, 0, (_WORD *)(a1 + 3530), (_WORD *)(a1 + 3532)) + v61 + 1;
      }
      int v71 = v98;
    }
    v63[v62] = v108;
    goto LABEL_106;
  }
  int v38 = sub_24FF5FED8((unsigned int *)a1, 0, (_WORD *)(a1 + 3404));
  if (v38 >= -3)
  {
    int v37 = v38 + 3;
    goto LABEL_39;
  }
LABEL_65:
  int v53 = (_DWORD *)(a1 + 4384);
LABEL_66:
  *int v53 = 3;
  return 0xFFFFFFFFLL;
}

uint64_t sub_24FF642B0(uint64_t a1, unint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, void *a7)
{
  uint64_t result = 5;
  if (a2 && a5)
  {
    if (*(_DWORD *)(a1 + 4384)) {
      return 6;
    }
    char v16 = (unsigned int *)sub_24FF5F618(a2, a3, a1 + 4320);
    uint64_t result = 3;
    if (v16)
    {
      if ((v15 & 0x8000000000000000) == 0)
      {
        uint64_t v17 = *(unsigned int *)(a1 + 4328);
        if (a3 - v17 >= 0 && (unint64_t)v16 + v15 >= a2)
        {
          unint64_t v18 = a2 + v17;
          if (v18 >= (unint64_t)v16)
          {
            uint64_t v19 = v18 - (void)v16;
            if ((uint64_t)(v18 - (void)v16) >= 0)
            {
              int v20 = *(_DWORD *)(a1 + 1124);
              if (v20 >= 1)
              {
                int v21 = *(_DWORD *)(a1 + 4332);
                if (v21 >= 1)
                {
                  unint64_t v22 = *(unsigned int *)(a1 + 4336);
                  if ((int)v22 >= 1
                    && *(_DWORD *)(a1 + 4356) == 3
                    && *(_DWORD *)(a1 + 4340) == v20
                    && (a7 || !*(_DWORD *)(a1 + 4364))
                    && (a6 || !*(_DWORD *)(a1 + 4360)))
                  {
                    if ((*(_DWORD *)(a1 + 4376) - 5) >= 2)
                    {
                      unsigned int v23 = *(_DWORD *)(a1 + 4348);
                    }
                    else
                    {
                      if (v22 != 2) {
                        return result;
                      }
                      unsigned int v23 = *(_DWORD *)(a1 + 4348);
                      if (!v23) {
                        return result;
                      }
                    }
                    if (v23 > 0x1B) {
                      return result;
                    }
                    BOOL v24 = (int **)(a1 + 4056);
                    unint64_t v47 = (int **)(a1 + 4080);
                    sub_24FF5F2F4(a1 + 4080, v22);
                    for (uint64_t i = 0; i != v22; ++i)
                    {
                      BOOL v26 = v19 < 4;
                      v19 -= 4;
                      if (v26)
                      {
                        uint64_t v19 = 0;
                        char v16 = 0;
                      }
                      else
                      {
                        unsigned int v27 = *v16++;
                        (*v47)[i] = v27;
                      }
                    }
                    sub_24FF5F2F4(a1 + 4056, v22);
                    uint64_t v28 = 0;
                    uint64_t result = 3;
                    do
                    {
                      while (!v19)
                      {
                        char v16 = 0;
                        if (++v28 == v22) {
                          return result;
                        }
                      }
                      int v29 = *v24;
                      --v19;
                      int v30 = *(unsigned __int8 *)v16;
                      char v16 = (unsigned int *)((char *)v16 + 1);
                      (*v24)[v28++] = v30;
                    }
                    while (v28 != v22);
                    if (!v16) {
                      return 3;
                    }
                    char v31 = 0;
                    __int32 v32 = *v47;
                    char v33 = 1;
                    unint64_t v34 = v22;
                    do
                    {
                      int v35 = *v32++;
                      v31 |= v35 != 0;
                      int v36 = *v29++;
                      v33 &= v36 < 29;
                      --v34;
                    }
                    while (v34);
                    if ((v33 & 1) == 0) {
                      return 3;
                    }
                    int v38 = sub_24FF5DA18(a1, v16, v19);
                    uint64_t result = 3;
                    if (!v38 || v37 < 0) {
                      return result;
                    }
                    if (*(_DWORD *)(a1 + 4364)) {
                      sub_24FF645B4(a1);
                    }
                    if (*(void *)(a1 + 4112) - *(void *)(a1 + 4104) != *(void *)(a1 + 1192)
                                                                          - *(void *)(a1 + 1184))
                      return 3;
                    uint64_t result = sub_24FF64AC8(a1, a5, a6);
                    if (!result)
                    {
                      if (a7)
                      {
                        int v39 = *(unsigned char **)(a1 + 4104);
                        int v40 = *(unsigned char **)(a1 + 4112);
                        if (v40 != v39) {
                          memmove(a7, v39, v40 - v39);
                        }
                      }
                      if (v31)
                      {
                        LODWORD(v41) = 0;
                        int v42 = 0;
                        int v43 = *v47;
                        do
                        {
                          uint64_t v41 = (int)v41;
                          uint64_t v44 = v43;
                          unint64_t v45 = v22;
                          do
                          {
                            int v46 = *v44++;
                            *(_DWORD *)(a5 + 4 * v41++) += v46;
                            --v45;
                          }
                          while (v45);
                          ++v42;
                        }
                        while (v42 != v21);
                      }
                      uint64_t result = 0;
                      *a4 = *(unsigned int *)(a1 + 4328);
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

void sub_24FF645B4(uint64_t a1)
{
  uint64_t v79 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(unsigned int *)(a1 + 1116);
  unint64_t v3 = (int **)(a1 + 4248);
  sub_24FF65088(a1 + 4248, v2);
  memset_pattern16(__b, &unk_24FF7D710, 6uLL);
  __int16 v76 = 0x8000;
  __int16 v75 = 0x8000;
  if ((int)v2 >= 1)
  {
    uint64_t v4 = 0;
    uint64_t v5 = 1;
    do
    {
      uint64_t v6 = (unsigned int *)(*(void *)(a1 + 1256) + v4);
      uint64_t v7 = *v6;
      if ((v7 & 0x80000000) != 0) {
        int v8 = 0;
      }
      else {
        int v8 = (*v3)[v7 + 1];
      }
      uint64_t v9 = v6[1];
      if ((v9 & 0x80000000) != 0) {
        int v10 = 0;
      }
      else {
        int v10 = (*v3)[v9 + 1];
      }
      BOOL v11 = (unsigned int *)(*(void *)(a1 + 1280) + v4);
      uint64_t v12 = *v11;
      if ((v12 & 0x80000000) != 0) {
        int v13 = 0;
      }
      else {
        int v13 = (*v3)[v12 + 1];
      }
      uint64_t v14 = v11[1];
      if ((v14 & 0x80000000) != 0) {
        int v15 = 0;
      }
      else {
        int v15 = (*v3)[v14 + 1];
      }
      BOOL v16 = v13 == v15;
      if (v8 == v10) {
        BOOL v17 = v16 + 1;
      }
      else {
        BOOL v17 = v16;
      }
      if (sub_24FF5FDE8((unsigned int *)a1, &__b[v17]))
      {
        int v18 = 1;
      }
      else if (sub_24FF5FDE8((unsigned int *)a1, &v76))
      {
        int v18 = 0;
      }
      else
      {
        int v18 = sub_24FF5FED8((unsigned int *)a1, 0, &v75) + 2;
      }
      (*v3)[v5] += v18;
      v4 += 12;
      ++v5;
    }
    while (12 * v2 != v4);
  }
  sub_24FF650F8(v3);
  int v19 = *(_DWORD *)(a1 + 4332);
  sub_24FF5F2F4(a1 + 4128, 0);
  v78[0] = -1;
  sub_24FF62F6C(a1 + 4128, v19, v78);
  __int16 v74 = 0x8000;
  __int16 v73 = 0x8000;
  if ((int)v2 > 0)
  {
    uint64_t v20 = 0;
    int v21 = 0;
    uint64_t v22 = *(void *)(a1 + 4248);
    do
    {
      uint64_t v23 = v20 + 1;
      int v24 = *(_DWORD *)(v22 + 4 * (v20 + 1)) - *(_DWORD *)(v22 + 4 * v20);
      if (v24 >= 1)
      {
        do
        {
          if (sub_24FF5FDE8((unsigned int *)a1, &v74))
          {
            uint64_t v22 = *(void *)(a1 + 4248);
            int v25 = *(_DWORD *)(v22 + 4 * v20);
            uint64_t v26 = *(void *)(a1 + 4272);
            int v27 = *(_DWORD *)(v26 + 4 * v20);
            *(_DWORD *)(v26 + 4 * v20) = v27 + 1;
            *(_DWORD *)(*(void *)(a1 + 4296) + 4 * (v27 + v25)) = v21;
            int v28 = v21++;
            int v29 = (void *)(a1 + 4128);
            int v30 = v20;
          }
          else
          {
            int v31 = sub_24FF5FED8((unsigned int *)a1, 0, &v73);
            uint64_t v22 = *(void *)(a1 + 4248);
            int v32 = *(_DWORD *)(v22 + 4 * v20);
            uint64_t v33 = *(void *)(a1 + 4272);
            int v34 = *(_DWORD *)(v33 + 4 * v20);
            int v30 = v21 + ~v31;
            *(_DWORD *)(v33 + 4 * v20) = v34 + 1;
            int v28 = v34 + v32;
            int v29 = (void *)(a1 + 4296);
          }
          *(_DWORD *)(*v29 + 4 * v28) = v30;
          --v24;
        }
        while (v24);
      }
      ++v20;
    }
    while (v23 != v2);
  }
  uint64_t v35 = *(void *)(a1 + 4296);
  int v36 = (int **)(a1 + 4176);
  sub_24FF65088(a1 + 4176, v19);
  uint64_t v37 = *(unsigned int *)(a1 + 1120);
  v78[0] = 0;
  sub_24FF6A454(__p, (int)v2, v78);
  memset_pattern16(v78, &unk_24FF7D710, 0x28uLL);
  sub_24FF5F2F4(a1 + 4104, (uint64_t)(*(void *)(a1 + 1192) - *(void *)(a1 + 1184)) >> 2);
  if ((int)v37 >= 1)
  {
    uint64_t v38 = 0;
    int v39 = 0;
    uint64_t v69 = v37;
    do
    {
      uint64_t v40 = *(void *)(a1 + 1208);
      uint64_t v41 = *(int *)(v40 + 4 * v38);
      uint64_t v70 = v38 + 1;
      int v42 = *(_DWORD *)(v40 + 4 * (v38 + 1));
      if ((int)v41 < v42)
      {
        int v71 = __p[0];
        do
        {
          uint64_t v43 = *(int *)(*(void *)(a1 + 1184) + 4 * v41);
          int v44 = *(_DWORD *)(*(void *)(a1 + 4248) + 4 * v43);
          int v45 = *(_DWORD *)(*(void *)(a1 + 4272) + 4 * v43);
          if (v45 >= 2)
          {
            int v46 = v36;
            uint64_t v47 = v35;
            if (v39 >= 1) {
              int v48 = 1;
            }
            else {
              int v48 = v39;
            }
            int v49 = v71[v43];
            v71[v43] = v49 + 1;
            if (v49 >= 4) {
              int v50 = 4;
            }
            else {
              int v50 = v49;
            }
            int v51 = v48 + 2 * v50;
            if (sub_24FF5FDE8((unsigned int *)a1, &v78[v51]))
            {
              unsigned int v52 = v45 - 1;
              if ((v45 - 1) < 2)
              {
                int v39 = 1;
              }
              else
              {
                int v53 = (_WORD *)&v78[v51] + 1;
                int v39 = 1;
                do
                {
                  int v54 = sub_24FF5FDE8((unsigned int *)a1, v53);
                  v39 += v54;
                  if (v52 < 3) {
                    break;
                  }
                  --v52;
                }
                while ((v54 & 1) != 0);
              }
            }
            else
            {
              int v39 = 0;
            }
            v44 += v39;
            uint64_t v35 = v47;
            int v36 = v46;
          }
          int v55 = *(_DWORD *)(v35 + 4 * v44);
          *(_DWORD *)(*(void *)(a1 + 4104) + 4 * v41) = v55;
          ++(*v36)[v55 + 1];
          ++v41;
        }
        while (v42 != v41);
      }
      uint64_t v37 = v69;
      uint64_t v38 = v70;
    }
    while (v70 != v69);
  }
  sub_24FF650F8(v36);
  if ((int)v37 >= 1)
  {
    uint64_t v56 = 0;
    uint64_t v57 = *(void *)(a1 + 1208);
    do
    {
      uint64_t v58 = *(int *)(v57 + 4 * v56);
      uint64_t v59 = v56 + 1;
      uint64_t v60 = *(int *)(v57 + 4 * (v56 + 1));
      if ((int)v58 < (int)v60)
      {
        uint64_t v61 = *(void *)(a1 + 4176);
        uint64_t v62 = *(void *)(a1 + 4200);
        uint64_t v63 = *(void *)(a1 + 4224);
        uint64_t v64 = v60 - v58;
        int v65 = (int *)(*(void *)(a1 + 4104) + 4 * v58);
        do
        {
          uint64_t v66 = *v65++;
          int v67 = *(_DWORD *)(v61 + 4 * v66);
          int v68 = *(_DWORD *)(v62 + 4 * v66);
          *(_DWORD *)(v62 + 4 * v66) = v68 + 1;
          *(_DWORD *)(v63 + 4 * (v68 + v67)) = v56;
          --v64;
        }
        while (v64);
      }
      ++v56;
    }
    while (v59 != v37);
  }
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

void sub_24FF64AA4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_24FF64AC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_DWORD *)(a1 + 4360) == 1)
  {
    memset_pattern16(__b, &unk_24FF7D710, 4uLL);
    uint64_t v6 = *(unsigned int *)(a1 + 4332);
    if ((int)v6 >= 1)
    {
      uint64_t v7 = 0;
      while (1)
      {
        uint64_t v8 = *(unsigned int *)(*(void *)(a1 + 4128) + 4 * v7);
        int v21 = -1;
        uint64_t v20 = -1;
        int v19 = -1;
        uint64_t v18 = -1;
        if ((v8 & 0x80000000) != 0)
        {
LABEL_22:
          int v14 = 0;
          goto LABEL_23;
        }
        uint64_t v9 = (unsigned int *)(*(void *)(a1 + 1280) + 12 * v8);
        sub_24FF64CDC((void *)a1, v8, v7, (unsigned int *)(*(void *)(a1 + 1256) + 12 * v8), &v20);
        sub_24FF64CDC((void *)a1, v8, v7, v9, &v18);
        int v10 = v21;
        if ((v21 & 0x80000000) == 0 || v19 < 0)
        {
          int v12 = v21;
          int v10 = v19;
        }
        else
        {
          uint64_t v11 = v20;
          uint64_t v20 = v18;
          int v12 = v19;
          int v21 = v19;
          uint64_t v18 = v11;
        }
        if (v10 != -1)
        {
          BOOL v13 = *(unsigned __int8 *)(a3 + SHIDWORD(v20))
              + *(unsigned __int8 *)(a3 + (int)v20)
              + *(unsigned __int8 *)(a3 + v12)
              + *(unsigned __int8 *)(a3 + (int)v18)
              + *(unsigned __int8 *)(a3 + SHIDWORD(v18))
              + *(unsigned __int8 *)(a3 + v10) > 2;
          goto LABEL_13;
        }
        if (v12 != -1)
        {
          BOOL v13 = *(unsigned __int8 *)(a3 + SHIDWORD(v20))
              + *(unsigned __int8 *)(a3 + (int)v20)
              + *(unsigned __int8 *)(a3 + v12) > 1;
LABEL_13:
          int v14 = v13;
          goto LABEL_23;
        }
        if (HIDWORD(v20) == -1) {
          break;
        }
        int v14 = *(unsigned __int8 *)(a3 + (int)v20);
        if (*(unsigned char *)(a3 + (int)v20))
        {
          int v15 = *(unsigned __int8 *)(a3 + SHIDWORD(v20));
LABEL_21:
          int v14 = v15 != 0;
        }
LABEL_23:
        *(unsigned char *)(a3 + v7++) = sub_24FF5FDE8((unsigned int *)a1, &__b[v14]);
        if (v6 == v7) {
          goto LABEL_24;
        }
      }
      if (v20 == -1) {
        goto LABEL_22;
      }
      int v15 = *(unsigned __int8 *)(a3 + (int)v20);
      goto LABEL_21;
    }
  }
LABEL_24:
  uint64_t v16 = *(unsigned int *)(a1 + 4376);
  if (v16 > 6) {
    return 3;
  }
  ((void (*)(uint64_t, uint64_t, uint64_t))off_270165178[2 * v16])(a1, a2, a3);
  return 0;
}

void *sub_24FF64CDC(void *result, unsigned int a2, int a3, unsigned int *a4, _DWORD *a5)
{
  uint64_t v5 = *a4;
  *(void *)a5 = -1;
  a5[2] = -1;
  if ((v5 & 0x80000000) == 0)
  {
    uint64_t v7 = result;
    uint64_t v8 = a5 + 1;
    uint64_t v35 = result[537];
    uint64_t v9 = result[534];
    int v10 = *(_DWORD *)(v9 + 4 * a2);
    uint64_t v11 = a4[2];
    uint64_t v12 = (int)a4[1];
    uint64_t v13 = a4[1];
    if ((v11 & 0x80000000) != 0)
    {
      if ((v12 & 0x80000000) == 0)
      {
        int v20 = *(_DWORD *)(v9 + 4 * v5);
        int v21 = *(_DWORD *)(v9 + 4 * v13);
        if (v10 == 1 && v20 == 1 && v21 == 1)
        {
          uint64_t v34 = result[531];
          *a5 = *(_DWORD *)(v35 + 4 * *(int *)(v34 + 4 * v5));
          a5[1] = *(_DWORD *)(v35 + 4 * *(int *)(v34 + 4 * v13));
        }
        else
        {
          return sub_24FF64F00(result, a3, a2, v5, v13, a5, v8);
        }
      }
    }
    else
    {
      int v14 = *(_DWORD *)(v9 + 4 * v5);
      int v15 = *(_DWORD *)(v9 + 4 * v12);
      if (v10 == 1 && v14 == 1 && v15 == 1)
      {
        uint64_t v24 = result[531];
        int v19 = *(_DWORD *)(v35 + 4 * *(int *)(v24 + 4 * v5));
        *a5 = v19;
        a5[1] = *(_DWORD *)(v35 + 4 * *(int *)(v24 + 4 * v12));
        if (v19 < 0) {
          return result;
        }
      }
      else
      {
        uint64_t v18 = a4[1];
        uint64_t result = sub_24FF64F00(result, a3, a2, v5, v12, a5, v8);
        uint64_t v13 = v18;
        int v19 = *a5;
        if ((*a5 & 0x80000000) != 0) {
          return result;
        }
      }
      int v25 = *v8;
      if ((v25 & 0x80000000) == 0)
      {
        uint64_t v26 = *(int *)(v7[534] + 4 * v11);
        if (v26 == 1 && v14 == 1 && v15 == 1)
        {
          a5[2] = *(_DWORD *)(v35 + 4 * *(int *)(v7[531] + 4 * v11));
        }
        else if ((int)v26 >= 1)
        {
          uint64_t v29 = *(int *)(v7[531] + 4 * v11);
          uint64_t v30 = v29 + v26;
          do
          {
            int v31 = *(_DWORD *)(v35 + 4 * v29);
            uint64_t v36 = 0;
            uint64_t v32 = v13;
            uint64_t result = sub_24FF64F00(v7, v31, v11, v5, v13, (_DWORD *)&v36 + 1, (int *)&v36);
            if (HIDWORD(v36) == v19 && v36 == v25) {
              a5[2] = v31;
            }
            ++v29;
            uint64_t v13 = v32;
          }
          while (v29 < v30);
        }
      }
    }
  }
  return result;
}

void *sub_24FF64F00(void *result, int a2, int a3, int a4, int a5, _DWORD *a6, int *a7)
{
  uint64_t v7 = *(int *)(result[525] + 4 * a2);
  if ((int)v7 >= 1)
  {
    uint64_t v8 = *(int *)(result[522] + 4 * a2);
    uint64_t v9 = v8 + v7;
    uint64_t v10 = result[148];
    while (2)
    {
      uint64_t v11 = (int *)(result[151] + 4 * *(int *)(result[528] + 4 * v8));
      uint64_t v12 = *v11;
      uint64_t v13 = v11[1];
      int v14 = *(_DWORD *)(v10 + 4 * v12);
      uint64_t v15 = (int)v12 + 1;
      uint64_t v16 = 4 * v15 - 4;
      uint64_t v17 = v15 + 1;
      while (v17 < v13)
      {
        int v18 = *(_DWORD *)(v10 + v16 + 4);
        int v19 = *(_DWORD *)(v10 + v16 + 8);
        if (v14 == a3 && v18 == a4 && v19 == a5)
        {
          uint64_t v27 = result[513] + v16;
          *a6 = *(_DWORD *)(v27 + 4);
LABEL_41:
          int v26 = *(_DWORD *)(v27 + 8);
          goto LABEL_45;
        }
        if (v14 == a3 && v19 == a4 && v18 == a5)
        {
          uint64_t v28 = result[513] + v16;
          *a7 = *(_DWORD *)(v28 + 4);
LABEL_43:
          int v33 = *(_DWORD *)(v28 + 8);
          goto LABEL_46;
        }
        if (v18 == a3 && v14 == a4 && v19 == a5)
        {
          uint64_t v29 = result[513];
          *a6 = *(_DWORD *)(v29 + 4 * v12);
          uint64_t v27 = v29 + v16;
          goto LABEL_41;
        }
        if (v18 == a3 && v19 == a4 && v14 == a5)
        {
          uint64_t v30 = result[513];
          *a7 = *(_DWORD *)(v30 + 4 * v12);
          uint64_t v28 = v30 + v16;
          goto LABEL_43;
        }
        if (v19 == a3 && v14 == a4 && v18 == a5)
        {
          uint64_t v31 = result[513];
          *a6 = *(_DWORD *)(v31 + 4 * v12);
          int v26 = *(_DWORD *)(v31 + v16 + 4);
          goto LABEL_45;
        }
        v16 += 4;
        ++v17;
        if (v19 == a3 && v18 == a4 && v14 == a5)
        {
          uint64_t v32 = result[513];
          *a7 = *(_DWORD *)(v32 + 4 * v12);
          int v33 = *(_DWORD *)(v32 + v16);
LABEL_46:
          *a6 = v33;
          return result;
        }
      }
      if (++v8 < v9) {
        continue;
      }
      break;
    }
  }
  int v26 = -1;
  *a6 = -1;
LABEL_45:
  *a7 = v26;
  return result;
}

void sub_24FF65088(uint64_t a1, int a2)
{
  uint64_t v3 = a1;
  sub_24FF5F2F4(a1, 0);
  int v5 = 0;
  sub_24FF62F6C(v3, a2 + 1, &v5);
  v3 += 24;
  sub_24FF5F2F4(v3, 0);
  int v4 = 0;
  sub_24FF62F6C(v3, a2, &v4);
}

void sub_24FF650F8(int **a1)
{
  uint64_t v2 = *a1;
  long long v1 = a1[1];
  unint64_t v3 = (char *)v1 - (char *)*a1;
  if ((int)(v3 >> 2) >= 2)
  {
    uint64_t v4 = (v3 >> 2);
    int v7 = *v2;
    int v5 = v2 + 1;
    int v6 = v7;
    uint64_t v8 = v4 - 1;
    do
    {
      v6 += *v5;
      *v5++ = v6;
      --v8;
    }
    while (v8);
  }
  sub_24FF5F2F4((uint64_t)(a1 + 6), *(v1 - 1));
}

void sub_24FF65138(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v152 = *MEMORY[0x263EF8340];
  int v133 = (void *)(a1 + 4056);
  uint64_t v139 = *(int *)(a1 + 4336);
  int v137 = ~(-1 << (*(_DWORD *)(a1 + 4348) - 1));
  int v138 = *(_DWORD *)(a1 + 4360);
  uint64_t v134 = *(unsigned int *)(a1 + 4332);
  sub_24FF65ECC((void *)(a1 + 1160), (void *)(a1 + 1208), (void *)(a1 + 1184), (uint64_t *)(a1 + 4104), v134, (uint64_t *)(a1 + 4152), v137);
  uint64_t v5 = 0;
  uint64_t v151 = 0;
  memset(v150, 0, sizeof(v150));
  do
  {
    sub_24FF60D8C((uint64_t)v150 + v5, v139);
    v5 += 120;
  }
  while (v5 != 360);
  memset_pattern16(__b, &unk_24FF7D710, 6uLL);
  memset_pattern16(v148, &unk_24FF7D710, 6uLL);
  __int16 v147 = 0x8000;
  __int16 v146 = 0x8000;
  if ((int)v134 > 0)
  {
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    uint64_t v132 = a3;
    int32x2_t v8 = vdup_n_s32(v137);
    int v131 = 2 * v137;
    uint64_t v9 = (int *)(a2 + 4);
    while (v138 && !*(unsigned char *)(a3 + v7))
    {
LABEL_163:
      ++v7;
      v9 += v139;
      v6 += 12;
      if (v134 == v7) {
        goto LABEL_166;
      }
    }
    uint64_t v10 = *(unsigned int *)(*(void *)(a1 + 4128) + 4 * v7);
    uint64_t v11 = (int32x2_t *)(*(void *)(a1 + 4152) + v6);
    int v12 = v11[1].i32[0];
    int v13 = v12;
    int32x2_t v135 = *v11;
    if ((v10 & 0x80000000) == 0)
    {
      v145[0] = -1;
      unint64_t v144 = -1;
      v143[0] = -1;
      uint64_t v142 = -1;
      sub_24FF64CDC((void *)a1, v10, v7, (unsigned int *)(*(void *)(a1 + 1256) + 12 * v10), &v144);
      sub_24FF64CDC((void *)a1, v10, v7, (unsigned int *)(*(void *)(a1 + 1280) + 12 * v10), &v142);
      int v14 = v145[0];
      int v15 = v143[0];
      if ((v145[0] & 0x80000000) == 0 || (v143[0] & 0x80000000) != 0)
      {
        int v17 = v142;
        int v16 = HIDWORD(v142);
        int v18 = v145[0];
      }
      else
      {
        int v17 = v144;
        int v16 = HIDWORD(v144);
        unint64_t v144 = v142;
        int v18 = v143[0];
        v145[0] = v143[0];
        int v15 = v14;
      }
      int v19 = HIDWORD(v144);
      if (v15 != -1
        && (!v138
         || *(unsigned char *)(a3 + (int)v144)
         && *(unsigned char *)(a3 + SHIDWORD(v144))
         && *(unsigned char *)(a3 + v18)
         && *(unsigned char *)(a3 + v17)
         && *(unsigned char *)(a3 + v16)
         && *(unsigned char *)(a3 + v15)))
      {
        int v128 = v17;
        int v129 = v16;
        int32x2_t v20 = vsub_s32(*(int32x2_t *)(a2 + 4 * (int)v144 * (int)v139), v8);
        int32x2_t v21 = vabs_s32(vrev64_s32(v20));
        int v130 = v137 - v21.i32[1] - v21.i32[0];
        if (v130 < 0) {
          int32x2_t v20 = (int32x2_t)vbsl_s8((int8x8_t)vcltz_s32(v20), (int8x8_t)vsub_s32(v21, v8), (int8x8_t)__PAIR64__(v137 - v21.i32[1], v137 - v21.i32[0]));
        }
        BOOL v22 = sub_24FF5FDE8((unsigned int *)a1, v148);
        uint64_t v23 = 2;
        if (!v22) {
          uint64_t v23 = 1;
        }
        if (sub_24FF5FDE8((unsigned int *)a1, &v148[v23])) {
          int v24 = 2;
        }
        else {
          int v24 = 0;
        }
        int v25 = v24 | v22;
        if (v25 == 2)
        {
          int32x2_t v57 = vsub_s32(*(int32x2_t *)(a2 + 4 * v128 * (int)v139), v8);
          int32x2_t v58 = vabs_s32(vrev64_s32(v57));
          int v59 = v137 - v58.i32[1] - v58.i32[0];
          if (v59 < 0) {
            int32x2_t v57 = (int32x2_t)vbsl_s8((int8x8_t)vcltz_s32(v57), (int8x8_t)vsub_s32(v58, v8), (int8x8_t)__PAIR64__(v137 - v58.i32[1], v137 - v58.i32[0]));
          }
          int32x2_t v60 = vsub_s32(*(int32x2_t *)(a2 + 4 * v129 * (int)v139), v8);
          int32x2_t v61 = vabs_s32(vrev64_s32(v60));
          int v62 = v137 - v61.i32[1] - v61.i32[0];
          if (v62 < 0) {
            int32x2_t v60 = (int32x2_t)vbsl_s8((int8x8_t)vcltz_s32(v60), (int8x8_t)vsub_s32(v61, v8), (int8x8_t)__PAIR64__(v137 - v61.i32[1], v137 - v61.i32[0]));
          }
          int32x2_t v63 = vsub_s32(*(int32x2_t *)(a2 + 4 * v15 * (int)v139), v8);
          int32x2_t v64 = vabs_s32(vrev64_s32(v63));
          if (v137 - v64.i32[1] - v64.i32[0] < 0) {
            int32x2_t v63 = (int32x2_t)vbsl_s8((int8x8_t)vcltz_s32(v63), (int8x8_t)vsub_s32(v64, v8), (int8x8_t)__PAIR64__(v137 - v64.i32[1], v137 - v64.i32[0]));
          }
          double v26 = COERCE_DOUBLE(vsub_s32(vadd_s32(v60, v57), v63));
          int v12 = v62 + v59 - (v137 - v64.i32[1] - v64.i32[0]);
        }
        else if (v25 == 1)
        {
          int32x2_t v65 = vsub_s32(*(int32x2_t *)(a2 + 4 * v19 * (int)v139), v8);
          int32x2_t v66 = vabs_s32(vrev64_s32(v65));
          int v67 = v137 - v66.i32[1] - v66.i32[0];
          if (v67 < 0) {
            int32x2_t v65 = (int32x2_t)vbsl_s8((int8x8_t)vcltz_s32(v65), (int8x8_t)vsub_s32(v66, v8), (int8x8_t)__PAIR64__(v137 - v66.i32[1], v137 - v66.i32[0]));
          }
          int32x2_t v68 = vsub_s32(*(int32x2_t *)(a2 + 4 * v18 * (int)v139), v8);
          int32x2_t v69 = vabs_s32(vrev64_s32(v68));
          int v70 = v137 - v69.i32[1] - v69.i32[0];
          if (v70 < 0) {
            int32x2_t v68 = (int32x2_t)vbsl_s8((int8x8_t)vcltz_s32(v68), (int8x8_t)vsub_s32(v69, v8), (int8x8_t)__PAIR64__(v137 - v69.i32[1], v137 - v69.i32[0]));
          }
          double v26 = COERCE_DOUBLE(vsub_s32(vadd_s32(v65, v20), v68));
          int v12 = v67 + v130 - v70;
        }
        else if (v25)
        {
          int32x2_t v71 = vsub_s32(*(int32x2_t *)(a2 + 4 * v19 * (int)v139), v8);
          int32x2_t v72 = vabs_s32(vrev64_s32(v71));
          int v73 = v137 - v72.i32[1] - v72.i32[0];
          if (v73 < 0) {
            int32x2_t v71 = (int32x2_t)vbsl_s8((int8x8_t)vcltz_s32(v71), (int8x8_t)vsub_s32(v72, v8), (int8x8_t)__PAIR64__(v137 - v72.i32[1], v137 - v72.i32[0]));
          }
          int32x2_t v74 = vsub_s32(*(int32x2_t *)(a2 + 4 * v18 * (int)v139), v8);
          int32x2_t v75 = vabs_s32(vrev64_s32(v74));
          int v76 = v137 - v75.i32[1] - v75.i32[0];
          if (v76 < 0) {
            int32x2_t v74 = (int32x2_t)vbsl_s8((int8x8_t)vcltz_s32(v74), (int8x8_t)vsub_s32(v75, v8), (int8x8_t)__PAIR64__(v137 - v75.i32[1], v137 - v75.i32[0]));
          }
          int32x2_t v77 = vsub_s32(*(int32x2_t *)(a2 + 4 * v128 * (int)v139), v8);
          int32x2_t v78 = vabs_s32(vrev64_s32(v77));
          int v79 = v137 - v78.i32[1] - v78.i32[0];
          if (v79 < 0) {
            int32x2_t v77 = (int32x2_t)vbsl_s8((int8x8_t)vcltz_s32(v77), (int8x8_t)vsub_s32(v78, v8), (int8x8_t)__PAIR64__(v137 - v78.i32[1], v137 - v78.i32[0]));
          }
          int32x2_t v80 = vsub_s32(*(int32x2_t *)(a2 + 4 * v129 * (int)v139), v8);
          int32x2_t v81 = vabs_s32(vrev64_s32(v80));
          int v82 = v137 - v81.i32[1] - v81.i32[0];
          if (v82 < 0) {
            int32x2_t v80 = (int32x2_t)vbsl_s8((int8x8_t)vcltz_s32(v80), (int8x8_t)vsub_s32(v81, v8), (int8x8_t)__PAIR64__(v137 - v81.i32[1], v137 - v81.i32[0]));
          }
          int32x2_t v83 = vsub_s32(*(int32x2_t *)(a2 + 4 * v15 * (int)v139), v8);
          int32x2_t v84 = vabs_s32(vrev64_s32(v83));
          if (v137 - v84.i32[1] - v84.i32[0] < 0) {
            int32x2_t v83 = (int32x2_t)vbsl_s8((int8x8_t)vcltz_s32(v83), (int8x8_t)vsub_s32(v84, v8), (int8x8_t)__PAIR64__(v137 - v84.i32[1], v137 - v84.i32[0]));
          }
          uint32x2_t v85 = (uint32x2_t)vadd_s32(v77, v20);
          BOOL v86 = __OFADD__(v79, v130);
          int v87 = v79 + v130;
          if (v87 < 0 != v86) {
            ++v87;
          }
          int32x2_t v88 = vadd_s32(v80, v71);
          int64x2_t v89 = vmull_s32(vsub_s32(vsra_n_s32(vadd_s32(v88, v88), (int32x2_t)vsra_n_u32(v85, v85, 0x1FuLL), 1uLL), vadd_s32(v74, v83)), vdup_n_s32(0x55555556u));
          double v26 = COERCE_DOUBLE(vadd_s32(vshrn_n_s64(v89, 0x20uLL), vmovn_s64((int64x2_t)vshrq_n_u64((uint64x2_t)v89, 0x3FuLL))));
          unint64_t v90 = 1431655766 * ((v87 >> 1) + 2 * (v82 + v73) - (v76 + v137 - v84.i32[1] - v84.i32[0]));
          int v12 = HIDWORD(v90) + (v90 >> 63);
        }
        else
        {
          double v26 = *(double *)&v135;
          int32x2_t v27 = vzip1_s32(v20, v135);
          int32x2_t v28 = vzip2_s32(v20, v135);
          if (v27.i32[0] * (uint64_t)v27.i32[1] + v12 * (uint64_t)v130 + v28.i32[0] * (uint64_t)v28.i32[1] < 0)
          {
            double v26 = COERCE_DOUBLE(vneg_s32(v135));
            int v12 = -v12;
          }
        }
        unsigned int v49 = 2;
        goto LABEL_110;
      }
      if (v18 != -1 && (!v138 || *(unsigned char *)(a3 + (int)v144) && *(unsigned char *)(a3 + SHIDWORD(v144)) && *(unsigned char *)(a3 + v18)))
      {
        int32x2_t v29 = vsub_s32(*(int32x2_t *)(a2 + 4 * (int)v144 * (int)v139), v8);
        int32x2_t v30 = vabs_s32(vrev64_s32(v29));
        int v31 = v137 - v30.i32[1] - v30.i32[0];
        if (v31 < 0) {
          int32x2_t v29 = (int32x2_t)vbsl_s8((int8x8_t)vcltz_s32(v29), (int8x8_t)vsub_s32(v30, v8), (int8x8_t)__PAIR64__(v137 - v30.i32[1], v137 - v30.i32[0]));
        }
        int32x2_t v32 = vsub_s32(*(int32x2_t *)(a2 + 4 * HIDWORD(v144) * (int)v139), v8);
        int32x2_t v33 = vabs_s32(vrev64_s32(v32));
        int v34 = v137 - v33.i32[1] - v33.i32[0];
        if (v34 < 0) {
          int32x2_t v32 = (int32x2_t)vbsl_s8((int8x8_t)vcltz_s32(v32), (int8x8_t)vsub_s32(v33, v8), (int8x8_t)__PAIR64__(v137 - v33.i32[1], v137 - v33.i32[0]));
        }
        int32x2_t v35 = vsub_s32(*(int32x2_t *)(a2 + 4 * v18 * (int)v139), v8);
        int32x2_t v36 = vabs_s32(vrev64_s32(v35));
        int v37 = v137 - v36.i32[1] - v36.i32[0];
        if (v37 < 0) {
          int32x2_t v35 = (int32x2_t)vbsl_s8((int8x8_t)vcltz_s32(v35), (int8x8_t)vsub_s32(v36, v8), (int8x8_t)__PAIR64__(v137 - v36.i32[1], v137 - v36.i32[0]));
        }
        BOOL v38 = sub_24FF5FDE8((unsigned int *)a1, __b);
        uint64_t v39 = 2;
        if (!v38) {
          uint64_t v39 = 1;
        }
        if (sub_24FF5FDE8((unsigned int *)a1, &__b[v39])) {
          int v40 = 2;
        }
        else {
          int v40 = 0;
        }
        int v41 = v40 | v38;
        if (v41 == 2)
        {
          uint32x2_t v91 = (uint32x2_t)vsub_s32(v32, (int32x2_t)vmvn_s8((int8x8_t)v29));
          double v26 = COERCE_DOUBLE(vshr_n_s32((int32x2_t)vsra_n_u32(v91, v91, 0x1FuLL), 1uLL));
          if (v31 + v34 + 1 >= 0) {
            int v92 = v31 + v34 + 1;
          }
          else {
            int v92 = v31 + v34 + 2;
          }
          int v12 = v92 >> 1;
        }
        else if (v41 == 1)
        {
          double v26 = COERCE_DOUBLE(vsub_s32(vadd_s32(v32, v29), v35));
          int v12 = v34 + v31 - v37;
        }
        else if (v41)
        {
          int64x2_t v93 = vmull_s32(vadd_s32(vsub_s32(v32, (int32x2_t)vmvn_s8((int8x8_t)v29)), v35), vdup_n_s32(0x55555556u));
          double v26 = COERCE_DOUBLE(vadd_s32(vshrn_n_s64(v93, 0x20uLL), vmovn_s64((int64x2_t)vshrq_n_u64((uint64x2_t)v93, 0x3FuLL))));
          int v12 = (v31 + v34 + v37 + 1) / 3;
        }
        else
        {
          double v26 = *(double *)&v135;
          int32x2_t v42 = vzip1_s32(v29, v135);
          int32x2_t v43 = vzip2_s32(v29, v135);
          if (v42.i32[0] * (uint64_t)v42.i32[1] + v12 * (uint64_t)v31 + v43.i32[0] * (uint64_t)v43.i32[1] < 0)
          {
            double v26 = COERCE_DOUBLE(vneg_s32(v135));
            int v12 = -v12;
          }
        }
        unsigned int v49 = 1;
        goto LABEL_110;
      }
      if (HIDWORD(v144) != -1 && (!v138 || *(unsigned char *)(a3 + (int)v144) && *(unsigned char *)(a3 + SHIDWORD(v144))))
      {
        int32x2_t v44 = vsub_s32(*(int32x2_t *)(a2 + 4 * (int)v144 * (int)v139), v8);
        int32x2_t v45 = vabs_s32(vrev64_s32(v44));
        int v46 = v137 - v45.i32[1] - v45.i32[0];
        if (v46 < 0) {
          int32x2_t v44 = (int32x2_t)vbsl_s8((int8x8_t)vcltz_s32(v44), (int8x8_t)vsub_s32(v45, v8), (int8x8_t)__PAIR64__(v137 - v45.i32[1], v137 - v45.i32[0]));
        }
        if (sub_24FF5FDE8((unsigned int *)a1, &v147))
        {
          int32x2_t v47 = vsub_s32(*(int32x2_t *)(a2 + 4 * v19 * (int)v139), v8);
          int32x2_t v48 = vabs_s32(vrev64_s32(v47));
          if (v137 - v48.i32[1] - v48.i32[0] < 0) {
            int32x2_t v47 = (int32x2_t)vbsl_s8((int8x8_t)vcltz_s32(v47), (int8x8_t)vsub_s32(v48, v8), (int8x8_t)__PAIR64__(v137 - v48.i32[1], v137 - v48.i32[0]));
          }
          unsigned int v49 = 0;
          uint32x2_t v50 = (uint32x2_t)vsub_s32(v47, (int32x2_t)vmvn_s8((int8x8_t)v44));
          __int32 v51 = v46 + v137 - v48.i32[1] - v48.i32[0];
          double v26 = COERCE_DOUBLE(vshr_n_s32((int32x2_t)vsra_n_u32(v50, v50, 0x1FuLL), 1uLL));
          if (v51 + 1 >= 0) {
            int v52 = v51 + 1;
          }
          else {
            int v52 = v51 + 2;
          }
          int v12 = v52 >> 1;
LABEL_110:
          int v94 = LODWORD(v26);
          int v141 = LODWORD(v26);
          int v95 = HIDWORD(v26);
          int v140 = HIDWORD(v26);
          int32x2_t v96 = vabs_s32(*(int32x2_t *)&v26);
          unsigned int v97 = v96.u32[1];
          if (v12 >= 0) {
            unsigned int v98 = v12;
          }
          else {
            unsigned int v98 = -v12;
          }
          unsigned int v99 = v96.i32[0];
          BOOL v101 = v96.i32[0] < (unsigned __int32)v96.i32[1] || v96.i32[0] < v98;
          if (v101)
          {
            unsigned int v99 = v98;
            int v102 = HIDWORD(v26);
            int v103 = LODWORD(v26);
            if (v96.i32[1] < v98) {
              goto LABEL_124;
            }
            uint64_t v104 = &v140;
            unsigned int v99 = v96.u32[1];
            int v102 = v12;
            int v103 = LODWORD(v26);
          }
          else
          {
            uint64_t v104 = &v141;
            int v102 = HIDWORD(v26);
            int v103 = v12;
          }
          *uint64_t v104 = v12;
LABEL_124:
          unint64_t v144 = __PAIR64__(v102, v103);
          v145[0] = v99;
          sub_24FF5F900((unsigned int *)a1, (uint64_t)&v144, v139, v133, (unsigned char *)(a1 + 4372), (void *)v150 + 15 * v49, (uint64_t)&v142);
          int v106 = v142;
          int v105 = HIDWORD(v142);
          if ((int)v142 >= 0) {
            int v107 = v142;
          }
          else {
            int v107 = -(int)v142;
          }
          if (v142 >= 0) {
            int v108 = HIDWORD(v142);
          }
          else {
            int v108 = -HIDWORD(v142);
          }
          int v109 = v137 - v107;
          int v110 = v137 - v107 - v108;
          if (v110 < 0)
          {
            int v113 = v137 - v108;
            int v114 = v108 - v137;
            if ((int)v142 >= 0) {
              int v106 = v113;
            }
            else {
              int v106 = v114;
            }
            int v115 = v107 - v137;
            if (v142 >= 0) {
              int v105 = v109;
            }
            else {
              int v105 = v115;
            }
            if (v101) {
              goto LABEL_132;
            }
          }
          else if (v101)
          {
LABEL_132:
            if (v12 >= 0) {
              int v111 = v110;
            }
            else {
              int v111 = -v110;
            }
            if (v95 < 0) {
              int v110 = -v110;
            }
            if (v97 >= v98) {
              int v112 = v105;
            }
            else {
              int v112 = v111;
            }
            if (v97 >= v98) {
              int v105 = v110;
            }
            goto LABEL_152;
          }
          int v112 = v106;
          if (v94 >= 0) {
            int v106 = v110;
          }
          else {
            int v106 = -v110;
          }
LABEL_152:
          if (v105 >= 0) {
            int v116 = v105;
          }
          else {
            int v116 = -v105;
          }
          if (v106 < 0)
          {
            int v117 = -v106;
          }
          else
          {
            int v116 = v131 - v116;
            int v117 = v106;
          }
          if (v105 >= 0) {
            int v117 = v131 - v117;
          }
          int v118 = v106 + v137;
          int v119 = v105 + v137;
          if (v112 < 0)
          {
            int v118 = v116;
            int v119 = v117;
          }
          *(v9 - 1) = v118;
          int *v9 = v119;
          a3 = v132;
          goto LABEL_163;
        }
        double v26 = *(double *)&v135;
        int32x2_t v55 = vzip1_s32(v44, v135);
        int32x2_t v56 = vzip2_s32(v44, v135);
        if (v55.i32[0] * (uint64_t)v55.i32[1] + v12 * (uint64_t)v46 + v56.i32[0] * (uint64_t)v56.i32[1] < 0)
        {
          unsigned int v49 = 0;
          double v26 = COERCE_DOUBLE(vneg_s32(v135));
          int v12 = -v12;
          goto LABEL_110;
        }
LABEL_76:
        unsigned int v49 = 0;
        goto LABEL_110;
      }
      int v13 = v12;
    }
    if (sub_24FF6625C(a1, v7, a2, a3, (uint64_t)&v144))
    {
      if (sub_24FF5FDE8((unsigned int *)a1, &v147))
      {
        int v12 = v145[0];
        double v26 = *(double *)&v144;
      }
      else
      {
        double v26 = *(double *)&v135;
        if ((int)v144 * (uint64_t)v135.i32[0] + SHIDWORD(v144) * (uint64_t)v135.i32[1] + v145[0] * (uint64_t)v13 < 0)
        {
          double v26 = COERCE_DOUBLE(vneg_s32(v135));
          int v12 = -v12;
        }
      }
    }
    else
    {
      BOOL v53 = sub_24FF5FDE8((unsigned int *)a1, &v146);
      double v26 = *(double *)&v135;
      double v54 = COERCE_DOUBLE(vneg_s32(v135));
      if (v53)
      {
        int v12 = -v12;
        double v26 = v54;
      }
    }
    goto LABEL_76;
  }
LABEL_166:
  unint64_t v120 = 360;
  do
  {
    int v121 = (char *)v150 + v120;
    int v122 = *(void **)&v145[v120 / 4];
    if (v122)
    {
      *((void *)v121 - 2) = v122;
      operator delete(v122);
    }
    uint64_t v123 = (void *)*((void *)v121 - 6);
    if (v123)
    {
      *(void *)&v143[v120 / 4] = v123;
      operator delete(v123);
    }
    uint64_t v124 = (char *)v150 + v120;
    int v125 = *(void **)((char *)&v150[-4] + v120 - 8);
    if (v125)
    {
      *((void *)v124 - 8) = v125;
      operator delete(v125);
    }
    uint64_t v126 = (void *)*((void *)v124 - 12);
    if (v126)
    {
      *(void *)((char *)&v150[-5] + v120 - 8) = v126;
      operator delete(v126);
    }
    uint64_t v127 = (void *)*((void *)v121 - 15);
    if (v127)
    {
      *(void *)((char *)&v150[-7] + v120) = v127;
      operator delete(v127);
    }
    v120 -= 120;
  }
  while (v120);
}

void sub_24FF65EA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  for (uint64_t i = 240; i != -120; i -= 120)
    sub_24FF60EC8((uint64_t)(&a31 + i));
  _Unwind_Resume(a1);
}

void sub_24FF65ECC(void *a1, void *a2, void *a3, uint64_t *a4, int a5, uint64_t *a6, int a7)
{
  unint64_t v12 = a2[1] - *a2;
  size_t v13 = a5;
  sub_24FF68D38(a6, a5);
  uint64_t v14 = a6[1] - *a6;
  if (v14 >= 1) {
    bzero((void *)*a6, 12 * (v14 / 0xCuLL - ((unint64_t)v14 > 0xB)) + 12);
  }
  LOBYTE(v71) = 0;
  sub_24FF69F18(__p, v13, &v71);
  if ((int)(v12 >> 2) >= 2)
  {
    uint64_t v15 = 0;
    uint64_t v16 = (v12 >> 2) - 1;
    do
    {
      uint64_t v17 = *(int *)(*a2 + 4 * v15++);
      int v18 = *(_DWORD *)(*a2 + 4 * v15) - 1;
      if ((int)v17 + 1 >= v18) {
        continue;
      }
      uint64_t v19 = v17 + 1;
      do
      {
        uint64_t v20 = 0;
        int v21 = *(_DWORD *)(*a3 + 4 * v17);
        uint64_t v22 = 4 * v19;
        int v23 = *(_DWORD *)(*a3 + 4 * v19++);
        int v24 = *(_DWORD *)(*a3 + 4 * v19);
        uint64_t v25 = *a4;
        int v71 = *(_DWORD *)(*a4 + 4 * v17);
        uint64_t v72 = *(void *)(v25 + v22);
        double v26 = (int *)(*a1 + 12 * v21);
        int32x2_t v27 = (int *)(*a1 + 12 * v23);
        int32x2_t v28 = (int *)(*a1 + 12 * v24);
        uint64_t v29 = *v26;
        uint64_t v30 = v26[1];
        uint64_t v31 = *v27 - v29;
        uint64_t v32 = *v28 - v29;
        uint64_t v33 = v27[1] - v30;
        uint64_t v34 = v28[1] - v30;
        uint64_t v35 = v26[2];
        uint64_t v36 = v27[2] - v35;
        uint64_t v37 = v28[2] - v35;
        uint64_t v38 = v37 * v33 - v34 * v36;
        uint64_t v39 = v32 * v36 - v37 * v31;
        uint64_t v40 = v34 * v31 - v32 * v33;
        do
        {
          uint64_t v41 = *(int *)((char *)&v71 + v20);
          int32x2_t v42 = (int *)(*a6 + 12 * (int)v41);
          char v43 = *((unsigned char *)__p[0] + v41);
          if (!v43)
          {
            uint64_t v48 = v39 + v42[1];
            uint64_t v49 = v40 + v42[2];
            uint64_t v45 = v38;
            goto LABEL_18;
          }
          uint64_t v44 = 1 << (v43 - 1);
          if (v38 < 0)
          {
            uint64_t v45 = -((v44 - v38) >> v43);
            if ((v39 & 0x8000000000000000) == 0)
            {
LABEL_11:
              uint64_t v46 = (v44 + v39) >> v43;
              if (v40 < 0) {
                goto LABEL_16;
              }
              goto LABEL_12;
            }
          }
          else
          {
            uint64_t v45 = (v44 + v38) >> v43;
            if ((v39 & 0x8000000000000000) == 0) {
              goto LABEL_11;
            }
          }
          uint64_t v46 = -((v44 - v39) >> v43);
          if (v40 < 0)
          {
LABEL_16:
            uint64_t v47 = -((v44 - v40) >> v43);
            goto LABEL_17;
          }
LABEL_12:
          uint64_t v47 = (v44 + v40) >> v43;
LABEL_17:
          uint64_t v48 = v46 + v42[1];
          uint64_t v49 = v47 + v42[2];
LABEL_18:
          uint64_t v50 = v45 + *v42;
          double v51 = fabs((double)v50);
          double v52 = fabs((double)v48);
          double v53 = fabs((double)v49);
          if (v51 < v52) {
            double v51 = v52;
          }
          if (v51 < v53) {
            double v51 = v53;
          }
          unint64_t v54 = (uint64_t)v51 + 1;
          if (v54 >> 30)
          {
            char v55 = __clz(v54);
            char v56 = 34 - v55;
            *((unsigned char *)__p[0] + v41) = v43 + 34 - v55;
            uint64_t v57 = 1 << (33 - v55);
            if (v50 < 0) {
              uint64_t v50 = -(uint64_t)((unint64_t)(v57 - v50) >> (34 - v55));
            }
            else {
              uint64_t v50 = (unint64_t)(v57 + v50) >> (34 - v55);
            }
            if (v48 < 0) {
              uint64_t v48 = -(uint64_t)((unint64_t)(v57 - v48) >> v56);
            }
            else {
              uint64_t v48 = (unint64_t)(v57 + v48) >> v56;
            }
            if (v49 < 0) {
              uint64_t v49 = -(uint64_t)((unint64_t)(v57 - v49) >> v56);
            }
            else {
              uint64_t v49 = (unint64_t)(v57 + v49) >> v56;
            }
          }
          *int32x2_t v42 = v50;
          v42[1] = v48;
          v42[2] = v49;
          v20 += 4;
        }
        while (v20 != 12);
      }
      while (v18 != v19);
    }
    while (v15 != v16);
  }
  int32x2_t v58 = (int *)*a6;
  int v59 = (int *)a6[1];
  if ((int *)*a6 != v59)
  {
    do
    {
      uint64_t v60 = *v58;
      uint64_t v61 = v58[1];
      uint64_t v62 = v58[2];
      if (v60 >= 0) {
        uint64_t v63 = *v58;
      }
      else {
        uint64_t v63 = -v60;
      }
      if (v61 >= 0) {
        uint64_t v64 = v58[1];
      }
      else {
        uint64_t v64 = -v61;
      }
      if (v62 >= 0) {
        uint64_t v65 = v58[2];
      }
      else {
        uint64_t v65 = -v62;
      }
      uint64_t v66 = v64 + v63 + v65;
      if (v66)
      {
        uint64_t v67 = (int)v60 * (uint64_t)a7 / v66;
        uint64_t v68 = (int)v61 * (uint64_t)a7 / v66;
        uint64_t v69 = (int)v62 * (uint64_t)a7 / v66;
      }
      else
      {
        LODWORD(v67) = 0;
        LODWORD(v68) = 0;
        LODWORD(v69) = a7;
      }
      *int32x2_t v58 = v67;
      v58[1] = v68;
      v58[2] = v69;
      v58 += 3;
    }
    while (v58 != v59);
  }
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

uint64_t sub_24FF6625C(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v5 = *(_DWORD *)(a1 + 4360);
  uint64_t v6 = *(unsigned int *)(a1 + 4336);
  uint64_t v7 = *(int *)(*(void *)(a1 + 4176) + 4 * a2);
  int v8 = *(_DWORD *)(*(void *)(a1 + 4200) + 4 * a2);
  uint64_t v9 = *(void *)(a1 + 4224);
  int v10 = *(_DWORD *)(a1 + 4348);
  *(void *)a5 = 0;
  *(_DWORD *)(a5 + 8) = 0;
  if (v8 < 1) {
    return 0;
  }
  uint64_t result = 0;
  int v13 = 0;
  unsigned int v14 = ~(-1 << (v10 - 1));
  int v15 = v8 + v7;
  uint64_t v16 = *(void *)(a1 + 1208);
  int32x2_t v17 = 0;
  int32x2_t v18 = vdup_n_s32(v14);
  do
  {
    uint64_t v19 = (int *)(v16 + 4 * *(int *)(v9 + 4 * v7));
    uint64_t v21 = *v19;
    uint64_t v20 = v19[1];
    if ((int)v21 < (int)v20)
    {
      uint64_t v22 = *(void *)(a1 + 4104);
      do
      {
        uint64_t v23 = *(int *)(v22 + 4 * v21);
        if ((int)v23 < a2 && (!v5 || *(unsigned char *)(a4 + v23)))
        {
          int32x2_t v24 = vsub_s32(*(int32x2_t *)(a3 + 4 * (int)v23 * (int)v6), v18);
          int32x2_t v25 = vabs_s32(vrev64_s32(v24));
          if ((int)(v14 - v25.i32[1] - v25.i32[0]) < 0) {
            int32x2_t v24 = (int32x2_t)vbsl_s8((int8x8_t)vcltz_s32(v24), (int8x8_t)vsub_s32(v25, v18), (int8x8_t)__PAIR64__(v14 - v25.i32[1], v14 - v25.i32[0]));
          }
          int32x2_t v17 = vadd_s32(v24, v17);
          *(int32x2_t *)a5 = v17;
          v13 += v14 - v25.i32[1] - v25.i32[0];
          *(_DWORD *)(a5 + 8) = v13;
          uint64_t result = (result + 1);
        }
        ++v21;
      }
      while (v21 < v20 && (int)result < 4);
    }
    ++v7;
  }
  while (v7 < v15 && (int)result < 4);
  if ((int)v6 >= 1 && (int)result >= 2)
  {
    do
    {
      *(int *)a5 /= (int)result;
      a5 += 4;
      --v6;
    }
    while (v6);
  }
  return result;
}

void sub_24FF663A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(unsigned int *)(a1 + 4332);
  int v5 = *(_DWORD *)(a1 + 4336);
  int v42 = *(_DWORD *)(a1 + 4360);
  int v40 = ~(-1 << (*(_DWORD *)(a1 + 4348) - 1));
  sub_24FF65ECC((void *)(a1 + 1160), (void *)(a1 + 1208), (void *)(a1 + 1184), (uint64_t *)(a1 + 4104), v4, (uint64_t *)(a1 + 4152), v40);
  uint64_t v61 = 0;
  long long v59 = 0u;
  *(_OWORD *)__p = 0u;
  *(_OWORD *)uint64_t v57 = 0u;
  *(_OWORD *)int32x2_t v58 = 0u;
  *(_OWORD *)char v55 = 0u;
  long long v56 = 0u;
  *(_OWORD *)unint64_t v54 = 0u;
  sub_24FF60D8C((uint64_t)v54, v5);
  __int16 v53 = 0x8000;
  __int16 v52 = 0x8000;
  if ((int)v4 >= 1)
  {
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    uint64_t v37 = v4;
    int v36 = 2 * v40;
    int v8 = (int *)(a2 + 4);
    int v38 = v5;
    uint64_t v41 = 4 * v5;
    while (v42 && !*(unsigned char *)(a3 + v7))
    {
LABEL_72:
      ++v7;
      int v8 = (int *)((char *)v8 + v41);
      v6 += 12;
      if (v4 == v7) {
        goto LABEL_73;
      }
    }
    uint64_t v9 = (int *)(*(void *)(a1 + 4152) + v6);
    int v11 = *v9;
    int v10 = v9[1];
    int v12 = v9[2];
    if (sub_24FF6625C(a1, v7, a2, a3, (uint64_t)&v49))
    {
      if (sub_24FF5FDE8((unsigned int *)a1, &v53))
      {
        int v10 = v50;
        int v12 = v51;
        int v11 = v49;
      }
      else if (v49 * (uint64_t)v11 + v50 * (uint64_t)v10 + v51 * (uint64_t)v12 < 0)
      {
        int v11 = -v11;
        int v10 = -v10;
        int v12 = -v12;
      }
    }
    else if (sub_24FF5FDE8((unsigned int *)a1, &v52))
    {
      int v11 = -v11;
      int v10 = -v10;
      int v12 = -v12;
    }
    if (v11 >= 0) {
      unsigned int v13 = v11;
    }
    else {
      unsigned int v13 = -v11;
    }
    if (v10 >= 0) {
      unsigned int v14 = v10;
    }
    else {
      unsigned int v14 = -v10;
    }
    if (v12 >= 0) {
      unsigned int v15 = v12;
    }
    else {
      unsigned int v15 = -v12;
    }
    BOOL v17 = v13 < v14 || v13 < v15;
    if (v17)
    {
      unsigned int v13 = v15;
      int v18 = v10;
      int v19 = v11;
      if (v14 < v15)
      {
LABEL_33:
        v48[0] = v19;
        v48[1] = v18;
        v48[2] = v13;
        sub_24FF5F900((unsigned int *)a1, (uint64_t)v48, v38, (void *)(a1 + 4056), (unsigned char *)(a1 + 4372), v54, (uint64_t)&v44);
        int v21 = v44;
        int v22 = v45;
        if (v44 >= 0) {
          int v23 = v44;
        }
        else {
          int v23 = -v44;
        }
        if (v45 >= 0) {
          int v24 = v45;
        }
        else {
          int v24 = -v45;
        }
        int v25 = v40 - v23;
        int v26 = v40 - v23 - v24;
        if (v26 < 0)
        {
          int v27 = v40 - v24;
          int v28 = v24 - v40;
          if (v44 >= 0) {
            int v21 = v27;
          }
          else {
            int v21 = v28;
          }
          int v29 = v23 - v40;
          if (v45 >= 0) {
            int v22 = v25;
          }
          else {
            int v22 = v29;
          }
        }
        int v30 = -v26;
        if (v12 >= 0) {
          int v31 = v26;
        }
        else {
          int v31 = -v26;
        }
        if (v10 >= 0) {
          int v30 = v26;
        }
        if (v14 < v15) {
          int v30 = v22;
        }
        else {
          int v31 = v22;
        }
        if (v11 < 0) {
          int v26 = -v26;
        }
        if (v17) {
          int v22 = v30;
        }
        else {
          int v31 = v21;
        }
        if (!v17) {
          int v21 = v26;
        }
        if (v22 >= 0) {
          int v32 = v22;
        }
        else {
          int v32 = -v22;
        }
        if (v21 < 0)
        {
          int v33 = -v21;
        }
        else
        {
          int v32 = v36 - v32;
          int v33 = v21;
        }
        if (v22 >= 0) {
          int v33 = v36 - v33;
        }
        int v34 = v21 + v40;
        int v35 = v22 + v40;
        if (v31 < 0)
        {
          int v34 = v32;
          int v35 = v33;
        }
        *(v8 - 1) = v34;
        *int v8 = v35;
        uint64_t v4 = v37;
        goto LABEL_72;
      }
      uint64_t v20 = &v46;
      unsigned int v13 = v14;
      int v18 = v12;
      int v19 = v11;
    }
    else
    {
      uint64_t v20 = &v47;
      int v18 = v10;
      int v19 = v12;
    }
    *(_DWORD *)uint64_t v20 = v12;
    goto LABEL_33;
  }
LABEL_73:
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if (v58[1])
  {
    *(void **)&long long v59 = v58[1];
    operator delete(v58[1]);
  }
  if (v57[0])
  {
    v57[1] = v57[0];
    operator delete(v57[0]);
  }
  if (v55[1])
  {
    *(void **)&long long v56 = v55[1];
    operator delete(v55[1]);
  }
  if (v54[0])
  {
    v54[1] = v54[0];
    operator delete(v54[0]);
  }
}

void sub_24FF66710(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  sub_24FF60EC8((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_24FF66728(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = 0;
  uint64_t v172 = *MEMORY[0x263EF8340];
  uint64_t v7 = *(unsigned int *)(a1 + 4332);
  unint64_t v8 = *(int *)(a1 + 4336);
  __int16 v146 = (void *)(a1 + 4056);
  int v140 = *(_DWORD *)(a1 + 4360);
  uint64_t v9 = *(unsigned int *)(a1 + 4336);
  uint64_t v171 = 0;
  memset(v170, 0, sizeof(v170));
  do
  {
    sub_24FF60D8C((uint64_t)&v170[v6], v8);
    v6 += 15;
  }
  while (v6 != 45);
  __int16 v169 = 0x8000;
  memset_pattern16(__b, &unk_24FF7D710, 6uLL);
  memset_pattern16(v167, &unk_24FF7D710, 6uLL);
  memset_pattern16(v166, &unk_24FF7D710, 6uLL);
  sub_24FF6A64C(&v164, v8);
  LODWORD(__p) = 0;
  sub_24FF6A454(&v162, v8, &__p);
  int v10 = v140;
  LODWORD(v158) = 0;
  sub_24FF6A454(&__p, v8, &v158);
  if ((int)v7 >= 1)
  {
    uint64_t v11 = 0;
    uint64_t v136 = 4 * v9;
    uint64_t v137 = a3;
    uint64_t v12 = 4 * v8;
    unsigned int v13 = (_DWORD *)a2;
    uint64_t v147 = a2;
    unint64_t v148 = v8;
    uint64_t v141 = 4 * v8;
    uint64_t v142 = v7;
    uint64_t v150 = v8;
    while (v10 && !*(unsigned char *)(a3 + v11))
    {
LABEL_114:
      ++v11;
      unsigned int v13 = (_DWORD *)((char *)v13 + v12);
      if (v11 == v7) {
        goto LABEL_121;
      }
    }
    uint64_t v14 = *(unsigned int *)(*(void *)(a1 + 4128) + 4 * v11);
    uint64_t v151 = v13;
    if ((v14 & 0x80000000) == 0)
    {
      unsigned int v15 = (int *)(*(void *)(a1 + 1256) + 12 * v14);
      int v16 = *v15;
      LODWORD(v158) = *v15;
      LODWORD(v17) = v15[1];
      HIDWORD(v158) = v17;
      int v149 = v15[2];
      int v159 = v149;
      int v18 = (int *)(*(void *)(a1 + 1280) + 12 * v14);
      int v144 = v18[1];
      int v145 = *v18;
      LODWORD(v156) = *v18;
      HIDWORD(v156) = v144;
      int v143 = v18[2];
      int v157 = v143;
      int v155 = -1;
      uint64_t v154 = -1;
      int v153 = -1;
      uint64_t v152 = -1;
      sub_24FF64CDC((void *)a1, v14, v11, (unsigned int *)&v158, &v154);
      sub_24FF64CDC((void *)a1, v14, v11, (unsigned int *)&v156, &v152);
      int v19 = v155;
      int v20 = v153;
      if ((v155 & 0x80000000) == 0 || v153 < 0)
      {
        int v138 = v16;
        int v21 = v152;
        int v22 = HIDWORD(v152);
      }
      else
      {
        int v144 = v17;
        int v145 = v16;
        unint64_t v158 = v156;
        int v143 = v149;
        int v159 = v157;
        int v21 = v154;
        int v22 = HIDWORD(v154);
        uint64_t v154 = v152;
        int v20 = v155;
        int v19 = v153;
        int v155 = v153;
        unint64_t v17 = HIDWORD(v156);
        int v149 = v157;
        int v138 = v156;
      }
      uint64_t v24 = (int)v154;
      uint64_t v23 = SHIDWORD(v154);
      int v139 = v17;
      if (v20 != -1
        && (!v10
         || *(unsigned char *)(a3 + (int)v154)
         && *(unsigned char *)(a3 + SHIDWORD(v154))
         && *(unsigned char *)(a3 + v19)
         && *(unsigned char *)(a3 + v21)
         && *(unsigned char *)(a3 + v22)
         && *(unsigned char *)(a3 + v20)))
      {
        int v134 = v22;
        int v135 = v21;
        a2 = v147;
        int v25 = (int *)(v147 + 4 * (int)v154 * (int)v150);
        int v26 = (int *)(v147 + 4 * HIDWORD(v154) * (int)v148);
        int v27 = (int *)(v147 + 4 * v19 * (int)v150);
        BOOL v28 = sub_24FF5FDE8((unsigned int *)a1, v166);
        uint64_t v29 = 1;
        if (v28) {
          uint64_t v29 = 2;
        }
        if (sub_24FF5FDE8((unsigned int *)a1, &v166[v29])) {
          int v30 = 2;
        }
        else {
          int v30 = 0;
        }
        int v31 = v30 | v28;
        if (v31)
        {
          int v32 = (int *)(v147 + 4 * v135 * (int)v148);
          int v33 = (int *)(v147 + 4 * v134 * (int)v150);
          int v34 = (int *)(v147 + 4 * v20 * (int)v148);
          if (v31 == 2)
          {
            sub_24FF56E70(v25, v26, v27, v150, (int *)(*(void *)(a1 + 1160) + 12 * v138), (int *)(*(void *)(a1 + 1160) + 12 * v139), (int *)(*(void *)(a1 + 1160) + 12 * v149), (int *)(*(void *)(a1 + 1160) + 12 * v14), v162);
            sub_24FF56E70(v32, v33, v34, v148, (int *)(*(void *)(a1 + 1160) + 12 * v145), (int *)(*(void *)(a1 + 1160) + 12 * v144), (int *)(*(void *)(a1 + 1160) + 12 * v143), (int *)(*(void *)(a1 + 1160) + 12 * v14), __p);
            uint64_t v35 = v150;
            if ((int)v150 >= 1)
            {
              int32x2_t v84 = (int *)v162;
              uint32x2_t v85 = (int *)__p;
              uint64_t v86 = v150;
              do
              {
                int v87 = *v85++;
                int v88 = v87 + *v84;
                if (v88 < 0 != __OFADD__(v87, *v84)) {
                  ++v88;
                }
                *v84++ = v88 >> 1;
                --v86;
              }
              while (v86);
            }
            goto LABEL_98;
          }
          if (v31 == 1)
          {
            uint64_t v35 = v150;
            if ((int)v150 >= 1)
            {
              int v36 = v162;
              uint64_t v37 = v150;
              do
              {
                int v39 = *v32++;
                int v38 = v39;
                int v40 = *v33++;
                int v41 = v40 + v38;
                int v42 = *v34++;
                *v36++ = v41 - v42;
                --v37;
              }
              while (v37);
            }
            goto LABEL_98;
          }
          if (v148 == 2)
          {
            sub_24FF5756C((unint64_t)v25, v26, v27, (_DWORD *)(*(void *)(a1 + 1160) + 12 * v138), (_DWORD *)(*(void *)(a1 + 1160) + 12 * v139), (int *)(*(void *)(a1 + 1160) + 12 * v14), (int *)v162);
            sub_24FF5756C((unint64_t)v32, v33, v34, (_DWORD *)(*(void *)(a1 + 1160) + 12 * v145), (_DWORD *)(*(void *)(a1 + 1160) + 12 * v144), (int *)(*(void *)(a1 + 1160) + 12 * v14), (int *)__p);
            int64x2_t v89 = v162;
            unint64_t v90 = __p;
            int v91 = *((_DWORD *)v162 + 1);
            int v92 = *(_DWORD *)__p + *(_DWORD *)v162;
            if (v92 < 0 != __OFADD__(*(_DWORD *)__p, *(_DWORD *)v162)) {
              ++v92;
            }
            *(_DWORD *)uint64_t v162 = v92 >> 1;
            int v93 = v90[1];
            BOOL v75 = __OFADD__(v93, v91);
            int v94 = v93 + v91;
            if (v94 < 0 != v75) {
              ++v94;
            }
            v89[1] = v94 >> 1;
          }
          else if ((int)v148 >= 1)
          {
            unint64_t v107 = 0;
            int v108 = (char *)v162;
            uint64_t v35 = v150;
            do
            {
              int v109 = v25[v107 / 4];
              int v110 = v32[v107 / 4];
              BOOL v75 = __OFADD__(v110, v109);
              int v111 = v110 + v109;
              if (v111 < 0 != v75) {
                ++v111;
              }
              unint64_t v112 = 1431655766
                   * ((v111 >> 1) - (v27[v107 / 4] + v34[v107 / 4]) + 2 * (v33[v107 / 4] + v26[v107 / 4]));
              *(_DWORD *)&v108[v107] = HIDWORD(v112) + (v112 >> 63);
              v107 += 4;
              int v59 = 2;
            }
            while (v136 != v107);
            goto LABEL_108;
          }
          goto LABEL_106;
        }
        if ((int)v148 < 1)
        {
LABEL_106:
          int v59 = 2;
LABEL_107:
          uint64_t v35 = v150;
          goto LABEL_108;
        }
        int32x2_t v77 = v162;
        uint64_t v35 = v150;
        uint64_t v78 = v150;
        do
        {
          int v80 = *v25++;
          int v79 = v80;
          int v81 = *v26++;
          int v82 = v81 + v79;
          int v83 = *v27++;
          *v77++ = v82 - v83;
          --v78;
        }
        while (v78);
        goto LABEL_98;
      }
      if (v19 != -1 && (!v10 || *(unsigned char *)(a3 + (int)v154) && *(unsigned char *)(a3 + SHIDWORD(v154)) && *(unsigned char *)(a3 + v19)))
      {
        char v43 = (int *)(v147 + 4 * (int)v154 * (int)v150);
        int v44 = (int *)(v147 + 4 * HIDWORD(v154) * (int)v148);
        int v45 = (int *)(v147 + 4 * v19 * (int)v150);
        BOOL v46 = sub_24FF5FDE8((unsigned int *)a1, v167);
        uint64_t v47 = 1;
        if (v46) {
          uint64_t v47 = 2;
        }
        if (sub_24FF5FDE8((unsigned int *)a1, &v167[v47])) {
          int v48 = 2;
        }
        else {
          int v48 = 0;
        }
        int v49 = v48 | v46;
        if (v49 == 2)
        {
          sub_24FF56E70(v43, v44, v45, v148, (int *)(*(void *)(a1 + 1160) + 12 * v138), (int *)(*(void *)(a1 + 1160) + 12 * v139), (int *)(*(void *)(a1 + 1160) + 12 * v149), (int *)(*(void *)(a1 + 1160) + 12 * v14), v162);
          a2 = v147;
          uint64_t v35 = v150;
          if ((int)v148 >= 1)
          {
            int v95 = (int *)v162;
            uint64_t v96 = v150;
            do
            {
              int v98 = *v43++;
              int v97 = v98;
              int v99 = *v44++;
              int v100 = v99 + v97;
              int v101 = *v45++;
              int v102 = v100 - v101;
              BOOL v75 = __OFADD__(v102, *v95);
              int v103 = v102 + *v95;
              if (v103 < 0 != v75) {
                ++v103;
              }
              *v95++ = v103 >> 1;
              --v96;
            }
            while (v96);
          }
          goto LABEL_98;
        }
        if (v49 != 1)
        {
          if (v49)
          {
            if (v150 == 2)
            {
              unint64_t v106 = v147 + 8 * v24;
              a2 = v147;
              sub_24FF5756C(v106, (int *)(v147 + 8 * v23), (int *)(v147 + 8 * v19), (_DWORD *)(*(void *)(a1 + 1160) + 12 * v138), (_DWORD *)(*(void *)(a1 + 1160) + 12 * v139), (int *)(*(void *)(a1 + 1160) + 12 * v14), (int *)v162);
              uint64_t v35 = v150;
              goto LABEL_98;
            }
            uint64_t v35 = v150;
            if ((int)v150 >= 1)
            {
              int v119 = v162;
              uint64_t v120 = v150;
              a2 = v147;
              do
              {
                int v122 = *v43++;
                int v121 = v122;
                int v124 = *v44++;
                int v123 = v124;
                int v125 = *v45++;
                *v119++ = v123 + v121 - v125;
                int v59 = 2;
                --v120;
              }
              while (v120);
              goto LABEL_108;
            }
          }
          else
          {
            uint64_t v35 = v150;
            if ((int)v150 >= 1)
            {
              int v50 = v162;
              uint64_t v51 = v150;
              a2 = v147;
              do
              {
                int v53 = *v43++;
                int v52 = v53;
                int v54 = *v44++;
                int v55 = v54 + v52;
                int v56 = *v45++;
                *v50++ = v55 - v56;
                --v51;
              }
              while (v51);
              goto LABEL_98;
            }
          }
          int v59 = 2;
          a2 = v147;
          goto LABEL_108;
        }
        uint64_t v104 = *(void *)(a1 + 1160);
        int v105 = (int *)(v104 + 12 * v14);
        uint64_t v35 = v150;
        sub_24FF56E70(v43, v44, v45, v150, (int *)(v104 + 12 * v138), (int *)(v104 + 12 * v139), (int *)(v104 + 12 * v149), v105, v162);
        a2 = v147;
LABEL_98:
        int v59 = 2;
LABEL_108:
        a3 = v137;
        uint64_t v12 = v141;
        uint64_t v7 = v142;
        unint64_t v8 = v148;
        int v10 = v140;
        unsigned int v13 = v151;
LABEL_109:
        sub_24FF5F900((unsigned int *)a1, (uint64_t)v162, v8, v146, (unsigned char *)(a1 + 4372), &v170[15 * v59], a2 + 4 * v11 * v8);
        if ((int)v35 >= 1)
        {
          int v113 = (char *)v164 + 4;
          int v114 = v13;
          uint64_t v115 = v35;
          do
          {
            int v117 = *v114++;
            int v116 = v117;
            int v118 = *((_DWORD *)v113 - 1);
            if (*(_DWORD *)&v113[4 * (((_BYTE)v118 - 1) & 3)] != v117)
            {
              *((_DWORD *)v113 - 1) = v118 + 1;
              *(_DWORD *)&v113[4 * (v118 & 3)] = v116;
            }
            v113 += 20;
            --v115;
          }
          while (v115);
        }
        goto LABEL_114;
      }
      unint64_t v8 = v148;
      if (HIDWORD(v154) != -1 && (!v10 || *(unsigned char *)(a3 + (int)v154) && *(unsigned char *)(a3 + SHIDWORD(v154))))
      {
        if (v148 == 2)
        {
          BOOL v57 = sub_24FF5FDE8((unsigned int *)a1, &v169);
          int v58 = 2 * v24;
          a2 = v147;
          sub_24FF57350((int *)(v147 + 4 * v58), (int *)(v147 + 8 * v23), (_DWORD *)(*(void *)(a1 + 1160) + 12 * v138), (_DWORD *)(*(void *)(a1 + 1160) + 12 * v139), (int *)(*(void *)(a1 + 1160) + 12 * v14), v57, (int *)v162);
          int v59 = 1;
        }
        else
        {
          if ((int)v148 >= 1)
          {
            a2 = v147;
            uint64_t v68 = (int *)(v147 + 4 * (int)v154 * (int)v148);
            uint64_t v35 = v150;
            uint64_t v69 = (int *)(v147 + 4 * HIDWORD(v154) * (int)v150);
            int v70 = (int *)v162;
            uint64_t v71 = v150;
            do
            {
              int v73 = *v68++;
              int v72 = v73;
              int v74 = *v69++;
              BOOL v75 = __OFADD__(v74, v72);
              int v76 = v74 + v72;
              if (v76 < 0 != v75) {
                ++v76;
              }
              *v70++ = v76 >> 1;
              --v71;
            }
            while (v71);
            int v59 = 1;
            goto LABEL_108;
          }
          int v59 = 1;
          a2 = v147;
        }
        goto LABEL_107;
      }
      a2 = v147;
      uint64_t v12 = v141;
      uint64_t v7 = v142;
      unsigned int v13 = v151;
    }
    int v60 = sub_24FF672B0(a1, v11, a2, a3, (int *)v162, (uint64_t)v163);
    int v59 = 0;
    uint64_t v35 = v150;
    if ((int)v150 >= 1 && !v60)
    {
      uint64_t v61 = v150;
      uint64_t v62 = v162;
      uint64_t v63 = (char *)v164 + 4;
      do
      {
        BOOL v64 = sub_24FF5FDE8((unsigned int *)a1, __b);
        BOOL v65 = v64;
        if (v64) {
          uint64_t v66 = 2;
        }
        else {
          uint64_t v66 = 1;
        }
        if (sub_24FF5FDE8((unsigned int *)a1, &__b[v66])) {
          char v67 = 2;
        }
        else {
          char v67 = 0;
        }
        *v62++ = *(_DWORD *)&v63[4 * ((*((_DWORD *)v63 - 1) + ~(v67 | v65)) & 3)];
        v63 += 20;
        --v61;
      }
      while (v61);
      int v59 = 0;
      a3 = v137;
      a2 = v147;
      int v10 = v140;
      uint64_t v35 = v150;
      unsigned int v13 = v151;
      uint64_t v12 = v141;
      uint64_t v7 = v142;
    }
    goto LABEL_109;
  }
LABEL_121:
  if (__p)
  {
    v161[0] = __p;
    operator delete(__p);
  }
  if (v162)
  {
    uint64_t v163 = v162;
    operator delete(v162);
  }
  if (v164)
  {
    *(void *)uint64_t v165 = v164;
    operator delete(v164);
  }
  unint64_t v126 = 360;
  do
  {
    uint64_t v127 = &v170[v126 / 8];
    int v128 = *(void **)&v165[v126 / 4 + 4];
    if (v128)
    {
      *((void *)v127 - 2) = v128;
      operator delete(v128);
    }
    int v129 = (void *)*((void *)v127 - 6);
    if (v129)
    {
      *(void *)&v165[v126 / 4] = v129;
      operator delete(v129);
    }
    int v130 = &v170[v126 / 8];
    int v131 = *(void **)((char *)&v162 + v126);
    if (v131)
    {
      *((void *)v130 - 8) = v131;
      operator delete(v131);
    }
    uint64_t v132 = (void *)*((void *)v130 - 12);
    if (v132)
    {
      v161[v126 / 8] = v132;
      operator delete(v132);
    }
    int v133 = (void *)*((void *)v127 - 15);
    if (v133)
    {
      *(unint64_t *)((char *)&v158 + v126) = (unint64_t)v133;
      operator delete(v133);
    }
    v126 -= 120;
  }
  while (v126);
}

void sub_24FF67230(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,void *__p,uint64_t a36,uint64_t a37,void *a38,uint64_t a39,uint64_t a40,void *a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47)
{
  if (__p) {
    operator delete(__p);
  }
  if (a38) {
    operator delete(a38);
  }
  if (a41) {
    operator delete(a41);
  }
  for (uint64_t i = 240; i != -120; i -= 120)
    sub_24FF60EC8((uint64_t)(&a47 + i));
  _Unwind_Resume(a1);
}

uint64_t sub_24FF672B0(uint64_t a1, int a2, uint64_t a3, uint64_t a4, int *a5, uint64_t a6)
{
  uint64_t v6 = a5;
  int v11 = *(_DWORD *)(a1 + 4360);
  uint64_t v12 = *(unsigned int *)(a1 + 4336);
  uint64_t v13 = *(int *)(*(void *)(a1 + 4176) + 4 * a2);
  uint64_t v14 = *(void *)(a1 + 4224);
  uint64_t v15 = *(int *)(*(void *)(a1 + 4200) + 4 * a2);
  if (a6 - (uint64_t)a5 >= 1) {
    bzero(a5, 4 * (((unint64_t)(a6 - (void)a5) >> 2) - ((unint64_t)(a6 - (void)a5) > 3)) + 4);
  }
  if ((int)v15 < 1) {
    return 0;
  }
  uint64_t result = 0;
  uint64_t v17 = v15 + v13;
  uint64_t v18 = *(void *)(a1 + 1208);
  do
  {
    int v19 = (int *)(v18 + 4 * *(int *)(v14 + 4 * v13));
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    if ((int)v20 < (int)v21)
    {
      uint64_t v22 = *(void *)(a1 + 4104);
      do
      {
        uint64_t v23 = *(int *)(v22 + 4 * v20);
        if ((int)v23 < a2 && (!v11 || *(unsigned char *)(a4 + v23)))
        {
          if ((int)v12 >= 1)
          {
            uint64_t v24 = (int *)(a3 + 4 * (int)v23 * (int)v12);
            int v25 = v6;
            uint64_t v26 = v12;
            do
            {
              int v27 = *v24++;
              *v25++ += v27;
              --v26;
            }
            while (v26);
          }
          uint64_t result = (result + 1);
        }
        ++v20;
      }
      while (v20 < v21 && (int)result < 4);
    }
    ++v13;
  }
  while (v13 < v17 && (int)result < 4);
  if ((int)v12 >= 1 && (int)result >= 2)
  {
    do
    {
      *v6++ /= (int)result;
      --v12;
    }
    while (v12);
  }
  return result;
}

void sub_24FF67414(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v97 = *MEMORY[0x263EF8340];
  int v72 = (void *)(a1 + 4056);
  uint64_t v5 = *(unsigned int *)(a1 + 4332);
  unint64_t v6 = *(int *)(a1 + 4336);
  uint64_t v7 = *(unsigned int *)(a1 + 4336);
  int v66 = *(_DWORD *)(a1 + 4360);
  memset_pattern16(__b, &unk_24FF7D710, 6uLL);
  uint64_t v8 = 0;
  uint64_t v96 = 0;
  memset(v95, 0, sizeof(v95));
  do
  {
    sub_24FF60D8C((uint64_t)&v95[v8], v7);
    v8 += 15;
  }
  while (v8 != 45);
  __int16 v93 = 0x8000;
  sub_24FF6A64C(&v91, v6);
  LODWORD(__p) = 0;
  sub_24FF6A454(&v88, v6, &__p);
  int v9 = v66;
  LODWORD(v84) = 0;
  sub_24FF6A454(&__p, v6, &v84);
  if ((int)v5 >= 1)
  {
    uint64_t v10 = 0;
    unint64_t v71 = v6;
    uint64_t v76 = 4 * v6;
    int v11 = (int *)a2;
    uint64_t v68 = v7;
    uint64_t v69 = a2;
    uint64_t v67 = v5;
    while (v9 && !*(unsigned char *)(a3 + v10))
    {
LABEL_63:
      ++v10;
      int v11 = (int *)((char *)v11 + v76);
      if (v10 == v5) {
        goto LABEL_66;
      }
    }
    uint64_t v12 = *(unsigned int *)(*(void *)(a1 + 4128) + 4 * v10);
    if ((v12 & 0x80000000) == 0)
    {
      uint64_t v13 = (unsigned int *)(*(void *)(a1 + 1256) + 12 * v12);
      unsigned int v14 = *v13;
      LODWORD(v84) = *v13;
      unsigned int v15 = v13[1];
      HIDWORD(v84) = v15;
      unsigned int v16 = v13[2];
      v85[0] = v16;
      uint64_t v17 = (_DWORD *)(*(void *)(a1 + 1280) + 12 * v12);
      unsigned int v18 = v17[1];
      LODWORD(v82) = *v17;
      HIDWORD(v82) = v18;
      unsigned int v73 = v18;
      unsigned int v74 = v17[2];
      int v75 = v82;
      unsigned int v83 = v74;
      int v81 = -1;
      uint64_t v80 = -1;
      int v79 = -1;
      uint64_t v78 = -1;
      sub_24FF64CDC((void *)a1, v12, v10, (unsigned int *)&v84, &v80);
      sub_24FF64CDC((void *)a1, v12, v10, (unsigned int *)&v82, &v78);
      int v19 = v81;
      int v20 = v79;
      if ((v81 & 0x80000000) == 0 || v79 < 0)
      {
        unint64_t v70 = __PAIR64__(v15, v14);
        int v21 = v78;
        int v22 = HIDWORD(v78);
      }
      else
      {
        unsigned int v74 = v16;
        int v75 = v14;
        unint64_t v84 = v82;
        unsigned int v16 = v83;
        v85[0] = v83;
        int v21 = v80;
        int v22 = HIDWORD(v80);
        uint64_t v80 = v78;
        int v20 = v81;
        int v19 = v79;
        int v81 = v79;
        unsigned int v73 = v15;
        unint64_t v70 = v82;
      }
      uint64_t v24 = (int)v80;
      int v23 = HIDWORD(v80);
      if (v20 != -1
        && (!v9
         || *(unsigned char *)(a3 + (int)v80)
         && *(unsigned char *)(a3 + SHIDWORD(v80))
         && *(unsigned char *)(a3 + v19)
         && *(unsigned char *)(a3 + v21)
         && *(unsigned char *)(a3 + v22)
         && *(unsigned char *)(a3 + v20)))
      {
        int v64 = v22;
        int v65 = v21;
        a2 = v69;
        unint64_t v6 = v71;
        sub_24FF56E70((int *)(v69 + 4 * (int)v80 * (int)v68), (int *)(v69 + 4 * HIDWORD(v80) * (int)v71), (int *)(v69 + 4 * v19 * (int)v68), v71, (int *)(*(void *)(a1 + 1160) + 12 * (int)v70), (int *)(*(void *)(a1 + 1160) + 12 * SHIDWORD(v70)), (int *)(*(void *)(a1 + 1160) + 12 * (int)v16), (int *)(*(void *)(a1 + 1160) + 12 * v12), v88);
        sub_24FF56E70((int *)(a2 + 4 * v65 * (int)v6), (int *)(a2 + 4 * v64 * (int)v68), (int *)(a2 + 4 * v20 * (int)v6), v68, (int *)(*(void *)(a1 + 1160) + 12 * v75), (int *)(*(void *)(a1 + 1160) + 12 * (int)v73), (int *)(*(void *)(a1 + 1160) + 12 * (int)v74), (int *)(*(void *)(a1 + 1160) + 12 * v12), __p);
        uint64_t v5 = v67;
        uint64_t v7 = v68;
        if ((int)v68 >= 1)
        {
          int v25 = (int *)v88;
          uint64_t v26 = (int *)__p;
          uint64_t v27 = v68;
          int v9 = v66;
          do
          {
            int v28 = *v26++;
            int v29 = v28 + *v25;
            if (v29 < 0 != __OFADD__(v28, *v25)) {
              ++v29;
            }
            *v25++ = v29 >> 1;
            --v27;
          }
          while (v27);
          int v30 = 2;
          goto LABEL_58;
        }
        int v30 = 2;
        goto LABEL_51;
      }
      if (v19 != -1 && (!v9 || *(unsigned char *)(a3 + (int)v80) && *(unsigned char *)(a3 + SHIDWORD(v80)) && *(unsigned char *)(a3 + v19)))
      {
        uint64_t v7 = v68;
        a2 = v69;
        unint64_t v6 = v71;
        sub_24FF56E70((int *)(v69 + 4 * (int)v80 * (int)v68), (int *)(v69 + 4 * HIDWORD(v80) * (int)v71), (int *)(v69 + 4 * v19 * (int)v68), v71, (int *)(*(void *)(a1 + 1160) + 12 * (int)v70), (int *)(*(void *)(a1 + 1160) + 12 * SHIDWORD(v70)), (int *)(*(void *)(a1 + 1160) + 12 * (int)v16), (int *)(*(void *)(a1 + 1160) + 12 * v12), v88);
        int v30 = 2;
        uint64_t v5 = v67;
LABEL_51:
        int v9 = v66;
        goto LABEL_58;
      }
      uint64_t v7 = v68;
      if (HIDWORD(v80) != -1 && (!v9 || *(unsigned char *)(a3 + (int)v80) && *(unsigned char *)(a3 + SHIDWORD(v80))))
      {
        uint64_t v5 = v67;
        if (v71 == 2)
        {
          BOOL v31 = sub_24FF5FDE8((unsigned int *)a1, &v93);
          int v32 = (int *)(v69 + 8 * v24);
          a2 = v69;
          sub_24FF57350(v32, (int *)(v69 + 8 * v23), (_DWORD *)(*(void *)(a1 + 1160) + 12 * (int)v70), (_DWORD *)(*(void *)(a1 + 1160) + 12 * SHIDWORD(v70)), (int *)(*(void *)(a1 + 1160) + 12 * v12), v31, (int *)v88);
        }
        else
        {
          if ((int)v71 < 1)
          {
            int v30 = 1;
            a2 = v69;
            unint64_t v6 = v71;
LABEL_58:
            sub_24FF5F900((unsigned int *)a1, (uint64_t)v88, v6, v72, (unsigned char *)(a1 + 4372), &v95[15 * v30], a2 + 4 * v10 * v6);
            if ((int)v7 >= 1)
            {
              int v50 = (char *)v91 + 4;
              uint64_t v51 = v11;
              uint64_t v52 = v7;
              do
              {
                int v54 = *v51++;
                int v53 = v54;
                int v55 = *((_DWORD *)v50 - 1);
                if (*(_DWORD *)&v50[4 * (((_BYTE)v55 - 1) & 3)] != v54)
                {
                  *((_DWORD *)v50 - 1) = v55 + 1;
                  *(_DWORD *)&v50[4 * (v55 & 3)] = v53;
                }
                v50 += 20;
                --v52;
              }
              while (v52);
            }
            goto LABEL_63;
          }
          a2 = v69;
          int v41 = (int *)(v69 + 4 * (int)v80 * (int)v71);
          int v42 = (int *)(v69 + 4 * HIDWORD(v80) * (int)v68);
          char v43 = (int *)v88;
          uint64_t v44 = v68;
          do
          {
            int v46 = *v41++;
            int v45 = v46;
            int v47 = *v42++;
            BOOL v48 = __OFADD__(v47, v45);
            int v49 = v47 + v45;
            if (v49 < 0 != v48) {
              ++v49;
            }
            *v43++ = v49 >> 1;
            --v44;
          }
          while (v44);
        }
        int v30 = 1;
        unint64_t v6 = v71;
        goto LABEL_58;
      }
      a2 = v69;
      uint64_t v5 = v67;
      unint64_t v6 = v71;
    }
    int v33 = sub_24FF672B0(a1, v10, a2, a3, (int *)v88, (uint64_t)v89);
    int v30 = 0;
    if ((int)v7 >= 1 && !v33)
    {
      int v34 = v88;
      uint64_t v35 = v7;
      int v36 = (char *)v91 + 4;
      do
      {
        BOOL v37 = sub_24FF5FDE8((unsigned int *)a1, __b);
        BOOL v38 = v37;
        if (v37) {
          uint64_t v39 = 2;
        }
        else {
          uint64_t v39 = 1;
        }
        if (sub_24FF5FDE8((unsigned int *)a1, &__b[v39])) {
          char v40 = 2;
        }
        else {
          char v40 = 0;
        }
        *v34++ = *(_DWORD *)&v36[4 * ((*((_DWORD *)v36 - 1) + ~(v40 | v38)) & 3)];
        v36 += 20;
        --v35;
      }
      while (v35);
      int v30 = 0;
      unint64_t v6 = v71;
      uint64_t v7 = v68;
      a2 = v69;
      int v9 = v66;
      uint64_t v5 = v67;
    }
    goto LABEL_58;
  }
LABEL_66:
  if (__p)
  {
    v87[0] = __p;
    operator delete(__p);
  }
  if (v88)
  {
    int64x2_t v89 = v88;
    operator delete(v88);
  }
  if (v91)
  {
    v92[0] = v91;
    operator delete(v91);
  }
  unint64_t v56 = 90;
  do
  {
    BOOL v57 = &v95[v56 / 2];
    int v58 = (void *)v92[v56 / 2];
    if (v58)
    {
      *((void *)v57 - 2) = v58;
      operator delete(v58);
    }
    int v59 = (void *)*((void *)v57 - 6);
    if (v59)
    {
      *(void *)&v90[v56 * 4] = v59;
      operator delete(v59);
    }
    int v60 = &v95[v56 / 2];
    uint64_t v61 = (void *)v87[v56 / 2];
    if (v61)
    {
      *((void *)v60 - 8) = v61;
      operator delete(v61);
    }
    uint64_t v62 = (void *)*((void *)v60 - 12);
    if (v62)
    {
      *(void *)&v85[v56] = v62;
      operator delete(v62);
    }
    uint64_t v63 = (void *)*((void *)v57 - 15);
    if (v63)
    {
      *(void *)((char *)&v81 + v56 * 4) = v63;
      operator delete(v63);
    }
    v56 -= 30;
  }
  while (v56 * 4);
}

void sub_24FF67B44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,void *__p,uint64_t a32,uint64_t a33,void *a34,uint64_t a35,uint64_t a36,void *a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  if (__p) {
    operator delete(__p);
  }
  if (a34) {
    operator delete(a34);
  }
  if (a37) {
    operator delete(a37);
  }
  for (uint64_t i = 240; i != -120; i -= 120)
    sub_24FF60EC8((uint64_t)(&a41 + i));
  _Unwind_Resume(a1);
}

void sub_24FF67BC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v125 = *MEMORY[0x263EF8340];
  uint64_t v112 = *(unsigned int *)(a1 + 4332);
  int v110 = (void *)(a1 + 4056);
  unint64_t v111 = *(int *)(a1 + 4336);
  uint64_t v6 = *(unsigned int *)(a1 + 4336);
  int v113 = *(_DWORD *)(a1 + 4360);
  memset_pattern16(__b, &unk_24FF7D710, 6uLL);
  memset_pattern16(v121, &unk_24FF7D710, 6uLL);
  uint64_t v7 = 0;
  uint64_t v124 = 0;
  memset(v123, 0, sizeof(v123));
  do
  {
    sub_24FF60D8C((uint64_t)v123 + v7, v6);
    v7 += 120;
  }
  while (v7 != 360);
  unint64_t v8 = v111;
  sub_24FF6A64C(v120, v111);
  LODWORD(v116) = 0;
  sub_24FF6A454(&__p, v111, &v116);
  if ((int)v112 >= 1)
  {
    uint64_t v9 = 0;
    uint64_t v109 = a2;
    uint64_t v104 = 4 * v6;
    uint64_t v10 = (int *)a2;
    uint64_t v107 = a3;
    uint64_t v108 = v6;
    while (v113 && !*(unsigned char *)(a3 + v9))
    {
LABEL_87:
      ++v9;
      v10 += v111;
      if (v9 == v112) {
        goto LABEL_88;
      }
    }
    uint64_t v11 = *(unsigned int *)(*(void *)(a1 + 4128) + 4 * v9);
    if ((v11 & 0x80000000) == 0)
    {
      v117[0] = -1;
      uint64_t v116 = -1;
      v115[0] = -1;
      uint64_t v114 = -1;
      sub_24FF64CDC((void *)a1, v11, v9, (unsigned int *)(*(void *)(a1 + 1256) + 12 * v11), &v116);
      sub_24FF64CDC((void *)a1, v11, v9, (unsigned int *)(*(void *)(a1 + 1280) + 12 * v11), &v114);
      int v12 = v117[0];
      int v13 = v115[0];
      if ((v117[0] & 0x80000000) == 0 || (v115[0] & 0x80000000) != 0)
      {
        int v14 = v114;
        int v15 = HIDWORD(v114);
        int v16 = v117[0];
      }
      else
      {
        int v14 = v116;
        int v15 = HIDWORD(v116);
        uint64_t v116 = v114;
        int v16 = v115[0];
        v117[0] = v115[0];
        int v13 = v12;
      }
      int v18 = v116;
      int v17 = HIDWORD(v116);
      if (v13 != -1
        && (!v113
         || *(unsigned char *)(a3 + (int)v116)
         && *(unsigned char *)(a3 + SHIDWORD(v116))
         && *(unsigned char *)(a3 + v16)
         && *(unsigned char *)(a3 + v14)
         && *(unsigned char *)(a3 + v15)
         && *(unsigned char *)(a3 + v13)))
      {
        int v105 = v15;
        int v106 = v14;
        BOOL v19 = sub_24FF5FDE8((unsigned int *)a1, v121);
        uint64_t v20 = 2;
        if (!v19) {
          uint64_t v20 = 1;
        }
        if (sub_24FF5FDE8((unsigned int *)a1, &v121[v20])) {
          int v21 = 2;
        }
        else {
          int v21 = 0;
        }
        int v22 = v18 * v108;
        a2 = v109;
        int v23 = (int *)(v109 + 4 * v22);
        int v24 = v17 * v111;
        unint64_t v8 = v111;
        int v25 = (int *)(v109 + 4 * v24);
        int v26 = v16 * v108;
        uint64_t v6 = v108;
        uint64_t v27 = (int *)(v109 + 4 * v26);
        int v28 = v21 | v19;
        if (v21 | v19)
        {
          int v29 = (int *)(v109 + 4 * v106 * (int)v111);
          int v30 = (int *)(v109 + 4 * v105 * (int)v108);
          BOOL v31 = (int *)(v109 + 4 * v13 * (int)v111);
          if (v28 == 1)
          {
            if ((int)v108 >= 1)
            {
              int32x2_t v77 = __p;
              uint64_t v78 = v108;
              do
              {
                int v80 = *v29++;
                int v79 = v80;
                int v81 = *v30++;
                int v82 = v81 + v79;
                int v83 = *v31++;
                *v77++ = v82 - v83;
                --v78;
              }
              while (v78);
            }
          }
          else if (v28 == 2)
          {
            if ((int)v111 >= 1)
            {
              int v32 = __p;
              uint64_t v33 = v108;
              do
              {
                int v35 = *v25++;
                int v34 = v35;
                int v36 = *v30++;
                int v37 = v36 + v34;
                int v39 = *v23++;
                int v38 = v39;
                int v40 = *v29++;
                BOOL v41 = __OFADD__(v40, v38);
                int v42 = v40 + v38;
                if (v42 < 0 != v41) {
                  ++v42;
                }
                *v32++ = v37 - (v42 >> 1);
                --v33;
              }
              while (v33);
            }
          }
          else if ((int)v108 >= 1)
          {
            unint64_t v84 = 0;
            uint32x2_t v85 = (char *)__p;
            do
            {
              int v86 = v23[v84 / 4];
              int v87 = v29[v84 / 4];
              BOOL v41 = __OFADD__(v87, v86);
              int v88 = v87 + v86;
              if (v88 < 0 != v41) {
                ++v88;
              }
              unint64_t v89 = 1431655766 * ((v88 >> 1) - (v27[v84 / 4] + v31[v84 / 4]) + 2 * (v30[v84 / 4] + v25[v84 / 4]));
              *(_DWORD *)&v85[v84] = HIDWORD(v89) + (v89 >> 63);
              v84 += 4;
            }
            while (v104 != v84);
          }
        }
        else if ((int)v111 >= 1)
        {
          unint64_t v70 = __p;
          uint64_t v71 = v108;
          do
          {
            int v73 = *v23++;
            int v72 = v73;
            int v74 = *v25++;
            int v75 = v74 + v72;
            int v76 = *v27++;
            *v70++ = v75 - v76;
            --v71;
          }
          while (v71);
        }
        goto LABEL_81;
      }
      if (v16 != -1 && (!v113 || *(unsigned char *)(a3 + (int)v116) && *(unsigned char *)(a3 + SHIDWORD(v116)) && *(unsigned char *)(a3 + v16)))
      {
        if ((int)v111 < 1)
        {
          unsigned int v62 = 2;
          uint64_t v6 = v108;
          a2 = v109;
          unint64_t v8 = v111;
          goto LABEL_82;
        }
        a2 = v109;
        char v43 = (int *)(v109 + 4 * (int)v116 * (int)v108);
        uint64_t v44 = (int *)(v109 + 4 * HIDWORD(v116) * (int)v111);
        int v45 = v16 * v108;
        uint64_t v6 = v108;
        int v46 = (int *)(v109 + 4 * v45);
        int v47 = __p;
        uint64_t v48 = v108;
        unint64_t v8 = v111;
        do
        {
          int v50 = *v43++;
          int v49 = v50;
          int v51 = *v44++;
          int v52 = v51 + v49;
          int v53 = *v46++;
          *v47++ = v52 - v53;
          --v48;
        }
        while (v48);
LABEL_81:
        unsigned int v62 = 2;
LABEL_82:
        sub_24FF5F900((unsigned int *)a1, (uint64_t)__p, v8, v110, (unsigned char *)(a1 + 4372), (void *)v123 + 15 * v62, a2 + 4 * v9 * v8);
        if ((int)v8 >= 1)
        {
          unint64_t v90 = (char *)v120[0] + 4;
          int v91 = v10;
          uint64_t v92 = v6;
          do
          {
            int v94 = *v91++;
            int v93 = v94;
            int v95 = *((_DWORD *)v90 - 1);
            if (*(_DWORD *)&v90[4 * (((_BYTE)v95 - 1) & 3)] != v94)
            {
              *((_DWORD *)v90 - 1) = v95 + 1;
              *(_DWORD *)&v90[4 * (v95 & 3)] = v93;
            }
            v90 += 20;
            --v92;
          }
          while (v92);
        }
        goto LABEL_87;
      }
      if (HIDWORD(v116) != -1 && (!v113 || *(unsigned char *)(a3 + (int)v116) && *(unsigned char *)(a3 + SHIDWORD(v116))))
      {
        uint64_t v6 = v108;
        if ((int)v108 < 1)
        {
          unsigned int v62 = 1;
          a2 = v109;
        }
        else
        {
          a2 = v109;
          int v54 = (int *)(v109 + 4 * (int)v116 * (int)v111);
          int v55 = (int *)(v109 + 4 * HIDWORD(v116) * (int)v108);
          unint64_t v56 = (int *)__p;
          uint64_t v57 = v108;
          do
          {
            int v59 = *v54++;
            int v58 = v59;
            int v60 = *v55++;
            BOOL v41 = __OFADD__(v60, v58);
            int v61 = v60 + v58;
            if (v61 < 0 != v41) {
              ++v61;
            }
            *v56++ = v61 >> 1;
            --v57;
          }
          while (v57);
          unsigned int v62 = 1;
        }
        unint64_t v8 = v111;
        goto LABEL_82;
      }
      uint64_t v6 = v108;
      a2 = v109;
      unint64_t v8 = v111;
    }
    int v63 = sub_24FF672B0(a1, v9, a2, a3, (int *)__p, (uint64_t)v119);
    unsigned int v62 = 0;
    if ((int)v6 >= 1 && !v63)
    {
      int v64 = __p;
      int v65 = (char *)v120[0] + 4;
      do
      {
        BOOL v66 = sub_24FF5FDE8((unsigned int *)a1, __b);
        BOOL v67 = v66;
        if (v66) {
          uint64_t v68 = 2;
        }
        else {
          uint64_t v68 = 1;
        }
        if (sub_24FF5FDE8((unsigned int *)a1, &__b[v68])) {
          char v69 = 2;
        }
        else {
          char v69 = 0;
        }
        *v64++ = *(_DWORD *)&v65[4 * ((*((_DWORD *)v65 - 1) + ~(v69 | v67)) & 3)];
        v65 += 20;
        --v6;
      }
      while (v6);
      unsigned int v62 = 0;
      unint64_t v8 = v111;
      a3 = v107;
      uint64_t v6 = v108;
      a2 = v109;
    }
    goto LABEL_82;
  }
LABEL_88:
  if (__p)
  {
    int v119 = __p;
    operator delete(__p);
  }
  if (v120[0])
  {
    v120[1] = v120[0];
    operator delete(v120[0]);
  }
  unint64_t v96 = 90;
  do
  {
    uint64_t v97 = (char *)v123 + v96 * 4;
    int v98 = v120[v96 / 2 + 2];
    if (v98)
    {
      *((void *)v97 - 2) = v98;
      operator delete(v98);
    }
    int v99 = (void *)*((void *)v97 - 6);
    if (v99)
    {
      v120[v96 / 2] = v99;
      operator delete(v99);
    }
    int v100 = (char *)v123 + v96 * 4;
    int v101 = *(void **)&v117[v96];
    if (v101)
    {
      *((void *)v100 - 8) = v101;
      operator delete(v101);
    }
    int v102 = (void *)*((void *)v100 - 12);
    if (v102)
    {
      *(void *)&v115[v96] = v102;
      operator delete(v102);
    }
    int v103 = (void *)*((void *)v97 - 15);
    if (v103)
    {
      *(void *)((char *)&v123[-7] + v96 * 4) = v103;
      operator delete(v103);
    }
    v96 -= 30;
  }
  while (v96 * 4);
}

void sub_24FF682BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *a25,uint64_t a26,uint64_t a27,void *__p,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  if (__p) {
    operator delete(__p);
  }
  for (uint64_t i = 240; i != -120; i -= 120)
    sub_24FF60EC8((uint64_t)(&a33 + i));
  _Unwind_Resume(a1);
}

void sub_24FF68318(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v76 = *MEMORY[0x263EF8340];
  uint64_t v64 = *(unsigned int *)(a1 + 4332);
  int v61 = (void *)(a1 + 4056);
  unint64_t v62 = *(int *)(a1 + 4336);
  uint64_t v6 = *(unsigned int *)(a1 + 4336);
  int v65 = *(_DWORD *)(a1 + 4360);
  memset_pattern16(__b, &unk_24FF7D710, 6uLL);
  uint64_t v7 = 0;
  uint64_t v75 = 0;
  memset(v74, 0, sizeof(v74));
  do
  {
    sub_24FF60D8C((uint64_t)v74 + v7, v6);
    v7 += 120;
  }
  while (v7 != 360);
  unint64_t v8 = v62;
  sub_24FF6A64C(&v71, v62);
  LODWORD(v66) = 0;
  sub_24FF6A454(&__p, v62, &v66);
  if ((int)v64 >= 1)
  {
    uint64_t v9 = 0;
    uint64_t v60 = a2;
    *(void *)int v63 = a3;
    uint64_t v10 = (int *)a2;
    uint64_t v59 = v6;
    while (v65 && !*(unsigned char *)(a3 + v9))
    {
LABEL_53:
      ++v9;
      v10 += v62;
      if (v9 == v64) {
        goto LABEL_54;
      }
    }
    unsigned int v11 = *(_DWORD *)(*(void *)(a1 + 4128) + 4 * v9);
    if ((v11 & 0x80000000) != 0)
    {
      a3 = *(void *)v63;
LABEL_34:
      int v38 = sub_24FF672B0(a1, v9, a2, a3, (int *)__p, (uint64_t)v69);
      unsigned int v27 = 0;
      if ((int)v6 < 1 || v38)
      {
LABEL_48:
        sub_24FF5F900((unsigned int *)a1, (uint64_t)__p, v8, v61, (unsigned char *)(a1 + 4372), (void *)v74 + 15 * v27, a2 + 4 * v9 * v8);
        if ((int)v8 >= 1)
        {
          int v45 = (char *)v71 + 4;
          int v46 = v10;
          uint64_t v47 = v6;
          do
          {
            int v49 = *v46++;
            int v48 = v49;
            int v50 = *((_DWORD *)v45 - 1);
            if (*(_DWORD *)&v45[4 * (((_BYTE)v50 - 1) & 3)] != v49)
            {
              *((_DWORD *)v45 - 1) = v50 + 1;
              *(_DWORD *)&v45[4 * (v50 & 3)] = v48;
            }
            v45 += 20;
            --v47;
          }
          while (v47);
        }
        goto LABEL_53;
      }
      int v39 = __p;
      int v40 = (char *)v71 + 4;
      do
      {
        BOOL v41 = sub_24FF5FDE8((unsigned int *)a1, __b);
        BOOL v42 = v41;
        if (v41) {
          uint64_t v43 = 2;
        }
        else {
          uint64_t v43 = 1;
        }
        if (sub_24FF5FDE8((unsigned int *)a1, &__b[v43])) {
          char v44 = 2;
        }
        else {
          char v44 = 0;
        }
        *v39++ = *(_DWORD *)&v40[4 * ((*((_DWORD *)v40 - 1) + ~(v44 | v42)) & 3)];
        v40 += 20;
        --v6;
      }
      while (v6);
      unsigned int v27 = 0;
      unint64_t v8 = v62;
      a3 = *(void *)v63;
      a2 = v60;
LABEL_45:
      uint64_t v6 = v59;
      goto LABEL_48;
    }
    int v67 = -1;
    uint64_t v66 = -1;
    sub_24FF64CDC((void *)a1, v11, v9, (unsigned int *)(*(void *)(a1 + 1256) + 12 * v11), &v66);
    int v13 = v66;
    int v12 = HIDWORD(v66);
    int v14 = v67;
    if (v67 < 0)
    {
      sub_24FF64CDC((void *)a1, v11, v9, (unsigned int *)(*(void *)(a1 + 1280) + 12 * v11), &v66);
      if (v67 < 0)
      {
        a3 = *(void *)v63;
        if (v14 == -1)
        {
LABEL_23:
          if (v12 != -1 && (!v65 || *(unsigned char *)(a3 + v13) && *(unsigned char *)(a3 + v12)))
          {
            uint64_t v6 = v59;
            if ((int)v59 < 1)
            {
              unsigned int v27 = 1;
              a2 = v60;
            }
            else
            {
              int v28 = v13 * v62;
              a2 = v60;
              int v29 = (int *)(v60 + 4 * v28);
              int v30 = (int *)(v60 + 4 * v12 * (int)v59);
              BOOL v31 = (int *)__p;
              uint64_t v32 = v59;
              do
              {
                int v34 = *v29++;
                int v33 = v34;
                int v35 = *v30++;
                BOOL v36 = __OFADD__(v35, v33);
                int v37 = v35 + v33;
                if (v37 < 0 != v36) {
                  ++v37;
                }
                *v31++ = v37 >> 1;
                --v32;
              }
              while (v32);
              unsigned int v27 = 1;
            }
            unint64_t v8 = v62;
            goto LABEL_48;
          }
          uint64_t v6 = v59;
          a2 = v60;
          unint64_t v8 = v62;
          goto LABEL_34;
        }
LABEL_12:
        if (!v65 || *(unsigned char *)(a3 + v13) && *(unsigned char *)(a3 + v12) && *(unsigned char *)(a3 + v14))
        {
          if ((int)v62 >= 1)
          {
            int v15 = v13 * v59;
            a2 = v60;
            int v16 = (int *)(v60 + 4 * v15);
            int v17 = (int *)(v60 + 4 * v12 * (int)v62);
            int v18 = v14 * v59;
            uint64_t v6 = v59;
            BOOL v19 = (int *)(v60 + 4 * v18);
            uint64_t v20 = __p;
            uint64_t v21 = v59;
            unint64_t v8 = v62;
            do
            {
              int v23 = *v16++;
              int v22 = v23;
              int v24 = *v17++;
              int v25 = v24 + v22;
              int v26 = *v19++;
              *v20++ = v25 - v26;
              --v21;
            }
            while (v21);
            unsigned int v27 = 2;
            goto LABEL_48;
          }
          unsigned int v27 = 2;
          a2 = v60;
          unint64_t v8 = v62;
          goto LABEL_45;
        }
        goto LABEL_23;
      }
      int v13 = v66;
      int v12 = HIDWORD(v66);
      int v14 = v67;
    }
    a3 = *(void *)v63;
    goto LABEL_12;
  }
LABEL_54:
  if (__p)
  {
    char v69 = __p;
    operator delete(__p);
  }
  if (v71)
  {
    v72[0] = v71;
    operator delete(v71);
  }
  unint64_t v51 = 360;
  do
  {
    int v52 = (char *)v74 + v51;
    int v53 = (void *)v72[v51 / 8];
    if (v53)
    {
      *((void *)v52 - 2) = v53;
      operator delete(v53);
    }
    int v54 = (void *)*((void *)v52 - 6);
    if (v54)
    {
      *(void *)&v70[v51] = v54;
      operator delete(v54);
    }
    int v55 = (char *)v74 + v51;
    unint64_t v56 = *(void **)((char *)&v66 + v51);
    if (v56)
    {
      *((void *)v55 - 8) = v56;
      operator delete(v56);
    }
    uint64_t v57 = (void *)*((void *)v55 - 12);
    if (v57)
    {
      *(void *)((char *)&v74[-5] + v51 - 8) = v57;
      operator delete(v57);
    }
    int v58 = (void *)*((void *)v52 - 15);
    if (v58)
    {
      *(void *)((char *)&v74[-7] + v51) = v58;
      operator delete(v58);
    }
    v51 -= 120;
  }
  while (v51);
}

void sub_24FF68800(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,uint64_t a22,void *__p,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  if (__p) {
    operator delete(__p);
  }
  for (uint64_t i = 240; i != -120; i -= 120)
    sub_24FF60EC8((uint64_t)(&a27 + i));
  _Unwind_Resume(a1);
}

void sub_24FF6885C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  int v49 = (void *)(a1 + 4056);
  uint64_t v53 = *(unsigned int *)(a1 + 4332);
  unint64_t v5 = *(int *)(a1 + 4336);
  uint64_t v6 = *(unsigned int *)(a1 + 4336);
  int v54 = *(_DWORD *)(a1 + 4360);
  memset_pattern16(__b, &unk_24FF7D710, 6uLL);
  char v7 = 0;
  uint64_t v8 = 0;
  memset(v62, 0, sizeof(v62));
  do
  {
    char v9 = v7;
    sub_24FF60D8C((uint64_t)v62 + 120 * v8, v6);
    char v7 = 1;
    uint64_t v8 = 1;
  }
  while ((v9 & 1) == 0);
  sub_24FF6A64C(v60, v5);
  LODWORD(v56) = 0;
  sub_24FF6A454(&__p, v5, &v56);
  if ((int)v53 >= 1)
  {
    uint64_t v10 = 0;
    uint64_t v48 = a3;
    unint64_t v50 = v5;
    uint64_t v51 = 4 * v5;
    unsigned int v11 = (int *)a2;
    uint64_t v52 = v6;
    while (v54 && !*(unsigned char *)(a3 + v10))
    {
LABEL_40:
      ++v10;
      unsigned int v11 = (int *)((char *)v11 + v51);
      if (v10 == v53) {
        goto LABEL_41;
      }
    }
    unsigned int v12 = *(_DWORD *)(*(void *)(a1 + 4128) + 4 * v10);
    if ((v12 & 0x80000000) != 0)
    {
      uint64_t v15 = v52;
LABEL_24:
      int v26 = sub_24FF672B0(a1, v10, a2, a3, (int *)__p, (uint64_t)v59);
      unsigned int v25 = 0;
      if ((int)v5 >= 1 && !v26)
      {
        unsigned int v27 = __p;
        int v28 = (char *)v60[0] + 4;
        uint64_t v29 = v15;
        do
        {
          BOOL v30 = sub_24FF5FDE8((unsigned int *)a1, __b);
          BOOL v31 = v30;
          if (v30) {
            uint64_t v32 = 2;
          }
          else {
            uint64_t v32 = 1;
          }
          if (sub_24FF5FDE8((unsigned int *)a1, &__b[v32])) {
            char v33 = 2;
          }
          else {
            char v33 = 0;
          }
          *v27++ = *(_DWORD *)&v28[4 * ((*((_DWORD *)v28 - 1) + ~(v33 | v31)) & 3)];
          v28 += 20;
          --v29;
        }
        while (v29);
        unsigned int v25 = 0;
        a3 = v48;
        unint64_t v5 = v50;
        uint64_t v15 = v52;
      }
      goto LABEL_35;
    }
    int v57 = -1;
    uint64_t v56 = -1;
    sub_24FF64CDC((void *)a1, v12, v10, (unsigned int *)(*(void *)(a1 + 1256) + 12 * v12), &v56);
    int v13 = v56;
    int v14 = HIDWORD(v56);
    if (v56 < 0)
    {
      sub_24FF64CDC((void *)a1, v12, v10, (unsigned int *)(*(void *)(a1 + 1280) + 12 * v12), &v56);
      if (v56 < 0)
      {
        uint64_t v15 = v52;
        if (v14 == -1)
        {
LABEL_23:
          unint64_t v5 = v50;
          goto LABEL_24;
        }
LABEL_12:
        if (!v54 || *(unsigned char *)(a3 + v13) && *(unsigned char *)(a3 + v14))
        {
          if ((int)v15 >= 1)
          {
            int v16 = (int *)(a2 + 4 * v13 * (int)v50);
            int v17 = (int *)(a2 + 4 * v14 * (int)v15);
            int v18 = (int *)__p;
            uint64_t v19 = v15;
            do
            {
              int v21 = *v16++;
              int v20 = v21;
              int v22 = *v17++;
              BOOL v23 = __OFADD__(v22, v20);
              int v24 = v22 + v20;
              if (v24 < 0 != v23) {
                ++v24;
              }
              *v18++ = v24 >> 1;
              --v19;
            }
            while (v19);
          }
          unsigned int v25 = 1;
          unint64_t v5 = v50;
LABEL_35:
          sub_24FF5F900((unsigned int *)a1, (uint64_t)__p, v5, v49, (unsigned char *)(a1 + 4372), (void *)v62 + 15 * v25, a2 + 4 * v10 * v5);
          if ((int)v15 >= 1)
          {
            int v34 = (char *)v60[0] + 4;
            int v35 = v11;
            uint64_t v36 = v15;
            do
            {
              int v38 = *v35++;
              int v37 = v38;
              int v39 = *((_DWORD *)v34 - 1);
              if (*(_DWORD *)&v34[4 * (((_BYTE)v39 - 1) & 3)] != v38)
              {
                *((_DWORD *)v34 - 1) = v39 + 1;
                *(_DWORD *)&v34[4 * (v39 & 3)] = v37;
              }
              v34 += 20;
              --v36;
            }
            while (v36);
          }
          goto LABEL_40;
        }
        goto LABEL_23;
      }
      int v13 = v56;
      int v14 = HIDWORD(v56);
    }
    uint64_t v15 = v52;
    goto LABEL_12;
  }
LABEL_41:
  if (__p)
  {
    uint64_t v59 = __p;
    operator delete(__p);
  }
  if (v60[0])
  {
    v60[1] = v60[0];
    operator delete(v60[0]);
  }
  for (uint64_t i = 0; i != -240; i -= 120)
  {
    BOOL v41 = (void *)((char *)v62 + i);
    BOOL v42 = *(void **)((char *)&v62[13] + i + 8);
    if (v42)
    {
      v41[28] = v42;
      operator delete(v42);
    }
    uint64_t v43 = (void *)v41[24];
    if (v43)
    {
      *(void *)((char *)&v62[12] + i + 8) = v43;
      operator delete(v43);
    }
    char v44 = (char *)v62 + i;
    int v45 = *(void **)((char *)&v62[10] + i + 8);
    if (v45)
    {
      *((void *)v44 + 22) = v45;
      operator delete(v45);
    }
    int v46 = (void *)*((void *)v44 + 18);
    if (v46)
    {
      *(void *)((char *)&v62[9] + i + 8) = v46;
      operator delete(v46);
    }
    uint64_t v47 = (void *)v41[15];
    if (v47)
    {
      *(void *)((char *)&v62[8] + i) = v47;
      operator delete(v47);
    }
  }
}

void sub_24FF68C90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,uint64_t a22,void *__p,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  if (__p) {
    operator delete(__p);
  }
  for (uint64_t i = 120; i != -120; i -= 120)
    sub_24FF60EC8((uint64_t)(&a27 + i));
  _Unwind_Resume(a1);
}

void *sub_24FF68CEC(void *a1)
{
  uint64_t v2 = operator new(0x1128uLL);
  sub_24FF69FDC((uint64_t)v2);
  *a1 = v2;
  return a1;
}

void sub_24FF68D24(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_24FF68D38(uint64_t *a1, unint64_t a2)
{
  unint64_t v2 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 2);
  BOOL v3 = a2 >= v2;
  unint64_t v4 = a2 - v2;
  if (v4 != 0 && v3)
  {
    sub_24FF68DB0(a1, v4);
  }
  else if (!v3)
  {
    a1[1] = *a1 + 12 * a2;
  }
}

void sub_24FF68D74(uint64_t *a1, unint64_t a2, _DWORD *a3)
{
  unint64_t v3 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 2);
  BOOL v4 = a2 >= v3;
  unint64_t v5 = a2 - v3;
  if (v5 != 0 && v4)
  {
    sub_24FF69038(a1, v5, a3);
  }
  else if (!v4)
  {
    a1[1] = *a1 + 12 * a2;
  }
}

void sub_24FF68DB0(uint64_t *a1, unint64_t a2)
{
  uint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  uint64_t v5 = v6;
  uint64_t v7 = *(void *)(v4 - 8);
  if (0xAAAAAAAAAAAAAAABLL * ((v6 - v7) >> 2) >= a2)
  {
    if (a2)
    {
      size_t v13 = 12 * ((12 * a2 - 12) / 0xC) + 12;
      bzero(*(void **)(v4 - 8), v13);
      v7 += v13;
    }
    a1[1] = v7;
  }
  else
  {
    unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((v7 - *a1) >> 2);
    unint64_t v9 = v8 + a2;
    if (v8 + a2 > 0x1555555555555555) {
      sub_24FF5A660();
    }
    unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * ((v5 - *a1) >> 2);
    if (2 * v10 > v9) {
      unint64_t v9 = 2 * v10;
    }
    if (v10 >= 0xAAAAAAAAAAAAAAALL) {
      unint64_t v11 = 0x1555555555555555;
    }
    else {
      unint64_t v11 = v9;
    }
    uint64_t v19 = v4;
    if (v11) {
      unsigned int v12 = (char *)sub_24FF68FF0(v4, v11);
    }
    else {
      unsigned int v12 = 0;
    }
    __p = v12;
    int v16 = &v12[12 * v8];
    int v18 = &v12[12 * v11];
    size_t v14 = 12 * ((12 * a2 - 12) / 0xC) + 12;
    bzero(v16, v14);
    int v17 = &v16[v14];
    sub_24FF68F88(a1, &__p);
    if (v17 != v16) {
      int v17 = &v16[(v17 - v16 - 12) % 0xCuLL];
    }
    if (__p) {
      operator delete(__p);
    }
  }
}

void sub_24FF68F3C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t *sub_24FF68F88(uint64_t *result, void *a2)
{
  uint64_t v3 = *result;
  uint64_t v2 = result[1];
  uint64_t v4 = a2[1];
  while (v2 != v3)
  {
    int v5 = *(_DWORD *)(v2 - 12);
    v2 -= 12;
    *(_DWORD *)(v4 - 12) = v5;
    v4 -= 12;
    *(_DWORD *)(v4 + 4) = *(_DWORD *)(v2 + 4);
    *(_DWORD *)(v4 + 8) = *(_DWORD *)(v2 + 8);
  }
  a2[1] = v4;
  uint64_t v6 = *result;
  *uint64_t result = v4;
  a2[1] = v6;
  uint64_t v7 = result[1];
  result[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = result[2];
  result[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

void *sub_24FF68FF0(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x1555555555555556) {
    sub_24FF5A6B0();
  }
  return operator new(12 * a2);
}

void sub_24FF69038(uint64_t *a1, unint64_t a2, _DWORD *a3)
{
  uint64_t v8 = a1[2];
  uint64_t v6 = (uint64_t)(a1 + 2);
  uint64_t v7 = v8;
  unint64_t v9 = *(_DWORD **)(v6 - 8);
  if (0xAAAAAAAAAAAAAAABLL * ((v8 - (uint64_t)v9) >> 2) >= a2)
  {
    if (a2)
    {
      uint64_t v15 = &v9[3 * a2];
      do
      {
        _DWORD *v9 = *a3;
        v9[1] = a3[1];
        v9[2] = a3[2];
        v9 += 3;
      }
      while (v9 != v15);
      unint64_t v9 = v15;
    }
    a1[1] = (uint64_t)v9;
  }
  else
  {
    unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v9 - *a1) >> 2);
    unint64_t v11 = v10 + a2;
    if (v10 + a2 > 0x1555555555555555) {
      sub_24FF5A660();
    }
    unint64_t v12 = 0xAAAAAAAAAAAAAAABLL * ((v7 - *a1) >> 2);
    if (2 * v12 > v11) {
      unint64_t v11 = 2 * v12;
    }
    if (v12 >= 0xAAAAAAAAAAAAAAALL) {
      unint64_t v13 = 0x1555555555555555;
    }
    else {
      unint64_t v13 = v11;
    }
    uint64_t v22 = v6;
    if (v13) {
      size_t v14 = (char *)sub_24FF68FF0(v6, v13);
    }
    else {
      size_t v14 = 0;
    }
    int v16 = &v14[12 * v10];
    __p = v14;
    uint64_t v19 = v16;
    int v21 = &v14[12 * v13];
    int v17 = &v16[12 * a2];
    do
    {
      *(_DWORD *)int v16 = *a3;
      *((_DWORD *)v16 + 1) = a3[1];
      *((_DWORD *)v16 + 2) = a3[2];
      v16 += 12;
    }
    while (v16 != v17);
    int v20 = v17;
    sub_24FF68F88(a1, &__p);
    if (v20 != v19) {
      int v20 = &v19[(v20 - v19 - 12) % 0xCuLL];
    }
    if (__p) {
      operator delete(__p);
    }
  }
}

void sub_24FF691C4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_24FF69210(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 2);
  BOOL v3 = a2 >= v2;
  unint64_t v4 = a2 - v2;
  if (v4 != 0 && v3)
  {
    sub_24FF69478((char **)a1, v4);
  }
  else if (!v3)
  {
    *(void *)(a1 + 8) = *(void *)a1 + 12 * a2;
  }
}

void sub_24FF6924C(uint64_t a1, int a2)
{
  uint64_t v2 = a1 + 8;
  uint64_t v3 = a1 + 1544;
  unint64_t v4 = a2;
  do
  {
    __p = 0;
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    sub_24FF69690(&__p, *(const void **)v2, *(void *)(v2 + 8), (uint64_t)(*(void *)(v2 + 8) - *(void *)v2) >> 3);
    sub_24FF695E8(&__p, v4);
    if (__p)
    {
      uint64_t v6 = __p;
      operator delete(__p);
    }
    v2 += 24;
  }
  while (v2 != v3);
}

void sub_24FF692C8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_24FF692E4(uint64_t a1, unint64_t a2)
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
    sub_24FF69788((void **)a1, a2 - v2);
  }
}

void sub_24FF69314(void **a1, unint64_t a2)
{
  unint64_t v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (unsigned char *)*a1) >> 2)
  {
    if (a2 >> 62) {
      sub_24FF5A660();
    }
    int64_t v5 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    uint64_t v6 = (char *)sub_24FF698E0(v3, a2);
    uint64_t v7 = &v6[v5 & 0xFFFFFFFFFFFFFFFCLL];
    unint64_t v9 = &v6[4 * v8];
    unint64_t v10 = (char *)*a1;
    unint64_t v11 = (char *)a1[1];
    unint64_t v12 = v7;
    if (v11 != *a1)
    {
      unint64_t v12 = v7;
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

void sub_24FF693BC(unint64_t *a1, size_t __sz)
{
  unint64_t v2 = *a1;
  if (a1[2] - *a1 < __sz)
  {
    if ((__sz & 0x8000000000000000) != 0) {
      sub_24FF5A660();
    }
    int64_t v5 = (char *)a1[1];
    uint64_t v6 = operator new(__sz);
    uint64_t v7 = &v5[(void)v6 - v2];
    uint64_t v8 = v7;
    if (v5 != (char *)v2)
    {
      unint64_t v9 = &v5[~v2];
      do
      {
        char v10 = *--v5;
        (v9--)[(void)v6] = v10;
      }
      while (v5 != (char *)v2);
      uint64_t v8 = v6;
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

void sub_24FF69478(char **a1, unint64_t a2)
{
  uint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  int64_t v5 = v6;
  uint64_t v7 = *(void *)(v4 - 8);
  if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)&v6[-v7] >> 2) >= a2)
  {
    if (a2)
    {
      uint64_t v13 = v7 + 12 * a2;
      do
      {
        *(void *)uint64_t v7 = 0xFFFFFFFF00000000;
        *(_DWORD *)(v7 + 8) = -1;
        v7 += 12;
      }
      while (v7 != v13);
      uint64_t v7 = v13;
    }
    a1[1] = (char *)v7;
  }
  else
  {
    unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((v7 - (uint64_t)*a1) >> 2);
    unint64_t v9 = v8 + a2;
    if (v8 + a2 > 0x1555555555555555) {
      sub_24FF5A660();
    }
    unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * ((v5 - *a1) >> 2);
    if (2 * v10 > v9) {
      unint64_t v9 = 2 * v10;
    }
    if (v10 >= 0xAAAAAAAAAAAAAAALL) {
      unint64_t v11 = 0x1555555555555555;
    }
    else {
      unint64_t v11 = v9;
    }
    if (v11) {
      unint64_t v12 = (char *)sub_24FF68FF0(v4, v11);
    }
    else {
      unint64_t v12 = 0;
    }
    size_t v14 = &v12[12 * v8];
    uint64_t v15 = &v14[12 * a2];
    int v16 = v14;
    do
    {
      *(void *)int v16 = 0xFFFFFFFF00000000;
      *((_DWORD *)v16 + 2) = -1;
      v16 += 12;
    }
    while (v16 != v15);
    int v17 = &v12[12 * v11];
    uint64_t v19 = *a1;
    int v18 = a1[1];
    if (v18 != *a1)
    {
      do
      {
        uint64_t v20 = *(void *)(v18 - 12);
        v18 -= 12;
        int v21 = *((_DWORD *)v18 + 2);
        *(void *)(v14 - 12) = v20;
        v14 -= 12;
        *((_DWORD *)v14 + 2) = v21;
      }
      while (v18 != v19);
      int v18 = *a1;
    }
    *a1 = v14;
    a1[1] = v15;
    a1[2] = v17;
    if (v18)
    {
      operator delete(v18);
    }
  }
}

void sub_24FF695E8(void **a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (unsigned char *)*a1) >> 3)
  {
    if (a2 >> 61) {
      sub_24FF5A660();
    }
    int64_t v5 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    uint64_t v6 = (char *)sub_24FF69750(v3, a2);
    uint64_t v7 = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
    unint64_t v9 = &v6[8 * v8];
    unint64_t v11 = (char *)*a1;
    unint64_t v10 = (char *)a1[1];
    unint64_t v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        uint64_t v13 = *((void *)v10 - 1);
        v10 -= 8;
        *((void *)v12 - 1) = v13;
        v12 -= 8;
      }
      while (v10 != v11);
      unint64_t v10 = (char *)*a1;
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

void *sub_24FF69690(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    uint64_t result = sub_24FF6970C(result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      uint64_t result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_24FF696F0(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *sub_24FF6970C(void *a1, unint64_t a2)
{
  if (a2 >> 61) {
    sub_24FF5A660();
  }
  uint64_t result = (char *)sub_24FF69750((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

void *sub_24FF69750(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    sub_24FF5A6B0();
  }
  return operator new(8 * a2);
}

void sub_24FF69788(void **a1, unint64_t a2)
{
  uint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  int64_t v5 = v6;
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
      sub_24FF5A660();
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
      uint64_t v13 = (char *)sub_24FF698A8(v4, v12);
    }
    else {
      uint64_t v13 = 0;
    }
    size_t v14 = &v13[16 * v10];
    uint64_t v15 = &v13[16 * v12];
    bzero(v14, 16 * a2);
    int v16 = &v14[16 * a2];
    int v18 = (char *)*a1;
    int v17 = (char *)a1[1];
    if (v17 != *a1)
    {
      do
      {
        *((_OWORD *)v14 - 1) = *((_OWORD *)v17 - 1);
        v14 -= 16;
        v17 -= 16;
      }
      while (v17 != v18);
      int v17 = (char *)*a1;
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

void *sub_24FF698A8(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60) {
    sub_24FF5A6B0();
  }
  return operator new(16 * a2);
}

void *sub_24FF698E0(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    sub_24FF5A6B0();
  }
  return operator new(4 * a2);
}

void sub_24FF69918(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 1;
  if (a2 <= v2)
  {
    if (a2 < v2) {
      *(void *)(a1 + 8) = *(void *)a1 + 2 * a2;
    }
  }
  else
  {
    sub_24FF69948((char **)a1, a2 - v2);
  }
}

void sub_24FF69948(char **a1, unint64_t a2)
{
  uint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  int64_t v5 = v6;
  uint64_t v7 = *(char **)(v4 - 8);
  if (a2 <= (v6 - v7) >> 1)
  {
    if (a2)
    {
      memset_pattern16(*(void **)(v4 - 8), &unk_24FF7D710, 2 * a2);
      v7 += 2 * a2;
    }
    a1[1] = v7;
  }
  else
  {
    uint64_t v8 = *a1;
    uint64_t v9 = v7 - *a1;
    uint64_t v10 = a2 + (v9 >> 1);
    if (v10 < 0) {
      sub_24FF5A660();
    }
    uint64_t v11 = v9 >> 1;
    unint64_t v12 = v5 - v8;
    if (v12 > v10) {
      uint64_t v10 = v12;
    }
    if (v12 >= 0x7FFFFFFFFFFFFFFELL) {
      uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      uint64_t v13 = v10;
    }
    if (v13)
    {
      size_t v14 = (char *)sub_24FF69A68(v4, v13);
      uint64_t v8 = *a1;
      uint64_t v7 = a1[1];
    }
    else
    {
      size_t v14 = 0;
    }
    uint64_t v15 = &v14[2 * v11];
    int v16 = &v14[2 * v13];
    memset_pattern16(v15, &unk_24FF7D710, 2 * a2);
    int v17 = &v15[2 * a2];
    while (v7 != v8)
    {
      __int16 v18 = *((_WORD *)v7 - 1);
      v7 -= 2;
      *((_WORD *)v15 - 1) = v18;
      v15 -= 2;
    }
    *a1 = v15;
    a1[1] = v17;
    a1[2] = v16;
    if (v8)
    {
      operator delete(v8);
    }
  }
}

void *sub_24FF69A68(uint64_t a1, uint64_t a2)
{
  if (a2 < 0) {
    sub_24FF5A6B0();
  }
  return operator new(2 * a2);
}

uint64_t sub_24FF69A9C(uint64_t a1, int a2)
{
  if (!sub_24FF5FDE8((unsigned int *)a1, (_WORD *)(a1 + 3496))) {
    return sub_24FF5FFA0((unsigned int *)a1, 0, (_WORD *)(a1 + 3530), (_WORD *)(a1 + 3532)) + a2;
  }
  uint64_t v4 = a1 + 3536;
  BOOL v5 = sub_24FF5FDE8((unsigned int *)a1, (_WORD *)(a1 + 3536));
  if (v5) {
    uint64_t v6 = 4;
  }
  else {
    uint64_t v6 = 2;
  }
  if (sub_24FF5FDE8((unsigned int *)a1, (_WORD *)(v4 + v6))) {
    int v7 = 2;
  }
  else {
    int v7 = 0;
  }
  int v8 = v7 | v5;
  if (sub_24FF5FDE8((unsigned int *)a1, (_WORD *)(v4 + 2 * (v8 + 3)))) {
    int v9 = 4;
  }
  else {
    int v9 = 0;
  }
  int v10 = v8 | v9;
  if (sub_24FF5FDE8((unsigned int *)a1, (_WORD *)(v4 + 2 * (v10 + 7)))) {
    int v11 = 8;
  }
  else {
    int v11 = 0;
  }
  int v12 = v10 | v11;
  if (sub_24FF5FDE8((unsigned int *)a1, (_WORD *)(v4 + 2 * (v12 + 15)))) {
    int v13 = 16;
  }
  else {
    int v13 = 0;
  }
  int v14 = v12 | v13;
  if (sub_24FF5FDE8((unsigned int *)a1, (_WORD *)(v4 + 2 * ((v12 | v13) + 31)))) {
    int v15 = 32;
  }
  else {
    int v15 = 0;
  }
  BOOL v16 = sub_24FF5FDE8((unsigned int *)a1, (_WORD *)(a1 + 3664));
  if (v16) {
    uint64_t v17 = 4;
  }
  else {
    uint64_t v17 = 2;
  }
  if (sub_24FF5FDE8((unsigned int *)a1, (_WORD *)(a1 + 3664 + v17))) {
    int v18 = 2;
  }
  else {
    int v18 = 0;
  }
  int v19 = v18 | v16;
  if (v19 != 3) {
    goto LABEL_29;
  }
  int v20 = sub_24FF5FED8((unsigned int *)a1, 0, (_WORD *)(a1 + 3670));
  if (v20 >= -3)
  {
    int v19 = v20 + 3;
LABEL_29:
    uint64_t v21 = a1 + 24 * (v14 | v15);
    uint64_t v22 = *(void *)(v21 + 1512);
    uint64_t v23 = *(void *)(v21 + 1504);
    if (v19 < (int)((unint64_t)(v22 - v23) >> 3))
    {
      uint64_t v24 = *(void *)(v23 + 8 * v19);
      if (v24) {
        return -1431655765 * ((unint64_t)(v24 - *(void *)(a1 + 1472)) >> 2);
      }
    }
  }
  *(_DWORD *)(a1 + 4384) = 3;
  return 0xFFFFFFFFLL;
}

void *sub_24FF69C60(void *result, int a2, unsigned int a3, int a4)
{
  uint64_t v4 = (a4 - 2);
  if (a3 > 2)
  {
    if (a3 == 3 || a3 == 5)
    {
      if (a4 >= 2)
      {
        int v12 = (int *)(result[181] + 16 * a2);
        int v13 = v12[3];
        int v14 = *v12;
        do
        {
          int v15 = v14;
          int v14 = *(_DWORD *)(result[166] + 4 * v4);
          if (*(unsigned char *)(result[169] + v4))
          {
            BOOL v16 = (_DWORD *)(result[157] + 12 * v14);
            _DWORD *v16 = a2;
            v16[1] = v15;
            v16[2] = v13;
          }
          int v13 = v15;
        }
        while (v4-- > 0);
      }
    }
    else if (a4 >= 1)
    {
      uint64_t v18 = 0;
      int v19 = -1;
      int v20 = -1;
      do
      {
        int v21 = v19;
        int v19 = *(_DWORD *)(result[166] + 4 * v18);
        if (*(unsigned char *)(result[169] + v18))
        {
          uint64_t v22 = (_DWORD *)(result[157] + 12 * v19);
          *uint64_t v22 = a2;
          v22[1] = v21;
          v22[2] = v20;
        }
        ++v18;
        int v20 = v21;
      }
      while (a4 != v18);
    }
  }
  else
  {
    uint64_t v5 = result[181];
    if (a4 >= 2)
    {
      int v6 = *(_DWORD *)(v5 + 16 * a2 + 4);
      int v7 = *(_DWORD *)(v5 + 16 * a2 + 8);
      for (uint64_t i = 1; i != a4; ++i)
      {
        int v9 = *(_DWORD *)(result[166] + 4 * i);
        if (*(unsigned char *)(result[169] + i))
        {
          int v10 = (_DWORD *)(result[157] + 12 * v9);
          *int v10 = a2;
          v10[1] = v6;
          v10[2] = v7;
        }
        int v7 = v6;
        int v6 = v9;
      }
    }
    if (!a3)
    {
      if (*(unsigned char *)(result[169] + v4))
      {
        int v11 = (_DWORD *)(result[160] + 12 * *(int *)(result[166] + 4 * v4));
        *int v11 = a2;
        v11[1] = *(_DWORD *)(v5 + 16 * a2);
        v11[2] = *(_DWORD *)(v5 + 16 * a2 + 12);
      }
    }
  }
  return result;
}

void sub_24FF69DDC(unint64_t *a1, size_t a2)
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
    int v7 = &v5[-*a1];
    unint64_t v8 = (unint64_t)&v7[a2];
    if ((uint64_t)&v7[a2] < 0) {
      sub_24FF5A660();
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
    int v12 = &v7[v11];
    int v13 = (char *)(v11 + v10);
    bzero(v12, a2);
    if (v5 == (char *)v6)
    {
      unint64_t v11 = (unint64_t)v12;
    }
    else
    {
      int v14 = &v5[~v6];
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

void *sub_24FF69F18(void *a1, size_t a2, unsigned char *a3)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    size_t v5 = a2;
    sub_24FF69F98(a1, a2);
    unint64_t v6 = (unsigned char *)a1[1];
    int v7 = &v6[v5];
    do
    {
      *v6++ = *a3;
      --v5;
    }
    while (v5);
    a1[1] = v7;
  }
  return a1;
}

void sub_24FF69F7C(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *sub_24FF69F98(void *a1, size_t __sz)
{
  if ((__sz & 0x8000000000000000) != 0) {
    sub_24FF5A660();
  }
  uint64_t result = (char *)operator new(__sz);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[__sz];
  return result;
}

uint64_t sub_24FF69FDC(uint64_t a1)
{
  *(void *)(a1 + 8) = 0;
  *(_DWORD *)(a1 + 1140) = 0;
  *(_OWORD *)(a1 + 1072) = 0u;
  *(_OWORD *)(a1 + 1088) = 0u;
  *(_OWORD *)(a1 + 1104) = 0u;
  *(_OWORD *)(a1 + 1120) = 0u;
  *(unsigned char *)(a1 + 1136) = 0;
  *(unsigned char *)(a1 + 1144) = 4;
  *(void *)(a1 + 1148) = 0x101010100000002;
  *(unsigned char *)(a1 + 1156) = 1;
  *(_DWORD *)(a1 + 1496) = 0;
  *(_OWORD *)(a1 + 1176) = 0u;
  *(_OWORD *)(a1 + 1192) = 0u;
  *(_OWORD *)(a1 + 1208) = 0u;
  *(_OWORD *)(a1 + 1224) = 0u;
  *(_OWORD *)(a1 + 1240) = 0u;
  *(_OWORD *)(a1 + 1256) = 0u;
  *(_OWORD *)(a1 + 1272) = 0u;
  *(_OWORD *)(a1 + 1288) = 0u;
  *(_OWORD *)(a1 + 1304) = 0u;
  *(_OWORD *)(a1 + 1320) = 0u;
  *(_OWORD *)(a1 + 1160) = 0u;
  *(_OWORD *)(a1 + 1336) = 0u;
  *(_OWORD *)(a1 + 1352) = 0u;
  *(_OWORD *)(a1 + 1368) = 0u;
  *(_OWORD *)(a1 + 1384) = 0u;
  *(_OWORD *)(a1 + 1400) = 0u;
  *(_OWORD *)(a1 + 1416) = 0u;
  *(_OWORD *)(a1 + 1432) = 0u;
  *(_OWORD *)(a1 + 1448) = 0u;
  *(_OWORD *)(a1 + 1464) = 0u;
  *(_OWORD *)(a1 + 1480) = 0u;
  *(_DWORD *)(a1 + 1500) = -1;
  bzero((void *)(a1 + 1504), 0x700uLL);
  memset_pattern16((void *)(a1 + 3296), &unk_24FF7D710, 0xAuLL);
  *(_WORD *)(a1 + 3306) = 0x8000;
  memset_pattern16((void *)(a1 + 3308), &unk_24FF7D710, 0x60uLL);
  *(_WORD *)(a1 + 3404) = 0x8000;
  memset_pattern16((void *)(a1 + 3406), &unk_24FF7D710, 6uLL);
  *(_WORD *)(a1 + 3412) = 0x8000;
  memset_pattern16((void *)(a1 + 3414), &unk_24FF7D710, 0x50uLL);
  *(_DWORD *)(a1 + 3494) = -2147450880;
  memset_pattern16((void *)(a1 + 3498), &unk_24FF7D710, 0x20uLL);
  *(_DWORD *)(a1 + 3530) = -2147450880;
  *(_WORD *)(a1 + 3534) = 0x8000;
  memset_pattern16((void *)(a1 + 3536), &unk_24FF7D710, 0x80uLL);
  memset_pattern16((void *)(a1 + 3664), &unk_24FF7D710, 6uLL);
  *(_WORD *)(a1 + 3670) = 0x8000;
  memset_pattern16((void *)(a1 + 3672), &unk_24FF7D710, 6uLL);
  *(_OWORD *)(a1 + 4028) = 0u;
  *(_OWORD *)(a1 + 4016) = 0u;
  *(_OWORD *)(a1 + 4000) = 0u;
  *(_OWORD *)(a1 + 3984) = 0u;
  *(_OWORD *)(a1 + 3968) = 0u;
  *(_OWORD *)(a1 + 3952) = 0u;
  *(_OWORD *)(a1 + 3936) = 0u;
  *(_OWORD *)(a1 + 3920) = 0u;
  *(_OWORD *)(a1 + 3904) = 0u;
  *(_OWORD *)(a1 + 3888) = 0u;
  *(_OWORD *)(a1 + 3872) = 0u;
  *(_OWORD *)(a1 + 3856) = 0u;
  *(_OWORD *)(a1 + 3840) = 0u;
  *(_OWORD *)(a1 + 3824) = 0u;
  *(_OWORD *)(a1 + 3808) = 0u;
  *(_OWORD *)(a1 + 3792) = 0u;
  *(_OWORD *)(a1 + 3776) = 0u;
  *(_OWORD *)(a1 + 3760) = 0u;
  *(_OWORD *)(a1 + 3744) = 0u;
  *(_OWORD *)(a1 + 3728) = 0u;
  *(_OWORD *)(a1 + 3712) = 0u;
  *(_OWORD *)(a1 + 3696) = 0u;
  *(_OWORD *)(a1 + 3680) = 0u;
  *(unsigned char *)(a1 + 4044) = 4;
  *(_DWORD *)(a1 + 4048) = 2;
  *(_OWORD *)(a1 + 4356) = 0u;
  *(_OWORD *)(a1 + 4056) = 0u;
  *(_OWORD *)(a1 + 4072) = 0u;
  *(_OWORD *)(a1 + 4088) = 0u;
  *(_OWORD *)(a1 + 4104) = 0u;
  *(_OWORD *)(a1 + 4120) = 0u;
  *(_OWORD *)(a1 + 4136) = 0u;
  *(_OWORD *)(a1 + 4152) = 0u;
  *(_OWORD *)(a1 + 4168) = 0u;
  *(_OWORD *)(a1 + 4184) = 0u;
  *(_OWORD *)(a1 + 4200) = 0u;
  *(_OWORD *)(a1 + 4216) = 0u;
  *(_OWORD *)(a1 + 4232) = 0u;
  *(_OWORD *)(a1 + 4248) = 0u;
  *(_OWORD *)(a1 + 4264) = 0u;
  *(_OWORD *)(a1 + 4280) = 0u;
  *(_OWORD *)(a1 + 4296) = 0u;
  *(_OWORD *)(a1 + 4312) = 0u;
  *(_OWORD *)(a1 + 4328) = 0u;
  *(_OWORD *)(a1 + 4344) = 0u;
  *(unsigned char *)(a1 + 4372) = 4;
  *(_DWORD *)(a1 + 4376) = 2;
  *(_DWORD *)(a1 + 4384) = 6;
  return a1;
}

void sub_24FF6A214(char **a1, unint64_t a2)
{
  unint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  size_t v5 = v6;
  int v7 = *(char **)(v4 - 8);
  if (a2 <= (v6 - v7) >> 2)
  {
    if (a2)
    {
      bzero(*(void **)(v4 - 8), 4 * a2);
      v7 += 4 * a2;
    }
    a1[1] = v7;
  }
  else
  {
    unint64_t v8 = *a1;
    uint64_t v9 = v7 - *a1;
    unint64_t v10 = a2 + (v9 >> 2);
    if (v10 >> 62) {
      sub_24FF5A660();
    }
    uint64_t v11 = v9 >> 2;
    uint64_t v12 = v5 - v8;
    if (v12 >> 1 > v10) {
      unint64_t v10 = v12 >> 1;
    }
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v13 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v13 = v10;
    }
    if (v13)
    {
      int v14 = (char *)sub_24FF698E0(v4, v13);
      unint64_t v8 = *a1;
      int v7 = a1[1];
    }
    else
    {
      int v14 = 0;
    }
    char v15 = &v14[4 * v11];
    BOOL v16 = &v14[4 * v13];
    bzero(v15, 4 * a2);
    uint64_t v17 = &v15[4 * a2];
    while (v7 != v8)
    {
      int v18 = *((_DWORD *)v7 - 1);
      v7 -= 4;
      *((_DWORD *)v15 - 1) = v18;
      v15 -= 4;
    }
    *a1 = v15;
    a1[1] = v17;
    a1[2] = v16;
    if (v8)
    {
      operator delete(v8);
    }
  }
}

void sub_24FF6A330(void **a1, unint64_t a2, _DWORD *a3)
{
  unint64_t v8 = a1[2];
  uint64_t v6 = (uint64_t)(a1 + 2);
  int v7 = v8;
  uint64_t v9 = *(_DWORD **)(v6 - 8);
  if (a2 <= (v8 - (unsigned char *)v9) >> 2)
  {
    if (a2)
    {
      uint64_t v16 = 4 * a2;
      uint64_t v17 = &v9[a2];
      do
      {
        *v9++ = *a3;
        v16 -= 4;
      }
      while (v16);
      uint64_t v9 = v17;
    }
    a1[1] = v9;
  }
  else
  {
    uint64_t v10 = (char *)v9 - (unsigned char *)*a1;
    unint64_t v11 = a2 + (v10 >> 2);
    if (v11 >> 62) {
      sub_24FF5A660();
    }
    uint64_t v12 = v10 >> 2;
    uint64_t v13 = v7 - (unsigned char *)*a1;
    if (v13 >> 1 > v11) {
      unint64_t v11 = v13 >> 1;
    }
    if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v14 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v14 = v11;
    }
    if (v14) {
      char v15 = (char *)sub_24FF698E0(v6, v14);
    }
    else {
      char v15 = 0;
    }
    int v18 = &v15[4 * v12];
    int v19 = &v18[4 * a2];
    uint64_t v20 = 4 * a2;
    int v21 = v18;
    do
    {
      *(_DWORD *)int v21 = *a3;
      v21 += 4;
      v20 -= 4;
    }
    while (v20);
    uint64_t v22 = &v15[4 * v14];
    uint64_t v23 = (char *)*a1;
    for (uint64_t i = (char *)a1[1]; i != v23; i -= 4)
    {
      int v25 = *((_DWORD *)i - 1);
      *((_DWORD *)v18 - 1) = v25;
      v18 -= 4;
    }
    *a1 = v18;
    a1[1] = v19;
    a1[2] = v22;
    if (v23)
    {
      operator delete(v23);
    }
  }
}

void *sub_24FF6A454(void *a1, unint64_t a2, _DWORD *a3)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    sub_24FF6A4D8(a1, a2);
    uint64_t v6 = (_DWORD *)a1[1];
    int v7 = &v6[a2];
    uint64_t v8 = 4 * a2;
    do
    {
      *v6++ = *a3;
      v8 -= 4;
    }
    while (v8);
    a1[1] = v7;
  }
  return a1;
}

void sub_24FF6A4BC(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *sub_24FF6A4D8(void *a1, unint64_t a2)
{
  if (a2 >> 62) {
    sub_24FF5A660();
  }
  uint64_t result = (char *)sub_24FF698E0((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[4 * v4];
  return result;
}

void *sub_24FF6A51C(void *a1, unint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  sub_24FF6A4D8(a1, a2);
  uint64_t v4 = (char *)a1[1];
  bzero(v4, 4 * a2);
  a1[1] = &v4[4 * a2];
  return a1;
}

void sub_24FF6A570(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_24FF6A58C(_DWORD *a1, uint64_t a2)
{
  uint64_t v2 = *(unsigned int *)(a2 + 8);
  if ((v2 & 0x80000000) != 0) {
    return 0;
  }
  int v3 = *(_DWORD *)(a2 + 4);
  uint64_t v4 = *(void *)&a1[6 * v3 + 2];
  int v5 = ((unint64_t)(*(void *)&a1[6 * v3 + 4] - v4) >> 3) - 1;
  if (v2 != v5)
  {
    uint64_t v6 = *(void *)(v4 + 8 * v2);
    *(void *)(v4 + 8 * v2) = *(void *)(v4 + 8 * v5);
    *(void *)(v4 + 8 * v5) = v6;
    *(_DWORD *)(*(void *)(v4 + 8 * v2) + 8) = v2;
    *(_DWORD *)(v6 + 8) = v5;
  }
  return sub_24FF6A5E0(a1, v3);
}

uint64_t sub_24FF6A5E0(_DWORD *a1, int a2)
{
  uint64_t v2 = &a1[6 * a2];
  uint64_t v3 = *((void *)v2 + 2);
  uint64_t v4 = *(void *)(v3 - 8);
  *((void *)v2 + 2) = v3 - 8;
  *(_DWORD *)(v4 + 8) = -1;
  if ((*a1)-- == 1)
  {
    a1[1] = -1;
  }
  else
  {
    int v6 = a1[1];
    if ((v6 & 0x80000000) == 0)
    {
      do
      {
        if (*(void *)&a1[6 * v6 + 2] != *(void *)&a1[6 * v6 + 4]) {
          break;
        }
        a1[1] = v6 - 1;
      }
      while (v6-- > 0);
    }
  }
  return v4;
}

void *sub_24FF6A64C(void *a1, unint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    sub_24FF6A6D4(a1, a2);
    uint64_t v4 = a1[1];
    uint64_t v5 = v4 + 20 * a2;
    uint64_t v6 = 20 * a2;
    int v7 = (void *)(v4 + 4);
    do
    {
      *int v7 = 0;
      v7[1] = 0;
      *((_DWORD *)v7 - 1) = 4;
      int v7 = (void *)((char *)v7 + 20);
      v6 -= 20;
    }
    while (v6);
    a1[1] = v5;
  }
  return a1;
}

void sub_24FF6A6B8(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *sub_24FF6A6D4(void *a1, unint64_t a2)
{
  if (a2 >= 0xCCCCCCCCCCCCCCDLL) {
    sub_24FF5A660();
  }
  uint64_t result = (char *)sub_24FF6A728((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[20 * v4];
  return result;
}

void *sub_24FF6A728(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xCCCCCCCCCCCCCCDLL) {
    sub_24FF5A6B0();
  }
  return operator new(20 * a2);
}

void *sub_24FF6A770(void *a1)
{
  sub_24FF6A9A8((uint64_t)(a1 + 531));
  sub_24FF6A9A8((uint64_t)(a1 + 522));
  uint64_t v2 = (void *)a1[519];
  if (v2)
  {
    a1[520] = v2;
    operator delete(v2);
  }
  uint64_t v3 = (void *)a1[516];
  if (v3)
  {
    a1[517] = v3;
    operator delete(v3);
  }
  uint64_t v4 = (void *)a1[513];
  if (v4)
  {
    a1[514] = v4;
    operator delete(v4);
  }
  uint64_t v5 = (void *)a1[510];
  if (v5)
  {
    a1[511] = v5;
    operator delete(v5);
  }
  uint64_t v6 = (void *)a1[507];
  if (v6)
  {
    a1[508] = v6;
    operator delete(v6);
  }
  int v7 = (void *)a1[496];
  if (v7)
  {
    a1[497] = v7;
    operator delete(v7);
  }
  uint64_t v8 = (void *)a1[493];
  if (v8)
  {
    a1[494] = v8;
    operator delete(v8);
  }
  uint64_t v9 = (void *)a1[490];
  if (v9)
  {
    a1[491] = v9;
    operator delete(v9);
  }
  for (uint64_t i = 488; i != 458; i -= 15)
  {
    unint64_t v11 = &a1[i];
    uint64_t v12 = (void *)a1[i - 1];
    if (v12)
    {
      a1[i] = v12;
      operator delete(v12);
    }
    uint64_t v13 = (void *)*(v11 - 4);
    if (v13)
    {
      a1[i - 3] = v13;
      operator delete(v13);
    }
    unint64_t v14 = &a1[i];
    char v15 = (void *)a1[i - 7];
    if (v15)
    {
      *(v14 - 6) = v15;
      operator delete(v15);
    }
    uint64_t v16 = (void *)*(v14 - 10);
    if (v16)
    {
      a1[i - 9] = v16;
      operator delete(v16);
    }
    uint64_t v17 = (void *)*(v11 - 13);
    if (v17)
    {
      a1[i - 12] = v17;
      operator delete(v17);
    }
  }
  uint64_t v18 = 192;
  do
  {
    int v19 = (void *)a1[v18 + 185];
    if (v19)
    {
      a1[v18 + 186] = v19;
      operator delete(v19);
    }
    v18 -= 3;
  }
  while (v18 * 8);
  uint64_t v20 = (void *)a1[184];
  if (v20)
  {
    a1[185] = v20;
    operator delete(v20);
  }
  int v21 = (void *)a1[181];
  if (v21)
  {
    a1[182] = v21;
    operator delete(v21);
  }
  uint64_t v22 = (void *)a1[178];
  if (v22)
  {
    a1[179] = v22;
    operator delete(v22);
  }
  uint64_t v23 = (void *)a1[175];
  if (v23)
  {
    a1[176] = v23;
    operator delete(v23);
  }
  uint64_t v24 = (void *)a1[172];
  if (v24)
  {
    a1[173] = v24;
    operator delete(v24);
  }
  int v25 = (void *)a1[169];
  if (v25)
  {
    a1[170] = v25;
    operator delete(v25);
  }
  int v26 = (void *)a1[166];
  if (v26)
  {
    a1[167] = v26;
    operator delete(v26);
  }
  unsigned int v27 = (void *)a1[163];
  if (v27)
  {
    a1[164] = v27;
    operator delete(v27);
  }
  int v28 = (void *)a1[160];
  if (v28)
  {
    a1[161] = v28;
    operator delete(v28);
  }
  uint64_t v29 = (void *)a1[157];
  if (v29)
  {
    a1[158] = v29;
    operator delete(v29);
  }
  BOOL v30 = (void *)a1[154];
  if (v30)
  {
    a1[155] = v30;
    operator delete(v30);
  }
  BOOL v31 = (void *)a1[151];
  if (v31)
  {
    a1[152] = v31;
    operator delete(v31);
  }
  uint64_t v32 = (void *)a1[148];
  if (v32)
  {
    a1[149] = v32;
    operator delete(v32);
  }
  char v33 = (void *)a1[145];
  if (v33)
  {
    a1[146] = v33;
    operator delete(v33);
  }
  return a1;
}

uint64_t sub_24FF6A9A8(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 48);
  if (v2)
  {
    *(void *)(a1 + 56) = v2;
    operator delete(v2);
  }
  uint64_t v3 = *(void **)(a1 + 24);
  if (v3)
  {
    *(void *)(a1 + 32) = v3;
    operator delete(v3);
  }
  uint64_t v4 = *(void **)a1;
  if (*(void *)a1)
  {
    *(void *)(a1 + 8) = v4;
    operator delete(v4);
  }
  return a1;
}

uint64_t sub_24FF6A9FC(int32x2_t *a1, uint64_t a2, int *a3, unint64_t a4, _DWORD *a5, unint64_t a6, _DWORD *a7, uint64_t a8, int *a9, unint64_t *a10, uint64_t *a11)
{
  uint64_t v18 = a9;
  uint64_t v19 = 4 * a4;
  if (!*(unsigned char *)(a8 + 16)) {
    uint64_t v19 = 0;
  }
  unint64_t v20 = 12 * a2 + 4 * a4 + 4 * a6 + v19 + 1024;
  uint64_t v21 = *a10;
  unint64_t v22 = a10[1] - *a10;
  if (v20 <= v22)
  {
    if (v20 < v22) {
      a10[1] = v21 + v20;
    }
  }
  else
  {
    uint64_t v24 = a8;
    sub_24FF69DDC(a10, v20 - v22);
    uint64_t v18 = a9;
    a8 = v24;
    uint64_t v21 = *a10;
  }
  *a11 = 0;
  return sub_24FF6AB1C(v18, a1, a2, a3, a4, a5, a6, a7, v21, v20, a11, 0, 0, 0, a8);
}

void sub_24FF6AAF4(unint64_t *a1, unint64_t a2)
{
  unint64_t v2 = a1[1] - *a1;
  BOOL v3 = a2 >= v2;
  size_t v4 = a2 - v2;
  if (v4 != 0 && v3)
  {
    sub_24FF69DDC(a1, v4);
  }
  else if (!v3)
  {
    a1[1] = *a1 + a2;
  }
}

uint64_t sub_24FF6AB1C(int *a1, int32x2_t *a2, uint64_t a3, int *a4, unint64_t a5, _DWORD *a6, unint64_t a7, _DWORD *a8, uint64_t a9, uint64_t a10, uint64_t *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  uint64_t v412 = *MEMORY[0x263EF8340];
  sub_24FF55EB4((uint64_t)v394);
  if (!a2)
  {
    uint64_t v23 = v395;
    uint64_t v24 = "[Error] coordinates == nullptr";
    uint64_t v25 = 30;
    goto LABEL_18;
  }
  if (!a3)
  {
    uint64_t v23 = v395;
    uint64_t v24 = "[Error] mesh has 0 vertices ";
    uint64_t v25 = 28;
    goto LABEL_18;
  }
  if (!a5)
  {
    uint64_t v23 = v395;
    uint64_t v24 = "[Error] mesh has 0 faces ";
    uint64_t v25 = 25;
    goto LABEL_18;
  }
  if (!a6)
  {
    uint64_t v23 = v395;
    uint64_t v24 = "[Error] faceVertexCounts == nullptr";
LABEL_17:
    uint64_t v25 = 35;
    goto LABEL_18;
  }
  if (!a7)
  {
    uint64_t v23 = v395;
    uint64_t v24 = "[Error] mesh has 0 indices ";
    uint64_t v25 = 27;
    goto LABEL_18;
  }
  if (!a4 && 3 * a5 != a7)
  {
    uint64_t v23 = v395;
    uint64_t v24 = "[Error] triangular mesh has invalid indexCount ";
    uint64_t v25 = 47;
LABEL_18:
    uint64_t v27 = (uint64_t)sub_24FF562D8(v23, (uint64_t)v24, v25);
LABEL_19:
    int v28 = (void *)v27;
    uint64_t v29 = 5;
LABEL_20:
    std::ios_base::getloc((const std::ios_base *)((char *)v28 + *(void *)(*v28 - 24)));
    BOOL v30 = std::locale::use_facet(&__b, MEMORY[0x263F8C108]);
    ((void (*)(const std::locale::facet *, uint64_t))v30->__vftable[2].~facet_0)(v30, 10);
    std::locale::~locale(&__b);
    std::ostream::put();
    std::ostream::flush();
    goto LABEL_21;
  }
  int v26 = *(unsigned __int8 *)(a15 + 16);
  if (!a8 && *(unsigned char *)(a15 + 16))
  {
    uint64_t v23 = v395;
    uint64_t v24 = "[Error] faceGroupIndices == nullptr";
    goto LABEL_17;
  }
  if (!a9)
  {
    uint64_t v23 = v395;
    uint64_t v24 = "[Error] outputBuffer == nullptr";
    uint64_t v25 = 31;
    goto LABEL_18;
  }
  if ((unint64_t)a10 <= 0x20)
  {
    sub_24FF562D8(v395, (uint64_t)"[Error] output buffer size is ", 30);
    char v33 = (void *)std::ostream::operator<<();
    int v34 = sub_24FF562D8(v33, (uint64_t)" bytes", 6);
    sub_24FF562D8(v34, (uint64_t)"It should at least ", 19);
    int v35 = (void *)std::ostream::operator<<();
    int v28 = sub_24FF562D8(v35, (uint64_t)" bytes ", 7);
    uint64_t v29 = 1;
    goto LABEL_20;
  }
  unsigned int v36 = *(_DWORD *)(a15 + 4);
  if (v36 >= 0x1C)
  {
    uint64_t v23 = v395;
    uint64_t v24 = "[Error] bit depth should be between 0 and 28";
    uint64_t v25 = 44;
    goto LABEL_18;
  }
  unsigned int v37 = *(_DWORD *)(a15 + 12);
  if (v37 >= 3)
  {
    sub_24FF562D8(v395, (uint64_t)"[Error] geometry precition mode ", 32);
    uint64_t v51 = (void *)std::ostream::operator<<();
    uint64_t v52 = sub_24FF562D8(v51, (uint64_t)" not supported. Only the following modes are supported : ", 57);
    sub_24FF562D8(v52, (uint64_t)"(", 1);
    uint64_t v53 = (void *)std::ostream::operator<<();
    int v54 = sub_24FF562D8(v53, (uint64_t)") ", 2);
    int v55 = sub_24FF562D8(v54, (uint64_t)" DELTA,", 7);
    sub_24FF562D8(v55, (uint64_t)"(", 1);
    uint64_t v56 = (void *)std::ostream::operator<<();
    int v57 = sub_24FF562D8(v56, (uint64_t)") ", 2);
    int v58 = sub_24FF562D8(v57, (uint64_t)" PARALLELOGRAM, and", 19);
    sub_24FF562D8(v58, (uint64_t)"(", 1);
    uint64_t v59 = (void *)std::ostream::operator<<();
    uint64_t v23 = sub_24FF562D8(v59, (uint64_t)") ", 2);
    uint64_t v24 = " ADAPTIVE_PARALLELOGRAM.";
    uint64_t v25 = 24;
    goto LABEL_18;
  }
  unsigned int v38 = *(unsigned __int8 *)(a15 + 8);
  if (v38 > 4 || ((1 << v38) & 0x15) == 0)
  {
    sub_24FF562D8(v395, (uint64_t)"[Error] geometry binarization mode ", 35);
    uint64_t v76 = (void *)std::ostream::operator<<();
    int32x2_t v77 = sub_24FF562D8(v76, (uint64_t)" not supported. Only the following modes are supported : ", 57);
    sub_24FF562D8(v77, (uint64_t)"(", 1);
    uint64_t v78 = (void *)std::ostream::operator<<();
    int v79 = sub_24FF562D8(v78, (uint64_t)") ", 2);
    int v80 = sub_24FF562D8(v79, (uint64_t)" AC,", 4);
    sub_24FF562D8(v80, (uint64_t)"(", 1);
    int v81 = (void *)std::ostream::operator<<();
    int v82 = sub_24FF562D8(v81, (uint64_t)") ", 2);
    int v83 = sub_24FF562D8(v82, (uint64_t)" EGK, and", 9);
    sub_24FF562D8(v83, (uint64_t)"(", 1);
    unint64_t v84 = (void *)std::ostream::operator<<();
    uint64_t v23 = sub_24FF562D8(v84, (uint64_t)") ", 2);
    uint64_t v24 = " AC2.";
    uint64_t v25 = 5;
    goto LABEL_18;
  }
  v382 = a8;
  if (a4)
  {
    uint64_t v39 = 0;
    uint64_t v40 = 0;
    int v41 = 0;
    int v42 = 0x10000;
    do
    {
      uint64_t v43 = a4[v39];
      if ((v43 - 3) >= 0xFFFD)
      {
        sub_24FF562D8(v395, (uint64_t)"[Error] faceVertexCounts[", 25);
        uint32x2_t v85 = (void *)std::ostream::operator<<();
        sub_24FF562D8(v85, (uint64_t)"] == ", 5);
        int v86 = (void *)std::ostream::operator<<();
        sub_24FF562D8(v86, (uint64_t)" is not the range 3 to ", 23);
        goto LABEL_377;
      }
      if ((int)v43 < v42) {
        int v42 = a4[v39];
      }
      if (v41 <= (int)v43) {
        int v41 = a4[v39];
      }
      v40 += v43;
      ++v39;
    }
    while (a5 != v39);
    if (v41 == 4 && v42 == 3) {
      int v45 = 2;
    }
    else {
      int v45 = 3;
    }
    if (v42 == 4 && v41 == 4) {
      int v47 = 1;
    }
    else {
      int v47 = v45;
    }
    if (v42 == 3 && v41 == 3) {
      int v49 = 0;
    }
    else {
      int v49 = v47;
    }
    if (v40 != a7)
    {
      sub_24FF562D8(v395, (uint64_t)"[Error] indexCount == ", 22);
      unint64_t v50 = (void *)std::ostream::operator<<();
      sub_24FF562D8(v50, (uint64_t)" is different from expected value of ", 37);
      uint64_t v23 = (void *)std::ostream::operator<<();
      uint64_t v24 = " computed based on faceVertexCounts";
      goto LABEL_17;
    }
  }
  else
  {
    int v49 = 0;
  }
  uint64_t v60 = 0;
  if (a7 <= 1) {
    uint64_t v61 = 1;
  }
  else {
    uint64_t v61 = a7;
  }
  do
  {
    int v62 = a6[v60];
    if (v62 < 0 || v62 >= (int)a3)
    {
      sub_24FF562D8(v395, (uint64_t)"[Error] indices[", 16);
      int v87 = (void *)std::ostream::operator<<();
      sub_24FF562D8(v87, (uint64_t)"] == ", 5);
      int v88 = (void *)std::ostream::operator<<();
      sub_24FF562D8(v88, (uint64_t)" is not the range 0 to ", 23);
      goto LABEL_377;
    }
    ++v60;
  }
  while (v61 != v60);
  int32x2_t v398 = *a2;
  int v63 = a2[1].i32[0];
  int32x2_t v400 = v398;
  int v399 = v63;
  int v401 = v63;
  if ((int)a3 >= 2)
  {
    int32x2_t v64 = v398;
    int32x2_t v65 = v400;
    int v66 = v399;
    int v67 = v401;
    uint64_t v68 = a3 - 1;
    char v69 = (int *)&a2[2] + 1;
    do
    {
      int32x2_t v70 = *(int32x2_t *)(v69 - 2);
      int32x2_t v64 = vmin_s32(v70, v64);
      int32x2_t v65 = vmax_s32(v65, v70);
      int v72 = *v69;
      v69 += 3;
      int v71 = v72;
      if (v72 < v66) {
        int v66 = v71;
      }
      if (v67 <= v71) {
        int v67 = v71;
      }
      --v68;
    }
    while (v68);
    int32x2_t v398 = v64;
    int32x2_t v400 = v65;
    int v399 = v66;
    int v401 = v67;
  }
  if (v36)
  {
    uint64_t v73 = 0;
    while (1)
    {
      int v74 = (_DWORD *)&v398 + v73;
      int v75 = v74[3];
      if ((*v74 & 0x80000000) != 0 || v75 >= 1 << v36) {
        break;
      }
      *((_DWORD *)&v402 + v73++) = v75 - *v74;
      if (v73 == 3) {
        goto LABEL_89;
      }
    }
    sub_24FF562D8(v395, (uint64_t)"[Error] boundingBox[", 20);
    uint64_t v97 = (void *)std::ostream::operator<<();
    sub_24FF562D8(v97, (uint64_t)"] == [", 6);
    int v98 = (void *)std::ostream::operator<<();
    sub_24FF562D8(v98, (uint64_t)", ", 2);
    int v99 = (void *)std::ostream::operator<<();
    sub_24FF562D8(v99, (uint64_t)"] is not in the range 0 to ", 27);
    goto LABEL_377;
  }
  for (uint64_t i = 0; i != 3; ++i)
  {
    uint64_t v90 = v400.i32[i] - (uint64_t)v398.i32[i];
    if (v90 > 0xFFFFFFF)
    {
      sub_24FF562D8(v395, (uint64_t)"[Error] boundingBox.max[", 24);
      int v100 = (void *)std::ostream::operator<<();
      int v101 = sub_24FF562D8(v100, (uint64_t)"] - ", 4);
      sub_24FF562D8(v101, (uint64_t)"boundingBox.min[", 16);
      int v102 = (void *)std::ostream::operator<<();
      sub_24FF562D8(v102, (uint64_t)"] == ", 5);
      int v103 = (void *)std::ostream::operator<<();
      sub_24FF562D8(v103, (uint64_t)" is larger than ", 16);
      goto LABEL_377;
    }
    *((_DWORD *)&v402 + i) = v90;
  }
LABEL_89:
  int v91 = (unsigned char *)a15;
  if (v382 && v26)
  {
    uint64_t v92 = 0;
    if (a5 <= 1) {
      uint64_t v93 = 1;
    }
    else {
      uint64_t v93 = a5;
    }
    while (1)
    {
      int v94 = v382[v92];
      if (v94 < 0) {
        int v94 = -v94;
      }
      if (v94 >> 28) {
        break;
      }
      if (v93 == ++v92) {
        goto LABEL_98;
      }
    }
    sub_24FF562D8(v395, (uint64_t)"[Error] abs(faceGroupIndices[", 29);
    v297 = (void *)std::ostream::operator<<();
    sub_24FF562D8(v297, (uint64_t)"]) == ", 6);
    v298 = (void *)std::ostream::operator<<();
    sub_24FF562D8(v298, (uint64_t)" is not in the range 0 to ", 26);
LABEL_377:
    uint64_t v27 = std::ostream::operator<<();
    goto LABEL_19;
  }
LABEL_98:
  int v95 = *(unsigned __int8 *)(a15 + 21);
  if (a10 >= 4)
  {
    char v104 = *(unsigned char *)(a15 + 17);
    char v105 = *(unsigned char *)(a15 + 18);
    char v106 = *(unsigned char *)(a15 + 19);
    char v107 = *(unsigned char *)(a15 + 20);
    *(_DWORD *)a9 = -90009999;
    *(unsigned char *)(a9 + 8) = 0;
    *(unsigned char *)(a9 + 9) = 8;
    if (((a10 - 8) & 0xFFFFFFFFFFFFFFFELL) == 2) {
      goto LABEL_108;
    }
    *(_WORD *)(a9 + 10) = 0;
    *(_DWORD *)(a9 + 16) = a3;
    if (((a10 - 16) & 0xFFFFFFFFFFFFFFFCLL) == 4) {
      goto LABEL_108;
    }
    *(_DWORD *)(a9 + 20) = a5;
    *(unsigned char *)(a9 + 24) = v38;
    *(unsigned char *)(a9 + 25) = v37;
    *(unsigned char *)(a9 + 26) = ((_BYTE)v49 << 6) | (2 * v104) | (4 * v105) | (8 * v106) | (16 * v107) | (32 * v95) | v26;
    *(unsigned char *)(a9 + 27) = v36;
    if ((a10 & 0xFFFFFFFFFFFFFFFCLL) == 0x1C
      || (*(_DWORD *)(a9 + 28) = a7, (unint64_t)a10 < 0x24)
      || (*(_DWORD *)(a9 + 32) = v398.i32[0], (a10 & 0xFFFFFFFFFFFFFFFCLL) == 0x24)
      || (*(_DWORD *)(a9 + 36) = v398.i32[1], (a10 & 0xFFFFFFFFFFFFFFFCLL) == 0x28))
    {
LABEL_108:
      uint64_t v96 = 0;
      v384 = 0;
    }
    else
    {
      uint64_t v96 = a10 - 44;
      v384 = (unsigned int *)(a9 + 44);
      *(_DWORD *)(a9 + 40) = v399;
    }
    int v91 = (unsigned char *)a15;
    int v95 = *(unsigned __int8 *)(a15 + 21);
  }
  else
  {
    uint64_t v96 = 0;
    v384 = 0;
  }
  if (v95)
  {
    unint64_t v108 = 0;
    do
    {
      unsigned int v109 = *((_DWORD *)&v402 + v108);
      unsigned int v110 = 32 - __clz(v109);
      if (v109) {
        unsigned int v111 = v110;
      }
      else {
        unsigned int v111 = 0;
      }
      *((_DWORD *)&v402 + v108) = v111;
      BOOL v322 = v96-- < 1;
      if (v322)
      {
        uint64_t v96 = 0;
        v384 = 0;
        int v112 = 1;
      }
      else
      {
        *(unsigned char *)v384 = v111;
        v384 = (unsigned int *)((char *)v384 + 1);
        int v112 = v91[21];
      }
      if (v108 > 1) {
        break;
      }
      ++v108;
    }
    while (v112);
  }
  uint64_t v378 = v96;
  *a1 = a3;
  a1[1] = a5;
  a1[2] = a7;
  *(void *)(a1 + 3) = v402;
  a1[5] = v403;
  *((int32x2_t *)a1 + 3) = v398;
  a1[8] = v399;
  a1[9] = v49;
  v381 = (uint64_t *)(a1 + 16);
  sub_24FF5F2F4((uint64_t)(a1 + 16), 0);
  LODWORD(__b.__locale_) = -1;
  sub_24FF62F6C((uint64_t)(a1 + 16), (int)a3, &__b);
  v377 = (int **)(a1 + 10);
  sub_24FF5F2F4((uint64_t)(a1 + 10), 0);
  LODWORD(__b.__locale_) = -1;
  sub_24FF62F6C((uint64_t)(a1 + 10), (int)a5, &__b);
  v379 = (int **)(a1 + 28);
  sub_24FF5F2F4((uint64_t)(a1 + 28), (int)a5);
  sub_24FF5F2F4((uint64_t)(a1 + 22), (int)a3);
  sub_24FF5F2F4((uint64_t)(a1 + 64), (int)a5);
  sub_24FF68D38((uint64_t *)a1 + 17, 0);
  LODWORD(v408[0]) = -1;
  __b.__locale_ = (std::locale::__imp *)-1;
  sub_24FF68D74((uint64_t *)a1 + 17, (int)a3, &__b);
  sub_24FF68D38((uint64_t *)a1 + 20, 0);
  LODWORD(v408[0]) = -1;
  __b.__locale_ = (std::locale::__imp *)-1;
  sub_24FF68D74((uint64_t *)a1 + 20, (int)a3, &__b);
  sub_24FF68D38((uint64_t *)a1 + 23, (int)a3);
  uint64_t v113 = 0;
  uint64_t v114 = a3;
  do
  {
    int v115 = a2[1].i32[v113] - a1[8];
    uint64_t v116 = (int32x2_t *)(*((void *)a1 + 23) + v113 * 4);
    *uint64_t v116 = vsub_s32(*(int32x2_t *)((char *)a2 + v113 * 4), *(int32x2_t *)(a1 + 6));
    v116[1].i32[0] = v115;
    v113 += 3;
    --v114;
  }
  while (v114);
  uint64_t v117 = (a5 + 1);
  sub_24FF5F2F4((uint64_t)(a1 + 58), (int)v117);
  int v118 = (_DWORD *)*((void *)a1 + 29);
  *int v118 = 0;
  if (a4)
  {
    if ((int)a5 >= 1)
    {
      int v119 = 0;
      uint64_t v120 = a5;
      int v121 = v118 + 1;
      do
      {
        int v122 = *a4++;
        v119 += v122;
        *v121++ = v119;
        --v120;
      }
      while (v120);
    }
  }
  else if ((int)a5 >= 1)
  {
    uint64_t v123 = v117 - 1;
    uint64_t v124 = v118 + 1;
    int v125 = 3;
    do
    {
      *v124++ = v125;
      v125 += 3;
      --v123;
    }
    while (v123);
  }
  sub_24FF5F2F4((uint64_t)(a1 + 52), (int)a7);
  if (a7) {
    memmove(*((void **)a1 + 26), a6, 4 * (int)a7);
  }
  unint64_t v126 = *a1;
  if (v91[18] && v91[17]
    || (sub_24FF5F2F4((uint64_t)(a1 + 126), 0),
        LODWORD(__b.__locale_) = 0,
        sub_24FF62F6C((uint64_t)(a1 + 126), v126, &__b),
        v91[17]))
  {
    sub_24FF69210((uint64_t)(a1 + 138), v126);
    sub_24FF6924C((uint64_t)(a1 + 144), 64);
  }
  v386 = a1 + 132;
  sub_24FF692E4((uint64_t)(a1 + 132), v126);
  uint64_t v127 = (unsigned char *)*((void *)a1 + 66);
  int v128 = (unsigned char *)*((void *)a1 + 67);
  if (v127 != v128) {
    memset(v127, 255, (v128 - v127) & 0xFFFFFFFFFFFFFFF0);
  }
  *((void *)a1 + 35) = 0;
  sub_24FF69314((void **)a1 + 45, 0x100uLL);
  int v129 = (char *)*((void *)a1 + 60);
  if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a1 + 62) - (void)v129) >> 2) <= 0x3F)
  {
    int v130 = (char *)*((void *)a1 + 61);
    int v131 = (char *)operator new(0x300uLL);
    uint64_t v132 = &v131[12 * ((v130 - v129) / 12)];
    int v133 = v132;
    if (v130 != v129)
    {
      int v133 = &v131[12 * ((v130 - v129) / 12)];
      do
      {
        uint64_t v134 = *(void *)(v130 - 12);
        v130 -= 12;
        int v135 = *((_DWORD *)v130 + 2);
        *(void *)(v133 - 12) = v134;
        v133 -= 12;
        *((_DWORD *)v133 + 2) = v135;
      }
      while (v130 != v129);
    }
    *((void *)a1 + 60) = v133;
    *((void *)a1 + 61) = v132;
    *((void *)a1 + 62) = v131 + 768;
    if (v129) {
      operator delete(v129);
    }
  }
  sub_24FF69314((void **)a1 + 57, 0x40uLL);
  sub_24FF69314((void **)a1 + 54, 0x40uLL);
  sub_24FF69314((void **)a1 + 48, 0x20uLL);
  sub_24FF693BC((unint64_t *)a1 + 51, 0x20uLL);
  memset_pattern16(a1 + 594, &unk_24FF7D710, 0xAuLL);
  v389 = (_WORD *)a1 + 1193;
  *((_WORD *)a1 + 1193) = 0x8000;
  for (uint64_t j = 2388; j != 2484; j += 6)
    memset_pattern16((char *)a1 + j, &unk_24FF7D710, 6uLL);
  *((_WORD *)a1 + 1242) = 0x8000;
  memset_pattern16((char *)a1 + 2486, &unk_24FF7D710, 6uLL);
  *((_WORD *)a1 + 1246) = 0x8000;
  for (uint64_t k = 2494; k != 2574; k += 16)
    memset_pattern16((char *)a1 + k, &unk_24FF7D710, 0x10uLL);
  memset_pattern16((char *)a1 + 2578, &unk_24FF7D710, 0x20uLL);
  memset_pattern16(a1 + 654, &unk_24FF7D710, 0x80uLL);
  *((_WORD *)a1 + 1307) = 0x8000;
  *(int *)((char *)a1 + 2574) = -2147450880;
  *(int *)((char *)a1 + 2610) = -2147450880;
  memset_pattern16(a1 + 688, &unk_24FF7D710, 6uLL);
  for (uint64_t m = 690; m != 750; m += 30)
    sub_24FF60D8C((uint64_t)&a1[m], 3);
  sub_24FF65088((uint64_t)(a1 + 72), *a1);
  int v139 = (int *)*((void *)a1 + 26);
  int v140 = (int *)*((void *)a1 + 27);
  if (v139 != v140)
  {
    uint64_t v141 = *((void *)a1 + 36);
    do
    {
      uint64_t v142 = *v139++;
      ++*(_DWORD *)(v141 + 4 * v142 + 4);
    }
    while (v139 != v140);
  }
  sub_24FF650F8((int **)a1 + 36);
  uint64_t v143 = a1[1];
  int v144 = a1 + 16;
  if ((int)v143 >= 1)
  {
    uint64_t v145 = 0;
    uint64_t v146 = *((void *)a1 + 42);
    uint64_t v147 = *((void *)a1 + 29);
    uint64_t v148 = *((void *)a1 + 26);
    do
    {
      uint64_t v149 = *(int *)(v147 + 4 * v145);
      uint64_t v150 = v145 + 1;
      uint64_t v151 = *(int *)(v147 + 4 * (v145 + 1));
      if ((int)v149 < (int)v151)
      {
        uint64_t v152 = *((void *)a1 + 36);
        uint64_t v153 = *((void *)a1 + 39);
        do
        {
          uint64_t v154 = *(int *)(v148 + 4 * v149);
          uint64_t v155 = *(int *)(v152 + 4 * v154);
          uint64_t v156 = *(int *)(v153 + 4 * v154);
          uint64_t v157 = v156 + v155;
          if ((int)v156 <= 0)
          {
LABEL_161:
            *(_DWORD *)(v153 + 4 * v154) = v156 + 1;
            *(_DWORD *)(v146 + 4 * v157) = v145;
          }
          else
          {
            uint64_t v157 = (int)v157;
            while (v145 != *(_DWORD *)(v146 + 4 * v155))
            {
              if (++v155 >= (int)v157) {
                goto LABEL_161;
              }
            }
          }
          ++v149;
        }
        while (v149 != v151);
      }
      ++v145;
    }
    while (v150 != v143);
  }
  v376 = a1 + 58;
  unint64_t v158 = (unsigned int *)(a1 + 890);
  a1[891] = (v378 - 4) & ~((v378 - 4) >> 63);
  *((void *)a1 + 446) = v384 + 1;
  sub_24FF5D92C((uint64_t)(a1 + 890));
  uint64_t v159 = *a1;
  v391 = (unsigned int *)(a1 + 890);
  uint64_t v380 = v159;
  if (v91[17])
  {
    if ((int)v159 >= 1)
    {
      uint64_t v160 = 0;
      int v161 = -1;
      while (1)
      {
        uint64_t v383 = v160;
        if (*(_DWORD *)(*v144 + 4 * v160) == -1) {
          break;
        }
LABEL_168:
        uint64_t v160 = v383 + 1;
        int v144 = a1 + 16;
        if (v383 + 1 == v380) {
          goto LABEL_351;
        }
      }
      *(_DWORD *)(*v144 + 4 * v160) = a1[70];
      uint64_t v162 = a1[70];
      a1[70] = v162 + 1;
      *(_DWORD *)(*((void *)a1 + 11) + 4 * v162) = v160;
      if (*(unsigned char *)(a15 + 21)) {
        int v163 = -1;
      }
      else {
        int v163 = v161;
      }
      uint64_t v164 = 3 * v160;
      *(_DWORD *)(*((void *)a1 + 17) + 12 * v160) = v163;
      sub_24FF73540((uint64_t)a1, v160, a15);
      sub_24FF63854(a1 + 144, (int *)(*((void *)a1 + 69) + 4 * v164));
      do
      {
LABEL_174:
        if (!a1[144]) {
          goto LABEL_168;
        }
        int v165 = a1[145];
        if (v165 < 0) {
          uint64_t v166 = 0;
        }
        else {
          uint64_t v166 = sub_24FF6A5E0(a1 + 144, v165);
        }
        int v161 = -1431655765 * ((v166 - *((void *)a1 + 69)) >> 2);
        sub_24FF72EF0((uint64_t)a1, v161);
        uint64_t v167 = (*((void *)a1 + 58) - *((void *)a1 + 57)) >> 2;
        int v168 = *(_DWORD *)(*((void *)a1 + 66) + 16 * v161);
        int v169 = *(_DWORD *)(*((void *)a1 + 66) + 16 * v161 + 4);
        BOOL v170 = v168 != -1;
        BOOL v171 = v169 == v168 && v168 != -1;
        int v388 = v167 - 1;
        unsigned int v172 = (v170 | (2 * (v169 != -1))) + v171;
        sub_24FF6DACC((uint64_t)v158, (int)v167 > 1, (_WORD *)a1 + v172 + 1188);
      }
      while ((int)v167 < 2);
      int v173 = 0;
      uint64_t v174 = v161;
      int v387 = v161;
      while (1)
      {
        LODWORD(__b.__locale_) = 0;
        v175 = a1 + 46;
        int v176 = sub_24FF7409C((uint64_t)a1, v161, v173, v172, (int *)&__b, a15);
        sub_24FF74AEC((uint64_t)a1, (int)__b.__locale_, v176, a15);
        uint64_t v177 = v176;
        int v392 = v176;
        if (v176 > 1) {
          break;
        }
LABEL_320:
        if (v392 >= 1)
        {
          uint64_t v259 = 0;
          do
          {
            v260 = (int *)(*((void *)a1 + 69) + 12 * *(int *)(*((void *)a1 + 48) + 4 * v259));
            if (*(unsigned char *)(*((void *)a1 + 51) + v259)) {
              sub_24FF63854(a1 + 144, v260);
            }
            else {
              sub_24FF639AC(a1 + 144, v260);
            }
            ++v259;
          }
          while (v177 != v259);
        }
        int v261 = *(_DWORD *)(*v386 + 16 * v174);
        int v262 = *(_DWORD *)(*v386 + 16 * v174 + 4);
        BOOL v263 = v262 != -1;
        BOOL v264 = v261 != -1;
        BOOL v265 = v262 == v261 && v261 != -1;
        ++v173;
        unint64_t v158 = (unsigned int *)(a1 + 890);
        sub_24FF6DACC((uint64_t)v391, v173 < v388, v389);
        unsigned int v172 = (v264 | (2 * v263)) + v265;
        int v161 = v387;
        if (v173 == v388) {
          goto LABEL_174;
        }
      }
      int v178 = *(unsigned __int8 *)(a15 + 19);
      uint64_t v179 = v176 - 1;
      v180 = (int *)(*((void *)a1 + 48) + 4);
      while (1)
      {
        int v182 = *(v180 - 1);
        int v181 = *v180;
        if (v178) {
          break;
        }
        uint64_t v222 = *((void *)a1 + 69);
        *(_DWORD *)(v222 + 12 * v182) += 8;
        v221 = (_DWORD *)(v222 + 12 * v181);
        LODWORD(v222) = 8;
LABEL_319:
        ++v180;
        *v221 += v222;
        if (!--v179) {
          goto LABEL_320;
        }
      }
      uint64_t v183 = (int *)(*v175 + 12 * (int)v174);
      v184 = (int *)(*v175 + 12 * v182);
      uint64_t v185 = (int *)(*v175 + 12 * v181);
      int v187 = *v185;
      int v186 = v185[1];
      int v188 = *v184;
      int v189 = v184[1];
      int v190 = *v185 - *v184;
      int v191 = v186 - v189;
      int v192 = v185[2];
      int v193 = v184[2];
      int v194 = v192 - v193;
      int v195 = *v183;
      int v196 = v183[1];
      int v197 = *v183 - v188;
      int v198 = v196 - v189;
      int v199 = v183[2];
      int v200 = v199 - v193;
      if (v187 - v188 >= 0) {
        unsigned int v201 = v190;
      }
      else {
        unsigned int v201 = -v190;
      }
      if (v191 >= 0) {
        unsigned int v202 = v191;
      }
      else {
        unsigned int v202 = -v191;
      }
      if (v194 >= 0) {
        unsigned int v203 = v194;
      }
      else {
        unsigned int v203 = -v194;
      }
      BOOL v206 = v201 < 0x1000 && v202 < 0x1000 && v203 < 0x1000;
      if (v197 >= 0) {
        unsigned int v207 = v197;
      }
      else {
        unsigned int v207 = -v197;
      }
      if (v198 >= 0) {
        unsigned int v208 = v198;
      }
      else {
        unsigned int v208 = -v198;
      }
      if (v200 >= 0) {
        unsigned int v209 = v200;
      }
      else {
        unsigned int v209 = -v200;
      }
      if (v206 && v207 <= 0xFFF && v208 <= 0xFFF && v209 <= 0xFFF)
      {
        int v210 = v197 * v190 + v198 * v191 + v200 * v194;
        if (v210)
        {
          int v211 = v200 * v191 - v198 * v194;
          if (v211 < 0) {
            int v211 = v198 * v194 - v200 * v191;
          }
          int v212 = v197 * v194 - v200 * v190;
          if (v212 < 0) {
            int v212 = -v212;
          }
          int v213 = v198 * v190 - v197 * v191;
          if (v213 < 0) {
            int v213 = -v213;
          }
          int v214 = v211 + v212;
          if (v212 < v213)
          {
            int v215 = v213;
          }
          else
          {
            int v214 = v211 + v213;
            int v215 = v212;
          }
          BOOL v216 = v211 >= v212 && v211 >= v213;
          if (v216) {
            unsigned int v217 = v212 + v213;
          }
          else {
            unsigned int v217 = v214;
          }
          if (v216) {
            int v218 = v211;
          }
          else {
            int v218 = v215;
          }
          unsigned int v219 = v218 + (v217 >> 2);
          if (v210 < 0) {
            LODWORD(v220) = -16 * v210 / (int)(v219 - v210) + 16;
          }
          else {
            LODWORD(v220) = (int)(16 * v219) / (int)(v219 + v210);
          }
          goto LABEL_264;
        }
      }
      else
      {
        uint64_t v223 = v198 * (uint64_t)v191 + v197 * (uint64_t)v190 + v200 * (uint64_t)v194;
        if (v223)
        {
          uint64_t v224 = v200 * (uint64_t)v191 - v198 * (uint64_t)v194;
          if (v224 < 0) {
            uint64_t v224 = v198 * (uint64_t)v194 - v200 * (uint64_t)v191;
          }
          uint64_t v225 = v197 * (uint64_t)v194 - v200 * (uint64_t)v190;
          if (v225 < 0) {
            uint64_t v225 = -v225;
          }
          uint64_t v226 = v198 * (uint64_t)v190 - v197 * (uint64_t)v191;
          if (v226 < 0) {
            uint64_t v226 = -v226;
          }
          uint64_t v227 = v224 + v225;
          if (v225 < (unint64_t)v226)
          {
            uint64_t v228 = v226;
          }
          else
          {
            uint64_t v227 = v224 + v226;
            uint64_t v228 = v225;
          }
          BOOL v229 = v224 >= (unint64_t)v225 && v224 >= (unint64_t)v226;
          if (v229) {
            unint64_t v230 = v225 + v226;
          }
          else {
            unint64_t v230 = v227;
          }
          if (v229) {
            uint64_t v231 = v224;
          }
          else {
            uint64_t v231 = v228;
          }
          uint64_t v220 = v231 + (v230 >> 2);
          if (v223 < 0) {
            LODWORD(v220) = -16 * v223 / (v220 - v223) + 16;
          }
          else {
            uint64_t v220 = 16 * v220 / (v220 + v223);
          }
          v175 = a1 + 46;
LABEL_264:
          int v232 = v195 - v187;
          int v233 = v196 - v186;
          uint64_t v234 = *((void *)a1 + 69);
          *(_DWORD *)(v234 + 12 * v182) += v220;
          int v235 = v199 - v192;
          int v236 = -v190;
          int v237 = -v191;
          int v238 = -v194;
          if (v232 >= 0) {
            unsigned int v239 = v232;
          }
          else {
            unsigned int v239 = -v232;
          }
          BOOL v240 = v239 < 0x1000 && v206;
          if (v233 >= 0) {
            unsigned int v241 = v233;
          }
          else {
            unsigned int v241 = -v233;
          }
          if (v235 >= 0) {
            unsigned int v242 = v235;
          }
          else {
            unsigned int v242 = -v235;
          }
          if (v240 && v241 <= 0xFFF && v242 <= 0xFFF)
          {
            int v243 = v232 * v236 + v233 * v237 + v235 * v238;
            if (v243)
            {
              int v244 = v233 * v194 + v235 * v237;
              if (v244 < 0) {
                int v244 = -v244;
              }
              int v245 = v232 * v238 + v235 * v190;
              if (v245 < 0) {
                int v245 = -v245;
              }
              int v246 = v232 * v191 + v233 * v236;
              if (v246 < 0) {
                int v246 = -v246;
              }
              if (v244 < v245 || v244 < v246)
              {
                unsigned int v247 = v244 + v245;
                int v257 = v244 + v246;
                if (v245 < v246)
                {
                  int v244 = v246;
                }
                else
                {
                  unsigned int v247 = v257;
                  int v244 = v245;
                }
              }
              else
              {
                unsigned int v247 = v245 + v246;
              }
              int v258 = v244 + (v247 >> 2);
              if (v243 < 0) {
                LODWORD(v222) = -16 * v243 / (v258 - v243) + 16;
              }
              else {
                LODWORD(v222) = 16 * v258 / (v258 + v243);
              }
              goto LABEL_318;
            }
          }
          else
          {
            uint64_t v222 = v233 * (uint64_t)v237 + v232 * (uint64_t)v236 + v235 * (uint64_t)v238;
            if (v222)
            {
              uint64_t v248 = v235 * (uint64_t)v237 - v233 * (uint64_t)v238;
              if (v248 < 0) {
                uint64_t v248 = v233 * (uint64_t)v238 - v235 * (uint64_t)v237;
              }
              uint64_t v249 = v232 * (uint64_t)v238 - v235 * (uint64_t)v236;
              if (v249 < 0) {
                uint64_t v249 = -v249;
              }
              uint64_t v250 = v233 * (uint64_t)v236 - v232 * (uint64_t)v237;
              if (v250 < 0) {
                uint64_t v250 = v232 * (uint64_t)v237 - v233 * (uint64_t)v236;
              }
              uint64_t v251 = v248 + v249;
              if (v249 < (unint64_t)v250)
              {
                uint64_t v252 = v250;
              }
              else
              {
                uint64_t v251 = v248 + v250;
                uint64_t v252 = v249;
              }
              BOOL v253 = v248 >= (unint64_t)v249 && v248 >= (unint64_t)v250;
              if (v253) {
                unint64_t v254 = v249 + v250;
              }
              else {
                unint64_t v254 = v251;
              }
              if (v253) {
                uint64_t v255 = v248;
              }
              else {
                uint64_t v255 = v252;
              }
              unint64_t v256 = v255 + (v254 >> 2);
              if (v222 < 0) {
                LODWORD(v222) = -16 * v222 / (uint64_t)(v256 - v222) + 16;
              }
              else {
                uint64_t v222 = (uint64_t)(16 * v256) / (uint64_t)(v256 + v222);
              }
              goto LABEL_318;
            }
          }
          LODWORD(v222) = 16;
LABEL_318:
          v221 = (_DWORD *)(v234 + 12 * v181);
          goto LABEL_319;
        }
      }
      LODWORD(v220) = 16;
      goto LABEL_264;
    }
  }
  else if ((int)v159 >= 1)
  {
    uint64_t v266 = 0;
    LODWORD(v267) = 0;
    int v268 = -1;
    do
    {
      if (*(_DWORD *)(*v144 + 4 * v266) == -1)
      {
        *(_DWORD *)(*v144 + 4 * v266) = a1[70];
        uint64_t v269 = a1[70];
        a1[70] = v269 + 1;
        *(_DWORD *)(*((void *)a1 + 11) + 4 * v269) = v266;
        int v270 = *(unsigned char *)(a15 + 21) ? -1 : v268;
        *(_DWORD *)(*((void *)a1 + 17) + 12 * v266) = v270;
        sub_24FF73540((uint64_t)a1, v266, a15);
        if ((int)v267 < a1[70])
        {
          uint64_t v267 = (int)v267;
          do
          {
            int v268 = *(_DWORD *)(*((void *)a1 + 11) + 4 * v267);
            sub_24FF72EF0((uint64_t)a1, v268);
            uint64_t v271 = (*((void *)a1 + 58) - *((void *)a1 + 57)) >> 2;
            int v272 = *(_DWORD *)(*((void *)a1 + 66) + 16 * v268);
            int v273 = *(_DWORD *)(*((void *)a1 + 66) + 16 * v268 + 4);
            BOOL v274 = v272 != -1;
            BOOL v275 = v273 == v272 && v272 != -1;
            unsigned int v276 = (v274 | (2 * (v273 != -1))) + v275;
            sub_24FF6DACC((uint64_t)v391, (int)v271 > 1, (_WORD *)a1 + v276 + 1188);
            if ((int)v271 >= 2)
            {
              int v277 = 1;
              do
              {
                LODWORD(__b.__locale_) = 0;
                int v278 = sub_24FF7409C((uint64_t)a1, v268, v277 - 1, v276, (int *)&__b, a15);
                sub_24FF74AEC((uint64_t)a1, (int)__b.__locale_, v278, a15);
                int v279 = *(_DWORD *)(*((void *)a1 + 66) + 16 * v268);
                int v280 = *(_DWORD *)(*((void *)a1 + 66) + 16 * v268 + 4);
                BOOL v281 = v279 != -1;
                BOOL v282 = v280 == v279 && v279 != -1;
                unsigned int v276 = (v281 | (2 * (v280 != -1))) + v282;
                sub_24FF6DACC((uint64_t)v391, v277++ < (int)v271 - 1, v389);
              }
              while (v271 != v277);
            }
            ++v267;
          }
          while (v267 < a1[70]);
          uint64_t v159 = v380;
          int v144 = a1 + 16;
          unint64_t v158 = (unsigned int *)(a1 + 890);
        }
      }
      ++v266;
    }
    while (v266 != v159);
  }
LABEL_351:
  unsigned int v283 = sub_24FF72ACC((uint64_t)v158);
  if (v378 >= 4) {
    unsigned int *v384 = v283;
  }
  uint64_t v284 = v283;
  if (v384 != (unsigned int *)-4) {
    uint64_t v284 = (uint64_t)v384 + v283 + 4;
  }
  v393 = (_DWORD *)v284;
  uint64_t v29 = *v158;
  if (v29) {
    goto LABEL_21;
  }
  uint64_t v390 = v378 - 4 - v283;
  if (!*(unsigned char *)(a15 + 16))
  {
LABEL_445:
    uint64_t v29 = 1;
    if (v393 && (v390 & 0x8000000000000000) == 0)
    {
      uint64_t v340 = (a10 & ~(a10 >> 63)) - v390;
      BOOL v341 = a10 - v340 < 0;
      if (a10 - v340 >= 0) {
        uint64_t v342 = (a10 & ~(a10 >> 63)) - v390;
      }
      else {
        uint64_t v342 = 0;
      }
      uint64_t v343 = a9;
      if (v341) {
        uint64_t v343 = 0;
      }
      uint64_t v344 = v342 & ~(v342 >> 63);
      *a11 = v344;
      if (v342 >= 16) {
        *(_DWORD *)(v343 + 12) = v344;
      }
      uint64_t v345 = 8;
      if (v342 > 8) {
        uint64_t v345 = v342;
      }
      uint64_t v346 = v345 - 8;
      if (v345 == 8)
      {
        unsigned int v348 = -1;
      }
      else
      {
        v347 = (unsigned __int8 *)(v343 + 8);
        unsigned int v348 = -1;
        do
        {
          int v349 = *v347++;
          unsigned int v348 = dword_24FF7D068[v349 ^ HIBYTE(v348)] ^ (v348 << 8);
          --v346;
        }
        while (v346);
      }
      if (v342 >= 8) {
        *(_DWORD *)(v343 + 4) = v348;
      }
      if (a12)
      {
        uint64_t v350 = *a1;
        if ((int)v350 >= 1)
        {
          uint64_t v351 = 0;
          uint64_t v352 = 0;
          int32x2_t v353 = *(int32x2_t *)(a1 + 6);
          int v354 = a1[8];
          uint64_t v355 = 12 * v350;
          do
          {
            v356 = (int32x2_t *)(*((void *)a1 + 23) + v352);
            __int32 v357 = v356[1].i32[0] + v354;
            v358 = (int32x2_t *)(a12 + 12 * *(int *)(*v381 + v351));
            int32x2_t *v358 = vadd_s32(*v356, v353);
            v358[1].i32[0] = v357;
            v352 += 12;
            v351 += 4;
          }
          while (v355 != v352);
        }
      }
      if (a13)
      {
        uint64_t v359 = a1[1];
        if ((int)v359 >= 1)
        {
          v360 = *v377;
          v361 = (_DWORD *)(*v376 + 4);
          do
          {
            uint64_t v362 = *v360++;
            *(_DWORD *)(a13 + 4 * v362) = *v361 - *(v361 - 1);
            ++v361;
            --v359;
          }
          while (v359);
        }
      }
      if (a14 && (uint64_t v363 = a1[1], (int)v363 >= 1))
      {
        uint64_t v364 = 0;
        int v365 = 0;
        v366 = *v379;
        uint64_t v367 = *v376;
        do
        {
          v368 = (int *)(v367 + 4 * v366[v364]);
          uint64_t v370 = *v368;
          uint64_t v369 = v368[1];
          if ((int)v370 < (int)v369)
          {
            uint64_t v371 = *v381;
            v372 = (_DWORD *)(a14 + 4 * v365);
            uint64_t v373 = v369 - v370;
            v374 = (int *)(*((void *)a1 + 26) + 4 * v370);
            int v365 = v365 + v369 - v370;
            do
            {
              uint64_t v375 = *v374++;
              *v372++ = *(_DWORD *)(v371 + 4 * v375);
              --v373;
            }
            while (v373);
          }
          uint64_t v29 = 0;
          ++v364;
        }
        while (v364 != v363);
      }
      else
      {
        uint64_t v29 = 0;
      }
    }
    goto LABEL_21;
  }
  uint64_t v285 = a1[1];
  uint64_t v385 = v284 + 4;
  a1[891] = (v390 - 4) & ~((v390 - 4) >> 63);
  *((void *)a1 + 446) = v284 + 4;
  sub_24FF5D92C((uint64_t)v391);
  if (!*(unsigned char *)(a15 + 8))
  {
    LOWORD(v406) = 0x8000;
    __int16 v405 = 0x8000;
    memset_pattern16(&__b, &unk_24FF7D710, 0x80uLL);
    __int16 v404 = 0x8000;
    v299 = v382;
    if ((int)v285 < 1) {
      goto LABEL_390;
    }
    unint64_t v300 = 0;
    int v301 = 0;
    uint64_t v302 = 4 * v285;
    while (1)
    {
      int v303 = v301;
      int v301 = v299[(*v379)[v300 / 4]];
      v304 = &v406;
      unsigned int v305 = v301 - v303;
      if (v301 == v303)
      {
        uint64_t v306 = (uint64_t)(a1 + 890);
        unsigned int v307 = 0;
      }
      else
      {
        sub_24FF6DACC((uint64_t)v391, 1, &v406);
        if ((v305 & 0x80000000) != 0)
        {
          sub_24FF6DACC((uint64_t)v391, 0, &v405);
          unsigned int v305 = -v305;
        }
        else
        {
          sub_24FF6DACC((uint64_t)v391, 1, &v405);
        }
        if (v305 > 0x3F)
        {
          sub_24FF6DACC((uint64_t)v391, 1, &__b);
          sub_24FF6DACC((uint64_t)v391, 1, (_WORD *)&__b.__locale_ + 2);
          sub_24FF6DACC((uint64_t)v391, 1, (_WORD *)v408 + 2);
          sub_24FF6DACC((uint64_t)v391, 1, v409);
          sub_24FF6DACC((uint64_t)v391, 1, v410);
          sub_24FF6DACC((uint64_t)v391, 1, v411);
          sub_24FF7CC68((uint64_t)v391, v305 - 64, 6, &v404);
          goto LABEL_389;
        }
        unsigned int v308 = v305 - 1;
        sub_24FF6DACC((uint64_t)v391, (v305 - 1) & 1, &__b);
        sub_24FF6DACC((uint64_t)v391, (v308 >> 1) & 1, (_WORD *)&__b.__locale_ + (v308 & 1) + 1);
        sub_24FF6DACC((uint64_t)v391, (v308 >> 2) & 1, (_WORD *)&__b.__locale_ + (v308 & 3) + 3);
        sub_24FF6DACC((uint64_t)v391, (v308 >> 3) & 1, (_WORD *)&__b + (v308 & 7) + 7);
        sub_24FF6DACC((uint64_t)v391, (v308 >> 4) & 1, (_WORD *)&__b + (v308 & 0xF) + 15);
        unsigned int v307 = ((v305 - 1) >> 5) & 1;
        v304 = (int *)((char *)&__b + 2 * ((v305 - 1) & 0x1F) + 62);
        uint64_t v306 = (uint64_t)(a1 + 890);
      }
      sub_24FF6DACC(v306, v307, v304);
LABEL_389:
      v300 += 4;
      v299 = v382;
      if (v302 == v300) {
        goto LABEL_390;
      }
    }
  }
  LOWORD(v406) = 0x8000;
  __int16 v405 = 0x8000;
  memset_pattern16(&__b, &unk_24FF7D710, 0x80uLL);
  __int16 v404 = 0x8000;
  if ((int)v285 >= 1)
  {
    unint64_t v286 = 0;
    int v287 = 0;
    uint64_t v288 = 4 * v285;
    int v289 = 6;
    do
    {
      int v290 = v287;
      int v287 = v382[(*v379)[v286 / 4]];
      v291 = &v406;
      unsigned int v292 = v287 - v290;
      if (v287 == v290)
      {
        uint64_t v293 = (uint64_t)(a1 + 890);
        int v294 = 0;
      }
      else
      {
        sub_24FF6DACC((uint64_t)v391, 1, &v406);
        if ((v292 & 0x80000000) != 0)
        {
          sub_24FF6DACC((uint64_t)v391, 0, &v405);
          unsigned int v292 = -v292;
        }
        else
        {
          sub_24FF6DACC((uint64_t)v391, 1, &v405);
        }
        unsigned int v295 = v292 - 1;
        if (v292 > 0x3F)
        {
          sub_24FF6DACC((uint64_t)v391, 1, &__b);
          sub_24FF6DACC((uint64_t)v391, 1, (_WORD *)&__b.__locale_ + 2);
          sub_24FF6DACC((uint64_t)v391, 1, (_WORD *)v408 + 2);
          sub_24FF6DACC((uint64_t)v391, 1, v409);
          sub_24FF6DACC((uint64_t)v391, 1, v410);
          sub_24FF6DACC((uint64_t)v391, 1, v411);
          sub_24FF7CC68((uint64_t)v391, v292 - 64, v289, &v404);
          unsigned int v296 = v295 >> v289;
          if (!v289 || v296)
          {
            if (v296 > 1) {
              ++v289;
            }
          }
          else
          {
            --v289;
          }
          goto LABEL_368;
        }
        sub_24FF6DACC((uint64_t)v391, (v295 >> 5) & 1, &__b);
        sub_24FF6DACC((uint64_t)v391, (v295 >> 4) & 1, (_WORD *)&__b.__locale_ + (v295 >> 5) + 1);
        sub_24FF6DACC((uint64_t)v391, (v295 >> 3) & 1, (_WORD *)&__b.__locale_ + (v295 >> 4) + 3);
        sub_24FF6DACC((uint64_t)v391, (v295 >> 2) & 1, (_WORD *)&__b + (v295 >> 3) + 7);
        sub_24FF6DACC((uint64_t)v391, (v295 >> 1) & 1, (_WORD *)&__b + (v295 >> 2) + 15);
        int v294 = v295 & 1;
        v291 = (int *)((char *)&__b + 2 * (v295 >> 1) + 62);
        uint64_t v293 = (uint64_t)(a1 + 890);
      }
      sub_24FF6DACC(v293, v294, v291);
LABEL_368:
      v286 += 4;
    }
    while (v288 != v286);
  }
LABEL_390:
  unsigned int v309 = sub_24FF72ACC((uint64_t)v391);
  unsigned int v310 = v309;
  if (v390 >= 4) {
    _DWORD *v393 = v309;
  }
  uint64_t v311 = v309;
  if (v385) {
    uint64_t v311 = v385 + v309;
  }
  v393 = (_DWORD *)v311;
  uint64_t v29 = *v391;
  if (!v29)
  {
    uint64_t v29 = 5;
    if (v382)
    {
      uint64_t v312 = a1[1];
      if ((int)v312 >= 1)
      {
        v313 = v382;
        v314 = v382;
        if (v312 != 1)
        {
          v313 = v382 + 1;
          int v315 = v382[1];
          int v316 = *v382;
          if (v315 >= *v382) {
            v314 = v382;
          }
          else {
            v314 = v382 + 1;
          }
          if (v315 < v316) {
            v313 = v382;
          }
          if (v312 != 2)
          {
            v317 = v382 + 2;
            if (v315 <= v316) {
              int v318 = *v382;
            }
            else {
              int v318 = v382[1];
            }
            if (v315 < v316) {
              int v316 = v382[1];
            }
            uint64_t v319 = 4 * v312 - 12;
            while (v319)
            {
              int v321 = *v317;
              int v320 = v317[1];
              if (v320 >= *v317)
              {
                if (v321 < v316)
                {
                  int v316 = *v317;
                  v314 = v317;
                }
                BOOL v322 = v320 < v318;
                if (v320 > v318) {
                  int v318 = v317[1];
                }
                if (!v322) {
                  v313 = v317 + 1;
                }
              }
              else
              {
                int v316 = *v314;
                if (v320 < *v314)
                {
                  int v316 = v317[1];
                  v314 = v317 + 1;
                }
                int v318 = *v313;
                if (v321 > *v313) {
                  int v318 = *v317;
                }
                if (v321 >= *v313) {
                  v313 = v317;
                }
              }
              v317 += 2;
              v319 -= 8;
              if (v319 == -4) {
                goto LABEL_430;
              }
            }
            int v323 = *v317;
            if (*v317 < *v314) {
              goto LABEL_431;
            }
            if (v323 >= *v313) {
              v313 = v317;
            }
          }
        }
LABEL_430:
        int v323 = *v314;
LABEL_431:
        if (v323 < 0 || (uint64_t v324 = *v313 - (uint64_t)v323, (int)v324 > (int)v312))
        {
          uint64_t v29 = 5;
          goto LABEL_21;
        }
        int v406 = 0;
        sub_24FF6A454(&__b, v324 + 2, &v406);
        uint64_t v390 = v390 - 4 - v310;
        locale = __b.__locale_;
        v326 = v382;
        uint64_t v327 = v312;
        do
        {
          int v328 = *v326++;
          ++*((_DWORD *)locale + v328 - v323 + 1);
          --v327;
        }
        while (v327);
        if ((v324 & 0x80000000) == 0)
        {
          v329 = (_DWORD *)((char *)locale + 4);
          int v330 = *(_DWORD *)locale;
          uint64_t v331 = (v324 + 2) - 1;
          do
          {
            v330 += *v329;
            *v329++ = v330;
            --v331;
          }
          while (v331);
        }
        v332 = *v379;
        v333 = *v377;
        v334 = *v379;
        uint64_t v335 = v312;
        do
        {
          uint64_t v336 = *v334++;
          int v337 = v382[v336] - v323;
          int v338 = *((_DWORD *)locale + v337);
          *((_DWORD *)locale + v337) = v338 + 1;
          v333[v336] = v338;
          --v335;
        }
        while (v335);
        for (uint64_t n = 0; n != v312; ++n)
          v332[v333[n]] = n;
        if (locale)
        {
          v408[0] = locale;
          operator delete(locale);
        }
        goto LABEL_445;
      }
    }
  }
LABEL_21:
  v394[0] = *MEMORY[0x263F8C2B8];
  uint64_t v31 = *(void *)(MEMORY[0x263F8C2B8] + 72);
  *(void *)((char *)v394 + *(void *)(v394[0] - 24)) = *(void *)(MEMORY[0x263F8C2B8] + 64);
  v395[0] = v31;
  v395[1] = MEMORY[0x263F8C318] + 16;
  if (v396 < 0) {
    operator delete((void *)v395[9]);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x25337C9F0](&v397);
  return v29;
}

void sub_24FF6CC5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
}

uint64_t sub_24FF6CCA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  MEMORY[0x270FA5388]();
  uint64_t v10 = v9;
  unint64_t v12 = v11;
  unint64_t v14 = v13;
  unint64_t v16 = v15;
  uint64_t v18 = v17;
  uint64_t v20 = v19;
  unint64_t v22 = v21;
  sub_24FF7BCB8((uint64_t)v36);
  __p = 0;
  int v34 = 0;
  uint64_t v35 = 0;
  unint64_t v32 = 0;
  uint64_t v23 = sub_24FF6A9FC(v22, v20, v18, v16, v14, v12, v10, a9, v36, (unint64_t *)&__p, (uint64_t *)&v32);
  if (!v23)
  {
    uint64_t v31 = *(void *)(a9 + 16);
    long long v30 = *(_OWORD *)a9;
    long long v28 = *(_OWORD *)a9;
    uint64_t v29 = *(void *)(a9 + 16);
    BYTE1(v31) = 0;
    BYTE3(v31) = 0;
    unint64_t v27 = 0;
    uint64_t v23 = sub_24FF6A9FC(v22, v20, v18, v16, v14, v12, v10, (uint64_t)&v30, v36, (unint64_t *)&__p, (uint64_t *)&v27);
    if (!v23)
    {
      BYTE1(v29) = 1;
      BYTE3(v29) = 0;
      unint64_t v26 = 0;
      uint64_t v23 = sub_24FF6A9FC(v22, v20, v18, v16, v14, v12, v10, (uint64_t)&v28, v36, (unint64_t *)&__p, (uint64_t *)&v26);
      if (!v23 && (v32 > v27 || v32 > v26))
      {
        uint64_t v24 = &v30;
        if (v27 > v26) {
          uint64_t v24 = &v28;
        }
        *(_OWORD *)a9 = *v24;
        *(void *)(a9 + 14) = *(void *)((char *)v24 + 14);
      }
    }
  }
  if (__p)
  {
    int v34 = __p;
    operator delete(__p);
  }
  sub_24FF7C1E0((uint64_t)v36);
  return v23;
}

void sub_24FF6CE8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *__p,uint64_t a25,uint64_t a26,char a27)
{
  if (__p) {
    operator delete(__p);
  }
  sub_24FF7C1E0((uint64_t)&a27);
  _Unwind_Resume(a1);
}

uint64_t sub_24FF6CEB8(uint64_t a1, unsigned char *a2, unsigned int a3, uint64_t a4, unint64_t a5, uint64_t a6, unsigned int *a7, unint64_t *a8, uint64_t *a9)
{
  if (*(_DWORD *)(a6 + 16)) {
    uint64_t v16 = a4;
  }
  else {
    uint64_t v16 = 0;
  }
  unint64_t v17 = v16 + 4 * a4 * a5 + 1024;
  uint64_t v18 = *a8;
  unint64_t v19 = a8[1] - *a8;
  if (v17 <= v19)
  {
    if (v17 < v19) {
      a8[1] = v18 + v17;
    }
  }
  else
  {
    sub_24FF69DDC(a8, v17 - v19);
    uint64_t v18 = *a8;
  }
  *a9 = 0;
  return sub_24FF6CF88(a7, a1, a2, a3, 0, a5, v18, v17, a9, a6);
}

uint64_t sub_24FF6CF88(unsigned int *a1, uint64_t a2, unsigned char *a3, unsigned int a4, unint64_t a5, unint64_t a6, uint64_t a7, uint64_t a8, uint64_t *a9, uint64_t a10)
{
  uint64_t result = 5;
  if (a5 <= 0xFF)
  {
    if (a2)
    {
      if (a6 - 256 >= 0xFFFFFFFFFFFFFF01 && (*(unsigned __int8 *)(a10 + 8) | 2) != 3 && !*(_DWORD *)(a10 + 20))
      {
        unsigned int v16 = a5;
        if (a3 || !*(_DWORD *)(a10 + 16))
        {
          unsigned int v19 = *(_DWORD *)(a10 + 4);
          if (v19 <= 0x1B)
          {
            if ((*(_DWORD *)(a10 + 12) - 5) > 1)
            {
              if (!a7) {
                return result;
              }
            }
            else if (!a7 || a6 != 2 || !v19)
            {
              return result;
            }
            if ((unint64_t)a8 < 0x21) {
              return 1;
            }
            unsigned int v67 = *(_DWORD *)(a10 + 12) - 5;
            uint64_t v20 = *a1;
            unint64_t v65 = (int)v20;
            uint64_t v21 = a1 + 750;
            a1[780] = a6;
            uint64_t v68 = v20;
            a1[781] = v20;
            a1[782] = a4;
            int v66 = (int **)(a1 + 756);
            sub_24FF5F2F4((uint64_t)(a1 + 756), a6);
            sub_24FF5F2F4((uint64_t)(a1 + 762), a6);
            sub_24FF5F2F4((uint64_t)(a1 + 750), a6);
            uint64_t v22 = 0;
            uint64_t v23 = (int *)*((void *)a1 + 378);
            uint64_t v24 = (int *)*((void *)a1 + 381);
            do
            {
              int v25 = *(_DWORD *)(a2 + 4 * v22);
              v23[v22] = v25;
              v24[v22++] = v25;
            }
            while (a6 != v22);
            if ((int)v68 >= 2)
            {
              int v26 = 1;
              LODWORD(v27) = a6;
              do
              {
                uint64_t v27 = (int)v27;
                long long v28 = v23;
                uint64_t v29 = v24;
                unint64_t v30 = a6;
                do
                {
                  int v31 = *(_DWORD *)(a2 + 4 * v27);
                  if (v31 >= *v28) {
                    int v31 = *v28;
                  }
                  *v28++ = v31;
                  int v32 = *v29;
                  if (*v29 <= *(_DWORD *)(a2 + 4 * v27)) {
                    int v32 = *(_DWORD *)(a2 + 4 * v27);
                  }
                  *v29++ = v32;
                  ++v27;
                  --v30;
                }
                while (v30);
                ++v26;
              }
              while (v26 != v68);
            }
            uint64_t v33 = 0;
            uint64_t result = 5;
            do
            {
              uint64_t v34 = v24[v33];
              uint64_t v35 = v23[v33];
              if (v34 - v35 > 0xFFFFFFF) {
                return 5;
              }
              int v36 = *(_DWORD *)(a10 + 4);
              if (v36 && ((v35 & 0x80000000) != 0 || (int)v34 >= 1 << v36)) {
                return result;
              }
              if (v67 > 1)
              {
                *(_DWORD *)(*v21 + 4 * v33) = v34 - v35;
              }
              else
              {
                *(_DWORD *)(*v21 + 4 * v33) = v34;
                v23[v33] = 0;
              }
              ++v33;
            }
            while (a6 != v33);
            int v75 = (_DWORD *)a7;
            uint64_t v76 = a8;
            long long v69 = 0u;
            long long v70 = 0u;
            long long v71 = 0u;
            int v72 = 0;
            HIDWORD(v69) = v68;
            LODWORD(v70) = a6;
            *((void *)&v70 + 1) = __PAIR64__(*(_DWORD *)(a10 + 4), v16);
            int v38 = *(_DWORD *)(a10 + 12);
            int v37 = *(_DWORD *)(a10 + 16);
            LODWORD(v71) = a4;
            DWORD2(v71) = v37;
            char v73 = *(unsigned char *)(a10 + 8);
            int v74 = v38;
            uint64_t v39 = (_DWORD *)sub_24FF6D90C(a7, a8, (uint64_t)&v69);
            uint64_t v41 = 0;
            do
            {
              BOOL v42 = v40 < 4;
              v40 -= 4;
              if (v42)
              {
                uint64_t v40 = 0;
                uint64_t v39 = 0;
              }
              else
              {
                *v39++ = (*v66)[v41];
              }
              unsigned int v43 = *(_DWORD *)(*v21 + 4 * v41);
              unsigned int v44 = 32 - __clz(v43);
              if (v43) {
                unsigned int v45 = v44;
              }
              else {
                unsigned int v45 = 0;
              }
              *(_DWORD *)(*v21 + 4 * v41++) = v45;
            }
            while (a6 != v41);
            uint64_t v46 = 0;
            do
            {
              if (v40)
              {
                --v40;
                *(unsigned char *)uint64_t v39 = *(_DWORD *)(*v21 + 4 * v46);
                uint64_t v39 = (_DWORD *)((char *)v39 + 1);
              }
              else
              {
                uint64_t v39 = 0;
              }
              ++v46;
            }
            while (a6 != v46);
            int v75 = v39;
            uint64_t v76 = v40;
            sub_24FF5F2F4((uint64_t)(a1 + 768), v65 * a6);
            if ((int)v68 >= 1)
            {
              int v47 = 0;
              LODWORD(v48) = 0;
              int v49 = *v66;
              uint64_t v50 = *((void *)a1 + 384);
              do
              {
                uint64_t v48 = (int)v48;
                uint64_t v51 = v49;
                unint64_t v52 = a6;
                do
                {
                  int v53 = *v51++;
                  *(_DWORD *)(v50 + 4 * v48) = *(_DWORD *)(a2 + 4 * v48) - v53;
                  ++v48;
                  --v52;
                }
                while (v52);
                ++v47;
              }
              while (v47 != v68);
            }
            int v54 = (void **)(a1 + 774);
            if (a3 && *(_DWORD *)(a10 + 16))
            {
              sub_24FF6AAF4((unint64_t *)a1 + 387, v65);
              if ((int)v68 >= 1)
              {
                for (uint64_t i = 0; i != v68; ++i)
                  *((unsigned char *)*v54 + i) = a3[i];
              }
              if (v68) {
                memmove(*v54, a3, v65);
              }
            }
            else
            {
              sub_24FF6AAF4((unint64_t *)a1 + 387, 0);
            }
            uint64_t result = sub_24FF6DA24((uint64_t)a1, a10, (uint64_t)&v75);
            if (!result)
            {
              uint64_t result = 1;
              if (v75)
              {
                if ((v76 & 0x8000000000000000) == 0)
                {
                  uint64_t v56 = (a8 & ~(a8 >> 63)) - v76;
                  if (a8 - v56 >= 0) {
                    uint64_t v57 = (a8 & ~(a8 >> 63)) - v76;
                  }
                  else {
                    uint64_t v57 = 0;
                  }
                  if (a8 - v56 >= 0) {
                    uint64_t v58 = a7;
                  }
                  else {
                    uint64_t v58 = 0;
                  }
                  uint64_t v59 = v57 & ~(v57 >> 63);
                  *a9 = v59;
                  if (v57 >= 16)
                  {
                    *(_DWORD *)(v58 + 12) = v59;
                    uint64_t v61 = v57 - 8;
                  }
                  else
                  {
                    BOOL v60 = v57 == 8;
                    BOOL v42 = v57 < 8;
                    uint64_t v61 = v57 - 8;
                    if (v42) {
                      return 0;
                    }
                    if (v60)
                    {
                      unsigned int v63 = -1;
LABEL_82:
                      uint64_t result = 0;
                      *(_DWORD *)(v58 + 4) = v63;
                      return result;
                    }
                  }
                  int v62 = (unsigned __int8 *)(v58 + 8);
                  unsigned int v63 = -1;
                  do
                  {
                    int v64 = *v62++;
                    unsigned int v63 = dword_24FF7D068[v64 ^ HIBYTE(v63)] ^ (v63 << 8);
                    --v61;
                  }
                  while (v61);
                  goto LABEL_82;
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_24FF6D40C()
{
  uint64_t v0 = MEMORY[0x270FA5388]();
  uint64_t v2 = v1;
  unint64_t v4 = v3;
  uint64_t v6 = v5;
  unsigned int v8 = v7;
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  uint64_t v13 = v0;
  sub_24FF7BCB8((uint64_t)&v31);
  uint64_t v31 = *(void *)v13;
  int v32 = *(_DWORD *)(v13 + 8);
  uint64_t v33 = *(void *)(v13 + 12);
  int v34 = *(_DWORD *)(v13 + 20);
  uint64_t v35 = *(void *)(v13 + 24);
  int v14 = *(_DWORD *)(v13 + 36);
  int v36 = *(_DWORD *)(v13 + 32);
  int v37 = v14;
  if (&v31 != (uint64_t *)v13)
  {
    sub_24FF7C3A0(v38, *(char **)(v13 + 40), *(void *)(v13 + 48), (uint64_t)(*(void *)(v13 + 48) - *(void *)(v13 + 40)) >> 2);
    sub_24FF7C3A0(v39, *(char **)(v13 + 64), *(void *)(v13 + 72), (uint64_t)(*(void *)(v13 + 72) - *(void *)(v13 + 64)) >> 2);
    sub_24FF7C3A0(v40, *(char **)(v13 + 88), *(void *)(v13 + 96), (uint64_t)(*(void *)(v13 + 96) - *(void *)(v13 + 88)) >> 2);
    sub_24FF7C3A0(v41, *(char **)(v13 + 112), *(void *)(v13 + 120), (uint64_t)(*(void *)(v13 + 120) - *(void *)(v13 + 112)) >> 2);
    sub_24FF7C4AC((uint64_t)&v42, *(_DWORD **)(v13 + 136), *(_DWORD **)(v13 + 144), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(v13 + 144) - *(void *)(v13 + 136)) >> 2));
    sub_24FF7C4AC((uint64_t)&v43, *(_DWORD **)(v13 + 160), *(_DWORD **)(v13 + 168), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(v13 + 168) - *(void *)(v13 + 160)) >> 2));
    sub_24FF7C4AC((uint64_t)&v44, *(_DWORD **)(v13 + 184), *(_DWORD **)(v13 + 192), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(v13 + 192) - *(void *)(v13 + 184)) >> 2));
    sub_24FF7C3A0(v45, *(char **)(v13 + 208), *(void *)(v13 + 216), (uint64_t)(*(void *)(v13 + 216) - *(void *)(v13 + 208)) >> 2);
    sub_24FF7C3A0(v46, *(char **)(v13 + 232), *(void *)(v13 + 240), (uint64_t)(*(void *)(v13 + 240) - *(void *)(v13 + 232)) >> 2);
    sub_24FF7C3A0(v47, *(char **)(v13 + 256), *(void *)(v13 + 264), (uint64_t)(*(void *)(v13 + 264) - *(void *)(v13 + 256)) >> 2);
  }
  __p = 0;
  uint64_t v29 = 0;
  uint64_t v30 = 0;
  unint64_t v27 = 0;
  uint64_t v15 = sub_24FF6CEB8(v12, v10, v8, v6, v4, v2, (unsigned int *)&v31, (unint64_t *)&__p, (uint64_t *)&v27);
  if (!v15)
  {
    *(_OWORD *)int v26 = *(_OWORD *)v2;
    *(_OWORD *)&v26[12] = *(_OWORD *)(v2 + 12);
    if (v8 == 1 && v4 == 2)
    {
      BOOL v16 = *(_DWORD *)(v2 + 12) == 4;
      int v17 = 3;
    }
    else
    {
      int v18 = *(_DWORD *)(v2 + 12);
      if (v8 == 2 && v4 == 2)
      {
        BOOL v16 = v18 == 6;
        int v17 = 5;
      }
      else
      {
        BOOL v16 = v18 == 2;
        int v17 = 1;
      }
    }
    int v19 = v16 ? v17 : v17 + 1;
    *(_DWORD *)&v26[12] = v19;
    unint64_t v25 = 0;
    uint64_t v15 = sub_24FF6CEB8(v12, v10, v8, v6, v4, (uint64_t)v26, (unsigned int *)&v31, (unint64_t *)&__p, (uint64_t *)&v25);
    if (!v15)
    {
      unint64_t v20 = v27;
      unint64_t v21 = v25;
      if (v27 <= v25)
      {
        int v19 = *(_DWORD *)(v2 + 12);
      }
      else
      {
        *(_DWORD *)(v2 + 12) = v19;
        unint64_t v20 = v21;
      }
      char v22 = v26[8] == 4 ? 2 : 4;
      v26[8] = v22;
      *(_DWORD *)&v26[12] = v19;
      unint64_t v24 = 0;
      uint64_t v15 = sub_24FF6CEB8(v12, v10, v8, v6, v4, (uint64_t)v26, (unsigned int *)&v31, (unint64_t *)&__p, (uint64_t *)&v24);
      if (!v15 && v20 > v24) {
        *(unsigned char *)(v2 + 8) = v22;
      }
    }
  }
  if (__p)
  {
    uint64_t v29 = __p;
    operator delete(__p);
  }
  sub_24FF7C1E0((uint64_t)&v31);
  return v15;
}

void sub_24FF6D73C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,uint64_t a21,char a22)
{
  if (__p) {
    operator delete(__p);
  }
  sub_24FF7C1E0((uint64_t)&a22);
  _Unwind_Resume(a1);
}

double sub_24FF6D770(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned int *a9, uint64_t a10)
{
  if (a4 || 3 * a5 == a7)
  {
    uint64_t v15 = v10;
    uint64_t v16 = v11;
    *(void *)&v14[16] = *(void *)(a10 + 16);
    *(_OWORD *)int v14 = *(_OWORD *)a10;
    v14[16] = a8 != 0;
    v14[21] = 1;
    v14[8] = 4;
    unsigned int v12 = *a9;
    if (*a9 - 3 < 4)
    {
      *(_DWORD *)&v14[12] = 1;
      *(_DWORD *)&v14[17] = 1;
    }
    else if (v12 >= 3)
    {
      if (v12 == 10)
      {
        if (sub_24FF6CCA8(a1, a2, a3, a4, a5, a6, a7, a8, (uint64_t)v14)) {
          return result;
        }
      }
      else
      {
        *(_DWORD *)&v14[12] = 2;
        *(_DWORD *)&v14[17] = 16843009;
      }
    }
    else
    {
      *(_DWORD *)&v14[12] = 1;
      *(_DWORD *)&v14[17] = 0;
    }
    double result = *(double *)v14;
    *(_OWORD *)a10 = *(_OWORD *)v14;
    *(void *)(a10 + 14) = *(void *)&v14[14];
  }
  return result;
}

uint64_t sub_24FF6D854(int *a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, unsigned int *a6, uint64_t a7)
{
  int v7 = *a1;
  *(_DWORD *)(a7 + 16) = a3 != 0;
  if (a4 == 1 && v7 <= 79) {
    char v8 = 2;
  }
  else {
    char v8 = 4;
  }
  *(unsigned char *)(a7 + 8) = v8;
  unsigned int v9 = *a6;
  if (*a6 - 3 < 4)
  {
    char v10 = 0;
    if (a4 == 1) {
      int v11 = 3;
    }
    else {
      int v11 = 1;
    }
    goto LABEL_11;
  }
  if (v9 < 3)
  {
    char v10 = 0;
    int v11 = 1;
LABEL_11:
    *(_DWORD *)(a7 + 12) = v11;
    *(unsigned char *)(a7 + 24) = v10;
    return 0;
  }
  if (v9 != 10)
  {
    if (a4 == 1) {
      int v11 = 4;
    }
    else {
      int v11 = 2;
    }
    char v10 = 1;
    goto LABEL_11;
  }
  uint64_t result = sub_24FF6D40C();
  if (!result) {
    return 0;
  }
  return result;
}

uint64_t sub_24FF6D90C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 < 4) {
    return 0;
  }
  *(_DWORD *)a1 = -290009985;
  if ((unint64_t)a2 < 9) {
    return 0;
  }
  *(unsigned char *)(a1 + 8) = 0;
  if (a2 == 9) {
    return 0;
  }
  *(unsigned char *)(a1 + 9) = 8;
  if (((a2 - 8) & 0xFFFFFFFFFFFFFFFELL) == 2) {
    return 0;
  }
  *(_WORD *)(a1 + 10) = 0;
  if ((unint64_t)a2 < 0x14) {
    return 0;
  }
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a3 + 12);
  if (a2 == 20) {
    return 0;
  }
  *(unsigned char *)(a1 + 20) = *(_DWORD *)(a3 + 32);
  if (a2 == 21) {
    return 0;
  }
  *(unsigned char *)(a1 + 21) = *(_DWORD *)(a3 + 24);
  if (a2 == 22) {
    return 0;
  }
  *(unsigned char *)(a1 + 22) = *(_DWORD *)(a3 + 16);
  if (a2 == 23) {
    return 0;
  }
  *(unsigned char *)(a1 + 23) = *(unsigned char *)(a3 + 52);
  if (a2 == 24) {
    return 0;
  }
  *(unsigned char *)(a1 + 24) = *(_DWORD *)(a3 + 56);
  uint64_t v3 = a2 - 25;
  if (a2 == 25) {
    return v3;
  }
  *(unsigned char *)(a1 + 25) = *(unsigned char *)(a3 + 36) | (16 * *(_DWORD *)(a3 + 44));
  if (a2 == 26) {
    return 0;
  }
  *(unsigned char *)(a1 + 26) = *(_DWORD *)(a3 + 40);
  if (a2 == 27) {
    return 0;
  }
  *(unsigned char *)(a1 + 27) = *(_DWORD *)(a3 + 28);
  if ((a2 & 0xFFFFFFFFFFFFFFFCLL) == 0x1C) {
    return 0;
  }
  uint64_t v3 = a1 + 32;
  *(_DWORD *)(a1 + 28) = *(_DWORD *)(a3 + 20);
  return v3;
}

uint64_t sub_24FF6DA24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(unsigned int **)a3;
  uint64_t v7 = *(void *)(a3 + 8);
  uint64_t v8 = *(void *)a3 + 4;
  *(void *)a3 = v8;
  *(void *)(a3 + 8) = v7 - 4;
  unsigned int v9 = (unsigned int *)(a1 + 3560);
  *(_DWORD *)(a1 + 3564) = (v7 - 4) & ~((v7 - 4) >> 63);
  *(void *)(a1 + 3568) = v8;
  sub_24FF5D92C(a1 + 3560);
  uint64_t result = sub_24FF6E15C((unsigned int *)a1, a2);
  if (!result)
  {
    unsigned int v11 = sub_24FF72ACC((uint64_t)v9);
    if (v7 >= 4) {
      unsigned int *v6 = v11;
    }
    uint64_t v12 = v11;
    if (*(void *)a3) {
      uint64_t v12 = *(void *)a3 + v11;
    }
    uint64_t v13 = *(void *)(a3 + 8) - v11;
    *(void *)a3 = v12;
    *(void *)(a3 + 8) = v13;
    return *v9;
  }
  return result;
}

uint64_t sub_24FF6DACC(uint64_t result, int a2, _WORD *a3)
{
  unint64_t v3 = (unsigned __int16)*a3;
  int v4 = *(_DWORD *)(result + 28);
  unsigned int v5 = (v4 * v3) >> 16;
  if (a2)
  {
    *(_DWORD *)(result + 24) += v5;
    unsigned int v5 = v4 - v5;
    __int16 v6 = v3 - *(_WORD *)(result + ((v3 >> 7) & 0x1FE) + 48);
  }
  else
  {
    __int16 v6 = *(_WORD *)(result + (~(*a3 >> 7) & 0x1FE) + 48) + *a3;
  }
  *(_DWORD *)(result + 28) = v5;
  *a3 = v6;
  if (v5 <= 0x4000)
  {
    unsigned int v7 = *(_DWORD *)(result + 24);
    int v8 = *(_DWORD *)(result + 40);
    while (1)
    {
      v7 *= 2;
      v5 *= 2;
      *(_DWORD *)(result + 24) = v7;
      *(_DWORD *)(result + 28) = v5;
      *(_DWORD *)(result + 40) = ++v8;
      if (v8 == 8) {
        break;
      }
LABEL_18:
      if (v5 > 0x4000) {
        return result;
      }
    }
    uint64_t v9 = *(void *)(result + 16);
    uint64_t v10 = *(int *)(result + 44);
    if (v9 + v10 + 1 > (unint64_t)*(unsigned int *)(result + 4)) {
      return result;
    }
    if (HIBYTE(v7))
    {
      ++*(unsigned char *)(v9 + *(void *)(result + 8) - 1);
      uint64_t v9 = *(void *)(result + 16);
      if (*(_DWORD *)(result + 44))
      {
        do
        {
          *(unsigned char *)(*(void *)(result + 8) + v9) = 0;
          int v11 = *(_DWORD *)(result + 44);
          uint64_t v9 = *(void *)(result + 16) + 1;
          *(void *)(result + 16) = v9;
          *(_DWORD *)(result + 44) = --v11;
        }
        while (v11);
      }
    }
    else
    {
      if ((v5 + v7) >> 24)
      {
        *(_DWORD *)(result + 44) = v10 + 1;
LABEL_17:
        int v8 = 0;
        unsigned int v7 = (unsigned __int16)v7;
        *(_DWORD *)(result + 24) = (unsigned __int16)v7;
        *(_DWORD *)(result + 40) = 0;
        goto LABEL_18;
      }
      if (v10)
      {
        do
        {
          *(unsigned char *)(*(void *)(result + 8) + v9) = -1;
          int v12 = *(_DWORD *)(result + 44);
          uint64_t v9 = *(void *)(result + 16) + 1;
          *(void *)(result + 16) = v9;
          *(_DWORD *)(result + 44) = --v12;
        }
        while (v12);
      }
    }
    *(unsigned char *)(*(void *)(result + 8) + v9) = *(_WORD *)(result + 26);
    ++*(void *)(result + 16);
    LOWORD(v7) = *(_WORD *)(result + 24);
    unsigned int v5 = *(_DWORD *)(result + 28);
    goto LABEL_17;
  }
  return result;
}

uint64_t sub_24FF6DC40(uint64_t result, uint64_t a2, uint64_t a3, int a4, void *a5, char a6, void *a7)
{
  uint64_t v8 = a3;
  uint64_t v10 = result + 3560;
  switch(a6)
  {
    case 0:
      if (a4 < 1) {
        return result;
      }
      uint64_t v11 = 0;
      uint64_t v12 = 0;
      uint64_t v13 = 0;
      unint64_t v14 = (unint64_t)a4 << 6;
      while (1)
      {
        int v15 = *(_DWORD *)(a2 + v11);
        int v16 = *(_DWORD *)(v8 + v11);
        int v17 = (_WORD *)(*a7 + v12);
        uint64_t v18 = v10;
        unsigned int v19 = v15 - v16;
        if (v15 == v16)
        {
          unsigned int v21 = 0;
        }
        else
        {
          sub_24FF6DACC(v10, 1, v17);
          unint64_t v20 = (_WORD *)(a7[3] + v12);
          if ((v19 & 0x80000000) != 0)
          {
            sub_24FF6DACC(v10, 0, v20);
            unsigned int v19 = -v19;
          }
          else
          {
            sub_24FF6DACC(v10, 1, v20);
          }
          uint64_t v22 = a7[6];
          uint64_t v23 = (_WORD *)(v22 + 2 * (int)v13);
          if (v19 > 0x3F)
          {
            sub_24FF6DACC(v10, 1, (_WORD *)(v22 + 2 * (int)v13));
            sub_24FF6DACC(v10, 1, v23 + 2);
            sub_24FF6DACC(v10, 1, v23 + 6);
            sub_24FF6DACC(v10, 1, v23 + 14);
            sub_24FF6DACC(v10, 1, v23 + 30);
            sub_24FF6DACC(v10, 1, v23 + 62);
            uint64_t result = sub_24FF7CC68(v10, v19 - 64, *(_DWORD *)(a7[12] + v11), (_WORD *)(a7[9] + v12));
            goto LABEL_13;
          }
          unsigned int v24 = v19 - 1;
          sub_24FF6DACC(v10, (v19 - 1) & 1, (_WORD *)(v22 + 2 * (int)v13));
          sub_24FF6DACC(v10, (v24 >> 1) & 1, &v23[(v24 & 1) + 1]);
          sub_24FF6DACC(v10, (v24 >> 2) & 1, &v23[(v24 & 3) + 3]);
          sub_24FF6DACC(v10, (v24 >> 3) & 1, &v23[(v24 & 7) + 7]);
          sub_24FF6DACC(v10, (v24 >> 4) & 1, &v23[(v24 & 0xF) + 15]);
          unsigned int v21 = ((v19 - 1) >> 5) & 1;
          uint64_t v8 = a3;
          int v17 = &v23[((v19 - 1) & 0x1F) + 31];
          uint64_t v18 = v10;
        }
        uint64_t result = sub_24FF6DACC(v18, v21, v17);
LABEL_13:
        v13 += 64;
        v12 += 2;
        v11 += 4;
        if (v14 == v13) {
          return result;
        }
      }
    case 2:
      if (a4 < 1) {
        return result;
      }
      uint64_t v25 = 0;
      uint64_t v26 = 0;
      uint64_t v27 = 4 * a4;
      while (1)
      {
        signed int v28 = *(_DWORD *)(a2 + v26) - *(_DWORD *)(v8 + v26);
        uint64_t v29 = a7[12];
        uint64_t result = sub_24FF72E7C(v10, v28, *(_DWORD *)(v29 + v26), (_WORD *)(a7[3] + v25), (_WORD *)(a7[9] + v25));
        unsigned int v30 = v28 >= 0 ? v28 : -v28;
        int v31 = *(_DWORD *)(v29 + v26);
        unsigned int v32 = v30 >> v31;
        if (v31 && v32 == 0) {
          break;
        }
        if (v32 >= 2)
        {
          int v34 = 1;
LABEL_27:
          *(_DWORD *)(v29 + v26) = v34 + v31;
        }
        v26 += 4;
        v25 += 2;
        if (v27 == v26) {
          return result;
        }
      }
      int v34 = -1;
      goto LABEL_27;
    case 3:
      if (a4 >= 1)
      {
        uint64_t v36 = 0;
        uint64_t v37 = a4;
        do
        {
          int v38 = *(_DWORD *)(*a5 + 4 * v36);
          if (v38 >= 1)
          {
            int v39 = 0;
            unsigned int v40 = *(_DWORD *)(a2 + 4 * v36) - *(_DWORD *)(v8 + 4 * v36);
            do
            {
              __int16 v57 = 0x8000;
              uint64_t result = sub_24FF6DACC(v10, (v40 >> v39++) & 1, &v57);
            }
            while (v38 != v39);
          }
          ++v36;
        }
        while (v36 != v37);
      }
      return result;
    case 4:
      if (a4 < 1) {
        return result;
      }
      uint64_t v41 = 0;
      uint64_t v42 = 0;
      uint64_t v43 = 0;
      unint64_t v55 = (unint64_t)a4 << 6;
      break;
    default:
      return result;
  }
  do
  {
    int v44 = *(_DWORD *)(a2 + v41);
    int v45 = *(_DWORD *)(v8 + v41);
    uint64_t v46 = (_WORD *)(*a7 + v42);
    unsigned int v47 = v44 - v45;
    if (v44 == v45)
    {
      uint64_t result = sub_24FF6DACC(v10, 0, v46);
      goto LABEL_50;
    }
    sub_24FF6DACC(v10, 1, v46);
    uint64_t v48 = (_WORD *)(a7[3] + v42);
    if ((v47 & 0x80000000) != 0)
    {
      sub_24FF6DACC(v10, 0, v48);
      unsigned int v47 = -v47;
    }
    else
    {
      sub_24FF6DACC(v10, 1, v48);
    }
    unsigned int v49 = v47 - 1;
    uint64_t v50 = a7[6];
    uint64_t v51 = (_WORD *)(v50 + 2 * (int)v43);
    if (v47 <= 0x3F)
    {
      sub_24FF6DACC(v10, (v49 >> 5) & 1, (_WORD *)(v50 + 2 * (int)v43));
      sub_24FF6DACC(v10, (v49 >> 4) & 1, &v51[(v49 >> 5) + 1]);
      sub_24FF6DACC(v10, (v49 >> 3) & 1, &v51[(v49 >> 4) + 3]);
      sub_24FF6DACC(v10, (v49 >> 2) & 1, &v51[(v49 >> 3) + 7]);
      sub_24FF6DACC(v10, (v49 >> 1) & 1, &v51[(v49 >> 2) + 15]);
      uint64_t result = sub_24FF6DACC(v10, v49 & 1, &v51[(v49 >> 1) + 31]);
LABEL_49:
      uint64_t v8 = a3;
      goto LABEL_50;
    }
    sub_24FF6DACC(v10, 1, (_WORD *)(v50 + 2 * (int)v43));
    sub_24FF6DACC(v10, 1, v51 + 2);
    sub_24FF6DACC(v10, 1, v51 + 6);
    sub_24FF6DACC(v10, 1, v51 + 14);
    sub_24FF6DACC(v10, 1, v51 + 30);
    sub_24FF6DACC(v10, 1, v51 + 62);
    uint64_t v52 = a7[12];
    uint64_t result = sub_24FF7CC68(v10, v47 - 64, *(_DWORD *)(v52 + v41), (_WORD *)(a7[9] + v42));
    int v53 = *(_DWORD *)(v52 + v41);
    unsigned int v54 = v49 >> v53;
    if (v53 && !v54)
    {
      *(_DWORD *)(v52 + v41) = v53 - 1;
      goto LABEL_49;
    }
    uint64_t v8 = a3;
    if (v54 >= 2) {
      *(_DWORD *)(v52 + v41) = v53 + 1;
    }
LABEL_50:
    v43 += 64;
    v42 += 2;
    v41 += 4;
  }
  while (v55 != v43);
  return result;
}

uint64_t sub_24FF6E15C(unsigned int *a1, uint64_t a2)
{
  uint64_t v2 = a2;
  unint64_t v3 = a1;
  uint64_t v1072 = *MEMORY[0x263EF8340];
  if (*(_DWORD *)(a2 + 16) == 1)
  {
    uint64_t v4 = *a1;
    memset_pattern16(&__b, &unk_24FF7D710, 4uLL);
    if ((int)v4 >= 1)
    {
      uint64_t v5 = 0;
      uint64_t v6 = 4 * v4;
      do
      {
        uint64_t v7 = *(int *)(*((void *)v3 + 11) + v5);
        uint64_t v8 = (int *)(*((void *)v3 + 17) + 12 * v7);
        uint64_t v9 = *v8;
        uint64_t v10 = v8[1];
        uint64_t v11 = v8[2];
        uint64_t v12 = (int *)(*((void *)v3 + 20) + 12 * v7);
        uint64_t v13 = v12[2];
        if (v13 == -1)
        {
          uint64_t v14 = *((void *)v3 + 387);
          if (v11 == -1)
          {
            if (v10 == -1)
            {
              if (v9 == -1) {
                uint64_t v9 = 0;
              }
              else {
                uint64_t v9 = *(unsigned __int8 *)(v14 + v9);
              }
            }
            else
            {
              LODWORD(v9) = *(unsigned __int8 *)(v14 + v9);
              if (v9) {
                LODWORD(v9) = *(unsigned char *)(v14 + v10) != 0;
              }
              uint64_t v9 = v9;
            }
            goto LABEL_11;
          }
          char v15 = *(unsigned __int8 *)(v14 + v10)
              + *(unsigned __int8 *)(v14 + v9)
              + *(unsigned __int8 *)(v14 + v11) > 1;
        }
        else
        {
          uint64_t v14 = *((void *)v3 + 387);
          char v15 = *(unsigned __int8 *)(v14 + v10)
              + *(unsigned __int8 *)(v14 + v9)
              + *(unsigned __int8 *)(v14 + v11)
              + *(unsigned __int8 *)(v14 + *v12)
              + *(unsigned __int8 *)(v14 + v12[1])
              + *(unsigned __int8 *)(v14 + v13) > 2;
        }
        if (v15) {
          uint64_t v9 = 1;
        }
        else {
          uint64_t v9 = 0;
        }
LABEL_11:
        sub_24FF6DACC((uint64_t)(v3 + 890), *(unsigned __int8 *)(v14 + v7) != 0, (_WORD *)&v1050[-2] + v9);
        v5 += 4;
      }
      while (v6 != v5);
    }
  }
  uint64_t v1000 = v2;
  v1009 = v3;
  switch(*(_DWORD *)(v2 + 12))
  {
    case 0:
      char v16 = 0;
      uint64_t v17 = 0;
      uint64_t v977 = *v3;
      v1001 = v3 + 750;
      unint64_t v18 = (int)v3[780];
      uint64_t v984 = *((void *)v3 + 384);
      uint64_t v993 = v3[780];
      long long v1062 = 0u;
      long long v1063 = 0u;
      long long v1060 = 0u;
      long long v1061 = 0u;
      long long v1058 = 0u;
      long long v1059 = 0u;
      long long v1056 = 0u;
      long long v1057 = 0u;
      long long v1054 = 0u;
      *(_OWORD *)v1055 = 0u;
      *(_OWORD *)v1052 = 0u;
      *(_OWORD *)v1053 = 0u;
      *(_OWORD *)v1050 = 0u;
      long long v1051 = 0u;
      long long __b = 0u;
      do
      {
        char v19 = v16;
        sub_24FF60D8C((uint64_t)&v1050[15 * v17 - 2], v18);
        char v16 = 1;
        uint64_t v17 = 1;
      }
      while ((v19 & 1) == 0);
      LODWORD(v1044) = 0;
      int v966 = v18;
      sub_24FF6A454(&__p, v18, &v1044);
      int v20 = v993;
      if ((int)v977 < 1) {
        goto LABEL_53;
      }
      uint64_t v21 = 0;
      size_t v22 = 4 * v993;
      int v971 = *(_DWORD *)(v1000 + 16);
      uint64_t v23 = (uint64_t)(v3 + 890);
      while (1)
      {
        uint64_t v24 = *(int *)(*((void *)v3 + 11) + 4 * v21);
        if (!v971) {
          break;
        }
        uint64_t v25 = *((void *)v3 + 387);
        if (*(unsigned char *)(v25 + v24))
        {
          int v26 = v966;
          uint64_t v27 = v984 + 4 * (int)v24 * v966;
          unint64_t v3 = v1009;
          signed int v28 = (int *)(*((void *)v1009 + 17) + 12 * (int)v24);
          int v29 = *v28;
          int v30 = v28[1];
          if (v30 == -1 || !*(unsigned char *)(v25 + v29) || !*(unsigned char *)(v25 + v30))
          {
            if (v29 == -1 || !*(unsigned char *)(v25 + v29))
            {
LABEL_46:
              if (v20 >= 1)
              {
                uint64_t v43 = __p;
                bzero(__p, v22);
                uint64_t v44 = 0;
                do
                {
                  int v45 = *(_DWORD *)(*v1001 + 4 * v44);
                  if (v45 >= 1)
                  {
                    int v46 = 0;
                    unsigned int v47 = *(_DWORD *)(v27 + 4 * v44) - v43[v44];
                    do
                    {
                      LOWORD(v1044) = 0x8000;
                      sub_24FF6DACC(v23, (v47 >> v46++) & 1, &v1044);
                    }
                    while (v45 != v46);
                  }
                  ++v44;
                  int v20 = v993;
                }
                while (v44 != v993);
              }
              goto LABEL_52;
            }
LABEL_32:
            int v31 = (char *)__p;
            if (v26 >= 1)
            {
              uint64_t v32 = 0;
              uint64_t v33 = v984 + 4 * v29 * v20;
              do
              {
                *(_DWORD *)&v31[v32] = *(_DWORD *)(v33 + v32);
                v32 += 4;
              }
              while (v22 != v32);
            }
            unsigned int v34 = 0;
LABEL_44:
            sub_24FF6DC40((uint64_t)v3, v27, (uint64_t)v31, v26, v1001, *(unsigned char *)(v1000 + 8), &v1050[15 * v34 - 2]);
            goto LABEL_52;
          }
LABEL_38:
          int v31 = (char *)__p;
          if (v20 >= 1)
          {
            uint64_t v36 = 0;
            uint64_t v37 = v984 + 4 * v29 * v20;
            uint64_t v38 = v984 + 4 * v30 * v26;
            do
            {
              int v39 = *(_DWORD *)(v37 + v36);
              int v40 = *(_DWORD *)(v38 + v36);
              BOOL v41 = __OFADD__(v40, v39);
              int v42 = v40 + v39;
              if (v42 < 0 != v41) {
                ++v42;
              }
              *(_DWORD *)&v31[v36] = v42 >> 1;
              v36 += 4;
            }
            while (v22 != v36);
          }
          unsigned int v34 = 1;
          goto LABEL_44;
        }
LABEL_52:
        ++v21;
        unint64_t v3 = v1009;
        if (v21 == v977)
        {
LABEL_53:
          if (__p)
          {
            v1047 = __p;
            operator delete(__p);
          }
          for (unint64_t i = 0; i != -240; i -= 120)
          {
            unsigned int v49 = &v1050[i / 8 - 2];
            uint64_t v50 = *(void **)((char *)&v1062 + i + 8);
            if (v50)
            {
              v49[28] = v50;
              operator delete(v50);
            }
            uint64_t v51 = v49[24];
            if (v51)
            {
              *(void *)((char *)&v1061 + i + 8) = v51;
              operator delete(v51);
            }
            uint64_t v52 = &v1050[i / 8 - 2];
            int v53 = *(void **)((char *)&v1059 + i + 8);
            if (v53)
            {
              v52[22] = v53;
              operator delete(v53);
            }
            unsigned int v54 = v52[18];
            if (v54)
            {
              *(void *)((char *)&v1058 + i + 8) = v54;
              operator delete(v54);
            }
            unint64_t v55 = v49[15];
            if (v55)
            {
              *(void *)((char *)&v1057 + i) = v55;
              operator delete(v55);
            }
          }
          return 0;
        }
      }
      uint64_t v27 = v984 + 4 * (int)v24 * v20;
      uint64_t v35 = (int *)(*((void *)v3 + 17) + 12 * (int)v24);
      int v29 = *v35;
      int v30 = v35[1];
      if (v30 == -1)
      {
        int v26 = v966;
        if (v29 == -1) {
          goto LABEL_46;
        }
        goto LABEL_32;
      }
      int v26 = v966;
      goto LABEL_38;
    case 1:
      uint64_t v260 = 0;
      uint64_t v974 = *v3;
      v1004 = v3 + 750;
      unint64_t v261 = (int)v3[780];
      uint64_t v262 = v3[780];
      uint64_t v980 = *((void *)v3 + 384);
      uint64_t v1071 = 0;
      long long v1069 = 0u;
      long long v1070 = 0u;
      long long v1067 = 0u;
      long long v1068 = 0u;
      long long v1065 = 0u;
      long long v1066 = 0u;
      long long v1063 = 0u;
      long long v1064 = 0u;
      long long v1061 = 0u;
      long long v1062 = 0u;
      long long v1059 = 0u;
      long long v1060 = 0u;
      long long v1057 = 0u;
      long long v1058 = 0u;
      *(_OWORD *)v1055 = 0u;
      long long v1056 = 0u;
      *(_OWORD *)v1053 = 0u;
      long long v1054 = 0u;
      long long v1051 = 0u;
      *(_OWORD *)v1052 = 0u;
      long long __b = 0u;
      *(_OWORD *)v1050 = 0u;
      do
      {
        sub_24FF60D8C((uint64_t)&v1050[v260 - 2], v262);
        v260 += 15;
      }
      while (v260 != 45);
      LODWORD(v1044) = 0;
      int v968 = v261;
      sub_24FF6A454(&__p, v261, &v1044);
      if ((int)v974 < 1) {
        goto LABEL_1257;
      }
      uint64_t v263 = 0;
      uint64_t v264 = 4 * v262;
      int v987 = *(_DWORD *)(v1000 + 16);
      uint64_t v265 = (uint64_t)(v3 + 890);
      do
      {
        uint64_t v266 = *(int *)(*((void *)v3 + 11) + 4 * v263);
        if (!v987 || *(unsigned char *)(*((void *)v1009 + 387) + v266))
        {
          uint64_t v996 = v980 + 4 * (int)v266 * (int)v262;
          uint64_t v267 = (int *)(*((void *)v1009 + 17) + 12 * (int)v266);
          uint64_t v268 = *v267;
          uint64_t v269 = v267[1];
          uint64_t v270 = v267[2];
          if (v270 != -1)
          {
            if (!v987
              || (uint64_t v271 = *((void *)v1009 + 387), *(unsigned char *)(v271 + v268))
              && *(unsigned char *)(v271 + v269)
              && *(unsigned char *)(v271 + v270))
            {
              int v272 = (char *)__p;
              int v273 = v968;
              if ((int)v262 >= 1)
              {
                uint64_t v274 = 0;
                uint64_t v275 = v980 + 4 * (int)v268 * v968;
                uint64_t v276 = v980 + 4 * (int)v269 * (int)v262;
                uint64_t v277 = v980 + 4 * (int)v270 * v968;
                do
                {
                  *(_DWORD *)&v272[v274] = *(_DWORD *)(v276 + v274)
                                         + *(_DWORD *)(v275 + v274)
                                         - *(_DWORD *)(v277 + v274);
                  v274 += 4;
                }
                while (v264 != v274);
              }
              unsigned int v278 = 2;
LABEL_324:
              sub_24FF6DC40((uint64_t)v1009, v996, (uint64_t)v272, v273, v1004, *(unsigned char *)(v1000 + 8), &v1050[15 * v278 - 2]);
              goto LABEL_325;
            }
          }
          int v273 = v968;
          if (v269 != -1)
          {
            if (!v987 || (uint64_t v279 = *((void *)v1009 + 387), *(unsigned char *)(v279 + v268)) && *(unsigned char *)(v279 + v269))
            {
              int v272 = (char *)__p;
              if (v968 >= 1)
              {
                uint64_t v280 = 0;
                uint64_t v281 = v980 + 4 * (int)v268 * (int)v262;
                uint64_t v282 = v980 + 4 * (int)v269 * v968;
                do
                {
                  int v283 = *(_DWORD *)(v281 + v280);
                  int v284 = *(_DWORD *)(v282 + v280);
                  BOOL v41 = __OFADD__(v284, v283);
                  int v285 = v284 + v283;
                  if (v285 < 0 != v41) {
                    ++v285;
                  }
                  *(_DWORD *)&v272[v280] = v285 >> 1;
                  v280 += 4;
                }
                while (v264 != v280);
              }
              unsigned int v278 = 1;
              goto LABEL_324;
            }
          }
          if (v268 != -1 && (!v987 || *(unsigned char *)(*((void *)v1009 + 387) + v268)))
          {
            int v272 = (char *)__p;
            if ((int)v262 >= 1)
            {
              uint64_t v286 = 0;
              uint64_t v287 = v980 + 4 * (int)v268 * (int)v262;
              do
              {
                *(_DWORD *)&v272[v286] = *(_DWORD *)(v287 + v286);
                v286 += 4;
              }
              while (v264 != v286);
            }
            unsigned int v278 = 0;
            goto LABEL_324;
          }
          if (v968 >= 1)
          {
            uint64_t v288 = __p;
            bzero(__p, 4 * v262);
            uint64_t v289 = 0;
            do
            {
              int v290 = *(_DWORD *)(*v1004 + 4 * v289);
              if (v290 >= 1)
              {
                int v291 = 0;
                unsigned int v292 = *(_DWORD *)(v996 + 4 * v289) - v288[v289];
                do
                {
                  LOWORD(v1044) = 0x8000;
                  sub_24FF6DACC(v265, (v292 >> v291++) & 1, &v1044);
                }
                while (v290 != v291);
              }
              ++v289;
            }
            while (v289 != v262);
          }
        }
LABEL_325:
        ++v263;
        unint64_t v3 = v1009;
      }
      while (v263 != v974);
LABEL_1257:
      if (__p)
      {
        v1047 = __p;
        operator delete(__p);
      }
      unint64_t v839 = 360;
      do
      {
        v840 = &v1050[v839 / 8 - 2];
        v841 = *(void **)((char *)&__p + v839);
        if (v841)
        {
          *(v840 - 2) = v841;
          operator delete(v841);
        }
        v842 = *(v840 - 6);
        if (v842)
        {
          v1045[v839 / 8] = v842;
          operator delete(v842);
        }
        v843 = &v1050[v839 / 8 - 2];
        v844 = *(void **)((char *)&v1036 + v839);
        if (v844)
        {
          *(v843 - 8) = v844;
          operator delete(v844);
        }
        v845 = *(v843 - 12);
        if (v845)
        {
          *(void *)((char *)&v1032 + v839) = v845;
          operator delete(v845);
        }
        v846 = *(v840 - 15);
        if (v846)
        {
          *(void *)((char *)&v1026 + v839) = v846;
          operator delete(v846);
        }
        v839 -= 120;
      }
      while (v839);
      return 0;
    case 2:
      uint64_t v56 = 0;
      uint64_t v972 = *v3;
      v1002 = v3 + 750;
      unint64_t v985 = (int)v3[780];
      uint64_t v57 = v3[780];
      uint64_t v978 = *((void *)v3 + 384);
      uint64_t v1071 = 0;
      long long v1069 = 0u;
      long long v1070 = 0u;
      long long v1067 = 0u;
      long long v1068 = 0u;
      long long v1065 = 0u;
      long long v1066 = 0u;
      long long v1063 = 0u;
      long long v1064 = 0u;
      long long v1061 = 0u;
      long long v1062 = 0u;
      long long v1059 = 0u;
      long long v1060 = 0u;
      long long v1057 = 0u;
      long long v1058 = 0u;
      *(_OWORD *)v1055 = 0u;
      long long v1056 = 0u;
      *(_OWORD *)v1053 = 0u;
      long long v1054 = 0u;
      long long v1051 = 0u;
      *(_OWORD *)v1052 = 0u;
      long long __b = 0u;
      *(_OWORD *)v1050 = 0u;
      do
      {
        sub_24FF60D8C((uint64_t)&v1050[v56 - 2], v57);
        v56 += 15;
      }
      while (v56 != 45);
      memset_pattern16(&v1041, &unk_24FF7D710, 6uLL);
      LODWORD(v1044) = 0;
      sub_24FF6A454(&__p, v985, &v1044);
      LODWORD(v1022) = 0;
      sub_24FF6A454(&v1044, v985, &v1022);
      LODWORD(v1020) = 0;
      sub_24FF6A454(&v1022, v985, &v1020);
      LODWORD(v1018) = 0;
      sub_24FF6A454(&v1020, v985, &v1018);
      LODWORD(v1016) = 0;
      sub_24FF6A454(&v1018, v985, &v1016);
      LODWORD(v1014) = 0;
      sub_24FF6A454(&v1016, v985, &v1014);
      LODWORD(v1012) = 0;
      sub_24FF6A454(&v1014, v985, &v1012);
      int v1010 = 0;
      sub_24FF6A454(&v1012, v985, &v1010);
      if ((int)v972 < 1) {
        goto LABEL_1286;
      }
      uint64_t v58 = 0;
      int v994 = *(_DWORD *)(v2 + 16);
      uint64_t v59 = (uint64_t)(v3 + 890);
      while (1)
      {
        uint64_t v60 = *(int *)(*((void *)v3 + 11) + 4 * v58);
        if (v994 && !*(unsigned char *)(*((void *)v1009 + 387) + v60)) {
          goto LABEL_154;
        }
        uint64_t v61 = (int *)(*((void *)v1009 + 17) + 12 * (int)v60);
        uint64_t v63 = *v61;
        uint64_t v62 = v61[1];
        uint64_t v64 = v61[2];
        unint64_t v65 = __p;
        if (v64 != -1
          && (!v994
           || (uint64_t v66 = *((void *)v1009 + 387), *(unsigned char *)(v66 + v63)) && *(unsigned char *)(v66 + v62) && *(unsigned char *)(v66 + v64)))
        {
          int v67 = v985;
          uint64_t v68 = 4 * v57;
          if ((int)v57 >= 1)
          {
            long long v69 = (int *)(v978 + 4 * (int)v63 * (int)v985);
            long long v70 = (int *)(v978 + 4 * (int)v62 * (int)v57);
            long long v71 = (int *)(v978 + 4 * (int)v64 * (int)v985);
            int v72 = __p;
            uint64_t v73 = v57;
            do
            {
              int v75 = *v69++;
              int v74 = v75;
              int v76 = *v70++;
              int v77 = v76 + v74;
              int v78 = *v71++;
              *v72++ = v77 - v78;
              --v73;
            }
            while (v73);
          }
          LODWORD(v79) = 0;
          unsigned int v80 = 2;
          int v81 = 2;
        }
        else
        {
          int v67 = v985;
          uint64_t v68 = 4 * v57;
          if (v62 == -1
            || v994 && ((uint64_t v82 = *((void *)v1009 + 387), !*(unsigned char *)(v82 + v63)) || !*(unsigned char *)(v82 + v62)))
          {
            if (v63 == -1 || v994 && !*(unsigned char *)(*((void *)v1009 + 387) + v63))
            {
              if ((int)v985 >= 1)
              {
                uint64_t v94 = v64;
                bzero(__p, 4 * v57);
                uint64_t v64 = v94;
                int v67 = v985;
              }
              unsigned int v80 = 0;
              int v81 = -1;
              LODWORD(v79) = 1;
            }
            else if ((int)v57 < 1)
            {
              unsigned int v80 = 0;
              LODWORD(v79) = 0;
              int v81 = 0;
            }
            else
            {
              uint64_t v90 = (int *)(v978 + 4 * (int)v63 * (int)v57);
              int v91 = __p;
              uint64_t v92 = v57;
              do
              {
                int v93 = *v90++;
                *v91++ = v93;
                --v92;
              }
              while (v92);
              unsigned int v80 = 0;
              LODWORD(v79) = 0;
              int v81 = 0;
            }
          }
          else if ((int)v985 < 1)
          {
            LODWORD(v79) = 0;
            unsigned int v80 = 1;
            int v81 = 1;
          }
          else
          {
            int v83 = (int *)(v978 + 4 * (int)v63 * (int)v57);
            unint64_t v84 = (int *)(v978 + 4 * (int)v62 * (int)v985);
            uint32x2_t v85 = (int *)__p;
            uint64_t v79 = v57;
            do
            {
              int v87 = *v83++;
              int v86 = v87;
              int v88 = *v84++;
              BOOL v41 = __OFADD__(v88, v86);
              int v89 = v88 + v86;
              if (v89 < 0 != v41) {
                ++v89;
              }
              *v85++ = v89 >> 1;
              --v79;
            }
            while (v79);
            unsigned int v80 = 1;
            int v81 = 1;
          }
        }
        uint64_t v95 = v978 + 4 * (int)v60 * (int)v57;
        uint64_t v96 = (int *)(*((void *)v1009 + 20) + 12 * (int)v60);
        uint64_t v97 = v96[2];
        if (v97 != -1)
        {
          uint64_t v98 = *v96;
          uint64_t v99 = v96[1];
          if (!v994) {
            break;
          }
          uint64_t v100 = *((void *)v1009 + 387);
          if (*(unsigned char *)(v100 + v63))
          {
            if (*(unsigned char *)(v100 + v62)
              && *(unsigned char *)(v100 + v64)
              && *(unsigned char *)(v100 + v98)
              && *(unsigned char *)(v100 + v99)
              && *(unsigned char *)(v100 + v97))
            {
              break;
            }
          }
        }
        uint64_t v130 = v1000;
        if (v79) {
          goto LABEL_131;
        }
LABEL_153:
        sub_24FF6DC40((uint64_t)v1009, v95, (uint64_t)v65, v67, v1002, *(unsigned char *)(v130 + 8), &v1050[15 * v81 - 2]);
LABEL_154:
        ++v58;
        unint64_t v3 = v1009;
        if (v58 == v972)
        {
LABEL_1286:
          if (v1012)
          {
            v1013 = v1012;
            operator delete(v1012);
          }
          if (v1014)
          {
            v1015 = v1014;
            operator delete(v1014);
          }
          if (v1016)
          {
            v1017 = v1016;
            operator delete(v1016);
          }
          if (v1018)
          {
            v1019 = v1018;
            operator delete(v1018);
          }
          if (v1020)
          {
            v1021 = v1020;
            operator delete(v1020);
          }
          if (v1022)
          {
            v1023 = v1022;
            operator delete(v1022);
          }
          if (v1044)
          {
            v1045[0] = v1044;
            operator delete(v1044);
          }
          if (__p)
          {
            v1047 = __p;
            operator delete(__p);
          }
          unint64_t v855 = 360;
          do
          {
            v856 = &v1050[v855 / 8 - 2];
            v857 = *(void **)((char *)&__p + v855);
            if (v857)
            {
              *(v856 - 2) = v857;
              operator delete(v857);
            }
            v858 = *(v856 - 6);
            if (v858)
            {
              v1045[v855 / 8] = v858;
              operator delete(v858);
            }
            v859 = &v1050[v855 / 8 - 2];
            v860 = *(void **)((char *)&v1036 + v855);
            if (v860)
            {
              *(v859 - 8) = v860;
              operator delete(v860);
            }
            v861 = *(v859 - 12);
            if (v861)
            {
              *(void *)((char *)&v1032 + v855) = v861;
              operator delete(v861);
            }
            v862 = *(v856 - 15);
            if (v862)
            {
              *(void *)((char *)&v1026 + v855) = v862;
              operator delete(v862);
            }
            v855 -= 120;
          }
          while (v855);
          return 0;
        }
      }
      int v962 = v79;
      int v954 = v81;
      if ((int)v57 < 1)
      {
        signed int v129 = *(unsigned __int8 *)(v1000 + 24);
        if (!*(unsigned char *)(v1000 + 24))
        {
          signed int v123 = 0;
          signed int v125 = 0;
          signed int v127 = 0;
          goto LABEL_141;
        }
        unsigned int v111 = (int *)v1018;
        int v112 = (int *)v1016;
        uint64_t v113 = (int *)v1014;
        uint64_t v114 = (int *)v1012;
      }
      else
      {
        unint64_t v101 = 0;
        uint64_t v102 = v978 + 4 * (int)v63 * v67;
        uint64_t v103 = v978 + 4 * (int)v62 * (int)v57;
        uint64_t v104 = v978 + 4 * (int)v64 * v67;
        uint64_t v105 = v978 + 4 * (int)v98 * (int)v57;
        uint64_t v106 = v978 + 4 * (int)v99 * v67;
        uint64_t v107 = v978 + 4 * (int)v97 * (int)v57;
        unint64_t v108 = (char *)v1044;
        unsigned int v109 = (char *)v1022;
        unsigned int v110 = (char *)v1020;
        unsigned int v111 = (int *)v1018;
        int v112 = (int *)v1016;
        uint64_t v113 = (int *)v1014;
        uint64_t v114 = (int *)v1012;
        do
        {
          *(_DWORD *)&v108[v101] = *(_DWORD *)(v106 + v101) + *(_DWORD *)(v105 + v101) - *(_DWORD *)(v107 + v101);
          int v115 = *(_DWORD *)(v102 + v101);
          int v116 = *(_DWORD *)(v105 + v101);
          int v117 = v116 + v115;
          if (v116 + v115 < 0 != __OFADD__(v116, v115)) {
            ++v117;
          }
          *(_DWORD *)&v109[v101] = *(_DWORD *)(v106 + v101) + *(_DWORD *)(v103 + v101) - (v117 >> 1);
          int v118 = *(_DWORD *)(v102 + v101);
          int v119 = *(_DWORD *)(v105 + v101);
          BOOL v41 = __OFADD__(v119, v118);
          int v120 = v119 + v118;
          if (v120 < 0 != v41) {
            ++v120;
          }
          unint64_t v121 = 1431655766
               * ((v120 >> 1)
                - (*(_DWORD *)(v104 + v101)
                 + *(_DWORD *)(v107 + v101))
                + 2 * (*(_DWORD *)(v106 + v101) + *(_DWORD *)(v103 + v101)));
          *(_DWORD *)&v110[v101] = HIDWORD(v121) + (v121 >> 63);
          v111[v101 / 4] = *(_DWORD *)(v95 + v101) - v65[v101 / 4];
          v112[v101 / 4] = *(_DWORD *)(v95 + v101) - *(_DWORD *)&v108[v101];
          v113[v101 / 4] = *(_DWORD *)(v95 + v101) - *(_DWORD *)&v109[v101];
          v114[v101 / 4] = *(_DWORD *)(v95 + v101) - *(_DWORD *)&v110[v101];
          v101 += 4;
        }
        while (v68 != v101);
        if (!*(unsigned char *)(v1000 + 24))
        {
          int v122 = *v111;
          if (*v111 < 0) {
            int v122 = -v122;
          }
          signed int v123 = -(v67 * __clz(v122 + 1));
          int v124 = *v112;
          if (*v112 < 0) {
            int v124 = -v124;
          }
          signed int v125 = -(v57 * __clz(v124 + 1));
          int v126 = *v113;
          if (*v113 < 0) {
            int v126 = -v126;
          }
          signed int v127 = -(v67 * __clz(v126 + 1));
          int v128 = *v114;
          if (*v114 < 0) {
            int v128 = -v128;
          }
          signed int v129 = -(v57 * __clz(v128 + 1));
LABEL_141:
          if (v123 <= v125 && v123 <= v127 && v123 <= v129)
          {
            int v138 = 0;
            int v139 = 0;
LABEL_145:
            uint64_t v140 = 1;
            goto LABEL_152;
          }
          if (v125 > v127 || v125 > v129)
          {
            if (v127 <= v129)
            {
              int v139 = 0;
              int v138 = 1;
              unint64_t v65 = v1022;
              goto LABEL_145;
            }
            int v138 = 1;
            unint64_t v65 = v1020;
            int v139 = 1;
          }
          else
          {
            int v138 = 0;
            int v139 = 1;
            unint64_t v65 = v1044;
          }
          uint64_t v140 = 2;
LABEL_152:
          uint64_t v130 = v1000;
          sub_24FF6DACC(v59, v139, &v1041);
          sub_24FF6DACC(v59, v138, &v1041 + v140);
          int v67 = v985;
          int v81 = v954;
          if (v962)
          {
LABEL_131:
            if (v67 >= 1)
            {
              uint64_t v131 = 0;
              do
              {
                int v132 = *(_DWORD *)(*v1002 + 4 * v131);
                if (v132 >= 1)
                {
                  int v133 = 0;
                  unsigned int v134 = *(_DWORD *)(v95 + 4 * v131) - v65[v131];
                  do
                  {
                    LOWORD(v1010) = 0x8000;
                    sub_24FF6DACC(v59, (v134 >> v133++) & 1, &v1010);
                  }
                  while (v132 != v133);
                }
                ++v131;
              }
              while (v131 != v57);
            }
            goto LABEL_154;
          }
          goto LABEL_153;
        }
      }
      v907 = (unsigned __int16 **)&v1050[15 * v80 - 2];
      int v903 = *(unsigned __int8 *)(v1000 + 8);
      uint64_t v949 = v1041;
      int v135 = *(_DWORD *)((char *)&unk_24FF7D720 + (((v1041 + 2048) >> 10) & 0x7CLL));
      int v940 = v135;
      size_t v925 = v1042;
      int v931 = *(_DWORD *)((char *)&unk_24FF7D720 + (((v1042 + 2048) >> 10) & 0x7CLL));
      signed int v932 = v931 + v135 + sub_24FF7C6B0(v111, v57, v903, v907);
      LODWORD(v949) = *(_DWORD *)((char *)&unk_24FF7D720
                                + (((unint64_t)(67584 - v949) >> 10) & 0x3FFFFFFFFFFFFCLL));
      uint64_t v918 = v1043;
      int v911 = *(_DWORD *)((char *)&unk_24FF7D720 + (((v1043 + 2048) >> 10) & 0x7CLL));
      signed int v912 = v911 + sub_24FF7C6B0(v112, v985, v903, v907) + v949;
      LODWORD(v925) = *(_DWORD *)((char *)&unk_24FF7D720 + (((67584 - v925) >> 10) & 0x3FFFFFFFFFFFFCLL));
      int v900 = sub_24FF7C6B0(v113, v57, v903, v907);
      int v136 = *(_DWORD *)((char *)&unk_24FF7D720 + (((unint64_t)(67584 - v918) >> 10) & 0x3FFFFFFFFFFFFCLL));
      int v137 = sub_24FF7C6B0(v114, v985, v903, v907);
      signed int v125 = v912;
      signed int v123 = v932;
      signed int v127 = v925 + v940 + v900;
      signed int v129 = v136 + v949 + v137;
      goto LABEL_141;
    case 3:
      uint64_t v293 = 0;
      uint64_t v975 = *v3;
      v981 = v3 + 750;
      unint64_t v294 = (int)v3[780];
      size_t v295 = v3[780];
      uint64_t v296 = *((void *)v3 + 384);
      uint64_t v1071 = 0;
      long long v1069 = 0u;
      long long v1070 = 0u;
      long long v1067 = 0u;
      long long v1068 = 0u;
      long long v1065 = 0u;
      long long v1066 = 0u;
      long long v1063 = 0u;
      long long v1064 = 0u;
      long long v1061 = 0u;
      long long v1062 = 0u;
      long long v1059 = 0u;
      long long v1060 = 0u;
      long long v1057 = 0u;
      long long v1058 = 0u;
      *(_OWORD *)v1055 = 0u;
      long long v1056 = 0u;
      *(_OWORD *)v1053 = 0u;
      long long v1054 = 0u;
      long long v1051 = 0u;
      *(_OWORD *)v1052 = 0u;
      long long __b = 0u;
      *(_OWORD *)v1050 = 0u;
      do
      {
        sub_24FF60D8C((uint64_t)&v1050[v293 - 2], v295);
        v293 += 15;
      }
      while (v293 != 45);
      LOWORD(v1020) = 0x8000;
      LODWORD(v1044) = 0;
      sub_24FF6A454(&__p, v294, &v1044);
      LODWORD(v1022) = 0;
      int v964 = v294;
      sub_24FF6A454(&v1044, v294, &v1022);
      if ((int)v975 < 1) {
        goto LABEL_390;
      }
      uint64_t v297 = 0;
      uint64_t v298 = (uint64_t)(v3 + 890);
      int v988 = *(_DWORD *)(v1000 + 16);
      uint64_t v944 = 4 * v295;
      size_t v969 = v295;
      while (1)
      {
        uint64_t v299 = *(int *)(*((void *)v3 + 11) + 4 * v297);
        unint64_t v300 = v981;
        if (v988 && !*(unsigned char *)(*((void *)v1009 + 387) + v299)) {
          goto LABEL_389;
        }
        v997 = (int *)(v296 + 4 * (int)v299 * (int)v295);
        int v301 = (int *)(*((void *)v1009 + 17) + 12 * v299);
        uint64_t v302 = *v301;
        uint64_t v303 = v301[1];
        uint64_t v304 = v301[2];
        v1005 = __p;
        unsigned int v305 = (int *)(*((void *)v1009 + 20) + 12 * v299);
        uint64_t v306 = v305[2];
        if (v306 != -1
          && ((v308 = *v305, uint64_t v307 = v305[1], !v988)
           || (uint64_t v309 = *((void *)v1009 + 387), *(unsigned char *)(v309 + v302))
           && *(unsigned char *)(v309 + v303)
           && *(unsigned char *)(v309 + v304)
           && *(unsigned char *)(v309 + v308)
           && *(unsigned char *)(v309 + v307)
           && *(unsigned char *)(v309 + v306)))
        {
          int v957 = v307;
          int v310 = v964;
          sub_24FF56E70((int *)(v296 + 4 * (int)v302 * v964), (int *)(v296 + 4 * (int)v303 * (int)v969), (int *)(v296 + 4 * (int)v304 * v964), v964, (int *)(*((void *)v1009 + 23) + 12 * (int)v302), (int *)(*((void *)v1009 + 23) + 12 * (int)v303), (int *)(*((void *)v1009 + 23) + 12 * (int)v304), (int *)(*((void *)v1009 + 23) + 12 * (int)v299), __p);
          sub_24FF56E70((int *)(v296 + 4 * (int)v308 * (int)v969), (int *)(v296 + 4 * v957 * v964), (int *)(v296 + 4 * (int)v306 * (int)v969), v969, (int *)(*((void *)v1009 + 23) + 12 * (int)v308), (int *)(*((void *)v1009 + 23) + 12 * v957), (int *)(*((void *)v1009 + 23) + 12 * (int)v306), (int *)(*((void *)v1009 + 23) + 12 * (int)v299), v1044);
          if (v964 < 1)
          {
            unsigned int v316 = 2;
            unint64_t v300 = v981;
            LODWORD(v295) = v969;
          }
          else
          {
            uint64_t v311 = (int *)__p;
            uint64_t v312 = (int *)v1044;
            LODWORD(v295) = v969;
            size_t v313 = v969;
            unint64_t v300 = v981;
            do
            {
              int v314 = *v312++;
              int v315 = v314 + *v311;
              if (v315 < 0 != __OFADD__(v314, *v311)) {
                ++v315;
              }
              *v311++ = v315 >> 1;
              --v313;
            }
            while (v313);
            unsigned int v316 = 2;
          }
        }
        else
        {
          LODWORD(v295) = v969;
          if (v304 != -1
            && (!v988
             || (uint64_t v317 = *((void *)v1009 + 387), *(unsigned char *)(v317 + v302))
             && *(unsigned char *)(v317 + v303)
             && *(unsigned char *)(v317 + v304)))
          {
            int v310 = v964;
            sub_24FF56E70((int *)(v296 + 4 * (int)v302 * v964), (int *)(v296 + 4 * (int)v303 * (int)v969), (int *)(v296 + 4 * (int)v304 * v964), v964, (int *)(*((void *)v1009 + 23) + 12 * (int)v302), (int *)(*((void *)v1009 + 23) + 12 * (int)v303), (int *)(*((void *)v1009 + 23) + 12 * (int)v304), (int *)(*((void *)v1009 + 23) + 12 * (int)v299), __p);
            unsigned int v316 = 2;
            unint64_t v300 = v981;
          }
          else
          {
            if (v303 == -1
              || v988 && ((uint64_t v318 = *((void *)v1009 + 387), !*(unsigned char *)(v318 + v302)) || !*(unsigned char *)(v318 + v303)))
            {
              if (v302 == -1 || v988 && !*(unsigned char *)(*((void *)v1009 + 387) + v302))
              {
                if ((int)v969 >= 1)
                {
                  bzero(__p, v944);
                  for (uint64_t j = 0; j != v969; ++j)
                  {
                    int v324 = *(_DWORD *)(*v981 + 4 * j);
                    if (v324 >= 1)
                    {
                      int v325 = 0;
                      unsigned int v326 = v997[j] - v1005[j];
                      do
                      {
                        LOWORD(v1022) = 0x8000;
                        sub_24FF6DACC(v298, (v326 >> v325++) & 1, &v1022);
                      }
                      while (v324 != v325);
                    }
                  }
                }
                goto LABEL_389;
              }
              int v310 = v964;
              if (v964 >= 1)
              {
                uint64_t v319 = (int *)(v296 + 4 * (int)v302 * (int)v969);
                int v320 = __p;
                size_t v321 = v969;
                do
                {
                  int v322 = *v319++;
                  *v320++ = v322;
                  --v321;
                }
                while (v321);
              }
              unsigned int v316 = 0;
              goto LABEL_388;
            }
            if (v969 == 2)
            {
              LODWORD(v1022) = 0;
              sub_24FF57110((int *)(v296 + 8 * v302), (int *)(v296 + 8 * v303), v997, (_DWORD *)(*((void *)v1009 + 23) + 12 * (int)v302), (_DWORD *)(*((void *)v1009 + 23) + 12 * (int)v303), (int *)(*((void *)v1009 + 23) + 12 * (int)v299), (int *)__p, &v1022);
              sub_24FF6DACC(v298, v1022 != 0, &v1020);
            }
            else if ((int)v969 >= 1)
            {
              uint64_t v327 = (int *)(v296 + 4 * (int)v302 * (int)v969);
              int v310 = v964;
              int v328 = (int *)(v296 + 4 * (int)v303 * v964);
              v329 = (int *)__p;
              size_t v330 = v969;
              do
              {
                int v332 = *v327++;
                int v331 = v332;
                int v333 = *v328++;
                BOOL v41 = __OFADD__(v333, v331);
                int v334 = v333 + v331;
                if (v334 < 0 != v41) {
                  ++v334;
                }
                *v329++ = v334 >> 1;
                --v330;
              }
              while (v330);
              unsigned int v316 = 1;
              goto LABEL_388;
            }
            unsigned int v316 = 1;
            int v310 = v964;
          }
        }
LABEL_388:
        sub_24FF6DC40((uint64_t)v1009, (uint64_t)v997, (uint64_t)v1005, v310, v300, *(unsigned char *)(v1000 + 8), &v1050[15 * v316 - 2]);
LABEL_389:
        ++v297;
        unint64_t v3 = v1009;
        if (v297 == v975)
        {
LABEL_390:
          if (v1044)
          {
            v1045[0] = v1044;
            operator delete(v1044);
          }
          if (__p)
          {
            v1047 = __p;
            operator delete(__p);
          }
          unint64_t v335 = 360;
          do
          {
            uint64_t v336 = &v1050[v335 / 8 - 2];
            int v337 = *(void **)((char *)&__p + v335);
            if (v337)
            {
              *(v336 - 2) = v337;
              operator delete(v337);
            }
            int v338 = *(v336 - 6);
            if (v338)
            {
              v1045[v335 / 8] = v338;
              operator delete(v338);
            }
            v339 = &v1050[v335 / 8 - 2];
            uint64_t v340 = *(void **)((char *)&v1036 + v335);
            if (v340)
            {
              *(v339 - 8) = v340;
              operator delete(v340);
            }
            BOOL v341 = *(v339 - 12);
            if (v341)
            {
              *(void *)((char *)&v1032 + v335) = v341;
              operator delete(v341);
            }
            uint64_t v342 = *(v336 - 15);
            if (v342)
            {
              *(void *)((char *)&v1026 + v335) = v342;
              operator delete(v342);
            }
            v335 -= 120;
          }
          while (v335);
          return 0;
        }
      }
    case 4:
      uint64_t v141 = 0;
      uint64_t v963 = *v3;
      v995 = v3 + 750;
      unint64_t v142 = (int)v3[780];
      uint64_t v143 = (void *)v3[780];
      uint64_t v979 = *((void *)v3 + 384);
      uint64_t v1071 = 0;
      long long v1069 = 0u;
      long long v1070 = 0u;
      long long v1067 = 0u;
      long long v1068 = 0u;
      long long v1065 = 0u;
      long long v1066 = 0u;
      long long v1063 = 0u;
      long long v1064 = 0u;
      long long v1061 = 0u;
      long long v1062 = 0u;
      long long v1059 = 0u;
      long long v1060 = 0u;
      long long v1057 = 0u;
      long long v1058 = 0u;
      *(_OWORD *)v1055 = 0u;
      long long v1056 = 0u;
      *(_OWORD *)v1053 = 0u;
      long long v1054 = 0u;
      long long v1051 = 0u;
      *(_OWORD *)v1052 = 0u;
      long long __b = 0u;
      *(_OWORD *)v1050 = 0u;
      v1003 = v143;
      do
      {
        sub_24FF60D8C((uint64_t)&v1050[v141 - 2], (int)v143);
        v141 += 15;
        LODWORD(v143) = v1003;
      }
      while (v141 != 45);
      LOWORD(v1037) = 0x8000;
      memset_pattern16(&v1041, &unk_24FF7D710, 6uLL);
      memset_pattern16(&v1010, &unk_24FF7D710, 6uLL);
      LODWORD(v1044) = 0;
      sub_24FF6A454(&__p, v142, &v1044);
      LODWORD(v1022) = 0;
      sub_24FF6A454(&v1044, v142, &v1022);
      LODWORD(v1020) = 0;
      sub_24FF6A454(&v1022, v142, &v1020);
      LODWORD(v1018) = 0;
      sub_24FF6A454(&v1020, v142, &v1018);
      LODWORD(v1016) = 0;
      sub_24FF6A454(&v1018, v142, &v1016);
      LODWORD(v1014) = 0;
      sub_24FF6A454(&v1016, v142, &v1014);
      LODWORD(v1012) = 0;
      sub_24FF6A454(&v1014, v142, &v1012);
      int v1038 = 0;
      int v973 = v142;
      sub_24FF6A454(&v1012, v142, &v1038);
      int v144 = (int)v1003;
      if ((int)v963 < 1) {
        goto LABEL_1315;
      }
      size_t v145 = 0;
      int v986 = *(_DWORD *)(v2 + 16);
      uint64_t v146 = (uint64_t)(v3 + 890);
      uint64_t v926 = 4 * (void)v1003;
      while (1)
      {
        uint64_t v147 = *(int *)(*((void *)v3 + 11) + 4 * v145);
        if (v986 && !*(unsigned char *)(*((void *)v3 + 387) + v147)) {
          goto LABEL_288;
        }
        uint64_t v148 = (int *)(v979 + 4 * (int)v147 * v144);
        uint64_t v149 = (int *)(*((void *)v3 + 17) + 12 * v147);
        uint64_t v151 = *v149;
        uint64_t v150 = v149[1];
        uint64_t v152 = v149[2];
        uint64_t v153 = (char *)__p;
        uint64_t v154 = (int *)(*((void *)v3 + 20) + 12 * v147);
        uint64_t v155 = v154[2];
        if (v155 != -1)
        {
          uint64_t v157 = *v154;
          uint64_t v156 = v154[1];
          if (!v986) {
            break;
          }
          uint64_t v158 = *((void *)v1009 + 387);
          if (*(unsigned char *)(v158 + v151))
          {
            if (*(unsigned char *)(v158 + v150)
              && *(unsigned char *)(v158 + v152)
              && *(unsigned char *)(v158 + v157)
              && *(unsigned char *)(v158 + v156)
              && *(unsigned char *)(v158 + v155))
            {
              break;
            }
          }
        }
        unint64_t v3 = v1009;
        if (v152 != -1)
        {
          if (!v986
            || (uint64_t v178 = *((void *)v1009 + 387), *(unsigned char *)(v178 + v151))
            && *(unsigned char *)(v178 + v150)
            && *(unsigned char *)(v178 + v152))
          {
            v956 = (char *)__p;
            uint64_t v179 = (int *)(v979 + 4 * (int)v151 * v973);
            v180 = (int *)(v979 + 4 * (int)v150 * v144);
            int v181 = (int *)(v979 + 4 * (int)v152 * v973);
            int v182 = v150;
            int v183 = v147;
            sub_24FF56E70(v179, v180, v181, v973, (int *)(*((void *)v1009 + 23) + 12 * (int)v151), (int *)(*((void *)v1009 + 23) + 12 * (int)v150), (int *)(*((void *)v1009 + 23) + 12 * (int)v152), (int *)(*((void *)v1009 + 23) + 12 * (int)v147), v1044);
            size_t v967 = v145;
            if (v973 == 2)
            {
              sub_24FF5756C((unint64_t)v179, v180, v181, (_DWORD *)(*((void *)v1009 + 23) + 12 * (int)v151), (_DWORD *)(*((void *)v1009 + 23) + 12 * v182), (int *)(*((void *)v1009 + 23) + 12 * v183), (int *)v1020);
              v184 = v1020;
              uint64_t v2 = v1000;
              uint64_t v185 = v1003;
LABEL_213:
              int v196 = 0;
              int v197 = __p;
              int v198 = v1044;
              int v199 = v1022;
              int v200 = (int *)v1018;
              unsigned int v201 = (int *)v1016;
              unsigned int v202 = (int *)v1014;
              unsigned int v203 = (int *)v1012;
              do
              {
                int v204 = v180[(void)v196] + v179[(void)v196] - v181[(void)v196];
                v197[(void)v196] = v204;
                int v205 = v198[(void)v196];
                BOOL v41 = __OFADD__(v205, v204);
                int v206 = v205 + v204;
                if (v206 < 0 != v41) {
                  ++v206;
                }
                v199[(void)v196] = v206 >> 1;
                v200[(void)v196] = v148[(void)v196] - v197[(void)v196];
                v201[(void)v196] = v148[(void)v196] - v198[(void)v196];
                v202[(void)v196] = v148[(void)v196] - v199[(void)v196];
                v203[(void)v196] = v148[(void)v196] - v184[(void)v196];
                int v196 = (char *)v196 + 1;
              }
              while (v185 != v196);
              if (*(unsigned char *)(v2 + 24))
              {
LABEL_218:
                int v207 = *(unsigned __int8 *)(v2 + 8);
                uint64_t v208 = v1041;
                int v209 = *(_DWORD *)((char *)&unk_24FF7D720 + (((v1041 + 2048) >> 10) & 0x7CLL));
                int v951 = v209;
                uint64_t v934 = v1042;
                int v210 = *(_DWORD *)((char *)&unk_24FF7D720 + (((v1042 + 2048) >> 10) & 0x7CLL));
                signed int v942 = v210 + v209 + sub_24FF7C6B0(v200, (int)v185, v207, (unsigned __int16 **)&v1064);
                int v211 = *(_DWORD *)((char *)&unk_24FF7D720
                                 + (((unint64_t)(67584 - v208) >> 10) & 0x3FFFFFFFFFFFFCLL));
                int v920 = v211;
                uint64_t v212 = v1043;
                LODWORD(v208) = *(_DWORD *)((char *)&unk_24FF7D720 + (((v1043 + 2048) >> 10) & 0x7CLL));
                signed int v913 = v208 + sub_24FF7C6B0(v201, v973, v207, (unsigned __int16 **)&v1064) + v211;
                int v213 = *(_DWORD *)((char *)&unk_24FF7D720
                                 + (((unint64_t)(67584 - v934) >> 10) & 0x3FFFFFFFFFFFFCLL));
                LODWORD(v208) = sub_24FF7C6B0(v202, (int)v1003, v207, (unsigned __int16 **)&v1064);
                LODWORD(v212) = *(_DWORD *)((char *)&unk_24FF7D720
                                          + (((unint64_t)(67584 - v212) >> 10) & 0x3FFFFFFFFFFFFCLL));
                int v214 = sub_24FF7C6B0(v203, v973, v207, (unsigned __int16 **)&v1064);
                signed int v215 = v913;
                signed int v216 = v942;
                signed int v217 = v213 + v951 + v208;
                uint64_t v2 = v1000;
                signed int v218 = v212 + v920 + v214;
                unint64_t v3 = v1009;
                goto LABEL_274;
              }
              if (v973 >= 1)
              {
                int v246 = *v200;
                if (*v200 < 0) {
                  int v246 = -v246;
                }
                signed int v216 = -(v185 * __clz(v246 + 1));
                int v247 = *v201;
                if (*v201 < 0) {
                  int v247 = -v247;
                }
                signed int v215 = -(v973 * __clz(v247 + 1));
                int v248 = *v202;
                if (*v202 < 0) {
                  int v248 = -v248;
                }
                signed int v217 = -(v185 * __clz(v248 + 1));
                int v249 = *v203;
                if (*v203 < 0) {
                  int v249 = -v249;
                }
                signed int v218 = -(v973 * __clz(v249 + 1));
LABEL_274:
                uint64_t v153 = v956;
                if (v216 <= v215 && v216 <= v217 && v216 <= v218)
                {
                  int v254 = 0;
                  int v258 = 0;
                  goto LABEL_278;
                }
                if (v215 <= v217 && v215 <= v218)
                {
                  int v254 = 0;
                  int v258 = 1;
                  uint64_t v153 = (char *)v1044;
                  goto LABEL_284;
                }
                if (v217 <= v218)
                {
                  int v258 = 0;
                  int v254 = 1;
                  uint64_t v153 = (char *)v1022;
LABEL_278:
                  uint64_t v256 = 1;
                }
                else
                {
                  int v254 = 1;
                  uint64_t v153 = (char *)v1020;
                  int v258 = 1;
LABEL_284:
                  uint64_t v256 = 2;
                }
                int v187 = v973;
                sub_24FF6DACC(v146, v258, &v1041);
                int v257 = (int *)&v1041;
LABEL_286:
                sub_24FF6DACC(v146, v254, (_WORD *)v257 + v256);
                unsigned int v189 = 2;
                goto LABEL_287;
              }
              signed int v216 = 0;
              signed int v215 = 0;
              signed int v217 = 0;
            }
            else
            {
              uint64_t v185 = v1003;
              if ((int)v1003 >= 1)
              {
                unint64_t v195 = 0;
                v184 = v1020;
                uint64_t v2 = v1000;
                do
                {
                  v184[v195 / 4] = v180[v195 / 4] + v179[v195 / 4] - v181[v195 / 4];
                  v195 += 4;
                }
                while (v926 != v195);
                goto LABEL_213;
              }
              uint64_t v2 = v1000;
              signed int v217 = *(unsigned __int8 *)(v1000 + 24);
              if (*(unsigned char *)(v1000 + 24))
              {
                int v200 = (int *)v1018;
                unsigned int v201 = (int *)v1016;
                unsigned int v202 = (int *)v1014;
                unsigned int v203 = (int *)v1012;
                goto LABEL_218;
              }
              signed int v216 = 0;
              signed int v215 = 0;
            }
            signed int v218 = 0;
            goto LABEL_274;
          }
        }
        if (v150 == -1
          || v986 && ((uint64_t v186 = *((void *)v1009 + 387), !*(unsigned char *)(v186 + v151)) || !*(unsigned char *)(v186 + v150)))
        {
          if (v151 == -1 || v986 && !*(unsigned char *)(*((void *)v1009 + 387) + v151))
          {
            if (v144 >= 1)
            {
              int v190 = __p;
              bzero(__p, v926);
              int v191 = 0;
              do
              {
                int v192 = *(_DWORD *)(*v995 + 4 * (void)v191);
                if (v192 >= 1)
                {
                  int v193 = 0;
                  unsigned int v194 = v148[(void)v191] - v190[(void)v191];
                  do
                  {
                    LOWORD(v1038) = 0x8000;
                    sub_24FF6DACC(v146, (v194 >> v193++) & 1, &v1038);
                  }
                  while (v192 != v193);
                }
                int v191 = (char *)v191 + 1;
                int v144 = (int)v1003;
              }
              while (v191 != v1003);
            }
            goto LABEL_288;
          }
          size_t v967 = v145;
          int v187 = v973;
          if (v973 >= 1)
          {
            uint64_t v188 = 0;
            do
            {
              *(_DWORD *)&v153[v188] = *(_DWORD *)(v979 + 4 * (int)v151 * v144 + v188);
              v188 += 4;
            }
            while (v926 != v188);
          }
          unsigned int v189 = 0;
          goto LABEL_287;
        }
        size_t v967 = v145;
        if (v144 == 2)
        {
          int v1038 = 0;
          sub_24FF57110((int *)(v979 + 8 * v151), (int *)(v979 + 8 * v150), v148, (_DWORD *)(*((void *)v1009 + 23) + 12 * (int)v151), (_DWORD *)(*((void *)v1009 + 23) + 12 * (int)v150), (int *)(*((void *)v1009 + 23) + 12 * (int)v147), (int *)__p, &v1038);
          sub_24FF6DACC(v146, v1038 != 0, &v1037);
        }
        else if (v144 >= 1)
        {
          uint64_t v224 = 0;
          int v187 = v973;
          uint64_t v225 = v979 + 4 * (int)v151 * v144;
          do
          {
            int v226 = *(_DWORD *)(v225 + v224);
            int v227 = *(_DWORD *)(v979 + 4 * (int)v150 * v973 + v224);
            BOOL v41 = __OFADD__(v227, v226);
            int v228 = v227 + v226;
            if (v228 < 0 != v41) {
              ++v228;
            }
            *(_DWORD *)&v153[v224] = v228 >> 1;
            v224 += 4;
          }
          while (v926 != v224);
          unsigned int v189 = 1;
          goto LABEL_287;
        }
        unsigned int v189 = 1;
        int v187 = v973;
LABEL_287:
        sub_24FF6DC40((uint64_t)v3, (uint64_t)v148, (uint64_t)v153, v187, v995, *(unsigned char *)(v2 + 8), &v1050[15 * v189 - 2]);
        int v144 = (int)v1003;
        size_t v145 = v967;
LABEL_288:
        if (++v145 == v963)
        {
LABEL_1315:
          if (v1012)
          {
            v1013 = v1012;
            operator delete(v1012);
          }
          if (v1014)
          {
            v1015 = v1014;
            operator delete(v1014);
          }
          if (v1016)
          {
            v1017 = v1016;
            operator delete(v1016);
          }
          if (v1018)
          {
            v1019 = v1018;
            operator delete(v1018);
          }
          if (v1020)
          {
            v1021 = v1020;
            operator delete(v1020);
          }
          if (v1022)
          {
            v1023 = v1022;
            operator delete(v1022);
          }
          if (v1044)
          {
            v1045[0] = v1044;
            operator delete(v1044);
          }
          if (__p)
          {
            v1047 = __p;
            operator delete(__p);
          }
          unint64_t v863 = 360;
          do
          {
            v864 = &v1050[v863 / 8 - 2];
            v865 = *(void **)((char *)&__p + v863);
            if (v865)
            {
              *(v864 - 2) = v865;
              operator delete(v865);
            }
            v866 = *(v864 - 6);
            if (v866)
            {
              v1045[v863 / 8] = v866;
              operator delete(v866);
            }
            v867 = &v1050[v863 / 8 - 2];
            v868 = *(void **)((char *)&v1036 + v863);
            if (v868)
            {
              *(v867 - 8) = v868;
              operator delete(v868);
            }
            v869 = *(v867 - 12);
            if (v869)
            {
              *(void *)((char *)&v1032 + v863) = v869;
              operator delete(v869);
            }
            v870 = *(v864 - 15);
            if (v870)
            {
              *(void *)((char *)&v1026 + v863) = v870;
              operator delete(v870);
            }
            v863 -= 120;
          }
          while (v863);
          return 0;
        }
      }
      int v933 = v157;
      int v941 = v156;
      size_t v967 = v145;
      uint64_t v159 = (int *)(v979 + 4 * (int)v150 * v144);
      uint64_t v160 = (int *)(v979 + 4 * (int)v152 * v973);
      v919 = (int *)(v979 + 4 * (int)v151 * v973);
      int v904 = v150;
      int v950 = v147;
      v955 = (char *)__p;
      sub_24FF56E70(v919, v159, v160, v973, (int *)(*((void *)v1009 + 23) + 12 * (int)v151), (int *)(*((void *)v1009 + 23) + 12 * (int)v150), (int *)(*((void *)v1009 + 23) + 12 * (int)v152), (int *)(*((void *)v1009 + 23) + 12 * (int)v147), __p);
      int v161 = (int *)(v979 + 4 * v933 * (int)v1003);
      uint64_t v162 = (int *)(v979 + 4 * v941 * v973);
      int v163 = (int *)(v979 + 4 * (int)v155 * (int)v1003);
      sub_24FF56E70(v161, v162, v163, (int)v1003, (int *)(*((void *)v1009 + 23) + 12 * v933), (int *)(*((void *)v1009 + 23) + 12 * v941), (int *)(*((void *)v1009 + 23) + 12 * (int)v155), (int *)(*((void *)v1009 + 23) + 12 * v950), v1044);
      uint64_t v164 = v1003;
      if (v973 < 1)
      {
        uint64_t v2 = v1000;
        signed int v219 = *(unsigned __int8 *)(v1000 + 24);
        if (!*(unsigned char *)(v1000 + 24))
        {
          signed int v243 = 0;
          signed int v244 = 0;
          signed int v245 = 0;
          int v187 = v973;
          goto LABEL_258;
        }
        uint64_t v220 = (int *)v1018;
        v221 = (int *)v1016;
        uint64_t v222 = (int *)v1014;
        uint64_t v223 = (int *)v1012;
      }
      else
      {
        unint64_t v165 = 0;
        uint64_t v166 = (int *)__p;
        uint64_t v167 = v1044;
        int v168 = v1022;
        do
        {
          int v169 = v166[v165 / 4];
          int v170 = v167[v165 / 4];
          BOOL v41 = __OFADD__(v170, v169);
          int v171 = v170 + v169;
          if (v171 < 0 != v41) {
            ++v171;
          }
          v168[v165 / 4] = v171 >> 1;
          v165 += 4;
        }
        while (v926 != v165);
        if (v1003 == 2)
        {
          sub_24FF5756C((unint64_t)v919, v159, v160, (_DWORD *)(*((void *)v1009 + 23) + 12 * (int)v151), (_DWORD *)(*((void *)v1009 + 23) + 12 * v904), (int *)(*((void *)v1009 + 23) + 12 * v950), v166);
          sub_24FF5756C((unint64_t)v161, v162, v163, (_DWORD *)(*((void *)v1009 + 23) + 12 * v933), (_DWORD *)(*((void *)v1009 + 23) + 12 * v941), (int *)(*((void *)v1009 + 23) + 12 * v950), (int *)v1044);
          uint64_t v166 = (int *)__p;
          uint64_t v167 = v1044;
          unsigned int v172 = v1020;
          int v173 = *(_DWORD *)v1044 + *(_DWORD *)__p;
          if (v173 < 0 != __OFADD__(*(_DWORD *)v1044, *(_DWORD *)__p)) {
            ++v173;
          }
          *(_DWORD *)v1020 = v173 >> 1;
          int v174 = v166[1];
          int v175 = v167[1];
          BOOL v41 = __OFADD__(v175, v174);
          int v176 = v175 + v174;
          if (v176 < 0 != v41) {
            ++v176;
          }
          v172[1] = v176 >> 1;
          int v168 = v1022;
          uint64_t v164 = v1003;
          uint64_t v177 = v979 + 4 * (int)v151 * v973;
        }
        else
        {
          unint64_t v229 = 0;
          unsigned int v172 = v1020;
          uint64_t v177 = v979 + 4 * (int)v151 * v973;
          do
          {
            int v230 = v919[v229 / 4];
            int v231 = v161[v229 / 4];
            BOOL v41 = __OFADD__(v231, v230);
            int v232 = v231 + v230;
            if (v232 < 0 != v41) {
              ++v232;
            }
            unint64_t v233 = 1431655766
                 * ((v232 >> 1) - (v160[v229 / 4] + v163[v229 / 4]) + 2 * (v162[v229 / 4] + v159[v229 / 4]));
            v172[v229 / 4] = HIDWORD(v233) + (v233 >> 63);
            v229 += 4;
          }
          while (v926 != v229);
        }
        uint64_t v234 = 0;
        uint64_t v220 = (int *)v1018;
        v221 = (int *)v1016;
        uint64_t v222 = (int *)v1014;
        uint64_t v223 = (int *)v1012;
        do
        {
          v166[(void)v234] = v159[(void)v234] + *(_DWORD *)(v177 + 4 * (void)v234) - v160[(void)v234];
          v167[(void)v234] = v162[(void)v234] + v161[(void)v234] - v163[(void)v234];
          v220[(void)v234] = v148[(void)v234] - v166[(void)v234];
          v221[(void)v234] = v148[(void)v234] - v167[(void)v234];
          v222[(void)v234] = v148[(void)v234] - v168[(void)v234];
          v223[(void)v234] = v148[(void)v234] - v172[(void)v234];
          uint64_t v234 = (char *)v234 + 1;
        }
        while (v164 != v234);
        uint64_t v2 = v1000;
        if (!*(unsigned char *)(v1000 + 24))
        {
          int v250 = *v220;
          if (*v220 < 0) {
            int v250 = -v250;
          }
          signed int v243 = -(v164 * __clz(v250 + 1));
          int v251 = *v221;
          if (*v221 < 0) {
            int v251 = -v251;
          }
          signed int v244 = -(v973 * __clz(v251 + 1));
          int v252 = *v222;
          int v187 = v973;
          if (v252 < 0) {
            int v252 = -v252;
          }
          signed int v219 = -(v164 * __clz(v252 + 1));
          int v253 = *v223;
          if (*v223 < 0) {
            int v253 = -v253;
          }
          signed int v245 = -(v973 * __clz(v253 + 1));
LABEL_258:
          unint64_t v3 = v1009;
          uint64_t v153 = v955;
          if (v243 <= v244 && v243 <= v219 && v243 <= v245)
          {
            int v254 = 0;
            int v255 = 0;
LABEL_269:
            uint64_t v256 = 1;
            goto LABEL_270;
          }
          if (v244 > v219 || v244 > v245)
          {
            if (v219 <= v245)
            {
              int v255 = 0;
              int v254 = 1;
              uint64_t v153 = (char *)v1022;
              goto LABEL_269;
            }
            int v254 = 1;
            uint64_t v153 = (char *)v1020;
            int v255 = 1;
          }
          else
          {
            int v254 = 0;
            int v255 = 1;
            uint64_t v153 = (char *)v1044;
          }
          uint64_t v256 = 2;
LABEL_270:
          sub_24FF6DACC(v146, v255, &v1010);
          int v257 = &v1010;
          goto LABEL_286;
        }
      }
      int v235 = *(unsigned __int8 *)(v2 + 8);
      uint64_t v236 = (unsigned __int16)v1010;
      int v237 = *(_DWORD *)((char *)&unk_24FF7D720 + ((((unsigned __int16)v1010 + 2048) >> 10) & 0x7CLL));
      int v952 = v237;
      uint64_t v935 = HIWORD(v1010);
      int v238 = *(_DWORD *)((char *)&unk_24FF7D720 + (((HIWORD(v1010) + 2048) >> 10) & 0x7CLL));
      signed int v943 = v238 + v237 + sub_24FF7C6B0(v220, (int)v164, v235, (unsigned __int16 **)&v1064);
      int v239 = *(_DWORD *)((char *)&unk_24FF7D720 + (((unint64_t)(67584 - v236) >> 10) & 0x3FFFFFFFFFFFFCLL));
      uint64_t v240 = v1011;
      LODWORD(v236) = *(_DWORD *)((char *)&unk_24FF7D720 + (((v1011 + 2048) >> 10) & 0x7CLL));
      signed int v914 = v236 + sub_24FF7C6B0(v221, v973, v235, (unsigned __int16 **)&v1064) + v239;
      LODWORD(v935) = *(_DWORD *)((char *)&unk_24FF7D720
                                + (((unint64_t)(67584 - v935) >> 10) & 0x3FFFFFFFFFFFFCLL));
      unsigned int v241 = v222;
      int v187 = v973;
      LODWORD(v236) = sub_24FF7C6B0(v241, (int)v1003, v235, (unsigned __int16 **)&v1064);
      LODWORD(v240) = *(_DWORD *)((char *)&unk_24FF7D720
                                + (((unint64_t)(67584 - v240) >> 10) & 0x3FFFFFFFFFFFFCLL));
      int v242 = sub_24FF7C6B0(v223, v973, v235, (unsigned __int16 **)&v1064);
      signed int v243 = v943;
      signed int v244 = v914;
      signed int v219 = v935 + v952 + v236;
      uint64_t v2 = v1000;
      signed int v245 = v240 + v239 + v242;
      goto LABEL_258;
    case 5:
      uint64_t v343 = *v3;
      int v344 = v3[780];
      v1006 = (char *)*((void *)v3 + 384);
      uint64_t v345 = *((void *)v3 + 23);
      int v346 = ~(-1 << (*(_DWORD *)(v2 + 4) - 1));
      __p = 0;
      v1047 = 0;
      uint64_t v1048 = 0;
      sub_24FF65ECC((void *)v3 + 23, (void *)v3 + 29, (void *)v3 + 26, (uint64_t *)v3 + 26, -1431655765 * ((unint64_t)(*((void *)v3 + 24) - v345) >> 2), (uint64_t *)&__p, v346);
      *(void *)&long long v1056 = 0;
      long long v1054 = 0u;
      *(_OWORD *)v1055 = 0u;
      *(_OWORD *)v1052 = 0u;
      *(_OWORD *)v1053 = 0u;
      *(_OWORD *)v1050 = 0u;
      long long v1051 = 0u;
      long long __b = 0u;
      sub_24FF60D8C((uint64_t)&__b, v344);
      LOWORD(v1020) = 0x8000;
      if ((int)v343 < 1) {
        goto LABEL_477;
      }
      uint64_t v347 = 0;
      int v348 = *(_DWORD *)(v2 + 16);
      uint64_t v982 = (uint64_t)(v3 + 890);
      v989 = v3 + 750;
      uint64_t v998 = 4 * v343;
      while (1)
      {
        uint64_t v349 = *(int *)(*((void *)v3 + 11) + v347);
        if (!v348 || *(unsigned char *)(*((void *)v3 + 387) + v349)) {
          break;
        }
LABEL_476:
        v347 += 4;
        if (v998 == v347)
        {
LABEL_477:
          if (v1055[0])
          {
            v1055[1] = v1055[0];
            operator delete(v1055[0]);
          }
          if (v1053[1])
          {
            *(void **)&long long v1054 = v1053[1];
            operator delete(v1053[1]);
          }
          if (v1052[0])
          {
            v1052[1] = v1052[0];
            operator delete(v1052[0]);
          }
          if (v1050[1])
          {
            *(void **)&long long v1051 = v1050[1];
            operator delete(v1050[1]);
          }
          if ((void)__b)
          {
            *((void *)&__b + 1) = __b;
            operator delete((void *)__b);
          }
LABEL_1284:
          if (__p)
          {
            v1047 = __p;
            operator delete(__p);
          }
          return 0;
        }
      }
      uint64_t v350 = &v1006[4 * (int)v349 * v344];
      int v351 = *(_DWORD *)v350 - v346;
      int v352 = *((_DWORD *)v350 + 1) - v346;
      if (v351 >= 0) {
        int v353 = v351;
      }
      else {
        int v353 = -v351;
      }
      if (v352 >= 0) {
        int v354 = v352;
      }
      else {
        int v354 = -v352;
      }
      int v355 = v346 - v353;
      int v356 = v354 - v346;
      if (v351 >= 0) {
        int v356 = v346 - v354;
      }
      int v357 = v353 - v346;
      if (v352 >= 0) {
        int v357 = v355;
      }
      v358 = v3;
      int v359 = v355 - v354;
      LODWORD(v1045[0]) = v355 - v354;
      if (v355 - v354 < 0) {
        int v360 = v356;
      }
      else {
        int v360 = v351;
      }
      if (v355 - v354 < 0) {
        int v361 = v357;
      }
      else {
        int v361 = v352;
      }
      v1044 = (void *)__PAIR64__(v361, v360);
      uint64_t v362 = 3 * v349;
      uint64_t v363 = (int *)((char *)__p + 12 * v349);
      int v364 = *v363;
      int v365 = *v363;
      LODWORD(v1022) = *v363;
      int v366 = v363[1];
      HIDWORD(v1022) = v366;
      int v367 = v363[2];
      LODWORD(v1023) = v367;
      uint64_t v368 = *(int *)(*((void *)v358 + 17) + 4 * v362);
      if (v368 == -1 || v348 && !*(unsigned char *)(*((void *)v1009 + 387) + v368))
      {
        unint64_t v378 = v365 * (uint64_t)v360 + v366 * (uint64_t)v361 + v367 * (uint64_t)v359;
        if ((v378 & 0x8000000000000000) != 0)
        {
          int v364 = -v364;
          int v366 = -v366;
          int v367 = -v367;
          v1022 = (void *)__PAIR64__(v366, v364);
          LODWORD(v1023) = v367;
        }
        sub_24FF6DACC(v982, v378 >> 63, &v1020);
      }
      else
      {
        uint64_t v369 = &v1006[4 * (int)v368 * v344];
        int v370 = *(_DWORD *)v369 - v346;
        int v371 = *((_DWORD *)v369 + 1) - v346;
        if (v370 >= 0) {
          int v372 = v370;
        }
        else {
          int v372 = -v370;
        }
        if (v371 >= 0) {
          int v373 = v371;
        }
        else {
          int v373 = -v371;
        }
        int v374 = v346 - v372;
        int v375 = v373 - v346;
        if (v370 >= 0) {
          int v375 = v346 - v373;
        }
        int v376 = v372 - v346;
        if (v371 >= 0) {
          int v376 = v374;
        }
        int v377 = v374 - v373;
        if (v377 < 0)
        {
          int v370 = v375;
          int v371 = v376;
        }
        if (v367 * (uint64_t)v377 + v365 * (uint64_t)v370 + v366 * (uint64_t)v371 < 0)
        {
          int v364 = -v364;
          int v366 = -v366;
          int v367 = -v367;
          v1022 = (void *)__PAIR64__(v366, v364);
          LODWORD(v1023) = v367;
        }
      }
      if (v364 >= 0) {
        unsigned int v379 = v364;
      }
      else {
        unsigned int v379 = -v364;
      }
      if (v366 >= 0) {
        unsigned int v380 = v366;
      }
      else {
        unsigned int v380 = -v366;
      }
      if (v367 >= 0) {
        unsigned int v381 = v367;
      }
      else {
        unsigned int v381 = -v367;
      }
      if (v379 >= v380 && v379 >= v381)
      {
        uint64_t v383 = &v1022;
        v384 = &v1044;
        int v361 = v360;
        int v366 = v364;
        uint64_t v385 = v1000;
      }
      else
      {
        uint64_t v383 = (void **)((char *)&v1022 + 4);
        v384 = (void **)((char *)&v1044 + 4);
        uint64_t v385 = v1000;
        if (v380 < v381)
        {
          if ((v367 & 0x80000000) == 0)
          {
LABEL_462:
            int v386 = (int)v1044;
            int v387 = HIDWORD(v1044);
            if (v359 < 0)
            {
              if (SHIDWORD(v1044) >= 0) {
                int v389 = HIDWORD(v1044);
              }
              else {
                int v389 = -HIDWORD(v1044);
              }
              int v390 = v389 - v346;
              int v388 = v346 - v389;
              if ((int)v1044 < 0)
              {
                int v388 = v390;
                int v386 = -(int)v1044;
              }
              if ((HIDWORD(v1044) & 0x80000000) != 0) {
                int v387 = v386 - v346;
              }
              else {
                int v387 = v346 - v386;
              }
            }
            else
            {
              int v388 = (int)v1044;
            }
            unint64_t v3 = v1009;
            v1044 = (void *)__PAIR64__(v387, v388);
            sub_24FF6DC40((uint64_t)v1009, (uint64_t)&v1044, (uint64_t)&v1022, v344, v989, *(unsigned char *)(v385 + 8), &__b);
            goto LABEL_476;
          }
LABEL_466:
          LODWORD(v1023) = -v367;
          int v359 = -v359;
          LODWORD(v1045[0]) = v359;
          goto LABEL_462;
        }
      }
      *(_DWORD *)v384 = v359;
      LODWORD(v1045[0]) = v361;
      *(_DWORD *)uint64_t v383 = v367;
      int v359 = v361;
      int v367 = v366;
      LODWORD(v1023) = v366;
      if ((v366 & 0x80000000) == 0) {
        goto LABEL_462;
      }
      goto LABEL_466;
    case 6:
      uint64_t v391 = *v3;
      int v392 = v3[780];
      uint64_t v976 = *((void *)v3 + 384);
      uint64_t v393 = *((void *)v3 + 23);
      int v394 = ~(-1 << (*(_DWORD *)(v2 + 4) - 1));
      __p = 0;
      v1047 = 0;
      uint64_t v1048 = 0;
      sub_24FF65ECC((void *)v3 + 23, (void *)v3 + 29, (void *)v3 + 26, (uint64_t *)v3 + 26, -1431655765 * ((unint64_t)(*((void *)v3 + 24) - v393) >> 2), (uint64_t *)&__p, v394);
      uint64_t v395 = 0;
      uint64_t v1071 = 0;
      v970 = v3 + 750;
      long long v1069 = 0u;
      long long v1070 = 0u;
      long long v1067 = 0u;
      long long v1068 = 0u;
      long long v1065 = 0u;
      long long v1066 = 0u;
      long long v1063 = 0u;
      long long v1064 = 0u;
      long long v1061 = 0u;
      long long v1062 = 0u;
      long long v1059 = 0u;
      long long v1060 = 0u;
      long long v1057 = 0u;
      long long v1058 = 0u;
      *(_OWORD *)v1055 = 0u;
      long long v1056 = 0u;
      *(_OWORD *)v1053 = 0u;
      long long v1054 = 0u;
      long long v1051 = 0u;
      *(_OWORD *)v1052 = 0u;
      long long __b = 0u;
      *(_OWORD *)v1050 = 0u;
      do
      {
        sub_24FF60D8C((uint64_t)&v1050[v395 - 2], v392);
        v395 += 15;
      }
      while (v395 != 45);
      memset_pattern16(&v1012, &unk_24FF7D710, 6uLL);
      memset_pattern16(&v1041, &unk_24FF7D710, 6uLL);
      unsigned __int16 v1040 = 0x8000;
      __int16 v1039 = 0x8000;
      uint64_t v396 = v976;
      if ((int)v391 <= 0) {
        goto LABEL_1272;
      }
      uint64_t v397 = 0;
      int v398 = *(_DWORD *)(v2 + 16);
      uint64_t v965 = (uint64_t)(v3 + 890);
      uint64_t v983 = 4 * v391;
      int v999 = v392;
      int v953 = v398;
      break;
    default:
      return 5;
  }
  while (1)
  {
    uint64_t v399 = *(int *)(*((void *)v3 + 11) + v397);
    if (v398 && !*(unsigned char *)(*((void *)v3 + 387) + v399)) {
      goto LABEL_1254;
    }
    int32x2_t v400 = (_DWORD *)(v396 + 4 * (int)v399 * v392);
    int v401 = *v400 - v394;
    int v402 = v400[1] - v394;
    if (v401 >= 0) {
      int v403 = v401;
    }
    else {
      int v403 = -v401;
    }
    if (v402 >= 0) {
      int v404 = v402;
    }
    else {
      int v404 = -v402;
    }
    int v405 = v394 - v403;
    int v406 = v404 - v394;
    if (v401 >= 0) {
      int v406 = v394 - v404;
    }
    int v407 = v403 - v394;
    if (v402 >= 0) {
      int v407 = v405;
    }
    int v408 = v405 - v404;
    LODWORD(v1045[0]) = v405 - v404;
    if (v405 - v404 < 0) {
      int v409 = v406;
    }
    else {
      int v409 = v401;
    }
    if (v405 - v404 < 0) {
      int v410 = v407;
    }
    else {
      int v410 = v402;
    }
    v1044 = (void *)__PAIR64__(v410, v409);
    uint64_t v411 = 3 * v399;
    uint64_t v412 = (int *)((char *)__p + 12 * v399);
    v413 = v3;
    int v414 = *v412;
    int v415 = *v412;
    LODWORD(v1022) = *v412;
    int v416 = v412[1];
    HIDWORD(v1022) = v416;
    int v417 = v412[2];
    LODWORD(v1023) = v417;
    v418 = (int *)(*((void *)v413 + 17) + 4 * v411);
    uint64_t v420 = *v418;
    uint64_t v419 = v418[1];
    uint64_t v421 = v418[2];
    v422 = (int *)(*((void *)v413 + 20) + 4 * v411);
    uint64_t v423 = v422[2];
    if (v423 != -1)
    {
      uint64_t v425 = *v422;
      uint64_t v424 = v422[1];
      if (!v398
        || (uint64_t v426 = *((void *)v1009 + 387), *(unsigned char *)(v426 + v420))
        && *(unsigned char *)(v426 + v419)
        && *(unsigned char *)(v426 + v421)
        && *(unsigned char *)(v426 + v425)
        && *(unsigned char *)(v426 + v424)
        && *(unsigned char *)(v426 + v423))
      {
        v427 = (_DWORD *)(v396 + 4 * (int)v420 * v392);
        int v428 = *v427 - v394;
        int v429 = v427[1] - v394;
        if (v428 >= 0) {
          int v430 = *v427 - v394;
        }
        else {
          int v430 = v394 - *v427;
        }
        if (v429 >= 0) {
          int v431 = v427[1] - v394;
        }
        else {
          int v431 = v394 - v427[1];
        }
        int v432 = v394 - v430;
        int v936 = v394 - v430 - v431;
        if (v936 < 0)
        {
          int v433 = v431 - v394;
          int v434 = v394 - v431;
          if (v428 >= 0) {
            int v428 = v434;
          }
          else {
            int v428 = v433;
          }
          int v435 = v430 - v394;
          if (v429 >= 0) {
            int v429 = v432;
          }
          else {
            int v429 = v435;
          }
        }
        v436 = (_DWORD *)(v396 + 4 * (int)v419 * v392);
        int v437 = *v436 - v394;
        int v438 = v436[1] - v394;
        if (v437 >= 0) {
          int v439 = *v436 - v394;
        }
        else {
          int v439 = v394 - *v436;
        }
        if (v438 >= 0) {
          int v440 = v438;
        }
        else {
          int v440 = -v438;
        }
        int v441 = v394 - v439;
        int v442 = v394 - v439 - v440;
        uint64_t v990 = v397;
        if (v442 < 0)
        {
          int v443 = v440 - v394;
          int v444 = v394 - v440;
          if (v437 >= 0) {
            int v437 = v444;
          }
          else {
            int v437 = v443;
          }
          int v445 = v439 - v394;
          if (v438 >= 0) {
            int v438 = v441;
          }
          else {
            int v438 = v445;
          }
        }
        v446 = (_DWORD *)(v396 + 4 * (int)v421 * v392);
        int v447 = *v446 - v394;
        int v448 = v446[1] - v394;
        if (v447 >= 0) {
          int v449 = *v446 - v394;
        }
        else {
          int v449 = v394 - *v446;
        }
        if (v448 >= 0) {
          int v450 = v448;
        }
        else {
          int v450 = -v448;
        }
        int v451 = v394 - v449;
        int v452 = v394 - v449 - v450;
        int v1007 = v410;
        int v927 = v442;
        if (v452 < 0)
        {
          int v453 = v450 - v394;
          int v454 = v394 - v450;
          if (v447 >= 0) {
            int v447 = v454;
          }
          else {
            int v447 = v453;
          }
          int v455 = v449 - v394;
          if (v448 >= 0) {
            int v448 = v451;
          }
          else {
            int v448 = v455;
          }
        }
        v456 = (_DWORD *)(v396 + 4 * (int)v425 * v392);
        int v457 = *v456 - v394;
        int v458 = v456[1] - v394;
        if (v457 >= 0) {
          int v459 = *v456 - v394;
        }
        else {
          int v459 = v394 - *v456;
        }
        if (v458 >= 0) {
          int v460 = v458;
        }
        else {
          int v460 = -v458;
        }
        int v461 = v394 - v459;
        int v945 = v394 - v459 - v460;
        if (v945 < 0)
        {
          int v462 = v460 - v394;
          int v463 = v394 - v460;
          if (v457 >= 0) {
            int v457 = v463;
          }
          else {
            int v457 = v462;
          }
          int v464 = v459 - v394;
          if (v458 >= 0) {
            int v458 = v461;
          }
          else {
            int v458 = v464;
          }
        }
        v465 = (_DWORD *)(v396 + 4 * (int)v424 * v392);
        int v466 = v465[1];
        int v467 = *v465 - v394;
        int v468 = v466 - v394;
        if (v467 >= 0) {
          int v469 = v467;
        }
        else {
          int v469 = -v467;
        }
        if (v468 >= 0) {
          int v470 = v468;
        }
        else {
          int v470 = -v468;
        }
        int v471 = v394 - v469;
        int v958 = v394 - v469 - v470;
        if (v958 < 0)
        {
          int v472 = v470 - v394;
          int v473 = v394 - v470;
          if (v467 >= 0) {
            int v467 = v473;
          }
          else {
            int v467 = v472;
          }
          int v474 = v469 - v394;
          if (v468 >= 0) {
            int v468 = v471;
          }
          else {
            int v468 = v474;
          }
        }
        v475 = (_DWORD *)(v396 + 4 * (int)v423 * v392);
        int v476 = *v475 - v394;
        int v477 = v475[1] - v394;
        if (v476 >= 0) {
          int v478 = *v475 - v394;
        }
        else {
          int v478 = v394 - *v475;
        }
        if (v477 >= 0) {
          int v479 = v477;
        }
        else {
          int v479 = -v477;
        }
        int v480 = v394 - v478;
        int v481 = v394 - v478 - v479;
        int v921 = v452;
        if (v481 < 0)
        {
          int v482 = v479 - v394;
          int v483 = v394 - v479;
          if (v476 >= 0) {
            int v476 = v483;
          }
          else {
            int v476 = v482;
          }
          int v484 = v478 - v394;
          if (v477 >= 0) {
            int v477 = v480;
          }
          else {
            int v477 = v484;
          }
        }
        uint64_t v485 = v417 * (uint64_t)v936 + v415 * (uint64_t)v428 + v416 * (uint64_t)v429;
        if (v485 >= 0) {
          int v486 = v414;
        }
        else {
          int v486 = -v414;
        }
        if (v485 >= 0) {
          int v487 = v416;
        }
        else {
          int v487 = -v416;
        }
        if (v485 >= 0) {
          int v488 = v417;
        }
        else {
          int v488 = -v417;
        }
        int v1010 = v486;
        int v1038 = v487;
        int v489 = v437 + v428 - v447;
        int v490 = v438 + v429 - v448;
        int v1037 = v489;
        int v1036 = v490;
        int v491 = v467 + v457 - v476;
        int v492 = v468 + v458 - v477;
        int v1035 = v491;
        int v1034 = v492;
        int v493 = v457 + v428;
        char v15 = (v457 + v428 < 0) ^ __OFADD__(v457, v428);
        int v494 = v945 + v936;
        if (v15) {
          ++v493;
        }
        unint64_t v495 = 1431655766 * ((v493 >> 1) + 2 * (v467 + v437) - (v447 + v476));
        int v496 = HIDWORD(v495) + (v495 >> 63);
        int v497 = ((v458 + v429) / 2 + 2 * (v468 + v438) - (v448 + v477)) / 3;
        int v1033 = v496;
        int v1032 = v497;
        if (v494 >= 0) {
          int v498 = v945 + v936;
        }
        else {
          int v498 = v494 + 1;
        }
        int v1031 = v409;
        int v499 = v1007;
        int v1030 = v1007;
        int v1029 = v409;
        int v1028 = v1007;
        int v1027 = v409;
        int v1026 = v1007;
        int v1025 = v409;
        int v1024 = v1007;
        if (v414 >= 0) {
          unsigned int v500 = v414;
        }
        else {
          unsigned int v500 = -v414;
        }
        if (v416 >= 0) {
          unsigned int v501 = v416;
        }
        else {
          unsigned int v501 = -v416;
        }
        if (v417 >= 0) {
          unsigned int v502 = v417;
        }
        else {
          unsigned int v502 = -v417;
        }
        if (v500 >= v501 && v500 >= v502)
        {
          v503 = &v1010;
          v504 = &v1031;
          int v505 = v409;
          int v506 = v927;
          int v507 = v958;
          int v508 = v481;
          goto LABEL_825;
        }
        int v506 = v927;
        int v507 = v958;
        int v508 = v481;
        if (v501 >= v502)
        {
          v503 = &v1038;
          v504 = &v1030;
          int v505 = v1007;
          int v486 = v487;
LABEL_825:
          int *v504 = v408;
          int *v503 = v488;
          int v636 = v1031;
          int v635 = v1030;
          int v488 = v486;
        }
        else
        {
          int v635 = v1007;
          int v636 = v409;
          int v505 = v408;
        }
        if (v488 >= 0) {
          int v642 = v505;
        }
        else {
          int v642 = -v505;
        }
        if (v488 >= 0) {
          int v643 = v488;
        }
        else {
          int v643 = -v488;
        }
        if (v642 < 0)
        {
          if (v635 >= 0) {
            int v646 = v635;
          }
          else {
            int v646 = -v635;
          }
          int v647 = v646 - v394;
          int v648 = v394 - v646;
          if (v636 < 0) {
            int v648 = v647;
          }
          int v959 = v648;
          if (v636 >= 0) {
            int v649 = v636;
          }
          else {
            int v649 = -v636;
          }
          uint64_t v644 = v1000;
          int v645 = v921;
          if (v635 < 0) {
            int v635 = v649 - v394;
          }
          else {
            int v635 = v394 - v649;
          }
        }
        else
        {
          int v959 = v636;
          uint64_t v644 = v1000;
          int v645 = v921;
        }
        int v670 = v506 + v936 - v645;
        int v1031 = v959;
        int v1030 = v635;
        if (v489 >= 0) {
          unsigned int v671 = v489;
        }
        else {
          unsigned int v671 = -v489;
        }
        if (v490 >= 0) {
          unsigned int v672 = v490;
        }
        else {
          unsigned int v672 = -v490;
        }
        if (v670 >= 0) {
          unsigned int v673 = v506 + v936 - v645;
        }
        else {
          unsigned int v673 = v645 - (v506 + v936);
        }
        if (v671 >= v672 && v671 >= v673)
        {
          v674 = &v1037;
          v675 = &v1029;
          unsigned int v673 = v671;
          int v676 = v409;
          goto LABEL_930;
        }
        if (v672 >= v673)
        {
          v674 = &v1036;
          v675 = &v1028;
          unsigned int v673 = v672;
          int v676 = v1007;
          int v489 = v490;
LABEL_930:
          int *v675 = v408;
          int *v674 = v670;
          int v678 = v1029;
          int v677 = v1028;
          int v670 = v489;
        }
        else
        {
          int v677 = v1007;
          int v678 = v409;
          int v676 = v408;
        }
        if (v670 >= 0) {
          int v679 = v676;
        }
        else {
          int v679 = -v676;
        }
        if (v679 < 0)
        {
          if (v677 >= 0) {
            int v681 = v677;
          }
          else {
            int v681 = -v677;
          }
          int v682 = v681 - v394;
          int v683 = v394 - v681;
          if (v678 >= 0) {
            int v680 = v683;
          }
          else {
            int v680 = v682;
          }
          if (v678 >= 0) {
            int v684 = v678;
          }
          else {
            int v684 = -v678;
          }
          if (v677 < 0) {
            int v677 = v684 - v394;
          }
          else {
            int v677 = v394 - v684;
          }
        }
        else
        {
          int v680 = v678;
        }
        int v685 = v507 + v945 - v508;
        int v1029 = v680;
        int v1028 = v677;
        if (v491 >= 0) {
          unsigned int v686 = v491;
        }
        else {
          unsigned int v686 = -v491;
        }
        if (v492 >= 0) {
          unsigned int v687 = v492;
        }
        else {
          unsigned int v687 = -v492;
        }
        if (v685 >= 0) {
          unsigned int v688 = v507 + v945 - v508;
        }
        else {
          unsigned int v688 = v508 - (v507 + v945);
        }
        if (v686 >= v687 && v686 >= v688)
        {
          v689 = &v1035;
          v690 = &v1027;
          unsigned int v688 = v686;
          int v691 = v409;
          goto LABEL_963;
        }
        if (v687 >= v688)
        {
          v689 = &v1034;
          v690 = &v1026;
          unsigned int v688 = v687;
          int v691 = v1007;
          int v491 = v492;
LABEL_963:
          int *v690 = v408;
          int *v689 = v685;
          int v693 = v1027;
          int v692 = v1026;
          int v685 = v491;
        }
        else
        {
          int v692 = v1007;
          int v693 = v409;
          int v691 = v408;
        }
        if (v685 >= 0) {
          int v694 = v691;
        }
        else {
          int v694 = -v691;
        }
        if (v694 < 0)
        {
          if (v692 >= 0) {
            int v696 = v692;
          }
          else {
            int v696 = -v692;
          }
          int v697 = v696 - v394;
          int v698 = v394 - v696;
          if (v693 >= 0) {
            int v695 = v698;
          }
          else {
            int v695 = v697;
          }
          if (v693 >= 0) {
            int v699 = v693;
          }
          else {
            int v699 = -v693;
          }
          if (v692 < 0) {
            int v692 = v699 - v394;
          }
          else {
            int v692 = v394 - v699;
          }
        }
        else
        {
          int v695 = v693;
        }
        unint64_t v700 = 1431655766 * ((v498 >> 1) + 2 * (v507 + v506) - (v645 + v508));
        int v701 = HIDWORD(v700) + (v700 >> 63);
        int v1027 = v695;
        int v1026 = v692;
        if (v496 >= 0) {
          unsigned int v702 = v496;
        }
        else {
          unsigned int v702 = -v496;
        }
        if (v497 >= 0) {
          unsigned int v703 = v497;
        }
        else {
          unsigned int v703 = -v497;
        }
        if (v701 >= 0) {
          unsigned int v704 = v701;
        }
        else {
          unsigned int v704 = -v701;
        }
        if (v702 >= v703 && v702 >= v704)
        {
          v705 = &v1033;
          v706 = &v1025;
          unsigned int v704 = v702;
          goto LABEL_995;
        }
        if (v703 >= v704)
        {
          v705 = &v1032;
          v706 = &v1024;
          unsigned int v704 = v703;
          int v409 = v1007;
          int v496 = v497;
LABEL_995:
          int *v706 = v408;
          int v408 = v409;
          int *v705 = v701;
          int v409 = v1025;
          int v499 = v1024;
          int v701 = v496;
        }
        if (v701 >= 0) {
          int v707 = v408;
        }
        else {
          int v707 = -v408;
        }
        if (v707 < 0)
        {
          if (v499 >= 0) {
            int v709 = v499;
          }
          else {
            int v709 = -v499;
          }
          int v710 = v709 - v394;
          int v711 = v394 - v709;
          if (v409 >= 0) {
            int v708 = v711;
          }
          else {
            int v708 = v710;
          }
          if (v409 >= 0) {
            int v712 = v409;
          }
          else {
            int v712 = -v409;
          }
          if (v499 < 0) {
            int v499 = v712 - v394;
          }
          else {
            int v499 = v394 - v712;
          }
        }
        else
        {
          int v708 = v409;
        }
        int v1025 = v708;
        int v1024 = v499;
        int v713 = v1010;
        int v714 = v959 - v1010;
        LODWORD(v1020) = v959 - v1010;
        HIDWORD(v1020) = v635 - v1038;
        LODWORD(v1021) = v642 - v643;
        LODWORD(v1018) = v680 - v1037;
        HIDWORD(v1018) = v677 - v1036;
        LODWORD(v1019) = v679 - v673;
        int v875 = v1034;
        LODWORD(v1016) = v695 - v1035;
        HIDWORD(v1016) = v692 - v1034;
        LODWORD(v1017) = v694 - v688;
        int v873 = v1033;
        int v871 = v1032;
        LODWORD(v1014) = v708 - v1033;
        HIDWORD(v1014) = v499 - v1032;
        LODWORD(v1015) = v707 - v704;
        int v1008 = v499;
        int v915 = v635;
        int v908 = v642;
        unsigned int v937 = v673;
        int v901 = v679;
        int v905 = v677;
        int v898 = v680;
        int v889 = v692;
        unsigned int v891 = v688;
        int v885 = v695;
        int v887 = v694;
        int v881 = v707;
        unsigned int v883 = v704;
        int v877 = v1035;
        int v879 = v708;
        int v946 = v1038;
        int v928 = v1037;
        int v922 = v1036;
        if (*(unsigned char *)(v644 + 24))
        {
          int v715 = *(unsigned __int8 *)(v644 + 8);
          int v895 = v1010;
          uint64_t v716 = v1041;
          int v717 = *(_DWORD *)((char *)&unk_24FF7D720 + (((v1041 + 2048) >> 10) & 0x7CLL));
          int v893 = v717;
          uint64_t v718 = v1042;
          int v719 = *(_DWORD *)((char *)&unk_24FF7D720 + (((v1042 + 2048) >> 10) & 0x7CLL));
          int v392 = v999;
          signed int v720 = v719 + v717 + sub_24FF7C6B0((int *)&v1020, v999, v715, (unsigned __int16 **)&v1064);
          int v721 = *(_DWORD *)((char *)&unk_24FF7D720 + (((unint64_t)(67584 - v716) >> 10) & 0x3FFFFFFFFFFFFCLL));
          uint64_t v722 = v1043;
          LODWORD(v716) = *(_DWORD *)((char *)&unk_24FF7D720 + (((v1043 + 2048) >> 10) & 0x7CLL));
          signed int v723 = v716 + sub_24FF7C6B0((int *)&v1018, v999, v715, (unsigned __int16 **)&v1064) + v721;
          LODWORD(v718) = *(_DWORD *)((char *)&unk_24FF7D720
                                    + (((unint64_t)(67584 - v718) >> 10) & 0x3FFFFFFFFFFFFCLL));
          LODWORD(v716) = sub_24FF7C6B0((int *)&v1016, v999, v715, (unsigned __int16 **)&v1064);
          LODWORD(v722) = *(_DWORD *)((char *)&unk_24FF7D720
                                    + (((unint64_t)(67584 - v722) >> 10) & 0x3FFFFFFFFFFFFCLL));
          int v724 = sub_24FF7C6B0((int *)&v1014, v999, v715, (unsigned __int16 **)&v1064);
          int v725 = v893 + v716;
          int v713 = v895;
          signed int v726 = v718 + v725;
          signed int v727 = v722 + v721 + v724;
        }
        else
        {
          int v392 = v999;
          if (v999 < 1)
          {
            signed int v720 = 0;
            signed int v723 = 0;
            signed int v726 = 0;
            signed int v727 = 0;
          }
          else
          {
            if (v714 < 0) {
              int v714 = v1010 - v959;
            }
            signed int v720 = -(v999 * __clz(v714 + 1));
            if (v680 - v1037 >= 0) {
              int v728 = v680 - v1037;
            }
            else {
              int v728 = v1037 - v680;
            }
            signed int v723 = -(v999 * __clz(v728 + 1));
            if (v695 - v1035 >= 0) {
              int v729 = v695 - v1035;
            }
            else {
              int v729 = v1035 - v695;
            }
            signed int v726 = -(v999 * __clz(v729 + 1));
            if (v708 - v1033 >= 0) {
              int v730 = v708 - v1033;
            }
            else {
              int v730 = v1033 - v708;
            }
            signed int v727 = -(v999 * __clz(v730 + 1));
          }
        }
        unint64_t v3 = v1009;
        uint64_t v397 = v990;
        int v398 = v953;
        if (v720 > v723 || v720 > v726 || v720 > v727)
        {
          if (v723 > v726 || v723 > v727)
          {
            uint64_t v2 = v1000;
            if (v726 <= v727)
            {
              int v732 = 0;
              v1022 = (void *)__PAIR64__(v875, v877);
              int v731 = 1;
              LODWORD(v1023) = v891;
              int v735 = v887;
              int v734 = v889;
              uint64_t v733 = 1;
              int v736 = v885;
            }
            else
            {
              v1022 = (void *)__PAIR64__(v871, v873);
              int v731 = 1;
              int v734 = v1008;
              LODWORD(v1023) = v883;
              int v736 = v879;
              int v735 = v881;
              int v732 = 1;
              uint64_t v733 = 2;
            }
            LODWORD(v1044) = v736;
          }
          else
          {
            int v731 = 0;
            v1022 = (void *)__PAIR64__(v922, v928);
            int v732 = 1;
            LODWORD(v1023) = v937;
            int v735 = v901;
            int v734 = v905;
            uint64_t v733 = 2;
            LODWORD(v1044) = v898;
            uint64_t v2 = v1000;
          }
        }
        else
        {
          int v731 = 0;
          int v732 = 0;
          v1022 = (void *)__PAIR64__(v946, v713);
          LODWORD(v1023) = v643;
          uint64_t v733 = 1;
          LODWORD(v1044) = v959;
          uint64_t v2 = v1000;
          int v734 = v915;
          int v735 = v908;
        }
        HIDWORD(v1044) = v734;
        LODWORD(v1045[0]) = v735;
        sub_24FF6DACC(v965, v732, &v1041);
        sub_24FF6DACC(v965, v731, &v1041 + v733);
        unsigned int v803 = 2;
        goto LABEL_1253;
      }
    }
    if (v421 != -1)
    {
      if (!v398
        || (uint64_t v509 = *((void *)v1009 + 387), *(unsigned char *)(v509 + v420))
        && *(unsigned char *)(v509 + v419)
        && *(unsigned char *)(v509 + v421))
      {
        v510 = (_DWORD *)(v396 + 4 * (int)v420 * v392);
        int v511 = v510[1];
        int v512 = *v510 - v394;
        int v513 = v511 - v394;
        if (v512 >= 0) {
          int v514 = v512;
        }
        else {
          int v514 = -v512;
        }
        if (v513 >= 0) {
          int v515 = v511 - v394;
        }
        else {
          int v515 = v394 - v511;
        }
        int v516 = v394 - v514;
        int v517 = v394 - v514 - v515;
        if (v517 < 0)
        {
          int v518 = v515 - v394;
          int v519 = v394 - v515;
          if (v512 >= 0) {
            int v512 = v519;
          }
          else {
            int v512 = v518;
          }
          int v520 = v514 - v394;
          if (v513 >= 0) {
            int v513 = v516;
          }
          else {
            int v513 = v520;
          }
        }
        v521 = (_DWORD *)(v396 + 4 * (int)v419 * v392);
        int v522 = *v521 - v394;
        int v523 = v521[1] - v394;
        if (v522 >= 0) {
          int v524 = *v521 - v394;
        }
        else {
          int v524 = v394 - *v521;
        }
        if (v523 >= 0) {
          int v525 = v523;
        }
        else {
          int v525 = -v523;
        }
        int v526 = v394 - v524;
        int v527 = v394 - v524 - v525;
        if (v527 < 0)
        {
          int v528 = v525 - v394;
          int v529 = v394 - v525;
          if (v522 >= 0) {
            int v522 = v529;
          }
          else {
            int v522 = v528;
          }
          int v530 = v524 - v394;
          if (v523 >= 0) {
            int v523 = v526;
          }
          else {
            int v523 = v530;
          }
        }
        v531 = (_DWORD *)(v396 + 4 * (int)v421 * v392);
        int v532 = *v531 - v394;
        int v533 = v531[1] - v394;
        if (v532 >= 0) {
          int v534 = *v531 - v394;
        }
        else {
          int v534 = v394 - *v531;
        }
        if (v533 >= 0) {
          int v535 = v531[1] - v394;
        }
        else {
          int v535 = v394 - v531[1];
        }
        int v536 = v394 - v534;
        int v537 = v394 - v534 - v535;
        if (v537 < 0)
        {
          int v538 = v535 - v394;
          int v539 = v394 - v535;
          if (v532 >= 0) {
            int v532 = v539;
          }
          else {
            int v532 = v538;
          }
          int v540 = v534 - v394;
          if (v533 >= 0) {
            int v533 = v536;
          }
          else {
            int v533 = v540;
          }
        }
        uint64_t v541 = v417 * (uint64_t)v517 + v415 * (uint64_t)v512 + v416 * (uint64_t)v513;
        if (v541 >= 0) {
          int v542 = v414;
        }
        else {
          int v542 = -v414;
        }
        if (v541 >= 0) {
          int v543 = v416;
        }
        else {
          int v543 = -v416;
        }
        if (v541 >= 0) {
          int v544 = v417;
        }
        else {
          int v544 = -v417;
        }
        int v1010 = v542;
        int v1038 = v543;
        int v545 = v522 + v512;
        int v546 = v523 + v513;
        int v547 = v527 + v517;
        int v548 = v522 + v512 - v532;
        int v549 = v546 - v533;
        int v1037 = v545 - v532;
        int v1036 = v546 - v533;
        int v550 = v545 + 1;
        int v551 = v546 + 1;
        int v552 = v547 + 1;
        if (v545 + 1 >= 0) {
          int v553 = v545 + 1;
        }
        else {
          int v553 = v545 + 2;
        }
        int v554 = v553 >> 1;
        int v555 = v546 + 2;
        if (v551 >= 0) {
          int v555 = v546 + 1;
        }
        int v556 = v555 >> 1;
        int v1035 = v554;
        int v1034 = v555 >> 1;
        int v557 = (v532 + v550) / 3;
        int v558 = (v533 + v551) / 3;
        int v1033 = v557;
        int v1032 = v558;
        if (v552 >= 0) {
          int v559 = v547 + 1;
        }
        else {
          int v559 = v547 + 2;
        }
        int v1031 = v409;
        int v1030 = v410;
        int v1029 = v409;
        int v1028 = v410;
        int v1027 = v409;
        int v1026 = v410;
        int v1025 = v409;
        int v1024 = v410;
        if (v414 >= 0) {
          unsigned int v560 = v414;
        }
        else {
          unsigned int v560 = -v414;
        }
        if (v416 >= 0) {
          unsigned int v561 = v416;
        }
        else {
          unsigned int v561 = -v416;
        }
        if (v417 >= 0) {
          unsigned int v562 = v417;
        }
        else {
          unsigned int v562 = -v417;
        }
        if (v560 >= v561 && v560 >= v562)
        {
          v563 = &v1010;
          v564 = &v1031;
          int v565 = v409;
          goto LABEL_845;
        }
        if (v561 >= v562)
        {
          v563 = &v1038;
          v564 = &v1030;
          int v565 = v410;
          int v542 = v543;
LABEL_845:
          int *v564 = v408;
          int *v563 = v544;
          int v638 = v1031;
          int v637 = v1030;
          int v544 = v542;
        }
        else
        {
          int v637 = v410;
          int v638 = v409;
          int v565 = v408;
        }
        if (v544 >= 0) {
          int v650 = v565;
        }
        else {
          int v650 = -v565;
        }
        if (v544 >= 0) {
          int v651 = v544;
        }
        else {
          int v651 = -v544;
        }
        if (v650 < 0)
        {
          if (v637 >= 0) {
            int v653 = v637;
          }
          else {
            int v653 = -v637;
          }
          int v654 = v653 - v394;
          int v655 = v394 - v653;
          if (v638 >= 0) {
            int v652 = v655;
          }
          else {
            int v652 = v654;
          }
          if (v638 >= 0) {
            int v656 = v638;
          }
          else {
            int v656 = -v638;
          }
          if (v637 < 0) {
            int v637 = v656 - v394;
          }
          else {
            int v637 = v394 - v656;
          }
        }
        else
        {
          int v652 = v638;
        }
        int v737 = v547 - v537;
        int v1031 = v652;
        int v1030 = v637;
        if (v548 >= 0) {
          unsigned int v738 = v548;
        }
        else {
          unsigned int v738 = -v548;
        }
        if (v549 >= 0) {
          unsigned int v739 = v549;
        }
        else {
          unsigned int v739 = -v549;
        }
        if (v737 >= 0) {
          unsigned int v740 = v737;
        }
        else {
          unsigned int v740 = -v737;
        }
        if (v738 >= v739 && v738 >= v740)
        {
          v741 = &v1037;
          v742 = &v1029;
          unsigned int v740 = v738;
          int v743 = v409;
          goto LABEL_1054;
        }
        if (v739 >= v740)
        {
          v741 = &v1036;
          v742 = &v1028;
          unsigned int v740 = v739;
          int v743 = v410;
          int v548 = v549;
LABEL_1054:
          int *v742 = v408;
          int *v741 = v737;
          int v745 = v1029;
          int v744 = v1028;
          int v737 = v548;
        }
        else
        {
          int v744 = v410;
          int v745 = v409;
          int v743 = v408;
        }
        if (v737 >= 0) {
          int v746 = v743;
        }
        else {
          int v746 = -v743;
        }
        if (v746 < 0)
        {
          if (v744 >= 0) {
            int v748 = v744;
          }
          else {
            int v748 = -v744;
          }
          int v749 = v748 - v394;
          int v750 = v394 - v748;
          if (v745 >= 0) {
            int v747 = v750;
          }
          else {
            int v747 = v749;
          }
          if (v745 >= 0) {
            int v751 = v745;
          }
          else {
            int v751 = -v745;
          }
          if (v744 < 0) {
            int v744 = v751 - v394;
          }
          else {
            int v744 = v394 - v751;
          }
        }
        else
        {
          int v747 = v745;
        }
        int v752 = v559 >> 1;
        int v1029 = v747;
        int v1028 = v744;
        if (v554 >= 0) {
          unsigned int v753 = v554;
        }
        else {
          unsigned int v753 = -v554;
        }
        if (v556 >= 0) {
          unsigned int v754 = v556;
        }
        else {
          unsigned int v754 = -v556;
        }
        if (v752 >= 0) {
          unsigned int v755 = v752;
        }
        else {
          unsigned int v755 = -v752;
        }
        if (v753 >= v754 && v753 >= v755)
        {
          v756 = &v1035;
          v757 = &v1027;
          unsigned int v755 = v753;
          int v758 = v409;
          goto LABEL_1087;
        }
        if (v754 >= v755)
        {
          v756 = &v1034;
          v757 = &v1026;
          unsigned int v755 = v754;
          int v758 = v410;
          int v554 = v556;
LABEL_1087:
          int *v757 = v408;
          int *v756 = v752;
          int v760 = v1027;
          int v759 = v1026;
          int v752 = v554;
        }
        else
        {
          int v759 = v410;
          int v760 = v409;
          int v758 = v408;
        }
        if (v752 < 0) {
          int v758 = -v758;
        }
        if (v758 < 0)
        {
          if (v759 >= 0) {
            int v762 = v759;
          }
          else {
            int v762 = -v759;
          }
          int v763 = v762 - v394;
          int v764 = v394 - v762;
          if (v760 >= 0) {
            int v761 = v764;
          }
          else {
            int v761 = v763;
          }
          if (v760 >= 0) {
            int v765 = v760;
          }
          else {
            int v765 = -v760;
          }
          if (v759 < 0) {
            int v759 = v765 - v394;
          }
          else {
            int v759 = v394 - v765;
          }
        }
        else
        {
          int v761 = v760;
        }
        int v766 = (v537 + v552) / 3;
        int v1027 = v761;
        int v1026 = v759;
        if (v557 >= 0) {
          unsigned int v767 = v557;
        }
        else {
          unsigned int v767 = -v557;
        }
        if (v558 >= 0) {
          unsigned int v768 = v558;
        }
        else {
          unsigned int v768 = -v558;
        }
        if (v766 >= 0) {
          unsigned int v769 = v766;
        }
        else {
          unsigned int v769 = -v766;
        }
        if (v767 >= v768 && v767 >= v769)
        {
          v770 = &v1033;
          v771 = &v1025;
          unsigned int v769 = v767;
          goto LABEL_1118;
        }
        if (v768 >= v769)
        {
          v770 = &v1032;
          v771 = &v1024;
          unsigned int v769 = v768;
          int v409 = v410;
          int v557 = v558;
LABEL_1118:
          int *v771 = v408;
          int v408 = v409;
          int *v770 = v766;
          int v409 = v1025;
          int v410 = v1024;
          int v766 = v557;
        }
        if (v766 >= 0) {
          int v772 = v408;
        }
        else {
          int v772 = -v408;
        }
        if (v772 < 0)
        {
          if (v410 >= 0) {
            int v774 = v410;
          }
          else {
            int v774 = -v410;
          }
          int v775 = v774 - v394;
          int v776 = v394 - v774;
          if (v409 >= 0) {
            int v773 = v776;
          }
          else {
            int v773 = v775;
          }
          if (v409 >= 0) {
            int v777 = v409;
          }
          else {
            int v777 = -v409;
          }
          if (v410 < 0) {
            int v410 = v777 - v394;
          }
          else {
            int v410 = v394 - v777;
          }
        }
        else
        {
          int v773 = v409;
        }
        int v1025 = v773;
        int v1024 = v410;
        int v778 = v1010;
        int v779 = v652 - v1010;
        int v938 = v1038;
        LODWORD(v1020) = v652 - v1010;
        HIDWORD(v1020) = v637 - v1038;
        LODWORD(v1021) = v650 - v651;
        int v896 = v1037;
        int v894 = v1036;
        LODWORD(v1018) = v747 - v1037;
        HIDWORD(v1018) = v744 - v1036;
        LODWORD(v1019) = v746 - v740;
        int v878 = v1035;
        int v876 = v1034;
        LODWORD(v1016) = v761 - v1035;
        HIDWORD(v1016) = v759 - v1034;
        LODWORD(v1017) = v758 - v755;
        int v874 = v1033;
        int v872 = v1032;
        LODWORD(v1014) = v773 - v1033;
        HIDWORD(v1014) = v410 - v1032;
        LODWORD(v1015) = v772 - v769;
        int v960 = v637;
        int v947 = v650;
        int v902 = v744;
        unsigned int v906 = v740;
        int v897 = v747;
        int v899 = v746;
        int v890 = v759;
        unsigned int v892 = v755;
        int v886 = v761;
        int v888 = v758;
        int v882 = v772;
        unsigned int v884 = v769;
        int v880 = v773;
        if (*(unsigned char *)(v2 + 24))
        {
          int v780 = *(unsigned __int8 *)(v2 + 8);
          int v916 = v1010;
          uint64_t v781 = (unsigned __int16)v1012;
          int v782 = *(_DWORD *)((char *)&unk_24FF7D720 + ((((unsigned __int16)v1012 + 2048) >> 10) & 0x7CLL));
          int v909 = v782;
          uint64_t v992 = v397;
          uint64_t v783 = WORD1(v1012);
          int v784 = *(_DWORD *)((char *)&unk_24FF7D720 + (((WORD1(v1012) + 2048) >> 10) & 0x7CLL));
          int v929 = v652;
          signed int v785 = v784 + v782 + sub_24FF7C6B0((int *)&v1020, v999, v780, (unsigned __int16 **)&v1056 + 1);
          int v786 = *(_DWORD *)((char *)&unk_24FF7D720 + (((unint64_t)(67584 - v781) >> 10) & 0x3FFFFFFFFFFFFCLL));
          int v923 = v651;
          uint64_t v787 = WORD2(v1012);
          LODWORD(v781) = *(_DWORD *)((char *)&unk_24FF7D720 + (((WORD2(v1012) + 2048) >> 10) & 0x7CLL));
          signed int v788 = v781 + sub_24FF7C6B0((int *)&v1018, v999, v780, (unsigned __int16 **)&v1056 + 1) + v786;
          LODWORD(v783) = *(_DWORD *)((char *)&unk_24FF7D720
                                    + (((unint64_t)(67584 - v783) >> 10) & 0x3FFFFFFFFFFFFCLL));
          LODWORD(v781) = sub_24FF7C6B0((int *)&v1016, v999, v780, (unsigned __int16 **)&v1056 + 1);
          LODWORD(v787) = *(_DWORD *)((char *)&unk_24FF7D720
                                    + (((unint64_t)(67584 - v787) >> 10) & 0x3FFFFFFFFFFFFCLL));
          int v398 = v953;
          int v789 = sub_24FF7C6B0((int *)&v1014, v999, v780, (unsigned __int16 **)&v1056 + 1);
          int v652 = v929;
          int v790 = v787 + v786;
          int v651 = v923;
          int v791 = v909 + v781;
          int v778 = v916;
          int v392 = v999;
          signed int v792 = v783 + v791;
          uint64_t v397 = v992;
          signed int v793 = v790 + v789;
        }
        else if (v392 < 1)
        {
          signed int v785 = 0;
          signed int v788 = 0;
          signed int v792 = 0;
          signed int v793 = 0;
        }
        else
        {
          if (v779 < 0) {
            int v779 = v1010 - v652;
          }
          signed int v785 = -(v392 * __clz(v779 + 1));
          if (v747 - v1037 >= 0) {
            int v794 = v747 - v1037;
          }
          else {
            int v794 = v1037 - v747;
          }
          signed int v788 = -(v392 * __clz(v794 + 1));
          if (v761 - v1035 >= 0) {
            int v795 = v761 - v1035;
          }
          else {
            int v795 = v1035 - v761;
          }
          signed int v792 = -(v392 * __clz(v795 + 1));
          if (v773 - v1033 >= 0) {
            int v796 = v773 - v1033;
          }
          else {
            int v796 = v1033 - v773;
          }
          signed int v793 = -(v392 * __clz(v796 + 1));
        }
        unint64_t v3 = v1009;
        if (v785 > v788 || v785 > v792 || v785 > v793)
        {
          if (v788 > v792 || v788 > v793)
          {
            uint64_t v2 = v1000;
            if (v792 <= v793)
            {
              int v798 = 0;
              v1022 = (void *)__PAIR64__(v876, v878);
              int v797 = 1;
              LODWORD(v1023) = v892;
              int v801 = v888;
              int v800 = v890;
              uint64_t v799 = 1;
              int v802 = v886;
            }
            else
            {
              v1022 = (void *)__PAIR64__(v872, v874);
              int v797 = 1;
              int v800 = v410;
              LODWORD(v1023) = v884;
              int v802 = v880;
              int v801 = v882;
              int v798 = 1;
              uint64_t v799 = 2;
            }
            LODWORD(v1044) = v802;
          }
          else
          {
            int v797 = 0;
            v1022 = (void *)__PAIR64__(v894, v896);
            int v798 = 1;
            LODWORD(v1023) = v906;
            int v801 = v899;
            int v800 = v902;
            uint64_t v799 = 2;
            LODWORD(v1044) = v897;
            uint64_t v2 = v1000;
          }
        }
        else
        {
          int v797 = 0;
          int v798 = 0;
          v1022 = (void *)__PAIR64__(v938, v778);
          LODWORD(v1023) = v651;
          uint64_t v799 = 1;
          LODWORD(v1044) = v652;
          uint64_t v2 = v1000;
          int v800 = v960;
          int v801 = v947;
        }
        HIDWORD(v1044) = v800;
        LODWORD(v1045[0]) = v801;
        sub_24FF6DACC(v965, v798, &v1012);
        sub_24FF6DACC(v965, v797, (_WORD *)&v1012 + v799);
        unsigned int v803 = 1;
        goto LABEL_1253;
      }
    }
    if (v419 != -1)
    {
      if (!v398 || (uint64_t v566 = *((void *)v1009 + 387), *(unsigned char *)(v566 + v420)) && *(unsigned char *)(v566 + v419))
      {
        v567 = (_DWORD *)(v396 + 4 * (int)v420 * v392);
        v568 = (_DWORD *)(v396 + 4 * (int)v419 * v392);
        int v569 = *v567 - v394;
        int v570 = v567[1] - v394;
        if (v569 >= 0) {
          int v571 = v569;
        }
        else {
          int v571 = -v569;
        }
        if (v570 >= 0) {
          int v572 = v570;
        }
        else {
          int v572 = -v570;
        }
        int v573 = v394 - v571;
        int v574 = v572 - v394;
        if (v569 >= 0) {
          int v574 = v394 - v572;
        }
        int v575 = v571 - v394;
        if (v570 >= 0) {
          int v575 = v573;
        }
        int v576 = v573 - v572;
        if (v576 < 0) {
          int v577 = v574;
        }
        else {
          int v577 = v569;
        }
        if (v576 >= 0) {
          int v575 = v570;
        }
        int v578 = *v568 - v394;
        int v579 = v568[1] - v394;
        if (v578 >= 0) {
          int v580 = v578;
        }
        else {
          int v580 = -v578;
        }
        if (v579 >= 0) {
          int v581 = v579;
        }
        else {
          int v581 = -v579;
        }
        int v582 = v394 - v580;
        int v583 = v581 - v394;
        if (v578 >= 0) {
          int v583 = v394 - v581;
        }
        int v584 = v580 - v394;
        if (v579 >= 0) {
          int v584 = v582;
        }
        int v585 = v582 - v581;
        if (v585 < 0) {
          int v586 = v583;
        }
        else {
          int v586 = v578;
        }
        if (v585 < 0) {
          int v579 = v584;
        }
        uint64_t v587 = v417 * (uint64_t)v576 + v415 * (uint64_t)v577 + v416 * (uint64_t)v575;
        if (v587 >= 0) {
          int v588 = v414;
        }
        else {
          int v588 = -v414;
        }
        if (v587 >= 0) {
          int v589 = v416;
        }
        else {
          int v589 = -v416;
        }
        if (v587 >= 0) {
          int v590 = v417;
        }
        else {
          int v590 = -v417;
        }
        LODWORD(v1016) = v588;
        LODWORD(v1014) = v589;
        int v591 = v575 + v579;
        int v592 = v576 + v585;
        int v593 = v577 + v586 + 2;
        if (v577 + v586 + 1 >= 0) {
          int v593 = v577 + v586 + 1;
        }
        int v594 = v593 >> 1;
        int v595 = v591 + 2;
        if (v591 + 1 >= 0) {
          int v595 = v591 + 1;
        }
        int v596 = v595 >> 1;
        int v597 = v592 + 2;
        if (v592 + 1 >= 0) {
          int v597 = v592 + 1;
        }
        int v1010 = v594;
        int v1038 = v596;
        int v1037 = v409;
        int v1036 = v410;
        int v1035 = v409;
        int v1034 = v410;
        if (v414 >= 0) {
          unsigned int v598 = v414;
        }
        else {
          unsigned int v598 = -v414;
        }
        if (v416 >= 0) {
          unsigned int v599 = v416;
        }
        else {
          unsigned int v599 = -v416;
        }
        if (v417 >= 0) {
          unsigned int v600 = v417;
        }
        else {
          unsigned int v600 = -v417;
        }
        if (v598 >= v599 && v598 >= v600)
        {
          v601 = &v1016;
          v602 = &v1037;
          int v603 = v409;
          goto LABEL_873;
        }
        if (v599 >= v600)
        {
          v601 = &v1014;
          v602 = &v1036;
          int v603 = v410;
          int v588 = v589;
LABEL_873:
          int *v602 = v408;
          *(_DWORD *)v601 = v590;
          int v639 = v1037;
          int v622 = v1036;
          int v590 = v588;
        }
        else
        {
          int v622 = v410;
          int v639 = v409;
          int v603 = v408;
        }
        if (v590 >= 0) {
          int v659 = v590;
        }
        else {
          int v659 = -v590;
        }
        if (v590 >= 0) {
          int v660 = v603;
        }
        else {
          int v660 = -v603;
        }
        uint64_t v991 = v397;
        if (v660 < 0)
        {
          if (v622 >= 0) {
            int v662 = v622;
          }
          else {
            int v662 = -v622;
          }
          int v663 = v662 - v394;
          int v664 = v394 - v662;
          if (v639 >= 0) {
            int v661 = v664;
          }
          else {
            int v661 = v663;
          }
          if (v639 >= 0) {
            int v665 = v639;
          }
          else {
            int v665 = -v639;
          }
          if (v622 < 0) {
            int v622 = v665 - v394;
          }
          else {
            int v622 = v394 - v665;
          }
        }
        else
        {
          int v661 = v639;
        }
        int v804 = v597 >> 1;
        if (v594 >= 0) {
          unsigned int v805 = v594;
        }
        else {
          unsigned int v805 = -v594;
        }
        if (v596 >= 0) {
          unsigned int v806 = v596;
        }
        else {
          unsigned int v806 = -v596;
        }
        if (v804 >= 0) {
          unsigned int v807 = v804;
        }
        else {
          unsigned int v807 = -v804;
        }
        if (v805 >= v806 && v805 >= v807)
        {
          v809 = &v1010;
          v810 = &v1035;
          unsigned int v807 = v805;
LABEL_1184:
          int *v810 = v408;
          int v408 = v409;
          int *v809 = v804;
          int v409 = v1035;
          int v410 = v1034;
          int v804 = v594;
        }
        else if (v806 >= v807)
        {
          v809 = &v1038;
          v810 = &v1034;
          unsigned int v807 = v806;
          int v409 = v410;
          int v594 = v596;
          goto LABEL_1184;
        }
        if (v804 >= 0) {
          int v811 = v408;
        }
        else {
          int v811 = -v408;
        }
        if (v811 < 0)
        {
          if (v410 >= 0) {
            int v813 = v410;
          }
          else {
            int v813 = -v410;
          }
          int v814 = v813 - v394;
          int v815 = v394 - v813;
          if (v409 >= 0) {
            int v812 = v815;
          }
          else {
            int v812 = v814;
          }
          if (v409 >= 0) {
            int v816 = v409;
          }
          else {
            int v816 = -v409;
          }
          if (v410 < 0) {
            int v410 = v816 - v394;
          }
          else {
            int v410 = v394 - v816;
          }
        }
        else
        {
          int v812 = v409;
        }
        int v817 = (int)v1016;
        int v818 = v661 - v1016;
        int v819 = (int)v1014;
        LODWORD(v1020) = v661 - v1016;
        HIDWORD(v1020) = v622 - v1014;
        LODWORD(v1021) = v660 - v659;
        int v820 = v1010;
        int v821 = v812 - v1010;
        int v822 = v1038;
        goto LABEL_1241;
      }
    }
    if (v420 == -1 || v398 && !*(unsigned char *)(*((void *)v1009 + 387) + v420))
    {
      unint64_t v625 = v415 * (uint64_t)v409 + v416 * (uint64_t)v410 + v417 * (uint64_t)v408;
      if ((v625 & 0x8000000000000000) != 0)
      {
        int v414 = -v414;
        int v416 = -v416;
        int v417 = -v417;
        v1022 = (void *)__PAIR64__(v416, v414);
        LODWORD(v1023) = v417;
      }
      sub_24FF6DACC(v965, v625 >> 63, &v1039);
      if (v414 >= 0) {
        unsigned int v626 = v414;
      }
      else {
        unsigned int v626 = -v414;
      }
      if (v416 >= 0) {
        unsigned int v627 = v416;
      }
      else {
        unsigned int v627 = -v416;
      }
      if (v417 >= 0) {
        unsigned int v628 = v417;
      }
      else {
        unsigned int v628 = -v417;
      }
      if (v626 >= v627 && v626 >= v628)
      {
        v630 = &v1022;
        v631 = &v1044;
        int v416 = v414;
        unint64_t v3 = v1009;
      }
      else
      {
        v630 = (void **)((char *)&v1022 + 4);
        v631 = (void **)((char *)&v1044 + 4);
        unint64_t v3 = v1009;
        int v409 = v410;
        if (v627 < v628)
        {
          if ((v417 & 0x80000000) == 0)
          {
LABEL_812:
            int v632 = (int)v1044;
            int v633 = HIDWORD(v1044);
            if (v408 < 0)
            {
              if (SHIDWORD(v1044) >= 0) {
                int v657 = HIDWORD(v1044);
              }
              else {
                int v657 = -HIDWORD(v1044);
              }
              int v658 = v657 - v394;
              int v634 = v394 - v657;
              if ((int)v1044 < 0)
              {
                int v634 = v658;
                int v632 = -(int)v1044;
              }
              if ((HIDWORD(v1044) & 0x80000000) != 0) {
                int v633 = v632 - v394;
              }
              else {
                int v633 = v394 - v632;
              }
            }
            else
            {
              int v634 = (int)v1044;
            }
            unsigned int v803 = 0;
            v1044 = (void *)__PAIR64__(v633, v634);
            goto LABEL_1253;
          }
LABEL_822:
          LODWORD(v1023) = -v417;
          int v408 = -v408;
          LODWORD(v1045[0]) = v408;
          goto LABEL_812;
        }
      }
      *(_DWORD *)v631 = v408;
      LODWORD(v1045[0]) = v409;
      *(_DWORD *)v630 = v417;
      int v408 = v409;
      int v417 = v416;
      LODWORD(v1023) = v416;
      if ((v416 & 0x80000000) == 0) {
        goto LABEL_812;
      }
      goto LABEL_822;
    }
    v604 = (_DWORD *)(v396 + 4 * (int)v420 * v392);
    int v605 = *v604 - v394;
    int v606 = v604[1] - v394;
    if (v605 >= 0) {
      int v607 = *v604 - v394;
    }
    else {
      int v607 = v394 - *v604;
    }
    if (v606 >= 0) {
      int v608 = v606;
    }
    else {
      int v608 = -v606;
    }
    int v609 = v394 - v607;
    int v610 = v608 - v394;
    if (v605 >= 0) {
      int v610 = v394 - v608;
    }
    int v611 = v607 - v394;
    if (v606 >= 0) {
      int v612 = v609;
    }
    else {
      int v612 = v611;
    }
    int v613 = v609 - v608;
    if (v609 - v608 < 0)
    {
      int v605 = v610;
      int v606 = v612;
    }
    LODWORD(v1016) = v605;
    LODWORD(v1014) = v606;
    uint64_t v614 = v417 * (uint64_t)v613 + v415 * (uint64_t)v605 + v416 * (uint64_t)v606;
    if (v614 >= 0) {
      int v615 = v414;
    }
    else {
      int v615 = -v414;
    }
    if (v614 >= 0) {
      int v616 = v416;
    }
    else {
      int v616 = -v416;
    }
    if (v614 >= 0) {
      int v617 = v417;
    }
    else {
      int v617 = -v417;
    }
    int v1010 = v615;
    int v1038 = v616;
    int v1037 = v409;
    int v1036 = v410;
    int v1035 = v409;
    int v1034 = v410;
    if (v414 >= 0) {
      unsigned int v618 = v414;
    }
    else {
      unsigned int v618 = -v414;
    }
    if (v416 >= 0) {
      unsigned int v619 = v416;
    }
    else {
      unsigned int v619 = -v416;
    }
    if (v417 >= 0) {
      unsigned int v620 = v417;
    }
    else {
      unsigned int v620 = -v417;
    }
    if (v618 >= v619 && v618 >= v620)
    {
      v640 = &v1010;
      v641 = &v1037;
      int v624 = v409;
    }
    else
    {
      if (v619 < v620)
      {
        int v622 = v410;
        int v623 = v409;
        int v624 = v408;
        goto LABEL_895;
      }
      v640 = &v1038;
      v641 = &v1036;
      int v624 = v410;
      int v615 = v616;
    }
    int *v641 = v408;
    int *v640 = v617;
    int v623 = v1037;
    int v622 = v1036;
    int v617 = v615;
LABEL_895:
    if (v617 >= 0) {
      int v659 = v617;
    }
    else {
      int v659 = -v617;
    }
    if (v617 >= 0) {
      int v660 = v624;
    }
    else {
      int v660 = -v624;
    }
    uint64_t v991 = v397;
    if (v660 < 0)
    {
      if (v622 >= 0) {
        int v666 = v622;
      }
      else {
        int v666 = -v622;
      }
      int v667 = v666 - v394;
      int v668 = v394 - v666;
      if (v623 >= 0) {
        int v661 = v668;
      }
      else {
        int v661 = v667;
      }
      if (v623 >= 0) {
        int v669 = v623;
      }
      else {
        int v669 = -v623;
      }
      if (v622 < 0) {
        int v622 = v669 - v394;
      }
      else {
        int v622 = v394 - v669;
      }
    }
    else
    {
      int v661 = v623;
    }
    if (v605 >= 0) {
      unsigned int v823 = v605;
    }
    else {
      unsigned int v823 = -v605;
    }
    if (v606 >= 0) {
      unsigned int v824 = v606;
    }
    else {
      unsigned int v824 = -v606;
    }
    if (v613 >= 0) {
      unsigned int v807 = v613;
    }
    else {
      unsigned int v807 = -v613;
    }
    if (v823 >= v824 && v823 >= v807)
    {
      v826 = &v1016;
      v827 = &v1035;
      unsigned int v807 = v823;
      goto LABEL_1222;
    }
    if (v824 >= v807)
    {
      v826 = &v1014;
      v827 = &v1034;
      unsigned int v807 = v824;
      int v409 = v410;
      int v605 = v606;
LABEL_1222:
      int *v827 = v408;
      int v408 = v409;
      *(_DWORD *)v826 = v613;
      int v409 = v1035;
      int v410 = v1034;
      int v613 = v605;
    }
    if (v613 >= 0) {
      int v811 = v408;
    }
    else {
      int v811 = -v408;
    }
    if (v811 < 0)
    {
      if (v410 >= 0) {
        int v828 = v410;
      }
      else {
        int v828 = -v410;
      }
      int v829 = v828 - v394;
      int v830 = v394 - v828;
      if (v409 >= 0) {
        int v812 = v830;
      }
      else {
        int v812 = v829;
      }
      if (v409 >= 0) {
        int v831 = v409;
      }
      else {
        int v831 = -v409;
      }
      if (v410 < 0) {
        int v410 = v831 - v394;
      }
      else {
        int v410 = v394 - v831;
      }
    }
    else
    {
      int v812 = v409;
    }
    int v817 = v1010;
    int v818 = v661 - v1010;
    int v819 = v1038;
    LODWORD(v1020) = v661 - v1010;
    HIDWORD(v1020) = v622 - v1038;
    LODWORD(v1021) = v660 - v659;
    int v820 = (int)v1016;
    int v821 = v812 - v1016;
    int v822 = (int)v1014;
LABEL_1241:
    LODWORD(v1018) = v821;
    HIDWORD(v1018) = v410 - v822;
    LODWORD(v1019) = v811 - v807;
    if (*(unsigned char *)(v1000 + 24))
    {
      int v832 = *(unsigned __int8 *)(v1000 + 8);
      uint64_t v833 = v1040;
      int v917 = *(_DWORD *)((char *)&unk_24FF7D720 + (((v1040 + 2048) >> 10) & 0x7CLL));
      int v961 = v661;
      int v930 = v820;
      unsigned int v948 = v807;
      int v939 = v819;
      int v924 = v622;
      int v834 = v659;
      int v910 = sub_24FF7C6B0((int *)&v1020, v999, v832, (unsigned __int16 **)&__b);
      LODWORD(v833) = *(_DWORD *)((char *)&unk_24FF7D720
                                + (((unint64_t)(67584 - v833) >> 10) & 0x3FFFFFFFFFFFFCLL));
      int v835 = sub_24FF7C6B0((int *)&v1018, v999, v832, (unsigned __int16 **)&__b);
      int v820 = v930;
      int v819 = v939;
      unsigned int v807 = v948;
      int v659 = v834;
      int v622 = v924;
      signed int v836 = v910 + v917;
      signed int v837 = v835 + v833;
      int v661 = v961;
LABEL_1249:
      if (v836 > v837)
      {
        int v817 = v820;
        int v819 = v822;
        int v659 = v807;
        int v661 = v812;
        int v622 = v410;
        int v660 = v811;
      }
      BOOL v838 = v836 > v837;
      goto LABEL_1252;
    }
    if (v999 >= 1)
    {
      if (v818 < 0) {
        int v818 = -v818;
      }
      signed int v836 = -(v999 * __clz(v818 + 1));
      if (v821 < 0) {
        int v821 = -v821;
      }
      signed int v837 = -(v999 * __clz(v821 + 1));
      goto LABEL_1249;
    }
    BOOL v838 = 0;
LABEL_1252:
    v1022 = (void *)__PAIR64__(v819, v817);
    LODWORD(v1023) = v659;
    v1044 = (void *)__PAIR64__(v622, v661);
    LODWORD(v1045[0]) = v660;
    sub_24FF6DACC(v965, v838, &v1040);
    unsigned int v803 = 0;
    uint64_t v2 = v1000;
    unint64_t v3 = v1009;
    int v392 = v999;
    uint64_t v397 = v991;
    int v398 = v953;
LABEL_1253:
    sub_24FF6DC40((uint64_t)v3, (uint64_t)&v1044, (uint64_t)&v1022, v392, v970, *(unsigned char *)(v2 + 8), &v1050[15 * v803 - 2]);
    uint64_t v396 = v976;
LABEL_1254:
    v397 += 4;
    if (v983 == v397)
    {
LABEL_1272:
      unint64_t v847 = 360;
      do
      {
        v848 = &v1050[v847 / 8 - 2];
        v849 = *(void **)((char *)&__p + v847);
        if (v849)
        {
          *(v848 - 2) = v849;
          operator delete(v849);
        }
        v850 = *(v848 - 6);
        if (v850)
        {
          v1045[v847 / 8] = v850;
          operator delete(v850);
        }
        v851 = &v1050[v847 / 8 - 2];
        v852 = *(void **)((char *)&v1036 + v847);
        if (v852)
        {
          *(v851 - 8) = v852;
          operator delete(v852);
        }
        v853 = *(v851 - 12);
        if (v853)
        {
          *(void *)((char *)&v1032 + v847) = v853;
          operator delete(v853);
        }
        v854 = *(v848 - 15);
        if (v854)
        {
          *(void *)((char *)&v1026 + v847) = v854;
          operator delete(v854);
        }
        v847 -= 120;
      }
      while (v847);
      goto LABEL_1284;
    }
  }
}

void sub_24FF727F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,void *a42,uint64_t a43,uint64_t a44,void *__p,uint64_t a46,uint64_t a47,void *a48,uint64_t a49,uint64_t a50,void *a51,uint64_t a52,uint64_t a53,void *a54,uint64_t a55,uint64_t a56,void *a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  if (__p) {
    operator delete(__p);
  }
  if (a48) {
    operator delete(a48);
  }
  if (a51) {
    operator delete(a51);
  }
  if (a54) {
    operator delete(a54);
  }
  if (a57) {
    operator delete(a57);
  }
  if (a69) {
    operator delete(a69);
  }
  if (a72)
  {
    STACK[0x200] = (unint64_t)a72;
    operator delete(a72);
  }
  for (uint64_t i = 240; i != -120; i -= 120)
    sub_24FF60EC8((uint64_t)&STACK[0x210] + i);
  _Unwind_Resume(a1);
}

uint64_t sub_24FF72ACC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = *(int *)(a1 + 44);
  if (v1 + v2 + 3 <= (unint64_t)*(unsigned int *)(a1 + 4))
  {
    int v4 = 0;
    int v5 = *(_DWORD *)(a1 + 40);
    unsigned int v6 = *(_DWORD *)(a1 + 24);
    do
    {
      if ((((2 << v4) - 1) | v6) > *(_DWORD *)(a1 + 28) - 1) {
        break;
      }
      ++v4;
    }
    while (v4 != 16);
    unsigned int v7 = v6 | ~(-1 << v4);
    *(_DWORD *)(a1 + 24) = v7;
    if (v5 <= 7)
    {
      int v8 = v5 - 8;
      do
        unsigned int v7 = (2 * v7) | 1;
      while (!__CFADD__(v8++, 1));
      *(_DWORD *)(a1 + 24) = v7;
      *(_DWORD *)(a1 + 40) = 8;
    }
    if (HIBYTE(v7))
    {
      ++*(unsigned char *)(v1 + *(void *)(a1 + 8) - 1);
      uint64_t v1 = *(void *)(a1 + 16);
      if (*(_DWORD *)(a1 + 44))
      {
        do
        {
          *(unsigned char *)(*(void *)(a1 + 8) + v1) = 0;
          int v10 = *(_DWORD *)(a1 + 44);
          uint64_t v1 = *(void *)(a1 + 16) + 1;
          *(void *)(a1 + 16) = v1;
          *(_DWORD *)(a1 + 44) = --v10;
        }
        while (v10);
      }
    }
    else if (v2)
    {
      do
      {
        *(unsigned char *)(*(void *)(a1 + 8) + v1) = -1;
        int v11 = *(_DWORD *)(a1 + 44);
        uint64_t v1 = *(void *)(a1 + 16) + 1;
        *(void *)(a1 + 16) = v1;
        *(_DWORD *)(a1 + 44) = --v11;
      }
      while (v11);
    }
    *(unsigned char *)(*(void *)(a1 + 8) + v1) = *(_WORD *)(a1 + 26);
    uint64_t v12 = *(void *)(a1 + 8);
    uint64_t v13 = *(void *)(a1 + 16) + 1;
    *(void *)(a1 + 16) = v13;
    *(unsigned char *)(v12 + v13) = BYTE1(*(_DWORD *)(a1 + 24));
    unint64_t v3 = *(void *)(a1 + 16) + 1;
    *(void *)(a1 + 16) = v3;
    if (v5 >= 1)
    {
      *(unsigned char *)(*(void *)(a1 + 8) + v3) = *(_DWORD *)(a1 + 24);
      unint64_t v3 = *(void *)(a1 + 16) + 1;
      *(void *)(a1 + 16) = v3;
    }
    if (v3 >= 2)
    {
      uint64_t v14 = *(void *)(a1 + 8) - 1;
      while (*(unsigned __int8 *)(v14 + v3) == 255)
      {
        *(void *)(a1 + 16) = --v3;
        if (v3 <= 1) {
          return 1;
        }
      }
    }
  }
  else
  {
    unint64_t v3 = 0;
    *(_DWORD *)a1 = 1;
  }
  return v3;
}

uint64_t sub_24FF72C68(uint64_t a1, int a2, int a3)
{
  int v4 = *(_DWORD *)(*(void *)(a1 + 64) + 4 * a2);
  unsigned int v5 = *(_DWORD *)(a1 + 576);
  unsigned int v6 = 38 - __clz(v5);
  if (v5) {
    unsigned int v7 = v6;
  }
  else {
    unsigned int v7 = 6;
  }
  signed int v8 = v4 - a3;
  if (v4 == a3)
  {
    unsigned int v9 = 1;
  }
  else
  {
    if (v8 >= 0) {
      int v10 = v4 - a3;
    }
    else {
      int v10 = a3 - v4;
    }
    unsigned int v9 = 64 - 2 * __clz(v10 + 1);
  }
  uint64_t v11 = a1 + 3560;
  uint64_t v12 = (_WORD *)(a1 + 2576);
  if (v9 < v7 || (uint64_t v13 = *(void *)(a1 + 552) + 12 * a2, v14 = *(_DWORD *)(v13 + 8), (v14 & 0x80000000) != 0))
  {
    sub_24FF6DACC(a1 + 3560, 0, v12);
    return sub_24FF72E7C(a1 + 3560, v8, 0, (_WORD *)(a1 + 2610), (_WORD *)(a1 + 2612));
  }
  else
  {
    unsigned int v15 = *(_DWORD *)(v13 + 4);
    sub_24FF6DACC(a1 + 3560, 1, v12);
    sub_24FF6DACC(a1 + 3560, v15 & 1, (_WORD *)(a1 + 2616));
    sub_24FF6DACC(a1 + 3560, (v15 >> 1) & 1, (_WORD *)(a1 + 2616 + 2 * (v15 & 1) + 2));
    sub_24FF6DACC(a1 + 3560, (v15 >> 2) & 1, (_WORD *)(a1 + 2616 + 2 * (v15 & 3) + 6));
    sub_24FF6DACC(a1 + 3560, (v15 >> 3) & 1, (_WORD *)(a1 + 2616 + 2 * (v15 & 7) + 14));
    sub_24FF6DACC(a1 + 3560, (v15 >> 4) & 1, (_WORD *)(a1 + 2616 + 2 * ((v15 & 0xF) + 15)));
    sub_24FF6DACC(a1 + 3560, (v15 >> 5) & 1, (_WORD *)(a1 + 2616 + 2 * ((v15 & 0x1F) + 31)));
    if (v14 > 2)
    {
      sub_24FF6DACC(a1 + 3560, 1, (_WORD *)(a1 + 2744));
      sub_24FF6DACC(a1 + 3560, 1, (_WORD *)(a1 + 2748));
      return sub_24FF7CC68(a1 + 3560, v14 - 3, 0, (_WORD *)(a1 + 2750));
    }
    else
    {
      char v16 = (_WORD *)(a1 + 2744);
      sub_24FF6DACC(v11, v14 & 1, v16);
      return sub_24FF6DACC(v11, (v14 >> 1) & 1, &v16[(v14 & 1) + 1]);
    }
  }
}

uint64_t sub_24FF72E7C(uint64_t a1, signed int a2, int a3, _WORD *a4, _WORD *a5)
{
  signed int v6 = a2;
  if (a2 < 0) {
    a2 = -a2;
  }
  uint64_t result = sub_24FF7CC68(a1, a2, a3, a5);
  if (v6)
  {
    return sub_24FF6DACC(a1, v6 >= 0, a4);
  }
  return result;
}

void sub_24FF72EF0(uint64_t a1, int a2)
{
  uint64_t v4 = *(int *)(*(void *)(a1 + 288) + 4 * a2);
  int v5 = *(_DWORD *)(*(void *)(a1 + 312) + 4 * a2);
  uint64_t v70 = *(void *)(a1 + 336);
  signed int v6 = (uint64_t *)(a1 + 480);
  sub_24FF73394(a1 + 480, v5);
  if (v5 < 1)
  {
    int v7 = 0;
  }
  else
  {
    int v7 = 0;
    uint64_t v8 = v5 + (int)v4;
    uint64_t v9 = v70;
    uint64_t v69 = v8;
    do
    {
      int v10 = *(_DWORD *)(v9 + 4 * v4);
      if (*(_DWORD *)(*(void *)(a1 + 40) + 4 * v10) == -1)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)(a1 + 480);
        *(_DWORD *)(v12 + 12 * v7) = v10;
        uint64_t v13 = *(void *)(a1 + 232);
        int v14 = *(_DWORD *)(v13 + 4 * v10);
        int v15 = v14;
        int v16 = *(_DWORD *)(v13 + 4 * (v10 + 1));
        uint64_t v17 = *(void *)(a1 + 208);
        int v18 = v16 - v14;
        if (v16 <= v14)
        {
          LODWORD(v19) = 0;
        }
        else
        {
          uint64_t v19 = 0;
          while (*(_DWORD *)(v17 + 4 * v14 + 4 * v19) != a2)
          {
            if (!(v14 - v16 + ++v19))
            {
              LODWORD(v19) = v16 - v14;
              int v20 = v16;
              goto LABEL_11;
            }
          }
          int v20 = v14 + v19;
LABEL_11:
          if (v20 != v14)
          {
            uint64_t v71 = v11;
            sub_24FF5F2F4(a1 + 360, v18);
            uint64_t v21 = *(unsigned char **)(a1 + 360);
            uint64_t v17 = *(void *)(a1 + 208);
            if (v18 >= 1)
            {
              int v22 = v19;
              uint64_t v23 = *(_DWORD **)(a1 + 360);
              uint64_t v24 = (v16 - v14);
              do
              {
                *v23++ = *(_DWORD *)(v17 + 4 * (v22 % v18 + v14));
                ++v22;
                --v24;
              }
              while (v24);
            }
            uint64_t v25 = *(unsigned char **)(a1 + 368);
            int v15 = v14;
            if (v25 != v21)
            {
              memmove((void *)(v17 + 4 * v14), v21, v25 - v21);
              int v15 = v14;
              uint64_t v17 = *(void *)(a1 + 208);
            }
            uint64_t v9 = v70;
            uint64_t v11 = v71;
            uint64_t v8 = v69;
          }
        }
        uint64_t v26 = v12 + 12 * v7;
        *(_DWORD *)(v26 + 8) = *(_DWORD *)(v17 + 4 * (v16 - 1));
        *(_DWORD *)(v26 + 4) = *(_DWORD *)(v17 + 4 * (v15 + 1));
        *(_DWORD *)(*(void *)(a1 + 256) + 4 * v11) = v19;
        ++v7;
      }
      ++v4;
    }
    while (v4 < v8);
  }
  sub_24FF73394((uint64_t)v6, v7);
  uint64_t v27 = (void *)(a1 + 432);
  signed int v28 = (void **)(a1 + 456);
  sub_24FF5F2F4(a1 + 432, v7);
  sub_24FF5F2F4(a1 + 456, 1uLL);
  **(_DWORD **)(a1 + 456) = 0;
  if (v7 >= 1)
  {
    int v29 = 0;
    do
    {
      int v30 = (int *)(*(void *)(a1 + 480) + 12 * (v7 - 1));
      *(_DWORD *)(*(void *)(a1 + 40) + 4 * *v30) = -2;
      int v31 = v30[1];
      int v32 = v30[2];
      int v33 = *v30;
      int v34 = v29 + 1;
      *(_DWORD *)(*(void *)(a1 + 432) + 4 * v29) = v33;
      unsigned int v35 = v7 - 2;
      if (v7 < 2)
      {
        int v7 = 0;
      }
      else
      {
        --v7;
        do
        {
          uint64_t v36 = *v6;
          if (*(_DWORD *)(*v6 + 12 * v35 + 4) == v32)
          {
            uint64_t v37 = (int *)(v36 + 12 * v35);
            uint64_t v38 = *v37;
            *(_DWORD *)(*(void *)(a1 + 40) + 4 * v38) = -2;
            *(_DWORD *)(*(void *)(a1 + 432) + 4 * v34++) = v38;
            int v32 = v37[2];
            unsigned int v35 = v7 - 1;
            uint64_t v39 = v36 + 12 * (v7 - 1);
            uint64_t v40 = *(void *)v37;
            int v41 = *(_DWORD *)(v39 + 8);
            *(void *)uint64_t v37 = *(void *)v39;
            v37[2] = v41;
            *(void *)uint64_t v39 = v40;
            *(_DWORD *)(v39 + 8) = v32;
            --v7;
          }
        }
        while ((int)v35-- > 0);
        if (v7 > 0)
        {
          if (v29 != v34)
          {
            uint64_t v43 = (_DWORD *)(*v27 + 4 * v34 - 4);
            if ((unint64_t)v43 > *v27 + 4 * v29)
            {
              unint64_t v44 = *v27 + 4 * v29 + 4;
              do
              {
                int v45 = *(_DWORD *)(v44 - 4);
                *(_DWORD *)(v44 - 4) = *v43;
                *v43-- = v45;
                BOOL v46 = v44 >= (unint64_t)v43;
                v44 += 4;
              }
              while (!v46);
            }
          }
          int v47 = v7;
          do
          {
            --v47;
            uint64_t v48 = *v6;
            if (*(_DWORD *)(*v6 + 12 * v47 + 8) == v31)
            {
              unsigned int v49 = (int *)(v48 + 12 * v47);
              uint64_t v50 = *v49;
              *(_DWORD *)(*(void *)(a1 + 40) + 4 * v50) = -2;
              *(_DWORD *)(*(void *)(a1 + 432) + 4 * v34++) = v50;
              int v47 = v7 - 1;
              uint64_t v51 = v48 + 12 * (v7 - 1);
              int v31 = v49[1];
              int v52 = v49[2];
              uint64_t v53 = *(void *)v49;
              int v54 = *(_DWORD *)(v51 + 8);
              *(void *)unsigned int v49 = *(void *)v51;
              v49[2] = v54;
              *(void *)uint64_t v51 = v53;
              *(_DWORD *)(v51 + 8) = v52;
              --v7;
            }
          }
          while (v47 > 0);
          if (v29 != v34)
          {
            unint64_t v55 = (_DWORD *)(*v27 + 4 * v34 - 4);
            if ((unint64_t)v55 > *v27 + 4 * v29)
            {
              unint64_t v56 = *v27 + 4 * v29 + 4;
              do
              {
                int v57 = *(_DWORD *)(v56 - 4);
                *(_DWORD *)(v56 - 4) = *v55;
                *v55-- = v57;
                BOOL v46 = v56 >= (unint64_t)v55;
                v56 += 4;
              }
              while (!v46);
            }
          }
        }
      }
      int v29 = v34;
      uint64_t v59 = *(char **)(a1 + 464);
      unint64_t v58 = *(void *)(a1 + 472);
      if ((unint64_t)v59 >= v58)
      {
        uint64_t v61 = (char *)*v28;
        uint64_t v62 = (v59 - (unsigned char *)*v28) >> 2;
        unint64_t v63 = v62 + 1;
        if ((unint64_t)(v62 + 1) >> 62) {
          sub_24FF5A660();
        }
        uint64_t v64 = v58 - (void)v61;
        if (v64 >> 1 > v63) {
          unint64_t v63 = v64 >> 1;
        }
        if ((unint64_t)v64 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v65 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v65 = v63;
        }
        if (v65)
        {
          uint64_t v66 = (char *)sub_24FF698E0(a1 + 472, v65);
          uint64_t v61 = *(char **)(a1 + 456);
          uint64_t v59 = *(char **)(a1 + 464);
        }
        else
        {
          uint64_t v66 = 0;
        }
        int v67 = &v66[4 * v62];
        *(_DWORD *)int v67 = v29;
        uint64_t v60 = v67 + 4;
        while (v59 != v61)
        {
          int v68 = *((_DWORD *)v59 - 1);
          v59 -= 4;
          *((_DWORD *)v67 - 1) = v68;
          v67 -= 4;
        }
        *(void *)(a1 + 456) = v67;
        *(void *)(a1 + 464) = v60;
        *(void *)(a1 + 472) = &v66[4 * v65];
        if (v61) {
          operator delete(v61);
        }
      }
      else
      {
        *(_DWORD *)uint64_t v59 = v29;
        uint64_t v60 = v59 + 4;
      }
      *(void *)(a1 + 464) = v60;
    }
    while (v7 > 0);
  }
}

void sub_24FF73394(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = *(_DWORD **)a1;
  unint64_t v3 = *(_DWORD **)(a1 + 8);
  unint64_t v5 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v3 - *(void *)a1) >> 2);
  unint64_t v6 = a2 - v5;
  if (a2 <= v5)
  {
    if (a2 >= v5) {
      return;
    }
    uint64_t v19 = &v4[3 * a2];
    goto LABEL_20;
  }
  uint64_t v7 = *(void *)(a1 + 16);
  if (0xAAAAAAAAAAAAAAABLL * ((v7 - (uint64_t)v3) >> 2) >= v6)
  {
    memset(*(void **)(a1 + 8), 255, 12 * ((12 * v6 - 12) / 0xC) + 12);
    uint64_t v19 = &v3[3 * ((12 * v6 - 12) / 0xC) + 3];
LABEL_20:
    *(void *)(a1 + 8) = v19;
    return;
  }
  if (a2 > 0x1555555555555555) {
    sub_24FF5A660();
  }
  unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((v7 - (uint64_t)v4) >> 2);
  uint64_t v9 = 2 * v8;
  if (2 * v8 <= a2) {
    uint64_t v9 = a2;
  }
  if (v8 >= 0xAAAAAAAAAAAAAAALL) {
    unint64_t v10 = 0x1555555555555555;
  }
  else {
    unint64_t v10 = v9;
  }
  if (v10 > 0x1555555555555555) {
    sub_24FF5A6B0();
  }
  uint64_t v11 = 3 * v10;
  uint64_t v12 = (char *)operator new(12 * v10);
  uint64_t v13 = &v12[12 * v5];
  int v14 = &v12[4 * v11];
  size_t v15 = 12 * ((12 * v6 - 12) / 0xC) + 12;
  memset(v13, 255, v15);
  int v16 = &v13[v15];
  if (v3 != v4)
  {
    do
    {
      uint64_t v17 = *(void *)(v3 - 3);
      v3 -= 3;
      int v18 = v3[2];
      *(void *)(v13 - 12) = v17;
      v13 -= 12;
      *((_DWORD *)v13 + 2) = v18;
    }
    while (v3 != v4);
    unint64_t v3 = v4;
  }
  *(void *)a1 = v13;
  *(void *)(a1 + 8) = v16;
  *(void *)(a1 + 16) = v14;
  if (v3)
  {
    operator delete(v3);
  }
}

uint64_t sub_24FF73540(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v3 = a3;
  uint64_t v5 = *(void *)(a1 + 184);
  unint64_t v6 = (int32x2_t *)(v5 + 12 * a2);
  uint64_t v7 = (int *)(*(void *)(a1 + 136) + 12 * a2);
  int v8 = *v7;
  int v9 = v7[1];
  int v10 = v7[2];
  int v11 = *(_DWORD *)(a3 + 12);
  if (v11 == 1)
  {
    if (v10 != -1)
    {
      unsigned int v12 = 0;
      int v18 = (int32x2_t *)(v5 + 12 * v8);
      uint64_t v19 = (int32x2_t *)(v5 + 12 * v9);
      int v20 = (int32x2_t *)(v5 + 12 * v10);
      int32x2_t v16 = vsub_s32(vadd_s32(*v19, *v18), *v20);
      int v17 = v19[1].i32[0] + v18[1].i32[0] - v20[1].i32[0];
      goto LABEL_38;
    }
  }
  else if (v11 == 2)
  {
    if (v10 == -1)
    {
      if (v9 == -1)
      {
        if (v8 == -1)
        {
          int v17 = 0;
          unsigned int v12 = -*(char *)(a3 + 21);
          int32x2_t v16 = 0;
        }
        else
        {
          unsigned int v12 = 0;
          int v31 = (int32x2_t *)(v5 + 12 * v8);
          int32x2_t v16 = *v31;
          int v17 = v31[1].i32[0];
        }
      }
      else
      {
        unsigned int v12 = 0;
        uint64_t v27 = (int32x2_t *)(v5 + 12 * v8);
        signed int v28 = (int32x2_t *)(v5 + 12 * v9);
        uint32x2_t v29 = (uint32x2_t)vadd_s32(*v28, *v27);
        LODWORD(v27) = v27[1].i32[0];
        LODWORD(v28) = v28[1].i32[0];
        BOOL v24 = __OFADD__(v28, v27);
        int v30 = v28 + v27;
        int32x2_t v16 = vshr_n_s32((int32x2_t)vsra_n_u32(v29, v29, 0x1FuLL), 1uLL);
        if (v30 < 0 != v24) {
          ++v30;
        }
        int v17 = v30 >> 1;
      }
    }
    else
    {
      unsigned int v12 = 0;
      uint64_t v13 = (int32x2_t *)(v5 + 12 * v8);
      int v14 = (int32x2_t *)(v5 + 12 * v9);
      size_t v15 = (int32x2_t *)(v5 + 12 * v10);
      int32x2_t v16 = vsub_s32(vadd_s32(*v14, *v13), *v15);
      int v17 = v14[1].i32[0] + v13[1].i32[0] - v15[1].i32[0];
    }
    int v32 = (int *)(*(void *)(a1 + 160) + 12 * a2);
    int v33 = v32[2];
    if (v33 != -1)
    {
      int v34 = (int32x2_t *)(v5 + 12 * *v32);
      unsigned int v35 = (int32x2_t *)(v5 + 12 * v32[1]);
      __int32 v36 = v34[1].i32[0];
      uint64_t v37 = (const float *)&v35[1];
      uint64_t v38 = (int32x2_t *)(v5 + 12 * v33);
      uint64_t v39 = (int32x2_t *)(v5 + 12 * v9);
      uint64_t v40 = (int32x2_t *)(v5 + 12 * v8);
      __int32 v41 = v40[1].i32[0];
      BOOL v24 = __OFADD__(v41, v36);
      int v42 = v41 + v36;
      v43.i32[0] = v36;
      v43.i32[1] = v39[1].i32[0];
      int32x2_t v44 = (int32x2_t)vld1_dup_f32(v37);
      int32x2_t v45 = vadd_s32(v43, v44);
      if (v42 < 0 != v24) {
        int v46 = v42 + 1;
      }
      else {
        int v46 = v42;
      }
      int v47 = (int32x2_t *)(v5 + 12 * v10);
      v48.i32[0] = v38[1].i32[0];
      v48.i32[1] = v46 >> 1;
      int32x2_t v49 = vsub_s32(v45, v48);
      int v50 = 2 * v45.i32[1];
      int32x2_t v51 = vsub_s32(vadd_s32(*v35, *v34), *v38);
      int32x2_t v52 = vadd_s32(*v39, *v35);
      uint32x2_t v53 = (uint32x2_t)vadd_s32(*v40, *v34);
      int32x2_t v54 = (int32x2_t)vsra_n_u32(v53, v53, 0x1FuLL);
      int32x2_t v55 = vsub_s32(v52, vshr_n_s32(v54, 1uLL));
      int64x2_t v56 = vmull_s32(vsub_s32(vsra_n_s32(vadd_s32(v52, v52), v54, 1uLL), vadd_s32(*v38, *v47)), vdup_n_s32(0x55555556u));
      int32x2_t v57 = vadd_s32(vshrn_n_s64(v56, 0x20uLL), vmovn_s64((int64x2_t)vshrq_n_u64((uint64x2_t)v56, 0x3FuLL)));
      unint64_t v58 = 1431655766 * (v50 + (v46 >> 1) - (v38[1].i32[0] + v47[1].i32[0]));
      int v59 = HIDWORD(v58) + (v58 >> 63);
      uint64_t v60 = (_WORD *)(a1 + 2752);
      int32x2_t v90 = v16;
      int32x2_t v97 = v49;
      if (*(unsigned char *)(v3 + 20))
      {
        __int32 v61 = v6[1].i32[0];
        int32x2_t v62 = *v6;
        int32x2_t v98 = vsub_s32(*v6, v16);
        __int32 v99 = v61 - v17;
        int v63 = *(unsigned __int8 *)(v3 + 8);
        int v64 = *(unsigned __int16 *)(a1 + 2752);
        int v95 = HIDWORD(v58) + (v58 >> 63);
        int v65 = *(unsigned __int16 *)(a1 + 2754);
        int v93 = (__int32 *)((char *)&unk_24FF7D720 + (((v65 + 2048) >> 10) & 0x7CLL));
        unsigned int v94 = sub_24FF7C6B0((int *)&v98, 3, v63, (unsigned __int16 **)(a1 + 2880));
        int32x2_t v98 = vsub_s32(v62, v51);
        __int32 v99 = v61 - v97.i32[0];
        uint64_t v96 = v3;
        int v66 = *(unsigned __int16 *)(a1 + 2756);
        unsigned int v91 = sub_24FF7C6B0((int *)&v98, 3, v63, (unsigned __int16 **)(a1 + 2880));
        int32x2_t v98 = vsub_s32(v62, v55);
        unsigned int v67 = 67584 - v65;
        int v59 = v95;
        v68.i32[0] = *(_DWORD *)((char *)&unk_24FF7D720 + (((v66 + 2048) >> 10) & 0x7CLL));
        v68.i32[1] = *(_DWORD *)((char *)&unk_24FF7D720 + ((v67 >> 10) & 0x7CLL));
        __int32 v99 = v61 - v97.i32[1];
        v69.i32[0] = *(_DWORD *)((char *)&unk_24FF7D720 + (((67584 - v64) >> 10) & 0x7CLL));
        v69.i32[1] = *(_DWORD *)((char *)&unk_24FF7D720 + (((v64 + 2048) >> 10) & 0x7CLL));
        int32x2_t v92 = vadd_s32(vadd_s32(v68, v69), (int32x2_t)__PAIR64__(sub_24FF7C6B0((int *)&v98, 3, v63, (unsigned __int16 **)(a1 + 2880)), v91));
        int32x2_t v98 = vsub_s32(v62, v57);
        __int32 v99 = v61 - v95;
        unsigned int v70 = 67584 - v66;
        uint64_t v3 = v96;
        v68.i32[0] = *(_DWORD *)((char *)&unk_24FF7D720 + ((v70 >> 10) & 0x7CLL));
        v68.i32[1] = *v93;
        int32x2_t v71 = vadd_s32(v68, v69);
        unsigned int v72 = sub_24FF7C6B0((int *)&v98, 3, v63, (unsigned __int16 **)(a1 + 2880));
        int32x2_t v73 = v92;
        uint64_t v60 = (_WORD *)(a1 + 2752);
        int32x2_t v74 = vadd_s32(v71, (int32x2_t)__PAIR64__(v94, v72));
      }
      else
      {
        int v75 = (const float *)v6;
        int32x2_t v76 = (int32x2_t)vld1_dup_f32(v75++);
        int v77 = (const float *)&v6[1];
        int32x2_t v78 = (int32x2_t)vld1_dup_f32(v75);
        int32x2_t v79 = (int32x2_t)vld1_dup_f32(v77);
        int32x2_t v73 = vneg_s32(vadd_s32(vadd_s32(vclz_s32(vaba_s32((int32x2_t)0x100000001, v76, vzip1_s32(v51, v55))), vclz_s32(vaba_s32((int32x2_t)0x100000001, v78, vzip2_s32(v51, v55)))), vclz_s32(vaba_s32((int32x2_t)0x100000001, v79, v49))));
        int32x2_t v74 = vneg_s32(vadd_s32(vadd_s32(vclz_s32(vaba_s32((int32x2_t)0x100000001, v76, vzip1_s32(v57, v16))), vclz_s32(vaba_s32((int32x2_t)0x100000001, v78, vzip2_s32(v57, v16)))), vclz_s32(vaba_s32((int32x2_t)0x100000001, v79, (int32x2_t)__PAIR64__(v17, v59)))));
      }
      if (v73.i32[0] < v74.i32[1]
        && (int32x2_t v80 = vcgt_s32((int32x2_t)__PAIR64__(v73.u32[1], v74.u32[0]), vdup_lane_s32(v73, 0)), (v80.i8[4] & 1) != 0)
        && (v80.i8[0] & 1) != 0)
      {
        int v81 = 0;
        int v17 = v97.i32[0];
        int v82 = 1;
        uint64_t v83 = 2;
      }
      else
      {
        int32x2_t v84 = vcgt_s32(v74, vdup_lane_s32(v73, 1));
        if (v84.i8[4] & v84.i8[0])
        {
          int v82 = 0;
          int v17 = v97.i32[1];
          int v81 = 1;
          uint64_t v83 = 1;
          int32x2_t v51 = v55;
        }
        else if (v74.i32[0] >= v74.i32[1])
        {
          int v81 = 0;
          int v82 = 0;
          uint64_t v83 = 1;
          int32x2_t v51 = v90;
        }
        else
        {
          int v81 = 1;
          uint64_t v83 = 2;
          int v17 = v59;
          int v82 = 1;
          int32x2_t v51 = v57;
        }
      }
      sub_24FF6DACC(a1 + 3560, v82, v60);
      sub_24FF6DACC(a1 + 3560, v81, (_WORD *)(a1 + 2 * v83 + 2752));
      unsigned int v12 = 1;
      int32x2_t v16 = v51;
    }
    goto LABEL_38;
  }
  if (v9 == -1)
  {
    if (v8 == -1)
    {
      int v17 = 0;
      unsigned int v12 = -*(char *)(a3 + 21);
      int32x2_t v16 = 0;
    }
    else
    {
      unsigned int v12 = 0;
      uint64_t v26 = (int32x2_t *)(v5 + 12 * v8);
      int32x2_t v16 = *v26;
      int v17 = v26[1].i32[0];
    }
  }
  else
  {
    unsigned int v12 = 0;
    uint64_t v21 = (int32x2_t *)(v5 + 12 * v8);
    int v22 = (int32x2_t *)(v5 + 12 * v9);
    uint32x2_t v23 = (uint32x2_t)vadd_s32(*v22, *v21);
    LODWORD(v21) = v21[1].i32[0];
    LODWORD(v22) = v22[1].i32[0];
    BOOL v24 = __OFADD__(v22, v21);
    int v25 = v22 + v21;
    int32x2_t v16 = vshr_n_s32((int32x2_t)vsra_n_u32(v23, v23, 0x1FuLL), 1uLL);
    if (v25 < 0 != v24) {
      ++v25;
    }
    int v17 = v25 >> 1;
  }
LABEL_38:
  __int32 v85 = v6[1].i32[0] - v17;
  int32x2_t v98 = vsub_s32(*v6, v16);
  __int32 v99 = v85;
  if ((v12 & 0x80000000) != 0)
  {
    uint64_t v88 = a1;
    char v87 = 3;
    int v86 = 0;
  }
  else
  {
    int v86 = (void *)(a1 + 120 * v12 + 2760);
    char v87 = *(unsigned char *)(v3 + 8);
    uint64_t v88 = a1;
  }
  return sub_24FF73BDC(v88, (uint64_t)&v98, v87, v86);
}

uint64_t sub_24FF73BDC(uint64_t result, uint64_t a2, char a3, void *a4)
{
  uint64_t v6 = result + 3560;
  switch(a3)
  {
    case 0:
      uint64_t v7 = 0;
      uint64_t v8 = 0;
      uint64_t v9 = 124;
      while (1)
      {
        unsigned int v10 = *(_DWORD *)(a2 + v7);
        int v11 = (_WORD *)(*a4 + v8);
        uint64_t v12 = v6;
        if (v10)
        {
          sub_24FF6DACC(v6, 1, v11);
          uint64_t v13 = (_WORD *)(a4[3] + v8);
          if ((v10 & 0x80000000) != 0)
          {
            sub_24FF6DACC(v6, 0, v13);
            unsigned int v10 = -v10;
          }
          else
          {
            sub_24FF6DACC(v6, 1, v13);
          }
          uint64_t v15 = a4[6];
          uint64_t v16 = v15 + v9;
          int v17 = (_WORD *)(v15 + v9 - 124);
          if (v10 > 0x3F)
          {
            sub_24FF6DACC(v6, 1, v17);
            sub_24FF6DACC(v6, 1, (_WORD *)(v16 - 120));
            sub_24FF6DACC(v6, 1, (_WORD *)(v16 - 112));
            sub_24FF6DACC(v6, 1, (_WORD *)(v16 - 96));
            sub_24FF6DACC(v6, 1, (_WORD *)(v16 - 64));
            sub_24FF6DACC(v6, 1, (_WORD *)(v15 + v9));
            uint64_t result = sub_24FF7CC68(v6, v10 - 64, *(_DWORD *)(a4[12] + v7), (_WORD *)(a4[9] + v8));
            goto LABEL_12;
          }
          unsigned int v18 = v10 - 1;
          sub_24FF6DACC(v6, (v10 - 1) & 1, v17);
          sub_24FF6DACC(v6, ((v10 - 1) >> 1) & 1, (_WORD *)(v15 + 2 * (((_BYTE)v10 + 1) & 1) + v9 - 122));
          sub_24FF6DACC(v6, (v18 >> 2) & 1, (_WORD *)(v15 + 2 * (v18 & 3) + v9 - 118));
          sub_24FF6DACC(v6, (v18 >> 3) & 1, (_WORD *)(v15 + 2 * (v18 & 7) + v9 - 110));
          sub_24FF6DACC(v6, (v18 >> 4) & 1, (_WORD *)(v15 + 2 * (v18 & 0xF) + v9 - 94));
          unsigned int v14 = ((v10 - 1) >> 5) & 1;
          int v11 = (_WORD *)(v15 + 2 * ((v10 - 1) & 0x1FLL) + v9 - 62);
          uint64_t v12 = v6;
        }
        else
        {
          unsigned int v14 = 0;
        }
        uint64_t result = sub_24FF6DACC(v12, v14, v11);
LABEL_12:
        v9 += 128;
        v8 += 2;
        v7 += 4;
        if (v9 == 508) {
          return result;
        }
      }
    case 2:
      uint64_t v19 = 0;
      uint64_t v20 = 0;
      while (1)
      {
        signed int v21 = *(_DWORD *)(a2 + v20);
        uint64_t v22 = a4[12];
        uint64_t result = sub_24FF72E7C(v6, v21, *(_DWORD *)(v22 + v20), (_WORD *)(a4[3] + v19), (_WORD *)(a4[9] + v19));
        unsigned int v23 = v21 >= 0 ? v21 : -v21;
        int v24 = *(_DWORD *)(v22 + v20);
        unsigned int v25 = v23 >> v24;
        if (v24 && v25 == 0) {
          break;
        }
        if (v25 >= 2)
        {
          int v27 = 1;
LABEL_25:
          *(_DWORD *)(v22 + v20) = v27 + v24;
        }
        v20 += 4;
        v19 += 2;
        if (v20 == 12) {
          return result;
        }
      }
      int v27 = -1;
      goto LABEL_25;
    case 3:
      uint64_t v28 = 0;
      uint64_t v29 = result + 12;
      do
      {
        int v30 = *(_DWORD *)(v29 + 4 * v28);
        if (v30 >= 1)
        {
          int v31 = 0;
          unsigned int v32 = *(_DWORD *)(a2 + 4 * v28);
          do
          {
            __int16 v48 = 0x8000;
            uint64_t result = sub_24FF6DACC(v6, (v32 >> v31++) & 1, &v48);
          }
          while (v30 != v31);
        }
        ++v28;
      }
      while (v28 != 3);
      return result;
    case 4:
      uint64_t v33 = 0;
      uint64_t v34 = 0;
      uint64_t v35 = 124;
      break;
    default:
      return result;
  }
  do
  {
    unsigned int v36 = *(_DWORD *)(a2 + v33);
    uint64_t v37 = (_WORD *)(*a4 + v34);
    uint64_t v38 = v6;
    if (!v36)
    {
      int v40 = 0;
LABEL_42:
      uint64_t result = sub_24FF6DACC(v38, v40, v37);
      goto LABEL_49;
    }
    sub_24FF6DACC(v6, 1, v37);
    uint64_t v39 = (_WORD *)(a4[3] + v34);
    if ((v36 & 0x80000000) != 0)
    {
      sub_24FF6DACC(v6, 0, v39);
      unsigned int v36 = -v36;
    }
    else
    {
      sub_24FF6DACC(v6, 1, v39);
    }
    unint64_t v41 = v36 - 1;
    int v42 = (_WORD *)(a4[6] + v35);
    int32x2_t v43 = v42 - 62;
    if (v36 <= 0x3F)
    {
      sub_24FF6DACC(v6, (v41 >> 5) & 1, v43);
      sub_24FF6DACC(v6, (v41 >> 4) & 1, (_WORD *)((char *)v42 + ((v41 >> 4) & 0xFFFFFFE) - 122));
      sub_24FF6DACC(v6, (v41 >> 3) & 1, (_WORD *)((char *)v42 + ((v41 >> 3) & 0x1FFFFFFE) - 118));
      sub_24FF6DACC(v6, (v41 >> 2) & 1, (_WORD *)((char *)v42 + ((v41 >> 2) & 0x3FFFFFFE) - 110));
      sub_24FF6DACC(v6, (v41 >> 1) & 1, (_WORD *)((char *)v42 + ((v41 >> 1) & 0x7FFFFFFE) - 94));
      int v40 = ((_BYTE)v36 - 1) & 1;
      uint64_t v37 = (_WORD *)((char *)v42 + (v41 & 0xFFFFFFFE) - 62);
      uint64_t v38 = v6;
      goto LABEL_42;
    }
    sub_24FF6DACC(v6, 1, v43);
    sub_24FF6DACC(v6, 1, v42 - 60);
    sub_24FF6DACC(v6, 1, v42 - 56);
    sub_24FF6DACC(v6, 1, v42 - 48);
    sub_24FF6DACC(v6, 1, v42 - 32);
    sub_24FF6DACC(v6, 1, v42);
    uint64_t v44 = a4[12];
    uint64_t result = sub_24FF7CC68(v6, v36 - 64, *(_DWORD *)(v44 + v33), (_WORD *)(a4[9] + v34));
    int v45 = *(_DWORD *)(v44 + v33);
    unsigned int v46 = v41 >> v45;
    if (!v45 || v46)
    {
      if (v46 < 2) {
        goto LABEL_49;
      }
      int v47 = v45 + 1;
    }
    else
    {
      int v47 = v45 - 1;
    }
    *(_DWORD *)(v44 + v33) = v47;
LABEL_49:
    v35 += 128;
    v34 += 2;
    v33 += 4;
  }
  while (v35 != 508);
  return result;
}

unint64_t sub_24FF7409C(uint64_t a1, int a2, int a3, unsigned int a4, int *a5, uint64_t a6)
{
  uint64_t v9 = (int *)(*(void *)(a1 + 528) + 16 * a2);
  unsigned int v10 = (int *)(*(void *)(a1 + 456) + 4 * a3);
  uint64_t v12 = *v10;
  uint64_t v11 = v10[1];
  int v13 = *(_DWORD *)(a1 + 36);
  if (v13)
  {
    if (v13 == 1)
    {
      int v14 = 2 * (v11 - v12);
    }
    else if ((int)v11 <= (int)v12)
    {
      int v14 = 0;
    }
    else
    {
      int v14 = 0;
      uint64_t v15 = v11 - v12;
      uint64_t v16 = (int *)(*(void *)(a1 + 432) + 4 * v12);
      do
      {
        uint64_t v17 = *v16++;
        int v14 = v14 - *(_DWORD *)(*(void *)(a1 + 232) + 4 * v17) + *(_DWORD *)(*(void *)(a1 + 232) + 4 * v17 + 4) - 2;
        --v15;
      }
      while (v15);
    }
  }
  else
  {
    int v14 = v11 - v12;
  }
  int v133 = *(_DWORD *)a1;
  int v18 = *v9;
  int v19 = v9[1];
  uint64_t v20 = (void *)(a1 + 408);
  unint64_t v21 = v14 + 1;
  int v137 = (_DWORD **)(a1 + 384);
  sub_24FF5F2F4(a1 + 384, v21);
  uint64_t v22 = *(void *)(a1 + 408);
  unint64_t v23 = *(void *)(a1 + 416) - v22;
  if (v21 <= v23)
  {
    int v24 = v137;
    if (v21 < v23) {
      *(void *)(a1 + 416) = v22 + v21;
    }
  }
  else
  {
    sub_24FF69DDC((unint64_t *)(a1 + 408), v21 - v23);
    int v24 = v137;
  }
  if ((int)v12 < (int)v11)
  {
    int v25 = 0;
    uint64_t v26 = *(void *)(a1 + 432);
    uint64_t v27 = *(void *)(a1 + 112);
    uint64_t v28 = *(void *)(a1 + 40);
    uint64_t v29 = v12;
    uint64_t v30 = *(void *)(a1 + 232);
    do
    {
      uint64_t v31 = *(int *)(v26 + 4 * v29);
      *(_DWORD *)(v27 + 4 * *(int *)(a1 + 284)) = v31;
      int v32 = *(_DWORD *)(a1 + 284);
      *(_DWORD *)(a1 + 284) = v32 + 1;
      *(_DWORD *)(v28 + 4 * v31) = v32;
      int v33 = *(_DWORD *)(v30 + 4 * v31);
      if (v29 == v12) {
        int v34 = 1;
      }
      else {
        int v34 = 2;
      }
      int v35 = v33 + v34;
      uint64_t v36 = *(int *)(v30 + 4 * ((int)v31 + 1));
      if (v33 + v34 < (int)v36)
      {
        uint64_t v37 = v36 - v35;
        uint64_t v38 = (int *)(*(void *)(a1 + 208) + 4 * v35);
        uint64_t v39 = (_DWORD *)(*(void *)(a1 + 384) + 4 * v25);
        int v25 = v25 + v36 - v35;
        do
        {
          int v40 = *v38++;
          *v39++ = v40;
          --v37;
        }
        while (v37);
      }
      ++v29;
    }
    while (v29 != v11);
  }
  if (**v24 == v19 || (*v24)[v14] != v18)
  {
    if ((v14 & 0x80000000) == 0)
    {
      uint64_t v47 = 0;
      do
      {
        int v48 = *(_DWORD *)(*(void *)(a1 + 384) + 4 * v47);
        uint64_t v49 = *(void *)(a1 + 64);
        int v50 = *(_DWORD *)(v49 + 4 * v48);
        if (v50 == -1)
        {
          *(_DWORD *)(v49 + 4 * v48) = *(_DWORD *)(a1 + 280);
          uint64_t v51 = *(int *)(a1 + 280);
          *(_DWORD *)(a1 + 280) = v51 + 1;
          *(_DWORD *)(*(void *)(a1 + 88) + 4 * v51) = v48;
        }
        *(unsigned char *)(*v20 + v47++) = v50 == -1;
      }
      while (v21 != v47);
    }
  }
  else if ((v14 & 0x80000000) == 0)
  {
    uint64_t v41 = v14;
    do
    {
      int v42 = *(_DWORD *)(*(void *)(a1 + 384) + 4 * v41);
      uint64_t v43 = *(void *)(a1 + 64);
      int v44 = *(_DWORD *)(v43 + 4 * v42);
      if (v44 == -1)
      {
        *(_DWORD *)(v43 + 4 * v42) = *(_DWORD *)(a1 + 280);
        uint64_t v45 = *(int *)(a1 + 280);
        *(_DWORD *)(a1 + 280) = v45 + 1;
        *(_DWORD *)(*(void *)(a1 + 88) + 4 * v45) = v42;
      }
      *(unsigned char *)(*v20 + v41) = v44 == -1;
      BOOL v46 = v41-- <= 0;
    }
    while (!v46);
  }
  int32x2_t v52 = *(int **)(a1 + 384);
  uint64_t v53 = *v52;
  uint64_t v54 = v52[v14];
  int32x2_t v55 = *(unsigned __int8 **)(a1 + 408);
  int v132 = *v55;
  BOOL v56 = v132 == 0;
  int v57 = v55[v14];
  BOOL v58 = v55[v14] == 0;
  BOOL v59 = v53 == v19 && v132 == 0;
  BOOL v60 = v54 == v18 && v58;
  BOOL v129 = v59;
  char v130 = v60;
  int v61 = !v59;
  int v62 = !v60;
  int v136 = v14;
  uint64_t v127 = v53;
  uint64_t v128 = v54;
  int v131 = v57;
  if ((v61 & 1) != 0 || v62)
  {
    if ((v58 | v61) == 1)
    {
      char v64 = v61 ^ 1;
      if (v57) {
        char v64 = 0;
      }
      if (v64)
      {
        int v63 = 2;
      }
      else if ((v56 | v62) == 1)
      {
        BOOL v65 = v132 != 0;
        if (v57) {
          BOOL v65 = 0;
        }
        if (v65)
        {
          int v63 = 4;
        }
        else
        {
          BOOL v66 = v60;
          if (v132) {
            BOOL v66 = 0;
          }
          if (v66)
          {
            int v63 = 5;
          }
          else
          {
            BOOL v67 = !v58;
            if (v132) {
              BOOL v67 = 0;
            }
            if (v67)
            {
              int v63 = 6;
            }
            else if (v56 || v58)
            {
              int v63 = 8;
            }
            else
            {
              int v63 = 7;
            }
          }
        }
      }
      else
      {
        int v63 = 3;
      }
    }
    else
    {
      int v63 = 1;
    }
  }
  else
  {
    int v63 = 0;
  }
  *a5 = v63;
  sub_24FF6DACC(a1 + 3560, v63 == 0, (_WORD *)(a1 + 16 * a4 + 2494));
  if (*a5)
  {
    unsigned int v68 = *a5 - 1;
    uint64_t v69 = a1 + 16 * a4;
    uint64_t v70 = v69 + 2494;
    sub_24FF6DACC(a1 + 3560, v68 & 1, (_WORD *)(v69 + 2496));
    sub_24FF6DACC(a1 + 3560, (v68 >> 1) & 1, (_WORD *)(v70 + 2 * (v68 & 1 | 2)));
    sub_24FF6DACC(a1 + 3560, (v68 >> 2) & 1, (_WORD *)(v70 + 2 * (v68 & 3 | 4)));
  }
  if (*(unsigned char *)(a6 + 18) && *(unsigned char *)(a6 + 17))
  {
    int v71 = *(_DWORD *)(*(void *)(a1 + 552) + 12 * a2);
    if (v71 <= 19) {
      int v71 = 19;
    }
    unsigned int v72 = v71 - 19;
    unsigned int v138 = v72 >> 1;
    int v139 = 15;
    BOOL v73 = v72 >= 0x1E;
    int32x2_t v74 = &v139;
    if (!v73) {
      int32x2_t v74 = (int *)&v138;
    }
  }
  else
  {
    int v140 = 7;
    int32x2_t v74 = (int *)(*(void *)(a1 + 504) + 4 * a2);
    if (*v74 >= 7) {
      int32x2_t v74 = &v140;
    }
  }
  int v75 = *v74;
  int v76 = v11 + ~v12;
  int v77 = (_WORD *)(a1 + 6 * *v74 + 2388);
  if (v76 > 2)
  {
    sub_24FF6DACC(a1 + 3560, 1, v77);
    sub_24FF6DACC(a1 + 3560, 1, (_WORD *)(a1 + 6 * v75 + 2392));
    sub_24FF7CC68(a1 + 3560, v76 - 3, 0, (_WORD *)(a1 + 2484));
  }
  else
  {
    sub_24FF6DACC(a1 + 3560, v76 & 1, v77);
    sub_24FF6DACC(a1 + 3560, (v76 >> 1) & 1, (_WORD *)(a1 + 6 * v75 + 2 * ((v76 & 1u) + 1) + 2388));
  }
  int v78 = *(_DWORD *)(a1 + 36);
  if (v78 == 3)
  {
    if ((int)v12 < (int)v11)
    {
      int v82 = v11 - v12;
      uint64_t v83 = 4 * v12;
      do
      {
        int32x2_t v84 = (_DWORD *)(*(void *)(a1 + 232) + 4 * *(int *)(*(void *)(a1 + 432) + v83));
        int v85 = v84[1] - *v84;
        if (v85 > 5)
        {
          sub_24FF6DACC(a1 + 3560, 1, (_WORD *)(a1 + 2486));
          sub_24FF6DACC(a1 + 3560, 1, (_WORD *)(a1 + 2490));
          sub_24FF7CC68(a1 + 3560, v85 - 6, 0, (_WORD *)(a1 + 2492));
        }
        else
        {
          sub_24FF6DACC(a1 + 3560, (v85 - 3) & 1, (_WORD *)(a1 + 2486));
          sub_24FF6DACC(a1 + 3560, ((v85 - 3) >> 1) & 1, (_WORD *)(a1 + 2 * (((v85 - 3) & 1u) + 1) + 2486));
        }
        v83 += 4;
        --v82;
      }
      while (v82);
    }
  }
  else if (v78 == 2 && (int)v12 < (int)v11)
  {
    int v79 = v11 - v12;
    uint64_t v80 = 4 * v12;
    do
    {
      int v81 = (_DWORD *)(*(void *)(a1 + 232) + 4 * *(int *)(*(void *)(a1 + 432) + v80));
      sub_24FF6DACC(a1 + 3560, v81[1] - *v81 != 3, (_WORD *)(a1 + 2486));
      v80 += 4;
      --v79;
    }
    while (v79);
  }
  char v86 = v129;
  if (v132) {
    char v86 = 1;
  }
  if ((v86 & 1) == 0)
  {
    if (*(unsigned char *)(a6 + 17)) {
      sub_24FF72C68(a1, v127, *(_DWORD *)(*(void *)(a1 + 64) + 4 * a2) - 1);
    }
    else {
      sub_24FF72E7C(a1 + 3560, *(_DWORD *)(*(void *)(a1 + 64) + 4 * v127) - *(_DWORD *)(*(void *)(a1 + 64) + 4 * a2) + 1, 0, (_WORD *)(a1 + 2610), (_WORD *)(a1 + 2612));
    }
  }
  if (v14 >= 2)
  {
    uint64_t v87 = 1;
    do
    {
      char v88 = *(unsigned char *)(*v20 + v87);
      int v89 = v88 & 1;
    }
    while (++v87 < v14 && v89 != 0);
    sub_24FF6DACC(a1 + 3560, v89, (_WORD *)(a1 + 2614));
    if ((v88 & 1) == 0)
    {
      if (v21 == 3)
      {
        uint64_t v91 = (int)(*v137)[1];
        if (*(unsigned char *)(a6 + 17)) {
          sub_24FF72C68(a1, v91, v133);
        }
        else {
          sub_24FF7CC68(a1 + 3560, v133 - *(_DWORD *)(*(void *)(a1 + 64) + 4 * v91), 0, (_WORD *)(a1 + 2612));
        }
      }
      else
      {
        uint64_t v92 = 1;
        do
        {
          int v93 = *(unsigned __int8 *)(*v20 + v92);
          sub_24FF6DACC(a1 + 3560, *(unsigned char *)(*v20 + v92) != 0, (_WORD *)(a1 + 2574));
          if (!v93)
          {
            uint64_t v94 = (int)(*v137)[v92];
            if (*(unsigned char *)(a6 + 17)) {
              sub_24FF72C68(a1, v94, v133);
            }
            else {
              sub_24FF7CC68(a1 + 3560, v133 - *(_DWORD *)(*(void *)(a1 + 64) + 4 * v94), 0, (_WORD *)(a1 + 2612));
            }
          }
          ++v92;
        }
        while (v136 != v92);
      }
    }
  }
  char v95 = v130;
  if (v131) {
    char v95 = 1;
  }
  if ((v95 & 1) == 0)
  {
    if (*(unsigned char *)(a6 + 17)) {
      sub_24FF72C68(a1, v128, *(_DWORD *)(*(void *)(a1 + 64) + 4 * a2) + 1);
    }
    else {
      sub_24FF72E7C(a1 + 3560, *(_DWORD *)(*(void *)(a1 + 64) + 4 * v128) + ~*(_DWORD *)(*(void *)(a1 + 64) + 4 * a2), 0, (_WORD *)(a1 + 2610), (_WORD *)(a1 + 2612));
    }
  }
  int v96 = *a5;
  uint64_t v97 = (v136 - 1);
  if (*a5 > 2)
  {
    if (v96 == 3 || v96 == 5)
    {
      unint64_t result = v21;
      if ((int)v21 > 1)
      {
        uint64_t v107 = (int *)(*(void *)(a1 + 528) + 16 * a2);
        int v108 = v107[3];
        int v109 = *v107;
        do
        {
          int v110 = v109;
          int v109 = (*v137)[v97];
          if (*(unsigned char *)(*v20 + v97))
          {
            unsigned int v111 = (_DWORD *)(*(void *)(a1 + 136) + 12 * v109);
            _DWORD *v111 = a2;
            v111[1] = v110;
            v111[2] = v108;
          }
          int v108 = v110;
          BOOL v46 = v97-- <= 0;
        }
        while (!v46);
      }
    }
    else
    {
      unint64_t result = v21;
      if (v136 <= 0x7FFFFFFE)
      {
        uint64_t v112 = 0;
        int v113 = -1;
        int v114 = -1;
        do
        {
          int v115 = v113;
          int v113 = (*v137)[v112];
          if (*(unsigned char *)(*v20 + v112))
          {
            int v116 = (_DWORD *)(*(void *)(a1 + 136) + 12 * v113);
            *int v116 = a2;
            v116[1] = v115;
            v116[2] = v114;
          }
          ++v112;
          int v114 = v115;
        }
        while (v21 != v112);
      }
    }
  }
  else
  {
    uint64_t v98 = *(void *)(a1 + 528);
    __int32 v99 = (_DWORD *)(v98 + 16 * a2);
    unint64_t result = v21;
    if ((int)v21 >= 2)
    {
      int v101 = v99[1];
      int v102 = v99[2];
      uint64_t v103 = 1;
      do
      {
        int v104 = (*v137)[v103];
        if (*(unsigned char *)(*v20 + v103))
        {
          uint64_t v105 = (_DWORD *)(*(void *)(a1 + 136) + 12 * v104);
          *uint64_t v105 = a2;
          v105[1] = v101;
          v105[2] = v102;
        }
        ++v103;
        int v102 = v101;
        int v101 = v104;
      }
      while (v21 != v103);
    }
    if (!v96 && *(unsigned char *)(*v20 + (int)v97))
    {
      uint64_t v106 = (_DWORD *)(*(void *)(a1 + 160) + 12 * *(int *)(*(void *)(a1 + 384) + 4 * (int)v97));
      *uint64_t v106 = a2;
      v106[1] = *v99;
      v106[2] = *(_DWORD *)(v98 + 16 * a2 + 12);
    }
  }
  if (*(unsigned char *)(a6 + 17)) {
    BOOL v117 = *(unsigned char *)(a6 + 18) == 0;
  }
  else {
    BOOL v117 = 1;
  }
  int v118 = v117;
  if (v136 >= 1)
  {
    uint64_t v119 = *(void *)(a1 + 528);
    uint64_t v120 = v136;
    unint64_t v121 = (int *)(*(void *)(a1 + 384) + 4);
    do
    {
      uint64_t v123 = *(v121 - 1);
      uint64_t v122 = *v121;
      uint64_t v124 = v119 + 16 * v122;
      *(_DWORD *)(v124 + 4) = v123;
      *(_DWORD *)(v124 + 8) = a2;
      signed int v125 = (_DWORD *)(v119 + 16 * v123);
      *signed int v125 = v122;
      v125[3] = a2;
      if (v118)
      {
        uint64_t v126 = *(void *)(a1 + 504);
        ++*(_DWORD *)(v126 + 4 * v123);
        ++*(_DWORD *)(v126 + 4 * v122);
      }
      ++v121;
      --v120;
    }
    while (v120);
  }
  return result;
}

uint64_t sub_24FF74AEC(uint64_t result, int a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a2 == 3 || a2 == 5)
  {
    if (a3 >= 1)
    {
      unint64_t v6 = a3 + 1;
      do
      {
        uint64_t v7 = (v6 - 2);
        if (*(unsigned char *)(*(void *)(v5 + 408) + v7)) {
          unint64_t result = sub_24FF73540(v5, *(_DWORD *)(*(void *)(v5 + 384) + 4 * v7), a4);
        }
        --v6;
      }
      while (v6 > 1);
    }
  }
  else if (a3 >= 1)
  {
    uint64_t v8 = 0;
    uint64_t v9 = a3;
    do
    {
      if (*(unsigned char *)(*(void *)(v5 + 408) + v8)) {
        unint64_t result = sub_24FF73540(v5, *(_DWORD *)(*(void *)(v5 + 384) + 4 * v8), a4);
      }
      ++v8;
    }
    while (v9 != v8);
  }
  return result;
}

uint64_t sub_24FF74BA8(uint64_t a1, int *a2, unsigned char *a3, int a4, unint64_t a5, uint64_t a6, unint64_t a7, int *a8, uint64_t a9, uint64_t a10, uint64_t *a11, uint64_t a12)
{
  uint64_t result = 5;
  if (a7 - 255 < 0xFFFFFFFFFFFFFF02) {
    return result;
  }
  int v14 = a5;
  if (a5 > 0xFE) {
    return result;
  }
  if (!a6) {
    return result;
  }
  if (!a2) {
    return result;
  }
  if (!a9) {
    return result;
  }
  if ((*(unsigned __int8 *)(a12 + 8) | 2) == 3) {
    return result;
  }
  int v21 = *(_DWORD *)(a12 + 12);
  int v22 = *(_DWORD *)(a12 + 20);
  if (!a8)
  {
    if (v22) {
      return result;
    }
  }
  if (!a3 && *(_DWORD *)(a12 + 16)) {
    return result;
  }
  unsigned int v23 = *(_DWORD *)(a12 + 4);
  if (v23 > 0x1B || (v21 - 5) <= 1 && (a7 != 2 || !v23)) {
    return result;
  }
  if ((unint64_t)a10 < 0x21) {
    return 1;
  }
  uint64_t v24 = *(void *)(a1 + 216) - *(void *)(a1 + 208);
  uint64_t v25 = v24 >> 2;
  if (!v22)
  {
    uint64_t v30 = *(void *)(a1 + 3256);
    uint64_t v31 = *(void *)(a1 + 3264);
    if (v30 == v31 || v25 != (v31 - v30) >> 2) {
      return result;
    }
LABEL_27:
    int v93 = v25;
    unsigned int v94 = v21 - 5;
    *(_DWORD *)(a1 + 3544) = a7;
    *(_DWORD *)(a1 + 3548) = a6;
    char v95 = (int **)(a1 + 3160);
    int v96 = (void *)(a1 + 3136);
    *(_DWORD *)(a1 + 3552) = a4;
    sub_24FF5F2F4(a1 + 3160, a7);
    sub_24FF5F2F4(a1 + 3184, a7);
    sub_24FF5F2F4(a1 + 3136, a7);
    int v33 = (int **)(a1 + 3160);
    int v32 = (int **)(a1 + 3184);
    if (a7)
    {
      int v34 = *v95;
      int v35 = *(_DWORD **)(a1 + 3184);
      uint64_t v36 = a2;
      unint64_t v37 = a7;
      do
      {
        int v38 = *v36++;
        *v34++ = v38;
        *v35++ = v38;
        --v37;
      }
      while (v37);
    }
    if ((int)a6 >= 2)
    {
      int v39 = 1;
      int v40 = a7;
      do
      {
        if (a7)
        {
          uint64_t v41 = *v33;
          int v42 = *v32;
          uint64_t v43 = &a2[v40];
          v40 += a7;
          unint64_t v44 = a7;
          do
          {
            int v45 = *v43;
            if (*v43 >= *v41) {
              int v45 = *v41;
            }
            *v41++ = v45;
            int v47 = *v43++;
            int v46 = v47;
            if (*v42 > v47) {
              int v46 = *v42;
            }
            *v42++ = v46;
            --v44;
          }
          while (v44);
        }
        ++v39;
      }
      while (v39 != a6);
    }
    int v48 = *(_DWORD *)(a12 + 4);
    if (a7)
    {
      uint64_t v49 = 0;
      int v50 = 1 << v48;
      uint64_t v51 = *v32;
      int32x2_t v52 = *v33;
      uint64_t result = 5;
      while (1)
      {
        uint64_t v53 = v51[v49];
        uint64_t v54 = v52[v49];
        if (v53 - v54 > 0xFFFFFFF) {
          return 5;
        }
        if (*(_DWORD *)(a12 + 4) && ((v54 & 0x80000000) != 0 || (int)v53 >= v50)) {
          return result;
        }
        if (v94 > 1)
        {
          *(_DWORD *)(*v96 + 4 * v49) = v53 - v54;
        }
        else
        {
          *(_DWORD *)(*v96 + 4 * v49) = v53;
          v52[v49] = 0;
        }
        if (a7 == ++v49)
        {
          int v48 = *(_DWORD *)(a12 + 4);
          break;
        }
      }
    }
    long long v97 = 0u;
    uint64_t v104 = 0;
    int v105 = 0;
    HIDWORD(v97) = a6;
    int v98 = a7;
    int v99 = v93;
    int v100 = v14;
    int v101 = v48;
    int v102 = a4;
    int v103 = 3;
    uint64_t v104 = *(void *)(a12 + 16);
    char v106 = *(unsigned char *)(a12 + 8);
    int v107 = *(_DWORD *)(a12 + 12);
    int32x2_t v55 = (_DWORD *)sub_24FF6D90C(a9, a10, (uint64_t)&v97);
    if (a7)
    {
      uint64_t v57 = 0;
      do
      {
        BOOL v58 = v56 < 4;
        v56 -= 4;
        if (v58)
        {
          uint64_t v56 = 0;
          int32x2_t v55 = 0;
        }
        else
        {
          *v55++ = (*v95)[v57];
        }
        unsigned int v59 = *(_DWORD *)(*v96 + 4 * v57);
        unsigned int v60 = 32 - __clz(v59);
        if (v59) {
          unsigned int v61 = v60;
        }
        else {
          unsigned int v61 = 0;
        }
        *(_DWORD *)(*v96 + 4 * v57++) = v61;
      }
      while (a7 != v57);
      uint64_t v62 = 0;
      do
      {
        if (v56)
        {
          --v56;
          *(unsigned char *)int32x2_t v55 = *(_DWORD *)(*v96 + 4 * v62);
          int32x2_t v55 = (_DWORD *)((char *)v55 + 1);
        }
        else
        {
          int32x2_t v55 = 0;
        }
        ++v62;
      }
      while (a7 != v62);
    }
    int v108 = v55;
    uint64_t v109 = v56;
    sub_24FF5F2F4(a1 + 3208, a7 * a6);
    if ((int)a6 >= 1)
    {
      int v63 = 0;
      int v64 = 0;
      do
      {
        if (a7)
        {
          BOOL v65 = *v95;
          BOOL v66 = (_DWORD *)(*(void *)(a1 + 3208) + 4 * v64);
          BOOL v67 = &a2[v64];
          v64 += a7;
          unint64_t v68 = a7;
          do
          {
            int v70 = *v67++;
            int v69 = v70;
            int v71 = *v65++;
            *v66++ = v69 - v71;
            --v68;
          }
          while (v68);
        }
        ++v63;
      }
      while (v63 != a6);
    }
    if (*(_DWORD *)(a12 + 20))
    {
      uint64_t v72 = *(unsigned int *)(a1 + 4);
      sub_24FF5F2F4(a1 + 3256, (uint64_t)(*(void *)(a1 + 216) - *(void *)(a1 + 208)) >> 2);
      if ((int)v72 >= 1)
      {
        uint64_t v73 = 0;
        uint64_t v74 = *(void *)(a1 + 256);
        uint64_t v75 = *(void *)(a1 + 232);
        do
        {
          uint64_t v76 = *(int *)(v75 + 4 * v73);
          uint64_t v77 = v73 + 1;
          uint64_t v78 = *(int *)(v75 + 4 * (v73 + 1));
          int v79 = v78 - v76;
          if ((int)v78 > (int)v76)
          {
            int v80 = *(_DWORD *)(v74 + 4 * v73);
            uint64_t v81 = v78 - v76;
            int v82 = (_DWORD *)(*(void *)(a1 + 3256) + 4 * v76);
            do
            {
              *v82++ = a8[v80 % v79 + (int)v76];
              ++v80;
              --v81;
            }
            while (v81);
          }
          uint64_t v73 = v77;
        }
        while (v77 != v72);
      }
    }
    if (a3 && *(_DWORD *)(a12 + 16))
    {
      sub_24FF6AAF4((unint64_t *)(a1 + 3232), (int)a6);
      if ((int)a6 >= 1)
      {
        uint64_t v83 = 0;
        do
        {
          *(unsigned char *)(*(void *)(a1 + 3232) + v83) = a3[v83];
          ++v83;
        }
        while (a6 != v83);
      }
      sub_24FF6AAF4((unint64_t *)(a1 + 3096), (int)a6);
      if (a6 << 32) {
        memmove(*(void **)(a1 + 3096), a3, (int)a6);
      }
    }
    else
    {
      sub_24FF6AAF4((unint64_t *)(a1 + 3232), 0);
    }
    uint64_t result = sub_24FF75150((unsigned int *)a1, a12, &v108);
    if (result) {
      return result;
    }
    uint64_t result = 1;
    if (!v108 || v109 < 0) {
      return result;
    }
    uint64_t v84 = (a10 & ~(a10 >> 63)) - v109;
    if (a10 - v84 >= 0) {
      uint64_t v85 = (a10 & ~(a10 >> 63)) - v109;
    }
    else {
      uint64_t v85 = 0;
    }
    if (a10 - v84 >= 0) {
      uint64_t v86 = a9;
    }
    else {
      uint64_t v86 = 0;
    }
    uint64_t v87 = v85 & ~(v85 >> 63);
    *a11 = v87;
    if (v85 >= 16)
    {
      *(_DWORD *)(v86 + 12) = v87;
      uint64_t v89 = v85 - 8;
    }
    else
    {
      BOOL v88 = v85 == 8;
      BOOL v58 = v85 < 8;
      uint64_t v89 = v85 - 8;
      if (v58) {
        return 0;
      }
      if (v88)
      {
        unsigned int v91 = -1;
LABEL_104:
        uint64_t result = 0;
        *(_DWORD *)(v86 + 4) = v91;
        return result;
      }
    }
    int32x2_t v90 = (unsigned __int8 *)(v86 + 8);
    unsigned int v91 = -1;
    do
    {
      int v92 = *v90++;
      unsigned int v91 = dword_24FF7D068[v92 ^ HIBYTE(v91)] ^ (v91 << 8);
      --v89;
    }
    while (v89);
    goto LABEL_104;
  }
  if ((int)v25 < 1) {
    goto LABEL_27;
  }
  uint64_t v26 = ((unint64_t)v24 >> 2);
  uint64_t v27 = a8;
  while (1)
  {
    int v29 = *v27++;
    int v28 = v29;
    if (v29 < 0 || v28 >= (int)a6) {
      return result;
    }
    if (!--v26) {
      goto LABEL_27;
    }
  }
}

uint64_t sub_24FF75150(unsigned int *a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3;
  uint64_t v110 = *MEMORY[0x263EF8340];
  uint64_t v6 = a3[1];
  int v92 = (unsigned int *)*a3;
  *a3 += 4;
  a3[1] = v6 - 4;
  uint64_t v7 = a1 + 890;
  a1[891] = (v6 - 4) & ~((v6 - 4) >> 63);
  *((void *)a1 + 446) = v92 + 1;
  sub_24FF5D92C((uint64_t)(a1 + 890));
  if (*(_DWORD *)(a2 + 20))
  {
    uint64_t v9 = *a1;
    uint64_t v8 = a1[1];
    unint64_t v96 = (int)a1[887];
    unint64_t v10 = *((void *)a1 + 27) - *((void *)a1 + 26);
    int v99 = (int **)(a1 + 868);
    sub_24FF65088((uint64_t)(a1 + 868), *a1);
    if ((int)(v10 >> 2) >= 1)
    {
      uint64_t v11 = (int *)*((void *)a1 + 26);
      uint64_t v12 = *((void *)a1 + 434);
      uint64_t v13 = (v10 >> 2);
      do
      {
        uint64_t v14 = *v11++;
        ++*(_DWORD *)(v12 + 4 * v14 + 4);
        --v13;
      }
      while (v13);
    }
    sub_24FF650F8(v99);
    if ((int)v8 >= 1)
    {
      uint64_t v15 = 0;
      uint64_t v16 = *((void *)a1 + 440);
      uint64_t v17 = *((void *)a1 + 14);
      uint64_t v18 = *((void *)a1 + 29);
      do
      {
        int v19 = (int *)(v18 + 4 * *(int *)(v17 + 4 * v15));
        uint64_t v20 = *v19;
        uint64_t v21 = v19[1];
        if ((int)v20 < (int)v21)
        {
          uint64_t v22 = *((void *)a1 + 26);
          uint64_t v23 = *((void *)a1 + 407);
          uint64_t v24 = *((void *)a1 + 434);
          uint64_t v25 = *((void *)a1 + 437);
          do
          {
            uint64_t v26 = *(int *)(v22 + 4 * v20);
            int v27 = *(_DWORD *)(v23 + 4 * v20);
            uint64_t v28 = *(int *)(v24 + 4 * v26);
            uint64_t v29 = *(int *)(v25 + 4 * v26);
            uint64_t v30 = v29 + v28;
            if ((int)v29 <= 0)
            {
LABEL_13:
              *(_DWORD *)(v25 + 4 * v26) = v29 + 1;
              *(_DWORD *)(v16 + 4 * v30) = v27;
            }
            else
            {
              uint64_t v30 = (int)v30;
              while (*(_DWORD *)(v16 + 4 * v28) != v27)
              {
                if (++v28 >= (int)v30) {
                  goto LABEL_13;
                }
              }
            }
            ++v20;
          }
          while (v20 != v21);
        }
        ++v15;
      }
      while (v15 != v8);
    }
    uint64_t v93 = a2;
    uint64_t v94 = v6;
    char v95 = v3;
    memset_pattern16(__b, &unk_24FF7D710, 6uLL);
    __int16 v107 = 0x8000;
    __int16 v106 = 0x8000;
    uint64_t v31 = (uint64_t *)(a1 + 820);
    sub_24FF5F2F4((uint64_t)(a1 + 832), 0);
    sub_24FF5F2F4((uint64_t)(a1 + 820), 0);
    int v100 = a1 + 826;
    sub_24FF5F2F4((uint64_t)(a1 + 826), 0);
    v109[0] = -1;
    sub_24FF62F6C((uint64_t)(a1 + 832), v96, v109);
    v109[0] = -1;
    sub_24FF62F6C((uint64_t)(a1 + 820), v96, v109);
    v109[0] = -1;
    sub_24FF62F6C((uint64_t)(a1 + 826), v96, v109);
    uint64_t v98 = v8;
    uint64_t v102 = *((void *)a1 + 440);
    unint64_t v91 = (int)v9;
    if ((int)v9 <= 0)
    {
      int v49 = 0;
    }
    else
    {
      uint64_t v32 = 0;
      uint64_t v97 = v9;
      uint64_t v33 = 4 * v9;
      do
      {
        uint64_t v34 = *(int *)(*((void *)a1 + 11) + v32);
        uint64_t v35 = *((void *)a1 + 437);
        uint64_t v36 = (unsigned int *)(*((void *)a1 + 17) + 12 * v34);
        uint64_t v37 = *v36;
        if ((v37 & 0x80000000) != 0) {
          int v38 = 0;
        }
        else {
          int v38 = *(_DWORD *)(v35 + 4 * v37);
        }
        uint64_t v39 = v36[1];
        if ((v39 & 0x80000000) != 0) {
          int v40 = 0;
        }
        else {
          int v40 = *(_DWORD *)(v35 + 4 * v39);
        }
        uint64_t v41 = (unsigned int *)(*((void *)a1 + 20) + 12 * v34);
        uint64_t v42 = *v41;
        if ((v42 & 0x80000000) != 0) {
          int v43 = 0;
        }
        else {
          int v43 = *(_DWORD *)(v35 + 4 * v42);
        }
        uint64_t v44 = v41[1];
        if ((v44 & 0x80000000) != 0) {
          int v45 = 0;
        }
        else {
          int v45 = *(_DWORD *)(v35 + 4 * v44);
        }
        int v46 = *(_DWORD *)(v35 + 4 * v34);
        uint64_t v47 = v43 == v45;
        if (v38 == v40) {
          ++v47;
        }
        sub_24FF6DACC((uint64_t)v7, v46 == 1, &__b[v47]);
        if (v46 != 1)
        {
          if (v46)
          {
            sub_24FF6DACC((uint64_t)v7, 0, &v107);
            sub_24FF7CC68((uint64_t)v7, v46 - 2, 0, &v106);
          }
          else
          {
            sub_24FF6DACC((uint64_t)v7, 1, &v107);
          }
        }
        v32 += 4;
      }
      while (v33 != v32);
      uint64_t v48 = 0;
      int v49 = 0;
      __int16 v105 = 0x8000;
      __int16 v104 = 0x8000;
      do
      {
        int v50 = *(_DWORD *)(*((void *)a1 + 11) + 4 * v48);
        uint64_t v51 = *(int *)(*((void *)a1 + 437) + 4 * v50);
        if ((int)v51 >= 1)
        {
          uint64_t v52 = (*v99)[v50];
          uint64_t v53 = v52 + v51;
          do
          {
            int v54 = *(_DWORD *)(v102 + 4 * v52);
            if (*(_DWORD *)(*v31 + 4 * v54) == -1)
            {
              sub_24FF6DACC((uint64_t)v7, 1, &v105);
              *(_DWORD *)(*v31 + 4 * v54) = v49;
              *(_DWORD *)(*v100 + 4 * v49) = v54;
              *(_DWORD *)(*((void *)a1 + 416) + 4 * v54) = v50;
              ++v49;
            }
            else
            {
              sub_24FF6DACC((uint64_t)v7, 0, &v105);
              sub_24FF7CC68((uint64_t)v7, v49 + ~*(_DWORD *)(*v31 + 4 * v54), 0, &v104);
            }
            ++v52;
          }
          while (v52 < v53);
        }
        ++v48;
        LODWORD(v9) = v97;
      }
      while (v48 != v97);
    }
    if ((int)v96 >= 1)
    {
      uint64_t v55 = 0;
      uint64_t v56 = *v31;
      do
      {
        if (*(_DWORD *)(v56 + 4 * v55) == -1)
        {
          *(_DWORD *)(v56 + 4 * v55) = v49;
          *(_DWORD *)(*v100 + 4 * v49++) = v55;
        }
        ++v55;
      }
      while (v96 != v55);
    }
    sub_24FF65088((uint64_t)(a1 + 850), v96);
    if ((int)v98 <= 0)
    {
      sub_24FF650F8((int **)a1 + 425);
      v109[0] = 0;
      sub_24FF6A454(__p, v91, v109);
    }
    else
    {
      uint64_t v57 = 0;
      uint64_t v58 = *((void *)a1 + 29);
      do
      {
        uint64_t v59 = *(int *)(v58 + 4 * v57++);
        uint64_t v60 = *(int *)(v58 + 4 * v57);
        if ((int)v59 < (int)v60)
        {
          uint64_t v61 = *((void *)a1 + 425);
          uint64_t v62 = v60 - v59;
          int v63 = (int *)(*((void *)a1 + 407) + 4 * v59);
          do
          {
            uint64_t v64 = *v63++;
            ++*(_DWORD *)(v61 + 4 * v64 + 4);
            --v62;
          }
          while (v62);
        }
      }
      while (v57 != v98);
      sub_24FF650F8((int **)a1 + 425);
      v109[0] = 0;
      sub_24FF6A454(__p, (int)v9, v109);
      memset_pattern16(v109, &unk_24FF7D710, 0x28uLL);
      uint64_t v65 = 0;
      uint64_t v66 = 0;
      do
      {
        uint64_t v101 = v65;
        uint64_t v67 = *(int *)(*((void *)a1 + 14) + 4 * v65);
        uint64_t v68 = *((void *)a1 + 29);
        uint64_t v69 = *(int *)(v68 + 4 * v67);
        int v70 = *(_DWORD *)(v68 + 4 * ((int)v67 + 1));
        if ((int)v69 < v70)
        {
          do
          {
            uint64_t v71 = *(int *)(*((void *)a1 + 26) + 4 * v69);
            uint64_t v72 = *(int *)(*((void *)a1 + 407) + 4 * v69);
            uint64_t v73 = *((void *)a1 + 437);
            int v74 = *(_DWORD *)(v73 + 4 * v71);
            int v75 = *(_DWORD *)(*((void *)a1 + 425) + 4 * v72);
            uint64_t v76 = *((void *)a1 + 428);
            int v77 = *(_DWORD *)(v76 + 4 * v72);
            *(_DWORD *)(v76 + 4 * v72) = v77 + 1;
            *(_DWORD *)(*((void *)a1 + 431) + 4 * (v77 + v75)) = v67;
            if (v74 < 2)
            {
              uint64_t v79 = v66;
            }
            else
            {
              int v78 = *(_DWORD *)(v73 + 4 * v71);
              if (v78 < 1)
              {
LABEL_65:
                uint64_t v79 = 0;
              }
              else
              {
                uint64_t v79 = 0;
                uint64_t v80 = (*v99)[v71];
                uint64_t v81 = v78 + (int)v80;
                while (v72 != *(_DWORD *)(v102 + 4 * v80 + 4 * v79))
                {
                  ++v79;
                  if (v80 + v79 >= v81) {
                    goto LABEL_65;
                  }
                }
              }
              if ((int)v66 >= 1) {
                LODWORD(v66) = 1;
              }
              int v82 = *((_DWORD *)__p[0] + v71);
              *((_DWORD *)__p[0] + v71) = v82 + 1;
              if (v82 >= 4) {
                int v83 = 4;
              }
              else {
                int v83 = v82;
              }
              int v84 = v66 + 2 * v83;
              sub_24FF6DACC((uint64_t)v7, v79 != 0, &v109[v84]);
              if (v79)
              {
                uint64_t v85 = v84;
                int v86 = v79 - 1;
                if (v79 != 1)
                {
                  do
                  {
                    sub_24FF6DACC((uint64_t)v7, 1, (_WORD *)&v109[v85] + 1);
                    --v86;
                  }
                  while (v86);
                }
                if (v74 - 1 > (int)v79) {
                  sub_24FF6DACC((uint64_t)v7, 0, (_WORD *)&v109[v85] + 1);
                }
              }
            }
            ++v69;
            uint64_t v66 = v79;
          }
          while (v70 != v69);
        }
        uint64_t v65 = v101 + 1;
      }
      while (v101 + 1 != v98);
    }
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    uint64_t v6 = v94;
    uint64_t v3 = v95;
    a2 = v93;
  }
  uint64_t result = sub_24FF76368((uint64_t)a1, a2);
  if (!result)
  {
    unsigned int v88 = sub_24FF72ACC((uint64_t)v7);
    if (v6 >= 4) {
      *int v92 = v88;
    }
    uint64_t v89 = v88;
    if (*v3) {
      uint64_t v89 = *v3 + v88;
    }
    uint64_t v90 = v3[1] - v88;
    void *v3 = v89;
    v3[1] = v90;
    return *v7;
  }
  return result;
}

void *sub_24FF75874(void *result, unsigned int a2, int a3, unsigned int *a4, _DWORD *a5)
{
  uint64_t v5 = *a4;
  *(void *)a5 = -1;
  a5[2] = -1;
  if ((v5 & 0x80000000) == 0)
  {
    uint64_t v7 = result;
    uint64_t v8 = a5 + 1;
    uint64_t v35 = result[440];
    uint64_t v9 = result[437];
    int v10 = *(_DWORD *)(v9 + 4 * a2);
    uint64_t v11 = a4[2];
    uint64_t v12 = (int)a4[1];
    uint64_t v13 = a4[1];
    if ((v11 & 0x80000000) != 0)
    {
      if ((v12 & 0x80000000) == 0)
      {
        int v20 = *(_DWORD *)(v9 + 4 * v5);
        int v21 = *(_DWORD *)(v9 + 4 * v13);
        if (v10 == 1 && v20 == 1 && v21 == 1)
        {
          uint64_t v34 = result[434];
          *a5 = *(_DWORD *)(v35 + 4 * *(int *)(v34 + 4 * v5));
          a5[1] = *(_DWORD *)(v35 + 4 * *(int *)(v34 + 4 * v13));
        }
        else
        {
          return sub_24FF75A98(result, a3, a2, v5, v13, a5, v8);
        }
      }
    }
    else
    {
      int v14 = *(_DWORD *)(v9 + 4 * v5);
      int v15 = *(_DWORD *)(v9 + 4 * v12);
      if (v10 == 1 && v14 == 1 && v15 == 1)
      {
        uint64_t v24 = result[434];
        int v19 = *(_DWORD *)(v35 + 4 * *(int *)(v24 + 4 * v5));
        *a5 = v19;
        a5[1] = *(_DWORD *)(v35 + 4 * *(int *)(v24 + 4 * v12));
        if (v19 < 0) {
          return result;
        }
      }
      else
      {
        uint64_t v18 = a4[1];
        uint64_t result = sub_24FF75A98(result, a3, a2, v5, v12, a5, v8);
        uint64_t v13 = v18;
        int v19 = *a5;
        if ((*a5 & 0x80000000) != 0) {
          return result;
        }
      }
      int v25 = *v8;
      if ((v25 & 0x80000000) == 0)
      {
        uint64_t v26 = *(int *)(v7[437] + 4 * v11);
        if (v26 == 1 && v14 == 1 && v15 == 1)
        {
          a5[2] = *(_DWORD *)(v35 + 4 * *(int *)(v7[434] + 4 * v11));
        }
        else if ((int)v26 >= 1)
        {
          uint64_t v29 = *(int *)(v7[434] + 4 * v11);
          uint64_t v30 = v29 + v26;
          do
          {
            int v31 = *(_DWORD *)(v35 + 4 * v29);
            uint64_t v36 = 0;
            uint64_t v32 = v13;
            uint64_t result = sub_24FF75A98(v7, v31, v11, v5, v13, (_DWORD *)&v36 + 1, (int *)&v36);
            if (HIDWORD(v36) == v19 && v36 == v25) {
              a5[2] = v31;
            }
            ++v29;
            uint64_t v13 = v32;
          }
          while (v29 < v30);
        }
      }
    }
  }
  return result;
}

void *sub_24FF75A98(void *result, int a2, int a3, int a4, int a5, _DWORD *a6, int *a7)
{
  uint64_t v7 = *(int *)(result[428] + 4 * a2);
  if ((int)v7 >= 1)
  {
    uint64_t v8 = *(int *)(result[425] + 4 * a2);
    uint64_t v9 = v8 + v7;
    uint64_t v10 = result[26];
    while (2)
    {
      uint64_t v11 = (int *)(result[29] + 4 * *(int *)(result[431] + 4 * v8));
      uint64_t v12 = *v11;
      uint64_t v13 = v11[1];
      int v14 = *(_DWORD *)(v10 + 4 * v12);
      uint64_t v15 = (int)v12 + 1;
      uint64_t v16 = 4 * v15 - 4;
      uint64_t v17 = v15 + 1;
      while (v17 < v13)
      {
        int v18 = *(_DWORD *)(v10 + v16 + 4);
        int v19 = *(_DWORD *)(v10 + v16 + 8);
        if (v14 == a3 && v18 == a4 && v19 == a5)
        {
          uint64_t v27 = result[407] + v16;
          *a6 = *(_DWORD *)(v27 + 4);
LABEL_41:
          int v26 = *(_DWORD *)(v27 + 8);
          goto LABEL_45;
        }
        if (v14 == a3 && v19 == a4 && v18 == a5)
        {
          uint64_t v28 = result[407] + v16;
          *a7 = *(_DWORD *)(v28 + 4);
LABEL_43:
          int v33 = *(_DWORD *)(v28 + 8);
          goto LABEL_46;
        }
        if (v18 == a3 && v14 == a4 && v19 == a5)
        {
          uint64_t v29 = result[407];
          *a6 = *(_DWORD *)(v29 + 4 * v12);
          uint64_t v27 = v29 + v16;
          goto LABEL_41;
        }
        if (v18 == a3 && v19 == a4 && v14 == a5)
        {
          uint64_t v30 = result[407];
          *a7 = *(_DWORD *)(v30 + 4 * v12);
          uint64_t v28 = v30 + v16;
          goto LABEL_43;
        }
        if (v19 == a3 && v14 == a4 && v18 == a5)
        {
          uint64_t v31 = result[407];
          *a6 = *(_DWORD *)(v31 + 4 * v12);
          int v26 = *(_DWORD *)(v31 + v16 + 4);
          goto LABEL_45;
        }
        v16 += 4;
        ++v17;
        if (v19 == a3 && v18 == a4 && v14 == a5)
        {
          uint64_t v32 = result[407];
          *a7 = *(_DWORD *)(v32 + 4 * v12);
          int v33 = *(_DWORD *)(v32 + v16);
LABEL_46:
          *a6 = v33;
          return result;
        }
      }
      if (++v8 < v9) {
        continue;
      }
      break;
    }
  }
  int v26 = -1;
  *a6 = -1;
LABEL_45:
  *a7 = v26;
  return result;
}

uint64_t sub_24FF75C20(uint64_t a1, int a2, int *a3, uint64_t a4, int a5)
{
  uint64_t v6 = a3;
  uint64_t v8 = *(void *)(a1 + 3208);
  uint64_t v9 = *(unsigned int *)(a1 + 3544);
  uint64_t v10 = *(void *)(a1 + 3280);
  int v11 = *(_DWORD *)(v10 + 4 * a2);
  uint64_t v12 = *(int *)(*(void *)(a1 + 3400) + 4 * a2);
  uint64_t v13 = *(void *)(a1 + 3448);
  uint64_t v14 = *(int *)(*(void *)(a1 + 3424) + 4 * a2);
  if (a4 - (uint64_t)a3 >= 1) {
    bzero(a3, 4 * (((unint64_t)(a4 - (void)a3) >> 2) - ((unint64_t)(a4 - (void)a3) > 3)) + 4);
  }
  if ((int)v14 < 1) {
    return 0;
  }
  uint64_t result = 0;
  uint64_t v16 = v14 + v12;
  uint64_t v17 = *(void *)(a1 + 232);
  do
  {
    int v18 = (int *)(v17 + 4 * *(int *)(v13 + 4 * v12));
    uint64_t v19 = *v18;
    uint64_t v20 = v18[1];
    if ((int)v19 < (int)v20)
    {
      uint64_t v21 = *(void *)(a1 + 3256);
      do
      {
        uint64_t v22 = *(int *)(v21 + 4 * v19);
        if (*(_DWORD *)(v10 + 4 * v22) < v11 && (!a5 || *(unsigned char *)(*(void *)(a1 + 3232) + v22)))
        {
          if ((int)v9 >= 1)
          {
            uint64_t v23 = (int *)(v8 + 4 * (int)v22 * (int)v9);
            uint64_t v24 = v6;
            uint64_t v25 = v9;
            do
            {
              int v26 = *v23++;
              *v24++ += v26;
              --v25;
            }
            while (v25);
          }
          uint64_t result = (result + 1);
        }
        ++v19;
      }
      while (v19 < v20 && (int)result < 4);
    }
    ++v12;
  }
  while (v12 < v16 && (int)result < 4);
  if ((int)v9 >= 1 && (int)result >= 2)
  {
    do
    {
      *v6++ /= (int)result;
      --v9;
    }
    while (v9);
  }
  return result;
}

uint64_t sub_24FF75D8C(uint64_t a1, int a2, uint64_t a3, char a4, int a5)
{
  uint64_t v5 = *(void *)(a1 + 3208);
  uint64_t v6 = *(void *)(a1 + 3280);
  int v7 = *(_DWORD *)(v6 + 4 * a2);
  uint64_t v8 = *(unsigned int *)(a1 + 3544);
  uint64_t v9 = *(void *)(a1 + 3448);
  uint64_t v10 = *(int *)(*(void *)(a1 + 3400) + 4 * a2);
  int v11 = *(_DWORD *)(*(void *)(a1 + 3424) + 4 * a2);
  *(void *)a3 = 0;
  *(_DWORD *)(a3 + 8) = 0;
  if (v11 < 1) {
    return 0;
  }
  uint64_t result = 0;
  int v14 = 0;
  unsigned int v15 = ~(-1 << (a4 - 1));
  int v16 = v11 + v10;
  uint64_t v17 = *(void *)(a1 + 232);
  int32x2_t v18 = 0;
  int32x2_t v19 = vdup_n_s32(v15);
  do
  {
    uint64_t v20 = (int *)(v17 + 4 * *(int *)(v9 + 4 * v10));
    uint64_t v21 = *v20;
    uint64_t v22 = v20[1];
    if ((int)v21 < (int)v22)
    {
      uint64_t v23 = *(void *)(a1 + 3256);
      do
      {
        uint64_t v24 = *(int *)(v23 + 4 * v21);
        if (*(_DWORD *)(v6 + 4 * v24) < v7 && (!a5 || *(unsigned char *)(*(void *)(a1 + 3232) + v24)))
        {
          int32x2_t v25 = vsub_s32(*(int32x2_t *)(v5 + 4 * (int)v24 * (int)v8), v19);
          int32x2_t v26 = vabs_s32(vrev64_s32(v25));
          if ((int)(v15 - v26.i32[1] - v26.i32[0]) < 0) {
            int32x2_t v25 = (int32x2_t)vbsl_s8((int8x8_t)vcltz_s32(v25), (int8x8_t)vsub_s32(v26, v19), (int8x8_t)__PAIR64__(v15 - v26.i32[1], v15 - v26.i32[0]));
          }
          int32x2_t v18 = vadd_s32(v25, v18);
          *(int32x2_t *)a3 = v18;
          v14 += v15 - v26.i32[1] - v26.i32[0];
          *(_DWORD *)(a3 + 8) = v14;
          uint64_t result = (result + 1);
        }
        ++v21;
      }
      while (v21 < v22 && (int)result < 4);
    }
    ++v10;
  }
  while (v10 < v16 && (int)result < 4);
  if ((int)v8 >= 1 && (int)result >= 2)
  {
    do
    {
      *(int *)a3 /= (int)result;
      a3 += 4;
      --v8;
    }
    while (v8);
  }
  return result;
}

uint64_t sub_24FF75EE0(int a1, int a2, char a3, unsigned __int16 *a4, int a5, void *a6)
{
  int v6 = *a4;
  if (a3) {
    int v6 = 0x10000 - v6;
  }
  int v7 = *(_DWORD *)((char *)&unk_24FF7D720 + (((v6 + 2048) >> 10) & 0xFCLL));
  int v8 = 0x10000 - a4[(a3 & 1) + 1];
  if ((a3 & 2) == 0) {
    int v8 = a4[(a3 & 1) + 1];
  }
  int v9 = *(_DWORD *)((char *)&unk_24FF7D720 + (((v8 + 2048) >> 10) & 0xFCLL));
  if (!a5)
  {
    int v10 = *(unsigned __int16 *)(*a6 + 2 * a2);
    if (a1)
    {
      uint64_t v11 = a2;
      int v32 = *(_DWORD *)((char *)&unk_24FF7D720 + (((67584 - v10) >> 10) & 0x7CLL));
      int v33 = *(unsigned __int16 *)(a6[3] + 2 * a2);
      if (a1 >= 0) {
        int v33 = 0x10000 - v33;
      }
      int v34 = *(_DWORD *)((char *)&unk_24FF7D720 + (((v33 + 2048) >> 10) & 0xFCLL));
      if (a1 >= 0) {
        unsigned int v15 = a1;
      }
      else {
        unsigned int v15 = -a1;
      }
      int v16 = v34 + v32;
      uint64_t v17 = (unsigned __int16 *)(a6[6] + 2 * (a2 << 6));
      if (v15 <= 0x3F)
      {
        char v35 = v15 - 1;
        int v36 = *v17;
        if (((_BYTE)v15 - 1)) {
          int v36 = 0x10000 - v36;
        }
        int v20 = *(_DWORD *)((char *)&unk_24FF7D720 + (((v36 + 2048) >> 10) & 0xFCLL));
        int v37 = v17[(v35 & 1) + 1];
        if ((v35 & 2) != 0) {
          int v37 = 0x10000 - v37;
        }
        int v22 = *(_DWORD *)((char *)&unk_24FF7D720 + (((v37 + 2048) >> 10) & 0xFCLL));
        int v38 = v17[(v35 & 3) + 3];
        if ((v35 & 4) != 0) {
          int v38 = 0x10000 - v38;
        }
        int v24 = *(_DWORD *)((char *)&unk_24FF7D720 + (((v38 + 2048) >> 10) & 0xFCLL));
        int v39 = v17[(v35 & 7) + 7];
        if ((v35 & 8) != 0) {
          int v39 = 0x10000 - v39;
        }
        int v26 = *(_DWORD *)((char *)&unk_24FF7D720 + (((v39 + 2048) >> 10) & 0xFCLL));
        int v40 = v17[(v35 & 0xF) + 15];
        if ((v35 & 0x10) != 0) {
          int v40 = 0x10000 - v40;
        }
        int v28 = *(_DWORD *)((char *)&unk_24FF7D720 + (((v40 + 2048) >> 10) & 0xFCLL));
        int v29 = v17[(v35 & 0x1F) + 31];
        int v30 = 0x10000 - v29;
        BOOL v31 = (v35 & 0x20) == 0;
        goto LABEL_44;
      }
LABEL_52:
      int v45 = *(_DWORD *)((char *)&unk_24FF7D720 + (((67584 - (unint64_t)*v17) >> 10) & 0x3FFFFFFFFFFFFCLL));
      int v46 = *(_DWORD *)((char *)&unk_24FF7D720 + (((67584 - (unint64_t)v17[2]) >> 10) & 0x3FFFFFFFFFFFFCLL));
      int v47 = *(_DWORD *)((char *)&unk_24FF7D720 + (((67584 - (unint64_t)v17[6]) >> 10) & 0x3FFFFFFFFFFFFCLL));
      int v48 = *(_DWORD *)((char *)&unk_24FF7D720 + (((67584 - (unint64_t)v17[14]) >> 10) & 0x3FFFFFFFFFFFFCLL));
      int v49 = *(_DWORD *)((char *)&unk_24FF7D720 + (((67584 - (unint64_t)v17[30]) >> 10) & 0x3FFFFFFFFFFFFCLL));
      int v50 = *(_DWORD *)((char *)&unk_24FF7D720 + (((67584 - (unint64_t)v17[62]) >> 10) & 0x3FFFFFFFFFFFFCLL));
      int v51 = *(_DWORD *)(a6[12] + 4 * v11);
      int v41 = v16 + v45 + v46 + v47 + v48 + v49 + v50 + (v51 << 10) + 66560 - (__clz(((v15 - 64) >> v51) + 1) << 11);
      return (v9 + v7 + v41);
    }
LABEL_51:
    int v41 = *(_DWORD *)((char *)&unk_24FF7D720 + (((v10 + 2048) >> 10) & 0x7CLL));
    return (v9 + v7 + v41);
  }
  if (a5 == 2)
  {
    if (a1 < 1)
    {
      if ((a1 & 0x80000000) == 0)
      {
        int v44 = 0;
        uint64_t v42 = a2;
        goto LABEL_55;
      }
      uint64_t v42 = a2;
      unsigned int v43 = *(unsigned __int16 *)(a6[3] + 2 * a2) + 2048;
    }
    else
    {
      uint64_t v42 = a2;
      unsigned int v43 = 67584 - *(unsigned __int16 *)(a6[3] + 2 * a2);
    }
    int v44 = *(_DWORD *)((char *)&unk_24FF7D720 + ((v43 >> 10) & 0x7CLL));
LABEL_55:
    int v52 = *(_DWORD *)(a6[12] + 4 * v42);
    if (a1 >= 0) {
      unsigned int v53 = a1;
    }
    else {
      unsigned int v53 = -a1;
    }
    int v41 = v44 + (v52 << 10) + 66560 - (__clz((v53 >> v52) + 1) << 11);
    return (v9 + v7 + v41);
  }
  if (a5 != 4)
  {
    int v41 = 0;
    return (v9 + v7 + v41);
  }
  int v10 = *(unsigned __int16 *)(*a6 + 2 * a2);
  if (!a1) {
    goto LABEL_51;
  }
  uint64_t v11 = a2;
  int v12 = *(_DWORD *)((char *)&unk_24FF7D720 + (((67584 - v10) >> 10) & 0x7CLL));
  int v13 = *(unsigned __int16 *)(a6[3] + 2 * a2);
  if (a1 >= 0) {
    int v13 = 0x10000 - v13;
  }
  int v14 = *(_DWORD *)((char *)&unk_24FF7D720 + (((v13 + 2048) >> 10) & 0xFCLL));
  if (a1 >= 0) {
    unsigned int v15 = a1;
  }
  else {
    unsigned int v15 = -a1;
  }
  int v16 = v14 + v12;
  uint64_t v17 = (unsigned __int16 *)(a6[6] + 2 * (a2 << 6));
  if (v15 > 0x3F) {
    goto LABEL_52;
  }
  unsigned int v18 = v15 - 1;
  int v19 = *v17;
  if (((v15 - 1) & 0x20) != 0) {
    int v19 = 0x10000 - v19;
  }
  int v20 = *(_DWORD *)((char *)&unk_24FF7D720 + (((v19 + 2048) >> 10) & 0xFCLL));
  int v21 = v17[(v18 >> 5) + 1];
  if ((v18 & 0x10) != 0) {
    int v21 = 0x10000 - v21;
  }
  int v22 = *(_DWORD *)((char *)&unk_24FF7D720 + (((v21 + 2048) >> 10) & 0xFCLL));
  int v23 = v17[(v18 >> 4) + 3];
  if ((v18 & 8) != 0) {
    int v23 = 0x10000 - v23;
  }
  int v24 = *(_DWORD *)((char *)&unk_24FF7D720 + (((v23 + 2048) >> 10) & 0xFCLL));
  int v25 = v17[(v18 >> 3) + 7];
  if ((v18 & 4) != 0) {
    int v25 = 0x10000 - v25;
  }
  int v26 = *(_DWORD *)((char *)&unk_24FF7D720 + (((v25 + 2048) >> 10) & 0xFCLL));
  int v27 = v17[(v18 >> 2) + 15];
  if ((v18 & 2) != 0) {
    int v27 = 0x10000 - v27;
  }
  int v28 = *(_DWORD *)((char *)&unk_24FF7D720 + (((v27 + 2048) >> 10) & 0xFCLL));
  int v29 = v17[(v18 >> 1) + 31];
  int v30 = 0x10000 - v29;
  BOOL v31 = (v18 & 1) == 0;
LABEL_44:
  if (!v31) {
    int v29 = v30;
  }
  int v41 = v20
      + v16
      + v22
      + v24
      + v26
      + v28
      + *(_DWORD *)((char *)&unk_24FF7D720 + (((v29 + 2048) >> 10) & 0xFCLL));
  return (v9 + v7 + v41);
}

uint64_t sub_24FF76368(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = a1;
  uint64_t v1255 = *MEMORY[0x263EF8340];
  if (*(_DWORD *)(a2 + 16) == 1)
  {
    uint64_t v4 = *(unsigned int *)(a1 + 3548);
    memset_pattern16(&__b, &unk_24FF7D710, 4uLL);
    if ((int)v4 >= 1)
    {
      uint64_t v5 = 0;
      uint64_t v6 = 4 * v4;
      do
      {
        uint64_t v7 = *(int *)(*(void *)(v3 + 3304) + v5);
        uint64_t v8 = *(unsigned int *)(*(void *)(v3 + 3328) + 4 * v7);
        LODWORD(v1232[1]) = -1;
        v1232[0] = (void *)-1;
        LODWORD(v1230) = -1;
        __p = (void *)-1;
        if ((v8 & 0x80000000) != 0)
        {
          uint64_t v13 = 0;
          uint64_t v14 = *(void *)(v3 + 3096);
        }
        else
        {
          int v9 = (unsigned int *)(*(void *)(v3 + 160) + 12 * v8);
          sub_24FF75874((void *)v3, v8, v7, (unsigned int *)(*(void *)(v3 + 136) + 12 * v8), v1232);
          sub_24FF75874((void *)v3, v8, v7, v9, &__p);
          int v10 = (int)v1232[1];
          if (((uint64_t)v1232[1] & 0x80000000) == 0 || (v1230 & 0x80000000) != 0)
          {
            int v12 = (int)v1232[1];
            int v10 = v1230;
          }
          else
          {
            uint64_t v11 = v1232[0];
            v1232[0] = __p;
            int v12 = v1230;
            LODWORD(v1232[1]) = v1230;
            __p = v11;
          }
          if (v10 == -1)
          {
            uint64_t v14 = *(void *)(v3 + 3096);
            if (v12 == -1)
            {
              if (HIDWORD(v1232[0]) == -1)
              {
                if (LODWORD(v1232[0]) == -1) {
                  uint64_t v13 = 0;
                }
                else {
                  uint64_t v13 = *(unsigned __int8 *)(v14 + SLODWORD(v1232[0]));
                }
              }
              else
              {
                LODWORD(v13) = *(unsigned __int8 *)(v14 + SLODWORD(v1232[0]));
                if (*(unsigned char *)(v14 + SLODWORD(v1232[0]))) {
                  LODWORD(v13) = *(unsigned char *)(v14 + SHIDWORD(v1232[0])) != 0;
                }
                uint64_t v13 = v13;
              }
              goto LABEL_17;
            }
            BOOL v15 = *(unsigned __int8 *)(v14 + SHIDWORD(v1232[0]))
                + *(unsigned __int8 *)(v14 + SLODWORD(v1232[0]))
                + *(unsigned __int8 *)(v14 + v12) > 1;
          }
          else
          {
            uint64_t v14 = *(void *)(v3 + 3096);
            BOOL v15 = *(unsigned __int8 *)(v14 + SHIDWORD(v1232[0]))
                + *(unsigned __int8 *)(v14 + SLODWORD(v1232[0]))
                + *(unsigned __int8 *)(v14 + v12)
                + *(unsigned __int8 *)(v14 + (int)__p)
                + *(unsigned __int8 *)(v14 + SHIDWORD(__p))
                + *(unsigned __int8 *)(v14 + v10) > 2;
          }
          uint64_t v13 = v15;
        }
LABEL_17:
        sub_24FF6DACC(v3 + 3560, *(unsigned __int8 *)(v14 + v7) != 0, (_WORD *)&v1210[-1] + v13);
        v5 += 4;
      }
      while (v6 != v5);
    }
  }
  uint64_t v1160 = v2;
  v1152 = (void *)v3;
  switch(*(_DWORD *)(v2 + 12))
  {
    case 0:
      int v16 = (void *)(v3 + 3136);
      uint64_t v17 = *(unsigned int *)(v3 + 3548);
      unint64_t v18 = *(int *)(v3 + 3544);
      uint64_t v1153 = *(unsigned int *)(v3 + 3544);
      uint64_t v19 = *(void *)(v3 + 3208);
      int v1138 = *(_DWORD *)(v2 + 16);
      memset_pattern16(&v1205, &unk_24FF7D710, 6uLL);
      char v20 = 0;
      uint64_t v21 = 0;
      long long v1245 = 0u;
      long long v1246 = 0u;
      long long v1243 = 0u;
      long long v1244 = 0u;
      long long v1241 = 0u;
      long long v1242 = 0u;
      long long v1239 = 0u;
      long long v1240 = 0u;
      long long v1237 = 0u;
      *(_OWORD *)v1238 = 0u;
      *(_OWORD *)v1235 = 0u;
      *(_OWORD *)v1236 = 0u;
      *(_OWORD *)v1233 = 0u;
      long long v1234 = 0u;
      *(_OWORD *)v1232 = 0u;
      do
      {
        char v22 = v20;
        sub_24FF60D8C((uint64_t)&v1232[15 * v21], v18);
        char v20 = 1;
        uint64_t v21 = 1;
      }
      while ((v22 & 1) == 0);
      LODWORD(__b) = 0;
      sub_24FF6A454(&__p, v18, &__b);
      sub_24FF6A64C(&__b, v18);
      if ((int)v17 < 1) {
        goto LABEL_70;
      }
      uint64_t v23 = 0;
      uint64_t v1145 = v3 + 3560;
      int v1101 = v18;
      v1110 = (void *)(v3 + 3136);
      uint64_t v1128 = v17;
      uint64_t v1092 = v19;
      while (1)
      {
        uint64_t v24 = *(int *)(*(void *)(v3 + 3304) + 4 * v23);
        if (!v1138 || *(unsigned char *)(*(void *)(v3 + 3232) + v24)) {
          break;
        }
LABEL_69:
        if (++v23 == v17)
        {
LABEL_70:
          if (__b)
          {
            v1210[0] = __b;
            operator delete(__b);
          }
          if (__p)
          {
            uint64_t v1230 = (uint64_t)__p;
            operator delete(__p);
          }
          for (unint64_t i = 0; i != -240; i -= 120)
          {
            uint64_t v62 = &v1232[i / 8];
            int v63 = *(void **)((char *)&v1245 + i + 8);
            if (v63)
            {
              v62[28] = v63;
              operator delete(v63);
            }
            uint64_t v64 = v62[24];
            if (v64)
            {
              *(void *)((char *)&v1244 + i + 8) = v64;
              operator delete(v64);
            }
            uint64_t v65 = &v1232[i / 8];
            uint64_t v66 = *(void **)((char *)&v1242 + i + 8);
            if (v66)
            {
              v65[22] = v66;
              operator delete(v66);
            }
            uint64_t v67 = v65[18];
            if (v67)
            {
              *(void *)((char *)&v1241 + i + 8) = v67;
              operator delete(v67);
            }
            uint64_t v68 = v62[15];
            if (v68)
            {
              *(void *)((char *)&v1240 + i) = v68;
              operator delete(v68);
            }
          }
          return 0;
        }
      }
      uint64_t v1175 = v19 + 4 * (int)v24 * (int)v1153;
      unsigned int v25 = *(_DWORD *)(*(void *)(v3 + 3328) + 4 * v24);
      if ((v25 & 0x80000000) != 0) {
        goto LABEL_48;
      }
      int v26 = v16;
      uint64_t v27 = v23;
      LODWORD(v1208) = -1;
      v1207 = (void *)-1;
      sub_24FF75874((void *)v3, v25, v24, (unsigned int *)(*(void *)(v3 + 136) + 12 * v25), &v1207);
      int v28 = (int)v1207;
      int v29 = HIDWORD(v1207);
      if ((HIDWORD(v1207) & 0x80000000) == 0) {
        goto LABEL_38;
      }
      sub_24FF75874((void *)v3, v25, v24, (unsigned int *)(*(void *)(v3 + 160) + 12 * v25), &v1207);
      if ((HIDWORD(v1207) & 0x80000000) != 0)
      {
        if (v29 == -1) {
          goto LABEL_47;
        }
      }
      else
      {
        int v28 = (int)v1207;
        int v29 = HIDWORD(v1207);
      }
LABEL_38:
      if (!v1138 || (uint64_t v30 = *(void *)(v3 + 3232), *(unsigned char *)(v30 + v28)) && *(unsigned char *)(v30 + v29))
      {
        if ((int)v1153 >= 1)
        {
          BOOL v31 = (int *)(v19 + 4 * v28 * (int)v18);
          uint64_t v32 = v1153;
          int v33 = (int *)(v19 + 4 * v29 * (int)v1153);
          int v34 = (int *)__p;
          do
          {
            int v36 = *v31++;
            int v35 = v36;
            int v37 = *v33++;
            BOOL v38 = __OFADD__(v37, v35);
            int v39 = v37 + v35;
            if (v39 < 0 != v38) {
              ++v39;
            }
            *v34++ = v39 >> 1;
            --v32;
          }
          while (v32);
        }
        unsigned int v40 = 1;
        uint64_t v23 = v27;
        int v16 = v26;
        uint64_t v17 = v1128;
        goto LABEL_63;
      }
LABEL_47:
      uint64_t v23 = v27;
      int v16 = v26;
      uint64_t v17 = v1128;
LABEL_48:
      int v41 = sub_24FF75C20(v3, v24, (int *)__p, v1230, *(_DWORD *)(v2 + 16));
      unsigned int v40 = 0;
      if ((int)v1153 >= 1 && !v41)
      {
        uint64_t v1119 = v23;
        for (uint64_t j = 0; j != v1153; ++j)
        {
          unsigned int v43 = 0;
          int v44 = __b;
          int v45 = &__b[20 * j];
          int v46 = *(unsigned __int8 *)(v2 + 24);
          int v47 = *(unsigned __int8 *)(v2 + 8);
          int v48 = 0x7FFFFFFF;
          char v49 = -1;
          v1161 = __p;
          unsigned int v50 = -1;
          do
          {
            int v51 = *(_DWORD *)&v44[20 * j + 4 + 4 * ((v49 + *(_DWORD *)v45) & 3)];
            int v52 = *(_DWORD *)(v1175 + 4 * j) - v51;
            if (v46)
            {
              signed int v53 = sub_24FF75EE0(v52, j, v43, (unsigned __int16 *)&v1205, v47, v1232);
            }
            else
            {
              if (v52 >= 0) {
                int v54 = *(_DWORD *)(v1175 + 4 * j) - v51;
              }
              else {
                int v54 = v51 - *(_DWORD *)(v1175 + 4 * j);
              }
              signed int v53 = -__clz(v54 + 1);
            }
            if (v53 < v48)
            {
              v1161[j] = v51;
              int v48 = v53;
              unsigned int v50 = v43;
            }
            ++v43;
            --v49;
          }
          while (v43 != 4);
          sub_24FF6DACC(v1145, v50 & 1, &v1205);
          sub_24FF6DACC(v1145, (v50 >> 1) & 1, (_WORD *)&v1205 + (v50 & 1) + 1);
          uint64_t v2 = v1160;
        }
        unsigned int v40 = 0;
        uint64_t v3 = (uint64_t)v1152;
        LODWORD(v18) = v1101;
        int v16 = v1110;
        uint64_t v23 = v1119;
        uint64_t v17 = v1128;
        uint64_t v19 = v1092;
      }
LABEL_63:
      if ((int)v18 >= 1)
      {
        uint64_t v55 = __b + 4;
        uint64_t v56 = (int *)v1175;
        uint64_t v57 = v1153;
        do
        {
          int v59 = *v56++;
          int v58 = v59;
          int v60 = *((_DWORD *)v55 - 1);
          if (*(_DWORD *)&v55[4 * (((_BYTE)v60 - 1) & 3)] != v59)
          {
            *((_DWORD *)v55 - 1) = v60 + 1;
            *(_DWORD *)&v55[4 * (v60 & 3)] = v58;
          }
          v55 += 20;
          --v57;
        }
        while (v57);
      }
      sub_24FF6DC40(v3, v1175, (uint64_t)__p, v18, v16, *(unsigned char *)(v2 + 8), &v1232[15 * v40]);
      goto LABEL_69;
    case 1:
      size_t v321 = (void *)(v3 + 3136);
      uint64_t v322 = *(unsigned int *)(v3 + 3548);
      unint64_t v323 = *(int *)(v3 + 3544);
      uint64_t v324 = *(unsigned int *)(v3 + 3544);
      uint64_t v1131 = *(void *)(v3 + 3208);
      memset_pattern16(&v1205, &unk_24FF7D710, 6uLL);
      uint64_t v325 = 0;
      uint64_t v1254 = 0;
      long long v1252 = 0u;
      long long v1253 = 0u;
      long long v1250 = 0u;
      long long v1251 = 0u;
      long long v1248 = 0u;
      long long v1249 = 0u;
      long long v1246 = 0u;
      long long v1247 = 0u;
      long long v1244 = 0u;
      long long v1245 = 0u;
      long long v1242 = 0u;
      long long v1243 = 0u;
      long long v1240 = 0u;
      long long v1241 = 0u;
      *(_OWORD *)v1238 = 0u;
      long long v1239 = 0u;
      *(_OWORD *)v1236 = 0u;
      long long v1237 = 0u;
      long long v1234 = 0u;
      *(_OWORD *)v1235 = 0u;
      *(_OWORD *)v1232 = 0u;
      *(_OWORD *)v1233 = 0u;
      do
      {
        sub_24FF60D8C((uint64_t)&v1232[v325], v323);
        v325 += 15;
      }
      while (v325 != 45);
      LODWORD(__b) = 0;
      sub_24FF6A454(&__p, v323, &__b);
      int v1141 = *(_DWORD *)(v2 + 16);
      sub_24FF6A64C(&__b, v323);
      if ((int)v322 < 1) {
        goto LABEL_386;
      }
      uint64_t v326 = 0;
      uint64_t v1148 = v3 + 3560;
      uint64_t v1156 = v324;
      int v1097 = v323;
      v1106 = (void *)(v3 + 3136);
      uint64_t v1122 = v322;
      do
      {
        uint64_t v327 = *(int *)(*(void *)(v3 + 3304) + 4 * v326);
        if (v1141 && !*(unsigned char *)(*(void *)(v3 + 3232) + v327)) {
          goto LABEL_385;
        }
        uint64_t v1179 = v1131 + 4 * (int)v327 * (int)v323;
        unsigned int v328 = *(_DWORD *)(*(void *)(v3 + 3328) + 4 * v327);
        if ((v328 & 0x80000000) != 0) {
          goto LABEL_361;
        }
        v329 = v321;
        LODWORD(v1208) = -1;
        v1207 = (void *)-1;
        sub_24FF75874((void *)v3, v328, v327, (unsigned int *)(*(void *)(v3 + 136) + 12 * v328), &v1207);
        int v330 = (int)v1207;
        int v331 = HIDWORD(v1207);
        int v332 = (int)v1208;
        if ((v1208 & 0x80000000) != 0)
        {
          sub_24FF75874((void *)v3, v328, v327, (unsigned int *)(*(void *)(v3 + 160) + 12 * v328), &v1207);
          if ((v1208 & 0x80000000) != 0)
          {
            if (v332 == -1) {
              goto LABEL_350;
            }
          }
          else
          {
            int v330 = (int)v1207;
            int v331 = HIDWORD(v1207);
            int v332 = (int)v1208;
          }
        }
        if (!v1141
          || (uint64_t v333 = *(void *)(v3 + 3232), *(unsigned char *)(v333 + v330))
          && *(unsigned char *)(v333 + v331)
          && *(unsigned char *)(v333 + v332))
        {
          if ((int)v1156 < 1)
          {
            unsigned int v344 = 2;
            uint64_t v324 = v1156;
          }
          else
          {
            int v334 = (int *)(v1131 + 4 * v330 * (int)v1156);
            unint64_t v335 = (int *)(v1131 + 4 * v331 * (int)v323);
            uint64_t v336 = (int *)(v1131 + 4 * v332 * (int)v1156);
            int v337 = __p;
            uint64_t v338 = v1156;
            uint64_t v324 = v1156;
            do
            {
              int v340 = *v334++;
              int v339 = v340;
              int v341 = *v335++;
              int v342 = v341 + v339;
              int v343 = *v336++;
              *v337++ = v342 - v343;
              --v338;
            }
            while (v338);
            unsigned int v344 = 2;
          }
          goto LABEL_378;
        }
LABEL_350:
        if (v331 == -1
          || v1141 && ((uint64_t v345 = *(void *)(v3 + 3232), !*(unsigned char *)(v345 + v330)) || !*(unsigned char *)(v345 + v331)))
        {
          uint64_t v324 = v1156;
          size_t v321 = v329;
          uint64_t v322 = v1122;
LABEL_361:
          int v354 = sub_24FF75C20(v3, v327, (int *)__p, v1230, *(_DWORD *)(v2 + 16));
          unsigned int v344 = 0;
          if ((int)v324 >= 1 && !v354)
          {
            uint64_t v1115 = v326;
            uint64_t v355 = 0;
            do
            {
              unsigned int v356 = 0;
              int v357 = __b;
              v358 = &__b[20 * v355];
              int v359 = *(unsigned __int8 *)(v2 + 24);
              int v360 = *(unsigned __int8 *)(v2 + 8);
              int v361 = 0x7FFFFFFF;
              char v362 = -1;
              v1166 = __p;
              unsigned int v363 = -1;
              do
              {
                int v364 = *(_DWORD *)&v357[20 * v355 + 4 + 4 * ((v362 + *(_DWORD *)v358) & 3)];
                int v365 = *(_DWORD *)(v1179 + 4 * v355) - v364;
                if (v359)
                {
                  signed int v366 = sub_24FF75EE0(v365, v355, v356, (unsigned __int16 *)&v1205, v360, v1232);
                }
                else
                {
                  if (v365 >= 0) {
                    int v367 = *(_DWORD *)(v1179 + 4 * v355) - v364;
                  }
                  else {
                    int v367 = v364 - *(_DWORD *)(v1179 + 4 * v355);
                  }
                  signed int v366 = -__clz(v367 + 1);
                }
                if (v366 < v361)
                {
                  v1166[v355] = v364;
                  int v361 = v366;
                  unsigned int v363 = v356;
                }
                ++v356;
                --v362;
              }
              while (v356 != 4);
              sub_24FF6DACC(v1148, v363 & 1, &v1205);
              sub_24FF6DACC(v1148, (v363 >> 1) & 1, (_WORD *)&v1205 + (v363 & 1) + 1);
              ++v355;
              uint64_t v324 = v1156;
              uint64_t v2 = v1160;
            }
            while (v355 != v1156);
            unsigned int v344 = 0;
            uint64_t v3 = (uint64_t)v1152;
            LODWORD(v323) = v1097;
            size_t v321 = v1106;
            uint64_t v326 = v1115;
            uint64_t v322 = v1122;
          }
          goto LABEL_379;
        }
        if ((int)v323 < 1)
        {
          unsigned int v344 = 1;
          uint64_t v324 = v1156;
        }
        else
        {
          int v346 = (int *)(v1131 + 4 * v330 * (int)v323);
          uint64_t v324 = v1156;
          uint64_t v347 = (int *)(v1131 + 4 * v331 * (int)v1156);
          int v348 = (int *)__p;
          uint64_t v349 = v1156;
          do
          {
            int v351 = *v346++;
            int v350 = v351;
            int v352 = *v347++;
            BOOL v38 = __OFADD__(v352, v350);
            int v353 = v352 + v350;
            if (v353 < 0 != v38) {
              ++v353;
            }
            *v348++ = v353 >> 1;
            --v349;
          }
          while (v349);
          unsigned int v344 = 1;
        }
LABEL_378:
        size_t v321 = v329;
        uint64_t v322 = v1122;
LABEL_379:
        if ((int)v324 >= 1)
        {
          uint64_t v368 = __b + 4;
          uint64_t v369 = (int *)v1179;
          uint64_t v370 = v324;
          do
          {
            int v372 = *v369++;
            int v371 = v372;
            int v373 = *((_DWORD *)v368 - 1);
            if (*(_DWORD *)&v368[4 * (((_BYTE)v373 - 1) & 3)] != v372)
            {
              *((_DWORD *)v368 - 1) = v373 + 1;
              *(_DWORD *)&v368[4 * (v373 & 3)] = v371;
            }
            v368 += 20;
            --v370;
          }
          while (v370);
        }
        sub_24FF6DC40(v3, v1179, (uint64_t)__p, v323, v321, *(unsigned char *)(v2 + 8), &v1232[15 * v344]);
LABEL_385:
        ++v326;
      }
      while (v326 != v322);
LABEL_386:
      if (__b)
      {
        v1210[0] = __b;
        operator delete(__b);
      }
      if (__p)
      {
        uint64_t v1230 = (uint64_t)__p;
        operator delete(__p);
      }
      unint64_t v374 = 360;
      do
      {
        int v375 = &v1232[v374 / 8];
        int v376 = *(void **)((char *)&__p + v374);
        if (v376)
        {
          *(v375 - 2) = v376;
          operator delete(v376);
        }
        int v377 = *(v375 - 6);
        if (v377)
        {
          *(void *)((char *)&v1224 + v374) = v377;
          operator delete(v377);
        }
        unint64_t v378 = &v1232[v374 / 8];
        unsigned int v379 = *(void **)((char *)&v1216 + v374);
        if (v379)
        {
          *(v378 - 8) = v379;
          operator delete(v379);
        }
        unsigned int v380 = *(v378 - 12);
        if (v380)
        {
          *(void *)((char *)&v1213 + v374) = v380;
          operator delete(v380);
        }
        unsigned int v381 = *(v375 - 15);
        if (v381)
        {
          v1210[v374 / 8] = v381;
          operator delete(v381);
        }
        v374 -= 120;
      }
      while (v374);
      return 0;
    case 2:
      uint64_t v69 = 0;
      uint64_t v70 = *(unsigned int *)(v3 + 3548);
      uint64_t v71 = (void *)(v3 + 3136);
      unint64_t v72 = *(int *)(v3 + 3544);
      uint64_t v73 = *(unsigned int *)(v3 + 3544);
      uint64_t v74 = *(void *)(v3 + 3208);
      uint64_t v1254 = 0;
      long long v1252 = 0u;
      long long v1253 = 0u;
      long long v1250 = 0u;
      long long v1251 = 0u;
      long long v1248 = 0u;
      long long v1249 = 0u;
      long long v1246 = 0u;
      long long v1247 = 0u;
      long long v1244 = 0u;
      long long v1245 = 0u;
      long long v1242 = 0u;
      long long v1243 = 0u;
      long long v1240 = 0u;
      long long v1241 = 0u;
      *(_OWORD *)v1238 = 0u;
      long long v1239 = 0u;
      *(_OWORD *)v1236 = 0u;
      long long v1237 = 0u;
      long long v1234 = 0u;
      *(_OWORD *)v1235 = 0u;
      *(_OWORD *)v1232 = 0u;
      *(_OWORD *)v1233 = 0u;
      do
      {
        sub_24FF60D8C((uint64_t)&v1232[v69], v73);
        v69 += 15;
      }
      while (v69 != 45);
      memset_pattern16(&v1189, &unk_24FF7D710, 6uLL);
      memset_pattern16(&v1187, &unk_24FF7D710, 6uLL);
      LODWORD(__b) = 0;
      sub_24FF6A454(&__p, v72, &__b);
      LODWORD(v1207) = 0;
      sub_24FF6A454(&__b, v72, &v1207);
      LODWORD(v1205) = 0;
      sub_24FF6A454(&v1207, v72, &v1205);
      LODWORD(v1203) = 0;
      sub_24FF6A454(&v1205, v72, &v1203);
      LODWORD(v1201) = 0;
      sub_24FF6A454(&v1203, v72, &v1201);
      LODWORD(v1199) = 0;
      sub_24FF6A454(&v1201, v72, &v1199);
      LODWORD(v1197) = 0;
      sub_24FF6A454(&v1199, v72, &v1197);
      LODWORD(v1195) = 0;
      sub_24FF6A454(&v1197, v72, &v1195);
      int v1129 = *(_DWORD *)(v2 + 16);
      sub_24FF6A64C(&v1195, v72);
      if ((int)v70 < 1) {
        goto LABEL_1425;
      }
      uint64_t v75 = 0;
      uint64_t v1146 = v3 + 3560;
      uint64_t v1058 = 4 * v73;
      v1093 = (void *)(v3 + 3136);
      uint64_t v1102 = v70;
      int v1086 = v72;
      uint64_t v1154 = v73;
      uint64_t v1111 = v74;
      while (1)
      {
        uint64_t v76 = (void *)v3;
        uint64_t v77 = *(int *)(*(void *)(v3 + 3304) + 4 * v75);
        if (!v1129 || *(unsigned char *)(v76[404] + v77)) {
          break;
        }
LABEL_183:
        ++v75;
        uint64_t v3 = (uint64_t)v76;
        if (v75 == v70)
        {
LABEL_1425:
          if (v1195)
          {
            v1196 = v1195;
            operator delete(v1195);
          }
          if (v1197)
          {
            v1198 = v1197;
            operator delete(v1197);
          }
          if (v1199)
          {
            v1200 = v1199;
            operator delete(v1199);
          }
          if (v1201)
          {
            v1202 = v1201;
            operator delete(v1201);
          }
          if (v1203)
          {
            v1204 = v1203;
            operator delete(v1203);
          }
          if (v1205)
          {
            v1206 = v1205;
            operator delete(v1205);
          }
          if (v1207)
          {
            v1208 = v1207;
            operator delete(v1207);
          }
          if (__b)
          {
            v1210[0] = __b;
            operator delete(__b);
          }
          if (__p)
          {
            uint64_t v1230 = (uint64_t)__p;
            operator delete(__p);
          }
          unint64_t v1012 = 360;
          do
          {
            v1013 = &v1232[v1012 / 8];
            v1014 = *(void **)((char *)&__p + v1012);
            if (v1014)
            {
              *(v1013 - 2) = v1014;
              operator delete(v1014);
            }
            v1015 = *(v1013 - 6);
            if (v1015)
            {
              *(void *)((char *)&v1224 + v1012) = v1015;
              operator delete(v1015);
            }
            v1016 = &v1232[v1012 / 8];
            v1017 = *(void **)((char *)&v1216 + v1012);
            if (v1017)
            {
              *(v1016 - 8) = v1017;
              operator delete(v1017);
            }
            v1018 = *(v1016 - 12);
            if (v1018)
            {
              *(void *)((char *)&v1213 + v1012) = v1018;
              operator delete(v1018);
            }
            v1019 = *(v1013 - 15);
            if (v1019)
            {
              v1210[v1012 / 8] = v1019;
              operator delete(v1019);
            }
            v1012 -= 120;
          }
          while (v1012);
          return 0;
        }
      }
      uint64_t v1176 = v74 + 4 * (int)v77 * (int)v72;
      uint64_t v78 = *(unsigned int *)(v76[416] + 4 * v77);
      uint64_t v79 = (int *)__p;
      v1139 = __p;
      uint64_t v1120 = v75;
      if ((v78 & 0x80000000) != 0) {
        goto LABEL_162;
      }
      int v1194 = -1;
      unint64_t v1193 = -1;
      int v1192 = -1;
      unint64_t v1191 = -1;
      sub_24FF75874(v76, v78, v77, (unsigned int *)(v76[17] + 12 * v78), &v1193);
      sub_24FF75874(v76, v78, v77, (unsigned int *)(v76[20] + 12 * v78), &v1191);
      int v80 = v1194;
      if (v1194 < 0)
      {
        if ((v1192 & 0x80000000) == 0)
        {
          unint64_t v84 = v1193;
          unint64_t v1193 = v1191;
          int v85 = v1192;
          int v1194 = v1192;
          unint64_t v1191 = v84;
          int v1192 = v80;
          int v80 = v85;
        }
        int v83 = v1139;
        int v81 = v1193;
        int v82 = HIDWORD(v1193);
        if (v80 == -1) {
          goto LABEL_107;
        }
      }
      else
      {
        int v81 = v1193;
        int v82 = HIDWORD(v1193);
        int v83 = v1139;
      }
      if (!v1129 || (uint64_t v86 = v1152[404], *(unsigned char *)(v86 + v81)) && *(unsigned char *)(v86 + v82) && *(unsigned char *)(v86 + v80))
      {
        if ((int)v73 >= 1)
        {
          uint64_t v87 = (int *)(v74 + 4 * v81 * (int)v73);
          unsigned int v88 = (int *)(v74 + 4 * v82 * (int)v72);
          uint64_t v89 = (int *)(v74 + 4 * v80 * (int)v73);
          uint64_t v90 = v83;
          uint64_t v91 = v73;
          do
          {
            int v93 = *v87++;
            int v92 = v93;
            int v94 = *v88++;
            int v95 = v94 + v92;
            int v96 = *v89++;
            *v90++ = v95 - v96;
            --v91;
          }
          while (v91);
        }
        int v97 = 0;
        unsigned int v98 = 2;
        goto LABEL_118;
      }
LABEL_107:
      if (v82 == -1 || v1129 && ((uint64_t v99 = v1152[404], !*(unsigned char *)(v99 + v81)) || !*(unsigned char *)(v99 + v82)))
      {
        unsigned int v98 = 0;
        int v97 = 1;
      }
      else
      {
        if ((int)v72 >= 1)
        {
          int v100 = (int *)(v74 + 4 * v81 * (int)v72);
          uint64_t v101 = (int *)(v74 + 4 * v82 * (int)v73);
          uint64_t v102 = v83;
          uint64_t v103 = v73;
          do
          {
            int v105 = *v100++;
            int v104 = v105;
            int v106 = *v101++;
            BOOL v38 = __OFADD__(v106, v104);
            int v107 = v106 + v104;
            if (v107 < 0 != v38) {
              ++v107;
            }
            *v102++ = v107 >> 1;
            --v103;
          }
          while (v103);
        }
        int v97 = 0;
        unsigned int v98 = 1;
      }
LABEL_118:
      if (v1192 == -1
        || v1129
        && ((uint64_t v108 = v1152[404], !*(unsigned char *)(v108 + v81))
         || !*(unsigned char *)(v108 + v82)
         || !*(unsigned char *)(v108 + v80)
         || !*(unsigned char *)(v108 + (int)v1191)
         || !*(unsigned char *)(v108 + SHIDWORD(v1191))
         || !*(unsigned char *)(v108 + v1192)))
      {
LABEL_160:
        if (v97)
        {
          uint64_t v79 = (int *)__p;
LABEL_162:
          int v152 = sub_24FF75C20((uint64_t)v1152, v77, v79, v1230, *(_DWORD *)(v2 + 16));
          unsigned int v98 = 0;
          if ((int)v73 >= 1 && !v152)
          {
            uint64_t v153 = 0;
            do
            {
              unsigned int v154 = 0;
              uint64_t v155 = v1195;
              uint64_t v156 = (char *)v1195 + 20 * v153;
              int v157 = *(unsigned __int8 *)(v1160 + 24);
              int v158 = *(unsigned __int8 *)(v1160 + 8);
              int v159 = 0x7FFFFFFF;
              char v160 = -1;
              v1163 = __p;
              unsigned int v161 = -1;
              do
              {
                int v162 = v155[5 * v153 + 1 + ((v160 + *v156) & 3)];
                int v163 = *(_DWORD *)(v1176 + 4 * v153) - v162;
                if (v157)
                {
                  signed int v164 = sub_24FF75EE0(v163, v153, v154, (unsigned __int16 *)&v1189, v158, v1232);
                }
                else
                {
                  if (v163 >= 0) {
                    int v165 = *(_DWORD *)(v1176 + 4 * v153) - v162;
                  }
                  else {
                    int v165 = v162 - *(_DWORD *)(v1176 + 4 * v153);
                  }
                  signed int v164 = -__clz(v165 + 1);
                }
                if (v164 < v159)
                {
                  v1163[v153] = v162;
                  int v159 = v164;
                  unsigned int v161 = v154;
                }
                ++v154;
                --v160;
              }
              while (v154 != 4);
              sub_24FF6DACC(v1146, v161 & 1, &v1189);
              sub_24FF6DACC(v1146, (v161 >> 1) & 1, (_WORD *)&v1189 + (v161 & 1) + 1);
              ++v153;
              uint64_t v73 = v1154;
            }
            while (v153 != v1154);
            unsigned int v98 = 0;
            uint64_t v2 = v1160;
            uint64_t v71 = v1093;
            uint64_t v70 = v1102;
            LODWORD(v72) = v1086;
            uint64_t v74 = v1111;
          }
        }
        uint64_t v76 = v1152;
        if ((int)v72 >= 1)
        {
          uint64_t v166 = (char *)v1195 + 4;
          uint64_t v167 = (int *)v1176;
          uint64_t v168 = v73;
          do
          {
            int v170 = *v167++;
            int v169 = v170;
            int v171 = *((_DWORD *)v166 - 1);
            if (*(_DWORD *)&v166[4 * (((_BYTE)v171 - 1) & 3)] != v170)
            {
              *((_DWORD *)v166 - 1) = v171 + 1;
              *(_DWORD *)&v166[4 * (v171 & 3)] = v169;
            }
            v166 += 20;
            --v168;
          }
          while (v168);
        }
        sub_24FF6DC40((uint64_t)v1152, v1176, (uint64_t)v1139, v72, v71, *(unsigned char *)(v2 + 8), &v1232[15 * v98]);
        uint64_t v75 = v1120;
        goto LABEL_183;
      }
      int v1082 = v97;
      unsigned int v1162 = v98;
      if ((int)v73 < 1)
      {
        int v130 = *(unsigned __int8 *)(v2 + 24);
        if (!*(unsigned char *)(v2 + 24))
        {
          int v142 = 0;
          int v137 = 0;
          int v144 = 0;
          goto LABEL_148;
        }
        uint64_t v119 = (int *)v1203;
        uint64_t v120 = (int *)v1201;
        unint64_t v121 = (int *)v1199;
        uint64_t v122 = (int *)v1197;
      }
      else
      {
        unint64_t v109 = 0;
        uint64_t v110 = v74 + 4 * v81 * (int)v72;
        uint64_t v111 = v74 + 4 * v82 * (int)v73;
        uint64_t v112 = v74 + 4 * v80 * (int)v72;
        uint64_t v113 = v74 + 4 * (int)v1191 * (int)v73;
        uint64_t v114 = v74 + 4 * HIDWORD(v1191) * (int)v72;
        uint64_t v115 = v74 + 4 * v1192 * (int)v73;
        int v116 = __b;
        BOOL v117 = (char *)v1207;
        int v118 = (char *)v1205;
        uint64_t v119 = (int *)v1203;
        uint64_t v120 = (int *)v1201;
        unint64_t v121 = (int *)v1199;
        uint64_t v122 = (int *)v1197;
        do
        {
          *(_DWORD *)&v116[v109] = *(_DWORD *)(v114 + v109) + *(_DWORD *)(v113 + v109) - *(_DWORD *)(v115 + v109);
          int v123 = *(_DWORD *)(v110 + v109);
          int v124 = *(_DWORD *)(v113 + v109);
          int v125 = v124 + v123;
          if (v124 + v123 < 0 != __OFADD__(v124, v123)) {
            ++v125;
          }
          *(_DWORD *)&v117[v109] = *(_DWORD *)(v114 + v109) + *(_DWORD *)(v111 + v109) - (v125 >> 1);
          int v126 = *(_DWORD *)(v110 + v109);
          int v127 = *(_DWORD *)(v113 + v109);
          BOOL v38 = __OFADD__(v127, v126);
          int v128 = v127 + v126;
          if (v128 < 0 != v38) {
            ++v128;
          }
          unint64_t v129 = 1431655766
               * ((v128 >> 1)
                - (*(_DWORD *)(v112 + v109)
                 + *(_DWORD *)(v115 + v109))
                + 2 * (*(_DWORD *)(v114 + v109) + *(_DWORD *)(v111 + v109)));
          *(_DWORD *)&v118[v109] = HIDWORD(v129) + (v129 >> 63);
          v119[v109 / 4] = *(_DWORD *)(v1176 + v109) - v83[v109 / 4];
          v120[v109 / 4] = *(_DWORD *)(v1176 + v109) - *(_DWORD *)&v116[v109];
          v121[v109 / 4] = *(_DWORD *)(v1176 + v109) - *(_DWORD *)&v117[v109];
          v122[v109 / 4] = *(_DWORD *)(v1176 + v109) - *(_DWORD *)&v118[v109];
          v109 += 4;
        }
        while (v1058 != v109);
        if (!*(unsigned char *)(v1160 + 24))
        {
          int v145 = *v119;
          if (*v119 < 0) {
            int v145 = -v145;
          }
          int v142 = -(v72 * __clz(v145 + 1));
          int v146 = *v120;
          if (*v120 < 0) {
            int v146 = -v146;
          }
          int v137 = -(v73 * __clz(v146 + 1));
          int v147 = *v121;
          if (*v121 < 0) {
            int v147 = -v147;
          }
          int v130 = -(v72 * __clz(v147 + 1));
          int v148 = *v122;
          if (*v122 < 0) {
            int v148 = -v148;
          }
          int v144 = -(v73 * __clz(v148 + 1));
          uint64_t v2 = v1160;
LABEL_148:
          if (v142 <= v137 && v142 <= v130 && v142 <= v144)
          {
            int v149 = 0;
            int v150 = 0;
LABEL_152:
            uint64_t v151 = 1;
LABEL_159:
            uint64_t v74 = v1111;
            sub_24FF6DACC(v1146, v150, &v1187);
            sub_24FF6DACC(v1146, v149, (_WORD *)&v1187 + v151);
            unsigned int v98 = v1162;
            int v97 = v1082;
            goto LABEL_160;
          }
          if (v137 > v130 || v137 > v144)
          {
            if (v130 <= v144)
            {
              int v150 = 0;
              int v149 = 1;
              v1139 = v1207;
              goto LABEL_152;
            }
            int v149 = 1;
            v1139 = v1205;
            int v150 = 1;
          }
          else
          {
            int v149 = 0;
            int v150 = 1;
            v1139 = __b;
          }
          uint64_t v151 = 2;
          goto LABEL_159;
        }
        unsigned int v98 = v1162;
      }
      long long v1062 = (unsigned __int16 **)&v1232[15 * v98];
      int v131 = *(unsigned __int8 *)(v1160 + 8);
      uint64_t v132 = (unsigned __int16)v1187;
      int v133 = *(_DWORD *)((char *)&unk_24FF7D720 + ((((unsigned __int16)v1187 + 2048) >> 10) & 0x7CLL));
      uint64_t v1069 = WORD1(v1187);
      int v134 = *(_DWORD *)((char *)&unk_24FF7D720 + (((WORD1(v1187) + 2048) >> 10) & 0x7CLL));
      int v1074 = v134 + v133 + sub_24FF7C6B0(v119, v73, v131, v1062);
      int v135 = *(_DWORD *)((char *)&unk_24FF7D720 + (((unint64_t)(67584 - v132) >> 10) & 0x3FFFFFFFFFFFFCLL));
      int v1065 = v135;
      uint64_t v136 = WORD2(v1187);
      LODWORD(v132) = *(_DWORD *)((char *)&unk_24FF7D720 + (((WORD2(v1187) + 2048) >> 10) & 0x7CLL));
      LODWORD(v72) = v1086;
      int v137 = v132 + sub_24FF7C6B0(v120, v1086, v131, v1062) + v135;
      int v138 = *(_DWORD *)((char *)&unk_24FF7D720 + (((unint64_t)(67584 - v1069) >> 10) & 0x3FFFFFFFFFFFFCLL));
      int v139 = v121;
      uint64_t v2 = v1160;
      int v140 = sub_24FF7C6B0(v139, v1154, v131, v1062);
      LODWORD(v136) = *(_DWORD *)((char *)&unk_24FF7D720
                                + (((unint64_t)(67584 - v136) >> 10) & 0x3FFFFFFFFFFFFCLL));
      int v141 = sub_24FF7C6B0(v122, v1086, v131, v1062);
      int v142 = v1074;
      int v143 = v136 + v1065;
      uint64_t v73 = v1154;
      int v130 = v138 + v133 + v140;
      int v144 = v143 + v141;
      uint64_t v71 = v1093;
      uint64_t v70 = v1102;
      goto LABEL_148;
    case 3:
      uint64_t v382 = *(unsigned int *)(v3 + 3548);
      unint64_t v383 = *(int *)(v3 + 3544);
      uint64_t v384 = *(unsigned int *)(v3 + 3544);
      uint64_t v385 = *(void *)(v3 + 3208);
      memset_pattern16(&v1197, &unk_24FF7D710, 6uLL);
      uint64_t v386 = 0;
      uint64_t v1254 = 0;
      long long v1252 = 0u;
      long long v1253 = 0u;
      long long v1250 = 0u;
      long long v1251 = 0u;
      long long v1248 = 0u;
      long long v1249 = 0u;
      long long v1246 = 0u;
      long long v1247 = 0u;
      long long v1244 = 0u;
      long long v1245 = 0u;
      long long v1242 = 0u;
      long long v1243 = 0u;
      long long v1240 = 0u;
      long long v1241 = 0u;
      *(_OWORD *)v1238 = 0u;
      long long v1239 = 0u;
      *(_OWORD *)v1236 = 0u;
      long long v1237 = 0u;
      long long v1234 = 0u;
      *(_OWORD *)v1235 = 0u;
      *(_OWORD *)v1232 = 0u;
      *(_OWORD *)v1233 = 0u;
      do
      {
        sub_24FF60D8C((uint64_t)&v1232[v386], v383);
        v386 += 15;
      }
      while (v386 != 45);
      LOWORD(v1193) = 0x8000;
      LODWORD(__b) = 0;
      sub_24FF6A454(&__p, v383, &__b);
      LODWORD(v1207) = 0;
      sub_24FF6A454(&__b, v383, &v1207);
      int v387 = (void *)(v3 + 3136);
      int v1142 = *(_DWORD *)(v2 + 16);
      sub_24FF6A64C(&v1207, v383);
      if ((int)v382 < 1) {
        goto LABEL_470;
      }
      uint64_t v388 = 0;
      uint64_t v1157 = v3 + 3560;
      v1098 = (void *)(v3 + 3136);
      uint64_t v1107 = v385;
      uint64_t v1089 = v382;
      int v1116 = v383;
      uint64_t v1149 = v384;
      while (1)
      {
        uint64_t v389 = *(int *)(*(void *)(v3 + 3304) + 4 * v388);
        if (!v1142 || *(unsigned char *)(*(void *)(v3 + 3232) + v389)) {
          break;
        }
LABEL_469:
        if (++v388 == v382)
        {
LABEL_470:
          if (v1207)
          {
            v1208 = v1207;
            operator delete(v1207);
          }
          if (__b)
          {
            v1210[0] = __b;
            operator delete(__b);
          }
          if (__p)
          {
            uint64_t v1230 = (uint64_t)__p;
            operator delete(__p);
          }
          unint64_t v447 = 360;
          do
          {
            int v448 = &v1232[v447 / 8];
            int v449 = *(void **)((char *)&__p + v447);
            if (v449)
            {
              *(v448 - 2) = v449;
              operator delete(v449);
            }
            int v450 = *(v448 - 6);
            if (v450)
            {
              *(void *)((char *)&v1224 + v447) = v450;
              operator delete(v450);
            }
            int v451 = &v1232[v447 / 8];
            int v452 = *(void **)((char *)&v1216 + v447);
            if (v452)
            {
              *(v451 - 8) = v452;
              operator delete(v452);
            }
            int v453 = *(v451 - 12);
            if (v453)
            {
              *(void *)((char *)&v1213 + v447) = v453;
              operator delete(v453);
            }
            int v454 = *(v448 - 15);
            if (v454)
            {
              v1210[v447 / 8] = v454;
              operator delete(v454);
            }
            v447 -= 120;
          }
          while (v447);
          return 0;
        }
      }
      v1180 = (int *)(v385 + 4 * (int)v389 * (int)v383);
      uint64_t v390 = *(unsigned int *)(*(void *)(v3 + 3328) + 4 * v389);
      uint64_t v1132 = v388;
      if ((v390 & 0x80000000) != 0) {
        goto LABEL_442;
      }
      uint64_t v391 = (int *)(*(void *)(v3 + 136) + 12 * v390);
      int v392 = *v391;
      LODWORD(v1205) = *v391;
      int v393 = v391[1];
      HIDWORD(v1205) = v393;
      int v394 = v391[2];
      LODWORD(v1206) = v394;
      uint64_t v395 = (int *)(*(void *)(v3 + 160) + 12 * v390);
      int v1167 = *v395;
      LODWORD(v1203) = *v395;
      int v396 = v395[1];
      HIDWORD(v1203) = v396;
      int v1123 = v395[2];
      LODWORD(v1204) = v1123;
      LODWORD(v1202) = -1;
      v1201 = (void *)-1;
      LODWORD(v1200) = -1;
      v1199 = (void *)-1;
      sub_24FF75874((void *)v3, v390, v389, (unsigned int *)&v1205, &v1201);
      sub_24FF75874((void *)v3, v390, v389, (unsigned int *)&v1203, &v1199);
      int v397 = (int)v1202;
      int v398 = (int)v1200;
      if ((v1202 & 0x80000000) == 0 || (v1200 & 0x80000000) != 0)
      {
        int v399 = (int)v1199;
        int v400 = HIDWORD(v1199);
        LODWORD(v401) = v393;
        int v402 = v392;
      }
      else
      {
        int v1167 = v392;
        v1205 = v1203;
        int v1123 = v394;
        int v394 = (int)v1204;
        LODWORD(v1206) = v1204;
        int v399 = (int)v1201;
        int v400 = HIDWORD(v1201);
        v1201 = v1199;
        int v398 = (int)v1202;
        int v397 = (int)v1200;
        LODWORD(v1202) = v1200;
        int v396 = v393;
        unint64_t v401 = (unint64_t)v1203 >> 32;
        int v402 = (int)v1203;
      }
      LODWORD(v383) = v1116;
      if (v398 != -1
        && (!v1142
         || (uint64_t v403 = *(void *)(v3 + 3232), *(unsigned char *)(v403 + (int)v1201))
         && *(unsigned char *)(v403 + SHIDWORD(v1201))
         && *(unsigned char *)(v403 + v397)
         && *(unsigned char *)(v403 + v399)
         && *(unsigned char *)(v403 + v400)
         && *(unsigned char *)(v403 + v398)))
      {
        int v404 = v399;
        int v405 = (int *)(v1107 + 4 * v397 * (int)v384);
        uint64_t v406 = *(void *)(v3 + 184);
        int v407 = (int *)(v406 + 12 * v394);
        uint64_t v385 = v1107;
        sub_24FF56E70((int *)(v1107 + 4 * (int)v1201 * (int)v384), (int *)(v1107 + 4 * HIDWORD(v1201) * v1116), v405, v384, (int *)(v406 + 12 * v402), (int *)(v406 + 12 * (int)v401), v407, (int *)(v406 + 12 * v390), __p);
        sub_24FF56E70((int *)(v385 + 4 * v404 * v1116), (int *)(v385 + 4 * v400 * (int)v384), (int *)(v385 + 4 * v398 * v1116), v1116, (int *)(*(void *)(v3 + 184) + 12 * v1167), (int *)(*(void *)(v3 + 184) + 12 * v396), (int *)(*(void *)(v3 + 184) + 12 * v1123), (int *)(*(void *)(v3 + 184) + 12 * v390), __b);
        if (v1116 >= 1)
        {
          int v408 = (int *)__p;
          int v409 = __b;
          uint64_t v410 = v384;
          uint64_t v2 = v1160;
          uint64_t v388 = v1132;
          int v387 = v1098;
          do
          {
            int v411 = *(_DWORD *)v409;
            v409 += 4;
            int v412 = v411 + *v408;
            if (v412 < 0 != __OFADD__(v411, *v408)) {
              ++v412;
            }
            *v408++ = v412 >> 1;
            --v410;
          }
          while (v410);
          unsigned int v413 = 2;
          uint64_t v382 = v1089;
          goto LABEL_463;
        }
      }
      else
      {
        if (v397 == -1
          || v1142
          && ((uint64_t v414 = *(void *)(v3 + 3232), !*(unsigned char *)(v414 + (int)v1201))
           || !*(unsigned char *)(v414 + SHIDWORD(v1201))
           || !*(unsigned char *)(v414 + v397)))
        {
          if (HIDWORD(v1201) == -1
            || v1142
            && ((uint64_t v418 = *(void *)(v3 + 3232), !*(unsigned char *)(v418 + (int)v1201)) || !*(unsigned char *)(v418 + SHIDWORD(v1201))))
          {
            uint64_t v2 = v1160;
            int v387 = v1098;
            uint64_t v385 = v1107;
            uint64_t v388 = v1132;
            uint64_t v382 = v1089;
LABEL_442:
            int v419 = sub_24FF75C20(v3, v389, (int *)__p, v1230, *(_DWORD *)(v2 + 16));
            unsigned int v413 = 0;
            if ((int)v384 >= 1 && !v419)
            {
              uint64_t v420 = 0;
              do
              {
                unsigned int v421 = 0;
                v422 = v1207;
                uint64_t v423 = (char *)v1207 + 20 * v420;
                int v424 = *(unsigned __int8 *)(v1160 + 24);
                int v425 = *(unsigned __int8 *)(v1160 + 8);
                int v426 = 0x7FFFFFFF;
                char v427 = -1;
                v1168 = __p;
                unsigned int v428 = -1;
                do
                {
                  int v429 = v422[5 * v420 + 1 + ((v427 + *v423) & 3)];
                  int v430 = v1180[v420] - v429;
                  if (v424)
                  {
                    signed int v431 = sub_24FF75EE0(v430, v420, v421, (unsigned __int16 *)&v1197, v425, v1232);
                  }
                  else
                  {
                    if (v430 >= 0) {
                      int v432 = v1180[v420] - v429;
                    }
                    else {
                      int v432 = v429 - v1180[v420];
                    }
                    signed int v431 = -__clz(v432 + 1);
                  }
                  if (v431 < v426)
                  {
                    v1168[v420] = v429;
                    int v426 = v431;
                    unsigned int v428 = v421;
                  }
                  ++v421;
                  --v427;
                }
                while (v421 != 4);
                sub_24FF6DACC(v1157, v428 & 1, &v1197);
                sub_24FF6DACC(v1157, (v428 >> 1) & 1, (_WORD *)&v1197 + (v428 & 1) + 1);
                ++v420;
                uint64_t v384 = v1149;
              }
              while (v420 != v1149);
              unsigned int v413 = 0;
              uint64_t v2 = v1160;
              uint64_t v3 = (uint64_t)v1152;
              uint64_t v382 = v1089;
              int v387 = v1098;
              uint64_t v385 = v1107;
              LODWORD(v383) = v1116;
              uint64_t v388 = v1132;
            }
          }
          else
          {
            uint64_t v2 = v1160;
            int v387 = v1098;
            uint64_t v385 = v1107;
            uint64_t v388 = v1132;
            if (v384 == 2)
            {
              LODWORD(v1195) = 0;
              sub_24FF57110((int *)(v1107 + 8 * v1201), (int *)(v1107 + 8 * HIDWORD(v1201)), v1180, (_DWORD *)(*(void *)(v3 + 184) + 12 * v402), (_DWORD *)(*(void *)(v3 + 184) + 12 * (int)v401), (int *)(*(void *)(v3 + 184) + 12 * v390), (int *)__p, &v1195);
              uint64_t v382 = v1089;
              sub_24FF6DACC(v1157, v1195 != 0, &v1193);
            }
            else
            {
              uint64_t v382 = v1089;
              if ((int)v384 >= 1)
              {
                int v433 = (int *)(v1107 + 4 * (int)v1201 * v1116);
                int v434 = (int *)(v1107 + 4 * HIDWORD(v1201) * (int)v384);
                int v435 = (int *)__p;
                uint64_t v436 = v384;
                do
                {
                  int v438 = *v433++;
                  int v437 = v438;
                  int v439 = *v434++;
                  BOOL v38 = __OFADD__(v439, v437);
                  int v440 = v439 + v437;
                  if (v440 < 0 != v38) {
                    ++v440;
                  }
                  *v435++ = v440 >> 1;
                  --v436;
                }
                while (v436);
              }
            }
            unsigned int v413 = 1;
          }
LABEL_463:
          if ((int)v383 >= 1)
          {
            int v441 = (char *)v1207 + 4;
            int v442 = v1180;
            uint64_t v443 = v384;
            do
            {
              int v445 = *v442++;
              int v444 = v445;
              int v446 = *((_DWORD *)v441 - 1);
              if (*(_DWORD *)&v441[4 * (((_BYTE)v446 - 1) & 3)] != v445)
              {
                *((_DWORD *)v441 - 1) = v446 + 1;
                *(_DWORD *)&v441[4 * (v446 & 3)] = v444;
              }
              v441 += 20;
              --v443;
            }
            while (v443);
          }
          sub_24FF6DC40(v3, (uint64_t)v1180, (uint64_t)__p, v383, v387, *(unsigned char *)(v2 + 8), &v1232[15 * v413]);
          goto LABEL_469;
        }
        int v415 = (int *)(v1107 + 4 * v397 * (int)v384);
        uint64_t v416 = *(void *)(v3 + 184);
        int v417 = (int *)(v416 + 12 * v394);
        uint64_t v385 = v1107;
        sub_24FF56E70((int *)(v1107 + 4 * (int)v1201 * (int)v384), (int *)(v1107 + 4 * HIDWORD(v1201) * v1116), v415, v384, (int *)(v416 + 12 * v402), (int *)(v416 + 12 * (int)v401), v417, (int *)(v416 + 12 * v390), __p);
      }
      unsigned int v413 = 2;
      uint64_t v2 = v1160;
      uint64_t v388 = v1132;
      uint64_t v382 = v1089;
      int v387 = v1098;
      goto LABEL_463;
    case 4:
      uint64_t v172 = 0;
      uint64_t v173 = *(unsigned int *)(v3 + 3548);
      v1083 = (void *)(v3 + 3136);
      unint64_t v174 = *(int *)(v3 + 3544);
      uint64_t v175 = v3;
      uint64_t v176 = *(unsigned int *)(v3 + 3544);
      uint64_t v1130 = *(void *)(v175 + 3208);
      uint64_t v1254 = 0;
      long long v1252 = 0u;
      long long v1253 = 0u;
      long long v1250 = 0u;
      long long v1251 = 0u;
      long long v1248 = 0u;
      long long v1249 = 0u;
      long long v1246 = 0u;
      long long v1247 = 0u;
      long long v1244 = 0u;
      long long v1245 = 0u;
      long long v1242 = 0u;
      long long v1243 = 0u;
      long long v1240 = 0u;
      long long v1241 = 0u;
      *(_OWORD *)v1238 = 0u;
      long long v1239 = 0u;
      *(_OWORD *)v1236 = 0u;
      long long v1237 = 0u;
      long long v1234 = 0u;
      *(_OWORD *)v1235 = 0u;
      *(_OWORD *)v1232 = 0u;
      *(_OWORD *)v1233 = 0u;
      do
      {
        sub_24FF60D8C((uint64_t)&v1232[v172], v174);
        v172 += 15;
      }
      while (v172 != 45);
      LOWORD(v1225) = 0x8000;
      memset_pattern16(v1215, &unk_24FF7D710, 6uLL);
      memset_pattern16(&v1213, &unk_24FF7D710, 6uLL);
      memset_pattern16(&v1211, &unk_24FF7D710, 6uLL);
      LODWORD(__b) = 0;
      sub_24FF6A454(&__p, v174, &__b);
      LODWORD(v1207) = 0;
      sub_24FF6A454(&__b, v174, &v1207);
      LODWORD(v1205) = 0;
      sub_24FF6A454(&v1207, v174, &v1205);
      LODWORD(v1203) = 0;
      sub_24FF6A454(&v1205, v174, &v1203);
      LODWORD(v1201) = 0;
      sub_24FF6A454(&v1203, v174, &v1201);
      LODWORD(v1199) = 0;
      sub_24FF6A454(&v1201, v174, &v1199);
      LODWORD(v1197) = 0;
      sub_24FF6A454(&v1199, v174, &v1197);
      LODWORD(v1195) = 0;
      sub_24FF6A454(&v1197, v174, &v1195);
      int v177 = *(_DWORD *)(v2 + 16);
      sub_24FF6A64C(&v1195, v174);
      if ((int)v173 < 1) {
        goto LABEL_1456;
      }
      uint64_t v178 = 0;
      uint64_t v1147 = (uint64_t)(v1152 + 445);
      uint64_t v1066 = 4 * v176;
      uint64_t v1121 = v173;
      int v1075 = v174;
      uint64_t v1155 = v176;
      int v1079 = v177;
      while (1)
      {
        uint64_t v179 = (uint64_t)v1152;
        uint64_t v180 = *(int *)(v1152[413] + 4 * v178);
        if (!v177 || *(unsigned char *)(v1152[404] + v180)) {
          break;
        }
LABEL_327:
        if (++v178 == v173)
        {
LABEL_1456:
          if (v1195)
          {
            v1196 = v1195;
            operator delete(v1195);
          }
          if (v1197)
          {
            v1198 = v1197;
            operator delete(v1197);
          }
          if (v1199)
          {
            v1200 = v1199;
            operator delete(v1199);
          }
          if (v1201)
          {
            v1202 = v1201;
            operator delete(v1201);
          }
          if (v1203)
          {
            v1204 = v1203;
            operator delete(v1203);
          }
          if (v1205)
          {
            v1206 = v1205;
            operator delete(v1205);
          }
          if (v1207)
          {
            v1208 = v1207;
            operator delete(v1207);
          }
          if (__b)
          {
            v1210[0] = __b;
            operator delete(__b);
          }
          if (__p)
          {
            uint64_t v1230 = (uint64_t)__p;
            operator delete(__p);
          }
          unint64_t v1020 = 360;
          do
          {
            v1021 = &v1232[v1020 / 8];
            v1022 = *(void **)((char *)&__p + v1020);
            if (v1022)
            {
              *(v1021 - 2) = v1022;
              operator delete(v1022);
            }
            v1023 = *(v1021 - 6);
            if (v1023)
            {
              *(void *)((char *)&v1224 + v1020) = v1023;
              operator delete(v1023);
            }
            int v1024 = &v1232[v1020 / 8];
            int v1025 = *(void **)((char *)&v1216 + v1020);
            if (v1025)
            {
              *(v1024 - 8) = v1025;
              operator delete(v1025);
            }
            int v1026 = *(v1024 - 12);
            if (v1026)
            {
              *(void *)((char *)&v1213 + v1020) = v1026;
              operator delete(v1026);
            }
            int v1027 = *(v1021 - 15);
            if (v1027)
            {
              v1210[v1020 / 8] = v1027;
              operator delete(v1027);
            }
            v1020 -= 120;
          }
          while (v1020);
          return 0;
        }
      }
      uint64_t v181 = v1130 + 4 * (int)v180 * (int)v174;
      uint64_t v182 = *(unsigned int *)(v1152[416] + 4 * v180);
      int v183 = (int *)__p;
      uint64_t v1140 = v178;
      if ((v182 & 0x80000000) != 0) {
        goto LABEL_230;
      }
      v1177 = (int *)(v1130 + 4 * (int)v180 * (int)v174);
      unsigned int v184 = *(_DWORD *)(v1152[416] + 4 * v180);
      uint64_t v185 = 3 * v182;
      uint64_t v186 = (unsigned int *)(v1152[17] + 4 * v185);
      LODWORD(v187) = v186[1];
      unsigned int v188 = *v186;
      LODWORD(v1193) = *v186;
      HIDWORD(v1193) = v187;
      int v189 = v186[2];
      int v1194 = v189;
      int v190 = (int *)(v1152[20] + 4 * v185);
      LODWORD(v185) = v190[1];
      unsigned int v1112 = *v190;
      LODWORD(v1191) = *v190;
      int v1164 = v185;
      HIDWORD(v1191) = v185;
      int v1087 = v190[2];
      int v1192 = v1087;
      int v1190 = -1;
      uint64_t v1189 = -1;
      int v1188 = -1;
      unint64_t v1187 = -1;
      sub_24FF75874(v1152, v184, v180, (unsigned int *)&v1193, &v1189);
      unsigned int v1103 = v184;
      sub_24FF75874(v1152, v184, v180, (unsigned int *)&v1191, &v1187);
      int v191 = v1190;
      int v192 = v1188;
      if ((v1190 & 0x80000000) == 0 || v1188 < 0)
      {
        unsigned int v194 = v1187;
        unsigned int v195 = HIDWORD(v1187);
        int v197 = v188;
      }
      else
      {
        unint64_t v1193 = v1191;
        int v193 = v1192;
        int v1194 = v1192;
        unint64_t v1191 = __PAIR64__(v187, v188);
        int v1192 = v189;
        unsigned int v194 = v1189;
        unsigned int v195 = HIDWORD(v1189);
        uint64_t v1189 = v1187;
        int v196 = v1188;
        int v1190 = v1188;
        unint64_t v1187 = __PAIR64__(v195, v194);
        int v1188 = v191;
        int v192 = v191;
        int v191 = v196;
        int v1087 = v189;
        int v1164 = v187;
        unsigned int v1112 = v188;
        int v189 = v193;
        unint64_t v187 = HIDWORD(v1193);
        int v197 = v1193;
      }
      uint64_t v173 = v1121;
      if (v192 != -1)
      {
        if (!v177
          || (uint64_t v198 = v1152[404], *(unsigned char *)(v198 + (int)v1189))
          && *(unsigned char *)(v198 + SHIDWORD(v1189))
          && *(unsigned char *)(v198 + v191)
          && *(unsigned char *)(v198 + (int)v194)
          && *(unsigned char *)(v198 + (int)v195)
          && *(unsigned char *)(v198 + v192))
        {
          unsigned int v199 = v195;
          int v200 = (int *)(v1130 + 4 * HIDWORD(v1189) * (int)v174);
          int v201 = v174;
          unsigned int v202 = (int *)(v1130 + 4 * v191 * (int)v176);
          int v1059 = v197;
          v1094 = v183;
          long long v1070 = (int *)(v1130 + 4 * (int)v1189 * (int)v176);
          sub_24FF56E70(v1070, v200, v202, v176, (int *)(v1152[23] + 12 * v197), (int *)(v1152[23] + 12 * (int)v187), (int *)(v1152[23] + 12 * v189), (int *)(v1152[23] + 12 * v1103), v183);
          unsigned int v203 = (int *)(v1130 + 4 * (int)(v194 * v201));
          int v204 = (int *)(v1130 + 4 * (int)(v199 * v1155));
          int v205 = (int *)(v1130 + 4 * v192 * v201);
          sub_24FF56E70(v203, v204, v205, v201, (int *)(v1152[23] + 12 * (int)v1112), (int *)(v1152[23] + 12 * v1164), (int *)(v1152[23] + 12 * v1087), (int *)(v1152[23] + 12 * v1103), __b);
          if (v201 < 1)
          {
            uint64_t v2 = v1160;
            signed int v270 = *(unsigned __int8 *)(v1160 + 24);
            uint64_t v173 = v1121;
            if (!*(unsigned char *)(v1160 + 24))
            {
              signed int v298 = 0;
              signed int v293 = 0;
              signed int v299 = 0;
              LODWORD(v174) = v1075;
              uint64_t v176 = v1155;
              goto LABEL_294;
            }
            uint64_t v271 = (int *)v1203;
            int v272 = (int *)v1201;
            int v273 = (int *)v1199;
            uint64_t v274 = (int *)v1197;
          }
          else
          {
            unint64_t v206 = 0;
            uint64_t v173 = v1121;
            int v207 = (int *)__p;
            uint64_t v208 = __b;
            int v209 = v1207;
            uint64_t v176 = v1155;
            do
            {
              int v210 = v207[v206 / 4];
              int v211 = *(_DWORD *)&v208[v206];
              BOOL v38 = __OFADD__(v211, v210);
              int v212 = v211 + v210;
              if (v212 < 0 != v38) {
                ++v212;
              }
              v209[v206 / 4] = v212 >> 1;
              v206 += 4;
            }
            while (v1066 != v206);
            if (v1155 == 2)
            {
              sub_24FF5756C((unint64_t)v1070, v200, v202, (_DWORD *)(v1152[23] + 12 * v1059), (_DWORD *)(v1152[23] + 12 * (int)v187), (int *)(v1152[23] + 12 * v1103), v207);
              sub_24FF5756C((unint64_t)v203, v204, v205, (_DWORD *)(v1152[23] + 12 * (int)v1112), (_DWORD *)(v1152[23] + 12 * v1164), (int *)(v1152[23] + 12 * v1103), (int *)__b);
              int v207 = (int *)__p;
              uint64_t v208 = __b;
              int v213 = v1205;
              int v214 = *(_DWORD *)__b + *(_DWORD *)__p;
              if (v214 < 0 != __OFADD__(*(_DWORD *)__b, *(_DWORD *)__p)) {
                ++v214;
              }
              *(_DWORD *)v1205 = v214 >> 1;
              int v215 = v207[1];
              int v216 = *((_DWORD *)v208 + 1);
              BOOL v38 = __OFADD__(v216, v215);
              int v217 = v216 + v215;
              if (v217 < 0 != v38) {
                ++v217;
              }
              v213[1] = v217 >> 1;
              int v209 = v1207;
              uint64_t v176 = v1155;
              uint64_t v173 = v1121;
              signed int v218 = v1070;
            }
            else
            {
              unint64_t v281 = 0;
              int v213 = v1205;
              signed int v218 = v1070;
              do
              {
                int v282 = v1070[v281 / 4];
                int v283 = v203[v281 / 4];
                BOOL v38 = __OFADD__(v283, v282);
                int v284 = v283 + v282;
                if (v284 < 0 != v38) {
                  ++v284;
                }
                unint64_t v285 = 1431655766
                     * ((v284 >> 1) - (v202[v281 / 4] + v205[v281 / 4]) + 2 * (v204[v281 / 4] + v200[v281 / 4]));
                v213[v281 / 4] = HIDWORD(v285) + (v285 >> 63);
                v281 += 4;
              }
              while (v1066 != v281);
            }
            uint64_t v286 = 0;
            uint64_t v271 = (int *)v1203;
            int v272 = (int *)v1201;
            int v273 = (int *)v1199;
            uint64_t v274 = (int *)v1197;
            do
            {
              v207[v286] = v200[v286] + v218[v286] - v202[v286];
              *(_DWORD *)&v208[4 * v286] = v204[v286] + v203[v286] - v205[v286];
              v271[v286] = v1177[v286] - v207[v286];
              v272[v286] = v1177[v286] - *(_DWORD *)&v208[4 * v286];
              v273[v286] = v1177[v286] - v209[v286];
              v274[v286] = v1177[v286] - v213[v286];
              ++v286;
            }
            while (v176 != v286);
            uint64_t v2 = v1160;
            if (!*(unsigned char *)(v1160 + 24))
            {
              int v304 = *v271;
              if (*v271 < 0) {
                int v304 = -v304;
              }
              LODWORD(v174) = v1075;
              signed int v298 = -(v1075 * __clz(v304 + 1));
              int v305 = *v272;
              if (*v272 < 0) {
                int v305 = -v305;
              }
              signed int v293 = -(v176 * __clz(v305 + 1));
              int v306 = *v273;
              if (*v273 < 0) {
                int v306 = -v306;
              }
              signed int v270 = -(v1075 * __clz(v306 + 1));
              int v307 = *v274;
              if (*v274 < 0) {
                int v307 = -v307;
              }
              signed int v299 = -(v176 * __clz(v307 + 1));
LABEL_294:
              int v183 = v1094;
              if (v298 > v293 || v298 > v270 || v298 > v299)
              {
                if (v293 > v270 || v293 > v299)
                {
                  int v177 = v1079;
                  if (v270 <= v299)
                  {
                    int v309 = 0;
                    int v308 = 1;
                    int v183 = (int *)v1207;
                    uint64_t v310 = 1;
                  }
                  else
                  {
                    int v308 = 1;
                    int v183 = (int *)v1205;
                    int v309 = 1;
                    uint64_t v310 = 2;
                  }
                  goto LABEL_302;
                }
                int v308 = 0;
                int v309 = 1;
                int v183 = (int *)__b;
                uint64_t v310 = 2;
              }
              else
              {
                int v308 = 0;
                int v309 = 0;
                uint64_t v310 = 1;
              }
              int v177 = v1079;
LABEL_302:
              uint64_t v178 = v1140;
              uint64_t v311 = (uint64_t)(v1152 + 445);
              sub_24FF6DACC(v1147, v309, &v1211);
              uint64_t v312 = &v1211;
LABEL_320:
              sub_24FF6DACC(v311, v308, (_WORD *)v312 + v310);
              unsigned int v229 = 2;
              uint64_t v181 = (uint64_t)v1177;
              goto LABEL_321;
            }
          }
          int v287 = *(unsigned __int8 *)(v2 + 8);
          uint64_t v288 = (unsigned __int16)v1211;
          int v289 = *(_DWORD *)((char *)&unk_24FF7D720 + ((((unsigned __int16)v1211 + 2048) >> 10) & 0x7CLL));
          uint64_t v1105 = HIWORD(v1211);
          int v290 = *(_DWORD *)((char *)&unk_24FF7D720 + (((HIWORD(v1211) + 2048) >> 10) & 0x7CLL));
          LODWORD(v174) = v1075;
          signed int v1114 = v290 + v289 + sub_24FF7C6B0(v271, v1075, v287, (unsigned __int16 **)&v1247);
          int v291 = *(_DWORD *)((char *)&unk_24FF7D720 + (((unint64_t)(67584 - v288) >> 10) & 0x3FFFFFFFFFFFFCLL));
          uint64_t v292 = v1212;
          LODWORD(v288) = *(_DWORD *)((char *)&unk_24FF7D720 + (((v1212 + 2048) >> 10) & 0x7CLL));
          signed int v293 = v288 + sub_24FF7C6B0(v272, v1155, v287, (unsigned __int16 **)&v1247) + v291;
          LODWORD(v1105) = *(_DWORD *)((char *)&unk_24FF7D720
                                     + (((unint64_t)(67584 - v1105) >> 10) & 0x3FFFFFFFFFFFFCLL));
          int v294 = sub_24FF7C6B0(v273, v1075, v287, (unsigned __int16 **)&v1247);
          unint64_t v295 = 67584 - v292;
          uint64_t v2 = v1160;
          int v296 = *(_DWORD *)((char *)&unk_24FF7D720 + ((v295 >> 10) & 0x3FFFFFFFFFFFFCLL));
          int v297 = sub_24FF7C6B0(v274, v1155, v287, (unsigned __int16 **)&v1247);
          signed int v298 = v1114;
          signed int v270 = v1105 + v289 + v294;
          uint64_t v176 = v1155;
          signed int v299 = v296 + v291 + v297;
          uint64_t v173 = v1121;
          goto LABEL_294;
        }
      }
      if (v191 == -1
        || v177
        && ((uint64_t v219 = v1152[404], !*(unsigned char *)(v219 + (int)v1189))
         || !*(unsigned char *)(v219 + SHIDWORD(v1189))
         || !*(unsigned char *)(v219 + v191)))
      {
        if (HIDWORD(v1189) == -1
          || v177 && ((uint64_t v226 = v1152[404], !*(unsigned char *)(v226 + (int)v1189)) || !*(unsigned char *)(v226 + SHIDWORD(v1189))))
        {
          uint64_t v2 = v1160;
          uint64_t v178 = v1140;
          uint64_t v181 = v1130 + 4 * (int)v180 * (int)v174;
          uint64_t v179 = (uint64_t)v1152;
LABEL_230:
          int v228 = sub_24FF75C20(v179, v180, v183, v1230, *(_DWORD *)(v2 + 16));
          unsigned int v229 = 0;
          if ((int)v176 >= 1 && !v228)
          {
            v1096 = v183;
            uint64_t v230 = v181;
            uint64_t v231 = 0;
            do
            {
              unsigned int v232 = 0;
              unint64_t v233 = v1195;
              uint64_t v234 = (char *)v1195 + 20 * v231;
              int v235 = *(unsigned __int8 *)(v2 + 24);
              int v1178 = *(unsigned __int8 *)(v2 + 8);
              int v236 = 0x7FFFFFFF;
              char v237 = -1;
              v1165 = __p;
              unsigned int v238 = -1;
              do
              {
                int v239 = v233[5 * v231 + 1 + ((v237 + *v234) & 3)];
                int v240 = *(_DWORD *)(v230 + 4 * v231) - v239;
                if (v235)
                {
                  signed int v241 = sub_24FF75EE0(v240, v231, v232, v1215, v1178, v1232);
                }
                else
                {
                  if (v240 >= 0) {
                    int v242 = *(_DWORD *)(v230 + 4 * v231) - v239;
                  }
                  else {
                    int v242 = v239 - *(_DWORD *)(v230 + 4 * v231);
                  }
                  signed int v241 = -__clz(v242 + 1);
                }
                if (v241 < v236)
                {
                  v1165[v231] = v239;
                  int v236 = v241;
                  unsigned int v238 = v232;
                }
                ++v232;
                --v237;
              }
              while (v232 != 4);
              sub_24FF6DACC(v1147, v238 & 1, v1215);
              sub_24FF6DACC(v1147, (v238 >> 1) & 1, &v1215[(v238 & 1) + 1]);
              ++v231;
              uint64_t v176 = v1155;
              uint64_t v2 = v1160;
            }
            while (v231 != v1155);
            unsigned int v229 = 0;
            LODWORD(v174) = v1075;
            int v177 = v1079;
            uint64_t v178 = v1140;
            uint64_t v181 = v230;
            uint64_t v173 = v1121;
            int v183 = v1096;
          }
        }
        else
        {
          int v227 = v187;
          uint64_t v2 = v1160;
          uint64_t v178 = v1140;
          uint64_t v181 = v1130 + 4 * (int)v180 * (int)v174;
          if (v176 == 2)
          {
            int v1226 = 0;
            sub_24FF57110((int *)(v1130 + 8 * v1189), (int *)(v1130 + 8 * HIDWORD(v1189)), v1177, (_DWORD *)(v1152[23] + 12 * v197), (_DWORD *)(v1152[23] + 12 * v227), (int *)(v1152[23] + 12 * v1103), v183, &v1226);
            sub_24FF6DACC(v1147, v1226 != 0, &v1225);
          }
          else if ((int)v176 >= 1)
          {
            unint64_t v275 = 0;
            uint64_t v276 = v1130 + 4 * (int)v1189 * (int)v174;
            uint64_t v277 = v1130 + 4 * HIDWORD(v1189) * (int)v176;
            do
            {
              int v278 = *(_DWORD *)(v276 + v275);
              int v279 = *(_DWORD *)(v277 + v275);
              BOOL v38 = __OFADD__(v279, v278);
              int v280 = v279 + v278;
              if (v280 < 0 != v38) {
                ++v280;
              }
              v183[v275 / 4] = v280 >> 1;
              v275 += 4;
            }
            while (v1066 != v275);
          }
          unsigned int v229 = 1;
        }
LABEL_321:
        if ((int)v174 >= 1)
        {
          int v314 = (char *)v1195 + 4;
          int v315 = (int *)v181;
          uint64_t v316 = v176;
          do
          {
            int v318 = *v315++;
            int v317 = v318;
            int v319 = *((_DWORD *)v314 - 1);
            if (*(_DWORD *)&v314[4 * (((_BYTE)v319 - 1) & 3)] != v318)
            {
              *((_DWORD *)v314 - 1) = v319 + 1;
              *(_DWORD *)&v314[4 * (v319 & 3)] = v317;
            }
            v314 += 20;
            --v316;
          }
          while (v316);
        }
        sub_24FF6DC40((uint64_t)v1152, v181, (uint64_t)v183, v174, v1083, *(unsigned char *)(v2 + 8), &v1232[15 * v229]);
        goto LABEL_327;
      }
      uint64_t v220 = (int *)(v1130 + 4 * (int)v1189 * (int)v176);
      v221 = (int *)(v1130 + 4 * HIDWORD(v1189) * (int)v174);
      uint64_t v222 = (int *)(v1130 + 4 * v191 * (int)v176);
      int v223 = v197;
      sub_24FF56E70(v220, v221, v222, v176, (int *)(v1152[23] + 12 * v197), (int *)(v1152[23] + 12 * (int)v187), (int *)(v1152[23] + 12 * v189), (int *)(v1152[23] + 12 * v1103), __b);
      uint64_t v2 = v1160;
      v1095 = v183;
      if (v174 == 2)
      {
        sub_24FF5756C((unint64_t)v220, v221, v222, (_DWORD *)(v1152[23] + 12 * v223), (_DWORD *)(v1152[23] + 12 * (int)v187), (int *)(v1152[23] + 12 * v1103), (int *)v1205);
        uint64_t v224 = v1205;
        uint64_t v225 = v1130 + 8 * v180;
        uint64_t v173 = v1121;
      }
      else
      {
        if ((int)v176 < 1)
        {
          signed int v268 = *(unsigned __int8 *)(v1160 + 24);
          uint64_t v173 = v1121;
          if (!*(unsigned char *)(v1160 + 24))
          {
            signed int v266 = 0;
            signed int v263 = 0;
            signed int v269 = 0;
            goto LABEL_308;
          }
          int v251 = (int *)v1203;
          int v252 = (int *)v1201;
          unint64_t v174 = (unint64_t)v1199;
          int v253 = (int *)v1197;
          goto LABEL_255;
        }
        unint64_t v243 = 0;
        uint64_t v224 = v1205;
        uint64_t v225 = v1130 + 4 * (int)v180 * (int)v174;
        uint64_t v173 = v1121;
        do
        {
          int v244 = v220[v243 / 4];
          int v245 = v221[v243 / 4];
          BOOL v38 = __OFADD__(v245, v244);
          int v246 = v245 + v244;
          if (v246 < 0 != v38) {
            ++v246;
          }
          v224[v243 / 4] = v246 >> 1;
          v243 += 4;
        }
        while (v1066 != v243);
      }
      uint64_t v247 = 0;
      int v248 = __p;
      int v249 = __b;
      int v250 = v1207;
      int v251 = (int *)v1203;
      int v252 = (int *)v1201;
      unint64_t v174 = (unint64_t)v1199;
      int v253 = (int *)v1197;
      do
      {
        int v254 = v221[v247] + v220[v247] - v222[v247];
        v248[v247] = v254;
        int v255 = *(_DWORD *)&v249[4 * v247];
        BOOL v38 = __OFADD__(v255, v254);
        int v256 = v255 + v254;
        if (v256 < 0 != v38) {
          ++v256;
        }
        v250[v247] = v256 >> 1;
        v251[v247] = *(_DWORD *)(v225 + 4 * v247) - v248[v247];
        v252[v247] = *(_DWORD *)(v225 + 4 * v247) - *(_DWORD *)&v249[4 * v247];
        *(_DWORD *)(v174 + 4 * v247) = *(_DWORD *)(v225 + 4 * v247) - v250[v247];
        v253[v247] = *(_DWORD *)(v225 + 4 * v247) - v224[v247];
        ++v247;
      }
      while (v176 != v247);
      if (!*(unsigned char *)(v1160 + 24))
      {
        if (v1075 < 1)
        {
          signed int v266 = 0;
          signed int v263 = 0;
          signed int v268 = 0;
          signed int v269 = 0;
        }
        else
        {
          int v300 = *v251;
          if (*v251 < 0) {
            int v300 = -v300;
          }
          signed int v266 = -(v1075 * __clz(v300 + 1));
          int v301 = *v252;
          if (*v252 < 0) {
            int v301 = -v301;
          }
          signed int v263 = -(v176 * __clz(v301 + 1));
          int v302 = *(_DWORD *)v174;
          if (*(int *)v174 < 0) {
            int v302 = -v302;
          }
          signed int v268 = -(v1075 * __clz(v302 + 1));
          int v303 = *v253;
          if (*v253 < 0) {
            int v303 = -v303;
          }
          signed int v269 = -(v176 * __clz(v303 + 1));
        }
        LODWORD(v174) = v1075;
LABEL_308:
        int v177 = v1079;
        uint64_t v178 = v1140;
        if (v266 > v263 || v266 > v268 || v266 > v269)
        {
          if (v263 > v268 || v263 > v269)
          {
            if (v268 <= v269)
            {
              int v313 = 0;
              int v308 = 1;
              int v183 = (int *)v1207;
              uint64_t v310 = 1;
              goto LABEL_319;
            }
            int v308 = 1;
            int v183 = (int *)v1205;
            int v313 = 1;
          }
          else
          {
            int v308 = 0;
            int v313 = 1;
            int v183 = (int *)__b;
          }
          uint64_t v310 = 2;
        }
        else
        {
          int v308 = 0;
          int v313 = 0;
          uint64_t v310 = 1;
          int v183 = v1095;
        }
LABEL_319:
        uint64_t v311 = (uint64_t)(v1152 + 445);
        sub_24FF6DACC(v1147, v313, &v1213);
        uint64_t v312 = &v1213;
        goto LABEL_320;
      }
LABEL_255:
      int v257 = *(unsigned __int8 *)(v1160 + 8);
      uint64_t v258 = (unsigned __int16)v1213;
      int v259 = *(_DWORD *)((char *)&unk_24FF7D720 + ((((unsigned __int16)v1213 + 2048) >> 10) & 0x7CLL));
      uint64_t v1104 = HIWORD(v1213);
      int v260 = *(_DWORD *)((char *)&unk_24FF7D720 + (((HIWORD(v1213) + 2048) >> 10) & 0x7CLL));
      signed int v1113 = v260 + v259 + sub_24FF7C6B0(v251, v1075, v257, (unsigned __int16 **)&v1247);
      int v261 = *(_DWORD *)((char *)&unk_24FF7D720 + (((unint64_t)(67584 - v258) >> 10) & 0x3FFFFFFFFFFFFCLL));
      int v1088 = v261;
      uint64_t v262 = v1214;
      LODWORD(v258) = *(_DWORD *)((char *)&unk_24FF7D720 + (((v1214 + 2048) >> 10) & 0x7CLL));
      signed int v263 = v258 + sub_24FF7C6B0(v252, v1155, v257, (unsigned __int16 **)&v1247) + v261;
      LODWORD(v1104) = *(_DWORD *)((char *)&unk_24FF7D720
                                 + (((unint64_t)(67584 - v1104) >> 10) & 0x3FFFFFFFFFFFFCLL));
      LODWORD(v258) = sub_24FF7C6B0((int *)v174, v1075, v257, (unsigned __int16 **)&v1247);
      uint64_t v176 = v1155;
      int v264 = *(_DWORD *)((char *)&unk_24FF7D720 + (((unint64_t)(67584 - v262) >> 10) & 0x3FFFFFFFFFFFFCLL));
      int v265 = sub_24FF7C6B0(v253, v1155, v257, (unsigned __int16 **)&v1247);
      signed int v266 = v1113;
      int v267 = v264 + v1088;
      LODWORD(v174) = v1075;
      uint64_t v2 = v1160;
      signed int v268 = v1104 + v259 + v258;
      signed int v269 = v267 + v265;
      uint64_t v173 = v1121;
      goto LABEL_308;
    case 5:
      uint64_t v455 = *(unsigned int *)(v3 + 3548);
      int v456 = *(_DWORD *)(v3 + 3544);
      uint64_t v1150 = *(void *)(v3 + 3208);
      int v457 = ~(-1 << (*(_DWORD *)(v2 + 4) - 1));
      int v1169 = *(_DWORD *)(v2 + 16);
      uint64_t v1230 = 0;
      __p = 0;
      uint64_t v1231 = 0;
      sub_24FF65ECC((void *)(v3 + 184), (void *)(v3 + 232), (void *)(v3 + 208), (uint64_t *)(v3 + 3256), v455, (uint64_t *)&__p, v457);
      *(void *)&long long v1239 = 0;
      long long v1237 = 0u;
      *(_OWORD *)v1238 = 0u;
      *(_OWORD *)v1235 = 0u;
      *(_OWORD *)v1236 = 0u;
      *(_OWORD *)v1233 = 0u;
      long long v1234 = 0u;
      *(_OWORD *)v1232 = 0u;
      sub_24FF60D8C((uint64_t)v1232, v456);
      LOWORD(v1187) = 0x8000;
      v1215[0] = 0x8000;
      if ((int)v455 < 1) {
        goto LABEL_633;
      }
      uint64_t v458 = 0;
      uint64_t v1124 = (uint64_t)(v1152 + 445);
      uint64_t v1158 = 4 * v455;
      int v1143 = v456;
      int v1181 = v457;
      while (1)
      {
        uint64_t v459 = *(int *)(v1152[413] + v458);
        if (v1169 && !*(unsigned char *)(v1152[404] + v459)) {
          goto LABEL_632;
        }
        int v460 = (_DWORD *)(v1150 + 4 * (int)v459 * v456);
        int v461 = *v460 - v457;
        int v462 = v460[1] - v457;
        if (v461 >= 0) {
          int v463 = v461;
        }
        else {
          int v463 = -v461;
        }
        if (v462 >= 0) {
          int v464 = v462;
        }
        else {
          int v464 = -v462;
        }
        int v465 = v457 - v463;
        int v466 = v464 - v457;
        if (v461 >= 0) {
          int v466 = v457 - v464;
        }
        int v467 = v463 - v457;
        if (v462 >= 0) {
          int v467 = v465;
        }
        int v468 = v465 - v464;
        LODWORD(v1210[0]) = v465 - v464;
        if (v465 - v464 < 0) {
          int v469 = v466;
        }
        else {
          int v469 = v461;
        }
        if (v465 - v464 < 0) {
          int v470 = v467;
        }
        else {
          int v470 = v462;
        }
        long long __b = (char *)__PAIR64__(v470, v469);
        int v471 = (int *)((char *)__p + 12 * (int)v459);
        int v472 = *v471;
        int v473 = *v471;
        LODWORD(v1207) = *v471;
        int v474 = v471[1];
        HIDWORD(v1207) = v474;
        int v475 = v471[2];
        LODWORD(v1208) = v475;
        if (!sub_24FF75D8C((uint64_t)v1152, v459, (uint64_t)&v1205, *(_DWORD *)(v2 + 4), *(_DWORD *)(v2 + 16)))
        {
          unint64_t v490 = v473 * (uint64_t)v469 + v474 * (uint64_t)v470 + v475 * (uint64_t)v468;
          if ((v490 & 0x8000000000000000) != 0)
          {
            int v472 = -v472;
            int v474 = -v474;
            int v475 = -v475;
            v1207 = (void *)__PAIR64__(v474, v472);
            LODWORD(v1208) = v475;
          }
          uint64_t v2 = v1160;
          int v456 = v1143;
          sub_24FF6DACC(v1124, v490 >> 63, v1215);
          if (v472 >= 0) {
            unsigned int v491 = v472;
          }
          else {
            unsigned int v491 = -v472;
          }
          if (v474 >= 0) {
            unsigned int v492 = v474;
          }
          else {
            unsigned int v492 = -v474;
          }
          if (v475 >= 0) {
            unsigned int v493 = v475;
          }
          else {
            unsigned int v493 = -v475;
          }
          if (v491 >= v492 && v491 >= v493)
          {
            unint64_t v495 = &v1207;
            p_b = (int *)&__b;
            int v470 = v469;
            int v474 = v472;
            int v457 = v1181;
          }
          else
          {
            unint64_t v495 = (void **)((char *)&v1207 + 4);
            p_b = (int *)&__b + 1;
            int v457 = v1181;
            if (v492 < v493)
            {
              if ((v475 & 0x80000000) == 0)
              {
LABEL_551:
                int v497 = (int)__b;
                int v498 = HIDWORD(__b);
                if (v468 < 0)
                {
                  if (SHIDWORD(__b) >= 0) {
                    int v519 = HIDWORD(__b);
                  }
                  else {
                    int v519 = -HIDWORD(__b);
                  }
                  int v520 = v519 - v457;
                  int v499 = v457 - v519;
                  if ((int)__b < 0)
                  {
                    int v499 = v520;
                    int v497 = -(int)__b;
                  }
                  if ((HIDWORD(__b) & 0x80000000) != 0) {
                    int v498 = v497 - v457;
                  }
                  else {
                    int v498 = v457 - v497;
                  }
                }
                else
                {
                  int v499 = (int)__b;
                }
                long long __b = (char *)__PAIR64__(v498, v499);
                goto LABEL_631;
              }
LABEL_556:
              LODWORD(v1208) = -v475;
              int v468 = -v468;
              LODWORD(v1210[0]) = v468;
              goto LABEL_551;
            }
          }
          int *p_b = v468;
          LODWORD(v1210[0]) = v470;
          *(_DWORD *)unint64_t v495 = v475;
          int v468 = v470;
          int v475 = v474;
          LODWORD(v1208) = v474;
          if ((v474 & 0x80000000) == 0) {
            goto LABEL_551;
          }
          goto LABEL_556;
        }
        int v476 = (int)v1205;
        int v477 = HIDWORD(v1205);
        int v478 = (int)v1206;
        uint64_t v479 = (int)v1205 * (uint64_t)v473 + SHIDWORD(v1205) * (uint64_t)v474 + (int)v1206 * (uint64_t)v475;
        if (v479 >= 0) {
          int v480 = v472;
        }
        else {
          int v480 = -v472;
        }
        if (v479 >= 0) {
          int v481 = v474;
        }
        else {
          int v481 = -v474;
        }
        if (v479 >= 0) {
          int v482 = v475;
        }
        else {
          int v482 = -v475;
        }
        LODWORD(v1199) = v480;
        LODWORD(v1197) = v481;
        LODWORD(v1195) = v469;
        LODWORD(v1193) = v470;
        LODWORD(v1191) = v469;
        LODWORD(v1189) = v470;
        if (v472 >= 0) {
          unsigned int v483 = v472;
        }
        else {
          unsigned int v483 = -v472;
        }
        if (v474 >= 0) {
          unsigned int v484 = v474;
        }
        else {
          unsigned int v484 = -v474;
        }
        if (v475 >= 0) {
          unsigned int v485 = v475;
        }
        else {
          unsigned int v485 = -v475;
        }
        if (v483 >= v484 && v483 >= v485)
        {
          unsigned int v500 = &v1199;
          unsigned int v501 = &v1195;
          int v489 = v469;
          int v457 = v1181;
        }
        else
        {
          int v457 = v1181;
          if (v484 < v485)
          {
            int v487 = v470;
            int v488 = v469;
            int v489 = v468;
            goto LABEL_559;
          }
          unsigned int v500 = &v1197;
          unsigned int v501 = (void **)&v1193;
          int v489 = v470;
          int v480 = v481;
        }
        *(_DWORD *)unsigned int v501 = v468;
        *(_DWORD *)unsigned int v500 = v482;
        int v488 = (int)v1195;
        int v487 = v1193;
        int v482 = v480;
LABEL_559:
        if (v482 >= 0) {
          int v502 = v489;
        }
        else {
          int v502 = -v489;
        }
        if (v482 >= 0) {
          int v503 = v482;
        }
        else {
          int v503 = -v482;
        }
        if (v502 < 0)
        {
          if (v487 >= 0) {
            int v504 = v487;
          }
          else {
            int v504 = -v487;
          }
          int v505 = v504 - v457;
          int v506 = v457 - v504;
          if (v488 >= 0) {
            int v507 = v488;
          }
          else {
            int v507 = -v488;
          }
          if (v488 >= 0) {
            int v488 = v506;
          }
          else {
            int v488 = v505;
          }
          if (v487 >= 0) {
            int v487 = v457 - v507;
          }
          else {
            int v487 = v507 - v457;
          }
        }
        LODWORD(v1195) = v488;
        LODWORD(v1193) = v487;
        if (v476 >= 0) {
          unsigned int v508 = v476;
        }
        else {
          unsigned int v508 = -v476;
        }
        if (v477 >= 0) {
          unsigned int v509 = v477;
        }
        else {
          unsigned int v509 = -v477;
        }
        if (v478 >= 0) {
          unsigned int v510 = v478;
        }
        else {
          unsigned int v510 = -v478;
        }
        if (v508 < v509 || v508 < v510)
        {
          if (v509 < v510) {
            goto LABEL_593;
          }
          int v512 = (unint64_t *)&v1189;
          int v469 = v470;
          int v511 = (void **)((char *)&v1205 + 4);
          int v476 = v477;
        }
        else
        {
          int v511 = &v1205;
          int v512 = &v1191;
        }
        *(_DWORD *)int v512 = v468;
        *(_DWORD *)int v511 = v478;
        int v468 = v469;
        int v478 = v476;
        LODWORD(v1206) = v476;
LABEL_593:
        if (v478 < 0)
        {
          int v478 = -v478;
          LODWORD(v1206) = v478;
          int v468 = -v468;
        }
        int v513 = v1191;
        int v514 = v1189;
        if (v468 < 0)
        {
          if ((int)v1189 >= 0) {
            int v516 = v1189;
          }
          else {
            int v516 = -(int)v1189;
          }
          int v517 = v516 - v457;
          int v518 = v457 - v516;
          if ((v1191 & 0x80000000) == 0) {
            int v515 = v518;
          }
          else {
            int v515 = v517;
          }
          if ((v1191 & 0x80000000) != 0) {
            int v513 = -(int)v1191;
          }
          if ((v1189 & 0x80000000) != 0) {
            int v514 = v513 - v457;
          }
          else {
            int v514 = v457 - v513;
          }
        }
        else
        {
          int v515 = v1191;
        }
        unsigned int v521 = v1199;
        unsigned int v522 = v1197;
        LODWORD(v1203) = v488 - v1199;
        HIDWORD(v1203) = v487 - v1197;
        LODWORD(v1204) = v502 - v503;
        LODWORD(v1201) = v515 - v1205;
        HIDWORD(v1201) = v514 - HIDWORD(v1205);
        LODWORD(v1202) = v468 - v478;
        if (*(unsigned char *)(v1160 + 24))
        {
          int v523 = *(unsigned __int8 *)(v1160 + 8);
          uint64_t v524 = (unsigned __int16)v1187;
          int v1117 = v488;
          int v1090 = *(_DWORD *)((char *)&unk_24FF7D720 + ((((unsigned __int16)v1187 + 2048) >> 10) & 0x7CLL));
          unsigned int v1099 = v1197;
          int v456 = v1143;
          int v1108 = v487;
          int v525 = v503;
          uint64_t v526 = v458;
          int v527 = v468;
          int v528 = v515;
          int v1084 = sub_24FF7C6B0((int *)&v1203, v1143, v523, (unsigned __int16 **)v1232);
          LODWORD(v524) = *(_DWORD *)((char *)&unk_24FF7D720
                                    + (((unint64_t)(67584 - v524) >> 10) & 0x3FFFFFFFFFFFFCLL));
          int v529 = sub_24FF7C6B0((int *)&v1201, v1143, v523, (unsigned __int16 **)v1232);
          int v515 = v528;
          int v468 = v527;
          uint64_t v458 = v526;
          int v503 = v525;
          int v487 = v1108;
          signed int v530 = v1084 + v1090;
          int v488 = v1117;
          signed int v531 = v529 + v524;
          unsigned int v522 = v1099;
          int v457 = v1181;
        }
        else
        {
          int v456 = v1143;
          if (v1143 < 1) {
            goto LABEL_627;
          }
          if (v488 - (int)v1199 >= 0) {
            int v532 = v488 - v1199;
          }
          else {
            int v532 = v1199 - v488;
          }
          signed int v530 = -(v1143 * __clz(v532 + 1));
          if (v515 - (int)v1205 >= 0) {
            int v533 = v515 - v1205;
          }
          else {
            int v533 = v1205 - v515;
          }
          signed int v531 = -(v1143 * __clz(v533 + 1));
        }
        if (v530 <= v531)
        {
LABEL_627:
          int v534 = 0;
          v1207 = (void *)__PAIR64__(v522, v521);
          int v468 = v502;
          LODWORD(v1208) = v503;
          goto LABEL_628;
        }
        v1207 = v1205;
        LODWORD(v1208) = v1206;
        int v534 = 1;
        int v488 = v515;
        int v487 = v514;
LABEL_628:
        uint64_t v2 = v1160;
        long long __b = (char *)__PAIR64__(v487, v488);
        LODWORD(v1210[0]) = v468;
        sub_24FF6DACC(v1124, v534, &v1187);
LABEL_631:
        sub_24FF6DC40((uint64_t)v1152, (uint64_t)&__b, (uint64_t)&v1207, v456, v1152 + 392, *(unsigned char *)(v2 + 8), v1232);
LABEL_632:
        v458 += 4;
        if (v1158 == v458)
        {
LABEL_633:
          if (v1238[0])
          {
            v1238[1] = v1238[0];
            operator delete(v1238[0]);
          }
          if (v1236[1])
          {
            *(void **)&long long v1237 = v1236[1];
            operator delete(v1236[1]);
          }
          if (v1235[0])
          {
            v1235[1] = v1235[0];
            operator delete(v1235[0]);
          }
          if (v1233[1])
          {
            *(void **)&long long v1234 = v1233[1];
            operator delete(v1233[1]);
          }
          if (v1232[0])
          {
            v1232[1] = v1232[0];
            operator delete(v1232[0]);
          }
LABEL_1423:
          if (__p)
          {
            uint64_t v1230 = (uint64_t)__p;
            operator delete(__p);
          }
          return 0;
        }
      }
    case 6:
      uint64_t v535 = *(unsigned int *)(v3 + 3548);
      int v536 = *(_DWORD *)(v3 + 3544);
      uint64_t v537 = *(void *)(v3 + 3208);
      int v538 = ~(-1 << (*(_DWORD *)(v2 + 4) - 1));
      uint64_t v1230 = 0;
      __p = 0;
      uint64_t v1231 = 0;
      int v1159 = v538;
      sub_24FF65ECC((void *)(v3 + 184), (void *)(v3 + 232), (void *)(v3 + 208), (uint64_t *)(v3 + 3256), v535, (uint64_t *)&__p, v538);
      uint64_t v539 = 0;
      uint64_t v1254 = 0;
      v1091 = (void *)(v3 + 3136);
      long long v1252 = 0u;
      long long v1253 = 0u;
      long long v1250 = 0u;
      long long v1251 = 0u;
      long long v1248 = 0u;
      long long v1249 = 0u;
      long long v1246 = 0u;
      long long v1247 = 0u;
      long long v1244 = 0u;
      long long v1245 = 0u;
      long long v1242 = 0u;
      long long v1243 = 0u;
      long long v1240 = 0u;
      long long v1241 = 0u;
      *(_OWORD *)v1238 = 0u;
      long long v1239 = 0u;
      *(_OWORD *)v1236 = 0u;
      long long v1237 = 0u;
      long long v1234 = 0u;
      *(_OWORD *)v1235 = 0u;
      *(_OWORD *)v1232 = 0u;
      *(_OWORD *)v1233 = 0u;
      do
      {
        sub_24FF60D8C((uint64_t)&v1232[v539], v536);
        v539 += 15;
      }
      while (v539 != 45);
      memset_pattern16(&v1193, &unk_24FF7D710, 6uLL);
      memset_pattern16(&v1191, &unk_24FF7D710, 6uLL);
      unsigned __int16 v1228 = 0x8000;
      __int16 v1227 = 0x8000;
      if ((int)v535 <= 0) {
        goto LABEL_1411;
      }
      uint64_t v540 = 0;
      int v1151 = *(_DWORD *)(v2 + 16);
      uint64_t v1085 = v3 + 3560;
      uint64_t v1109 = 4 * v535;
      uint64_t v1118 = v537;
      int v1100 = v536;
      break;
    default:
      return 5;
  }
  while (1)
  {
    uint64_t v541 = *(int *)(*(void *)(v3 + 3304) + v540);
    if (v1151 && !*(unsigned char *)(*(void *)(v3 + 3232) + v541)) {
      goto LABEL_1410;
    }
    uint64_t v1144 = v540;
    int v542 = (_DWORD *)(v537 + 4 * (int)v541 * v536);
    uint64_t v543 = *(unsigned int *)(*(void *)(v3 + 3328) + 4 * v541);
    int v544 = *v542 - v1159;
    int v545 = v542[1] - v1159;
    if (v544 >= 0) {
      int v546 = v544;
    }
    else {
      int v546 = -v544;
    }
    if (v545 >= 0) {
      int v547 = v545;
    }
    else {
      int v547 = -v545;
    }
    int v548 = v1159 - v546;
    int v549 = v547 - v1159;
    if (v544 >= 0) {
      int v549 = v1159 - v547;
    }
    int v550 = v546 - v1159;
    if (v545 >= 0) {
      int v550 = v548;
    }
    int v551 = v548 - v547;
    int v1170 = v551;
    LODWORD(v1210[0]) = v551;
    if (v551 < 0) {
      int v552 = v549;
    }
    else {
      int v552 = v544;
    }
    if (v551 < 0) {
      int v545 = v550;
    }
    long long __b = (char *)__PAIR64__(v545, v552);
    int v1182 = v545;
    int v553 = (char *)__p + 12 * (int)v541;
    LODWORD(v1207) = *v553;
    int v554 = (int)v1207;
    int v555 = (void *)v3;
    int v556 = v553[1];
    HIDWORD(v1207) = v556;
    int v557 = v553[2];
    int v1133 = (int)v1207;
    LODWORD(v1208) = v557;
    if ((v543 & 0x80000000) == 0)
    {
      LODWORD(v1206) = -1;
      v1205 = (void *)-1;
      LODWORD(v1204) = -1;
      v1203 = (void *)-1;
      sub_24FF75874(v555, v543, v541, (unsigned int *)(v555[17] + 12 * v543), &v1205);
      sub_24FF75874(v555, v543, v541, (unsigned int *)(v555[20] + 12 * v543), &v1203);
      int v558 = (int)v1206;
      int v559 = (int)v1204;
      if ((v1206 & 0x80000000) == 0 || (v1204 & 0x80000000) != 0)
      {
        unsigned int v560 = v1203;
        unsigned int v561 = HIDWORD(v1203);
        int v562 = (int)v1206;
      }
      else
      {
        unsigned int v560 = v1205;
        unsigned int v561 = HIDWORD(v1205);
        v1205 = v1203;
        int v562 = (int)v1204;
        LODWORD(v1206) = v1204;
        v1203 = (void *)__PAIR64__(v561, v560);
        LODWORD(v1204) = v558;
        int v559 = v558;
      }
      int v536 = v1100;
      uint64_t v537 = v1118;
      if (v559 != -1)
      {
        if (!v1151
          || (uint64_t v563 = v1152[404], *(unsigned char *)(v563 + (int)v1205))
          && *(unsigned char *)(v563 + SHIDWORD(v1205))
          && *(unsigned char *)(v563 + v562)
          && *(unsigned char *)(v563 + (int)v560)
          && *(unsigned char *)(v563 + (int)v561)
          && *(unsigned char *)(v563 + v559))
        {
          v564 = (_DWORD *)(v1118 + 4 * (int)v1205 * v1100);
          int v565 = v564[1];
          int v566 = *v564 - v1159;
          int v567 = v565 - v1159;
          if (v566 >= 0) {
            int v568 = v566;
          }
          else {
            int v568 = -v566;
          }
          if (v567 >= 0) {
            int v569 = v565 - v1159;
          }
          else {
            int v569 = v1159 - v565;
          }
          int v570 = v1159 - v568;
          int v571 = v1159 - v568 - v569;
          if (v571 < 0)
          {
            int v572 = v569 - v1159;
            int v573 = v1159 - v569;
            if (v566 >= 0) {
              int v566 = v573;
            }
            else {
              int v566 = v572;
            }
            int v574 = v568 - v1159;
            if (v567 >= 0) {
              int v567 = v570;
            }
            else {
              int v567 = v574;
            }
          }
          int v575 = (_DWORD *)(v1118 + 4 * HIDWORD(v1205) * v1100);
          int v576 = *v575 - v1159;
          int v577 = v575[1] - v1159;
          if (v576 >= 0) {
            int v578 = *v575 - v1159;
          }
          else {
            int v578 = v1159 - *v575;
          }
          if (v577 >= 0) {
            int v579 = v577;
          }
          else {
            int v579 = -v577;
          }
          int v580 = v1159 - v578;
          int v581 = v1159 - v578 - v579;
          if (v581 < 0)
          {
            int v582 = v579 - v1159;
            int v583 = v1159 - v579;
            if (v576 >= 0) {
              int v576 = v583;
            }
            else {
              int v576 = v582;
            }
            int v584 = v578 - v1159;
            if (v577 >= 0) {
              int v577 = v580;
            }
            else {
              int v577 = v584;
            }
          }
          int v585 = (_DWORD *)(v1118 + 4 * v562 * v1100);
          int v586 = *v585 - v1159;
          int v587 = v585[1] - v1159;
          if (v586 >= 0) {
            int v588 = *v585 - v1159;
          }
          else {
            int v588 = v1159 - *v585;
          }
          if (v587 >= 0) {
            int v589 = v587;
          }
          else {
            int v589 = -v587;
          }
          int v590 = v1159 - v588;
          int v591 = v1159 - v588 - v589;
          if (v591 < 0)
          {
            int v592 = v589 - v1159;
            int v593 = v1159 - v589;
            if (v586 >= 0) {
              int v586 = v593;
            }
            else {
              int v586 = v592;
            }
            int v594 = v588 - v1159;
            if (v587 >= 0) {
              int v587 = v590;
            }
            else {
              int v587 = v594;
            }
          }
          int v1080 = v591;
          int v595 = (_DWORD *)(v1118 + 4 * (int)(v560 * v1100));
          int v596 = *v595 - v1159;
          int v597 = v595[1] - v1159;
          if (v596 >= 0) {
            int v598 = *v595 - v1159;
          }
          else {
            int v598 = v1159 - *v595;
          }
          if (v597 >= 0) {
            int v599 = v597;
          }
          else {
            int v599 = -v597;
          }
          int v600 = v1159 - v598;
          int v601 = v581;
          int v602 = v1159 - v598 - v599;
          if (v602 < 0)
          {
            int v603 = v599 - v1159;
            int v604 = v1159 - v599;
            if (v596 >= 0) {
              int v596 = v604;
            }
            else {
              int v596 = v603;
            }
            int v605 = v598 - v1159;
            if (v597 >= 0) {
              int v597 = v600;
            }
            else {
              int v597 = v605;
            }
          }
          int v606 = (_DWORD *)(v1118 + 4 * (int)(v561 * v1100));
          int v607 = *v606 - v1159;
          int v608 = v606[1] - v1159;
          if (v607 >= 0) {
            int v609 = *v606 - v1159;
          }
          else {
            int v609 = v1159 - *v606;
          }
          if (v608 >= 0) {
            int v610 = v608;
          }
          else {
            int v610 = -v608;
          }
          int v611 = v1159 - v609;
          int v612 = v1159 - v609 - v610;
          if (v612 < 0)
          {
            int v613 = v610 - v1159;
            int v614 = v1159 - v610;
            if (v607 >= 0) {
              int v607 = v614;
            }
            else {
              int v607 = v613;
            }
            int v615 = v609 - v1159;
            if (v608 >= 0) {
              int v608 = v611;
            }
            else {
              int v608 = v615;
            }
          }
          int v616 = (_DWORD *)(v1118 + 4 * v559 * v1100);
          int v617 = v616[1];
          int v618 = *v616 - v1159;
          int v619 = v617 - v1159;
          if (v618 >= 0) {
            int v620 = v618;
          }
          else {
            int v620 = -v618;
          }
          if (v619 >= 0) {
            int v621 = v619;
          }
          else {
            int v621 = -v619;
          }
          int v622 = v1159 - v620;
          int v623 = v1159 - v620 - v621;
          if (v623 < 0)
          {
            int v624 = v621 - v1159;
            int v625 = v1159 - v621;
            if (v618 >= 0) {
              int v618 = v625;
            }
            else {
              int v618 = v624;
            }
            int v626 = v620 - v1159;
            if (v619 >= 0) {
              int v619 = v622;
            }
            else {
              int v619 = v626;
            }
          }
          uint64_t v627 = v557 * (uint64_t)v571 + v1133 * (uint64_t)v566 + v556 * (uint64_t)v567;
          if (v627 >= 0) {
            int v628 = v554;
          }
          else {
            int v628 = -v554;
          }
          if (v627 >= 0) {
            int v629 = v556;
          }
          else {
            int v629 = -v556;
          }
          if (v627 >= 0) {
            int v630 = v557;
          }
          else {
            int v630 = -v557;
          }
          LODWORD(v1189) = v628;
          LODWORD(v1187) = v629;
          int v631 = v576 + v566 - v586;
          int v632 = v577 + v567 - v587;
          *(_DWORD *)v1215 = v631;
          int v1213 = v632;
          int v633 = v607 + v596 - v618;
          int v634 = v608 + v597 - v619;
          int v1211 = v633;
          int v1226 = v634;
          BOOL v38 = __OFADD__(v596, v566);
          int v635 = v596 + v566;
          int v636 = v597 + v567;
          int v637 = v602 + v571;
          if (v635 < 0 != v38) {
            ++v635;
          }
          unint64_t v638 = 1431655766 * ((v635 >> 1) + 2 * (v607 + v576) - (v586 + v618));
          int v639 = HIDWORD(v638) + (v638 >> 63);
          int v640 = v636 / 2 + 2 * (v608 + v577) - (v587 + v619);
          int v1225 = v639;
          int v1224 = v640 / 3;
          if (v637 >= 0) {
            int v641 = v602 + v571;
          }
          else {
            int v641 = v637 + 1;
          }
          int v1223 = v552;
          int v1222 = v1182;
          int v1221 = v552;
          int v1220 = v1182;
          int v1219 = v552;
          int v1218 = v1182;
          int v1217 = v552;
          int v1216 = v1182;
          if (v554 >= 0) {
            unsigned int v642 = v554;
          }
          else {
            unsigned int v642 = -v554;
          }
          if (v556 >= 0) {
            unsigned int v643 = v556;
          }
          else {
            unsigned int v643 = -v556;
          }
          if (v557 >= 0) {
            unsigned int v644 = v557;
          }
          else {
            unsigned int v644 = -v557;
          }
          if (v642 >= v643 && v642 >= v644)
          {
            int v645 = &v1189;
            int v646 = &v1223;
            int v647 = v552;
            uint64_t v648 = v1160;
            int v649 = v1159;
            int v650 = v1170;
            goto LABEL_1043;
          }
          uint64_t v648 = v1160;
          int v649 = v1159;
          int v650 = v1170;
          if (v643 >= v644)
          {
            int v645 = (uint64_t *)&v1187;
            int v646 = &v1222;
            int v647 = v1182;
            int v628 = v629;
LABEL_1043:
            *int v646 = v650;
            *(_DWORD *)int v645 = v630;
            int v795 = v1223;
            int v794 = v1222;
            int v630 = v628;
          }
          else
          {
            int v794 = v1182;
            int v795 = v552;
            int v647 = v1170;
          }
          if (v630 >= 0) {
            int v818 = v647;
          }
          else {
            int v818 = -v647;
          }
          if (v630 >= 0) {
            int v819 = v630;
          }
          else {
            int v819 = -v630;
          }
          if (v818 < 0)
          {
            if (v794 >= 0) {
              int v822 = v794;
            }
            else {
              int v822 = -v794;
            }
            int v823 = v822 - v649;
            int v824 = v649 - v822;
            if (v795 >= 0) {
              int v820 = v824;
            }
            else {
              int v820 = v823;
            }
            if (v795 >= 0) {
              int v825 = v795;
            }
            else {
              int v825 = -v795;
            }
            int v821 = v601;
            if (v794 < 0) {
              int v794 = v825 - v649;
            }
            else {
              int v794 = v649 - v825;
            }
          }
          else
          {
            int v820 = v795;
            int v821 = v601;
          }
          int v841 = v821 + v571 - v1080;
          int v1223 = v820;
          int v1222 = v794;
          if (v631 >= 0) {
            unsigned int v842 = v631;
          }
          else {
            unsigned int v842 = -v631;
          }
          if (v632 >= 0) {
            unsigned int v843 = v632;
          }
          else {
            unsigned int v843 = -v632;
          }
          if (v841 >= 0) {
            unsigned int v844 = v841;
          }
          else {
            unsigned int v844 = -v841;
          }
          if (v842 >= v843 && v842 >= v844)
          {
            v845 = (int *)v1215;
            v846 = &v1221;
            unsigned int v844 = v842;
            int v847 = v552;
            goto LABEL_1124;
          }
          if (v843 >= v844)
          {
            v845 = &v1213;
            v846 = &v1220;
            unsigned int v844 = v843;
            int v847 = v1182;
            int v631 = v632;
LABEL_1124:
            int *v846 = v650;
            int *v845 = v841;
            int v849 = v1221;
            int v848 = v1220;
            int v841 = v631;
          }
          else
          {
            int v848 = v1182;
            int v849 = v552;
            int v847 = v650;
          }
          if (v841 >= 0) {
            int v850 = v847;
          }
          else {
            int v850 = -v847;
          }
          if (v850 < 0)
          {
            if (v848 >= 0) {
              int v852 = v848;
            }
            else {
              int v852 = -v848;
            }
            int v853 = v852 - v649;
            int v854 = v649 - v852;
            if (v849 >= 0) {
              int v851 = v854;
            }
            else {
              int v851 = v853;
            }
            if (v849 >= 0) {
              int v855 = v849;
            }
            else {
              int v855 = -v849;
            }
            if (v848 < 0) {
              int v848 = v855 - v649;
            }
            else {
              int v848 = v649 - v855;
            }
          }
          else
          {
            int v851 = v849;
          }
          int v856 = v612 + v602 - v623;
          int v1221 = v851;
          int v1220 = v848;
          if (v633 >= 0) {
            unsigned int v857 = v633;
          }
          else {
            unsigned int v857 = -v633;
          }
          if (v634 >= 0) {
            unsigned int v858 = v634;
          }
          else {
            unsigned int v858 = -v634;
          }
          if (v856 >= 0) {
            unsigned int v859 = v856;
          }
          else {
            unsigned int v859 = -v856;
          }
          if (v857 >= v858 && v857 >= v859)
          {
            v860 = &v1211;
            v861 = &v1219;
            unsigned int v859 = v857;
            int v862 = v552;
            goto LABEL_1157;
          }
          if (v858 >= v859)
          {
            v860 = &v1226;
            v861 = &v1218;
            unsigned int v859 = v858;
            int v862 = v1182;
            int v633 = v634;
LABEL_1157:
            int *v861 = v650;
            int *v860 = v856;
            int v864 = v1219;
            int v863 = v1218;
            int v856 = v633;
          }
          else
          {
            int v863 = v1182;
            int v864 = v552;
            int v862 = v650;
          }
          if (v856 >= 0) {
            int v865 = v862;
          }
          else {
            int v865 = -v862;
          }
          if (v865 < 0)
          {
            if (v863 >= 0) {
              int v867 = v863;
            }
            else {
              int v867 = -v863;
            }
            int v868 = v867 - v649;
            int v869 = v649 - v867;
            if (v864 >= 0) {
              int v866 = v869;
            }
            else {
              int v866 = v868;
            }
            if (v864 >= 0) {
              int v870 = v864;
            }
            else {
              int v870 = -v864;
            }
            if (v863 < 0) {
              int v863 = v870 - v649;
            }
            else {
              int v863 = v649 - v870;
            }
          }
          else
          {
            int v866 = v864;
          }
          unint64_t v871 = 1431655766 * ((v641 >> 1) + 2 * (v612 + v821) - (v1080 + v623));
          int v872 = HIDWORD(v871) + (v871 >> 63);
          int v1219 = v866;
          int v1218 = v863;
          if (v639 >= 0) {
            unsigned int v873 = v639;
          }
          else {
            unsigned int v873 = -v639;
          }
          if (v640 / 3 >= 0) {
            unsigned int v874 = v640 / 3;
          }
          else {
            unsigned int v874 = v640 / -3;
          }
          if (v872 >= 0) {
            unsigned int v875 = v872;
          }
          else {
            unsigned int v875 = -v872;
          }
          if (v873 >= v874 && v873 >= v875)
          {
            int v876 = &v1225;
            int v877 = &v1217;
            unsigned int v875 = v873;
            goto LABEL_1190;
          }
          if (v874 >= v875)
          {
            int v876 = &v1224;
            int v877 = &v1216;
            unsigned int v875 = v874;
            int v552 = v1182;
            int v639 = v640 / 3;
LABEL_1190:
            *int v877 = v650;
            *int v876 = v872;
            int v650 = v552;
            int v552 = v1217;
            int v878 = v1216;
            int v872 = v639;
          }
          else
          {
            int v878 = v1182;
          }
          if (v872 >= 0) {
            int v879 = v650;
          }
          else {
            int v879 = -v650;
          }
          if (v879 < 0)
          {
            if (v878 >= 0) {
              int v881 = v878;
            }
            else {
              int v881 = -v878;
            }
            int v882 = v881 - v649;
            int v883 = v649 - v881;
            if (v552 >= 0) {
              int v880 = v883;
            }
            else {
              int v880 = v882;
            }
            if (v552 >= 0) {
              int v884 = v552;
            }
            else {
              int v884 = -v552;
            }
            if (v878 < 0) {
              int v878 = v884 - v649;
            }
            else {
              int v878 = v649 - v884;
            }
          }
          else
          {
            int v880 = v552;
          }
          int v1217 = v880;
          int v1216 = v878;
          unsigned int v885 = v1189;
          int v886 = v820 - v1189;
          unsigned int v887 = v1187;
          LODWORD(v1201) = v820 - v1189;
          HIDWORD(v1201) = v794 - v1187;
          LODWORD(v1202) = v818 - v819;
          LODWORD(v1199) = v851 - *(_DWORD *)v1215;
          HIDWORD(v1199) = v848 - v1213;
          LODWORD(v1200) = v850 - v844;
          int v1032 = v1226;
          LODWORD(v1197) = v866 - v1211;
          HIDWORD(v1197) = v863 - v1226;
          LODWORD(v1198) = v865 - v859;
          int v1030 = v1225;
          int v1028 = v1224;
          LODWORD(v1195) = v880 - v1225;
          HIDWORD(v1195) = v878 - v1224;
          LODWORD(v1196) = v879 - v875;
          int v1184 = v878;
          int v1172 = v794;
          int v1135 = v818;
          unsigned int v1076 = v844;
          int v1071 = v848;
          int v1067 = v850;
          int v1063 = v851;
          int v1046 = v863;
          unsigned int v1048 = v859;
          int v1042 = v866;
          int v1044 = v865;
          int v1038 = v879;
          unsigned int v1040 = v875;
          int v1034 = v1211;
          int v1036 = v880;
          int v1052 = v1213;
          unsigned int v1054 = *(_DWORD *)v1215;
          if (*(unsigned char *)(v648 + 24))
          {
            int v888 = *(unsigned __int8 *)(v648 + 8);
            unsigned int v1056 = v1187;
            uint64_t v889 = (unsigned __int16)v1191;
            int v890 = *(_DWORD *)((char *)&unk_24FF7D720 + ((((unsigned __int16)v1191 + 2048) >> 10) & 0x7CLL));
            int v1050 = v890;
            uint64_t v891 = WORD1(v1191);
            int v892 = *(_DWORD *)((char *)&unk_24FF7D720 + (((WORD1(v1191) + 2048) >> 10) & 0x7CLL));
            unsigned int v1060 = v1189;
            signed int v893 = v892 + v890 + sub_24FF7C6B0((int *)&v1201, v1100, v888, (unsigned __int16 **)&v1247);
            int v894 = *(_DWORD *)((char *)&unk_24FF7D720 + (((unint64_t)(67584 - v889) >> 10) & 0x3FFFFFFFFFFFFCLL));
            uint64_t v895 = WORD2(v1191);
            LODWORD(v889) = *(_DWORD *)((char *)&unk_24FF7D720 + (((WORD2(v1191) + 2048) >> 10) & 0x7CLL));
            signed int v896 = v889 + sub_24FF7C6B0((int *)&v1199, v1100, v888, (unsigned __int16 **)&v1247) + v894;
            LODWORD(v891) = *(_DWORD *)((char *)&unk_24FF7D720
                                      + (((unint64_t)(67584 - v891) >> 10) & 0x3FFFFFFFFFFFFCLL));
            LODWORD(v889) = sub_24FF7C6B0((int *)&v1197, v1100, v888, (unsigned __int16 **)&v1247);
            LODWORD(v895) = *(_DWORD *)((char *)&unk_24FF7D720
                                      + (((unint64_t)(67584 - v895) >> 10) & 0x3FFFFFFFFFFFFCLL));
            int v897 = sub_24FF7C6B0((int *)&v1195, v1100, v888, (unsigned __int16 **)&v1247);
            unsigned int v885 = v1060;
            int v898 = v1050 + v889;
            unsigned int v887 = v1056;
            signed int v899 = v891 + v898;
            signed int v900 = v895 + v894 + v897;
          }
          else if (v1100 < 1)
          {
            signed int v893 = 0;
            signed int v896 = 0;
            signed int v899 = 0;
            signed int v900 = 0;
          }
          else
          {
            if (v886 < 0) {
              int v886 = v1189 - v820;
            }
            signed int v893 = -(v1100 * __clz(v886 + 1));
            if (v851 - *(_DWORD *)v1215 >= 0) {
              int v901 = v851 - *(_DWORD *)v1215;
            }
            else {
              int v901 = *(_DWORD *)v1215 - v851;
            }
            signed int v896 = -(v1100 * __clz(v901 + 1));
            if (v866 - v1211 >= 0) {
              int v902 = v866 - v1211;
            }
            else {
              int v902 = v1211 - v866;
            }
            signed int v899 = -(v1100 * __clz(v902 + 1));
            if (v880 - v1225 >= 0) {
              int v903 = v880 - v1225;
            }
            else {
              int v903 = v1225 - v880;
            }
            signed int v900 = -(v1100 * __clz(v903 + 1));
          }
          uint64_t v537 = v1118;
          uint64_t v540 = v1144;
          if (v893 > v896 || v893 > v899 || v893 > v900)
          {
            if (v896 > v899 || v896 > v900)
            {
              uint64_t v2 = v1160;
              if (v899 <= v900)
              {
                int v905 = 0;
                v1207 = (void *)__PAIR64__(v1032, v1034);
                int v904 = 1;
                LODWORD(v1208) = v1048;
                int v908 = v1044;
                int v907 = v1046;
                uint64_t v906 = 1;
                int v909 = v1042;
              }
              else
              {
                v1207 = (void *)__PAIR64__(v1028, v1030);
                int v904 = 1;
                int v907 = v1184;
                LODWORD(v1208) = v1040;
                int v909 = v1036;
                int v908 = v1038;
                int v905 = 1;
                uint64_t v906 = 2;
              }
              LODWORD(__b) = v909;
            }
            else
            {
              int v904 = 0;
              v1207 = (void *)__PAIR64__(v1052, v1054);
              int v905 = 1;
              LODWORD(v1208) = v1076;
              int v907 = v1071;
              int v908 = v1067;
              uint64_t v906 = 2;
              LODWORD(__b) = v1063;
              uint64_t v2 = v1160;
            }
          }
          else
          {
            int v904 = 0;
            int v905 = 0;
            v1207 = (void *)__PAIR64__(v887, v885);
            LODWORD(v1208) = v819;
            uint64_t v906 = 1;
            LODWORD(__b) = v820;
            uint64_t v2 = v1160;
            int v907 = v1172;
            int v908 = v1135;
          }
          HIDWORD(__b) = v907;
          LODWORD(v1210[0]) = v908;
          sub_24FF6DACC(v1085, v905, &v1191);
          sub_24FF6DACC(v1085, v904, (_WORD *)&v1191 + v906);
          unsigned int v840 = 2;
LABEL_1362:
          uint64_t v3 = (uint64_t)v1152;
          goto LABEL_1409;
        }
      }
      if (v562 != -1)
      {
        if (!v1151
          || (uint64_t v651 = v1152[404], *(unsigned char *)(v651 + (int)v1205))
          && *(unsigned char *)(v651 + SHIDWORD(v1205))
          && *(unsigned char *)(v651 + v562))
        {
          int v652 = (_DWORD *)(v1118 + 4 * (int)v1205 * v1100);
          int v653 = v652[1];
          int v654 = *v652 - v1159;
          int v655 = v653 - v1159;
          if (v654 >= 0) {
            int v656 = v654;
          }
          else {
            int v656 = -v654;
          }
          if (v655 >= 0) {
            int v657 = v653 - v1159;
          }
          else {
            int v657 = v1159 - v653;
          }
          int v658 = v1159 - v656;
          int v659 = v1159 - v656 - v657;
          if (v659 < 0)
          {
            int v660 = v657 - v1159;
            int v661 = v1159 - v657;
            if (v654 >= 0) {
              int v654 = v661;
            }
            else {
              int v654 = v660;
            }
            int v662 = v656 - v1159;
            if (v655 >= 0) {
              int v655 = v658;
            }
            else {
              int v655 = v662;
            }
          }
          int v663 = v1182;
          int v664 = (_DWORD *)(v1118 + 4 * HIDWORD(v1205) * v1100);
          int v665 = *v664 - v1159;
          int v666 = v664[1] - v1159;
          if (v665 >= 0) {
            int v667 = *v664 - v1159;
          }
          else {
            int v667 = v1159 - *v664;
          }
          if (v666 >= 0) {
            int v668 = v666;
          }
          else {
            int v668 = -v666;
          }
          int v669 = v1159 - v667;
          int v670 = v1159 - v667 - v668;
          if (v670 < 0)
          {
            int v671 = v668 - v1159;
            int v672 = v1159 - v668;
            if (v665 >= 0) {
              int v665 = v672;
            }
            else {
              int v665 = v671;
            }
            int v673 = v667 - v1159;
            if (v666 >= 0) {
              int v666 = v669;
            }
            else {
              int v666 = v673;
            }
          }
          v674 = (_DWORD *)(v1118 + 4 * v562 * v1100);
          int v675 = *v674 - v1159;
          int v676 = v674[1] - v1159;
          if (v675 >= 0) {
            int v677 = *v674 - v1159;
          }
          else {
            int v677 = v1159 - *v674;
          }
          if (v676 >= 0) {
            int v678 = v674[1] - v1159;
          }
          else {
            int v678 = v1159 - v674[1];
          }
          int v679 = v1159 - v677;
          int v680 = v1159 - v677 - v678;
          if (v680 < 0)
          {
            int v681 = v678 - v1159;
            int v682 = v1159 - v678;
            if (v675 >= 0) {
              int v675 = v682;
            }
            else {
              int v675 = v681;
            }
            int v683 = v677 - v1159;
            if (v676 >= 0) {
              int v676 = v679;
            }
            else {
              int v676 = v683;
            }
          }
          uint64_t v684 = v557 * (uint64_t)v659 + v1133 * (uint64_t)v654 + v556 * (uint64_t)v655;
          if (v684 >= 0) {
            int v685 = v554;
          }
          else {
            int v685 = -v554;
          }
          if (v684 >= 0) {
            int v686 = v556;
          }
          else {
            int v686 = -v556;
          }
          if (v684 >= 0) {
            int v687 = v557;
          }
          else {
            int v687 = -v557;
          }
          LODWORD(v1189) = v685;
          LODWORD(v1187) = v686;
          int v688 = v665 + v654;
          int v689 = v666 + v655;
          int v690 = v670 + v659;
          int v691 = v688 - v675;
          int v692 = v666 + v655 - v676;
          *(_DWORD *)v1215 = v688 - v675;
          int v1213 = v692;
          int v693 = v688 + 1;
          int v694 = v689 + 1;
          int v695 = v690 + 1;
          if (v688 + 1 >= 0) {
            int v696 = v688 + 1;
          }
          else {
            int v696 = v688 + 2;
          }
          int v697 = v696 >> 1;
          int v698 = v689 + 2;
          if (v694 >= 0) {
            int v698 = v689 + 1;
          }
          int v699 = v698 >> 1;
          int v1211 = v697;
          int v1226 = v698 >> 1;
          int v700 = (v675 + v693) / 3;
          int v701 = (v676 + v694) / 3;
          int v1225 = v700;
          int v1224 = v701;
          if (v695 >= 0) {
            int v702 = v690 + 1;
          }
          else {
            int v702 = v690 + 2;
          }
          int v1223 = v552;
          int v1222 = v1182;
          int v1221 = v552;
          int v1220 = v1182;
          int v1219 = v552;
          int v1218 = v1182;
          int v1217 = v552;
          int v1216 = v1182;
          if (v554 >= 0) {
            unsigned int v703 = v554;
          }
          else {
            unsigned int v703 = -v554;
          }
          if (v556 >= 0) {
            unsigned int v704 = v556;
          }
          else {
            unsigned int v704 = -v556;
          }
          if (v557 >= 0) {
            unsigned int v705 = v557;
          }
          else {
            unsigned int v705 = -v557;
          }
          if (v703 >= v704 && v703 >= v705)
          {
            v706 = &v1189;
            int v707 = &v1223;
            int v708 = v552;
            int v709 = v1170;
            goto LABEL_1064;
          }
          int v709 = v1170;
          if (v704 >= v705)
          {
            v706 = (uint64_t *)&v1187;
            int v707 = &v1222;
            int v708 = v1182;
            int v685 = v686;
LABEL_1064:
            *int v707 = v709;
            *(_DWORD *)v706 = v687;
            int v802 = v1223;
            int v801 = v1222;
            int v687 = v685;
          }
          else
          {
            int v801 = v1182;
            int v802 = v552;
            int v708 = v1170;
          }
          if (v687 >= 0) {
            int v826 = v708;
          }
          else {
            int v826 = -v708;
          }
          if (v687 >= 0) {
            int v827 = v687;
          }
          else {
            int v827 = -v687;
          }
          if (v826 < 0)
          {
            if (v801 >= 0) {
              int v829 = v801;
            }
            else {
              int v829 = -v801;
            }
            int v830 = v829 - v1159;
            int v831 = v1159 - v829;
            if (v802 >= 0) {
              int v828 = v831;
            }
            else {
              int v828 = v830;
            }
            if (v802 >= 0) {
              int v832 = v802;
            }
            else {
              int v832 = -v802;
            }
            if (v801 < 0) {
              int v801 = v832 - v1159;
            }
            else {
              int v801 = v1159 - v832;
            }
          }
          else
          {
            int v828 = v802;
          }
          int v910 = v690 - v680;
          int v1223 = v828;
          int v1222 = v801;
          if (v691 >= 0) {
            unsigned int v911 = v691;
          }
          else {
            unsigned int v911 = -v691;
          }
          if (v692 >= 0) {
            unsigned int v912 = v692;
          }
          else {
            unsigned int v912 = -v692;
          }
          if (v910 >= 0) {
            unsigned int v913 = v910;
          }
          else {
            unsigned int v913 = -v910;
          }
          if (v911 >= v912 && v911 >= v913)
          {
            signed int v914 = (int *)v1215;
            int v915 = &v1221;
            unsigned int v913 = v911;
            int v916 = v552;
            goto LABEL_1249;
          }
          if (v912 >= v913)
          {
            signed int v914 = &v1213;
            int v915 = &v1220;
            unsigned int v913 = v912;
            int v916 = v1182;
            int v691 = v692;
LABEL_1249:
            *int v915 = v709;
            *signed int v914 = v910;
            int v918 = v1221;
            int v917 = v1220;
            int v910 = v691;
          }
          else
          {
            int v917 = v1182;
            int v918 = v552;
            int v916 = v709;
          }
          if (v910 >= 0) {
            int v919 = v916;
          }
          else {
            int v919 = -v916;
          }
          if (v919 < 0)
          {
            if (v917 >= 0) {
              int v921 = v917;
            }
            else {
              int v921 = -v917;
            }
            int v922 = v921 - v1159;
            int v923 = v1159 - v921;
            if (v918 >= 0) {
              int v920 = v923;
            }
            else {
              int v920 = v922;
            }
            if (v918 >= 0) {
              int v924 = v918;
            }
            else {
              int v924 = -v918;
            }
            if (v917 < 0) {
              int v917 = v924 - v1159;
            }
            else {
              int v917 = v1159 - v924;
            }
          }
          else
          {
            int v920 = v918;
          }
          int v925 = v702 >> 1;
          int v1221 = v920;
          int v1220 = v917;
          if (v697 >= 0) {
            unsigned int v926 = v697;
          }
          else {
            unsigned int v926 = -v697;
          }
          if (v699 >= 0) {
            unsigned int v927 = v699;
          }
          else {
            unsigned int v927 = -v699;
          }
          if (v925 >= 0) {
            unsigned int v928 = v925;
          }
          else {
            unsigned int v928 = -v925;
          }
          if (v926 >= v927 && v926 >= v928)
          {
            int v929 = &v1211;
            int v930 = &v1219;
            unsigned int v928 = v926;
            int v931 = v552;
            goto LABEL_1282;
          }
          if (v927 >= v928)
          {
            int v929 = &v1226;
            int v930 = &v1218;
            unsigned int v928 = v927;
            int v931 = v1182;
            int v697 = v699;
LABEL_1282:
            *int v930 = v709;
            *int v929 = v925;
            int v933 = v1219;
            int v932 = v1218;
            int v925 = v697;
          }
          else
          {
            int v932 = v1182;
            int v933 = v552;
            int v931 = v709;
          }
          if (v925 < 0) {
            int v931 = -v931;
          }
          if (v931 < 0)
          {
            if (v932 >= 0) {
              int v935 = v932;
            }
            else {
              int v935 = -v932;
            }
            int v936 = v935 - v1159;
            int v937 = v1159 - v935;
            if (v933 >= 0) {
              int v934 = v937;
            }
            else {
              int v934 = v936;
            }
            if (v933 >= 0) {
              int v938 = v933;
            }
            else {
              int v938 = -v933;
            }
            if (v932 < 0) {
              int v932 = v938 - v1159;
            }
            else {
              int v932 = v1159 - v938;
            }
          }
          else
          {
            int v934 = v933;
          }
          int v939 = (v680 + v695) / 3;
          int v1219 = v934;
          int v1218 = v932;
          if (v700 >= 0) {
            unsigned int v940 = v700;
          }
          else {
            unsigned int v940 = -v700;
          }
          if (v701 >= 0) {
            unsigned int v941 = v701;
          }
          else {
            unsigned int v941 = -v701;
          }
          if (v939 >= 0) {
            unsigned int v942 = v939;
          }
          else {
            unsigned int v942 = -v939;
          }
          if (v940 >= v941 && v940 >= v942)
          {
            signed int v943 = &v1225;
            uint64_t v944 = &v1217;
            unsigned int v942 = v940;
            goto LABEL_1313;
          }
          if (v941 >= v942)
          {
            signed int v943 = &v1224;
            uint64_t v944 = &v1216;
            unsigned int v942 = v941;
            int v552 = v1182;
            int v700 = v701;
LABEL_1313:
            *uint64_t v944 = v709;
            *signed int v943 = v939;
            int v709 = v552;
            int v552 = v1217;
            int v663 = v1216;
            int v939 = v700;
          }
          if (v939 >= 0) {
            int v945 = v709;
          }
          else {
            int v945 = -v709;
          }
          if (v945 < 0)
          {
            if (v663 >= 0) {
              int v947 = v663;
            }
            else {
              int v947 = -v663;
            }
            int v948 = v947 - v1159;
            int v949 = v1159 - v947;
            if (v552 >= 0) {
              int v946 = v949;
            }
            else {
              int v946 = v948;
            }
            if (v552 >= 0) {
              int v950 = v552;
            }
            else {
              int v950 = -v552;
            }
            if (v663 < 0) {
              int v663 = v950 - v1159;
            }
            else {
              int v663 = v1159 - v950;
            }
          }
          else
          {
            int v946 = v552;
          }
          int v1217 = v946;
          int v1216 = v663;
          unsigned int v951 = v1189;
          int v952 = v828 - v1189;
          unsigned int v953 = v1187;
          LODWORD(v1201) = v828 - v1189;
          HIDWORD(v1201) = v801 - v1187;
          LODWORD(v1202) = v826 - v827;
          unsigned int v1055 = *(_DWORD *)v1215;
          int v1053 = v1213;
          LODWORD(v1199) = v920 - *(_DWORD *)v1215;
          HIDWORD(v1199) = v917 - v1213;
          LODWORD(v1200) = v919 - v913;
          int v1035 = v1211;
          int v1033 = v1226;
          LODWORD(v1197) = v934 - v1211;
          HIDWORD(v1197) = v932 - v1226;
          LODWORD(v1198) = v931 - v928;
          int v1031 = v1225;
          int v1029 = v1224;
          LODWORD(v1195) = v946 - v1225;
          HIDWORD(v1195) = v663 - v1224;
          LODWORD(v1196) = v945 - v942;
          int v1185 = v663;
          int v1173 = v801;
          int v1136 = v826;
          unsigned int v1077 = v913;
          int v1072 = v917;
          int v1068 = v919;
          int v1064 = v920;
          int v1047 = v932;
          unsigned int v1049 = v928;
          int v1043 = v934;
          int v1045 = v931;
          int v1039 = v945;
          unsigned int v1041 = v942;
          int v1037 = v946;
          if (*(unsigned char *)(v2 + 24))
          {
            int v954 = *(unsigned __int8 *)(v2 + 8);
            unsigned int v1057 = v1187;
            uint64_t v955 = (unsigned __int16)v1193;
            int v956 = *(_DWORD *)((char *)&unk_24FF7D720 + ((((unsigned __int16)v1193 + 2048) >> 10) & 0x7CLL));
            int v1051 = v956;
            int v1126 = v828;
            uint64_t v957 = WORD1(v1193);
            int v958 = *(_DWORD *)((char *)&unk_24FF7D720 + (((WORD1(v1193) + 2048) >> 10) & 0x7CLL));
            unsigned int v1061 = v1189;
            signed int v959 = v958 + v956 + sub_24FF7C6B0((int *)&v1201, v1100, v954, (unsigned __int16 **)&v1239 + 1);
            int v960 = *(_DWORD *)((char *)&unk_24FF7D720 + (((unint64_t)(67584 - v955) >> 10) & 0x3FFFFFFFFFFFFCLL));
            uint64_t v961 = WORD2(v1193);
            LODWORD(v955) = *(_DWORD *)((char *)&unk_24FF7D720 + (((WORD2(v1193) + 2048) >> 10) & 0x7CLL));
            signed int v962 = v955 + sub_24FF7C6B0((int *)&v1199, v1100, v954, (unsigned __int16 **)&v1239 + 1) + v960;
            LODWORD(v957) = *(_DWORD *)((char *)&unk_24FF7D720
                                      + (((unint64_t)(67584 - v957) >> 10) & 0x3FFFFFFFFFFFFCLL));
            LODWORD(v955) = sub_24FF7C6B0((int *)&v1197, v1100, v954, (unsigned __int16 **)&v1239 + 1);
            LODWORD(v961) = *(_DWORD *)((char *)&unk_24FF7D720
                                      + (((unint64_t)(67584 - v961) >> 10) & 0x3FFFFFFFFFFFFCLL));
            int v963 = sub_24FF7C6B0((int *)&v1195, v1100, v954, (unsigned __int16 **)&v1239 + 1);
            unsigned int v951 = v1061;
            int v964 = v961 + v960;
            uint64_t v537 = v1118;
            int v965 = v1051 + v955;
            unsigned int v953 = v1057;
            signed int v966 = v957 + v965;
            int v828 = v1126;
            signed int v967 = v964 + v963;
          }
          else if (v1100 < 1)
          {
            signed int v959 = 0;
            signed int v962 = 0;
            signed int v966 = 0;
            signed int v967 = 0;
          }
          else
          {
            if (v952 < 0) {
              int v952 = v1189 - v828;
            }
            signed int v959 = -(v1100 * __clz(v952 + 1));
            if (v920 - *(_DWORD *)v1215 >= 0) {
              int v968 = v920 - *(_DWORD *)v1215;
            }
            else {
              int v968 = *(_DWORD *)v1215 - v920;
            }
            signed int v962 = -(v1100 * __clz(v968 + 1));
            if (v934 - v1211 >= 0) {
              int v969 = v934 - v1211;
            }
            else {
              int v969 = v1211 - v934;
            }
            signed int v966 = -(v1100 * __clz(v969 + 1));
            if (v946 - v1225 >= 0) {
              int v970 = v946 - v1225;
            }
            else {
              int v970 = v1225 - v946;
            }
            signed int v967 = -(v1100 * __clz(v970 + 1));
          }
          uint64_t v540 = v1144;
          if (v959 > v962 || v959 > v966 || v959 > v967)
          {
            if (v962 > v966 || v962 > v967)
            {
              uint64_t v2 = v1160;
              if (v966 <= v967)
              {
                int v972 = 0;
                v1207 = (void *)__PAIR64__(v1033, v1035);
                int v971 = 1;
                LODWORD(v1208) = v1049;
                int v975 = v1045;
                int v974 = v1047;
                uint64_t v973 = 1;
                int v976 = v1043;
              }
              else
              {
                v1207 = (void *)__PAIR64__(v1029, v1031);
                int v971 = 1;
                int v974 = v1185;
                LODWORD(v1208) = v1041;
                int v976 = v1037;
                int v975 = v1039;
                int v972 = 1;
                uint64_t v973 = 2;
              }
              LODWORD(__b) = v976;
            }
            else
            {
              int v971 = 0;
              v1207 = (void *)__PAIR64__(v1053, v1055);
              int v972 = 1;
              LODWORD(v1208) = v1077;
              int v974 = v1072;
              int v975 = v1068;
              uint64_t v973 = 2;
              LODWORD(__b) = v1064;
              uint64_t v2 = v1160;
            }
          }
          else
          {
            int v971 = 0;
            int v972 = 0;
            v1207 = (void *)__PAIR64__(v953, v951);
            LODWORD(v1208) = v827;
            uint64_t v973 = 1;
            LODWORD(__b) = v828;
            uint64_t v2 = v1160;
            int v974 = v1173;
            int v975 = v1136;
          }
          HIDWORD(__b) = v974;
          LODWORD(v1210[0]) = v975;
          sub_24FF6DACC(v1085, v972, &v1193);
          sub_24FF6DACC(v1085, v971, (_WORD *)&v1193 + v973);
          unsigned int v840 = 1;
          goto LABEL_1362;
        }
      }
      if (HIDWORD(v1205) != -1)
      {
        if (!v1151 || (uint64_t v710 = v1152[404], *(unsigned char *)(v710 + (int)v1205)) && *(unsigned char *)(v710 + SHIDWORD(v1205)))
        {
          int v711 = (_DWORD *)(v1118 + 4 * (int)v1205 * v1100);
          int v712 = *v711 - v1159;
          int v713 = v711[1] - v1159;
          if (v712 >= 0) {
            int v714 = v712;
          }
          else {
            int v714 = -v712;
          }
          if (v713 >= 0) {
            int v715 = v713;
          }
          else {
            int v715 = -v713;
          }
          int v716 = v1159 - v714;
          int v717 = v1159 - v714 - v715;
          if (v717 < 0)
          {
            int v718 = v715 - v1159;
            int v719 = v1159 - v715;
            if (v712 >= 0) {
              int v712 = v719;
            }
            else {
              int v712 = v718;
            }
            int v720 = v714 - v1159;
            if (v713 >= 0) {
              int v713 = v716;
            }
            else {
              int v713 = v720;
            }
          }
          int v721 = v1182;
          uint64_t v722 = (_DWORD *)(v1118 + 4 * HIDWORD(v1205) * v1100);
          int v723 = *v722 - v1159;
          int v724 = v722[1] - v1159;
          if (v723 >= 0) {
            int v725 = v723;
          }
          else {
            int v725 = -v723;
          }
          if (v724 >= 0) {
            int v726 = v724;
          }
          else {
            int v726 = -v724;
          }
          int v727 = v1159 - v725;
          int v728 = v1159 - v725 - v726;
          if (v728 < 0)
          {
            int v729 = v726 - v1159;
            int v730 = v1159 - v726;
            if (v723 >= 0) {
              int v723 = v730;
            }
            else {
              int v723 = v729;
            }
            int v731 = v725 - v1159;
            if (v724 >= 0) {
              int v724 = v727;
            }
            else {
              int v724 = v731;
            }
          }
          uint64_t v732 = v557 * (uint64_t)v717 + v1133 * (uint64_t)v712 + v556 * (uint64_t)v713;
          if (v732 >= 0) {
            int v733 = v554;
          }
          else {
            int v733 = -v554;
          }
          if (v732 >= 0) {
            int v734 = v556;
          }
          else {
            int v734 = -v556;
          }
          if (v732 >= 0) {
            int v735 = v557;
          }
          else {
            int v735 = -v557;
          }
          LODWORD(v1197) = v733;
          LODWORD(v1195) = v734;
          int v736 = v712 + v723;
          int v737 = v713 + v724;
          int v738 = v717 + v728;
          int v739 = v736 + 2;
          if (v736 + 1 >= 0) {
            int v739 = v736 + 1;
          }
          int v740 = v739 >> 1;
          if (v737 + 1 >= 0) {
            int v741 = v737 + 1;
          }
          else {
            int v741 = v737 + 2;
          }
          int v742 = v741 >> 1;
          int v743 = v738 + 2;
          if (v738 + 1 >= 0) {
            int v743 = v738 + 1;
          }
          LODWORD(v1189) = v740;
          LODWORD(v1187) = v742;
          *(_DWORD *)v1215 = v552;
          int v1213 = v1182;
          int v1211 = v552;
          int v1226 = v1182;
          if (v554 >= 0) {
            unsigned int v744 = v554;
          }
          else {
            unsigned int v744 = -v554;
          }
          if (v556 >= 0) {
            unsigned int v745 = v556;
          }
          else {
            unsigned int v745 = -v556;
          }
          if (v557 >= 0) {
            unsigned int v746 = v557;
          }
          else {
            unsigned int v746 = -v557;
          }
          if (v744 >= v745 && v744 >= v746)
          {
            int v747 = &v1197;
            int v748 = (int *)v1215;
            int v749 = v552;
            int v750 = v1170;
            goto LABEL_1085;
          }
          int v750 = v1170;
          if (v745 >= v746)
          {
            int v747 = &v1195;
            int v748 = &v1213;
            int v749 = v1182;
            int v733 = v734;
LABEL_1085:
            *int v748 = v750;
            *(_DWORD *)int v747 = v735;
            int v804 = *(_DWORD *)v1215;
            int v803 = v1213;
            int v735 = v733;
          }
          else
          {
            int v803 = v1182;
            int v804 = v552;
            int v749 = v1170;
          }
          if (v735 >= 0) {
            int v833 = v735;
          }
          else {
            int v833 = -v735;
          }
          if (v735 >= 0) {
            int v834 = v749;
          }
          else {
            int v834 = -v749;
          }
          if (v834 < 0)
          {
            if (v803 >= 0) {
              int v836 = v803;
            }
            else {
              int v836 = -v803;
            }
            int v837 = v836 - v1159;
            int v838 = v1159 - v836;
            if (v804 >= 0) {
              int v835 = v838;
            }
            else {
              int v835 = v837;
            }
            if (v804 >= 0) {
              int v839 = v804;
            }
            else {
              int v839 = -v804;
            }
            if (v803 < 0) {
              int v803 = v839 - v1159;
            }
            else {
              int v803 = v1159 - v839;
            }
          }
          else
          {
            int v835 = v804;
          }
          int v977 = v743 >> 1;
          if (v740 >= 0) {
            unsigned int v978 = v740;
          }
          else {
            unsigned int v978 = -v740;
          }
          if (v742 >= 0) {
            unsigned int v979 = v742;
          }
          else {
            unsigned int v979 = -v742;
          }
          if (v977 >= 0) {
            unsigned int v980 = v977;
          }
          else {
            unsigned int v980 = -v977;
          }
          if (v978 >= v979 && v978 >= v980)
          {
            v981 = &v1189;
            uint64_t v982 = &v1211;
            unsigned int v980 = v978;
            goto LABEL_1378;
          }
          if (v979 >= v980)
          {
            v981 = (uint64_t *)&v1187;
            uint64_t v982 = &v1226;
            unsigned int v980 = v979;
            int v552 = v1182;
            int v740 = v742;
LABEL_1378:
            *uint64_t v982 = v750;
            *(_DWORD *)v981 = v977;
            int v750 = v552;
            int v552 = v1211;
            int v721 = v1226;
            int v977 = v740;
          }
          if (v977 >= 0) {
            int v983 = v750;
          }
          else {
            int v983 = -v750;
          }
          if (v983 < 0)
          {
            if (v721 >= 0) {
              int v985 = v721;
            }
            else {
              int v985 = -v721;
            }
            int v986 = v985 - v1159;
            int v987 = v1159 - v985;
            if (v552 >= 0) {
              int v984 = v987;
            }
            else {
              int v984 = v986;
            }
            if (v552 >= 0) {
              int v988 = v552;
            }
            else {
              int v988 = -v552;
            }
            if (v721 < 0) {
              int v721 = v988 - v1159;
            }
            else {
              int v721 = v1159 - v988;
            }
          }
          else
          {
            int v984 = v552;
          }
          unsigned int v989 = v1197;
          int v990 = v835 - v1197;
          unsigned int v991 = v1195;
          LODWORD(v1201) = v835 - v1197;
          HIDWORD(v1201) = v803 - v1195;
          LODWORD(v1202) = v834 - v833;
          unsigned int v992 = v1189;
          int v993 = v984 - v1189;
          unsigned int v994 = v1187;
          LODWORD(v1199) = v984 - v1189;
          HIDWORD(v1199) = v721 - v1187;
          LODWORD(v1200) = v983 - v980;
          if (*(unsigned char *)(v1160 + 24))
          {
            unsigned int v1078 = v1195;
            unsigned int v1081 = v1197;
            int v1127 = v835;
            int v1137 = v834;
            int v1174 = v833;
            int v1186 = v803;
            int v995 = *(unsigned __int8 *)(v1160 + 8);
            uint64_t v996 = v1228;
            int v997 = *(_DWORD *)((char *)&unk_24FF7D720 + (((v1228 + 2048) >> 10) & 0x7CLL));
            unsigned int v1073 = v1189;
            unsigned int v998 = v980;
            int v999 = sub_24FF7C6B0((int *)&v1201, v1100, v995, (unsigned __int16 **)v1232);
            LODWORD(v996) = *(_DWORD *)((char *)&unk_24FF7D720
                                      + (((unint64_t)(67584 - v996) >> 10) & 0x3FFFFFFFFFFFFCLL));
            int v1000 = sub_24FF7C6B0((int *)&v1199, v1100, v995, (unsigned __int16 **)v1232);
            unsigned int v980 = v998;
            signed int v1001 = v999 + v997;
            signed int v1002 = v1000 + v996;
            unsigned int v992 = v1073;
            goto LABEL_1404;
          }
          if (v1100 < 1)
          {
            int v1003 = 0;
          }
          else
          {
            unsigned int v1078 = v1195;
            unsigned int v1081 = v1197;
            int v1127 = v835;
            int v1137 = v834;
            int v1174 = v833;
            int v1186 = v803;
            if (v990 < 0) {
              int v990 = v1197 - v835;
            }
            signed int v1001 = -(v1100 * __clz(v990 + 1));
            if (v993 < 0) {
              int v993 = v1189 - v984;
            }
            signed int v1002 = -(v1100 * __clz(v993 + 1));
LABEL_1404:
            if (v1001 <= v1002)
            {
              int v1003 = 0;
              int v803 = v1186;
              int v833 = v1174;
              int v834 = v1137;
              int v835 = v1127;
              unsigned int v989 = v1081;
              unsigned int v991 = v1078;
            }
            else
            {
              int v1003 = 1;
              unsigned int v989 = v992;
              unsigned int v991 = v994;
              int v833 = v980;
              int v835 = v984;
              int v803 = v721;
              int v834 = v983;
            }
          }
          v1207 = (void *)__PAIR64__(v991, v989);
          LODWORD(v1208) = v833;
          long long __b = (char *)__PAIR64__(v803, v835);
          LODWORD(v1210[0]) = v834;
          sub_24FF6DACC(v1085, v1003, &v1228);
          unsigned int v840 = 0;
          uint64_t v2 = v1160;
          uint64_t v3 = (uint64_t)v1152;
          uint64_t v537 = v1118;
          uint64_t v540 = v1144;
          goto LABEL_1409;
        }
      }
      int v555 = v1152;
    }
    if (!sub_24FF75D8C((uint64_t)v555, v541, (uint64_t)&v1205, *(_DWORD *)(v2 + 4), *(_DWORD *)(v2 + 16)))
    {
      int v766 = v1182;
      unint64_t v767 = v1133 * (uint64_t)v552 + v556 * (uint64_t)v1182 + v557 * (uint64_t)v1170;
      int v536 = v1100;
      if ((v767 & 0x8000000000000000) != 0)
      {
        int v554 = -v554;
        int v556 = -v556;
        int v557 = -v557;
        v1207 = (void *)__PAIR64__(v556, v554);
        LODWORD(v1208) = v557;
      }
      sub_24FF6DACC(v1085, v767 >> 63, &v1227);
      if (v554 >= 0) {
        unsigned int v768 = v554;
      }
      else {
        unsigned int v768 = -v554;
      }
      if (v556 >= 0) {
        unsigned int v769 = v556;
      }
      else {
        unsigned int v769 = -v556;
      }
      if (v557 >= 0) {
        unsigned int v770 = v557;
      }
      else {
        unsigned int v770 = -v557;
      }
      if (v768 >= v769 && v768 >= v770)
      {
        int v772 = &v1207;
        int v773 = &__b;
        int v766 = v552;
        int v556 = v554;
      }
      else
      {
        int v772 = (void **)((char *)&v1207 + 4);
        int v773 = (_DWORD *)&__b + 1;
        if (v769 < v770) {
          goto LABEL_958;
        }
      }
      *int v773 = v1170;
      LODWORD(v1210[0]) = v766;
      *(_DWORD *)int v772 = v557;
      int v1170 = v766;
      int v557 = v556;
      LODWORD(v1208) = v556;
LABEL_958:
      uint64_t v3 = (uint64_t)v1152;
      if (v557 < 0)
      {
        LODWORD(v1208) = -v557;
        int v776 = -v1170;
        LODWORD(v1210[0]) = -v1170;
      }
      else
      {
        int v776 = v1170;
      }
      int v796 = (int)__b;
      int v797 = HIDWORD(__b);
      if (v776 < 0)
      {
        if (SHIDWORD(__b) >= 0) {
          int v799 = HIDWORD(__b);
        }
        else {
          int v799 = -HIDWORD(__b);
        }
        int v800 = v799 - v1159;
        int v798 = v1159 - v799;
        if ((int)__b < 0)
        {
          int v798 = v800;
          int v796 = -(int)__b;
        }
        if ((HIDWORD(__b) & 0x80000000) != 0) {
          int v797 = v796 - v1159;
        }
        else {
          int v797 = v1159 - v796;
        }
      }
      else
      {
        int v798 = (int)__b;
      }
      long long __b = (char *)__PAIR64__(v797, v798);
      goto LABEL_1107;
    }
    int v751 = (int)v1205;
    int v752 = HIDWORD(v1205);
    int v753 = (int)v1206;
    uint64_t v754 = (int)v1205 * (uint64_t)v1133 + SHIDWORD(v1205) * (uint64_t)v556 + (int)v1206 * (uint64_t)v557;
    if (v754 >= 0) {
      int v755 = v554;
    }
    else {
      int v755 = -v554;
    }
    if (v754 >= 0) {
      int v756 = v556;
    }
    else {
      int v756 = -v556;
    }
    if (v754 >= 0) {
      int v757 = v557;
    }
    else {
      int v757 = -v557;
    }
    LODWORD(v1199) = v755;
    LODWORD(v1197) = v756;
    LODWORD(v1195) = v552;
    LODWORD(v1189) = v1182;
    LODWORD(v1187) = v552;
    *(_DWORD *)v1215 = v1182;
    if (v554 >= 0) {
      unsigned int v758 = v554;
    }
    else {
      unsigned int v758 = -v554;
    }
    if (v556 >= 0) {
      unsigned int v759 = v556;
    }
    else {
      unsigned int v759 = -v556;
    }
    if (v557 >= 0) {
      unsigned int v760 = v557;
    }
    else {
      unsigned int v760 = -v557;
    }
    if (v758 >= v759 && v758 >= v760)
    {
      int v774 = &v1199;
      int v775 = &v1195;
      int v765 = v552;
      uint64_t v3 = (uint64_t)v1152;
      int v762 = v1170;
    }
    else
    {
      uint64_t v3 = (uint64_t)v1152;
      int v762 = v1170;
      if (v759 < v760)
      {
        int v763 = v1182;
        int v764 = v552;
        int v765 = v1170;
        goto LABEL_962;
      }
      int v774 = &v1197;
      int v775 = (void **)&v1189;
      int v765 = v1182;
      int v755 = v756;
    }
    *(_DWORD *)int v775 = v762;
    *(_DWORD *)int v774 = v757;
    int v764 = (int)v1195;
    int v763 = v1189;
    int v757 = v755;
LABEL_962:
    if (v757 >= 0) {
      int v777 = v757;
    }
    else {
      int v777 = -v757;
    }
    if (v757 >= 0) {
      int v778 = v765;
    }
    else {
      int v778 = -v765;
    }
    if (v778 < 0)
    {
      if (v763 >= 0) {
        int v779 = v763;
      }
      else {
        int v779 = -v763;
      }
      int v780 = v779 - v1159;
      int v781 = v1159 - v779;
      if (v764 >= 0) {
        int v782 = v764;
      }
      else {
        int v782 = -v764;
      }
      if (v764 >= 0) {
        int v764 = v781;
      }
      else {
        int v764 = v780;
      }
      if (v763 >= 0) {
        int v763 = v1159 - v782;
      }
      else {
        int v763 = v782 - v1159;
      }
      int v762 = v1170;
    }
    LODWORD(v1195) = v764;
    LODWORD(v1189) = v763;
    if (v751 >= 0) {
      unsigned int v783 = v751;
    }
    else {
      unsigned int v783 = -v751;
    }
    if (v752 >= 0) {
      unsigned int v784 = v752;
    }
    else {
      unsigned int v784 = -v752;
    }
    if (v753 >= 0) {
      unsigned int v785 = v753;
    }
    else {
      unsigned int v785 = -v753;
    }
    if (v783 < v784 || v783 < v785)
    {
      if (v784 < v785) {
        goto LABEL_997;
      }
      uint64_t v787 = (unint64_t *)v1215;
      int v552 = v1182;
      int v786 = (void **)((char *)&v1205 + 4);
      int v751 = v752;
    }
    else
    {
      int v786 = &v1205;
      uint64_t v787 = &v1187;
    }
    *(_DWORD *)uint64_t v787 = v762;
    *(_DWORD *)int v786 = v753;
    int v762 = v552;
    int v753 = v751;
    LODWORD(v1206) = v751;
LABEL_997:
    if (v753 < 0)
    {
      int v753 = -v753;
      LODWORD(v1206) = v753;
      int v762 = -v762;
    }
    int v788 = v1187;
    int v789 = *(_DWORD *)v1215;
    if (v762 < 0)
    {
      if (*(int *)v1215 >= 0) {
        int v791 = *(_DWORD *)v1215;
      }
      else {
        int v791 = -*(_DWORD *)v1215;
      }
      int v792 = v791 - v1159;
      int v793 = v1159 - v791;
      if ((v1187 & 0x80000000) == 0) {
        int v790 = v793;
      }
      else {
        int v790 = v792;
      }
      if ((v1187 & 0x80000000) != 0) {
        int v788 = -(int)v1187;
      }
      if ((*(_DWORD *)v1215 & 0x80000000) != 0) {
        int v789 = v788 - v1159;
      }
      else {
        int v789 = v1159 - v788;
      }
    }
    else
    {
      int v790 = v1187;
    }
    unsigned int v805 = v1199;
    unsigned int v806 = v1197;
    LODWORD(v1203) = v764 - v1199;
    HIDWORD(v1203) = v763 - v1197;
    LODWORD(v1204) = v778 - v777;
    LODWORD(v1201) = v790 - v1205;
    HIDWORD(v1201) = v789 - HIDWORD(v1205);
    LODWORD(v1202) = v762 - v753;
    if (*(unsigned char *)(v1160 + 24))
    {
      int v807 = *(unsigned __int8 *)(v1160 + 8);
      uint64_t v808 = v1228;
      int v1134 = *(_DWORD *)((char *)&unk_24FF7D720 + (((v1228 + 2048) >> 10) & 0x7CLL));
      unsigned int v1171 = v1197;
      int v536 = v1100;
      int v1183 = v778;
      int v809 = v763;
      int v810 = v764;
      unsigned int v811 = v1199;
      int v1125 = sub_24FF7C6B0((int *)&v1203, v1100, v807, (unsigned __int16 **)v1232);
      LODWORD(v808) = *(_DWORD *)((char *)&unk_24FF7D720
                                + (((unint64_t)(67584 - v808) >> 10) & 0x3FFFFFFFFFFFFCLL));
      int v812 = sub_24FF7C6B0((int *)&v1201, v1100, v807, (unsigned __int16 **)v1232);
      unsigned int v805 = v811;
      int v778 = v1183;
      int v764 = v810;
      int v763 = v809;
      signed int v813 = v1125 + v1134;
      uint64_t v3 = (uint64_t)v1152;
      signed int v814 = v812 + v808;
      unsigned int v806 = v1171;
    }
    else
    {
      int v536 = v1100;
      if (v1100 < 1) {
        goto LABEL_1040;
      }
      if (v764 - (int)v1199 >= 0) {
        int v815 = v764 - v1199;
      }
      else {
        int v815 = v1199 - v764;
      }
      signed int v813 = -(v1100 * __clz(v815 + 1));
      if (v790 - (int)v1205 >= 0) {
        int v816 = v790 - v1205;
      }
      else {
        int v816 = v1205 - v790;
      }
      signed int v814 = -(v1100 * __clz(v816 + 1));
    }
    if (v813 <= v814)
    {
LABEL_1040:
      int v817 = 0;
      v1207 = (void *)__PAIR64__(v806, v805);
      int v762 = v778;
      LODWORD(v1208) = v777;
      goto LABEL_1041;
    }
    v1207 = v1205;
    LODWORD(v1208) = v1206;
    int v817 = 1;
    int v764 = v790;
    int v763 = v789;
LABEL_1041:
    uint64_t v2 = v1160;
    uint64_t v537 = v1118;
    uint64_t v540 = v1144;
    long long __b = (char *)__PAIR64__(v763, v764);
    LODWORD(v1210[0]) = v762;
    sub_24FF6DACC(v1085, v817, &v1228);
LABEL_1107:
    unsigned int v840 = 0;
LABEL_1409:
    sub_24FF6DC40(v3, (uint64_t)&__b, (uint64_t)&v1207, v536, v1091, *(unsigned char *)(v2 + 8), &v1232[15 * v840]);
LABEL_1410:
    v540 += 4;
    if (v1109 == v540)
    {
LABEL_1411:
      unint64_t v1004 = 360;
      do
      {
        v1005 = &v1232[v1004 / 8];
        v1006 = *(void **)((char *)&__p + v1004);
        if (v1006)
        {
          *(v1005 - 2) = v1006;
          operator delete(v1006);
        }
        int v1007 = *(v1005 - 6);
        if (v1007)
        {
          *(void *)((char *)&v1224 + v1004) = v1007;
          operator delete(v1007);
        }
        int v1008 = &v1232[v1004 / 8];
        v1009 = *(void **)((char *)&v1216 + v1004);
        if (v1009)
        {
          *(v1008 - 8) = v1009;
          operator delete(v1009);
        }
        int v1010 = *(v1008 - 12);
        if (v1010)
        {
          *(void *)((char *)&v1213 + v1004) = v1010;
          operator delete(v1010);
        }
        unsigned __int16 v1011 = *(v1005 - 15);
        if (v1011)
        {
          v1210[v1004 / 8] = v1011;
          operator delete(v1011);
        }
        v1004 -= 120;
      }
      while (v1004);
      goto LABEL_1423;
    }
  }
}

void sub_24FF7B75C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,void *a51,uint64_t a52,uint64_t a53,void *a54,uint64_t a55,uint64_t a56,void *a57,uint64_t a58,uint64_t a59,void *a60,uint64_t a61,uint64_t a62,void *a63)
{
  if (__p) {
    operator delete(__p);
  }
  if (a72)
  {
    STACK[0x200] = (unint64_t)a72;
    operator delete(a72);
  }
  uint64_t v73 = (void *)STACK[0x258];
  if (STACK[0x258])
  {
    STACK[0x260] = (unint64_t)v73;
    operator delete(v73);
  }
  uint64_t v74 = 360;
  while (1)
  {
    uint64_t v75 = (char *)&STACK[0x270] + v74;
    uint64_t v76 = *(void **)((char *)&STACK[0x270] + v74 - 24);
    if (v76)
    {
      *((void *)v75 - 2) = v76;
      operator delete(v76);
    }
    uint64_t v77 = (void *)*((void *)v75 - 6);
    if (v77)
    {
      *(unint64_t *)((char *)&STACK[0x270] + v74 - 40) = (unint64_t)v77;
      operator delete(v77);
    }
    uint64_t v78 = (char *)&STACK[0x270] + v74;
    uint64_t v79 = *(void **)((char *)&STACK[0x270] + v74 - 72);
    if (v79)
    {
      *((void *)v78 - 8) = v79;
      operator delete(v79);
    }
    int v80 = (void *)*((void *)v78 - 12);
    if (v80)
    {
      *(unint64_t *)((char *)&STACK[0x270] + v74 - 88) = (unint64_t)v80;
      operator delete(v80);
    }
    int v81 = (void *)*((void *)v75 - 15);
    if (v81)
    {
      *(unint64_t *)((char *)&STACK[0x270] + v74 - 112) = (unint64_t)v81;
      operator delete(v81);
    }
    v74 -= 120;
    if (!v74) {
      _Unwind_Resume(a1);
    }
  }
}

void *sub_24FF7BC6C(void *a1)
{
  uint64_t v2 = operator new(0x1330uLL);
  sub_24FF7BCB8((uint64_t)v2);
  *a1 = v2;
  return a1;
}

void sub_24FF7BCA4(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_24FF7BCB8(uint64_t a1)
{
  *(void *)a1 = 0;
  *(_DWORD *)(a1 + 8) = 0;
  bzero((void *)(a1 + 36), 0x220uLL);
  *(_DWORD *)(a1 + 580) = -1;
  bzero((void *)(a1 + 584), 0x700uLL);
  memset_pattern16((void *)(a1 + 2376), &unk_24FF7D710, 0xAuLL);
  *(_WORD *)(a1 + 2386) = 0x8000;
  memset_pattern16((void *)(a1 + 2388), &unk_24FF7D710, 0x60uLL);
  *(_WORD *)(a1 + 2484) = 0x8000;
  memset_pattern16((void *)(a1 + 2486), &unk_24FF7D710, 6uLL);
  *(_WORD *)(a1 + 2492) = 0x8000;
  memset_pattern16((void *)(a1 + 2494), &unk_24FF7D710, 0x50uLL);
  *(_DWORD *)(a1 + 2574) = -2147450880;
  memset_pattern16((void *)(a1 + 2578), &unk_24FF7D710, 0x20uLL);
  *(_DWORD *)(a1 + 2610) = -2147450880;
  *(_WORD *)(a1 + 2614) = 0x8000;
  memset_pattern16((void *)(a1 + 2616), &unk_24FF7D710, 0x80uLL);
  memset_pattern16((void *)(a1 + 2744), &unk_24FF7D710, 6uLL);
  *(_WORD *)(a1 + 2750) = 0x8000;
  memset_pattern16((void *)(a1 + 2752), &unk_24FF7D710, 6uLL);
  *(_DWORD *)(a1 + 3552) = 0;
  *(_OWORD *)(a1 + 3536) = 0u;
  *(_OWORD *)(a1 + 3520) = 0u;
  *(_OWORD *)(a1 + 3504) = 0u;
  *(_OWORD *)(a1 + 3488) = 0u;
  *(_OWORD *)(a1 + 3472) = 0u;
  *(_OWORD *)(a1 + 3456) = 0u;
  *(_OWORD *)(a1 + 3440) = 0u;
  *(_OWORD *)(a1 + 3424) = 0u;
  *(_OWORD *)(a1 + 3408) = 0u;
  *(_OWORD *)(a1 + 3392) = 0u;
  *(_OWORD *)(a1 + 3376) = 0u;
  *(_OWORD *)(a1 + 3360) = 0u;
  *(_OWORD *)(a1 + 3344) = 0u;
  *(_OWORD *)(a1 + 3328) = 0u;
  *(_OWORD *)(a1 + 3312) = 0u;
  *(_OWORD *)(a1 + 3296) = 0u;
  *(_OWORD *)(a1 + 3280) = 0u;
  *(_OWORD *)(a1 + 3264) = 0u;
  *(_OWORD *)(a1 + 3248) = 0u;
  *(_OWORD *)(a1 + 3232) = 0u;
  *(_OWORD *)(a1 + 3216) = 0u;
  *(_OWORD *)(a1 + 3200) = 0u;
  *(_OWORD *)(a1 + 3184) = 0u;
  *(_OWORD *)(a1 + 3168) = 0u;
  *(_OWORD *)(a1 + 3152) = 0u;
  *(_OWORD *)(a1 + 3136) = 0u;
  *(void *)(a1 + 3568) = 0;
  *(_OWORD *)(a1 + 2760) = 0u;
  *(_OWORD *)(a1 + 2776) = 0u;
  *(_OWORD *)(a1 + 2792) = 0u;
  *(_OWORD *)(a1 + 2808) = 0u;
  *(_OWORD *)(a1 + 2824) = 0u;
  *(_OWORD *)(a1 + 2840) = 0u;
  *(_OWORD *)(a1 + 2856) = 0u;
  *(_OWORD *)(a1 + 2872) = 0u;
  *(_OWORD *)(a1 + 2888) = 0u;
  *(_OWORD *)(a1 + 2904) = 0u;
  *(_OWORD *)(a1 + 2920) = 0u;
  *(_OWORD *)(a1 + 2936) = 0u;
  *(_OWORD *)(a1 + 2952) = 0u;
  *(_OWORD *)(a1 + 2968) = 0u;
  *(_OWORD *)(a1 + 2984) = 0u;
  *(_OWORD *)(a1 + 3000) = 0u;
  *(_OWORD *)(a1 + 3016) = 0u;
  *(_OWORD *)(a1 + 3032) = 0u;
  *(_OWORD *)(a1 + 3048) = 0u;
  *(_OWORD *)(a1 + 3064) = 0u;
  *(_OWORD *)(a1 + 3080) = 0u;
  *(_OWORD *)(a1 + 3096) = 0u;
  *(_OWORD *)(a1 + 3112) = 0u;
  *(_DWORD *)(a1 + 3128) = 0;
  sub_24FF55EB4(a1 + 4632);
  return a1;
}

void sub_24FF7BEB0(_Unwind_Exception *a1)
{
  sub_24FF7BEE0(v3);
  sub_24FF60EC8((uint64_t)(v1 + 375));
  sub_24FF7BFC4(v2);
  sub_24FF7C11C(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_24FF7BEE0(uint64_t a1)
{
  sub_24FF6A9A8(a1 + 336);
  sub_24FF6A9A8(a1 + 264);
  uint64_t v2 = *(void **)(a1 + 240);
  if (v2)
  {
    *(void *)(a1 + 248) = v2;
    operator delete(v2);
  }
  uint64_t v3 = *(void **)(a1 + 216);
  if (v3)
  {
    *(void *)(a1 + 224) = v3;
    operator delete(v3);
  }
  uint64_t v4 = *(void **)(a1 + 192);
  if (v4)
  {
    *(void *)(a1 + 200) = v4;
    operator delete(v4);
  }
  uint64_t v5 = *(void **)(a1 + 168);
  if (v5)
  {
    *(void *)(a1 + 176) = v5;
    operator delete(v5);
  }
  uint64_t v6 = *(void **)(a1 + 144);
  if (v6)
  {
    *(void *)(a1 + 152) = v6;
    operator delete(v6);
  }
  uint64_t v7 = *(void **)(a1 + 120);
  if (v7)
  {
    *(void *)(a1 + 128) = v7;
    operator delete(v7);
  }
  uint64_t v8 = *(void **)(a1 + 96);
  if (v8)
  {
    *(void *)(a1 + 104) = v8;
    operator delete(v8);
  }
  int v9 = *(void **)(a1 + 72);
  if (v9)
  {
    *(void *)(a1 + 80) = v9;
    operator delete(v9);
  }
  int v10 = *(void **)(a1 + 48);
  if (v10)
  {
    *(void *)(a1 + 56) = v10;
    operator delete(v10);
  }
  uint64_t v11 = *(void **)(a1 + 24);
  if (v11)
  {
    *(void *)(a1 + 32) = v11;
    operator delete(v11);
  }
  int v12 = *(void **)a1;
  if (*(void *)a1)
  {
    *(void *)(a1 + 8) = v12;
    operator delete(v12);
  }
  return a1;
}

void *sub_24FF7BFC4(void *a1)
{
  for (uint64_t i = 338; i != 308; i -= 15)
  {
    uint64_t v3 = &a1[i];
    uint64_t v4 = (void *)a1[i - 1];
    if (v4)
    {
      a1[i] = v4;
      operator delete(v4);
    }
    uint64_t v5 = (void *)*(v3 - 4);
    if (v5)
    {
      a1[i - 3] = v5;
      operator delete(v5);
    }
    uint64_t v6 = &a1[i];
    uint64_t v7 = (void *)a1[i - 7];
    if (v7)
    {
      *(v6 - 6) = v7;
      operator delete(v7);
    }
    uint64_t v8 = (void *)*(v6 - 10);
    if (v8)
    {
      a1[i - 9] = v8;
      operator delete(v8);
    }
    int v9 = (void *)*(v3 - 13);
    if (v9)
    {
      a1[i - 12] = v9;
      operator delete(v9);
    }
  }
  uint64_t v10 = 192;
  do
  {
    uint64_t v11 = (void *)a1[v10 + 35];
    if (v11)
    {
      a1[v10 + 36] = v11;
      operator delete(v11);
    }
    v10 -= 3;
  }
  while (v10 * 8);
  int v12 = (void *)a1[34];
  if (v12)
  {
    a1[35] = v12;
    operator delete(v12);
  }
  uint64_t v13 = (void *)a1[31];
  if (v13)
  {
    a1[32] = v13;
    operator delete(v13);
  }
  uint64_t v14 = (void *)a1[28];
  if (v14)
  {
    a1[29] = v14;
    operator delete(v14);
  }
  BOOL v15 = (void *)a1[25];
  if (v15)
  {
    a1[26] = v15;
    operator delete(v15);
  }
  int v16 = (void *)a1[22];
  if (v16)
  {
    a1[23] = v16;
    operator delete(v16);
  }
  uint64_t v17 = (void *)a1[19];
  if (v17)
  {
    a1[20] = v17;
    operator delete(v17);
  }
  unint64_t v18 = (void *)a1[16];
  if (v18)
  {
    a1[17] = v18;
    operator delete(v18);
  }
  uint64_t v19 = (void *)a1[13];
  if (v19)
  {
    a1[14] = v19;
    operator delete(v19);
  }
  char v20 = (void *)a1[10];
  if (v20)
  {
    a1[11] = v20;
    operator delete(v20);
  }
  sub_24FF6A9A8((uint64_t)(a1 + 1));
  return a1;
}

void *sub_24FF7C11C(void *a1)
{
  uint64_t v2 = (void *)a1[32];
  if (v2)
  {
    a1[33] = v2;
    operator delete(v2);
  }
  uint64_t v3 = (void *)a1[29];
  if (v3)
  {
    a1[30] = v3;
    operator delete(v3);
  }
  uint64_t v4 = (void *)a1[26];
  if (v4)
  {
    a1[27] = v4;
    operator delete(v4);
  }
  uint64_t v5 = (void *)a1[23];
  if (v5)
  {
    a1[24] = v5;
    operator delete(v5);
  }
  uint64_t v6 = (void *)a1[20];
  if (v6)
  {
    a1[21] = v6;
    operator delete(v6);
  }
  uint64_t v7 = (void *)a1[17];
  if (v7)
  {
    a1[18] = v7;
    operator delete(v7);
  }
  uint64_t v8 = (void *)a1[14];
  if (v8)
  {
    a1[15] = v8;
    operator delete(v8);
  }
  int v9 = (void *)a1[11];
  if (v9)
  {
    a1[12] = v9;
    operator delete(v9);
  }
  uint64_t v10 = (void *)a1[8];
  if (v10)
  {
    a1[9] = v10;
    operator delete(v10);
  }
  uint64_t v11 = (void *)a1[5];
  if (v11)
  {
    a1[6] = v11;
    operator delete(v11);
  }
  return a1;
}

void *sub_24FF7C1E0(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263F8C2B8];
  uint64_t v3 = *MEMORY[0x263F8C2B8];
  *(void *)(a1 + 4632) = *MEMORY[0x263F8C2B8];
  uint64_t v4 = *(void *)(v2 + 72);
  *(void *)(a1 + 4632 + *(void *)(v3 - 24)) = *(void *)(v2 + 64);
  *(void *)(a1 + 4648) = v4;
  *(void *)(a1 + 4656) = MEMORY[0x263F8C318] + 16;
  if (*(char *)(a1 + 4743) < 0) {
    operator delete(*(void **)(a1 + 4720));
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x25337C9F0](a1 + 4760);
  sub_24FF7BEE0(a1 + 3136);
  uint64_t v5 = *(void **)(a1 + 3096);
  if (v5)
  {
    *(void *)(a1 + 3104) = v5;
    operator delete(v5);
  }
  uint64_t v6 = *(void **)(a1 + 3072);
  if (v6)
  {
    *(void *)(a1 + 3080) = v6;
    operator delete(v6);
  }
  uint64_t v7 = *(void **)(a1 + 3048);
  if (v7)
  {
    *(void *)(a1 + 3056) = v7;
    operator delete(v7);
  }
  uint64_t v8 = *(void **)(a1 + 3024);
  if (v8)
  {
    *(void *)(a1 + 3032) = v8;
    operator delete(v8);
  }
  int v9 = *(void **)(a1 + 3000);
  if (v9)
  {
    *(void *)(a1 + 3008) = v9;
    operator delete(v9);
  }
  sub_24FF7BFC4((void *)(a1 + 280));
  return sub_24FF7C11C((void *)a1);
}

char *sub_24FF7C3A0(char *result, char *__src, uint64_t a3, unint64_t a4)
{
  uint64_t v7 = result;
  uint64_t v8 = *((void *)result + 2);
  int v9 = *(char **)result;
  if (a4 > (v8 - *(void *)result) >> 2)
  {
    if (v9)
    {
      *((void *)result + 1) = v9;
      operator delete(v9);
      uint64_t v8 = 0;
      *uint64_t v7 = 0;
      v7[1] = 0;
      void v7[2] = 0;
    }
    if (a4 >> 62) {
      sub_24FF5A660();
    }
    uint64_t v10 = v8 >> 1;
    if (v8 >> 1 <= a4) {
      uint64_t v10 = a4;
    }
    if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v11 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v11 = v10;
    }
    uint64_t result = sub_24FF6A4D8(v7, v11);
    uint64_t v13 = (char *)v7[1];
    int v12 = (void **)(v7 + 1);
    int v9 = v13;
LABEL_16:
    size_t v17 = a3 - (void)__src;
    if (v17)
    {
      unint64_t v18 = v9;
      uint64_t v19 = __src;
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  int v12 = (void **)(result + 8);
  uint64_t v14 = (unsigned char *)*((void *)result + 1);
  unint64_t v15 = (v14 - v9) >> 2;
  if (v15 >= a4) {
    goto LABEL_16;
  }
  int v16 = &__src[4 * v15];
  if (v14 != v9)
  {
    uint64_t result = (char *)memmove(*(void **)result, __src, v14 - v9);
    int v9 = (char *)*v12;
  }
  size_t v17 = a3 - (void)v16;
  if (v17)
  {
    unint64_t v18 = v9;
    uint64_t v19 = v16;
LABEL_18:
    uint64_t result = (char *)memmove(v18, v19, v17);
  }
LABEL_19:
  *int v12 = &v9[v17];
  return result;
}

char *sub_24FF7C4AC(uint64_t a1, _DWORD *a2, _DWORD *a3, unint64_t a4)
{
  uint64_t v6 = a2;
  uint64_t v9 = a1 + 16;
  uint64_t v8 = *(void *)(a1 + 16);
  uint64_t result = *(char **)a1;
  if (0xAAAAAAAAAAAAAAABLL * ((v8 - (uint64_t)result) >> 2) >= a4)
  {
    char v20 = *(char **)(a1 + 8);
    unint64_t v18 = (void **)(a1 + 8);
    uint64_t v19 = v20;
    unint64_t v21 = 0xAAAAAAAAAAAAAAABLL * ((v20 - result) >> 2);
    if (v21 >= a4)
    {
      uint64_t v27 = result;
      if (a2 != a3)
      {
        int v28 = result;
        do
        {
          uint64_t v29 = *(void *)v6;
          *((_DWORD *)v28 + 2) = v6[2];
          *(void *)int v28 = v29;
          v28 += 12;
          v6 += 3;
          v27 += 12;
        }
        while (v6 != a3);
      }
      int64_t v17 = v27 - result;
    }
    else
    {
      char v22 = &a2[3 * v21];
      if (v19 != result)
      {
        uint64_t v23 = 12 * v21;
        do
        {
          uint64_t v24 = *(void *)v6;
          *((_DWORD *)result + 2) = v6[2];
          *(void *)uint64_t result = v24;
          result += 12;
          v6 += 3;
          v23 -= 12;
        }
        while (v23);
        uint64_t result = (char *)*v18;
      }
      unsigned int v25 = result;
      if (v22 != a3)
      {
        unsigned int v25 = result;
        int v26 = result;
        do
        {
          *(_DWORD *)int v26 = *v22;
          *((_DWORD *)v26 + 1) = v22[1];
          *((_DWORD *)v26 + 2) = v22[2];
          v25 += 12;
          v22 += 3;
          v26 += 12;
        }
        while (v22 != a3);
      }
      int64_t v17 = v25 - result;
    }
  }
  else
  {
    if (result)
    {
      *(void *)(a1 + 8) = result;
      operator delete(result);
      uint64_t v8 = 0;
      *(void *)a1 = 0;
      *(void *)(a1 + 8) = 0;
      *(void *)(a1 + 16) = 0;
    }
    if (a4 > 0x1555555555555555) {
      goto LABEL_29;
    }
    unint64_t v11 = 0xAAAAAAAAAAAAAAABLL * (v8 >> 2);
    uint64_t v12 = 2 * v11;
    if (2 * v11 <= a4) {
      uint64_t v12 = a4;
    }
    unint64_t v13 = v11 >= 0xAAAAAAAAAAAAAAALL ? 0x1555555555555555 : v12;
    if (v13 > 0x1555555555555555) {
LABEL_29:
    }
      sub_24FF5A660();
    uint64_t result = (char *)sub_24FF68FF0(v9, v13);
    *(void *)a1 = result;
    *(void *)(a1 + 16) = &result[12 * v14];
    unint64_t v15 = result;
    if (v6 != a3)
    {
      unint64_t v15 = result;
      int v16 = result;
      do
      {
        *(_DWORD *)int v16 = *v6;
        *((_DWORD *)v16 + 1) = v6[1];
        *((_DWORD *)v16 + 2) = v6[2];
        v15 += 12;
        v6 += 3;
        v16 += 12;
      }
      while (v6 != a3);
    }
    int64_t v17 = v15 - result;
    unint64_t v18 = (void **)(a1 + 8);
  }
  *unint64_t v18 = &result[v17];
  return result;
}

uint64_t sub_24FF7C6B0(int *a1, int a2, int a3, unsigned __int16 **a4)
{
  if (a3)
  {
    if (a3 != 4)
    {
      if (a3 == 2 && a2 >= 1)
      {
        LODWORD(v4) = 0;
        uint64_t v5 = a4[3];
        uint64_t v6 = a4[12];
        uint64_t v7 = a2;
        while (1)
        {
          int v9 = *a1++;
          int v8 = v9;
          if (v9 < 1)
          {
            if ((v8 & 0x80000000) == 0) {
              goto LABEL_10;
            }
            unint64_t v10 = *v5 + 2048;
          }
          else
          {
            unint64_t v10 = 67584 - *v5;
          }
          LODWORD(v4) = *(_DWORD *)((char *)&unk_24FF7D720 + ((v10 >> 10) & 0x3FFFFFFFFFFFFCLL)) + v4;
LABEL_10:
          int v12 = *(_DWORD *)v6;
          v6 += 2;
          int v11 = v12;
          if (v8 < 0) {
            int v8 = -v8;
          }
          uint64_t v4 = v4 + 66560 + (v11 << 10) - (__clz((v8 >> v11) + 1) << 11);
          ++v5;
          if (!--v7) {
            return v4;
          }
        }
      }
      return 0;
    }
    if (a2 >= 1)
    {
      uint64_t v40 = 0;
      LODWORD(v4) = 0;
      int v41 = *a4;
      uint64_t v42 = a4[3];
      unsigned int v43 = a4[6];
      int v44 = a4[12];
      do
      {
        int v46 = *a1++;
        int v45 = v46;
        unsigned int v48 = *v41++;
        uint64_t v47 = v48;
        if (v45)
        {
          int v49 = *(_DWORD *)((char *)&unk_24FF7D720 + (((unint64_t)(67584 - v47) >> 10) & 0x3FFFFFFFFFFFFCLL))
              + v4;
          if (v45 >= 0) {
            unsigned int v50 = v45;
          }
          else {
            unsigned int v50 = -v45;
          }
          if (v45 >= 0) {
            int v51 = 0x10000 - *v42;
          }
          else {
            int v51 = *v42;
          }
          int v52 = v49 + *(_DWORD *)((char *)&unk_24FF7D720 + (((v51 + 2048) >> 10) & 0xFCLL));
          signed int v53 = &v43[(int)v40];
          if (v50 > 0x3F)
          {
            int v66 = *(_DWORD *)v44;
            uint64_t v4 = v52
               + 66560
               + *(_DWORD *)((char *)&unk_24FF7D720 + (((67584 - (unint64_t)*v53) >> 10) & 0x3FFFFFFFFFFFFCLL))
               + *(_DWORD *)((char *)&unk_24FF7D720 + (((67584 - (unint64_t)v53[2]) >> 10) & 0x3FFFFFFFFFFFFCLL))
               + *(_DWORD *)((char *)&unk_24FF7D720 + (((67584 - (unint64_t)v53[6]) >> 10) & 0x3FFFFFFFFFFFFCLL))
               + *(_DWORD *)((char *)&unk_24FF7D720 + (((67584 - (unint64_t)v53[14]) >> 10) & 0x3FFFFFFFFFFFFCLL))
               + *(_DWORD *)((char *)&unk_24FF7D720 + (((67584 - (unint64_t)v53[30]) >> 10) & 0x3FFFFFFFFFFFFCLL))
               + *(_DWORD *)((char *)&unk_24FF7D720 + (((67584 - (unint64_t)v53[62]) >> 10) & 0x3FFFFFFFFFFFFCLL))
               + (v66 << 10)
               - (__clz(((v50 - 64) >> v66) + 1) << 11);
          }
          else
          {
            unsigned int v54 = v50 - 1;
            int v55 = *v53;
            if ((v54 & 0x20) != 0) {
              int v55 = 0x10000 - v55;
            }
            int v56 = *(_DWORD *)((char *)&unk_24FF7D720 + (((v55 + 2048) >> 10) & 0xFCLL));
            int v57 = v53[(v54 >> 5) + 1];
            if ((v54 & 0x10) != 0) {
              int v57 = 0x10000 - v57;
            }
            int v58 = *(_DWORD *)((char *)&unk_24FF7D720 + (((v57 + 2048) >> 10) & 0xFCLL));
            int v59 = v53[(v54 >> 4) + 3];
            if ((v54 & 8) != 0) {
              int v59 = 0x10000 - v59;
            }
            int v60 = *(_DWORD *)((char *)&unk_24FF7D720 + (((v59 + 2048) >> 10) & 0xFCLL));
            int v61 = v53[(v54 >> 3) + 7];
            if ((v54 & 4) != 0) {
              int v61 = 0x10000 - v61;
            }
            int v62 = *(_DWORD *)((char *)&unk_24FF7D720 + (((v61 + 2048) >> 10) & 0xFCLL));
            int v63 = v53[(v54 >> 2) + 15];
            if ((v54 & 2) != 0) {
              int v63 = 0x10000 - v63;
            }
            int v64 = *(_DWORD *)((char *)&unk_24FF7D720 + (((v63 + 2048) >> 10) & 0xFCLL));
            int v65 = v53[(v54 >> 1) + 31];
            if (v54) {
              int v65 = 0x10000 - v65;
            }
            uint64_t v4 = (v56
                              + v52
                              + v58
                              + v60
                              + v62
                              + v64
                              + *(_DWORD *)((char *)&unk_24FF7D720 + (((v65 + 2048) >> 10) & 0xFCLL)));
          }
        }
        else
        {
          uint64_t v4 = (*(_DWORD *)((char *)&unk_24FF7D720 + (((v47 + 2048) >> 10) & 0x7CLL)) + v4);
        }
        v40 += 64;
        v44 += 2;
        ++v42;
      }
      while ((unint64_t)a2 << 6 != v40);
      return v4;
    }
    return 0;
  }
  if (a2 < 1) {
    return 0;
  }
  uint64_t v13 = 0;
  LODWORD(v4) = 0;
  uint64_t v14 = *a4;
  unint64_t v15 = a4[3];
  int v16 = a4[6];
  int64_t v17 = a4[12];
  do
  {
    int v19 = *a1++;
    int v18 = v19;
    unsigned int v21 = *v14++;
    uint64_t v20 = v21;
    if (v18)
    {
      int v22 = *(_DWORD *)((char *)&unk_24FF7D720 + (((unint64_t)(67584 - v20) >> 10) & 0x3FFFFFFFFFFFFCLL)) + v4;
      if (v18 >= 0) {
        unsigned int v23 = v18;
      }
      else {
        unsigned int v23 = -v18;
      }
      if (v18 >= 0) {
        int v24 = 0x10000 - *v15;
      }
      else {
        int v24 = *v15;
      }
      int v25 = v22 + *(_DWORD *)((char *)&unk_24FF7D720 + (((v24 + 2048) >> 10) & 0xFCLL));
      int v26 = &v16[(int)v13];
      if (v23 > 0x3F)
      {
        int v39 = *(_DWORD *)v17;
        uint64_t v4 = v25
           + 66560
           + *(_DWORD *)((char *)&unk_24FF7D720 + (((67584 - (unint64_t)*v26) >> 10) & 0x3FFFFFFFFFFFFCLL))
           + *(_DWORD *)((char *)&unk_24FF7D720 + (((67584 - (unint64_t)v26[2]) >> 10) & 0x3FFFFFFFFFFFFCLL))
           + *(_DWORD *)((char *)&unk_24FF7D720 + (((67584 - (unint64_t)v26[6]) >> 10) & 0x3FFFFFFFFFFFFCLL))
           + *(_DWORD *)((char *)&unk_24FF7D720 + (((67584 - (unint64_t)v26[14]) >> 10) & 0x3FFFFFFFFFFFFCLL))
           + *(_DWORD *)((char *)&unk_24FF7D720 + (((67584 - (unint64_t)v26[30]) >> 10) & 0x3FFFFFFFFFFFFCLL))
           + *(_DWORD *)((char *)&unk_24FF7D720 + (((67584 - (unint64_t)v26[62]) >> 10) & 0x3FFFFFFFFFFFFCLL))
           + (v39 << 10)
           - (__clz(((v23 - 64) >> v39) + 1) << 11);
      }
      else
      {
        char v27 = v23 - 1;
        int v28 = *v26;
        if (v27) {
          int v28 = 0x10000 - v28;
        }
        int v29 = *(_DWORD *)((char *)&unk_24FF7D720 + (((v28 + 2048) >> 10) & 0xFCLL));
        int v30 = v26[(v27 & 1) + 1];
        if ((v27 & 2) != 0) {
          int v30 = 0x10000 - v30;
        }
        int v31 = *(_DWORD *)((char *)&unk_24FF7D720 + (((v30 + 2048) >> 10) & 0xFCLL));
        int v32 = v26[(v27 & 3) + 3];
        if ((v27 & 4) != 0) {
          int v32 = 0x10000 - v32;
        }
        int v33 = *(_DWORD *)((char *)&unk_24FF7D720 + (((v32 + 2048) >> 10) & 0xFCLL));
        int v34 = v26[(v27 & 7) + 7];
        if ((v27 & 8) != 0) {
          int v34 = 0x10000 - v34;
        }
        int v35 = *(_DWORD *)((char *)&unk_24FF7D720 + (((v34 + 2048) >> 10) & 0xFCLL));
        int v36 = v26[(v27 & 0xF) + 15];
        if ((v27 & 0x10) != 0) {
          int v36 = 0x10000 - v36;
        }
        int v37 = *(_DWORD *)((char *)&unk_24FF7D720 + (((v36 + 2048) >> 10) & 0xFCLL));
        int v38 = v26[(v27 & 0x1F) + 31];
        if ((v27 & 0x20) != 0) {
          int v38 = 0x10000 - v38;
        }
        uint64_t v4 = (v29
                          + v25
                          + v31
                          + v33
                          + v35
                          + v37
                          + *(_DWORD *)((char *)&unk_24FF7D720 + (((v38 + 2048) >> 10) & 0xFCLL)));
      }
    }
    else
    {
      uint64_t v4 = (*(_DWORD *)((char *)&unk_24FF7D720 + (((v20 + 2048) >> 10) & 0x7CLL)) + v4);
    }
    v13 += 64;
    v17 += 2;
    ++v15;
  }
  while ((unint64_t)a2 << 6 != v13);
  return v4;
}

uint64_t sub_24FF7CC68(uint64_t a1, unsigned int a2, int a3, _WORD *a4)
{
  int v5 = a3;
  unsigned int v6 = a2;
  for (int i = 1 << a3; v6 >= 1 << v5; int i = 1 << v5)
  {
    sub_24FF6DACC(a1, 1, a4);
    ++v5;
    v6 -= i;
  }
  uint64_t result = sub_24FF6DACC(a1, 0, a4);
  if (v5)
  {
    int v10 = v5 - 1;
    do
    {
      __int16 v11 = 0x8000;
      uint64_t result = sub_24FF6DACC(a1, (v6 >> v10--) & 1, &v11);
    }
    while (v10 != -1);
  }
  return result;
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

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
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

{
  return MEMORY[0x270F987B0]();
}

{
  return MEMORY[0x270F987C0]();
}

{
  return MEMORY[0x270F987D8]();
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

void std::exception::~exception(std::exception *this)
{
}

void std::terminate(void)
{
}

void operator delete[](void *__p)
{
  while (1)
    ;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new[](size_t __sz)
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

void bzero(void *a1, size_t a2)
{
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